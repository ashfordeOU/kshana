// SPDX-License-Identifier: AGPL-3.0-only
//! Mars/Sun-central propagation validation — **no external data, no network**.
//!
//! These tests close the loop on the deep-space central-body machinery (the [`kshana::body::Body`]
//! seam, the Mars body-fixed gravity of [`kshana::mars_frame`], and the Sun-central two-body path)
//! by checking it against **analytic truth that needs no ephemeris**:
//!
//! 1. a circular Low-Mars-Orbit returns to its start after exactly one Keplerian period (a closed
//!    orbit), and its specific orbital energy `ε = v²/2 − μ/r` is conserved across the arc;
//! 2. an inclined Mars orbit's secular nodal regression matches the closed-form Mars-J2 rate
//!    `Ω̇ = −1.5·n·J2·(Re/p)²·cos i`, computed from the shipped `MARS_ZONALS_J2_J4[0]` and the Mars
//!    `μ`/`Re` — validating the Mars oblateness term end-to-end through the propagator;
//! 3. a body in a Mars-like **heliocentric** orbit under `Body::sun()` has the period the
//!    vis-viva law predicts for the Mars semi-major axis (≈ 687 days, the Mars sidereal year),
//!    recovered from the propagated arc — validating the Sun-central two-body machinery.
//!
//! The DE-grade check (Kshana's Sun-central Mars propagation vs the JPL DE440 Mars ephemeris) is
//! the separate, **kernel-gated** `xval/anise-mars-od` crate (D0.8b); it is not a default gate and
//! never needs network here. No ephemeris numbers are invented in this file: every reference value
//! is either a closed-form Keplerian quantity or a published Mars constant already shipped in
//! [`kshana::body`].

use kshana::body::{Body, MARS_ZONALS_J2_J4};
use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::Tolerance;
use kshana::propagator::{nodal_history, propagate, raan_rad, secular_slope, ForceModel};

type Vec3 = [f64; 3];

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Specific orbital energy `ε = v²/2 − μ/r` (J/kg) about a body of gravitational parameter `mu`.
/// The crate's `kshana::propagator::specific_energy` is Earth-`μ`-hardcoded, so the Mars/Sun energy
/// is formed here with the correct central `μ` — the conserved quantity for a pure two-body arc.
fn specific_energy(r: Vec3, v: Vec3, mu: f64) -> f64 {
    0.5 * (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]) - mu / norm(r)
}

/// A **pole-aligned** Mars carrying a pure-`J2` (axisymmetric) gravity field, for the nodal-regression
/// test. Two deliberate, test-only simplifications isolate the J2 physics from confounders:
///
/// * the gravity field is the **zonal `C̄20` only** (no `C̄22/S̄22` sectorals), so the secular nodal
///   drift is the clean first-order J2 rate with no longitude-dependent (tesseral) ripple;
/// * the IAU pole is set to inertial `+Z` (`α₀ = 0`, `δ₀ = 90°`), so the body-fixed equator coincides
///   with the inertial XY-plane. The propagator evaluates a [`Body::gravity`] field in the body-fixed
///   frame ([`kshana::mars_frame`]); aligning the pole with `+Z` makes the orbit inclination measured
///   from the body equator equal the inclination from inertial `+Z`, which is what the node angle
///   [`raan_rad`] (node of `ẑ × h`) and the analytic `cos i` both reference. The real Mars pole
///   (α₀ = 317.68°, δ₀ = 52.89°) only tilts that equator in inertial space; it does not change the
///   J2 oblateness physics this test validates.
///
/// The `μ`, `Re` and `J2` are the **shipped Mars values** ([`Body::mars`] / [`MARS_ZONALS_J2_J4`]) —
/// nothing about the gravitational physics is altered, only the frame is made axis-clean.
fn mars_pure_j2_pole_aligned() -> Body {
    let mut mars = Body::mars();
    let j2 = MARS_ZONALS_J2_J4[0];
    // Pure-J2 axisymmetric field: C̄00 = 1 (central term), C̄20 = −J2/√5, nothing else.
    let mut f = SphericalHarmonicField::zeros(mars.mu, mars.re, 2);
    f.set(0, 0, 1.0, 0.0);
    f.set(2, 0, -j2 / 5.0_f64.sqrt(), 0.0);
    mars.gravity = Some(f);
    // Align the body pole with inertial +Z so the body equator is the inertial XY-plane.
    mars.pole_ra0 = 0.0;
    mars.pole_dec0 = std::f64::consts::FRAC_PI_2;
    mars
}

