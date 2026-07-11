// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate Kshana's P1 orbital-transmitter capture footprint
//! (`antenna::pattern_gain_dbi`, `antenna::boresight_gain_dbi`,
//! `antenna::capture_footprint`) against **independent third-party / first-
//! principles references** — promoting the footprint from Modelled to Validated.
//!
//! Two independent oracles, neither of which reuses Kshana's own arithmetic:
//!
//! 1. **Aperture pattern — `scipy.special.j1`.** Kshana's `antenna::bessel_j1`
//!    is an Abramowitz & Stegun 9.4.4 / 9.4.6 *rational approximation* of the
//!    Bessel function J1. The committed `pattern_reference.csv` was produced with
//!    `scipy.special.j1` — Cephes, a genuinely different J1 implementation. The
//!    uniform circular-aperture pattern `G(theta) = G0 + 10 log10([2 J1(x)/x]^2)`
//!    (`x = (pi D/lambda) sin theta`) computed from scipy's J1 must match
//!    `pattern_gain_dbi` to < 0.05 dB across `0..gamma_max`. Because the two J1
//!    code paths are independent, agreement is a real cross-check of the pattern.
//!
//! 2. **Footprint radiometry/geometry — independent numpy reconstruction.** The
//!    committed `sweep_reference.csv` and `geometry_reference.csv` were produced
//!    by re-deriving, from first principles in Python, every quantity Kshana's
//!    `capture_footprint` computes: the nadir-pointing-Tx slant range and off-
//!    nadir angle over a sphere of radius R, the free-space path loss
//!    `20log10 d + 20log10 f + 20log10(4 pi/c)`, and `J/S = P_tx + gain - FSPL -
//!    AFS` (both receiver gains zero, AFS the authentic-signal level). The only
//!    inputs shared with the Rust module are the physical constants and the
//!    scenario definition — not any Kshana code. Kshana's sweep must reproduce
//!    the per-point (off-boresight, slant, gain, J/S, captured) vectors and the
//!    scalar invariants (boresight gain, horizon angle, nadir/limb J/S, the area-
//!    weighted captured fraction).
//!
//! Physics honesty note: the aperture pattern has deep nulls and sidelobes, so
//! `J/S(gamma)` is strongly NON-monotone — the captured set is the main lobe plus
//! a few near-in sidelobe rings that still clear 3 dB, NOT a single contiguous
//! cap bounded by one crossing angle. The reference therefore reconstructs the
//! ENTIRE sweep point-by-point rather than a single "threshold-crossing angle"
//! (which would misrepresent the geometry). This still decisively refutes the
//! naive "whole visible hemisphere at a fixed margin" reading: only 65 of 400
//! grid points (captured_fraction ~= 0.030) clear the threshold, all clustered
//! near nadir, and the limb is NOT captured.
//!
//! The fixtures, their provenance, and the committed generator live in
//! `tests/fixtures/p1_footprint/` (`pattern_reference.csv`, `sweep_reference.csv`,
//! `geometry_reference.csv`, `NOTICE`, `generate_footprint_reference.py`).

use kshana::antenna::{
    boresight_gain_dbi, capture_footprint, pattern_gain_dbi, FootprintParams, FootprintResult,
};

const PATTERN_REF: &str = include_str!("fixtures/p1_footprint/pattern_reference.csv");
const SWEEP_REF: &str = include_str!("fixtures/p1_footprint/sweep_reference.csv");
const GEOMETRY_REF: &str = include_str!("fixtures/p1_footprint/geometry_reference.csv");

// Representative scenario (matches the committed fixtures and the P1 target).
const D_M: f64 = 1.0;
const F_HZ: f64 = 2.4e9;
const ETA: f64 = 0.60;
const H_M: f64 = 100_000.0;
const N_GRID: usize = 400;

fn p_tx_dbw() -> f64 {
    10.0 * (40.0_f64).log10() // 40 W -> 16.0206 dBW
}

/// Skip '#'-comment and blank lines.
fn data_lines(csv: &str) -> impl Iterator<Item = &str> {
    csv.lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
}

fn scenario() -> FootprintResult {
    let params = FootprintParams::new(H_M, p_tx_dbw(), D_M, F_HZ, N_GRID);
    capture_footprint(&params)
}

