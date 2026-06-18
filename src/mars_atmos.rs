// SPDX-License-Identifier: AGPL-3.0-only
//! Mars neutral-atmosphere density and atmospheric-drag acceleration.
//!
//! This is the Mars analogue of the Earth drag model in [`crate::forces`]
//! ([`crate::forces::atmospheric_density`] / [`crate::forces::drag_accel`]): a
//! piecewise-exponential density profile and a quadratic-drag acceleration taken relative to
//! the **co-rotating** Mars atmosphere. A Low-Mars-Orbit (LMO) spacecraft — and especially one
//! aerobraking — sees a drag force the deep-space OD must model; the **scale factor** on that
//! drag is the quantity the reduced-dynamic SRIF (D2.2) estimates, so this module supplies the
//! deterministic acceleration model and an explicit `..._scaled` variant for the estimator to
//! multiply.
//!
//! ## Scope (honest)
//!
//! [`mars_density`] is a **representative engineering model**, not a flight-validated
//! atmosphere. It is a static, mean, dust-and-season-independent piecewise-exponential —
//! the Mars counterpart of Earth's CIRA-72 / Vallado table, *not* the full Mars-GRAM 2010 or
//! Mars Climate Database (MCD) with their dust-storm, local-time, latitude and solar-cycle
//! dependence. The anchor values are the well-known Mars figures (surface density
//! ~0.020 kg/m³ and a near-surface scale height ~11 km, consistent with the Mars-GRAM 2010 /
//! MCD low-dust mean and the ~610 Pa CO₂ surface pressure at ~210 K); the higher bands carry
//! the rising scale height of the thin upper atmosphere. Use a vendored Mars-GRAM/MCD profile
//! for production aerobraking work.

type Vec3 = [f64; 3];

/// Mars reference radius (m) — the IAU mean equatorial radius, matching
/// [`crate::body::Body::mars`]'s `re`. Altitudes are measured above a sphere of this radius.
pub const MARS_RE: f64 = 3_396_200.0;

/// Mars sidereal spin rate `ω` (rad/s) — the atmosphere is assumed to co-rotate rigidly with
/// it, matching [`crate::body::Body::mars`]'s `rotation_rate`. (A Mars sol is ~24.6 h, so `ω`
/// is close to Earth's; the co-rotation subtracts a real along-track speed at LMO.)
pub const MARS_ROTATION_RATE: f64 = 7.088_218e-5;

