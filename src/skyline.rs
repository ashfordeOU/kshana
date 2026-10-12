// SPDX-License-Identifier: AGPL-3.0-only
//! Azimuth-dependent skyline masks: the lowest elevation a satellite must clear at each
//! azimuth for an Earth-fixed site.
//!
//! Until 0.36 every Earth visibility test in the engine was a single elevation cut-off
//! (`mask_deg`): a satellite counted when its elevation was at or above one number, whatever
//! its azimuth. A street, a quay, a fjord or a crane blocks part of the sky and leaves the rest
//! open. A [`Skyline`] carries that dependence. It is the pointwise maximum of up to four
//! descriptions (design note `docs/design/2026-10-12-geometry-and-skyline-design.md`, item 1):
//!
//! * **a table**: per-azimuth elevations, linearly interpolated in azimuth with wrap at 360°;
//! * **a street canyon**: two straight, parallel walls along `street_az_deg` (below);
//! * **sectors**: `(az_from, az_to, el_deg)` intervals with sharp edges, clockwise from
//!   `az_from` (included) to `az_to` (excluded), which may wrap through north;
//! * **a terrain profile**: `(az, distance_m, height_m)` points reduced to a table, with the
//!   Earth's curvature taken off each height (`distance² / (2 R_eff)`, `R_eff = 4/3 R`).
//!
//! The scenario's `mask_deg` keeps its meaning: it is the receiver's cut-off, a flat skyline.
//! The effective cut at azimuth `az` is `max(mask_deg, skyline(az))`, and a satellite is
//! visible when its elevation is at or above it: the same `>=` the flat mask always used. With
//! no skyline the test is exactly `el >= mask_deg` and the azimuth is not even computed, which
//! is what keeps every scenario without a `[skyline]` section byte-identical to 0.35.
//!
//! ## The street canyon in closed form
//!
//! A street runs along azimuth `s`, `w` metres between the walls, the antenna `a` metres above
//! the street on the centreline. Along azimuth `az`, with `θ = az − s`, the ray reaches a wall
//! after the horizontal distance `d(az) = (w / 2) / |sin θ|`, so the wall top (height `h`) is
//! at elevation
//!
//! ```text
//! cut(az) = atan( (h − a) / d(az) ) = atan( (h − a) · |sin θ| / (w / 2) )
//! ```
//!
//! using the right wall (`sin θ > 0`, the side at `s + 90°`) or the left one. Along the street
//! (`sin θ = 0`) the walls never close and the open strip lies there. With a finite canyon
//! length `L` (the antenna at its middle) the ray leaves through an open end, and the wall cuts
//! nothing, when the along-street distance to the wall plane `d(az) · |cos θ|` exceeds `L / 2`.
//! A wall no taller than the antenna cuts nothing.
//!
//! ## What this is and is not
//!
//! MODELLED. A skyline removes line-of-sight satellites and nothing more: no diffraction, no
//! reflection or non-line-of-sight reception (signals a real receiver may still track are
//! dropped, not degraded), no partial transparency (a lattice crane is opaque across its
//! sector), and no terrain model beyond the points given. The named presets are REPRESENTATIVE
//! geometries with their provenance stated in [`PRESETS`]; none is a survey of a real place.
//! Azimuth is degrees clockwise from true north in the site's local east-north-up frame.

use serde::{Deserialize, Serialize};

/// Mean Earth radius (m) the curvature drop is scaled from ([`crate::orbit::R_EARTH_M`]).
pub const EARTH_RADIUS_M: f64 = crate::orbit::R_EARTH_M;

/// Effective-radius factor for the terrain curvature drop: the conventional 4/3 Earth that
/// folds in standard atmospheric refraction. A stated, chosen constant (the design note's), not
/// a measurement.
pub const EFFECTIVE_RADIUS_FACTOR: f64 = 4.0 / 3.0;

/// Most table rows (and terrain points) a section may carry: an input cap, not a performance
/// figure.
pub const MAX_TABLE_ROWS: usize = 3600;

/// Most sectors a section may carry: an input cap.
pub const MAX_SECTORS: usize = 360;

/// Antenna height above the street (m) when a canyon does not state one: a car roof or a
/// hand-held receiver at chest height, a stated choice.
pub const DEFAULT_ANTENNA_M: f64 = 1.5;

/// Normalise an azimuth to `[0, 360)` degrees.
pub fn wrap_deg(az: f64) -> f64 {
    let w = az.rem_euclid(360.0);
    // rem_euclid can round up to exactly 360 for a tiny negative input.
    if w >= 360.0 {
        0.0
    } else {
        w
    }
}

/// Azimuth (degrees clockwise from north, in `[0, 360)`) of a direction whose east and north
/// components are `east` and `north`.
pub fn azimuth_from_en(east: f64, north: f64) -> f64 {
    wrap_deg(east.atan2(north).to_degrees())
}

/// A street canyon: two straight parallel walls along a street azimuth.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Canyon {
    /// Azimuth of the street axis (deg, clockwise from north).
    pub street_az_deg: f64,
    /// Wall-to-wall width (m).
    pub width_m: f64,
    /// Height of the wall on the left of the street direction (m above the street).
    pub height_left_m: f64,
    /// Height of the wall on the right of the street direction (m above the street).
    pub height_right_m: f64,
    /// Antenna height above the street (m).
    pub antenna_m: f64,
    /// Canyon length (m), the antenna at its middle; `None` for an unbounded street.
    pub length_m: Option<f64>,
}

