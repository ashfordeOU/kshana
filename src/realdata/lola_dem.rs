// SPDX-License-Identifier: AGPL-3.0-only
//! Digital elevation model (DEM) ingest + terrain line-of-sight for lunar beacon siting.
//!
//! A surface ranging beacon only helps a user it can actually *see*. On the airless
//! Moon that is a pure geometry question, but the bare-sphere horizon
//! ([`crate::lunar::surface_los_max_m`]) is optimistic: real polar terrain — crater rims,
//! massifs, the walls of permanently shadowed regions — blocks lines of sight the sphere
//! would allow, and can *extend* reach from a high vantage. This module ingests a DEM
//! tile and answers "does the straight line between two surface points clear the
//! terrain?", the constraint a terrain-aware beacon-placement optimiser needs.
//!
//! ## Validated vs Modelled
//! * **Validated** — the terrain-LOS geometry: a point on the A→B segment is occluded iff
//!   its height above the mean sphere is below the DEM surface at its ground track, and
//!   the bilinear [`DemTile::height_at`] interpolation is the exact closed form. The
//!   tests check both against hand-worked cases.
//! * **Modelled** — the shipped [`DemTile::representative_south_polar`] tile is a
//!   *representative* synthetic polar relief (a crater basin inside a raised rim), NOT
//!   an actual LOLA PDS product. [`DemTile::parse`] ingests a real LOLA-derived grid
//!   when one is supplied; the fixture stands in for it so the pipeline is exercisable
//!   offline. Any siting result over the fixture is illustrative until a real tile is
//!   loaded.

use crate::lunar::{mcmf_to_selenographic, R_MOON_M};

type Vec3 = [f64; 3];

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// A regular latitude/longitude DEM tile: elevations (m, relative to the mean lunar
/// sphere of radius [`crate::lunar::R_MOON_M`]) on an `n_lat × n_lon` grid spanning
/// `[lat_min_deg, lat_max_deg] × [lon_min_deg, lon_max_deg]`, stored row-major
/// (latitude-major, north-increasing? no — index 0 is `lat_min_deg`).
#[derive(Clone, Debug, PartialEq)]
pub struct DemTile {
    pub lat_min_deg: f64,
    pub lat_max_deg: f64,
    pub lon_min_deg: f64,
    pub lon_max_deg: f64,
    pub n_lat: usize,
    pub n_lon: usize,
    /// Row-major heights (m above the mean sphere); length `n_lat * n_lon`.
    pub heights_m: Vec<f64>,
}

impl DemTile {
    /// Latitude (deg) of grid row `i`.
    pub fn lat_of(&self, i: usize) -> f64 {
        if self.n_lat <= 1 {
            self.lat_min_deg
        } else {
            self.lat_min_deg
                + (self.lat_max_deg - self.lat_min_deg) * (i as f64) / ((self.n_lat - 1) as f64)
        }
    }
    /// Longitude (deg) of grid column `j`.
    pub fn lon_of(&self, j: usize) -> f64 {
        if self.n_lon <= 1 {
            self.lon_min_deg
        } else {
            self.lon_min_deg
                + (self.lon_max_deg - self.lon_min_deg) * (j as f64) / ((self.n_lon - 1) as f64)
        }
    }

    /// Bilinearly interpolated terrain height (m above the mean sphere) at
    /// `(lat_deg, lon_deg)`. Queries outside the tile clamp to the nearest edge.
    pub fn height_at(&self, lat_deg: f64, lon_deg: f64) -> f64 {
        if self.heights_m.is_empty() {
            return 0.0;
        }
        let fi = if self.n_lat <= 1 {
            0.0
        } else {
            ((lat_deg - self.lat_min_deg) / (self.lat_max_deg - self.lat_min_deg)).clamp(0.0, 1.0)
                * ((self.n_lat - 1) as f64)
        };
        let fj = if self.n_lon <= 1 {
            0.0
        } else {
            ((lon_deg - self.lon_min_deg) / (self.lon_max_deg - self.lon_min_deg)).clamp(0.0, 1.0)
                * ((self.n_lon - 1) as f64)
        };
        let i0 = fi.floor() as usize;
        let j0 = fj.floor() as usize;
        let i1 = (i0 + 1).min(self.n_lat - 1);
        let j1 = (j0 + 1).min(self.n_lon - 1);
        let di = fi - i0 as f64;
        let dj = fj - j0 as f64;
        let h = |i: usize, j: usize| self.heights_m[i * self.n_lon + j];
        let top = h(i0, j0) * (1.0 - dj) + h(i0, j1) * dj;
        let bot = h(i1, j0) * (1.0 - dj) + h(i1, j1) * dj;
        top * (1.0 - di) + bot * di
    }

