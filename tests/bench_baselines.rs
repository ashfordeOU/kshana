// SPDX-License-Identifier: AGPL-3.0-only
//! kshana-bench v1 baselines against the bars of `xval/bench/PREREGISTRATION.md` (committed in
//! 4e1a0ed before `kshana bench` existed). Results: `xval/bench/RESULTS.md`.
//!
//! PIN-SCOPE:    the first and only scored run of the task (c) and (d) baselines on the `test` split
//!               and the verdict of each bar, including the one miss (D1, NOT MET)
//! PIN-EXCLUDES: the `dev` split numbers (in RESULTS.md) and the data-gated task (a) run, which
//!               needs the JammerTest 2024 archive (`KSHANA_JAMMERTEST_DIR`) and skips without it

use kshana::bench::tasks::{self, C_BASELINES};
use kshana::bench::{score, Split};
use serde_json::Value;

const CLOCKS: &str = include_str!("fixtures/clock_state_igs_holdout_oracle/clocks.txt");

fn c_result(baseline: &str, split: Split) -> Value {
    let cases = tasks::c_load(CLOCKS, split).unwrap();
    let (_, truth) = tasks::c_files(&cases, split);
    let preds = tasks::c_baseline_doc(baseline, &cases, split.name());
    let r = score(
        &serde_json::to_string_pretty(&truth).unwrap(),
        &serde_json::to_string_pretty(&preds).unwrap(),
        None,
    )
    .unwrap();
    serde_json::from_str(&r).unwrap()
}

fn rmse(r: &Value, horizon: u64) -> f64 {
    r["metrics"]["per_horizon"]
        .as_array()
        .unwrap()
        .iter()
        .find(|h| h["horizon_s"].as_u64() == Some(horizon))
        .unwrap()["rmse_ns"]
        .as_f64()
        .unwrap()
}

fn d_results(split: Split) -> Vec<(String, Value)> {
    let (_, truth) = tasks::d_files(split, 0.5, None).unwrap();
    let truth_text = serde_json::to_string_pretty(&truth).unwrap();
    let seed = tasks::d_seed(split, None).unwrap();
    let (cin, cout) = tasks::d_corpora(seed, 0.5, split);
    tasks::d_detectors()
        .iter()
        .map(|det| {
            let scores = tasks::d_baseline_scores(det.as_ref(), &cin, &cout);
            let doc = tasks::scores_doc("d", split.name(), det.name(), &scores);
            let r = score(
                &truth_text,
                &serde_json::to_string_pretty(&doc).unwrap(),
                None,
            )
            .unwrap();
            (det.name().to_string(), serde_json::from_str(&r).unwrap())
        })
        .collect()
}

#[test]
fn c1_linear_beats_hold_at_3600_s_on_the_test_split() {
    let hold = rmse(&c_result("hold", Split::Test), 3600);
    let linear = rmse(&c_result("linear", Split::Test), 3600);
    assert!(linear < hold, "linear {linear} ns vs hold {hold} ns");
    // Recorded: hold 24.612 ns, linear 0.162 ns.
    assert!((hold - 24.612).abs() < 1e-3 && (linear - 0.162).abs() < 1e-3);
}

#[test]
fn c2_quadratic_does_not_beat_linear_at_7200_s_on_the_test_split() {
    let linear = rmse(&c_result("linear", Split::Test), 7200);
    let quad = rmse(&c_result("quadratic", Split::Test), 7200);
    assert!(quad >= linear, "quadratic {quad} ns vs linear {linear} ns");
    // Recorded: linear 0.243 ns, quadratic 0.290 ns.
    assert!((linear - 0.243).abs() < 1e-3 && (quad - 0.290).abs() < 1e-3);
}

#[test]
fn c3_every_baseline_rmse_is_finite_on_the_test_split() {
    for b in C_BASELINES {
        let r = c_result(b, Split::Test);
        for h in [300, 900, 3600, 7200] {
            assert!(rmse(&r, h).is_finite(), "{b} at {h} s");
        }
        assert_eq!(r["metrics"]["n_cases"], 104);
    }
}

