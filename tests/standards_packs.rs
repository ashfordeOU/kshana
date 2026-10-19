// SPDX-License-Identifier: AGPL-3.0-only
//! The standards packs (`kshana standards-pack`, `standards/<id>/`): every pack parses, every
//! scenario in it runs, and the outcome of every test is pinned so a change that moves a
//! result, or a bar that was missed, is visible in review.

use kshana::standards_pack as sp;

#[test]
fn every_pack_loads_and_runs_without_error() {
    for id in sp::ids() {
        let pack = sp::load(id).unwrap_or_else(|e| panic!("{id}: {e}"));
        assert!(!pack.tests.is_empty());
        let r = sp::run(id).unwrap();
        assert_eq!(r["summary"]["error"], 0, "{id}: {r}");
        assert_eq!(r["evidence_tier"], "MODELLED");
    }
}

#[test]
fn pinned_outcomes() {
    // (pack, test, status). A NOT MET is a result, not a failure of the suite: it is pinned
    // here, never ignored and never loosened.
    // Misses on record: L4-T1 (the all-RF layered stack falls to a ratio of about 1.2 at the
    // highest correlation, under the bar of 2.0: correlation defeats layering) and the four
    // IMO accuracy tests (a single-frequency-class 1 m ranging error does not hold the Table
    // C-1 vertical limits at 95 % of epochs; level A reaches about 27 %).
    let want: &[(&str, &str, &str)] = &[
        ("dhs-rpcf", "L1-T1", "MET"),
        ("dhs-rpcf", "L1-T2", "NEEDS INPUT"),
        ("dhs-rpcf", "L2-T1", "MET"),
        ("dhs-rpcf", "L2-T2", "MET"),
        ("dhs-rpcf", "L2-T3", "NEEDS INPUT"),
        ("dhs-rpcf", "L3-T1", "MET"),
        ("dhs-rpcf", "L3-T2", "MET"),
        ("dhs-rpcf", "L3-T3", "MET"),
        ("dhs-rpcf", "L4-T1", "NOT MET"),
        ("imo-circ-1575", "ACC-A", "NOT MET"),
        ("imo-circ-1575", "ACC-B", "NOT MET"),
        ("imo-circ-1575", "ACC-B-MULTI", "NOT MET"),
        ("imo-circ-1575", "ACC-B-HARBOUR", "NOT MET"),
        ("imo-circ-1575", "INT-CONSIST", "MET"),
        ("imo-circ-1575", "STATUS-1", "NEEDS INPUT"),
        ("imo-circ-1575", "INPUT-1", "NEEDS INPUT"),
        ("icao-doc9849-appf", "MON-1", "NEEDS INPUT"),
        ("icao-doc9849-appf", "ASSESS-1", "MET"),
        ("icao-doc9849-appf", "ASSESS-2", "MET"),
        ("icao-doc9849-appf", "ASSESS-3", "MET"),
        ("icao-doc9849-appf", "MIT-1", "MET"),
        ("icao-doc9849-appf", "MIT-2", "MET"),
        ("icao-doc9849-appf", "MIT-3", "MET"),
        ("icao-doc9849-appf", "REPORT-1", "NEEDS INPUT"),
    ];
    let mut got = Vec::new();
    for id in sp::ids() {
        let r = sp::run(id).unwrap();
        for t in r["tests"].as_array().unwrap() {
            got.push((
                id.to_string(),
                t["id"].as_str().unwrap().to_string(),
                t["status"].as_str().unwrap().to_string(),
            ));
        }
    }
    let got: Vec<(&str, &str, &str)> = got
        .iter()
        .map(|(a, b, c)| (a.as_str(), b.as_str(), c.as_str()))
        .collect();
    assert_eq!(got, want, "{got:#?}");
}

#[test]
fn bars_are_stated_before_the_run_and_the_notice_travels_with_every_report() {
    for id in sp::ids() {
        let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("standards")
            .join(id);
        assert!(
            root.join("PREREGISTRATION.md").exists(),
            "{id} has no pre-registration"
        );
        let r = sp::run(id).unwrap();
        assert!(r["advisory"].as_str().unwrap().starts_with("Advisory"));
        assert!(r["statement"]
            .as_str()
            .unwrap()
            .contains("supports evidence for"));
    }
}

#[test]
fn committed_pack_tables_are_current() {
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
    for (id, doc) in [
        ("dhs-rpcf", "docs/compliance/dhs-rpcf-test-profiles.md"),
        ("imo-circ-1575", "docs/compliance/imo-circ-1575.md"),
        ("icao-doc9849-appf", "docs/compliance/icao-doc9849-appf.md"),
    ] {
        let text = std::fs::read_to_string(root.join(doc)).unwrap();
        let pack = sp::load(id).unwrap();
        for (name, body) in [
            ("tests", sp::tests_markdown(&pack)),
            ("rows", sp::rows_markdown(&pack)),
        ] {
            if name == "rows" && pack.rows.is_empty() {
                continue;
            }
            let a = format!("<!-- pack-{name}:start -->\n");
            let b = format!("<!-- pack-{name}:end -->");
            let i = text
                .find(&a)
                .unwrap_or_else(|| panic!("{doc}: no {name} start marker"))
                + a.len();
            let j = text
                .find(&b)
                .unwrap_or_else(|| panic!("{doc}: no {name} end marker"));
            assert_eq!(
                &text[i..j],
                body,
                "{doc} {name} table is stale; regenerate with `kshana standards-pack {name} {id}`"
            );
        }
    }
}

#[test]
fn a_pack_report_feeds_the_compliance_report_without_marking_any_row_met() {
    use kshana::compliance::{assess_texts, RunInput};
    let r = sp::run("imo-circ-1575").unwrap();
    let text = serde_json::to_string(&r).unwrap();
    let report = assess_texts(&[RunInput {
        label: "imo.pack.json",
        result_json: &text,
        scenario_toml: None,
    }]);
    assert!(report.unrecognised.is_empty(), "{:?}", report.unrecognised);
    assert_eq!(report.standards_packs.len(), 1);
    let f = &report.standards_packs[0];
    assert_eq!((f.met, f.not_met, f.needs_input), (1, 4, 2));
    let acc = f.rows.iter().find(|x| x.id == "IMO-1575-ACC").unwrap();
    assert_eq!(acc.outcome, "a stated bar not met");
    let md = report.to_markdown();
    assert!(md.contains("Standards packs, as the runs state them"));
    // Wording rule: no row is called met, and the banned stems stay out of the output.
    let low = md.to_lowercase().replace("conformance framework", "");
    for b in ["certif", "complies", "compliant", "conform"] {
        assert!(!low.contains(b), "{b}");
    }
    // A malformed report (no tests) is not used.
    let bad = assess_texts(&[RunInput {
        label: "bad.json",
        result_json: "{\"schema\": \"kshana.standards-pack-report/1\"}",
        scenario_toml: None,
    }]);
    assert!(bad.standards_packs.is_empty());
}