impl Canyon {
    /// Elevation (deg) of the wall top along azimuth `az_deg` (the closed form in the module
    /// documentation).
    pub fn cut_deg(&self, az_deg: f64) -> f64 {
        let theta = (az_deg - self.street_az_deg).to_radians();
        let s = theta.sin();
        let h = if s > 0.0 {
            self.height_right_m
        } else if s < 0.0 {
            self.height_left_m
        } else {
            return 0.0;
        };
        let dh = h - self.antenna_m;
        if dh <= 0.0 {
            return 0.0;
        }
        let half = 0.5 * self.width_m;
        if let Some(l) = self.length_m {
            // Along-street distance to the wall plane: d |cos θ| = (w/2) |cos θ| / |sin θ|.
            if half * theta.cos().abs() > 0.5 * l * s.abs() {
                return 0.0;
            }
        }
        (dh * s.abs()).atan2(half).to_degrees()
    }
}

/// An azimuth interval blocked up to an elevation, clockwise from `az_from` (included) to
/// `az_to` (excluded); it may wrap through north.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Sector {
    /// Start azimuth (deg), included.
    pub az_from: f64,
    /// End azimuth (deg), excluded.
    pub az_to: f64,
    /// Elevation (deg) the sector blocks up to.
    pub el_deg: f64,
}

impl Sector {
    /// Whether azimuth `az_deg` lies in the sector.
    pub fn contains(&self, az_deg: f64) -> bool {
        let a = wrap_deg(az_deg);
        let f = wrap_deg(self.az_from);
        let t = wrap_deg(self.az_to);
        if f < t {
            a >= f && a < t
        } else {
            a >= f || a < t
        }
    }
}

/// One terrain point: a height (above the antenna) at a distance along an azimuth.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TerrainPoint {
    /// Azimuth (deg).
    pub az: f64,
    /// Horizontal distance from the antenna (m).
    pub distance_m: f64,
    /// Height of the terrain above the antenna (m), before the curvature drop.
    pub height_m: f64,
}

impl TerrainPoint {
    /// Elevation (deg) of the point after the curvature drop `distance² / (2 · 4/3 R)`; zero
    /// when the point is below the antenna's horizontal.
    pub fn elevation_deg(&self) -> f64 {
        let r_eff = EFFECTIVE_RADIUS_FACTOR * EARTH_RADIUS_M;
        let drop = self.distance_m * self.distance_m / (2.0 * r_eff);
        (self.height_m - drop)
            .atan2(self.distance_m)
            .to_degrees()
            .max(0.0)
    }
}

/// An azimuth-dependent elevation cut. See the module documentation. The empty skyline cuts
/// nothing, so with it the receiver's `mask_deg` alone decides.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Skyline {
    /// Tables of points `(azimuth_deg, elevation_deg)`, each with azimuths strictly
    /// increasing in `[0, 360)` and linearly interpolated with wrap on its own. A preset's table
    /// and a section's `table` are separate entries, so adding one can never lower the cut.
    pub tables: Vec<Vec<(f64, f64)>>,
    /// A street canyon.
    pub canyon: Option<Canyon>,
    /// Sharp-edged sectors.
    pub sectors: Vec<Sector>,
    /// Terrain profiles, each reduced to a table (azimuth, elevation after the curvature drop)
    /// and interpolated on its own like `tables`: a preset's terrain and a section's `terrain`
    /// are separate entries.
    pub terrain_tables: Vec<Vec<(f64, f64)>>,
}

fn interpolate(p: &[(f64, f64)], az_deg: f64) -> Option<f64> {
    match p.len() {
        0 => None,
        1 => Some(p[0].1),
        n => {
            let a = wrap_deg(az_deg);
            // First point whose azimuth exceeds `a`.
            let i = p.partition_point(|q| q.0 <= a);
            let (lo, hi, a) = if i == 0 || i == n {
                // Between the last point and the first, across north.
                let lo = p[n - 1];
                let hi = (p[0].0 + 360.0, p[0].1);
                (lo, hi, if a < lo.0 { a + 360.0 } else { a })
            } else {
                (p[i - 1], p[i], a)
            };
            let span = hi.0 - lo.0;
            Some(if span > 0.0 {
                lo.1 + (a - lo.0) / span * (hi.1 - lo.1)
            } else {
                lo.1
            })
        }
    }
}

impl Skyline {
    /// The empty skyline: no obstruction.
    pub fn none() -> Self {
        Self::default()
    }

    /// True when nothing is described, so visibility is the scalar `mask_deg` test.
    pub fn is_empty(&self) -> bool {
        self.tables.iter().all(Vec::is_empty)
            && self.canyon.is_none()
            && self.sectors.is_empty()
            && self.terrain_tables.iter().all(Vec::is_empty)
    }

    /// The skyline's own cut (deg) at azimuth `az_deg`: the pointwise maximum of every table,
    /// the canyon, the sectors containing the azimuth and every terrain profile; 0 where
    /// nothing is described.
    pub fn cut_deg(&self, az_deg: f64) -> f64 {
        let mut m = 0.0_f64;
        for t in &self.tables {
            if let Some(v) = interpolate(t, az_deg) {
                m = m.max(v);
            }
        }
        if let Some(c) = &self.canyon {
            m = m.max(c.cut_deg(az_deg));
        }
        for s in &self.sectors {
            if s.contains(az_deg) {
                m = m.max(s.el_deg);
            }
        }
        for t in &self.terrain_tables {
            if let Some(v) = interpolate(t, az_deg) {
                m = m.max(v);
            }
        }
        m
    }

    /// The effective cut (deg) at `az_deg` under a receiver mask: `max(mask_deg, cut)`.
    pub fn effective_cut_deg(&self, az_deg: f64, mask_deg: f64) -> f64 {
        if self.is_empty() {
            mask_deg
        } else {
            mask_deg.max(self.cut_deg(az_deg))
        }
    }

    /// Whether a satellite at (`az_deg`, `el_deg`) is visible under the receiver mask
    /// `mask_deg`: at or above `max(mask_deg, skyline(az))`. With an empty skyline this is
    /// exactly `el_deg >= mask_deg`.
    pub fn visible(&self, az_deg: f64, el_deg: f64, mask_deg: f64) -> bool {
        el_deg >= self.effective_cut_deg(az_deg, mask_deg)
    }

