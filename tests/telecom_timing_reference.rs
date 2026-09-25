// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for the `telecom-timing` kind's MTIE and TDEV.**
//!
//! The maximum time interval error (MTIE) and time deviation (TDEV) the kind reports are
//! checked against **allantools** 2024.06, an independent third-party frequency-stability
//! library, on a committed telecom-scale time-error series: a chip-scale atomic clock
//! (CSAC) preset that loses its Global Navigation Satellite System (GNSS) reference at
//! 300 s and holds over with white, flicker and random-walk frequency noise, aging and a
//! temperature term — 2 048 one-second samples.
//!
//! * `tests/fixtures/telecom_timing/holdover_te_series.csv` — the series, written once by
//!   the engine (`zzz_emit_telecom_timing_fixture`, ignored) at 17 significant figures so
//!   Rust and Python parse identical doubles. It is an INPUT here: nothing in this file
//!   depends on the engine regenerating it bit for bit.
//! * `tests/fixtures/telecom_timing/allantools_reference.json` — allantools `mtie` and
//!   `tdev` on that series, written by
//!   `tests/fixtures/telecom_timing/generate_telecom_timing_reference.py`.
//!
//! What is compared: [`kshana::telecom_timing::mtie_sliding`] (the O(n) sliding-window
//! MTIE the kind uses), [`kshana::allan::time_deviation`] (the TDEV it uses), and the
//! `mtie[]` / `tdev[]` curves of a full `telecom-timing` run that ingests the same CSV.
//! No third-party code runs in this test.
//!
//! It also holds `docs/TELECOM-TIMING.md` to the reference scenario: the figures that page
//! quotes for `scenarios/telecom-prtc-holdover-24h.toml` are read out of a fresh run.
//!
//! PIN-SCOPE:    the allantools reference values and the 2 048-sample fixture they were
//!               computed from; the kind's emitted curves at the matching intervals; the
//!               reference-scenario figures quoted in docs/TELECOM-TIMING.md.
//! PIN-EXCLUDES: every other field of the kind's report, the mask verdicts beyond the
//!               quoted ones, and whether the engine would regenerate the same series.

use serde_json::Value;

const SERIES: &str = "tests/fixtures/telecom_timing/holdover_te_series.csv";
const REFERENCE: &str = "tests/fixtures/telecom_timing/allantools_reference.json";

fn series() -> Vec<f64> {
    let text = std::fs::read_to_string(SERIES).expect("read the committed series");
    kshana::telecom_timing::parse_csv_pairs(&text)
        .expect("the committed series parses")
        .into_iter()
        .map(|p| p[1])
        .collect()
}

fn reference() -> Value {
    serde_json::from_str(&std::fs::read_to_string(REFERENCE).expect("read the reference"))
        .expect("the reference is JSON")
}

fn pairs(v: &Value, key: &str) -> Vec<(usize, f64)> {
    v[key]
        .as_array()
        .unwrap_or_else(|| panic!("reference has no {key} array"))
        .iter()
        .map(|p| {
            (
                p["m"].as_u64().expect("m") as usize,
                p["value_ns"].as_f64().expect("value_ns"),
            )
        })
        .collect()
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs().max(1e-300)
}

#[test]
fn the_committed_series_is_the_one_the_reference_was_computed_on() {
    let x = series();
    let r = reference();
    assert_eq!(x.len(), 2048);
    assert_eq!(r["n_samples"].as_u64(), Some(2048));
    let sha = kshana::telecom_timing::series_sha256(&x);
    assert_eq!(
        r["series_sha256"].as_str(),
        Some(sha.as_str()),
        "the reference JSON records the SHA-256 of the series it was computed on"
    );
}

#[test]
fn mtie_matches_allantools_on_a_holdover_series() {
    let x = series();
    let r = reference();
    let refs = pairs(&r, "mtie");
    assert!(
        refs.len() >= 15,
        "only {} MTIE reference points",
        refs.len()
    );
    let mut worst = 0.0_f64;
    for (m, want) in refs {
        let got = kshana::telecom_timing::mtie_sliding(&x, m);
        worst = worst.max(rel(got, want));
        assert!(
            rel(got, want) < 1e-12,
            "MTIE(m={m}): kshana {got} vs allantools {want}"
        );
        // And the engine's reference estimator agrees exactly with the sliding one.
        assert_eq!(got, kshana::allan::mtie(&x, m), "m = {m}");
    }
    println!("MTIE: largest relative difference from allantools {worst:.3e}");
}

#[test]
fn tdev_matches_allantools_on_a_holdover_series() {
    let x = series();
    let r = reference();
    let refs = pairs(&r, "tdev");
    assert!(
        refs.len() >= 10,
        "only {} TDEV reference points",
        refs.len()
    );
    let mut worst = 0.0_f64;
    for (m, want) in refs {
        let got = kshana::allan::time_deviation(&x, 1.0, m);
        worst = worst.max(rel(got, want));
        assert!(
            rel(got, want) < 1e-9,
            "TDEV(m={m}): kshana {got} vs allantools {want}"
        );
    }
    println!("TDEV: largest relative difference from allantools {worst:.3e}");
}

