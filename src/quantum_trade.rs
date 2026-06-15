// SPDX-License-Identifier: Apache-2.0
//! Quantum-vs-classical PNT **trade engine** + **measured-ADEV ingestion** +
//! **GNSS-denied resilience envelope** — the ground-side decision artifacts a
//! quantum-PNT consortium needs (ESA AO/1-13503).
//!
//! It **quantifies** a partner's quantum-clock / cold-atom benefit; it does
//! **not** validate the device. Three pieces:
//!
//! 1. [`qparams_from_adev_curve`] — the *defensibility hinge*: fit a clock's
//!    **measured** overlapping-ADEV curve to the holdover noise model
//!    `σ_y²(τ) = q_wf/τ + (q_rw/3)·τ + (q_drift/20)·τ³` by non-negative least
//!    squares, so the holdover budget is driven by the partner's real data
//!    instead of a synthesised long-tau floor. When the floor comes from a
//!    [`ClockClass`]/[`QuantumClockClass`] convenience instead of a measurement,
//!    the result is flagged `floor_assumed = true` and a caveat is attached.
//! 2. [`quantum_vs_classical_trade`] — a side-by-side timing-holdover /
//!    inertial-holdover / benefit-ratio table for a classical baseline vs a
//!    quantum candidate.
//! 3. [`resilience_envelope`] — clock holdover + quantum-inertial coast +
//!    alt-PNT bound composed into one error-vs-time curve, with the (finite) coast
//!    time to a threshold as the headline FoM. The clock range error grows without
//!    bound in time, so the coast time is searched over a finite modelled horizon
//!    and is never reported as literal infinity.
//!
//! ## Honesty (load-bearing)
//! Every number here is **MODELLED**, not validated — it must never borrow the
//! external-oracle validation islands (SGP4 / Allan-Stable32 / IGS). When the
//! red-noise floor is *assumed* (a class default, not a measured ADEV), the
//! holdover to a tight threshold is governed by that **assumption**, and
//! [`TradeResult::floor_caveat`] / [`Provenance`] carry that on the artifact.

use crate::clock_state::ClockClass;
use crate::holdover::{holdover_seconds, phase_to_range_m, QuantumClockClass};
use crate::inertial::quantum_imu::QuantumNavBudget;
use crate::types::Seconds;

/// The three holdover noise PSD coefficients (consumed by [`holdover_seconds`]).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct QParams {
    /// White-FM PSD `q_wf` (s).
    pub q_wf: f64,
    /// Random-walk-FM PSD `q_rw` (s⁻¹).
    pub q_rw: f64,
    /// Frequency-drift PSD `q_drift` (s⁻³).
    pub q_drift: f64,
}

impl QParams {
    /// Phase-error 1σ (s) after coasting `t` s.
    pub fn coast_sigma_s(&self, t: Seconds) -> Seconds {
        crate::holdover::coast_phase_sigma(self.q_wf, self.q_rw, self.q_drift, t)
    }
    /// Holdover (s) to a phase-error threshold.
    pub fn holdover_s(&self, threshold_s: Seconds) -> Seconds {
        holdover_seconds(self.q_wf, self.q_rw, self.q_drift, threshold_s)
    }
}

/// Solve a small (≤3×3) linear system `A x = b` by Gaussian elimination with
/// partial pivoting. Returns `None` if singular.
fn solve_linear(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let n = b.len();
    for col in 0..n {
        let mut piv = col;
        for r in (col + 1)..n {
            if a[r][col].abs() > a[piv][col].abs() {
                piv = r;
            }
        }
        if a[piv][col].abs() < 1e-300 {
            return None;
        }
        a.swap(col, piv);
        b.swap(col, piv);
        let pivot = a[col].clone();
        for r in (col + 1)..n {
            let f = a[r][col] / pivot[col];
            for (c, val) in a[r].iter_mut().enumerate().skip(col) {
                *val -= f * pivot[c];
            }
            b[r] -= f * b[col];
        }
    }
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let mut s = b[i];
        for c in (i + 1)..n {
            s -= a[i][c] * x[c];
        }
        x[i] = s / a[i][i];
    }
    Some(x)
}