/// The analytic first-order **Mars-J2 nodal regression** rate `Ω̇` (rad/s) for a Keplerian orbit
/// `(a, e, i)`: `Ω̇ = −1.5·n·J2·(Re/p)²·cos i` with `n = √(μ/a³)` and `p = a(1−e²)` — the same
/// Vallado expression as `kshana::forces::j2_secular_rates`, but evaluated with the **Mars** `μ`,
/// `Re` and `J2` instead of Earth's (that crate routine is Earth-hardcoded).
fn mars_j2_raan_rate(a: f64, e: f64, i_rad: f64, mu: f64, re: f64, j2: f64) -> f64 {
    let n = (mu / (a * a * a)).sqrt();
    let p = a * (1.0 - e * e);
    -1.5 * n * j2 * (re / p).powi(2) * i_rad.cos()
}

/// A tight tolerance for the analytic-truth two-body checks.
fn tight_tol() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    }
}

/// **Mars-LMO closed orbit.** A circular Low-Mars-Orbit propagated for exactly one Keplerian period
/// must return to its starting state — the most basic correctness gate on the Mars central-gravity +
/// integrator: a closed orbit closes. The strict closure is checked under the **two-body** Mars body
/// (where the period `2π√(a³/μ)` is exact, so the miss is pure integrator error and must be tiny);
/// the full Mars tesseral field `with_body(Body::mars_gmm3(4))` (the task's headline model) is then
/// shown to keep the orbit *quasi*-closed to the J2 scale — a real but bounded few-percent residual,
/// the node/perigee precession J2 ≈ 1.96e-3 drives over one revolution (the orbit is not exactly
/// periodic under an oblate field, which is itself the physical signature we want to see).
#[test]
fn mars_lmo_circular_orbit_closes_after_one_period() {
    let mars = Body::mars();
    // ~400 km altitude circular Low-Mars-Orbit (Re_mars = 3 396 200 m).
    let alt = 400e3;
    let r_orbit = mars.re + alt;
    let vc = (mars.mu / r_orbit).sqrt(); // circular speed about Mars
    let period = std::f64::consts::TAU * (r_orbit.powi(3) / mars.mu).sqrt(); // 2π√(a³/μ)

    // Equatorial circular state: r along +x, v along +y at the circular speed.
    let r0 = [r_orbit, 0.0, 0.0];
    let v0 = [0.0, vc, 0.0];
    let tol = tight_tol();

    // (1) Two-body Mars: the period is exact, so the orbit closes to integrator precision (≪ 1 m on
    //     a 3.8e6 m orbit). This is the clean "the Mars μ + integrator close a circular orbit" gate.
    let tb = ForceModel::two_body().with_body(Body::mars());
    let (r1, _) = propagate(r0, v0, period, &tb, &tol);
    let miss_tb = norm([r1[0] - r0[0], r1[1] - r0[1], r1[2] - r0[2]]);
    assert!(
        miss_tb < 1e-6 * r_orbit,
        "two-body Mars-LMO did not close: miss {miss_tb:.3} m over one {period:.0} s period (radius {r_orbit:.0} m)"
    );
    // It is a real full revolution, not a degenerate near-zero arc: the half-period two-body state is
    // on the opposite side of Mars (≈ −r0), proving the body actually went around once.
    let (r_half, _) = propagate(r0, v0, period / 2.0, &tb, &tol);
    let opp = norm([r_half[0] + r0[0], r_half[1] + r0[1], r_half[2] + r0[2]]);
    assert!(
        opp < 1e-6 * r_orbit,
        "two-body half-period state should be ≈ −r0 (opposite side of Mars): residual {opp:.3} m"
    );

    // (2) Full Mars tesseral field (mars_gmm3 degree 4) + J2: the orbit is no longer exactly periodic
    //     (the oblate field precesses it), but it stays quasi-closed — the one-revolution miss is a
    //     bounded few-percent of the radius, the J2-scale (≈1.96e-3·several) signature of Mars
    //     oblateness, and far from a blow-up. This confirms the SH-field central-gravity path
    //     integrates a stable, near-closed Mars orbit rather than diverging.
    let sh = ForceModel::with_j2().with_body(Body::mars_gmm3(4));
    let (r1_sh, _) = propagate(r0, v0, period, &sh, &tol);
    let miss_sh = norm([r1_sh[0] - r0[0], r1_sh[1] - r0[1], r1_sh[2] - r0[2]]);
    let rel = miss_sh / r_orbit;
    assert!(
        (1e-4..3e-2).contains(&rel),
        "Mars tesseral-field LMO one-rev miss rel {rel:.4} off the J2-scale quasi-closure band (miss {miss_sh:.0} m)"
    );
}

