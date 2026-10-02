// SPDX-License-Identifier: AGPL-3.0-only
//! Library oracle: the detection power the `hybrid-optical-rf` report states for its
//! cross-modality chi-square monitor, against SciPy's chi-square and non-central chi-square
//! distributions.
//!
//! **Quantity.** The report's own `fault_injection` block, read from
//! [`kshana::hybrid_integrity::HybridOpticalRfScenario::run_json`], not a direct kernel call: the
//! detection threshold `chi2_threshold`, the non-centrality `noncentrality_at_mdb` at which the
//! missed-detection probability is exactly `P_md` and its square root `pbias`, the power at zero
//! fault and at the minimum detectable bias (MDB), the noise-free crossing multiple
//! `deterministic_detection_multiple_of_mdb`, and per monitored axis the separation sigma, the
//! MDB, the ramp time-to-detect and every point of the detection-power curve (fault magnitude,
//! non-centrality, power), plus the headline horizontal, vertical and timing MDB.
//!
//! **Monitor definition, taken from the specification and not from the engine's output.**
//! The monitor is the chi-square separation test of `src/cross_raim.rs` over the four axes the
//! scenario monitors (east, north, up, clock), so it has **4 degrees of freedom**; the axis
//! separation variance is **`sigma_rf^2 + sigma_opt^2`**. Per the scenario specification
//! (`HybridOpticalRfScenario` field documentation): east and north pair the RF horizontal sigma
//! (`rf_pos_sigma_m`) with the optical ranging sigma; up pairs the RF vertical sigma
//! (`rf_vertical_sigma_m`, default 1.5 times the horizontal) with the optical ranging sigma;
//! clock pairs `rf_clock_sigma_s` with the optical timing sigma. The ramp rates are
//! `fault_ramp_rate_pos_m_s` (default 0.05 m/s) on the position axes and
//! `fault_ramp_rate_clock_s_s` (default 1e-11 s/s) on the clock. The sigma magnitudes are
//! Modelled inputs; they are read from the report's `optical_link` block (the optical ones are
//! the photon-limited ranging bound the scenario computes) and enter only as scale factors.
//!
//! **Oracle (Library).** SciPy 1.18.1 (BSD-3-Clause), in
//! `tests/fixtures/hybrid_fault_power_scipy_oracle/gen_reference.py`, per configuration:
//! `T = scipy.stats.chi2.isf(P_fa, 4)`; `lambda*` from `scipy.optimize.brentq` on
//! `scipy.stats.ncx2.cdf(T, 4, lambda) - P_md`; power `scipy.stats.chi2.sf(T, 4)` at zero fault
//! and `scipy.stats.ncx2.sf(T, 4, m^2 lambda*)` at each multiple `m` of the MDB; the crossing
//! multiple `sqrt(T / lambda*)`. The test then forms, from the specification above, the MDB
//! `sqrt(lambda*) sqrt(sigma_rf^2 + sigma_opt^2)`, the curve's fault magnitude `m MDB` and
//! the ramp time `MDB / rate`.
//!
//! **Inputs.** Four configurations, committed in the fixture: the default scenario
//! (`P_fa` 1e-5, `P_md` 1e-3); `P_fa` 1e-7 with `P_md` 1e-5; `P_fa` 1e-3 with `P_md` 1e-2 and
//! RF sigmas 2.5 m horizontal, 4.0 m vertical, 1e-8 s clock and ramps 0.2 m/s and 5e-11 s/s;
//! `P_fa` 1e-6 with `P_md` 0.1. The curve ladder is the report's twelve multiples
//! 0, 0.1, 0.25, 0.5, 0.65, 0.75, 0.9, 1.0, 1.1, 1.25, 1.5, 2.0, which must match exactly.
//!
//! **Tolerance, fixed before the first comparison** (as stated in the route review): threshold
//! to 1e-9 relative; every other compared value (non-centrality, `pbias`, powers, crossing
//! multiple, separation sigma, MDB, fault magnitudes, ramp times) to 1e-6 relative; a value the
//! oracle gives as exactly zero (the zero-fault magnitude and non-centrality) must be exactly
//! zero; the degrees of freedom must be exactly 4. Every value in every configuration must pass.
//!
//! **Second pre-registration (amendment 1, written after the first comparison).** A mutation
//! that drops the optical term from the separation variance passed the four configurations
//! above: there the optical sigmas (about 1.9e-4 m and 1.3e-12 s) are about 1e-3 of the RF
//! sigmas, so the optical term moves the minimum detectable bias by about 5e-7, below the 1e-6
//! bar. The variance combination is part of the claim, so a fifth configuration is added with
//! comparable sigmas: RF 2.0e-4 m horizontal, 3.0e-4 m vertical and 1.0e-12 s clock, every
//! other input at its default. It is held in the fixture under `added_configurations`, read
//! by its own test (`report_detection_power_matches_scipy_with_comparable_sigmas`), with the
//! same oracle and the same tolerances. The first test and its four configurations are
//! unchanged.
//!
//! **Not covered here.** The `injected[]` entries (a bias written into the RF estimate and the
//! monitor re-run) are compared only with the engine's own closed form in the library tests; no
//! independent oracle reaches them. The sigma magnitudes stay Modelled.

