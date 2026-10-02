// SPDX-License-Identifier: AGPL-3.0-only
//! Device cards: a clock's power-law noise and deterministic drift fitted to a named measured
//! record, and the held-out score that says whether the card predicts data it never saw.
//!
//! # Fitting a card to a phase record (fixed in the clock-library pre-registration)
//!
//! 1. Condition the record ([`super::condition::condition`]) and keep the log.
//! 2. Remove the least-squares quadratic; the fractional-frequency drift is `D = 2 c2` (1/s).
//! 3. At octave averaging factors `m = 1, 2, 4, ...` take the gap-aware overlapping Allan
//!    variance ([`super::series::gappy_oavar`]) while at least 8 terms remain.
//! 4. Identify the noise type at each `m` with the lag-1 autocorrelation method
//!    ([`crate::allan::lag1_noise_id`], phase data, `dmin = 0`, `dmax = 2`) on the longest
//!    gap-free run of the detrended record, when that run holds at least
//!    [`MIN_ID_SAMPLES`] decimated samples; otherwise, and for an exponent outside -2..=2,
//!    the type is taken as random-walk frequency modulation (FM), the type with the fewest
//!    degrees of freedom.
//! 5. Effective degrees of freedom (edf) per point from
//!    [`crate::allan::edf_overlapping_adev`] for that type, with `n = terms + 2m`.
//! 6. Keep the points with edf at least [`MIN_FIT_EDF`] (at least three are required) and fit
//!    them by the edf-weighted non-negative least squares of [`crate::slot_timing::fit_weighted`]
//!    in the basis white phase, white FM, flicker FM and random-walk FM.
//!
//! The card's Allan deviation is then
//! `sigma_y^2(tau) = 3 s_PM^2 / tau^2 + h_0 / (2 tau) + 2 ln2 h_-1 + (2 pi^2 / 3) h_-2 tau
//! + D^2 tau^2 / 2`, the last term being the drift's contribution to the Allan variance.
//!
//! # Held-out score
//!
//! [`score_held_out`] conditions the held-out record the same way (no detrending: the card
//! carries the drift), takes its gap-aware Allan deviation at the card's own fitted averaging
//! times, and compares the card's prediction with it. The card passes when every ratio
//! `predicted / measured` lies within `[1/bar, bar]`.

use super::condition::{condition, ConditioningLog};
use super::series::{gappy_oavar, gappy_ohvar, remove_quadratic, PhaseSeries};
use crate::allan::{edf_overlapping_adev, lag1_noise_id, Lag1DataType, PowerLawNoise};
use serde::Serialize;
use std::f64::consts::{LN_2, PI};

/// Minimum edf for a point to enter the fit (and so to be scored).
pub const MIN_FIT_EDF: f64 = 30.0;
/// Minimum number of decimated samples for the lag-1 noise identification.
pub const MIN_ID_SAMPLES: usize = 30;
/// Minimum number of difference terms for an Allan or Hadamard point.
pub const MIN_TERMS: usize = 8;

/// One measured stability point a card was fitted on.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct CardPoint {
    pub tau_s: f64,
    pub adev: f64,
    pub edf: f64,
    /// The lag-1 identified exponent (`None` when the fallback applied or for a curve).
    pub alpha: Option<i32>,
}

/// A device card.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DeviceCard {
    /// The named measured record the card was fitted to.
    pub name: String,
    /// White phase-noise variance `s_PM^2` (s^2).
    pub white_pm_var: f64,
    /// IEEE Std 1139 `h_0` (white FM).
    pub h_0: f64,
    /// IEEE Std 1139 `h_-1` (flicker FM).
    pub h_m1: f64,
    /// IEEE Std 1139 `h_-2` (random-walk FM).
    pub h_m2: f64,
    /// Linear fractional-frequency drift (1/s); zero for a card fitted on a curve.
    pub drift_per_s: f64,
    /// The points the card was fitted on.
    pub fit_points: Vec<CardPoint>,
    /// Conditioning log of the fit record (empty for a curve).
    pub conditioning: ConditioningLog,
}

