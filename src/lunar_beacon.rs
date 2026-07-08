// SPDX-License-Identifier: AGPL-3.0-only
//! Surface-beacon augmentation of a lunar navigation service (L08, L09).
//!
//! A south-polar lunar user sees an orbit-only constellation in a narrow, slowly-moving
//! patch of sky, so the ranging geometry is poorly conditioned and the geometric
//! dilution of precision (GDOP) is large. A few surveyed **surface ranging beacons** fix
//! this cheaply: a beacon near the local horizon contributes the low-elevation,
//! wide-azimuth line-of-sight rows an all-overhead orbital set lacks, collapsing the
//! horizontal GDOP. This module supplies the two pieces the open engine did not yet
//! have: (1) a beacon-augmented DOP that concatenates satellite and surface-beacon
//! ranging rows through the validated [`crate::orbit::dop`] kernel, with airless-Moon
//! horizon-bounded beacon visibility (reusing the L01 [`crate::lunar::surface_los_max_m`]
//! geometry); and (2) a beacon error budget that turns a bare DOP into a **realized
//! position accuracy in metres** — converting the headline "GDOP 1.6" into a distance.
//!
//! ## Validated vs Modelled
//! * **Validated** — the DOP assembly (it *is* the [`crate::orbit::dop`] kernel, which is
//!   cross-checked against `gnss_lib_py`/NumPy), the airless-horizon visibility (the L01
//!   closed form), the error-budget root-sum-square, and the `σ = DOP · σ_URE` accuracy
//!   relation (Kaplan & Hegarty, *Understanding GPS/GNSS*, §7 UERE budget / DOP).
//! * **Modelled** — any specific constellation, beacon placement, or component error
//!   magnitude fed in is a representative scenario input, not a fielded measurement.

use crate::lunar::{surface_los_max_m, R_MOON_M};
use crate::lunar_service::visible_sat_positions;
use crate::orbit::{dop, Dop};
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn range_between(a: Vec3, b: Vec3) -> f64 {
    norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]])
}

/// Height of a point above the mean lunar sphere (m), floored at zero.
fn height_above_sphere_m(p: Vec3) -> f64 {
    (norm(p) - R_MOON_M).max(0.0)
}

/// Airless-Moon line of sight between a surface user and a surface beacon: the
/// straight-line range must not exceed the two-height geometric horizon sum
/// `sqrt(2 R h_u + h_u^2) + sqrt(2 R h_b + h_b^2)` (L01 [`surface_los_max_m`]). With no
/// atmosphere there is no refractive horizon extension, so this bound is exact.
pub fn beacon_visible(user_mcmf: Vec3, beacon_mcmf: Vec3) -> bool {
    let h_u = height_above_sphere_m(user_mcmf);
    let h_b = height_above_sphere_m(beacon_mcmf);
    range_between(user_mcmf, beacon_mcmf) <= surface_los_max_m(R_MOON_M, h_u, h_b)
}

/// The visible surface beacons for a user: those whose airless-Moon line of sight to the
/// user clears the horizon ([`beacon_visible`]).
pub fn visible_beacons(user_mcmf: Vec3, beacons_mcmf: &[Vec3]) -> Vec<Vec3> {
    beacons_mcmf
        .iter()
        .copied()
        .filter(|&b| beacon_visible(user_mcmf, b))
        .collect()
}

/// Beacon-augmented dilution of precision (L08): concatenate the visible-satellite
/// line-of-sight rows (elevation mask `elev_mask_rad`) with the visible-surface-beacon
/// ranging rows and evaluate through the validated [`crate::orbit::dop`] kernel. A
/// synchronized surface beacon contributes the same `[-e, 1]` ranging row as a
/// satellite, so a near-horizon beacon supplies the wide-azimuth horizontal geometry a
/// high-elevation-only orbital set lacks — the mechanism behind the polar GDOP collapse.
/// Returns `None` with fewer than four combined sources or a singular geometry.
pub fn dop_with_beacons(
    user_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    beacons_mcmf: &[Vec3],
    elev_mask_rad: f64,
) -> Option<Dop> {
    let mut sources = visible_sat_positions(user_mcmf, sats_mcmf, elev_mask_rad);
    sources.extend(visible_beacons(user_mcmf, beacons_mcmf));
    dop(user_mcmf, &sources)
}

/// Per-beacon user-equivalent ranging error budget (L09): the independent error sources
/// of a synchronized surface ranging beacon, each in metres of range.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
pub struct BeaconErrorBudget {
    /// Time-synchronization error mapped to range (m) — the beacon-to-system clock
    /// offset times the speed of light.
    pub clock_sync_m: f64,
    /// Surface-to-surface multipath error (m).
    pub multipath_m: f64,
    /// Beacon position / survey error (m).
    pub survey_m: f64,
}