/// Least-squares fit of `y` to the columns of `cols` (subset of the three basis
/// functions), with per-column normalisation for conditioning. Returns the
/// coefficients in the original (un-normalised) scale.
fn ls_subset(rows: &[[f64; 3]], y: &[f64], subset: &[usize]) -> Option<Vec<f64>> {
    let k = subset.len();
    // column scales
    let mut scale = vec![0.0; k];
    for (j, &col) in subset.iter().enumerate() {
        let s: f64 = rows.iter().map(|r| r[col] * r[col]).sum::<f64>().sqrt();
        scale[j] = if s > 0.0 { 1.0 / s } else { 1.0 };
    }
    // normal equations on scaled columns
    let mut ata = vec![vec![0.0; k]; k];
    let mut aty = vec![0.0; k];
    for (i, r) in rows.iter().enumerate() {
        for a in 0..k {
            let va = r[subset[a]] * scale[a];
            aty[a] += va * y[i];
            for b in 0..k {
                ata[a][b] += va * r[subset[b]] * scale[b];
            }
        }
    }
    let sol = solve_linear(ata, aty)?;
    Some(sol.iter().enumerate().map(|(j, &c)| c * scale[j]).collect())
}

/// Fit a measured overlapping-ADEV curve `(taus, adevs)` to the holdover noise
/// model by **non-negative least squares** over the basis `{1/τ, τ, τ³}` against
/// `σ_y²(τ)`, returning the recovered [`QParams`].
///
/// The basis powers are the canonical Allan-variance laws for the three noise
/// types the holdover model carries (and are consistent with
/// [`crate::clock_state::q_from_allan`]): white-FM `σ_y²∝1/τ`, random-walk-FM
/// `σ_y²∝τ` (ADEV slope +½), and random-run-FM / frequency-drift `σ_y²∝τ³`
/// (ADEV slope +3/2) — so the fitted coefficients are `[q_wf, q_rw/3, q_drift/20]`.
///
/// Non-negativity (a PSD cannot be negative) is enforced by an exact 3-variable
/// active-set search over all sign-feasible basis subsets — the global NNLS
/// optimum for ≤3 variables, up to a `.max(0.0)` clamp of round-off-negative
/// coefficients. The fit uses column-equilibrated normal equations (κ², adequate
/// for a curve over a few τ decades; prefer QR/SVD beyond ~6 decades). This is the
/// measured-data path that makes a holdover budget defensible rather than an
/// assumed floor — pair the result with `floor_assumed = false`.
pub fn qparams_from_adev_curve(taus: &[f64], adevs: &[f64]) -> QParams {
    let pts: Vec<(f64, f64)> = taus
        .iter()
        .zip(adevs.iter())
        .filter(|(&t, &s)| t > 0.0 && s.is_finite() && s >= 0.0)
        .map(|(&t, &s)| (t, s))
        .collect();
    if pts.len() < 2 {
        return QParams {
            q_wf: 0.0,
            q_rw: 0.0,
            q_drift: 0.0,
        };
    }
    // Basis {1/τ, τ, τ³} for σ_y²: white-FM, random-walk-FM, random-run-FM/drift.
    let rows: Vec<[f64; 3]> = pts.iter().map(|&(t, _)| [1.0 / t, t, t * t * t]).collect();
    let y: Vec<f64> = pts.iter().map(|&(_, s)| s * s).collect(); // fit σ², not σ

    // Enumerate all non-empty subsets of {0,1,2}; keep the min-residual,
    // fully non-negative solution (the NNLS optimum for 3 variables).
    let subsets: [&[usize]; 7] = [&[0], &[1], &[2], &[0, 1], &[0, 2], &[1, 2], &[0, 1, 2]];
    let mut best: Option<([f64; 3], f64)> = None;
    for sub in subsets {
        if let Some(coef) = ls_subset(&rows, &y, sub) {
            if coef.iter().any(|&c| c < -1e-300) {
                continue; // sign-infeasible
            }
            let mut full = [0.0f64; 3];
            for (j, &idx) in sub.iter().enumerate() {
                full[idx] = coef[j].max(0.0);
            }
            let resid: f64 = rows
                .iter()
                .zip(y.iter())
                .map(|(r, &yi)| {
                    let pred = r[0] * full[0] + r[1] * full[1] + r[2] * full[2];
                    (pred - yi) * (pred - yi)
                })
                .sum();
            if best.map_or(true, |(_, br)| resid < br) {
                best = Some((full, resid));
            }
        }
    }
    let c = best.map(|(c, _)| c).unwrap_or([0.0, 0.0, 0.0]);
    // basis coeffs are [q_wf, q_rw/3, q_drift/20]
    QParams {
        q_wf: c[0],
        q_rw: 3.0 * c[1],
        q_drift: 20.0 * c[2],
    }
}

