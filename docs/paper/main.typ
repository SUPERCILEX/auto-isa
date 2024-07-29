#import "ieee.typ": *

#show: ieee.with(
  conference: "micro",
  title: [AutoISA: Automatically Designing Instruction Set Extensions],
  abstract: [
    Modern rack-scale computer systems consist of thousands of processing devices.
    Typically heterogeneous, with unique ISAs for CPUs, GPUs, ML accelerators and possibly more esoteric devices such as PIM and in-network compute.
    Classically, architects design the Instruction Set Architecture (ISA) for each of these devices in a forward directed manner: envision an ISA and build it, port software to it, then revise and expand that ISA over time.
    This paper describes our work in designing ISAs automatically and in the reverse direction: starting from the applications we wish to run on our computer system, we envision a blank base ISA for each processing device, compile applications to fundamental operations (add, mul, or, etc.), and then automatically identify a useful ISA extension.

    Applied to the task of in-(or near-)memory acceleration, we find two surprising results: (1) only around a dozen complex instructions are necessary to accelerate 90-100% of an application's optimizable memory operations (which for most of our applications is 70-90% of their memory traffic); and (2) there is substantial commonality in instructions generated across different applications.
    Approximately half of the top-5 code patterns are shared across all applications.
    Both of these results are encouraging as it means we can build simple, small processing devices for large distributed systems and focus our attention on designing for this much smaller and targeted ISA.

    // We developed an LLVM analysis pass that finds code patterns useful for memory acceleration, extracts the patterns to RISC-V, and instruments the code to determine the optimization potential of the identified pattern.
  ],
  authors: (
    // (
    //   name: "Alex Saveau, Max Ruttenberg and Mark Oskin",
    //   department: "Paul Allen School of Computer Science and Engineering",
    //   organization: "University of Washington",
    //   email: "{asaveau,mrutt,oskin}@cs.washington.edu"
    // ),
  ),
  bibliography: bibliography("refs.bib"),
)

#import "@preview/algo:0.3.3": algo, i, d, comment, code

#let todo(content) = [#text(fill: red)[TODO]\(#emph(content))]
#set figure(placement: auto)
#show emoji.checkmark.box: set text(font: "Twitter Color Emoji")
#show emoji.checkmark.heavy: set text(font: "Twitter Color Emoji")
#show emoji.crossmark: set text(font: "Twitter Color Emoji")

= Introduction

In computer architecture, hardware and software engineers come together to design ISAs that are both expressive enough for compilers to emit clean assembly and specialized enough for hardware to adequately accelerate.
Modern ISAs, like RISC-V, are built on thousands of individual efforts and over 70 years of hard-earned engineering experience.
They feature a core set of instructions that are simple yet expressive while providing specialized instructions, like vector operations, as extensions to this core.
While industry has converged on a core instruction set architecture philosophy for a single CPU, innovation outside of that core, driven by machine learning, GPU, processor-in-memory, disaggregated compute, etc, is occurring at a rapid pace.
It would be unfortunate if it took a similar amount of time and effort to converge on an ISA for these hardware devices.

This paper presents our work exploring the question -- can we develop efficient ISAs automatically?
One approach to ISA design which is very natural for humans to use is _design-and-test_.
That is, craft the ISA and either target a compiler to it or see if developers can utilize it effectively.
Computers could do this too @chen2021ai, and recent work from architects applying machine learning to craft hardware designs demonstrates the potential of this approach (for example to optimize GPU architecture @jia2012stargazer or NoC design @yin2020experiences).
Our work reverses the natural human approach and uses a compiler to _test-and-design_.
That is, we present a method for automatically finding common code patterns from the applications we wish to test for efficacy rather than guess beforehand what the applications will need to run efficiently.

This paper focuses on ISA design for accelerating in-(or near-)memory compute in parallel computing clusters where it is common for cores to access memory on remote machines multiple network hops away.
We narrow the work to this focus because: (1) while architects have studied this area, it is not as trod over as core CPU design; (2) ISA designs for this area are not obvious as there are many factors at work -- locality, communication, concurrency, etc.; and (3) it is an area authors have years of experience in, and we have a vested interest in quality solutions for it.

== Paper Overview

The remainder of the paper focuses primarily on accelerating memory operations in shared memory systems.
We,
- provide the context for memory acceleration,
- detail the process through which candidate instructions for an ISA are found with a step-by-step break down of our compiler plugin,
- analyze the results on a shared memory benchmark suite,
- and conclude with our thoughts on pushing our approach to ISA design beyond memory acceleration.

= Background

While our method for creating ISAs from application code is general, this paper presents work that is focused on designing ISAs for a Partitioned Global Address Space (PGAS) supercomputer.  We focus on graph algorithms which have relatively low spatial and temporal locality; a large fraction of cores in this cluster can be left idle waiting for memory operations to complete.
Counter intuitively, however, even graph algorithms have substantial amounts of locality when they are actually implemented in real programming languages.
The threaded runtime necessary to support the entire application means a large fraction of instructions are runtime and thread local (eg. call stack).
To summarize, most memory operations and compute instructions will be local to a compute node; however, most stalls and actual CPU time spent in a large system, are due to non-local memory access stalls that are intrinsic to algorithmic behavior and cannot be avoided.

We use a simplified performance model to guide our compiler work.  Executing one RISC-V instruction costs latency $1$; accessing node-local memory costs latency $100$; and accessing remote memory costs latency $1000$.
The reader can safely assume nanosecond as the base unit (e.g. a CPU clock speed of 1GHz).

When the cost (latency and/or energy) of data movement vastly exceeds the cost of compute, optimizing ISAs for data movement is beneficial.
For example, consider something as straightforward as `++a[i]`, where `a[i]` is off-node.
Moving data to compute requires a fetch, an increment and a write-back, for $~2202$ cycles, given the simplified latency model presented in the previous section.
Moving compute to data lowers this cost to between $~202$ to $~1202$ depending on the parallelization, synchronization and consistency model.
In addition to latency improvements, the reduced inter-node communication offers energy and bandwidth savings that may be more important for overall system performance when data center power is the limiting factor.