    /// [`Skyline::visible`] with the azimuth computed only when the skyline needs it. With an
    /// empty skyline this is exactly the pre-skyline `el_deg >= mask_deg` and `azimuth` is
    /// never called.
    pub fn visible_lazy(&self, el_deg: f64, mask_deg: f64, azimuth: impl FnOnce() -> f64) -> bool {
        if self.is_empty() {
            el_deg >= mask_deg
        } else {
            self.visible(azimuth(), el_deg, mask_deg)
        }
    }

    /// Whether a satellite clears the receiver mask but not the skyline (it is "masked by the
    /// skyline").
    pub fn masked(&self, az_deg: f64, el_deg: f64, mask_deg: f64) -> bool {
        el_deg >= mask_deg && !self.visible(az_deg, el_deg, mask_deg)
    }

    /// The skyline's own cut at every whole degree of azimuth from north: the normalised
    /// 360-entry table a page draws.
    pub fn profile(&self) -> Vec<f64> {
        (0..360).map(|i| self.cut_deg(i as f64)).collect()
    }

    /// Fraction of the upper hemisphere's solid angle above `max(mask_deg, skyline)`: the mean
    /// of `1 − sin(cut)` over azimuth, on a 0.1° grid (exact for a flat cut: 1 for 0°, 0.5 for
    /// 30°).
    pub fn open_fraction_above(&self, mask_deg: f64) -> f64 {
        let n = 3600;
        let sum: f64 = (0..n)
            .map(|i| {
                let az = (i as f64 + 0.5) * 360.0 / n as f64;
                1.0 - self.effective_cut_deg(az, mask_deg).to_radians().sin()
            })
            .sum();
        sum / n as f64
    }

    /// Fraction of the upper hemisphere's solid angle above the skyline alone.
    pub fn open_fraction(&self) -> f64 {
        self.open_fraction_above(0.0)
    }
}

fn check_elevation(what: &str, el: f64) -> Result<(), String> {
    if !(el.is_finite() && (0.0..90.0).contains(&el)) {
        return Err(format!(
            "skyline: {what} must be in [0, 90) degrees, got {el}"
        ));
    }
    Ok(())
}

fn check_finite(what: &str, v: f64) -> Result<(), String> {
    if !v.is_finite() {
        return Err(format!("skyline: {what} must be a finite number, got {v}"));
    }
    Ok(())
}

/// The `[skyline]` section of a scenario (and the `skyline` object of a geometry request).
///
/// `preset` names a starting geometry; every other field overrides it (the canyon fields) or
/// adds to it (`table`, `sectors`, `terrain`). Unknown fields are refused.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SkylineCfg {
    /// A named preset (see [`PRESETS`]).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub preset: Option<String>,
    /// Canyon: street azimuth (deg, clockwise from north). Default 0 for a new canyon.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub street_az_deg: Option<f64>,
    /// Canyon: wall-to-wall width (m). Required for a new canyon.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub width_m: Option<f64>,
    /// Canyon: left wall height above the street (m). Default 0 for a new canyon.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub height_left_m: Option<f64>,
    /// Canyon: right wall height above the street (m). Default 0 for a new canyon.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub height_right_m: Option<f64>,
    /// Canyon: antenna height above the street (m). Default [`DEFAULT_ANTENNA_M`].
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub antenna_m: Option<f64>,
    /// Canyon: length (m), the antenna at its middle (open ends). Default unbounded.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub length_m: Option<f64>,
    /// Table rows `[azimuth_deg, elevation_deg]`, azimuths strictly increasing in `[0, 360)`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub table: Option<Vec<[f64; 2]>>,
    /// Sectors.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub sectors: Option<Vec<Sector>>,
    /// Terrain points.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub terrain: Option<Vec<TerrainPoint>>,
}

impl SkylineCfg {
    fn has_canyon_fields(&self) -> bool {
        self.street_az_deg.is_some()
            || self.width_m.is_some()
            || self.height_left_m.is_some()
            || self.height_right_m.is_some()
            || self.antenna_m.is_some()
            || self.length_m.is_some()
    }

    fn has_overrides(&self) -> bool {
        self.has_canyon_fields()
            || self.table.is_some()
            || self.sectors.is_some()
            || self.terrain.is_some()
    }

    fn build_canyon(&self, base: Option<&Canyon>) -> Result<Canyon, String> {
        let width = self
            .width_m
            .or(base.map(|c| c.width_m))
            .ok_or("skyline: a canyon needs width_m")?;
        let c = Canyon {
            street_az_deg: self
                .street_az_deg
                .or(base.map(|c| c.street_az_deg))
                .unwrap_or(0.0),
            width_m: width,
            height_left_m: self
                .height_left_m
                .or(base.map(|c| c.height_left_m))
                .unwrap_or(0.0),
            height_right_m: self
                .height_right_m
                .or(base.map(|c| c.height_right_m))
                .unwrap_or(0.0),
            antenna_m: self
                .antenna_m
                .or(base.map(|c| c.antenna_m))
                .unwrap_or(DEFAULT_ANTENNA_M),
            length_m: self.length_m.or(base.and_then(|c| c.length_m)),
        };
        for (what, v) in [
            ("street_az_deg", c.street_az_deg),
            ("width_m", c.width_m),
            ("height_left_m", c.height_left_m),
            ("height_right_m", c.height_right_m),
            ("antenna_m", c.antenna_m),
        ] {
            check_finite(what, v)?;
        }
        if c.width_m <= 0.0 {
            return Err(format!(
                "skyline: width_m must be positive, got {}",
                c.width_m
            ));
        }
        if c.height_left_m < 0.0 || c.height_right_m < 0.0 || c.antenna_m < 0.0 {
            return Err("skyline: canyon heights and antenna_m must be non-negative".into());
        }
        if let Some(l) = c.length_m {
            if !(l.is_finite() && l > 0.0) {
                return Err(format!("skyline: length_m must be positive, got {l}"));
            }
        }
        Ok(c)
    }

