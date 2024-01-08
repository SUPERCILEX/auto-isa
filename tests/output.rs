#![feature(exit_status_error)]
#![feature(dir_entry_ext2)]

use std::{
    env, fs,
    fs::{create_dir_all, File},
    io::{Read, Write},
    mem::ManuallyDrop,
    os::{fd::FromRawFd, unix::fs::DirEntryExt2},
    process::{Command, Stdio},
};

use expect_test::expect_file;

macro_rules! file_path_ {
    ($name:ident, $suffix:expr) => {
        concat!(
            "testdata/",
            stringify!($name),
            "/",
            stringify!($name),
            $suffix
        )
    };
}

macro_rules! test_llvm {
    ($name:ident, $cmd_args:expr) => {
        let dir = concat!("testdata/", stringify!($name));
        create_dir_all(dir).unwrap();

        Command::new(env::var("CARGO").unwrap())
            .args(["build"])
            .status()
            .unwrap()
            .exit_ok()
            .unwrap();

        macro_rules! file_path {
            ($suffix: expr) => {
                file_path_!($name, $suffix)
            };
        }

        let mut opt_result = Command::new("opt-16")
            .args([
                "--load-pass-plugin=target/debug/libauto_isa.so",
                "--passes=auto-isa",
                "-S",
                file_path!(".ll"),
                "-o",
                file_path!("-instr.ll"),
            ])
            .stdin(Stdio::piped())
            .stdout(Stdio::piped())
            .spawn()
            .unwrap();
        opt_result
            .stdout
            .as_mut()
            .unwrap()
            .read_exact(&mut [0])
            .unwrap();

        Command::new("clang++-16")
            .args([
                "-O1",
                "-fprofile-generate",
                "-lm",
                file_path!("-instr.ll"),
                "-o",
                file_path!(""),
            ])
            .status()
            .unwrap()
            .exit_ok()
            .unwrap();

        let profdata_file = || {
            fs::read_dir(dir)
                .unwrap()
                .map(|entry| entry.unwrap())
                .filter(|entry| {
                    entry
                        .file_name_ref()
                        .to_string_lossy()
                        .ends_with(".profraw")
                })
        };
        for file in profdata_file() {
            fs::remove_file(file.path()).unwrap();
        }

        {
            let mut run = Command::new(concat!("./", stringify!($name)));
            let run = run.args($cmd_args).stdin(Stdio::null()).current_dir(dir);

            let mut stdout = ManuallyDrop::new(unsafe { File::from_raw_fd(1) });
            writeln!(stdout, "Running command: {run:?}").unwrap();

            run.status().unwrap();
        }

        Command::new("llvm-profdata-16")
            .args([
                "show",
                "--all-functions",
                "--counts",
                "--text",
                &*profdata_file().next().unwrap().path().to_string_lossy(),
            ])
            .stdout(Stdio::from(opt_result.stdin.take().unwrap()))
            .status()
            .unwrap()
            .exit_ok()
            .unwrap();

        let opt_result = opt_result.wait_with_output().unwrap();
        opt_result.status.exit_ok().unwrap();
        let opt_result = String::from_utf8(opt_result.stdout).unwrap();

        expect_file![concat!(
            "../testdata/",
            stringify!($name),
            "/",
            stringify!($name),
            ".gv"
        )]
        .assert_eq(&opt_result);

        Command::new("dot")
            .args(["-O", "-Tpdf", file_path!(".gv")])
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
            Command::new("clang-16")
                .args([
                    "-O1",
                    "-Wno-everything",
                    "-S",
                    "-emit-llvm",
                    "-fno-discard-value-names",
                    concat!("testdata/", stringify!($name), $ext),
                    "-o",
                    file_path_!($name, ".ll"),
                ])
                .status()
                .unwrap()
                .exit_ok()
                .unwrap();

            test_llvm!($name, [""; 0]);
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
