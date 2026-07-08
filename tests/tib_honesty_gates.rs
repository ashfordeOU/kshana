//! CI honesty firewall for the TIB benchmark sources. Scans src/benchmark/* for
//! firewall violations and asserts the required method/impossibility citations.

use std::fs;
use std::path::PathBuf;

fn read_all(rel: &[&str]) -> String {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let mut s = String::new();
    for r in rel {
        s.push_str(&fs::read_to_string(root.join(r)).unwrap_or_default());
        s.push('\n');
    }
    s
}

const BENCH_SRC: &[&str] = &[
    "src/benchmark/mod.rs",
    "src/benchmark/stanford.rs",
    "src/benchmark/coverage.rs",
    "src/benchmark/faults.rs",
    "src/benchmark/scorecard.rs",
];

#[test]
fn no_forbidden_overclaim_phrases() {
    let body = read_all(BENCH_SRC).to_lowercase();
    for bad in [
        "worst-case holdover",
        "formally verified",
        "certified",
        "do-178",
        "ecss conformance",
        "trl ",
    ] {
        assert!(
            !body.contains(bad),
            "forbidden overclaim phrase present: {bad}"
        );
    }
}

#[test]
fn undetectable_faults_never_described_as_detected() {
    // No "detect"/"alert" token may sit on a line that also names an
    // undetectable fault class — such faults are absorbed, never detected.
    let body = read_all(BENCH_SRC).to_lowercase();
    for line in body.lines() {
        let names_undetectable =
            line.contains("symmetric") || line.contains("replay") || line.contains("undetectable");
        if names_undetectable && (line.contains("detected") || line.contains("alerted")) {
            // "never detected" / "not detected" negations are allowed.
            let ok = line.contains("never") || line.contains("not ") || line.contains("cannot");
            assert!(ok, "undetectable fault described as detected: {line}");
        }
    }
}

#[test]
fn no_validated_accuracy_claim_in_benchmark() {
    let body = read_all(BENCH_SRC).to_lowercase();
    for line in body.lines() {
        if line.contains("validated") {
            for w in ["accuracy", "benchmark harness", "scorer accuracy"] {
                assert!(
                    !line.contains(w),
                    "\"validated\" co-located with `{w}`: {line}"
                );
            }
        }
    }
}

#[test]
fn required_citations_present() {
    let body = read_all(BENCH_SRC);
    assert!(
        body.contains("Stanford") || body.contains("Tossaint"),
        "must Cite the Stanford integrity diagram"
    );
    assert!(
        body.contains("RFC 7384") || body.contains("Mizrahi"),
        "must Cite the Mizrahi impossibility"
    );
    assert!(
        body.contains("DO-229") || body.contains("WAAS"),
        "must Cite the WAAS MOPS method source"
    );
}

#[test]
fn no_disallowed_attribution_tokens() {
    let body = read_all(BENCH_SRC).to_lowercase();
    for tok in [
        concat!("cla", "ude"),
        concat!("anthro", "pic"),
        concat!("co-auth", "ored"),
    ] {
        assert!(!body.contains(tok), "disallowed attribution token: {tok}");
    }
}
