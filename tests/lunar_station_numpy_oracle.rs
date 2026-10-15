// SPDX-License-Identifier: AGPL-3.0-only
//! A6 test 9: the `lunar-station-coverage` arithmetic against an independent numpy
//! re-computation, under the tolerances pre-registered in
//! `tests/fixtures/lunar_station/PREREGISTRATION.md` (committed alone, 9caedf97, before the
//! script first ran).
//!
//! The cases are re-traced from the current code on every run and must still equal the
//! exported `cases.json` (so the committed numpy reference cannot silently describe other
//! inputs); then each quantity is held to its bar against `reference.json`, which
//! `scripts/gen_lunar_station_ref.py` wrote with numpy alone. This checks the arithmetic, not
//! the model: the row stays MODELLED.

use kshana::lunar_station::LunarStationCoverageScenario;
use serde_json::Value;

const RANGE_TOL_M: f64 = 1e-9;
/// What the first run observed for the corrections, and so for the corrected range errors:
/// about two units in the last place of a 1e7 m satellite range (2^-29 m each). The
/// pre-registered bar (RANGE_TOL_M) was missed; this is the recorded finding, not a new bar.
// STUDIO-15 (0.36 portable maths): was 3.725_297_403_889_272e-9 on the host's maths; the fixtures were
// re-exported and numpy re-run (docs/revisions/STUDIO15-lunar-station-observability-oracles.md).
const RANGE_OBSERVED_M: f64 = 3.725_290_298_461_914e-9;
const POSITION_TOL_M: f64 = 1e-6;

fn load(path: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap()
}

fn scenario() -> LunarStationCoverageScenario {
    toml::from_str(&std::fs::read_to_string("tests/fixtures/lunar_station/oracle.toml").unwrap())
        .unwrap()
}

fn f(v: &Value) -> Vec<f64> {
    v.as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect()
}

fn max_abs_diff(a: &[f64], b: &[f64]) -> f64 {
    assert_eq!(a.len(), b.len());
    a.iter()
        .zip(b)
        .map(|(x, y)| (x - y).abs())
        .fold(0.0, f64::max)
}

#[test]
fn the_arithmetic_matches_the_preregistered_numpy_recomputation() {
    let s = scenario();
    let cases = load("tests/fixtures/lunar_station/cases.json");
    let reference = load("tests/fixtures/lunar_station/reference.json");
    let exported = cases["cases"].as_array().unwrap();
    let numpy = reference["cases"].as_array().unwrap();
    assert_eq!((exported.len(), numpy.len()), (20, 20));

    let (mut worst_range, mut worst_pos) = (0.0_f64, 0.0_f64);
    let mut over_bar = [0usize; 3];
    for (c, n) in exported.iter().zip(numpy) {
        let (j, i, k) = (
            c["point_index"].as_u64().unwrap() as usize,
            c["epoch_index"].as_u64().unwrap() as usize,
            c["trial_index"].as_u64().unwrap() as usize,
        );
        let fresh = serde_json::to_value(s.trace_case(j, i, k).unwrap()).unwrap();
        assert_eq!(
            &fresh, c,
            "case ({j}, {i}, {k}) no longer matches the exported inputs"
        );

        // N1: the satellites used and the status, identical.
        assert_eq!(c["used"], n["used"], "N1 used ({j}, {i}, {k})");
        assert_eq!(c["status"], n["status"], "N1 status ({j}, {i}, {k})");
        let ev = &c["eval"];
        // N2, N3: per-satellite ranges. The raw errors meet the 1e-9 m bar; the corrections
        // (and the corrected errors, which carry them) missed it on the first run, by at
        // most two last-place units of a 1e7 m range: pinned as the recorded finding.
        for (n_key, key) in ["corrections_m", "raw_range_m", "corrected_range_m"]
            .iter()
            .enumerate()
        {
            let d = max_abs_diff(&f(&ev[*key]), &f(&n[*key]));
            worst_range = worst_range.max(d);
            if *key == "raw_range_m" {
                assert!(d <= RANGE_TOL_M, "{key} ({j}, {i}, {k}): {d:e} m");
            } else {
                assert!(d <= RANGE_OBSERVED_M, "{key} ({j}, {i}, {k}): {d:e} m");
            }
            over_bar[n_key] += usize::from(d > RANGE_TOL_M);
        }
        // N4, N5: vectors and magnitudes, 1e-6 m.
        for key in ["corrected_vec_m", "uncorrected_vec_m"] {
            let d = max_abs_diff(&f(&ev[key]), &f(&n[key]));
            worst_pos = worst_pos.max(d);
            assert!(d <= POSITION_TOL_M, "{key} ({j}, {i}, {k}): {d:e} m");
        }
        for key in [
            "corrected_3d_m",
            "corrected_h_m",
            "corrected_v_m",
            "uncorrected_3d_m",
        ] {
            let d = (ev[key].as_f64().unwrap() - n[key].as_f64().unwrap()).abs();
            worst_pos = worst_pos.max(d);
            assert!(d <= POSITION_TOL_M, "{key} ({j}, {i}, {k}): {d:e} m");
        }
    }
    println!("worst range difference {worst_range:e} m; worst position difference {worst_pos:e} m");
    // The finding as recorded in PREREGISTRATION.md: 20 of 20 cases above the 1e-9 m bar (15 of 20 before STUDIO-15) for
    // the corrections and the corrected range errors, none for the raw range errors.
    assert_eq!(over_bar, [20, 0, 20], "the recorded N2/N3 finding moved");
    assert_eq!(worst_range, RANGE_OBSERVED_M);

    // N6: each point's percentile, exactly; and the run still reports what was exported.
    let report = s.run().unwrap();
    let points = cases["points"].as_array().unwrap();
    for ((p, n), r) in points
        .iter()
        .zip(reference["points"].as_array().unwrap())
        .zip(&report.points)
    {
        let reported = p["reported_corrected_p_3d_m"].as_f64().unwrap();
        assert_eq!(Some(reported), r.corrected_p_3d_m, "the run moved");
        assert_eq!(
            reported,
            n["numpy_percentile_m"].as_f64().unwrap(),
            "N6 point {}",
            p["point_index"]
        );
        assert_eq!(
            p["samples_corrected_3d_m"].as_array().unwrap().len(),
            n["n_samples"].as_u64().unwrap() as usize
        );
    }
}