fn type_from_alpha(a: i32) -> Option<PowerLawNoise> {
    match a {
        2 => Some(PowerLawNoise::WhitePm),
        1 => Some(PowerLawNoise::FlickerPm),
        0 => Some(PowerLawNoise::WhiteFm),
        -1 => Some(PowerLawNoise::FlickerFm),
        -2 => Some(PowerLawNoise::RandomWalkFm),
        _ => None,
    }
}

impl DeviceCard {
    /// Fit a card to the phase record `fit` (see the module documentation).
    pub fn fit_phase(name: &str, fit: &PhaseSeries) -> Result<DeviceCard, String> {
        let (clean, conditioning) = condition(fit);
        let (detr, c) = remove_quadratic(&clean);
        let run = detr.longest_run();
        let mut pts = Vec::new();
        let mut m = 1usize;
        while let Some((v, terms)) = gappy_oavar(&detr.x, detr.tau0, m) {
            if terms < MIN_TERMS {
                break;
            }
            let id = (run.len() / m >= MIN_ID_SAMPLES)
                .then(|| lag1_noise_id(&run.x, m, Lag1DataType::Phase, 0, 2))
                .flatten();
            let alpha = id.map(|i| i.alpha_int);
            let noise = alpha
                .and_then(type_from_alpha)
                .unwrap_or(PowerLawNoise::RandomWalkFm);
            let edf = edf_overlapping_adev(noise, terms + 2 * m, m);
            pts.push(CardPoint {
                tau_s: m as f64 * detr.tau0,
                adev: v.sqrt(),
                edf,
                alpha: alpha.filter(|a| type_from_alpha(*a).is_some()),
            });
            m *= 2;
        }
        let mut card = Self::fit_points(name, &pts)?;
        card.drift_per_s = 2.0 * c[2];
        card.conditioning = conditioning;
        Ok(card)
    }

    /// Fit a card to published stability points `(tau, adev, edf)`; no drift.
    pub fn fit_curve(name: &str, points: &[(f64, f64, f64)]) -> Result<DeviceCard, String> {
        let pts: Vec<CardPoint> = points
            .iter()
            .map(|&(tau_s, adev, edf)| CardPoint {
                tau_s,
                adev,
                edf,
                alpha: None,
            })
            .collect();
        Self::fit_points(name, &pts)
    }

    fn fit_points(name: &str, pts: &[CardPoint]) -> Result<DeviceCard, String> {
        let used: Vec<CardPoint> = pts
            .iter()
            .copied()
            .filter(|p| p.edf >= MIN_FIT_EDF && p.adev.is_finite() && p.adev > 0.0)
            .collect();
        if used.len() < 3 {
            return Err(format!(
                "{name}: {} stability points with edf >= {MIN_FIT_EDF}; a card needs three",
                used.len()
            ));
        }
        let trip: Vec<(f64, f64, f64)> = used.iter().map(|p| (p.tau_s, p.adev, p.edf)).collect();
        let f = crate::slot_timing::fit_weighted(&trip);
        Ok(DeviceCard {
            name: name.to_string(),
            white_pm_var: f.white_pm_var,
            h_0: f.h_0,
            h_m1: f.h_m1,
            h_m2: f.h_m2,
            drift_per_s: 0.0,
            fit_points: used,
            conditioning: ConditioningLog::default(),
        })
    }

    /// The card's Allan variance without the drift term.
    pub fn noise_allan_variance(&self, tau: f64) -> f64 {
        3.0 * self.white_pm_var / (tau * tau)
            + 0.5 * self.h_0 / tau
            + 2.0 * LN_2 * self.h_m1
            + (2.0 * PI * PI / 3.0) * self.h_m2 * tau
    }

    /// The card's predicted Allan deviation at `tau`, drift included.
    pub fn adev(&self, tau: f64) -> f64 {
        let d = self.drift_per_s * tau;
        (self.noise_allan_variance(tau) + 0.5 * d * d)
            .max(0.0)
            .sqrt()
    }

