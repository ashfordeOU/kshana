// SPDX-License-Identifier: AGPL-3.0-only
//! Terrain shadowing of the jammer in the `jamming` kind (CAP-06 (b)): the optional
//! `[terrain]` section, pre-registered in
//! `docs/design/evidence/jamming-terrain/PREREGISTRATION.md`.
//!
//! The terrain profile between the jammer and the receiver is sampled on an SRTM `.hgt` tile
//! ([`DemGrid::from_srtm_hgt`], bilinear [`DemGrid::elevation_at`]) along the great circle of a
//! sphere of radius [`EARTH_RADIUS_M`], every `profile_step_m`. At each point the clearance
//! above the straight ray between the two antennas, with an effective-Earth bulge
//! `d1·d2 / (2·k·R_e)`, gives the Fresnel-Kirchhoff parameter `ν`. The point of largest `ν` is
//! the one knife edge, and the jammer's received power is lowered by the single knife-edge loss
//! [`knife_edge_loss_db`] of Recommendation ITU-R P.526-15 §4.1.
//!
//! MODELLED: one knife edge only (no Deygout or Bullington construction), no ground reflection,
//! clutter, foliage or ducting, and one tile. The DEM's own error is not assessed.

use crate::altpnt::terrain::DemGrid;
use crate::frames::Geodetic;
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// The sphere radius of the profile's great circle and of the Earth bulge (m).
pub const EARTH_RADIUS_M: f64 = 6_371_000.0;

fn d_k_factor() -> f64 {
    4.0 / 3.0
}
fn d_profile_step_m() -> f64 {
    30.0
}

/// The `[terrain]` section of a `jamming` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct TerrainCfg {
    /// An SRTM `.hgt` tile, as a path relative to the working directory (the convention of
    /// every data path inside a scenario).
    pub dem_hgt: String,
    /// Samples per side of the tile (3601 for 1-arc-second tiles, 1201 for 3-arc-second).
    pub samples_per_side: usize,
    /// Latitude of the tile's lower-left corner (deg).
    pub ll_lat_deg: f64,
    /// Longitude of the tile's lower-left corner (deg).
    pub ll_lon_deg: f64,
    /// Geoid height above the ellipsoid, `N` (m). A scenario height `h` is `h − N` on the
    /// DEM's datum.
    #[serde(default)]
    pub geoid_undulation_m: f64,
    /// Effective Earth-radius factor `k` of the bulge.
    #[serde(default = "d_k_factor")]
    pub k_factor: f64,
    /// Spacing of the profile samples along the path (m).
    #[serde(default = "d_profile_step_m")]
    pub profile_step_m: f64,
}

impl TerrainCfg {
    /// Check the section's numbers.
    pub fn check(&self) -> Result<(), String> {
        if self.samples_per_side < 2 {
            return Err(format!(
                "terrain.samples_per_side must be at least 2 (got {})",
                self.samples_per_side
            ));
        }
        for (name, v) in [
            ("ll_lat_deg", self.ll_lat_deg),
            ("ll_lon_deg", self.ll_lon_deg),
            ("geoid_undulation_m", self.geoid_undulation_m),
        ] {
            if !v.is_finite() {
                return Err(format!("terrain.{name} must be finite (got {v})"));
            }
        }
        for (name, v) in [
            ("k_factor", self.k_factor),
            ("profile_step_m", self.profile_step_m),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return Err(format!("terrain.{name} must be positive (got {v})"));
            }
        }
        Ok(())
    }

    /// Read the tile.
    pub fn load(&self) -> Result<DemGrid, String> {
        let bytes = std::fs::read(&self.dem_hgt)
            .map_err(|e| format!("terrain.dem_hgt {:?}: {e}", self.dem_hgt))?;
        DemGrid::from_srtm_hgt(
            &bytes,
            self.samples_per_side,
            self.ll_lat_deg,
            self.ll_lon_deg,
        )
        .map_err(|e| format!("terrain.dem_hgt {:?}: {e}", self.dem_hgt))
    }
}

/// The single knife-edge diffraction loss `J(ν)` (dB) of Recommendation ITU-R P.526-15 §4.1:
/// `6.9 + 20·log10(sqrt((ν − 0.1)² + 1) + ν − 0.1)` for `ν > −0.78`, else 0.
pub fn knife_edge_loss_db(nu: f64) -> f64 {
    if nu > -0.78 {
        let x = nu - 0.1;
        6.9 + 20.0 * ((x * x + 1.0).sqrt() + x).plog10()
    } else {
        0.0
    }
}

/// The `jammer_terrain` block of a run with a `[terrain]` section.
#[derive(Clone, Debug, Serialize)]
pub struct JammerTerrain {
    /// Largest `ν` along the profile (1); `null` with no profile point.
    pub nu_max: f64,
    /// The knife-edge loss at `nu_max` (dB), applied to the jammer's received power.
    pub diffraction_loss_db: f64,
    /// Distance of the dominant obstacle from the jammer along the path (m).
    pub obstacle_distance_m: f64,
    /// DEM elevation of the dominant obstacle on the DEM's datum (m).
    pub obstacle_terrain_m: f64,
    /// Great-circle length of the path (m).
    pub path_length_m: f64,
    /// Number of profile samples.
    pub profile_points: usize,
}

fn unit(g: &Geodetic) -> [f64; 3] {
    let (sl, cl) = g.lat_rad.psin_cos();
    let (so, co) = g.lon_rad.psin_cos();
    [cl * co, cl * so, sl]
}

fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn cross(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// The terrain profile from `jammer` to `receiver` (geodetic, ellipsoidal heights) on `dem`,
/// and its dominant knife edge at wavelength `lambda_m`. A profile point outside the tile or on
/// a void is an error.
pub fn jammer_terrain(
    cfg: &TerrainCfg,
    dem: &DemGrid,
    jammer: &Geodetic,
    receiver: &Geodetic,
    lambda_m: f64,
) -> Result<JammerTerrain, String> {
    let (uj, ur) = (unit(jammer), unit(receiver));
    let c = cross(uj, ur);
    let theta = dot(c, c).sqrt().patan2(dot(uj, ur));
    let d = theta * EARTH_RADIUS_M;
    let (hj, hr) = (
        jammer.alt_m - cfg.geoid_undulation_m,
        receiver.alt_m - cfg.geoid_undulation_m,
    );
    let lat_max = dem.lat0_deg + (dem.n_lat - 1) as f64 * dem.dlat_deg;
    let lon_max = dem.lon0_deg + (dem.n_lon - 1) as f64 * dem.dlon_deg;
    let mut best: Option<(f64, f64, f64)> = None; // (ν, d1, terrain)
    let mut points = 0usize;
    let sin_theta = theta.psin();
    loop {
        let d1 = (points + 1) as f64 * cfg.profile_step_m;
        if d1 >= d {
            break;
        }
        points += 1;
        let f = d1 / d;
        let (a, b) = (((1.0 - f) * theta).psin(), (f * theta).psin());
        let p = [
            (a * uj[0] + b * ur[0]) / sin_theta,
            (a * uj[1] + b * ur[1]) / sin_theta,
            (a * uj[2] + b * ur[2]) / sin_theta,
        ];
        let lat = p[2].patan2(p[0].phypot(p[1])).to_degrees();
        let lon = p[1].patan2(p[0]).to_degrees();
        if !(dem.lat0_deg..=lat_max).contains(&lat) || !(dem.lon0_deg..=lon_max).contains(&lon) {
            return Err(format!(
                "terrain: profile point {points} ({lat:.6}, {lon:.6}) is outside the DEM tile"
            ));
        }
        let terrain = dem.elevation_at(lat, lon);
        if terrain.is_nan() {
            return Err(format!(
                "terrain: profile point {points} ({lat:.6}, {lon:.6}) is on a DEM void"
            ));
        }
        let d2 = d - d1;
        let bulge = d1 * d2 / (2.0 * cfg.k_factor * EARTH_RADIUS_M);
        let ray = hj + (hr - hj) * d1 / d;
        let h = terrain + bulge - ray;
        let nu = h * (2.0 * d / (lambda_m * d1 * d2)).sqrt();
        if best.is_none_or(|(b, _, _)| nu > b) {
            best = Some((nu, d1, terrain));
        }
    }
    let (nu_max, obstacle_distance_m, obstacle_terrain_m) =
        best.unwrap_or((f64::NAN, f64::NAN, f64::NAN));
    Ok(JammerTerrain {
        nu_max,
        diffraction_loss_db: if nu_max.is_nan() {
            0.0
        } else {
            knife_edge_loss_db(nu_max)
        },
        obstacle_distance_m,
        obstacle_terrain_m,
        path_length_m: d,
        profile_points: points,
    })
}

/// Units of the `jammer_terrain` block, emitted only for a run with a `[terrain]` section.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "jammer_terrain.nu_max",
            unit: "1",
            provenance: Computed,
            definition: "largest Fresnel-Kirchhoff diffraction parameter along the terrain \
                         profile from the jammer to the receiver (the one knife edge); null \
                         with no profile point",
        },
        FieldUnit {
            path: "jammer_terrain.diffraction_loss_db",
            unit: "dB",
            provenance: Computed,
            definition: "single knife-edge loss of ITU-R P.526-15 section 4.1 at nu_max, \
                         subtracted from the jammer's received power (so from every J/S)",
        },
        FieldUnit {
            path: "jammer_terrain.obstacle_distance_m",
            unit: "m",
            provenance: Computed,
            definition: "distance of the dominant obstacle from the jammer along the \
                         great-circle path",
        },
        FieldUnit {
            path: "jammer_terrain.obstacle_terrain_m",
            unit: "m",
            provenance: Computed,
            definition: "DEM elevation of the dominant obstacle on the DEM's datum",
        },
        FieldUnit {
            path: "jammer_terrain.path_length_m",
            unit: "m",
            provenance: Computed,
            definition: "great-circle length of the jammer-to-receiver path on a sphere of \
                         6 371 000 m",
        },
        FieldUnit {
            path: "jammer_terrain.profile_points",
            unit: "count",
            provenance: Computed,
            definition: "number of terrain samples along the path, every profile_step_m",
        },
    ]
};

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_knife_edge_loss_is_zero_below_the_threshold_and_six_db_at_grazing() {
        assert_eq!(knife_edge_loss_db(-0.78), 0.0);
        assert_eq!(knife_edge_loss_db(-2.0), 0.0);
        // Grazing incidence: J(0) = 6.9 + 20 log10(sqrt(1.01) - 0.1), about 6.033 dB.
        assert!((knife_edge_loss_db(0.0) - 6.0329).abs() < 1e-3);
    }
}
