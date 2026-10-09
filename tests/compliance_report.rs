// SPDX-License-Identifier: AGPL-3.0-only
//! The compliance mapping and `kshana compliance-report`, on synthetic runs only.

use kshana::compliance::mapping::{self, Framework, CAPABILITIES};
use kshana::compliance::{assess, load_runs, Run, Status, STATEMENT};
use serde_json::json;
use std::path::PathBuf;

fn repo() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

/// Words the wording rule forbids anywhere in generated or committed mapping text.
const BANNED: [&str; 4] = ["certifies", "complies", "compliant", "conformant"];

fn run(label: &str, kind: &str, json: serde_json::Value) -> Run {
    Run {
        label: label.into(),
        kind: kind.into(),
        json,
    }
}

fn trust_result(epochs: u64, detected: u64, evaluable: u64) -> serde_json::Value {
    json!({
        "scenario_hash": "0123456789abcdef0123",
        "label": "synthetic",
        "log": {"format": "nmea", "epochs": epochs},
        "monitors_run": ["cn0"],
        "events_evaluable": evaluable,
        "events_detected": detected,
        "predictions_evaluable": 1,
        "predictions_agreeing": 1,
    })
}

fn status_of(r: &kshana::compliance::Report, id: &str) -> Status {
    r.rows.iter().find(|x| x.id == id).expect(id).status
}

#[test]
fn mapping_is_well_formed() {
    let rows = mapping::rows();
    let mut ids: Vec<&str> = rows.iter().map(|r| r.id).collect();
    ids.sort();
    let n = ids.len();
    ids.dedup();
    assert_eq!(ids.len(), n, "row ids are unique");
    for fw in Framework::ALL {
        assert!(rows.iter().any(|r| r.framework == fw), "{fw:?} has rows");
        assert!(mapping::SOURCES.iter().any(|s| s.framework == fw));
    }
    for r in &rows {
        for c in r.capabilities {
            assert!(
                CAPABILITIES.iter().any(|k| k.id == *c),
                "{} names {c}",
                r.id
            );
        }
        assert!(!r.gap.is_empty(), "{} states a gap", r.id);
        // A paraphrase, not a pasted clause: a row's ask stays short.
        assert!(r.asks.len() < 400, "{} ask is {} bytes", r.id, r.asks.len());
    }
    for s in mapping::SOURCES {
        assert!(s.url.starts_with("https://"));
        assert!(s.version.len() > 5 && !s.checked.is_empty());
    }
}

#[test]
fn wording_rule_holds_in_mapping_report_and_docs() {
    let r = assess(&[run("a", "spoof-detect", json!({"x": 1}))], vec![]);
    let mut texts = vec![r.to_markdown(), r.to_json()];
    for fw in Framework::ALL {
        texts.push(mapping::framework_table_md(fw));
        texts.push(mapping::sources_md(fw));
        texts.push(
            std::fs::read_to_string(repo().join(format!("docs/compliance/{}.md", fw.id())))
                .expect("framework doc"),
        );
    }
    for t in &texts {
        let low = t.to_lowercase();
        for b in BANNED {
            assert!(!low.contains(b), "forbidden word {b:?}");
        }
    }
    assert!(r.to_markdown().contains("support evidence for"));
}

#[test]
fn committed_tables_and_sources_are_current() {
    for fw in Framework::ALL {
        let doc = std::fs::read_to_string(repo().join(format!("docs/compliance/{}.md", fw.id())))
            .unwrap();
        let a = doc.find("<!-- mapping:start -->\n").expect("start marker") + 23;
        let b = doc.find("<!-- mapping:end -->").expect("end marker");
        assert_eq!(
            &doc[a..b],
            mapping::framework_table_md(fw),
            "docs/compliance/{}.md is stale; regenerate with `kshana compliance-report --mapping`",
            fw.id()
        );
        for s in mapping::SOURCES.iter().filter(|s| s.framework == fw) {
            assert!(doc.contains(s.url), "{} cites {}", fw.id(), s.url);
            assert!(doc.contains(s.version), "{} states {}", fw.id(), s.version);
        }
    }
}

#[test]
fn empty_set_evidences_nothing() {
    let r = assess(&[], vec![]);
    assert!(r.runs.is_empty());
    for row in &r.rows {
        assert!(
            matches!(row.status, Status::NotEvidenced | Status::OutOfScope),
            "{}",
            row.id
        );
    }
    assert!(r
        .to_markdown()
        .contains("None. Every row below is therefore not evidenced."));
}

