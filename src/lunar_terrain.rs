// SPDX-License-Identifier: AGPL-3.0-only
//! Azimuth-dependent **terrain horizon masks** for lunar surface sites.
//!
//! Until 0.36 every lunar visibility test was a flat elevation cut (`mask_deg`): a
//! satellite counted when its elevation above the local spherical horizontal cleared one
//! number, whatever its azimuth. At the south pole the terrain blocks much more of the sky
//! than that in some directions (massifs, crater walls) and less in others. This module
//! gives each site its own horizon, carried in the 0.36 skyline format
//! ([`crate::skyline::Skyline`], a table of `(azimuth, elevation)` rows linearly
//! interpolated with wrap at 360°), from one or both of two sources:
//!
//! 1. **A stated horizon profile** ([`StatedHorizon`]): rows `[azimuth_deg,
//!    elevation_deg]` given in the scenario, labelled with their source.
//! 2. **A horizon derived from a lunar digital elevation model** ([`PolarDem`]): a polar
//!    stereographic height grid (the LRO LOLA gridded polar product's layout) read from a
//!    small descriptor file, ray-marched from the site ([`horizon_profile`]).
//!
//! Where a site has both, the two tables are kept separate in one skyline, so the cut is
//! their pointwise maximum (the skyline's own rule) and adding a source never lowers it.
//!
//! ## The ray march
//!
//! The observer stands `antenna_height_m` above the terrain at the site, at Moon-centred
//! radius `R_ref + h(site) + antenna_height_m` along the site's up vector `û`. Along azimuth
//! `a` (clockwise from local north, in the basis [`crate::lunar_service::topocentric_basis`]
//! that [`crate::lunar_service::topocentric`] measures satellite azimuths in), the ray is
//! the great circle leaving the site in the direction `d̂ = cos a n̂ + sin a ê`. At arc
//! length `s_k = k Δs` (`k = 1, 2, …`) the terrain point is
//!
//! ```text
//! P_k = (R_ref + h(p̂_k)) p̂_k,   p̂_k = cos(s_k / R_ref) û + sin(s_k / R_ref) d̂
//! ```
//!
//! and its elevation seen from the observer `O` is `atan2((P_k − O)·û, |(P_k − O) −
//! ((P_k − O)·û) û|)`. The horizon along `a` is the largest elevation over `k` until
//! `s_k` reaches `max_range_m` or the ray leaves the grid. The Moon's curvature is exact
//! (the points are placed on the sphere, not on a tangent plane), so no curvature
//! correction term is added; unlike the Earth skyline's terrain points there is no
//! refraction factor (no atmosphere).
//!
//! The skyline format stores elevations in `[0, 90)`: a horizon below the local horizontal
//! (a site on a summit, whose horizon dips) is stored as 0, so the effective cut is
//! `max(mask_deg, horizon)` for any `mask_deg >= 0`.
//!
//! ## What this is and is not
//!
//! MODELLED. The horizon is line of sight over the grid the DEM gives, at its resolution:
//! relief smaller than a pixel is smoothed away (the vendored crop is a 5 × 5 block mean,
//! 1200 m per pixel), a ray that leaves the grid ends there (the horizon beyond the crop is
//! then a lower bound), and the grid is bilinearly interpolated. No diffraction, no
//! multipath off the terrain, no partial obstruction. Site positions used for ranging stay
//! where the scenario puts them; the DEM sets the horizon only.

use crate::lunar::{selenographic_to_mcmf, Selenographic};
use crate::lunar_service::topocentric_basis;
use crate::skyline::{Skyline, SkylineCfg};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::path::Path;

type Vec3 = [f64; 3];

/// The honesty statement a terrain echo carries.
pub const NOTE: &str = "MODELLED. Line-of-sight horizon per site: a stated profile labelled \
     with its source, and/or a ray march over the DEM at its grid resolution with the Moon's \
     radius and curvature (bilinear heights; rays end at max_range_km or the grid edge, so a \
     horizon beyond the grid is a lower bound). No diffraction, terrain multipath or partial \
     obstruction; relief below a pixel is smoothed away. Site positions used for ranging are \
     unchanged: the terrain sets the horizon only.";

/// Default antenna height above the terrain (m): a stated choice, a mast on a lander deck.
pub const DEFAULT_ANTENNA_HEIGHT_M: f64 = 2.0;
/// Default azimuth step of a DEM horizon (deg).
pub const DEFAULT_AZIMUTH_STEP_DEG: f64 = 1.0;
/// Default ray length of a DEM horizon (km).
pub const DEFAULT_MAX_RANGE_KM: f64 = 150.0;
/// Largest DEM grid side a descriptor may declare (pixels): an input cap.
pub const MAX_DEM_SIDE: usize = 8192;

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn unit(v: Vec3) -> Vec3 {
    let n = dot(v, v).sqrt();
    [v[0] / n, v[1] / n, v[2] / n]
}

// ───────────────────────────────────────────────────────────────────────────
// Height fields
// ───────────────────────────────────────────────────────────────────────────

/// A surface: a height above a reference sphere as a function of direction.
pub trait HeightField {
    /// Radius of the reference sphere the heights are measured from (m).
    fn reference_radius_m(&self) -> f64;
    /// Height (m) above the reference sphere along the Moon-fixed unit vector `dir`;
    /// `None` outside the field's extent.
    fn height_m(&self, dir: Vec3) -> Option<f64>;
}

/// A south polar stereographic height grid in the layout of the LRO LOLA gridded polar
/// products: spherical, true at the pole, longitude 0 up and 90° E to the right; pixel
/// centres at `x = (sample − (samples/2 − 0.5)) · map_scale_m` and `y = ((lines/2 − 0.5) −
/// line) · map_scale_m` (0-based), and at stereographic radius `ρ = 2 R tan(c / 2)` from the
/// pole for colatitude `c` from the pole, `x = ρ sin λ`, `y = ρ cos λ`.
#[derive(Clone, Debug)]
pub struct PolarDem {
    /// Lines (rows).
    pub lines: usize,
    /// Samples per line.
    pub samples: usize,
    /// Pixel size at the pole (m).
    pub map_scale_m: f64,
    /// Radius of the projection sphere and of the height reference (m).
    pub reference_radius_m: f64,
    /// Heights (m), row-major, line 0 first.
    pub heights_m: Vec<f32>,
}

impl PolarDem {
    /// A grid from its heights (row-major, line 0 first). Refuses a size mismatch.
    pub fn from_heights(
        lines: usize,
        samples: usize,
        map_scale_m: f64,
        reference_radius_m: f64,
        heights_m: Vec<f32>,
    ) -> Result<Self, String> {
        if lines < 2 || samples < 2 || lines > MAX_DEM_SIDE || samples > MAX_DEM_SIDE {
            return Err(format!(
                "dem: lines and samples must be 2 to {MAX_DEM_SIDE}, got {lines} x {samples}"
            ));
        }
        if heights_m.len() != lines * samples {
            return Err(format!(
                "dem: {} heights for a {lines} x {samples} grid",
                heights_m.len()
            ));
        }
        if !(map_scale_m.is_finite() && map_scale_m > 0.0) {
            return Err(format!(
                "dem: map_scale_m must be positive, got {map_scale_m}"
            ));
        }
        if !(reference_radius_m.is_finite() && reference_radius_m > 0.0) {
            return Err(format!(
                "dem: reference_radius_m must be positive, got {reference_radius_m}"
            ));
        }
        Ok(Self {
            lines,
            samples,
            map_scale_m,
            reference_radius_m,
            heights_m,
        })
    }

    /// Map coordinates `(x, y)` (m) of a Moon-fixed unit vector in the southern hemisphere's
    /// stereographic projection: `tan(c / 2) = sqrt(u_x² + u_y²) / (1 − u_z)`, so `x = 2R u_y /
    /// (1 − u_z)` and `y = 2R u_x / (1 − u_z)`. `None` at the north pole.
    pub fn project(&self, dir: Vec3) -> Option<(f64, f64)> {
        let den = 1.0 - dir[2];
        if den <= 1e-12 {
            return None;
        }
        let k = 2.0 * self.reference_radius_m / den;
        Some((k * dir[1], k * dir[0]))
    }

