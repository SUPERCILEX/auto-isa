#![feature(exit_status_error)]

use std::{
    env, fs,
    fs::{create_dir_all, File},
    io::{ErrorKind::NotFound, Read, Write},
    mem::ManuallyDrop,
    os::fd::FromRawFd,
    process::{Command, Stdio},
};

use expect_test::expect_file;
use paste::paste;

macro_rules! dbg_command {
    ($e:expr) => {{
        match $e {
            e => {
                let mut stdout =
                    ManuallyDrop::new(unsafe { File::from_raw_fd(rustix::stdio::raw_stdout()) });
                writeln!(stdout, "$ {e:?}").unwrap();
                e
            }
        }
    }};
}

macro_rules! file_ext_ {
    ($name:ident, $suffix:expr) => {
        concat!(stringify!($name), $suffix)
    };
}

macro_rules! test_llvm {
    ($dir_name:ident, $name:ident, $cmd_args:expr) => {
        let dir = concat!("testdata/", stringify!($dir_name));

        dbg_command!(Command::new(env::var("CARGO").unwrap()).arg("build"))
            .status()
            .unwrap()
            .exit_ok()
            .unwrap();

        macro_rules! file_ext {
            ($suffix: expr) => {
                file_ext_!($name, $suffix)
            };
        }

        let mut opt_result = dbg_command!(
            Command::new("opt-16")
                .args([
                    "--load-pass-plugin=../../target/debug/libauto_isa.so",
                    "--passes=auto-isa",
                ])
                .arg("-S")
                .args([file_ext!(".ll"), "-o", file_ext!("-instr.ll")])
                .current_dir(dir)
                .stdin(Stdio::piped())
                .stdout(Stdio::piped())
        )
        .spawn()
        .unwrap();
        opt_result
            .stdout
            .as_mut()
            .unwrap()
            .read_exact(&mut [0])
            .unwrap();

        dbg_command!(
            Command::new("clang++-16")
                .args(["-O1", "-lm", "-fopenmp", "-fprofile-generate"])
                .args([file_ext!("-instr.ll"), "-o", file_ext!("")])
                .current_dir(dir)
        )
        .status()
        .unwrap()
        .exit_ok()
        .unwrap();

        let profile_path = concat!(
            "testdata/",
            stringify!($dir_name),
            "/",
            file_ext!(".profraw")
        );
        match fs::remove_file(profile_path) {
            Err(e) if e.kind() == NotFound => Ok(()),
            r => r,
        }
        .unwrap();

        dbg_command!(
            Command::new(concat!("./", stringify!($name)))
                .args($cmd_args)
                .env("LLVM_PROFILE_FILE", file_ext!(".profraw"))
                .stdin(Stdio::null())
                .current_dir(dir)
        )
        .status()
        .unwrap();

        dbg_command!(
            Command::new("llvm-profdata-16")
                .args(["show", "--all-functions", "--counts", "--text"])
                .arg(profile_path)
                .stdout(Stdio::from(opt_result.stdin.take().unwrap()))
        )
        .status()
        .unwrap()
        .exit_ok()
        .unwrap();

        let opt_result = opt_result.wait_with_output().unwrap();
        opt_result.status.exit_ok().unwrap();
        let opt_result = String::from_utf8(opt_result.stdout).unwrap();

        expect_file![concat!(
            "../testdata/",
            stringify!($dir_name),
            "/",
            file_ext!(".gv")
        )]
        .assert_eq(&opt_result);

        dbg_command!(
            Command::new("dot")
                .args(["-O", "-Tpdf", file_ext!(".gv")])
                .current_dir(dir)
        )
        .status()
        .unwrap()
        .exit_ok()
        .unwrap();
    };
}

macro_rules! test {
    ($name:ident, $ext:expr) => {
        #[test]
        #[allow(clippy::too_many_lines)]
        fn $name() {
            let dir = concat!("testdata/", stringify!($name));
            create_dir_all(dir).unwrap();

            Command::new("clang-16")
                .args(["-O1", "-Wno-everything", "-fno-discard-value-names"])
                .args(["-S", "-emit-llvm"])
                .args([
                    file_ext_!($name, $ext),
                    "-o",
                    concat!(stringify!($name), "/", file_ext_!($name, ".ll")),
                ])
                .current_dir("testdata")
                .status()
                .unwrap()
                .exit_ok()
                .unwrap();

            test_llvm!($name, $name, [""; 0]);
        }
    };
}

macro_rules! test_c {
    ($name:ident) => {
        test!($name, ".c");
    };
}

macro_rules! test_cpp {
    ($name:ident) => {
        test!($name, ".cpp");
    };
}

test_c!(chomp);
test_c!(dt);
test_c!(evalloop);
test_c!(exptree);
test_c!(himenobmtxpa);
test_c!(loop_sum);
test_c!(loop_sum_branch);
test_c!(loop_sum_select);
test_c!(lowercase);
test_c!(matmul_f64_4x4);
test_c!(oourafft);
test_c!(perlin);
test_c!(pointer_chase);
test_c!(queens);
test_c!(reed_solomon);
test_c!(richards_benchmark);
test_c!(salsa20);

test_cpp!(stepanov_v1p2);

#[test]
fn graphs() {
    dbg_command!(
        Command::new("clang++-16")
            .args(["-O3", "-fno-discard-value-names"])
            .args(["-S", "-emit-llvm"])
            .args(["main.cpp", "-o", "graphs.ll"])
            .current_dir("testdata/graphs")
    )
    .status()
    .unwrap()
    .exit_ok()
    .unwrap();

    test_llvm!(
        graphs,
        graphs,
        [
            "gplus_combined.txt",
            "116601386475273901307",
            "112922373559516660837",
        ]
    );
}

macro_rules! gapbs {
    ($name:ident) => {
        paste! {
            #[test]
            fn [<gapbs_ $name>] () {
                dbg_command!(
                    Command::new("make")
                        .arg(stringify!($name))
                        .current_dir("testdata/gapbs/gapbs")
                        .env("CXX", "clang++-16")
                        .env("CXX_FLAGS", "-S -emit-llvm")
                )
                .status()
                .unwrap()
                .exit_ok()
                .unwrap();
                fs::rename(
                    concat!("testdata/gapbs/gapbs/", stringify!($name)),
                    concat!("testdata/gapbs/", stringify!($name), ".ll"),
                )
                .unwrap();

                test_llvm!(gapbs, $name, ["-g", "20",]);
            }
        }
    };
}

gapbs!(bc);
gapbs!(bfs);
gapbs!(cc);
gapbs!(cc_sv);
gapbs!(pr);
gapbs!(pr_spmv);
gapbs!(sssp);
gapbs!(tc);
gapbs!(converter);