#[test]
fn statuses_follow_the_runs_present() {
    let runs = vec![
        run(
            "integrity.result.json",
            "integrity",
            json!({"samples_total": 10}),
        ),
        run(
            "trust.result.json",
            "receiver-trust",
            trust_result(120, 1, 1),
        ),
        run(
            "detect.result.json",
            "spoof-detect",
            json!({"scenario_hash": "abcdefabcdef1234", "verdict": "x"}),
        ),
    ];
    let r = assess(&runs, vec![]);
    // IMO A.1046 harbour row names only integrity monitoring: evidenced.
    assert_eq!(status_of(&r, "IMO-A1046-3"), Status::Evidenced);
    // DHS L2 R4 names spoofing detection, receiver-log trust and integrity: all present.
    assert_eq!(status_of(&r, "DHS-L2-R4"), Status::Evidenced);
    // DHS L2 R5 names holdover and receiver-log trust: only the second is present.
    assert_eq!(status_of(&r, "DHS-L2-R5"), Status::PartlyEvidenced);
    let row = r.rows.iter().find(|x| x.id == "DHS-L2-R5").unwrap();
    assert_eq!(row.missing_capabilities, ["holdover"]);
    // NIS2 21(2)(c) names holdover and source diversity: neither is present.
    assert_eq!(status_of(&r, "NIS2-21-2-c"), Status::NotEvidenced);
    // Rows no Kshana output speaks to stay out of scope however many runs there are.
    assert_eq!(status_of(&r, "DHS-L1-R1"), Status::OutOfScope);
    assert_eq!(status_of(&r, "NIS2-21-2-d"), Status::OutOfScope);
    // Provenance counts the runs whose result carries a hash.
    let prov = r
        .capabilities
        .iter()
        .find(|c| c.id == "run-provenance")
        .unwrap();
    assert_eq!(prov.runs, ["trust.result.json", "detect.result.json"]);
    // Evidenced rows keep their gap.
    let g = r.rows.iter().find(|x| x.id == "IMO-A1046-3").unwrap();
    assert!(!g.gap.is_empty());
}

#[test]
fn a_receiver_log_with_no_epochs_or_an_empty_result_is_not_evidence() {
    let r = assess(
        &[
            run("empty-log", "receiver-trust", trust_result(0, 0, 0)),
            run("empty-result", "integrity", json!({})),
            run("not-an-object", "spoof-detect", json!([1, 2])),
        ],
        vec![],
    );
    assert!(r
        .capabilities
        .iter()
        .all(|c| c.runs.is_empty() || c.id == "run-provenance"));
    assert_eq!(status_of(&r, "IMO-A1046-3"), Status::NotEvidenced);
}

#[test]
fn receiver_trust_counts_are_reported_as_the_run_states_them() {
    let r = assess(
        &[run("t", "receiver-trust", trust_result(300, 2, 3))],
        vec![],
    );
    assert_eq!(r.receiver_trust.len(), 1);
    let f = &r.receiver_trust[0];
    assert_eq!(
        (f.epochs, f.events_detected, f.events_evaluable),
        (300, 2, 3)
    );
    assert!(r
        .to_markdown()
        .contains("| t | nmea | 300 | 2 / 3 | 1 / 1 |"));
}

#[test]
fn json_report_parses_and_carries_the_statement() {
    let r = assess(
        &[run("a", "integrity", json!({"k": 1}))],
        vec!["bad.json: not JSON".into()],
    );
    let v: serde_json::Value = serde_json::from_str(&r.to_json()).expect("valid JSON");
    assert_eq!(v["statement"], STATEMENT);
    assert_eq!(v["unrecognised"][0], "bad.json: not JSON");
    assert_eq!(v["rows"].as_array().unwrap().len(), mapping::rows().len());
    assert!(v["rows"][0]["status"].is_string());
    assert_eq!(v["runs"][0]["kind"], "integrity");
}

