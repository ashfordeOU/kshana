// SPDX-License-Identifier: AGPL-3.0-only
//! **Tracking-loop loss-of-lock model: C/N₀ → lock/unlock with hysteresis, the time it
//! takes to lose lock, and the spoof pull-in limits set by code and carrier offset rate.**
//!
//! The engine's existing denial and capture criteria are **ratios on received power**: a
//! jammer denies at `J/S = 30 dB` and a spoofer captures at `J/S = 3 dB`
//! ([`crate::attack_surface`]), and a satellite is "lost" when its effective C/N₀ crosses
//! a flat 25 dB-Hz line ([`crate::jamming::lock_status`]). Real loss of lock does not work
//! that way. A tracking channel gives up when its loop can no longer hold the signal, and
//! that depends on the loop noise bandwidth `B_n`, the predetection integration time `T`,
//! the correlator spacing `d`, and the dynamics the loop is being asked to follow. This
//! module builds that model and reports the denial radius it implies **alongside** the
//! power-ratio radius — never in place of it — with the difference named
//! (`denial_radius_delta_km`) so the two can be compared rather than quietly swapped.
//!
//! Nothing here forks a second correlator or a second link budget. The loop primitives are
//! [`crate::sdr`] ([`correlate`](crate::sdr::correlate), [`synth_if`](crate::sdr::synth_if),
//! [`CaCode`](crate::sdr::CaCode)) and the radiometry is
//! [`crate::jamming`] ([`j_over_s_db`](crate::jamming::j_over_s_db),
//! [`effective_cn0_dbhz`](crate::jamming::effective_cn0_dbhz),
//! [`nominal_cn0_dbhz`](crate::jamming::nominal_cn0_dbhz),
//! [`q_factor`](crate::jamming::q_factor)).
//!
//! ## What is modelled
//!
//! 1. **Carrier-loop thermal jitter** — the Costas 1σ phase jitter
//!    `σ_PLL = √( (B_n/(C/N₀)) · (1 + 1/(2·T·C/N₀)) )` rad, the second factor being the
//!    squaring loss. The per-epoch (open-loop) discriminator jitter is the same expression
//!    with `B_n → 1/(2T)`, and the two differ by exactly the loop-filter factor `√(2·B_n·T)`.
//! 2. **Code-loop thermal jitter** — the non-coherent early/late 1σ code jitter
//!    `σ_DLL = √( (d·B_n/(2·C/N₀)) · (1 + 2/((2−d)·T·C/N₀)) )` chips.
//! 3. **The tracking-threshold rules** — a Costas loop is held to `3σ_PLL + θ_e ≤ 45°`
//!    (the "15-degree rule": one sigma may not exceed a quarter of the 60° quarter-cycle
//!    budget), and a DLL to `3σ_DLL + lag ≤ d/2` chips, the discriminator's linear
//!    half-range. Both allowances are inputs; the defaults are the stated rules.
//! 4. **Dynamic stress** — a second-order carrier loop carries a steady-state phase error
//!    `θ_e = 360·ḟ/ω_n²` degrees under a Doppler rate `ḟ`, with `ω_n = B_n/0.53`; a
//!    first-order code loop carries a ramp lag `ẋ/(4·B_n)` chips under a code slew `ẋ`.
//!    These are what a spoofer pushing on the loop actually has to stay inside.
//! 5. **Hysteresis** — a receiver that has lost lock must *re-pull-in*, and pull-in runs a
//!    wider loop than steady-state tracking. Since jitter grows as `√B_n`, the re-lock
//!    threshold is strictly above the drop threshold, and the width follows from the
//!    bandwidth ratio rather than being asserted: in the thermal-dominated limit it is
//!    `10·log₁₀(r)` dB and in the squaring-loss-dominated limit `5·log₁₀(r)` dB, so any
//!    computed hysteresis must lie between those two bounds.
//! 6. **Time to lose lock** — two distinct quantities, both reported. The *declared* loss
//!    of lock is when a two-threshold lock detector with confirmation dwells transitions,
//!    driven by a C/N₀ profile; the *physical* escape time is the mean time between cycle
//!    slips, `T̄ = π²·ρ·I₀²(ρ)/(2·B_n)` with loop SNR `ρ = 1/σ_PLL²` (Viterbi's first-order
//!    result), reported in `log₁₀ s` because it spans hundreds of decades.
//!
//! ## Validated vs Modelled
//!
//! **Validated against the existing [`crate::sdr`] correlator stepped forward** — a
//! genuinely different route to the same numbers, not a restatement:
//!
//! * the open-loop Costas discriminator jitter including its squaring-loss term agrees
//!   with the measured jitter of [`crate::sdr::correlate`] on seeded synthetic IF to
//!   better than 2 % over 35–50 dB-Hz;
//! * the closed-loop jitter reduction `σ_closed = σ_meas·√(2·B_n·T)` agrees with a
//!   stepped first-order Costas loop built from the same correlator to ~3 %;
//! * the first-order code-loop ramp lag `ẋ/(4·B_n)` agrees with the stepped DLL to
//!   better than 0.1 %, with `B_n = g·slope/(4T)` the discrete loop's equivalent
//!   bandwidth and `slope = 1/(2−d)` the ideal-triangle discriminator gain;
//! * [`bessel_i0`] agrees with the standard modified-Bessel values to < 2 × 10⁻⁶ relative.
//!
//! **Modelled** — the default loop parameters (10 Hz carrier / 1 Hz code noise bandwidth,
//! 1 ms predetection integration, 0.5 chip spacing), the 2× pull-in bandwidth ratio, the
//! confirmation dwell lengths, the representative jammer power and antenna gains, and the
//! C/N₀ profile are all **representative band figures**, not a datasheet for any receiver.
//! Oscillator (Allan-deviation) and vibration jitter are **not** modelled: the carrier
//! budget here is thermal plus dynamic stress only, and a real receiver adds those two
//! terms, which can only make the threshold worse. Front-end bandwidth limiting, multipath,
//! AGC dynamics, data-bit-transition losses, aiding from an inertial or clock reference,
//! and any half-cycle correction to the cycle-slip formula are likewise out of scope and
//! stated rather than silently included.
//!
//! References: Kaplan & Hegarty, *Understanding GPS/GNSS* (3rd ed.), ch. 8 (carrier and
//! code tracking loops, thermal jitter, the tracking-threshold rules, the second-order
//! `B_n = 0.53·ω_n` relation); A. J. Viterbi, *Principles of Coherent Communication*
//! (1966) and F. M. Gardner, *Phaselock Techniques* (3rd ed.), ch. 9 (mean time between
//! cycle slips); Abramowitz & Stegun §9.8 (the `I₀` polynomial approximations).

use crate::jamming::{
    effective_cn0_dbhz, j_over_s_db, nominal_cn0_dbhz, q_factor, CA_CHIP_RATE_HZ, C_M_PER_S, L1_HZ,
};
use serde::{Deserialize, Serialize};

// --- constants -----------------------------------------------------------------------

/// The Costas-loop carrier tracking-threshold allowance (degrees) applied to `3σ + θ_e`.
/// This is the "15-degree rule" stated as its three-sigma form: one sigma of phase jitter
/// may not exceed 15°, i.e. three sigma may not exceed 45°.
pub const COSTAS_THRESHOLD_DEG: f64 = 45.0;

/// The ratio `B_n/ω_n` for the standard second-order loop (damping ζ = 1/√2), as used to
/// convert a stated loop noise bandwidth into the natural frequency that sets dynamic
/// stress. Kaplan & Hegarty, ch. 8.
pub const SECOND_ORDER_BN_OVER_WN: f64 = 0.53;

/// Lower bound on the search bracket (m) used when inverting a link for a radius.
pub const RADIUS_BRACKET_MIN_M: f64 = 1.0;

/// Upper bound on the search bracket (m) used when inverting a link for a radius.
pub const RADIUS_BRACKET_MAX_M: f64 = 1.0e10;

/// Lowest C/N₀ (dB-Hz) considered when solving a tracking threshold.
pub const CN0_SEARCH_MIN_DBHZ: f64 = -20.0;

/// Highest C/N₀ (dB-Hz) considered when solving a tracking threshold.
pub const CN0_SEARCH_MAX_DBHZ: f64 = 80.0;

/// Hard cap on the number of lock-detector steps a single run may take, so no input can
/// turn the state machine into an unbounded loop.
pub const MAX_DETECTOR_STEPS: usize = 2_000_000;

/// Hard cap on the length of any input axis (the spoof pull-in grid, the jitter table).
pub const MAX_AXIS_LEN: usize = 64;

#[inline]
fn lin(db: f64) -> f64 {
    10f64.powf(db / 10.0)
}

// --- thermal jitter ------------------------------------------------------------------

/// **Per-epoch (open-loop) Costas discriminator phase jitter** (rad) at `cn0_dbhz` for a
/// predetection integration time `t_s`:
/// `σ² = (1/(2·C/N₀·T)) · (1 + 1/(2·T·C/N₀))`. The first factor is the post-correlation
/// phase noise of a coherent integration; the second is the squaring loss a Costas
/// discriminator pays for being insensitive to the data-bit sign.
///
/// This is the quantity the `atan(Q/I)` discriminator in [`crate::sdr::track`] produces
/// each epoch, and the tests check it against that correlator directly. It is valid while
/// the discriminator is in its linear region; below roughly 32 dB-Hz at `T` = 1 ms the
/// real `atan` output saturates against its ±π/2 range and measures *less* jitter than
/// this formula predicts — a bounded estimator, not a better loop.
pub fn pll_measurement_jitter_rad(cn0_dbhz: f64, t_s: f64) -> f64 {
    let c = lin(cn0_dbhz);
    let t = t_s.max(f64::MIN_POSITIVE);
    ((1.0 / (2.0 * c * t)) * (1.0 + 1.0 / (2.0 * t * c))).sqrt()
}

/// **Closed-loop Costas carrier thermal jitter** (rad):
/// `σ_PLL² = (B_n/(C/N₀)) · (1 + 1/(2·T·C/N₀))`.
///
/// Identical to [`pll_measurement_jitter_rad`] scaled by the loop-filter factor
/// `√(2·B_n·T)`, which is what a loop noise bandwidth means.
pub fn pll_thermal_jitter_rad(cn0_dbhz: f64, bn_hz: f64, t_s: f64) -> f64 {
    let c = lin(cn0_dbhz);
    let t = t_s.max(f64::MIN_POSITIVE);
    ((bn_hz.max(0.0) / c) * (1.0 + 1.0 / (2.0 * t * c))).sqrt()
}

/// **Per-epoch (open-loop) code-error jitter** (chips) of a non-coherent early/late
/// discriminator at correlator spacing `d`:
/// `σ² = (d/(4·T·C/N₀)) · (1 + 2/((2−d)·T·C/N₀))`.
///
/// The closed-loop form is this scaled by `√(2·B_n·T)`. As with the carrier, the real
/// normalised amplitude discriminator saturates at low C/N₀ (its output is bounded by
/// ±d/2 chips of implied error), so the formula over-predicts there.
pub fn dll_measurement_jitter_chips(cn0_dbhz: f64, t_s: f64, spacing_chips: f64) -> f64 {
    let c = lin(cn0_dbhz);
    let t = t_s.max(f64::MIN_POSITIVE);
    let d = spacing_chips.clamp(1e-6, 1.9);
    ((d / (4.0 * t * c)) * (1.0 + 2.0 / ((2.0 - d) * t * c))).sqrt()
}

/// **Closed-loop code thermal jitter** (chips) for a non-coherent early/late DLL:
/// `σ_DLL² = (d·B_n/(2·C/N₀)) · (1 + 2/((2−d)·T·C/N₀))`.
pub fn dll_thermal_jitter_chips(cn0_dbhz: f64, bn_hz: f64, t_s: f64, spacing_chips: f64) -> f64 {
    let c = lin(cn0_dbhz);
    let t = t_s.max(f64::MIN_POSITIVE);
    let d = spacing_chips.clamp(1e-6, 1.9);
    ((d * bn_hz.max(0.0) / (2.0 * c)) * (1.0 + 2.0 / ((2.0 - d) * t * c))).sqrt()
}

// --- dynamic stress ------------------------------------------------------------------

/// **Steady-state carrier phase error** (degrees) a second-order loop of noise bandwidth
/// `bn_hz` carries under a Doppler rate of `doppler_rate_hz_per_s`:
/// `θ_e = 360·ḟ/ω_n²` with `ω_n = B_n/0.53`. This is the dynamic-stress term that adds to
/// `3σ` in the 45° carrier budget, and it is what limits how fast a spoofer may slew a
/// victim's carrier before the victim's loop simply falls off the back.
pub fn pll_dynamic_stress_deg(doppler_rate_hz_per_s: f64, bn_hz: f64) -> f64 {
    let b = bn_hz.max(f64::MIN_POSITIVE);
    360.0 * doppler_rate_hz_per_s * SECOND_ORDER_BN_OVER_WN * SECOND_ORDER_BN_OVER_WN / (b * b)
}

/// **Steady-state code lag** (chips) a first-order code loop of noise bandwidth `bn_hz`
/// carries under a code slew of `code_slew_chips_per_s`: `lag = ẋ/(4·B_n)`.
pub fn dll_ramp_lag_chips(code_slew_chips_per_s: f64, bn_hz: f64) -> f64 {
    code_slew_chips_per_s / (4.0 * bn_hz.max(f64::MIN_POSITIVE))
}

/// The linear-region gain (chips of discriminator output per chip of code error) of the
/// normalised early-minus-late **amplitude** discriminator
/// `½·(|E|−|L|)/(|E|+|L|)` for an ideal triangular autocorrelation at spacing `d`:
/// `1/(2−d)`. This is the constant that maps the per-epoch gain of the discrete loop in
/// [`crate::sdr::track`] onto an equivalent loop noise bandwidth.
pub fn early_late_amplitude_discriminator_slope(spacing_chips: f64) -> f64 {
    1.0 / (2.0 - spacing_chips.clamp(1e-6, 1.9))
}

