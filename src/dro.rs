// SPDX-License-Identifier: AGPL-3.0-only
//! Planar distant-retrograde-orbit (DRO) seeder for the Earth–Moon CR3BP (paper P6, L29).
//!
//! A **distant retrograde orbit** is a planar, stable, *periodic* orbit about the Moon in
//! the Earth–Moon circular restricted three-body problem, retrograde in the rotating frame
//! (its angular momentum about the Moon has the retrograde sign). It is a periodic solution
//! of the *three-body* dynamics — a two-body Kepler ellipse cannot represent it — so it is
//! produced the same way [`crate::cr3bp`] produces halo/NRHO orbits: **single-shooting
//! differential correction** against the periodicity/symmetry constraint, driven by the
//! finite-difference-validated CR3BP variational state-transition matrix.
//!
//! A planar DRO is symmetric about the x-axis and crosses it *perpendicularly* (`ẋ = 0` at
//! `y = 0`). The corrector therefore starts from a perpendicular x-axis crossing
//! `s₀ = [x₀, 0, 0, ẏ₀]`, holds the crossing abscissa `x₀` fixed (the family parameter),
//! and varies the single free velocity `ẏ₀` so that the *next* x-axis crossing (half a
//! period later) is again perpendicular — `ẋ = 0` there. That is the mirror condition of a
//! planar orbit symmetric about the x-axis; enforcing it makes the full-period return
//! close. It is the exact planar analogue of [`crate::cr3bp::differential_correct_halo`]
//! (which drives `{ẋ_f, ż_f}` to zero for a spatial halo), reduced to the one planar
//! constraint `ẋ_f = 0`.
//!
//! ## Validated vs Modelled
//! * **Validated.** The corrected orbit **closes**: propagating the corrected initial
//!   condition one full period returns the four-state to itself to a tight periodicity
//!   residual (< 1e-8 in nondimensional units), and it is **retrograde** (its angular
//!   momentum about the Moon carries the retrograde sign). Both are asserted against the
//!   crate's finite-difference-validated CR3BP flow — an independent oracle from the
//!   corrector's own STM. The STM used by the corrector is
//!   [`crate::observability_gramian::planar_state_stm`], the planar sub-block of the
//!   finite-difference-validated [`crate::cr3bp::propagate_state_stm`].
//! * **Modelled.** *Which* DROs (the chosen perilune amplitudes and phases of a
//!   constellation) is a scenario design choice, not a certified optimum.

use crate::cr3bp::{cr3bp_accel, propagate_cr3bp, Cr3bpState, EARTH_MOON_DIST_KM, EARTH_MOON_MU};
use crate::observability_gramian::planar_state_stm;

/// A planar CR3BP state `[x, y, ẋ, ẏ]` (rotating frame, normalised Earth–Moon units).
pub type Planar = [f64; 4];

/// A differential-corrected planar distant-retrograde orbit.
#[derive(Clone, Copy, Debug)]
pub struct DroState {
    /// The corrected initial condition at the perpendicular x-axis crossing,
    /// `[x, 0, 0, ẏ]` (rotating frame, normalised units).
    pub ic: Planar,
    /// Full orbital period (rotating-frame time units).
    pub period: f64,
    /// Perilune radius (minimum distance to the Moon over one period), km.
    pub perilune_km: f64,
    /// Periodicity residual: the four-state closure error after propagating the corrected
    /// IC one full period (nondimensional units). The Validated closure anchor.
    pub periodicity_residual: f64,
    /// Signed specific angular momentum about the Moon at the IC (`< 0` ⇒ retrograde).
    pub angular_momentum_moon: f64,
}

impl DroState {
    /// `true` when the orbit is retrograde about the Moon (angular momentum `< 0`).
    pub fn is_retrograde(&self) -> bool {
        self.angular_momentum_moon < 0.0
    }
}

/// Embed a planar state into the full 3-D CR3BP state (`z = ż = 0`).
fn embed(s: &Planar) -> Cr3bpState {
    Cr3bpState {
        r: [s[0], s[1], 0.0],
        v: [s[2], s[3], 0.0],
    }
}