    /// The averaging times the card was fitted at (and is scored at).
    pub fn taus(&self) -> Vec<f64> {
        self.fit_points.iter().map(|p| p.tau_s).collect()
    }

    /// The card's levels in the slot-timing noise model (white phase, white, flicker and
    /// random-walk FM; the drift as ageing per day).
    pub fn clock_noise(&self) -> crate::slot_timing::ClockNoise {
        let mut n = crate::slot_timing::ClockNoise::from_ieee1139(self.h_m2, self.h_m1, self.h_0);
        n.white_pm_var = self.white_pm_var;
        n.aging_per_day = self.drift_per_s.abs() * 86_400.0;
        n
    }

    /// The card as the optional extended Kalman clock model
    /// ([`crate::clock_state::ClockModelExt`]): white and random-walk FM, and, when the card
    /// carries a flicker floor, a two-per-decade Gauss-Markov flicker-FM bank between
    /// `t_min` and `t_max` seconds. No periodic terms (pass them on the returned model).
    pub fn clock_model_ext(&self, t_min: f64, t_max: f64) -> crate::clock_state::ClockModelExt {
        crate::clock_state::ClockModelExt {
            q_wf: 0.5 * self.h_0,
            q_rw: 2.0 * PI * PI * self.h_m2,
            q_drift: 0.0,
            flicker: (self.h_m1 > 0.0)
                .then(|| crate::clock_state::FlickerFmBank::log_spaced(self.h_m1, t_min, t_max, 2)),
            harmonics: Vec::new(),
            q_harmonic: 0.0,
        }
    }
}

/// One scored averaging time.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ScoredPoint {
    pub tau_s: f64,
    pub predicted: f64,
    /// Measured held-out Allan deviation (`NaN` when the held-out record has no value there).
    pub measured: f64,
    pub ratio: f64,
    pub terms: usize,
}

/// The held-out score of one card.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct HeldOutScore {
    pub card: String,
    pub bar: f64,
    pub points: Vec<ScoredPoint>,
    /// Largest `max(ratio, 1/ratio)` over the points (infinite if a point is missing).
    pub worst_factor: f64,
    pub pass: bool,
    pub conditioning: ConditioningLog,
}

fn finish(
    card: &DeviceCard,
    bar: f64,
    points: Vec<ScoredPoint>,
    log: ConditioningLog,
) -> HeldOutScore {
    let worst = points
        .iter()
        .map(|p| {
            if p.ratio.is_finite() && p.ratio > 0.0 {
                p.ratio.max(1.0 / p.ratio)
            } else {
                f64::INFINITY
            }
        })
        .fold(0.0_f64, f64::max);
    HeldOutScore {
        card: card.name.clone(),
        bar,
        pass: !points.is_empty() && worst <= bar,
        worst_factor: if points.is_empty() {
            f64::INFINITY
        } else {
            worst
        },
        points,
        conditioning: log,
    }
}

/// Score `card` on the held-out phase record `held` at the card's own averaging times.
pub fn score_held_out(card: &DeviceCard, held: &PhaseSeries, bar: f64) -> HeldOutScore {
    let (clean, log) = condition(held);
    let points = card
        .taus()
        .into_iter()
        .map(|tau| {
            let m = (tau / clean.tau0).round() as usize;
            let (measured, terms) = match gappy_oavar(&clean.x, clean.tau0, m) {
                Some((v, c)) if c >= MIN_TERMS => (v.sqrt(), c),
                _ => (f64::NAN, 0),
            };
            let predicted = card.adev(tau);
            ScoredPoint {
                tau_s: tau,
                predicted,
                measured,
                ratio: predicted / measured,
                terms,
            }
        })
        .collect();
    finish(card, bar, points, log)
}

/// Score `card` against published held-out stability points `(tau, adev)`.
pub fn score_curve(card: &DeviceCard, held: &[(f64, f64)], bar: f64) -> HeldOutScore {
    let points = held
        .iter()
        .map(|&(tau, measured)| {
            let predicted = card.adev(tau);
            ScoredPoint {
                tau_s: tau,
                predicted,
                measured,
                ratio: predicted / measured,
                terms: 0,
            }
        })
        .collect();
    finish(card, bar, points, ConditioningLog::default())
}