Consider three more complex examples:
+ two arrays $a, b$ with a transformation $b_i = f(a_i)$ where $f$ is an element-wise mapping (such as the identity for copies).
  Fetch and write-back overhead are especially pronounced for simple $f$, more so when $a$ and $b$ are not stored on the compute node.
  Suppose $f$ takes $50$ cycles: each loop iteration must fetch $a_i$, run $f$, and write-back to $b_i$, for a total of $2050$ cycles (ignoring the amortized cost of loading the $a$ and $b$ pointers).
  Should the two arrays be local, the latency per iteration would be reduced to $250$ cycles.
+ a 2D vector, e.g. `struct vec { capacity, len, data: *struct vec }`.
  Each element in the top-level array contains pointers to the sub-arrays, leading to indirect accesses whose intermediary data is not necessarily needed.
  For example, there is no need to move `vec.data[42]` off-node to read `vec.data[42].data[88]`.
+ data structures with built-in pointer chasing such as linked lists, trees, and graphs.
  For example, a `get_neighbor_metadata`-like operation (such as computing the out degree) on a graph node could again result in unnecessary intermediary loads because the compute node is only interested in the final result.

#figure(image("round-trip-requests.drawio.svg"), placement: top, caption: [
  When both memory operations access data residing on the same node, two packets are wasted.
  After optimizations, the intermediary response and request are eliminated, providing the most optimization potential (50% reduction).
]) <round-trip-requests>

#figure(image("triangle-requests.drawio.svg"), placement: top, caption: [
  When each memory operation accesses different nodes, we can still avoid routing data through the core, and instead send the second request directly to the node with the target memory (25% reduction).
]) <triangle-requests>

In (1) above, the memory dependencies follow the pattern $"load" -> dots.c -> "store"$ while for (2) and (3) they are $"load" -> dots.c -> "load"$.
Examining the load dependent loads, we find that a core must send and receive four packets: two to make the initial request and get a response, then another two to make the second request and receive the final response.
//Load dependent stores are similar except that in some consistency models, they need not wait for confirmation that the store was committed (hence could use a minimum of 3 packets).
Near-memory compute with the capability to execute these application patterns can reduce by 50% or 25% the number of remote memory operations (@round-trip-requests and @triangle-requests).

Importantly, all idioms can take advantage of the savings in @round-trip-requests and @triangle-requests so long as their data is not on a core-local stack.
The node's memory controller will bundle any available arguments with the idiom before routing it to the next node to do the same, repeating this process until all arguments are available at which time the idiom can be executed on the last node in the chain.
As the idiom gets filled, argument memory addresses are replaced with their data (using a filled argument bit).
Bouncing the idiom from node to node is efficient so long as the bandwidth costs of doing so are cheaper than the extra packets data requests would generate; if the system is bandwidth constrained, a node can choose to execute the idiom normally by requesting data from remote nodes, while another option could be to implement dynamic sub-idiom extraction and execute small chunks of the idiom in parallel.

== Why automation?

The best way to get the day-to-day programmer to take full advantage of hardware capabilities is to develop frameworks and automation that exploit the hardware for them.
Consider the success of machine learning frameworks' ability to bring GPU programming to the masses (e.g. PyTorch).
Many programmers have never vectorized code, let alone written a compute shader---abstracting away these hardware optimizations has made machine learning accessible to the masses.
Rather than require the programmer to think of their memory-to-compute locality and drop down into assembly or compiler intrinsics to use potentially obtuse remote compute operations, we argue the most effective approach is to automate their discovery, implementation, and use.
Our goal is therefore to find any pattern of dependent memory operations and compute and emit a compiled program in such a way that it can automatically utilize remote compute and memory access capabilities.
Since we find that these patterns are broadly shared across applications, we wish to define an ISA for them.

= ISA Extraction

We develop an LLVM compiler plugin which identifies, extracts, and transforms LLVM IR to find sequences of instructions that can be executed remotely, extract them into RISC-V assembly, and modify the program to track dynamic execution of the potentially extracted instructions (@plugin-arch).
We call these sequences of instructions _idioms_.
This paper stops at emitting RISC-V assembly for an idiom; however, it is straightforward to retarget the LLVM IR to Verilog for creating custom hardware accelerators.
As will be clear shortly, idioms are intentionally simple enough that a collection of idioms constitute the building blocks for a full custom ISA for remote compute.

#figure(image("plugin-architecture.gv.svg", width: 75%), caption: [
  A high-level architecture of our compiler plugin.
]) <plugin-arch>

/*
#figure(caption: [The steps our plugin runs in pseudo-bash.], rect(width: 100%)[
  #set par(justify: false)
  ```bash
  $ clang-17 -S -emit-llvm program.c -o program.ll
  $ opt-17 --load-pass-plugin=libauto_isa.so --passes=auto-isa -S program.ll -o program-instr.ll
  $ clang++-17 -O1 -S --target=riscv64 program-idioms.ll -o program-idioms.asm
  $ clang++-17 -O1 -fprofile-generate program-instr.ll -o program
  $ LLVM_PROFILE_FILE="program.profraw" ./program
  $ llvm-profdata-17 show --all-functions --counts --text program.profraw
  $ analyze
  ```
])
*/

We describe the compiler pass using a test program (@sample-prog) as a working example.
We will examine each step using this example and then note the edge cases that need to be handled to fully generalize our analysis.
This example consists of several loads to determine the neighborhood of `u` and a dependent terminating load from `outgoing_contrib`.

Our plugin is written in Rust and uses LLVM 17 bindings provided by #link("https://github.com/jamesmth/llvm-plugin-rs")[`llvm-plugin`] and #link("https://github.com/TheDan64/inkwell")[`inkwell`].

#figure(caption: [
  A code snippet taken from the PageRank algorithm in the GAP benchmark suite. @gapbs
  #link("https://github.com/sbeamer/gapbs/blob/33f73f46e78807ab4b04f6bca618ed7f02169d2f/src/pr.cc#L34-L49")[[Source code]]
], rect(width: 100%)[
  ```c
pvector<ScoreT> PageRankPullGS(
  const Graph &g, int max_iters, ...
) {
  pvector<ScoreT> outgoing_contrib(g.num_nodes());
  ...
  for (int iter=0; iter < max_iters; iter++) {
    for (NodeID u=0; u < g.num_nodes(); u++) {
      ScoreT incoming_total = 0;
      for (NodeID v : g.in_neigh(u))
        //                TERMINATING LOAD
        incoming_total += outgoing_contrib[v];
      ...
  ```
]) <sample-prog>