/// The equivalent one-sided loop noise bandwidth (Hz) of a **discrete first-order loop**
/// that applies `gain × discriminator` once per `t_s`: `B_n = g·k/(4·T)`, where `k` is the
/// discriminator's linear-region slope. A first-order loop with this bandwidth carries the
/// ramp lag [`dll_ramp_lag_chips`] returns, which is how the two are cross-checked against
/// the [`crate::sdr`] correlator.
pub fn equivalent_first_order_bandwidth_hz(gain: f64, t_s: f64, discriminator_slope: f64) -> f64 {
    gain * discriminator_slope / (4.0 * t_s.max(f64::MIN_POSITIVE))
}

// --- tracking thresholds --------------------------------------------------------------

/// Bisect a monotonically **increasing** function of C/N₀ for its zero over the search
/// bracket. Returns `None` when the bracket does not contain a sign change.
fn bisect_cn0(f: impl Fn(f64) -> f64) -> Option<f64> {
    let (mut lo, mut hi) = (CN0_SEARCH_MIN_DBHZ, CN0_SEARCH_MAX_DBHZ);
    let (flo, fhi) = (f(lo), f(hi));
    if !flo.is_finite() || !fhi.is_finite() || flo > 0.0 || fhi < 0.0 {
        return None;
    }
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if f(mid) < 0.0 {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    Some(0.5 * (lo + hi))
}

/// **The carrier-loop tracking threshold** (dB-Hz): the lowest C/N₀ at which
/// `3·σ_PLL + θ_e` still fits inside `allowance_deg`, for a loop of bandwidth `bn_hz`,
/// integration `t_s`, under a Doppler rate `doppler_rate_hz_per_s`.
///
/// `None` when the dynamic stress alone already exceeds the allowance — the loop cannot
/// hold that Doppler rate at **any** signal strength, which is a real answer and not a
/// zero.
pub fn carrier_tracking_threshold_cn0_dbhz(
    bn_hz: f64,
    t_s: f64,
    allowance_deg: f64,
    doppler_rate_hz_per_s: f64,
) -> Option<f64> {
    let stress = pll_dynamic_stress_deg(doppler_rate_hz_per_s, bn_hz);
    bisect_cn0(|cn0| {
        allowance_deg - stress - 3.0 * pll_thermal_jitter_rad(cn0, bn_hz, t_s).to_degrees()
    })
}

/// **The code-loop tracking threshold** (dB-Hz): the lowest C/N₀ at which
/// `3·σ_DLL + lag` still fits inside `allowance_chips`, for a DLL of bandwidth `bn_hz`,
/// integration `t_s`, correlator spacing `spacing_chips`, under a code slew of
/// `code_slew_chips_per_s`. `None` when the slew lag alone exceeds the allowance.
pub fn code_tracking_threshold_cn0_dbhz(
    bn_hz: f64,
    t_s: f64,
    spacing_chips: f64,
    allowance_chips: f64,
    code_slew_chips_per_s: f64,
) -> Option<f64> {
    let lag = dll_ramp_lag_chips(code_slew_chips_per_s, bn_hz).abs();
    bisect_cn0(|cn0| {
        allowance_chips - lag - 3.0 * dll_thermal_jitter_chips(cn0, bn_hz, t_s, spacing_chips)
    })
}

// --- modified Bessel I0 and the cycle-slip time ----------------------------------------

/// **Modified Bessel function of the first kind, order zero.** Abramowitz & Stegun §9.8
/// polynomial approximations: 9.8.1 for `|x| ≤ 3.75` (|ε| < 1.6 × 10⁻⁷) and 9.8.2 for
/// `|x| > 3.75` (|ε| < 1.9 × 10⁻⁷ on the scaled form). Overflows to infinity above
/// `x ≈ 713`; use [`ln_bessel_i0`] where that matters.
pub fn bessel_i0(x: f64) -> f64 {
    let ax = x.abs();
    if ax <= 3.75 {
        let t = (ax / 3.75) * (ax / 3.75);
        1.0 + t
            * (3.515_622_9
                + t * (3.089_942_4
                    + t * (1.206_749_2 + t * (0.265_973_2 + t * (0.036_076_8 + t * 0.004_581_3)))))
    } else {
        (ln_bessel_i0(ax)).exp()
    }
}

/// **Natural logarithm of [`bessel_i0`]**, stable for arbitrarily large arguments: for
/// `x > 3.75` the A&S 9.8.2 scaled form gives `ln I₀ = x − ½·ln x + ln(poly(3.75/x))`,
/// so a loop SNR of several hundred (where `I₀` itself overflows a float) is still
/// reportable. Needed because the mean time between cycle slips grows like `e^{2ρ}`.
pub fn ln_bessel_i0(x: f64) -> f64 {
    let ax = x.abs();
    if ax <= 3.75 {
        bessel_i0(ax).ln()
    } else {
        let t = 3.75 / ax;
        let poly = 0.398_942_28
            + t * (0.013_285_92
                + t * (0.002_253_19
                    + t * (-0.001_575_65
                        + t * (0.009_162_81
                            + t * (-0.020_577_06
                                + t * (0.026_355_37 + t * (-0.016_476_33 + t * 0.003_923_77)))))));
        ax - 0.5 * ax.ln() + poly.ln()
    }
}

/// **Mean time between carrier cycle slips**, reported as `log₁₀(seconds)`:
/// `T̄ = π²·ρ·I₀²(ρ)/(2·B_n)` with loop SNR `ρ = 1/σ_PLL²` (Viterbi's first-order,
/// sinusoidal-phase-detector result; Gardner, *Phaselock Techniques*, ch. 9).
///
/// Returned in log₁₀ because the quantity spans hundreds of decades over the C/N₀ range of
/// interest — at the 15° design point it is astronomically long (the point of the rule),
/// and it collapses to seconds only once the jitter approaches a quarter cycle. It is
/// applied here to the **Costas** loop SNR without any half-cycle correction for the
/// Costas discriminator's π-ambiguity; that omission makes this an optimistic bound, and
/// it is stated rather than papered over with an invented factor.
pub fn log10_mean_time_to_cycle_slip_s(cn0_dbhz: f64, bn_hz: f64, t_s: f64) -> f64 {
    let sigma = pll_thermal_jitter_rad(cn0_dbhz, bn_hz, t_s);
    let rho = 1.0 / (sigma * sigma).max(f64::MIN_POSITIVE);
    let ln10 = std::f64::consts::LN_10;
    2.0 * std::f64::consts::PI.log10() + rho.log10() + 2.0 * ln_bessel_i0(rho) / ln10
        - (2.0 * bn_hz.max(f64::MIN_POSITIVE)).log10()
}

// --- the hysteretic lock detector -------------------------------------------------------

/// Whether the receiver currently declares the channel locked.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum LockState {
    /// The channel is declared locked and its measurements are used.
    Locked,
    /// The channel is declared unlocked; it must clear the (higher) re-lock threshold and
    /// hold it for the confirmation dwell before being used again.
    Unlocked,
}

impl LockState {
    /// The state's label as it appears in a report.
    pub fn as_str(self) -> &'static str {
        match self {
            LockState::Locked => "LOCKED",
            LockState::Unlocked => "UNLOCKED",
        }
    }
}

/// A two-threshold lock detector with confirmation dwells — the mechanism that makes
/// lock/unlock **hysteretic** rather than a single line a noisy C/N₀ estimate chatters
/// across. Lock is dropped after `drop_confirm_epochs` consecutive epochs below
/// `drop_cn0_dbhz`, and regained after `relock_confirm_epochs` consecutive epochs at or
/// above the strictly higher `relock_cn0_dbhz`.
#[derive(Clone, Copy, Debug)]
pub struct LockDetector {
    /// C/N₀ (dB-Hz) below which the tracking-threshold rule is violated.
    pub drop_cn0_dbhz: f64,
    /// C/N₀ (dB-Hz) that must be cleared to re-declare lock — the pull-in threshold.
    pub relock_cn0_dbhz: f64,
    /// Consecutive epochs below `drop_cn0_dbhz` required before lock is dropped.
    pub drop_confirm_epochs: usize,
    /// Consecutive epochs at or above `relock_cn0_dbhz` required before lock is regained.
    pub relock_confirm_epochs: usize,
    /// The current declared state.
    pub state: LockState,
    /// How many consecutive epochs the pending transition has been satisfied for.
    pub streak: usize,
}

impl LockDetector {
    /// A detector starting in [`LockState::Locked`] with the given thresholds and dwells.
    pub fn new(
        drop_cn0_dbhz: f64,
        relock_cn0_dbhz: f64,
        drop_confirm_epochs: usize,
        relock_confirm_epochs: usize,
    ) -> Self {
        Self {
            drop_cn0_dbhz,
            relock_cn0_dbhz,
            drop_confirm_epochs,
            relock_confirm_epochs,
            state: LockState::Locked,
            streak: 0,
        }
    }

    /// Feed one epoch's C/N₀ and return the declared state after it.
    pub fn step(&mut self, cn0_dbhz: f64) -> LockState {
        match self.state {
            LockState::Locked => {
                if cn0_dbhz < self.drop_cn0_dbhz {
                    self.streak += 1;
                    if self.streak >= self.drop_confirm_epochs.max(1) {
                        self.state = LockState::Unlocked;
                        self.streak = 0;
                    }
                } else {
                    self.streak = 0;
                }
            }
            LockState::Unlocked => {
                if cn0_dbhz >= self.relock_cn0_dbhz {
                    self.streak += 1;
                    if self.streak >= self.relock_confirm_epochs.max(1) {
                        self.state = LockState::Locked;
                        self.streak = 0;
                    }
                } else {
                    self.streak = 0;
                }
            }
        }
        self.state
    }
}

/// The C/N₀ thresholds a loop configuration implies, with the binding loop named.
#[derive(Clone, Copy, Debug)]
pub struct LoopThresholds {
    /// Carrier-loop drop threshold (dB-Hz), or `None` if the dynamics alone break it.
    pub carrier_drop_cn0_dbhz: Option<f64>,
    /// Code-loop drop threshold (dB-Hz), or `None` if the slew alone breaks it.
    pub code_drop_cn0_dbhz: Option<f64>,
    /// The drop threshold that binds: the larger of the two (whichever loop gives up first).
    pub drop_cn0_dbhz: Option<f64>,
    /// Which loop binds — `"carrier"`, `"code"`, or `"none"` if neither has a solution.
    pub binding_loop: &'static str,
    /// Re-lock threshold (dB-Hz) evaluated with the wider pull-in bandwidths.
    pub relock_cn0_dbhz: Option<f64>,
    /// `relock_cn0_dbhz − drop_cn0_dbhz` (dB): the hysteresis width.
    pub hysteresis_db: Option<f64>,
}

/// The loop geometry a threshold calculation needs.
#[derive(Clone, Copy, Debug)]
pub struct LoopConfig {
    /// Carrier (Costas) loop one-sided noise bandwidth (Hz).
    pub pll_bandwidth_hz: f64,
    /// Code (DLL) loop one-sided noise bandwidth (Hz).
    pub dll_bandwidth_hz: f64,
    /// Predetection coherent integration time (s).
    pub integration_s: f64,
    /// Early-to-late correlator spacing (chips).
    pub spacing_chips: f64,
    /// Carrier `3σ + θ_e` allowance (degrees).
    pub carrier_allowance_deg: f64,
    /// Code `3σ + lag` allowance (chips).
    pub code_allowance_chips: f64,
    /// Multiplier applied to both bandwidths when re-pulling-in after a loss of lock.
    pub pullin_bandwidth_ratio: f64,
}

impl LoopConfig {
    /// Solve the drop and re-lock thresholds for this configuration under a given carrier
    /// Doppler rate and code slew (both zero for a static user).
    pub fn thresholds(
        &self,
        doppler_rate_hz_per_s: f64,
        code_slew_chips_per_s: f64,
    ) -> LoopThresholds {
        let carrier = carrier_tracking_threshold_cn0_dbhz(
            self.pll_bandwidth_hz,
            self.integration_s,
            self.carrier_allowance_deg,
            doppler_rate_hz_per_s,
        );
        let code = code_tracking_threshold_cn0_dbhz(
            self.dll_bandwidth_hz,
            self.integration_s,
            self.spacing_chips,
            self.code_allowance_chips,
            code_slew_chips_per_s,
        );
        let (drop, binding) = match (carrier, code) {
            (Some(a), Some(b)) => {
                if a >= b {
                    (Some(a), "carrier")
                } else {
                    (Some(b), "code")
                }
            }
            (Some(a), None) => (Some(a), "carrier"),
            (None, Some(b)) => (Some(b), "code"),
            (None, None) => (None, "none"),
        };
        let r = self.pullin_bandwidth_ratio.max(1.0);
        let relock_carrier = carrier_tracking_threshold_cn0_dbhz(
            self.pll_bandwidth_hz * r,
            self.integration_s,
            self.carrier_allowance_deg,
            doppler_rate_hz_per_s,
        );
        let relock_code = code_tracking_threshold_cn0_dbhz(
            self.dll_bandwidth_hz * r,
            self.integration_s,
            self.spacing_chips,
            self.code_allowance_chips,
            code_slew_chips_per_s,
        );
        let relock = match (relock_carrier, relock_code) {
            (Some(a), Some(b)) => Some(a.max(b)),
            (Some(a), None) => Some(a),
            (None, Some(b)) => Some(b),
            (None, None) => None,
        };
        LoopThresholds {
            carrier_drop_cn0_dbhz: carrier,
            code_drop_cn0_dbhz: code,
            drop_cn0_dbhz: drop,
            binding_loop: binding,
            relock_cn0_dbhz: relock,
            hysteresis_db: match (relock, drop) {
                (Some(r), Some(d)) => Some(r - d),
                _ => None,
            },
        }
    }
}

// --- spoof pull-in ----------------------------------------------------------------------

/// The largest code slew (chips/s) a **noiseless** first-order DLL of bandwidth `bn_hz`
/// can be dragged at before its ramp lag leaves the discriminator's linear half-range
/// `allowance_chips`: `ẋ_max = 4·B_n·allowance`. A spoofer slewing faster than this does
/// not capture a locked loop — it outruns it, and the victim falls back onto the authentic
/// peak (or loses lock) instead of following the lie.
///
/// This is the geometric ceiling. At a finite signal strength the code jitter eats into
/// the same allowance; [`max_code_slew_at_cn0_chips_per_s`] is the operative limit.
pub fn max_code_slew_chips_per_s(bn_hz: f64, allowance_chips: f64) -> f64 {
    4.0 * bn_hz.max(0.0) * allowance_chips.max(0.0)
}