/// The monitor noise levels of [`pooled_hadamard_noise`] and the pooled Hadamard curve it was
/// fitted on, as `(tau, Hadamard variance, terms)`.
pub type PooledHadamard = (
    crate::spoof_monitors::ClockNoiseEstimate,
    Vec<(f64, f64, usize)>,
);

/// Hadamard variance per unit level of white phase `r`, white FM `q_wf`, random-walk FM `q_rw`
/// and random-run FM `q_drift` at averaging time `tau`: the basis of
/// `spoof_monitors::hadamard_noise_fit`, so the levels drop straight into
/// [`crate::spoof_monitors::ClockAidedMonitor`].
fn hadamard_basis(tau: f64) -> [f64; 4] {
    [
        10.0 / (3.0 * tau * tau),
        1.0 / tau,
        tau / 6.0,
        11.0 * tau * tau * tau / 120.0,
    ]
}

/// The monitor noise levels `(r, q_wf, q_rw, q_drift)` of a card fitted to several records of
/// one oscillator (for example the clean stretches of other sessions of the same receiver):
/// each record is conditioned, the overlapping Hadamard variance is pooled over all records
/// (sum of squared third differences over the total count) at octave averaging factors while
/// the pooled count is at least [`MIN_TERMS`], and the four levels are the non-negative
/// least-squares fit of the Hadamard basis with every equation divided by its measured value,
/// as in `spoof_monitors::hadamard_noise_fit`. `None` with fewer than two points.
pub fn pooled_hadamard_noise(records: &[PhaseSeries]) -> Option<PooledHadamard> {
    let tau0 = records.first()?.tau0;
    let cleaned: Vec<PhaseSeries> = records.iter().map(|r| condition(r).0).collect();
    let mut curve = Vec::new();
    let mut m = 1usize;
    loop {
        let (mut s, mut c) = (0.0, 0usize);
        for r in &cleaned {
            if let Some((v, k)) = gappy_ohvar(&r.x, tau0, m) {
                s += v * k as f64;
                c += k;
            }
        }
        if c < MIN_TERMS {
            break;
        }
        curve.push((m as f64 * tau0, s / c as f64, c));
        m *= 2;
    }
    if curve.len() < 2 {
        return None;
    }
    let rows: Vec<[f64; 4]> = curve
        .iter()
        .map(|&(tau, hv, _)| {
            let b = hadamard_basis(tau);
            [b[0] / hv, b[1] / hv, b[2] / hv, b[3] / hv]
        })
        .collect();
    let mut best: Option<([f64; 4], f64)> = None;
    for mask in 1u32..16 {
        let idx: Vec<usize> = (0..4).filter(|j| mask & (1 << j) != 0).collect();
        if idx.len() > rows.len() {
            continue;
        }
        let k = idx.len();
        let mut ata = vec![vec![0.0; k]; k];
        let mut atb = vec![0.0; k];
        for a in &rows {
            for (p, &ip) in idx.iter().enumerate() {
                atb[p] += a[ip];
                for (q, &iq) in idx.iter().enumerate() {
                    ata[p][q] += a[ip] * a[iq];
                }
            }
        }
        let Some(inv) = crate::fusion::ukf::inverse(&ata) else {
            continue;
        };
        let sol: Vec<f64> = (0..k)
            .map(|p| (0..k).map(|q| inv[p][q] * atb[q]).sum())
            .collect();
        if sol.iter().any(|v| !(v.is_finite() && *v >= 0.0)) {
            continue;
        }
        let mut x = [0.0; 4];
        for (p, &ip) in idx.iter().enumerate() {
            x[ip] = sol[p];
        }
        let cost: f64 = rows
            .iter()
            .map(|a| {
                let f: f64 = (0..4).map(|j| a[j] * x[j]).sum();
                (f - 1.0) * (f - 1.0)
            })
            .sum();
        if best.as_ref().is_none_or(|(_, c)| cost < *c) {
            best = Some((x, cost));
        }
    }
    let (x, _) = best?;
    Some((
        crate::spoof_monitors::ClockNoiseEstimate {
            r: x[0],
            q_wf: x[1],
            q_rw: x[2],
            q_drift: x[3],
        },
        curve,
    ))
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    /// White FM of level `a1` at 1 s plus random-walk FM `q_rw` plus a drift `d` (1/s), 1 s grid.
    fn clock(n: usize, a1: f64, q_rw: f64, d: f64, seed: u64) -> PhaseSeries {
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let g = Normal::new(0.0, 1.0).unwrap();
        let (mut x, mut f) = (0.0, 0.0);
        let mut v = Vec::with_capacity(n);
        for i in 0..n {
            v.push(x + 0.5 * d * (i * i) as f64);
            f += q_rw.sqrt() * g.sample(&mut rng);
            x += a1 * g.sample(&mut rng) + f;
        }
        PhaseSeries {
            t0: 0.0,
            tau0: 1.0,
            x: v,
        }
    }

    #[test]
    fn a_stationary_clock_card_predicts_its_own_held_out_two_thirds() {
        let s = clock(60_000, 1e-11, 1e-26, 0.0, 7);
        let (fit, held) = s.split_thirds();
        let card = DeviceCard::fit_phase("synthetic", &fit).unwrap();
        assert!(card.fit_points.len() >= 5);
        let sc = score_held_out(&card, &held, 1.5);
        assert!(sc.pass, "{:?}", sc.points);
        // White FM is identified at short tau.
        assert_eq!(card.fit_points[0].alpha, Some(0));
    }

    #[test]
    fn the_card_carries_the_drift() {
        let s = clock(30_000, 1e-11, 0.0, 2e-15, 8);
        let (fit, _) = s.split_thirds();
        let card = DeviceCard::fit_phase("drift", &fit).unwrap();
        assert!(
            (card.drift_per_s - 2e-15).abs() / 2e-15 < 0.05,
            "{}",
            card.drift_per_s
        );
        let t = 1000.0;
        let noise = card.noise_allan_variance(t);
        assert!(card.adev(t) > noise.sqrt());
    }

    #[test]
    fn a_wrong_card_fails_the_bar() {
        let s = clock(60_000, 1e-11, 0.0, 0.0, 9);
        let (fit, held) = s.split_thirds();
        let mut card = DeviceCard::fit_phase("halved", &fit).unwrap();
        card.h_0 *= 0.25;
        card.white_pm_var *= 0.25;
        card.h_m1 *= 0.25;
        card.h_m2 *= 0.25;
        assert!(!score_held_out(&card, &held, 1.5).pass);
    }

    #[test]
    fn curve_cards_and_conversions() {
        let pts: Vec<(f64, f64, f64)> = [1.0, 2.0, 4.0, 8.0]
            .iter()
            .map(|&t: &f64| (t, 4e-16 / t.sqrt(), 100.0))
            .collect();
        let card = DeviceCard::fit_curve("curve", &pts).unwrap();
        let sc = score_curve(&card, &[(16.0, 1e-16), (32.0, 4e-16 / 32f64.sqrt())], 1.5);
        assert!(sc.pass, "{:?}", sc.points);
        assert!((card.clock_noise().q_wf - 0.5 * card.h_0).abs() < 1e-40);
        let ext = card.clock_model_ext(1.0, 1e4);
        assert!((ext.q_wf - 0.5 * card.h_0).abs() < 1e-40);
        assert!(DeviceCard::fit_curve("short", &pts[..2]).is_err());
    }

    #[test]
    fn pooled_hadamard_recovers_white_fm_over_split_records() {
        let a = clock(4000, 2e-9, 0.0, 0.0, 10);
        let b = clock(4000, 2e-9, 0.0, 0.0, 11);
        let (n, curve) = pooled_hadamard_noise(&[a, b]).unwrap();
        assert!(curve.len() >= 6);
        assert!((n.q_wf - 4e-18).abs() / 4e-18 < 0.25, "{n:?}");
    }
}