/// Extract the planar `[x, y, ẋ, ẏ]` from a 3-D CR3BP state.
fn planar_of(s: &Cr3bpState) -> Planar {
    [s.r[0], s.r[1], s.v[0], s.v[1]]
}

/// Specific angular momentum about the Moon in the rotating frame:
/// `L_z = (x − (1−μ))·ẏ − y·ẋ`. Negative ⇒ retrograde (clockwise about the Moon).
fn angular_momentum_about_moon(s: &Planar, mu: f64) -> f64 {
    (s[0] - (1.0 - mu)) * s[3] - s[1] * s[2]
}

/// March forward from `s0` and return the time of the **next `y = 0` crossing** after
/// `t_min` (up to `t_max`), Newton-refined. `None` if no crossing is found.
fn next_y_crossing(
    s0: &Planar,
    mu: f64,
    t_min: f64,
    t_max: f64,
    march_steps: usize,
) -> Option<f64> {
    let n = march_steps.max(2);
    let h = t_max / n as f64;
    let mut st = embed(s0);
    let mut t = 0.0;
    for _ in 0..n {
        let prev = st;
        let t_prev = t;
        st = propagate_cr3bp(st, mu, h, 1);
        t += h;
        if t_prev > t_min && prev.r[1] * st.r[1] < 0.0 {
            // Newton on y(t) from the pre-crossing state `prev`.
            let mut dt = -prev.r[1] / prev.v[1];
            let mut tc = t_prev + dt;
            for _ in 0..40 {
                let cross = propagate_cr3bp(prev, mu, dt, 200);
                if cross.r[1].abs() < 1e-13 {
                    tc = t_prev + dt;
                    break;
                }
                dt -= cross.r[1] / cross.v[1];
                tc = t_prev + dt;
            }
            return Some(tc);
        }
    }
    None
}

/// Scan candidate perpendicular-crossing velocities `ẏ₀ < 0` (retrograde, far-side
/// crossing) at fixed `x_cross`, returning the one whose half-period crossing is closest to
/// perpendicular (`|ẋ_f|` minimal) — the differential corrector's initial guess.
fn scan_vy0(x_cross: f64, mu: f64) -> Option<f64> {
    let (lo, hi, n) = (0.30_f64, 1.05_f64, 60usize);
    let mut best: Option<f64> = None;
    let mut best_abs = f64::INFINITY;
    for k in 0..n {
        let mag = lo + (hi - lo) * k as f64 / (n as f64 - 1.0);
        let s0 = [x_cross, 0.0, 0.0, -mag];
        if let Some(tc) = next_y_crossing(&s0, mu, 0.02, 6.2, 1000) {
            let (sc, _phi) = planar_state_stm(&s0, mu, tc, 1000);
            let a = sc[2].abs();
            if a < best_abs {
                best_abs = a;
                best = Some(-mag);
            }
        }
    }
    best
}

/// Periodicity residual: four-state closure error after one full period.
fn periodicity_residual(s0: &Planar, mu: f64, period: f64, steps: usize) -> f64 {
    let end = planar_of(&propagate_cr3bp(embed(s0), mu, period, steps));
    ((end[0] - s0[0]).powi(2)
        + (end[1] - s0[1]).powi(2)
        + (end[2] - s0[2]).powi(2)
        + (end[3] - s0[3]).powi(2))
    .sqrt()
}

/// Minimum distance to the Moon over one period (km).
fn perilune_radius_km(s0: &Planar, mu: f64, period: f64, samples: usize) -> f64 {
    let n = samples.max(200);
    let h = period / n as f64;
    let mut st = embed(s0);
    let mut min_d = f64::INFINITY;
    for _ in 0..=n {
        let dx = st.r[0] - (1.0 - mu);
        let dy = st.r[1];
        let d = (dx * dx + dy * dy).sqrt();
        if d < min_d {
            min_d = d;
        }
        st = propagate_cr3bp(st, mu, h, 1);
    }
    min_d * EARTH_MOON_DIST_KM
}

