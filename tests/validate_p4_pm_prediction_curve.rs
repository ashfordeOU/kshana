// SPDX-License-Identifier: AGPL-3.0-only
//! P4 (real-time frame / EOP) — external validation of the **polar-motion** prediction-error
//! curve read off the real IERS `finals2000A` series, mirroring the UT1 curve validation.
//!
//! ## Independent reference (non-circular)
//! The oracle is an **independent NumPy re-implementation** of the persistence polar-motion
//! prediction-error statistics (`tests/fixtures/eop_prediction/eop_pm_prediction_reference.csv`,
//! produced by `generate_eop_pm_prediction_reference.py`), run offline over the SAME verbatim
//! IERS `finals2000A` rows that `frame_eop::pm_prediction_error_vs_horizon` reads. The committed
//! CSV holds `(horizon, n, rms_as, p50_as, p95_as, max_as)` computed by re-parsing the fixed-width
//! Bulletin A / Bulletin B **polar-motion** columns with Python string slicing and recomputing RMS
//! and nearest-rank percentiles with NumPy — a different language and a separate code path from
//! Kshana's Rust. Matching the NumPy output to `< 1e-9″` is a genuine cross-check of Kshana's pole
//! column parsing, day-apart sample pairing, magnitude reduction and percentile rule.
//!
//! The DATA is real: the rows are lifted byte-for-byte from the official IERS `finals2000A.all`
//! product (see the fixture header for the source URL / MJD span). The recovered pole final floor
//! (~0.07 mas rapid-minus-final, inside the IERS-published Bulletin A/B pole-accuracy band) and the
//! multi-day growth are *measured* quantities.
//!
//! ## Honesty note (what stays Modelled)
//! The predictor CHOICE (persistence, not IERS's operational algorithm) is the Modelled part; its
//! ERROR is a real measured curve. This test validates the measured curve, its independent NumPy
//! parity, and that it lands in the IERS-published Bulletin A/B polar-motion accuracy band — it
//! does not claim to reproduce IERS's exact operational pole-prediction numbers.

use kshana::eop::ARCSEC_TO_RAD;
use kshana::frame_eop::{
    pm_prediction_error_vs_horizon, polar_motion_position_error, Horizon, HorizonError,
};

/// The real IERS finals2000A slice with Bulletin B polar motion + genuine prediction rows.
const FIXTURE: &str = include_str!("fixtures/agency/eop/finals2000A_2026.txt");
/// The committed independent NumPy PM oracle output.
const REFERENCE_CSV: &str = include_str!("fixtures/eop_prediction/eop_pm_prediction_reference.csv");

/// One reference row from the committed NumPy oracle CSV (all `*_as` in arc seconds).
#[derive(Clone, Copy, Debug)]
struct RefRow {
    horizon: Horizon,
    n: usize,
    rms_as: f64,
    p50_as: f64,
    p95_as: f64,
    max_as: f64,
}

fn parse_reference(csv: &str) -> Vec<RefRow> {
    csv.lines()
        .filter(|l| !l.trim_start().starts_with('#') && !l.starts_with("horizon;"))
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(';').collect();
            let horizon = match f[0] {
                "final" => Horizon::Final,
                d => Horizon::Days(d.trim_start_matches('d').parse().unwrap()),
            };
            RefRow {
                horizon,
                n: f[1].parse().unwrap(),
                rms_as: f[2].parse().unwrap(),
                p50_as: f[3].parse().unwrap(),
                p95_as: f[4].parse().unwrap(),
                max_as: f[5].parse().unwrap(),
            }
        })
        .collect()
}

fn engine_curve() -> Vec<HorizonError> {
    pm_prediction_error_vs_horizon(
        FIXTURE,
        &[
            Horizon::Final,
            Horizon::Days(1),
            Horizon::Days(2),
            Horizon::Days(3),
            Horizon::Days(5),
            Horizon::Days(10),
        ],
    )
}

fn find(curve: &[HorizonError], h: Horizon) -> HorizonError {
    *curve
        .iter()
        .find(|e| e.horizon == h)
        .unwrap_or_else(|| panic!("PM horizon {h:?} must populate from the real fixture"))
}

