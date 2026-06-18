// SPDX-License-Identifier: AGPL-3.0-only
//! **Joint one-way + two-way radiometric fusion** on a Low-Mars-Orbit arc — the LightShip/MARCONI
//! crux that D3.1 builds (calibrate-then-coast).
//!
//! The physics under test (see `kshana::deepspace_od` D3.1 docs):
//!
//!   * **Two-way** (coherent transponder) observables are referenced to the *ground* clock and are
//!     **independent of the onboard oscillator** — they pin the orbit cleanly. But a real deep-space
//!     link gets two-way only during scheduled tracking passes; between passes a two-way-only
//!     solution must coast on the dynamics alone and its orbit error grows.
//!   * **One-way** (the spacecraft transmits on its OWN clock — a MARCONI MAFS / GNSS-like
//!     broadcast) observables are continuous but carry the onboard clock error: a one-way range is
//!     biased by `c·(clock phase)`, a one-way Doppler by `c·(clock fractional frequency)`. A
//!     one-way-only solution suffers the orbit↔clock degeneracy — the clock phase looks like a
//!     common range offset — and is biased.
//!   * **Fusion** gets the best of both: the two-way passes pin the orbit clock-independently; the
//!     concurrent one-way data, with the orbit known, **calibrates the onboard clock**; between
//!     passes the calibrated one-way data keeps the orbit alive, with the coast error growth
//!     **bounded by the clock's Allan stability** (the D2.3 profile).
//!
//! ## Honest scope
//!
//! A synthetic closed-loop recovery: the truth orbit and the filter's dynamics use the same Mars
//! propagator, the observable geometry is the one the filter inverts, and the injected onboard-clock
//! error is a deterministic phase/frequency trajectory the filter estimates as its three clock
//! states. It validates the **fusion machinery** — the joint orbit+clock SRIF, the two-way
//! (clock-free) vs one-way (clock-coupled) partials, the calibrate-then-coast behaviour — not the
//! absolute fidelity of the Mars force model. No observation value or reference number is invented:
//! every truth quantity is propagated by the shipped Mars dynamics / the injected clock model.

use kshana::body::Body;
use kshana::clock_state::ClockClass;
use kshana::deepspace_od::{
    range_observable, range_rate_observable, FusedMeas, FusionConfig, FusionOd, FusionStep,
    MeasWay, RadiometricKind, ReducedDynamicConfig,
};
use kshana::integrator::Tolerance;
use kshana::mars_atmos::MARS_RE;
use kshana::mars_frame::{iau_mars_rotation, inertial_to_bodyfixed};
use kshana::precession::{mat_vec, transpose};
use kshana::precise_od::{empirical_accel, propagate, EmpiricalAccel, ForceModel};
use kshana::timegeo::C_M_PER_S;

type Vec3 = [f64; 3];

// ---------------------------------------------------------------------------------------------
// A Mars-centred force model (the same in-test trait impl `mars_lmo_od.rs` uses: the crate ships
// the Earth and Moon precise models; this exercises the precise-OD `ForceModel` trait the fusion
// SRIF is generic over against the Mars body). Gravity is `Body::mars_gmm3` in the body-fixed frame.
// ---------------------------------------------------------------------------------------------

#[derive(Clone, Debug)]
struct MarsForceModel {
    body: Body,
    epoch_jd_tdb: f64,
    empirical: Option<EmpiricalAccel>,
}

impl MarsForceModel {
    fn gmm3(nmax: usize, epoch_jd_tdb: f64) -> Self {
        Self {
            body: Body::mars_gmm3(nmax),
            epoch_jd_tdb,
            empirical: None,
        }
    }
}

