// SPDX-License-Identifier: AGPL-3.0-only
//! The C ABI (A5b): every entry point behaves as documented when called through the C calling
//! convention, the header declares exactly the exported symbols, the C example builds against the
//! static and the shared library and runs, and random bytes into every entry point never crash,
//! never hang and only ever return the documented codes.

use kshana_capi::*;
use std::ffi::{c_char, CStr, CString};
use std::path::{Path, PathBuf};
use std::process::Command;

fn repo() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("../..")
}

fn read(p: &str) -> String {
    std::fs::read_to_string(repo().join(p)).unwrap()
}

/// Call a two-out function and return (code, ok string, error string), freeing both.
fn take(code: i32, ok: *mut c_char, err: *mut c_char) -> (i32, Option<String>, Option<String>) {
    let s = |p: *mut c_char| {
        (!p.is_null()).then(|| {
            // SAFETY: p came from this library and is freed right after.
            let v = unsafe { CStr::from_ptr(p) }.to_str().unwrap().to_string();
            unsafe { kshana_string_free(p) };
            v
        })
    };
    (code, s(ok), s(err))
}

fn run(toml: Option<&CString>) -> (i32, Option<String>, Option<String>) {
    let (mut ok, mut err) = (std::ptr::null_mut(), std::ptr::null_mut());
    let p = toml.map_or(std::ptr::null(), |c| c.as_ptr());
    // SAFETY: p is null or a valid C string; the out-pointers are valid.
    let code = unsafe { kshana_run_scenario(p, &mut ok, &mut err) };
    take(code, ok, err)
}

#[test]
fn entry_points_behave_as_documented() {
    // SAFETY: the version is a static NUL-terminated string.
    let v = unsafe { CStr::from_ptr(kshana_version()) }
        .to_str()
        .unwrap();
    assert_eq!(v, env!("CARGO_PKG_VERSION"));

    let scenario = CString::new(read("scenarios/link-budget.toml")).unwrap();
    let (code, ok, err) = run(Some(&scenario));
    assert_eq!((code, err), (KSHANA_OK, None));
    let doc: serde_json::Value = serde_json::from_str(&ok.unwrap()).unwrap();
    assert!(doc.is_object());
    assert_eq!(
        serde_json::to_value(
            kshana::api::run_toml(scenario.to_str().unwrap())
                .unwrap()
                .json
                .parse::<serde_json::Value>()
                .unwrap()
        )
        .unwrap(),
        doc,
        "the C call returns the library's own result"
    );

    let bad = CString::new("kind = \"no-such-kind\"\n").unwrap();
    let (code, ok, err) = run(Some(&bad));
    assert_eq!((code, ok), (KSHANA_ERROR, None));
    assert!(!err.unwrap().is_empty());

    let (code, ok, err) = run(None);
    assert_eq!((code, ok), (KSHANA_BAD_ARGUMENT, None));
    assert!(err.unwrap().contains("null"));

    // Not UTF-8.
    let latin1 = CString::new(vec![b'k', 0xE9, b'x']).unwrap();
    assert_eq!(run(Some(&latin1)).0, KSHANA_BAD_ARGUMENT);

    // Null out-pointers are allowed: the result is dropped, not leaked or written.
    // SAFETY: valid input; null out-pointers are part of the contract.
    let code = unsafe {
        kshana_run_scenario(
            scenario.as_ptr(),
            std::ptr::null_mut(),
            std::ptr::null_mut(),
        )
    };
    assert_eq!(code, KSHANA_OK);
    // SAFETY: freeing null is allowed.
    unsafe { kshana_string_free(std::ptr::null_mut()) };

    // Validation.
    let (mut ok, mut err) = (std::ptr::null_mut(), std::ptr::null_mut());
    // SAFETY: as above.
    let code = unsafe { kshana_validate_scenario(scenario.as_ptr(), &mut ok, &mut err) };
    let (code, ok, _) = take(code, ok, err);
    assert_eq!((code, ok.as_deref()), (KSHANA_OK, Some("[]")));

    // Connect: the same records as the library.
    let m = read("examples/connect/timing-monitor.connect.toml");
    let s = read("examples/obs/station.toml");
    let t = read("examples/connect/timing-monitor.csv");
    let (cm, cs, ct) = (
        CString::new(m.clone()).unwrap(),
        CString::new(s.clone()).unwrap(),
        CString::new(t.clone()).unwrap(),
    );
    let (mut ok, mut err) = (std::ptr::null_mut(), std::ptr::null_mut());
    // SAFETY: valid inputs and out-pointers.
    let code =
        unsafe { kshana_connect_map(cm.as_ptr(), cs.as_ptr(), ct.as_ptr(), &mut ok, &mut err) };
    let (code, ok, err) = take(code, ok, err);
    assert_eq!((code, err), (KSHANA_OK, None));
    assert_eq!(
        ok.unwrap(),
        kshana::surface::connect_map(&m, &s, &t, KSHANA_MAX_INPUT_BYTES).unwrap()
    );
}

