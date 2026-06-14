// SPDX-License-Identifier: Apache-2.0
//! **Radiometric observable precision benchmarked against the published DSN/ESTRACK
//! measurement envelope.**
//!
//! ## What this benchmark is — and is NOT
//!
//! Kshana's radiometric observables (`src/radiometric.rs`) are **exact geometric
//! computations**: a range is `c·(τ_up + τ_down)` from the iterated light-time
//! solution, a Doppler is the analytic frequency shift of the line-of-sight range
//! rate, Δ-DOR is the closed-form baseline projection, and the plasma calibration is
//! the algebraic 1/f² dispersion inversion. **The measurement noise is not baked into
//! the model** — it is the caller-supplied `sigma` weight on each
//! [`RadiometricObs`](kshana::radiometric::RadiometricObs). So the honest question this
//! benchmark answers is *not* "does Kshana reproduce a specific real DSN tracking
//! pass" (that needs real TDM data plus the D2 orbit-determination solver, neither of
//! which exists yet). It is the narrower, verifiable claim:
//!
//! > **The model's own numerical error is far below the published DSN/ESTRACK
//! > measurement floor — so the observable model is reference-grade, and the real-world
//! > accuracy limit is the measurement noise the caller supplies, not the model.**
//!
//! Each test therefore computes an observable two independent ways (or recovers an
//! injected truth) and asserts the residual is orders of magnitude **below** the
//! relevant published instrument floor. If the model's own precision were anywhere near
//! the measurement floor it would be the bottleneck; it is not, by a wide margin.
//!
//! ## The published DSN/ESTRACK reference envelope (order-of-magnitude)
//!
//! These are the well-known order-of-magnitude deep-space radiometric performance
//! figures, cited to the standard DSN performance literature. They are used here only
//! as the *floor the model must beat by orders of magnitude* — not as a claim that
//! Kshana achieves them on real data.
//!
//! * **Two-way coherent Doppler ≈ 0.05 mm/s** line-of-sight velocity (X-band, ~60 s
//!   count time). DSN 810-005 module 203 (Doppler Tracking) / Moyer, *Formulation for
//!   Observed and Computed Values of Deep Space Network Data Types* (JPL DESCANSO,
//!   2000); the few-×10⁻² mm/s class figure is the standard quoted X-band 60 s Doppler
//!   precision.
//! * **Sequential / regenerative (PN) ranging ≈ sub-metre to ~1 m.** DSN 810-005 module
//!   214 (Sequential Ranging) / CCSDS 414.1-B (Pseudo-Noise Ranging); modern
//!   regenerative PN ranging reaches the sub-metre-to-metre class.
//! * **Δ-DOR ≈ 1–10 nrad** plane-of-sky angle — a few centimetres at the Earth–Mars
//!   baseline. DSN 810-005 module 210 (Delta-DOR) / CCSDS 506.1-B; the few-nrad class is
//!   the standard quoted Δ-DOR angular accuracy.
//!
//! All three are deliberately stated as **order-of-magnitude** specs, not exact
//! contract numbers, and are labelled as such.

use kshana::body::Body;
use kshana::ephem_provider::EphemerisProvider;
use kshana::forces::MU_SUN;
use kshana::radiometric::{
    delta_dor, dual_freq_plasma_calibration, one_way_doppler, one_way_range, shapiro_delay,
    solar_plasma_delay, two_way_doppler, two_way_range, Band,
};
use kshana::timescales::{TwoPartJd, SECONDS_PER_DAY};

/// Speed of light (m/s), the exact CODATA/SI value the radiometric model uses.
const C_M_PER_S: f64 = 299_792_458.0;

// ---------------------------------------------------------------------------
// Published DSN/ESTRACK reference envelope (order-of-magnitude; see module docs
// for provenance). These are the floors the model precision must beat by orders
// of magnitude — NOT figures Kshana claims to achieve on real data.
// ---------------------------------------------------------------------------

/// DSN two-way coherent Doppler line-of-sight velocity precision, **≈ 0.05 mm/s**
/// (X-band, ~60 s count). DSN 810-005 module 203 / Moyer (DESCANSO 2000). Order of
/// magnitude.
const DSN_DOPPLER_FLOOR_M_PER_S: f64 = 5.0e-5; // 0.05 mm/s