impl ForceModel for MarsForceModel {
    fn accel_rv(&self, t: f64, r: Vec3, _v: Vec3) -> Vec3 {
        let jd = self.epoch_jd_tdb + t / kshana::timescales::SECONDS_PER_DAY;
        let field = self
            .body
            .gravity
            .as_ref()
            .expect("mars_gmm3 populates the gravity field");
        let r_bf = inertial_to_bodyfixed(r, &self.body, jd);
        let a_bf = field.acceleration(r_bf);
        let m = iau_mars_rotation(&self.body, jd);
        let mut a = mat_vec(&transpose(&m), a_bf);
        if let Some(emp) = self.empirical {
            let p = empirical_accel(&emp, r, [0.0; 3]);
            a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        }
        a
    }

    fn cr(&self) -> f64 {
        1.0
    }
    fn set_cr(&mut self, _cr: f64) {}
    fn set_empirical(&mut self, empirical: Option<EmpiricalAccel>) {
        self.empirical = empirical;
    }
}

// ---------------------------------------------------------------------------------------------
// Scenario helpers.
// ---------------------------------------------------------------------------------------------

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn tol() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    }
}

/// A ~400 km circular Low-Mars-Orbit reference state, inclined ~60°. Areocentric inertial, m / m·s⁻¹.
fn lmo_state() -> (Vec3, Vec3) {
    let mars = Body::mars();
    let r_orbit = mars.re + 400.0e3;
    let vc = (mars.mu / r_orbit).sqrt();
    let inc = 60.0_f64.to_radians();
    let r0 = [r_orbit, 0.0, 0.0];
    let v0 = [0.0, vc * inc.cos(), vc * inc.sin()];
    (r0, v0)
}

/// Two fixed inertial tracking stations (a DSN/ESTRACK proxy: well-separated lines of sight).
fn stations() -> [(Vec3, Vec3); 2] {
    let d = 3.0 * MARS_RE;
    [
        ([0.6 * d, -0.7 * d, 0.4 * d], [0.0, 0.0, 0.0]),
        ([-0.5 * d, 0.6 * d, 0.6 * d], [0.0, 0.0, 0.0]),
    ]
}