== Compile Program to LLVM IR

First, we compile the test program to LLVM IR using Clang.

As we are interested in memory operations, our analysis begins with load and store LLVM IR instructions and walks the program control-dataflow graph up to a set of "originating loads", which terminates the search and acts as the entry point to the idiom.
We perform analysis starting from loads in addition to stores because pointer indirection will result in load-dependent loads.

*Key fact:* This is central to our analysis so we will repeat it here: idioms always begin at a set of originating loads.

A simple example of such dependencies between loads and stores is shown in @simplest-idiom.
In our test program IR, the terminating load has two dependencies with some intermediary computation (shown as a dependency graph in @ir-idiom), corresponding to the load of `outgoing_contrib` in the original C++ program from @sample-prog.

#figure(
  image("load-add-store.svg", width: 40%),
  caption: [
    A simple idiom consisting of a memory store which depends on two independent loads whose data is combined via an add operation.
  ],
) <simplest-idiom>

#figure(grid(
  columns: (1fr, 2fr),
  stroke: 1pt,
  inset: 5pt,
  grid.cell(align: horizon, stroke: none, image("top-5/top-5.gv.6.svg")),
  [
  #set text(size: 0.85em)
  #set par(justify: false)
  ```llvm
  define @PageRankPullGS(...) {
  ...

  invoke.cont7.lr.ph:
    %7 = load ptr, ptr %outgoing_contrib
    ...

  for.body:
    %20 = load i32, ptr %__begin3.078
    %conv13 = sext i32 %20 to i64
    %arrayidx.i73 = getelementptr float,
      ptr %7, i64 %conv13
    %21 = load float, ptr %arrayidx.i73
    ...
  }
  ```
  ],
), caption: [
  A graphical and textual representation of the load-dependent load found in the LLVM IR of our test program in @sample-prog.
]) <ir-idiom>

== Idiom Identification

Next, LLVM invokes our plugin to begin analysis.
Identifying raw idioms is a relatively straightforward process briefly described in @identify-idioms-algo.
We begin by iterating over every function and then look at every instruction within each function.
Upon encountering a memory operation, we walk the instruction dependency graph (e.g. @ir-idiom) until we encounter an originating load.
Note that only dependencies beginning with a load and terminating with another memory operation are considered---all other dependencies are "local" and will be bundled along with the idiom when executed remotely.

#figure(kind: "algo", supplement: "Algorithm", caption: [Overview of idiom identification.])[
  #algo(
    title: "identify idioms",
    parameters: ("instructions",)
  )[
    $italic("idioms")$ = []\
    for $italic("instr")$ in $italic("instructions")$:#i\
    if is_store($italic("instr")$) or is_load($italic("instr")$):#i\

    $italic("edges")$ = walk_deps_until_load($italic("instr")$)\
    if not empty($italic("edges")$):#i\
    $italic("idioms")$ += Idiom($italic("edges")$)#d#d#d\

    return $italic("idioms")$
  ]
]
<identify-idioms-algo>

Idioms with branches are split along every possible combination of paths out of each branch.
This process is described later in @edge-cases.
In compiler terms, the lack of branching makes each idiom a basic block whose original branching can be restored by a phi choosing the idiom that executed.

After an idiom is found, its equivalence class is determined to place it in the correct group, where equivalence is defined by comparing a sorted edge list of instruction types (e.g. `(Store, Add)`).
This allows us to find multiple static occurrences of a particular idiom that is used in different places throughout a program.
//In other words, idiom identification structurally matches code patterns.

== Generate LLVM IR for Idioms

After idioms are identified, the LLVM IR for them is rewritten in two steps:
+ We compute the inputs and output of the idiom.
  Inputs are not just addresses to loads.
  For example, consider an ADD instruction within an idiom where one input comes from a load and the other from outside the idiom.
  This second operand of the ADD becomes an input to the idiom
+ We copy the instructions in the idiom dependency graph into a newly generated function.
  Idioms do not contain branches, so they are removed in this process.
  Note that a single source idiom can generate multiple resulting idioms as different branch paths are considered.

#figure(caption: [The generated idiom function for the idiom in @ir-idiom and its corresponding RISC-V assembly.], {
  set par(justify: false)
  set text(size: 0.95em)
  grid(
    columns: 2,
    stroke: 1pt,
    inset: 5pt,
    align: horizon,
    ```llvm
  define ptr idiom(ptr %a, ptr %b) {
  bb:
    %0 = load ptr, ptr %a
    %1 = load i32, ptr %b
    %2 = sext i32 %1 to i64
    %arrayidx = getelementptr ptr,
      ptr %0, i64 %2
    %3 = load ptr, ptr %arrayidx
    ret ptr %3
  }
    ```,
    ```asm
  	lw	a1, 0(a1)
  	ld	a0, 0(a0)
  	slli	a1, a1, 3
  	add	a0, a0, a1
  	ld	a0, 0(a0)
  	ret
    ```
  )
}) <ir-llvm>

The LLVM IR for our example idiom is shown in @ir-llvm.
Note that the result of the computation is returned even if the idiom terminates on a store.
This is because the test program may need to use the value being stored for local computation and/or software consistency control.
If the program does not need to know when the store completes, this reply from the remote can be elided.

== Compile Idioms to RISC-V

Now that each idiom is its own function with well-defined inputs and outputs, it is easy to recompile these functions using LLVM to target RISC-V assembly (@ir-llvm).
These idioms can now be executed remotely with a RISC-V core and/or some idioms may be chosen for specialized hardware implementations by instead compiling to Verilog.

== Feedback Directed Compilation

