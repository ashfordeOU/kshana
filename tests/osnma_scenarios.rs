// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana osnma scenario`: the bundled example scenarios meet their stated expectations
//! (which restate the assertions of `osnma_synthetic.rs` in the file format), a wrong
//! expectation is reported and exits 1, and malformed files are refused.

use kshana::osnma::scenario::{run, Scenario, FORMAT};
use std::path::PathBuf;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering::Relaxed};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn examples() -> Vec<PathBuf> {
    let dir = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("examples/osnma-scenarios");
    let mut v: Vec<PathBuf> = std::fs::read_dir(dir)
        .unwrap()
        .map(|e| e.unwrap().path())
        .filter(|p| p.extension().is_some_and(|e| e == "json"))
        .collect();
    v.sort();
    v
}

fn kshana(args: &[&str]) -> (i32, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).to_string() + &String::from_utf8_lossy(&out.stderr),
    )
}

#[test]
fn every_example_meets_its_expectations() {
    let files = examples();
    assert!(files.len() >= 10, "{files:?}");
    for f in files {
        let s = Scenario::from_json(&std::fs::read_to_string(&f).unwrap()).unwrap();
        assert_eq!(s.format, FORMAT);
        assert!(
            !s.expect.status.is_empty()
                || s.expect.overall.is_some()
                || !s.expect.events.is_empty()
                || s.expect.any_tag_failed.is_some(),
            "{} states no expectation",
            f.display()
        );
        let r = run(&s).unwrap();
        assert!(r.all_met, "{}: {:#?}", f.display(), r.checks);
        assert!(r.provenance.starts_with("MODELLED"));
    }
}

#[test]
fn the_changes_have_the_effects_the_synthetic_tests_show() {
    let get = |name: &str| {
        let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("examples/osnma-scenarios")
            .join(format!("{name}.json"));
        run(&Scenario::from_json(&std::fs::read_to_string(p).unwrap()).unwrap()).unwrap()
    };
    let clean = get("clean-stream");
    let flip = get("flipped-cross-authenticated-bit");
    assert_eq!(
        flip.tag_reasons.get("failed:tag_mismatch").copied(),
        Some(3)
    );
    assert!(flip.tags["authenticated"] < clean.tags["authenticated"]);
    let replay = get("replayed-tags");
    assert!(replay.tag_reasons.contains_key("failed:tag_mismatch"));
    let silent = get("cross-satellite-silent");
    assert!(silent.tag_reasons["pending:no_nav_data"] > clean.tag_reasons["pending:no_nav_data"]);
    assert_eq!(get("wrong-time-labels").events["key_rejected"], 18);
}

#[test]
fn the_command_line_runs_reports_and_exits_by_outcome() {
    let dir = std::env::temp_dir().join(format!(
        "kshana-osnma-scenario-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let (code, tpl) = kshana(&["osnma", "scenario", "template"]);
    assert_eq!(code, 0);
    let good = dir.join("good.json");
    std::fs::write(&good, &tpl).unwrap();
    let (code, text) = kshana(&["osnma", "scenario", "run", good.to_str().unwrap()]);
    assert_eq!(code, 0, "{text}");
    assert!(text.contains("overall: failed"), "{text}");
    assert!(text.contains("MODELLED"));
    let (code, json) = kshana(&["osnma", "scenario", "run", good.to_str().unwrap(), "--json"]);
    assert_eq!(code, 0);
    let v: serde_json::Value = serde_json::from_str(json.trim_start_matches(|c| c != '{')).unwrap();
    assert_eq!(v["format"], "kshana.osnma-scenario-run/1");
    assert_eq!(v["all_met"], true);

    let wrong = dir.join("wrong.json");
    std::fs::write(
        &wrong,
        tpl.replace("\"overall\": \"failed\"", "\"overall\": \"authenticated\""),
    )
    .unwrap();
    let (code, text) = kshana(&["osnma", "scenario", "run", wrong.to_str().unwrap()]);
    assert_eq!(code, 1, "{text}");
    assert!(text.contains("NOT MET"));

    let bad = dir.join("bad.json");
    std::fs::write(
        &bad,
        "{\"format\": \"kshana.osnma-scenario/1\", \"name\": \"x\", \"subframes\": 500}",
    )
    .unwrap();
    assert_eq!(
        kshana(&["osnma", "scenario", "run", bad.to_str().unwrap()]).0,
        2
    );
    assert_eq!(
        kshana(&[
            "osnma",
            "scenario",
            "run",
            dir.join("none.json").to_str().unwrap()
        ])
        .0,
        2
    );
    assert_eq!(
        kshana(&["osnma", "scenario", "run", good.to_str().unwrap(), "--nope"]).0,
        2
    );
    assert_eq!(kshana(&["osnma", "scenario", "--help"]).0, 0);
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn unknown_fields_are_refused() {
    let t = serde_json::to_value(kshana::osnma::scenario::template()).unwrap();
    let mut v = t.clone();
    v["expect"]["sttus"] = serde_json::json!({});
    assert!(Scenario::from_json(&v.to_string()).is_err());
    let mut v = t;
    v["changes"][0]["kind"] = serde_json::json!("transmit");
    assert!(Scenario::from_json(&v.to_string()).is_err());
}
