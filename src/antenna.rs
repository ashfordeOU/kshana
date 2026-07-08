// SPDX-License-Identifier: AGPL-3.0-only
//! Orbital transmitter antenna pattern and surface capture footprint.
//!
//! This replaces the P1 hand-assertion that "a single ~40 W orbital transmitter
//! illuminates the *whole* visible hemisphere at a fixed margin" with a computed
//! footprint. The illuminated area is set by the transmit **antenna pattern** and the
//! **altitude geometry** (edge-of-disk grazing), not by a uniform-beam assumption: the
//! same EIRP that captures a surface victim near nadir is tens of dB weaker toward the
//! limb, both because the point falls far off boresight (into the aperture sidelobes)
//! and because the slant range — hence free-space path loss — grows toward the horizon.
//!
//! Two layers, with distinct evidence standards:
//!
//! * **Antenna pattern — Validated.** A circular, uniformly-illuminated parabolic
//!   aperture. The boresight gain is the closed-form `G₀ = η·(πD/λ)²` and the pattern is
//!   the Airy/aperture function `[2·J₁(x)/x]²` with `x = (πD/λ)·sin θ`. These are textbook
//!   aperture-antenna theory (Balanis, *Antenna Theory*, §12; Stutzman & Thiele). The
//!   Bessel `J₁` is the Abramowitz & Stegun 9.4.4 / 9.4.6 rational approximation and is
//!   checked in the tests against published values (`J₁(1)=0.4400506`, first zero at
//!   `x≈3.8317`, `J₁(x)/x→½` as `x→0`); the boresight gain, the −3 dB point at the
//!   half-power beamwidth, and the deep null at the first-null angle are all asserted
//!   against their closed forms.
//!
//! * **Capture footprint — Modelled.** The spherical Moon (radius
//!   [`crate::lunar::R_MOON_M`]), a nadir-pointing transmitter at altitude `h`, and the
//!   AFS received-signal level (−140.6 dBW) are a *representative* geometry, not a
//!   specific mission's link budget. It reuses the L02 [`crate::jamming::j_over_s_db`]
//!   core so the J/S numbers are consistent with the rest of the interference chain. Its
//!   role is qualitative-but-quantified: to show the captured region is a *cap* around
//!   nadir whose extent follows from altitude and pattern, and that at a modest EIRP the
//!   limb is **not** captured — refuting the whole-hemisphere claim.

use crate::jamming::{j_over_s_db, C_M_PER_S};
use crate::lunar::R_MOON_M;
use serde::Serialize;
use std::f64::consts::PI;

/// Default aperture (illumination) efficiency of a parabolic reflector. Real dishes sit
/// in the 0.55–0.65 band once spillover, taper, blockage and surface error are folded in;
/// 0.60 is the conventional representative value.
pub const DEFAULT_APERTURE_EFFICIENCY: f64 = 0.60;

/// AFS received-signal power at a lunar surface user (dBW). Matches the P1 / L01–L02
/// figure `−140.6 dBW` (= `−143.6 dBW` isotropic + `3 dBi` user antenna gain).
pub const AFS_RX_SIGNAL_DBW: f64 = -140.6;

/// J/S threshold (dB) at which a spoofing transmitter *captures* a surface victim: the
/// P1 spoof-capture criterion is `J/S ≥ 3 dB` (the false signal must arrive at least as
/// strong as the authentic one).
pub const CAPTURE_THRESHOLD_DB: f64 = 3.0;

// ---------------------------------------------------------------------------
// Bessel J₁ (Abramowitz & Stegun 9.4.4 / 9.4.6). Validated in the tests.
// ---------------------------------------------------------------------------

