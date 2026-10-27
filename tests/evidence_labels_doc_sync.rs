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
use std::collections::BTreeMap;
use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

/// requirement text -> (id, status), from the committed markdown ledger: `| ID | Requirement | ... | Status |`.
fn matrix_from_markdown() -> BTreeMap<String, (String, String)> {
    let text = std::fs::read_to_string(root().join("docs/VERIFICATION-MATRIX.md")).expect("matrix");
    let mut rows = BTreeMap::new();
    for line in text.lines() {
        if !line.starts_with("| VM-") {
            continue;
        }
        let cells: Vec<&str> = line.trim_end_matches('|').split(" | ").collect();
        let (Some(id), Some(req), Some(status)) = (cells.first(), cells.get(1), cells.last())
        else {
            continue;
        };
        let status = status.trim();
        assert!(
            matches!(status, "VALIDATED" | "MODELLED" | "PARTNER"),
            "row {id}: status `{status}`"
        );
        let prev = rows.insert(
            req.trim().to_string(),
            (
                id.trim_start_matches("| ").trim().to_string(),
                status.to_string(),
            ),
        );
        assert!(
            prev.is_none(),
            "requirement `{req}` appears twice in the ledger"
        );
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
    rows: &[LabelRow],
    matrix: &BTreeMap<String, (String, String)>,
) {
    assert!(!rows.is_empty(), "{what}: the label names no ledger row");
    for (id, req, status) in rows {
        let (want_id, want) = matrix.get(req).unwrap_or_else(|| {
            panic!("{what}: label row `{req}` is not in docs/VERIFICATION-MATRIX.md")
        });
        assert_eq!(
            status, want,
            "{what}: `{req}` is {want} in the matrix, the label says {status}"
        );
        assert_eq!(id, want_id, "{what}: id of `{req}` in the matrix");
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

/// One label row: (id, requirement, status).
type LabelRow = (String, String, String);

fn json_label(doc: &Value) -> Option<(String, Vec<LabelRow>)> {
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
    // The ledger's ids: well formed, unique, and every id ever issued is still there.
    let ids: std::collections::BTreeSet<&str> = matrix.values().map(|(i, _)| i.as_str()).collect();
    assert_eq!(ids.len(), matrix.len(), "two ledger rows share an id");
    for (req, (id, _)) in &matrix {
        let hex = id.strip_prefix("VM-").unwrap_or("");
        assert!(
            hex.len() == 8
                && hex
                    .chars()
                    .all(|c| c.is_ascii_hexdigit() && !c.is_ascii_uppercase()),
            "row `{req}` has a malformed id `{id}`"
        );
    }
    let frozen = std::fs::read_to_string(root().join("tests/fixtures/evidence_ids.txt")).unwrap();
    for id in frozen
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
    {
        assert!(
            ids.contains(id),
            "id {id} was issued and is no longer in the ledger"
        );
    }
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
    assert!(csvs >= 3, "only {csvs} CSV tables were checked");
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

/// Source files that write figures or tables and label them: each must call into `kshana::evidence_label`.
const LABELLED_WRITERS: &[&str] = &[
    "src/api.rs",
    "src/interference_map/cli.rs",
    "src/jammertest/cli.rs",
    "src/iq/cli/acquire.rs",
    "src/iq/cli/monitor.rs",
    "src/iq/cli/sweep.rs",
    "src/iq/cli/track.rs",
];

/// Every other source file that writes a file, and why what it writes carries no evidence label. A new writer must be
/// labelled (and moved to the list above) or added here with its reason; the scan below fails otherwise, and fails on a
/// stale entry.
const UNLABELLED_WRITERS: &[(&str, &str)] = &[
    ("src/altpnt/terrain.rs", "writes only in a unit test (a temporary grid)"),
    ("src/lunar_service.rs", "writes only in a unit test (a temporary ephemeris)"),
    ("src/time_transfer_budget.rs", "writes only in a unit test (a temporary clock CSV)"),
    ("src/iq/signals/galileo.rs", "writes only in a unit test (a temporary code table)"),
    ("src/python.rs", "writes the CSV a labelled `run` already carries (RunOutput::csv)"),
    ("src/bin/crossover_study.rs", "a generator of a committed study document, not the output of a run"),
    ("src/bin/gen_araim_m3_study.rs", "a generator of a committed study document, not the output of a run"),
    ("src/bin/gen_calibration_ensembles.rs", "a generator of a committed data table, not the output of a run"),
    ("src/bin/gen_validation_artifacts.rs", "generates the ledger itself (docs/VERIFICATION-MATRIX.md and its siblings)"),
    ("src/bin/validation_report.rs", "writes the validation summary, which is built from the ledger"),
    ("src/main.rs", "run outputs are labelled by api::run_toml and receiver_trust::run_scenario before main writes them; what main writes besides is a study aggregate (its member documents are labelled) or a format-bound export read by third-party tools (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF, the test-bench motion and NMEA files)"),
    ("src/bench/cli.rs", "kshana-bench result files have a fixed schema pinned by the holdout commitments and the baselines; each carries its own `label` (MODELLED or measured) and names the truth it scores against"),
    ("src/evidence/cli.rs", "writes the pack the library built: the label is inside the pack's config.json (src/evidence/assemble.rs), covered by the hash chain and the signature, and `kshana evidence verify` reports it (tests/evidence_pack_label.rs)"),
    ("src/interference_map/observatory.rs", "the observatory's daily products (GeoJSON, PNG, incident JSON) have a frozen published schema and are produced by the observatory method note (docs/observatory/METHOD.md), whose own caveats travel with them"),
    ("src/iq/campaign/conditions.rs", "writes the lab-conditions file a campaign is replayed under, an input"),
    ("src/iq/campaign/report.rs", "campaign cell, scorecard and report files are digest-pinned (tests/iq_campaign.rs) and each states the campaign scorecard it restates"),
    ("src/iq/campaign/runner.rs", "campaign cell files are digest-pinned (tests/iq_campaign.rs)"),
    ("src/iq/cli/campaign.rs", "writes the campaign manifest, an input to the runner"),
    ("src/iq/cli/labfit.rs", "writes the fitted receiver-trust parameters, an input to later runs"),
    ("src/iq/cli/scene.rs", "writes IQ scene truth and SigMF/SDR metadata beside the samples: format-bound files read by other tools"),
    ("src/iq/io/cli.rs", "writes converted sample files and SigMF metadata: format-bound"),
    ("src/iq/io/inventory.rs", "writes a file inventory of recordings, a catalogue of inputs"),
    ("src/iq/io/sigmf_stream.rs", "writes SigMF sample and metadata files: format-bound"),
    ("src/iq/io/stream.rs", "writes the sample stream of a recording: format-bound"),
    ("src/live_io.rs", "writes the append-only session log of a live receiver feed (a stream of records, each labelled by its schema)"),
    ("src/nmea_synth/cli.rs", "writes the NMEA training stream and its truth log, which simulators and receivers read as plain NMEA"),
    ("src/realtime_frame_eop.rs", "writes the run's CSV, already labelled when it came from api::run_toml (RunOutput::write_csv)"),
];

fn source_files(dir: &Path, out: &mut Vec<String>) {
    for e in std::fs::read_dir(dir).unwrap().flatten() {
        let p = e.path();
        if p.is_dir() {
            source_files(&p, out);
        } else if p.extension().is_some_and(|x| x == "rs") {
            out.push(
                p.strip_prefix(root())
                    .unwrap()
                    .to_string_lossy()
                    .replace('\\', "/"),
            );
        }
    }
}

#[test]
fn no_unlisted_writer_of_files_exists_and_every_labelled_writer_calls_the_labeller() {
    let mut files = Vec::new();
    source_files(&root().join("src"), &mut files);
    files.sort();
    let writes = |text: &str| {
        text.contains("fs::write(")
            || text.contains("write_atomic(")
            || text.contains("File::create(")
            || text.contains("OpenOptions")
    };
    let mut unlisted = Vec::new();
    for f in &files {
        let text = std::fs::read_to_string(root().join(f)).unwrap();
        if !writes(&text) {
            continue;
        }
        if LABELLED_WRITERS.contains(&f.as_str()) {
            assert!(
                text.contains("evidence_label"),
                "{f} is listed as labelled but never calls evidence_label"
            );
        } else if !UNLABELLED_WRITERS.iter().any(|(n, _)| n == f) {
            unlisted.push(f.clone());
        }
    }
    assert!(
        unlisted.is_empty(),
        "these files write files and are neither labelled nor listed with a reason in UNLABELLED_WRITERS: {unlisted:?}"
    );
    // No stale entries: every listed file still exists and still writes.
    for f in LABELLED_WRITERS
        .iter()
        .copied()
        .chain(UNLABELLED_WRITERS.iter().map(|(n, _)| *n))
    {
        let text = std::fs::read_to_string(root().join(f))
            .unwrap_or_else(|_| panic!("{f} is listed but does not exist"));
        assert!(
            writes(&text) || f == "src/api.rs",
            "{f} is listed but no longer writes a file"
        );
    }
    for (f, why) in UNLABELLED_WRITERS {
        assert!(why.len() > 20, "{f}: give a real reason");
    }
}

/// Every tool crosswalk id exists in the matrix, and every tool the labeller names resolves to a label.
#[test]
fn every_tool_row_id_exists_and_the_tool_labels_agree_with_the_matrix() {
    let matrix = matrix_from_markdown();
    let by_id: BTreeMap<&str, (&str, &str)> = matrix
        .iter()
        .map(|(req, (id, st))| (id.as_str(), (req.as_str(), st.as_str())))
        .collect();
    for (tool, ids) in kshana::evidence_label::TOOL_ROWS {
        for id in *ids {
            assert!(
                by_id.contains_key(id),
                "tool `{tool}` names row {id}, which is not in the matrix"
            );
        }
        let label = kshana::evidence_label::EvidenceLabel::for_tool(tool).expect(tool);
        let rows: Vec<(String, String, String)> = label
            .rows
            .iter()
            .map(|r| (r.id.clone(), r.requirement.clone(), r.status.clone()))
            .collect();
        check_label(&format!("tool {tool}"), &label.tier, &rows, &matrix);
    }
}