    /// Radius (m) of the terrain surface at `(lat_deg, lon_deg)`: `R_MOON + height`.
    pub fn surface_radius_m(&self, lat_deg: f64, lon_deg: f64) -> f64 {
        R_MOON_M + self.height_at(lat_deg, lon_deg)
    }

    /// Parse a simple whitespace DEM grid. Line 1: `lat_min lat_max lon_min lon_max
    /// n_lat n_lon` (degrees + dimensions); the remaining `n_lat * n_lon` whitespace-
    /// separated numbers are the row-major heights (m). Comment lines start with `#`.
    /// This is the ingest path for a real LOLA-derived tile exported to text.
    pub fn parse(text: &str) -> Result<DemTile, String> {
        let mut nums = text
            .lines()
            .filter(|l| !l.trim_start().starts_with('#'))
            .flat_map(|l| l.split_whitespace())
            .map(|t| {
                t.parse::<f64>()
                    .map_err(|e| format!("bad number '{t}': {e}"))
            });
        let mut next = || {
            nums.next()
                .ok_or_else(|| "unexpected end of DEM".to_string())?
        };
        let lat_min_deg = next()?;
        let lat_max_deg = next()?;
        let lon_min_deg = next()?;
        let lon_max_deg = next()?;
        let n_lat = next()? as usize;
        let n_lon = next()? as usize;
        let mut heights_m = Vec::with_capacity(n_lat * n_lon);
        for _ in 0..(n_lat * n_lon) {
            heights_m.push(next()?);
        }
        if n_lat == 0 || n_lon == 0 {
            return Err("DEM has a zero dimension".into());
        }
        Ok(DemTile {
            lat_min_deg,
            lat_max_deg,
            lon_min_deg,
            lon_max_deg,
            n_lat,
            n_lon,
            heights_m,
        })
    }

    /// Serialise back to the [`DemTile::parse`] text format (round-trippable).
    pub fn to_text(&self) -> String {
        let mut s = format!(
            "{} {} {} {} {} {}\n",
            self.lat_min_deg,
            self.lat_max_deg,
            self.lon_min_deg,
            self.lon_max_deg,
            self.n_lat,
            self.n_lon
        );
        for i in 0..self.n_lat {
            let row: Vec<String> = (0..self.n_lon)
                .map(|j| format!("{}", self.heights_m[i * self.n_lon + j]))
                .collect();
            s.push_str(&row.join(" "));
            s.push('\n');
        }
        s
    }

    /// A representative synthetic south-polar relief for offline testing: a
    /// `−90..−80° × −180..180°` tile with a raised rim (a few km) enclosing a depressed
    /// basin, on a `21 × 37` grid. MODELLED — not an actual LOLA PDS product; replace
    /// with a real tile via [`DemTile::parse`] for operational siting.
    pub fn representative_south_polar() -> DemTile {
        let (n_lat, n_lon) = (21usize, 37usize);
        let (lat_min, lat_max) = (-90.0, -80.0);
        let (lon_min, lon_max) = (-180.0, 180.0);
        let mut heights_m = Vec::with_capacity(n_lat * n_lon);
        for i in 0..n_lat {
            let lat = lat_min + (lat_max - lat_min) * (i as f64) / ((n_lat - 1) as f64);
            for j in 0..n_lon {
                let lon = lon_min + (lon_max - lon_min) * (j as f64) / ((n_lon - 1) as f64);
                // Colatitude (deg from the pole) drives a rim at ~5 deg and a basin inside.
                let colat = 90.0 + lat; // 0 at the pole, 10 at -80
                                        // Rim: a Gaussian ridge centred at colat 5 deg, ~2500 m high.
                let rim = 2500.0 * (-((colat - 5.0).powi(2)) / (2.0 * 1.5_f64.powi(2))).exp();
                // Basin: a broad depression near the pole, down to ~-1200 m.
                let basin = -1200.0 * (-(colat.powi(2)) / (2.0 * 3.0_f64.powi(2))).exp();
                // A longitudinal massif (a peak) at lon ~ 60 deg to break the symmetry.
                let massif = 1800.0
                    * (-((lon - 60.0).powi(2)) / (2.0 * 20.0_f64.powi(2))).exp()
                    * (-((colat - 6.0).powi(2)) / (2.0 * 2.0_f64.powi(2))).exp();
                heights_m.push(rim + basin + massif);
            }
        }
        DemTile {
            lat_min_deg: lat_min,
            lat_max_deg: lat_max,
            lon_min_deg: lon_min,
            lon_max_deg: lon_max,
            n_lat,
            n_lon,
            heights_m,
        }
    }
}