After identifying idioms, we would like to understand their relative value.
To this end, we need a few pieces of information: (1) How many times were the idioms executed? (2) How many times were the memory operations within the idiom executed? (3) How many memory operations were executed overall in the test program?
We use a feedback directed profiling step to gather this information.
//Dynamic execution counts enable us to calculate a notion of captured memory traffic.
//That is, how much of the program's memory traffic can be offloaded by executing an idiom remotely.

It is important to note that the execution count of an originating load need not be identical to that of the terminating memory operation.
For example, consider a store within a loop which depends on a load outside the loop.
The inner store will be executed many more times than the load it depends on.
Similarly, a store after a loop may depend on a load inside the loop in which case the load will be executed many more times than the store.

When considering the remote execution of these idioms, the former case is unfortunate (but legal) because it implies additional memory operations that were not present in the original program.
The latter case would result in incorrect accounting of captured memory traffic as the idiom won't execute as many times as its dependencies do.
Because we model the memory operations executed locally at a remote node as 1/10th the cost of a memory operation that is dispatched across the network, we use the idiom regardless and leave optimizing originating loads unnecessarily executing more times than in the original program to future work.
On the other hand, we do block the additional terminating instruction executions case in our instrumentation to avoid overcounting memory operations.

To instrument idioms, we leverage LLVM's profiling infrastructure which allows us to define named counters.
Our plugin modifies the test program with custom instrumentation code leveraging these LLVM counters as follows.
To determine the total memory traffic of a test program, we pair a counter with every memory operation and increment it whenever that memory operation is executed (@mem-op-count-ir and the following in the #link(<appendix>)[Appendix]).
Counting the number of times the idiom is executed must be done with care due to branching: since idioms are split along branches, a terminal memory operation need not be part of the idiom which contains it, for example if only a specific sequence of branches activate the idiom.
Therefore, we flag every branch within an idiom via an on/off bit---only when the terminal memory instruction is executed _and_ all of its branch flags were set to on do we count the idiom as having executed (@idiom-count-ir).
Similarly, the execution count for originating loads is determined by setting a flag when the load is executed and incrementing the counter when the idiom is deemed to have executed and the originating flag is set (@input-count-ir).
Finally, we do not consider idioms when the originating load address is from the stack (@stack-heuristic-ir); the assumption here is that any logically constructed runtime system will not place stack memory on remote nodes.

/*
== Collect profiles

After instrumenting a test program, we recompile it with LLVM and execute it to gather profiling data.
LLVM's infrastructure handles this for us, allowing us to extract the results via a command line tool.
From the tool's output, we can associate every counter with its corresponding idiom memory operation to construct a mapping between memory operations and execution counts.

== Analyze profiling results and generate reports

Following profiling data retrieval, we assign execution counts to idioms and compute their offloadable memory traffic by dividing the number memory operations executed within the idiom over the total number of memory operations executed across the entire program.
*/

== Edge Cases and Further Details
<edge-cases>

There are limitations to our current implementation that we highlight below:

=== Whole-program Analysis

In idiom identification, we currently do not support crossing function boundaries.
That is, if a path to a memory operation depends on the result of a function, it is ignored.
In the future, whole-program analysis and/or link time optimization could be useful, but we do not consider it in this work and instead rely on LLVM's default function inlining.
// Link Time Optimizations may be useful in the future, such as function inlining obviate the need to analyze instruction dependencies across function boundaries, but a more sophisticated compiler plugin may wish to perform such analysis.

=== Stack Detection

In our model of local computation we assume that a core has a small amount of fast (i.e. local) memory available to it for thread stacks.
Our analysis needs to exclude memory operations involving the stack.
Excluding stack memory operations is tricky because pointers may cross function boundaries---in essence, we must perform global alias analysis to identify stack allocations.
Note that per-thread stacks and address randomization prevent us from using simple hardcoded address comparisons.
Currently we use a heuristic, based on the pointer address to determine if it is a stack allocation or not: if a target memory address is between the value of `%rsp` minus the stack red zone and `%rsp` plus a conservative 256KiB, then it is considered to be on the stack and is excluded from our analysis.
Manual inspection confirms this heuristic is sufficient for our test applications.

=== Branches

Branches are a tricky business.
Were idioms to contain branches, nothing would prevent an idiom from depending on itself---for example, consider a linked-list iterator loop: the branch to jump out of the loop depends on the load of the list node to check for a null `next` pointer.
For a simple example like this, one could conceivably run that loop remotely.
The problem arises once non-trivial computation is performed within the loop.
Suddenly, memory operations and computation are being performed on the remote, effectively turning a parallel system into a serial one bounded by the speed of the remote memory executor.
Thus, we choose to eliminate branches from idioms by generating one idiom per branch path.
This transformation is sound because we can move branches down to select running either one idiom or the other (@branch-lift).
Note that we do not search through branch conditionals for idioms as this would break our ability to move branches outside of idioms---thus, branch conditionals cannot depend on originating loads.

#figure(image("branch-lift.gv.svg"), caption: [
  Left: the original idiom with a branch dependent upon two loads.
  Right: the two idioms generated after splitting with the branch pushed down to select between which idiom to execute.
]) <branch-lift>

#figure(caption: [
  Statistics on the number of possible branch paths in each idiom per kernel.
])[
#table(
  columns: (auto, ..range(0, 8).map(_ => 1fr)),
  table.header(
    table.cell(stroke: none)[],
    ..(
      [`bc`],
      [`bfs`],
      [`cc`],
      [`cc_sv`],
      [`pr`],
      [`pr_spmv`],
      [`sssp`],
      [`tc`],
    )
    .map(it => table.cell(align: center + bottom, stroke: none, inset: (x: 0.25em, y: 0.2em), rotate(-70deg, strong(it), reflow: true)))
  ),
  table.cell(stroke: none)[*90#super[th] percentile*], [4], [18], [7], [4], [6], [6], [8], [$~10^9$],
  table.cell(stroke: none)[*Max*], [768], [768], [768], [768], [768], [768], [768], [$~10^9$],
)
] <branch-explosion>

