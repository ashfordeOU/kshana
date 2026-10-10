// SPDX-License-Identifier: AGPL-3.0-only
//! **Slot timing: how long a free-running clock stays inside a time-indexed slot, and
//! how often it needs a fix.**
//!
//! A time-indexed routing or tasking plan gives each spacecraft a slot, and the slot
//! tolerates a bounded clock error: its **guard**, the largest absolute time error, on
//! either side, at which traffic still lands inside the slot. Between synchronisations
//! the onboard clock free-runs, and its error grows. This module answers three questions
//! about that growth for a named oscillator:
//!
//! 1. **When does the guard break?** Seconds from the last synchronisation until the
//!    predicted error reaches the guard ([`SlotBudget::breach_after_sync_s`]), with every
//!    contributing term itemised and the dominant one named, so an engineer can see what
//!    limits it.
//! 2. **How much of that is left now?** The same figure minus the time already elapsed
//!    since the last fix ([`SlotBudget::remaining_s`]).
//! 3. **How often must the spacecraft take a fix?** The largest interval between fixes
//!    that keeps the error inside the guard, net of the latency before a fix takes effect
//!    ([`SlotBudget::resync_interval_s`]).
//!
//! ## The error model
//!
//! The predicted time error after coasting `t` seconds from a fix is
//!
//! ```text
//!   E(t) = k · √( σ₀² + (σ_f·t)² + σ_x²(t) )  +  (|y₀| + |c_T·ΔT|) · t  +  ½ · |D| · t²
//!   σ_x²(t) = σ_PM² + q_wf·t + h_F·t² + q_rw·t³/3 + q_rr·t⁵/20
//! ```
//!
//! * `σ₀` is the one-sigma time error of the fix itself, `σ_f` the one-sigma error of
//!   the frequency known at the fix, and `k` the coverage factor. A frequency estimated
//!   over a window `W` carries `σ_f ≈ σ_y(W)`; at a coast of `t = W` the two terms then
//!   give the Allan identity `2·W²·σ_y²(W)` for that estimator. For a crystal oscillator,
//!   whose frequency wanders, leaving `σ_f` at 0 is optimistic.
//! * `σ_PM²` is the white phase-noise variance: jitter of the time error about the
//!   underlying phase, which a measured record shows as an Allan deviation falling as
//!   `1/τ` at short averaging times. It adds a constant floor, not a growth.
//! * `σ_x²(t)` is the stochastic phase-error variance. The white-FM (`q_wf`),
//!   random-walk-FM (`q_rw`) and random-run-FM (`q_rr`) terms are the van Loan terms of
//!   [`crate::holdover::coast_phase_variance`]. Each equals `t² · σ_y²(t)` for its own
//!   noise type, with `σ_y²(τ) = q_wf/τ + h_F + q_rw·τ/3 + q_rr·τ³/20` (Zucca and
//!   Tavella, IEEE UFFC 2005). The flicker-FM term `h_F·t²` extends the same relation to
//!   the flat Allan-variance floor `h_F`, which the three-state model cannot carry. For
//!   flicker FM the relation is the conventional estimate of the time-prediction error
//!   (Riley, NIST SP 1065), not an exact result: there is no closed form without a
//!   low-frequency cut-off.
//! * `y₀` is the residual fractional-frequency offset left after synchronisation,
//!   `c_T·ΔT` the frequency offset a temperature excursion `ΔT` produces through the
//!   temperature coefficient `c_T`, and `D` the linear ageing rate. The offsets add in
//!   magnitude because their signs are unknown, so the deterministic part is a worst case.
//!
//! Every term is non-negative and non-decreasing in `t`, so `E(t) = guard` has a single
//! root, found by bracketing and bisection.
//!
//! ## Where the noise levels come from
//!
//! [`ClockNoise`] is built one of four ways, and the report says which:
//!
//! * **a class default** ([`ClockClass`]): one cited `σ_y(1 s)` and a red-noise floor
//!   synthesised two and four decades below it. This is an order-of-magnitude bracket,
//!   and for a stable clock the answer is governed by that assumed floor (see
//!   [`crate::holdover`]);
//! * **a datasheet** ([`ClockNoise::from_datasheet`]): white, flicker and random-walk FM
//!   fitted to the datasheet's Allan-deviation maxima and scaled to lie at or above every
//!   one ([`crate::telecom_timing::fit_noise`]), plus the datasheet's ageing and
//!   temperature figures. This is the answer for the customer's part;
//! * **a measured phase record** ([`ClockNoise::from_phase_record`]): the overlapping
//!   Allan deviation of the record, fitted in the IEEE Std 1139 frequency-modulation basis
//!   (the same basis as [`crate::powerlaw::fit_fm_family`], weighted here by each point's
//!   equivalent degrees of freedom: [`fit_weighted`]), so the red-noise floor is
//!   measured rather than assumed;
//! * **explicit levels**, for a caller that already has them.
//!
//! A datasheet or record only supports averaging times up to its longest point. A breach
//! beyond that is an extrapolation, and the report flags it.
//!
//! Scope (honest): a MODELLED timing budget, not a clock-hardware design tool and not a
//! synchronisation protocol. It assumes a stationary power-law clock between fixes and
//! a fix that resets the time error to `σ₀`; it has no relativistic, radiation or
//! frequency-jump model, and the temperature term is a step, not a thermal model.
//!
//! References: IEEE Std 1139-2008; W. J. Riley, *Handbook of Frequency Stability
//! Analysis*, NIST SP 1065 (2008); C. Zucca and P. Tavella, *The clock model and its
//! relationship with the Allan and related variances*, IEEE Trans. UFFC 52(2), 2005.

use crate::palette::chart::{BG, BLUE, CORAL, FONT_MONO, TEXT};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

use crate::allan::overlapping_adev_curve;
use crate::clock_state::ClockClass;
use crate::field_schema::FieldUnit;
use crate::holdover::coast_phase_variance;
use crate::telecom_timing::{fit_noise, preset_by_id};

/// Seconds per day.
const DAY_S: f64 = 86_400.0;

/// Where a [`ClockNoise`] came from.
#[derive(Clone, Debug, PartialEq)]
pub enum NoiseSource {
    /// A [`ClockClass`] default: one cited `σ_y(1 s)` and a synthesised red-noise floor.
    Class(ClockClass),
    /// Fitted to a datasheet's Allan-deviation maxima.
    Datasheet {
        /// The document the points came from, as the caller named it.
        document: String,
    },
    /// Fitted to the Allan deviation of a measured phase record.
    Record {
        /// Number of phase samples in the record.
        n_samples: usize,
        /// Interval between samples (s).
        tau0_s: f64,
    },
    /// Levels given directly by the caller.
    Explicit,
}

impl NoiseSource {
    /// Short identifier for reports: `class`, `datasheet`, `record` or `explicit`.
    pub fn kind(&self) -> &'static str {
        match self {
            NoiseSource::Class(_) => "class",
            NoiseSource::Datasheet { .. } => "datasheet",
            NoiseSource::Record { .. } => "record",
            NoiseSource::Explicit => "explicit",
        }
    }
}

/// Power-law frequency noise of one oscillator, plus its deterministic figures.
///
/// The Allan variance the levels describe is
/// `σ_y²(τ) = 3·σ_PM²/τ² + q_wf/τ + flicker + q_rw·τ/3 + q_rr·τ³/20`.
#[derive(Clone, Debug, PartialEq)]
pub struct ClockNoise {
    /// White phase-noise variance `σ_PM²` (s²): the jitter of the clock's time error
    /// about its underlying phase, a constant floor under every coast.
    pub white_pm_var: f64,
    /// White-FM phase PSD `q_wf` (s): the Allan variance at τ = 1 s from white FM.
    pub q_wf: f64,
    /// Flicker-FM Allan-variance floor `h_F` (dimensionless, a variance).
    pub flicker: f64,
    /// Random-walk-FM PSD `q_rw` (1/s).
    pub q_rw: f64,
    /// Random-run-FM PSD `q_rr` (1/s³).
    pub q_rr: f64,
    /// Linear fractional-frequency ageing per day (1/d).
    pub aging_per_day: f64,
    /// Fractional frequency change per kelvin (1/K).
    pub tempco_per_k: f64,
    /// The longest averaging time the levels are supported by (s); infinite for a class
    /// default or explicit levels, which carry no such limit of their own.
    pub support_tau_s: f64,
    /// Where the levels came from.
    pub source: NoiseSource,
}

