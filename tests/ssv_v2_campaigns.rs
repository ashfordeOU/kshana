// SPDX-License-Identifier: AGPL-3.0-only
//! The scored runs of the signed-off v2 pre-registration for `gnss-ssv` (`xval/gnss-ssv/PREREGISTRATION-v2.md`,
//! signed off in 5f4250c8 before any run). Results and verdicts: `xval/gnss-ssv/RESULTS-v2.md`.
//!
//! PIN-SCOPE:    the control run reproducing run 1 cell for cell (campaign A's result, EXPLORATORY), the ablation
//!               sensitivity table (campaign B, EXPLORATORY, no bar), bar S7b including its miss, and that campaign D
//!               did not run; the original misses S1 to S5 and S7 stay NOT MET in `tests/ssv_booklet_results.rs`
//! PIN-EXCLUDES: whether the booklet's numbers are right (it is another model's computation), and any real receiver

use kshana::ssv::check::{run_ablation, s7b, Size};
use kshana::ssv::geom::fibonacci_grid;
use serde_json::Value;

fn load(s: &str) -> Value {
    serde_json::from_str(s).unwrap()
}

#[test]
fn the_control_reproduces_run_1_cell_for_cell() {
    let a = load(include_str!("../xval/gnss-ssv/results-v2-control.json"));
    let b = load(include_str!("../xval/gnss-ssv/results-run1.json"));
    for bar in ["S0", "S1", "S2", "S3", "S4", "S5", "S6"] {
        assert_eq!(a["bars"][bar], b["bars"][bar], "{bar}");
    }
    // Campaign A's result (the control is campaign A): S1 to S5 are not met under the upper-end reading.
    let failed = |bar: &str| a["bars"][bar]["verdict"]["failed_cells"].as_u64().unwrap();
    assert_eq!(
        [
            failed("S1"),
            failed("S2"),
            failed("S3"),
            failed("S4"),
            failed("S5")
        ],
        [9, 4, 33, 24, 8]
    );
    for bar in ["S1", "S2", "S3", "S4", "S5"] {
        assert_eq!(a["bars"][bar]["verdict"]["met"], false);
    }
}

#[test]
fn the_fibonacci_grid_is_2562_unit_vectors_with_zero_mean() {
    let g = fibonacci_grid(2562);
    assert_eq!(g.len(), 2562);
    let mut m = [0.0; 3];
    for v in &g {
        assert!((v[0] * v[0] + v[1] * v[1] + v[2] * v[2] - 1.0).abs() < 1e-12);
        for i in 0..3 {
            m[i] += v[i] / g.len() as f64;
        }
    }
    assert!(m.iter().all(|x| x.abs() < 1e-3), "{m:?}");
}

#[test]
fn each_ablation_reads_only_its_registered_bars() {
    let tables = std::fs::read_to_string("xval/gnss-ssv/booklet-tables.json").unwrap();
    for (id, bars) in [
        ("B1", vec!["S1", "S2", "S3"]),
        ("B3", vec!["S4", "S5"]),
        ("B4", vec!["S5", "S6"]),
        ("B5", vec!["S1", "S3"]),
    ] {
        let v = run_ablation(&tables, Size::Reduced, id).unwrap();
        let mut got: Vec<&str> = v["bars"]
            .as_object()
            .unwrap()
            .keys()
            .map(String::as_str)
            .collect();
        got.sort_unstable();
        assert_eq!(got, bars, "{id}");
        assert_eq!(v["ablation"], id);
    }
    assert!(run_ablation(&tables, Size::Reduced, "B6").is_err());
}

#[test]
fn s7b_recovers_a_shape_it_is_given() {
    // Twenty synthetic patterns that are exactly the registered shape (0.5 dB/deg, floor 12 dB) on a 2-degree grid.
    let mut csv = String::from("svn,theta_deg,az_avg_db\n");
    let svns: Vec<String> = (0..20).map(|i| format!("SVN{}", 100 + i)).collect();
    for sv in &svns {
        for k in 0..=15 {
            let th = f64::from(2 * k);
            csv.push_str(&format!("{sv},{th},{}\n", 10.0 - (0.5 * th).min(12.0)));
        }
    }
    let train: Vec<&str> = svns[..12].iter().map(String::as_str).collect();
    let test: Vec<&str> = svns[12..].iter().map(String::as_str).collect();
    let v = s7b(&csv, &train, &test).unwrap();
    assert!((v["fit"]["rolloff_db_per_deg"].as_f64().unwrap() - 0.5).abs() < 1e-3);
    assert!((v["fit"]["floor_db"].as_f64().unwrap() - 12.0).abs() < 1e-2);
    assert!(v["max_rms_db"].as_f64().unwrap() < 0.05);
    assert_eq!(v["verdict"]["met"], true);
}

