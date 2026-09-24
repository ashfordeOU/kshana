// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data dual-constellation ARAIM availability.
//!
//! Vendored Celestrak GPS + Galileo TLE snapshots (2026-06-07) are propagated over
//! a 24 h grid and run through the advanced ARAIM engine (`araim_dual_raim`, the
//! per-epoch core of `araim_dual_constellation_availability`).
//!
//! **Geometry: one common epoch.** A Celestrak group file is not a single-instant
//! sky: each element set carries its own epoch, and in these fixtures the epochs
//! span 70.6 h (GPS) and 335.7 h (Galileo). `parse_propagators` keeps only the
//! propagator, so feeding its output to `araim_dual_constellation_availability`
//! applies `tsince = t` to every satellite from *its own* epoch and places the
//! satellites at mutually inconsistent times (see docs/REAL_TLE_GUIDE.md §3). This
//! file therefore parses each set with `parse_tle`, keeps `Tle::epoch_days_1950`,
//! and evaluates every satellite at the same absolute instant: scenario time `t = 0`
//! is the latest TLE epoch in the combined GPS + Galileo set, and satellite `i` is
//! propagated to `tsince_i = (t_ref − epoch_i) · 86 400 s + t`. The availability
//! loop below mirrors `araim_dual_constellation_availability` line for line; a
//! self-check pins that equivalence against the engine function on the unaligned
//! input, so the only difference between the two geometries is the time alignment.
//!
//! **What this file does NOT do.** Every assertion below is a *relation* the answer
//! must satisfy — pooling a constellation cannot raise a protection level, the
//! constellation-fault hypothesis must cost availability, a looser alert limit must
//! help — plus a floor on the aligned figures measured here. Those are
//! self-consistency properties; none of them says what a protection level should be.
//! The external oracle — the WG-C ARAIM Technical Subgroup's own published worked
//! numerical example, reproduced to the tolerance that reference itself specifies —
//! lives in `tests/araim_reference_vectors.rs`. The 15–25 % availability figure
//! against a single version-locked epoch, and a Zenodo fixture record, remain
//! external/founder-gated (see docs/ARAIM_REFERENCE.md).

use kshana::orbit::{earth_occults, elevation_deg, Orbit, Propagator, R_EARTH_M};
use kshana::raim::{
    araim_dual_constellation_availability, araim_dual_raim, DualFaultPriors, IntegrityBudget,
};
use kshana::sgp4::GravModel;
use kshana::tle::{parse_propagators, parse_tle};

const GPS_PATH: &str = "tests/fixtures/celestrak/gps-ops_2026-06-07.txt";
const GAL_PATH: &str = "tests/fixtures/celestrak/galileo_2026-06-07.txt";

/// Parse a TLE block into `(SGP4 propagator, epoch in days since 1950 Jan 0.0)`
/// pairs, built exactly as `parse_propagators` builds them (default WGS-72,
/// improved mode) but keeping the epoch `parse_propagators` drops.
fn load_with_epochs(path: &str) -> Vec<(Propagator, f64)> {
    let text = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    let grav = GravModel::default().constants();
    let lines: Vec<&str> = text.lines().map(str::trim).collect();
    let mut out = Vec::new();
    let mut i = 0;
    while i < lines.len() {
        if lines[i].starts_with("1 ") && i + 1 < lines.len() && lines[i + 1].starts_with("2 ") {
            let tle =
                parse_tle(lines[i], lines[i + 1]).unwrap_or_else(|e| panic!("parse {path}: {e}"));
            out.push((
                Propagator::Sgp4(Box::new(tle.to_sgp4(grav, false))),
                tle.epoch_days_1950,
            ));
            i += 2;
        } else {
            i += 1; // name line
        }
    }
    // Same satellite set, same order as the library parser.
    let lib = parse_propagators(&text).unwrap_or_else(|e| panic!("parse {path}: {e}"));
    assert_eq!(out.len(), lib.len(), "{path}: epoch-keeping parse diverged");
    for ((p, _), q) in out.iter().zip(lib.iter()) {
        assert_eq!(p.position_eci(0.0), q.position_eci(0.0));
    }
    out
}

struct Avail {
    available: usize,
    total: usize,
    mean_visible: f64,
    n_visible: Vec<usize>,
}

impl Avail {
    fn frac(&self) -> f64 {
        self.available as f64 / self.total as f64
    }
}