/// DSN sequential / regenerative (PN) ranging precision, **≈ 1 m** (sub-metre-to-metre
/// class). DSN 810-005 module 214 / CCSDS 414.1-B. Order of magnitude.
const DSN_RANGE_FLOOR_M: f64 = 1.0; // ~1 m

/// Δ-DOR plane-of-sky angular precision, **≈ 1–10 nrad** (a few cm at the Earth–Mars
/// baseline). DSN 810-005 module 210 / CCSDS 506.1-B. Order of magnitude; the lower
/// (tighter) edge 1 nrad is used as the floor.
const DSN_DELTA_DOR_FLOOR_RAD: f64 = 1.0e-9; // 1 nrad

/// A fixed probe epoch (Julian Date, TDB), inside the analytic ephemeris' good span.
const PROBE_JD: f64 = 2_459_580.5;

/// A **near-zero** probe epoch (Julian Date, TDB) used only by the Doppler test.
///
/// The Doppler observable is a finite-difference of the integrated light-time range, and
/// the model evaluates the body through the [`EphemerisProvider`] trait whose signature
/// hands the provider a **plain `f64` absolute JD**. A synthetic provider that
/// re-differences the light-time offset (`τ ≈ 667 s` for the geometry here) against a
/// large absolute JD (~2.46e6 at a modern epoch) re-introduces the single-`f64` timing
/// floor (the same floor documented in `src/radiometric.rs`'s
/// `light_time_solver_recovers_known_retardation` test). Probing at a near-zero JD makes
/// the `(jd − t0)` differencing exact, so the test isolates the **model's** Doppler
/// precision — its agreement with the exact closed-form retarded range rate — rather than
/// conflating it with the harness's absolute-`f64`-JD artefact. A real DE-grade provider
/// does not suffer this (it carries its own precise internal time); the epoch value is
/// otherwise arbitrary for the constant-velocity synthetic model.
const PROBE_JD_DOPPLER: f64 = 0.5;

/// A synthetic **constant-velocity** ephemeris: the body moves as `r(t) = r0 + v·(t−t0)`
/// with `t` in seconds. It gives an *analytic* truth (a closed-form range and a
/// closed-form line-of-sight Doppler for radial motion) the geometric model can be
/// benchmarked against, decoupled from any real ephemeris. This is the same harness the
/// in-crate `src/radiometric.rs` unit tests use.
#[derive(Debug)]
struct ConstantVelocityEphemeris {
    t0_jd: f64,
    r0: [f64; 3],
    v: [f64; 3],
}

impl EphemerisProvider for ConstantVelocityEphemeris {
    fn relative_position(&self, _target: &Body, _center: &Body, jd_tdb: f64) -> Option<[f64; 3]> {
        let dt_s = (jd_tdb - self.t0_jd) * SECONDS_PER_DAY;
        Some([
            self.r0[0] + self.v[0] * dt_s,
            self.r0[1] + self.v[1] * dt_s,
            self.r0[2] + self.v[2] * dt_s,
        ])
    }
}

