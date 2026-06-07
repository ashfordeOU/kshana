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
use serde::Serialize;
use std::f64::consts::{FRAC_PI_2, TAU};

/// Mean lunar radius (m).
pub const R_MOON_M: f64 = 1_737_400.0;
/// LunaNet LNIS nominal user-range error (m) — ~50× the GPS value.
pub const LUNAR_SIGMA_URE_M: f64 = 30.0;
/// Per-satellite fault prior over the exposure interval for a lunar service.
pub const LUNAR_P_SAT: f64 = 1.0e-4;
/// Lunar sidereal rotation period (s): 27.321661 days. The Moon's rotation is
/// synchronous with its orbit, so this is also the orbital sidereal month.
pub const LUNAR_SIDEREAL_DAY_S: f64 = 27.321_661 * 86_400.0;

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

/// Mean lunar rotation angle (rad, in [0, 2π)) at `seconds` past the epoch at which
/// the Moon-centered inertial (MCI) and Moon-fixed (MCMF) frames are aligned. A
/// simplified mean-rotation model (the Moon turns uniformly at the sidereal rate);
/// it omits the physical libration and the precessing lunar pole of the full IAU /
/// DE421 lunar rotation model (see the module scope note).
pub fn lunar_rotation_angle(seconds: f64) -> f64 {
    (TAU / LUNAR_SIDEREAL_DAY_S * seconds).rem_euclid(TAU)
}

/// Rotate a 3-vector about the +z (lunar spin) axis by `theta` (R3 convention,
/// matching [`crate::frames::teme_to_ecef`]).
fn rot3(r: Vec3, theta: f64) -> Vec3 {
    let (s, c) = theta.sin_cos();
    [c * r[0] + s * r[1], -s * r[0] + c * r[1], r[2]]
}

/// Moon-centered inertial (MCI) → Moon-centered Moon-fixed (MCMF): rotate by the
/// lunar rotation angle about the spin axis. The MCMF analogue of ECI→ECEF.
pub fn mci_to_mcmf(r_mci: Vec3, seconds: f64) -> Vec3 {
    rot3(r_mci, lunar_rotation_angle(seconds))
}

/// Inverse of [`mci_to_mcmf`]: MCMF → MCI.
pub fn mcmf_to_mci(r_mcmf: Vec3, seconds: f64) -> Vec3 {
    rot3(r_mcmf, -lunar_rotation_angle(seconds))
}

/// A selenographic position: lunar latitude and longitude (radians) and height
/// above the mean lunar sphere (metres). The Moon is treated as a sphere of radius
/// [`R_MOON_M`] (its flattening is ~0.0012, well below this fidelity).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Selenographic {
    pub lat_rad: f64,
    pub lon_rad: f64,
    pub alt_m: f64,
}

/// MCMF (Moon-fixed Cartesian) → selenographic latitude/longitude/altitude.
pub fn mcmf_to_selenographic(r_mcmf: Vec3) -> Selenographic {
    let rad = norm(r_mcmf);
    let lon = r_mcmf[1].atan2(r_mcmf[0]);
    let lat = if rad > 0.0 {
        (r_mcmf[2] / rad).asin()
    } else {
        0.0
    };
    Selenographic {
        lat_rad: lat,
        lon_rad: lon,
        alt_m: rad - R_MOON_M,
    }
}

/// Selenographic latitude/longitude/altitude → MCMF (Moon-fixed Cartesian).
pub fn selenographic_to_mcmf(s: Selenographic) -> Vec3 {
    let r = R_MOON_M + s.alt_m;
    let (sla, cla) = s.lat_rad.sin_cos();
    let (slo, clo) = s.lon_rad.sin_cos();
    [r * cla * clo, r * cla * slo, r * sla]
}

/// One epoch of a lunar-surface protection-level pass.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct LunarPassPoint {
    /// Seconds since the start of the pass.
    pub t_s: f64,
    /// Horizontal protection level (m).
    pub hpl_m: f64,
    /// Vertical protection level (m).
    pub vpl_m: f64,
    /// `true` when HPL ≤ the alert limit (the surface user is available).
    pub available: bool,
}