/// The per-epoch loop of `araim_dual_constellation_availability`, with satellite
/// `i` evaluated at `t + offset_s[i]` (its own `tsince`) instead of `t`.
#[allow(clippy::too_many_arguments)]
fn availability(
    user: &Orbit,
    gnss: &[Propagator],
    offset_s: &[f64],
    labels: &[u8],
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    sigma_m: f64,
    priors: DualFaultPriors,
    budget: IntegrityBudget,
    al_h_m: f64,
    al_v_m: f64,
) -> Avail {
    let n = (duration_s / step_s).round() as usize;
    let (mut available, mut n_visible) = (0usize, Vec::with_capacity(n + 1));
    for k in 0..=n {
        let t = k as f64 * step_s;
        let up = user.position_eci(t);
        let (mut sats, mut vis_labels) = (Vec::new(), Vec::new());
        for ((g, &off), &label) in gnss.iter().zip(offset_s).zip(labels) {
            let sp = g.position_eci(t + off);
            if !earth_occults(up, sp) && elevation_deg(up, sp) >= mask_deg {
                sats.push(sp);
                vis_labels.push(label);
            }
        }
        let resid = vec![0.0; sats.len()];
        if let Some(r) = araim_dual_raim(up, &sats, &vis_labels, &resid, sigma_m, priors, budget) {
            if r.hpl_m <= al_h_m && r.vpl_m <= al_v_m {
                available += 1;
            }
        }
        n_visible.push(sats.len());
    }
    let total = n_visible.len();
    Avail {
        available,
        total,
        mean_visible: n_visible.iter().sum::<usize>() as f64 / total as f64,
        n_visible,
    }
}

