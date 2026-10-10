// SPDX-License-Identifier: AGPL-3.0-only
//! Do the references in the compliance mapping resolve in the public documents they cite?
//!
//! The mapping (`src/compliance/mapping.rs`) is a judgement and cannot be validated as
//! correct. What can be checked against the outside is narrow, and this checks exactly that:
//!
//! 1. every row's reference (a clause, section, paragraph, heading or list letter) exists in
//!    the cited document, against a committed index of that document's headings and numbered
//!    paragraphs (`tests/fixtures/compliance/headings.json`, ids and short headings only, no
//!    body text) extracted by `scripts/gen_compliance_refs.py` with rules that list everything
//!    of the kind, not only what is cited;
//! 2. the row's reference string equals the one the index was checked against
//!    (`citations.json`), so editing a reference without re-checking it fails; and
//! 3. every URL the mapping cites resolved when checked, on the date recorded
//!    (`url_check.json`).
//!
//! The acceptance rule was written before the index was first compared with the mapping and is
//! not loosened: a reference either resolves or the test fails and the reference is corrected.
//!
//! ## What is not checked
//!
//! That a paraphrase is faithful, that a row maps to the right Kshana capability, that the
//! gap column is complete, or that a clause means what the mapping says. EN 16803 is a paid
//! standard: only its catalogue pages are read, so its clause numbers resolve only to the
//! catalogue's own mention of them. The index is a transcription made by a script from the
//! documents as fetched on the date recorded; it does not follow later revisions.
//!
//! PIN-SCOPE:    the SHA-256 of each document's bytes in `headings.json`, which says which
//!               bytes the index was extracted from
//! PIN-EXCLUDES: the documents' body text, which is not stored

use kshana::compliance::mapping::{rows, SOURCES};
use serde_json::Value;
use std::path::PathBuf;

fn fixture(name: &str) -> Value {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/compliance")
        .join(name);
    let text = std::fs::read_to_string(&p).unwrap_or_else(|e| {
        panic!(
            "read {}: {e}; run scripts/gen_compliance_refs.py (see its header)",
            p.display()
        )
    });
    serde_json::from_str(&text).expect("fixture parses")
}

fn anchor_resolves(doc: &Value, anchor: &str) -> bool {
    if let Some(want) = anchor.strip_prefix("catalogue:") {
        return doc["catalogue"]["mentions"]
            .as_array()
            .is_some_and(|m| m.iter().any(|x| x == want));
    }
    let (id, words) = anchor.split_once('|').unwrap_or((anchor, ""));
    doc["entries"].as_array().is_some_and(|es| {
        es.iter().any(|e| {
            e["id"] == id
                && e["heading"]
                    .as_str()
                    .unwrap_or("")
                    .to_lowercase()
                    .contains(&words.to_lowercase())
        })
    })
}

#[test]
fn every_row_has_a_citation_record_with_its_exact_reference() {
    let c = fixture("citations.json");
    let recs = c["rows"].as_array().unwrap();
    let rows = rows();
    assert_eq!(
        recs.len(),
        rows.len(),
        "one citation record per mapping row"
    );
    for r in &rows {
        let rec = recs
            .iter()
            .find(|x| x["row"] == r.id)
            .unwrap_or_else(|| panic!("{}: no citation record", r.id));
        assert_eq!(
            rec["reference"], r.reference,
            "{}: the reference changed since it was checked; rerun scripts/gen_compliance_refs.py",
            r.id
        );
        assert!(!rec["anchors"].as_array().unwrap().is_empty(), "{}", r.id);
    }
}

#[test]
fn every_cited_reference_resolves_in_the_cited_document() {
    let c = fixture("citations.json");
    let h = fixture("headings.json");
    let docs = h["documents"].as_object().unwrap();
    let mut checked = 0;
    let mut failures = Vec::new();
    for rec in c["rows"].as_array().unwrap() {
        let id = rec["document"].as_str().unwrap();
        let doc = docs
            .get(id)
            .unwrap_or_else(|| panic!("{id}: not in the index"));
        for a in rec["anchors"].as_array().unwrap() {
            let a = a.as_str().unwrap();
            checked += 1;
            if !anchor_resolves(doc, a) {
                failures.push(format!(
                    "{} ({}): {a:?} not found in {id}",
                    rec["row"], rec["reference"]
                ));
            }
        }
    }
    assert!(checked >= 40, "only {checked} anchors checked");
    assert!(
        failures.is_empty(),
        "unresolved references:\n{}",
        failures.join("\n")
    );
}