impl ClockNoise {
    /// The class default: `(q_wf, q_rw, q_drift)` from [`ClockClass::psds`], no flicker
    /// term, no ageing or temperature figure.
    pub fn from_class(class: ClockClass) -> ClockNoise {
        let (q_wf, q_rw, q_rr) = class.psds();
        ClockNoise {
            white_pm_var: 0.0,
            q_wf,
            flicker: 0.0,
            q_rw,
            q_rr,
            aging_per_day: 0.0,
            tempco_per_k: 0.0,
            support_tau_s: f64::INFINITY,
            source: NoiseSource::Class(class),
        }
    }

    /// Fit a datasheet: Allan-deviation points `(τ in s, σ_y)` read as maxima, the
    /// ageing per day and the temperature coefficient per kelvin. The fit lies at or
    /// above every point ([`fit_noise`]).
    pub fn from_datasheet(
        document: &str,
        adev_points: &[(f64, f64)],
        aging_per_day: f64,
        tempco_per_k: f64,
    ) -> Result<ClockNoise, String> {
        if adev_points.len() < 2 {
            return Err("a datasheet needs at least two Allan-deviation points".into());
        }
        for &(t, s) in adev_points {
            if !(t.is_finite() && t > 0.0 && s.is_finite() && s > 0.0) {
                return Err(format!(
                    "datasheet point ({t}, {s}) must have a positive averaging time and \
                     a positive Allan deviation"
                ));
            }
        }
        check_nonneg("aging_per_day", aging_per_day)?;
        check_nonneg("tempco_per_k", tempco_per_k)?;
        let fit = fit_noise(adev_points);
        let support = adev_points.iter().map(|p| p.0).fold(0.0_f64, f64::max);
        Ok(ClockNoise {
            white_pm_var: 0.0,
            q_wf: fit.white,
            flicker: fit.flicker,
            // NoiseFit carries σ_y² = rw·τ; the q_rw convention is σ_y² = q_rw·τ/3.
            q_rw: 3.0 * fit.random_walk,
            q_rr: 0.0,
            aging_per_day,
            tempco_per_k,
            support_tau_s: support,
            source: NoiseSource::Datasheet {
                document: document.to_string(),
            },
        })
    }

    /// Fit a measured phase record `phase_s` (time error in seconds, uniformly sampled
    /// every `tau0_s`): the overlapping Allan deviation at octave averaging times,
    /// fitted in the IEEE Std 1139 frequency-modulation basis
    /// ([`fit_weighted`]: random-walk, flicker and white FM). The red-noise floor is
    /// then measured, not assumed. Ageing and temperature are not estimated from the
    /// record and start at zero.
    pub fn from_phase_record(phase_s: &[f64], tau0_s: f64) -> Result<ClockNoise, String> {
        if !(tau0_s.is_finite() && tau0_s > 0.0) {
            return Err("tau0_s must be a positive number of seconds".into());
        }
        if phase_s.len() < 32 {
            return Err(format!(
                "a phase record needs at least 32 samples to fit a noise model; got {}",
                phase_s.len()
            ));
        }
        if phase_s.iter().any(|x| !x.is_finite()) {
            return Err("the phase record contains a non-finite sample".into());
        }
        let curve = overlapping_adev_curve(phase_s, tau0_s);
        let pts: Vec<(f64, f64, f64)> = curve
            .iter()
            .filter(|p| p.adev.is_finite() && p.adev > 0.0 && p.edf.is_finite() && p.edf > 0.0)
            .map(|p| (p.tau_s, p.adev, p.edf))
            .collect();
        if pts.len() < 3 {
            return Err("the phase record yields fewer than three Allan-deviation points".into());
        }
        let fit = fit_weighted(&pts);
        let support = pts.iter().map(|p| p.0).fold(0.0_f64, f64::max);
        let mut n = ClockNoise::from_ieee1139(fit.h_m2, fit.h_m1, fit.h_0);
        n.white_pm_var = fit.white_pm_var;
        Ok(n.with_record_source(phase_s.len(), tau0_s, support))
    }

    /// Levels from the IEEE Std 1139 coefficients `h_{-2}`, `h_{-1}`, `h_0` (the
    /// one-sided fractional-frequency PSD `S_y(f) = Σ h_α f^α`): `q_wf = h_0/2`,
    /// flicker floor `2 ln 2 · h_{-1}`, `q_rw = 2π² · h_{-2}` (Riley, NIST SP 1065,
    /// Table 3).
    pub fn from_ieee1139(h_m2: f64, h_m1: f64, h_0: f64) -> ClockNoise {
        ClockNoise {
            white_pm_var: 0.0,
            q_wf: 0.5 * h_0,
            flicker: 2.0 * std::f64::consts::LN_2 * h_m1,
            q_rw: 2.0 * std::f64::consts::PI * std::f64::consts::PI * h_m2,
            q_rr: 0.0,
            aging_per_day: 0.0,
            tempco_per_k: 0.0,
            support_tau_s: f64::INFINITY,
            source: NoiseSource::Explicit,
        }
    }

    fn with_record_source(mut self, n: usize, tau0_s: f64, support: f64) -> ClockNoise {
        self.source = NoiseSource::Record {
            n_samples: n,
            tau0_s,
        };
        self.support_tau_s = support;
        self
    }

    /// The model Allan variance `σ_y²(τ)`.
    pub fn allan_variance(&self, tau_s: f64) -> f64 {
        3.0 * self.white_pm_var / (tau_s * tau_s)
            + self.q_wf / tau_s
            + self.flicker
            + self.q_rw * tau_s / 3.0
            + self.q_rr * tau_s.powi(3) / 20.0
    }

    /// The model Allan deviation `σ_y(τ)`.
    pub fn allan_deviation(&self, tau_s: f64) -> f64 {
        self.allan_variance(tau_s).max(0.0).sqrt()
    }

    /// Stochastic phase-error variance `σ_x²(t)` (s²) after coasting `t` seconds from a
    /// perfectly known state (see the module documentation), including the constant
    /// white phase-noise floor `σ_PM²` at the end of the coast.
    pub fn coast_variance(&self, t: f64) -> f64 {
        let t = t.max(0.0);
        self.white_pm_var
            + coast_phase_variance(self.q_wf, self.q_rw, self.q_rr, t)
            + self.flicker * t * t
    }

    fn check(&self) -> Result<(), String> {
        for (name, v) in [
            ("white_pm_var", self.white_pm_var),
            ("q_wf", self.q_wf),
            ("flicker", self.flicker),
            ("q_rw", self.q_rw),
            ("q_rr", self.q_rr),
            ("aging_per_day", self.aging_per_day),
            ("tempco_per_k", self.tempco_per_k),
        ] {
            check_nonneg(name, v)?;
        }
        Ok(())
    }
}

/// The result of [`fit_weighted`].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct WeightedFit {
    /// White phase-noise variance `σ_PM²` (s²).
    pub white_pm_var: f64,
    /// IEEE Std 1139 `h_0` (white FM).
    pub h_0: f64,
    /// IEEE Std 1139 `h_{-1}` (flicker FM).
    pub h_m1: f64,
    /// IEEE Std 1139 `h_{-2}` (random-walk FM).
    pub h_m2: f64,
}

/// Fit measured Allan-deviation points `(τ, σ_y, edf)` by non-negative weighted least
/// squares in the basis
/// `σ_y²(τ) = 3·σ_PM²/τ² + h_0/(2τ) + 2 ln 2·h_{-1} + (2π²/3)·h_{-2}·τ`:
/// white phase noise (the discrete-sample form, `3σ_x²/τ²`, of the IEEE Std 1139 white-PM
/// term) and the three frequency-modulation terms.
///
/// An Allan-variance estimate with `edf` equivalent degrees of freedom has variance
/// about `2σ⁴/edf` (a chi-square with `edf` degrees of freedom), so each residual is
/// `√(edf/2)·(model/σ² − 1)`: every point counts by how well it is measured. An
/// unweighted fit lets the short averaging times, whose variances are largest, decide
/// the long-tau terms by default, and a spurious floor then dominates any coast longer
/// than a few minutes. Non-negativity is enforced by trying every subset of terms.
pub fn fit_weighted(points: &[(f64, f64, f64)]) -> WeightedFit {
    use std::f64::consts::{LN_2, PI};
    let basis = |t: f64| {
        [
            3.0 / (t * t),
            0.5 / t,
            2.0 * LN_2,
            (2.0 * PI * PI / 3.0) * t,
        ]
    };
    let rows: Vec<([f64; 4], f64)> = points
        .iter()
        .map(|&(t, s, edf)| {
            let y = (0.5 * edf).sqrt();
            let w = y / (s * s);
            let b = basis(t);
            ([b[0] * w, b[1] * w, b[2] * w, b[3] * w], y)
        })
        .collect();
    let mut best: Option<([f64; 4], f64)> = None;
    for mask in 1u8..16 {
        let active: Vec<usize> = (0..4).filter(|i| mask & (1 << i) != 0).collect();
        let k = active.len();
        let mut ata = vec![vec![0.0; k]; k];
        let mut atb = vec![0.0; k];
        for (r, y) in &rows {
            for (a, &i) in active.iter().enumerate() {
                atb[a] += r[i] * y;
                for (b, &j) in active.iter().enumerate() {
                    ata[a][b] += r[i] * r[j];
                }
            }
        }
        let Some(sol) = solve_dense(ata, atb) else {
            continue;
        };
        if sol.iter().any(|x| !x.is_finite() || *x < 0.0) {
            continue;
        }
        let mut coef = [0.0; 4];
        for (a, &i) in active.iter().enumerate() {
            coef[i] = sol[a];
        }
        let res: f64 = rows
            .iter()
            .map(|(r, y)| {
                let m: f64 = (0..4).map(|i| r[i] * coef[i]).sum();
                (m - y) * (m - y)
            })
            .sum();
        if best.as_ref().is_none_or(|(_, b)| res < *b) {
            best = Some((coef, res));
        }
    }
    let c = best.map(|(c, _)| c).unwrap_or([0.0; 4]);
    WeightedFit {
        white_pm_var: c[0],
        h_0: c[1],
        h_m1: c[2],
        h_m2: c[3],
    }
}