/// **Energy / periodicity sanity.** Specific orbital energy `ε = v²/2 − μ_mars/r` stays essentially
/// constant across the Mars-LMO arc — the integrator + Mars central gravity are energy-consistent.
/// Run under the **two-body** Mars body so `ε` is the *exactly* conserved quantity (under the J2/
/// tesseral field the conserved quantity is `ε − R(r)` including the disturbing potential, a weaker
/// statement); the two-body energy drift here is pure integrator error and must be far below noise.
#[test]
fn mars_orbit_conserves_two_body_energy() {
    let mars = Body::mars();
    let alt = 400e3;
    let r_orbit = mars.re + alt;
    let vc = (mars.mu / r_orbit).sqrt();
    let period = std::f64::consts::TAU * (r_orbit.powi(3) / mars.mu).sqrt();
    let r0 = [r_orbit, 0.0, 0.0];
    let v0 = [0.0, vc, 0.0];

    let model = ForceModel::two_body().with_body(Body::mars());
    let tol = tight_tol();
    let e0 = specific_energy(r0, v0, mars.mu);

    // Sample the energy at several fractions of the orbit; the relative drift must stay tiny.
    let mut max_rel_drift = 0.0_f64;
    for k in 1..=4 {
        let (r, v) = propagate(r0, v0, period * f64::from(k) / 4.0, &model, &tol);
        let e = specific_energy(r, v, mars.mu);
        let rel = (e - e0).abs() / e0.abs();
        max_rel_drift = max_rel_drift.max(rel);
    }
    assert!(
        max_rel_drift < 1e-9,
        "Mars two-body specific energy drifted by rel {max_rel_drift:e} over one orbit (integrator inconsistency)"
    );
    // ε is negative (a bound orbit) and finite, and a = −μ/(2ε) recovers the orbit radius for a
    // circular orbit — a sanity check that the Mars μ actually drives the dynamics.
    assert!(
        e0 < 0.0,
        "bound Mars orbit must have negative specific energy"
    );
    let a_recovered = -mars.mu / (2.0 * e0);
    assert!(
        (a_recovered - r_orbit).abs() / r_orbit < 1e-12,
        "a = −μ/(2ε) {a_recovered} must equal the circular radius {r_orbit}"
    );
}