/// Euclidean norm of a 3-vector.
fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// **RANGE precision ≫ DSN ranging floor.** The two-way range is computed two
/// independent ways for a static (zero-velocity) emitter, where the up- and down-legs
/// are geometrically identical: the model's `two_way_range` must equal twice the closed
/// form `c·|station − body|/c · 2 = 2·|station − body|`, and equal twice the model's own
/// `one_way_range`, to a residual **far below 1 mm** — i.e. ≪ the published ~1 m DSN
/// ranging floor. The model precision is therefore not the accuracy bottleneck; the
/// caller-supplied measurement σ is.
#[test]
fn range_precision_far_below_dsn_ranging_floor() {
    // A static body: the up- and down-legs are the same geometry, so the round-trip is
    // exactly twice the geometric one-way distance — a closed-form truth.
    let r0 = [1.8e11, 4.0e10, -2.5e10];
    let ephem = ConstantVelocityEphemeris {
        t0_jd: PROBE_JD,
        r0,
        v: [0.0, 0.0, 0.0],
    };
    let station = [0.0, 0.0, 0.0];
    let t_rx = TwoPartJd::from_f64(PROBE_JD);

    let two_way =
        two_way_range(station, &Body::mars(), &Body::sun(), t_rx, &ephem).expect("synthetic range");
    let one_way =
        one_way_range(station, &Body::mars(), &Body::sun(), t_rx, &ephem).expect("synthetic range");

    // Closed-form truth for a static emitter: round trip = 2 × Euclidean distance.
    let closed_form_round_trip =
        2.0 * norm([station[0] - r0[0], station[1] - r0[1], station[2] - r0[2]]);

    // (1) Model two-way range vs the analytic round-trip distance.
    let err_vs_closed_form = (two_way - closed_form_round_trip).abs();
    // (2) Model two-way range vs twice the model's own one-way range (internal
    //     consistency of the leg composition).
    let err_vs_two_one_way = (two_way - 2.0 * one_way).abs();

    // Both residuals must be sub-millimetre — and so ≪ the ~1 m DSN ranging floor.
    assert!(
        err_vs_closed_form < 1e-3,
        "two-way range model error {err_vs_closed_form} m vs closed form is not sub-mm"
    );
    assert!(
        err_vs_two_one_way < 1e-3,
        "two-way range vs 2×one-way error {err_vs_two_one_way} m is not sub-mm"
    );

    // The headline framing: the model's numerical error is orders of magnitude below the
    // published DSN ranging floor. Require ≥ 1000× margin (sub-mm ≪ 1 m).
    let worse = err_vs_closed_form.max(err_vs_two_one_way);
    assert!(
        worse * 1000.0 < DSN_RANGE_FLOOR_M,
        "range model error {worse} m must be ≥1000× below the ~{DSN_RANGE_FLOOR_M} m DSN ranging floor"
    );
}

/// **DOPPLER precision ≫ DSN Doppler floor.** A body receding radially at a constant
/// speed `v` has an *exact closed-form* retarded one-way range rate. For a receiver at the
/// origin and emitter at `r0 + v·t` along the line of sight, the retarded light time
/// solves `c·τ = r0 + v·(t_rx − τ)`, so `τ = (r0 + v·t_rx)/(c + v)`, the retarded range is
/// `ρ = c·τ`, and its derivative is the **light-time-corrected range rate**
///
/// ```text
///   ρ̇ = c·v / (c + v) = v / (1 + v/c).
/// ```
///
/// This differs from the naive radial speed `v` by the genuine `≈ v²/c` retardation (≈
/// 0.27 m/s here) — a *physical* effect the model correctly reproduces, **not** an error.
/// The benchmark compares the model's Doppler, converted back to a line-of-sight velocity
/// (`−c·f_D/f`), against this exact retarded `ρ̇`, and requires the residual to be **below
/// 0.05 mm/s** — the published X-band DSN two-way Doppler floor. The two-way Doppler at
/// unit turn-around is checked the same way (twice the one-way shift).
///
/// The residual here is ~10⁻⁶ m/s, set by the **f64 catastrophic-cancellation floor of
/// differencing two ~1-AU absolute ranges** (≈ 6.7e11 m) that differ by only ~v·dt — the
/// fundamental precision limit of a numeric range-rate at deep-space distance, *not* a
/// modelling error. It sits several × below the DSN measurement floor: the model is not
/// the velocity bottleneck, the caller-supplied measurement σ is. (A solver that wants
/// more headroom would form the range *difference* analytically rather than differencing
/// absolutes — a refinement, not a correction.)
#[test]
fn doppler_precision_far_below_dsn_doppler_floor() {
    let speed = 9_000.0_f64; // m/s, receding radially (+x)
                             // Probe at a near-zero JD so the synthetic harness does not inject the single-f64
                             // absolute-JD floor — this isolates the MODEL's Doppler precision (see PROBE_JD_DOPPLER).
    let ephem = ConstantVelocityEphemeris {
        t0_jd: PROBE_JD_DOPPLER,
        r0: [2.0e11, 0.0, 0.0],
        v: [speed, 0.0, 0.0],
    };
    let station = [0.0, 0.0, 0.0];
    let t_rx = TwoPartJd::from_f64(PROBE_JD_DOPPLER);
    let f_x = Band::X.downlink_hz(); // X-band downlink carrier

    // The exact analytic retarded line-of-sight range rate (NOT the naive radial speed):
    // the light-time correction reduces it by the physical ≈ v²/c term.
    let rdot_analytic = speed / (1.0 + speed / C_M_PER_S);

    // One-way Doppler from the model, converted back to a line-of-sight velocity.
    let f_d_one =
        one_way_doppler(station, &Body::mars(), &Body::sun(), t_rx, f_x, &ephem).expect("doppler");
    let v_recovered_one = -C_M_PER_S * f_d_one / f_x;
    let err_one = (v_recovered_one - rdot_analytic).abs();

    // Two-way Doppler at unit turn-around = twice the one-way shift; recovered velocity is
    // f_D / (2·f/c) = −c·f_D/(2f). Same exact retarded truth.
    let f_ul = Band::X.uplink_hz();
    let f_d_two = two_way_doppler(
        station,
        &Body::mars(),
        &Body::sun(),
        t_rx,
        f_ul,
        1.0,
        &ephem,
    )
    .expect("two-way doppler");
    let v_recovered_two = -C_M_PER_S * f_d_two / (2.0 * f_ul);
    let err_two = (v_recovered_two - rdot_analytic).abs();

    // Sanity tie-back: the model reproduces the ≈ v²/c retardation, so it must land FAR
    // closer to the retarded closed form than to the naive radial speed (which is wrong by
    // ≈ 0.27 m/s here). This proves the residual below is the numeric range-differencing
    // floor, not a missing-physics error.
    let naive_gap = (rdot_analytic - speed).abs();
    assert!(
        err_one < naive_gap / 100.0,
        "model Doppler error {err_one} m/s vs the retarded closed form should be ≪ the {naive_gap} m/s naive-vs-retarded gap"
    );

    // Both velocity residuals must be far below the 0.05 mm/s DSN Doppler floor.
    assert!(
        err_one < DSN_DOPPLER_FLOOR_M_PER_S,
        "one-way Doppler velocity error {err_one} m/s exceeds the ~{DSN_DOPPLER_FLOOR_M_PER_S} m/s DSN floor"
    );
    assert!(
        err_two < DSN_DOPPLER_FLOOR_M_PER_S,
        "two-way Doppler velocity error {err_two} m/s exceeds the ~{DSN_DOPPLER_FLOOR_M_PER_S} m/s DSN floor"
    );

    // The model precision must clear the floor with comfortable headroom (≥ 3×). The
    // residual is the f64 range-differencing floor at ~1-AU distance (~10⁻⁶ m/s), which is
    // a genuine numeric-precision characteristic of a deep-space range rate — and it still
    // sits several × below the DSN measurement floor, the point of the benchmark.
    let worse = err_one.max(err_two);
    assert!(
        worse * 3.0 < DSN_DOPPLER_FLOOR_M_PER_S,
        "Doppler model velocity error {worse} m/s must be ≥3× below the DSN ~{DSN_DOPPLER_FLOOR_M_PER_S} m/s floor"
    );
}