    /// Continuous 0-based `(line, sample)` of map coordinates `(x, y)`.
    pub fn pixel(&self, x: f64, y: f64) -> (f64, f64) {
        let l = (self.lines as f64 / 2.0 - 0.5) - y / self.map_scale_m;
        let s = x / self.map_scale_m + (self.samples as f64 / 2.0 - 0.5);
        (l, s)
    }

    fn at(&self, l: usize, s: usize) -> f64 {
        self.heights_m[l * self.samples + s] as f64
    }

    /// Bilinear height at continuous `(line, sample)`; `None` outside the pixel centres.
    pub fn bilinear(&self, l: f64, s: f64) -> Option<f64> {
        let lmax = (self.lines - 1) as f64;
        let smax = (self.samples - 1) as f64;
        if !(l >= 0.0 && l <= lmax && s >= 0.0 && s <= smax) {
            return None;
        }
        let l0 = (l.floor() as usize).min(self.lines - 2);
        let s0 = (s.floor() as usize).min(self.samples - 2);
        let (tl, ts) = (l - l0 as f64, s - s0 as f64);
        let top = self.at(l0, s0) * (1.0 - ts) + self.at(l0, s0 + 1) * ts;
        let bot = self.at(l0 + 1, s0) * (1.0 - ts) + self.at(l0 + 1, s0 + 1) * ts;
        Some(top * (1.0 - tl) + bot * tl)
    }

    /// Bilinear height (m) at a selenographic latitude and longitude (deg).
    pub fn height_at_deg(&self, lat_deg: f64, lon_deg: f64) -> Option<f64> {
        let (la, lo) = (lat_deg.to_radians(), lon_deg.to_radians());
        self.height_m([la.cos() * lo.cos(), la.cos() * lo.sin(), la.sin()])
    }

    /// Load a DEM from its descriptor ([`DemDescriptor`], TOML). The image path is
    /// relative to the descriptor's directory; its size and SHA-256 must match the
    /// descriptor.
    pub fn load(descriptor_path: &str) -> Result<(Self, DemEcho), String> {
        let text = std::fs::read_to_string(descriptor_path)
            .map_err(|e| format!("dem: cannot read {descriptor_path}: {e}"))?;
        let d: DemDescriptor =
            toml::from_str(&text).map_err(|e| format!("dem: {descriptor_path}: {e}"))?;
        if d.projection != "south-polar-stereographic" {
            return Err(format!(
                "dem: projection must be south-polar-stereographic, got {}",
                d.projection
            ));
        }
        if d.sample_type != "int16-le" {
            return Err(format!(
                "dem: sample_type must be int16-le, got {}",
                d.sample_type
            ));
        }
        let dir = Path::new(descriptor_path)
            .parent()
            .unwrap_or_else(|| Path::new("."));
        let img = dir.join(&d.image);
        let bytes =
            std::fs::read(&img).map_err(|e| format!("dem: cannot read {}: {e}", img.display()))?;
        if d.lines > MAX_DEM_SIDE || d.samples > MAX_DEM_SIDE {
            return Err(format!("dem: grid over the {MAX_DEM_SIDE}-pixel cap"));
        }
        if bytes.len() != d.lines * d.samples * 2 {
            return Err(format!(
                "dem: {} is {} bytes; {} x {} int16 needs {}",
                img.display(),
                bytes.len(),
                d.lines,
                d.samples,
                d.lines * d.samples * 2
            ));
        }
        let digest = hex(&Sha256::digest(&bytes));
        if digest != d.image_sha256.to_ascii_lowercase() {
            return Err(format!(
                "dem: {} SHA-256 {digest} does not match the descriptor's {}",
                img.display(),
                d.image_sha256
            ));
        }
        if !(d.scaling_factor.is_finite() && d.scaling_factor > 0.0) {
            return Err("dem: scaling_factor must be positive".into());
        }
        let heights = bytes
            .chunks_exact(2)
            .map(|c| (i16::from_le_bytes([c[0], c[1]]) as f64 * d.scaling_factor) as f32)
            .collect();
        let dem = Self::from_heights(
            d.lines,
            d.samples,
            d.map_scale_m,
            d.reference_radius_m,
            heights,
        )?;
        let echo = DemEcho {
            path: descriptor_path.to_string(),
            image_sha256: digest,
            source: d.source,
            lines: d.lines,
            samples: d.samples,
            map_scale_m: d.map_scale_m,
            reference_radius_m: d.reference_radius_m,
        };
        Ok((dem, echo))
    }
}

impl HeightField for PolarDem {
    fn reference_radius_m(&self) -> f64 {
        self.reference_radius_m
    }
    fn height_m(&self, dir: Vec3) -> Option<f64> {
        let (x, y) = self.project(dir)?;
        let (l, s) = self.pixel(x, y);
        self.bilinear(l, s)
    }
}

/// A latitude/longitude height grid read through [`crate::realdata::lola_dem`]: heights
/// above the mean lunar sphere ([`crate::lunar::R_MOON_M`]), bilinear in latitude and
/// longitude ([`crate::realdata::lola_dem::DemTile::height_at`]); `None` outside the tile's
/// latitude and longitude extent (longitude taken in `[lon_min, lon_min + 360)`).
impl HeightField for crate::realdata::lola_dem::DemTile {
    fn reference_radius_m(&self) -> f64 {
        crate::lunar::R_MOON_M
    }
    fn height_m(&self, dir: Vec3) -> Option<f64> {
        let r = (dir[0] * dir[0] + dir[1] * dir[1] + dir[2] * dir[2]).sqrt();
        if r.is_nan() || r <= 0.0 || self.heights_m.is_empty() {
            return None;
        }
        let lat = (dir[2] / r).clamp(-1.0, 1.0).asin().to_degrees();
        let lon = dir[1].atan2(dir[0]).to_degrees();
        let lon = self.lon_min_deg + (lon - self.lon_min_deg).rem_euclid(360.0);
        let inside = lat >= self.lat_min_deg
            && lat <= self.lat_max_deg
            && lon >= self.lon_min_deg
            && lon <= self.lon_max_deg;
        inside.then(|| self.height_at(lat, lon))
    }
}

/// A DEM the horizon ray march samples, with the pixel size that sets the default range
/// step (half a pixel).
pub trait DemGrid: HeightField {
    /// Representative pixel size (m).
    fn pixel_m(&self) -> f64;
    /// The grid as a plain height field.
    fn as_height_field(&self) -> &dyn HeightField;
}

impl DemGrid for PolarDem {
    fn pixel_m(&self) -> f64 {
        self.map_scale_m
    }
    fn as_height_field(&self) -> &dyn HeightField {
        self
    }
}

impl DemGrid for crate::realdata::lola_dem::DemTile {
    /// The latitude spacing as an arc on the mean sphere (the longitude spacing narrows
    /// toward the pole, so the latitude spacing is the coarser of the two there).
    fn pixel_m(&self) -> f64 {
        let n = self.n_lat.max(2) - 1;
        crate::lunar::R_MOON_M * ((self.lat_max_deg - self.lat_min_deg) / n as f64).to_radians()
    }
    fn as_height_field(&self) -> &dyn HeightField {
        self
    }
}

/// A latitude/longitude DEM tile as echoed in a result.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct DemTileEcho {
    /// The tile path as given.
    pub path: String,
    /// SHA-256 of the tile text read.
    pub sha256: String,
    /// The format read.
    pub format: &'static str,
    /// Southern edge (deg).
    pub lat_min_deg: f64,
    /// Northern edge (deg).
    pub lat_max_deg: f64,
    /// Western edge (deg).
    pub lon_min_deg: f64,
    /// Eastern edge (deg).
    pub lon_max_deg: f64,
    /// Latitude rows.
    pub n_lat: usize,
    /// Longitude columns.
    pub n_lon: usize,
    /// The latitude spacing as an arc (m).
    pub pixel_m: f64,
}