/// The engine's per-horizon PM statistics (arc seconds, carried on `*_s`) equal the INDEPENDENT
/// NumPy oracle to `< 1e-9″`.
#[test]
fn pm_prediction_stats_match_numpy_oracle() {
    let reference = parse_reference(REFERENCE_CSV);
    assert!(
        reference.len() >= 6,
        "expected final + 1/2/3/5/10-day PM reference rows, got {}",
        reference.len()
    );
    let curve = engine_curve();

    for r in &reference {
        let e = find(&curve, r.horizon);
        // rms_s / p50_s / p95_s / max_s carry ARC SECONDS for the PM curve.
        assert_eq!(
            e.n, r.n,
            "PM horizon {:?}: engine paired {} samples, NumPy oracle {}",
            r.horizon, e.n, r.n
        );
        assert!(
            (e.rms_s - r.rms_as).abs() < 1e-9,
            "PM horizon {:?}: engine rms {}″ vs NumPy {}″",
            r.horizon,
            e.rms_s,
            r.rms_as
        );
        assert!(
            (e.p50_s - r.p50_as).abs() < 1e-9,
            "{:?}: p50 mismatch",
            r.horizon
        );
        assert!(
            (e.p95_s - r.p95_as).abs() < 1e-9,
            "{:?}: p95 mismatch",
            r.horizon
        );
        assert!(
            (e.max_s - r.max_as).abs() < 1e-9,
            "{:?}: max mismatch",
            r.horizon
        );
    }
    eprintln!(
        "engine vs NumPy PM oracle: {} horizons matched to < 1e-9″",
        reference.len()
    );
}

/// The rapid-minus-final pole floor sits in the IERS-published Bulletin A/B polar-motion accuracy
/// band (tens of µas to sub-mas), and the persistence pole error grows monotonically with horizon.
#[test]
fn pm_final_floor_in_iers_band_and_growth_is_monotone() {
    let curve = engine_curve();
    let floor_mas = find(&curve, Horizon::Final).rms_s * 1e3;
    assert!(
        floor_mas > 0.0 && floor_mas < 0.5,
        "PM final floor {floor_mas} mas outside the IERS-published Bulletin A/B pole band",
    );
    let seq = [
        Horizon::Final,
        Horizon::Days(1),
        Horizon::Days(2),
        Horizon::Days(3),
        Horizon::Days(5),
        Horizon::Days(10),
    ];
    let mut prev = 0.0;
    for h in seq {
        let rms_mas = find(&curve, h).rms_s * 1e3;
        assert!(
            rms_mas >= prev - 1e-9,
            "PM RMS must not decrease with horizon: {h:?} {rms_mas} mas < previous {prev}"
        );
        prev = rms_mas;
    }
    // Multi-day growth reaches the ~mas scale, well above the sub-mas floor.
    let d10_mas = find(&curve, Horizon::Days(10)).rms_s * 1e3;
    assert!(
        d10_mas > 10.0 * floor_mas,
        "10-day PM RMS {d10_mas} mas should be >> pole floor {floor_mas} mas"
    );
    eprintln!("PM final floor {floor_mas:.4} mas; grows to {d10_mas:.4} mas at 10 days");
}

/// The measured pole residual maps to a real Moon-frame position through the dedicated
/// `polar_motion_position_error` lever, at the physically-expected metre scale.
#[test]
fn pm_residual_maps_to_moon_frame_position() {
    let curve = engine_curve();
    // 1 mas of pole error at the Earth-Moon distance ≈ D_EM · 1 mas ≈ 1.86 m.
    let one_mas_rad = 1e-3 * ARCSEC_TO_RAD;
    let one_mas_m = polar_motion_position_error(one_mas_rad, 0.0);
    assert!(
        (one_mas_m - 1.864).abs() < 0.05,
        "1 mas pole -> {one_mas_m} m at Moon, expected ~1.86 m"
    );
    // The real 5-day pole residual maps to a positive, finite Moon-frame position.
    let d5 = find(&curve, Horizon::Days(5));
    let pos = polar_motion_position_error(d5.rms_s * ARCSEC_TO_RAD, 0.0);
    assert!(pos > 0.0 && pos.is_finite());
    eprintln!(
        "5-day PM RMS {:.4} mas -> {pos:.2} m at Moon",
        d5.rms_s * 1e3
    );
}