/// How a clock's holdover floor was obtained — the honesty provenance.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Provenance {
    /// Long-tau red-noise floor **synthesised** from a class default (assumed).
    AssumedFloor,
    /// PSDs derived from a partner clock's **measured** ADEV curve.
    MeasuredAdev,
}

/// A clock under trade: a classical class, a quantum class, or measured PSDs.
#[derive(Clone, Copy, Debug)]
pub enum ClockSpec {
    /// Classical clock class (CSAC/USO/DSAC) — synthesised floor.
    Classical(ClockClass),
    /// Quantum clock class (optical-lattice/trapped-ion/mercury-ion) — synthesised floor.
    Quantum(QuantumClockClass),
    /// PSDs derived from a measured ADEV curve.
    Measured(QParams),
}

impl ClockSpec {
    /// The holdover PSDs for this clock.
    pub fn qparams(self) -> QParams {
        match self {
            ClockSpec::Classical(c) => {
                let (q_wf, q_rw, q_drift) = c.psds();
                QParams {
                    q_wf,
                    q_rw,
                    q_drift,
                }
            }
            ClockSpec::Quantum(c) => {
                let (q_wf, q_rw, q_drift) = c.psds();
                QParams {
                    q_wf,
                    q_rw,
                    q_drift,
                }
            }
            ClockSpec::Measured(q) => q,
        }
    }
    /// Provenance of the long-tau floor (measured vs assumed).
    pub fn provenance(self) -> Provenance {
        match self {
            ClockSpec::Measured(_) => Provenance::MeasuredAdev,
            _ => Provenance::AssumedFloor,
        }
    }
    /// Timing holdover (s) to a phase-error threshold.
    pub fn holdover_s(self, threshold_s: Seconds) -> Seconds {
        self.qparams().holdover_s(threshold_s)
    }
}

/// A position-error-vs-coast-time model (an inertial dead-reckoning budget).
pub trait PositionDrift {
    /// Total position-error 1σ (m) after coasting `t` s.
    fn drift_m(&self, t: f64) -> f64;
    /// Coast time (s) at which the drift first reaches `threshold_m`, by bisection
    /// over a sane horizon. `INFINITY` if it never reaches it.
    fn inertial_holdover_s(&self, threshold_m: f64) -> f64 {
        if threshold_m <= 0.0 {
            return 0.0;
        }
        if self.drift_m(1.0) == 0.0 && self.drift_m(1.0e6) == 0.0 {
            return f64::INFINITY;
        }
        let (mut lo, mut hi) = (0.0f64, 1.0f64);
        let mut guard = 0;
        while self.drift_m(hi) < threshold_m {
            hi *= 2.0;
            guard += 1;
            if guard > 60 {
                return f64::INFINITY;
            }
        }
        for _ in 0..100 {
            let mid = 0.5 * (lo + hi);
            if self.drift_m(mid) < threshold_m {
                lo = mid;
            } else {
                hi = mid;
            }
        }
        0.5 * (lo + hi)
    }
}

impl PositionDrift for QuantumNavBudget {
    fn drift_m(&self, t: f64) -> f64 {
        self.position_drift_1sigma(t)
    }
    fn inertial_holdover_s(&self, threshold_m: f64) -> f64 {
        self.holdover_seconds(threshold_m)
    }
}

/// A simple navigation-grade (classical) INS dead-reckoning budget: RSS of a
/// constant accelerometer bias, a scale-factor term, and a velocity-random-walk
/// term — the classical baseline a quantum sensor is traded against.
#[derive(Clone, Copy, Debug)]
pub struct ClassicalInsBudget {
    /// Residual accelerometer bias (m/s²).
    pub bias_m_s2: f64,
    /// Accelerometer scale-factor error (ppm).
    pub scale_factor_ppm: f64,
    /// Sustained specific force the scale-factor error multiplies (m/s²).
    pub ref_accel_m_s2: f64,
    /// Velocity-random-walk acceleration PSD `q_va` (m²/s³).
    pub vrw_psd: f64,
}

impl PositionDrift for ClassicalInsBudget {
    fn drift_m(&self, t: f64) -> f64 {
        let b = 0.5 * self.bias_m_s2 * t * t;
        let sf = 0.5 * (self.scale_factor_ppm * 1e-6) * self.ref_accel_m_s2 * t * t;
        let vrw2 = self.vrw_psd * t.max(0.0).powi(3) / 3.0;
        (b * b + sf * sf + vrw2).sqrt()
    }
}