fn norm(r: Vec3) -> f64 {
    (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt()
}

/// Mars neutral mass density `ρ` (kg/m³) at geometric altitude `altitude_m` (m above the Mars
/// reference sphere of radius [`MARS_RE`]), a **piecewise-exponential** Mars-GRAM-lite model.
/// Within the band whose base altitude `h0` brackets `h`, `ρ = ρ0·exp(−(h − h0)/H)`. Below the
/// surface it clamps to the surface value; above the top band it continues that band's
/// exponential (no hard cutoff).
///
/// The bands are anchored at a **surface density of 0.020 kg/m³** with a **near-surface scale
/// height of 11.1 km**, the representative Mars-GRAM 2010 / Mars Climate Database low-dust mean
/// (the ~610 Pa CO₂ surface pressure at ~210 K). Each band's base density is the previous band
/// evaluated at its top, so the profile is continuous, strictly decreasing, and the
/// scale height rises into the thin upper atmosphere. This is a representative engineering
/// model — see the module docs.
pub fn mars_density(altitude_m: f64) -> f64 {
    // (base altitude h0 [km], base density ρ0 [kg/m³], scale height H [km]). Each ρ0 is the
    // previous band evaluated at this base altitude, so the profile is continuous.
    const BANDS: [(f64, f64, f64); 10] = [
        (0.0, 2.0000e-2, 11.100),
        (25.0, 2.1032e-3, 8.500),
        (50.0, 1.1106e-4, 7.500),
        (75.0, 3.9619e-6, 8.000),
        (100.0, 1.7407e-7, 10.000),
        (125.0, 1.4289e-8, 14.000),
        (150.0, 2.3959e-9, 20.000),
        (200.0, 1.9667e-10, 30.000),
        (250.0, 3.7146e-11, 45.000),
        (300.0, 1.2228e-11, 60.000),
    ];
    let h_km = (altitude_m / 1000.0).max(0.0);
    // Highest base altitude ≤ h_km (i stays 0 at/below the surface band).
    let mut i = 0;
    while i + 1 < BANDS.len() && BANDS[i + 1].0 <= h_km {
        i += 1;
    }
    let (h0, rho0, scale) = BANDS[i];
    rho0 * (-(h_km - h0) / scale).exp()
}

/// Atmospheric-drag acceleration (m/s², Mars-centred inertial) on a spacecraft at areocentric
/// position `r` (m) and inertial velocity `v` (m/s): the standard quadratic drag
/// `a = −½ · ρ(h) · (C_D·A/m) · |v_rel| · v_rel`, opposing the velocity **relative to the
/// co-rotating Mars atmosphere** `v_rel = v − ω ẑ × r` (`ω ẑ × r = (−ω·r_y, ω·r_x, 0)`).
/// `cd_area_over_mass` is the ballistic area term `C_D·A/m` (m²/kg) and `ρ` is [`mars_density`]
/// at the spherical altitude `|r| − `[`MARS_RE`]. This force is **dissipative** — it always
/// removes orbital energy. Mirrors [`crate::forces::drag_accel`] with Mars constants.
pub fn mars_drag_accel(r: Vec3, v: Vec3, cd_area_over_mass: f64) -> Vec3 {
    let rho = mars_density(norm(r) - MARS_RE);
    let w = MARS_ROTATION_RATE;
    // v_rel = v − ω ẑ × r.
    let v_rel = [v[0] + w * r[1], v[1] - w * r[0], v[2]];
    let coef = -0.5 * rho * cd_area_over_mass * norm(v_rel);
    [coef * v_rel[0], coef * v_rel[1], coef * v_rel[2]]
}

/// [`mars_drag_accel`] multiplied by an estimated drag **scale factor** `scale` — the form the
/// reduced-dynamic SRIF (D2.2) uses, carrying the unknown `C_D·A/m` mis-modelling and the
/// atmospheric-density uncertainty in one estimable multiplier (`scale = 1` is the nominal
/// model). Linear in `scale`, so the estimator's partial `∂a/∂scale` is just
/// [`mars_drag_accel`] itself.
pub fn mars_drag_accel_scaled(r: Vec3, v: Vec3, cd_area_over_mass: f64, scale: f64) -> Vec3 {
    let a = mars_drag_accel(r, v, cd_area_over_mass);
    [scale * a[0], scale * a[1], scale * a[2]]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn mars_density_decreases_with_altitude() {
        // Surface anchor ~0.020 kg/m³ (Mars-GRAM/MCD low-dust mean), clamps below the surface.
        let rho0 = mars_density(0.0);
        assert!(
            (rho0 - 0.020).abs() < 1e-4,
            "surface density {rho0}, expected ~0.020 kg/m³"
        );
        assert_eq!(mars_density(-5_000.0), rho0, "clamps below the surface");

        // The near-surface profile e-folds over ~11 km: ρ(0)/ρ(11.1 km) ≈ e.
        let ratio = mars_density(0.0) / mars_density(11_100.0);
        assert!(
            (ratio - std::f64::consts::E).abs() < 0.02,
            "near-surface e-fold over ~11 km: ρ(0)/ρ(11.1 km) = {ratio}, expected ≈ e"
        );

        // Strictly monotone decreasing across the modelled band (no transcription inversion).
        let alts = [
            0.0, 25e3, 50e3, 75e3, 100e3, 150e3, 200e3, 250e3, 300e3, 400e3,
        ];
        for w in alts.windows(2) {
            let (lo, hi) = (mars_density(w[0]), mars_density(w[1]));
            assert!(
                hi < lo,
                "density must decrease: {hi} at {} km not < {lo} at {} km",
                w[1] / 1e3,
                w[0] / 1e3
            );
        }

        // Continuity across a band boundary: the base density equals the previous band
        // evaluated at the boundary (no step discontinuity at 100 km).
        let below = mars_density(100e3 - 1.0);
        let at = mars_density(100e3);
        assert!(
            (below - at).abs() / at < 1e-3,
            "density jumps at the 100 km band boundary: {below} vs {at}"
        );
    }

    #[test]
    fn mars_density_local_scale_height_is_physical() {
        // Two samples 10 km apart in the near-surface band: the recovered e-folding scale
        // height H = −Δh/ln(ρ₂/ρ₁) must be the ~11 km Mars near-surface value, a physical
        // signature rather than a re-statement of any single tabulated number.
        let (h1, h2) = (5e3, 15e3);
        let ratio = mars_density(h2) / mars_density(h1);
        let scale_km = -(h2 - h1) / 1000.0 / ratio.ln();
        assert!(
            (10.0..=12.0).contains(&scale_km),
            "recovered near-surface scale height {scale_km} km outside ~11 km Mars band"
        );
    }

    #[test]
    fn mars_drag_opposes_relative_velocity() {
        // A ~150 km LMO prograde state. Drag must oppose the velocity relative to the
        // co-rotating Mars atmosphere (v_rel = v − ω ẑ × r) and have a sane LMO magnitude for
        // C_D·A/m = 0.02 m²/kg.
        let alt = 150e3;
        let r = [MARS_RE + alt, 0.0, 0.0];
        let mu_mars = 4.282_837e13; // Body::mars().mu
        let vcirc = (mu_mars / (MARS_RE + alt)).sqrt(); // ~3.48 km/s
        let v = [0.0, vcirc, 0.0];
        let a = mars_drag_accel(r, v, 0.02);

        // v_rel = (0, vcirc − ω·(MARS_RE+alt), 0): the co-rotation subtracts along-track speed.
        let v_rel = [0.0, vcirc - MARS_ROTATION_RATE * (MARS_RE + alt), 0.0];
        let dot_av = a[0] * v_rel[0] + a[1] * v_rel[1] + a[2] * v_rel[2];
        assert!(
            dot_av < 0.0,
            "drag must oppose the relative velocity: {dot_av}"
        );
        // Anti-parallel to v_rel: a = −|a|·v̂_rel, so the components are collinear and opposed.
        assert!(
            a[0] == 0.0 && a[2] == 0.0,
            "drag should be purely along −v_rel for this in-plane state: {a:?}"
        );
        assert!(
            a[1] < 0.0,
            "drag along-track component must be retrograde: {}",
            a[1]
        );

        // Magnitude in a sane LMO band (~1e-4 m/s² at 150 km for this ballistic coefficient).
        let mag = norm(a);
        assert!(
            (1e-5..=1e-3).contains(&mag),
            "150 km Mars drag magnitude {mag} m/s² outside the expected ~3e-4 band"
        );
    }

    #[test]
    fn mars_drag_is_strictly_antiparallel_to_relative_velocity() {
        // For an off-axis / out-of-plane state the drag vector must still be exactly
        // anti-parallel to v_rel: the normalised drag direction equals −v̂_rel to machine
        // precision (a cross-product of a and v_rel vanishes).
        let r = [MARS_RE + 180e3, 2.0e5, -1.0e5];
        let v = [-300.0, 3300.0, 150.0];
        let a = mars_drag_accel(r, v, 0.015);
        let w = MARS_ROTATION_RATE;
        let v_rel = [v[0] + w * r[1], v[1] - w * r[0], v[2]];
        // a × v_rel ≈ 0 (collinear), and a · v_rel < 0 (opposed).
        let cross = [
            a[1] * v_rel[2] - a[2] * v_rel[1],
            a[2] * v_rel[0] - a[0] * v_rel[2],
            a[0] * v_rel[1] - a[1] * v_rel[0],
        ];
        let scale = norm(a) * norm(v_rel);
        assert!(
            norm(cross) / scale < 1e-12,
            "drag not anti-parallel to v_rel: cross = {cross:?}"
        );
        assert!(
            a[0] * v_rel[0] + a[1] * v_rel[1] + a[2] * v_rel[2] < 0.0,
            "drag must oppose v_rel"
        );
    }

    #[test]
    fn mars_drag_scales() {
        // Doubling C_D·A/m doubles the drag magnitude (drag is linear in the ballistic term).
        let r = [MARS_RE + 160e3, 0.0, 0.0];
        let v = [0.0, 3400.0, 0.0];
        let a1 = mars_drag_accel(r, v, 0.02);
        let a2 = mars_drag_accel(r, v, 0.04);
        let ratio = norm(a2) / norm(a1);
        assert!(
            (ratio - 2.0).abs() < 1e-12,
            "doubling C_D·A/m must double drag: ratio {ratio}"
        );

        // The estimator's scale factor multiplies the whole acceleration linearly, and
        // scale = 1 reproduces the nominal model bit-for-bit.
        let nominal = mars_drag_accel(r, v, 0.02);
        let unit = mars_drag_accel_scaled(r, v, 0.02, 1.0);
        assert_eq!(unit, nominal, "scale = 1 must equal the nominal drag");
        let doubled = mars_drag_accel_scaled(r, v, 0.02, 2.0);
        for k in 0..3 {
            assert!(
                (doubled[k] - 2.0 * nominal[k]).abs() <= 1e-18 + 1e-12 * nominal[k].abs(),
                "scale = 2 must double component {k}"
            );
        }
    }

    #[test]
    fn mars_drag_vanishes_above_the_atmosphere_density_floor() {
        // Far above the modelled bands the density is vanishingly small, so the drag is many
        // orders of magnitude below a near-surface-LMO value — a sanity floor, not a hard cut.
        let low = norm(mars_drag_accel(
            [MARS_RE + 150e3, 0.0, 0.0],
            [0.0, 3475.0, 0.0],
            0.02,
        ));
        let high = norm(mars_drag_accel(
            [MARS_RE + 1000e3, 0.0, 0.0],
            [0.0, 3000.0, 0.0],
            0.02,
        ));
        assert!(
            high < low * 1e-4,
            "drag at 1000 km ({high}) should be far below 150 km ({low})"
        );
    }
}
