// SPDX-License-Identifier: AGPL-3.0-only
//! Paper P2, gap G8 — reachability + activeness of the perturbed lunar constellation.
//!
//! Two things the prior state lacked (the perturbed model existed but was neither reachable
//! from a scenario nor proven to change the geometry):
//!  1. the perturbed (J2 + C22 + Earth/Sun third body) constellation is runnable END-TO-END
//!     through the public `run_toml` surface (api.rs dispatch + registry), via the
//!     `perturbed = true` option on the moonlight-service-volume scenario;
//!  2. the perturbed geometry is genuinely different from the idealized Keplerian one — the
//!     flag is not cosmetic.
//!
//! The perturbed PROPAGATION itself is validated against an independent SciPy DOP853 integrator
//! in `lunar_perturbed_scipy_reference.rs`; the DOP kernel is validated against NumPy in the
//! other `validate_p2_*_independent_dop` tests. Here we only assert the wiring and activeness;
//! the resulting perturbed-geometry DOP magnitude stays honestly Modelled (a representative
//! twin, not a DE440-ephemeris product).

use kshana::api::run_toml;
use kshana::lunar_perturbed::{
    default_tolerance, elements_to_state, LunarPerturbations, PerturbedConstellation,
};
use kshana::lunar_service::{LunarConstellation, LunarSat};

/// A small, fast perturbed service-volume TOML (few sats / epochs / grid points so the per-epoch
/// numerical propagation stays cheap).
const PERTURBED_TOML: &str = r#"
kind = "moonlight-service-volume"
n_sats = 6
sma_km = 9737.4
eccentricity = 0.6
inc_deg = 57.7
argp_deg = 90.0
lat_min_deg = -90.0
lat_max_deg = -70.0
lat_step_deg = 20.0
lon_min_deg = -180.0
lon_max_deg = 180.0
lon_step_deg = 120.0
horizon_hours = 12.0
step_min = 360.0
elev_mask_deg = 5.0
pdop_threshold = 6.0
alert_limit_m = 50.0
p_hmi = 1e-4
perturbed = true
"#;

/// The perturbed scenario dispatches through the public `run_toml` surface (api.rs + registry)
/// and self-identifies as perturbed in its JSON output.
#[test]
fn perturbed_service_volume_dispatches_end_to_end() {
    let out = run_toml(PERTURBED_TOML).expect("perturbed moonlight-service-volume dispatches");
    assert!(
        out.summary.contains("moonlight-service-volume"),
        "summary: {}",
        out.summary
    );
    let v: serde_json::Value = serde_json::from_str(&out.json).expect("report is valid JSON");
    assert_eq!(
        v["perturbed"],
        serde_json::Value::Bool(true),
        "the perturbed run must flag perturbed=true in its JSON: {}",
        out.json
    );
    // The sweep actually ran over the perturbed geometry: real, finite headline numbers.
    let cov = v["coverage_pct"].as_f64().expect("coverage_pct");
    assert!(
        (0.0..=100.0).contains(&cov),
        "coverage_pct out of range: {cov}"
    );
    assert!(v["n_epochs"].as_u64().unwrap() >= 1);
    assert!(v["n_sats"].as_u64().unwrap() == 6);
}

/// The idealized run omits the `perturbed` field from its JSON (byte-compatible with the
/// pre-option output), confirming the flag is skipped when false.
#[test]
fn idealized_run_omits_perturbed_field() {
    let idealized_toml = PERTURBED_TOML.replace("perturbed = true", "perturbed = false");
    let out = run_toml(&idealized_toml).expect("idealized dispatches");
    assert!(
        !out.json.contains("perturbed"),
        "idealized JSON must omit the perturbed field: {}",
        out.json
    );
}

/// The perturbed geometry genuinely differs from the idealized Keplerian one: over a 12 h arc
/// the J2 + C22 + third-body drift moves every satellite by far more than a token amount, so the
/// `perturbed = true` path is materially different, not a relabel of the same positions.
#[test]
fn perturbed_geometry_is_materially_different_from_keplerian() {
    let n = 6usize;
    let sats: Vec<LunarSat> = (0..n)
        .map(|k| LunarSat {
            sma_m: 9_737_400.0,
            eccentricity: 0.6,
            inc_deg: 57.7,
            raan_deg: 360.0 * (k as f64) / (n as f64),
            argp_deg: 90.0,
            mean_anom_deg: 360.0 * (k as f64) / (n as f64),
        })
        .collect();
    let idealized = LunarConstellation::new(sats.clone());
    let states0 = sats
        .iter()
        .map(|s| {
            elements_to_state(
                s.sma_m,
                s.eccentricity,
                s.inc_deg,
                s.raan_deg,
                s.argp_deg,
                s.mean_anom_deg,
            )
        })
        .collect();
    let perturbed = PerturbedConstellation::new(
        states0,
        LunarPerturbations::elfo_full(),
        default_tolerance(),
    );

    let t = 12.0 * 3600.0;
    let pi = idealized.positions_mcmf(t);
    let pp = perturbed.positions_mcmf(t);
    assert_eq!(pi.len(), pp.len());
    let max_diff = pi
        .iter()
        .zip(&pp)
        .map(|(a, b)| {
            ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
        })
        .fold(0.0_f64, f64::max);
    assert!(
        max_diff > 100.0,
        "perturbed and idealized geometry differ by only {max_diff} m at 12 h — perturbation not active"
    );
}