/// One row of the quantum-vs-classical trade table.
#[derive(Clone, Debug)]
pub struct TradeRow {
    /// Human label (e.g. "classical baseline" / "quantum candidate").
    pub label: String,
    /// Timing holdover (s) to the timing threshold.
    pub timing_holdover_s: f64,
    /// Inertial holdover (s) to the position threshold.
    pub inertial_holdover_s: f64,
    /// Whether this row's clock floor is an **assumed** class default.
    pub floor_assumed: bool,
}

/// The trade table result — a MODELLED decision artifact.
#[derive(Clone, Debug)]
pub struct TradeResult {
    /// Phase-error threshold used for timing holdover (s).
    pub timing_threshold_s: f64,
    /// Position-error threshold used for inertial holdover (m).
    pub position_threshold_m: f64,
    /// The baseline row.
    pub baseline: TradeRow,
    /// The candidate row.
    pub candidate: TradeRow,
    /// Candidate ÷ baseline timing-holdover ratio (×).
    pub timing_benefit_x: f64,
    /// Candidate ÷ baseline inertial-holdover ratio (×).
    pub inertial_benefit_x: f64,
    /// The floor-assumption caveat that MUST render on any artifact, when any
    /// row uses an assumed (non-measured) floor.
    pub floor_caveat: Option<String>,
}

impl TradeResult {
    /// A one-line provenance banner for the artifact face.
    pub fn provenance_banner(&self) -> &'static str {
        "MODELLED — quantifies a partner benefit; not validated, no flight heritage"
    }
}

fn ratio_x(candidate: f64, baseline: f64) -> f64 {
    if baseline.is_infinite() {
        // an already-unbounded baseline cannot be "out-benefited": ratio ≤ 1.
        if candidate.is_infinite() {
            1.0
        } else {
            0.0
        }
    } else if baseline <= 0.0 {
        if candidate > 0.0 {
            f64::INFINITY
        } else {
            0.0
        }
    } else {
        candidate / baseline
    }
}

/// Build the quantum-vs-classical trade table for the given thresholds, clocks
/// and inertial budgets. Benefit ratios are candidate ÷ baseline.
pub fn quantum_vs_classical_trade(
    timing_threshold_s: f64,
    position_threshold_m: f64,
    baseline_clock: ClockSpec,
    candidate_clock: ClockSpec,
    baseline_ins: &dyn PositionDrift,
    candidate_ins: &dyn PositionDrift,
) -> TradeResult {
    let b_t = baseline_clock.holdover_s(timing_threshold_s);
    let c_t = candidate_clock.holdover_s(timing_threshold_s);
    let b_i = baseline_ins.inertial_holdover_s(position_threshold_m);
    let c_i = candidate_ins.inertial_holdover_s(position_threshold_m);
    let assumed = baseline_clock.provenance() == Provenance::AssumedFloor
        || candidate_clock.provenance() == Provenance::AssumedFloor;
    let caveat = if assumed {
        Some(
            "Holdover to a tight threshold for a very stable clock is governed by \
             the ASSUMED long-tau red-noise floor, not the cited σ_y(1 s). Ingest a \
             measured ADEV curve (qparams_from_adev_curve) for a defensible number."
                .to_string(),
        )
    } else {
        None
    };
    TradeResult {
        timing_threshold_s,
        position_threshold_m,
        baseline: TradeRow {
            label: "classical baseline".into(),
            timing_holdover_s: b_t,
            inertial_holdover_s: b_i,
            floor_assumed: baseline_clock.provenance() == Provenance::AssumedFloor,
        },
        candidate: TradeRow {
            label: "quantum candidate".into(),
            timing_holdover_s: c_t,
            inertial_holdover_s: c_i,
            floor_assumed: candidate_clock.provenance() == Provenance::AssumedFloor,
        },
        timing_benefit_x: ratio_x(c_t, b_t),
        inertial_benefit_x: ratio_x(c_i, b_i),
        floor_caveat: caveat,
    }
}

/// The modelled coast horizon (s) the envelope is searched over (≈116 days) —
/// far beyond any realistic GNSS-denied coast. A crossing not found by here is
/// reported as a lower bound, never as literal infinity.
pub const RESILIENCE_HORIZON_S: f64 = 1.0e7;

