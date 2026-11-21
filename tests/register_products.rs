// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana register-products`: entries against their signed packs, a published JSON-lines
//! revocation list (a revoked entry shows as REVOKED) and the append-only rule. The fixtures in
//! tests/fixtures/register_products/ are synthetic: registers signed with a throwaway key whose
//! private half was never kept, and a copy of an evidence-pack oracle fixture as the pack.

use serde_json::Value;
use std::process::Command;

const D: &str = "tests/fixtures/register_products/";

fn run(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("register-products")
        .args(args)
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .output()
        .expect("run kshana");
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).into_owned(),
        String::from_utf8_lossy(&out.stderr).into_owned(),
    )
}

fn f(n: &str) -> String {
    format!("{D}{n}")
}

#[test]
fn a_revoked_entry_shows_as_revoked() {
    let (code, out, err) = run(&[
        "show",
        &f("register-v1.json"),
        "--revocations",
        &f("revoked.jsonl"),
        "--date",
        "2026-11-20",
    ]);
    assert_eq!(code, 1, "{err}");
    let revoked: Vec<&str> = out.lines().filter(|l| l.starts_with("REVOKED")).collect();
    assert_eq!(revoked.len(), 1, "{out}");
    assert!(revoked[0].contains("example-receiver-2"));
    let (_, out, _) = run(&[
        "show",
        &f("register-v1.json"),
        "--revocations",
        &f("revoked.jsonl"),
        "--date",
        "2026-11-20",
        "--json",
    ]);
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["rows"][1]["status"], "revoked");
    assert_eq!(v["rows"][1]["scenario_set_version"], "2.1.0");
    // Before the revocation date the entry stands; without a list revocation is unknown.
    let (code, out, _) = run(&[
        "show",
        &f("register-v1.json"),
        "--revocations",
        &f("revoked.jsonl"),
        "--date",
        "2026-11-05",
    ]);
    assert_eq!(code, 0);
    assert!(!out.contains("REVOKED"));
}

#[test]
fn packs_verify_and_versions_are_append_only() {
    let (code, out, err) = run(&[
        "verify",
        &f("register-v1.json"),
        "--packs",
        &f("packs"),
        "--json",
    ]);
    assert_eq!(code, 0, "{err}");
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["checks"][0]["result"], "verified");
    assert_eq!(v["checks"][1]["result"], "no-digest");
    let (code, out, _) = run(&["diff", &f("register-v1.json"), &f("register-v2.json")]);
    assert_eq!(code, 0);
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["added"][0], "example-receiver-3");
    let (code, out, _) = run(&[
        "diff",
        &f("register-v2.json"),
        &f("register-v3-edited.json"),
    ]);
    assert_eq!(code, 1);
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["changed"][0], "example-receiver-1");
    assert_eq!(v["removed"].as_array().unwrap().len(), 2);
}

#[test]
fn usage_errors_exit_2() {
    for args in [
        &["show"][..],
        &["show", "no/such.json"],
        &[
            "show",
            "tests/fixtures/register_products/register-v1.json",
            "--revocations",
            "Cargo.toml",
        ],
        &[
            "show",
            "tests/fixtures/register_products/register-v1.json",
            "--revocations",
            "ftp://x",
        ],
        &[
            "verify",
            "tests/fixtures/register_products/register-v1.json",
            "--pack-key",
            "zz",
        ],
        &["diff", "x"],
        &["fly"],
        &[],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
}