    fn build_table(rows: &[[f64; 2]]) -> Result<Vec<(f64, f64)>, String> {
        if rows.is_empty() {
            return Err("skyline: table is empty".into());
        }
        if rows.len() > MAX_TABLE_ROWS {
            return Err(format!(
                "skyline: table has {} rows, over the {MAX_TABLE_ROWS}-row cap",
                rows.len()
            ));
        }
        let mut prev = f64::NEG_INFINITY;
        let mut own = Vec::with_capacity(rows.len());
        for &[az, el] in rows {
            if !(az.is_finite() && (0.0..360.0).contains(&az)) {
                return Err(format!("skyline: table azimuth {az} is outside [0, 360)"));
            }
            if az <= prev {
                return Err(format!(
                    "skyline: table azimuths must be strictly increasing ({az} follows {prev})"
                ));
            }
            check_elevation("a table elevation", el)?;
            prev = az;
            own.push((az, el));
        }
        Ok(own)
    }

    /// Build the skyline this section describes. Refuses an unknown preset, a canyon without
    /// a width, a table that is not strictly increasing in `[0, 360)`, an elevation outside
    /// `[0, 90)`, an empty sector, a non-positive terrain distance and any input over the caps.
    pub fn build(&self) -> Result<Skyline, String> {
        let mut sky = match &self.preset {
            Some(name) => preset(name)?.skyline(),
            None => Skyline::none(),
        };
        if self.has_canyon_fields() {
            sky.canyon = Some(self.build_canyon(sky.canyon.as_ref())?);
        }
        if let Some(rows) = &self.table {
            sky.tables.push(Self::build_table(rows)?);
        }
        if let Some(secs) = &self.sectors {
            if sky.sectors.len() + secs.len() > MAX_SECTORS {
                return Err(format!("skyline: more than {MAX_SECTORS} sectors"));
            }
            for s in secs {
                check_finite("az_from", s.az_from)?;
                check_finite("az_to", s.az_to)?;
                if wrap_deg(s.az_from) == wrap_deg(s.az_to) {
                    return Err(format!(
                        "skyline: the sector az_from = {} to az_to = {} is empty (a full circle is \
                         a table or the mask)",
                        s.az_from, s.az_to
                    ));
                }
                check_elevation("a sector el_deg", s.el_deg)?;
                sky.sectors.push(*s);
            }
        }
        if let Some(pts) = &self.terrain {
            if pts.len() > MAX_TABLE_ROWS {
                return Err(format!(
                    "skyline: more than {MAX_TABLE_ROWS} terrain points"
                ));
            }
            for p in pts {
                check_finite("a terrain az", p.az)?;
                check_finite("a terrain height_m", p.height_m)?;
                if !(p.distance_m.is_finite() && p.distance_m > 0.0) {
                    return Err(format!(
                        "skyline: terrain distance_m must be positive, got {}",
                        p.distance_m
                    ));
                }
            }
            let reduced = reduce_terrain(pts);
            for &(_, el) in &reduced {
                check_elevation("a terrain point's elevation", el)?;
            }
            sky.terrain_tables.push(reduced);
        }
        Ok(sky)
    }

    /// Where the skyline came from: `preset:<name>`, `preset:<name>+overrides` or `custom`.
    pub fn source(&self) -> String {
        match (&self.preset, self.has_overrides()) {
            (Some(p), false) => format!("preset:{p}"),
            (Some(p), true) => format!("preset:{p}+overrides"),
            (None, _) => "custom".into(),
        }
    }

    /// The provenance line a result carries for this section.
    pub fn provenance(&self) -> String {
        let user =
            "the geometry stated in the scenario's [skyline] section (MODELLED line of sight)";
        match self.preset.as_deref().and_then(|n| preset(n).ok()) {
            Some(p) if self.has_overrides() => format!(
                "{}; with fields overridden or added by {user}",
                p.provenance
            ),
            Some(p) => p.provenance.to_string(),
            None => format!("Stated input: {user}"),
        }
    }
}

/// Reduce terrain points to a table: one row per distinct azimuth (the highest elevation where
/// several points share one), sorted.
pub fn reduce_terrain(points: &[TerrainPoint]) -> Vec<(f64, f64)> {
    let rows: Vec<(f64, f64)> = points
        .iter()
        .map(|p| (wrap_deg(p.az), p.elevation_deg()))
        .collect();
    sort_highest(rows)
}

/// One profile's points sorted by azimuth; where several share an azimuth, the highest wins.
/// Used within one terrain list only: separate tables are never interleaved (see
/// [`Skyline::tables`]).
fn sort_highest(mut all: Vec<(f64, f64)>) -> Vec<(f64, f64)> {
    all.sort_by(|x, y| x.0.total_cmp(&y.0));
    let mut out: Vec<(f64, f64)> = Vec::with_capacity(all.len());
    for (az, el) in all {
        match out.last_mut() {
            Some(last) if last.0 == az => last.1 = last.1.max(el),
            _ => out.push((az, el)),
        }
    }
    out
}

/// The skyline a scenario's optional `[skyline]` section describes; `None` without one.
pub fn resolve(cfg: Option<&SkylineCfg>) -> Result<Option<Skyline>, String> {
    cfg.map(SkylineCfg::build).transpose()
}

/// A named, REPRESENTATIVE skyline geometry with its provenance.
#[derive(Clone, Copy, Debug)]
pub struct Preset {
    /// The name used in `preset`.
    pub name: &'static str,
    /// One line on what the geometry stands for.
    pub description: &'static str,
    /// Where every number in the preset comes from.
    pub provenance: &'static str,
    build: fn() -> Skyline,
}

impl Preset {
    /// The preset's skyline.
    pub fn skyline(&self) -> Skyline {
        (self.build)()
    }
}

/// Evidence label every preset carries: the dimensions are chosen and stated, not surveyed.
pub const PRESET_LABEL: &str = "REPRESENTATIVE";

