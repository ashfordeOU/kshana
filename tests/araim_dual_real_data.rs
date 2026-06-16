// SPDX-License-Identifier: Apache-2.0
//! Real-data dual-constellation ARAIM availability.
//!
//! Vendored Celestrak GPS + Galileo TLE snapshots (2026-06-07) are propagated over
//! a 24 h grid and run through the advanced ARAIM engine. The test demonstrates the
//! multi-constellation benefit on real orbital geometry: pooling Galileo with GPS
//! raises ARAIM availability under a demanding vertical requirement.
//!
//! This is a *snapshot-epoch* study (each SGP4 satellite is propagated from its own
//! TLE epoch, the convention the engine documents for a real constellation), not a
//! single-instant sky. The numerically exact reproduction of the EU ARAIM Technical
//! Note worked example (Table A-3) against a single version-locked epoch, and a
//! Zenodo fixture record, remain external/founder-gated (see docs/ARAIM_REFERENCE.md).

use kshana::orbit::{Orbit, Propagator, R_EARTH_M};
use kshana::raim::{araim_dual_constellation_availability, DualFaultPriors, IntegrityBudget};
use kshana::tle::parse_propagators;

fn load(path: &str) -> Vec<Propagator> {
    let text = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    parse_propagators(&text).unwrap_or_else(|e| panic!("parse {path}: {e}"))
}

#[test]
fn gps_galileo_dual_constellation_availability_on_real_tles() {
    let gps = load("tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
    let gal = load("tests/fixtures/celestrak/galileo_2026-06-07.txt");
    assert!(
        gps.len() >= 24 && gal.len() >= 20,
        "snapshot sizes: {} GPS, {} Galileo",
        gps.len(),
        gal.len()
    );

    // A mid-latitude user sampled around a 24 h grid (the engine's snapshot-study
    // convention), a 5 deg mask, the ISM σ_URA = 0.75 m, and a demanding vertical
    // requirement (VAL 12 m / HAL 10 m) that a single constellation cannot always
    // meet — so the multi-constellation benefit is visible rather than saturated.
    let user = Orbit::new(
        R_EARTH_M + 400.0,
        45f64.to_radians(),
        10f64.to_radians(),
        0.0,
    );
    let (step, dur, mask, sigma) = (300.0, 86_400.0, 5.0, 0.75);
    let budget = IntegrityBudget {
        p_hmi_vert: 1e-7,
        p_hmi_horz: 1e-7,
        p_fa: 1e-5,
    };
    let (al_h, al_v) = (10.0, 12.0);

    let gps_labels = vec![0u8; gps.len()];
    let mut all: Vec<Propagator> = gps.clone();
    all.extend(gal.iter().cloned());
    let mut pooled_labels = vec![0u8; gps.len()];
    pooled_labels.resize(gps.len() + gal.len(), 1u8);

    // GPS-only, single-fault ARAIM (p_const = 0 ⇒ bit-for-bit araim_raim).
    let single_priors = DualFaultPriors {
        p_sat: 1e-5,
        p_const: 0.0,
        b_nom_m: 0.0,
    };
    let gps_only = araim_dual_constellation_availability(
        &user,
        &gps,
        &gps_labels,
        step,
        dur,
        mask,
        sigma,
        single_priors,
        budget,
        al_h,
        al_v,
    );
    // GPS + Galileo pooled, single-fault ARAIM (p_const = 0): the pure geometry gain.
    let pooled = araim_dual_constellation_availability(
        &user,
        &all,
        &pooled_labels,
        step,
        dur,
        mask,
        sigma,
        single_priors,
        budget,
        al_h,
        al_v,
    );
    // GPS + Galileo, full dual ARAIM with the constellation-wide fault hypothesis.
    let dual = araim_dual_constellation_availability(
        &user,
        &all,
        &pooled_labels,
        step,
        dur,
        mask,
        sigma,
        DualFaultPriors {
            p_sat: 1e-5,
            p_const: 1e-4,
            b_nom_m: 0.0,
        },
        budget,
        al_h,
        al_v,
    );

    // The same dual user judged against the looser APV-I vertical limit (VAL 50 m),
    // to separate the engine's capability from the demanding 12 m requirement.
    let dual_apv = araim_dual_constellation_availability(
        &user,
        &all,
        &pooled_labels,
        step,
        dur,
        mask,
        sigma,
        DualFaultPriors {
            p_sat: 1e-5,
            p_const: 1e-4,
            b_nom_m: 0.0,
        },
        budget,
        40.0,
        50.0,
    );

    let frac = |a: usize, t: usize| a as f64 / t as f64;
    let gps_av = frac(gps_only.samples_available, gps_only.samples_total);
    let pooled_av = frac(pooled.samples_available, pooled.samples_total);
    let dual_av = frac(dual.samples_available, dual.samples_total);
    let dual_apv_av = frac(dual_apv.samples_available, dual_apv.samples_total);
    let mean_vis = |r: &kshana::raim::RaimAvailabilityReport| {
        r.epochs.iter().map(|e| e.n_visible).sum::<usize>() as f64 / r.epochs.len() as f64
    };

    // (1) Geometry benefit: pooling a second constellation can only help — its visible
    // set contains GPS, so the pooled protection level is no worse and availability is
    // no lower than GPS-only over the whole grid; on real geometry the second
    // constellation also roughly doubles the satellites in view.
    assert!(
        pooled.samples_available >= gps_only.samples_available,
        "pooled availability {pooled_av:.3} should be ≥ GPS-only {gps_av:.3}"
    );
    assert!(
        mean_vis(&pooled) > mean_vis(&gps_only) + 3.0,
        "pooled mean-visible {:.1} should exceed GPS-only {:.1}",
        mean_vis(&pooled),
        mean_vis(&gps_only)
    );

    // (2) The honest cost of the constellation-wide fault hypothesis: a dual user that
    // must stay safe even if an *entire* constellation fails cannot meet a demanding
    // 12 m VAL nearly as often as the pooled single-fault solution — because the
    // residual single constellation alone cannot. This is the quantitative reason
    // robust dual-constellation integrity drives toward >2 constellations / SBAS.
    assert_eq!(dual.samples_total, gps_only.samples_total);
    assert!(
        dual_av < pooled_av,
        "constellation-fault availability {dual_av:.3} should cost vs pooled {pooled_av:.3}"
    );

    // (3) Loosening the requirement helps the constellation-fault-robust user: at the
    // APV-I limit (VAL 50 m) the dual-constellation availability is materially higher
    // than at 12 m — but with only two constellations it is still limited (surviving
    // the loss of an *entire* constellation leaves a single one to carry the fix),
    // which is exactly why robust dual-constellation integrity drives toward a third
    // constellation or SBAS augmentation.
    assert!(
        dual_apv_av > dual_av,
        "looser VAL should raise dual availability: APV-I {dual_apv_av:.3} vs 12 m {dual_av:.3}"
    );
    eprintln!(
        "ARAIM availability (real GPS+Galileo TLEs, 24 h): \
         GPS-only={gps_av:.3} pooled={pooled_av:.3} dual@12m={dual_av:.3} dual@APV-I={dual_apv_av:.3}; \
         mean-visible GPS={:.1} pooled={:.1}",
        mean_vis(&gps_only),
        mean_vis(&pooled)
    );
}
