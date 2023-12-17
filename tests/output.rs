#![feature(exit_status_error)]

use std::{
    env,
    fs::create_dir_all,
    process::{Command, Stdio},
};

use expect_test::expect_file;

macro_rules! test {
    ($name:ident, $ext:expr) => {
        #[test]
        fn $name() {
            create_dir_all(concat!("testdata/", stringify!($name))).unwrap();

            Command::new(env::var("CARGO").unwrap())
                .args(["build"])
                .status()
                .unwrap()
                .exit_ok()
                .unwrap();

            macro_rules! file_path {
                ($suffix: expr) => {
                    concat!(
                        "testdata/",
                        stringify!($name),
                        "/",
                        stringify!($name),
                        $suffix
                    )
                };
            }

            Command::new("clang-16")
                .args([
                    "-O1",
                    "-Wno-everything",
                    "-S",
                    "-emit-llvm",
                    "-fno-discard-value-names",
                    concat!("testdata/", stringify!($name), $ext),
                    "-o",
                    file_path!(".ll"),
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
                    file_path!(".ll"),
                ])
                .stdout(Stdio::piped())
                .spawn()
                .unwrap()
                .wait_with_output()
                .unwrap();
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