/// Solve a small dense linear system by Gaussian elimination with partial pivoting.
fn solve_dense(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let n = b.len();
    for col in 0..n {
        let piv = (col..n).max_by(|&i, &j| a[i][col].abs().total_cmp(&a[j][col].abs()))?;
        if a[piv][col].abs() < 1e-300 {
            return None;
        }
        a.swap(col, piv);
        b.swap(col, piv);
        for row in col + 1..n {
            let f = a[row][col] / a[col][col];
            let pivot_row = a[col].clone();
            for (dst, src) in a[row].iter_mut().zip(pivot_row.iter()).skip(col) {
                *dst -= f * src;
            }
            b[row] -= f * b[col];
        }
    }
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let s: f64 = (i + 1..n).map(|j| a[i][j] * x[j]).sum();
        x[i] = (b[i] - s) / a[i][i];
    }
    Some(x)
}

fn check_nonneg(name: &str, v: f64) -> Result<(), String> {
    if v.is_finite() && v >= 0.0 {
        Ok(())
    } else {
        Err(format!("{name} must be finite and non-negative; got {v}"))
    }
}

/// The slot and the conditions of one coast.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SlotConditions {
    /// The slot guard (s): the largest absolute time error the slot tolerates.
    pub guard_s: f64,
    /// Coverage factor `k` on the stochastic error (3 for about 99.7 % of a Gaussian).
    pub k_sigma: f64,
    /// One-sigma time error of the fix the coast starts from (s).
    pub fix_sigma_s: f64,
    /// One-sigma fractional-frequency error of the fix (dimensionless): how well the
    /// clock's frequency is known when the coast starts. A frequency estimated over a
    /// window `W` carries about `σ_y(W)` ([`ClockNoise::allan_deviation`]); 0 treats the
    /// frequency as exactly known.
    pub fix_frequency_sigma: f64,
    /// Time already elapsed since that fix (s).
    pub elapsed_since_sync_s: f64,
    /// Time from taking a fix to it taking effect (s); shortens the usable interval.
    pub fix_latency_s: f64,
    /// Residual fractional-frequency offset left after synchronisation (dimensionless).
    pub residual_frequency_offset: f64,
    /// Temperature excursion from the synchronisation temperature (K).
    pub temperature_excursion_k: f64,
}

/// One contribution to the predicted time error at the breach.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Term {
    /// What the contribution is.
    pub term: &'static str,
    /// Its size at the breach (ns): `k·σ` for a stochastic term on its own, the full
    /// value for a deterministic one.
    pub time_error_ns: f64,
}

/// The answer for one oscillator and one slot.
#[derive(Clone, Debug, PartialEq)]
pub struct SlotBudget {
    /// Seconds from the last fix until the predicted error reaches the guard; 0 when the
    /// fix alone already exceeds it, infinite when the error never reaches it.
    pub breach_after_sync_s: f64,
    /// `breach_after_sync_s` minus the time already elapsed, floored at 0.
    pub remaining_s: f64,
    /// Whether the guard is already breached at the elapsed time.
    pub breached_now: bool,
    /// Largest interval between fixes that keeps the error inside the guard:
    /// `breach_after_sync_s − fix_latency_s`, floored at 0.
    pub resync_interval_s: f64,
    /// Fixes per day at that interval (infinite when the interval is 0).
    pub fixes_per_day: f64,
    /// Every contribution at the breach, largest first.
    pub terms: Vec<Term>,
    /// Whether the breach lies beyond the longest averaging time the noise levels are
    /// supported by, so the answer is an extrapolation.
    pub extrapolated: bool,
}

impl SlotBudget {
    /// The largest contribution at the breach.
    pub fn dominant_term(&self) -> &'static str {
        self.terms.first().map(|t| t.term).unwrap_or("none")
    }
}

/// The predicted time error `E(t)` (s) after coasting `t` seconds from a fix.
pub fn predicted_error_s(noise: &ClockNoise, c: &SlotConditions, t: f64) -> f64 {
    let t = t.max(0.0);
    let sf = c.fix_frequency_sigma * t;
    let stoch =
        c.k_sigma * (c.fix_sigma_s * c.fix_sigma_s + sf * sf + noise.coast_variance(t)).sqrt();
    let freq =
        c.residual_frequency_offset.abs() + (noise.tempco_per_k * c.temperature_excursion_k).abs();
    let aging = 0.5 * (noise.aging_per_day / DAY_S) * t * t;
    stoch + freq * t + aging
}

/// Invert [`predicted_error_s`]: seconds from the fix until it reaches the guard.
pub fn breach_after_sync_s(noise: &ClockNoise, c: &SlotConditions) -> f64 {
    let e = |t: f64| predicted_error_s(noise, c, t);
    if e(0.0) >= c.guard_s {
        return 0.0;
    }
    let mut hi = 1.0_f64;
    let mut found = false;
    for _ in 0..200 {
        if e(hi) >= c.guard_s {
            found = true;
            break;
        }
        hi *= 2.0;
    }
    if !found {
        return f64::INFINITY;
    }
    let mut lo = 0.0_f64;
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if e(mid) < c.guard_s {
            lo = mid;
        } else {
            hi = mid;
        }
        if hi - lo <= 1e-12 * hi {
            break;
        }
    }
    0.5 * (lo + hi)
}

/// Each contribution to the predicted error at coast time `t`, largest first.
pub fn terms_at(noise: &ClockNoise, c: &SlotConditions, t: f64) -> Vec<Term> {
    let k = c.k_sigma;
    let ns = 1e9;
    let mut v = vec![
        Term {
            term: "fix uncertainty",
            time_error_ns: k * c.fix_sigma_s * ns,
        },
        Term {
            term: "fix frequency uncertainty",
            time_error_ns: k * c.fix_frequency_sigma * t * ns,
        },
        Term {
            term: "white phase noise",
            time_error_ns: k * noise.white_pm_var.sqrt() * ns,
        },
        Term {
            term: "white frequency noise",
            time_error_ns: k * (noise.q_wf * t).sqrt() * ns,
        },
        Term {
            term: "flicker frequency noise",
            time_error_ns: k * noise.flicker.sqrt() * t * ns,
        },
        Term {
            term: "random-walk frequency noise",
            time_error_ns: k * (noise.q_rw * t.powi(3) / 3.0).sqrt() * ns,
        },
        Term {
            term: "random-run frequency noise",
            time_error_ns: k * (noise.q_rr * t.powi(5) / 20.0).sqrt() * ns,
        },
        Term {
            term: "residual frequency offset",
            time_error_ns: c.residual_frequency_offset.abs() * t * ns,
        },
        Term {
            term: "temperature",
            time_error_ns: (noise.tempco_per_k * c.temperature_excursion_k).abs() * t * ns,
        },
        Term {
            term: "ageing",
            time_error_ns: 0.5 * (noise.aging_per_day / DAY_S) * t * t * ns,
        },
    ];
    v.sort_by(|a, b| b.time_error_ns.total_cmp(&a.time_error_ns));
    v
}

/// Validate the conditions.
pub fn check_conditions(c: &SlotConditions) -> Result<(), String> {
    if !(c.guard_s.is_finite() && c.guard_s > 0.0) {
        return Err("the slot guard must be a positive time".into());
    }
    if !(c.k_sigma.is_finite() && c.k_sigma > 0.0) {
        return Err("k_sigma must be positive".into());
    }
    check_nonneg("fix_sigma", c.fix_sigma_s)?;
    check_nonneg("fix_frequency_sigma", c.fix_frequency_sigma)?;
    check_nonneg("elapsed_since_sync_s", c.elapsed_since_sync_s)?;
    check_nonneg("fix_latency_s", c.fix_latency_s)?;
    if !c.residual_frequency_offset.is_finite() {
        return Err("residual_frequency_offset must be finite".into());
    }
    if !c.temperature_excursion_k.is_finite() {
        return Err("temperature_excursion_k must be finite".into());
    }
    Ok(())
}