/// Bessel function of the first kind, order one, `J₁(x)`.
///
/// Uses the Abramowitz & Stegun rational approximations: the power-series form (9.4.4)
/// for `|x| ≤ 3` and the amplitude/phase asymptotic form (9.4.6) for `|x| > 3`. Both are
/// accurate to `< 1.3e-8` / `< 4e-8` respectively over the whole line. `J₁` is odd, so
/// negative arguments are handled by symmetry `J₁(−x) = −J₁(x)`.
pub fn bessel_j1(x: f64) -> f64 {
    let ax = x.abs();
    if ax <= 3.0 {
        // A&S 9.4.4: J₁(x) = x·P(t²), t = x/3, |ε| < 1.3e-8.
        let t2 = (x / 3.0) * (x / 3.0);
        x * (0.5
            + t2 * (-0.562_499_85
                + t2 * (0.210_935_73
                    + t2 * (-0.039_542_89
                        + t2 * (0.004_433_19 + t2 * (-0.000_317_61 + t2 * 0.000_011_09))))))
    } else {
        // A&S 9.4.6: J₁(x) = x^{-1/2}·f₁·cos(θ₁), t = 3/x, |ε| < 4e-8.
        let t = 3.0 / ax;
        let f1 = 0.797_884_56
            + t * (0.000_001_56
                + t * (0.016_596_67
                    + t * (0.000_171_05
                        + t * (-0.002_495_11 + t * (0.001_136_53 + t * (-0.000_200_33))))));
        let theta1 = ax - 2.356_194_49
            + t * (0.124_996_12
                + t * (0.000_056_50
                    + t * (-0.006_378_79
                        + t * (0.000_743_48 + t * (0.000_798_24 + t * (-0.000_291_66))))));
        let mag = f1 * theta1.cos() / ax.sqrt();
        // Restore the sign: 9.4.6 is stated for x > 0; J₁ is odd.
        if x < 0.0 {
            -mag
        } else {
            mag
        }
    }
}

// ---------------------------------------------------------------------------
// Circular aperture (uniform illumination) transmit pattern. Validated.
// ---------------------------------------------------------------------------

/// Boresight gain (dBi) of a circular aperture of diameter `diameter_m` at carrier
/// `freq_hz` with aperture efficiency `efficiency`:
/// `G₀ = 10·log₁₀( η·(π·D/λ)² )`, `λ = c/f`. Closed-form aperture theory.
pub fn boresight_gain_dbi(diameter_m: f64, freq_hz: f64, efficiency: f64) -> f64 {
    let lambda = C_M_PER_S / freq_hz;
    let g_lin = efficiency * (PI * diameter_m / lambda).powi(2);
    10.0 * g_lin.log10()
}

/// Aperture pattern gain (dBi) at off-boresight angle `theta_rad` for a uniformly
/// illuminated circular aperture: `G(θ) = G₀·[2·J₁(x)/x]²`, `x = (π·D/λ)·sin θ`. At
/// `θ = 0` the bracket has limit 1 (since `J₁(x) → x/2`), so `G(0) = G₀`. Returned in
/// dBi; the pattern factor is floored at `1e-30` (−300 dB) so exact nulls stay finite.
pub fn pattern_gain_dbi(diameter_m: f64, freq_hz: f64, efficiency: f64, theta_rad: f64) -> f64 {
    let g0 = boresight_gain_dbi(diameter_m, freq_hz, efficiency);
    let lambda = C_M_PER_S / freq_hz;
    let x = PI * diameter_m / lambda * theta_rad.sin();
    let factor = if x.abs() < 1e-12 {
        1.0
    } else {
        2.0 * bessel_j1(x) / x
    };
    g0 + 10.0 * (factor * factor).max(1e-30).log10()
}

/// Half-power (−3 dB) beamwidth (rad) of a uniform circular aperture, `≈ 1.02·λ/D`.
/// This is the full angular width between the two half-power points across the main lobe.
pub fn half_power_beamwidth_rad(diameter_m: f64, freq_hz: f64) -> f64 {
    let lambda = C_M_PER_S / freq_hz;
    1.02 * lambda / diameter_m
}

/// First-null (edge-of-main-lobe) angle from boresight (rad): `θ = asin(1.22·λ/D)`, the
/// Airy first zero. `None` if `1.22·λ/D > 1` (aperture smaller than ~1.22 wavelengths,
/// so the first null falls beyond the visible hemisphere).
pub fn first_null_angle_rad(diameter_m: f64, freq_hz: f64) -> Option<f64> {
    let lambda = C_M_PER_S / freq_hz;
    let s = 1.22 * lambda / diameter_m;
    if s > 1.0 {
        None
    } else {
        Some(s.asin())
    }
}