/// Box–Muller Gaussian pseudo-noise (no `rand` dep — reproducible across runs/platforms).
fn gaussian_noise(seed: u64, amp: f64) -> impl FnMut() -> f64 {
    let mut s = seed.wrapping_mul(2_862_933_555_777_941_757).wrapping_add(1);
    let mut next_u = move || {
        s = s.wrapping_mul(6_364_136_223_846_793_005).wrapping_add(1);
        (((s >> 11) as f64) / ((1u64 << 53) as f64)).clamp(1e-15, 1.0 - 1e-15)
    };
    move || {
        let u1 = next_u();
        let u2 = next_u();
        amp * (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

/// The injected **onboard-clock truth**: phase(s) and fractional-frequency(1/s) at each epoch.
/// The frequency does a small random walk about a constant offset (a real oscillator's
/// frequency wander); the phase is the running integral of the frequency. The arrays are one entry
/// per epoch in ascending time order — the calibrate-then-coast quantity the one-way data carries.
struct ClockTruth {
    phase: Vec<f64>,
    freq: Vec<f64>,
}

/// Generate the clock truth for `times`: a constant frequency offset `freq0` (1/s) plus a small
/// random-walk wander of per-step 1σ `rw_step`, integrated to phase. Deterministic from `seed`.
fn clock_truth(times: &[f64], freq0: f64, rw_step: f64, seed: u64) -> ClockTruth {
    let mut rw = gaussian_noise(seed, rw_step);
    let mut phase = 0.0;
    let mut freq = freq0;
    let mut t_prev = 0.0;
    let mut phases = Vec::with_capacity(times.len());
    let mut freqs = Vec::with_capacity(times.len());
    for &t in times {
        let dt = t - t_prev;
        if dt > 0.0 {
            // Phase integrates the (start-of-step) frequency; then the frequency wanders.
            phase += freq * dt;
            freq += rw();
            t_prev = t;
        }
        phases.push(phase);
        freqs.push(freq);
    }
    ClockTruth {
        phase: phases,
        freq: freqs,
    }
}

fn truth_states(fm: &MarsForceModel, r0: Vec3, v0: Vec3, times: &[f64]) -> Vec<(Vec3, Vec3)> {
    let mut out = Vec::with_capacity(times.len());
    let mut t_prev = 0.0;
    let (mut r, mut v) = (r0, v0);
    for &t in times {
        if t > t_prev {
            let (rf, vf) = propagate(fm, r, v, t - t_prev, &tol());
            r = rf;
            v = vf;
            t_prev = t;
        }
        out.push((r, v));
    }
    out
}

/// Position-error RMS of the recovered steps against truth, over `[start_frac, 1.0]` of the arc
/// (the converged / coast regime). Steps and truth are index-matched (one per epoch, same order).
fn pos_rms_tail(steps: &[FusionStep], truth: &[(Vec3, Vec3)], start_frac: f64) -> f64 {
    let n = steps.len().min(truth.len());
    let start = ((n as f64) * start_frac) as usize;
    let mut sum = 0.0;
    let mut cnt = 0usize;
    for k in start..n {
        let d = [
            steps[k].r[0] - truth[k].0[0],
            steps[k].r[1] - truth[k].0[1],
            steps[k].r[2] - truth[k].0[2],
        ];
        sum += d[0] * d[0] + d[1] * d[1] + d[2] * d[2];
        cnt += 1;
    }
    (sum / cnt.max(1) as f64).sqrt()
}

/// The fusion config for the LMO arc: a lightly reduced-dynamic orbit tuning and the onboard
/// clock's process noise from its [`ClockClass`] Allan profile.
fn fusion_config(class: ClockClass) -> FusionConfig {
    let base = ReducedDynamicConfig {
        dynamic_tightness: 0.1,
        emp_correlation_time: 4.0e2,
        emp_process_sigma_max: 5.0e-7,
        sigma_pos: 5.0e3, // 5 km a-priori position
        sigma_vel: 5.0,   // 5 m/s a-priori velocity
        sigma_emp: 5.0e-6,
        tol: tol(),
    };
    FusionConfig::from_clock_class(base, class)
}

/// Build the mixed observation track: **one-way** range + Doppler at every epoch from every
/// station (continuous, clock-biased by the truth clock), and **two-way** range + Doppler only at
/// epochs whose index falls inside one of the `pass_windows` (clock-free). Independent Gaussian
/// measurement noise at the DSN-class sigmas. Returns the full mixed series.
#[allow(clippy::too_many_arguments)]
fn mixed_track(
    truth: &[(Vec3, Vec3)],
    times: &[f64],
    stas: &[(Vec3, Vec3)],
    clock: &ClockTruth,
    pass_windows: &[(usize, usize)],
    range_sigma: f64,
    doppler_sigma: f64,
) -> Vec<FusedMeas> {
    let in_pass = |k: usize| pass_windows.iter().any(|&(a, b)| k >= a && k < b);
    let mut rng_r1 = gaussian_noise(0x0_1A41E, range_sigma); // one-way range
    let mut rng_d1 = gaussian_noise(0x1_1D0FF, doppler_sigma); // one-way Doppler
    let mut rng_r2 = gaussian_noise(0x2_2A41E, range_sigma); // two-way range
    let mut rng_d2 = gaussian_noise(0x3_2D0FF, doppler_sigma); // two-way Doppler
    let mut obs = Vec::new();
    for (k, (&t, (r, v))) in times.iter().zip(truth).enumerate() {
        let cphase = clock.phase[k];
        let cfreq = clock.freq[k];
        for &(sta_pos, sta_vel) in stas {
            let rho = range_observable(*r, sta_pos).0;
            let rho_dot = range_rate_observable(*r, *v, sta_pos, sta_vel).0;
            // One-way (continuous): biased by the onboard clock (c·phase on range, c·freq on Doppler).
            obs.push(FusedMeas {
                t,
                way: MeasWay::OneWay,
                kind: RadiometricKind::Range,
                station_pos: sta_pos,
                station_vel: sta_vel,
                value: rho + C_M_PER_S * cphase + rng_r1(),
                sigma: range_sigma,
            });
            obs.push(FusedMeas {
                t,
                way: MeasWay::OneWay,
                kind: RadiometricKind::RangeRate,
                station_pos: sta_pos,
                station_vel: sta_vel,
                value: rho_dot + C_M_PER_S * cfreq + rng_d1(),
                sigma: doppler_sigma,
            });
            // Two-way (passes only): clock-free.
            if in_pass(k) {
                obs.push(FusedMeas {
                    t,
                    way: MeasWay::TwoWay,
                    kind: RadiometricKind::Range,
                    station_pos: sta_pos,
                    station_vel: sta_vel,
                    value: rho + rng_r2(),
                    sigma: range_sigma,
                });
                obs.push(FusedMeas {
                    t,
                    way: MeasWay::TwoWay,
                    kind: RadiometricKind::RangeRate,
                    station_pos: sta_pos,
                    station_vel: sta_vel,
                    value: rho_dot + rng_d2(),
                    sigma: doppler_sigma,
                });
            }
        }
    }
    obs
}

// ---------------------------------------------------------------------------------------------
// The tests.
// ---------------------------------------------------------------------------------------------

/// **Fusion beats either alone.** On a Mars-LMO arc with a two-way *gap* (two-way only during
/// scheduled passes, one-way continuous and clock-biased), the fused solution's converged position
/// RMS is strictly below the better of the two single-class solutions:
///
///   * **two-way-only** degrades across the gap (no measurements between passes ⇒ the orbit coasts
///     on the dynamics alone and its error grows);
///   * **one-way-only** is biased by the orbit↔clock degeneracy (the clock phase looks like a
///     common range offset, so the recovered orbit absorbs part of the clock error);
///   * **fusion** uses the two-way passes to pin the orbit clock-independently and the one-way data
///     to calibrate the clock and coast between passes — the best of both.
#[test]
fn fusion_beats_either_alone() {
    let epoch = 2_459_580.5;
    let nmax = 4;
    let fm = MarsForceModel::gmm3(nmax, epoch);
    let (r0, v0) = lmo_state();

    // ~3 orbits at 30 s cadence.
    let period =
        std::f64::consts::TAU * ((Body::mars().re + 400.0e3).powi(3) / Body::mars().mu).sqrt();
    let arc = 3.0 * period;
    let cadence = 30.0;
    let n = (arc / cadence) as usize;
    let times: Vec<f64> = (1..=n).map(|k| k as f64 * cadence).collect();

    let truth = truth_states(&fm, r0, v0, &times);
    let stas = stations();

    // Onboard USO-class clock: a constant ~5e-12 fractional-frequency offset with a small wander.
    // The constant offset is the dominant one-way bias the fusion must calibrate out via two-way.
    let clock = clock_truth(&times, 5.0e-12, 2.0e-14, 0xC10C);

    // Two-way passes only in the first ~25% and a short window at ~60% of the arc; one-way is
    // continuous. The long stretch with no two-way is where two-way-only degrades.
    let p1 = (0, n / 4);
    let p2 = (3 * n / 5, 3 * n / 5 + n / 12);
    let pass_windows = [p1, p2];

    let range_sigma = 1.0;
    let doppler_sigma = 1.0e-4;
    let mixed = mixed_track(
        &truth,
        &times,
        &stas,
        &clock,
        &pass_windows,
        range_sigma,
        doppler_sigma,
    );

    // Split the mixed series into the single-class subsets.
    let two_way_only: Vec<FusedMeas> = mixed
        .iter()
        .copied()
        .filter(|m| m.way == MeasWay::TwoWay)
        .collect();
    let one_way_only: Vec<FusedMeas> = mixed
        .iter()
        .copied()
        .filter(|m| m.way == MeasWay::OneWay)
        .collect();

    // Same km-level initial perturbation for every run.
    let r0_guess = [r0[0] + 2.0e3, r0[1] - 1.5e3, r0[2] + 1.0e3];
    let v0_guess = [v0[0] + 2.0, v0[1] - 1.5, v0[2] + 1.0];

    let cfg = fusion_config(ClockClass::Uso);
    let run = |obs: &[FusedMeas]| {
        FusionOd::new(fm.clone(), cfg)
            .run(r0_guess, v0_guess, obs)
            .expect("fusion run")
    };

    let fused = run(&mixed);
    let tw = run(&two_way_only);
    let ow = run(&one_way_only);

    // RMS over the converged back half of the arc (covers the long two-way gap).
    let rms_fused = pos_rms_tail(&fused.steps, &truth, 0.5);
    let rms_tw = pos_rms_tail(&tw.steps, &truth, 0.5);
    let rms_ow = pos_rms_tail(&ow.steps, &truth, 0.5);

    println!(
        "fusion_beats_either_alone: fused = {rms_fused:.3} m, two-way-only = {rms_tw:.3} m, \
         one-way-only = {rms_ow:.3} m (min(single) = {:.3} m)",
        rms_tw.min(rms_ow)
    );

    // All runs stayed covariance-PD.
    assert!(
        fused.covariance_pd_throughout
            && tw.covariance_pd_throughout
            && ow.covariance_pd_throughout,
        "covariance positivity lost in one of the fusion runs"
    );

    // The headline: fusion beats the better of the two single-class solutions.
    assert!(
        rms_fused < rms_tw.min(rms_ow),
        "fusion {rms_fused:.3} m did not beat min(two-way {rms_tw:.3} m, one-way {rms_ow:.3} m)"
    );
}

/// **Calibrate, then coast.** A two-way pass at the start (with concurrent one-way) calibrates the
/// onboard clock; then the filter coasts on one-way data only across a long gap. Two things must
/// hold:
///
///   1. the calibrated clock-frequency estimate matches the injected truth **within its covariance**
///      (the two-way pass broke the orbit↔clock degeneracy, so the one-way data could pin the clock);
///   2. the orbit error growth across the one-way-only coast is **bounded and consistent with the
///      clock's Allan stability** — it tracks a `c·σ_y·Δt`-scale, not a divergence.
#[test]
fn clock_calibrate_then_coast() {
    let epoch = 2_459_580.5;
    let nmax = 4;
    let fm = MarsForceModel::gmm3(nmax, epoch);
    let (r0, v0) = lmo_state();

    let period =
        std::f64::consts::TAU * ((Body::mars().re + 400.0e3).powi(3) / Body::mars().mu).sqrt();
    let arc = 3.0 * period;
    let cadence = 30.0;
    let n = (arc / cadence) as usize;
    let times: Vec<f64> = (1..=n).map(|k| k as f64 * cadence).collect();

    let truth = truth_states(&fm, r0, v0, &times);
    let stas = stations();

    // USO-class onboard clock: constant 5e-12 offset, small wander.
    let freq0 = 5.0e-12;
    let clock = clock_truth(&times, freq0, 2.0e-14, 0xCA11B);

    // A single two-way pass in the first ~30% (the calibration pass); one-way continuous after.
    let cal_end = (3 * n) / 10;
    let pass_windows = [(0usize, cal_end)];

    let range_sigma = 1.0;
    let doppler_sigma = 1.0e-4;
    let mixed = mixed_track(
        &truth,
        &times,
        &stas,
        &clock,
        &pass_windows,
        range_sigma,
        doppler_sigma,
    );

    let r0_guess = [r0[0] + 2.0e3, r0[1] - 1.5e3, r0[2] + 1.0e3];
    let v0_guess = [v0[0] + 2.0, v0[1] - 1.5, v0[2] + 1.0];

    let cfg = fusion_config(ClockClass::Uso);
    let run = FusionOd::new(fm.clone(), cfg)
        .run(r0_guess, v0_guess, &mixed)
        .expect("fusion run");

    assert!(
        run.covariance_pd_throughout,
        "factored covariance lost positive-definiteness during the calibrate-then-coast arc"
    );

    // --- (1) The calibrated clock-frequency estimate matches truth within covariance. ---
    // Take the step at the end of the calibration pass (the clock is freshly calibrated there).
    let cal_step = &run.steps[cal_end - 1];
    let freq_truth = clock.freq[cal_end - 1];
    let freq_err = (cal_step.clock[1] - freq_truth).abs();
    let freq_sigma = cal_step.clock_freq_sigma;
    println!(
        "calibrate: clock-freq est = {:.4e}, truth = {:.4e}, err = {:.3e}, 1σ = {:.3e} \
         (err/σ = {:.2})",
        cal_step.clock[1],
        freq_truth,
        freq_err,
        freq_sigma,
        freq_err / freq_sigma.max(1e-30)
    );
    // The estimate is consistent with its own uncertainty (inside ~3σ) — an honest calibration.
    assert!(
        freq_err <= 3.0 * freq_sigma + 1e-15,
        "calibrated clock-freq {:.4e} not within 3σ ({:.3e}) of truth {:.4e} (err {:.3e})",
        cal_step.clock[1],
        freq_sigma,
        freq_truth,
        freq_err
    );
    // And it is a real calibration: the recovered offset is close to the injected 5e-12, not zero.
    assert!(
        (cal_step.clock[1] - freq0).abs() < 0.5 * freq0,
        "clock-freq not meaningfully calibrated toward the injected offset: {:.4e} vs {freq0:.4e}",
        cal_step.clock[1]
    );

    // --- (2) The one-way-only coast error is bounded by the clock Allan stability scale. ---
    // Position error just after the pass (calibrated) vs at the end of the long one-way coast.
    let err_at = |k: usize| -> f64 {
        norm([
            run.steps[k].r[0] - truth[k].0[0],
            run.steps[k].r[1] - truth[k].0[1],
            run.steps[k].r[2] - truth[k].0[2],
        ])
    };
    let err_post_cal = err_at(cal_end - 1);
    let err_end = err_at(n - 1);
    let dt_gap = times[n - 1] - times[cal_end - 1];

    // The clock-stability scale of the coast: a USO frequency uncertainty σ_y mapped to a
    // line-of-sight velocity error c·σ_y, integrated over the gap, gives a position-error scale
    // c·σ_y·Δt. Use the post-calibration freq 1σ as σ_y. A generous ceiling (×100) allows for the
    // orbit-geometry projection and the small frequency wander, while still being a finite,
    // physically-anchored bound that a divergence would blow through.
    let allan_scale = C_M_PER_S * freq_sigma * dt_gap;
    let ceiling = (100.0 * allan_scale).max(50.0); // floor at 50 m so the bound is never vacuous
    println!(
        "coast: err post-cal = {err_post_cal:.3} m, err end = {err_end:.3} m, \
         Δt_gap = {dt_gap:.0} s, c·σ_y·Δt = {allan_scale:.3} m, ceiling = {ceiling:.3} m"
    );
    assert!(
        err_end < ceiling,
        "one-way coast error {err_end:.3} m exceeded the clock-stability ceiling {ceiling:.3} m \
         (c·σ_y·Δt = {allan_scale:.3} m) — the coast diverged rather than tracking the clock"
    );
    // The coast is bounded, not divergent: the end error is within a small multiple of the
    // post-calibration error (a divergence would be orders of magnitude larger).
    assert!(
        err_end < (err_post_cal.max(10.0)) * 20.0,
        "one-way coast diverged: end {err_end:.3} m vs post-cal {err_post_cal:.3} m"
    );
}