/// The full answer for one oscillator and one slot.
pub fn slot_budget(noise: &ClockNoise, c: &SlotConditions) -> Result<SlotBudget, String> {
    noise.check()?;
    check_conditions(c)?;
    let breach = breach_after_sync_s(noise, c);
    let remaining = (breach - c.elapsed_since_sync_s).max(0.0);
    let resync = (breach - c.fix_latency_s).max(0.0);
    let fixes_per_day = if resync > 0.0 {
        DAY_S / resync
    } else {
        f64::INFINITY
    };
    let t_terms = if breach.is_finite() { breach } else { 0.0 };
    Ok(SlotBudget {
        breach_after_sync_s: breach,
        remaining_s: remaining,
        breached_now: c.elapsed_since_sync_s >= breach,
        resync_interval_s: resync,
        fixes_per_day,
        terms: terms_at(noise, c, t_terms),
        extrapolated: breach.is_finite() && breach > noise.support_tau_s,
    })
}

// ---------------------------------------------------------------------------------------
// Scenario kind
// ---------------------------------------------------------------------------------------

/// A datasheet given inline.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct DatasheetInput {
    /// The document the figures are read from, with its revision.
    pub document: String,
    /// Allan-deviation points `[τ in s, σ_y]`, read as maxima.
    pub adev_points: Vec<[f64; 2]>,
    /// Linear fractional-frequency ageing per day (1/d).
    #[serde(default)]
    pub aging_per_day: f64,
    /// Fractional frequency change per kelvin (1/K).
    #[serde(default)]
    pub tempco_per_k: f64,
}

/// A measured phase record given inline.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct RecordInput {
    /// Interval between samples (s).
    pub tau0_s: f64,
    /// Time error of each sample (ns).
    pub time_error_ns: Vec<f64>,
}

/// The oscillator: give exactly one of `class`, `preset`, `datasheet` or `record`.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct OscillatorInput {
    /// A [`ClockClass`] id: `csac`, `uso`, `dsac`, `tcxo`, `ocxo` or `rafs`.
    #[serde(default)]
    pub class: Option<String>,
    /// A telecom-timing datasheet preset id: `ocxo`, `rubidium`, `caesium` or `csac`.
    #[serde(default)]
    pub preset: Option<String>,
    /// A datasheet given inline.
    #[serde(default)]
    pub datasheet: Option<DatasheetInput>,
    /// A measured phase record given inline.
    #[serde(default)]
    pub record: Option<RecordInput>,
    /// Override the ageing per day the source carries (1/d).
    #[serde(default)]
    pub aging_per_day: Option<f64>,
    /// Override the temperature coefficient the source carries (1/K).
    #[serde(default)]
    pub tempco_per_k: Option<f64>,
}

/// The slot and the conditions of the coast.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SlotInput {
    /// Slot guard (ns): the largest absolute time error the slot tolerates.
    pub guard_ns: f64,
    /// Coverage factor on the stochastic error.
    #[serde(default = "d_k")]
    pub k_sigma: f64,
    /// One-sigma time error of the fix (ns).
    #[serde(default)]
    pub fix_sigma_ns: f64,
    /// One-sigma fractional-frequency error of the fix (dimensionless).
    #[serde(default)]
    pub fix_frequency_sigma: f64,
    /// Time already elapsed since the last fix (s).
    #[serde(default)]
    pub elapsed_since_sync_s: f64,
    /// Time from taking a fix to it taking effect (s).
    #[serde(default)]
    pub fix_latency_s: f64,
    /// Residual fractional-frequency offset after synchronisation.
    #[serde(default)]
    pub residual_frequency_offset: f64,
    /// Temperature excursion from the synchronisation temperature (K).
    #[serde(default)]
    pub temperature_excursion_k: f64,
}

fn d_k() -> f64 {
    3.0
}

/// The optional spoofing assessment for a receiver in orbit ([`crate::orbital_timing`]).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SpoofingInput {
    /// Orbital altitude (km).
    pub altitude_km: f64,
    /// Lowest elevation at which a ground spoofer's signal reaches the satellite (deg).
    #[serde(default)]
    pub spoofer_min_elevation_deg: f64,
    /// One-sigma time error of the receiver's GNSS time solution per epoch (ns).
    #[serde(default = "d_rx_sigma")]
    pub receiver_time_sigma_ns: f64,
    /// Monitor epoch (s).
    #[serde(default = "d_one")]
    pub epoch_s: f64,
    /// Monitor window (s).
    #[serde(default = "d_window")]
    pub monitor_window_s: f64,
    /// Alarm multiplier (sigmas).
    #[serde(default = "d_five")]
    pub k: f64,
    /// CUSUM reference value (sigmas).
    #[serde(default = "d_kref")]
    pub cusum_kref: f64,
    /// CUSUM decision interval (sigmas).
    #[serde(default = "d_five")]
    pub cusum_h: f64,
    /// Standardised attack severity for the detection latency (sigmas per epoch).
    #[serde(default = "d_severity")]
    pub attack_severity_z: f64,
    /// Largest spoofer ramp rate assumed (ns/s).
    #[serde(default = "d_ramp")]
    pub max_ramp_rate_ns_per_s: f64,
    /// Independent cross-checks available.
    #[serde(default)]
    pub checks: Vec<crate::orbital_timing::CrossCheck>,
}

fn d_rx_sigma() -> f64 {
    10.0
}
fn d_one() -> f64 {
    1.0
}
fn d_window() -> f64 {
    600.0
}
fn d_five() -> f64 {
    5.0
}
fn d_kref() -> f64 {
    0.5
}
fn d_severity() -> f64 {
    1.5
}
fn d_ramp() -> f64 {
    10.0
}

/// The `slot-timing` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SlotTimingScenario {
    /// Scenario kind (`slot-timing`).
    #[serde(default)]
    pub kind: String,
    /// The oscillator.
    pub oscillator: OscillatorInput,
    /// The slot.
    pub slot: SlotInput,
    /// The optional spoofing assessment for a receiver in orbit.
    #[serde(default)]
    pub spoofing: Option<SpoofingInput>,
}

/// What a reader might expect here and will not find, stated in every report.
pub const NOT_MODELLED: &[&str] = &[
    "frequency jumps, radiation effects and relativistic frequency offsets",
    "a thermal model: the temperature excursion is applied as a step at the fix",
    "the synchronisation protocol itself: a fix resets the error to fix_sigma_ns",
    "which wander metric a routing slot should be accepted against; see \
     docs/SLOT-TIMING.md",
];

impl SlotTimingScenario {
    /// SHA-256 of the canonical JSON of the scenario.
    pub fn scenario_hash(&self) -> String {
        let c = serde_json::to_string(self).unwrap_or_default();
        let mut h = Sha256::new();
        h.update(c.as_bytes());
        hex::encode(h.finalize())
    }

    /// Build the noise model the scenario names.
    pub fn noise(&self) -> Result<ClockNoise, String> {
        let o = &self.oscillator;
        let given = [
            o.class.is_some(),
            o.preset.is_some(),
            o.datasheet.is_some(),
            o.record.is_some(),
        ]
        .iter()
        .filter(|b| **b)
        .count();
        if given != 1 {
            return Err("give exactly one of oscillator.class, oscillator.preset, \
                 oscillator.datasheet or oscillator.record"
                .into());
        }
        let mut n = if let Some(id) = &o.class {
            ClockNoise::from_class(ClockClass::from_id(id).ok_or_else(|| {
                format!("unknown oscillator.class '{id}' (csac|uso|dsac|tcxo|ocxo|rafs)")
            })?)
        } else if let Some(id) = &o.preset {
            let p = preset_by_id(id).ok_or_else(|| {
                format!("unknown oscillator.preset '{id}' (ocxo|rubidium|caesium|csac)")
            })?;
            ClockNoise::from_datasheet(
                p.document,
                p.adev_points,
                p.aging_per_day,
                p.temperature_coeff_per_k(),
            )?
        } else if let Some(d) = &o.datasheet {
            let pts: Vec<(f64, f64)> = d.adev_points.iter().map(|p| (p[0], p[1])).collect();
            ClockNoise::from_datasheet(&d.document, &pts, d.aging_per_day, d.tempco_per_k)?
        } else if let Some(r) = &o.record {
            let phase: Vec<f64> = r.time_error_ns.iter().map(|x| x * 1e-9).collect();
            ClockNoise::from_phase_record(&phase, r.tau0_s)?
        } else {
            unreachable!("exactly one source was checked above")
        };
        if let Some(a) = o.aging_per_day {
            check_nonneg("oscillator.aging_per_day", a)?;
            n.aging_per_day = a;
        }
        if let Some(c) = o.tempco_per_k {
            check_nonneg("oscillator.tempco_per_k", c)?;
            n.tempco_per_k = c;
        }
        Ok(n)
    }