/// Read a latitude/longitude DEM tile in the [`crate::realdata::lola_dem::DemTile::parse`]
/// text format, with its provenance.
pub fn load_dem_tile(
    path: &str,
) -> Result<(crate::realdata::lola_dem::DemTile, DemTileEcho), String> {
    let text =
        std::fs::read_to_string(path).map_err(|e| format!("dem_tile: cannot read {path}: {e}"))?;
    let tile = crate::realdata::lola_dem::DemTile::parse(&text)
        .map_err(|e| format!("dem_tile: {path}: {e}"))?;
    let extent_ok = tile.lat_min_deg < tile.lat_max_deg
        && tile.lon_min_deg < tile.lon_max_deg
        && tile.lat_min_deg >= -90.0
        && tile.lat_max_deg <= 90.0
        && tile.lon_max_deg - tile.lon_min_deg <= 360.0;
    if tile.n_lat < 2
        || tile.n_lon < 2
        || !extent_ok
        || tile.heights_m.iter().any(|h| !h.is_finite())
    {
        return Err(format!(
            "dem_tile: {path}: needs at least 2 x 2 points, an increasing extent inside [-90, 90] deg and 360 deg of longitude, and finite heights"
        ));
    }
    let echo = DemTileEcho {
        path: path.to_string(),
        sha256: hex(&Sha256::digest(text.as_bytes())),
        format: "realdata::lola_dem text tile (lat/lon grid, heights above the mean sphere)",
        lat_min_deg: tile.lat_min_deg,
        lat_max_deg: tile.lat_max_deg,
        lon_min_deg: tile.lon_min_deg,
        lon_max_deg: tile.lon_max_deg,
        n_lat: tile.n_lat,
        n_lon: tile.n_lon,
        pixel_m: tile.pixel_m(),
    };
    Ok((tile, echo))
}

/// A DEM read for a run: the polar stereographic grid or a latitude/longitude tile.
enum LoadedDem {
    Polar(PolarDem, DemEcho),
    Tile(crate::realdata::lola_dem::DemTile, DemTileEcho),
}

impl LoadedDem {
    fn grid(&self) -> &dyn DemGrid {
        match self {
            LoadedDem::Polar(d, _) => d,
            LoadedDem::Tile(t, _) => t,
        }
    }
    fn polar_echo(&self) -> Option<DemEcho> {
        match self {
            LoadedDem::Polar(_, e) => Some(e.clone()),
            LoadedDem::Tile(..) => None,
        }
    }
    fn tile_echo(&self) -> Option<DemTileEcho> {
        match self {
            LoadedDem::Tile(_, e) => Some(e.clone()),
            LoadedDem::Polar(..) => None,
        }
    }
}

fn hex(b: &[u8]) -> String {
    b.iter().map(|x| format!("{x:02x}")).collect()
}

/// The TOML descriptor of a vendored DEM grid.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct DemDescriptor {
    /// The image file, relative to the descriptor.
    pub image: String,
    /// SHA-256 of the image (lower-case hex).
    pub image_sha256: String,
    /// `south-polar-stereographic`.
    pub projection: String,
    /// `int16-le`.
    pub sample_type: String,
    /// Lines.
    pub lines: usize,
    /// Samples per line.
    pub samples: usize,
    /// Pixel size at the pole (m).
    pub map_scale_m: f64,
    /// Projection and height reference radius (m).
    pub reference_radius_m: f64,
    /// Height (m) per stored integer.
    pub scaling_factor: f64,
    /// Where the grid came from.
    pub source: String,
}

/// The DEM a run read, as echoed in the result.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct DemEcho {
    /// The descriptor path as given.
    pub path: String,
    /// SHA-256 of the image read.
    pub image_sha256: String,
    /// The descriptor's source line.
    pub source: String,
    /// Lines.
    pub lines: usize,
    /// Samples per line.
    pub samples: usize,
    /// Pixel size at the pole (m).
    pub map_scale_m: f64,
    /// Height reference radius (m).
    pub reference_radius_m: f64,
}

// ───────────────────────────────────────────────────────────────────────────
// Horizon
// ───────────────────────────────────────────────────────────────────────────

/// Ray-march settings.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct HorizonParams {
    /// Antenna height above the terrain at the site (m).
    pub antenna_height_m: f64,
    /// Azimuth step (deg); azimuths `0, step, 2 step, …` below 360.
    pub azimuth_step_deg: f64,
    /// Arc-length step along each ray (m).
    pub range_step_m: f64,
    /// Longest ray (m).
    pub max_range_m: f64,
}

/// A site's horizon from a height field.
#[derive(Clone, Debug, PartialEq)]
pub struct Horizon {
    /// `(azimuth_deg, elevation_deg)`, elevation unclamped (negative below the local
    /// horizontal).
    pub profile: Vec<(f64, f64)>,
    /// Terrain height at the site (m above the reference sphere).
    pub site_height_m: f64,
    /// Azimuths whose ray left the field before `max_range_m`.
    pub rays_truncated: usize,
}

impl Horizon {
    /// The skyline table rows of this horizon: elevations floored at 0 (the skyline
    /// format's range).
    pub fn table_rows(&self) -> Vec<[f64; 2]> {
        self.profile.iter().map(|&(a, e)| [a, e.max(0.0)]).collect()
    }
}

/// The horizon of the site whose Moon-fixed up vector is `site_up` over `field`, by the
/// ray march in the module documentation. Refuses a site outside the field and bad
/// parameters.
pub fn horizon_profile(
    field: &dyn HeightField,
    site_up: Vec3,
    p: &HorizonParams,
) -> Result<Horizon, String> {
    for (what, v) in [
        ("azimuth_step_deg", p.azimuth_step_deg),
        ("range_step_m", p.range_step_m),
        ("max_range_m", p.max_range_m),
    ] {
        if !(v.is_finite() && v > 0.0) {
            return Err(format!(
                "terrain: {what} must be finite and positive, got {v}"
            ));
        }
    }
    if !(p.antenna_height_m.is_finite() && p.antenna_height_m >= 0.0) {
        return Err(format!(
            "terrain: antenna_height_m must be finite and not negative, got {}",
            p.antenna_height_m
        ));
    }
    if p.azimuth_step_deg > 90.0 {
        return Err("terrain: azimuth_step_deg must be at most 90".into());
    }
    let n_steps = (p.max_range_m / p.range_step_m).floor() as usize;
    if n_steps == 0 || n_steps > 1_000_000 {
        return Err("terrain: max_range_m / range_step_m must be 1 to 1e6".into());
    }
    let (east, north, up) = topocentric_basis(site_up);
    let r_ref = field.reference_radius_m();
    let site_h = field
        .height_m(up)
        .ok_or("terrain: the site is outside the height field")?;
    let r_obs = r_ref + site_h + p.antenna_height_m;
    let obs = [r_obs * up[0], r_obs * up[1], r_obs * up[2]];
    let n_az = (360.0 / p.azimuth_step_deg - 1e-9).ceil() as usize;
    let mut profile = Vec::with_capacity(n_az);
    let mut truncated = 0usize;
    for i in 0..n_az {
        let az = i as f64 * p.azimuth_step_deg;
        let (sa, ca) = az.to_radians().sin_cos();
        let d = [
            ca * north[0] + sa * east[0],
            ca * north[1] + sa * east[1],
            ca * north[2] + sa * east[2],
        ];
        let mut best = -90.0_f64;
        for k in 1..=n_steps {
            let th = k as f64 * p.range_step_m / r_ref;
            let (st, ct) = th.sin_cos();
            let dir = [
                ct * up[0] + st * d[0],
                ct * up[1] + st * d[1],
                ct * up[2] + st * d[2],
            ];
            let Some(h) = field.height_m(dir) else {
                truncated += 1;
                break;
            };
            let r = r_ref + h;
            let v = [
                r * dir[0] - obs[0],
                r * dir[1] - obs[1],
                r * dir[2] - obs[2],
            ];
            let vu = dot(v, up);
            let horiz = [v[0] - vu * up[0], v[1] - vu * up[1], v[2] - vu * up[2]];
            let el = vu.atan2(dot(horiz, horiz).sqrt()).to_degrees();
            if el > best {
                best = el;
            }
        }
        profile.push((az, best));
    }
    Ok(Horizon {
        profile,
        site_height_m: site_h,
        rays_truncated: truncated,
    })
}

// ───────────────────────────────────────────────────────────────────────────
// Scenario configuration
// ───────────────────────────────────────────────────────────────────────────

