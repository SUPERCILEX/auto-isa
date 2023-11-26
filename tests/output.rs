#![feature(exit_status_error)]

use std::{
    fs::create_dir_all,
    process::{Command, Stdio},
};

use expect_test::expect_file;

macro_rules! test_c {
    ($name:ident) => {
        #[test]
        fn $name() {
            create_dir_all("/tmp/auto-isa").unwrap();

            Command::new("clang-16")
                .args([
                    "-g",
                    "-c",
                    "-O1",
                    "-S",
                    "-emit-llvm",
                    "-fno-discard-value-names",
                    concat!("testdata/", stringify!($name), ".c"),
                    "-o",
                    concat!("/tmp/auto-isa/", stringify!($name), ".ll"),
                ])
                .status()
                .unwrap()
                .exit_ok()
                .unwrap();

            let opt_result = Command::new("opt-16")
                .args([
                    "--load-pass-plugin=target/debug/libauto_isa.so",
                    "--passes=auto-isa",
                    "-disable-output",
                    concat!("/tmp/auto-isa/", stringify!($name), ".ll"),
                ])
                .stdout(Stdio::piped())
                .spawn()
                .unwrap()
                .wait_with_output()
                .unwrap();
            opt_result.status.exit_ok().unwrap();
            let opt_result = String::from_utf8(opt_result.stdout).unwrap();

            expect_file![concat!("../testdata/", stringify!($name), ".out")].assert_eq(&opt_result);
        }
    };
}

test_c!(loop_sum);