/// Protection levels for a landed receiver at the lunar **south pole** (the Artemis
/// target region) seen against a representative LunaNet relay set, sampled over a
/// pass. At each epoch six relays are placed in a representative selenocentric sky
/// (azimuths and elevations evolving independently to exercise the changing
/// geometry) and run through [`lunar_araim`]; `available` compares HPL to
/// `alert_limit_m`. Honest scope: this is a *representative* relay geometry, not the
/// precise LANS NRHO ephemeris (a 3-body cislunar orbit Kshana does not yet model —
/// see `ROADMAP.md`); it demonstrates the lunar integrity budget, not an operational
/// LunaNet availability number.
pub fn south_pole_hpl_pass(
    step_s: f64,
    duration_s: f64,
    alert_limit_m: f64,
    budget: IntegrityBudget,
) -> Vec<LunarPassPoint> {
    let user = selenographic_to_mcmf(Selenographic {
        lat_rad: -FRAC_PI_2,
        lon_rad: 0.0,
        alt_m: 0.0,
    });
    // Representative relay sky and per-relay drift rates (deg/hr) and elevation
    // oscillation, so the relative geometry — and therefore the DOP — changes.
    let base: [(f64, f64); 6] = [
        (10.0, 70.0),
        (70.0, 35.0),
        (140.0, 55.0),
        (210.0, 28.0),
        (280.0, 60.0),
        (330.0, 40.0),
    ];
    let az_rate = [3.0, 5.5, 4.0, 6.5, 4.8, 5.2];
    let mut out = Vec::new();
    let mut t = 0.0;
    while t < duration_s - 1e-6 {
        let hours = t / 3600.0;
        let azels: Vec<(f64, f64)> = base
            .iter()
            .enumerate()
            .map(|(i, &(az, el))| {
                let a = (az + az_rate[i] * hours).rem_euclid(360.0);
                let e = (el + 8.0 * (0.3 * hours + i as f64).sin()).clamp(10.0, 88.0);
                (a, e)
            })
            .collect();
        let sats = lunar_sky_geometry(user, 6.0e6, &azels);
        let resid = vec![0.0; sats.len()];
        if let Some(r) = lunar_araim(user, &sats, &resid, budget) {
            out.push(LunarPassPoint {
                t_s: t,
                hpl_m: r.hpl_m,
                vpl_m: r.vpl_m,
                available: r.hpl_m <= alert_limit_m,
            });
        }
        t += step_s;
    }
    out
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
    fn selenographic_round_trips_and_cardinal_points() {
        // Prime meridian / equator at the surface sits on +x at the lunar radius.
        let eq = selenographic_to_mcmf(Selenographic {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        assert!((eq[0] - R_MOON_M).abs() < 1e-6 && eq[1].abs() < 1e-6 && eq[2].abs() < 1e-6);
        // The lunar south pole (Artemis target) sits on −z at the lunar radius.
        let sp = selenographic_to_mcmf(Selenographic {
            lat_rad: -std::f64::consts::FRAC_PI_2,
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        assert!(sp[0].abs() < 1e-6 && sp[1].abs() < 1e-6 && (sp[2] + R_MOON_M).abs() < 1e-6);
        // Round-trip a few selenographic positions through MCMF.
        for &(lat, lon, alt) in &[
            (12.0_f64, 45.0_f64, 0.0_f64),
            (-89.0, -120.0, 1500.0),
            (60.0, 175.0, 30000.0),
        ] {
            let s = Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: alt,
            };
            let back = mcmf_to_selenographic(selenographic_to_mcmf(s));
            assert!((back.lat_rad - s.lat_rad).abs() < 1e-12, "lat {lat}");
            assert!((back.lon_rad - s.lon_rad).abs() < 1e-12, "lon {lon}");
            assert!((back.alt_m - s.alt_m).abs() < 1e-6, "alt {alt}");
        }
    }

    #[test]
    fn mci_mcmf_rotation_is_identity_at_epoch_and_period() {
        let r = [1.2e6, -8.0e5, 4.0e5];
        // At the alignment epoch (t = 0) the two frames coincide.
        let at0 = mci_to_mcmf(r, 0.0);
        for k in 0..3 {
            assert!((at0[k] - r[k]).abs() < 1e-6, "t=0 component {k}");
        }
        // After one sidereal rotation the Moon has turned a full 2π → identity again.
        let at_period = mci_to_mcmf(r, LUNAR_SIDEREAL_DAY_S);
        for k in 0..3 {
            assert!((at_period[k] - r[k]).abs() < 1e-3, "t=T component {k}");
        }
        // Round-trip at an arbitrary epoch, and the rotation preserves magnitude.
        let t = 0.37 * LUNAR_SIDEREAL_DAY_S;
        let back = mcmf_to_mci(mci_to_mcmf(r, t), t);
        for k in 0..3 {
            assert!((back[k] - r[k]).abs() < 1e-6, "round-trip {k}");
        }
        assert!((norm(mci_to_mcmf(r, t)) - norm(r)).abs() < 1e-6);
        // Over one day the Moon turns ≈ 360°/27.32 ≈ 13.176°.
        let deg = lunar_rotation_angle(86_400.0).to_degrees();
        assert!((deg - 13.176_358).abs() < 1e-3, "1-day rotation = {deg}°");
    }

    #[test]
    fn south_pole_pass_shows_the_lunar_integrity_gap() {
        // A landed receiver at the lunar south pole, a representative LunaNet relay
        // set above it, sampled over 24 h. With the nominal LANS σ_URE = 30 m the
        // protection level is finite but *exceeds* a 50 m surface-ops alert limit —
        // the honest quantitative statement that lunar PNT integrity is not yet met.
        let budget = IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        };
        let pass = south_pole_hpl_pass(3600.0, 86_400.0, 50.0, budget);
        assert_eq!(pass.len(), 24, "24 hourly samples");
        assert!(
            pass.iter().all(|p| p.hpl_m.is_finite() && p.hpl_m > 0.0),
            "every epoch yields a finite protection level"
        );
        // The geometry varies over the pass (HPL is not constant).
        let hmin = pass.iter().map(|p| p.hpl_m).fold(f64::INFINITY, f64::min);
        let hmax = pass.iter().map(|p| p.hpl_m).fold(0.0_f64, f64::max);
        assert!(hmax > hmin, "HPL should vary across the pass");
        // The honest gap: with 30 m ranging the HPL is well over the 50 m alert limit,
        // so the surface user is *not* available — every epoch flags unavailable.
        assert!(
            pass.iter().all(|p| !p.available && p.hpl_m > 50.0),
            "30 m LANS σ_URE cannot meet a 50 m alert limit"
        );
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