/// A horizon profile stated in the scenario, in the skyline table format.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct StatedHorizon {
    /// Where the profile comes from (a citation, or `ILLUSTRATIVE: …`). Required.
    pub source: String,
    /// Rows `[azimuth_deg, elevation_deg]`, azimuths strictly increasing in `[0, 360)`,
    /// elevations in `[0, 90)`, linearly interpolated in azimuth with wrap at 360°.
    pub table: Vec<[f64; 2]>,
}

impl StatedHorizon {
    /// The skyline this profile describes, built and checked by the skyline section's own
    /// table rules ([`SkylineCfg::build`]).
    pub fn skyline(&self) -> Result<Skyline, String> {
        if self.source.trim().is_empty() {
            return Err("terrain: a stated horizon needs a non-empty source".into());
        }
        SkylineCfg {
            table: Some(self.table.clone()),
            ..SkylineCfg::default()
        }
        .build()
        .map_err(|e| format!("terrain: stated horizon: {e}"))
    }
}

fn d_antenna_height_m() -> f64 {
    DEFAULT_ANTENNA_HEIGHT_M
}
fn d_azimuth_step_deg() -> f64 {
    DEFAULT_AZIMUTH_STEP_DEG
}
fn d_max_range_km() -> f64 {
    DEFAULT_MAX_RANGE_KM
}

/// The `[terrain]` section of a lunar scenario. Absent, every site keeps the flat mask.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct LunarTerrainCfg {
    /// A DEM descriptor ([`DemDescriptor`]); every site gets a ray-marched horizon from it.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub dem_path: Option<String>,
    /// A latitude/longitude DEM tile in the [`crate::realdata::lola_dem`] text format, in
    /// place of `dem_path` (not both): every site gets a ray-marched horizon from it.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub dem_tile_path: Option<String>,
    /// Antenna height above the terrain for the DEM horizon (m).
    #[serde(default = "d_antenna_height_m")]
    pub antenna_height_m: f64,
    /// Azimuth step of the DEM horizon (deg).
    #[serde(default = "d_azimuth_step_deg")]
    pub azimuth_step_deg: f64,
    /// Arc-length step along each ray (m); default half the DEM pixel.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub range_step_m: Option<f64>,
    /// Longest ray (km).
    #[serde(default = "d_max_range_km")]
    pub max_range_km: f64,
    /// A stated horizon at the reference station.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub station_horizon: Option<StatedHorizon>,
    /// A stated horizon applied at every user point.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub user_horizon: Option<StatedHorizon>,
}

/// One site's horizon as echoed in a result.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct SiteHorizonEcho {
    /// The horizon's sources: the stated profile's `source`, and `dem` for the DEM.
    pub sources: Vec<String>,
    /// Terrain height at the site from the DEM (m above the reference sphere).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub dem_site_height_m: Option<f64>,
    /// DEM rays that left the grid before `max_range_km`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub dem_rays_truncated: Option<usize>,
    /// The highest horizon elevation (deg) over the whole-degree profile.
    pub horizon_max_deg: f64,
    /// Its azimuth (deg).
    pub horizon_max_az_deg: f64,
    /// Share of the upper hemisphere's solid angle above `max(mask, horizon)`.
    pub sky_open_fraction: f64,
    /// The horizon (deg) at every whole degree of azimuth from north.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub profile_deg: Option<Vec<f64>>,
}

/// The source entry of a site outside the DEM where the caller lets it keep the flat
/// mask (the service-volume grid).
pub const OUTSIDE_DEM: &str = "outside the dem: flat mask";

/// One site's resolved mask.
#[derive(Clone, Debug)]
pub struct SiteMask {
    /// The skyline (empty for a flat site).
    pub skyline: Skyline,
    /// The echo.
    pub echo: SiteHorizonEcho,
}

/// The masks of a station and its user points.
#[derive(Clone, Debug)]
pub struct ResolvedTerrain {
    /// The polar DEM read, if any.
    pub dem: Option<DemEcho>,
    /// The latitude/longitude DEM tile read, if any.
    pub dem_tile: Option<DemTileEcho>,
    /// The reference station's mask.
    pub station: SiteMask,
    /// Each user point's mask, in the order given.
    pub users: Vec<SiteMask>,
}

/// Selenographic `(lat_deg, lon_deg)` to the Moon-fixed unit up vector.
pub fn up_of(lat_deg: f64, lon_deg: f64) -> Vec3 {
    unit(selenographic_to_mcmf(Selenographic {
        lat_rad: lat_deg.to_radians(),
        lon_rad: lon_deg.to_radians(),
        alt_m: 0.0,
    }))
}

impl LunarTerrainCfg {
    /// Check the section on its own (the DEM is read by [`Self::resolve`]).
    pub fn validate(&self) -> Result<(), String> {
        if self.dem_path.is_none()
            && self.dem_tile_path.is_none()
            && self.station_horizon.is_none()
            && self.user_horizon.is_none()
        {
            return Err(
                "terrain: give dem_path, dem_tile_path, station_horizon or user_horizon (or omit [terrain])"
                    .into(),
            );
        }
        if self.dem_path.is_some() && self.dem_tile_path.is_some() {
            return Err("terrain: give dem_path or dem_tile_path, not both".into());
        }
        if let Some(s) = &self.station_horizon {
            s.skyline()?;
        }
        if let Some(s) = &self.user_horizon {
            s.skyline()?;
        }
        if !(self.max_range_km.is_finite() && self.max_range_km > 0.0) {
            return Err("terrain: max_range_km must be finite and positive".into());
        }
        if let Some(r) = self.range_step_m {
            if !(r.is_finite() && r > 0.0) {
                return Err("terrain: range_step_m must be finite and positive".into());
            }
        }
        Ok(())
    }

    fn params(&self, dem: &dyn DemGrid) -> HorizonParams {
        HorizonParams {
            antenna_height_m: self.antenna_height_m,
            azimuth_step_deg: self.azimuth_step_deg,
            range_step_m: self.range_step_m.unwrap_or(0.5 * dem.pixel_m()),
            max_range_m: self.max_range_km * 1000.0,
        }
    }

    #[allow(clippy::too_many_arguments)]
    fn site(
        &self,
        stated: Option<&StatedHorizon>,
        dem: Option<&dyn DemGrid>,
        lat_deg: f64,
        lon_deg: f64,
        mask_deg: f64,
        with_profile: bool,
        allow_outside: bool,
    ) -> Result<SiteMask, String> {
        let mut sky = Skyline::none();
        let mut sources = Vec::new();
        if let Some(s) = stated {
            sky.tables.extend(s.skyline()?.tables);
            sources.push(s.source.clone());
        }
        let (mut h_site, mut trunc) = (None, None);
        let dem = dem.filter(|d| {
            let inside = d.height_m(up_of(lat_deg, lon_deg)).is_some();
            if !inside && allow_outside {
                sources.push(OUTSIDE_DEM.to_string());
            }
            inside || !allow_outside
        });
        if let Some(dem) = dem {
            let h = horizon_profile(
                dem.as_height_field(),
                up_of(lat_deg, lon_deg),
                &self.params(dem),
            )
            .map_err(|e| format!("{e} (site {lat_deg} deg, {lon_deg} deg)"))?;
            let cfg = SkylineCfg {
                table: Some(h.table_rows()),
                ..SkylineCfg::default()
            };
            sky.tables.extend(cfg.build()?.tables);
            sources.push("dem".to_string());
            h_site = Some(h.site_height_m);
            trunc = Some(h.rays_truncated);
        }
        let profile = sky.profile();
        let (mut best, mut best_az) = (f64::NEG_INFINITY, 0.0);
        for (i, &v) in profile.iter().enumerate() {
            if v > best {
                best = v;
                best_az = i as f64;
            }
        }
        let echo = SiteHorizonEcho {
            sources,
            dem_site_height_m: h_site,
            dem_rays_truncated: trunc,
            horizon_max_deg: best,
            horizon_max_az_deg: best_az,
            sky_open_fraction: sky.open_fraction_above(mask_deg.max(0.0)),
            profile_deg: with_profile.then_some(profile),
        };
        Ok(SiteMask { skyline: sky, echo })
    }