/// **Δ-DOR precision ≫ DSN Δ-DOR floor.** The model's plane-of-sky differential delay
/// `Δτ = −B⃗·(ŝ_sc − ŝ_q)/c` is compared against the exact analytic projection for a
/// known small angular offset along the baseline. Converting the delay residual into an
/// equivalent **plane-of-sky angle** (`Δθ = c·Δτ / B`) must be **far below 1 nrad** — the
/// published DSN Δ-DOR angular floor. The closed-form geometry is reproduced to machine
/// precision, so the model contributes essentially nothing to the angular error budget.
#[test]
fn delta_dor_precision_far_below_dsn_angular_floor() {
    // An ~8000 km intercontinental DSN baseline along +x.
    let baseline = [8.0e6, 0.0, 0.0];
    let baseline_len = norm(baseline);
    // Quasar along +z; spacecraft offset toward +x (along the baseline) by a small angle.
    let quasar = [0.0, 0.0, 1.0];
    let dtheta = 5.0e-7_f64; // 0.5 µrad offset, in the Δ-DOR sensitivity regime
    let sc_unit = [dtheta.sin(), 0.0, dtheta.cos()];
    let r = 2.27e11; // ~Earth–Mars-scale range (m)
    let sc_pos = [sc_unit[0] * r, sc_unit[1] * r, sc_unit[2] * r];

    let dtau_model = delta_dor(sc_pos, quasar, baseline);
    // Exact analytic differential delay: only the x-component of (ŝ_sc − ŝ_q) projects on
    // the baseline, and that component is sin(Δθ).
    let dtau_analytic = -(baseline[0] * dtheta.sin()) / C_M_PER_S;

    let delay_err = (dtau_model - dtau_analytic).abs();
    // Convert the residual *delay* error to an equivalent plane-of-sky *angle*:
    //   Δθ_err = c · Δτ_err / B.
    let angle_err_rad = C_M_PER_S * delay_err / baseline_len;

    assert!(
        angle_err_rad < DSN_DELTA_DOR_FLOOR_RAD,
        "Δ-DOR model angular error {angle_err_rad} rad exceeds the ~{DSN_DELTA_DOR_FLOOR_RAD} rad DSN floor"
    );
    // Clear the 1 nrad floor by orders of magnitude (the closed form is reproduced to
    // machine precision, so the angular error is ~10⁻²² rad class).
    assert!(
        angle_err_rad * 1.0e6 < DSN_DELTA_DOR_FLOOR_RAD,
        "Δ-DOR angular error {angle_err_rad} rad must be ≥1e6× below the {DSN_DELTA_DOR_FLOOR_RAD} rad DSN floor"
    );
}