/// The largest code slew (chips/s) a DLL can be dragged at **at signal strength
/// `cn0_dbhz`**: the ramp lag may only use whatever `3σ_DLL` leaves of `allowance_chips`.
/// Zero when the jitter already fills the budget. Reduces to
/// [`max_code_slew_chips_per_s`] as the jitter goes to zero, and is the ceiling the
/// pull-in map's cells are decided against, so the two can never disagree.
pub fn max_code_slew_at_cn0_chips_per_s(
    bn_hz: f64,
    cn0_dbhz: f64,
    t_s: f64,
    spacing_chips: f64,
    allowance_chips: f64,
) -> f64 {
    let jitter = 3.0 * dll_thermal_jitter_chips(cn0_dbhz, bn_hz, t_s, spacing_chips);
    let headroom = allowance_chips - jitter;
    if headroom <= 0.0 {
        return 0.0;
    }
    4.0 * bn_hz.max(0.0) * headroom
}

/// The largest carrier Doppler rate (Hz/s) a second-order loop of bandwidth `bn_hz` can be
/// dragged at, at signal strength `cn0_dbhz`: the dynamic stress must fit in whatever the
/// jitter leaves of `allowance_deg`. Zero when the jitter already fills the budget.
pub fn max_doppler_rate_hz_per_s(bn_hz: f64, cn0_dbhz: f64, t_s: f64, allowance_deg: f64) -> f64 {
    let jitter = 3.0 * pll_thermal_jitter_rad(cn0_dbhz, bn_hz, t_s).to_degrees();
    let headroom = allowance_deg - jitter;
    if headroom <= 0.0 {
        return 0.0;
    }
    headroom * bn_hz * bn_hz / (360.0 * SECOND_ORDER_BN_OVER_WN * SECOND_ORDER_BN_OVER_WN)
}

/// One cell of the spoof pull-in map: whether a spoofer slewing the victim's code at
/// `code_slew_chips_per_s` and its carrier at `doppler_rate_hz_per_s` stays inside both
/// loops' following limits.
#[derive(Clone, Copy, Debug)]
pub struct PullInCell {
    /// Code slew the spoofer applies (chips/s).
    pub code_slew_chips_per_s: f64,
    /// Carrier Doppler rate the spoofer applies (Hz/s).
    pub doppler_rate_hz_per_s: f64,
    /// Steady-state code lag the victim's DLL carries (chips).
    pub code_lag_chips: f64,
    /// Steady-state carrier phase error the victim's PLL carries (degrees).
    pub carrier_stress_deg: f64,
    /// Total carrier error budget used, `3σ + θ_e` (degrees).
    pub carrier_budget_deg: f64,
    /// Whether the code loop follows (lag inside the allowance).
    pub code_follows: bool,
    /// Whether the carrier loop follows (`3σ + θ_e` inside the allowance).
    pub carrier_follows: bool,
    /// Whether the victim follows on both axes — the pull-in condition.
    pub pulled_in: bool,
}

/// Evaluate one spoof pull-in cell for a loop configuration at signal strength `cn0_dbhz`.
pub fn pull_in_cell(
    cfg: &LoopConfig,
    cn0_dbhz: f64,
    code_slew_chips_per_s: f64,
    doppler_rate_hz_per_s: f64,
) -> PullInCell {
    let lag = dll_ramp_lag_chips(code_slew_chips_per_s, cfg.dll_bandwidth_hz).abs();
    let stress = pll_dynamic_stress_deg(doppler_rate_hz_per_s, cfg.pll_bandwidth_hz).abs();
    let jitter = 3.0
        * pll_thermal_jitter_rad(cn0_dbhz, cfg.pll_bandwidth_hz, cfg.integration_s).to_degrees();
    let code_jitter = 3.0
        * dll_thermal_jitter_chips(
            cn0_dbhz,
            cfg.dll_bandwidth_hz,
            cfg.integration_s,
            cfg.spacing_chips,
        );
    let budget = jitter + stress;
    let code_follows = lag + code_jitter <= cfg.code_allowance_chips;
    let carrier_follows = budget <= cfg.carrier_allowance_deg;
    PullInCell {
        code_slew_chips_per_s,
        doppler_rate_hz_per_s,
        code_lag_chips: lag,
        carrier_stress_deg: stress,
        carrier_budget_deg: budget,
        code_follows,
        carrier_follows,
        pulled_in: code_follows && carrier_follows,
    }
}

// --- the denial link --------------------------------------------------------------------

/// The one-jammer link whose radius both denial criteria are evaluated on. Every leg is
/// evaluated with the existing [`crate::jamming`] functions; nothing here re-derives the
/// radiometry.
#[derive(Clone, Copy, Debug)]
pub struct DenialLink {
    /// Jammer transmit power (dBW).
    pub jammer_power_dbw: f64,
    /// Jammer antenna gain toward the victim (dBi).
    pub jammer_gain_dbi: f64,
    /// Receive-antenna gain toward the jammer (dB).
    pub rx_gain_toward_jammer_db: f64,
    /// Receive-antenna gain toward the satellite (dB).
    pub rx_gain_toward_sat_db: f64,
    /// Isotropic received signal power (dBW).
    pub signal_power_dbw: f64,
    /// Carrier frequency (Hz).
    pub freq_hz: f64,
    /// Spreading-code chip rate (chips/s) — the processing gain.
    pub chip_rate_hz: f64,
    /// Spectral-separation coefficient `Q` for the jammer's spectrum.
    pub q: f64,
    /// Receiver system noise temperature (K).
    pub temp_k: f64,
}

impl DenialLink {
    /// The jammer-to-signal ratio (dB) at standoff `range_m`, via [`j_over_s_db`].
    pub fn js_db_at(&self, range_m: f64) -> f64 {
        j_over_s_db(
            self.jammer_power_dbw,
            self.jammer_gain_dbi,
            self.rx_gain_toward_jammer_db,
            range_m,
            self.freq_hz,
            self.signal_power_dbw,
            self.rx_gain_toward_sat_db,
        )
    }

    /// The un-jammed C/N₀ (dB-Hz), via [`nominal_cn0_dbhz`].
    pub fn nominal_cn0_dbhz(&self) -> f64 {
        nominal_cn0_dbhz(
            self.signal_power_dbw,
            self.rx_gain_toward_sat_db,
            self.temp_k,
        )
    }

    /// The effective C/N₀ (dB-Hz) at standoff `range_m`, via [`effective_cn0_dbhz`].
    pub fn effective_cn0_dbhz_at(&self, range_m: f64) -> f64 {
        effective_cn0_dbhz(
            self.nominal_cn0_dbhz(),
            self.js_db_at(range_m),
            self.q,
            self.chip_rate_hz,
        )
    }

    /// The standoff (m) at which the J/S reaches `target_js_db` — the **existing**
    /// power-ratio denial criterion, inverted. Bisected over
    /// [`RADIUS_BRACKET_MIN_M`, `RADIUS_BRACKET_MAX_M`]; the returned flag says whether the
    /// answer sits inside that bracket or was clamped to an end of it.
    pub fn radius_for_js_db(&self, target_js_db: f64) -> (f64, &'static str) {
        self.bisect_radius(&|r| self.js_db_at(r) - target_js_db)
    }

    /// The standoff (m) at which the effective C/N₀ falls to `target_cn0_dbhz` — the
    /// **loop-dynamics** denial criterion. Same bracket and clamping contract as
    /// [`Self::radius_for_js_db`].
    pub fn radius_for_cn0_dbhz(&self, target_cn0_dbhz: f64) -> (f64, &'static str) {
        self.bisect_radius(&|r| target_cn0_dbhz - self.effective_cn0_dbhz_at(r))
    }

    /// Bisect a function that is **decreasing** in range for its zero.
    fn bisect_radius(&self, f: &dyn Fn(f64) -> f64) -> (f64, &'static str) {
        let (mut lo, mut hi) = (RADIUS_BRACKET_MIN_M, RADIUS_BRACKET_MAX_M);
        if f(lo) <= 0.0 {
            return (lo, "below-bracket");
        }
        if f(hi) >= 0.0 {
            return (hi, "above-bracket");
        }
        for _ in 0..200 {
            let mid = 0.5 * (lo + hi);
            if f(mid) > 0.0 {
                lo = mid;
            } else {
                hi = mid;
            }
        }
        (0.5 * (lo + hi), "bracketed")
    }
}

// --- the scenario -------------------------------------------------------------------------

fn d_pll_bandwidth_hz() -> f64 {
    10.0
}
fn d_dll_bandwidth_hz() -> f64 {
    1.0
}
fn d_integration_s() -> f64 {
    0.001
}
fn d_spacing_chips() -> f64 {
    0.5
}
fn d_carrier_allowance_deg() -> f64 {
    COSTAS_THRESHOLD_DEG
}
fn d_pullin_ratio() -> f64 {
    2.0
}
fn d_drop_confirm_epochs() -> usize {
    50
}
fn d_relock_confirm_epochs() -> usize {
    200
}
fn d_cn0_high_dbhz() -> f64 {
    45.0
}
fn d_cn0_low_dbhz() -> f64 {
    15.0
}
fn d_ramp_duration_s() -> f64 {
    60.0
}
fn d_jammer_power_dbw() -> f64 {
    10.0
}
fn d_signal_power_dbw() -> f64 {
    crate::jamming::DEFAULT_SIGNAL_POWER_DBW
}
fn d_temp_k() -> f64 {
    crate::jamming::DEFAULT_TEMP_K
}
fn d_freq_hz() -> f64 {
    L1_HZ
}
fn d_chip_rate_hz() -> f64 {
    CA_CHIP_RATE_HZ
}
fn d_jammer_type() -> String {
    "broadband".to_string()
}
fn d_denial_js_threshold_db() -> f64 {
    30.0
}
fn d_capture_js_threshold_db() -> f64 {
    3.0
}
fn d_code_slews() -> Vec<f64> {
    vec![0.1, 0.5, 1.0, 2.0, 5.0]
}
fn d_doppler_rates() -> Vec<f64> {
    vec![1.0, 10.0, 40.0, 100.0, 500.0]
}
fn d_jitter_table_cn0() -> Vec<f64> {
    vec![45.0, 40.0, 35.0, 30.0, 27.5, 25.0, 22.5, 20.0]
}

/// **A tracking-loop loss-of-lock scenario.** Every field is defaulted, so a body of only
/// `kind = "tracking-loop"` reproduces the reference configuration.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct TrackingLoopScenario {
    /// Carrier (Costas) loop one-sided noise bandwidth (Hz).
    #[serde(default = "d_pll_bandwidth_hz")]
    pub pll_bandwidth_hz: f64,
    /// Code (DLL) loop one-sided noise bandwidth (Hz).
    #[serde(default = "d_dll_bandwidth_hz")]
    pub dll_bandwidth_hz: f64,
    /// Predetection coherent integration time (s).
    #[serde(default = "d_integration_s")]
    pub predetection_integration_s: f64,
    /// Early-to-late correlator spacing (chips).
    #[serde(default = "d_spacing_chips")]
    pub correlator_spacing_chips: f64,
    /// Carrier `3σ + θ_e` allowance (degrees); the 45° three-sigma form of the 15° rule.
    #[serde(default = "d_carrier_allowance_deg")]
    pub carrier_allowance_deg: f64,
    /// Code `3σ + lag` allowance (chips). Absent ⇒ half the correlator spacing, the
    /// discriminator's linear half-range.
    #[serde(default)]
    pub code_allowance_chips: Option<f64>,
    /// Bandwidth multiplier applied when re-pulling-in after a loss of lock. This is what
    /// makes the re-lock threshold higher than the drop threshold.
    #[serde(default = "d_pullin_ratio")]
    pub pullin_bandwidth_ratio: f64,
    /// Consecutive sub-threshold epochs required before lock is declared lost.
    #[serde(default = "d_drop_confirm_epochs")]
    pub drop_confirm_epochs: usize,
    /// Consecutive above-threshold epochs required before lock is re-declared.
    #[serde(default = "d_relock_confirm_epochs")]
    pub relock_confirm_epochs: usize,
    /// Carrier Doppler rate the loop must follow while tracking (Hz/s).
    #[serde(default)]
    pub doppler_rate_hz_per_s: f64,
    /// Code slew the loop must follow while tracking (chips/s).
    #[serde(default)]
    pub code_slew_chips_per_s: f64,
    /// C/N₀ the profile starts and ends at (dB-Hz).
    #[serde(default = "d_cn0_high_dbhz")]
    pub cn0_high_dbhz: f64,
    /// C/N₀ at the bottom of the profile (dB-Hz).
    #[serde(default = "d_cn0_low_dbhz")]
    pub cn0_low_dbhz: f64,
    /// Duration of each leg of the down-then-up C/N₀ ramp (s).
    #[serde(default = "d_ramp_duration_s")]
    pub ramp_duration_s: f64,
    /// C/N₀ values the jitter table is tabulated at (dB-Hz).
    #[serde(default = "d_jitter_table_cn0")]
    pub jitter_table_cn0_dbhz: Vec<f64>,
    /// Jammer transmit power (dBW).
    #[serde(default = "d_jammer_power_dbw")]
    pub jammer_power_dbw: f64,
    /// Jammer antenna gain toward the victim (dBi).
    #[serde(default)]
    pub jammer_gain_dbi: f64,
    /// Receive-antenna gain toward the jammer (dB).
    #[serde(default)]
    pub rx_gain_toward_jammer_db: f64,
    /// Receive-antenna gain toward the satellite (dB).
    #[serde(default)]
    pub rx_gain_toward_sat_db: f64,
    /// Isotropic received signal power (dBW).
    #[serde(default = "d_signal_power_dbw")]
    pub signal_power_dbw: f64,
    /// Receiver system noise temperature (K).
    #[serde(default = "d_temp_k")]
    pub temp_k: f64,
    /// Carrier frequency (Hz).
    #[serde(default = "d_freq_hz")]
    pub freq_hz: f64,
    /// Spreading-code chip rate (chips/s).
    #[serde(default = "d_chip_rate_hz")]
    pub chip_rate_hz: f64,
    /// Jammer spectrum class fed to [`q_factor`]: `broadband`, `narrowband`/`cw`, `swept`.
    #[serde(default = "d_jammer_type")]
    pub jammer_type: String,
    /// Override the spectral-separation coefficient `Q`.
    #[serde(default)]
    pub q_override: Option<f64>,
    /// The **existing** power-ratio denial criterion (dB of J/S). Reported unchanged.
    #[serde(default = "d_denial_js_threshold_db")]
    pub denial_js_threshold_db: f64,
    /// The **existing** power-ratio spoof-capture criterion (dB of J/S).
    #[serde(default = "d_capture_js_threshold_db")]
    pub capture_js_threshold_db: f64,
    /// Code slew axis of the spoof pull-in map (chips/s).
    #[serde(default = "d_code_slews")]
    pub spoof_code_slew_chips_per_s: Vec<f64>,
    /// Carrier Doppler rate axis of the spoof pull-in map (Hz/s).
    #[serde(default = "d_doppler_rates")]
    pub spoof_doppler_rate_hz_per_s: Vec<f64>,
}

