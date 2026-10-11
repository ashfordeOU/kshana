//! `kshana::surface::osnma_verify` (the Python and WebAssembly `osnma_verify`) against the command
//! line: the same verifier, so the same JSON report, and the same refusals.

use kshana::osnma::ADVISORY;
use kshana::surface::{osnma_verify, MAX_INPUT_BYTES};
use serde_json::Value;
use std::process::Command;

fn csv() -> String {
    let page = "00".repeat(30);
    format!("SVID,NumNavBits,NavBitsHEX\n02,480,{page}{page}\n03,240,{page}\n")
}

fn surface(input: &[u8], format: &str, start: Option<u32>, reference: Option<u32>) -> Value {
    let out = osnma_verify(
        input,
        format,
        start,
        "",
        &[],
        reference,
        None,
        MAX_INPUT_BYTES,
    )
    .unwrap();
    serde_json::from_str(&out).unwrap()
}

fn cli(extra: &[&str]) -> Value {
    // The sequence makes the directory unique per call: every test here shares the process id.
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir =
        std::env::temp_dir().join(format!("kshana-osnma-surface-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let f = dir.join("vectors.csv");
    std::fs::write(&f, csv()).unwrap();
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["osnma", "verify"])
        .arg(&f)
        .args(["--format", "vector-csv", "--start-gst", "1000", "--json"])
        .args(extra)
        .output()
        .unwrap();
    std::fs::remove_dir_all(&dir).ok();
    serde_json::from_slice(&out.stdout).unwrap()
}

/// The report minus the input's name, which is a path on the command line.
fn nameless(mut v: Value) -> Value {
    v["input"]["path"] = Value::Null;
    v
}

#[test]
fn the_report_matches_the_command_line() {
    let got = surface(csv().as_bytes(), "vector-csv", Some(1000), None);
    assert_eq!(nameless(got.clone()), nameless(cli(&[])));
    assert_eq!(got["advisory"], ADVISORY);
    assert_eq!(got["freshness_enforced"], false);
    assert_eq!(got["input"]["pages"], 3);
}

#[test]
fn a_reference_time_matches_the_command_line() {
    let got = surface(csv().as_bytes(), "", Some(1000), Some(1002));
    // Auto-detection picks the vector CSV by its header.
    assert_eq!(
        nameless(got.clone()),
        nameless(cli(&["--reference-time", "1002"]))
    );
    assert_eq!(got["freshness_enforced"], true);
    assert_eq!(got["reference_time"], 1002);
}

#[test]
fn bad_input_is_refused_with_the_command_lines_words() {
    let e = |format: &str, start, keys: &[String], root: &str, reference, max_err| {
        osnma_verify(
            csv().as_bytes(),
            format,
            start,
            root,
            keys,
            reference,
            max_err,
            MAX_INPUT_BYTES,
        )
        .unwrap_err()
    };
    assert!(e("vector-csv", None, &[], "", None, None).contains("needs --start-gst"));
    assert!(e("xml", Some(1), &[], "", None, None).contains("unknown format xml"));
    assert!(e("", Some(1), &[], "", None, Some(10))
        .contains("--max-time-error has no effect without --reference-time"));
    assert!(e("", Some(1), &[], "", Some(5), Some(30)).contains("below one sub-frame"));
    assert!(e("", Some(1), &[], "zz", None, None).contains("bad Merkle root hex"));
    assert!(e("", Some(1), &[], &"ab".repeat(31), None, None).contains("32 bytes"));
    assert!(e("", Some(1), &["7:p384:00".into()], "", None, None).contains("p256 or p521"));
    assert!(osnma_verify(b"xx", "pages", None, "", &[], None, None, 1)
        .unwrap_err()
        .contains("limit"));
}