/// **Differential-correct a planar DRO** whose perpendicular x-axis crossing sits at
/// abscissa `x_cross` (on the far side of the Moon, `x_cross > 1 − μ`). Holding `x_cross`
/// fixed, the single free velocity `ẏ₀` is varied by single-shooting (the planar STM at the
/// half-period crossing, reduced by the `y = 0` time constraint) until the crossing is
/// perpendicular (`ẋ_f → 0`). Returns the corrected DRO, or `None` if it does not converge.
pub fn dro_from_crossing(x_cross: f64, mu: f64, tol: f64, max_iter: usize) -> Option<DroState> {
    let mut vy0 = scan_vy0(x_cross, mu)?;
    let (t_min, t_max) = (0.02, 6.2);
    for _ in 0..max_iter {
        let s0 = [x_cross, 0.0, 0.0, vy0];
        let tc = next_y_crossing(&s0, mu, t_min, t_max, 6000)?;
        let (sc, phi) = planar_state_stm(&s0, mu, tc, 24_000);
        let (vxf, vyf) = (sc[2], sc[3]);
        if vxf.abs() < tol {
            let period = 2.0 * tc;
            let ic = s0;
            return Some(DroState {
                ic,
                period,
                perilune_km: perilune_radius_km(&ic, mu, period, 4000),
                periodicity_residual: periodicity_residual(&ic, mu, period, 48_000),
                angular_momentum_moon: angular_momentum_about_moon(&ic, mu),
            });
        }
        // Reduce the STM by the y=0 time constraint: δt = −Φ[1][3]·δẏ₀ / ẏ_f, then
        // δẋ_f = (Φ[2][3] − ẍ_f·Φ[1][3]/ẏ_f)·δẏ₀. Solve δẋ_f = −ẋ_f for δẏ₀.
        let acc = cr3bp_accel([sc[0], sc[1], 0.0], [sc[2], sc[3], 0.0], mu);
        let axf = acc[0];
        let denom = phi[2][3] - axf * phi[1][3] / vyf;
        if denom.abs() < 1e-14 {
            return None;
        }
        vy0 += -vxf / denom;
    }
    None
}

/// The planar state at phase fraction `frac ∈ [0, 1)` of the DRO's period — the corrected
/// IC propagated `frac · period` under the CR3BP flow. Used to place a constellation
/// member off the x-axis so a set of DROs spans position and velocity.
pub fn state_at(dro: &DroState, mu: f64, frac: f64, steps: usize) -> Planar {
    planar_of(&propagate_cr3bp(
        embed(&dro.ic),
        mu,
        frac * dro.period,
        steps.max(1),
    ))
}

/// **Seed a planar DRO at a prescribed perilune amplitude** (km). The achieved perilune is
/// a smooth, monotone function of the perpendicular-crossing abscissa, so a secant solve on
/// the crossing distance drives the corrected DRO's perilune to `perilune_km` (to ~km). The
/// returned orbit is the differential-corrected, retrograde, closing DRO. `None` if the
/// corrector does not converge in the search band.
pub fn seed_dro(perilune_km: f64) -> Option<DroState> {
    seed_dro_mu(perilune_km, EARTH_MOON_MU)
}

fn seed_dro_mu(perilune_km: f64, mu: f64) -> Option<DroState> {
    let correct_at = |d: f64| dro_from_crossing((1.0 - mu) + d, mu, 1e-12, 60);
    // The perilune is ≈ 0.97–0.995 of the crossing distance; seed the secant near there.
    let mut d_prev = (perilune_km / EARTH_MOON_DIST_KM) / 0.985;
    let mut orbit = correct_at(d_prev)?;
    let mut f_prev = orbit.perilune_km - perilune_km;
    let mut d_cur = d_prev * (1.0 + 0.02 * f_prev.signum());
    for _ in 0..12 {
        if f_prev.abs() <= 1.0 {
            return Some(orbit);
        }
        let cand = correct_at(d_cur)?;
        let f_cur = cand.perilune_km - perilune_km;
        let denom = f_cur - f_prev;
        let d_next = if denom.abs() > 1e-9 {
            (d_cur - f_cur * (d_cur - d_prev) / denom).max(0.02)
        } else {
            d_cur
        };
        d_prev = d_cur;
        f_prev = f_cur;
        orbit = cand;
        d_cur = d_next;
    }
    Some(orbit)
}