/// Distance (m) from the channel axis to each wall of the `fjord` preset.
const FJORD_WALL_DISTANCE_M: f64 = 1500.0;
/// Height (m) of each wall of the `fjord` preset above the antenna.
const FJORD_WALL_HEIGHT_M: f64 = 600.0;

fn fjord() -> Skyline {
    // The walls run parallel to a north-south channel, so along azimuth az the wall is
    // 1500 / |sin az| m away; one terrain point per whole degree off the axis.
    let pts: Vec<TerrainPoint> = (1..360)
        .filter(|a| *a != 180)
        .map(|a| {
            let az = a as f64;
            TerrainPoint {
                az,
                distance_m: FJORD_WALL_DISTANCE_M / az.to_radians().sin().abs(),
                height_m: FJORD_WALL_HEIGHT_M,
            }
        })
        .collect();
    Skyline {
        terrain_tables: vec![reduce_terrain(&pts)],
        ..Skyline::none()
    }
}

/// The named presets, in listing order.
pub const PRESETS: &[Preset] = &[
    Preset {
        name: "city-street",
        description: "a street canyon running north-south: 20 m between 30 m walls, the \
                      antenna 1.5 m above the street on the centreline; open along the street",
        provenance: "REPRESENTATIVE, chosen and stated, not a survey of any street: street 0 \
                     deg, width 20 m, wall heights 30 m and 30 m (about ten storeys of 3 m), \
                     antenna 1.5 m (a car roof or a hand-held receiver). Height-to-width ratio \
                     1.5, inside the 0.5-2 band of street-canyon aspect ratios in Oke (1988), \
                     Street design and urban canopy layer climate, Energy and Buildings 11, \
                     103-113. The walls rise to atan(28.5/10) = 70.7 deg across the street.",
        build: || Skyline {
            canyon: Some(Canyon {
                street_az_deg: 0.0,
                width_m: 20.0,
                height_left_m: 30.0,
                height_right_m: 30.0,
                antenna_m: 1.5,
                length_m: None,
            }),
            ..Skyline::none()
        },
    },
    Preset {
        name: "harbour-approach",
        description: "a vessel entering a harbour heading north: open to seaward astern, quay \
                      buildings ahead and the breakwater either side",
        provenance: "REPRESENTATIVE, chosen and stated, not a survey of any port: open to \
                     seaward over the 180 deg sector 090-270; quay buildings 8 deg over the 90 \
                     deg sector 315-045 (for example 40 m warehouses about 285 m off); the \
                     breakwater 3 deg over 045-090 and 270-315 (a 5 m crest about 95 m off: atan(5/95) = \
                     3.0 deg).",
        build: || Skyline {
            sectors: vec![
                Sector {
                    az_from: 315.0,
                    az_to: 45.0,
                    el_deg: 8.0,
                },
                Sector {
                    az_from: 45.0,
                    az_to: 90.0,
                    el_deg: 3.0,
                },
                Sector {
                    az_from: 270.0,
                    az_to: 315.0,
                    el_deg: 3.0,
                },
            ],
            ..Skyline::none()
        },
    },
    Preset {
        name: "fjord",
        description: "a vessel mid-channel in a fjord running north-south: walls rising to 600 \
                      m above the antenna 1.5 km either side; open along the channel axis",
        provenance: "REPRESENTATIVE, chosen and stated, not a survey of any fjord: a terrain \
                     profile of two straight walls 600 m above the antenna at 1500 m either side \
                     of a north-south channel, one point per degree of azimuth off the axis at \
                     1500/|sin az| m, each lowered by the curvature drop d^2/(2 * 4/3 R) with R = \
                     6371 km. The walls rise to 21.8 deg across the channel and fall below 1 deg \
                     along it. Of the order of the width and relief of the deep west-Norwegian \
                     fjords (Holtedahl (1967), Notes on the formation of fjords and \
                     fjord-valleys, Geografiska Annaler 49A, 193-203).",
        build: fjord,
    },
    Preset {
        name: "container-terminal",
        description: "a vehicle on a quay running north-south with the water to the west: \
                      container stacks to landward and two ship-to-shore crane booms over the \
                      water",
        provenance: "REPRESENTATIVE, chosen and stated, not a survey of any terminal: container \
                     stacks 12 deg over the landward half 000-180 (five ISO 668 high-cube boxes, \
                     14.5 m, about 60 m off an antenna 2 m up: atan(12.5/60) = 11.8 deg); two \
                     crane booms as narrow sectors over the water, 35 deg over 245-255 and 25 deg \
                     over 285-295 (a boom about 50 m above the quay at 70 m and at 100 m, of the \
                     order of a post-Panamax ship-to-shore crane); open to the water elsewhere. A \
                     crane sector is opaque.",
        build: || Skyline {
            sectors: vec![
                Sector {
                    az_from: 0.0,
                    az_to: 180.0,
                    el_deg: 12.0,
                },
                Sector {
                    az_from: 245.0,
                    az_to: 255.0,
                    el_deg: 35.0,
                },
                Sector {
                    az_from: 285.0,
                    az_to: 295.0,
                    el_deg: 25.0,
                },
            ],
            ..Skyline::none()
        },
    },
];

/// Look up a preset by name.
pub fn preset(name: &str) -> Result<&'static Preset, String> {
    PRESETS.iter().find(|p| p.name == name).ok_or_else(|| {
        format!(
            "unknown skyline preset \"{name}\"; known presets: {}",
            preset_names().join(", ")
        )
    })
}

/// The preset names, in listing order.
pub fn preset_names() -> Vec<&'static str> {
    PRESETS.iter().map(|p| p.name).collect()
}