#[test]
fn calls_from_many_threads_at_once() {
    let scenario = CString::new(read("scenarios/link-budget.toml")).unwrap();
    let want = run(Some(&scenario)).1.unwrap();
    std::thread::scope(|sc| {
        for _ in 0..8 {
            sc.spawn(|| assert_eq!(run(Some(&scenario)).1.unwrap(), want));
        }
    });
}

#[test]
fn the_header_declares_exactly_the_exported_functions() {
    let header =
        std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join("include/kshana.h"))
            .unwrap();
    let src =
        std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join("src/lib.rs")).unwrap();
    let mut exported: Vec<String> = src
        .split("#[no_mangle]")
        .skip(1)
        .filter_map(|s| s.split("fn ").nth(1)?.split('(').next().map(str::to_string))
        .collect();
    let mut declared: Vec<String> = header
        .lines()
        .filter(|l| {
            !l.trim_start().starts_with("/*")
                && !l.trim_start().starts_with('*')
                && l.contains("kshana_")
                && l.contains('(')
        })
        .filter_map(|l| {
            let before = l.split('(').next()?;
            before.split([' ', '*']).next_back().map(str::to_string)
        })
        .collect();
    exported.sort();
    declared.sort();
    assert_eq!(declared, exported);
    for (name, value) in [
        ("KSHANA_OK", KSHANA_OK),
        ("KSHANA_ERROR", KSHANA_ERROR),
        ("KSHANA_BAD_ARGUMENT", KSHANA_BAD_ARGUMENT),
        ("KSHANA_INTERNAL", KSHANA_INTERNAL),
    ] {
        assert!(
            header.contains(&format!("#define {name} {value}")),
            "{name}"
        );
    }
    assert!(header.contains("#define KSHANA_MAX_INPUT_BYTES (64u << 20)"));
    assert_eq!(KSHANA_MAX_INPUT_BYTES, 64 << 20);
}

/// The directory holding this build's libkshana_capi.a and shared library.
fn lib_dir() -> PathBuf {
    let exe = std::env::current_exe().unwrap();
    exe.parent().unwrap().parent().unwrap().to_path_buf() // target/<profile>/deps/<test> -> target/<profile>
}

