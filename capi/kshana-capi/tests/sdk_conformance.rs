// SPDX-License-Identifier: AGPL-3.0-only
//! SDK conformance (roadmap 0.42 I9): every SDK runs the same three scenarios and the same Kshana
//! Connect mapping and gives the same bytes. The cases are `sdk/conformance/cases.txt`; the SHA-256 of
//! each output is pinned in `sdk/conformance/expected.sha256`. The reference is this crate's own entry
//! points, called through the C calling convention; then each language driver under `sdk/` writes the
//! four outputs and every file must equal the reference byte for byte.
//!
//! A driver whose toolchain is missing is skipped, unless CI asks for it: `KSHANA_REQUIRE_LANGS=1`
//! (C, C++, Python, Go) and `KSHANA_REQUIRE_SDKS=java,dotnet,julia` (any subset).

use kshana_capi::*;
use std::collections::BTreeMap;
use std::ffi::{c_char, CStr, CString};
use std::path::{Path, PathBuf};
use std::process::Command;

fn repo() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("../..")
}

fn sdk() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("sdk")
}

/// One line of `cases.txt`.
struct Case {
    out: String,
    entry: String,
    inputs: Vec<PathBuf>,
}

fn cases() -> Vec<Case> {
    let text = std::fs::read_to_string(sdk().join("conformance/cases.txt")).unwrap();
    text.lines()
        .filter(|l| !l.trim().is_empty() && !l.starts_with('#'))
        .map(|l| {
            let w: Vec<&str> = l.split_whitespace().collect();
            Case {
                out: w[0].to_string(),
                entry: w[1].to_string(),
                inputs: w[2..].iter().map(|p| repo().join(p)).collect(),
            }
        })
        .collect()
}

/// Copy a returned string out and free it; panics on a non-OK code.
fn take(code: i32, ok: *mut c_char, err: *mut c_char) -> Vec<u8> {
    let s = |p: *mut c_char| {
        (!p.is_null()).then(|| {
            // SAFETY: p came from this library and is freed right after.
            let v = unsafe { CStr::from_ptr(p) }.to_bytes().to_vec();
            unsafe { kshana_string_free(p) };
            v
        })
    };
    let (o, e) = (s(ok), s(err));
    assert_eq!(
        code,
        KSHANA_OK,
        "{}",
        String::from_utf8_lossy(&e.unwrap_or_default())
    );
    o.unwrap()
}

fn cstr(p: &Path) -> CString {
    CString::new(std::fs::read(p).unwrap()).unwrap()
}

/// The reference outputs: (file name, bytes) in `cases.txt` order.
fn reference() -> Vec<(String, Vec<u8>)> {
    cases()
        .iter()
        .map(|c| {
            let (mut ok, mut err) = (std::ptr::null_mut(), std::ptr::null_mut());
            let ins: Vec<CString> = c.inputs.iter().map(|p| cstr(p)).collect();
            // SAFETY: the inputs are valid C strings and the out-pointers are valid for one write.
            let code = unsafe {
                match (c.entry.as_str(), ins.as_slice()) {
                    ("run", [s]) => kshana_run_scenario(s.as_ptr(), &mut ok, &mut err),
                    ("map", [m, st, l]) => {
                        kshana_connect_map(m.as_ptr(), st.as_ptr(), l.as_ptr(), &mut ok, &mut err)
                    }
                    other => panic!("cases.txt: unknown entry or input count {:?}", other.0),
                }
            };
            (c.out.clone(), take(code, ok, err))
        })
        .collect()
}

fn pinned() -> BTreeMap<String, String> {
    std::fs::read_to_string(sdk().join("conformance/expected.sha256"))
        .unwrap_or_default()
        .lines()
        .filter_map(|l| {
            let (h, f) = l.split_once("  ")?;
            Some((f.trim().to_string(), h.to_string()))
        })
        .collect()
}