#[test]
fn load_runs_finds_kinds_and_reports_what_it_cannot_use() {
    let dir = std::env::temp_dir().join(format!("kshana-compliance-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let w = |name: &str, body: &str| {
        let p = dir.join(name);
        std::fs::write(&p, body).unwrap();
        p
    };
    w("a.toml", "kind = \"integrity\"\n");
    let a = w("a.result.json", "{\"samples_total\": 3}");
    let t = w("trust.result.json", &trust_result(10, 0, 0).to_string());
    let k = w(
        "k.result.json",
        "{\"kind\": \"conflict-resilience\", \"x\": 1}",
    );
    let orphan = w("orphan.result.json", "{\"x\": 1}");
    let bad = w("bad.result.json", "not json");
    let missing = dir.join("missing.result.json");
    let (runs, bad_list) = load_runs(&[a, t, k, orphan, bad, missing]);
    let kinds: Vec<(&str, &str)> = runs
        .iter()
        .map(|r| (r.label.as_str(), r.kind.as_str()))
        .collect();
    assert_eq!(
        kinds,
        [
            ("a.result.json", "integrity"),
            ("trust.result.json", "receiver-trust"),
            ("k.result.json", "conflict-resilience")
        ]
    );
    assert_eq!(bad_list.len(), 3, "{bad_list:?}");
    assert!(bad_list
        .iter()
        .any(|b| b.starts_with("orphan.result.json: scenario kind not found")));
    assert!(bad_list.iter().any(|b| b.contains("not JSON")));
    assert!(bad_list.iter().any(|b| b.contains("cannot read")));
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn engine_runs_feed_the_report_end_to_end() {
    // Real runs of bundled synthetic scenarios, not hand-written JSON.
    let spoof = std::fs::read_to_string(repo().join("scenarios/spoof-detect.toml")).unwrap();
    let integ = std::fs::read_to_string(repo().join("scenarios/integrity-raim.toml")).unwrap();
    let s = kshana::api::run_toml(&spoof).unwrap();
    let i = kshana::api::run_toml(&integ).unwrap();
    let mut scn: kshana::receiver_trust::scenario::ReceiverTrustScenario = toml::from_str(
        &std::fs::read_to_string(repo().join("examples/receiver-trust/session.toml")).unwrap(),
    )
    .unwrap();
    kshana::receiver_trust::scenario::resolve_paths(
        &mut scn,
        &repo().join("examples/receiver-trust"),
    );
    let t = kshana::receiver_trust::scenario::run_scenario(&scn).unwrap();
    let runs = vec![
        run(
            "spoof",
            "spoof-detect",
            serde_json::from_str(&s.json).unwrap(),
        ),
        run(
            "integrity",
            "integrity",
            serde_json::from_str(&i.json).unwrap(),
        ),
        run(
            "trust",
            "receiver-trust",
            serde_json::from_str(&t.json).unwrap(),
        ),
    ];
    let r = assess(&runs, vec![]);
    assert_eq!(status_of(&r, "DHS-L2-R4"), Status::Evidenced);
    assert_eq!(r.receiver_trust.len(), 1);
    assert!(r.receiver_trust[0].epochs > 0);
    // The receiver-trust result is recognised from its content alone.
    let dir = std::env::temp_dir().join(format!("kshana-compliance-e2e-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let p = dir.join("session.result.json");
    std::fs::write(&p, &t.json).unwrap();
    let (loaded, bad) = load_runs(&[p]);
    assert!(bad.is_empty(), "{bad:?}");
    assert_eq!(loaded[0].kind, "receiver-trust");
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn test_bench_export_scores_through_receiver_trust_and_into_the_report() {
    // The loop docs/TEST-BENCH.md describes, end to end on synthetic data: export a
    // scenario's motion and events, treat the NMEA as the receiver's log, score it against
    // the exported events, and fill the report from that result.
    use kshana::interop::testbench;
    let src = std::fs::read_to_string(repo().join("scenarios/gnss-ins.toml")).unwrap();
    let t = testbench::trajectory_of(&src, None).unwrap();
    let nmea = testbench::write_nmea(&t);
    let events = testbench::write_events_toml(&t);
    let scn: kshana::receiver_trust::scenario::ReceiverTrustScenario = toml::from_str(&format!(
        "[log]\nformat = \"nmea\"\ntext = {nmea:?}\n\n[monitors]\ncalibration_s = 30.0\n\n{events}"
    ))
    .expect("scenario");
    let out = kshana::receiver_trust::scenario::run_scenario(&scn).expect("scored");
    let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
    assert_eq!(
        v["log"]["epochs"].as_u64().unwrap() as usize,
        t.samples.len()
    );
    let r = assess(&[run("bench", "receiver-trust", v.clone())], vec![]);
    assert_eq!(r.receiver_trust.len(), 1);
    // The exported event reached the scorer under its exported label and window.
    let ev = &v["events"][0];
    assert_eq!(ev["label"], "gnss-denied-1");
    assert_eq!(ev["onset_s"].as_f64().unwrap(), t.events[0].onset_s);
    assert!(ev["outcome"].is_string());
}