/// One preset as the `skyline_presets` surface function lists it.
#[derive(Clone, Debug, Serialize)]
pub struct PresetInfo {
    /// Name.
    pub name: &'static str,
    /// Evidence label ([`PRESET_LABEL`]).
    pub label: &'static str,
    /// Description.
    pub description: &'static str,
    /// Provenance of every number.
    pub provenance: &'static str,
    /// The cut at every whole degree of azimuth from north (360 entries).
    pub table: Vec<f64>,
    /// Fraction of the upper hemisphere above the skyline alone.
    pub open_fraction: f64,
}

/// Every preset with its table and provenance.
pub fn preset_list() -> Vec<PresetInfo> {
    PRESETS
        .iter()
        .map(|p| {
            let s = p.skyline();
            PresetInfo {
                name: p.name,
                label: PRESET_LABEL,
                description: p.description,
                provenance: p.provenance,
                table: s.profile(),
                open_fraction: s.open_fraction(),
            }
        })
        .collect()
}

/// The `skyline` block a scenario result carries when its scenario has a `[skyline]` section
/// (absent otherwise, so a scenario without one is byte-identical to before).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SkylineSummary {
    /// `preset:<name>`, `preset:<name>+overrides` or `custom`.
    pub source: String,
    /// Fraction of the upper hemisphere's solid angle above `max(mask_deg, skyline)`.
    pub open_fraction: f64,
    /// Where the geometry comes from.
    pub provenance: String,
}

impl SkylineSummary {
    /// Summarise a scenario's section under its receiver mask; `None` without a section.
    pub fn of(cfg: Option<&SkylineCfg>, sky: Option<&Skyline>, mask_deg: f64) -> Option<Self> {
        let (cfg, sky) = (cfg?, sky?);
        Some(SkylineSummary {
            source: cfg.source(),
            open_fraction: sky.open_fraction_above(mask_deg),
            provenance: cfg.provenance(),
        })
    }
}

/// Units and provenance of the [`SkylineSummary`] fields (`skyline.*`) and of the per-sample
/// `masked_by_skyline` counts, included in a result's `units` block only when the scenario has
/// a `[skyline]` section.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "skyline.open_fraction",
            unit: "1",
            provenance: Computed,
            definition: "fraction of the upper hemisphere's solid angle above max(mask_deg, \
                         skyline): the mean of 1 - sin(cut) over azimuth on a 0.1 deg grid",
        },
        FieldUnit {
            path: "epochs[].masked_by_skyline",
            unit: "count",
            provenance: Computed,
            definition: "satellites above the receiver mask but below the skyline at this sample",
        },
        FieldUnit {
            path: "gnss_measurements[].masked_by_skyline",
            unit: "count",
            provenance: Computed,
            definition: "satellites above the receiver mask but below the skyline at this epoch",
        },
        FieldUnit {
            path: "joint.epochs[].masked_by_skyline",
            unit: "count",
            provenance: Computed,
            definition: "satellites of every system above that system's mask but below the \
                         skyline at this epoch",
        },
        FieldUnit {
            path: "satellites[].pass.epochs_masked_by_skyline",
            unit: "count",
            provenance: Computed,
            definition: "epochs at which the satellite was above the user's mask but below the \
                         skyline",
        },
    ]
};

/// A scenario report with the [`SkylineSummary`] beside its own fields: what a kind serialises
/// when its scenario carries a `[skyline]` section. Without one, the kind serialises its report
/// alone, as before.
#[derive(Serialize)]
pub struct WithSkyline<'a, T: Serialize> {
    /// The kind's own report, its fields at the top level.
    #[serde(flatten)]
    pub report: &'a T,
    /// The skyline applied.
    pub skyline: SkylineSummary,
}

/// A report's units tables, with [`UNITS`] appended only when the report carries a `skyline`
/// block, so a report without one keeps its `units` object byte for byte.
pub fn with_units(
    has_skyline: bool,
    tables: &[&[crate::field_schema::FieldUnit]],
) -> Vec<crate::field_schema::FieldUnit> {
    let mut v: Vec<crate::field_schema::FieldUnit> = tables.concat();
    if has_skyline {
        v.extend_from_slice(UNITS);
    }
    v
}

#[cfg(test)]
mod tests {
    use super::*;