#[test]
fn the_reference_gives_the_pinned_digests() {
    let got: BTreeMap<String, String> = reference()
        .into_iter()
        .map(|(f, b)| (f, kshana::advanced_report::sha256_hex(&b)))
        .collect();
    if std::env::var("KSHANA_SDK_BLESS").as_deref() == Ok("1") {
        let text: String = cases()
            .iter()
            .map(|c| format!("{}  {}\n", got[&c.out], c.out))
            .collect();
        std::fs::write(sdk().join("conformance/expected.sha256"), text).unwrap();
        return;
    }
    assert_eq!(
        got,
        pinned(),
        "an SDK conformance output changed; after review, rewrite the digests with \
         KSHANA_SDK_BLESS=1 cargo test --test sdk_conformance"
    );
    // Three scenarios and one mapping, as the roadmap bar and the README say.
    let entries: Vec<String> = cases().into_iter().map(|c| c.entry).collect();
    assert_eq!(entries.iter().filter(|e| *e == "run").count(), 3);
    assert_eq!(entries.iter().filter(|e| *e == "map").count(), 1);
    // None of the outputs carries the engine version, so a release bump never moves a digest.
    for (f, b) in reference() {
        assert!(
            !String::from_utf8_lossy(&b).contains(env!("CARGO_PKG_VERSION")),
            "{f} carries the engine version; pick a case whose output does not"
        );
    }
}

/// Every driver the README lists exists, and every driver directory is in the README.
#[test]
fn the_sdk_readme_lists_every_driver() {
    let readme = std::fs::read_to_string(sdk().join("README.md")).unwrap();
    for (dir, file) in [
        ("c", "conformance.c"),
        ("cpp", "conformance.cpp"),
        ("python", "conformance.py"),
        ("go", "main.go"),
        ("java", "KshanaConformance.java"),
        ("csharp", "Kshana.cs"),
        ("julia", "conformance.jl"),
        ("matlab", "kshana_conformance.m"),
        ("labview", "README.md"),
    ] {
        assert!(sdk().join(dir).join(file).is_file(), "sdk/{dir}/{file}");
        assert!(
            readme.contains(&format!("({dir}/")),
            "sdk/README.md does not link sdk/{dir}/"
        );
    }
}

/// Whether a tool runs. A missing one fails when CI requires it, else the driver is skipped.
fn have(tool: &str, arg: &str, required: bool) -> bool {
    let ok = Command::new(tool)
        .arg(arg)
        .output()
        .is_ok_and(|o| o.status.success());
    if !ok {
        assert!(!required, "{tool} is required here but does not run");
        eprintln!("skipped: {tool} not available");
    }
    ok
}

fn required_sdk(name: &str) -> bool {
    std::env::var("KSHANA_REQUIRE_SDKS")
        .unwrap_or_default()
        .split(',')
        .any(|s| s.trim() == name)
}

fn required_lang() -> bool {
    std::env::var("KSHANA_REQUIRE_LANGS").as_deref() == Ok("1")
}

/// The Java feature release (21, 22, ...) of `java` on the path.
fn java_major() -> Option<u32> {
    let out = Command::new("java").arg("-version").output().ok()?;
    let text = String::from_utf8_lossy(&out.stderr).to_string();
    let v = text.split("version \"").nth(1)?.split('"').next()?;
    v.split(['.', '-', '+']).next()?.parse().ok()
}

/// The directory holding this build's libkshana_capi.a and shared library.
fn lib_dir() -> PathBuf {
    let exe = std::env::current_exe().unwrap();
    exe.parent().unwrap().parent().unwrap().to_path_buf()
}

/// Run one driver into a fresh directory and compare its four files with the reference.
fn check_driver(name: &str, out: &Path, cmd: &mut Command, reference: &[(String, Vec<u8>)]) {
    let run = cmd.output().unwrap_or_else(|e| panic!("{name}: {e}"));
    let text = String::from_utf8_lossy(&run.stdout);
    assert!(
        run.status.success(),
        "{name}: {text}{}",
        String::from_utf8_lossy(&run.stderr)
    );
    assert!(
        text.contains(&format!(
            "kshana {} conformance: 4 outputs written",
            env!("CARGO_PKG_VERSION")
        )),
        "{name}: {text}"
    );
    for (f, want) in reference {
        let got = std::fs::read(out.join(f)).unwrap_or_else(|e| panic!("{name}: {f}: {e}"));
        assert!(
            &got == want,
            "{name}: {f} differs from the reference ({} bytes against {})",
            got.len(),
            want.len()
        );
    }
    eprintln!("ok  {name}: the four outputs equal the reference byte for byte");
}