/// **Mars J2 nodal precession.** Propagate an inclined Mars orbit under a pure-J2 (pole-aligned)
/// Mars field and fit the secular RAAN rate; it must match the closed-form Mars-J2 rate
/// `Ω̇ = −1.5·n·J2·(Re/p)²·cos i` (computed from `MARS_ZONALS_J2_J4[0]` and the Mars `μ`/`Re`) to
/// first-order theory accuracy. This validates the Mars oblateness term **end-to-end** through the
/// body-fixed gravity evaluation and the integrator — the Mars analogue of the Earth
/// `j2_nodal_regression_reproduces_the_secular_formula` gate.
#[test]
fn mars_j2_nodal_regression_matches_the_analytic_rate() {
    let mars = mars_pure_j2_pole_aligned();
    let mu = mars.mu;
    let re = mars.re;
    let j2 = MARS_ZONALS_J2_J4[0];

    // A ~400 km circular Mars orbit inclined 60° to the (pole-aligned) Mars equator.
    let a = mars.re + 400e3;
    let inc = 60.0_f64.to_radians();
    let v = (mu / a).sqrt();
    let r0 = [a, 0.0, 0.0];
    let v0 = [0.0, v * inc.cos(), v * inc.sin()];

    // Propagate ~ one Mars day (≈ 88 642 s); several orbits, enough secular drift to fit cleanly.
    let arc = 88_642.0;
    let model = ForceModel::two_body().with_body(mars);
    let hist = nodal_history(r0, v0, arc, 5.0, &model);
    let rate_num = secular_slope(&hist);
    let rate_formula = mars_j2_raan_rate(a, 0.0, inc, mu, re, j2);

    // Both are the westward nodal regression (negative for a prograde orbit).
    assert!(
        rate_num < 0.0 && rate_formula < 0.0,
        "both Mars nodal rates must be negative (regression): num {rate_num:e}, formula {rate_formula:e}"
    );
    let rel = (rate_num - rate_formula).abs() / rate_formula.abs();
    // First-order theory: the residual is the O(J2²) higher-order secular term plus the fit/short-
    // period leakage — a physics-level (not machine-precision) check, validated within 3 %.
    assert!(
        rel < 0.03,
        "Mars numerical Ω̇ {rate_num:e} vs analytic {rate_formula:e} (rel {rel:.4}) — Mars J2 term not reproduced"
    );
    // Sanity: the rate is the right order of magnitude. Mars J2 (≈1.96e-3) is ~1.8× Earth's, but a
    // Mars orbit's mean motion is smaller (Mars μ ≈ 1/9 Earth's), so the LMO nodal drift is a few
    // degrees/day — bounded well away from zero and from an Earth-sized rate.
    let deg_per_day = rate_formula.to_degrees() * 86_400.0;
    assert!(
        (-20.0..-0.5).contains(&deg_per_day),
        "Mars-LMO Ω̇ {deg_per_day:.3} °/day off the expected few-°/day band"
    );

    // The node genuinely moved (the fit is over a real, monotone drift, not numerical dither): the
    // total RAAN change over the arc is non-trivial and westward.
    let raan0 = raan_rad(r0, v0);
    let total_drift = rate_num * arc;
    assert!(
        total_drift.abs() > 1e-3,
        "Mars node must drift measurably over the arc, Δ {total_drift:e} rad (start Ω {raan0:e})"
    );
}