    /// The slot conditions, in seconds.
    pub fn conditions(&self) -> SlotConditions {
        let s = &self.slot;
        SlotConditions {
            guard_s: s.guard_ns * 1e-9,
            k_sigma: s.k_sigma,
            fix_sigma_s: s.fix_sigma_ns * 1e-9,
            fix_frequency_sigma: s.fix_frequency_sigma,
            elapsed_since_sync_s: s.elapsed_since_sync_s,
            fix_latency_s: s.fix_latency_s,
            residual_frequency_offset: s.residual_frequency_offset,
            temperature_excursion_k: s.temperature_excursion_k,
        }
    }

    fn source_detail(n: &ClockNoise) -> String {
        match &n.source {
            NoiseSource::Class(c) => format!(
                "{} class default: sigma_y(1 s) from {}; red-noise floor synthesised two \
                 and four decades below it (an assumption, not a measurement)",
                c.id(),
                c.source()
            ),
            NoiseSource::Datasheet { document } => format!(
                "fitted to the Allan-deviation maxima of {document}, scaled to lie at or \
                 above every point"
            ),
            NoiseSource::Record { n_samples, tau0_s } => format!(
                "fitted to the overlapping Allan deviation of a {n_samples}-sample record \
                 at {tau0_s} s, in the IEEE Std 1139 frequency-modulation basis"
            ),
            NoiseSource::Explicit => "levels given explicitly".to_string(),
        }
    }

    /// Run: the JSON report, a one-line summary and an SVG of the error growth.
    pub fn run_all(&self) -> Result<(String, String, String), String> {
        let noise = self.noise()?;
        let c = self.conditions();
        let b = slot_budget(&noise, &c)?;
        let finite = |v: f64| if v.is_finite() { Some(v) } else { None };
        let horizon = if b.breach_after_sync_s.is_finite() && b.breach_after_sync_s > 0.0 {
            2.0 * b.breach_after_sync_s
        } else {
            DAY_S
        };
        let curve: Vec<(f64, f64)> = (0..=48)
            .map(|i| {
                let t = horizon * i as f64 / 48.0;
                (t, predicted_error_s(&noise, &c, t) * 1e9)
            })
            .collect();
        let spoofing = match &self.spoofing {
            None => serde_json::Value::Null,
            Some(s) => {
                let r = crate::orbital_timing::orbital_timing(
                    &crate::orbital_timing::OrbitalTimingInputs {
                        clock: noise.clone(),
                        altitude_m: s.altitude_km * 1000.0,
                        spoofer_min_elevation_rad: s.spoofer_min_elevation_deg.to_radians(),
                        receiver_time_sigma_s: s.receiver_time_sigma_ns * 1e-9,
                        epoch_s: s.epoch_s,
                        monitor_window_s: s.monitor_window_s,
                        k: s.k,
                        cusum_kref: s.cusum_kref,
                        cusum_h: s.cusum_h,
                        attack_severity_z: s.attack_severity_z,
                        max_ramp_rate: s.max_ramp_rate_ns_per_s * 1e-9,
                        checks: s.checks.clone(),
                    },
                )?;
                serde_json::json!({
                    "label": "MODELLED — conditional on detection, as crate::tpl; the \
                              ramp cap assumes one terrestrial spoofer at the stated \
                              maximum ramp rate and an overhead pass on a spherical, \
                              non-rotating Earth.",
                    "orbital_speed_m_s": r.orbital_speed_m_s,
                    "orbital_period_s": r.orbital_period_s,
                    "spoofer_footprint_radius_km": r.spoofer_footprint_radius_km,
                    "max_spoofer_exposure_s": r.max_spoofer_exposure_s,
                    "monitor_floor_ns": r.monitor_floor_ns,
                    "detection_latency_s": finite(r.detection_latency_s),
                    "coast_over_latency_ns": finite(r.coast_over_latency_ns),
                    "conditional_tpl_ns": finite(r.conditional_tpl_ns),
                    "ramp_limited_pull_ns": r.ramp_limited_pull_ns,
                    "checks": r.checks,
                    "not_counted": [
                        "an orbit-propagator position check: a common-mode time pull is \
                         absorbed into the clock bias, not the position",
                        "the arrival direction at a zenith-pointing antenna: real, but it \
                         needs an antenna pattern",
                    ],
                })
            }
        };
        let doc = serde_json::json!({
            "kind": "slot-timing",
            "label": "MODELLED — time until a free-running clock leaves a routing slot's \
                      guard, and the fix cadence that keeps it inside, from a stationary \
                      power-law clock model. A datasheet source is an envelope of its \
                      maxima, not a measurement of any unit; a class source rests on an \
                      assumed red-noise floor.",
            "engine_version": env!("CARGO_PKG_VERSION"),
            "scenario_hash": self.scenario_hash(),
            "oscillator": {
                "source": noise.source.kind(),
                "source_detail": Self::source_detail(&noise),
                "sigma_y_1s": noise.allan_deviation(1.0),
                "white_pm_sigma_ns": noise.white_pm_var.sqrt() * 1e9,
                "q_wf": noise.q_wf,
                "flicker_avar": noise.flicker,
                "q_rw": noise.q_rw,
                "q_rr": noise.q_rr,
                "aging_per_day": noise.aging_per_day,
                "tempco_per_k": noise.tempco_per_k,
                "support_tau_s": finite(noise.support_tau_s),
            },
            "slot": {
                "guard_ns": self.slot.guard_ns,
                "k_sigma": c.k_sigma,
                "fix_sigma_ns": self.slot.fix_sigma_ns,
                "fix_frequency_sigma": c.fix_frequency_sigma,
                "elapsed_since_sync_s": c.elapsed_since_sync_s,
                "fix_latency_s": c.fix_latency_s,
                "residual_frequency_offset": c.residual_frequency_offset,
                "temperature_excursion_k": c.temperature_excursion_k,
            },
            "result": {
                "breach_after_sync_s": finite(b.breach_after_sync_s),
                "never_breaches": b.breach_after_sync_s.is_infinite(),
                "remaining_s": finite(b.remaining_s),
                "breached_now": b.breached_now,
                "resync_interval_s": finite(b.resync_interval_s),
                "fixes_per_day": finite(b.fixes_per_day),
                "dominant_term": b.dominant_term(),
                "extrapolated": b.extrapolated,
            },
            "terms_at_breach": b.terms,
            "spoofing": spoofing,
            "error_growth": curve
                .iter()
                .map(|&(t, e)| serde_json::json!({"t_s": t, "time_error_ns": e}))
                .collect::<Vec<_>>(),
            "not_modelled": NOT_MODELLED,
            "units": crate::field_schema::units_block(UNITS),
        });
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        let summary = summary_line(&noise, &c, &b);
        let svg = growth_svg(&curve, self.slot.guard_ns);
        Ok((json, summary, svg))
    }
}

fn fmt_s(s: f64) -> String {
    if !s.is_finite() {
        "never".to_string()
    } else if s >= DAY_S {
        format!("{:.2} d", s / DAY_S)
    } else if s >= 3600.0 {
        format!("{:.2} h", s / 3600.0)
    } else {
        format!("{s:.1} s")
    }
}

fn summary_line(n: &ClockNoise, c: &SlotConditions, b: &SlotBudget) -> String {
    format!(
        "slot-timing ({} source): guard {:.1} ns at k={} breaks {} after a fix ({} left); \
         fix at least every {} ({:.2} per day); dominant term: {}{}",
        n.source.kind(),
        c.guard_s * 1e9,
        c.k_sigma,
        fmt_s(b.breach_after_sync_s),
        fmt_s(b.remaining_s),
        fmt_s(b.resync_interval_s),
        b.fixes_per_day,
        b.dominant_term(),
        if b.extrapolated {
            "; EXTRAPOLATED beyond the longest averaging time the source supports"
        } else {
            ""
        }
    )
}

