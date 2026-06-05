// SPDX-License-Identifier: Apache-2.0
//! Cislunar PNT integrity: ARAIM for a LunaNet-style lunar navigation service.
//!
//! Reuses the Earth-side ARAIM engine ([`crate::raim::araim_raim`]) for the lunar case.
//! A lunar navigation signal is far weaker and the constellation far sparser than GPS, so
//! the user-range-error and per-satellite fault prior are an order(s) of magnitude larger
//! (LunaNet LNIS: `σ_URE ≈ 30 m` vs GPS `≈ 0.6 m`; `P_sat ≈ 1e-4/hr`). Because the
//! protection level scales linearly with `σ_URE`, lunar protection levels are
//! correspondingly larger for the same geometry — the quantitative statement of why lunar
//! PNT integrity is hard.
//!
//! This provides the lunar parameters, a selenocentric sky geometry helper, and the lunar
//! ARAIM call. Scope (honest): the precise LANS NRHO ephemeris, the LANS signal-in-space
//! error budget, and the MCI↔MCMF frame reduction are follow-ons (see `ROADMAP.md`); the
//! user/satellite positions here are supplied in a single consistent selenocentric frame.

use crate::raim::{araim_raim, AraimResult, FaultPriors, IntegrityBudget};

/// Mean lunar radius (m).
pub const R_MOON_M: f64 = 1_737_400.0;
/// LunaNet LNIS nominal user-range error (m) — ~50× the GPS value.
pub const LUNAR_SIGMA_URE_M: f64 = 30.0;
/// Per-satellite fault prior over the exposure interval for a lunar service.
pub const LUNAR_P_SAT: f64 = 1.0e-4;

type Vec3 = [f64; 3];

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn unit(v: Vec3) -> Vec3 {
    let n = norm(v);
    [v[0] / n, v[1] / n, v[2] / n]
}

/// Spherical East/North/Up basis at a selenocentric position (Up = radial outward).
pub fn spherical_enu(pos: Vec3) -> (Vec3, Vec3, Vec3) {
    let up = unit(pos);
    // Use the body +z to seed East, unless the user is near a pole.
    let seed = if up[2].abs() < 0.99 {
        [0.0, 0.0, 1.0]
    } else {
        [1.0, 0.0, 0.0]
    };
    let east = unit(cross(seed, up));
    let north = cross(up, east);
    (east, north, up)
}

/// Build a lunar-orbiting constellation as seen from `user` (selenocentric metres): a
/// satellite at slant `range_m` in each `(azimuth, elevation)` direction (degrees).
pub fn lunar_sky_geometry(user: Vec3, range_m: f64, azels_deg: &[(f64, f64)]) -> Vec<Vec3> {
    let (east, north, up) = spherical_enu(user);
    azels_deg
        .iter()
        .map(|&(az, el)| {
            let (azr, elr) = (az.to_radians(), el.to_radians());
            let de = elr.cos() * azr.sin();
            let dn = elr.cos() * azr.cos();
            let du = elr.sin();
            [
                user[0] + range_m * (de * east[0] + dn * north[0] + du * up[0]),
                user[1] + range_m * (de * east[1] + dn * north[1] + du * up[1]),
                user[2] + range_m * (de * east[2] + dn * north[2] + du * up[2]),
            ]
        })
        .collect()
}

/// Lunar ARAIM protection levels: the Earth-side MHSS engine with the lunar
/// user-range-error and per-satellite fault prior.
pub fn lunar_araim(
    user: Vec3,
    sats: &[Vec3],
    range_residual_m: &[f64],
    budget: IntegrityBudget,
) -> Option<AraimResult> {
    araim_raim(
        user,
        sats,
        range_residual_m,
        LUNAR_SIGMA_URE_M,
        FaultPriors { p_sat: LUNAR_P_SAT },
        budget,
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    fn setup() -> (Vec3, Vec<Vec3>, Vec<f64>, IntegrityBudget) {
        // User on the lunar near side; six relay satellites at ~5000 km slant range.
        let user = [R_MOON_M, 0.0, 0.0];
        let azels = [
            (0.0, 75.0),
            (60.0, 30.0),
            (120.0, 50.0),
            (200.0, 25.0),
            (270.0, 55.0),
            (320.0, 35.0),
        ];
        let sats = lunar_sky_geometry(user, 5.0e6, &azels);
        let resid = vec![0.0; sats.len()];
        let budget = IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        };
        (user, sats, resid, budget)
    }

    #[test]
    fn spherical_enu_is_orthonormal() {
        let (e, n, u) = spherical_enu([R_MOON_M, 2.0e5, -3.0e5]);
        assert!(
            (norm(e) - 1.0).abs() < 1e-12
                && (norm(n) - 1.0).abs() < 1e-12
                && (norm(u) - 1.0).abs() < 1e-12
        );
        let dot = |a: Vec3, b: Vec3| a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
        assert!(dot(e, n).abs() < 1e-12 && dot(e, u).abs() < 1e-12 && dot(n, u).abs() < 1e-12);
    }

    #[test]
    fn geometry_places_satellites_at_the_slant_range() {
        let user = [R_MOON_M, 0.0, 0.0];
        let sats = lunar_sky_geometry(user, 5.0e6, &[(0.0, 90.0)]);
        // Elevation 90° ⇒ straight up ⇒ exactly range_m above the user radially.
        let d = norm([
            sats[0][0] - user[0],
            sats[0][1] - user[1],
            sats[0][2] - user[2],
        ]);
        assert!((d - 5.0e6).abs() < 1e-3, "slant = {d}");
    }

    #[test]
    fn lunar_protection_levels_are_finite_and_scale_with_sigma_ure() {
        let (user, sats, resid, budget) = setup();
        let lunar = lunar_araim(user, &sats, &resid, budget).expect("lunar araim runs");
        assert!(
            lunar.hpl_m.is_finite() && lunar.hpl_m > 0.0,
            "HPL {}",
            lunar.hpl_m
        );
        assert!(
            lunar.vpl_m.is_finite() && lunar.vpl_m > 0.0,
            "VPL {}",
            lunar.vpl_m
        );
        // Hold the fault prior fixed and drop σ_URE to the GPS 0.6 m: the protection level
        // scales linearly with σ_URE alone, so the ratio is exactly 30/0.6 = 50. (The lunar
        // case is harder still because its per-satellite prior is also ~10× larger.)
        let ref_06 = araim_raim(
            user,
            &sats,
            &resid,
            0.6,
            FaultPriors { p_sat: LUNAR_P_SAT },
            budget,
        )
        .expect("reference araim runs");
        let ratio = lunar.hpl_m / ref_06.hpl_m;
        assert!(
            (ratio - 50.0).abs() < 0.5,
            "HPL ratio = {ratio} (want ≈ 50)"
        );
    }
}
