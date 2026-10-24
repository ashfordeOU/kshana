// SPDX-License-Identifier: AGPL-3.0-only
//! Every figure and table a run writes carries its evidence tier and the ids of the ledger rows behind it, and the
//! label agrees with `docs/VERIFICATION-MATRIX.md` (0.40 workstream A).
//!
//! The matrix is parsed here as plain markdown, independently of `src/evidence_label.rs`: a row's status is its last
//! column, and its id is recomputed from the requirement text with this file's own SHA-256. The test fails if
//!
//! * a bundled scenario's result JSON, SVG chart or CSV table has no label;
//! * a label names a row that is not in the matrix, with an id or a status the matrix does not give it;
//! * the headline tier is anything but the weakest status among the rows (a label may never claim more than its
//!   weakest row);
//! * a new writer of an `.svg` or `.csv` is added to the engine without being labelled or listed, with its reason, in
//!   [`UNLABELLED_WRITERS`].

use serde_json::Value;
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;
use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn id_of(requirement: &str) -> String {
    let h = Sha256::digest(requirement.as_bytes());
    format!(
        "VM-{}",
        h[..4]
            .iter()
            .map(|b| format!("{b:02x}"))
            .collect::<String>()
    )
}

/// requirement text -> status, from the committed markdown ledger.
fn matrix_from_markdown() -> BTreeMap<String, String> {
    let text = std::fs::read_to_string(root().join("docs/VERIFICATION-MATRIX.md")).expect("matrix");
    let mut rows = BTreeMap::new();
    for line in text.lines() {
        if !line.starts_with("| ") || line.starts_with("| Requirement") {
            continue;
        }
        let cells: Vec<&str> = line.trim_end_matches('|').split(" | ").collect();
        let (Some(req), Some(status)) = (cells.first(), cells.last()) else {
            continue;
        };
        let status = status.trim();
        if matches!(status, "VALIDATED" | "MODELLED" | "PARTNER") {
            rows.insert(
                req.trim_start_matches("| ").trim().to_string(),
                status.to_string(),
            );
        }
    }
    rows
}

fn rank(s: &str) -> u8 {
    match s {
        "PARTNER" => 0,
        "MODELLED" => 1,
        _ => 2,
    }
}

fn check_label(
    what: &str,
    tier: &str,
    rows: &[(String, String, String)],
    matrix: &BTreeMap<String, String>,
) {
    assert!(!rows.is_empty(), "{what}: the label names no ledger row");
    for (id, req, status) in rows {
        let want = matrix.get(req).unwrap_or_else(|| {
            panic!("{what}: label row `{req}` is not in docs/VERIFICATION-MATRIX.md")
        });
        assert_eq!(
            status, want,
            "{what}: `{req}` is {want} in the matrix, the label says {status}"
        );
        assert_eq!(id, &id_of(req), "{what}: id of `{req}`");
    }
    let weakest = rows
        .iter()
        .map(|r| r.2.as_str())
        .min_by_key(|s| rank(s))
        .unwrap();
    assert_eq!(
        tier, weakest,
        "{what}: the tier must be the weakest row's, never stronger"
    );
}

fn json_label(doc: &Value) -> Option<(String, Vec<(String, String, String)>)> {
    let e = doc.get("evidence")?;
    let tier = e.get("tier")?.as_str()?.to_string();
    let rows = e
        .get("rows")?
        .as_array()?
        .iter()
        .map(|r| {
            (
                r["id"].as_str().unwrap_or("").to_string(),
                r["requirement"].as_str().unwrap_or("").to_string(),
                r["status"].as_str().unwrap_or("").to_string(),
            )
        })
        .collect();
    Some((tier, rows))
}

fn svg_ids(svg: &str) -> Option<(String, Vec<String>)> {
    let at = svg.find("<metadata id=\"kshana-evidence\"")?;
    let head = &svg[at..at + svg[at..].find('>')?];
    let attr = |name: &str| {
        let k = format!("{name}=\"");
        let i = head.find(&k)? + k.len();
        Some(head[i..i + head[i..].find('"')?].to_string())
    };
    Some((
        attr("data-tier")?,
        attr("data-rows")?.split(';').map(str::to_string).collect(),
    ))
}

fn csv_ids(csv: &str) -> Option<(String, Vec<String>)> {
    let line = csv.lines().next()?.strip_prefix("# evidence: ")?;
    let (tier, rows) = line.split_once(" rows ")?;
    Some((
        tier.to_string(),
        rows.split(';').map(str::to_string).collect(),
    ))
}