/// **Sun-central Mars two-body sanity.** A body in a Mars-like **heliocentric** orbit, propagated
/// under `Body::sun()` central gravity, must have the orbital period the vis-viva law predicts for
/// the Mars semi-major axis (Mars `a` ≈ 2.279e11 m): `T = 2π√(a³/μ☉) ≈ 687 days`, the Mars sidereal
/// year. We recover the period from the propagated arc (no external ephemeris) by detecting the
/// return to the starting true-anomaly direction, and check it against the analytic Keplerian period
/// and the textbook 686.98-day Mars year. This validates the Sun-central two-body machinery — the
/// foundation the DE-grade `xval/anise-mars-od` cross-check (D0.8b) builds on.
#[test]
fn sun_central_mars_like_orbit_has_the_mars_year_period() {
    let sun = Body::sun();
    // Mars heliocentric semi-major axis (IAU/DE), and a near-circular Mars-like orbit (e ≈ 0.0934).
    // Start at perihelion on +x with the perihelion speed, in the XY (ecliptic-ish) plane.
    let a = 2.279_392e11; // m, Mars semi-major axis
    let e = 0.0934; // Mars eccentricity
    let r_peri = a * (1.0 - e);
    // vis-viva at perihelion: v = √(μ(2/r − 1/a)).
    let v_peri = (sun.mu * (2.0 / r_peri - 1.0 / a)).sqrt();
    let r0 = [r_peri, 0.0, 0.0];
    let v0 = [0.0, v_peri, 0.0];

    // The analytic Keplerian period for this a about the Sun.
    let period_analytic = std::f64::consts::TAU * (a.powi(3) / sun.mu).sqrt();
    let period_days = period_analytic / 86_400.0;
    // It is the Mars sidereal year, 686.98 days, to better than a day (the a/μ☉ are the standard
    // published values; the residual is their rounding, not a propagation error).
    assert!(
        (period_days - 686.98).abs() < 1.5,
        "Keplerian period {period_days:.2} d off the 686.98-day Mars year"
    );

    // Recover the period from the *propagated* arc: propagate for the analytic period and confirm the
    // orbit returned to its start (closed heliocentric orbit), and that a half-period lands near
    // aphelion on the −x side — i.e. the body really traversed a full Mars-year ellipse.
    let model = ForceModel::two_body().with_body(Body::sun());
    let tol = tight_tol();
    let (r_full, _) = propagate(r0, v0, period_analytic, &model, &tol);
    let miss = norm([r_full[0] - r0[0], r_full[1] - r0[1], r_full[2] - r0[2]]);
    assert!(
        miss < 1e-6 * a,
        "Sun-central Mars-like orbit did not close after one Mars year: miss {miss:.0} m (a {a:.3e} m)"
    );

    let (r_half, _) = propagate(r0, v0, period_analytic / 2.0, &model, &tol);
    // Aphelion distance r_apo = a(1+e), on the −x side.
    let r_apo = a * (1.0 + e);
    assert!(
        r_half[0] < 0.0,
        "half Mars-year should place the body on the far (−x) side, x = {:.3e}",
        r_half[0]
    );
    let apo_err = (norm(r_half) - r_apo).abs() / r_apo;
    assert!(
        apo_err < 1e-6,
        "half-period heliocentric distance {:.3e} m off aphelion {r_apo:.3e} m (rel {apo_err:e})",
        norm(r_half)
    );

    // Independent period recovery from the radial-distance time series: the perihelion return is the
    // time of *minimum* heliocentric distance in the back half of the orbit (perihelion is the
    // closest approach). Sample the radius on a coarse daily grid over the second half, take the
    // minimum-radius sample, and refine it to sub-day accuracy with a 3-point parabolic fit. That
    // refined perihelion-return time must equal the analytic Mars year — a self-consistent recovery
    // straight from the propagated arc, with no external ephemeris.
    let step = 86_400.0; // 1-day samples
                         // Search the back half (t in [0.5·T, 1.05·T]); the minimum there is the perihelion return.
    let t_lo = period_analytic * 0.5;
    let t_hi = period_analytic * 1.05;
    let n = ((t_hi - t_lo) / step) as usize;
    let radius_at = |t: f64| -> f64 {
        let (r, _) = propagate(r0, v0, t, &model, &tol);
        norm(r)
    };
    let mut best_k = 0usize;
    let mut best_r = f64::INFINITY;
    let mut samples = Vec::with_capacity(n + 1);
    for k in 0..=n {
        let t = t_lo + step * k as f64;
        let rr = radius_at(t);
        samples.push((t, rr));
        if rr < best_r {
            best_r = rr;
            best_k = k;
        }
    }
    // The minimum must be interior (so the parabolic refinement has both neighbours).
    assert!(
        best_k > 0 && best_k < n,
        "perihelion-return minimum landed on the search boundary (k={best_k}, n={n}) — widen the window"
    );
    // 3-point parabolic vertex: t* = t_k − ½·step·(r₊ − r₋)/(r₊ − 2r₀ + r₋).
    let (t0, r_c) = samples[best_k];
    let r_m = samples[best_k - 1].1;
    let r_p = samples[best_k + 1].1;
    let denom = r_p - 2.0 * r_c + r_m;
    let t_rec = t0 - 0.5 * step * (r_p - r_m) / denom;
    let rel = (t_rec - period_analytic).abs() / period_analytic;
    assert!(
        rel < 5e-3,
        "period recovered from the arc {:.2} d vs analytic Mars year {:.2} d (rel {rel:e})",
        t_rec / 86_400.0,
        period_days
    );
}