    /// One site's mask under `user_horizon` and the DEM, built exactly as a grid point's
    /// is in [`Self::resolve_grid`] (outside the DEM it keeps the flat mask), with its
    /// whole-degree profile: for a single named site such as the service volume's
    /// per-satellite export site.
    pub fn resolve_site(
        &self,
        lat_deg: f64,
        lon_deg: f64,
        mask_deg: f64,
    ) -> Result<SiteMask, String> {
        self.validate()?;
        let loaded = self.load_dem()?;
        let grid = loaded.as_ref().map(LoadedDem::grid);
        self.site(
            self.user_horizon.as_ref(),
            grid,
            lat_deg,
            lon_deg,
            mask_deg,
            true,
            true,
        )
    }

    /// Resolve the masks: read the DEM (if any) and build the station's and every user
    /// point's skyline. `users` are `(lat_deg, lon_deg)`.
    pub fn resolve(
        &self,
        station: (f64, f64),
        users: &[(f64, f64)],
        mask_deg: f64,
    ) -> Result<ResolvedTerrain, String> {
        self.validate()?;
        let loaded = self.load_dem()?;
        let mut r = self.resolve_inner(
            loaded.as_ref().map(LoadedDem::grid),
            station,
            users,
            mask_deg,
        )?;
        r.dem = loaded.as_ref().and_then(LoadedDem::polar_echo);
        r.dem_tile = loaded.as_ref().and_then(LoadedDem::tile_echo);
        Ok(r)
    }

    /// The DEM the section names, read: `dem_path` (polar stereographic) or `dem_tile_path`
    /// (latitude/longitude tile).
    fn load_dem(&self) -> Result<Option<LoadedDem>, String> {
        Ok(match (&self.dem_path, &self.dem_tile_path) {
            (Some(p), _) => {
                let (d, e) = PolarDem::load(p)?;
                Some(LoadedDem::Polar(d, e))
            }
            (None, Some(p)) => {
                let (t, e) = load_dem_tile(p)?;
                Some(LoadedDem::Tile(t, e))
            }
            (None, None) => None,
        })
    }

    /// [`Self::resolve`] with the DEM already in hand (or none).
    pub fn resolve_with(
        &self,
        dem: Option<(&PolarDem, DemEcho)>,
        station: (f64, f64),
        users: &[(f64, f64)],
        mask_deg: f64,
    ) -> Result<ResolvedTerrain, String> {
        let grid = dem.as_ref().map(|(d, _)| *d as &dyn DemGrid);
        let mut r = self.resolve_inner(grid, station, users, mask_deg)?;
        r.dem = dem.map(|(_, e)| e);
        Ok(r)
    }

    fn resolve_inner(
        &self,
        grid: Option<&dyn DemGrid>,
        station: (f64, f64),
        users: &[(f64, f64)],
        mask_deg: f64,
    ) -> Result<ResolvedTerrain, String> {
        let st = self.site(
            self.station_horizon.as_ref(),
            grid,
            station.0,
            station.1,
            mask_deg,
            true,
            false,
        )?;
        let us = users
            .iter()
            .map(|&(la, lo)| {
                self.site(
                    self.user_horizon.as_ref(),
                    grid,
                    la,
                    lo,
                    mask_deg,
                    false,
                    false,
                )
            })
            .collect::<Result<Vec<_>, _>>()?;
        Ok(ResolvedTerrain {
            dem: None,
            dem_tile: None,
            station: st,
            users: us,
        })
    }
}

impl LunarTerrainCfg {
    /// The masks of a grid of user points with no station (the service volume): the DEM
    /// (if any) at every point inside it, a point outside it keeping the flat mask (its
    /// sources say so), and `user_horizon` everywhere. `station_horizon` is refused.
    pub fn resolve_grid(&self, users: &[(f64, f64)], mask_deg: f64) -> Result<GridTerrain, String> {
        self.validate()?;
        if self.station_horizon.is_some() {
            return Err(
                "terrain: station_horizon has no station in this kind; use user_horizon".into(),
            );
        }
        let loaded = self.load_dem()?;
        let grid = loaded.as_ref().map(LoadedDem::grid);
        let sites = users
            .iter()
            .map(|&(la, lo)| {
                self.site(
                    self.user_horizon.as_ref(),
                    grid,
                    la,
                    lo,
                    mask_deg,
                    false,
                    true,
                )
            })
            .collect::<Result<Vec<_>, _>>()?;
        let n = sites.len().max(1) as f64;
        let echo = GridTerrainEcho {
            label: "MODELLED",
            dem: loaded.as_ref().and_then(LoadedDem::polar_echo),
            dem_tile: loaded.as_ref().and_then(LoadedDem::tile_echo),
            user_sources: self
                .user_horizon
                .iter()
                .map(|h| h.source.clone())
                .chain(
                    self.dem_path
                        .iter()
                        .chain(&self.dem_tile_path)
                        .map(|_| "dem".to_string()),
                )
                .collect(),
            n_points: sites.len(),
            n_points_outside_dem: if loaded.is_some() {
                sites
                    .iter()
                    .filter(|s| s.echo.sources.iter().any(|x| x == OUTSIDE_DEM))
                    .count()
            } else {
                0
            },
            horizon_max_deg_mean: sites.iter().map(|s| s.echo.horizon_max_deg).sum::<f64>() / n,
            horizon_max_deg_max: sites
                .iter()
                .map(|s| s.echo.horizon_max_deg)
                .fold(f64::NEG_INFINITY, f64::max),
            sky_open_fraction_mean: sites.iter().map(|s| s.echo.sky_open_fraction).sum::<f64>() / n,
            note: NOTE,
        };
        Ok(GridTerrain {
            masks: sites.into_iter().map(|s| s.skyline).collect(),
            echo,
        })
    }
}

/// The masks of a station-less grid ([`LunarTerrainCfg::resolve_grid`]).
#[derive(Clone, Debug)]
pub struct GridTerrain {
    /// One skyline per grid point, in grid order.
    pub masks: Vec<Skyline>,
    /// The echo.
    pub echo: GridTerrainEcho,
}

/// A station-less grid's terrain, as echoed in a result.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct GridTerrainEcho {
    /// `MODELLED`.
    pub label: &'static str,
    /// The DEM read, if any.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub dem: Option<DemEcho>,
    /// The latitude/longitude DEM tile read, if any.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub dem_tile: Option<DemTileEcho>,
    /// The horizon sources applied at every point.
    pub user_sources: Vec<String>,
    /// Grid points.
    pub n_points: usize,
    /// Grid points outside the DEM, which keep the flat mask (plus any stated horizon).
    pub n_points_outside_dem: usize,
    /// Mean over the points of the highest horizon (deg), unweighted.
    pub horizon_max_deg_mean: f64,
    /// The highest horizon over the points (deg).
    pub horizon_max_deg_max: f64,
    /// Mean over the points of the open-sky share above `max(mask, horizon)`, unweighted.
    pub sky_open_fraction_mean: f64,
    /// What the horizon masks model and omit.
    pub note: &'static str,
}

/// Whether `sat` is visible from `observer` (Moon-fixed, m): the flat test (`passes_flat`,
/// the caller's own `sin(elevation) >= sin(mask)` test, unchanged) and, when the site has a
/// horizon, an elevation at or above the horizon at the satellite's azimuth
/// ([`crate::lunar_service::topocentric`]). With an empty skyline this is exactly the flat
/// test and no azimuth is computed.
pub fn clears_horizon(sky: &Skyline, observer: Vec3, sat: Vec3, passes_flat: bool) -> bool {
    if !passes_flat {
        return false;
    }
    if sky.is_empty() {
        return true;
    }
    let (az, el, _) = crate::lunar_service::topocentric(observer, sat);
    el >= sky.cut_deg(az)
}

// ───────────────────────────────────────────────────────────────────────────
// Units of the terrain fields (added to a document only when it carries `[terrain]`)
// ───────────────────────────────────────────────────────────────────────────

macro_rules! fu {
    ($path:expr, $unit:expr, $prov:expr, $def:expr) => {
        crate::field_schema::FieldUnit {
            path: $path,
            unit: $unit,
            provenance: $prov,
            definition: $def,
        }
    };
}