// ---------------------------------------------------------------------------
// Surface capture footprint. Modelled.
// ---------------------------------------------------------------------------

/// Inputs for a nadir-pointing orbital-transmitter capture-footprint sweep.
#[derive(Clone, Copy, Debug)]
pub struct FootprintParams {
    /// Transmitter altitude above the mean lunar surface (m).
    pub altitude_m: f64,
    /// Total transmit power (dBW) fed to the antenna (EIRP = this + pattern gain).
    pub p_tx_dbw: f64,
    /// Transmit antenna diameter (m).
    pub diameter_m: f64,
    /// Carrier frequency (Hz).
    pub freq_hz: f64,
    /// Aperture efficiency (0–1).
    pub efficiency: f64,
    /// AFS received-signal power at the surface victim (dBW).
    pub afs_rx_signal_dbw: f64,
    /// J/S capture threshold (dB).
    pub capture_threshold_db: f64,
    /// Number of surface grid points from nadir to the limb (inclusive, `≥ 2`).
    pub n_grid: usize,
}

impl FootprintParams {
    /// Representative parameters at `altitude_m`, `p_tx_dbw` transmit power, dish
    /// `diameter_m` at `freq_hz`, with the default efficiency, AFS signal level and
    /// capture threshold, and a `n_grid`-point sweep.
    pub fn new(
        altitude_m: f64,
        p_tx_dbw: f64,
        diameter_m: f64,
        freq_hz: f64,
        n_grid: usize,
    ) -> Self {
        Self {
            altitude_m,
            p_tx_dbw,
            diameter_m,
            freq_hz,
            efficiency: DEFAULT_APERTURE_EFFICIENCY,
            afs_rx_signal_dbw: AFS_RX_SIGNAL_DBW,
            capture_threshold_db: CAPTURE_THRESHOLD_DB,
            n_grid: n_grid.max(2),
        }
    }
}

/// One surface grid point of a capture footprint.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct FootprintPoint {
    /// Central angle at the Moon's centre between the nadir point and this point (rad).
    pub central_angle_rad: f64,
    /// Off-boresight (off-nadir, as seen from the transmitter) angle to this point (rad).
    pub off_boresight_rad: f64,
    /// Transmitter-to-surface slant range (m).
    pub slant_range_m: f64,
    /// Transmit antenna gain toward this point (dBi).
    pub gain_dbi: f64,
    /// Jammer-to-signal ratio at the victim here (dB).
    pub js_db: f64,
    /// Whether J/S at this point meets the capture threshold.
    pub captured: bool,
}

/// Result of a capture-footprint sweep.
#[derive(Clone, Debug, Serialize)]
pub struct FootprintResult {
    /// Per-point sweep from nadir (`central_angle = 0`) to the limb.
    pub points: Vec<FootprintPoint>,
    /// Central angle to the geometric horizon / limb (rad), `acos(R/(R+h))`.
    pub horizon_central_angle_rad: f64,
    /// Boresight gain of the transmit antenna (dBi).
    pub boresight_gain_dbi: f64,
    /// Area-weighted fraction of the visible disk (out to the limb) that is captured.
    pub captured_fraction: f64,
    /// Whether the limb (edge-of-disk grazing point) is captured.
    pub limb_captured: bool,
}