#[test]
fn gps_galileo_dual_constellation_availability_on_real_tles() {
    let gps = load_with_epochs(GPS_PATH);
    let gal = load_with_epochs(GAL_PATH);
    assert!(
        gps.len() >= 24 && gal.len() >= 20,
        "snapshot sizes: {} GPS, {} Galileo",
        gps.len(),
        gal.len()
    );

    // The epoch spread the scrambled convention ignores (docs/REAL_TLE_GUIDE.md §3).
    let spread_h = |s: &[(Propagator, f64)]| {
        let (lo, hi) = s.iter().fold((f64::MAX, f64::MIN), |(lo, hi), &(_, e)| {
            (lo.min(e), hi.max(e))
        });
        (hi - lo) * 24.0
    };
    let (gps_spread_h, gal_spread_h) = (spread_h(&gps), spread_h(&gal));
    assert!(
        (gps_spread_h - 70.6).abs() < 0.05 && (gal_spread_h - 335.7).abs() < 0.05,
        "epoch spread GPS {gps_spread_h:.2} h, Galileo {gal_spread_h:.2} h"
    );

    // Common reference instant: the latest TLE epoch in the combined set (2026 day
    // 158.30629850, i.e. 2026-06-07T07:21:04 UTC), so every satellite is propagated
    // forward from its own epoch to the same UTC instant.
    let t_ref_days = gps
        .iter()
        .chain(gal.iter())
        .map(|&(_, e)| e)
        .fold(f64::MIN, f64::max);

    let gps_props: Vec<Propagator> = gps.iter().map(|(p, _)| p.clone()).collect();
    let mut all: Vec<Propagator> = gps_props.clone();
    all.extend(gal.iter().map(|(p, _)| p.clone()));
    let aligned_offsets: Vec<f64> = gps
        .iter()
        .chain(gal.iter())
        .map(|&(_, e)| (t_ref_days - e) * 86_400.0)
        .collect();
    let gps_aligned_offsets = &aligned_offsets[..gps.len()];
    let zero_offsets = vec![0.0; all.len()];

    let gps_labels = vec![0u8; gps.len()];
    let mut pooled_labels = vec![0u8; gps.len()];
    pooled_labels.resize(gps.len() + gal.len(), 1u8);

    // A 45°-inclined 400 km LEO user sampled on a 24 h grid, a 5 deg mask, the ISM
    // σ_URA = 0.75 m, and a demanding vertical requirement (VAL 12 m / HAL 10 m).
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
    // p_const = 0 ⇒ single-fault ARAIM, bit-for-bit araim_raim.
    let single_priors = DualFaultPriors {
        p_sat: 1e-5,
        p_const: 0.0,
        b_nom_m: 0.0,
    };
    let dual_priors = DualFaultPriors {
        p_sat: 1e-5,
        p_const: 1e-4,
        b_nom_m: 0.0,
    };

    // (0) Self-check: with zero offsets the loop above IS the engine function. The
    // engine is run on the raw `parse_propagators` output (each satellite from its own
    // epoch) and must match the loop sample for sample, so the aligned figures below
    // differ from the engine's only by the time alignment.
    for (props, labels, priors) in [
        (&gps_props, &gps_labels, single_priors),
        (&all, &pooled_labels, dual_priors),
    ] {
        let engine = araim_dual_constellation_availability(
            &user, props, labels, step, dur, mask, sigma, priors, budget, al_h, al_v,
        );
        let mirror = availability(
            &user,
            props,
            &zero_offsets[..props.len()],
            labels,
            step,
            dur,
            mask,
            sigma,
            priors,
            budget,
            al_h,
            al_v,
        );
        assert_eq!(engine.samples_total, mirror.total);
        assert_eq!(engine.samples_available, mirror.available);
        let engine_vis: Vec<usize> = engine.epochs.iter().map(|e| e.n_visible).collect();
        assert_eq!(engine_vis, mirror.n_visible);
    }
    // The unaligned (per-satellite-epoch) figures, reported for the record only: they
    // describe a sky that never existed and are not a result.
    let scrambled = |props: &[Propagator], labels: &[u8], priors, al_h, al_v| {
        availability(
            &user,
            props,
            &zero_offsets[..props.len()],
            labels,
            step,
            dur,
            mask,
            sigma,
            priors,
            budget,
            al_h,
            al_v,
        )
        .frac()
    };
    let s_gps = scrambled(&gps_props, &gps_labels, single_priors, al_h, al_v);
    let s_pooled = scrambled(&all, &pooled_labels, single_priors, al_h, al_v);
    let s_dual = scrambled(&all, &pooled_labels, dual_priors, al_h, al_v);

    // Aligned geometry: every satellite at the common reference instant.
    let run = |props: &[Propagator], offs: &[f64], labels: &[u8], priors, al_h, al_v| {
        availability(
            &user, props, offs, labels, step, dur, mask, sigma, priors, budget, al_h, al_v,
        )
    };
    let gps_only = run(
        &gps_props,
        gps_aligned_offsets,
        &gps_labels,
        single_priors,
        al_h,
        al_v,
    );
    let pooled = run(
        &all,
        &aligned_offsets,
        &pooled_labels,
        single_priors,
        al_h,
        al_v,
    );
    let dual = run(
        &all,
        &aligned_offsets,
        &pooled_labels,
        dual_priors,
        al_h,
        al_v,
    );
    // The same dual user against the looser APV-I vertical limit (VAL 50 m).
    let dual_apv = run(
        &all,
        &aligned_offsets,
        &pooled_labels,
        dual_priors,
        40.0,
        50.0,
    );
    let (gps_av, pooled_av, dual_av, dual_apv_av) =
        (gps_only.frac(), pooled.frac(), dual.frac(), dual_apv.frac());

    eprintln!(
        "ARAIM availability (real GPS+Galileo TLEs, 24 h, common epoch = latest TLE epoch): \
         GPS-only={gps_av:.3} pooled={pooled_av:.3} dual@12m={dual_av:.3} dual@APV-I={dual_apv_av:.3}; \
         mean-visible GPS={:.1} pooled={:.1}; samples={} available={}/{}/{}/{} \
         [unaligned per-satellite-epoch, not a result: GPS-only={s_gps:.3} pooled={s_pooled:.3} \
         dual@12m={s_dual:.3}]",
        gps_only.mean_visible,
        pooled.mean_visible,
        gps_only.total,
        gps_only.available,
        pooled.available,
        dual.available,
        dual_apv.available
    );

    // (1) Geometry benefit: pooling a second constellation can only help — its visible
    // set contains GPS, so availability is no lower than GPS-only; on real geometry the
    // second constellation also roughly doubles the satellites in view.
    assert!(
        pooled.available >= gps_only.available,
        "pooled availability {pooled_av:.3} should be ≥ GPS-only {gps_av:.3}"
    );
    assert!(
        pooled.mean_visible > gps_only.mean_visible + 3.0,
        "pooled mean-visible {:.1} should exceed GPS-only {:.1}",
        pooled.mean_visible,
        gps_only.mean_visible
    );

    // (2) The constellation-wide fault hypothesis has a cost: a dual user that must stay
    // safe if an *entire* constellation fails meets the 12 m VAL at strictly fewer
    // samples than the pooled single-fault solution (measured: 286 vs 289 of 289).
    assert_eq!(dual.total, gps_only.total);
    assert!(
        dual.available < pooled.available,
        "constellation-fault availability {dual_av:.3} should cost vs pooled {pooled_av:.3}"
    );

    // (3) Loosening the requirement helps the constellation-fault-robust user: at the
    // APV-I limit (VAL 50 m) it is available at strictly more samples than at 12 m
    // (measured: 289 vs 286 of 289).
    assert!(
        dual_apv.available > dual.available,
        "looser VAL should raise dual availability: APV-I {dual_apv_av:.3} vs 12 m {dual_av:.3}"
    );

    // (4) The aligned measurement itself (289 samples; available GPS-only 287, pooled
    // 289, dual@12m 286, dual@APV-I 289, i.e. 0.993 / 1.000 / 0.990 / 1.000). On a
    // consistent sky one full GPS constellation already meets the 12 m VAL almost
    // everywhere; pooling Galileo closes the remaining gap, and the
    // constellation-fault-robust mode stays at ≥ 0.99 with two constellations. The
    // same figures are obtained with the *earliest* TLE epoch as the reference
    // instant. Each floor is one sample below the measurement; all of them fail on the
    // unaligned per-satellite-epoch geometry (0.208 / 0.671 / 0.031).
    assert!(gps_only.available >= 286, "aligned GPS-only {gps_av:.3}");
    assert_eq!(
        pooled.available, pooled.total,
        "aligned pooled {pooled_av:.3}"
    );
    assert!(dual.available >= 285, "aligned dual@12m {dual_av:.3}");
    assert_eq!(
        dual_apv.available, dual_apv.total,
        "aligned dual@APV-I {dual_apv_av:.3}"
    );
}