/// Units of the `[terrain]` input echo under `prefix` (e.g. `inputs_echo.terrain`).
macro_rules! terrain_input_units {
    ($prefix:literal) => {
        [
            fu!(concat!($prefix, ".antenna_height_m"), "m", crate::field_schema::ProvenanceClass::Input, "antenna height above the terrain for the DEM horizon"),
            fu!(concat!($prefix, ".azimuth_step_deg"), "deg", crate::field_schema::ProvenanceClass::Input, "azimuth step of the DEM horizon"),
            fu!(concat!($prefix, ".range_step_m"), "m", crate::field_schema::ProvenanceClass::Input, "arc-length step along each DEM ray (default half the DEM pixel)"),
            fu!(concat!($prefix, ".max_range_km"), "km", crate::field_schema::ProvenanceClass::Input, "longest DEM ray"),
            fu!(concat!($prefix, ".station_horizon.table[][]"), "deg", crate::field_schema::ProvenanceClass::Input, "rows [azimuth, elevation] of the stated station horizon, azimuth clockwise from local north"),
            fu!(concat!($prefix, ".user_horizon.table[][]"), "deg", crate::field_schema::ProvenanceClass::Input, "rows [azimuth, elevation] of the stated horizon at every user point"),
        ]
    };
}

/// Units of a [`DemEcho`] under `prefix`.
macro_rules! dem_units {
    ($prefix:literal) => {
        [
            fu!(
                concat!($prefix, ".lines"),
                "count",
                crate::field_schema::ProvenanceClass::Input,
                "DEM grid lines, from its descriptor"
            ),
            fu!(
                concat!($prefix, ".samples"),
                "count",
                crate::field_schema::ProvenanceClass::Input,
                "DEM grid samples per line, from its descriptor"
            ),
            fu!(
                concat!($prefix, ".map_scale_m"),
                "m",
                crate::field_schema::ProvenanceClass::Input,
                "DEM pixel size at the pole, from its descriptor"
            ),
            fu!(
                concat!($prefix, ".reference_radius_m"),
                "m",
                crate::field_schema::ProvenanceClass::Constant,
                "radius of the DEM's projection sphere and height reference"
            ),
        ]
    };
}

/// The units the `lunar-station-coverage` document adds with a `[terrain]` section.
pub const STATION_TERRAIN_UNITS: &[crate::field_schema::FieldUnit] = &{
    use crate::field_schema::ProvenanceClass::*;
    let i = terrain_input_units!("inputs_echo.terrain");
    let d = dem_units!("terrain.dem");
    [
        i[0], i[1], i[2], i[3], i[4], i[5], d[0], d[1], d[2], d[3],
        fu!("points[].horizon_max_deg", "deg", Computed, "highest terrain horizon at the point over the whole-degree profile"),
        fu!("points[].sky_open_fraction", "1", Computed, "share of the upper hemisphere's solid angle above max(mask_deg, horizon) at the point"),
        fu!("points[].unavailable.terrain_masked", "count", Computed, "epochs with fewer than four satellites above the terrain horizon at the point although at least four clear the flat mask"),
        fu!("terrain.station.dem_site_height_m", "m", Measured, "terrain height at the station from the DEM (LOLA heights, resampled), above the reference sphere"),
        fu!("terrain.station.dem_rays_truncated", "count", Computed, "DEM rays from the station that left the grid before max_range_km"),
        fu!("terrain.station.horizon_max_deg", "deg", Computed, "highest horizon at the station over the whole-degree profile"),
        fu!("terrain.station.horizon_max_az_deg", "deg", Computed, "azimuth of that highest horizon, clockwise from local north"),
        fu!("terrain.station.sky_open_fraction", "1", Computed, "share of the upper hemisphere's solid angle above max(mask_deg, horizon) at the station"),
        fu!("terrain.station.profile_deg[]", "deg", Computed, "the station's horizon at every whole degree of azimuth from local north"),
        fu!("terrain.user_horizon_max_deg_mean", "deg", Computed, "area-weighted mean over the points of the highest horizon"),
        fu!("terrain.user_horizon_max_deg_max", "deg", Computed, "highest horizon over every point"),
        fu!("terrain.user_sky_open_fraction_mean", "1", Computed, "area-weighted mean over the points of the open-sky share"),
    ]
};

/// The units a terrain document adds when it reads a latitude/longitude DEM tile
/// (`terrain.dem_tile`, in both kinds).
pub const DEM_TILE_UNITS: &[crate::field_schema::FieldUnit] = &{
    use crate::field_schema::ProvenanceClass::*;
    [
        fu!("terrain.dem_tile.lat_min_deg", "deg", Input, "southern edge of the DEM tile"),
        fu!("terrain.dem_tile.lat_max_deg", "deg", Input, "northern edge of the DEM tile"),
        fu!("terrain.dem_tile.lon_min_deg", "deg", Input, "western edge of the DEM tile"),
        fu!("terrain.dem_tile.lon_max_deg", "deg", Input, "eastern edge of the DEM tile"),
        fu!("terrain.dem_tile.n_lat", "count", Input, "latitude rows of the DEM tile"),
        fu!("terrain.dem_tile.n_lon", "count", Input, "longitude columns of the DEM tile"),
        fu!("terrain.dem_tile.pixel_m", "m", Computed, "the tile's latitude spacing as an arc on the mean sphere; half of it is the default ray step"),
    ]
};

/// The units the `moonlight-service-volume` document adds when it has both a `terrain`
/// section and a per-satellite export site.
pub const EXPORT_SITE_TERRAIN_UNITS: &[crate::field_schema::FieldUnit] = &{
    use crate::field_schema::ProvenanceClass::*;
    [
        fu!("export_site_terrain.dem_site_height_m", "m", Measured, "terrain height at the export site from the DEM (LOLA heights, resampled), above the reference sphere"),
        fu!("export_site_terrain.dem_rays_truncated", "count", Computed, "DEM rays from the export site that left the grid before max_range_km"),
        fu!("export_site_terrain.horizon_max_deg", "deg", Computed, "highest horizon at the export site over the whole-degree profile"),
        fu!("export_site_terrain.horizon_max_az_deg", "deg", Computed, "azimuth of that highest horizon, clockwise from local north"),
        fu!("export_site_terrain.sky_open_fraction", "1", Computed, "share of the upper hemisphere's solid angle above max(elev_mask_deg, horizon) at the export site"),
        fu!("export_site_terrain.profile_deg[]", "deg", Computed, "the export site's horizon at every whole degree of azimuth from local north"),
    ]
};

/// The units the `moonlight-service-volume` document adds with a `terrain` section.
pub const GRID_TERRAIN_UNITS: &[crate::field_schema::FieldUnit] = &{
    use crate::field_schema::ProvenanceClass::*;
    let d = dem_units!("terrain.dem");
    [
        d[0], d[1], d[2], d[3],
        fu!("terrain.n_points", "count", Computed, "grid points given a terrain mask"),
        fu!("terrain.n_points_outside_dem", "count", Computed, "grid points outside the DEM, which keep the flat mask (plus any stated horizon)"),
        fu!("terrain.horizon_max_deg_mean", "deg", Computed, "unweighted mean over the grid points of the highest horizon"),
        fu!("terrain.horizon_max_deg_max", "deg", Computed, "highest horizon over the grid points"),
        fu!("terrain.sky_open_fraction_mean", "1", Computed, "unweighted mean over the grid points of the open-sky share above max(elev_mask_deg, horizon)"),
    ]
};

// ───────────────────────────────────────────────────────────────────────────
// Analytic surfaces (the closed-form checks)
// ───────────────────────────────────────────────────────────────────────────

/// A bare sphere of radius `radius_m` (height 0 everywhere): the horizon of an observer
/// `a` metres up is the dip `−acos(R / (R + a))`.
#[derive(Clone, Copy, Debug)]
pub struct BareSphere {
    /// Radius (m).
    pub radius_m: f64,
}

impl HeightField for BareSphere {
    fn reference_radius_m(&self) -> f64 {
        self.radius_m
    }
    fn height_m(&self, _dir: Vec3) -> Option<f64> {
        Some(0.0)
    }
}

