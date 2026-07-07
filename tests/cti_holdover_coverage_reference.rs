//! Validated: the CTI running-max holdover envelope overbound-covers the real
//! BIPM [UTC−UTC(USNO)] series on a disjoint segment, for the multi-year regime
//! (τ ≥ 90 d). The Validated claim is scoped to τ ≥ 90 d; the short-τ (≤ 30 d)
//! regime is a disclosed Modelled boundary where the single-parameter white-FM
//! fit under-covers the steered series' control-action variance and coverage is
//! NOT asserted. Oracle: numpy/scipy (scripts/gen_cti_holdover_coverage.py).
//! See tests/fixtures/cti/NOTICE.md for the full honesty scope.

use std::fs;
use std::path::PathBuf;

use kshana::integrity::composed_pl::{hpl, HoldoverEnvelope};

fn fixture(name: &str) -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/cti")
        .join(name)
}

#[test]
fn holdover_envelope_overbound_covers_multiyear_regime() {
    let ref_json = fs::read_to_string(fixture("reference.json")).expect("reference.json present");
    let v: serde_json::Value = serde_json::from_str(&ref_json).unwrap();
    let q_wf = v["q_wf"].as_f64().unwrap();
    let ir = v["ir"].as_f64().unwrap();

    // Reconstruct the white-FM envelope in Rust with the same fit params and
    // confirm it matches the oracle envelope for ALL rows (envelope integrity
    // cross-check), then assert true zero-piercing on the Validated regime
    // (tau_days >= 90). Short-tau rows (< 90 d) are present but NOT asserted.
    let env = HoldoverEnvelope {
        q_wf,
        q_rw: 0.0,
        q_drift: 0.0,
        d_aging: 0.0,
        flicker_floor_s: 0.0,
        p0_phase_var_s2: 0.0,
    };
    let rows = v["rows"].as_array().unwrap();
    for row in rows {
        let tau_days = row["tau_days"].as_f64().unwrap();
        let tau_s = tau_days * 86400.0;
        let env_ns_oracle = row["envelope_ns"].as_f64().unwrap();
        let env_ns_rust = hpl(&env, ir, tau_s) * 1e9;

        // Per-row cross-check: Rust HPL must match the numpy oracle (all rows).
        assert!(
            (env_ns_rust - env_ns_oracle).abs() < 1e-6 * env_ns_oracle.max(1.0),
            "Rust envelope must match the numpy oracle at tau_days={tau_days}"
        );

        // Zero-piercing assertion on the Validated multi-year regime only.
        if tau_days >= 90.0 {
            let emp_ns = row["empirical_max_ns"].as_f64().unwrap();
            assert!(
                emp_ns <= env_ns_rust,
                "Validated regime (tau_days={tau_days} >= 90): empirical {emp_ns} ns \
                 must be <= envelope {env_ns_rust} ns (zero-piercing)"
            );
        }
        // tau_days < 90 d: disclosed Modelled short-tau boundary — NOT asserted.
    }
}