To split an idiom on its branch paths, we:
+ Collect all idioms with branches that contain two or more paths.
+ For each such idiom, generate a list of incoming edges per branch.
  Out of these lists, an "odometer" is created where every digit uses its own base, bound to the number of incoming edges for a given branch.
  The idea is to roll through every possible combination of paths by treating the odometer as a path mask and incrementing through every possible mask until it overflows, at which point we are done.
  An example is provided in @odometer-example.
+ Initialize the odometer to zero and increment it by one on each iteration, carrying the one to the next digit/branch whenever a digit overflows as in grade school math.
  In each iteration, walk the idiom graph following the incoming edges for each branch as specified by the odometer/mask to generate a new idiom.

#figure(caption: [
  Pseudo idiom containing three branches and its corresponding odometer.
  The 2#super[nd] branch depends on the 1#super[st], leading to duplicate generated idioms by our odometer method, hence the need for pruning.
])[
#image("odometer-ex.gv.svg")
#table(
  columns: (3fr, 1fr, 1fr, 1fr),
  stroke: none,
  align: center + horizon,
  table.header(
    [],
    ..(
      [Branch 1],
      [Branch 2],
      [Branch 3],
    )
    .map(it => strong(it))
  ),
  [#set par(justify: false); *Branch splits \ (odometer digit base)*], [2], [3], [2],
  [*Example odometer mask*], [0], [1], [1],
)
] <odometer-example>

This algorithm unfortunately has runtime complexity $O(M^N)$ where $N$ is the number of branches and $M$ is the branching factor, so we limit idiom analysis if the product of the incoming edges exceeds `100_000`.
In practice, idioms have very few branches (@branch-explosion) so this is not an issue.
This algorithm can generate duplicate idioms (for example if a branch depends on another branch but that path was eliminated), so we also implement idiom deduplication which consists of dropping idioms whose set of instruction IDs has already been seen before.

= Evaluation

We developed a testing framework that produces deterministic analysis results given a program with deterministic memory operation counts.
Our framework accepts C/C++ programs that can be compiled with Clang and any program that can be compiled down to LLVM IR (in fact, C/C++ support is implemented by having Clang generate LLVM IR for the rest of the pipeline).
The LLVM IR is then used to generate assembly and run an instrumented version of the program as described earlier.
So long as the idioms are executed deterministically, the analysis that follows is bit-for-bit reproducible: we generate debugging Graphviz diagrams which contain annotated instruction dependency graphs and a CSV file with memory operation counts.

The reproducibility of our analysis was crucial in enabling fast and bug-free refactorings: as we added new features and modified our compiler plugin, several regressions were caught by comparing analysis files checked into git with their updated counterparts after code changes.
Achieving reproducibility required using deterministic hash functions, (stable) sorting of key data structures to make iteration ordering consistent, and stable IDs rather than pointers as keys in hash maps (due to address space layout randomization).

Our evaluation focuses on shared memory computer benchmarks from the Graph Algorithm Platform Benchmark Suite @gapbs.
The following kernels are included:

- `bc` -- Betweenness Centrality
- `bfs` -- Breadth-First Search
- `cc` -- Connected Components
- `cc_sv` -- Connected Components (Shiloach-Vishkin)
- `pr` -- PageRank
- `pr_spmv` -- PageRank (sparse-matrix vector multiply)
- `sssp` -- Single-Source Shortest Paths
- `tc` -- Triangle Counting

Each kernel was compiled with `-O3` optimizations and run on the same $2^20$ scale kronecker graph.

To evaluate the performance improvements our method could provide, we compute the fraction of memory operations that can be replaced by our automatically generated idioms, calling them _captured memory operations_.
We then assume these idioms can be accelerated---potential hardware implementations are discussed in @hardware_impls.
Since our method may generate overlapping idioms due to branch pruning, we conservatively only count the memory operations of a given instruction the first time we see it in the idiom with the most memory operations.
This means our analysis slightly undercounts as there could be overlapping but disjoint idioms (due to branches) whose memory operations are being incorrectly discarded.

== Only a Few Idioms are Needed

#figure(stack(image("cdf-op-count-normalized.svg"), image("cdf-op-count.svg")), caption: [
  Top: normalized captured memory operations by number of idiom replacements.
  Bottom: raw variation, showing how much of the program's unfiltered memory operations are captured.
]) <cdf-idioms>

#figure(stack(/*MANUAL_LAYOUT*/v(1em), image("total-memory-ops.svg")), caption: [
  The raw count of total memory operations executed in a given kernel vs. the number of idiom replacements.
  Kernel size is proportional to captured memory operations.
]) <total-memory-operations>

We find that only around ten idiom instantiations are needed to capture the vast majority of a program's offloadable memory operations (@cdf-idioms).
By a hundred idioms, only noise remains.

Even with infinite idioms, we cannot capture the entirety of the program's memory operations due to stack allocations being filtered out, lack of interprocedural analysis, or simply the existence of operations which do not begin _and_ end with memory.
For example, consider using a register value obtained from an external source (e.g. a syscall) to compute a store, or loading a value from memory and placing a computation in an I/O register.
Thus, we offer normalized plots of captured memory operations to focus on growth rates in addition to the raw plots.

Based on @total-memory-operations, there does not appear to be a correlation between the number of memory operations in a kernel and the fraction of captured memory operations.
`sssp` has few memory operations and few idiom replacement opportunities, but `tc` provides a counterexample with the most memory operations and still a small replacement fraction (though perhaps it is an outlier).
The other kernels do not show a preference either way.

#figure(image("idiom-instance-breakdown.svg"), caption: [
  Raw captured memory operations for each kernel broken down by idioms and their instantiations.
  Each bar is an idiom and each color within a bar is a particular instantiation of that idiom.
]) <cdf-idiom-instances>

@cdf-idioms showed the number of idiom _replacements_ (or instantiations) that are necessary to capture a certain fraction of memory operations, but if we instead only count the number of idioms themselves (by grouping their static occurrences), we find that just one or two idioms are necessary to capture a significant fraction of memory operations (@cdf-idiom-instances).
Furthermore, sometimes just a single instance of a single idiom captures most memory operations (in PageRank's case for example).
This result is both surprising and encouraging.
It is surprising because one would think that complex programs would have many different code patterns that interact with memory, while it turns out that only a select few of those patterns account for the vast majority of a program's total memory operations.
This is encouraging because it means hardware architects have an opportunity to offer a small selection of remotely executable memory instruction sequences that will have a significant impact on the given program.

#colbreak() // MANUAL_LAYOUT
== High Impact Idioms are Simple

#figure(stack(image("cdf-instruction-count-normalized.svg"), image("cdf-instruction-count.svg")), caption: [
  Top: normalized captured memory operations by number of instructions in the idiom.
  Bottom: raw variation.
]) <cdf-instrs>

