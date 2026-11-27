// SPDX-License-Identifier: AGPL-3.0-only
//! Continuous-UTC readiness scanner (CGPM 2026 Resolution 5: continuous UTC effective
//! 2027-05-20) on the synthetic fixtures in tests/fixtures/utc-readiness: expired and stale
//! leap-second tables, NTP and chrony leap handling, hard-coded TAI-UTC and GPS-UTC, a 0.9 s
//! DUT1 check; the CLI's JSON, text and exit codes.

use std::path::{Path, PathBuf};
use std::process::Command;

use kshana::utc_readiness::{parse_date, scan_paths, scan_text, EFFECTIVE_DATE, FORMAT};

fn fixtures() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/utc-readiness")
}

fn as_of() -> i64 {
    parse_date("2026-11-27").unwrap()
}

fn has(r: &kshana::utc_readiness::Report, file: &str, rule: &str, class: &str) -> bool {
    r.findings
        .iter()
        .any(|f| f.file.ends_with(file) && f.rule == rule && f.class == class)
}

#[test]
fn fixtures_give_each_rule() {
    let r = scan_paths(&[fixtures()], as_of());
    assert_eq!(r.format, FORMAT);
    assert_eq!(r.effective_date, "2027-05-20");
    assert!(r.source.contains("resolution-5"));
    assert_eq!(r.files_scanned, 8);
    for (file, rule, class) in [
        ("etc/leap-seconds.list", "leap-file-expiry", "breaks"),
        ("etc/leap-seconds-stale.list", "leap-file-expiry", "breaks"),
        ("etc/leap-seconds-stale.list", "leap-file-stale", "drifts"),
        ("etc/leapseconds", "leap-file-expiry", "review"),
        ("etc/leapseconds", "leap-second-label", "review"),
        ("etc/ntp.conf", "leap-handling", "review"),
        ("etc/chrony.conf", "leap-handling", "review"),
        ("app/timeconv.py", "tai-utc-constant", "holds"),
        ("app/timeconv.py", "tai-utc-constant", "drifts"),
        ("app/timeconv.py", "gps-utc-constant", "holds"),
        ("app/timeconv.py", "dut1-limit", "breaks"),
        ("app/station.toml", "dut1-field", "review"),
        ("app/station.toml", "leap-feed", "review"),
    ] {
        assert!(
            has(&r, file, rule, class),
            "{file} {rule} {class}: {:#?}",
            r.findings
        );
    }
    assert!(!r.findings.iter().any(|f| f.file.ends_with("clean.txt")));
    assert!(!r.findings.iter().any(|f| f.excerpt.contains("OLD_TAI_UTC")));
    let text = serde_json::to_string(&r).unwrap();
    for w in ["leap seconds abolished", "leap hour"] {
        assert!(!text.to_lowercase().contains(w), "{w}");
    }
}

#[test]
fn expiry_is_judged_against_the_date_given() {
    let t = "#@\t3991593600\n";
    // 2026-06-28: expired in November 2026, still valid (review) in January 2026.
    assert_eq!(scan_text("x", t, as_of())[0].class, "breaks");
    assert_eq!(
        scan_text("x", t, parse_date("2026-01-01").unwrap())[0].class,
        "review"
    );
    assert!(scan_text("x", t, as_of())[0]
        .message
        .contains(EFFECTIVE_DATE));
}

#[test]
fn dut1_limits_and_fields() {
    let f = scan_text(
        "c.c",
        "if (fabs(ut1_utc) >= .9) return -1;\nint dut1_tenths;\n",
        as_of(),
    );
    assert_eq!(f[0].rule, "dut1-limit");
    assert_eq!(f[1].rule, "dut1-field");
    assert!(scan_text("c.c", "double dut1 = 10.9;\n", as_of())[0].rule == "dut1-field");
}

#[test]
fn cli_json_text_and_exit_codes() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let out = Command::new(bin)
        .args(["utc-readiness", "--json", "--as-of", "2026-11-27"])
        .arg(fixtures())
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(1), "a breaks finding exits 1");
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["format"], FORMAT);
    assert!(v["counts"]["breaks"].as_u64().unwrap() >= 3);
    let clean = fixtures().join("app/clean.txt");
    let out = Command::new(bin)
        .args(["utc-readiness", "--as-of", "2026-11-27"])
        .arg(&clean)
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(0));
    assert!(String::from_utf8_lossy(&out.stdout).contains("summary: effective_date=2027-05-20"));
    let out = Command::new(bin).args(["utc-readiness"]).output().unwrap();
    assert_eq!(out.status.code(), Some(2));
    let out = Command::new(bin)
        .args(["utc-readiness", "/nonexistent/path/x"])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(2));
}