#[test]
fn the_index_is_not_vacuous_and_holds_headings_only() {
    let h = fixture("headings.json");
    let docs = h["documents"].as_object().unwrap();
    for (id, d) in docs {
        assert_eq!(d["sha256"].as_str().unwrap().len(), 64, "{id}");
        assert!(d["bytes"].as_u64().unwrap() > 1000, "{id}");
        let entries = d["entries"].as_array().unwrap();
        if id.starts_with("en16803") {
            assert!(
                entries.is_empty() && d["catalogue"]["mentions"].is_array(),
                "{id}"
            );
            continue;
        }
        assert!(entries.len() >= 4, "{id}: {} entries", entries.len());
        for e in entries {
            let t = e["heading"].as_str().unwrap();
            // A heading, not a sentence of body text.
            assert!(t.len() <= 110 && !t.contains(". "), "{id}: {t:?}");
            assert!(
                e.as_object().unwrap().len() == 2,
                "{id}: only id and heading are stored"
            );
        }
    }
}

#[test]
fn every_cited_url_resolved_and_the_check_is_dated() {
    let u = fixture("url_check.json");
    let checks = u["urls"].as_array().unwrap();
    for s in SOURCES {
        let c = checks
            .iter()
            .find(|x| x["url"] == s.url)
            .unwrap_or_else(|| panic!("{}: no URL check", s.url));
        let date = c["checked"].as_str().unwrap();
        assert!(
            date.len() == 10 && date.starts_with("20") && date.as_bytes()[4] == b'-',
            "{}: bad date {date}",
            s.url
        );
        let ok = c["status"]
            .as_u64()
            .is_some_and(|st| (200..300).contains(&(st as usize)) && c["bytes"].as_u64() > Some(0));
        let second = c["second_route"]["result"]
            .as_str()
            .is_some_and(|r| !r.is_empty());
        assert!(
            ok || second,
            "{}: did not resolve (status {}) and no second route recorded",
            s.url,
            c["status"]
        );
    }
}

#[test]
fn each_indexed_document_is_one_the_mapping_cites() {
    let h = fixture("headings.json");
    for (id, d) in h["documents"].as_object().unwrap() {
        let from = d["read_from"].as_str().unwrap();
        assert!(
            SOURCES.iter().any(|s| from.contains(s.url)),
            "{id}: read_from names no URL the mapping cites: {from}"
        );
    }
}

#[test]
fn a_reference_that_is_not_in_the_document_does_not_resolve() {
    // Negative controls: the check can fail. Each of these is a plausible wrong citation,
    // including the labels an earlier version of the mapping used for the EASA bulletin, which
    // are descriptive names, not the bulletin's headings.
    let h = fixture("headings.json");
    let docs = h["documents"].as_object().unwrap();
    let bad = [
        ("dhs-rpcf", "9.9|Anything"),
        ("dhs-rpcf", "L5R9"),
        ("dhs-rpcf", "5.2|Common Mode"), // right number, wrong heading
        ("easa-sib", "Recommendations to air operators (spoofing)"),
        ("easa-sib", "Reporting"),
        ("imo-401", "4.9"),
        ("imo-1644", "9"),
        ("nis2", "21(2)(k)"),
        ("nis2", "22(1)"),
        ("en16803-3", "catalogue:Clause 9"),
    ];
    for (doc, a) in bad {
        assert!(
            !anchor_resolves(&docs[doc], a),
            "{doc}: {a:?} must not resolve"
        );
    }
    // And a good one does, so the control is not vacuous.
    assert!(anchor_resolves(&docs["dhs-rpcf"], "5.2|Core Functions"));
}