/// Terrain-aware line of sight: `true` iff the straight segment from `a_mcmf` to
/// `b_mcmf` stays above the DEM surface at every sampled interior point (the segment is
/// sampled at `n_steps` intervals). This refines the bare-sphere horizon with real
/// relief: a rim between two points can occlude an otherwise-visible beacon, and a high
/// vantage can clear one the sphere would hide. Validated closed-form geometry.
pub fn terrain_los_clear(dem: &DemTile, a_mcmf: Vec3, b_mcmf: Vec3, n_steps: usize) -> bool {
    let steps = n_steps.max(2);
    for k in 1..steps {
        let t = k as f64 / steps as f64;
        let p = [
            a_mcmf[0] + (b_mcmf[0] - a_mcmf[0]) * t,
            a_mcmf[1] + (b_mcmf[1] - a_mcmf[1]) * t,
            a_mcmf[2] + (b_mcmf[2] - a_mcmf[2]) * t,
        ];
        let sel = mcmf_to_selenographic(p);
        let lat_deg = sel.lat_rad.to_degrees();
        let lon_deg = sel.lon_rad.to_degrees();
        // The point's radius vs the terrain radius at its ground track.
        if norm(p) < dem.surface_radius_m(lat_deg, lon_deg) - 1e-6 {
            return false;
        }
    }
    true
}

#[cfg(test)]
mod tests {
    use super::*;

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

    #[test]
    fn parse_round_trips() {
        let dem = DemTile::representative_south_polar();
        let text = dem.to_text();
        let back = DemTile::parse(&text).expect("parse");
        assert_eq!(back.n_lat, dem.n_lat);
        assert_eq!(back.n_lon, dem.n_lon);
        assert_eq!(back.heights_m.len(), dem.heights_m.len());
        for (a, b) in back.heights_m.iter().zip(&dem.heights_m) {
            assert!((a - b).abs() < 1e-6);
        }
    }

    #[test]
    fn height_at_matches_grid_nodes_and_interpolates() {
        // Oracle: bilinear interpolation is exact at grid nodes and is the arithmetic
        // mean at a cell centre of a known 2x2 patch.
        let dem = DemTile {
            lat_min_deg: -90.0,
            lat_max_deg: -80.0,
            lon_min_deg: 0.0,
            lon_max_deg: 10.0,
            n_lat: 2,
            n_lon: 2,
            heights_m: vec![0.0, 100.0, 200.0, 300.0],
        };
        assert!((dem.height_at(-90.0, 0.0) - 0.0).abs() < 1e-9);
        assert!((dem.height_at(-90.0, 10.0) - 100.0).abs() < 1e-9);
        assert!((dem.height_at(-80.0, 0.0) - 200.0).abs() < 1e-9);
        assert!((dem.height_at(-80.0, 10.0) - 300.0).abs() < 1e-9);
        // Centre = mean of the four corners.
        assert!((dem.height_at(-85.0, 5.0) - 150.0).abs() < 1e-9);
    }

    #[test]
    fn terrain_blocks_a_line_through_a_ridge_and_passes_a_clear_one() {
        // Oracle: a flat 2x2 tile with a tall central... use an explicit wall. A DEM
        // with a high rim between two low points blocks the LOS; removing it clears.
        // Two users at 2 m height, 6 km apart across a 3000 m ridge in the middle.
        let a = site(-85.0, 0.0, 2.0);
        let b = site(-85.0, 0.2, 2.0); // ~6 km east along the surface
                                       // Ridge tile spanning the pair, with a 3000 m wall at the midpoint longitude.
        let wall = DemTile {
            lat_min_deg: -86.0,
            lat_max_deg: -84.0,
            lon_min_deg: -0.1,
            lon_max_deg: 0.3,
            n_lat: 3,
            n_lon: 3,
            // Row-major: the centre column (lon ~0.1, the midpoint) is a 3000 m wall.
            heights_m: vec![
                0.0, 3000.0, 0.0, //
                0.0, 3000.0, 0.0, //
                0.0, 3000.0, 0.0,
            ],
        };
        assert!(
            !terrain_los_clear(&wall, a, b, 64),
            "the 3 km wall must occlude the line"
        );
        // Flat tile (no relief): the same short, near-horizontal segment is clear.
        let flat = DemTile {
            heights_m: vec![0.0; 9],
            ..wall.clone()
        };
        assert!(
            terrain_los_clear(&flat, a, b, 64),
            "a flat tile must not occlude a 6 km near-surface segment"
        );
    }

    #[test]
    fn representative_tile_has_a_rim_above_the_basin() {
        // Sanity on the Modelled fixture: the rim (colat ~5 deg) rises above the polar
        // basin (colat ~0 deg).
        let dem = DemTile::representative_south_polar();
        let rim = dem.height_at(-85.0, 0.0); // colat 5
        let basin = dem.height_at(-90.0, 0.0); // colat 0
        assert!(
            rim > basin + 1000.0,
            "rim {rim} should top the basin {basin}"
        );
    }
}