fn growth_svg(curve: &[(f64, f64)], guard_ns: f64) -> String {
    let (w, h, pad) = (640.0, 360.0, 48.0);
    let tmax = curve.last().map(|p| p.0).unwrap_or(1.0).max(1e-9);
    let emax = curve.iter().map(|p| p.1).fold(guard_ns, f64::max).max(1e-9) * 1.1;
    let x = |t: f64| pad + (w - 2.0 * pad) * t / tmax;
    let y = |e: f64| h - pad - (h - 2.0 * pad) * (e / emax).min(1.0);
    let pts: Vec<String> = curve
        .iter()
        .map(|&(t, e)| format!("{:.1},{:.1}", x(t), y(e)))
        .collect();
    format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 {w} {h}\" role=\"img\" \
         aria-label=\"Predicted time error against time since the last fix, with the slot \
         guard\"><rect width=\"{w}\" height=\"{h}\" fill=\"{BG}\"/>\
         <line x1=\"{pad}\" y1=\"{gy:.1}\" x2=\"{gx2}\" y2=\"{gy:.1}\" stroke=\"{CORAL}\" \
         stroke-dasharray=\"6 4\"/>\
         <polyline fill=\"none\" stroke=\"{BLUE}\" stroke-width=\"2\" points=\"{pts}\"/>\
         <text x=\"{pad}\" y=\"{ty}\" font-size=\"12\" font-family=\"{FONT_MONO}\" \
         fill=\"{TEXT}\">time since fix, 0 to {tlabel}</text>\
         <text x=\"{pad}\" y=\"20\" font-size=\"12\" font-family=\"{FONT_MONO}\" \
         fill=\"{TEXT}\">predicted time error (ns); dashed: guard {guard_ns:.1} ns</text>\
         </svg>",
        gy = y(guard_ns),
        gx2 = w - pad,
        pts = pts.join(" "),
        ty = h - 14.0,
        tlabel = fmt_s(tmax),
    )
}

/// Unit and provenance class for every numeric field the report emits.
pub const UNITS: &[FieldUnit] = {
    use crate::field_schema::ProvenanceClass::*;
    &[
        FieldUnit {
            path: "oscillator.sigma_y_1s",
            unit: "1",
            provenance: Computed,
            definition: "model Allan deviation at an averaging time of 1 s",
        },
        FieldUnit {
            path: "oscillator.white_pm_sigma_ns",
            unit: "ns",
            provenance: Modelled,
            definition: "one-sigma white phase noise of the clock's time error: a constant \
                         floor under every coast",
        },
        FieldUnit {
            path: "oscillator.q_wf",
            unit: "s",
            provenance: Modelled,
            definition: "white frequency-modulation phase noise density: the Allan \
                         variance at 1 s from white frequency noise",
        },
        FieldUnit {
            path: "oscillator.flicker_avar",
            unit: "1",
            provenance: Modelled,
            definition: "flicker frequency-modulation floor of the Allan variance",
        },
        FieldUnit {
            path: "oscillator.q_rw",
            unit: "1/s",
            provenance: Modelled,
            definition: "random-walk frequency-modulation noise density",
        },
        FieldUnit {
            path: "oscillator.q_rr",
            unit: "1/s^3",
            provenance: Modelled,
            definition: "random-run frequency-modulation noise density",
        },
        FieldUnit {
            path: "oscillator.aging_per_day",
            unit: "1/d",
            provenance: Spec,
            definition: "linear fractional-frequency ageing per day, from the source or \
                         the scenario override",
        },
        FieldUnit {
            path: "oscillator.tempco_per_k",
            unit: "1/K",
            provenance: Spec,
            definition: "fractional frequency change per kelvin, from the source or the \
                         scenario override",
        },
        FieldUnit {
            path: "oscillator.support_tau_s",
            unit: "s",
            provenance: Computed,
            definition: "longest averaging time the datasheet or record supports; null \
                         for a class default",
        },
        FieldUnit {
            path: "slot.guard_ns",
            unit: "ns",
            provenance: Input,
            definition: "largest absolute time error the slot tolerates",
        },
        FieldUnit {
            path: "slot.k_sigma",
            unit: "1",
            provenance: Input,
            definition: "coverage factor on the stochastic error",
        },
        FieldUnit {
            path: "slot.fix_sigma_ns",
            unit: "ns",
            provenance: Input,
            definition: "one-sigma time error of the fix the coast starts from",
        },
        FieldUnit {
            path: "slot.fix_frequency_sigma",
            unit: "1",
            provenance: Input,
            definition: "one-sigma fractional-frequency error of the fix",
        },
        FieldUnit {
            path: "slot.elapsed_since_sync_s",
            unit: "s",
            provenance: Input,
            definition: "time already elapsed since the last fix",
        },
        FieldUnit {
            path: "slot.fix_latency_s",
            unit: "s",
            provenance: Input,
            definition: "time from taking a fix to it taking effect",
        },
        FieldUnit {
            path: "slot.residual_frequency_offset",
            unit: "1",
            provenance: Input,
            definition: "residual fractional-frequency offset left after synchronisation",
        },
        FieldUnit {
            path: "slot.temperature_excursion_k",
            unit: "K",
            provenance: Input,
            definition: "temperature excursion from the synchronisation temperature",
        },
        FieldUnit {
            path: "result.breach_after_sync_s",
            unit: "s",
            provenance: Modelled,
            definition: "time from the last fix until the predicted error reaches the \
                         guard; null when it never does",
        },
        FieldUnit {
            path: "result.remaining_s",
            unit: "s",
            provenance: Modelled,
            definition: "time left before the guard breaks, net of the elapsed time",
        },
        FieldUnit {
            path: "result.resync_interval_s",
            unit: "s",
            provenance: Modelled,
            definition: "largest interval between fixes that keeps the error inside the \
                         guard, net of the fix latency",
        },
        FieldUnit {
            path: "result.fixes_per_day",
            unit: "1/d",
            provenance: Modelled,
            definition: "fixes per day at the resynchronisation interval",
        },
        FieldUnit {
            path: "terms_at_breach[].time_error_ns",
            unit: "ns",
            provenance: Modelled,
            definition: "one contribution to the predicted error at the breach: k times \
                         its own sigma for a stochastic term, its full value for a \
                         deterministic one",
        },
        FieldUnit {
            path: "spoofing.orbital_speed_m_s",
            unit: "m/s",
            provenance: ClosedForm,
            definition: "circular orbital speed at the stated altitude",
        },
        FieldUnit {
            path: "spoofing.orbital_period_s",
            unit: "s",
            provenance: ClosedForm,
            definition: "circular orbital period at the stated altitude",
        },
        FieldUnit {
            path: "spoofing.spoofer_footprint_radius_km",
            unit: "km",
            provenance: ClosedForm,
            definition: "surface radius of the region a ground spoofer must be in to \
                         reach the satellite above its minimum elevation",
        },
        FieldUnit {
            path: "spoofing.max_spoofer_exposure_s",
            unit: "s",
            provenance: ClosedForm,
            definition: "longest time one ground spoofer can reach the satellite in a pass",
        },
        FieldUnit {
            path: "spoofing.monitor_floor_ns",
            unit: "ns",
            provenance: Modelled,
            definition: "k times the one sigma of the clock-aided monitor over its window",
        },
        FieldUnit {
            path: "spoofing.detection_latency_s",
            unit: "s",
            provenance: ClosedForm,
            definition: "CUSUM time to alarm at the stated attack severity; null when it \
                         never alarms",
        },
        FieldUnit {
            path: "spoofing.coast_over_latency_ns",
            unit: "ns",
            provenance: Modelled,
            definition: "clock coast one sigma over the detection latency",
        },
        FieldUnit {
            path: "spoofing.conditional_tpl_ns",
            unit: "ns",
            provenance: Modelled,
            definition: "conditional timing protection level: monitor floor plus coast; \
                         holds only given detection",
        },
        FieldUnit {
            path: "spoofing.ramp_limited_pull_ns",
            unit: "ns",
            provenance: Modelled,
            definition: "pull a spoofer at the assumed maximum ramp rate accumulates before \
                         the satellite leaves its footprint or an independent check runs",
        },
        FieldUnit {
            path: "spoofing.checks[].revisit_s",
            unit: "s",
            provenance: Input,
            definition: "longest gap between two uses of the cross-check",
        },
        FieldUnit {
            path: "spoofing.checks[].at_check_ns",
            unit: "ns",
            provenance: Computed,
            definition: "undetected error the cross-check allows when used: k times its \
                         one sigma",
        },
        FieldUnit {
            path: "error_growth[].t_s",
            unit: "s",
            provenance: Computed,
            definition: "time since the last fix",
        },
        FieldUnit {
            path: "error_growth[].time_error_ns",
            unit: "ns",
            provenance: Modelled,
            definition: "predicted time error at that time",
        },
    ]
};