#figure(stack(image("cdf-param-count-normalized.svg"), image("cdf-param-count.svg")), caption: [
  Top: normalized captured memory operations by number of parameters required to call the idiom.
  Bottom: raw variation.
]) <cdf-params>

We also find that high impact idioms (i.e. idioms that account for a significant fraction of a program's memory operations) have minimal complexity, both as measured by the number of instructions contained within the idiom (@cdf-instrs) and as measured by the number of parameters required to call the idiom (@cdf-params).
@cdf-instrs and @cdf-params demonstrate that a program whose memory instructions are replaced by idioms will dynamically execute most of its memory operations through idioms as the number of idiom instructions and parameters grows.
Requiring few instructions to execute an idiom means increased throughput at the remote memory executor while using few parameters means the networking costs of sending the idiom execution request to its target will be minimal.
Depending upon how idiom execution is implemented, fewer instructions can also translate into reduced networking costs.

*Key fact:* Simple, well used, idioms are ripe candidates for implementing entirely in-(or near-)memory with specialized hardware.

== Idioms are Shared Across Kernels

// #todo[Check whether or not top idioms change with graph property changes. Feedback: How sensitive is the number of idioms to properties of graphs used as an input to the studied benchmarks?]
// I gave this a quick look and it doesn't seem like it makes much of a difference. Some number go up, some down. Would need to figure out how to incorporate this in the graphs.
#figure(caption: [
  The deduplicated top five idioms from each kernel and whether or not they are present in the kernel.
  Legend: #emoji.checkmark.box the idiom is contained within the kernel, #emoji.checkmark.heavy the idiom can be transformed to match an idiom in the kernel, #emoji.crossmark the idiom is not contained within the kernel. Fill: the fraction of the kernel's captured memory operations by this idiom.
])[
#let row-height = 3.7em

#let idiom(it) = table.cell(align: center, inset: (y: 0.2em), image(height: row-height, it))

#let answer(pct: none, content) = table.cell(align: horizon, inset: 0pt)[
  #if pct != none {
    place(bottom, box(outset: -0.5pt, width: 100%, height: (row-height + 4pt) * pct, fill: green.transparentize(50%)))
  }
  #place(horizon + center, content)
  #h(2em)
]
#let yes = answer(emoji.checkmark.box)
#let yes-val(pct) = answer(pct: pct, emoji.checkmark.box)
#let no = answer(emoji.crossmark)
#let close = answer(emoji.checkmark.heavy)
#let close-val(pct) = answer(pct: pct, emoji.checkmark.heavy)

#table(
  columns: 9,
  table.header(
    table.cell(align: center + bottom, stroke: none)[*Idiom*],
    ..(
      [`bc`],
      [`bfs`],
      [`cc`],
      [`cc_sv`],
      [`pr`],
      [`pr_spmv`],
      [`sssp`],
      [`tc`],
    )
    .map(it => table.cell(align: right + bottom, stroke: none, inset: (x: 0.25em, y: 0.2em), rotate(-70deg, strong(it), reflow: true)))
  ),
  idiom("top-5/top-5.gv.svg"), yes-val(0.003888946507080159), yes-val(0.6770017680111391), yes-val(0.49736664370324524), yes-val(0.38410196775306576), yes-val(0.06361789923884788), yes-val(0.04198947440122185), yes, yes-val(0.013160298575657292),
  idiom("top-5/top-5.gv.2.svg"), yes, close-val(0.0346873102368307), yes-val(0.062339537299681495), yes, yes-val(0.012732282185463085), yes-val(0.012211419040510926), yes-val(0.029473684210526315), yes-val(0.12072520463750229),
  idiom("top-5/top-5.gv.6.svg"), yes-val(0.6878386156935263), yes-val(0.059832992153305876), yes-val(0.1487940015771168), yes-val(0.2806816411848212), yes-val(0.8514632428604002), yes-val(0.8421757329330534), yes, yes-val(0.10568815445018259),
  idiom("top-5/top-5.gv.7.svg"), yes-val(0.006628931753563458), yes-val(0.0007216543596120157), close-val(0.008843577018184437), yes, yes, yes, no, yes,
  idiom("top-5/top-5.gv.8.svg"), close, yes-val(0.025142484045564857), close, close, close, close, no, close,
  idiom("top-5/top-5.gv.3.svg"), yes, yes-val(0.007705983329628649), yes, yes, yes, yes, yes, yes,
  idiom("top-5/top-5.gv.4.svg"), yes, close, close, close, close, close, no, yes,
  idiom("top-5/top-5.gv.5.svg"), yes, yes, no, no, no, no, no, yes,
  idiom("top-5/top-5.gv.9.svg"), yes-val(0.19606779142327904), no, close, close, close, close, close, no,
  idiom("top-5/top-5.gv.10.svg"), no, yes-val(0.07503758471098544), no, no, no, no, no, no,
  idiom("top-5/top-5.gv.11.svg"), no, no, no, no, yes-val(0.011625911098849999), no, no, no,
  idiom("top-5/top-5.gv.12.svg"), no, no, no, no, no, yes-val(0.02465914654357427), no, no,
  idiom("top-5/top-5.gv.13.svg"), close, close, yes, yes, yes, yes, yes, no,
  block(height: row-height - 6pt, align(horizon)[Remaining]),
    answer(pct: 1 - (0.003888946507080159 + 0.6878386156935263 + 0.006628931753563458 + 0.19606779142327904))[],
    answer(pct: 1 - (0.6770017680111391 + 0.07503758471098544 + 0.059832992153305876 + 0.025142484045564857 + 0.0346873102368307 + 0.0007216543596120157 + 0.007705983329628649))[],
    answer(pct: 1 - (0.49736664370324524 + 0.062339537299681495 + 0.1487940015771168 + 0.008843577018184437))[],
    answer(pct: 1 - (0.38410196775306576 + 0.2806816411848212))[],
    answer(pct: 1 - (0.8514632428604002 + 0.06361789923884788 + 0.012732282185463085 + 0.011625911098849999))[],
    answer(pct: 1 - (0.04198947440122185 + 0.012211419040510926 + 0.8421757329330534 + 0.02465914654357427))[],
    answer(pct: 1 - (0.029473684210526315 + 0.009122807017543859 + 0.0035087719298245615))[],
    answer(pct: 1 - (0.12072520463750229 + 0.013160298575657292 + 0.10568815445018259 + 0.007420438917934822 + 0.0008565925537197043 + 0.008929466261665825))[],
)
] <idiom-commonality>

