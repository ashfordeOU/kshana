//! Validated: the CTI running-max holdover envelope overbound-covers the real
//! BIPM [UTC−UTC(USNO)] series on a disjoint segment. Oracle: numpy/scipy
//! (scripts/gen_cti_holdover_coverage.py). See tests/fixtures/cti/NOTICE.md for
//! the honesty scope (steered operational series; overbound coverage only).

use std::fs;
use std::path::PathBuf;

use kshana::integrity::composed_pl::{hpl, HoldoverEnvelope};

fn fixture(name: &str) -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/cti")
        .join(name)
}

#[test]
fn holdover_envelope_overbound_covers_real_bipm_series() {
    let ref_json = fs::read_to_string(fixture("reference.json")).expect("reference.json present");
    let v: serde_json::Value = serde_json::from_str(&ref_json).unwrap();
    let q_wf = v["q_wf"].as_f64().unwrap();
    let ir = v["ir"].as_f64().unwrap();

    // Reconstruct the white-FM envelope in Rust with the same fit params and
    // confirm it matches the oracle envelope and covers the empirical excursions.
    let env = HoldoverEnvelope {
        q_wf,
        q_rw: 0.0,
        q_drift: 0.0,
        d_aging: 0.0,
        flicker_floor_s: 0.0,
        p0_phase_var_s2: 0.0,
    };
    let mut exceed = 0usize;
    let rows = v["rows"].as_array().unwrap();
    for row in rows {
        let tau_s = row["tau_days"].as_f64().unwrap() * 86400.0;
        let env_ns_oracle = row["envelope_ns"].as_f64().unwrap();
        let env_ns_rust = hpl(&env, ir, tau_s) * 1e9;
        assert!(
            (env_ns_rust - env_ns_oracle).abs() < 1e-6 * env_ns_oracle.max(1.0),
            "Rust envelope must match the numpy oracle"
        );
        if row["empirical_max_ns"].as_f64().unwrap() > env_ns_rust {
            exceed += 1;
        }
    }
    let frac = exceed as f64 / rows.len() as f64;
    assert!(
        frac <= ir + 1.0 / rows.len() as f64,
        "empirical exceedance {frac} must be within the target integrity risk {ir}"
    );
}
