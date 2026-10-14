// SPDX-License-Identifier: AGPL-3.0-only
//! The Starlink Doppler-positioning proxy (`leo-pvt`, `doppler` mode, `starlink-sop` preset)
//! against the published data-set-3 percentiles of "Unveiling Starlink for PNT", NAVIGATION
//! 72(1), 2025, doi:10.33012/navi.685 (CAP-11, part).
//!
//! Pre-registration: `docs/design/evidence/cap11-starlink-doppler-proxy/PREREGISTRATION.md`.
//! Bars: the 90th-percentile 3-D error over seeds 1..200 within a factor of two of the published
//! 2 m at a 20 s window (P1) and 10 m at an 8 s window (P2). MODELLED proxy, no external oracle.
//!
//! ## Result
//!
//! First run 2026-10-14: the mask rule gave 47 deg (3 satellites in every seed's 20 s window).
//! p90 3-D error 92.2 m at 20 s and 870 m at 8 s: both bars NOT MET, on the high side.
//! Details in `docs/design/evidence/cap11-starlink-doppler-proxy/RESULTS.md`.

use serde_json::Value;

fn scenario(mask_deg: u32, seed: u64) -> String {
    format!(
        "kind = \"leo-pvt\"\nmode = \"doppler\"\nseed = {seed}\nduration_s = 20.0\nstep_s = 0.1\n\
         [user]\nlat_deg = 40.0\nlon_deg = -83.0\nheight_m = 220.0\n\
         [doppler]\nwindows_s = [8.0, 20.0]\n\
         [[system]]\nname = \"Starlink SoP\"\nleo_preset = \"starlink-sop\"\nmask_deg = {mask_deg}.0\n"
    )
}

/// The `doppler.windows` table of one run: (window s, n_sats, error_3d_m).
fn windows(mask_deg: u32, seed: u64) -> Vec<(f64, u64, f64)> {
    let out = kshana::api::run_toml(&scenario(mask_deg, seed)).expect("leo-pvt runs");
    let d: Value = serde_json::from_str(&out.json).expect("json");
    d["doppler"]["windows"]
        .as_array()
        .expect("windows")
        .iter()
        .map(|w| {
            (
                w["window_s"].as_f64().unwrap(),
                w["n_sats"].as_u64().unwrap(),
                w["error_3d_m"].as_f64().unwrap_or(f64::INFINITY),
            )
        })
        .collect()
}

fn p90(mut v: Vec<f64>) -> f64 {
    v.sort_by(|a, b| a.total_cmp(b));
    let rank = ((0.9 * v.len() as f64).ceil() as usize).clamp(1, v.len());
    v[rank - 1]
}

#[test]
fn starlink_doppler_proxy_records_the_preregistered_outcome() {
    // The pre-registered mask rule: the smallest integer mask (25..89 deg) whose 20 s window uses
    // at most 3 satellites at seed 1. Only the satellite count is read here.
    let mask = (25..90)
        .find(|&m| {
            windows(m, 1)
                .iter()
                .find(|w| w.0 == 20.0)
                .is_some_and(|w| w.1 <= 3)
        })
        .expect("a mask giving at most 3 satellites");
    let (mut e8, mut e20, mut sats) = (Vec::new(), Vec::new(), Vec::new());
    for seed in 1..=200u64 {
        for (w, n, e) in windows(mask, seed) {
            if w == 8.0 {
                e8.push(e);
            } else if w == 20.0 {
                e20.push(e);
                sats.push(n);
            }
        }
    }
    let (p8, p20) = (p90(e8), p90(e20));
    println!(
        "mask {mask} deg, satellites in the 20 s window {:?}..{:?}; p90 3-D error: 8 s {p8:.3} m, 20 s {p20:.3} m",
        sats.iter().min(),
        sats.iter().max()
    );
    // Recorded outcome (RESULTS.md): mask 47 deg, 3 satellites; P1 NOT MET (p90 92.2 m at
    // 20 s, bar 1..4 m) and P2 NOT MET (p90 870 m at 8 s, bar 5..20 m), both on the HIGH side,
    // against the prediction of an optimistic model. Both misses are asserted as misses.
    assert!(
        p20 > 4.0,
        "P1 was recorded NOT MET high (92.2 m); now {p20} m"
    );
    assert!(
        p8 > 20.0,
        "P2 was recorded NOT MET high (870 m); now {p8} m"
    );
}