#[cfg(target_os = "linux")]
#[test]
fn the_c_example_builds_and_runs_against_both_libraries() {
    let Ok(cc) = Command::new("cc").arg("--version").output() else {
        if std::env::var("KSHANA_REQUIRE_CC").as_deref() == Ok("1") {
            panic!("cc is required (KSHANA_REQUIRE_CC=1)");
        }
        eprintln!("skipped: no C compiler");
        return;
    };
    assert!(cc.status.success());
    let dir = lib_dir();
    assert!(
        dir.join("libkshana_capi.a").is_file(),
        "build the libraries first: `cargo build` (cargo test alone builds only the rlib)"
    );
    let crate_dir = Path::new(env!("CARGO_MANIFEST_DIR"));
    let tmp = Path::new(env!("CARGO_TARGET_TMPDIR")).join(format!("capi-{}", std::process::id()));
    std::fs::create_dir_all(&tmp).unwrap();
    let args = [
        repo().join("scenarios/link-budget.toml"),
        repo().join("examples/connect/timing-monitor.connect.toml"),
        repo().join("examples/obs/station.toml"),
        repo().join("examples/connect/timing-monitor.csv"),
    ];
    for (kind, link) in [
        (
            "static",
            vec![
                dir.join("libkshana_capi.a").display().to_string(),
                "-lpthread".into(),
                "-ldl".into(),
                "-lm".into(),
            ],
        ),
        (
            "shared",
            vec![
                format!("-L{}", dir.display()),
                "-lkshana_capi".into(),
                format!("-Wl,-rpath,{}", dir.display()),
            ],
        ),
        // The C side under AddressSanitizer (with leak detection) and UndefinedBehaviorSanitizer:
        // every string the library hands out must be freed back, and nothing read out of bounds.
        (
            "sanitized",
            vec![
                "-g".into(),
                "-fsanitize=address,undefined".into(),
                "-fno-sanitize-recover=all".into(),
                "-fno-omit-frame-pointer".into(),
                dir.join("libkshana_capi.a").display().to_string(),
                "-lpthread".into(),
                "-ldl".into(),
                "-lm".into(),
            ],
        ),
    ] {
        let bin = tmp.join(format!("run_and_map_{kind}"));
        let out = Command::new("cc")
            .args(["-std=c99", "-Wall", "-Wextra", "-Werror", "-I"])
            .arg(crate_dir.join("include"))
            .arg(crate_dir.join("examples/c/run_and_map.c"))
            .args(&link)
            .arg("-o")
            .arg(&bin)
            .output()
            .unwrap();
        assert!(
            out.status.success(),
            "{kind}: {}",
            String::from_utf8_lossy(&out.stderr)
        );
        let run = Command::new(&bin)
            .args(&args)
            .env("ASAN_OPTIONS", "detect_leaks=1:abort_on_error=1")
            .output()
            .unwrap();
        let text = String::from_utf8_lossy(&run.stdout);
        let errs = String::from_utf8_lossy(&run.stderr);
        assert!(run.status.success(), "{kind}: {text}{errs}");
        assert!(
            !errs.contains("Sanitizer") && !errs.contains("runtime error"),
            "{kind}: {errs}"
        );
        assert!(
            text.contains(&format!("kshana {}", env!("CARGO_PKG_VERSION"))),
            "{text}"
        );
        assert!(text.contains("records: 6"), "{text}");
        assert!(text.contains("null scenario: 2 (with reason)"), "{text}");
    }
    let _ = std::fs::remove_dir_all(&tmp);
}

/// A small deterministic generator (xorshift64*), so a failure reproduces from its seed.
struct Rng(u64);
impl Rng {
    fn next(&mut self) -> u64 {
        self.0 ^= self.0 >> 12;
        self.0 ^= self.0 << 25;
        self.0 ^= self.0 >> 27;
        self.0.wrapping_mul(0x2545_F491_4F6C_DD1D)
    }
}

#[test]
fn random_bytes_into_every_entry_point_never_crash() {
    let seeds = [
        read("scenarios/link-budget.toml"),
        read("examples/connect/timing-monitor.connect.toml"),
        read("examples/obs/station.toml"),
        read("examples/connect/timing-monitor.csv"),
    ];
    let mut rng = Rng(0x6b73_6861_6e61_2d63);
    let iterations: usize = std::env::var("KSHANA_CAPI_FUZZ_ITERATIONS")
        .ok()
        .and_then(|v| v.parse().ok())
        .unwrap_or(400);
    let mut input = || -> CString {
        // Either random bytes, or a real input with a few bytes changed (to reach deeper paths).
        let mut b: Vec<u8> = if rng.next().is_multiple_of(2) {
            (0..rng.next() % 512)
                .map(|_| (rng.next() % 255 + 1) as u8)
                .collect()
        } else {
            let mut b = seeds[(rng.next() % 4) as usize].clone().into_bytes();
            for _ in 0..(rng.next() % 8 + 1) {
                let i = (rng.next() as usize) % b.len().max(1);
                if let Some(x) = b.get_mut(i) {
                    *x = (rng.next() % 255 + 1) as u8;
                }
            }
            b
        };
        b.retain(|&x| x != 0);
        CString::new(b).unwrap()
    };
    for _ in 0..iterations {
        let (a, b, c) = (input(), input(), input());
        let (mut ok, mut err) = (std::ptr::null_mut(), std::ptr::null_mut());
        // SAFETY: valid C strings and out-pointers; every string returned is freed by `take`.
        let codes = [
            take(
                unsafe { kshana_validate_scenario(a.as_ptr(), &mut ok, &mut err) },
                ok,
                err,
            )
            .0,
            {
                let (mut ok, mut err) = (std::ptr::null_mut(), std::ptr::null_mut());
                take(
                    unsafe {
                        kshana_connect_map(a.as_ptr(), b.as_ptr(), c.as_ptr(), &mut ok, &mut err)
                    },
                    ok,
                    err,
                )
                .0
            },
        ];
        for code in codes {
            assert!(
                [KSHANA_OK, KSHANA_ERROR, KSHANA_BAD_ARGUMENT].contains(&code),
                "code {code} (an internal failure) for inputs {a:?} / {b:?} / {c:?}"
            );
        }
    }
}