use std::path::PathBuf;

use kshana::hybrid_integrity::HybridOpticalRfScenario;
use serde_json::Value;

/// Relative tolerance on the detection threshold, fixed before the first comparison.
const THRESHOLD_REL_TOL: f64 = 1e-9;
/// Relative tolerance on every other compared value, fixed before the first comparison.
const REL_TOL: f64 = 1e-6;
/// Degrees of freedom of the monitor, from its definition: four monitored axes.
const SPEC_DOF: u64 = 4;
/// Specification defaults of the scenario (`HybridOpticalRfScenario` field documentation).
const SPEC_VERTICAL_OVER_HORIZONTAL: f64 = 1.5;
const SPEC_RAMP_POS_M_S: f64 = 0.05;
const SPEC_RAMP_CLOCK_S_S: f64 = 1.0e-11;

fn load_reference() -> Value {
    let path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/hybrid_fault_power_scipy_oracle/reference.json");
    let raw =
        std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {}: {e}", path.display()));
    serde_json::from_str(&raw).expect("parse reference.json")
}

fn num(v: &Value, what: &str) -> f64 {
    v.as_f64()
        .unwrap_or_else(|| panic!("{what} is not a number: {v}"))
}

struct Tally {
    failures: Vec<String>,
    worst: f64,
    worst_threshold: f64,
}

impl Tally {
    fn rel(&mut self, label: String, got: f64, want: f64, tol: f64) {
        if want == 0.0 {
            if got != 0.0 {
                self.failures
                    .push(format!("{label}: engine {got:e}, oracle exactly 0"));
            }
            return;
        }
        let rel = (got - want).abs() / want.abs();
        if tol == THRESHOLD_REL_TOL {
            self.worst_threshold = self.worst_threshold.max(rel);
        } else {
            self.worst = self.worst.max(rel);
        }
        if rel.is_nan() || rel > tol {
            self.failures.push(format!(
                "{label}: engine {got:.15e} vs SciPy {want:.15e}, relative {rel:.3e} > {tol:e}"
            ));
        }
    }
}

