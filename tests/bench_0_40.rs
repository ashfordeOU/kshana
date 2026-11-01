// SPDX-License-Identifier: AGPL-3.0-only
//! Bars A3 and D3 of the 0.40 re-campaign (`xval/bench/PREREGISTRATION-0.40-A2.md` and `-D1.md`,
//! signed off 24 Oct 2026 as EXPLORATORY in dfdbd8ba and a0f2f354). Results: `xval/bench/RESULTS-0.40.md`.
//! R3 and R4 are in `iq_campaign_roc_0_40.rs`.
//!
//! A3 and D3 are EXPLORATORY: A3 cannot close A2 and is evidence about this archive only; D3's
//! scale was chosen after D1 missed. A2, D1 and R1 stay NOT MET.
//!
//! PIN-SCOPE:    the one scored run of A3 (stored output of `examples/bench_a3.rs`, the archive being
//!               never vendored) and of D3 (live, no data)
//! PIN-EXCLUDES: A2, D1, R1 (pinned where they were)

use kshana::bench::tasks;
use kshana::bench::{score, Split};
use serde_json::Value;

#[test]
fn a3_exploratory_the_folder_clustered_lower_bound_is_met_on_this_archive() {
    let out = include_str!("fixtures/bench_0_40/a3_output.txt");
    let num = |key: &str| -> f64 {
        let i = out.find(key).unwrap_or_else(|| panic!("{key} missing")) + key.len();
        out[i..]
            .split(|c: char| !(c.is_ascii_digit() || c == '.'))
            .next()
            .unwrap()
            .parse()
            .unwrap()
    };
    // The point estimate reproduces the recorded pooled AUC of A1 (0.933).
    assert!((num("pooled, 14 folders): ") - 0.933).abs() <= 0.0005);
    let lo = num("2.5% = ");
    assert!(lo >= 0.80, "A3 would now be NOT MET: {lo}");
    assert!((lo - 0.850194).abs() < 1e-6);
    assert!(out.contains("A3 (2.5% quantile >= 0.80): MET"));
}

#[test]
fn d3_exploratory_three_detectors_exceed_the_optimism_tolerance_at_scale_0_25() {
    let split = Split::Test;
    let (_, truth) = tasks::d_files(split, 0.25, None).unwrap();
    let truth_text = serde_json::to_string_pretty(&truth).unwrap();
    let seed = tasks::d_seed(split, None).unwrap();
    let (cin, cout) = tasks::d_corpora(seed, 0.25, split);
    let mut gaps = Vec::new();
    for det in tasks::d_detectors() {
        let scores = tasks::d_baseline_scores(det.as_ref(), &cin, &cout);
        let doc = tasks::scores_doc("d", split.name(), det.name(), &scores);
        let r: Value = serde_json::from_str(
            &score(
                &truth_text,
                &serde_json::to_string_pretty(&doc).unwrap(),
                None,
            )
            .unwrap(),
        )
        .unwrap();
        gaps.push((
            det.name().to_string(),
            r["metrics"]["optimism_gap"].as_f64().unwrap(),
        ));
    }
    let over: Vec<_> = gaps.iter().filter(|g| g.1 > 0.05).collect();
    assert!(!over.is_empty(), "D3 would now be NOT MET: {gaps:?}");
    assert_eq!(over.len(), 3, "{gaps:?}");
    let max = gaps.iter().map(|g| g.1).fold(f64::NEG_INFINITY, f64::max);
    assert!((max - 0.0961).abs() < 1e-3, "largest gap {max}");
}