impl Default for TrackingLoopScenario {
    fn default() -> Self {
        Self {
            pll_bandwidth_hz: d_pll_bandwidth_hz(),
            dll_bandwidth_hz: d_dll_bandwidth_hz(),
            predetection_integration_s: d_integration_s(),
            correlator_spacing_chips: d_spacing_chips(),
            carrier_allowance_deg: d_carrier_allowance_deg(),
            code_allowance_chips: None,
            pullin_bandwidth_ratio: d_pullin_ratio(),
            drop_confirm_epochs: d_drop_confirm_epochs(),
            relock_confirm_epochs: d_relock_confirm_epochs(),
            doppler_rate_hz_per_s: 0.0,
            code_slew_chips_per_s: 0.0,
            cn0_high_dbhz: d_cn0_high_dbhz(),
            cn0_low_dbhz: d_cn0_low_dbhz(),
            ramp_duration_s: d_ramp_duration_s(),
            jitter_table_cn0_dbhz: d_jitter_table_cn0(),
            jammer_power_dbw: d_jammer_power_dbw(),
            jammer_gain_dbi: 0.0,
            rx_gain_toward_jammer_db: 0.0,
            rx_gain_toward_sat_db: 0.0,
            signal_power_dbw: d_signal_power_dbw(),
            temp_k: d_temp_k(),
            freq_hz: d_freq_hz(),
            chip_rate_hz: d_chip_rate_hz(),
            jammer_type: d_jammer_type(),
            q_override: None,
            denial_js_threshold_db: d_denial_js_threshold_db(),
            capture_js_threshold_db: d_capture_js_threshold_db(),
            spoof_code_slew_chips_per_s: d_code_slews(),
            spoof_doppler_rate_hz_per_s: d_doppler_rates(),
        }
    }
}

/// The C/N₀ profile the lock detector is driven over: a linear ramp from
/// `cn0_high_dbhz` down to `cn0_low_dbhz` over `ramp_duration_s`, then back up over the
/// same span. At time `t` (s).
fn profile_cn0_dbhz(t: f64, high: f64, low: f64, leg: f64) -> f64 {
    if leg <= 0.0 {
        return high;
    }
    if t <= leg {
        high + (low - high) * (t / leg)
    } else if t <= 2.0 * leg {
        low + (high - low) * ((t - leg) / leg)
    } else {
        high
    }
}

/// The outcome of running the hysteretic detector over the C/N₀ profile.
#[derive(Clone, Copy, Debug)]
pub struct LockHistory {
    /// Time (s) at which the profile first crosses below the drop threshold.
    pub drop_crossing_s: f64,
    /// Time (s) at which the detector declares loss of lock, or `NaN` if it never does.
    pub declared_loss_s: f64,
    /// Time (s) at which the profile first climbs back above the re-lock threshold.
    pub relock_crossing_s: f64,
    /// Time (s) at which the detector re-declares lock, or `NaN` if it never does.
    pub declared_relock_s: f64,
    /// Seconds the channel spent declared unlocked inside the profile.
    pub unlocked_duration_s: f64,
    /// The number of detector steps actually run.
    pub steps: usize,
}

/// Drive `detector` over the down-then-up C/N₀ ramp at the loop's own epoch rate and
/// report when it declared loss of lock and when it recovered. Deterministic.
pub fn run_lock_history(
    detector: &mut LockDetector,
    high_dbhz: f64,
    low_dbhz: f64,
    leg_s: f64,
    epoch_s: f64,
) -> Result<LockHistory, String> {
    let total = 2.0 * leg_s;
    if !(epoch_s.is_finite() && epoch_s > 0.0 && total.is_finite()) || total < 0.0 {
        return Err("tracking-loop: the C/N0 profile needs a positive epoch and duration".into());
    }
    let n = (total / epoch_s).ceil();
    if !n.is_finite() || n > MAX_DETECTOR_STEPS as f64 {
        return Err(format!(
            "tracking-loop: the C/N0 profile would need more than {MAX_DETECTOR_STEPS} detector \
             steps ({total} s at {epoch_s} s per epoch); shorten ramp_duration_s or lengthen \
             predetection_integration_s"
        ));
    }
    let steps = n as usize;
    let mut h = LockHistory {
        drop_crossing_s: f64::NAN,
        declared_loss_s: f64::NAN,
        relock_crossing_s: f64::NAN,
        declared_relock_s: f64::NAN,
        unlocked_duration_s: 0.0,
        steps,
    };
    let mut prev = LockState::Locked;
    for i in 0..steps {
        let t = i as f64 * epoch_s;
        let cn0 = profile_cn0_dbhz(t, high_dbhz, low_dbhz, leg_s);
        if h.drop_crossing_s.is_nan() && cn0 < detector.drop_cn0_dbhz {
            h.drop_crossing_s = t;
        }
        if !h.drop_crossing_s.is_nan()
            && h.relock_crossing_s.is_nan()
            && cn0 >= detector.relock_cn0_dbhz
        {
            h.relock_crossing_s = t;
        }
        let s = detector.step(cn0);
        if s == LockState::Unlocked {
            h.unlocked_duration_s += epoch_s;
        }
        if prev == LockState::Locked && s == LockState::Unlocked && h.declared_loss_s.is_nan() {
            h.declared_loss_s = t;
        }
        if prev == LockState::Unlocked && s == LockState::Locked && h.declared_relock_s.is_nan() {
            h.declared_relock_s = t;
        }
        prev = s;
    }
    Ok(h)
}

fn jnum(v: f64) -> serde_json::Value {
    if v.is_finite() {
        serde_json::json!(v)
    } else {
        serde_json::Value::Null
    }
}

fn jopt(v: Option<f64>) -> serde_json::Value {
    match v {
        Some(x) if x.is_finite() => serde_json::json!(x),
        _ => serde_json::Value::Null,
    }
}

impl TrackingLoopScenario {
    /// The resolved loop geometry, with the code allowance defaulted to half the spacing.
    pub fn loop_config(&self) -> LoopConfig {
        LoopConfig {
            pll_bandwidth_hz: self.pll_bandwidth_hz,
            dll_bandwidth_hz: self.dll_bandwidth_hz,
            integration_s: self.predetection_integration_s,
            spacing_chips: self.correlator_spacing_chips,
            carrier_allowance_deg: self.carrier_allowance_deg,
            code_allowance_chips: self
                .code_allowance_chips
                .unwrap_or(self.correlator_spacing_chips / 2.0),
            pullin_bandwidth_ratio: self.pullin_bandwidth_ratio,
        }
    }

    /// The jammer link the two denial radii are evaluated on.
    pub fn denial_link(&self) -> DenialLink {
        DenialLink {
            jammer_power_dbw: self.jammer_power_dbw,
            jammer_gain_dbi: self.jammer_gain_dbi,
            rx_gain_toward_jammer_db: self.rx_gain_toward_jammer_db,
            rx_gain_toward_sat_db: self.rx_gain_toward_sat_db,
            signal_power_dbw: self.signal_power_dbw,
            freq_hz: self.freq_hz,
            chip_rate_hz: self.chip_rate_hz,
            q: q_factor(&self.jammer_type, self.q_override),
            temp_k: self.temp_k,
        }
    }

    fn validate(&self) -> Result<(), String> {
        let finite = [
            ("pll_bandwidth_hz", self.pll_bandwidth_hz),
            ("dll_bandwidth_hz", self.dll_bandwidth_hz),
            (
                "predetection_integration_s",
                self.predetection_integration_s,
            ),
            ("correlator_spacing_chips", self.correlator_spacing_chips),
            ("carrier_allowance_deg", self.carrier_allowance_deg),
            ("pullin_bandwidth_ratio", self.pullin_bandwidth_ratio),
            ("cn0_high_dbhz", self.cn0_high_dbhz),
            ("cn0_low_dbhz", self.cn0_low_dbhz),
            ("ramp_duration_s", self.ramp_duration_s),
            ("jammer_power_dbw", self.jammer_power_dbw),
            ("signal_power_dbw", self.signal_power_dbw),
            ("temp_k", self.temp_k),
            ("freq_hz", self.freq_hz),
            ("chip_rate_hz", self.chip_rate_hz),
            ("doppler_rate_hz_per_s", self.doppler_rate_hz_per_s),
            ("code_slew_chips_per_s", self.code_slew_chips_per_s),
        ];
        for (name, v) in finite {
            if !v.is_finite() {
                return Err(format!("tracking-loop: {name} must be finite"));
            }
        }
        let positive = [
            ("pll_bandwidth_hz", self.pll_bandwidth_hz),
            ("dll_bandwidth_hz", self.dll_bandwidth_hz),
            (
                "predetection_integration_s",
                self.predetection_integration_s,
            ),
            ("correlator_spacing_chips", self.correlator_spacing_chips),
            ("carrier_allowance_deg", self.carrier_allowance_deg),
            ("temp_k", self.temp_k),
            ("freq_hz", self.freq_hz),
            ("chip_rate_hz", self.chip_rate_hz),
        ];
        for (name, v) in positive {
            if v <= 0.0 {
                return Err(format!("tracking-loop: {name} must be positive (got {v})"));
            }
        }
        if self.correlator_spacing_chips >= 1.9 {
            return Err(format!(
                "tracking-loop: correlator_spacing_chips must be below 1.9 chips (got {})",
                self.correlator_spacing_chips
            ));
        }
        if self.pullin_bandwidth_ratio < 1.0 {
            return Err(format!(
                "tracking-loop: pullin_bandwidth_ratio must be at least 1 (got {}) — a loop that \
                 re-pulls-in with a NARROWER bandwidth than it tracks with would invert the \
                 hysteresis",
                self.pullin_bandwidth_ratio
            ));
        }
        if self.ramp_duration_s < 0.0 {
            return Err("tracking-loop: ramp_duration_s must not be negative".into());
        }
        if self.cn0_low_dbhz > self.cn0_high_dbhz {
            return Err(format!(
                "tracking-loop: cn0_low_dbhz ({}) must not exceed cn0_high_dbhz ({})",
                self.cn0_low_dbhz, self.cn0_high_dbhz
            ));
        }
        for (name, axis) in [
            ("jitter_table_cn0_dbhz", &self.jitter_table_cn0_dbhz),
            (
                "spoof_code_slew_chips_per_s",
                &self.spoof_code_slew_chips_per_s,
            ),
            (
                "spoof_doppler_rate_hz_per_s",
                &self.spoof_doppler_rate_hz_per_s,
            ),
        ] {
            if axis.is_empty() {
                return Err(format!("tracking-loop: {name} must not be empty"));
            }
            if axis.len() > MAX_AXIS_LEN {
                return Err(format!(
                    "tracking-loop: {name} has {} entries; the cap is {MAX_AXIS_LEN}",
                    axis.len()
                ));
            }
            if axis.iter().any(|v| !v.is_finite()) {
                return Err(format!("tracking-loop: {name} holds a non-finite value"));
            }
        }
        if self.drop_confirm_epochs == 0 || self.relock_confirm_epochs == 0 {
            return Err("tracking-loop: the confirmation dwells must be at least 1 epoch".into());
        }
        Ok(())
    }