#[cfg(test)]
mod tests {
    use super::*;
    use crate::holdover::holdover_seconds;
    use crate::telecom_timing::PRESETS;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    fn cond(guard_s: f64) -> SlotConditions {
        SlotConditions {
            guard_s,
            k_sigma: 1.0,
            fix_sigma_s: 0.0,
            fix_frequency_sigma: 0.0,
            elapsed_since_sync_s: 0.0,
            fix_latency_s: 0.0,
            residual_frequency_offset: 0.0,
            temperature_excursion_k: 0.0,
        }
    }

    fn explicit(q_wf: f64, flicker: f64, q_rw: f64, q_rr: f64) -> ClockNoise {
        ClockNoise {
            white_pm_var: 0.0,
            q_wf,
            flicker,
            q_rw,
            q_rr,
            aging_per_day: 0.0,
            tempco_per_k: 0.0,
            support_tau_s: f64::INFINITY,
            source: NoiseSource::Explicit,
        }
    }

    fn rel(a: f64, b: f64) -> f64 {
        (a - b).abs() / b.abs().max(1e-300)
    }

    // With no flicker, no deterministic term, a perfect fix and k = 1, the breach is the
    // holdover::holdover_seconds inversion, computed by an independent root-find.
    #[test]
    fn reduces_to_the_holdover_inversion() {
        for class in ClockClass::ALL {
            let n = ClockNoise::from_class(class);
            let (q_wf, q_rw, q_rr) = class.psds();
            let thr = 50e-9;
            let ours = breach_after_sync_s(&n, &cond(thr));
            let theirs = holdover_seconds(q_wf, q_rw, q_rr, thr);
            assert!(rel(ours, theirs) < 1e-9, "{class:?}: {ours} vs {theirs}");
        }
    }

    // White FM with a fix error and k: k²(σ₀² + q t) = g² ⇒ t = (g²/k² − σ₀²)/q.
    #[test]
    fn white_fm_with_fix_error_has_its_closed_form() {
        let n = explicit(4e-22, 0.0, 0.0, 0.0);
        let mut c = cond(30e-9);
        c.k_sigma = 3.0;
        c.fix_sigma_s = 4e-9;
        let t = breach_after_sync_s(&n, &c);
        let exact = ((30e-9f64 / 3.0).powi(2) - (4e-9f64).powi(2)) / 4e-22;
        assert!(rel(t, exact) < 1e-9, "{t} vs {exact}");
    }

    // Flicker floor alone: k·√h_F·t = g ⇒ t = g/(k√h_F).
    #[test]
    fn flicker_floor_alone_is_linear_in_time() {
        let h_f = (1e-12f64).powi(2);
        let n = explicit(0.0, h_f, 0.0, 0.0);
        let mut c = cond(10e-9);
        c.k_sigma = 2.0;
        let t = breach_after_sync_s(&n, &c);
        assert!(rel(t, 10e-9 / (2.0 * 1e-12)) < 1e-9);
    }

    // Ageing alone: ½·D·t² = g ⇒ t = √(2g/D).
    #[test]
    fn ageing_alone_is_quadratic_in_time() {
        let mut n = explicit(0.0, 0.0, 0.0, 0.0);
        n.aging_per_day = 1e-10;
        let d = 1e-10 / DAY_S;
        let t = breach_after_sync_s(&n, &cond(100e-9));
        assert!(rel(t, (2.0 * 100e-9 / d).sqrt()) < 1e-9);
    }

    // Temperature and residual offset add in magnitude: (|y|+|c·ΔT|)·t = g.
    #[test]
    fn frequency_offsets_add_in_magnitude() {
        let mut n = explicit(0.0, 0.0, 0.0, 0.0);
        n.tempco_per_k = 1e-11;
        let mut c = cond(1e-6);
        c.residual_frequency_offset = -2e-11;
        c.temperature_excursion_k = -3.0;
        let t = breach_after_sync_s(&n, &c);
        assert!(rel(t, 1e-6 / (2e-11 + 3e-11)) < 1e-9);
    }

    // Frequency uncertainty alone: k·σ_f·t = g ⇒ t = g/(k·σ_f).
    #[test]
    fn fix_frequency_uncertainty_alone_is_linear_in_time() {
        let n = explicit(0.0, 0.0, 0.0, 0.0);
        let mut c = cond(10e-9);
        c.k_sigma = 2.0;
        c.fix_frequency_sigma = 5e-12;
        let t = breach_after_sync_s(&n, &c);
        assert!(rel(t, 10e-9 / (2.0 * 5e-12)) < 1e-9);
        assert_eq!(
            slot_budget(&n, &c).unwrap().dominant_term(),
            "fix frequency uncertainty"
        );
    }

    #[test]
    fn a_fix_worse_than_the_guard_breaches_immediately() {
        let n = explicit(1e-22, 0.0, 0.0, 0.0);
        let mut c = cond(10e-9);
        c.k_sigma = 3.0;
        c.fix_sigma_s = 4e-9;
        let b = slot_budget(&n, &c).unwrap();
        assert_eq!(b.breach_after_sync_s, 0.0);
        assert!(b.breached_now);
        assert!(b.fixes_per_day.is_infinite());
    }

    #[test]
    fn a_noiseless_clock_never_breaches() {
        let b = slot_budget(&explicit(0.0, 0.0, 0.0, 0.0), &cond(1e-9)).unwrap();
        assert!(b.breach_after_sync_s.is_infinite());
        assert!(!b.breached_now);
    }

    #[test]
    fn remaining_and_cadence_follow_the_breach() {
        let n = explicit(1e-22, 0.0, 0.0, 0.0);
        let mut c = cond(20e-9);
        c.elapsed_since_sync_s = 600.0;
        c.fix_latency_s = 30.0;
        let b = slot_budget(&n, &c).unwrap();
        assert!(rel(b.remaining_s, b.breach_after_sync_s - 600.0) < 1e-12);
        assert!(rel(b.resync_interval_s, b.breach_after_sync_s - 30.0) < 1e-12);
        assert!(rel(b.fixes_per_day, DAY_S / b.resync_interval_s) < 1e-12);
        c.elapsed_since_sync_s = b.breach_after_sync_s + 1.0;
        let late = slot_budget(&n, &c).unwrap();
        assert!(late.breached_now && late.remaining_s == 0.0);
    }

    // The predicted error at the breach equals the guard.
    #[test]
    fn the_error_at_the_breach_is_the_guard() {
        let p = preset_by_id("ocxo").unwrap();
        let n = ClockNoise::from_datasheet(
            p.document,
            p.adev_points,
            p.aging_per_day,
            p.temperature_coeff_per_k(),
        )
        .unwrap();
        let mut c = cond(100e-9);
        c.k_sigma = 3.0;
        c.fix_sigma_s = 5e-9;
        c.temperature_excursion_k = 1.0;
        let t = breach_after_sync_s(&n, &c);
        assert!(rel(predicted_error_s(&n, &c, t), 100e-9) < 1e-9);
    }

    #[test]
    fn the_dominant_term_is_the_largest() {
        let mut n = explicit(1e-24, 0.0, 0.0, 0.0);
        n.aging_per_day = 1e-9;
        let b = slot_budget(&n, &cond(1e-6)).unwrap();
        assert_eq!(b.dominant_term(), "ageing");
        let w = slot_budget(&explicit(1e-18, 0.0, 0.0, 0.0), &cond(10e-9)).unwrap();
        assert_eq!(w.dominant_term(), "white frequency noise");
        for pair in w.terms.windows(2) {
            assert!(pair[0].time_error_ns >= pair[1].time_error_ns);
        }
    }

    // The IEEE 1139 conversion: the model Allan variance equals powerlaw::allan_variance
    // on the frequency-modulation terms.
    #[test]
    fn ieee1139_conversion_matches_the_powerlaw_module() {
        let (h_m2, h_m1, h_0) = (3e-30, 2e-24, 5e-22);
        let n = ClockNoise::from_ieee1139(h_m2, h_m1, h_0);
        let p = crate::powerlaw::PowerLaw {
            h_m2,
            h_m1,
            h_0,
            h_1: 0.0,
            h_2: 0.0,
        };
        for &tau in &[1.0, 10.0, 100.0, 1e4, 1e5] {
            let theirs = crate::powerlaw::allan_variance(&p, tau, 1.0);
            assert!(rel(n.allan_variance(tau), theirs) < 1e-12, "tau {tau}");
        }
    }

    // A datasheet fit keeps the telecom-timing fit's levels and envelopes every point.
    #[test]
    fn datasheet_fit_envelopes_every_point() {
        for p in PRESETS {
            let n = ClockNoise::from_datasheet(p.document, p.adev_points, 0.0, 0.0).unwrap();
            for &(t, s) in p.adev_points {
                assert!(n.allan_deviation(t) >= s * (1.0 - 1e-9), "{} at {t}", p.id);
            }
            assert_eq!(
                n.support_tau_s,
                p.adev_points.iter().map(|x| x.0).fold(0.0, f64::max)
            );
        }
        assert!(ClockNoise::from_datasheet("x", &[(1.0, 1e-11)], 0.0, 0.0).is_err());
        assert!(ClockNoise::from_datasheet("x", &[(1.0, 1e-11), (0.0, 1e-11)], 0.0, 0.0).is_err());
    }