/// Seed a family of planar DROs at the prescribed perilune amplitudes (km), one corrected
/// retrograde DRO each. Members that fail to converge are dropped.
pub fn dro_family(perilune_km: &[f64]) -> Vec<DroState> {
    perilune_km.iter().filter_map(|&p| seed_dro(p)).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Independent closure oracle: propagate a planar IC one full period through the plain
    /// CR3BP flow (a different code path from the corrector's STM) and return the four-state
    /// return error. High, matched integration resolution.
    fn closure_residual(ic: &Planar, mu: f64, period: f64, steps: usize) -> f64 {
        let end = planar_of(&propagate_cr3bp(embed(ic), mu, period, steps));
        ((end[0] - ic[0]).powi(2)
            + (end[1] - ic[1]).powi(2)
            + (end[2] - ic[2]).powi(2)
            + (end[3] - ic[3]).powi(2))
        .sqrt()
    }

    // ── ORACLE (Validated): a corrected DRO closes AND is retrograde ─────────────
    #[test]
    fn corrected_dro_closes_and_is_retrograde() {
        let mu = EARTH_MOON_MU;
        let dro = dro_from_crossing((1.0 - mu) + 0.075, mu, 1e-12, 60)
            .expect("planar DRO correction should converge");
        // Perpendicular x-axis crossing IC: y = 0 and ẋ = 0.
        assert_eq!(dro.ic[1], 0.0);
        assert_eq!(dro.ic[2], 0.0);
        // Validated closure: the reported residual (an independent CR3BP-flow return) is
        // below the tight periodicity tolerance.
        assert!(
            dro.periodicity_residual < 1e-8,
            "DRO periodicity residual {:.3e} exceeds 1e-8",
            dro.periodicity_residual
        );
        // And it stays small at a *finer, independent* propagation resolution — the fixed
        // point is genuinely periodic, not just at its own grid.
        let indep = closure_residual(&dro.ic, mu, dro.period, 120_000);
        assert!(indep < 1e-7, "independent closure {indep:.3e} too large");
        // Retrograde about the Moon: negative angular momentum at the IC …
        assert!(dro.is_retrograde());
        assert!(dro.angular_momentum_moon < 0.0);
        // … and retrograde is *maintained* around the orbit (sampled phases).
        for k in 1..8 {
            let s = state_at(&dro, mu, k as f64 / 8.0, 20_000);
            assert!(
                angular_momentum_about_moon(&s, mu) < 0.0,
                "angular momentum turned prograde at phase {}/8",
                k
            );
        }
    }

    // ── Retrograde sign is the far-side crossing with ẏ < 0 ──────────────────────
    #[test]
    fn dro_family_spans_the_perilune_band() {
        // Two well-separated amplitudes both correct to closing, retrograde DROs whose
        // achieved perilune orders match the request (monotone family).
        let fam = dro_family(&[20_000.0, 40_000.0]);
        assert_eq!(fam.len(), 2, "both family members should converge");
        for d in &fam {
            assert!(
                d.periodicity_residual < 1e-8,
                "resid {:.3e}",
                d.periodicity_residual
            );
            assert!(d.is_retrograde());
        }
        assert!(
            fam[0].perilune_km < fam[1].perilune_km,
            "perilune order preserved: {:.0} vs {:.0}",
            fam[0].perilune_km,
            fam[1].perilune_km
        );
    }

    // ── seed_dro hits the requested perilune ─────────────────────────────────────
    #[test]
    fn seed_dro_matches_requested_perilune() {
        let dro = seed_dro(30_000.0).expect("seed_dro should converge");
        assert!(
            (dro.perilune_km - 30_000.0).abs() < 200.0,
            "achieved perilune {:.0} km off target 30000",
            dro.perilune_km
        );
        assert!(dro.periodicity_residual < 1e-8);
        assert!(dro.is_retrograde());
    }
}