/// Compare one configuration of the report against its SciPy reference values.
fn check_configuration(cfg: &Value, ladder: &[f64], t: &mut Tally) {
    let name = cfg["name"].as_str().expect("name");
    let scenario_json = &cfg["scenario"];
    let scenario: HybridOpticalRfScenario =
        serde_json::from_value(scenario_json.clone()).expect("scenario inputs");
    let (json, _) = scenario.run_json().expect("scenario runs");
    let report: Value = serde_json::from_str(&json).expect("report JSON");
    let f = &report["fault_injection"];
    let ol = &report["optical_link"];

    assert_eq!(f["dof"].as_u64(), Some(SPEC_DOF), "{name}: dof");
    assert_eq!(cfg["dof"].as_u64(), Some(SPEC_DOF), "{name}: oracle dof");

    let threshold = num(&cfg["threshold"], "threshold");
    let lambda_star = num(&cfg["lambda_star"], "lambda_star");
    let root_lambda = num(&cfg["root_lambda_star"], "root_lambda_star");
    t.rel(
        format!("{name} chi2_threshold"),
        num(&f["chi2_threshold"], "chi2_threshold"),
        threshold,
        THRESHOLD_REL_TOL,
    );
    t.rel(
        format!("{name} cross_modality_raim.chi2_threshold"),
        num(
            &report["cross_modality_raim"]["chi2_threshold"],
            "cross chi2_threshold",
        ),
        threshold,
        THRESHOLD_REL_TOL,
    );
    for (key, want) in [
        ("noncentrality_at_mdb", lambda_star),
        ("pbias", root_lambda),
        ("p_detect_at_zero_fault", num(&cfg["p_detect_zero"], "p0")),
        ("p_detect_at_mdb", num(&cfg["p_detect_at_mdb"], "pmdb")),
        (
            "deterministic_detection_multiple_of_mdb",
            num(&cfg["crossing_multiple"], "crossing"),
        ),
    ] {
        t.rel(format!("{name} {key}"), num(&f[key], key), want, REL_TOL);
    }

    // Axis sigmas from the specification's pairing, magnitudes from the report.
    let rf_h = num(&ol["rf_position_sigma_m"], "rf_position_sigma_m");
    let rf_v = scenario_json["rf_vertical_sigma_m"]
        .as_f64()
        .unwrap_or(SPEC_VERTICAL_OVER_HORIZONTAL * rf_h);
    let rf_c = num(&ol["rf_clock_sigma_s"], "rf_clock_sigma_s");
    let opt_r = num(&ol["optical_ranging_sigma_m"], "optical_ranging_sigma_m");
    let opt_t = num(&ol["optical_timing_sigma_s"], "optical_timing_sigma_s");
    let ramp_pos = scenario_json["fault_ramp_rate_pos_m_s"]
        .as_f64()
        .unwrap_or(SPEC_RAMP_POS_M_S);
    let ramp_clk = scenario_json["fault_ramp_rate_clock_s_s"]
        .as_f64()
        .unwrap_or(SPEC_RAMP_CLOCK_S_S);
    let spec_axes = [
        ("east", rf_h, opt_r, ramp_pos),
        ("north", rf_h, opt_r, ramp_pos),
        ("up", rf_v, opt_r, ramp_pos),
        ("clock", rf_c, opt_t, ramp_clk),
    ];
    let axes = f["axes"].as_array().expect("axes");
    assert_eq!(axes.len(), spec_axes.len(), "{name}: four monitored axes");
    let curve_p: Vec<f64> = cfg["p_detect_curve"]
        .as_array()
        .expect("p_detect_curve")
        .iter()
        .map(|p| num(p, "p_detect"))
        .collect();
    assert_eq!(curve_p.len(), ladder.len());

    for (ax, (axis_name, s_rf, s_opt, ramp)) in axes.iter().zip(spec_axes) {
        assert_eq!(ax["name"].as_str(), Some(axis_name), "{name}: axis order");
        let sigma_sep = (s_rf * s_rf + s_opt * s_opt).sqrt();
        let mdb = root_lambda * sigma_sep;
        let label = format!("{name} {axis_name}");
        t.rel(
            format!("{label} sigma_separation"),
            num(&ax["sigma_separation"], "sigma_separation"),
            sigma_sep,
            REL_TOL,
        );
        t.rel(
            format!("{label} minimum_detectable_bias"),
            num(&ax["minimum_detectable_bias"], "mdb"),
            mdb,
            REL_TOL,
        );
        t.rel(
            format!("{label} ramp_time_to_detect_s"),
            num(&ax["ramp_time_to_detect_s"], "ramp time"),
            mdb / ramp,
            REL_TOL,
        );
        let headline = match axis_name {
            "east" => Some("mdb_horizontal_m"),
            "up" => Some("mdb_vertical_m"),
            "clock" => Some("mdb_timing_s"),
            _ => None,
        };
        if let Some(key) = headline {
            t.rel(format!("{name} {key}"), num(&f[key], key), mdb, REL_TOL);
        }
        let curve = ax["detection_power_curve"].as_array().expect("curve");
        assert_eq!(curve.len(), ladder.len(), "{label}: curve length");
        for ((pt, &m), &p) in curve.iter().zip(ladder).zip(&curve_p) {
            assert_eq!(
                num(&pt["fault_multiple_of_mdb"], "multiple"),
                m,
                "{label}: ladder"
            );
            t.rel(
                format!("{label} m={m} fault_magnitude"),
                num(&pt["fault_magnitude"], "fault_magnitude"),
                m * mdb,
                REL_TOL,
            );
            t.rel(
                format!("{label} m={m} noncentrality"),
                num(&pt["noncentrality"], "noncentrality"),
                m * m * lambda_star,
                REL_TOL,
            );
            t.rel(
                format!("{label} m={m} p_detect"),
                num(&pt["p_detect"], "p_detect"),
                p,
                REL_TOL,
            );
        }
    }
}