/// One point on the GNSS-denied resilience envelope.
#[derive(Clone, Copy, Debug)]
pub struct EnvelopePoint {
    /// Time since GNSS loss (s).
    pub t: f64,
    /// Composed position-equivalent error (m): RSS of the alt-PNT-bounded inertial
    /// position drift and the clock-holdover range error.
    pub error_m: f64,
}

/// The GNSS-denied resilience envelope.
#[derive(Clone, Debug)]
pub struct ResilienceEnvelope {
    /// Error-vs-time points.
    pub points: Vec<EnvelopePoint>,
    /// Headline FoM: coast time (s) to the error threshold. The clock range error
    /// grows without bound in `t` (∝√t for white-FM, faster with red noise), so for
    /// any clock with non-zero noise the envelope **does** eventually cross — this is
    /// always finite, never ∞. Capped at [`RESILIENCE_HORIZON_S`] (see `exceeds_horizon`).
    pub coast_time_s: f64,
    /// The error threshold used (m).
    pub threshold_m: f64,
    /// True if the threshold was not reached by [`RESILIENCE_HORIZON_S`] — then
    /// `coast_time_s` is the horizon, a **lower bound**, not a crossing (only a
    /// near-noiseless clock under a tight alt-PNT bound gets here).
    pub exceeds_horizon: bool,
    /// True if the alt-PNT bound is actively capping the inertial position drift at
    /// the coast time (alt-PNT, not the raw INS, is what holds position there).
    pub alt_pnt_active: bool,
}

