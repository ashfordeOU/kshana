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
use crate::sweep::SweepAxis;
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

/// Central angle at the Moon's centre from the nadir point to the **limb** — the surface
/// point where the line of sight from altitude `altitude_m` grazes the sphere:
/// `γ_max = acos(R/(R+h))` (identical to `lunar::horizon_ground_range_m(R, h)/R`).
pub fn limb_central_angle_rad(altitude_m: f64) -> f64 {
    (R_MOON_M / (R_MOON_M + altitude_m)).acos()
}

/// Geometry + link at one surface point of central angle `gamma`, returned together with
/// `sin γ` (the cap area weight, so the caller need not recompute the sine).
///
/// Factored out of [`capture_footprint`] so that the full nadir→limb sweep and the
/// limb-only evaluation used by the altitude × beamwidth sweep ([`capture_footprint_sweep`])
/// execute *the same* arithmetic in the same order — they can never disagree by a rounding
/// step. The unit tests assert that identity bit-for-bit.
fn footprint_point_at(p: &FootprintParams, gamma: f64) -> (FootprintPoint, f64) {
    let r = R_MOON_M;
    let tx_z = r + p.altitude_m;
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

    (
        FootprintPoint {
            central_angle_rad: gamma,
            off_boresight_rad: theta,
            slant_range_m: slant,
            gain_dbi: gain,
            js_db: js,
            captured,
        },
        sg,
    )
}