#[cfg(target_os = "linux")]
#[test]
fn every_sdk_driver_gives_the_reference_bytes() {
    let dir = lib_dir();
    assert!(
        dir.join("libkshana_capi.a").is_file(),
        "build the libraries first: `cargo build`"
    );
    let staticlib = dir.join("libkshana_capi.a").display().to_string();
    let shared = dir.join("libkshana_capi.so");
    let reference = reference();
    let inputs: Vec<PathBuf> = cases().into_iter().flat_map(|c| c.inputs).collect();
    let tmp =
        Path::new(env!("CARGO_TARGET_TMPDIR")).join(format!("sdk-conf-{}", std::process::id()));
    let _ = std::fs::remove_dir_all(&tmp);
    std::fs::create_dir_all(&tmp).unwrap();
    let include = Path::new(env!("CARGO_MANIFEST_DIR")).join("include");
    let fresh = |name: &str| {
        let d = tmp.join(name);
        std::fs::create_dir_all(&d).unwrap();
        d
    };
    let link = [staticlib.as_str(), "-lpthread", "-ldl", "-lm"];

    for (lang, compiler, std, src) in [
        ("c", "cc", "-std=c99", "c/conformance.c"),
        ("c++", "c++", "-std=c++17", "cpp/conformance.cpp"),
    ] {
        if !have(compiler, "--version", required_lang()) {
            continue;
        }
        let out = fresh(lang);
        let bin = tmp.join(format!("{lang}-driver"));
        let built = Command::new(compiler)
            .args([std, "-Wall", "-Wextra", "-Werror", "-I"])
            .arg(&include)
            .arg(sdk().join(src))
            .args(link)
            .arg("-o")
            .arg(&bin)
            .output()
            .unwrap();
        assert!(
            built.status.success(),
            "{lang}: {}",
            String::from_utf8_lossy(&built.stderr)
        );
        check_driver(
            lang,
            &out,
            Command::new(&bin).arg(&out).args(&inputs),
            &reference,
        );
    }
    if have("python3", "--version", required_lang()) {
        let out = fresh("python");
        check_driver(
            "python",
            &out,
            Command::new("python3")
                .args(["-I", "-B"])
                .arg(sdk().join("python/conformance.py"))
                .arg(&shared)
                .arg(&out)
                .args(&inputs),
            &reference,
        );
    }
    if have("go", "version", required_lang()) {
        let out = fresh("go");
        check_driver(
            "go",
            &out,
            Command::new("go")
                .args(["run", "."])
                .arg(&out)
                .args(&inputs)
                .current_dir(sdk().join("go"))
                .env("CGO_ENABLED", "1")
                .env("CGO_LDFLAGS", link.join(" "))
                .env("GOFLAGS", "-mod=mod")
                .env("GOCACHE", tmp.join("gocache"))
                .env("GOPATH", tmp.join("gopath")),
            &reference,
        );
    }
    // Java: the Foreign Function and Memory API is final from Java 22 and a preview in Java 21.
    match java_major() {
        Some(v) if v >= 21 => {
            let out = fresh("java");
            let mut cmd = Command::new("java");
            cmd.arg("--enable-native-access=ALL-UNNAMED");
            if v == 21 {
                cmd.args(["--enable-preview", "--source", "21"]);
            }
            check_driver(
                "java",
                &out,
                cmd.arg(sdk().join("java/KshanaConformance.java"))
                    .arg(&shared)
                    .arg(&out)
                    .args(&inputs),
                &reference,
            );
        }
        other => {
            assert!(
                !required_sdk("java"),
                "java 21 or later is required here (found {other:?})"
            );
            eprintln!("skipped: java 21 or later not available ({other:?})");
        }
    }
    if have("dotnet", "--version", required_sdk("dotnet")) {
        let out = fresh("dotnet");
        let proj = fresh("dotnet-project");
        for f in ["Kshana.cs", "Kshana.Conformance.csproj"] {
            std::fs::copy(sdk().join("csharp").join(f), proj.join(f)).unwrap();
        }
        check_driver(
            "dotnet",
            &out,
            Command::new("dotnet")
                .args(["run", "--project"])
                .arg(&proj)
                .arg("--")
                .arg(&shared)
                .arg(&out)
                .args(&inputs)
                .env("DOTNET_CLI_TELEMETRY_OPTOUT", "1")
                .env("DOTNET_NOLOGO", "1")
                .env("DOTNET_CLI_HOME", tmp.join("dotnet-home")),
            &reference,
        );
    }
    if have("julia", "--version", required_sdk("julia")) {
        let out = fresh("julia");
        check_driver(
            "julia",
            &out,
            Command::new("julia")
                .args(["--startup-file=no", "--history-file=no"])
                .arg(sdk().join("julia/conformance.jl"))
                .arg(&shared)
                .arg(&out)
                .args(&inputs),
            &reference,
        );
    }
    let _ = std::fs::remove_dir_all(&tmp);
}