/// (1) Aperture pattern vs an INDEPENDENT Bessel implementation (scipy.special.j1).
///
/// Kshana uses an A&S rational-approximation J1; scipy uses Cephes. If Kshana's
/// pattern were wrong (bad J1, bad G0, wrong x scaling) this would fail: the two
/// were computed by different code from the same physical definition.
#[test]
fn pattern_matches_scipy_j1_reference() {
    let mut n = 0usize;
    let mut max_abs_dev = 0.0_f64;
    for line in data_lines(PATTERN_REF) {
        let mut it = line.split(';');
        let theta: f64 = it.next().unwrap().parse().unwrap();
        let ref_gain: f64 = it.next().unwrap().parse().unwrap();
        let got = pattern_gain_dbi(D_M, F_HZ, ETA, theta);
        let dev = (got - ref_gain).abs();
        if dev > max_abs_dev {
            max_abs_dev = dev;
        }
        assert!(
            dev < 0.05,
            "pattern gain at theta={theta:.6e} rad: Kshana={got:.6} dBi vs scipy-J1 ref={ref_gain:.6} dBi (dev {dev:.4} dB)"
        );
        n += 1;
    }
    assert!(n >= 200, "expected a dense pattern grid, got {n} rows");
    println!("pattern vs scipy.special.j1: {n} points, max |dev| = {max_abs_dev:.2e} dB (< 0.05)");
}

/// Boresight gain vs the independent reference value (closed-form G0 recomputed
/// in Python from the same D, f, eta), and vs the pinned 25.79 dBi target.
#[test]
fn boresight_gain_matches_reference() {
    let ref_g0 = geometry_value("boresight_gain_dbi");
    let got = boresight_gain_dbi(D_M, F_HZ, ETA);
    assert!(
        (got - ref_g0).abs() < 1e-6,
        "boresight gain: Kshana={got:.9} dBi vs ref={ref_g0:.9} dBi"
    );
    assert!((got - 25.79).abs() < 0.05, "G0 = {got} dBi (expect ~25.79)");
    println!("boresight gain: Kshana={got:.6} dBi vs independent ref={ref_g0:.6} dBi");
}

/// (2a) Per-point footprint sweep vs the independent numpy reconstruction.
///
/// For every grid point Kshana's off-boresight angle, slant range, transmit
/// gain, J/S and captured flag must match the independently-derived values. This
/// pins the whole radiometry/geometry chain (FSPL, spherical slant geometry, J/S)
/// to a different implementation of the same physics.
#[test]
fn sweep_matches_independent_reconstruction() {
    let res = scenario();
    let rows: Vec<&str> = data_lines(SWEEP_REF).collect();
    assert_eq!(
        rows.len(),
        res.points.len(),
        "grid length mismatch: ref {} vs engine {}",
        rows.len(),
        res.points.len()
    );
    assert_eq!(res.points.len(), N_GRID);

    let mut max_theta_dev = 0.0_f64;
    let mut max_slant_rel = 0.0_f64;
    let mut max_gain_dev = 0.0_f64;
    let mut max_js_dev = 0.0_f64;

    for (row, pt) in rows.iter().zip(res.points.iter()) {
        let f: Vec<&str> = row.split(';').collect();
        let gamma_ref: f64 = f[1].parse().unwrap();
        let theta_ref: f64 = f[2].parse().unwrap();
        let slant_ref: f64 = f[3].parse().unwrap();
        let gain_ref: f64 = f[4].parse().unwrap();
        let js_ref: f64 = f[5].parse().unwrap();
        let cap_ref: bool = f[6].trim() == "1";

        // grid position (definitional; both use gamma_max*i/(n-1))
        assert!(
            (pt.central_angle_rad - gamma_ref).abs() < 1e-9,
            "central angle: engine {} vs ref {}",
            pt.central_angle_rad,
            gamma_ref
        );
        // off-boresight angle: independent spherical geometry
        let td = (pt.off_boresight_rad - theta_ref).abs();
        max_theta_dev = max_theta_dev.max(td);
        assert!(
            td < 1e-9,
            "off-boresight dev {td:.2e} rad at gamma={gamma_ref:.6e}"
        );
        // slant range: independent chord geometry
        let sr = (pt.slant_range_m - slant_ref).abs() / slant_ref.max(1.0);
        max_slant_rel = max_slant_rel.max(sr);
        assert!(
            sr < 1e-12,
            "slant rel dev {sr:.2e} at gamma={gamma_ref:.6e}"
        );
        // transmit gain: independent scipy-J1 pattern (tolerance = pattern tol)
        let gd = (pt.gain_dbi - gain_ref).abs();
        max_gain_dev = max_gain_dev.max(gd);
        assert!(gd < 0.05, "gain dev {gd:.4} dB at gamma={gamma_ref:.6e}");
        // J/S: independent radiometry. Gain enters through the pattern, so allow
        // the pattern tolerance here too.
        let jd = (pt.js_db - js_ref).abs();
        max_js_dev = max_js_dev.max(jd);
        assert!(jd < 0.05, "J/S dev {jd:.4} dB at gamma={gamma_ref:.6e}");
        // capture decision must agree exactly (both computed from J/S vs 3 dB;
        // the < 0.05 dB J/S agreement keeps decisions identical everywhere the
        // margin exceeds that, which the num_captured invariant below confirms).
        assert_eq!(
            pt.captured, cap_ref,
            "capture flag differs at gamma={gamma_ref:.6e}: engine {} vs ref {} (engine J/S {:.4}, ref J/S {:.4})",
            pt.captured, cap_ref, pt.js_db, js_ref
        );
    }
    println!(
        "sweep vs independent reconstruction: {} points; max dev theta={:.2e} rad, slant={:.2e} rel, gain={:.2e} dB, J/S={:.2e} dB",
        res.points.len(),
        max_theta_dev,
        max_slant_rel,
        max_gain_dev,
        max_js_dev
    );
}