    // The new classes cite the same datasheets as the telecom-timing presets.
    #[test]
    fn datasheet_classes_match_their_presets_at_one_second() {
        let at_1s = |id: &str| {
            preset_by_id(id)
                .unwrap()
                .adev_points
                .iter()
                .find(|p| p.0 == 1.0)
                .unwrap()
                .1
        };
        assert_eq!(ClockClass::Ocxo.adev_1s(), at_1s("ocxo"));
        assert_eq!(ClockClass::Rafs.adev_1s(), at_1s("rubidium"));
        assert_eq!(ClockClass::Csac.adev_1s(), at_1s("csac"));
    }

    #[test]
    fn class_ids_round_trip_and_every_class_names_a_source() {
        for c in ClockClass::ALL {
            assert_eq!(ClockClass::from_id(c.id()), Some(c));
            assert_eq!(ClockClass::from_id(&c.id().to_uppercase()), Some(c));
            assert!(!c.source().is_empty());
        }
        assert_eq!(ClockClass::from_id("xo"), None);
        // One-second stability ordering of the new classes.
        assert!(ClockClass::Tcxo.adev_1s() > ClockClass::Rafs.adev_1s());
        assert!(ClockClass::Rafs.adev_1s() > ClockClass::Ocxo.adev_1s());
    }

    // A measured record of pure white FM: the fit recovers q_wf and the slot answer
    // matches the one computed from the true level.
    #[test]
    fn a_measured_white_fm_record_recovers_its_level() {
        let sigma_y = 1e-11;
        let tau0 = 1.0;
        let mut rng = ChaCha8Rng::seed_from_u64(20260926);
        let nrm = Normal::new(0.0, sigma_y).unwrap();
        let mut x = 0.0;
        let phase: Vec<f64> = (0..20_000)
            .map(|_| {
                let v = x;
                x += nrm.sample(&mut rng) * tau0;
                v
            })
            .collect();
        let n = ClockNoise::from_phase_record(&phase, tau0).unwrap();
        let q_true = sigma_y * sigma_y;
        assert!(rel(n.q_wf + n.flicker, q_true) < 0.1, "q_wf {}", n.q_wf);
        // A guard the white-FM truth reaches in 2 000 s, inside the 20 000 s record.
        let c = cond((q_true * 2000.0).sqrt());
        let fitted = breach_after_sync_s(&n, &c);
        let truth = breach_after_sync_s(&explicit(q_true, 0.0, 0.0, 0.0), &c);
        assert!(rel(fitted, truth) < 0.2, "{fitted} vs {truth}; {n:?}");
        assert!(!slot_budget(&n, &c).unwrap().extrapolated);
        // Far beyond the record the answer is an extrapolation, and says so.
        assert!(slot_budget(&n, &cond(50e-9)).unwrap().extrapolated);
        assert!(matches!(
            n.source,
            NoiseSource::Record {
                n_samples: 20_000,
                ..
            }
        ));
        assert!(n.support_tau_s > 1.0 && n.support_tau_s < 20_000.0);
    }

    // Replacing the class's assumed floor by a measured record changes the answer, and
    // the record-based answer is the one the record supports.
    #[test]
    fn a_measured_floor_replaces_the_class_assumption() {
        let mut rng = ChaCha8Rng::seed_from_u64(7);
        let nrm = Normal::new(0.0, 5e-12).unwrap();
        let mut x = 0.0;
        let phase: Vec<f64> = (0..8192)
            .map(|_| {
                let v = x;
                x += nrm.sample(&mut rng);
                v
            })
            .collect();
        let measured = ClockNoise::from_phase_record(&phase, 1.0).unwrap();
        let class = ClockNoise::from_class(ClockClass::Ocxo);
        let c = cond(200e-9);
        let a = breach_after_sync_s(&measured, &c);
        let b = breach_after_sync_s(&class, &c);
        assert!(
            rel(a, b) > 0.05,
            "the assumed floor should matter: {a} vs {b}"
        );
    }

    #[test]
    fn records_that_are_too_short_or_bad_are_refused() {
        assert!(ClockNoise::from_phase_record(&[0.0; 10], 1.0).is_err());
        assert!(ClockNoise::from_phase_record(&[0.0; 64], 0.0).is_err());
        let mut v = vec![0.0; 64];
        v[3] = f64::NAN;
        assert!(ClockNoise::from_phase_record(&v, 1.0).is_err());
    }

    #[test]
    fn a_breach_beyond_the_datasheet_is_flagged_as_extrapolated() {
        let n = ClockNoise::from_datasheet("x", &[(1.0, 1e-11), (10.0, 1e-11)], 0.0, 0.0).unwrap();
        let b = slot_budget(&n, &cond(1e-6)).unwrap();
        assert!(b.breach_after_sync_s > 10.0 && b.extrapolated);
    }

    #[test]
    fn bad_conditions_are_refused() {
        let n = explicit(1e-22, 0.0, 0.0, 0.0);
        for bad in [
            SlotConditions {
                guard_s: 0.0,
                ..cond(1e-9)
            },
            SlotConditions {
                k_sigma: -1.0,
                ..cond(1e-9)
            },
            SlotConditions {
                fix_sigma_s: f64::NAN,
                ..cond(1e-9)
            },
            SlotConditions {
                fix_latency_s: -1.0,
                ..cond(1e-9)
            },
        ] {
            assert!(slot_budget(&n, &bad).is_err());
        }
        assert!(slot_budget(&explicit(-1.0, 0.0, 0.0, 0.0), &cond(1e-9)).is_err());
    }

    fn scenario(osc: &str) -> SlotTimingScenario {
        toml::from_str(&format!(
            "kind = \"slot-timing\"\n[oscillator]\n{osc}\n[slot]\nguard_ns = 100.0\n\
             fix_sigma_ns = 5.0\nelapsed_since_sync_s = 60.0\n"
        ))
        .unwrap()
    }

    #[test]
    fn the_scenario_takes_exactly_one_source() {
        assert!(scenario("class = \"ocxo\"").noise().is_ok());
        assert!(scenario("preset = \"rubidium\"").noise().is_ok());
        assert!(scenario("class = \"ocxo\"\npreset = \"ocxo\"")
            .noise()
            .is_err());
        assert!(scenario("aging_per_day = 1e-10").noise().is_err());
        assert!(scenario("class = \"xo\"").noise().is_err());
        let ds = scenario(
            "[oscillator.datasheet]\ndocument = \"test sheet\"\n\
             adev_points = [[1.0, 1e-11], [100.0, 2e-11]]\naging_per_day = 1e-10",
        );
        let n = ds.noise().unwrap();
        assert_eq!(n.aging_per_day, 1e-10);
        let over = scenario("preset = \"ocxo\"\naging_per_day = 0.0");
        assert_eq!(over.noise().unwrap().aging_per_day, 0.0);
    }

    #[test]
    fn the_spoofing_block_is_present_only_when_asked_for() {
        let (json, _, _) = scenario("class = \"ocxo\"").run_all().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert!(v["spoofing"].is_null());
        let mut s = scenario("class = \"ocxo\"");
        s.spoofing = Some(
            toml::from_str(
                "altitude_km = 550.0\n[[checks]]\nkind = \"ground-contact\"\n\
                 revisit_s = 300.0\nsigma_ns = 2.0\n",
            )
            .unwrap(),
        );
        let (json, _, _) = s.run_all().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert!(v["spoofing"]["max_spoofer_exposure_s"].as_f64().unwrap() > 700.0);
        assert!((v["spoofing"]["ramp_limited_pull_ns"].as_f64().unwrap() - 3000.0).abs() < 1e-6);
        assert_eq!(v["spoofing"]["checks"][0]["independent"], true);
    }

    #[test]
    fn the_report_carries_the_result_and_a_unit_for_each_field() {
        let (json, summary, svg) = scenario("preset = \"ocxo\"").run_all().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "slot-timing");
        assert_eq!(v["oscillator"]["source"], "datasheet");
        let breach = v["result"]["breach_after_sync_s"].as_f64().unwrap();
        assert!(breach > 0.0);
        assert!(v["terms_at_breach"].as_array().unwrap().len() == 10);
        assert!(summary.contains("slot-timing (datasheet source)"));
        assert!(svg.starts_with("<svg"));
        // Same input, same bytes.
        assert_eq!(json, scenario("preset = \"ocxo\"").run_all().unwrap().0);
    }
}