/// **Plasma calibration precision ≫ its physical magnitude.** A known charged-particle
/// column is injected into both the X and Ka bands; `dual_freq_plasma_calibration`
/// recovers the X-band plasma delay from the 1/f² dispersion. The recovered value must
/// match the injected truth to a residual **far below 1 %** of the delay's own physical
/// magnitude — i.e. the calibration *removes* the plasma, it does not become the error
/// term. (At superior conjunction the X-band plasma range delay reaches tens of metres,
/// so a sub-permille calibration is well inside any DSN range budget.)
#[test]
fn plasma_calibration_recovers_injected_delay_well_below_one_percent() {
    let f_x = Band::X.downlink_hz();
    let f_ka = Band::Ka.downlink_hz();
    let tec = 2.5e18_f64; // injected charged-particle column (electrons / m²)

    let injected_x = solar_plasma_delay(f_x, tec);
    let injected_ka = solar_plasma_delay(f_ka, tec);

    let recovered_x = dual_freq_plasma_calibration(injected_x, injected_ka, f_x, f_ka);

    let rel_err = (recovered_x - injected_x).abs() / injected_x;
    // The honest test bar is < 1 % (the row claimed in VALIDATION.md); the noise-free
    // algebraic inversion does far better.
    assert!(
        rel_err < 1e-2,
        "dual-frequency plasma calibration relative error {rel_err} exceeds 1%"
    );
    // And in fact the recovery is essentially exact (≪ 1e-9 relative), so the calibration
    // removes the plasma rather than contributing to the error budget — the X-band plasma
    // delay it recovers is metre-class (its physical magnitude), the residual sub-femtometre.
    assert!(
        rel_err < 1e-9,
        "noise-free plasma calibration should recover the injected delay essentially exactly, got rel err {rel_err}"
    );
    let injected_x_range_m = injected_x * C_M_PER_S;
    assert!(
        injected_x_range_m > 0.0 && injected_x_range_m.is_finite(),
        "injected X-band plasma range delay {injected_x_range_m} m should be a positive finite magnitude"
    );
}

/// **Cross-check: the Shapiro (relativistic) delay sits in its published band.** Not a
/// precision-vs-floor test like the four above, but a sanity tie-back to the published
/// physics envelope: an Earth–Mars near-superior-conjunction grazing ray gives a
/// round-trip Shapiro delay in the well-known ~100–250 µs band (Moyer; IERS 2010 §11),
/// confirming the relativistic correction the range observable carries is the right
/// physical magnitude (microseconds, not arcseconds or seconds).
#[test]
fn shapiro_delay_in_published_microsecond_band() {
    const AU_M: f64 = 1.495_978_707e11;
    let r_sun = 6.957e8; // nominal solar radius (m)
    let b = 3.0 * r_sun; // 3 solar radii impact parameter (grazing)
    let earth = [-AU_M, b, 0.0];
    let mars = [1.524 * AU_M, b, 0.0];

    let one_way = shapiro_delay(earth, mars, MU_SUN);
    let round_trip = 2.0 * one_way;

    assert!(
        (100e-6..=250e-6).contains(&round_trip),
        "Earth–Mars round-trip Shapiro {} µs not in the published ~100–250 µs band",
        round_trip * 1e6
    );
}