/// A flat-floored circular crater cut into a plateau on a sphere: height 0 within arc
/// radius `rim_arc_m` of `centre` (a Moon-fixed unit vector), `plateau_m` beyond it. From
/// an observer `a` metres above the floor, at arc distance `δ` from the centre, the ray
/// along a direction making angle `β` with the direction to the centre meets the rim at arc
/// length `s` solving `cos θ_r = cos δ cos σ + sin δ sin σ cos β` (`σ = s / R`, `θ_r` the
/// rim's angular radius), and the horizon there is `atan2((R + H) cos σ − (R + a),
/// (R + H) sin σ)` (closed form: [`CraterInPlateau::closed_form_horizon_deg`]).
#[derive(Clone, Copy, Debug)]
pub struct CraterInPlateau {
    /// Sphere radius (m).
    pub radius_m: f64,
    /// Crater centre (unit vector).
    pub centre: Vec3,
    /// Rim radius as an arc length (m).
    pub rim_arc_m: f64,
    /// Plateau height above the floor (m).
    pub plateau_m: f64,
}

impl HeightField for CraterInPlateau {
    fn reference_radius_m(&self) -> f64 {
        self.radius_m
    }
    fn height_m(&self, dir: Vec3) -> Option<f64> {
        let ang = dot(dir, self.centre).clamp(-1.0, 1.0).acos();
        Some(if ang * self.radius_m <= self.rim_arc_m {
            0.0
        } else {
            self.plateau_m
        })
    }
}

impl CraterInPlateau {
    /// The closed-form horizon (deg) at azimuth `az_deg` from an observer `antenna_m` above
    /// the floor at `site_up` (inside the crater). The nearest plateau point is the highest
    /// in elevation whenever the plateau stands above the observer, which the caller
    /// ensures.
    pub fn closed_form_horizon_deg(&self, site_up: Vec3, antenna_m: f64, az_deg: f64) -> f64 {
        let r = self.radius_m;
        let (east, north, up) = topocentric_basis(site_up);
        let (sa, ca) = az_deg.to_radians().sin_cos();
        let d = [
            ca * north[0] + sa * east[0],
            ca * north[1] + sa * east[1],
            ca * north[2] + sa * east[2],
        ];
        // Along the ray, unit(p) . centre = a cos σ + b sin σ = ρ cos(σ − φ); the rim is
        // where that equals cos θ_r. Inside the crater ρ cos φ = a > cos θ_r, so |φ| < w and
        // the exit is the positive root σ = φ + w.
        let a_coef = dot(up, self.centre);
        let b_coef = dot(d, self.centre);
        let c = (self.rim_arc_m / r).cos();
        let rho = (a_coef * a_coef + b_coef * b_coef).sqrt();
        let phi = b_coef.atan2(a_coef);
        let sig = phi + (c / rho).clamp(-1.0, 1.0).acos();
        let (ss, cs) = sig.sin_cos();
        let rh = r + self.plateau_m;
        (rh * cs - (r + antenna_m)).atan2(rh * ss).to_degrees()
    }
}

/// An axisymmetric cone (a mountain) on a sphere: height `peak_m (1 − ψ R / base_arc_m)`
/// within arc radius `base_arc_m` of `centre`, 0 beyond. Used for a DEM-grid check whose
/// horizon toward the peak is the steepest line of sight to the cone's surface.
#[derive(Clone, Copy, Debug)]
pub struct Cone {
    /// Sphere radius (m).
    pub radius_m: f64,
    /// Peak direction (unit vector).
    pub centre: Vec3,
    /// Peak height (m).
    pub peak_m: f64,
    /// Base radius as an arc length (m).
    pub base_arc_m: f64,
}

impl HeightField for Cone {
    fn reference_radius_m(&self) -> f64 {
        self.radius_m
    }
    fn height_m(&self, dir: Vec3) -> Option<f64> {
        let s = dot(dir, self.centre).clamp(-1.0, 1.0).acos() * self.radius_m;
        Some((self.peak_m * (1.0 - s / self.base_arc_m)).max(0.0))
    }
}

/// Sample a height field onto an `n_lat × n_lon` latitude/longitude grid over the given
/// extent, in the [`crate::realdata::lola_dem::DemTile`] layout (for testing the tile path
/// against the field it was made from). A point outside the field reads as height 0.
pub fn rasterise_tile(
    field: &dyn HeightField,
    lat: (f64, f64),
    lon: (f64, f64),
    n_lat: usize,
    n_lon: usize,
) -> crate::realdata::lola_dem::DemTile {
    let mut heights_m = Vec::with_capacity(n_lat * n_lon);
    for i in 0..n_lat {
        let la = lat.0 + (lat.1 - lat.0) * i as f64 / (n_lat - 1) as f64;
        for j in 0..n_lon {
            let lo = lon.0 + (lon.1 - lon.0) * j as f64 / (n_lon - 1) as f64;
            heights_m.push(field.height_m(up_of(la, lo)).unwrap_or(0.0));
        }
    }
    crate::realdata::lola_dem::DemTile {
        lat_min_deg: lat.0,
        lat_max_deg: lat.1,
        lon_min_deg: lon.0,
        lon_max_deg: lon.1,
        n_lat,
        n_lon,
        heights_m,
    }
}