    /// Run the scenario, returning the pretty-printed result document and a one-line
    /// summary. Deterministic: no random state and no wall-clock read.
    pub fn run_json(&self) -> Result<(String, String), String> {
        self.validate()?;
        let cfg = self.loop_config();
        let th = cfg.thresholds(self.doppler_rate_hz_per_s, self.code_slew_chips_per_s);
        let link = self.denial_link();
        let t = cfg.integration_s;

        // --- jitter table -------------------------------------------------------------
        let jitter_rows: Vec<serde_json::Value> = self
            .jitter_table_cn0_dbhz
            .iter()
            .map(|&c| {
                let sp = pll_thermal_jitter_rad(c, cfg.pll_bandwidth_hz, t).to_degrees();
                let sd = dll_thermal_jitter_chips(c, cfg.dll_bandwidth_hz, t, cfg.spacing_chips);
                serde_json::json!({
                    "cn0_dbhz": c,
                    "pll_jitter_deg": sp,
                    "pll_three_sigma_deg": 3.0 * sp,
                    "dll_jitter_chips": sd,
                    "dll_three_sigma_chips": 3.0 * sd,
                    "carrier_within_allowance": 3.0 * sp <= cfg.carrier_allowance_deg,
                    "code_within_allowance": 3.0 * sd <= cfg.code_allowance_chips,
                    "log10_mean_time_to_cycle_slip_s":
                        log10_mean_time_to_cycle_slip_s(c, cfg.pll_bandwidth_hz, t),
                })
            })
            .collect();

        // --- hysteresis bounds ---------------------------------------------------------
        let r = cfg.pullin_bandwidth_ratio.max(1.0);
        let hyst_lo = 5.0 * r.log10();
        let hyst_hi = 10.0 * r.log10();

        // --- lock history ---------------------------------------------------------------
        let (history, history_status) = match (th.drop_cn0_dbhz, th.relock_cn0_dbhz) {
            (Some(d), Some(rl)) => {
                let mut det =
                    LockDetector::new(d, rl, self.drop_confirm_epochs, self.relock_confirm_epochs);
                (
                    Some(run_lock_history(
                        &mut det,
                        self.cn0_high_dbhz,
                        self.cn0_low_dbhz,
                        self.ramp_duration_s,
                        t,
                    )?),
                    "run",
                )
            }
            _ => (
                None,
                "not-run: the loop has no C/N0 threshold under the stated dynamics",
            ),
        };

        // --- denial radii ----------------------------------------------------------------
        let (r_thresh_m, r_thresh_status) = link.radius_for_js_db(self.denial_js_threshold_db);
        let (r_capture_m, r_capture_status) = link.radius_for_js_db(self.capture_js_threshold_db);
        let (r_loop_m, r_loop_status, loop_js_db) = match th.drop_cn0_dbhz {
            Some(d) => {
                let (rm, st) = link.radius_for_cn0_dbhz(d);
                (Some(rm), st, Some(link.js_db_at(rm)))
            }
            None => (
                None,
                "not-computed: the loop has no C/N0 threshold under the stated dynamics",
                None,
            ),
        };
        let delta_km = r_loop_m.map(|rl| (rl - r_thresh_m) / 1000.0);
        let ratio = r_loop_m.map(|rl| rl / r_thresh_m);

        // --- spoof pull-in ------------------------------------------------------------------
        let mut cells = Vec::new();
        for &cs in &self.spoof_code_slew_chips_per_s {
            for &dr in &self.spoof_doppler_rate_hz_per_s {
                let c = pull_in_cell(&cfg, self.cn0_high_dbhz, cs, dr);
                cells.push(serde_json::json!({
                    "code_slew_chips_per_s": c.code_slew_chips_per_s,
                    "code_slew_m_per_s": c.code_slew_chips_per_s * C_M_PER_S / self.chip_rate_hz,
                    "doppler_rate_hz_per_s": c.doppler_rate_hz_per_s,
                    "range_acceleration_m_per_s2": c.doppler_rate_hz_per_s * C_M_PER_S / self.freq_hz,
                    "code_lag_chips": c.code_lag_chips,
                    "carrier_stress_deg": c.carrier_stress_deg,
                    "carrier_budget_deg": c.carrier_budget_deg,
                    "code_follows": c.code_follows,
                    "carrier_follows": c.carrier_follows,
                    "pulled_in": c.pulled_in,
                }));
            }
        }
        let max_slew_noiseless =
            max_code_slew_chips_per_s(cfg.dll_bandwidth_hz, cfg.code_allowance_chips);
        let max_slew = max_code_slew_at_cn0_chips_per_s(
            cfg.dll_bandwidth_hz,
            self.cn0_high_dbhz,
            t,
            cfg.spacing_chips,
            cfg.code_allowance_chips,
        );
        let max_rate = max_doppler_rate_hz_per_s(
            cfg.pll_bandwidth_hz,
            self.cn0_high_dbhz,
            t,
            cfg.carrier_allowance_deg,
        );

        let units = self.units_block();

        let mut json = serde_json::json!({
            "kind": "tracking-loop",
            "label": "MIXED — VALIDATED loop closed forms, MODELLED loop configuration. The \
                      carrier and code thermal-jitter expressions, the loop-filter reduction \
                      sqrt(2*B_n*T) and the first-order ramp lag are cross-checked against the \
                      engine's own sdr correlator stepped forward on seeded synthetic IF (a \
                      different route to the same numbers), and the modified Bessel I0 against \
                      standard tabulated values. MODELLED: the loop bandwidths, integration \
                      time, correlator spacing, pull-in bandwidth ratio, confirmation dwells, \
                      jammer power and antenna gains are REPRESENTATIVE BAND FIGURES, not a \
                      datasheet for any receiver. NOT modelled: oscillator (Allan-deviation) \
                      and vibration jitter, front-end bandwidth limiting, multipath, AGC \
                      dynamics, data-bit-transition loss, external aiding, and any half-cycle \
                      correction to the Costas cycle-slip formula. The loop-dynamics denial \
                      radius is reported ALONGSIDE the existing power-ratio radius and never \
                      in place of it. Not a certified receiver-performance product.",
            "loop": {
                "pll_bandwidth_hz": cfg.pll_bandwidth_hz,
                "dll_bandwidth_hz": cfg.dll_bandwidth_hz,
                "predetection_integration_s": cfg.integration_s,
                "correlator_spacing_chips": cfg.spacing_chips,
                "carrier_allowance_deg": cfg.carrier_allowance_deg,
                "code_allowance_chips": cfg.code_allowance_chips,
                "pullin_bandwidth_ratio": cfg.pullin_bandwidth_ratio,
                "doppler_rate_hz_per_s": self.doppler_rate_hz_per_s,
                "code_slew_chips_per_s": self.code_slew_chips_per_s,
                "discriminator_slope_chips_per_chip":
                    early_late_amplitude_discriminator_slope(cfg.spacing_chips),
                "threshold_rule": "carrier: 3*sigma_PLL + theta_e <= carrier_allowance_deg (the \
                                   15-degree rule in its three-sigma, 45-degree form); code: \
                                   3*sigma_DLL + ramp lag <= code_allowance_chips, the \
                                   early-late discriminator's linear half-range d/2.",
            },
            "thresholds": {
                "carrier_drop_cn0_dbhz": jopt(th.carrier_drop_cn0_dbhz),
                "code_drop_cn0_dbhz": jopt(th.code_drop_cn0_dbhz),
                "drop_cn0_dbhz": jopt(th.drop_cn0_dbhz),
                "binding_loop": th.binding_loop,
                "relock_cn0_dbhz": jopt(th.relock_cn0_dbhz),
                "hysteresis_db": jopt(th.hysteresis_db),
                "hysteresis_lower_bound_db": hyst_lo,
                "hysteresis_upper_bound_db": hyst_hi,
                "hysteresis_definition": "the re-lock threshold is the same tracking-threshold \
                                          rule evaluated with the loop bandwidths a receiver \
                                          re-pulls-in at (pullin_bandwidth_ratio times the \
                                          tracking bandwidths). Jitter grows as sqrt(B_n) in the \
                                          thermal-dominated limit and as B_n^(1/4) in the \
                                          squaring-loss-dominated limit, so the width must lie \
                                          between 5*log10(ratio) and 10*log10(ratio) dB. It is \
                                          DERIVED from the bandwidth ratio, not asserted; the \
                                          ratio itself is a MODELLED design choice.",
            },
            "jitter_table": jitter_rows,
            "spoof_pull_in": {
                "max_code_slew_chips_per_s": max_slew,
                "max_code_slew_m_per_s": max_slew * C_M_PER_S / self.chip_rate_hz,
                "max_code_slew_noiseless_chips_per_s": max_slew_noiseless,
                "max_doppler_rate_hz_per_s": max_rate,
                "max_range_acceleration_m_per_s2": max_rate * C_M_PER_S / self.freq_hz,
                "evaluated_at_cn0_dbhz": self.cn0_high_dbhz,
                "cells": cells,
                "definition": "a spoofer captures by slewing the victim's code phase and carrier \
                               away from truth. The victim follows only while its first-order DLL \
                               ramp lag (code_slew / (4*B_dll)) plus 3*sigma_DLL stays inside the \
                               code allowance AND its second-order PLL dynamic stress \
                               (360*fdot/omega_n^2, omega_n = B_pll/0.53) plus 3*sigma_PLL stays \
                               inside the carrier allowance. A spoofer that slews FASTER than \
                               these limits does not capture the loop — it outruns it. This is \
                               why loop dynamics does not reduce the capture criterion to a \
                               power ratio at all.",
            },
        });

        json["denial"] = serde_json::json!({
            "criterion_note": "BOTH criteria are reported. The threshold criterion is the \
                               engine's existing power ratio (J/S at denial_js_threshold_db, \
                               default 30 dB) and is unchanged. The loop-dynamics criterion is \
                               the standoff at which the effective C/N0 falls to the drop \
                               threshold this loop configuration implies. Neither replaces the \
                               other; denial_radius_delta_km is their signed difference.",
            "nominal_cn0_dbhz": link.nominal_cn0_dbhz(),
            "q_factor": link.q,
            "denial_js_threshold_db": self.denial_js_threshold_db,
            "denial_radius_threshold_km": r_thresh_m / 1000.0,
            "denial_radius_threshold_status": r_thresh_status,
            "denial_cn0_at_threshold_radius_dbhz": link.effective_cn0_dbhz_at(r_thresh_m),
            "denial_js_loop_db": jopt(loop_js_db),
            "denial_radius_loop_dynamics_km": jopt(r_loop_m.map(|x| x / 1000.0)),
            "denial_radius_loop_dynamics_status": r_loop_status,
            "denial_radius_delta_km": jopt(delta_km),
            "denial_radius_ratio": jopt(ratio),
            "denial_js_delta_db": jopt(loop_js_db.map(|j| j - self.denial_js_threshold_db)),
            "denial_radius_delta_definition": "denial_radius_delta_km = \
                                               denial_radius_loop_dynamics_km - \
                                               denial_radius_threshold_km. Negative means the \
                                               loop holds lock closer in than the power-ratio \
                                               rule allows, so the power-ratio rule OVERSTATES \
                                               the denied area; positive would mean the opposite.",
            "capture_js_threshold_db": self.capture_js_threshold_db,
            "capture_radius_threshold_km": r_capture_m / 1000.0,
            "capture_radius_threshold_status": r_capture_status,
            "capture_radius_loop_dynamics_km": serde_json::Value::Null,
            "capture_radius_loop_dynamics_status": "not-applicable: under loop dynamics the \
                                                    binding spoof-capture constraint is the code \
                                                    and carrier offset RATE the victim's loops \
                                                    can follow, not a power ratio, so there is no \
                                                    radius to report. See spoof_pull_in.",
        });

        json["lock_history"] = match history {
            Some(h) => serde_json::json!({
                "status": history_status,
                "cn0_high_dbhz": self.cn0_high_dbhz,
                "cn0_low_dbhz": self.cn0_low_dbhz,
                "ramp_duration_s": self.ramp_duration_s,
                "ramp_rate_db_per_s": if self.ramp_duration_s > 0.0 {
                    (self.cn0_low_dbhz - self.cn0_high_dbhz) / self.ramp_duration_s
                } else { 0.0 },
                "detector_steps": h.steps,
                "drop_confirm_epochs": self.drop_confirm_epochs,
                "relock_confirm_epochs": self.relock_confirm_epochs,
                "drop_crossing_s": jnum(h.drop_crossing_s),
                "declared_loss_of_lock_s": jnum(h.declared_loss_s),
                "time_to_lose_lock_after_crossing_s":
                    jnum(h.declared_loss_s - h.drop_crossing_s),
                "relock_crossing_s": jnum(h.relock_crossing_s),
                "declared_relock_s": jnum(h.declared_relock_s),
                "unlocked_duration_s": h.unlocked_duration_s,
                "definition": "declared_loss_of_lock_s is when the two-threshold detector \
                               transitions, which is the crossing of the drop threshold plus the \
                               confirmation dwell. It is a DECLARATION time. The physical phase \
                               escape time is the separate cycle-slip column of the jitter \
                               table.",
            }),
            None => serde_json::json!({ "status": history_status }),
        };
        json["units"] = units;

        let summary = format!(
            "tracking-loop: B_pll {:.1} Hz / B_dll {:.1} Hz, T {:.0} ms, d {:.2} chip -> drop {} \
             dB-Hz ({} binds), relock {} dB-Hz, hysteresis {} dB | loss of lock declared {} s \
             into the ramp | denial radius threshold(J/S {:.0} dB) {:.3} km vs loop dynamics {} \
             km, delta {} km | spoof pull-in <= {:.3} chip/s code and {:.2} Hz/s carrier \
             (MODELLED loop, VALIDATED closed forms)",
            cfg.pll_bandwidth_hz,
            cfg.dll_bandwidth_hz,
            cfg.integration_s * 1000.0,
            cfg.spacing_chips,
            opt4(th.drop_cn0_dbhz),
            th.binding_loop,
            opt4(th.relock_cn0_dbhz),
            opt4(th.hysteresis_db),
            history.map_or("n/a".to_string(), |h| format!("{:.3}", h.declared_loss_s)),
            self.denial_js_threshold_db,
            r_thresh_m / 1000.0,
            opt4(r_loop_m.map(|x| x / 1000.0)),
            opt4(delta_km),
            max_slew,
            max_rate,
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }

    /// Unit and provenance class for every numeric field the report publishes. `input` is
    /// a value the caller supplied (or its documented default), `modelled-input` a
    /// representative band figure standing in for a real receiver or threat parameter, and
    /// `computed` a value this run derived.
    fn units_block(&self) -> serde_json::Value {
        let mut u = serde_json::json!({
            "loop.pll_bandwidth_hz": {"unit": "Hz", "provenance": "modelled-input", "note": "one-sided carrier loop noise bandwidth; representative band figure"},
            "loop.dll_bandwidth_hz": {"unit": "Hz", "provenance": "modelled-input", "note": "one-sided code loop noise bandwidth; representative band figure"},
            "loop.predetection_integration_s": {"unit": "s", "provenance": "modelled-input", "note": "coherent integration per epoch; the default 1 ms is one C/A code period"},
            "loop.correlator_spacing_chips": {"unit": "chip", "provenance": "modelled-input"},
            "loop.carrier_allowance_deg": {"unit": "deg", "provenance": "input", "note": "the 45 deg three-sigma form of the 15-degree Costas rule"},
            "loop.code_allowance_chips": {"unit": "chip", "provenance": "computed", "note": "defaults to half the correlator spacing, the discriminator's linear half-range"},
            "loop.pullin_bandwidth_ratio": {"unit": "ratio (dimensionless)", "provenance": "modelled-input", "note": "bandwidth multiplier while re-pulling-in; a design choice, not a physical constant"},
            "loop.doppler_rate_hz_per_s": {"unit": "Hz/s", "provenance": "input"},
            "loop.code_slew_chips_per_s": {"unit": "chip/s", "provenance": "input"},
            "loop.discriminator_slope_chips_per_chip": {"unit": "chip/chip (dimensionless)", "provenance": "computed", "note": "1/(2-d), the ideal-triangle gain of the normalised early-late amplitude discriminator"},
            "thresholds.carrier_drop_cn0_dbhz": {"unit": "dB-Hz", "provenance": "computed"},
            "thresholds.code_drop_cn0_dbhz": {"unit": "dB-Hz", "provenance": "computed"},
            "thresholds.drop_cn0_dbhz": {"unit": "dB-Hz", "provenance": "computed", "note": "the larger of the two; whichever loop gives up first binds"},
            "thresholds.relock_cn0_dbhz": {"unit": "dB-Hz", "provenance": "computed"},
            "thresholds.hysteresis_db": {"unit": "dB", "provenance": "computed", "note": "relock_cn0_dbhz - drop_cn0_dbhz"},
            "thresholds.hysteresis_lower_bound_db": {"unit": "dB", "provenance": "computed", "note": "5*log10(pullin_bandwidth_ratio), the squaring-loss-dominated limit"},
            "thresholds.hysteresis_upper_bound_db": {"unit": "dB", "provenance": "computed", "note": "10*log10(pullin_bandwidth_ratio), the thermal-dominated limit"},
            "jitter_table[].cn0_dbhz": {"unit": "dB-Hz", "provenance": "input"},
            "jitter_table[].pll_jitter_deg": {"unit": "deg", "provenance": "computed", "note": "1 sigma Costas carrier thermal jitter, squaring loss included"},
            "jitter_table[].pll_three_sigma_deg": {"unit": "deg", "provenance": "computed"},
            "jitter_table[].dll_jitter_chips": {"unit": "chip", "provenance": "computed", "note": "1 sigma non-coherent early-late code thermal jitter"},
            "jitter_table[].dll_three_sigma_chips": {"unit": "chip", "provenance": "computed"},
            "jitter_table[].log10_mean_time_to_cycle_slip_s": {"unit": "log10(s)", "provenance": "computed", "note": "Viterbi first-order mean time between slips; reported in log10 because it spans hundreds of decades"},
            "spoof_pull_in.max_code_slew_chips_per_s": {"unit": "chip/s", "provenance": "computed", "note": "4*B_dll*(code_allowance_chips - 3*sigma_DLL) at evaluated_at_cn0_dbhz; this is the ceiling the cells are decided against"},
            "spoof_pull_in.max_code_slew_noiseless_chips_per_s": {"unit": "chip/s", "provenance": "computed", "note": "4*B_dll*code_allowance_chips, the geometric ceiling with the code jitter set aside"},
            "spoof_pull_in.max_code_slew_m_per_s": {"unit": "m/s", "provenance": "computed", "note": "the same limit as a pseudorange drag rate at the stated chip rate"},
            "spoof_pull_in.max_doppler_rate_hz_per_s": {"unit": "Hz/s", "provenance": "computed"},
            "spoof_pull_in.max_range_acceleration_m_per_s2": {"unit": "m/s^2", "provenance": "computed", "note": "the same limit as a line-of-sight acceleration at the stated carrier"},
            "spoof_pull_in.evaluated_at_cn0_dbhz": {"unit": "dB-Hz", "provenance": "input"},
            "spoof_pull_in.cells[].code_slew_chips_per_s": {"unit": "chip/s", "provenance": "input"},
            "spoof_pull_in.cells[].code_slew_m_per_s": {"unit": "m/s", "provenance": "computed"},
            "spoof_pull_in.cells[].doppler_rate_hz_per_s": {"unit": "Hz/s", "provenance": "input"},
            "spoof_pull_in.cells[].range_acceleration_m_per_s2": {"unit": "m/s^2", "provenance": "computed"},
            "spoof_pull_in.cells[].code_lag_chips": {"unit": "chip", "provenance": "computed"},
            "spoof_pull_in.cells[].carrier_stress_deg": {"unit": "deg", "provenance": "computed"},
            "spoof_pull_in.cells[].carrier_budget_deg": {"unit": "deg", "provenance": "computed", "note": "3*sigma_PLL + dynamic stress"},
        });
        let denial = serde_json::json!({
            "denial.nominal_cn0_dbhz": {"unit": "dB-Hz", "provenance": "computed", "note": "jamming::nominal_cn0_dbhz for the stated signal power, antenna gain and noise temperature"},
            "denial.q_factor": {"unit": "ratio (dimensionless)", "provenance": "modelled-input", "note": "spectral-separation coefficient from jamming::q_factor"},
            "denial.denial_js_threshold_db": {"unit": "dB", "provenance": "input", "note": "the engine's existing power-ratio denial criterion; reported unchanged"},
            "denial.denial_radius_threshold_km": {"unit": "km", "provenance": "computed", "note": "standoff at which J/S reaches denial_js_threshold_db"},
            "denial.denial_cn0_at_threshold_radius_dbhz": {"unit": "dB-Hz", "provenance": "computed"},
            "denial.denial_js_loop_db": {"unit": "dB", "provenance": "computed", "note": "the J/S the loop-dynamics radius corresponds to"},
            "denial.denial_radius_loop_dynamics_km": {"unit": "km", "provenance": "computed", "note": "standoff at which the effective C/N0 falls to thresholds.drop_cn0_dbhz"},
            "denial.denial_radius_delta_km": {"unit": "km", "provenance": "computed", "note": "loop-dynamics radius minus threshold radius"},
            "denial.denial_radius_ratio": {"unit": "ratio (dimensionless)", "provenance": "computed"},
            "denial.denial_js_delta_db": {"unit": "dB", "provenance": "computed"},
            "denial.capture_js_threshold_db": {"unit": "dB", "provenance": "input", "note": "the engine's existing power-ratio capture criterion; reported unchanged"},
            "denial.capture_radius_threshold_km": {"unit": "km", "provenance": "computed"},
        });
        let hist = serde_json::json!({
            "lock_history.cn0_high_dbhz": {"unit": "dB-Hz", "provenance": "input"},
            "lock_history.cn0_low_dbhz": {"unit": "dB-Hz", "provenance": "input"},
            "lock_history.ramp_duration_s": {"unit": "s", "provenance": "input", "note": "per leg; the profile ramps down then back up"},
            "lock_history.ramp_rate_db_per_s": {"unit": "dB/s", "provenance": "computed"},
            "lock_history.detector_steps": {"unit": "count", "provenance": "computed"},
            "lock_history.drop_confirm_epochs": {"unit": "count", "provenance": "modelled-input"},
            "lock_history.relock_confirm_epochs": {"unit": "count", "provenance": "modelled-input"},
            "lock_history.drop_crossing_s": {"unit": "s", "provenance": "computed"},
            "lock_history.declared_loss_of_lock_s": {"unit": "s", "provenance": "computed"},
            "lock_history.time_to_lose_lock_after_crossing_s": {"unit": "s", "provenance": "computed", "note": "the confirmation dwell, in seconds"},
            "lock_history.relock_crossing_s": {"unit": "s", "provenance": "computed"},
            "lock_history.declared_relock_s": {"unit": "s", "provenance": "computed"},
            "lock_history.unlocked_duration_s": {"unit": "s", "provenance": "computed"},
        });
        for src in [denial, hist] {
            if let (Some(dst), Some(s)) = (u.as_object_mut(), src.as_object()) {
                for (k, v) in s {
                    dst.insert(k.clone(), v.clone());
                }
            }
        }
        u
    }
}

fn opt4(v: Option<f64>) -> String {
    v.map_or_else(|| "n/a".to_string(), |x| format!("{x:.4}"))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::sdr::{correlate, synth_if, CaCode, CorrParams, CA_CODE_LEN};

    // ---------------------------------------------------------------------------------
    // Oracle 1 — the modified Bessel function against standard tabulated values.
    // ---------------------------------------------------------------------------------

    #[test]
    fn bessel_i0_matches_the_standard_tabulated_values() {
        // Abramowitz & Stegun Table 9.8 / the standard modified-Bessel implementation.
        // These are an EXTERNAL oracle: they are not produced by any expression in this
        // module, and the A&S 9.8.1/9.8.2 polynomials carry a stated |eps| < 1.9e-7.
        let table = [
            (0.0_f64, 1.0_f64),
            (0.5, 1.063_483_370_741_323_4),
            (1.0, 1.266_065_877_752_008_2),
            (2.0, 2.279_585_302_336_067),
            (3.0, 4.880_792_585_865_024),
            (3.75, 9.118_945_860_844_567),
            (5.0, 27.239_871_823_604_442),
            (10.0, 2_815.716_628_466_254),
            (20.0, 43_558_282.559_553_534),
        ];
        for (x, want) in table {
            let got = bessel_i0(x);
            let rel = ((got - want) / want).abs();
            assert!(rel < 2.0e-6, "I0({x}) = {got}, want {want} (rel {rel:.3e})");
        }
        // The log form agrees with the direct form where the direct form is representable,
        // and stays finite far beyond where it is not.
        for x in [1.0_f64, 4.0, 10.0, 50.0, 200.0] {
            let rel = ((ln_bessel_i0(x) - bessel_i0(x).ln()) / bessel_i0(x).ln()).abs();
            assert!(rel < 1.0e-6, "ln I0({x}) disagrees: rel {rel:.3e}");
        }
        assert!(ln_bessel_i0(5000.0).is_finite());
        assert!(
            !bessel_i0(5000.0).is_finite(),
            "the direct form must overflow — that is why the log form exists"
        );
    }

    // ---------------------------------------------------------------------------------
    // Oracle 2 — the carrier jitter closed form against the real sdr correlator.
    // ---------------------------------------------------------------------------------

    /// Per-component noise standard deviation that puts `synth_if`'s unit-amplitude signal
    /// at `cn0_dbhz`. `synth_if` adds `noise * (U(-1,1) + U(-1,1))`, so the per-component
    /// variance is `noise^2 * 2/3`; and `C/N0 = A^2 * fs / (2 * sigma^2)`.
    fn noise_for_cn0(cn0_dbhz: f64, fs: f64) -> f64 {
        let cn0 = 10f64.powf(cn0_dbhz / 10.0);
        let sigma2 = fs / (2.0 * cn0);
        (sigma2 / (2.0 / 3.0)).sqrt()
    }

    fn std_of(v: &[f64]) -> f64 {
        let n = v.len() as f64;
        let m: f64 = v.iter().sum::<f64>() / n;
        (v.iter().map(|x| (x - m) * (x - m)).sum::<f64>() / n).sqrt()
    }

    /// A sample rate that is deliberately NOT an integer multiple of the chip rate. The
    /// `chip_at` replica lookup in `sdr` is a zero-order hold on `floor(phase)`, so at an
    /// integer samples-per-chip rate every correlation lands on the same sub-chip grid and
    /// the early-late response degenerates into a staircase with dead bands. At a
    /// non-commensurate rate the sample phase sweeps the chip and the correlation recovers
    /// the ideal triangle. 5 MHz is 4.888 samples/chip (and is what `spoof_capture`
    /// already defaults to).
    const FS_HZ: f64 = 5.0e6;

    #[test]
    fn open_loop_carrier_jitter_matches_the_sdr_correlator() {
        // The closed form is checked against a DIFFERENT route to the same number: the
        // measured spread of the atan(Q/I) discriminator of `sdr::correlate` over seeded
        // synthetic IF at a calibrated C/N0. Three noise realisations are pooled, because
        // one realisation carries its own few-percent bias and reusing a single seed across
        // C/N0 values would make four "independent" agreements share it.
        //
        // The squaring loss is not decorative and the window is chosen so that it can be
        // seen: at 45 dB-Hz it is a 0.8 % effect (below the sampling error, so both forms
        // fit), while at 35-40 dB-Hz it is 2-8 % and only the form that carries it lands.
        // Below about 32 dB-Hz the real atan discriminator saturates against its +-pi/2
        // range and measures LESS jitter than any linear theory predicts; that boundary is
        // asserted too, so the stated validity limit is pinned rather than just claimed.
        let code = CaCode::new(10).expect("PRN 10");
        let spe = (FS_HZ / 1000.0).round() as usize;
        let t = 1e-3;
        let n = 900usize;
        let measure = |cn0_db: f64| -> f64 {
            let noise = noise_for_cn0(cn0_db, FS_HZ);
            let mut all: Vec<f64> = Vec::with_capacity(3 * n);
            for seed in [9_123_457u64, 55_001, 3_141_593] {
                let iq = synth_if(
                    &code,
                    FS_HZ,
                    0.0,
                    crate::sdr::CA_CHIP_RATE_HZ,
                    0.0,
                    1.0,
                    spe * n,
                    noise,
                    seed,
                );
                for e in 0..n {
                    let (s, en) = (e * spe, e * spe + spe);
                    let cp = (crate::sdr::CA_CHIP_RATE_HZ * (s as f64 / FS_HZ))
                        .rem_euclid(CA_CODE_LEN as f64);
                    let p = CorrParams {
                        fs_hz: FS_HZ,
                        carrier_freq_hz: 0.0,
                        carrier_phase_rad: 0.0,
                        code_rate_hz: crate::sdr::CA_CHIP_RATE_HZ,
                        code_phase_chips: cp,
                        corr_spacing_chips: 0.5,
                    };
                    let c = correlate(&iq[s..en], &code, &p);
                    all.push((c.prompt.im / c.prompt.re).atan());
                }
            }
            std_of(&all)
        };
        for cn0_db in [45.0_f64, 40.0, 37.0, 35.0] {
            let measured = measure(cn0_db);
            let predicted = pll_measurement_jitter_rad(cn0_db, t);
            let rel = ((measured - predicted) / predicted).abs();
            assert!(
                rel < 0.02,
                "C/N0 {cn0_db} dB-Hz: correlator measured sigma {measured:.6} rad, closed form \
                 {predicted:.6} rad (rel {rel:.4})"
            );
            // Where the squaring loss is resolvable, the form that carries it must fit
            // several times better than the form that drops it.
            if cn0_db <= 40.0 {
                let no_loss = (1.0 / (2.0 * 10f64.powf(cn0_db / 10.0) * t)).sqrt();
                let rel_no_loss = ((measured - no_loss) / no_loss).abs();
                assert!(
                    rel_no_loss > 3.0 * rel,
                    "at {cn0_db} dB-Hz the squaring loss must be clearly visible: with it \
                     {rel:.4}, without it {rel_no_loss:.4}"
                );
            }
        }
        // The stated lower validity limit, asserted rather than asserted-about: at 32 dB-Hz
        // the bounded atan discriminator measures materially LESS than the linear theory.
        let measured = measure(32.0);
        let predicted = pll_measurement_jitter_rad(32.0, t);
        assert!(
            measured < 0.95 * predicted,
            "the discriminator must already be saturating at 32 dB-Hz: measured {measured:.6} \
             rad vs closed form {predicted:.6} rad"
        );
    }

    #[test]
    fn closed_loop_carrier_jitter_matches_a_stepped_sdr_costas_loop() {
        // Close a first-order Costas loop around `sdr::correlate` — the same update law
        // `sdr::track` uses, with the frequency integrator off so the loop is exactly first
        // order — and compare the residual carrier-phase state's spread against
        // sigma_meas * sqrt(g/(2-g)), the exact steady-state variance of a discrete
        // first-order loop, and against the continuous form with B_n = g/(4T).
        let code = CaCode::new(10).expect("PRN 10");
        let spe = (FS_HZ / 1000.0).round() as usize;
        let t = 1e-3;
        let cn0_db = 45.0_f64;
        let noise = noise_for_cn0(cn0_db, FS_HZ);
        let n = 4000usize;
        let iq = synth_if(
            &code,
            FS_HZ,
            0.0,
            crate::sdr::CA_CHIP_RATE_HZ,
            0.0,
            1.0,
            spe * n,
            noise,
            777_001,
        );
        let sigma_meas = pll_measurement_jitter_rad(cn0_db, t);
        for g in [0.05_f64, 0.1, 0.2] {
            let mut ph = 0.0f64;
            let mut resid = Vec::with_capacity(n);
            for e in 0..n {
                let (s, en) = (e * spe, e * spe + spe);
                let cp = (crate::sdr::CA_CHIP_RATE_HZ * (s as f64 / FS_HZ))
                    .rem_euclid(CA_CODE_LEN as f64);
                let p = CorrParams {
                    fs_hz: FS_HZ,
                    carrier_freq_hz: 0.0,
                    carrier_phase_rad: ph,
                    code_rate_hz: crate::sdr::CA_CHIP_RATE_HZ,
                    code_phase_chips: cp,
                    corr_spacing_chips: 0.5,
                };
                let c = correlate(&iq[s..en], &code, &p);
                let disc = (c.prompt.im / c.prompt.re).atan();
                ph = (ph + g * disc).rem_euclid(std::f64::consts::TAU);
                let w = if ph > std::f64::consts::PI {
                    ph - std::f64::consts::TAU
                } else {
                    ph
                };
                resid.push(w);
            }
            let measured = std_of(&resid[500..]);
            let discrete = sigma_meas * (g / (2.0 - g)).sqrt();
            let rel = ((measured - discrete) / discrete).abs();
            assert!(
                rel < 0.06,
                "g {g}: stepped loop residual {measured:.5} rad vs discrete closed form \
                 {discrete:.5} rad (rel {rel:.4})"
            );
            // And the module's continuous form, with the equivalent bandwidth of that
            // discrete gain, lands on the same number to within the discrete/continuous
            // difference, which vanishes as g -> 0.
            let bn = equivalent_first_order_bandwidth_hz(g, t, 1.0);
            let continuous = pll_thermal_jitter_rad(cn0_db, bn, t);
            assert!(
                ((continuous - discrete) / discrete).abs() < g,
                "continuous B_n = g/(4T) must agree with the discrete form to O(g): \
                 {continuous:.5} vs {discrete:.5} at g {g}"
            );
            assert!(
                ((measured - continuous) / continuous).abs() < 0.10,
                "g {g}: stepped loop {measured:.5} rad vs continuous closed form \
                 {continuous:.5} rad"
            );
        }
    }

    // ---------------------------------------------------------------------------------
    // Oracle 3 — the code-loop ramp lag against the real sdr correlator.
    // ---------------------------------------------------------------------------------

    #[test]
    fn code_ramp_lag_matches_a_stepped_sdr_dll() {
        // Step the `sdr` DLL (the exact update law of `sdr::track`) over a noiseless signal
        // whose code chips FASTER than nominal, and compare the settled lag against
        // dll_ramp_lag_chips at the discrete loop's equivalent bandwidth. The loop's lag is
        // read at the middle of each correlation interval, which is where the correlator
        // averages the misalignment; the epoch-start value differs by exactly half an
        // epoch of slew and the test checks that too.
        let code = CaCode::new(10).expect("PRN 10");
        let d = 0.5_f64;
        let g = 0.1_f64;
        let t = 1e-3;
        let cp0 = 100.0_f64;
        let spe = (FS_HZ / 1000.0).round() as usize;
        let bn =
            equivalent_first_order_bandwidth_hz(g, t, early_late_amplitude_discriminator_slope(d));
        // The `chip_at` replica lookup is a zero-order hold on the sample grid, so the
        // stepped lag carries a small sub-sample dither whose period is one grid step of
        // relative code drift, `(R_c/fs) / (slew*T)` epochs. Averaging over a whole number
        // of those periods (after a settle burn-in) removes it; averaging over a partial
        // period does not, and leaves a few-percent bias that has nothing to do with the
        // loop theory under test.
        let grid_period_epochs = (crate::sdr::CA_CHIP_RATE_HZ / FS_HZ) / (t);
        let burn_in = 200usize;
        for slew in [1.0_f64, 2.0, 3.0] {
            let window = (2.0 * grid_period_epochs / slew).round() as usize;
            let n = burn_in + window;
            let iq = synth_if(
                &code,
                FS_HZ,
                0.0,
                crate::sdr::CA_CHIP_RATE_HZ + slew,
                cp0,
                1.0,
                spe * n,
                0.0,
                7,
            );
            let mut cp = cp0;
            let mut errs = Vec::with_capacity(n);
            for e in 0..n {
                let (s, en) = (e * spe, e * spe + spe);
                let p = CorrParams {
                    fs_hz: FS_HZ,
                    carrier_freq_hz: 0.0,
                    carrier_phase_rad: 0.0,
                    code_rate_hz: crate::sdr::CA_CHIP_RATE_HZ,
                    code_phase_chips: cp,
                    corr_spacing_chips: d,
                };
                let c = correlate(&iq[s..en], &code, &p);
                let (em, lm) = (c.early.abs(), c.late.abs());
                let disc = 0.5 * (em - lm) / (em + lm);
                let tt = (e * spe) as f64 / FS_HZ;
                let truth = cp0 + (crate::sdr::CA_CHIP_RATE_HZ + slew) * tt;
                let dx = cp - truth;
                let nn = CA_CODE_LEN as f64;
                let m = dx.rem_euclid(nn);
                errs.push(if m > nn / 2.0 { m - nn } else { m });
                cp = (cp + crate::sdr::CA_CHIP_RATE_HZ * t + g * disc).rem_euclid(nn);
            }
            let epoch_start_lag: f64 =
                errs[burn_in..].iter().sum::<f64>() / (errs.len() - burn_in) as f64;
            // The correlator integrates over the epoch, so the error it responds to is the
            // mid-epoch value: half an epoch of slew below the epoch-start value.
            let mid_epoch_lag = epoch_start_lag - slew * t / 2.0;
            let predicted = -dll_ramp_lag_chips(slew, bn);
            let rel = ((mid_epoch_lag - predicted) / predicted).abs();
            assert!(
                rel < 0.005,
                "slew {slew} chip/s: stepped DLL mid-epoch lag {mid_epoch_lag:.6} chips vs \
                 closed form {predicted:.6} chips at B_n {bn:.3} Hz (rel {rel:.4})"
            );
            // And the lag is inside the discriminator's linear half-range, so the linear
            // theory is being tested where it claims to apply.
            assert!(
                predicted.abs() < d / 2.0,
                "slew {slew} must stay inside the pull-in half-range for this check"
            );
        }
    }

    // ---------------------------------------------------------------------------------
    // Algebraic identities (labelled as such — they are not independent oracles).
    // ---------------------------------------------------------------------------------

    #[test]
    fn identity_loop_filter_reduces_measurement_jitter_by_sqrt_two_bt() {
        // ALGEBRAIC IDENTITY, not an independent oracle: this only states that the closed
        // and open loop forms in this module are the same expression scaled by sqrt(2*B*T).
        // The numerical content is carried by the correlator tests above.
        for cn0 in [20.0_f64, 30.0, 45.0] {
            for b in [0.5_f64, 2.0, 10.0, 50.0] {
                for t in [1e-3_f64, 5e-3, 2e-2] {
                    let a = pll_thermal_jitter_rad(cn0, b, t);
                    let e = pll_measurement_jitter_rad(cn0, t) * (2.0 * b * t).sqrt();
                    assert!((a - e).abs() <= 1e-12 * a.max(e), "PLL: {a} vs {e}");
                    for d in [0.1_f64, 0.5, 1.0] {
                        let a = dll_thermal_jitter_chips(cn0, b, t, d);
                        let e = dll_measurement_jitter_chips(cn0, t, d) * (2.0 * b * t).sqrt();
                        assert!((a - e).abs() <= 1e-12 * a.max(e), "DLL: {a} vs {e}");
                    }
                }
            }
        }
    }

    #[test]
    fn hysteresis_lies_between_the_two_bandwidth_scaling_limits() {
        // Jitter scales as sqrt(B_n) when thermal noise dominates and as B_n^(1/4) when the
        // squaring loss does, so equalising jitter across a bandwidth ratio r costs between
        // 5*log10(r) and 10*log10(r) dB of C/N0. The computed hysteresis MUST sit in that
        // band — a bound derived from the asymptotics of the same formula, so a coding
        // error that dropped the squaring loss or mis-scaled the bandwidth breaks it.
        for r in [1.5_f64, 2.0, 4.0, 10.0] {
            for t in [1e-3_f64, 2e-2] {
                for b in [2.0_f64, 10.0, 25.0] {
                    let cfg = LoopConfig {
                        pll_bandwidth_hz: b,
                        dll_bandwidth_hz: 1.0,
                        integration_s: t,
                        spacing_chips: 0.5,
                        carrier_allowance_deg: COSTAS_THRESHOLD_DEG,
                        code_allowance_chips: 0.25,
                        pullin_bandwidth_ratio: r,
                    };
                    let th = cfg.thresholds(0.0, 0.0);
                    let h = th.hysteresis_db.expect("a hysteresis width");
                    let (lo, hi) = (5.0 * r.log10(), 10.0 * r.log10());
                    assert!(
                        h > lo - 1e-9 && h < hi + 1e-9,
                        "ratio {r}, B {b}, T {t}: hysteresis {h:.4} dB outside [{lo:.4}, {hi:.4}]"
                    );
                    assert!(
                        th.relock_cn0_dbhz.unwrap() > th.drop_cn0_dbhz.unwrap(),
                        "re-lock must be strictly harder than holding lock"
                    );
                }
            }
        }
    }

    #[test]
    fn a_threshold_is_exactly_where_the_stated_rule_is_met() {
        // Evaluate the jitter AT the solved threshold and confirm the rule holds with
        // equality — the bisection solved the equation it claims to solve.
        let t = 1e-3;
        for b in [1.0_f64, 10.0, 30.0] {
            let c = carrier_tracking_threshold_cn0_dbhz(b, t, COSTAS_THRESHOLD_DEG, 0.0)
                .expect("a carrier threshold");
            let three_sigma = 3.0 * pll_thermal_jitter_rad(c, b, t).to_degrees();
            assert!(
                (three_sigma - COSTAS_THRESHOLD_DEG).abs() < 1e-6,
                "B {b}: 3 sigma at the threshold is {three_sigma}, not {COSTAS_THRESHOLD_DEG}"
            );
            for d in [0.1_f64, 0.5, 1.0] {
                let cc = code_tracking_threshold_cn0_dbhz(b, t, d, d / 2.0, 0.0)
                    .expect("a code threshold");
                let three = 3.0 * dll_thermal_jitter_chips(cc, b, t, d);
                assert!(
                    (three - d / 2.0).abs() < 1e-9,
                    "B {b} d {d}: 3 sigma at the threshold is {three}, not {}",
                    d / 2.0
                );
            }
        }
        // Dynamic stress that already fills the budget leaves NO threshold at any signal
        // strength. That is reported as None — an unreachable condition, not a zero.
        assert!(
            carrier_tracking_threshold_cn0_dbhz(1.0, 1e-3, COSTAS_THRESHOLD_DEG, 1000.0).is_none(),
            "a 1 Hz loop cannot hold 1000 Hz/s at any C/N0"
        );
    }

    #[test]
    fn a_wider_loop_needs_more_signal_and_a_longer_dwell_costs_time() {
        let t = 1e-3;
        let mut prev = f64::NEG_INFINITY;
        for b in [1.0_f64, 2.0, 5.0, 10.0, 25.0, 50.0] {
            let c = carrier_tracking_threshold_cn0_dbhz(b, t, COSTAS_THRESHOLD_DEG, 0.0).unwrap();
            assert!(
                c > prev,
                "the threshold must rise with bandwidth: {b} Hz -> {c}"
            );
            prev = c;
        }
        // The detector declares loss exactly one confirmation dwell after the crossing.
        for dwell in [1usize, 10, 50, 500] {
            let mut det = LockDetector::new(25.0, 27.0, dwell, 10);
            let h = run_lock_history(&mut det, 45.0, 15.0, 60.0, 1e-3).expect("history");
            let lag = h.declared_loss_s - h.drop_crossing_s;
            assert!(
                (lag - dwell as f64 * 1e-3).abs() < 1.5e-3,
                "dwell {dwell}: declared {lag} s after the crossing"
            );
        }
    }

    #[test]
    fn the_cycle_slip_time_collapses_as_the_jitter_approaches_a_quarter_cycle() {
        // The 15-degree rule is conservative precisely because the slip time is
        // astronomically long there and falls off a cliff below it. Assert the ordering and
        // the two anchor magnitudes rather than a shape nobody can check.
        let (b, t) = (10.0_f64, 1e-3);
        let mut prev = f64::INFINITY;
        for cn0 in [45.0_f64, 40.0, 35.0, 30.0, 27.0, 25.0, 22.0, 20.0] {
            let l = log10_mean_time_to_cycle_slip_s(cn0, b, t);
            assert!(l < prev, "slip time must fall with C/N0 at {cn0}");
            prev = l;
        }
        let at_threshold = carrier_tracking_threshold_cn0_dbhz(b, t, COSTAS_THRESHOLD_DEG, 0.0)
            .expect("a threshold");
        let l = log10_mean_time_to_cycle_slip_s(at_threshold, b, t);
        assert!(
            l > 9.0,
            "at the 15-degree design point the mean slip time must be astronomically long, \
             got 10^{l} s"
        );
        // Where the jitter reaches a quarter cycle the loop slips in seconds.
        let quarter = log10_mean_time_to_cycle_slip_s(20.0, b, t);
        assert!(
            quarter < 2.0,
            "at 20 dB-Hz (sigma ~44 deg) the loop should slip within ~10^2 s, got 10^{quarter}"
        );
    }

    #[test]
    fn a_spoofer_that_slews_too_fast_outruns_the_loop() {
        let cfg = LoopConfig {
            pll_bandwidth_hz: 10.0,
            dll_bandwidth_hz: 1.0,
            integration_s: 1e-3,
            spacing_chips: 0.5,
            carrier_allowance_deg: COSTAS_THRESHOLD_DEG,
            code_allowance_chips: 0.25,
            pullin_bandwidth_ratio: 2.0,
        };
        let max = max_code_slew_chips_per_s(cfg.dll_bandwidth_hz, cfg.code_allowance_chips);
        assert!(
            (max - 1.0).abs() < 1e-12,
            "4 * 1 Hz * 0.25 chip = 1 chip/s, got {max}"
        );
        // The operative, jitter-aware ceiling is strictly below the geometric one and is
        // exactly the boundary the pull-in cells are decided at — the headline figure and
        // the map can never contradict each other.
        let live = max_code_slew_at_cn0_chips_per_s(
            cfg.dll_bandwidth_hz,
            45.0,
            cfg.integration_s,
            cfg.spacing_chips,
            cfg.code_allowance_chips,
        );
        assert!(
            live < max && live > 0.9 * max,
            "jitter-aware ceiling {live} vs {max}"
        );
        assert!(pull_in_cell(&cfg, 45.0, live * 0.999, 0.0).code_follows);
        assert!(!pull_in_cell(&cfg, 45.0, live * 1.001, 0.0).code_follows);
        // Just inside the limit the victim follows; far outside it does not — and the
        // transition is monotone in the slew rate.
        let mut seen_fail = false;
        for k in 1..=20 {
            let slew = live * k as f64 / 5.0;
            let cell = pull_in_cell(&cfg, 45.0, slew, 0.0);
            if !cell.code_follows {
                seen_fail = true;
            } else {
                assert!(!seen_fail, "following must not resume once it has failed");
            }
            assert!((cell.code_lag_chips - slew / (4.0 * cfg.dll_bandwidth_hz)).abs() < 1e-12);
        }
        assert!(seen_fail, "a fast enough slew must outrun the loop");
        // Same on the carrier axis, and the reported ceiling is the actual boundary.
        let rate = max_doppler_rate_hz_per_s(10.0, 45.0, 1e-3, COSTAS_THRESHOLD_DEG);
        assert!(pull_in_cell(&cfg, 45.0, 0.0, rate * 0.99).carrier_follows);
        assert!(!pull_in_cell(&cfg, 45.0, 0.0, rate * 1.01).carrier_follows);
    }

    #[test]
    fn the_dynamic_stress_matches_the_second_order_loop_response() {
        // theta_e = 360 * fdot / omega_n^2 with omega_n = B_n/0.53, i.e. the steady-state
        // error of the type-2 error transfer s^2/(s^2 + 2*zeta*wn*s + wn^2) to an
        // acceleration input. Check against that final-value expression written out
        // independently of the module's constant folding.
        for b in [2.0_f64, 10.0, 25.0] {
            for fdot in [0.5_f64, 5.0, 50.0] {
                let wn = b / SECOND_ORDER_BN_OVER_WN;
                let want = 360.0 * fdot / (wn * wn);
                let got = pll_dynamic_stress_deg(fdot, b);
                assert!(
                    (got - want).abs() < 1e-12 * want.max(1.0),
                    "{got} vs {want}"
                );
            }
        }
    }

    // ---------------------------------------------------------------------------------
    // The acceptance contract: both radii, and their named difference.
    // ---------------------------------------------------------------------------------

    #[test]
    fn both_denial_radii_are_reported_and_their_difference_is_named() {
        let scn = TrackingLoopScenario::default();
        let (json, summary) = scn.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        let d = &v["denial"];
        let thr = d["denial_radius_threshold_km"]
            .as_f64()
            .expect("threshold radius");
        let lp = d["denial_radius_loop_dynamics_km"]
            .as_f64()
            .expect("loop-dynamics radius");
        let delta = d["denial_radius_delta_km"]
            .as_f64()
            .expect("the named delta");
        // Both present, neither replacing the other.
        assert!(thr > 0.0 && lp > 0.0);
        // The difference is the difference — exactly, not approximately.
        assert!(
            (delta - (lp - thr)).abs() < 1e-9,
            "delta {delta} != {lp} - {thr}"
        );
        assert!((d["denial_radius_ratio"].as_f64().unwrap() - lp / thr).abs() < 1e-12);
        // The existing power-ratio criterion is untouched: at the threshold radius, the
        // J/S really is the stated 30 dB, computed with the existing jamming function.
        let link = scn.denial_link();
        assert!(
            (link.js_db_at(thr * 1000.0) - scn.denial_js_threshold_db).abs() < 1e-6,
            "the threshold radius must be exactly where J/S = {} dB",
            scn.denial_js_threshold_db
        );
        // And the loop radius really is where the effective C/N0 hits the drop threshold.
        let drop = v["thresholds"]["drop_cn0_dbhz"].as_f64().unwrap();
        assert!((link.effective_cn0_dbhz_at(lp * 1000.0) - drop).abs() < 1e-6);
        // The difference is signed and explained, not a bare number.
        assert!(d["denial_radius_delta_definition"].is_string());
        assert!(d["criterion_note"].is_string());
        // Both radii and the delta reach the summary line.
        assert!(summary.contains("denial radius threshold"));
        assert!(summary.contains("loop dynamics"));
        assert!(summary.contains("delta"));
        // The capture criterion is reported as a power ratio AND honestly declined as a
        // loop-dynamics radius, rather than a fabricated one.
        assert!(d["capture_radius_threshold_km"].as_f64().unwrap() > 0.0);
        assert!(d["capture_radius_loop_dynamics_km"].is_null());
        assert!(d["capture_radius_loop_dynamics_status"]
            .as_str()
            .is_some_and(|s| s.starts_with("not-applicable")));
    }

    #[test]
    fn the_loop_radius_moves_with_the_loop_and_not_with_the_power_ratio() {
        // A narrower carrier loop holds lock at a lower C/N0, so the jammer must come
        // closer: the loop-dynamics radius shrinks while the power-ratio radius does not
        // move at all. That is the whole point of reporting both.
        let base = TrackingLoopScenario::default();
        let narrow = TrackingLoopScenario {
            pll_bandwidth_hz: 2.0,
            ..TrackingLoopScenario::default()
        };
        let f = |s: &TrackingLoopScenario| {
            let (j, _) = s.run_json().unwrap();
            let v: serde_json::Value = serde_json::from_str(&j).unwrap();
            (
                v["denial"]["denial_radius_threshold_km"].as_f64().unwrap(),
                v["denial"]["denial_radius_loop_dynamics_km"]
                    .as_f64()
                    .unwrap(),
            )
        };
        let (t0, l0) = f(&base);
        let (t1, l1) = f(&narrow);
        assert!(
            (t0 - t1).abs() < 1e-9,
            "the power-ratio radius must not move"
        );
        assert!(
            l1 < l0,
            "a narrower loop must shrink the loop-dynamics radius: {l1} vs {l0}"
        );
    }

    #[test]
    fn every_reported_figure_carries_a_unit_and_a_provenance_class() {
        let scn = TrackingLoopScenario::default();
        let (json, _) = scn.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        let units = v["units"].as_object().expect("a units block");
        assert!(!units.is_empty());
        for (field, meta) in units {
            assert!(meta["unit"].is_string(), "{field} has no unit");
            assert!(
                meta["provenance"].is_string(),
                "{field} has no provenance class"
            );
            let p = meta["provenance"].as_str().unwrap();
            assert!(
                matches!(p, "input" | "computed" | "modelled-input"),
                "{field} has an unknown provenance class {p:?}"
            );
        }
        let described: std::collections::HashSet<&str> = units.keys().map(|k| k.as_str()).collect();
        // Walk every numeric leaf of the document and require a units entry for it, with
        // array members addressed as `path[].field`.
        fn walk(
            v: &serde_json::Value,
            path: &str,
            described: &std::collections::HashSet<&str>,
            missing: &mut Vec<String>,
        ) {
            match v {
                serde_json::Value::Number(_) => {
                    if !described.contains(path) {
                        missing.push(path.to_string());
                    }
                }
                serde_json::Value::Object(o) => {
                    for (k, e) in o {
                        if path.is_empty() && k == "units" {
                            continue;
                        }
                        let p = if path.is_empty() {
                            k.clone()
                        } else {
                            format!("{path}.{k}")
                        };
                        walk(e, &p, described, missing);
                    }
                }
                serde_json::Value::Array(a) => {
                    if let Some(first) = a.first() {
                        walk(first, &format!("{path}[]"), described, missing);
                    }
                }
                _ => {}
            }
        }
        let mut missing = Vec::new();
        walk(&v, "", &described, &mut missing);
        assert!(
            missing.is_empty(),
            "numeric fields missing from the units block: {missing:?}"
        );
    }

    #[test]
    fn the_units_block_describes_only_fields_that_exist() {
        let scn = TrackingLoopScenario::default();
        let (json, _) = scn.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        for field in v["units"].as_object().expect("units").keys() {
            let mut cur = &v;
            for seg in field.split('.') {
                cur = if let Some(name) = seg.strip_suffix("[]") {
                    let arr = cur
                        .get(name)
                        .and_then(|x| x.as_array())
                        .unwrap_or_else(|| panic!("{field}: {name} is not an array"));
                    arr.first()
                        .unwrap_or_else(|| panic!("{field}: {name} is empty"))
                } else {
                    cur.get(seg)
                        .unwrap_or_else(|| panic!("units names a missing field: {field}"))
                };
            }
            assert!(!cur.is_null(), "units names a null field: {field}");
        }
    }

    #[test]
    fn the_run_is_reproducible_and_declares_what_is_modelled() {
        let scn = TrackingLoopScenario::default();
        let (a, sa) = scn.run_json().expect("run");
        let (b, sb) = scn.run_json().expect("run");
        assert_eq!(a, b, "the run must be reproducible");
        assert_eq!(sa, sb);
        let v: serde_json::Value = serde_json::from_str(&a).expect("valid JSON");
        assert_eq!(v["kind"], "tracking-loop");
        let label = v["label"].as_str().expect("a label");
        assert!(label.contains("MODELLED"));
        assert!(label.contains("VALIDATED"));
        // The exclusions are named, not implied.
        for phrase in [
            "Allan-deviation",
            "multipath",
            "front-end bandwidth",
            "half-cycle",
        ] {
            assert!(
                label.contains(phrase),
                "the label must name {phrase} as excluded"
            );
        }
        assert!(label.contains("ALONGSIDE"));
    }

    #[test]
    fn the_hysteretic_detector_declares_loss_then_recovery_with_a_gap() {
        let scn = TrackingLoopScenario::default();
        let (json, _) = scn.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        let h = &v["lock_history"];
        let loss = h["declared_loss_of_lock_s"].as_f64().expect("a loss time");
        let relock = h["declared_relock_s"].as_f64().expect("a relock time");
        let cross = h["drop_crossing_s"].as_f64().unwrap();
        let recross = h["relock_crossing_s"].as_f64().unwrap();
        assert!(cross < loss, "the declaration must follow the crossing");
        assert!(loss < recross, "the ramp must come back up after the loss");
        assert!(recross < relock, "recovery must follow its own crossing");
        // Hysteresis is visible in the profile: the C/N0 at which lock is regained is
        // strictly higher than the C/N0 at which it was dropped.
        let drop_cn0 = v["thresholds"]["drop_cn0_dbhz"].as_f64().unwrap();
        let relock_cn0 = v["thresholds"]["relock_cn0_dbhz"].as_f64().unwrap();
        assert!(relock_cn0 > drop_cn0);
        assert!(h["unlocked_duration_s"].as_f64().unwrap() > 0.0);
    }

    #[test]
    fn bad_inputs_are_refused_with_a_message_not_a_panic() {
        let cases: &[(&str, TrackingLoopScenario)] = &[
            (
                "pullin_bandwidth_ratio",
                TrackingLoopScenario {
                    pullin_bandwidth_ratio: 0.5,
                    ..Default::default()
                },
            ),
            (
                "correlator_spacing_chips",
                TrackingLoopScenario {
                    correlator_spacing_chips: 2.5,
                    ..Default::default()
                },
            ),
            (
                "pll_bandwidth_hz",
                TrackingLoopScenario {
                    pll_bandwidth_hz: 0.0,
                    ..Default::default()
                },
            ),
            (
                "cn0_low_dbhz",
                TrackingLoopScenario {
                    cn0_low_dbhz: 60.0,
                    ..Default::default()
                },
            ),
            (
                "jitter_table_cn0_dbhz",
                TrackingLoopScenario {
                    jitter_table_cn0_dbhz: Vec::new(),
                    ..Default::default()
                },
            ),
        ];
        for (name, scn) in cases {
            let e = scn.run_json().expect_err("must be refused");
            assert!(e.contains(name), "the error must name {name}: {e}");
        }
        // A profile that would take an unbounded number of detector steps is refused
        // rather than run.
        let huge = TrackingLoopScenario {
            ramp_duration_s: 1.0e9,
            ..Default::default()
        };
        let e = huge.run_json().expect_err("must be refused");
        assert!(e.contains("detector steps"), "{e}");
    }

    #[test]
    fn the_bundled_scenario_file_is_the_default_configuration() {
        let src = include_str!("../scenarios/tracking-loop.toml");
        let scn: TrackingLoopScenario = toml::from_str(src).expect("the bundled TOML parses");
        let (a, _) = scn.run_json().expect("run");
        let (b, _) = TrackingLoopScenario::default()
            .run_json()
            .expect("run the default");
        assert_eq!(a, b, "the bundled file must reproduce the default run");
    }
}