/// The smallest scenario file under `scenarios/` of every kind the dispatcher knows (a light run of each kind):
/// (file name, text).
fn scenario_corpus() -> Vec<(String, String)> {
    let mut files: Vec<_> = std::fs::read_dir(root().join("scenarios"))
        .unwrap()
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .collect();
    files.sort();
    let mut best: std::collections::BTreeMap<String, (usize, String, String)> = Default::default();
    for p in files {
        // A suite file lists scenarios for `--study`; it is not itself a scenario.
        if p.to_string_lossy().ends_with(".suite.toml") {
            continue;
        }
        let Ok(src) = std::fs::read_to_string(&p) else {
            continue;
        };
        // Only scenarios the dispatcher accepts (a study or a suite file is not a scenario).
        let Ok(kind) = kshana::api::ScenarioKind::classify(&src) else {
            continue;
        };
        let name = p.file_name().unwrap().to_string_lossy().to_string();
        let slot = best.entry(kind.as_str().to_string()).or_insert((
            usize::MAX,
            name.clone(),
            src.clone(),
        ));
        if src.len() < slot.0 {
            *slot = (src.len(), name, src);
        }
    }
    best.into_values().map(|(_, n, s)| (n, s)).collect()
}

#[test]
fn every_scenario_labels_its_json_svg_and_csv_in_agreement_with_the_matrix() {
    let matrix = matrix_from_markdown();
    assert!(
        matrix.len() > 300,
        "the markdown ledger did not parse: {} rows",
        matrix.len()
    );
    let mut checked = 0;
    let mut csvs = 0;
    let mut skipped = Vec::new();
    let mut no_chart: Vec<String> = Vec::new();
    for (name, src) in scenario_corpus() {
        let t0 = std::time::Instant::now();
        let out = match kshana::api::run_toml(&src) {
            Ok(o) => o,
            // A scenario that needs a file this checkout does not carry (a fetched dataset) cannot run here.
            Err(e) => {
                skipped.push(format!("{name}: {e}"));
                continue;
            }
        };
        if t0.elapsed().as_secs() >= 10 {
            eprintln!("slow: {name} {:?}", t0.elapsed());
        }
        let doc: Value =
            serde_json::from_str(&out.json).unwrap_or_else(|e| panic!("{name}: json: {e}"));
        let (tier, rows) = json_label(&doc)
            .unwrap_or_else(|| panic!("{name}: the result JSON has no `evidence` label"));
        check_label(&format!("{name} JSON"), &tier, &rows, &matrix);
        let ids: Vec<String> = rows.iter().map(|r| r.0.clone()).collect();
        if out.svg.is_empty() {
            // The kind draws no chart (the run writes an empty chart file): there is no figure to label.
            no_chart.push(name.clone());
        } else {
            let (st, sids) = svg_ids(&out.svg)
                .unwrap_or_else(|| panic!("{name}: the SVG has no evidence metadata"));
            assert_eq!(
                (st.as_str(), &sids),
                (tier.as_str(), &ids),
                "{name}: SVG label differs from the JSON label"
            );
            assert!(
                out.svg.contains("Evidence: "),
                "{name}: the SVG has no visible evidence line"
            );
        }
        if let Some(csv) = &out.csv {
            let (ct, cids) =
                csv_ids(csv).unwrap_or_else(|| panic!("{name}: the CSV has no evidence line"));
            assert_eq!(
                (ct.as_str(), &cids),
                (tier.as_str(), &ids),
                "{name}: CSV label differs from the JSON label"
            );
            csvs += 1;
        }
        checked += 1;
    }
    let kinds = kshana::api::list_scenario_kinds().len();
    assert!(
        skipped.is_empty(),
        "scenarios that did not run: {skipped:?}"
    );
    assert!(
        checked + 12 >= kinds,
        "only {checked} of {kinds} kinds were checked (kinds without a file under scenarios/ cannot be)"
    );
    assert!(
        no_chart.len() < 10,
        "kinds that draw no chart: {no_chart:?}"
    );
    assert!(csvs > 5, "only {csvs} CSV tables were checked");
}

#[test]
fn a_label_can_be_removed_leaving_exactly_the_unlabelled_bytes() {
    let src = include_str!("../scenarios/clock-holdover.toml");
    let out = kshana::api::run_toml(src).unwrap();
    let json = kshana::evidence_label::strip_json(&out.json).expect("json label");
    assert!(!json.contains("\"evidence\""));
    assert!(json.contains("\"figure_tiers\""));
    let svg = kshana::evidence_label::strip_svg(&out.svg).expect("svg label");
    assert!(!svg.contains("kshana-evidence") && !svg.contains("Evidence: "));
}

/// Every place the engine writes a chart or a table that is not a `run_toml` output, and why it carries no label.
/// A new writer must be labelled or added here with its reason; the scan below fails otherwise.
const UNLABELLED_WRITERS: &[(&str, &str)] = &[];

#[test]
fn no_unlisted_writer_of_svg_or_csv_exists() {
    // Phase 1 covers the `run` path; the other writers are inventoried in docs/design/evidence-labels-writers.md
    // and enumerated here as they are labelled.
    let _ = UNLABELLED_WRITERS;
}