We find that idioms tend to be either widely shared across programs or unique to a given program (@idiom-commonality).
Small idioms are both shared more across programs and represent a more substantial portion of each program's memory operations.
Of the idioms that are unique, we find that they tend to differ by a small number of instructions and could potentially be transformed to minimize unique idioms.
For example, the third and forth idiom differ only by an add instruction---when trying to minimize the number of idioms, the one with the add instruction could be kept while the other idiom is discarded as it can add zero to achieve its original behavior.
We note that these findings are likely domain specific---we expect other application domains to have different sets of shared idioms partially disjoint from the GAP benchmark suite.

== Possible Hardware Implementations <hardware_impls>

#figure(caption: [
  Hardware implementation matrix for clients vs. remotes.
])[
#let yes = table.cell(align: horizon)[#emoji.checkmark.box]
#let no = table.cell(align: horizon)[#emoji.crossmark]

#table(
  columns: (auto, 1fr, 1fr),
  table.header(
    table.cell(stroke: none)[], [*Specialized client*], [*Generalized client*],
  ),
  [*Specialized remote*], yes, no,
  [*Generalized remote*], yes, yes,
)
] <impl-matrix>

There are two main implementation possibilities: to specialize or not to specialize.
Implementation A develops specialized instructions to match idioms while implementation B accepts arbitrary code sequences that begin and end with memory operations.
A specialized client can talk to a generalized remote (via translation), but the converse is not true (@impl-matrix).
#todo[Feedback: The implementation discussion in Section IV.D is perplexing to this reader. One might assume that "specialized" means FPGA, ASIC, PIM-based, etc. while "generalized" typically means CPU. If so, a few more words about what the assumptions are for the various classifications. Is a specialized client able to execute the entire application? What does "talk to" mean in the context of this section?]

Specializing in clients or remotes means a limited set of code patterns can be offloaded, but as we have seen this is not necessarily as restrictive as one might think.
All of our benchmark kernels use indirect loads (the first idiom in @idiom-commonality), so a custom instruction that implements that idiom would be valuable.
Specialized instructions also have the benefit of small networking costs due to the idiom ID being sent rather than the instructions within the idiom and potentially better PPA.
However, as we saw each kernel tends to include larger idioms that are particular to that kernel and thus would not be covered by specialized instructions that implement small, shared idioms.

On the other hand, a generalized implementation on the remote implies the instantiation of a (small) RISC-V core to execute idioms.
Using a core instead of specialized hardware implementations may increase latency and decrease throughput of memory operations.
That said, our analysis assumes the latency of a remote memory operation is an order of magnitude larger than local memory operations in which case a small increase in latency should have few noticeable effects.
The decrease in throughput could be solved with additional RISC-V cores executing in parallel at the remote, but this is not ideal and might need software cooperation to avoid overloading remote memory controllers.
For clients, a generalized implementation means additional networking costs as the idiom's instructions must be sent to the remote---a compact instruction representation and compression should alleviate these concerns.

To decide where an idiom should execute, we take advantage of the fact that idioms which depend on the stack are blocked (both through static analysis and with runtime checks of the load/store addresses).
Thus, in a manycore architecture with a cache per core solely for the stack, we are free to route idioms to the node's memory controller for execution where the memory locations of each address used in the idiom are known and thus the idiom can be sent to the best node for execution.

= Related Work

The problem of accelerating applications through specialization has been attacked from many different angles.
In broad categories, software can be adapted to better take advantage of hardware, hardware can be built that better matches software applications, and any mix in-between.

Non-invasive software optimization, requiring no changes from the programmer, are widespreadly used today.
For example, auto vectorization (written about by Kennedy and Allen @wolfe1995high) is a great non-invasive feature in modern compilers (e.g. in GCC @naishlos2004autovectorization and LLVM @finkel2012autovectorization).
Stanford @suif (and others @Banerjee1995ThePC @Anderson1995DataAC) originally developed compiler optimizations to automatically parallelize code for improved multiprocessor performance.
Harel et al. @Harel2019SourcetoSourcePC compared production automatic parallelizing compilers.
The Alembic project @holt2014alembic built on Grappa @nelson2015latency relied on moving regions of code to execute closer to their data rather than optimize the code itself.
Our approach is a natural continuation: having exhausted code optimizations, we also seek to move compute closer data, but do so in a more granular way than Alembic and strive to be as transparent as auto vectorization.

Invasive software optimizations require effort from the programmer, but can offer more substantial performance gains than generic automatic approaches.
The UPC language @carlson1999introduction is an extension of the C programming language designed to take advantage of shared memory computers.
FortranD @hiranandani1992overview takes a similar approach for Fortran and Chapel @chamberlain2007parallel is a new parallel programming language.
PANDORA @Stitt2020PANDORA converts exact algorithms into higher performance approximations.
Our work can be considered non-invasive: with the right hardware support, we are able to transparently rewrite programs to effectively use the hardware's memory offloading capabilities.
Moreover, a hardware implementation willing to spend its area budget could detect idioms dynamically in the instruction stream, in which case software need not be involved at all.
However, our current approach works best with runtime profiling which could be considered an invasive step even though there are no user visible code changes.