/// Rasterise a height field onto a south polar stereographic grid of `n × n` pixels at
/// `scale_m`, in the [`PolarDem`] layout (for testing the grid path against the field it
/// samples).
pub fn rasterise(field: &dyn HeightField, n: usize, scale_m: f64) -> Result<PolarDem, String> {
    let r = field.reference_radius_m();
    let mut h = Vec::with_capacity(n * n);
    for l in 0..n {
        for s in 0..n {
            let x = (s as f64 - (n as f64 / 2.0 - 0.5)) * scale_m;
            let y = ((n as f64 / 2.0 - 0.5) - l as f64) * scale_m;
            // Inverse stereographic (south): ρ = sqrt(x² + y²), c = 2 atan(ρ / 2R),
            // u = (sin c · y/ρ, sin c · x/ρ, −cos c).
            let rho = (x * x + y * y).sqrt();
            let c = 2.0 * (rho / (2.0 * r)).atan();
            let dir = if rho == 0.0 {
                [0.0, 0.0, -1.0]
            } else {
                [c.sin() * y / rho, c.sin() * x / rho, -c.cos()]
            };
            h.push(field.height_m(dir).unwrap_or(0.0) as f32);
        }
    }
    PolarDem::from_heights(n, n, scale_m, r, h)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar::R_MOON_M;

    fn params(step_m: f64, max_m: f64) -> HorizonParams {
        HorizonParams {
            antenna_height_m: 0.0,
            azimuth_step_deg: 10.0,
            range_step_m: step_m,
            max_range_m: max_m,
        }
    }

    #[test]
    fn projection_round_trips_through_the_rasteriser_layout() {
        let dem = PolarDem::from_heights(4, 4, 1000.0, R_MOON_M, vec![0.0; 16]).unwrap();
        for &(lat, lon) in &[(-89.0, 0.0), (-88.5, 90.0), (-89.9, -135.0)] {
            let u = up_of(lat, lon);
            let (x, y) = dem.project(u).unwrap();
            let c = (90.0_f64 + lat).to_radians();
            let rho = 2.0 * R_MOON_M * (c / 2.0).tan();
            let lo = lon.to_radians();
            assert!((x - rho * lo.sin()).abs() < 1e-6, "x at {lat},{lon}");
            assert!((y - rho * lo.cos()).abs() < 1e-6, "y at {lat},{lon}");
        }
        // Longitude 0 is up (smaller line index), 90 E to the right (larger sample).
        let (l0, s0) = dem.pixel(0.0, 0.0);
        let (l1, _) = dem.pixel(0.0, 1000.0);
        let (_, s2) = dem.pixel(1000.0, 0.0);
        assert!(l1 < l0 && s2 > s0);
    }

    #[test]
    fn bilinear_reproduces_a_plane_exactly() {
        let n = 5;
        let h: Vec<f32> = (0..n * n)
            .map(|i| (3 * (i / n) + 2 * (i % n)) as f32)
            .collect();
        let dem = PolarDem::from_heights(n, n, 1.0, R_MOON_M, h).unwrap();
        assert_eq!(dem.bilinear(1.25, 2.5), Some(3.0 * 1.25 + 2.0 * 2.5));
        assert_eq!(dem.bilinear(4.0, 4.0), Some(20.0));
        assert_eq!(dem.bilinear(4.01, 0.0), None);
        assert_eq!(dem.bilinear(-0.01, 0.0), None);
    }

    /// The bare sphere: the horizon is the geometric dip −acos(R / (R + a)) at every azimuth.
    #[test]
    fn bare_sphere_horizon_is_the_dip() {
        let s = BareSphere { radius_m: R_MOON_M };
        for &a in &[2.0, 10.0, 100.0] {
            let p = HorizonParams {
                antenna_height_m: a,
                ..params(10.0, 60_000.0)
            };
            let h = horizon_profile(&s, up_of(-89.0, 30.0), &p).unwrap();
            let dip = -(R_MOON_M / (R_MOON_M + a)).acos().to_degrees();
            for &(az, el) in &h.profile {
                // The sampled maximum sits at most one step from the tangent point; the
                // elevation curve is flat there, so the error is second order.
                assert!((el - dip).abs() < 1e-3, "a={a} az={az}: {el} vs {dip}");
            }
            assert_eq!(h.rays_truncated, 0);
        }
    }

    /// A crater in a plateau, observer at the centre and off centre: the ray-marched
    /// horizon matches the closed form at every azimuth, within the error of stepping past
    /// the rim by at most one step.
    #[test]
    fn crater_in_plateau_matches_the_closed_form() {
        let centre = up_of(-89.5, 45.0);
        let crater = CraterInPlateau {
            radius_m: R_MOON_M,
            centre,
            rim_arc_m: 10_000.0,
            plateau_m: 1500.0,
        };
        let step = 1.0;
        let (east, north, _) = topocentric_basis(centre);
        // Sites at 0, 4 and 7 km from the centre (so at least 3 km inside the rim), along
        // two different bearings.
        for &(off_m, t) in &[(0.0, north), (4_000.0, north), (7_000.0, east)] {
            let dl = off_m / R_MOON_M;
            let site = unit([
                dl.cos() * centre[0] + dl.sin() * t[0],
                dl.cos() * centre[1] + dl.sin() * t[1],
                dl.cos() * centre[2] + dl.sin() * t[2],
            ]);
            let p = HorizonParams {
                antenna_height_m: 2.0,
                azimuth_step_deg: 15.0,
                range_step_m: step,
                max_range_m: 40_000.0,
            };
            let h = horizon_profile(&crater, site, &p).unwrap();
            for &(az, el) in &h.profile {
                let cf = crater.closed_form_horizon_deg(site, 2.0, az);
                // d(el)/ds at the rim is below H / s^2 rad/m with s >= 3 km here, so one
                // 1 m step past the rim moves the elevation by under 0.01 deg.
                assert!(
                    (el - cf).abs() < 0.01,
                    "offset {off_m} m az {az}: {el} vs {cf}"
                );
            }
        }
    }

    /// The grid path: a cone rasterised onto a polar stereographic grid, loaded through
    /// the grid sampler, gives the same horizon as the analytic cone to within what a
    /// 200 m pixel and bilinear interpolation allow.
    #[test]
    fn rasterised_cone_matches_the_analytic_cone() {
        let cone = Cone {
            radius_m: R_MOON_M,
            centre: up_of(-89.0, 0.0),
            peak_m: 3000.0,
            base_arc_m: 15_000.0,
        };
        let dem = rasterise(&cone, 400, 200.0).unwrap();
        let site = up_of(-89.4, 0.0); // ~12 km from the peak, outside the base
        let p = HorizonParams {
            antenna_height_m: 2.0,
            azimuth_step_deg: 5.0,
            range_step_m: 50.0,
            max_range_m: 35_000.0,
        };
        let a = horizon_profile(&cone, site, &p).unwrap();
        let g = horizon_profile(&dem, site, &p).unwrap();
        let mut worst = 0.0_f64;
        for (x, y) in a.profile.iter().zip(&g.profile) {
            worst = worst.max((x.1 - y.1).abs());
        }
        // The cone's slope is atan(3000 / 15000) = 11.3 deg; a 200 m pixel blunts the apex
        // by at most one pixel of height (40 m) over >= 12 km, about 0.2 deg.
        assert!(worst < 0.25, "worst |grid - analytic| = {worst} deg");
        // The peak, seen from the south side, sets the highest horizon.
        let top = a
            .profile
            .iter()
            .cloned()
            .fold((0.0, -90.0), |m, v| if v.1 > m.1 { v } else { m });
        assert!(top.1 > 5.0, "the cone should stand above 5 deg: {top:?}");
    }

    #[test]
    fn a_cone_on_a_lat_lon_tile_matches_the_analytic_cone() {
        // The same cone as the polar-grid test, at 60 deg S, sampled onto a
        // realdata::lola_dem tile with 0.005 deg spacing (about 150 m in latitude).
        let cone = Cone {
            radius_m: R_MOON_M,
            centre: up_of(-60.0, 30.0),
            peak_m: 3000.0,
            base_arc_m: 15_000.0,
        };
        // Wide enough that every 30 km ray from the site stays inside it.
        let tile = rasterise_tile(&cone, (-61.5, -59.0), (26.0, 34.0), 501, 1601);
        let site = up_of(-60.4, 30.0); // about 12 km from the peak, outside the base
        let p = HorizonParams {
            antenna_height_m: 2.0,
            azimuth_step_deg: 5.0,
            range_step_m: 50.0,
            max_range_m: 30_000.0,
        };
        let a = horizon_profile(&cone, site, &p).unwrap();
        let g = horizon_profile(&tile, site, &p).unwrap();
        let worst = a
            .profile
            .iter()
            .zip(&g.profile)
            .map(|(x, y)| (x.1 - y.1).abs())
            .fold(0.0_f64, f64::max);
        // A 150 m pixel blunts the apex by at most about 30 m of height over >= 12 km.
        assert!(worst < 0.25, "worst |tile - analytic| = {worst} deg");
        assert_eq!(g.rays_truncated, 0, "every ray stays inside the tile");
        assert!((tile.pixel_m() - R_MOON_M * 0.005_f64.to_radians()).abs() < 1e-9);
    }

    #[test]
    fn a_lat_lon_tile_is_none_outside_and_wraps_longitude() {
        use crate::realdata::lola_dem::DemTile;
        let tile = DemTile {
            lat_min_deg: -10.0,
            lat_max_deg: 10.0,
            lon_min_deg: 170.0,
            lon_max_deg: 190.0,
            n_lat: 2,
            n_lon: 2,
            heights_m: vec![100.0; 4],
        };
        assert_eq!(tile.height_m(up_of(0.0, 180.0)), Some(100.0));
        // -175 deg is 185 deg in the tile's [170, 530) window.
        assert_eq!(tile.height_m(up_of(0.0, -175.0)), Some(100.0));
        assert_eq!(tile.height_m(up_of(0.0, 160.0)), None);
        assert_eq!(tile.height_m(up_of(20.0, 180.0)), None);
        assert_eq!(tile.reference_radius_m(), R_MOON_M);
    }

    #[test]
    fn stated_horizon_goes_through_the_skyline_rules() {
        let ok = StatedHorizon {
            source: "ILLUSTRATIVE".into(),
            table: vec![[0.0, 2.0], [180.0, 10.0]],
        };
        let sky = ok.skyline().unwrap();
        assert_eq!(sky.cut_deg(90.0), 6.0);
        let bad = StatedHorizon {
            source: "x".into(),
            table: vec![[10.0, 2.0], [5.0, 3.0]],
        };
        assert!(bad.skyline().is_err());
        let unlabelled = StatedHorizon {
            source: " ".into(),
            table: vec![[0.0, 2.0]],
        };
        assert!(unlabelled.skyline().is_err());
    }

    #[test]
    fn an_empty_skyline_is_exactly_the_flat_test() {
        let sky = Skyline::none();
        let o = up_of(-89.0, 0.0);
        assert!(clears_horizon(&sky, o, [0.0, 0.0, 0.0], true));
        assert!(!clears_horizon(&sky, o, [0.0, 0.0, 0.0], false));
    }
}