/// Compute the surface capture footprint of a nadir-pointing orbital transmitter.
///
/// The transmitter sits at `(0, 0, R + h)` pointing at the nadir point `(0, 0, R)`. Each
/// surface point at central angle `γ` is `R·(sin γ, 0, cos γ)`; the sweep runs from
/// `γ = 0` (nadir) to `γ = acos(R/(R+h))` (the limb, where the line of sight grazes the
/// sphere). For each point the off-boresight angle, slant range, transmit gain (aperture
/// pattern) and J/S (via [`crate::jamming::j_over_s_db`] against the AFS signal) are
/// computed, and the captured fraction is area-weighted by `sin γ` over the visible cap.
pub fn capture_footprint(p: &FootprintParams) -> FootprintResult {
    let r = R_MOON_M;
    let h = p.altitude_m;
    // Limb central angle: cos γ_max = R/(R+h) — the surface point where the line of sight
    // grazes the sphere (identical to `lunar::horizon_ground_range_m(R, h)/R`).
    let gamma_max = (r / (r + h)).acos();
    let g0 = boresight_gain_dbi(p.diameter_m, p.freq_hz, p.efficiency);
    let n = p.n_grid.max(2);

    let tx_z = r + h;
    let mut points = Vec::with_capacity(n);
    let mut weight_sum = 0.0;
    let mut weight_captured = 0.0;

    for i in 0..n {
        let gamma = gamma_max * (i as f64) / ((n - 1) as f64);
        let (sg, cg) = gamma.sin_cos();
        // Surface point and Tx→point vector.
        let sx = r * sg;
        let sz = r * cg;
        let dx = sx; // Tx x = 0
        let dz = sz - tx_z;
        let slant = (dx * dx + dz * dz).sqrt();
        // Off-boresight angle: boresight is -z (toward nadir). cos θ = ((R+h) - R cos γ)/slant.
        let cos_theta = ((tx_z - r * cg) / slant).clamp(-1.0, 1.0);
        let theta = cos_theta.acos();

        let gain = pattern_gain_dbi(p.diameter_m, p.freq_hz, p.efficiency, theta);
        // Victim modelled isotropic (0 dBi both directions); the AFS level already folds
        // in the user antenna gain. The transmitter is the L02 "jammer": EIRP = P_tx + gain.
        let js = j_over_s_db(
            p.p_tx_dbw,
            gain,
            0.0,
            slant,
            p.freq_hz,
            p.afs_rx_signal_dbw,
            0.0,
        );
        let captured = js >= p.capture_threshold_db;

        // Area weight on the sphere cap ∝ sin γ.
        let w = sg;
        weight_sum += w;
        if captured {
            weight_captured += w;
        }

        points.push(FootprintPoint {
            central_angle_rad: gamma,
            off_boresight_rad: theta,
            slant_range_m: slant,
            gain_dbi: gain,
            js_db: js,
            captured,
        });
    }

    let captured_fraction = if weight_sum > 0.0 {
        weight_captured / weight_sum
    } else {
        0.0
    };
    let limb_captured = points.last().map(|p| p.captured).unwrap_or(false);

    FootprintResult {
        points,
        horizon_central_angle_rad: gamma_max,
        boresight_gain_dbi: g0,
        captured_fraction,
        limb_captured,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    // ORACLE (Validated): published values of J₁ (Abramowitz & Stegun, Table 9.1;
    // DLMF §10.21). J₁(0)=0; J₁(1)=0.4400505857; first zero j₁,₁=3.831705970; and the
    // small-x limit J₁(x)/x → J₁'(0) = 1/2.
    #[test]
    fn bessel_j1_matches_published_values() {
        assert_eq!(bessel_j1(0.0), 0.0);
        assert!(
            (bessel_j1(1.0) - 0.440_050_585_7).abs() < 1e-7,
            "J1(1)={}",
            bessel_j1(1.0)
        );
        // First positive zero.
        assert!(
            bessel_j1(3.831_705_97).abs() < 1e-4,
            "J1(j11)={}",
            bessel_j1(3.831_705_97)
        );
        // Odd symmetry.
        assert!((bessel_j1(-1.0) + bessel_j1(1.0)).abs() < 1e-12);
        // J1'(0) = 1/2 via the small-x limit J1(x)/x.
        let h = 1e-4;
        assert!(
            (bessel_j1(h) / h - 0.5).abs() < 1e-6,
            "J1'(0)~{}",
            bessel_j1(h) / h
        );
        // Continuity across the 9.4.4 / 9.4.6 branch boundary at x = 3.
        assert!((bessel_j1(3.0 - 1e-6) - bessel_j1(3.0 + 1e-6)).abs() < 1e-6);
    }

    // ORACLE (Validated): closed-form aperture gain G₀ = η·(πD/λ)². For D=1 m, f=2.4 GHz,
    // η=0.6: λ = 0.1249135 m, πD/λ = 25.1479, squared 632.416, ×0.6 = 379.45, 10·log₁₀ =
    // 25.79 dBi — the "+26 dBi region".
    #[test]
    fn boresight_gain_closed_form() {
        let lambda = C_M_PER_S / 2.4e9;
        let expect = 10.0 * (0.6 * (PI * 1.0 / lambda).powi(2)).log10();
        let got = boresight_gain_dbi(1.0, 2.4e9, 0.6);
        assert!((got - expect).abs() < 1e-9);
        assert!((got - 25.79).abs() < 0.05, "G0 = {got} dBi");
    }

    // ORACLE (Validated): the uniform-aperture pattern is by construction −3 dB at the
    // half-power beamwidth half-angle (θ = HPBW/2 ≈ 0.51·λ/D) and hits a deep null at the
    // first-null angle asin(1.22·λ/D) (the Airy first zero, x = 1.22π ≈ 3.833).
    #[test]
    fn pattern_hpbw_and_first_null() {
        let (d, f, eff) = (1.0, 2.4e9, 0.6);
        let g0 = boresight_gain_dbi(d, f, eff);
        // At the HPBW half-angle the pattern is ~ -3 dB relative to boresight.
        let half = half_power_beamwidth_rad(d, f) / 2.0;
        let g_half = pattern_gain_dbi(d, f, eff, half);
        assert!(
            (g_half - g0 + 3.0).abs() < 0.2,
            "HPBW/2 rel gain = {} dB",
            g_half - g0
        );
        // At the first null the pattern collapses (deep null).
        let null = first_null_angle_rad(d, f).expect("aperture > 1.22 lambda");
        let g_null = pattern_gain_dbi(d, f, eff, null);
        assert!(
            g_null - g0 < -40.0,
            "first-null rel gain = {} dB",
            g_null - g0
        );
        // Boresight equals G₀.
        assert!((pattern_gain_dbi(d, f, eff, 0.0) - g0).abs() < 1e-9);
        // Small aperture (< 1.22 λ) has no first null in the hemisphere.
        assert!(first_null_angle_rad(0.05, f).is_none());
    }

    // ORACLE (Modelled): representative geometry. A 1 m dish at 2.4 GHz from 100 km with a
    // ~40 W (16.02 dBW) transmitter. Sanity: the beam captures a cap around nadir but NOT
    // the limb — refuting the P1 "whole visible hemisphere at fixed margin" assertion.
    #[test]
    fn footprint_captures_cap_not_hemisphere() {
        let p_tx = 10.0 * (40.0_f64).log10(); // 40 W -> 16.0206 dBW
        let params = FootprintParams::new(100_000.0, p_tx, 1.0, 2.4e9, 400);
        let res = capture_footprint(&params);

        // Horizon central angle = acos(R/(R+h)); off-nadir to limb = asin(R/(R+h)).
        let expect_gamma = (R_MOON_M / (R_MOON_M + 100_000.0)).acos();
        assert!((res.horizon_central_angle_rad - expect_gamma).abs() < 1e-6);

        // Nadir point: on boresight, strongly captured.
        let nadir = res.points.first().expect("at least one point");
        assert!(nadir.off_boresight_rad < 1e-9);
        assert!(
            nadir.captured && nadir.js_db > 30.0,
            "nadir J/S = {} dB",
            nadir.js_db
        );

        // Limb point: far off boresight (near the nadir-to-horizon angle) and NOT captured.
        let limb = res.points.last().expect("at least one point");
        assert!(
            limb.off_boresight_rad > 1.0,
            "limb theta = {} rad",
            limb.off_boresight_rad
        );
        assert!(
            !limb.captured && limb.js_db < 0.0,
            "limb J/S = {} dB",
            limb.js_db
        );
        assert!(!res.limb_captured);

        // The captured region is a genuine cap: a nonzero but small fraction of the disk,
        // decisively less than the whole hemisphere the P1 assertion assumed.
        assert!(
            res.captured_fraction > 0.0,
            "captured fraction = {}",
            res.captured_fraction
        );
        assert!(
            res.captured_fraction < 0.3,
            "captured fraction = {}",
            res.captured_fraction
        );

        // Capture is contiguous from nadir: once uncaptured near the limb it stays so.
        assert!(res.points[0].captured);
    }
}