#[test]
fn d1_is_not_met_no_detector_exceeds_the_optimism_tolerance_on_the_test_split() {
    // Pre-registered: at least one detector has optimism_gap > 0.05 at scale 0.5. Measured: the
    // largest gap is 0.0301 (energy), so the bar is NOT MET and stays recorded as a miss. The
    // corpus at severity scale 0.5 is subtler but still separable for every transparent baseline.
    let rs = d_results(Split::Test);
    let max = rs
        .iter()
        .map(|(_, r)| r["metrics"]["optimism_gap"].as_f64().unwrap())
        .fold(f64::NEG_INFINITY, f64::max);
    assert!(max <= 0.05, "D1 would now be met: max gap {max}");
    assert!((max - 0.0301).abs() < 1e-3, "max gap {max}");
    assert!(rs.iter().all(|(_, r)| r["metrics"]["optimistic"] == false));
}

#[test]
fn d2_every_in_distribution_auc_lies_in_one_half_to_one_on_the_test_split() {
    for (name, r) in d_results(Split::Test) {
        let a = r["metrics"]["auc_in"].as_f64().unwrap();
        assert!((0.5..=1.0).contains(&a), "{name}: {a}");
    }
}

#[test]
fn s3_a_baseline_run_is_byte_identical_twice() {
    let a = serde_json::to_string(
        &d_results(Split::Dev)
            .iter()
            .map(|x| x.1.clone())
            .collect::<Vec<_>>(),
    )
    .unwrap();
    let b = serde_json::to_string(
        &d_results(Split::Dev)
            .iter()
            .map(|x| x.1.clone())
            .collect::<Vec<_>>(),
    )
    .unwrap();
    assert_eq!(a, b);
    assert_eq!(
        serde_json::to_string(&c_result("linear", Split::Dev)).unwrap(),
        serde_json::to_string(&c_result("linear", Split::Dev)).unwrap()
    );
}

/// Data-gated (the archive is never vendored): A1 reproduces the recorded pooled AUCs of
/// `xval/jammertest-trust/RESULTS.md`; A2 is the floor on the test split. Without
/// `KSHANA_JAMMERTEST_DIR` the test says so and returns.
#[test]
fn a1_a2_receiver_log_baselines_on_jammertest_2024() {
    let Ok(root) = std::env::var("KSHANA_JAMMERTEST_DIR") else {
        eprintln!("KSHANA_JAMMERTEST_DIR not set: task (a) bars A1 and A2 skipped (data-gated)");
        return;
    };
    let root = std::path::Path::new(&root);
    let all = tasks::a_load(root, None).unwrap();
    let truth_text = serde_json::to_string_pretty(&tasks::a_truth_json(&all, Split::Test)).unwrap();
    let recorded = [0.778, 0.933, 0.678];
    for ((stat, doc), want) in tasks::a_baselines(&all, "test").into_iter().zip(recorded) {
        let r: Value = serde_json::from_str(
            &score(
                &truth_text,
                &serde_json::to_string_pretty(&doc).unwrap(),
                None,
            )
            .unwrap(),
        )
        .unwrap();
        let got = r["metrics"]["auc"].as_f64().unwrap();
        assert!(
            (got - want).abs() <= 0.0005,
            "A1 {}: {got} vs {want}",
            stat.config_field()
        );
    }
    let test = tasks::a_load(root, Some(Split::Test)).unwrap();
    let truth_text =
        serde_json::to_string_pretty(&tasks::a_truth_json(&test, Split::Test)).unwrap();
    for (stat, doc) in tasks::a_baselines(&test, "test") {
        if stat.config_field() == "agc_k_sigma" {
            let r: Value = serde_json::from_str(
                &score(
                    &truth_text,
                    &serde_json::to_string_pretty(&doc).unwrap(),
                    None,
                )
                .unwrap(),
            )
            .unwrap();
            let got = r["metrics"]["auc"].as_f64().unwrap();
            assert!(got >= 0.80, "A2: agc_k_sigma test AUC {got}");
        }
    }
}