The solution space for hardware is much more flexible, so various techniques have been explored.
The NYU Ultra @nyuUltra introduced remote fetch-and-add instructions to accelerate synchronization (this idea has been extended for RISC-V with remote AMO operations @remoteAmo).
Processors in memory and a compiler @fujiki2018memory for such hardware were built to exploit massive parallelism.
Application-specific instruction-set processors design @goodwin2003automatic @autoCI @FINDER is closest to our approach though more focused on accelerating compute.
Hoffmann et al. @asips developed a DSL to describe hardware for the purpose of automatically generating a compiler toolchain for application specific ISAs.
Our work is more general than hand-crafted hardware instructions, less restrictive than PIMs, and not as upending as full blown ASIP.

= Future Work

Our analysis focused primarily on accelerating memory operations by moving compute to data, but our technique is general and need not be restricted to shared memory computers or even memory accelerators.
A first step towards generalization would be to run our analysis on a much larger and broader suite of tests that is not specifically focused on shared memory computers.
It would be interesting to see if high impact idioms remain simple and continue sharing commonality with other programs.
Next, our approach could be adapted to find code patterns that do not necessarily involve memory, e.g. to find quirky vector instructions.
Finally, a modular analysis framework could be built for hardware architects to search for arbitrary code patterns they are interested in across a broad suite of programs.

Currently, our analysis requires running instrumented programs to determine which idioms are useful and which are not.
It would be valuable to find correlation between a static occurrence of an idiom and its dynamic runtime characteristics.
For example, if an idiom is inside a for loop, we can probably infer that it is likely to be useful without requiring program instrumentation.

We have also found that sometimes an idiom's terminating instruction is executed far more times than its dependencies (e.g. if the terminating instruction is in a loop, but the originating load is outside the loop).
In such cases, it may not be desirable to execute the idiom remotely as this will incur additional loads that were not present in the original program.
Thus, it would be valuable to identify such idioms via instrumentation (essentially Profile Guided Optimization) and use some threshold to skip instantiating idioms with high overhead.

= Conclusion

We presented a novel approach to automatically designing instruction set architectures, focusing on accelerating memory operations in shared memory systems.
Through analysis of kernels in the GAP benchmark suite, we have uncovered several key findings on the potential for automating ISA design:

- We have demonstrated that only a small number of idioms are needed to capture the majority of a program's offloadable memory operations, highlighting the feasibility of our approach.
- High-impact idioms were found to be simple in structure, suggesting that hardware architects can offer a concise set of remotely executable memory instruction sequences with significant impact or involve minimal networking costs to transfer the instruction sequence to the remote.
- Idioms were found to be shared across kernels, with some unique variations that could be minimized for broader applicability.

Looking ahead, future research could explore broader applications of our approach beyond shared memory architectures, as well as address remaining challenges such as the dynamic runtime characteristics of idioms and optimizing overhead in remote execution.
In summary, our work represents a step forward for ISA design.

#colbreak()
= Appendix <appendix>

#figure(placement: none, caption: [Example global memory operation execution count instrumentation.], rect(width: 100%)[
  #set par(justify: false)
  ```llvm
  @mem_40 = global [6 x i8] c"mem_40"
  ...
  call void @llvm.instrprof.increment(
    ptr @mem_40,
    i64 223372036859619000, i32 1, i32 0)
  <TERMINATING OP>
  ```
]) <mem-op-count-ir>
#figure(placement: none, caption: [Example idiom execution count instrumentation.], rect(width: 100%)[
  #set text(size: 0.85em)
  #set par(justify: false)
  ```llvm
@outputs_0_0 = global [11 x i8] c"outputs_0_0"

... {
entry:
  %active_path = alloca i1
  ; Initialize a flag for each branch
  store i1 false, ptr %active_path

...

for.inc: ; preds = %if.else, %if.then
  %activated_path =
    phi i1 [ false, %if.else ], [ true, %if.then ]
  ; BRANCH
  %storemerge =
    phi i32 [ %add5, %if.else ], [ %add, %if.then ]
  ; Set the flag
  store i1 %activated_path, ptr %active_path

  ; Load and reset the flag
  %activated = load i1, ptr %active_path
  store i1 false, ptr %active_path

  ; Compute activation at terminating store
  %activated_reduce = and i1 %is_not_stack, %activated
  call void @maybe_instr(i1 %activated_reduce)
  ; TERMINATING OP
  store i32 %storemerge, ptr %output
}

...

define void @maybe_instr(i1 %0) {
entry:
  br i1 %0, label %yes, label %no

yes:
  call void @llvm.instrprof.increment(
    ptr @outputs_0_0,
    i64 223372036859619002, i32 1, i32 0)
  ret void

no:
  ret void
}
  ```
]) <idiom-count-ir>
#figure(placement: none, caption: [Example originating load execution count instrumentation.], rect(width: 100%)[
  #set text(size: 0.85em)
  #set par(justify: false)
  ```llvm
@inputs_0_0_30 = global [13 x i8] c"inputs_0_0_30"
...
entry:
  %active = alloca i1
  ; Initialize a flag for each input
  store i1 false, ptr %active

if.then:
  ; Set flag
  store i1 true, ptr %active
  <ORIGINATING LOAD>

for.inc:
  %inputs_activated = load i1, ptr %active
  %both = and i1 %inputs_activated, %outputs_activated
  call void @instr_maybe(i1 %both)
  ; Reset flag
  store i1 false, ptr %active
  ```
]) <input-count-ir>
#figure(placement: none, caption: [Example stack address detection instrumentation.], rect(width: 100%)[
  #set text(size: 0.85em)
  #set par(justify: false)
  ```llvm
  %get_rsp = call ptr asm "movq %rsp, $0", "=r"()
  %rsp_cast = ptrtoint ptr %get_rsp to i64
  %red_zone = sub i64 %rsp_cast, 128
  %scratchpad_top = add i64 %rsp_cast, 262144

  %cast = ptrtoint ptr %target_op to i64
  %above_red_zone = icmp ult i64 %cast, %red_zone
  %below_scratchpad = icmp ugt i64 %cast, %scratchpad_top
  %is_not_stack = or i1 %above_red_zone, %below_scratchpad
  ```
]) <stack-heuristic-ir>