#[test]
fn a_telecom_timing_run_reports_the_allantools_curves() {
    let src = format!(
        "kind = \"telecom-timing\"\nmasks = [\"prtc-a\"]\n[series]\ncsv_path = \"{SERIES}\"\n"
    );
    let out = kshana::api::run_toml(&src).expect("the ingested series runs");
    let doc: Value = serde_json::from_str(&out.json).unwrap();
    let r = reference();
    let mut compared = 0;
    for (key, field) in [("mtie", "mtie_ns"), ("tdev", "tdev_ns")] {
        let refs = pairs(&r, key);
        for p in doc[key].as_array().unwrap() {
            let tau = p["tau_s"].as_f64().unwrap();
            if let Some(&(_, want)) = refs.iter().find(|(m, _)| *m as f64 == tau) {
                let got = p[field].as_f64().unwrap();
                assert!(rel(got, want) < 1e-9, "{key}({tau} s): {got} vs {want}");
                compared += 1;
            }
        }
    }
    assert!(
        compared >= 25,
        "only {compared} curve points matched a reference point"
    );
}

#[test]
fn telecom_timing_kind_round_trips_through_the_dispatch() {
    for path in [
        "scenarios/telecom-prtc-holdover-24h.toml",
        "scenarios/telecom-tie-ingest.toml",
    ] {
        let src = std::fs::read_to_string(path).unwrap();
        let a = kshana::api::run_toml(&src).unwrap_or_else(|e| panic!("{path}: {e}"));
        let b = kshana::api::run_toml(&src).unwrap();
        assert_eq!(a.json, b.json, "{path}: the run is not deterministic");
        let doc: Value = serde_json::from_str(&a.json).unwrap();
        assert_eq!(doc["kind"], "telecom-timing");
        assert!(doc["label"].as_str().unwrap().starts_with("MODELLED"));
        assert!(doc["units"].is_object());
        let masks = doc["masks"].as_array().unwrap();
        assert!(!masks.is_empty());
        for m in masks {
            let v = m["verdict"].as_str().unwrap();
            assert!(
                ["PASS", "FAIL", "INCOMPLETE", "NOT-EVALUATED"].contains(&v),
                "{path}: verdict {v}"
            );
            assert!(m["recommendation"]
                .as_str()
                .unwrap()
                .starts_with("ITU-T G.827"));
        }
        let csv = a.csv.expect("the kind publishes a CSV table");
        assert!(csv.starts_with("tau_s,mtie_ns,tdev_ns"));
        assert!(a.svg.contains("<svg") && a.svg.contains("MTIE"));
        assert!(a.summary.contains("telecom-timing"));
    }
}

/// Group the digits of a whole number in threes with spaces, the house style of the docs.
fn grouped(n: f64) -> String {
    let digits = format!("{:.0}", n);
    let mut out = String::new();
    for (i, c) in digits.chars().enumerate() {
        if i > 0 && (digits.len() - i) % 3 == 0 {
            out.push(' ');
        }
        out.push(c);
    }
    out
}

#[test]
fn the_reference_scenario_figures_quoted_in_the_doc_are_the_run() {
    let src = std::fs::read_to_string("scenarios/telecom-prtc-holdover-24h.toml").unwrap();
    let out = kshana::api::run_toml(&src).unwrap();
    let d: Value = serde_json::from_str(&out.json).unwrap();
    let doc = std::fs::read_to_string("docs/TELECOM-TIMING.md").unwrap();
    let doc = doc.split_whitespace().collect::<Vec<_>>().join(" ");
    let b = |i: usize| d["budgets"][i]["time_to_exceed_s"].clone();
    let mut want = vec![
        format!(
            "{:.1} ns",
            d["time_error"]["max_abs_te_ns"].as_f64().unwrap()
        ),
        format!("{} s after the loss", grouped(b(0).as_f64().unwrap())),
        format!("allocation after {} s", grouped(b(1).as_f64().unwrap())),
        format!(
            "{} s after the loss, which is",
            grouped(d["holdover_envelope"]["time_to_exceed_s"].as_f64().unwrap())
        ),
        format!(
            "can reach {:.0} ns",
            d["holdover"]["temperature_te_peak_ns"].as_f64().unwrap()
        ),
        format!(
            "aging ({:.0} ns",
            d["holdover"]["aging_te_at_end_ns"].as_f64().unwrap()
        ),
    ];
    // The page says the clock stays inside 1 100 ns and 1.5 µs all day.
    assert!(
        b(2).is_null() && b(3).is_null(),
        "the 1 100 ns and 1.5 µs budgets were crossed"
    );
    want.retain(|w| !doc.contains(w.as_str()));
    assert!(
        want.is_empty(),
        "docs/TELECOM-TIMING.md no longer quotes the reference run; missing: {want:?}"
    );
}

/// Writes the committed series. Run once, deliberately:
/// `cargo test --test telecom_timing_reference zzz_emit_telecom_timing_fixture -- --ignored`
/// then regenerate the reference with the Python script beside the fixture.
#[test]
#[ignore]
fn zzz_emit_telecom_timing_fixture() {
    use kshana::telecom_timing::{holdover_model, synthesize_holdover, HoldoverInput};
    let h = HoldoverInput {
        oscillator: "csac".into(),
        gnss_loss_s: 300.0,
        duration_s: 2047.0,
        sample_interval_s: 1.0,
        ..HoldoverInput::default()
    };
    let model = holdover_model(&h).unwrap();
    let rec = synthesize_holdover(&h, &model, 20_260_925).unwrap();
    let mut out = String::from(
        "# telecom-timing fixture: CSAC preset, GNSS loss at 300 s, seed 20260925, written by\n\
         # tests/telecom_timing_reference.rs zzz_emit_telecom_timing_fixture. An engine-made\n\
         # series used as oracle INPUT, not a measurement.\ntime_s,time_error_ns\n",
    );
    for (k, x) in rec.te_ns.iter().enumerate() {
        out.push_str(&format!("{k},{x:.17e}\n"));
    }
    std::fs::create_dir_all("tests/fixtures/telecom_timing").unwrap();
    std::fs::write(SERIES, out).unwrap();
}