impl BeaconErrorBudget {
    /// The per-beacon user-equivalent ranging error `σ_URE` (m): the root-sum-square of
    /// the independent components, `sqrt(clock² + multipath² + survey²)`.
    pub fn sigma_ure_m(&self) -> f64 {
        (self.clock_sync_m * self.clock_sync_m
            + self.multipath_m * self.multipath_m
            + self.survey_m * self.survey_m)
            .sqrt()
    }
}

/// Realized 1σ accuracy (m) resolved from a DOP and a user-equivalent ranging error.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct RealizedAccuracy {
    /// 3D position 1σ (m) = PDOP · σ_URE.
    pub pos_3d_m: f64,
    /// Horizontal position 1σ (m) = HDOP · σ_URE.
    pub horizontal_m: f64,
    /// Vertical position 1σ (m) = VDOP · σ_URE.
    pub vertical_m: f64,
    /// Time-solution 1σ as range (m) = TDOP · σ_URE.
    pub time_m: f64,
}

/// Map a (beacon-augmented) DOP to a realized 1σ accuracy given a user-equivalent
/// ranging error `σ_URE` (m): the standard GNSS relation `σ = DOP · σ_URE` applied per
/// component. This is what turns a dimensionless "GDOP 1.6" into metres.
pub fn realized_accuracy(d: &Dop, sigma_ure_m: f64) -> RealizedAccuracy {
    RealizedAccuracy {
        pos_3d_m: d.pdop * sigma_ure_m,
        horizontal_m: d.hdop * sigma_ure_m,
        vertical_m: d.vdop * sigma_ure_m,
        time_m: d.tdop * sigma_ure_m,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Build an MCMF position from selenographic latitude/longitude (deg) and antenna
    /// height (m) above the mean sphere. Right-handed, +Z at the north pole.
    fn site(lat_deg: f64, lon_deg: f64, height_m: f64) -> Vec3 {
        let lat = lat_deg.to_radians();
        let lon = lon_deg.to_radians();
        let r = R_MOON_M + height_m;
        [
            r * lat.cos() * lon.cos(),
            r * lat.cos() * lon.sin(),
            r * lat.sin(),
        ]
    }

    /// A high-altitude relay above a given sub-point (a crude MCI-ish position for a
    /// geometry test): radius `R_MOON + alt_m` toward the (lat, lon) direction.
    fn relay(lat_deg: f64, lon_deg: f64, alt_m: f64) -> Vec3 {
        site(lat_deg, lon_deg, alt_m)
    }

    /// Place a surface site at ground distance `dist_m` and azimuth `az_deg` from a
    /// reference (lat, lon), at antenna height `height_m` (spherical direct geodesic).
    /// Used to put beacons a few km from the user at diverse azimuths, within horizon.
    fn offset_site(
        lat_deg: f64,
        lon_deg: f64,
        dist_m: f64,
        az_deg: f64,
        height_m: f64,
    ) -> Vec3 {
        let lat = lat_deg.to_radians();
        let lon = lon_deg.to_radians();
        let az = az_deg.to_radians();
        let ang = dist_m / R_MOON_M;
        let lat2 = (lat.sin() * ang.cos() + lat.cos() * ang.sin() * az.cos()).asin();
        let lon2 = lon
            + (az.sin() * ang.sin() * lat.cos()).atan2(ang.cos() - lat.sin() * lat2.sin());
        let r = R_MOON_M + height_m;
        [r * lat2.cos() * lon2.cos(), r * lat2.cos() * lon2.sin(), r * lat2.sin()]
    }

    #[test]
    fn beacon_error_budget_rss_is_closed_form() {
        // Oracle: user-equivalent ranging error is the root-sum-square of independent
        // components (Kaplan & Hegarty, UERE budget). clock 1.0, multipath 2.0,
        // survey 0.5 -> sqrt(1 + 4 + 0.25) = sqrt(5.25) = 2.29128784...
        let b = BeaconErrorBudget {
            clock_sync_m: 1.0,
            multipath_m: 2.0,
            survey_m: 0.5,
        };
        assert!((b.sigma_ure_m() - 2.291_287_847_5).abs() < 1e-9);
    }

    #[test]
    fn realized_accuracy_is_dop_times_uere() {
        // Oracle: the standard GNSS accuracy relation sigma = DOP * sigma_URE per
        // component. This is what converts the paper's "GDOP 1.6" into metres.
        let d = Dop {
            gdop: 2.0,
            pdop: 1.6,
            hdop: 1.1,
            vdop: 1.2,
            tdop: 0.9,
        };
        let sigma = 2.2912878;
        let a = realized_accuracy(&d, sigma);
        assert!((a.pos_3d_m - 1.6 * sigma).abs() < 1e-9);
        assert!((a.horizontal_m - 1.1 * sigma).abs() < 1e-9);
        assert!((a.vertical_m - 1.2 * sigma).abs() < 1e-9);
        assert!((a.time_m - 0.9 * sigma).abs() < 1e-9);
    }

    #[test]
    fn beacon_visibility_respects_the_airless_horizon() {
        // Oracle: L01 surface_los_max. A user on a 2 m mast and a beacon on a 2 m mast
        // see each other only within sqrt(2 R h_u) + sqrt(2 R h_b) ≈ 5.27 km; place one
        // beacon just inside that range and one well beyond.
        let user = site(-88.0, 0.0, 2.0);
        // Near beacon: a small along-surface offset (~2 km). Far beacon: ~50 km away.
        let near = site(-88.0, 2.0, 2.0); // ~1.1 km of arc at this latitude
        let far = site(-80.0, 0.0, 2.0); // ~240 km of arc
        assert!(beacon_visible(user, near), "near beacon should be visible");
        assert!(!beacon_visible(user, far), "far beacon should be over the horizon");
    }

    #[test]
    fn beacons_enable_a_solution_where_sparse_orbit_only_cannot() {
        // A polar user with only THREE visible satellites has no DOP (rank-deficient);
        // adding two surveyed surface beacons completes a solvable geometry. This is the
        // sparse-coverage case P2 targets. DOP assembly inherits the Validated kernel.
        let user = site(-85.0, 0.0, 1.6);
        let sats = [
            relay(-70.0, 0.0, 5.0e6),
            relay(-75.0, 120.0, 5.0e6),
            relay(-72.0, 240.0, 5.0e6),
        ];
        assert!(
            crate::lunar_service::service_dop(user, &sats, 5.0_f64.to_radians()).is_none(),
            "three satellites alone must be rank-deficient"
        );
        // Two surveyed beacons 4 km from the user (within the ~5.6 km horizon) at
        // azimuths 90 deg apart.
        let beacons = [
            offset_site(-85.0, 0.0, 4_000.0, 0.0, 3.0),
            offset_site(-85.0, 0.0, 4_000.0, 90.0, 3.0),
        ];
        assert_eq!(visible_beacons(user, &beacons).len(), 2, "both beacons visible");
        let d = dop_with_beacons(user, &sats, &beacons, 5.0_f64.to_radians())
            .expect("3 sats + 2 beacons is solvable");
        assert!(d.gdop.is_finite() && d.gdop > 0.0, "GDOP {}", d.gdop);
    }

    #[test]
    fn beacons_cut_the_polar_gdop() {
        // Four satellites clustered high over the pole give a poorly-conditioned,
        // large-GDOP geometry for an -85 deg user; three surface beacons spread in
        // azimuth add the horizontal rows that collapse it. Asserts the P2 mechanism
        // (a large GDOP reduction), not the paper's exact 16.2 -> 1.6 (that scenario is
        // reproduced in the Phase-4 pack).
        let user = site(-85.0, 0.0, 1.6);
        let sats = [
            relay(-84.0, 0.0, 5.0e6),
            relay(-84.0, 30.0, 5.0e6),
            relay(-83.5, 60.0, 5.0e6),
            relay(-84.5, 90.0, 5.0e6),
        ];
        let sats_only = crate::lunar_service::service_dop(user, &sats, 5.0_f64.to_radians())
            .expect("clustered sats give a (large) GDOP");
        // Three beacons 4 km from the user (within horizon) at 120 deg azimuth spacing.
        let beacons = [
            offset_site(-85.0, 0.0, 4_000.0, 0.0, 3.0),
            offset_site(-85.0, 0.0, 4_000.0, 120.0, 3.0),
            offset_site(-85.0, 0.0, 4_000.0, 240.0, 3.0),
        ];
        assert_eq!(visible_beacons(user, &beacons).len(), 3, "all beacons visible");
        let augmented = dop_with_beacons(user, &sats, &beacons, 5.0_f64.to_radians())
            .expect("sats + beacons solvable");
        assert!(
            augmented.gdop < sats_only.gdop,
            "beacons should cut GDOP: {} -> {}",
            sats_only.gdop,
            augmented.gdop
        );
    }
}