/// (2b) Scalar invariants + the P1 numeric target, vs the independent reference.
///
/// Horizon central angle = acos(R/(R+h)); nadir J/S > 30 dB; limb J/S < 0 dB and
/// limb NOT captured; captured fraction in (0, 0.3) and reproduced to < 1e-3.
#[test]
fn invariants_and_numeric_target() {
    let res = scenario();

    let ref_horizon = geometry_value("horizon_central_angle_rad");
    let ref_cfrac = geometry_value("captured_fraction");
    let ref_nadir = geometry_value("nadir_js_db");
    let ref_limb = geometry_value("limb_js_db");
    let ref_ncap = geometry_value("num_captured_points");

    // Horizon central angle == acos(R/(R+h)) (independently recomputed in Python).
    assert!(
        (res.horizon_central_angle_rad - ref_horizon).abs() < 1e-9,
        "horizon central angle: engine {} vs ref {}",
        res.horizon_central_angle_rad,
        ref_horizon
    );

    // Nadir point: on boresight, strongly captured, J/S > 30 dB (target).
    let nadir = res.points.first().unwrap();
    assert!(nadir.off_boresight_rad < 1e-9);
    assert!(
        nadir.captured && nadir.js_db > 30.0,
        "nadir J/S = {} dB (expect > 30)",
        nadir.js_db
    );
    assert!(
        (nadir.js_db - ref_nadir).abs() < 0.05,
        "nadir J/S: engine {} vs ref {}",
        nadir.js_db,
        ref_nadir
    );

    // Limb point: far off boresight, J/S < 0 dB, NOT captured (target).
    let limb = res.points.last().unwrap();
    assert!(!res.limb_captured, "limb must not be captured");
    assert!(!limb.captured);
    assert!(
        limb.js_db < 0.0,
        "limb J/S = {} dB (expect < 0)",
        limb.js_db
    );
    assert!(
        (limb.js_db - ref_limb).abs() < 0.05,
        "limb J/S: engine {} vs ref {}",
        limb.js_db,
        ref_limb
    );

    // Captured fraction: a genuine small set near nadir, NOT the hemisphere.
    assert!(
        res.captured_fraction > 0.0 && res.captured_fraction < 0.3,
        "captured fraction {} not in (0, 0.3)",
        res.captured_fraction
    );
    assert!(
        (res.captured_fraction - ref_cfrac).abs() < 1e-3,
        "captured fraction: engine {} vs independent ref {} (must match < 1e-3)",
        res.captured_fraction,
        ref_cfrac
    );

    // Number of captured grid points must match the independent reconstruction
    // exactly (a stricter statement than the fraction: it pins the whole capture
    // set, including the non-monotone sidelobe rings).
    let engine_ncap = res.points.iter().filter(|p| p.captured).count();
    assert_eq!(
        engine_ncap as f64, ref_ncap,
        "captured-point count: engine {} vs independent ref {}",
        engine_ncap, ref_ncap as usize
    );

    println!(
        "invariants: horizon={:.6} rad, nadir J/S={:.3} dB, limb J/S={:.3} dB, captured_fraction={:.6} ({} of {} points) — all match independent reference",
        res.horizon_central_angle_rad,
        nadir.js_db,
        limb.js_db,
        res.captured_fraction,
        engine_ncap,
        res.points.len()
    );
}

/// Fetch a scalar from geometry_reference.csv by key.
fn geometry_value(key: &str) -> f64 {
    for line in data_lines(GEOMETRY_REF) {
        let mut it = line.split(';');
        if it.next() == Some(key) {
            return it.next().unwrap().trim().parse().unwrap();
        }
    }
    panic!("key {key} not found in geometry_reference.csv");
}