#[test]
fn report_detection_power_matches_scipy_chi2_and_ncx2() {
    let reference = load_reference();
    let configs = reference["configurations"]
        .as_array()
        .expect("configurations");
    assert_eq!(configs.len(), 4, "four committed configurations");
    let ladder: Vec<f64> = reference["multiples"]
        .as_array()
        .expect("multiples")
        .iter()
        .map(|m| num(m, "multiple"))
        .collect();

    let mut t = Tally {
        failures: Vec::new(),
        worst: 0.0,
        worst_threshold: 0.0,
    };
    for cfg in configs {
        check_configuration(cfg, &ladder, &mut t);
    }
    eprintln!(
        "hybrid-optical-rf detection power vs SciPy: worst relative error {:.3e} (tolerance \
         {REL_TOL:e}), threshold {:.3e} (tolerance {THRESHOLD_REL_TOL:e})",
        t.worst, t.worst_threshold
    );
    assert!(
        t.failures.is_empty(),
        "{} disagreement(s):\n{}",
        t.failures.len(),
        t.failures.join("\n")
    );
}

#[test]
fn report_detection_power_matches_scipy_with_comparable_sigmas() {
    let reference = load_reference();
    let configs = reference["added_configurations"]
        .as_array()
        .expect("added_configurations");
    assert_eq!(configs.len(), 1, "one added configuration");
    let ladder: Vec<f64> = reference["multiples"]
        .as_array()
        .expect("multiples")
        .iter()
        .map(|m| num(m, "multiple"))
        .collect();
    let mut t = Tally {
        failures: Vec::new(),
        worst: 0.0,
        worst_threshold: 0.0,
    };
    for cfg in configs {
        check_configuration(cfg, &ladder, &mut t);
    }
    eprintln!(
        "hybrid-optical-rf detection power vs SciPy, comparable sigmas: worst relative error \
         {:.3e} (tolerance {REL_TOL:e}), threshold {:.3e} (tolerance {THRESHOLD_REL_TOL:e})",
        t.worst, t.worst_threshold
    );
    assert!(
        t.failures.is_empty(),
        "{} disagreement(s):\n{}",
        t.failures.len(),
        t.failures.join("\n")
    );
}