#[test]
fn s7b_is_not_met_on_the_iir_m_patterns() {
    // Measured: the fit to the twelve Classic IIR patterns leaves 4.36 dB RMS on its own training set, and every IIR-M
    // pattern is 3.8 to 4.0 dB RMS from it against the bar of 3 dB. NOT MET; the miss is pinned.
    let d = load(include_str!("../xval/gnss-ssv/results-v2-s7b.json"))["bars"]["S7b"].clone();
    assert_eq!(d["verdict"]["met"], false);
    assert_eq!(d["verdict"]["scored_cells"], 8);
    assert_eq!(d["verdict"]["failed_cells"], 8);
    assert_eq!(d["fit"]["training_patterns"], 12);
    assert_eq!(d["test_patterns"], 8);
    let r = d["fit"]["rolloff_db_per_deg"].as_f64().unwrap();
    let f = d["fit"]["floor_db"].as_f64().unwrap();
    assert!(
        (r - 0.530_07).abs() < 1e-4 && (f - 15.0575).abs() < 1e-3,
        "{r} {f}"
    );
    assert!(d["min_rms_db"].as_f64().unwrap() > 3.0);
    assert!(d["max_rms_db"].as_f64().unwrap() < 4.1);
}

#[test]
fn campaign_b_the_ablations_close_two_of_78_missed_cells_and_break_four() {
    // A sensitivity table with no bar: none of the five readings brings S1 to S5 near being met. Only the Fibonacci grid
    // (B1) brings any missed cell within tolerance (two max-outage cells of the combined L1 row); B3 and B5 each push cells
    // that were met out of tolerance.
    let s = load(include_str!("../xval/gnss-ssv/results-v2-summary.json"));
    assert_eq!(s["run1_missed_cells"], 78);
    assert_eq!(s["run1_missed_cells_fixed_by_any_ablation"], 2);
    let fixed_by_b1: Vec<&str> = s["leftover_cells"]
        .as_object()
        .unwrap()
        .iter()
        .filter(|(_, v)| !v.as_array().unwrap().is_empty())
        .map(|(k, _)| k.as_str())
        .collect();
    assert_eq!(
        fixed_by_b1,
        [
            "S1 B4 l1 combined MOD1 min",
            "S3 B9@15 l1 combined MOD1 min"
        ]
    );
    let missed_now = |a: &str, b: &str| s["ablations"][a][b]["missed_now"].as_u64().unwrap();
    assert_eq!(
        [
            missed_now("B1", "S1"),
            missed_now("B1", "S2"),
            missed_now("B1", "S3")
        ],
        [8, 4, 32]
    );
    assert_eq!(
        [
            missed_now("B2", "S1"),
            missed_now("B2", "S2"),
            missed_now("B2", "S3")
        ],
        [9, 4, 33]
    );
    assert_eq!([missed_now("B3", "S4"), missed_now("B3", "S5")], [24, 9]);
    assert_eq!([missed_now("B4", "S5"), missed_now("B4", "S6")], [8, 0]);
    assert_eq!([missed_now("B5", "S1"), missed_now("B5", "S3")], [9, 36]);
    // No ablation leaves any original bar met.
    for i in 1..=5 {
        let a =
            load(&std::fs::read_to_string(format!("xval/gnss-ssv/results-v2-B{i}.json")).unwrap());
        for (bar, v) in a["bars"].as_object().unwrap() {
            if bar != "S6" {
                assert_eq!(v["verdict"]["met"], false, "B{i} {bar}");
            }
        }
    }
}

#[test]
fn campaign_d_did_not_run_because_no_source_was_pinned() {
    let p = include_str!("../xval/gnss-ssv/PREREGISTRATION-v2.md");
    assert!(p.contains("not run: source not pinned"));
    assert!(!std::path::Path::new("xval/gnss-ssv/results-v2-D.json").exists());
}