/// The limb point alone (the last point a full [`capture_footprint`] sweep would emit),
/// without walking the whole nadir→limb grid. Used by the limb-threshold search.
///
/// The central angle is deliberately written as `γ_max·(n−1)/(n−1)` rather than `γ_max`:
/// that is the expression the sweep's last sample actually evaluates, and in IEEE-754 the
/// two differ by one ULP (the multiply happens before the divide). One ULP of γ is
/// physically nothing, but the limb threshold must be located against *exactly* the value
/// the grid rows report, or a located crossing and the row beside it could disagree about
/// which side of the threshold they are on.
pub fn limb_point(p: &FootprintParams) -> FootprintPoint {
    let n = p.n_grid.max(2);
    let gamma = limb_central_angle_rad(p.altitude_m) * ((n - 1) as f64) / ((n - 1) as f64);
    footprint_point_at(p, gamma).0
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
    let gamma_max = limb_central_angle_rad(p.altitude_m);
    let g0 = boresight_gain_dbi(p.diameter_m, p.freq_hz, p.efficiency);
    let n = p.n_grid.max(2);

    let mut points = Vec::with_capacity(n);
    let mut weight_sum = 0.0;
    let mut weight_captured = 0.0;

    for i in 0..n {
        let gamma = gamma_max * (i as f64) / ((n - 1) as f64);
        let (pt, sin_gamma) = footprint_point_at(p, gamma);

        // Area weight on the sphere cap ∝ sin γ.
        let w = sin_gamma;
        weight_sum += w;
        if pt.captured {
            weight_captured += w;
        }

        points.push(pt);
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

// ---------------------------------------------------------------------------
// Altitude × beamwidth capture-footprint sweep. Modelled.
//
// A single `capture_footprint` call answers the question at ONE operating point: one
// altitude, one dish, hence one beamwidth. The P1 headline "3.0 % of the visible disk"
// is that single point, and on its own it cannot say whether the cap is small because
// the beam is narrow, because the transmitter is low, or both. This sweep runs the same
// footprint over the Cartesian product of a transmitter-altitude axis and a dish-diameter
// axis (reported with the half-power beamwidth each diameter implies, since the paper
// speaks in beamwidth) and emits it in LONG FORM — one row per (altitude, beamwidth)
// point, never a nested array, so a truncated table cannot still look whole.
//
// Limb capture is reported as a THRESHOLD, not a boolean at one point:
//   * per row, the limb J/S, its margin against the capture threshold, and the transmit
//     power at which that operating point *would* capture the limb (exact: J/S is linear
//     in dBW, so `P* = P_tx + (threshold − limb J/S)`);
//   * per grid, the axis coordinates where limb capture actually switches on, located by
//     bracketing a sign change between adjacent samples and bisecting inside it — and,
//     when no such bracket exists anywhere, an explicit "not reached on this grid"
//     statement carrying the best limb J/S and how many dB short it is. Absence is
//     reported as absence, never as zero.
// ---------------------------------------------------------------------------

/// Bisection iterations used to refine a bracketed limb-capture crossing. 100 halvings
/// drive any physical interval well below double precision, and each step costs one
/// limb-point evaluation, so there is nothing to gain by stopping early.
const LIMB_BISECT_ITERS: usize = 100;

/// One row of an altitude × beamwidth capture-footprint sweep: exactly one operating
/// point, self-contained. Long form — the grid is a `Vec` of these, not a nested array.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct FootprintSweepPoint {
    /// Transmitter altitude at this grid point (m).
    pub altitude_m: f64,
    /// Transmit dish diameter at this grid point (m).
    pub diameter_m: f64,
    /// Half-power beamwidth the diameter implies at the carrier (rad), `≈ 1.02·λ/D`.
    pub hpbw_rad: f64,
    /// The same beamwidth in degrees — the unit the paper quotes.
    pub hpbw_deg: f64,
    /// Boresight gain at this diameter (dBi).
    pub boresight_gain_dbi: f64,
    /// Central angle to the limb at this altitude (rad).
    pub horizon_central_angle_rad: f64,
    /// Area-weighted fraction of the visible disk captured at this operating point.
    pub captured_fraction: f64,
    /// J/S at the limb (dB) at this operating point.
    pub limb_js_db: f64,
    /// Whether the limb is captured here.
    pub limb_captured: bool,
    /// Limb J/S minus the capture threshold (dB): negative means the limb falls short by
    /// exactly this many dB.
    pub limb_margin_db: f64,
    /// Transmit power (dBW) at which *this* operating point captures the limb — the
    /// threshold form of `limb_captured`. Exact, because J/S moves dB-for-dB with `P_tx`.
    pub limb_capture_tx_power_dbw: f64,
}

/// A located boundary: the coordinate on one swept axis at which limb capture switches
/// on or off, with the other axis held at a grid value.
#[derive(Clone, Debug, Serialize)]
pub struct LimbCrossing {
    /// Which axis the crossing is on (`transmitter_altitude_m` or `antenna_diameter_m`).
    pub axis: String,
    /// The crossing coordinate on that axis.
    pub value: f64,
    /// Half-power beamwidth at the crossing (deg) — stated for both axes, since altitude
    /// crossings still happen at a particular beamwidth.
    pub hpbw_deg: f64,
    /// The axis held fixed while searching.
    pub held_parameter: String,
    /// Its value.
    pub held_value: f64,
    /// Limb J/S at the located crossing (dB); equals the capture threshold to bisection
    /// precision — that equality is what makes this a crossing rather than an assertion.
    pub limb_js_db: f64,
}

/// Limb capture stated as a threshold over the swept grid, rather than as a boolean at a
/// single operating point.
#[derive(Clone, Debug, Serialize)]
pub struct LimbThreshold {
    /// Whether limb capture occurs anywhere on the swept grid (at a sampled point or at a
    /// located crossing between samples). `false` means **not reached on this grid** — an
    /// explicit absence, which is not the same as a captured fraction of zero.
    pub reached: bool,
    /// Plain-language statement of the threshold, including the grid it was searched over
    /// and, when the limb is never reached, by how many dB it is missed.
    pub statement: String,
    /// Every located boundary, one per bracketed sign change on either axis. Empty when
    /// the limb is not reached anywhere on the grid.
    pub crossings: Vec<LimbCrossing>,
    /// Best (highest) limb J/S found at any sampled grid point (dB).
    pub best_limb_js_db: f64,
    /// How far that best point is below the capture threshold (dB). Positive when the limb
    /// is never captured; zero or negative once it is.
    pub best_limb_shortfall_db: f64,
    /// Altitude of that best point (m).
    pub best_altitude_m: f64,
    /// Dish diameter of that best point (m).
    pub best_diameter_m: f64,
    /// Beamwidth of that best point (deg).
    pub best_hpbw_deg: f64,
    /// Transmit power (dBW) at which that best point would capture the limb.
    pub best_limb_capture_tx_power_dbw: f64,
}

/// Result of an altitude × beamwidth capture-footprint sweep.
#[derive(Clone, Debug, Serialize)]
pub struct FootprintSweepResult {
    /// The swept axes, self-describing ([`crate::sweep::SweepAxis`]: parameter, start,
    /// stop, steps, scale) — altitude first, diameter second.
    pub axes: Vec<SweepAxis>,
    /// Samples per axis, in axis order. `points.len() == shape[0] * shape[1]`.
    pub shape: Vec<usize>,
    /// The altitude samples (m).
    pub altitude_m_values: Vec<f64>,
    /// The diameter samples (m).
    pub diameter_m_values: Vec<f64>,
    /// The half-power beamwidths (deg) those diameters imply at the carrier.
    pub hpbw_deg_values: Vec<f64>,
    /// Carrier the beamwidths and the link were evaluated at (Hz).
    pub freq_hz: f64,
    /// Transmit power held fixed across the grid (dBW).
    pub p_tx_dbw: f64,
    /// J/S capture threshold held fixed across the grid (dB).
    pub capture_threshold_db: f64,
    /// One row per (altitude, beamwidth) point, altitude-major (diameter varies fastest).
    pub points: Vec<FootprintSweepPoint>,
    /// Limb capture as a threshold over this grid.
    pub limb_threshold: LimbThreshold,
}

/// Interpolate between `a` and `b` at the midpoint **in the axis's own scale**, so a
/// bisection on a `log` axis halves the ratio rather than the difference.
fn axis_midpoint(a: f64, b: f64, log: bool) -> f64 {
    if log {
        ((a.ln() + b.ln()) * 0.5).exp()
    } else {
        (a + b) * 0.5
    }
}

/// Bisect `f` (limb J/S minus the capture threshold) inside a bracket `[lo, hi]` where it
/// changes sign. Returns the crossing coordinate. The caller must have established the
/// sign change from two adjacent grid samples: the limb J/S is *not* monotone in either
/// axis (the Airy sidelobe structure is not), so bisection is only ever applied inside a
/// bracket the grid itself proved contains a root, never to the axis as a whole.
fn bisect_crossing<F: Fn(f64) -> f64>(mut lo: f64, mut hi: f64, log: bool, f: F) -> f64 {
    let f_lo = f(lo);
    for _ in 0..LIMB_BISECT_ITERS {
        let mid = axis_midpoint(lo, hi, log);
        if mid <= lo || mid >= hi {
            break; // the interval has collapsed to adjacent doubles
        }
        if (f(mid) >= 0.0) == (f_lo >= 0.0) {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    axis_midpoint(lo, hi, log)
}

/// Sweep the capture footprint over the Cartesian product of a transmitter-**altitude**
/// axis and a transmit-dish-**diameter** axis (reported with the half-power beamwidth each
/// diameter implies), holding every other input of `base` fixed.
///
/// The row whose `(altitude_m, diameter_m)` equal `base`'s reproduces
/// [`capture_footprint`]`(base).captured_fraction` exactly — the grid contains the
/// operating point, it does not approximate it.
///
/// Emitted long form: one [`FootprintSweepPoint`] per grid node. Limb capture is reported
/// as a [`LimbThreshold`] — located crossings where it switches on, or an explicit
/// "not reached on this grid" with the dB shortfall.
pub fn capture_footprint_sweep(
    base: &FootprintParams,
    altitude_axis: &SweepAxis,
    diameter_axis: &SweepAxis,
) -> FootprintSweepResult {
    let alt_log = altitude_axis.scale == "log";
    let dia_log = diameter_axis.scale == "log";
    let alts = altitude_axis.values();
    let dias = diameter_axis.values();
    let thr = base.capture_threshold_db;

    let at = |h: f64, d: f64| FootprintParams {
        altitude_m: h,
        diameter_m: d,
        ..*base
    };
    // Limb J/S relative to the capture threshold — the function whose zero crossings are
    // the limb-capture boundary.
    let limb_margin = |h: f64, d: f64| limb_point(&at(h, d)).js_db - thr;

    let mut points = Vec::with_capacity(alts.len() * dias.len());
    let mut best = f64::NEG_INFINITY;
    let mut best_idx = 0usize;
    for &h in &alts {
        for &d in &dias {
            let p = at(h, d);
            let res = capture_footprint(&p);
            let limb = res
                .points
                .last()
                .copied()
                .expect("capture_footprint emits at least two points");
            let hpbw = half_power_beamwidth_rad(d, base.freq_hz);
            if limb.js_db > best {
                best = limb.js_db;
                best_idx = points.len();
            }
            points.push(FootprintSweepPoint {
                altitude_m: h,
                diameter_m: d,
                hpbw_rad: hpbw,
                hpbw_deg: hpbw.to_degrees(),
                boresight_gain_dbi: res.boresight_gain_dbi,
                horizon_central_angle_rad: res.horizon_central_angle_rad,
                captured_fraction: res.captured_fraction,
                limb_js_db: limb.js_db,
                limb_captured: res.limb_captured,
                limb_margin_db: limb.js_db - thr,
                limb_capture_tx_power_dbw: base.p_tx_dbw + (thr - limb.js_db),
            });
        }
    }

    // ---- locate the limb-capture boundary on each axis --------------------------------
    let mut crossings: Vec<LimbCrossing> = Vec::new();
    // Along diameter, at each sampled altitude.
    for &h in &alts {
        for w in dias.windows(2) {
            let (d0, d1) = (w[0], w[1]);
            let (m0, m1) = (limb_margin(h, d0), limb_margin(h, d1));
            if (m0 >= 0.0) == (m1 >= 0.0) {
                continue;
            }
            let d = bisect_crossing(d0, d1, dia_log, |d| limb_margin(h, d));
            let hpbw = half_power_beamwidth_rad(d, base.freq_hz);
            crossings.push(LimbCrossing {
                axis: diameter_axis.parameter.clone(),
                value: d,
                hpbw_deg: hpbw.to_degrees(),
                held_parameter: altitude_axis.parameter.clone(),
                held_value: h,
                limb_js_db: limb_margin(h, d) + thr,
            });
        }
    }
    // Along altitude, at each sampled diameter.
    for &d in &dias {
        let hpbw_deg = half_power_beamwidth_rad(d, base.freq_hz).to_degrees();
        for w in alts.windows(2) {
            let (h0, h1) = (w[0], w[1]);
            let (m0, m1) = (limb_margin(h0, d), limb_margin(h1, d));
            if (m0 >= 0.0) == (m1 >= 0.0) {
                continue;
            }
            let h = bisect_crossing(h0, h1, alt_log, |h| limb_margin(h, d));
            crossings.push(LimbCrossing {
                axis: altitude_axis.parameter.clone(),
                value: h,
                hpbw_deg,
                held_parameter: diameter_axis.parameter.clone(),
                held_value: d,
                limb_js_db: limb_margin(h, d) + thr,
            });
        }
    }

    // A degenerate axis (start == stop) samples the same coordinate more than once, which
    // would otherwise report one physical boundary as several. Deduplicate on the exact
    // (axis, coordinate, held value) triple — a count is part of the claim.
    crossings.dedup_by(|a, b| {
        a.axis == b.axis
            && a.held_parameter == b.held_parameter
            && a.value.to_bits() == b.value.to_bits()
            && a.held_value.to_bits() == b.held_value.to_bits()
    });

    let any_sampled = points.iter().any(|p| p.limb_captured);
    let reached = any_sampled || !crossings.is_empty();
    let b = points[best_idx]; // `FootprintSweepPoint` is `Copy`
    let shortfall = thr - b.limb_js_db;
    let (a_lo, a_hi) = (
        alts.iter().copied().fold(f64::INFINITY, f64::min),
        alts.iter().copied().fold(f64::NEG_INFINITY, f64::max),
    );
    let hp: Vec<f64> = dias
        .iter()
        .map(|&d| half_power_beamwidth_rad(d, base.freq_hz).to_degrees())
        .collect();
    let (b_lo, b_hi) = (
        hp.iter().copied().fold(f64::INFINITY, f64::min),
        hp.iter().copied().fold(f64::NEG_INFINITY, f64::max),
    );
    let grid = format!(
        "altitude {a_lo:.0}-{a_hi:.0} m x beamwidth {b_lo:.3}-{b_hi:.3} deg, {} points",
        points.len()
    );
    let statement = if reached {
        format!(
            "limb capture IS reached on this grid ({grid}): {} of {} sampled operating points \
             capture the limb and {} axis crossing(s) were located; the strongest limb J/S \
             sampled is {:.3} dB at altitude {:.0} m / beamwidth {:.3} deg, against a {:.1} dB \
             capture threshold.",
            points.iter().filter(|p| p.limb_captured).count(),
            points.len(),
            crossings.len(),
            b.limb_js_db,
            b.altitude_m,
            b.hpbw_deg,
            thr
        )
    } else {
        format!(
            "limb capture is NOT reached anywhere on this grid ({grid}) - not zero capture, \
             but no limb capture: the best limb J/S is {:.3} dB at altitude {:.0} m / beamwidth \
             {:.3} deg, {:.3} dB short of the {:.1} dB capture threshold; that operating point \
             would capture the limb at {:.3} dBW transmit power against the {:.3} dBW flown.",
            b.limb_js_db,
            b.altitude_m,
            b.hpbw_deg,
            shortfall,
            thr,
            b.limb_capture_tx_power_dbw,
            base.p_tx_dbw
        )
    };

    FootprintSweepResult {
        axes: vec![altitude_axis.clone(), diameter_axis.clone()],
        shape: vec![alts.len(), dias.len()],
        altitude_m_values: alts,
        diameter_m_values: dias,
        hpbw_deg_values: hp,
        freq_hz: base.freq_hz,
        p_tx_dbw: base.p_tx_dbw,
        capture_threshold_db: thr,
        points,
        limb_threshold: LimbThreshold {
            reached,
            statement,
            crossings,
            best_limb_js_db: b.limb_js_db,
            best_limb_shortfall_db: shortfall,
            best_altitude_m: b.altitude_m,
            best_diameter_m: b.diameter_m,
            best_hpbw_deg: b.hpbw_deg,
            best_limb_capture_tx_power_dbw: b.limb_capture_tx_power_dbw,
        },
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

    // ---------------------------------------------------------------------------
    // Altitude × beamwidth sweep
    // ---------------------------------------------------------------------------

    /// The P1 baseline operating point: 100 km, 1 m dish, 2.4 GHz, 40 W, 400-point sweep.
    fn baseline_params() -> FootprintParams {
        FootprintParams::new(100_000.0, 10.0 * (40.0_f64).log10(), 1.0, 2.4e9, 400)
    }

    fn axis(parameter: &str, start: f64, stop: f64, steps: usize, scale: &str) -> SweepAxis {
        SweepAxis {
            parameter: parameter.to_string(),
            start,
            stop,
            steps,
            scale: scale.to_string(),
        }
    }

    /// The shipped default axes: altitude 20–500 km linear in 7 steps (so 100 km is an
    /// exact sample) × diameter 0.25–4 m log in 5 steps (so 1 m is an exact sample).
    fn default_axes() -> (SweepAxis, SweepAxis) {
        (
            axis("transmitter_altitude_m", 20_000.0, 500_000.0, 7, "linear"),
            axis("antenna_diameter_m", 0.25, 4.0, 5, "log"),
        )
    }

    // ORACLE (InternalConsistency): the limb-only evaluation and the full nadir→limb sweep
    // must be the SAME arithmetic. If they ever diverge, the limb threshold would be
    // located against a slightly different function from the one the grid rows report,
    // and a crossing could be claimed where the grid shows none. Bit-for-bit, not "close".
    #[test]
    fn limb_point_is_bit_identical_to_the_full_sweeps_last_point() {
        for (h, d) in [
            (100_000.0, 1.0),
            (20_000.0, 0.25),
            (500_000.0, 4.0),
            (1_500.0, 1.0),
        ] {
            let p = FootprintParams {
                altitude_m: h,
                diameter_m: d,
                ..baseline_params()
            };
            let full = *capture_footprint(&p).points.last().expect("points");
            let only = limb_point(&p);
            assert_eq!(
                full.central_angle_rad.to_bits(),
                only.central_angle_rad.to_bits()
            );
            assert_eq!(full.slant_range_m.to_bits(), only.slant_range_m.to_bits());
            assert_eq!(full.gain_dbi.to_bits(), only.gain_dbi.to_bits());
            assert_eq!(
                full.js_db.to_bits(),
                only.js_db.to_bits(),
                "limb J/S differs at h={h} D={d}: {} vs {}",
                full.js_db,
                only.js_db
            );
            assert_eq!(full.captured, only.captured);
        }
    }

    // (a) The grid is long form and complete: exactly `steps_alt × steps_diam` rows, one
    // per point, every coordinate is an axis sample, and every captured fraction is a
    // genuine fraction in [0, 1].
    #[test]
    fn footprint_sweep_grid_is_complete_long_form_and_bounded() {
        let (a_axis, d_axis) = default_axes();
        let s = capture_footprint_sweep(&baseline_params(), &a_axis, &d_axis);

        assert_eq!(s.shape, vec![7, 5]);
        assert_eq!(s.points.len(), 35, "7 altitudes × 5 beamwidths");
        assert_eq!(s.altitude_m_values.len(), 7);
        assert_eq!(s.diameter_m_values.len(), 5);
        assert_eq!(s.hpbw_deg_values.len(), 5);
        assert_eq!(s.axes.len(), 2);
        assert_eq!(s.axes[0].parameter, "transmitter_altitude_m");
        assert_eq!(s.axes[1].parameter, "antenna_diameter_m");

        for (i, p) in s.points.iter().enumerate() {
            // Altitude-major, diameter fastest.
            assert_eq!(p.altitude_m, s.altitude_m_values[i / 5], "row {i} altitude");
            assert_eq!(p.diameter_m, s.diameter_m_values[i % 5], "row {i} diameter");
            assert!(
                (0.0..=1.0).contains(&p.captured_fraction),
                "row {i} captured fraction {} outside [0,1]",
                p.captured_fraction
            );
            // The beamwidth actually implied by the diameter, not a re-typed constant.
            let expect = half_power_beamwidth_rad(p.diameter_m, s.freq_hz);
            assert!((p.hpbw_rad - expect).abs() < 1e-15);
            assert!((p.hpbw_deg - expect.to_degrees()).abs() < 1e-12);
            // The limb threshold form of the boolean is exact: at that transmit power the
            // limb J/S lands exactly on the capture threshold.
            assert!(
                (p.limb_capture_tx_power_dbw - (s.p_tx_dbw - p.limb_margin_db)).abs() < 1e-9,
                "row {i} limb capture power is not the threshold power"
            );
            assert_eq!(p.limb_captured, p.limb_margin_db >= 0.0);
        }
        // Every beamwidth on the grid is distinct — a grid that collapsed onto one dish
        // would still pass a bare count.
        for w in s.hpbw_deg_values.windows(2) {
            assert!(w[0] > w[1], "beamwidth axis is not strictly ordered");
        }
    }

    // (b) MONOTONICITY, in the direction the physics actually requires.
    //
    // J/S at every surface point is `P_tx + G(θ) − FSPL(slant) − P_afs`: the transmit power
    // enters as a pure dB offset that is the SAME at every point on the cap. Raising it by
    // ΔP raises every point's J/S by exactly ΔP, so the captured set at `P_tx + ΔP`
    // CONTAINS the captured set at `P_tx` — set inclusion, hence the area-weighted captured
    // fraction can only rise. This must hold at every node of the grid, and it is a real
    // discriminating check: it fails if the threshold comparison is inverted, if the sin γ
    // area weight is applied to the wrong branch, or if the gain/path-loss signs are
    // crossed.
    //
    // It is deliberately NOT stated as "a wider beam or a higher transmitter captures more".
    // Neither of those is true of this model, and the companion test below pins the
    // counterexamples rather than letting a plausible-sounding assertion stand unchecked.
    #[test]
    fn footprint_sweep_captured_fraction_is_monotone_in_transmit_power() {
        let (a_axis, d_axis) = default_axes();
        let base = baseline_params();
        let lo = capture_footprint_sweep(&base, &a_axis, &d_axis);
        for delta in [3.0_f64, 6.0, 12.0] {
            let hi = capture_footprint_sweep(
                &FootprintParams {
                    p_tx_dbw: base.p_tx_dbw + delta,
                    ..base
                },
                &a_axis,
                &d_axis,
            );
            assert_eq!(lo.points.len(), hi.points.len());
            for (l, h) in lo.points.iter().zip(&hi.points) {
                assert_eq!((l.altitude_m, l.diameter_m), (h.altitude_m, h.diameter_m));
                assert!(
                    h.captured_fraction >= l.captured_fraction,
                    "+{delta} dB LOWERED capture at h={} m, HPBW={:.3} deg: {} -> {}",
                    l.altitude_m,
                    l.hpbw_deg,
                    l.captured_fraction,
                    h.captured_fraction
                );
                // The same offset must move the limb J/S by exactly ΔP.
                assert!(
                    (h.limb_js_db - l.limb_js_db - delta).abs() < 1e-9,
                    "limb J/S did not track transmit power one-for-one"
                );
            }
            // And it must actually *move* somewhere — a frozen grid would pass ">=".
            assert!(
                lo.points
                    .iter()
                    .zip(&hi.points)
                    .any(|(l, h)| h.captured_fraction > l.captured_fraction),
                "+{delta} dB changed nothing anywhere on the grid"
            );
        }
    }

    // The counterexample, pinned. The captured fraction is NOT monotone in beamwidth, and
    // NOT monotone in altitude, and that is physics rather than noise: the aperture pattern
    // is Airy, so the captured region breaks into rings separated by nulls, and which rings
    // clear the threshold depends non-monotonically on where the altitude-limited cap
    // happens to cut the pattern. Refining the surface grid 64× does not remove it. This
    // test exists so that nobody "fixes" the sweep into a smooth surface it has no right
    // to be.
    #[test]
    fn footprint_sweep_captured_fraction_is_not_monotone_in_beamwidth_or_altitude() {
        let (a_axis, d_axis) = default_axes();
        let s = capture_footprint_sweep(&baseline_params(), &a_axis, &d_axis);
        let f = |ai: usize, di: usize| s.points[ai * 5 + di].captured_fraction;

        // Beamwidth axis at 180 km: NARROWING the beam from 29.2° to 14.6° captures MORE.
        assert!(
            f(2, 1) > f(2, 0),
            "expected the beamwidth non-monotonicity at 180 km: {} then {}",
            f(2, 0),
            f(2, 1)
        );
        // Altitude axis at 29.2° beamwidth: RAISING the transmitter from 180 km to 500 km
        // captures MORE, having captured less at 180 km than at 100 km.
        assert!(f(1, 0) > f(2, 0), "100 km should beat 180 km at 29.2 deg");
        assert!(f(6, 0) > f(2, 0), "500 km should beat 180 km at 29.2 deg");
    }

    // (c) The baseline operating point is ON the grid, not near it: the row at
    // (100 km, 1 m) must reproduce `capture_footprint`'s own captured fraction — the
    // published P1 0.030202685056276844 — bit for bit.
    #[test]
    fn footprint_sweep_reproduces_the_baseline_operating_point_exactly() {
        let base = baseline_params();
        let (a_axis, d_axis) = default_axes();
        let s = capture_footprint_sweep(&base, &a_axis, &d_axis);
        let direct = capture_footprint(&base);

        let rows: Vec<&FootprintSweepPoint> = s
            .points
            .iter()
            .filter(|p| p.altitude_m == base.altitude_m && p.diameter_m == base.diameter_m)
            .collect();
        assert_eq!(
            rows.len(),
            1,
            "the baseline point must be a unique grid node"
        );
        let r = rows[0];
        assert_eq!(
            r.captured_fraction.to_bits(),
            direct.captured_fraction.to_bits(),
            "grid {} vs direct {}",
            r.captured_fraction,
            direct.captured_fraction
        );
        // The published P1 value itself.
        assert_eq!(r.captured_fraction, 0.030_202_685_056_276_844);
        assert_eq!(r.limb_captured, direct.limb_captured);
        assert!(!r.limb_captured);
    }

    // (d.1) On the shipped orbital grid the limb is NOT reached — and that is reported as
    // an explicit absence with the dB shortfall and the transmit power that would close it,
    // never as a zero or a silent `false`.
    #[test]
    fn footprint_sweep_limb_threshold_is_explicitly_not_reached_on_the_orbital_grid() {
        let base = baseline_params();
        let (a_axis, d_axis) = default_axes();
        let s = capture_footprint_sweep(&base, &a_axis, &d_axis);
        let lt = &s.limb_threshold;

        assert!(!lt.reached);
        assert!(lt.crossings.is_empty());
        assert!(s.points.iter().all(|p| !p.limb_captured));
        assert!(
            lt.statement.contains("NOT reached anywhere on this grid"),
            "statement must say so in words: {}",
            lt.statement
        );
        assert!(lt.statement.contains("20000-500000 m"));
        // The shortfall is a real quantity, not a placeholder.
        assert!(lt.best_limb_shortfall_db > 0.0);
        assert!(
            (lt.best_limb_shortfall_db - (base.capture_threshold_db - lt.best_limb_js_db)).abs()
                < 1e-12
        );
        assert!(
            (lt.best_limb_shortfall_db - 3.775).abs() < 0.01,
            "best limb shortfall {} dB",
            lt.best_limb_shortfall_db
        );
        // The best point is the widest beam at the lowest altitude, and the power that
        // would capture the limb there is 3.775 dB above the 40 W flown.
        assert_eq!(lt.best_altitude_m, 20_000.0);
        assert_eq!(lt.best_diameter_m, 0.25);
        assert!(
            (lt.best_limb_capture_tx_power_dbw - (base.p_tx_dbw + lt.best_limb_shortfall_db)).abs()
                < 1e-12
        );
        // ...and it really is the best: no sampled point does better.
        let max = s
            .points
            .iter()
            .map(|p| p.limb_js_db)
            .fold(f64::NEG_INFINITY, f64::max);
        assert_eq!(lt.best_limb_js_db, max);
    }

    // (d.2) The threshold is a real located boundary where one exists. Drop the transmitter
    // to hovering altitudes (0.5–4 km) at the baseline 1 m dish and the limb IS captured
    // below ~2 km: the search must bracket that crossing on the altitude axis and bisect to
    // it, and the limb J/S AT the located altitude must equal the capture threshold. A
    // search that merely reported the nearest grid sample would fail this.
    #[test]
    fn footprint_sweep_limb_threshold_is_a_real_crossing_when_one_exists() {
        let base = baseline_params();
        let s = capture_footprint_sweep(
            &base,
            &axis("transmitter_altitude_m", 500.0, 4_000.0, 8, "linear"),
            &axis("antenna_diameter_m", 1.0, 1.0, 2, "linear"),
        );
        let lt = &s.limb_threshold;

        assert!(lt.reached, "{}", lt.statement);
        assert!(lt.statement.contains("IS reached on this grid"));
        assert!(s.points.iter().any(|p| p.limb_captured));
        assert!(s.points.iter().any(|p| !p.limb_captured));

        let alt_crossings: Vec<&LimbCrossing> = lt
            .crossings
            .iter()
            .filter(|c| c.axis == "transmitter_altitude_m")
            .collect();
        // Exactly one — the diameter axis here is degenerate (1 m twice), and one physical
        // boundary must not be reported as two.
        assert_eq!(
            alt_crossings.len(),
            1,
            "one boundary, reported once: {:?}",
            lt.crossings
        );
        assert_eq!(lt.crossings.len(), 1);
        for c in &alt_crossings {
            // It is a crossing because the limb J/S there IS the threshold.
            assert!(
                (c.limb_js_db - base.capture_threshold_db).abs() < 1e-9,
                "located crossing at {} m has limb J/S {} dB, not the {} dB threshold",
                c.value,
                c.limb_js_db,
                base.capture_threshold_db
            );
            // Independently: evaluate the model at the located altitude.
            let at = FootprintParams {
                altitude_m: c.value,
                diameter_m: c.held_value,
                ..base
            };
            assert!((limb_point(&at).js_db - base.capture_threshold_db).abs() < 1e-9);
            // And it must straddle: just inside captures, just outside does not.
            let inside = FootprintParams {
                altitude_m: c.value * 0.99,
                ..at
            };
            let outside = FootprintParams {
                altitude_m: c.value * 1.01,
                ..at
            };
            assert!(
                limb_point(&inside).captured,
                "below the crossing must capture"
            );
            assert!(
                !limb_point(&outside).captured,
                "above the crossing must not capture"
            );
            // The known value, to the resolution the physics is quoted at.
            assert!(
                (c.value - 1_980.3).abs() < 1.0,
                "limb-capture altitude ceiling {} m (expected ~1980 m for a 1 m dish at 40 W)",
                c.value
            );
            assert!((c.hpbw_deg - 7.300).abs() < 0.01);
        }
    }
}