/// Run one language example's command and check the same three lines as the C example.
#[cfg(target_os = "linux")]
fn expect_example(name: &str, cmd: &mut Command) {
    let out = cmd.output().unwrap_or_else(|e| panic!("{name}: {e}"));
    let text = String::from_utf8_lossy(&out.stdout).to_string();
    assert!(
        out.status.success(),
        "{name}: {text}{}",
        String::from_utf8_lossy(&out.stderr)
    );
    assert!(
        text.contains(&format!("kshana {}", env!("CARGO_PKG_VERSION"))),
        "{name}: {text}"
    );
    assert!(text.contains("records: 6"), "{name}: {text}");
    assert!(
        text.contains("null scenario: 2 (with reason)"),
        "{name}: {text}"
    );
}

/// Whether a tool runs; a missing one fails when KSHANA_REQUIRE_LANGS=1 (CI), else skips.
fn have(tool: &str, arg: &str) -> bool {
    let ok = Command::new(tool)
        .arg(arg)
        .output()
        .is_ok_and(|o| o.status.success());
    if !ok {
        assert!(
            std::env::var("KSHANA_REQUIRE_LANGS").as_deref() != Ok("1"),
            "{tool} is required (KSHANA_REQUIRE_LANGS=1)"
        );
        eprintln!("skipped: {tool} not available");
    }
    ok
}

#[cfg(target_os = "linux")]
#[test]
fn the_cpp_python_and_go_examples_run() {
    let dir = lib_dir();
    assert!(
        dir.join("libkshana_capi.a").is_file(),
        "build the libraries first: `cargo build`"
    );
    let crate_dir = Path::new(env!("CARGO_MANIFEST_DIR"));
    let args: Vec<PathBuf> = [
        "scenarios/link-budget.toml",
        "examples/connect/timing-monitor.connect.toml",
        "examples/obs/station.toml",
        "examples/connect/timing-monitor.csv",
    ]
    .iter()
    .map(|p| repo().join(p))
    .collect();
    let tmp =
        Path::new(env!("CARGO_TARGET_TMPDIR")).join(format!("capi-langs-{}", std::process::id()));
    std::fs::create_dir_all(&tmp).unwrap();
    let staticlib = dir.join("libkshana_capi.a").display().to_string();

    if have("c++", "--version") {
        let bin = tmp.join("run_and_map_cpp");
        let out = Command::new("c++")
            .args(["-std=c++17", "-Wall", "-Wextra", "-Werror", "-I"])
            .arg(crate_dir.join("include"))
            .arg(crate_dir.join("examples/cpp/run_and_map.cpp"))
            .args([staticlib.as_str(), "-lpthread", "-ldl", "-lm", "-o"])
            .arg(&bin)
            .output()
            .unwrap();
        assert!(
            out.status.success(),
            "c++: {}",
            String::from_utf8_lossy(&out.stderr)
        );
        expect_example("c++", Command::new(&bin).args(&args));
    }
    if have("python3", "--version") {
        expect_example(
            "python",
            Command::new("python3")
                .args(["-I", "-B"])
                .arg(crate_dir.join("examples/python/run_and_map.py"))
                .arg(dir.join("libkshana_capi.so"))
                .args(&args),
        );
    }
    if have("go", "version") {
        expect_example(
            "go",
            Command::new("go")
                .args(["run", "."])
                .args(&args)
                .current_dir(crate_dir.join("examples/go"))
                .env("CGO_ENABLED", "1")
                .env(
                    "CGO_CFLAGS",
                    format!("-I{}", crate_dir.join("include").display()),
                )
                .env("CGO_LDFLAGS", format!("{staticlib} -lpthread -ldl -lm"))
                .env("GOFLAGS", "-mod=mod")
                .env("GOCACHE", tmp.join("gocache"))
                .env("GOPATH", tmp.join("gopath")),
        );
    }
    let _ = std::fs::remove_dir_all(&tmp);
}