    fn close(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    fn cfg(toml_text: &str) -> SkylineCfg {
        toml::from_str(toml_text).unwrap()
    }

    #[test]
    fn the_empty_skyline_is_the_scalar_mask_bit_for_bit() {
        let s = Skyline::none();
        assert!(s.is_empty());
        for i in 0..720 {
            let az = i as f64 * 0.5 - 5.0;
            assert_eq!(s.effective_cut_deg(az, 7.5), 7.5);
            assert!(s.visible(az, 7.5, 7.5));
            assert!(!s.visible(az, 7.5 - 1e-12, 7.5));
            // A negative mask stays a negative mask (no clamping to the horizon).
            assert!(s.visible(az, -1.0, -2.0));
        }
        assert!(s.visible_lazy(8.0, 7.5, || panic!("azimuth computed with no skyline")));
        assert_eq!(resolve(None).unwrap(), None);
    }

    #[test]
    fn table_interpolates_linearly_between_rows() {
        let s = cfg("table = [[0.0, 10.0], [90.0, 30.0], [180.0, 10.0], [270.0, 20.0]]\n")
            .build()
            .unwrap();
        assert!(close(s.cut_deg(45.0), 20.0, 1e-12));
        assert!(close(s.cut_deg(90.0), 30.0, 1e-12));
        assert!(close(s.cut_deg(135.0), 20.0, 1e-12));
        assert!(close(s.cut_deg(225.0), 15.0, 1e-12));
        // The receiver mask is a floor under it.
        assert!(close(s.effective_cut_deg(0.0, 12.0), 12.0, 1e-12));
    }

    #[test]
    fn table_wraps_through_north_without_a_seam() {
        let s = cfg("table = [[10.0, 20.0], [350.0, 40.0]]\n")
            .build()
            .unwrap();
        assert!(close(s.cut_deg(0.0), 30.0, 1e-12));
        assert!(close(s.cut_deg(360.0), 30.0, 1e-12));
        assert!(close(s.cut_deg(-360.0), 30.0, 1e-12));
        assert!(close(s.cut_deg(355.0), 35.0, 1e-12));
        assert!(close(s.cut_deg(5.0), 25.0, 1e-12));
        assert!(close(s.cut_deg(180.0), 30.0, 1e-12));
        assert!(close(s.cut_deg(100.0), 20.0 + 20.0 * 90.0 / 340.0, 1e-12));
        assert!(close(s.cut_deg(359.999_999), s.cut_deg(0.000_001), 1e-5));
        assert!(close(s.cut_deg(-5.0), s.cut_deg(355.0), 1e-12));
        assert!(close(s.cut_deg(725.0), s.cut_deg(5.0), 1e-12));
    }

    #[test]
    fn canyon_matches_hand_computed_wall_elevations() {
        // A north-south street 20 m wide, walls 21.5 m (left, west) and 11.5 m (right,
        // east), antenna 1.5 m: wall tops 20 m and 10 m above it, 10 m away across it.
        let c = Canyon {
            street_az_deg: 0.0,
            width_m: 20.0,
            height_left_m: 21.5,
            height_right_m: 11.5,
            antenna_m: 1.5,
            length_m: None,
        };
        assert!(close(c.cut_deg(90.0), 45.0, 1e-12));
        assert!(close(c.cut_deg(270.0), 63.434_948_822_922, 1e-9));
        // 30 deg off the axis on the right: atan(10 sin 30 / 10) = atan(0.5).
        assert!(close(c.cut_deg(30.0), 0.5f64.atan().to_degrees(), 1e-12));
        assert_eq!(c.cut_deg(0.0), 0.0);
        assert!(c.cut_deg(180.0).abs() < 1e-9);
        // A canyon 40 m long: 30 deg off the axis the wall plane is 10 cos30/sin30 = 17.3 m
        // along the street, inside the 20 m half-length; 20 deg off it is 27.5 m along, past
        // the open end.
        let short = Canyon {
            length_m: Some(40.0),
            ..c.clone()
        };
        assert!(close(short.cut_deg(30.0), c.cut_deg(30.0), 1e-12));
        assert_eq!(short.cut_deg(20.0), 0.0);
        assert!(close(short.cut_deg(90.0), 45.0, 1e-12));
        // A wall no taller than the antenna cuts nothing.
        let low = Canyon {
            height_right_m: 1.0,
            ..c
        };
        assert_eq!(low.cut_deg(90.0), 0.0);
    }

    #[test]
    fn terrain_takes_the_curvature_drop() {
        // 600 m at 1500 m: drop 1500^2 / (2 * 4/3 * 6371000) = 0.132436 m.
        let p = TerrainPoint {
            az: 90.0,
            distance_m: 1500.0,
            height_m: 600.0,
        };
        let drop = 1500.0f64 * 1500.0 / (2.0 * 4.0 / 3.0 * 6_371_000.0);
        assert!(close(drop, 0.132_436_038_298_540_28, 1e-12));
        assert!(close(
            p.elevation_deg(),
            ((600.0 - drop) / 1500.0).atan().to_degrees(),
            1e-12
        ));
        // Far enough away the drop takes the whole height: the point cuts nothing.
        let far = TerrainPoint {
            az: 0.0,
            distance_m: 200_000.0,
            height_m: 600.0,
        };
        assert_eq!(far.elevation_deg(), 0.0);
        // Two points at one azimuth: the higher wins.
        let t = reduce_terrain(&[
            p,
            TerrainPoint {
                height_m: 900.0,
                ..p
            },
        ]);
        assert_eq!(t.len(), 1);
        assert!(t[0].1 > p.elevation_deg());
    }

    #[test]
    fn sectors_have_sharp_edges_and_wrap() {
        let s = Sector {
            az_from: 350.0,
            az_to: 10.0,
            el_deg: 40.0,
        };
        assert!(s.contains(350.0) && s.contains(0.0) && s.contains(9.999));
        assert!(!s.contains(10.0) && !s.contains(349.999) && !s.contains(180.0));
        let sky = Skyline {
            sectors: vec![s],
            ..Skyline::none()
        };
        assert_eq!(sky.effective_cut_deg(355.0, 5.0), 40.0);
        assert_eq!(sky.effective_cut_deg(20.0, 5.0), 5.0);
        assert!(sky.masked(355.0, 20.0, 5.0));
        assert!(
            !sky.masked(355.0, 4.0, 5.0),
            "below the mask is not 'masked by the skyline'"
        );
    }

    #[test]
    fn presets_carry_the_note_dimensions_and_provenance() {
        assert_eq!(
            preset_names(),
            [
                "city-street",
                "harbour-approach",
                "fjord",
                "container-terminal"
            ]
        );
        for p in preset_list() {
            assert!(p.provenance.starts_with(PRESET_LABEL), "{}", p.name);
            assert_eq!(p.table.len(), 360);
            assert!(p.open_fraction > 0.0 && p.open_fraction < 1.0);
        }
        let c = preset("city-street").unwrap().skyline();
        assert!(close(
            c.cut_deg(90.0),
            (28.5f64 / 10.0).atan().to_degrees(),
            1e-12
        ));
        assert_eq!(c.cut_deg(0.0), 0.0);
        let h = preset("harbour-approach").unwrap().skyline();
        assert_eq!(
            (h.cut_deg(0.0), h.cut_deg(60.0), h.cut_deg(180.0)),
            (8.0, 3.0, 0.0)
        );
        let f = preset("fjord").unwrap().skyline();
        let drop = 1500.0f64 * 1500.0 / (2.0 * 4.0 / 3.0 * 6_371_000.0);
        assert!(close(
            f.cut_deg(90.0),
            ((600.0 - drop) / 1500.0).atan().to_degrees(),
            1e-12
        ));
        assert!(close(f.cut_deg(90.0), 21.8, 0.05));
        assert!(f.cut_deg(0.0) < 1.0 && f.cut_deg(180.0) < 1.0);
        let t = preset("container-terminal").unwrap().skyline();
        assert_eq!(
            (
                t.cut_deg(90.0),
                t.cut_deg(250.0),
                t.cut_deg(290.0),
                t.cut_deg(270.0)
            ),
            (12.0, 35.0, 25.0, 0.0)
        );
    }

    #[test]
    fn a_preset_is_overridden_or_added_to_field_by_field() {
        let s = cfg("preset = \"city-street\"\nstreet_az_deg = 35.0\nheight_right_m = 40.0\n")
            .build()
            .unwrap();
        let c = s.canyon.as_ref().unwrap();
        assert_eq!(
            (
                c.street_az_deg,
                c.width_m,
                c.height_left_m,
                c.height_right_m
            ),
            (35.0, 20.0, 30.0, 40.0)
        );
        let added = cfg(
            "preset = \"harbour-approach\"\n[[sectors]]\naz_from = 170.0\naz_to = 190.0\nel_deg = 20.0\n",
        )
        .build()
        .unwrap();
        assert_eq!(added.sectors.len(), 4);
        assert_eq!(added.cut_deg(180.0), 20.0);
        let src = cfg("preset = \"fjord\"\nwidth_m = 10.0\n");
        assert_eq!(src.source(), "preset:fjord+overrides");
        assert!(src.provenance().contains("overridden"));
        assert_eq!(cfg("table = [[0.0, 5.0]]\n").source(), "custom");
    }

    #[test]
    fn malformed_sections_are_refused() {
        for (text, needle) in [
            ("preset = \"moon-crater\"\n", "unknown skyline preset"),
            ("street_az_deg = 10.0\n", "needs width_m"),
            (
                "table = [[90.0, 10.0], [10.0, 20.0]]\n",
                "strictly increasing",
            ),
            ("table = [[0.0, 10.0], [360.0, 20.0]]\n", "outside [0, 360)"),
            ("table = [[0.0, 90.0]]\n", "[0, 90)"),
            (
                "[[sectors]]\naz_from = 10.0\naz_to = 370.0\nel_deg = 5.0\n",
                "empty",
            ),
            (
                "[[terrain]]\naz = 10.0\ndistance_m = 0.0\nheight_m = 5.0\n",
                "positive",
            ),
            ("width_m = 10.0\nlength_m = -1.0\n", "positive"),
        ] {
            let e = cfg(text).build().unwrap_err();
            assert!(e.contains(needle), "{text}: {e}");
        }
        assert!(toml::from_str::<SkylineCfg>("prest = \"fjord\"\n").is_err());
        let rows: Vec<[f64; 2]> = (0..3601).map(|i| [i as f64 * 0.09, 1.0]).collect();
        let big = SkylineCfg {
            table: Some(rows),
            ..Default::default()
        };
        assert!(big.build().unwrap_err().contains("cap"));
    }

    #[test]
    fn open_fraction_of_flat_cuts() {
        assert!(close(Skyline::none().open_fraction(), 1.0, 1e-12));
        assert!(close(Skyline::none().open_fraction_above(30.0), 0.5, 1e-12));
        let flat30 = cfg("table = [[0.0, 30.0]]\n").build().unwrap();
        assert!(close(flat30.open_fraction(), 0.5, 1e-12));
    }

    #[test]
    fn adding_a_table_or_terrain_to_a_preset_never_lowers_the_cut() {
        // The review's case: one far, low terrain point beside the fjord's walls used to be
        // interleaved with them and pull the interpolated cut down to the mask.
        let fjord = cfg("preset = \"fjord\"\n").build().unwrap();
        let plus = cfg(
            "preset = \"fjord\"\n[[terrain]]\naz = 90.5\ndistance_m = 100000.0\nheight_m = 1.0\n",
        )
        .build()
        .unwrap();
        assert!((fjord.cut_deg(90.5) - 21.8).abs() < 0.05);
        assert_eq!(plus.cut_deg(90.5), fjord.cut_deg(90.5));

        // Property, on a 0.1 deg grid: every preset plus seeded random tables, terrain lists
        // and sectors cuts at least as high as the preset, and at least as high as the
        // addition on its own.
        use rand::{Rng, SeedableRng};
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(36);
        for p in PRESETS {
            for _ in 0..25 {
                let mut add = SkylineCfg::default();
                let n = rng.gen_range(1..12);
                let mut azs: Vec<f64> = (0..n).map(|_| rng.gen_range(0.0..360.0)).collect();
                azs.sort_by(f64::total_cmp);
                azs.dedup();
                add.table = Some(azs.iter().map(|&a| [a, rng.gen_range(0.0..60.0)]).collect());
                add.terrain = Some(
                    (0..rng.gen_range(1..8))
                        .map(|_| TerrainPoint {
                            az: rng.gen_range(0.0..360.0),
                            distance_m: rng.gen_range(50.0..200_000.0),
                            height_m: rng.gen_range(0.0..800.0),
                        })
                        .collect(),
                );
                let from = rng.gen_range(0.0..360.0);
                add.sectors = Some(vec![Sector {
                    az_from: from,
                    az_to: (from + rng.gen_range(1.0..90.0)) % 360.0,
                    el_deg: rng.gen_range(0.0..45.0),
                }]);
                let alone = add.build().unwrap();
                add.preset = Some(p.name.to_string());
                let both = add.build().unwrap();
                let base = p.skyline();
                for k in 0..3600 {
                    let az = k as f64 * 0.1;
                    let c = both.cut_deg(az);
                    assert!(c >= base.cut_deg(az), "{} at {az}", p.name);
                    assert!(c >= alone.cut_deg(az), "{} at {az}", p.name);
                    assert_eq!(
                        c,
                        base.cut_deg(az).max(alone.cut_deg(az)),
                        "{} at {az}",
                        p.name
                    );
                }
            }
        }
    }
}