/// Compose clock holdover + quantum-inertial coast + alt-PNT bound into one
/// resilience-vs-time envelope.
///
/// The inertial position drift is **capped** at `alt_pnt_bound_m` (a terrain /
/// gravity / magnetic map-matching fix bounds the unaided drift), and the clock
/// phase error is mapped to a range error via [`phase_to_range_m`]; the envelope
/// is their RSS. The position-equivalent metre axis therefore mixes a
/// map-matching-bounded INS position 1σ with the one-way clock range error
/// `c·σ_x`, treated as **independent**, with the alt-PNT fix assumed to bound
/// position but **not** time — a modelling convention, stated so it is not assumed.
/// The headline FoM is the coast time to `threshold_m`; because the clock term is
/// unbounded in `t`, this is finite for any real clock (capped at the horizon).
pub fn resilience_envelope(
    clock: ClockSpec,
    ins: &dyn PositionDrift,
    alt_pnt_bound_m: f64,
    threshold_m: f64,
    times: &[f64],
) -> ResilienceEnvelope {
    let q = clock.qparams();
    let bound = alt_pnt_bound_m.max(0.0);
    let err_at = |t: f64| {
        let pos = ins.drift_m(t).min(bound);
        let clk = phase_to_range_m(q.coast_sigma_s(t));
        (pos * pos + clk * clk).sqrt()
    };
    let points: Vec<EnvelopePoint> = times
        .iter()
        .map(|&t| EnvelopePoint {
            t,
            error_m: err_at(t),
        })
        .collect();
    // The envelope is monotone non-decreasing in t. Search for the crossing up to a
    // finite modelled horizon — never infer "indefinitely bounded" from one probe.
    let (coast_time_s, exceeds_horizon) = if err_at(RESILIENCE_HORIZON_S) < threshold_m {
        (RESILIENCE_HORIZON_S, true)
    } else {
        let (mut lo, mut hi) = (0.0f64, 1.0f64);
        while hi < RESILIENCE_HORIZON_S && err_at(hi) < threshold_m {
            hi = (hi * 2.0).min(RESILIENCE_HORIZON_S);
        }
        for _ in 0..100 {
            let mid = 0.5 * (lo + hi);
            if err_at(mid) < threshold_m {
                lo = mid;
            } else {
                hi = mid;
            }
        }
        (0.5 * (lo + hi), false)
    };
    let alt_pnt_active = ins.drift_m(coast_time_s) >= bound;
    ResilienceEnvelope {
        points,
        coast_time_s,
        threshold_m,
        exceeds_horizon,
        alt_pnt_active,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::clock_state::q_from_allan;
    use crate::inertial::quantum_imu::CaiAccelerometer;

    fn ref_cai() -> CaiAccelerometer {
        CaiAccelerometer {
            wavelength_m: 780.0e-9,
            pulse_sep_t: 0.05,
            atom_number: 1.0e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        }
    }

    #[test]
    fn measured_adev_round_trips_against_q_from_allan_oracle() {
        // Independent oracle: synthesise the ADEV from the canonical Allan-deviation
        // LEVELS (white σ_y∝τ^-1/2, RW σ_y∝τ^+1/2, drift σ_y∝τ^+3/2), then check the
        // fit recovers exactly the q's that the repo's *separate* q_from_allan
        // converter produces from those same levels. This ties the fit to an
        // independent function and would FAIL on a wrong basis power (e.g. τ² drift).
        let (a, b, d) = (1.0e-12_f64, 1.0e-14_f64, 1.0e-17_f64); // white, rw, drift levels
        let (q_wf, q_rw, q_drift) = q_from_allan(a, b, d);
        let taus = [1.0, 3.0, 10.0, 30.0, 100.0, 300.0, 1000.0, 3000.0, 10000.0];
        // σ_y(τ) = sqrt(a²/τ + b²·τ + d²·τ³)  — the canonical ADEV from levels.
        let adevs: Vec<f64> = taus
            .iter()
            .map(|&t: &f64| (a * a / t + b * b * t + d * d * t * t * t).sqrt())
            .collect();
        let got = qparams_from_adev_curve(&taus, &adevs);
        let rel = |x: f64, y: f64| (x - y).abs() / y.abs().max(1e-300);
        assert!(rel(got.q_wf, q_wf) < 1e-3, "q_wf {} vs {}", got.q_wf, q_wf);
        assert!(rel(got.q_rw, q_rw) < 1e-2, "q_rw {} vs {}", got.q_rw, q_rw);
        assert!(
            rel(got.q_drift, q_drift) < 2e-2,
            "q_drift {} vs {}",
            got.q_drift,
            q_drift
        );
    }

    #[test]
    fn measured_adev_fit_is_nonnegative_on_pure_white_fm() {
        // A pure white-FM clock (σ_y ∝ τ^-1/2) must recover q_wf>0 and q_rw,q_drift≈0,
        // never negative PSDs.
        let a1: f64 = 1.0e-12;
        let taus = [1.0, 10.0, 100.0, 1000.0, 10000.0];
        let adevs: Vec<f64> = taus.iter().map(|&t: &f64| a1 / t.sqrt()).collect();
        let got = qparams_from_adev_curve(&taus, &adevs);
        assert!(got.q_wf >= 0.0 && got.q_rw >= 0.0 && got.q_drift >= 0.0);
        assert!((got.q_wf - a1 * a1).abs() / (a1 * a1) < 1e-3);
        // red-noise terms are negligible
        assert!(got.q_rw < a1 * a1 * 1e-3);
    }

    #[test]
    fn measured_provenance_carries_no_floor_caveat() {
        let measured = ClockSpec::Measured(QParams {
            q_wf: 1.0e-26,
            q_rw: 1.0e-32,
            q_drift: 1.0e-40,
        });
        assert_eq!(measured.provenance(), Provenance::MeasuredAdev);
        let classical = ClockSpec::Classical(ClockClass::Uso);
        assert_eq!(classical.provenance(), Provenance::AssumedFloor);
    }

    #[test]
    fn better_clock_holds_over_longer() {
        // NOTE: a consistency check, not an independent physics result — both classes
        // derive their PSDs from the same q_from_allan(a, a·1e-2, a·1e-4) recipe that
        // is monotone in σ_y(1 s), so a lower-ADEV class necessarily holds over longer.
        let thr = 1.0e-6; // 1 µs
        let csac = ClockSpec::Classical(ClockClass::Csac).holdover_s(thr);
        let optical = ClockSpec::Quantum(QuantumClockClass::OpticalLattice).holdover_s(thr);
        assert!(
            optical > csac,
            "optical {optical} should exceed CSAC {csac}"
        );
    }

    #[test]
    fn quantum_ins_coasts_longer_than_classical_and_trade_reports_benefit() {
        // Quantum CAI budget: tiny bias, small VRW.
        let quantum = QuantumNavBudget {
            cai: ref_cai(),
            bias_m_s2: 1.0e-7,
            scale_factor_ppm: 1.0,
            ref_accel_m_s2: 0.0,
            tau_stability_s: 0.0,
        };
        // Classical nav-grade INS: larger bias, larger VRW.
        let classical = ClassicalInsBudget {
            bias_m_s2: 5.0e-5,
            scale_factor_ppm: 50.0,
            ref_accel_m_s2: 9.81,
            vrw_psd: 1.0e-4,
        };
        let thr_m = 100.0;
        let q_hold = quantum.inertial_holdover_s(thr_m);
        let c_hold = classical.inertial_holdover_s(thr_m);
        assert!(
            q_hold > c_hold,
            "quantum {q_hold}s should coast past classical {c_hold}s"
        );

        let trade = quantum_vs_classical_trade(
            1.0e-6,
            thr_m,
            ClockSpec::Classical(ClockClass::Uso),
            ClockSpec::Quantum(QuantumClockClass::OpticalLattice),
            &classical,
            &quantum,
        );
        assert!(
            trade.inertial_benefit_x > 1.0,
            "benefit {}",
            trade.inertial_benefit_x
        );
        assert!(trade.timing_benefit_x > 1.0);
        // assumed-floor clocks must carry the caveat ON the artifact.
        assert!(trade.floor_caveat.is_some());
        assert!(trade.candidate.floor_assumed);
    }

    #[test]
    fn measured_clock_trade_drops_the_floor_caveat() {
        let classical = ClassicalInsBudget {
            bias_m_s2: 5.0e-5,
            scale_factor_ppm: 50.0,
            ref_accel_m_s2: 9.81,
            vrw_psd: 1.0e-4,
        };
        let quantum = QuantumNavBudget {
            cai: ref_cai(),
            bias_m_s2: 1.0e-7,
            scale_factor_ppm: 1.0,
            ref_accel_m_s2: 0.0,
            tau_stability_s: 0.0,
        };
        // Both clocks from measured ADEV ⇒ no floor caveat.
        let q = QParams {
            q_wf: 1.0e-24,
            q_rw: 3.0e-28,
            q_drift: 2.0e-31,
        };
        let trade = quantum_vs_classical_trade(
            1.0e-6,
            100.0,
            ClockSpec::Measured(q),
            ClockSpec::Measured(q),
            &classical,
            &quantum,
        );
        assert!(trade.floor_caveat.is_none());
        assert!(!trade.candidate.floor_assumed);
    }

    #[test]
    fn resilience_envelope_is_monotone_finite_and_horizon_honest() {
        let quantum = QuantumNavBudget {
            cai: ref_cai(),
            bias_m_s2: 1.0e-6,
            scale_factor_ppm: 1.0,
            ref_accel_m_s2: 0.0,
            tau_stability_s: 0.0,
        };
        let times: Vec<f64> = (0..=120).map(|i| i as f64 * 5.0).collect(); // 0..600 s

        // A real (noisy) clock's range error grows unbounded, so even with a tight
        // alt-PNT bound the envelope MUST eventually cross — coast time is FINITE,
        // never reported as ∞ (the bug the review caught).
        let env = resilience_envelope(
            ClockSpec::Quantum(QuantumClockClass::OpticalLattice),
            &quantum,
            150.0,
            500.0,
            &times,
        );
        for w in env.points.windows(2) {
            assert!(w[1].error_m >= w[0].error_m - 1e-9);
        }
        assert!(
            env.coast_time_s.is_finite() && env.coast_time_s > 0.0,
            "a noisy clock must give a finite coast time, got {}",
            env.coast_time_s
        );
        assert!(
            env.alt_pnt_active,
            "the 150 m bound should be binding at the crossing"
        );

        // A near-perfect (zero-noise) clock under a tight alt-PNT bound genuinely
        // stays under a loose threshold to the horizon — reported as a LOWER BOUND
        // (exceeds_horizon), never literal infinity.
        let perfect = ClockSpec::Measured(QParams {
            q_wf: 0.0,
            q_rw: 0.0,
            q_drift: 0.0,
        });
        let env_perf = resilience_envelope(perfect, &quantum, 150.0, 500.0, &times);
        assert!(env_perf.exceeds_horizon);
        assert!((env_perf.coast_time_s - RESILIENCE_HORIZON_S).abs() < 1.0);

        // With NO alt-PNT (huge bound) and a tight threshold, finite + not bounded.
        let env2 = resilience_envelope(
            ClockSpec::Quantum(QuantumClockClass::OpticalLattice),
            &quantum,
            1.0e12,
            50.0,
            &times,
        );
        assert!(env2.coast_time_s.is_finite() && env2.coast_time_s > 0.0);
        assert!(!env2.exceeds_horizon);
    }
}
