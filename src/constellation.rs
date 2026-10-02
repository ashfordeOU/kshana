// SPDX-License-Identifier: AGPL-3.0-only
//! Constellation designer at scale: Walker delta and Walker star patterns, explicit element
//! lists, multi-shell designs and published presets for the four global navigation
//! satellite systems (GNSS), several constellations in one run around any central body in
//! [`crate::body`], and a coverage and dilution-of-precision (DOP) map over a
//! latitude/longitude grid.
//!
//! ## Relation to the other constellation code
//!
//! [`crate::walker`] designs an Earth Walker pattern as SGP4 mean elements and scores it at
//! one ground station; [`crate::orbit::ConstellationCfg`] builds a single Earth Walker
//! shell for the orbit-clock scenarios. This module is the body-agnostic, grid-wide
//! designer: it takes its gravitational parameter, radius, spin rate and second zonal
//! harmonic from a [`Body`], so the same code places a lunar relay set around the Moon or a
//! navigation shell around Mars, and it evaluates every point of a global grid at every
//! epoch rather than one station. Kepler's equation is solved by the engine's own
//! [`crate::orbit::solve_kepler`], and with one common receiver clock the DOP reduces
//! exactly to [`crate::orbit::dop`] (a unit test pins the two together).
//!
//! ## Frame convention
//!
//! Each satellite is propagated in a body-centred inertial frame whose axes coincide with
//! the body-fixed frame at `t = 0`; the body-fixed position is that inertial position
//! rotated by `−ω t` about the pole. A right ascension of the ascending node (RAAN) given
//! to a Walker shell or an explicit satellite is therefore the body-fixed longitude of the
//! node at the scenario epoch. The GPS and GLONASS presets convert their published values
//! into that convention with the Greenwich hour angle their documents state, so at `t = 0`
//! their Earth-fixed geometry is the published one (the GPS conversion is checked against
//! the equatorial-crossing column of the published slot table).
//!
//! ## Visibility prefilter
//!
//! A satellite at radius `r` is above an elevation mask `ε` at a surface point exactly when
//! the central angle between the two is at most `λ = arccos((R/r)·cos ε) − ε`. The test is
//! therefore one dot product against a per-satellite threshold `cos λ`, computed once per
//! epoch. On top of it the satellites are sorted by sub-satellite latitude each epoch, so a
//! grid row at latitude `φ` only examines satellites within `λ_max` of `φ`. Both steps are
//! exact on a spherical body: the counts are identical to a brute-force elevation test (a
//! unit test compares the two), and the report states how many pair tests the latitude
//! band removed. No threads, no clock and no filesystem, so it runs unchanged as
//! WebAssembly.
//!
//! ## Scope (honest)
//!
//! Two-body Keplerian motion with an optional secular J2 drift of the node and perigee; a
//! spherical body with the local vertical along the radius; no terrain, no signal power and
//! no satellite health. The presets place each system's published nominal slots at the
//! scenario epoch; the relative phase between two different systems is not a snapshot of
//! any real date.

use crate::body::Body;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use std::f64::consts::{PI, TAU};

type Vec3 = [f64; 3];

const DEG: f64 = PI / 180.0;

/// Most receiver clocks one fix can carry (one per constellation under
/// [`ClockModel::PerConstellation`]).
pub const MAX_CLOCKS: usize = 9;
const MAX_STATES: usize = 3 + MAX_CLOCKS;

/// Classical orbital elements of one satellite. `raan_rad` is the body-fixed longitude of
/// the ascending node at the scenario epoch (see the module's frame convention).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Elements {
    /// Semi-major axis (m).
    pub a_m: f64,
    /// Eccentricity.
    pub e: f64,
    /// Inclination to the body equator (rad).
    pub i_rad: f64,
    /// Node longitude in the body-fixed frame at the epoch (rad).
    pub raan_rad: f64,
    /// Argument of periapsis (rad).
    pub argp_rad: f64,
    /// Mean anomaly at the epoch (rad).
    pub m0_rad: f64,
}

/// A propagating satellite: elements plus the secular rates for its body.
#[derive(Clone, Copy, Debug)]
struct Sat {
    el: Elements,
    n: f64,
    raan_dot: f64,
    argp_dot: f64,
    /// Index of the constellation the satellite belongs to.
    cons: usize,
}

impl Sat {
    fn new(el: Elements, body: &Body, j2: bool, cons: usize) -> Self {
        let n = (body.mu / el.a_m.powi(3)).sqrt();
        let (mut raan_dot, mut argp_dot) = (0.0, 0.0);
        if j2 {
            if let Some(&j2c) = body.zonals.first() {
                // Vallado's secular J2 rates, the same expressions as orbit::Orbit::with_j2,
                // taken with this body's J2 and reference radius.
                let p = el.a_m * (1.0 - el.e * el.e);
                let f = n * j2c * (body.re / p).powi(2);
                let ci = el.i_rad.cos();
                raan_dot = -1.5 * f * ci;
                argp_dot = 0.75 * f * (5.0 * ci * ci - 1.0);
            }
        }
        Self {
            el,
            n,
            raan_dot,
            argp_dot,
            cons,
        }
    }

    /// Body-fixed position (m) at `t` seconds after the epoch, for a body spinning at
    /// `omega` rad/s.
    fn position_fixed(&self, t: f64, omega: f64) -> Vec3 {
        let el = &self.el;
        let m = el.m0_rad + self.n * t;
        let ea = crate::orbit::solve_kepler(m, el.e);
        let r = el.a_m * (1.0 - el.e * ea.cos());
        let nu = if el.e == 0.0 {
            ea
        } else {
            2.0 * ((1.0 + el.e).sqrt() * (ea * 0.5).sin())
                .atan2((1.0 - el.e).sqrt() * (ea * 0.5).cos())
        };
        let (su, cu) = (el.argp_rad + self.argp_dot * t + nu).sin_cos();
        let (si, ci) = el.i_rad.sin_cos();
        // Node longitude in the body-fixed frame: inertial node minus the body's rotation.
        let (so, co) = (el.raan_rad + self.raan_dot * t - omega * t).sin_cos();
        let (x, y, z) = (r * cu, r * su * ci, r * su * si);
        [x * co - y * so, x * so + y * co, z]
    }
}

/// Body-fixed satellite positions (m) at `t` seconds after the epoch, in the order
/// [`coverage`] uses (constellation by constellation, element set by element set), with the
/// same propagation (two-body, optional secular J2 drift, body rotation). This exposes the
/// geometry a coverage run sees, so an external tool can recompute the DOP maps on identical
/// satellite positions.
pub fn satellite_positions_fixed(
    body: &Body,
    constellations: &[Vec<Elements>],
    j2: bool,
    t: f64,
) -> Vec<Vec3> {
    constellations
        .iter()
        .enumerate()
        .flat_map(|(c, els)| els.iter().map(move |&el| (c, el)))
        .map(|(c, el)| Sat::new(el, body, j2, c).position_fixed(t, body.rotation_rate))
        .collect()
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// Resolve a central-body name (case-insensitive) to its constants: any planet, Pluto,
/// the Moon or one of the major moons in [`crate::body::SOLAR_SYSTEM`], through
/// [`Body::by_name`], so a constellation around Europa or Titan uses the same published
/// gravitational parameter, radius, J2 and IAU spin rate as the `solar-system` and
/// `body-pnt` kinds. The Sun is refused: it is not a body a coverage grid is laid on.
pub fn body_by_name(name: &str) -> Result<Body, String> {
    match Body::by_name(name) {
        Some(b) if b.name != "Sun" => Ok(b),
        _ => Err(format!(
            "unknown central body {:?}: expected a planet, Pluto, the Moon or a major moon \
             (earth, moon, mars, europa, titan, ...; see crate::body::SOLAR_SYSTEM)",
            name.trim().to_ascii_lowercase()
        )),
    }
}

// ── Walker patterns ──────────────────────────────────────────────────────────────

/// Walker pattern family: **delta** spreads the `P` ascending nodes over 360°, **star**
/// over 180° (the near-polar, streets-of-coverage arrangement).
#[derive(Clone, Copy, Debug, Default, Deserialize, Serialize, PartialEq, Eq)]
#[serde(rename_all = "kebab-case")]
pub enum WalkerPattern {
    #[default]
    /// Nodes spread over 360 deg.
    Delta,
    /// Nodes spread over 180 deg.
    Star,
}

/// A Walker `i: T/P/F` shell: `total` (T) satellites in `planes` (P) equally spaced planes,
/// phasing `phasing` (F, in `0..P`), all with the same semi-major axis, eccentricity and
/// inclination. `raan0`, `argp` and `m0` place the first satellite of the first plane.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct WalkerSpec {
    /// Delta or star.
    pub pattern: WalkerPattern,
    /// Walker T: satellites in the shell.
    pub total: usize,
    /// Walker P: equally spaced planes.
    pub planes: usize,
    /// Walker F: inter-plane phasing factor, in 0..P.
    pub phasing: usize,
    /// Semi-major axis (m).
    pub a_m: f64,
    /// Eccentricity.
    pub e: f64,
    /// Inclination to the body equator (rad).
    pub i_rad: f64,
    /// Node longitude of the first plane at the epoch (rad).
    pub raan0_rad: f64,
    /// Argument of periapsis (rad).
    pub argp_rad: f64,
    /// Mean anomaly at the epoch (rad).
    pub m0_rad: f64,
}

impl WalkerSpec {
    /// Node spacing between adjacent planes (rad): `2π/P` (delta) or `π/P` (star).
    pub fn raan_spacing_rad(&self) -> f64 {
        match self.pattern {
            WalkerPattern::Delta => TAU / self.planes as f64,
            WalkerPattern::Star => PI / self.planes as f64,
        }
    }

    /// Mean-anomaly spacing between adjacent satellites of one plane (rad): `2π·P/T`.
    pub fn in_plane_spacing_rad(&self) -> f64 {
        TAU * self.planes as f64 / self.total as f64
    }

    /// Phase offset between the corresponding satellites of adjacent planes (rad):
    /// `2π·F/T`.
    pub fn phase_offset_rad(&self) -> f64 {
        TAU * self.phasing as f64 / self.total as f64
    }

    /// The `T` element sets, plane by plane: plane `k` at node `raan0 + k·ΔΩ`, satellite `j`
    /// of it at mean anomaly `m0 + j·2πP/T + k·2πF/T`.
    pub fn elements(&self) -> Result<Vec<Elements>, String> {
        if self.planes == 0 || self.total == 0 {
            return Err("a Walker shell needs total > 0 and planes > 0".into());
        }
        if self.total % self.planes != 0 {
            return Err(format!(
                "Walker total {} is not a multiple of planes {}",
                self.total, self.planes
            ));
        }
        if self.phasing >= self.planes {
            return Err(format!(
                "Walker phasing F = {} must lie in 0..planes (= {})",
                self.phasing, self.planes
            ));
        }
        let per_plane = self.total / self.planes;
        let (d_raan, d_m, d_f) = (
            self.raan_spacing_rad(),
            self.in_plane_spacing_rad(),
            self.phase_offset_rad(),
        );
        let mut out = Vec::with_capacity(self.total);
        for k in 0..self.planes {
            for j in 0..per_plane {
                out.push(Elements {
                    a_m: self.a_m,
                    e: self.e,
                    i_rad: self.i_rad,
                    raan_rad: (self.raan0_rad + k as f64 * d_raan).rem_euclid(TAU),
                    argp_rad: self.argp_rad,
                    m0_rad: (self.m0_rad + j as f64 * d_m + k as f64 * d_f).rem_euclid(TAU),
                });
            }
        }
        Ok(out)
    }
}

// ── Published presets ────────────────────────────────────────────────────────────

/// GPS semi-major axis (m), GPS Standard Positioning Service Performance Standard (SPS PS),
/// 5th edition (April 2020), Table 3.2-3.
pub const GPS_A_M: f64 = 26_559_800.0;
/// Greenwich hour angle (deg) at the SPS PS slot-table epoch (23:59:43 UTC, 31 December
/// 2016), Table 3.2-1 notes.
pub const GPS_GHA_DEG: f64 = 100.765;

/// SPS PS 5th edition Table 3.2-1: `(slot, RAAN deg, argument of latitude deg, groundtrack
/// equatorial crossing deg)`. RAAN is referenced to FK5/J2000 at the table epoch.
pub const GPS_BASELINE_SLOTS: [GpsSlotRow; 24] = [
    ("A1", 288.85, 239.54, 127.85),
    ("A2", 288.85, 133.20, 74.68),
    ("A3", 288.85, 343.09, 179.63),
    ("A4", 288.85, 13.22, 14.69),
    ("B1", 348.85, 52.37, 94.27),
    ("B2", 348.85, 144.75, 140.46),
    ("B3", 348.85, 281.39, 28.78),
    ("B4", 348.85, 175.79, 155.98),
    ("C1", 48.85, 83.29, 169.73),
    ("C2", 48.85, 343.21, 119.69),
    ("C3", 48.85, 311.08, 103.62),
    ("C4", 48.85, 212.97, 54.57),
    ("D1", 108.85, 106.64, 61.40),
    ("D2", 108.85, 236.86, 126.51),
    ("D3", 108.85, 6.57, 11.37),
    ("D4", 108.85, 138.77, 77.47),
    ("E1", 168.85, 168.46, 152.31),
    ("E2", 168.85, 274.01, 25.09),
    ("E3", 168.85, 37.48, 86.82),
    ("E4", 168.85, 305.10, 40.63),
    ("F1", 228.85, 210.30, 53.23),
    ("F2", 228.85, 316.64, 106.40),
    ("F3", 228.85, 76.62, 166.39),
    ("F4", 228.85, 106.76, 1.46),
];

/// One slot row of an SPS PS slot table: `(slot, RAAN deg, argument of latitude deg,
/// groundtrack equatorial crossing deg)`.
pub type GpsSlotRow = (&'static str, f64, f64, f64);

/// SPS PS 5th edition Table 3.2-2: each expandable slot and its fore (F) and aft (A)
/// locations, `(slot, [(id, RAAN deg, argument of latitude deg, crossing deg); 2])`.
pub const GPS_EXPANDABLE_SLOTS: [(&str, [GpsSlotRow; 2]); 6] = [
    (
        "B1",
        [
            ("B1F", 348.85, 66.33, 101.25),
            ("B1A", 348.85, 37.77, 86.97),
        ],
    ),
    (
        "D2",
        [
            ("D2F", 108.85, 254.09, 135.13),
            ("D2A", 108.85, 229.39, 122.78),
        ],
    ),
    (
        "F2",
        [
            ("F2F", 228.85, 331.87, 114.02),
            ("F2A", 228.85, 305.43, 100.80),
        ],
    ),
    (
        "A2",
        [
            ("A2F", 288.85, 144.40, 80.28),
            ("A2A", 288.85, 117.96, 67.06),
        ],
    ),
    (
        "C4",
        [("C4F", 48.85, 220.43, 58.30), ("C4A", 48.85, 195.73, 45.95)],
    ),
    (
        "E3",
        [("E3F", 168.85, 52.08, 94.18), ("E3A", 168.85, 23.52, 79.84)],
    ),
];

fn gps_slot(raan_deg: f64, arglat_deg: f64) -> Elements {
    Elements {
        a_m: GPS_A_M,
        e: 0.0,
        i_rad: 55.0 * DEG,
        // Inertial RAAN to the body-fixed node longitude at the table epoch.
        raan_rad: ((raan_deg - GPS_GHA_DEG) * DEG).rem_euclid(TAU),
        argp_rad: 0.0,
        m0_rad: arglat_deg * DEG,
    }
}

/// The GPS baseline 24-slot constellation (SPS PS 2020 Tables 3.2-1 and 3.2-3), with the
/// named expandable slots replaced by their fore/aft pairs from Table 3.2-2. An empty
/// `expanded` list is the baseline; a name that is not an expandable slot is an error.
pub fn gps_slots(expanded: &[String]) -> Result<Vec<(String, Elements)>, String> {
    for name in expanded {
        if !GPS_EXPANDABLE_SLOTS.iter().any(|(s, _)| s == name) {
            return Err(format!(
                "{name:?} is not an expandable GPS slot (SPS PS Table 3.2-2 lists B1, D2, F2, \
                 A2, C4, E3)"
            ));
        }
    }
    let mut out = Vec::new();
    for &(slot, raan, arglat, _) in &GPS_BASELINE_SLOTS {
        match GPS_EXPANDABLE_SLOTS
            .iter()
            .find(|(s, _)| *s == slot && expanded.iter().any(|x| x == s))
        {
            Some((_, pair)) => {
                for &(id, r, u, _) in pair {
                    out.push((id.to_string(), gps_slot(r, u)));
                }
            }
            None => out.push((slot.to_string(), gps_slot(raan, arglat))),
        }
    }
    Ok(out)
}

/// Galileo reference constellation, Galileo Open Service Service Definition Document (OS
/// SDD) issue 1.1, Table 1 (Walker 24/3/1, semi-major axis 29 599 801 m, inclination 56°)
/// and Table 23 (plane A node 317.632°, first slot mean anomaly 180.153°, reference epoch
/// 2016-11-21 00:00:00 UTC). The document states no Greenwich hour angle, so the published
/// RAAN is used as the node longitude at the scenario epoch.
pub fn galileo_walker() -> WalkerSpec {
    WalkerSpec {
        pattern: WalkerPattern::Delta,
        total: 24,
        planes: 3,
        phasing: 1,
        a_m: 29_599_801.0,
        e: 0.0,
        i_rad: 56.0 * DEG,
        raan0_rad: 317.632 * DEG,
        argp_rad: 0.0,
        m0_rad: 180.153 * DEG,
    }
}

/// Earth equatorial radius (m) the BeiDou altitudes are added to.
const BDS_RE_M: f64 = 6_378_137.0;

/// BeiDou (BDS-3) nominal constellation, BeiDou Open Service Performance Standard
/// BDS-OS-PS-3.0 (May 2021) section 4.1: 24 medium Earth orbit (MEO) satellites in a
/// Walker 24/3/1 at 21 528 km altitude and 55°; 3 geostationary (GEO) satellites at
/// 35 786 km over 80°E, 110.5°E and 140°E; 3 inclined geosynchronous (IGSO) satellites at
/// 35 786 km and 55°. The standard states neither the MEO phase at any epoch nor the IGSO
/// nodes: here the MEO pattern starts at node 0° and mean anomaly 0°, and the three IGSOs
/// share one ground track crossing the equator at 118°E, 120° apart in phase (a modelled
/// choice, not a published value).
pub fn beidou_slots(include_geo_igso: bool) -> Result<Vec<(String, Elements)>, String> {
    let meo = WalkerSpec {
        pattern: WalkerPattern::Delta,
        total: 24,
        planes: 3,
        phasing: 1,
        a_m: BDS_RE_M + 21_528_000.0,
        e: 0.0,
        i_rad: 55.0 * DEG,
        raan0_rad: 0.0,
        argp_rad: 0.0,
        m0_rad: 0.0,
    };
    let mut out: Vec<(String, Elements)> = meo
        .elements()?
        .into_iter()
        .enumerate()
        .map(|(k, el)| (format!("M{:02}", k + 1), el))
        .collect();
    if include_geo_igso {
        let a_geo = BDS_RE_M + 35_786_000.0;
        for (k, lon) in [80.0_f64, 110.5, 140.0].into_iter().enumerate() {
            out.push((
                format!("G{}", k + 1),
                Elements {
                    a_m: a_geo,
                    e: 0.0,
                    i_rad: 0.0,
                    raan_rad: 0.0,
                    argp_rad: 0.0,
                    m0_rad: lon * DEG,
                },
            ));
        }
        for k in 0..3 {
            let shift = 120.0 * k as f64;
            out.push((
                format!("I{}", k + 1),
                Elements {
                    a_m: a_geo,
                    e: 0.0,
                    i_rad: 55.0 * DEG,
                    raan_rad: ((118.0 + shift) * DEG).rem_euclid(TAU),
                    argp_rad: 0.0,
                    m0_rad: (-shift * DEG).rem_euclid(TAU),
                },
            ));
        }
    }
    Ok(out)
}

/// GLONASS nominal constellation, GLONASS Interface Control Document (ICD) edition 5.1
/// (2008) section 5.2: plane `i` at absolute (Greenwich) node longitude
/// `251°15′00″ + 120°(i − 1)`, slot `j` at argument of latitude
/// `145°26′37″ + 15°(27 − 3j + 25·⌊(j − 1)/8⌋)`, both at 1983-01-01 00:00 Moscow time;
/// circular, 19 100 km altitude, 64.8° inclination. The absolute longitude is the node
/// longitude this module expects, so no hour-angle conversion is needed.
pub fn glonass_slots(body_re_m: f64) -> Vec<(String, Elements)> {
    let node0 = 251.0 + 15.0 / 60.0;
    let u0 = 145.0 + 26.0 / 60.0 + 37.0 / 3600.0;
    (1..=24)
        .map(|j: i32| {
            let plane = (j - 1) / 8; // 0, 1, 2
            let u = u0 + 15.0 * f64::from(27 - 3 * j + 25 * plane);
            (
                format!("R{j:02}"),
                Elements {
                    a_m: body_re_m + 19_100_000.0,
                    e: 0.0,
                    i_rad: 64.8 * DEG,
                    raan_rad: ((node0 + 120.0 * f64::from(plane)) * DEG).rem_euclid(TAU),
                    argp_rad: 0.0,
                    m0_rad: (u * DEG).rem_euclid(TAU),
                },
            )
        })
        .collect()
}

// ── Scenario input ───────────────────────────────────────────────────────────────

/// How receiver clocks enter the DOP solution.
#[derive(Clone, Copy, Debug, Default, Deserialize, Serialize, PartialEq, Eq)]
#[serde(rename_all = "kebab-case")]
pub enum ClockModel {
    /// One receiver clock unknown per constellation that has a satellite in view (the
    /// inter-system time offset is estimated, as a multi-GNSS receiver does).
    #[default]
    PerConstellation,
    /// A single clock shared by every satellite (systems assumed on one time scale).
    Common,
}

/// One Walker shell of a constellation.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ShellCfg {
    #[serde(default)]
    /// Delta or star.
    pub pattern: WalkerPattern,
    /// Walker T: satellites in the shell.
    pub total: usize,
    /// Walker P: equally spaced planes.
    pub planes: usize,
    #[serde(default)]
    /// Walker F: inter-plane phasing factor, in 0..P.
    pub phasing: usize,
    #[serde(default)]
    /// Altitude of the semi-major axis above the body radius (km); give this or semi_major_axis_km.
    pub altitude_km: Option<f64>,
    #[serde(default)]
    /// Semi-major axis (km); give this or altitude_km.
    pub semi_major_axis_km: Option<f64>,
    #[serde(default)]
    /// Eccentricity, in [0, 0.9).
    pub eccentricity: f64,
    /// Inclination to the body equator (deg).
    pub inclination_deg: f64,
    #[serde(default)]
    /// Node longitude of the first plane at the epoch (deg).
    pub raan0_deg: f64,
    #[serde(default)]
    /// Argument of periapsis (deg).
    pub argp_deg: f64,
    #[serde(default)]
    /// Mean anomaly of the first satellite of the first plane (deg).
    pub mean_anomaly0_deg: f64,
}

/// One explicitly listed satellite.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct SatelliteCfg {
    #[serde(default)]
    /// Satellite label (defaults to X001, X002, ...).
    pub id: Option<String>,
    #[serde(default)]
    /// Altitude of the semi-major axis above the body radius (km); give this or semi_major_axis_km.
    pub altitude_km: Option<f64>,
    #[serde(default)]
    /// Semi-major axis (km); give this or altitude_km.
    pub semi_major_axis_km: Option<f64>,
    #[serde(default)]
    /// Eccentricity, in [0, 0.9).
    pub eccentricity: f64,
    /// Inclination to the body equator (deg).
    pub inclination_deg: f64,
    #[serde(default)]
    /// Node longitude at the epoch (deg).
    pub raan_deg: f64,
    #[serde(default)]
    /// Argument of periapsis (deg).
    pub argp_deg: f64,
    #[serde(default)]
    /// Mean anomaly at the epoch (deg).
    pub mean_anomaly_deg: f64,
}

/// One constellation: a preset, any number of Walker shells and any number of explicit
/// satellites (they are concatenated).
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ConstellationCfg {
    /// Constellation name, used in the report.
    pub name: String,
    /// `gps-baseline`, `gps-expandable`, `galileo`, `beidou`, `beidou-meo` or `glonass`.
    #[serde(default)]
    pub preset: Option<String>,
    /// For `gps-expandable`: which expandable slots are expanded (default: all six).
    #[serde(default)]
    pub expanded: Option<Vec<String>>,
    #[serde(default)]
    /// Walker shells.
    pub shell: Vec<ShellCfg>,
    #[serde(default)]
    /// Explicit element sets.
    pub satellite: Vec<SatelliteCfg>,
}

fn d_body() -> String {
    "earth".into()
}
fn d_duration() -> f64 {
    86_164.0
}
fn d_step() -> f64 {
    600.0
}
fn d_mask() -> f64 {
    5.0
}
fn d_thr() -> f64 {
    6.0
}
fn d_grid() -> f64 {
    10.0
}
fn d_lat_min() -> f64 {
    -90.0
}
fn d_lat_max() -> f64 {
    90.0
}
fn d_lon_min() -> f64 {
    -180.0
}
fn d_lon_max() -> f64 {
    180.0
}
fn d_track_points() -> usize {
    24
}
fn d_max_tracks() -> usize {
    120
}
fn d_constellations() -> Vec<ConstellationCfg> {
    vec![ConstellationCfg {
        name: "GPS".into(),
        preset: Some("gps-baseline".into()),
        expanded: None,
        shell: Vec::new(),
        satellite: Vec::new(),
    }]
}

/// The `constellation-design` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ConstellationDesignScenario {
    /// Central body: any planet, Pluto, the Moon or a major moon (`earth`, `moon`, `mars`,
    /// `europa`, `titan`, ...), with the constants of [`crate::body`].
    #[serde(default = "d_body")]
    pub body: String,
    /// Window length (s); epochs are `k·step_s` for `k = 0..⌊duration_s/step_s⌋ − 1`.
    #[serde(default = "d_duration")]
    pub duration_s: f64,
    #[serde(default = "d_step")]
    /// Epoch spacing (s).
    pub step_s: f64,
    /// Elevation mask (deg).
    #[serde(default = "d_mask")]
    pub mask_deg: f64,
    /// A time-space point is "available" when a fix exists and PDOP is at most this.
    #[serde(default = "d_thr")]
    pub pdop_threshold: f64,
    /// Grid spacing (deg); cells are centred, rows and columns of equal spacing.
    #[serde(default = "d_grid")]
    pub grid_step_deg: f64,
    #[serde(default = "d_lat_min")]
    /// Southern edge of the grid (deg).
    pub lat_min_deg: f64,
    #[serde(default = "d_lat_max")]
    /// Northern edge of the grid (deg).
    pub lat_max_deg: f64,
    #[serde(default = "d_lon_min")]
    /// Western edge of the grid (deg).
    pub lon_min_deg: f64,
    #[serde(default = "d_lon_max")]
    /// Eastern edge of the grid (deg).
    pub lon_max_deg: f64,
    #[serde(default)]
    /// How receiver clocks enter the DOP solution.
    pub clock: ClockModel,
    /// Secular J2 drift of node and perigee from the body's second zonal harmonic.
    #[serde(default)]
    pub j2: bool,
    /// Samples per downsampled ground track.
    #[serde(default = "d_track_points")]
    pub track_points: usize,
    /// Most satellites whose tracks are emitted (every k-th satellite beyond this).
    #[serde(default = "d_max_tracks")]
    pub max_tracks: usize,
    #[serde(default = "d_constellations")]
    /// The constellations of the run (default: the GPS baseline).
    pub constellation: Vec<ConstellationCfg>,
}

/// One built constellation: its satellites and a description of where they came from.
#[derive(Clone, Debug)]
pub struct BuiltConstellation {
    /// Constellation name, used in the report.
    pub name: String,
    /// Where the satellites came from (preset citation, Walker shells, explicit sets).
    pub source: String,
    /// One label per satellite.
    pub ids: Vec<String>,
    /// One element set per satellite, aligned with ids.
    pub elements: Vec<Elements>,
    /// Description of each Walker shell for the report.
    pub shells: Vec<Value>,
}

fn semi_major_axis(
    alt_km: Option<f64>,
    a_km: Option<f64>,
    body: &Body,
    what: &str,
) -> Result<f64, String> {
    let a = match (alt_km, a_km) {
        (Some(_), Some(_)) => {
            return Err(format!(
                "{what}: give altitude_km or semi_major_axis_km, not both"
            ))
        }
        (Some(h), None) => body.re + h * 1000.0,
        (None, Some(a)) => a * 1000.0,
        (None, None) => return Err(format!("{what}: needs altitude_km or semi_major_axis_km")),
    };
    if !a.is_finite() || a <= body.re {
        return Err(format!(
            "{what}: semi-major axis {:.1} km is not above the {} radius",
            a / 1000.0,
            body.name
        ));
    }
    Ok(a)
}

fn check_ecc(e: f64, a: f64, body: &Body, what: &str) -> Result<(), String> {
    if !(0.0..0.9).contains(&e) {
        return Err(format!("{what}: eccentricity {e} must lie in [0, 0.9)"));
    }
    if a * (1.0 - e) <= body.re {
        return Err(format!(
            "{what}: perigee is below the {} surface",
            body.name
        ));
    }
    Ok(())
}

impl ConstellationCfg {
    /// Build the satellites of this constellation around `body`.
    pub fn build(&self, body: &Body) -> Result<BuiltConstellation, String> {
        let mut ids = Vec::new();
        let mut elements = Vec::new();
        let mut shells = Vec::new();
        let mut sources = Vec::new();
        if let Some(p) = &self.preset {
            if body.name != "Earth" {
                return Err(format!(
                    "constellation {:?}: preset {p:?} is an Earth constellation, the body is {}",
                    self.name, body.name
                ));
            }
            let (list, src): (Vec<(String, Elements)>, &str) = match p.as_str() {
                "gps-baseline" => (
                    gps_slots(&[])?,
                    "GPS baseline 24-slot constellation, GPS SPS Performance Standard 5th ed. \
                     (2020) Tables 3.2-1 and 3.2-3",
                ),
                "gps-expandable" => {
                    let exp = self.expanded.clone().unwrap_or_else(|| {
                        GPS_EXPANDABLE_SLOTS
                            .iter()
                            .map(|(s, _)| s.to_string())
                            .collect()
                    });
                    (
                        gps_slots(&exp)?,
                        "GPS expandable 24-slot constellation, GPS SPS Performance Standard \
                         5th ed. (2020) Tables 3.2-1, 3.2-2 and 3.2-3",
                    )
                }
                "galileo" => {
                    let w = galileo_walker();
                    shells.push(walker_shell_json(&w, body));
                    (
                        label_walker(&w, 'E')?,
                        "Galileo Walker 24/3/1, Galileo OS SDD issue 1.1 Tables 1 and 23",
                    )
                }
                "beidou" => (
                    beidou_slots(true)?,
                    "BeiDou MEO Walker 24/3/1 + 3 GEO + 3 IGSO, BDS-OS-PS-3.0 (2021) \
                     section 4.1; MEO phase and IGSO nodes modelled",
                ),
                "beidou-meo" => (
                    beidou_slots(false)?,
                    "BeiDou MEO Walker 24/3/1, BDS-OS-PS-3.0 (2021) section 4.1; phase \
                     modelled",
                ),
                "glonass" => (
                    glonass_slots(body.re),
                    "GLONASS 24/3/1, GLONASS ICD edition 5.1 (2008) section 5.2",
                ),
                other => {
                    return Err(format!(
                        "constellation {:?}: unknown preset {other:?} (expected gps-baseline, \
                         gps-expandable, galileo, beidou, beidou-meo or glonass)",
                        self.name
                    ))
                }
            };
            if self.expanded.is_some() && p != "gps-expandable" {
                return Err(format!(
                    "constellation {:?}: `expanded` applies only to the gps-expandable preset",
                    self.name
                ));
            }
            sources.push(src.to_string());
            for (id, el) in list {
                ids.push(id);
                elements.push(el);
            }
        }
        for (k, s) in self.shell.iter().enumerate() {
            let what = format!("constellation {:?} shell {}", self.name, k + 1);
            let a = semi_major_axis(s.altitude_km, s.semi_major_axis_km, body, &what)?;
            check_ecc(s.eccentricity, a, body, &what)?;
            let w = WalkerSpec {
                pattern: s.pattern,
                total: s.total,
                planes: s.planes,
                phasing: s.phasing,
                a_m: a,
                e: s.eccentricity,
                i_rad: s.inclination_deg * DEG,
                raan0_rad: s.raan0_deg * DEG,
                argp_rad: s.argp_deg * DEG,
                m0_rad: s.mean_anomaly0_deg * DEG,
            };
            let els = w.elements().map_err(|e| format!("{what}: {e}"))?;
            shells.push(walker_shell_json(&w, body));
            sources.push(format!(
                "Walker {} {}/{}/{}",
                match s.pattern {
                    WalkerPattern::Delta => "delta",
                    WalkerPattern::Star => "star",
                },
                s.total,
                s.planes,
                s.phasing
            ));
            for (j, el) in els.into_iter().enumerate() {
                ids.push(format!("S{}-{:04}", k + 1, j + 1));
                elements.push(el);
            }
        }
        if !self.satellite.is_empty() {
            sources.push(format!("{} explicit element sets", self.satellite.len()));
        }
        for (k, s) in self.satellite.iter().enumerate() {
            let what = format!("constellation {:?} satellite {}", self.name, k + 1);
            let a = semi_major_axis(s.altitude_km, s.semi_major_axis_km, body, &what)?;
            check_ecc(s.eccentricity, a, body, &what)?;
            ids.push(s.id.clone().unwrap_or_else(|| format!("X{:03}", k + 1)));
            elements.push(Elements {
                a_m: a,
                e: s.eccentricity,
                i_rad: s.inclination_deg * DEG,
                raan_rad: (s.raan_deg * DEG).rem_euclid(TAU),
                argp_rad: s.argp_deg * DEG,
                m0_rad: (s.mean_anomaly_deg * DEG).rem_euclid(TAU),
            });
        }
        if elements.is_empty() {
            return Err(format!(
                "constellation {:?} has no satellites: give a preset, a [[constellation.shell]] \
                 or a [[constellation.satellite]]",
                self.name
            ));
        }
        Ok(BuiltConstellation {
            name: self.name.clone(),
            source: sources.join("; "),
            ids,
            elements,
            shells,
        })
    }
}

fn label_walker(w: &WalkerSpec, prefix: char) -> Result<Vec<(String, Elements)>, String> {
    Ok(w.elements()?
        .into_iter()
        .enumerate()
        .map(|(k, el)| (format!("{prefix}{:02}", k + 1), el))
        .collect())
}

fn walker_shell_json(w: &WalkerSpec, body: &Body) -> Value {
    json!({
        "pattern": match w.pattern { WalkerPattern::Delta => "delta", WalkerPattern::Star => "star" },
        "total": w.total,
        "planes": w.planes,
        "phasing": w.phasing,
        "altitude_km": (w.a_m - body.re) / 1000.0,
        "inclination_deg": w.i_rad / DEG,
        "raan_spacing_deg": w.raan_spacing_rad() / DEG,
        "in_plane_spacing_deg": w.in_plane_spacing_rad() / DEG,
        "phase_offset_deg": w.phase_offset_rad() / DEG,
        "period_min": TAU * (w.a_m.powi(3) / body.mu).sqrt() / 60.0,
    })
}

// ── Dilution of precision ───────────────────────────────────────────────────────

/// Dilution-of-precision factors at one time-space point.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct DopValues {
    /// Geometric DOP: position plus the reference clock.
    pub gdop: f64,
    /// Position DOP.
    pub pdop: f64,
    /// Horizontal DOP (east and north).
    pub hdop: f64,
    /// Vertical DOP.
    pub vdop: f64,
    /// Time DOP of the reference clock: the clock of the lowest-numbered constellation with a
    /// satellite in view (GDOP uses the same clock).
    pub tdop: f64,
}

/// Invert a symmetric `n × n` matrix (row-major in `a`) by Gauss-Jordan elimination with
/// partial pivoting. `None` when it is singular.
fn invert(
    a: &mut [[f64; MAX_STATES]; MAX_STATES],
    n: usize,
) -> Option<[[f64; MAX_STATES]; MAX_STATES]> {
    let mut inv = [[0.0; MAX_STATES]; MAX_STATES];
    for (i, row) in inv.iter_mut().enumerate().take(n) {
        row[i] = 1.0;
    }
    for col in 0..n {
        let mut piv = col;
        for r in (col + 1)..n {
            if a[r][col].abs() > a[piv][col].abs() {
                piv = r;
            }
        }
        if a[piv][col].abs() < 1e-10 {
            return None;
        }
        a.swap(col, piv);
        inv.swap(col, piv);
        let d = a[col][col];
        for j in 0..n {
            a[col][j] /= d;
            inv[col][j] /= d;
        }
        for r in 0..n {
            if r != col {
                let f = a[r][col];
                if f != 0.0 {
                    for j in 0..n {
                        a[r][j] -= f * a[col][j];
                        inv[r][j] -= f * inv[col][j];
                    }
                }
            }
        }
    }
    Some(inv)
}

/// A normal-matrix accumulator for one time-space point: position plus up to
/// [`MAX_CLOCKS`] clock columns.
struct NormalAccum {
    a: [[f64; MAX_STATES]; MAX_STATES],
    /// Clock column of each constellation (`usize::MAX` until one of its satellites is seen).
    col: [usize; MAX_CLOCKS],
    clocks: usize,
    rows: usize,
}

impl NormalAccum {
    fn new() -> Self {
        Self {
            a: [[0.0; MAX_STATES]; MAX_STATES],
            col: [usize::MAX; MAX_CLOCKS],
            clocks: 0,
            rows: 0,
        }
    }

    /// Add one line of sight `los` (unit, receiver to satellite) on clock `clock`.
    fn add(&mut self, los: Vec3, clock: usize) {
        if self.col[clock] == usize::MAX {
            self.col[clock] = 3 + self.clocks;
            self.clocks += 1;
        }
        let c = self.col[clock];
        let g = [-los[0], -los[1], -los[2]];
        for i in 0..3 {
            for j in 0..3 {
                self.a[i][j] += g[i] * g[j];
            }
            self.a[i][c] += g[i];
            self.a[c][i] += g[i];
        }
        self.a[c][c] += 1.0;
        self.rows += 1;
    }

    /// Solve for the DOPs in the local east/north/up frame at the unit radial `up`.
    /// `ref_clock` is the clock index whose variance gives TDOP (the lowest one in view).
    fn solve(&mut self, east: Vec3, north: Vec3, up: Vec3, ref_clock: usize) -> Option<DopValues> {
        let n = 3 + self.clocks;
        if self.rows < n {
            return None;
        }
        let q = invert(&mut self.a, n)?;
        let var = |v: Vec3| -> f64 {
            let mut s = 0.0;
            for i in 0..3 {
                for j in 0..3 {
                    s += v[i] * q[i][j] * v[j];
                }
            }
            s.max(0.0)
        };
        let (ve, vn, vu) = (var(east), var(north), var(up));
        let pdop2 = (q[0][0] + q[1][1] + q[2][2]).max(0.0);
        let c = self.col[ref_clock];
        let tdop2 = q[c][c].max(0.0);
        Some(DopValues {
            gdop: (pdop2 + tdop2).sqrt(),
            pdop: pdop2.sqrt(),
            hdop: (ve + vn).sqrt(),
            vdop: vu.sqrt(),
            tdop: tdop2.sqrt(),
        })
    }
}

/// Local east, north and up unit vectors at geocentric latitude `lat` and longitude `lon`.
fn enu(lat: f64, lon: f64) -> (Vec3, Vec3, Vec3) {
    let (sl, cl) = lat.sin_cos();
    let (so, co) = lon.sin_cos();
    (
        [-so, co, 0.0],
        [-sl * co, -sl * so, cl],
        [cl * co, cl * so, sl],
    )
}

/// DOP at a surface point from explicit satellite positions and their clock indices —
/// the single-epoch entry point (used by the tests and available to callers).
pub fn dop_at(user: Vec3, sats: &[(Vec3, usize)]) -> Option<DopValues> {
    let r = norm(user);
    if r == 0.0 {
        return None;
    }
    let lat = (user[2] / r).asin();
    let lon = user[1].atan2(user[0]);
    let (e, n, u) = enu(lat, lon);
    let mut acc = NormalAccum::new();
    let mut first = None;
    for &(s, c) in sats {
        if c >= MAX_CLOCKS {
            return None;
        }
        let d = [s[0] - user[0], s[1] - user[1], s[2] - user[2]];
        let l = norm(d);
        if l == 0.0 {
            continue;
        }
        first = Some(first.map_or(c, |f: usize| f.min(c)));
        acc.add([d[0] / l, d[1] / l, d[2] / l], c);
    }
    acc.solve(e, n, u, first?)
}

// ── Weighted histograms for global statistics ────────────────────────────────────

const HIST_BIN: f64 = 0.005;
const HIST_BINS: usize = 8000; // linear bins over 0 .. 40
const HIST_LOG_BASE: f64 = 40.0;
const HIST_LOG_STEP: f64 = 0.001; // log bins above 40: 0.1 % relative resolution
const HIST_LOG_BINS: usize = 13_000; // 40 .. about 1.8e7, the last bin open-ended

#[derive(Clone, Debug)]
struct Hist {
    w: Vec<f64>,
    over: Vec<f64>,
    total_w: f64,
    sum_wx: f64,
    max: f64,
}

impl Hist {
    fn new() -> Self {
        Self {
            w: vec![0.0; HIST_BINS],
            over: vec![0.0; HIST_LOG_BINS],
            total_w: 0.0,
            sum_wx: 0.0,
            max: 0.0,
        }
    }
    fn add(&mut self, x: f64, w: f64) {
        let b = (x / HIST_BIN) as usize;
        if b < HIST_BINS {
            self.w[b] += w;
        } else {
            let k = ((x / HIST_LOG_BASE).ln() / HIST_LOG_STEP.ln_1p()) as usize;
            self.over[k.min(HIST_LOG_BINS - 1)] += w;
        }
        self.total_w += w;
        self.sum_wx += w * x;
        self.max = self.max.max(x);
    }
    /// Weighted quantile, resolved to the upper edge of its bin: 0.005 below 40 and 0.1 %
    /// relative above (capped at the largest value seen).
    fn quantile(&self, q: f64) -> Option<f64> {
        if self.total_w <= 0.0 {
            return None;
        }
        let target = q * self.total_w;
        let mut cum = 0.0;
        for (b, &w) in self.w.iter().enumerate() {
            cum += w;
            if cum >= target && w > 0.0 {
                return Some(round4((b + 1) as f64 * HIST_BIN).min(self.max));
            }
        }
        for (k, &w) in self.over.iter().enumerate() {
            cum += w;
            if cum >= target && w > 0.0 {
                let edge = HIST_LOG_BASE * (1.0 + HIST_LOG_STEP).powi(k as i32 + 1);
                return Some(round4(edge.min(self.max)));
            }
        }
        Some(self.max)
    }
    fn mean(&self) -> Option<f64> {
        (self.total_w > 0.0).then(|| self.sum_wx / self.total_w)
    }
    fn json(&self) -> Value {
        json!({
            "mean": self.mean().map(round4),
            "median": self.quantile(0.5),
            "p90": self.quantile(0.9),
            "p95": self.quantile(0.95),
            "p99": self.quantile(0.99),
            "max": (self.total_w > 0.0).then_some(round4(self.max)),
        })
    }
}

// ── The coverage engine ─────────────────────────────────────────────────────────

/// Work counters of one coverage run: how much the visibility prefilter saved.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize)]
pub struct WorkCounters {
    /// Epochs evaluated.
    pub epochs: usize,
    /// Grid cells evaluated at every epoch.
    pub grid_points: usize,
    /// Satellites propagated at every epoch.
    pub satellites: usize,
    /// Satellite × point × epoch pairs a brute-force scan would test.
    pub pair_tests_brute_force: u64,
    /// Pairs actually tested after the latitude-band prefilter.
    pub pair_tests_after_prefilter: u64,
    /// Visible pairs found.
    pub visible_pairs: u64,
    /// Time-space points with a DOP solution.
    pub dop_solutions: u64,
}

/// The per-cell and global result of a coverage run.
#[derive(Clone, Debug)]
pub struct CoverageResult {
    /// Latitude of each grid row centre (deg).
    pub lats_deg: Vec<f64>,
    /// Longitude of each grid column centre (deg).
    pub lons_deg: Vec<f64>,
    /// Mean satellites above the mask per cell, rows by latitude.
    pub mean_visible: Vec<Vec<f64>>,
    /// Fewest satellites above the mask per cell.
    pub min_visible: Vec<Vec<usize>>,
    /// Most satellites above the mask per cell.
    pub max_visible: Vec<Vec<usize>>,
    /// Share of epochs with a fix and PDOP at or below the threshold, per cell (%).
    pub availability_pct: Vec<Vec<f64>>,
    /// Share of epochs with a non-singular fix, per cell (%).
    pub fix_pct: Vec<Vec<f64>>,
    /// Mean PDOP per cell over epochs with a fix.
    pub mean_pdop: Vec<Vec<Option<f64>>>,
    /// Mean HDOP per cell over epochs with a fix.
    pub mean_hdop: Vec<Vec<Option<f64>>>,
    /// Mean VDOP per cell over epochs with a fix.
    pub mean_vdop: Vec<Vec<Option<f64>>>,
    /// Mean GDOP per cell over epochs with a fix.
    pub mean_gdop: Vec<Vec<Option<f64>>>,
    /// Largest PDOP per cell over epochs with a fix.
    pub max_pdop: Vec<Vec<Option<f64>>>,
    /// Area-weighted global statistics.
    pub global_availability_pct: f64,
    /// Area-weighted share of time-space points with a fix (%).
    pub global_fix_pct: f64,
    /// Availability of the worst grid cell (%).
    pub worst_site_availability_pct: f64,
    /// Area-weighted mean satellites above the mask.
    pub global_mean_visible: f64,
    /// Fewest satellites above the mask at any time-space point.
    pub global_min_visible: usize,
    /// Area-weighted mean number of satellites in view from each constellation.
    pub mean_visible_by_constellation: Vec<f64>,
    hist_pdop: Hist,
    hist_hdop: Hist,
    hist_vdop: Hist,
    hist_gdop: Hist,
    /// Work counters, including what the prefilter saved.
    pub work: WorkCounters,
}

impl CoverageResult {
    /// Weighted quantile of one DOP over all time-space points with a fix.
    pub fn quantile(&self, which: &str, q: f64) -> Option<f64> {
        self.hist(which).and_then(|h| h.quantile(q))
    }
    /// Weighted mean of one DOP over all time-space points with a fix.
    pub fn mean(&self, which: &str) -> Option<f64> {
        self.hist(which).and_then(|h| h.mean())
    }
    /// Largest value of one DOP over all time-space points with a fix.
    pub fn max(&self, which: &str) -> Option<f64> {
        self.hist(which)
            .and_then(|h| (h.total_w > 0.0).then_some(h.max))
    }
    fn hist(&self, which: &str) -> Option<&Hist> {
        match which {
            "pdop" => Some(&self.hist_pdop),
            "hdop" => Some(&self.hist_hdop),
            "vdop" => Some(&self.hist_vdop),
            "gdop" => Some(&self.hist_gdop),
            _ => None,
        }
    }
}

/// Grid, window and mask of a coverage run.
#[derive(Clone, Copy, Debug)]
pub struct CoverageSpec {
    /// Window length (s).
    pub duration_s: f64,
    /// Epoch spacing (s).
    pub step_s: f64,
    /// Elevation mask (deg).
    pub mask_deg: f64,
    /// PDOP at or below which a point with a fix is available.
    pub pdop_threshold: f64,
    /// Grid spacing (deg).
    pub grid_step_deg: f64,
    /// Southern edge of the grid (deg).
    pub lat_min_deg: f64,
    /// Northern edge of the grid (deg).
    pub lat_max_deg: f64,
    /// Western edge of the grid (deg).
    pub lon_min_deg: f64,
    /// Eastern edge of the grid (deg).
    pub lon_max_deg: f64,
    /// How receiver clocks enter the DOP solution.
    pub clock: ClockModel,
    /// Secular J2 drift of node and periapsis.
    pub j2: bool,
}

fn centres(lo: f64, hi: f64, step: f64) -> Vec<f64> {
    let n = ((hi - lo) / step).round().max(1.0) as usize;
    (0..n).map(|k| lo + (k as f64 + 0.5) * step).collect()
}

fn epochs(duration_s: f64, step_s: f64) -> Vec<f64> {
    let n = ((duration_s / step_s + 1e-9).floor() as usize).max(1);
    (0..n).map(|k| k as f64 * step_s).collect()
}

/// Run the coverage and DOP map for `constellations` (each a list of element sets)
/// around `body`. `brute_force` switches the latitude-band prefilter off (for tests).
pub fn coverage(
    body: &Body,
    constellations: &[Vec<Elements>],
    spec: &CoverageSpec,
    brute_force: bool,
) -> Result<CoverageResult, String> {
    if constellations.is_empty() {
        return Err("no constellation given".into());
    }
    if spec.clock == ClockModel::PerConstellation && constellations.len() > MAX_CLOCKS {
        return Err(format!(
            "{} constellations with one clock each exceeds the {MAX_CLOCKS}-clock limit; \
             use clock = \"common\" or merge constellations",
            constellations.len()
        ));
    }
    let sats: Vec<Sat> = constellations
        .iter()
        .enumerate()
        .flat_map(|(c, els)| els.iter().map(move |&el| (c, el)))
        .map(|(c, el)| Sat::new(el, body, spec.j2, c))
        .collect();
    let n_cons = constellations.len();
    let clock_of = |c: usize| match spec.clock {
        ClockModel::PerConstellation => c,
        ClockModel::Common => 0,
    };
    let lats = centres(spec.lat_min_deg, spec.lat_max_deg, spec.grid_step_deg);
    let lons = centres(spec.lon_min_deg, spec.lon_max_deg, spec.grid_step_deg);
    let times = epochs(spec.duration_s, spec.step_s);
    let (nla, nlo, ne) = (lats.len(), lons.len(), times.len());
    let re = body.re;
    let eps = spec.mask_deg * DEG;
    let (se, ce) = eps.sin_cos();

    // Per-point geometry, computed once.
    let mut basis = Vec::with_capacity(nla * nlo);
    for &la in &lats {
        for &lo in &lons {
            basis.push(enu(la * DEG, lo * DEG));
        }
    }
    let weights: Vec<f64> = lats.iter().map(|la| (la * DEG).cos().max(0.0)).collect();

    let cells = nla * nlo;
    let mut sum_vis = vec![0.0_f64; cells];
    let mut min_vis = vec![usize::MAX; cells];
    let mut max_vis = vec![0_usize; cells];
    let mut n_fix = vec![0_usize; cells];
    let mut n_avail = vec![0_usize; cells];
    let mut s_pdop = vec![0.0_f64; cells];
    let mut s_hdop = vec![0.0_f64; cells];
    let mut s_vdop = vec![0.0_f64; cells];
    let mut s_gdop = vec![0.0_f64; cells];
    let mut m_pdop = vec![0.0_f64; cells];
    // Visible-satellite counts per cell and constellation, kept as integers so the global
    // per-constellation mean is one weighted sum over cells (not a long running float sum).
    let mut vis_count = vec![0_u64; cells * n_cons];
    let (mut hp, mut hh, mut hv, mut hg) = (Hist::new(), Hist::new(), Hist::new(), Hist::new());
    let mut work = WorkCounters {
        epochs: ne,
        grid_points: cells,
        satellites: sats.len(),
        ..Default::default()
    };

    // Per-epoch scratch.
    let ns = sats.len();
    let mut pos = vec![[0.0; 3]; ns];
    let mut unit = vec![[0.0; 3]; ns];
    let mut cos_lam = vec![2.0_f64; ns];
    let mut sat_lat = vec![0.0_f64; ns];
    let mut order: Vec<usize> = (0..ns).collect();
    let mut sorted_lat = vec![0.0_f64; ns];
    let mut per_cons = vec![0_usize; n_cons];

    for &t in &times {
        let mut lam_max = 0.0_f64;
        for (k, s) in sats.iter().enumerate() {
            let p = s.position_fixed(t, body.rotation_rate);
            let r = norm(p);
            pos[k] = p;
            unit[k] = [p[0] / r, p[1] / r, p[2] / r];
            sat_lat[k] = unit[k][2].clamp(-1.0, 1.0).asin();
            let x = re * ce / r;
            if x < 1.0 {
                let lam = x.acos() - eps;
                if lam > 0.0 {
                    cos_lam[k] = lam.cos();
                    lam_max = lam_max.max(lam);
                } else {
                    cos_lam[k] = 2.0;
                }
            } else {
                cos_lam[k] = 2.0; // never visible
            }
        }
        order.sort_by(|&a, &b| sat_lat[a].total_cmp(&sat_lat[b]));
        for (k, &i) in order.iter().enumerate() {
            sorted_lat[k] = sat_lat[i];
        }
        for (ila, &la) in lats.iter().enumerate() {
            let phi = la * DEG;
            let (lo_i, hi_i) = if brute_force {
                (0, ns)
            } else {
                let lo = phi - lam_max - 1e-9;
                let hi = phi + lam_max + 1e-9;
                (
                    sorted_lat.partition_point(|&x| x < lo),
                    sorted_lat.partition_point(|&x| x <= hi),
                )
            };
            let w = weights[ila];
            for ilo in 0..nlo {
                let cell = ila * nlo + ilo;
                let (e_v, n_v, u_v) = basis[cell];
                let user = [re * u_v[0], re * u_v[1], re * u_v[2]];
                let mut acc = NormalAccum::new();
                let mut first: Option<usize> = None;
                let mut nvis = 0usize;
                per_cons.iter_mut().for_each(|c| *c = 0);
                for &i in &order[lo_i..hi_i] {
                    if dot(u_v, unit[i]) >= cos_lam[i] {
                        let p = pos[i];
                        let d = [p[0] - user[0], p[1] - user[1], p[2] - user[2]];
                        let l = norm(d);
                        if brute_force {
                            // The direct elevation test, to hold the threshold to it.
                            if dot(d, u_v) < l * se {
                                continue;
                            }
                        }
                        let c = clock_of(sats[i].cons);
                        // The reference clock is the lowest-numbered one in view, so TDOP
                        // and GDOP do not depend on the order the satellites are scanned in.
                        first = Some(first.map_or(c, |f: usize| f.min(c)));
                        acc.add([d[0] / l, d[1] / l, d[2] / l], c);
                        nvis += 1;
                        per_cons[sats[i].cons] += 1;
                    }
                }
                work.pair_tests_after_prefilter += (hi_i - lo_i) as u64;
                work.visible_pairs += nvis as u64;
                sum_vis[cell] += nvis as f64;
                min_vis[cell] = min_vis[cell].min(nvis);
                max_vis[cell] = max_vis[cell].max(nvis);
                for (c, &k) in per_cons.iter().enumerate() {
                    vis_count[cell * n_cons + c] += k as u64;
                }
                if let Some(d) = first.and_then(|f| acc.solve(e_v, n_v, u_v, f)) {
                    work.dop_solutions += 1;
                    n_fix[cell] += 1;
                    if d.pdop <= spec.pdop_threshold {
                        n_avail[cell] += 1;
                    }
                    s_pdop[cell] += d.pdop;
                    s_hdop[cell] += d.hdop;
                    s_vdop[cell] += d.vdop;
                    s_gdop[cell] += d.gdop;
                    m_pdop[cell] = m_pdop[cell].max(d.pdop);
                    hp.add(d.pdop, w);
                    hh.add(d.hdop, w);
                    hv.add(d.vdop, w);
                    hg.add(d.gdop, w);
                }
            }
        }
    }
    work.pair_tests_brute_force = (ns * cells * ne) as u64;

    let fe = ne as f64;
    let grid = |f: &dyn Fn(usize) -> f64| -> Vec<Vec<f64>> {
        (0..nla)
            .map(|a| (0..nlo).map(|o| f(a * nlo + o)).collect())
            .collect()
    };
    let grid_opt = |s: &[f64]| -> Vec<Vec<Option<f64>>> {
        (0..nla)
            .map(|a| {
                (0..nlo)
                    .map(|o| {
                        let c = a * nlo + o;
                        (n_fix[c] > 0).then(|| s[c] / n_fix[c] as f64)
                    })
                    .collect()
            })
            .collect()
    };
    let wsum: f64 = weights.iter().sum::<f64>() * nlo as f64;
    let mut g_av = 0.0;
    let mut g_fix = 0.0;
    let mut g_vis = 0.0;
    for (a, &wa) in weights.iter().enumerate() {
        for o in 0..nlo {
            let c = a * nlo + o;
            g_av += wa * n_avail[c] as f64 / fe;
            g_fix += wa * n_fix[c] as f64 / fe;
            g_vis += wa * sum_vis[c] / fe;
        }
    }
    let norm_w = if wsum > 0.0 { wsum } else { 1.0 };
    let mut vis_by_cons = vec![0.0_f64; n_cons];
    for (a, &wa) in weights.iter().enumerate() {
        for o in 0..nlo {
            let c = a * nlo + o;
            for (k, v) in vis_by_cons.iter_mut().enumerate() {
                *v += wa * vis_count[c * n_cons + k] as f64 / fe;
            }
        }
    }
    let worst = (0..cells)
        .map(|c| 100.0 * n_avail[c] as f64 / fe)
        .fold(f64::INFINITY, f64::min);
    Ok(CoverageResult {
        mean_visible: grid(&|c| sum_vis[c] / fe),
        min_visible: (0..nla)
            .map(|a| (0..nlo).map(|o| min_vis[a * nlo + o]).collect())
            .collect(),
        max_visible: (0..nla)
            .map(|a| (0..nlo).map(|o| max_vis[a * nlo + o]).collect())
            .collect(),
        availability_pct: grid(&|c| 100.0 * n_avail[c] as f64 / fe),
        fix_pct: grid(&|c| 100.0 * n_fix[c] as f64 / fe),
        mean_pdop: grid_opt(&s_pdop),
        mean_hdop: grid_opt(&s_hdop),
        mean_vdop: grid_opt(&s_vdop),
        mean_gdop: grid_opt(&s_gdop),
        max_pdop: (0..nla)
            .map(|a| {
                (0..nlo)
                    .map(|o| {
                        let c = a * nlo + o;
                        (n_fix[c] > 0).then_some(m_pdop[c])
                    })
                    .collect()
            })
            .collect(),
        global_availability_pct: 100.0 * g_av / norm_w,
        global_fix_pct: 100.0 * g_fix / norm_w,
        worst_site_availability_pct: worst,
        global_mean_visible: g_vis / norm_w,
        global_min_visible: min_vis.iter().copied().min().unwrap_or(0),
        mean_visible_by_constellation: vis_by_cons.iter().map(|v| v / norm_w).collect(),
        lats_deg: lats,
        lons_deg: lons,
        hist_pdop: hp,
        hist_hdop: hh,
        hist_vdop: hv,
        hist_gdop: hg,
        work,
    })
}

/// Sub-satellite latitude and longitude (deg) of `el` at each of `times`.
fn ground_track(el: Elements, body: &Body, j2: bool, times: &[f64]) -> (Vec<f64>, Vec<f64>) {
    let s = Sat::new(el, body, j2, 0);
    let mut la = Vec::with_capacity(times.len());
    let mut lo = Vec::with_capacity(times.len());
    for &t in times {
        let p = s.position_fixed(t, body.rotation_rate);
        let r = norm(p);
        la.push(round3((p[2] / r).asin() / DEG));
        lo.push(round3(p[1].atan2(p[0]) / DEG));
    }
    (la, lo)
}

fn round3(x: f64) -> f64 {
    (x * 1000.0).round() / 1000.0
}

fn round4(x: f64) -> f64 {
    (x * 10_000.0).round() / 10_000.0
}

// ── Report ───────────────────────────────────────────────────────────────────────

/// Unit and provenance of every numeric field the report emits.
const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "inputs.duration_s", unit: "s", provenance: Input, definition: "length of the sampled window" },
        FieldUnit { path: "inputs.step_s", unit: "s", provenance: Input, definition: "spacing of the sampled epochs" },
        FieldUnit { path: "inputs.epochs", unit: "count", provenance: Computed, definition: "epochs sampled, floor(duration_s / step_s), the window being half-open" },
        FieldUnit { path: "inputs.mask_deg", unit: "deg", provenance: Input, definition: "elevation mask above the local horizontal of a spherical body" },
        FieldUnit { path: "inputs.pdop_threshold", unit: "1", provenance: Input, definition: "position dilution of precision (PDOP) at or below which a time-space point with a fix counts as available" },
        FieldUnit { path: "inputs.grid_step_deg", unit: "deg", provenance: Input, definition: "latitude and longitude spacing of the grid cells" },
        FieldUnit { path: "inputs.lat_min_deg", unit: "deg", provenance: Input, definition: "southern edge of the grid" },
        FieldUnit { path: "inputs.lat_max_deg", unit: "deg", provenance: Input, definition: "northern edge of the grid" },
        FieldUnit { path: "inputs.lon_min_deg", unit: "deg", provenance: Input, definition: "western edge of the grid" },
        FieldUnit { path: "inputs.lon_max_deg", unit: "deg", provenance: Input, definition: "eastern edge of the grid" },
        FieldUnit { path: "body.radius_km", unit: "km", provenance: Constant, definition: "reference radius of the central body (crate::body)" },
        FieldUnit { path: "body.mu_km3_s2", unit: "km^3/s^2", provenance: Constant, definition: "gravitational parameter of the central body (crate::body)" },
        FieldUnit { path: "body.rotation_rate_deg_s", unit: "deg/s", provenance: Constant, definition: "sidereal spin rate of the central body (crate::body)" },
        FieldUnit { path: "total_satellites", unit: "count", provenance: Computed, definition: "satellites across every constellation of the run" },
        FieldUnit { path: "constellations[].satellites", unit: "count", provenance: Computed, definition: "satellites in this constellation" },
        FieldUnit { path: "constellations[].mean_visible", unit: "count", provenance: Computed, definition: "area-weighted mean over the grid and the window of this constellation's satellites above the mask" },
        FieldUnit { path: "constellations[].shells[].total", unit: "count", provenance: Input, definition: "Walker T: satellites in the shell" },
        FieldUnit { path: "constellations[].shells[].planes", unit: "count", provenance: Input, definition: "Walker P: equally spaced orbital planes" },
        FieldUnit { path: "constellations[].shells[].phasing", unit: "count", provenance: Input, definition: "Walker F: inter-plane phasing factor in 0..P" },
        FieldUnit { path: "constellations[].shells[].altitude_km", unit: "km", provenance: Computed, definition: "semi-major axis minus the body radius" },
        FieldUnit { path: "constellations[].shells[].inclination_deg", unit: "deg", provenance: Input, definition: "orbital inclination to the body equator" },
        FieldUnit { path: "constellations[].shells[].raan_spacing_deg", unit: "deg", provenance: ClosedForm, definition: "node spacing between adjacent planes: 360/P for a delta pattern, 180/P for a star" },
        FieldUnit { path: "constellations[].shells[].in_plane_spacing_deg", unit: "deg", provenance: ClosedForm, definition: "mean-anomaly spacing within a plane: 360*P/T" },
        FieldUnit { path: "constellations[].shells[].phase_offset_deg", unit: "deg", provenance: ClosedForm, definition: "mean-anomaly offset between corresponding satellites of adjacent planes: 360*F/T" },
        FieldUnit { path: "constellations[].shells[].period_min", unit: "min", provenance: ClosedForm, definition: "two-body period 2*pi*sqrt(a^3/mu)" },
        FieldUnit { path: "global.availability_pct", unit: "%", provenance: Computed, definition: "area-weighted share of time-space points with a fix and PDOP at or below pdop_threshold" },
        FieldUnit { path: "global.fix_pct", unit: "%", provenance: Computed, definition: "area-weighted share of time-space points with enough satellites in view for a non-singular fix" },
        FieldUnit { path: "global.worst_site_availability_pct", unit: "%", provenance: Computed, definition: "availability of the grid cell with the lowest availability" },
        FieldUnit { path: "global.mean_visible", unit: "count", provenance: Computed, definition: "area-weighted mean number of satellites above the mask" },
        FieldUnit { path: "global.min_visible", unit: "count", provenance: Computed, definition: "fewest satellites above the mask at any time-space point" },
        FieldUnit { path: "global.pdop.mean", unit: "1", provenance: Computed, definition: "area-weighted mean of the position dilution of precision (PDOP) over the time-space points with a fix" },
        FieldUnit { path: "global.pdop.median", unit: "1", provenance: Computed, definition: "area-weighted median of the position dilution of precision (PDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.pdop.p90", unit: "1", provenance: Computed, definition: "area-weighted 90th percentile of the position dilution of precision (PDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.pdop.p95", unit: "1", provenance: Computed, definition: "area-weighted 95th percentile of the position dilution of precision (PDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.pdop.p99", unit: "1", provenance: Computed, definition: "area-weighted 99th percentile of the position dilution of precision (PDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.pdop.max", unit: "1", provenance: Computed, definition: "largest value of the position dilution of precision (PDOP) over the time-space points with a fix" },
        FieldUnit { path: "global.hdop.mean", unit: "1", provenance: Computed, definition: "area-weighted mean of the horizontal dilution of precision (HDOP) over the time-space points with a fix" },
        FieldUnit { path: "global.hdop.median", unit: "1", provenance: Computed, definition: "area-weighted median of the horizontal dilution of precision (HDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.hdop.p90", unit: "1", provenance: Computed, definition: "area-weighted 90th percentile of the horizontal dilution of precision (HDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.hdop.p95", unit: "1", provenance: Computed, definition: "area-weighted 95th percentile of the horizontal dilution of precision (HDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.hdop.p99", unit: "1", provenance: Computed, definition: "area-weighted 99th percentile of the horizontal dilution of precision (HDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.hdop.max", unit: "1", provenance: Computed, definition: "largest value of the horizontal dilution of precision (HDOP) over the time-space points with a fix" },
        FieldUnit { path: "global.vdop.mean", unit: "1", provenance: Computed, definition: "area-weighted mean of the vertical dilution of precision (VDOP) over the time-space points with a fix" },
        FieldUnit { path: "global.vdop.median", unit: "1", provenance: Computed, definition: "area-weighted median of the vertical dilution of precision (VDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.vdop.p90", unit: "1", provenance: Computed, definition: "area-weighted 90th percentile of the vertical dilution of precision (VDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.vdop.p95", unit: "1", provenance: Computed, definition: "area-weighted 95th percentile of the vertical dilution of precision (VDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.vdop.p99", unit: "1", provenance: Computed, definition: "area-weighted 99th percentile of the vertical dilution of precision (VDOP) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.vdop.max", unit: "1", provenance: Computed, definition: "largest value of the vertical dilution of precision (VDOP) over the time-space points with a fix" },
        FieldUnit { path: "global.gdop.mean", unit: "1", provenance: Computed, definition: "area-weighted mean of the geometric dilution of precision (GDOP: position plus the reference clock) over the time-space points with a fix" },
        FieldUnit { path: "global.gdop.median", unit: "1", provenance: Computed, definition: "area-weighted median of the geometric dilution of precision (GDOP: position plus the reference clock) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.gdop.p90", unit: "1", provenance: Computed, definition: "area-weighted 90th percentile of the geometric dilution of precision (GDOP: position plus the reference clock) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.gdop.p95", unit: "1", provenance: Computed, definition: "area-weighted 95th percentile of the geometric dilution of precision (GDOP: position plus the reference clock) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.gdop.p99", unit: "1", provenance: Computed, definition: "area-weighted 99th percentile of the geometric dilution of precision (GDOP: position plus the reference clock) over the time-space points with a fix (quantiles resolved to 0.005)" },
        FieldUnit { path: "global.gdop.max", unit: "1", provenance: Computed, definition: "largest value of the geometric dilution of precision (GDOP: position plus the reference clock) over the time-space points with a fix" },
        FieldUnit { path: "grid.lat_deg[]", unit: "deg", provenance: Computed, definition: "latitude of each grid row centre" },
        FieldUnit { path: "grid.lon_deg[]", unit: "deg", provenance: Computed, definition: "longitude of each grid column centre" },
        FieldUnit { path: "grid.mean_visible[][]", unit: "count", provenance: Computed, definition: "mean satellites above the mask in the cell over the window, rows by latitude" },
        FieldUnit { path: "grid.min_visible[][]", unit: "count", provenance: Computed, definition: "fewest satellites above the mask in the cell over the window" },
        FieldUnit { path: "grid.max_visible[][]", unit: "count", provenance: Computed, definition: "most satellites above the mask in the cell over the window" },
        FieldUnit { path: "grid.availability_pct[][]", unit: "%", provenance: Computed, definition: "share of epochs with a fix and PDOP at or below pdop_threshold in the cell" },
        FieldUnit { path: "grid.fix_pct[][]", unit: "%", provenance: Computed, definition: "share of epochs with a non-singular fix in the cell" },
        FieldUnit { path: "grid.mean_pdop[][]", unit: "1", provenance: Computed, definition: "mean PDOP in the cell over epochs with a fix; null when the cell never has a fix" },
        FieldUnit { path: "grid.mean_hdop[][]", unit: "1", provenance: Computed, definition: "mean horizontal DOP in the cell over epochs with a fix; null when the cell never has a fix" },
        FieldUnit { path: "grid.mean_vdop[][]", unit: "1", provenance: Computed, definition: "mean vertical DOP in the cell over epochs with a fix; null when the cell never has a fix" },
        FieldUnit { path: "grid.mean_gdop[][]", unit: "1", provenance: Computed, definition: "mean geometric DOP in the cell over epochs with a fix; null when the cell never has a fix" },
        FieldUnit { path: "grid.max_pdop[][]", unit: "1", provenance: Computed, definition: "largest PDOP in the cell over epochs with a fix; null when the cell never has a fix" },
        FieldUnit { path: "tracks.times_s[]", unit: "s", provenance: Computed, definition: "epochs of the downsampled ground-track samples" },
        FieldUnit { path: "tracks.shown", unit: "count", provenance: Computed, definition: "satellites whose tracks are emitted" },
        FieldUnit { path: "tracks.total", unit: "count", provenance: Computed, definition: "satellites in the run" },
        FieldUnit { path: "tracks.stride", unit: "count", provenance: Computed, definition: "every stride-th satellite of the run is emitted" },
        FieldUnit { path: "tracks.satellites[].lat_deg[]", unit: "deg", provenance: Computed, definition: "geocentric latitude of the sub-satellite point" },
        FieldUnit { path: "tracks.satellites[].lon_deg[]", unit: "deg", provenance: Computed, definition: "body-fixed longitude of the sub-satellite point" },
        FieldUnit { path: "work.epochs", unit: "count", provenance: Computed, definition: "epochs evaluated" },
        FieldUnit { path: "work.grid_points", unit: "count", provenance: Computed, definition: "grid cells evaluated at every epoch" },
        FieldUnit { path: "work.satellites", unit: "count", provenance: Computed, definition: "satellites propagated at every epoch" },
        FieldUnit { path: "work.pair_tests_brute_force", unit: "count", provenance: Computed, definition: "satellite-point-epoch visibility tests a scan without the prefilter would make" },
        FieldUnit { path: "work.pair_tests_after_prefilter", unit: "count", provenance: Computed, definition: "visibility tests made after the sub-satellite latitude band removed the satellites that cannot be in view" },
        FieldUnit { path: "work.visible_pairs", unit: "count", provenance: Computed, definition: "satellite-point-epoch pairs above the mask" },
        FieldUnit { path: "work.dop_solutions", unit: "count", provenance: Computed, definition: "time-space points with a non-singular DOP solution" },
        FieldUnit { path: "work.prefilter_ratio", unit: "1", provenance: Computed, definition: "pair_tests_after_prefilter / pair_tests_brute_force" },
    ]
};

impl ConstellationDesignScenario {
    fn spec(&self) -> CoverageSpec {
        CoverageSpec {
            duration_s: self.duration_s,
            step_s: self.step_s,
            mask_deg: self.mask_deg,
            pdop_threshold: self.pdop_threshold,
            grid_step_deg: self.grid_step_deg,
            lat_min_deg: self.lat_min_deg,
            lat_max_deg: self.lat_max_deg,
            lon_min_deg: self.lon_min_deg,
            lon_max_deg: self.lon_max_deg,
            clock: self.clock,
            j2: self.j2,
        }
    }

    fn validate(&self) -> Result<(), String> {
        let fin = |x: f64, what: &str| {
            if x.is_finite() {
                Ok(())
            } else {
                Err(format!("{what} must be finite"))
            }
        };
        fin(self.duration_s, "duration_s")?;
        fin(self.step_s, "step_s")?;
        if self.step_s <= 0.0 || self.duration_s < self.step_s {
            return Err("need step_s > 0 and duration_s >= step_s".into());
        }
        if self.duration_s / self.step_s > 100_000.0 {
            return Err("more than 100 000 epochs; raise step_s".into());
        }
        if !(0.0..90.0).contains(&self.mask_deg) {
            return Err("mask_deg must lie in [0, 90)".into());
        }
        if self.pdop_threshold.is_nan() || self.pdop_threshold <= 0.0 {
            return Err("pdop_threshold must be positive".into());
        }
        if !(self.grid_step_deg >= 0.25 && self.grid_step_deg <= 90.0) {
            return Err("grid_step_deg must lie in [0.25, 90]".into());
        }
        if !(-90.0..=90.0).contains(&self.lat_min_deg)
            || !(-90.0..=90.0).contains(&self.lat_max_deg)
            || self.lat_min_deg >= self.lat_max_deg
        {
            return Err("need -90 <= lat_min_deg < lat_max_deg <= 90".into());
        }
        if !(-360.0..=360.0).contains(&self.lon_min_deg)
            || !(-360.0..=360.0).contains(&self.lon_max_deg)
            || self.lon_min_deg >= self.lon_max_deg
            || self.lon_max_deg - self.lon_min_deg > 360.0
        {
            return Err("need lon_min_deg < lon_max_deg spanning at most 360 deg".into());
        }
        if self.constellation.is_empty() {
            return Err("give at least one [[constellation]]".into());
        }
        if self.track_points > 2_000 {
            return Err("track_points is capped at 2000".into());
        }
        Ok(())
    }

    /// Build every constellation of the scenario.
    pub fn build(&self) -> Result<(Body, Vec<BuiltConstellation>), String> {
        self.validate()?;
        let body = body_by_name(&self.body)?;
        let built = self
            .constellation
            .iter()
            .map(|c| c.build(&body))
            .collect::<Result<Vec<_>, _>>()?;
        let total: usize = built.iter().map(|b| b.elements.len()).sum();
        if total > 50_000 {
            return Err(format!("{total} satellites exceeds the 50 000 limit"));
        }
        Ok((body, built))
    }

    /// Run the scenario: `(json, summary, svg)`.
    pub fn run_all(&self) -> Result<(String, String, String), String> {
        let (body, built) = self.build()?;
        let spec = self.spec();
        let els: Vec<Vec<Elements>> = built.iter().map(|b| b.elements.clone()).collect();
        let cov = coverage(&body, &els, &spec, false)?;
        let total: usize = built.iter().map(|b| b.elements.len()).sum();

        // Downsampled tracks.
        let tp = self.track_points.max(2);
        let times: Vec<f64> = (0..tp)
            .map(|k| round3(self.duration_s * k as f64 / (tp - 1) as f64))
            .collect();
        let stride = if self.max_tracks == 0 {
            usize::MAX
        } else {
            total.div_ceil(self.max_tracks).max(1)
        };
        let mut tracks = Vec::new();
        let mut k = 0usize;
        for b in &built {
            for (id, &el) in b.ids.iter().zip(&b.elements) {
                if self.max_tracks > 0 && k % stride == 0 {
                    let (la, lo) = ground_track(el, &body, self.j2, &times);
                    tracks.push(json!({
                        "constellation": b.name, "id": id, "lat_deg": la, "lon_deg": lo,
                    }));
                }
                k += 1;
            }
        }

        let map_opt = |g: &Vec<Vec<Option<f64>>>| -> Value {
            json!(g
                .iter()
                .map(|r| r.iter().map(|v| v.map(round4)).collect::<Vec<_>>())
                .collect::<Vec<_>>())
        };
        let map_f = |g: &Vec<Vec<f64>>| -> Value {
            json!(g
                .iter()
                .map(|r| r.iter().map(|&v| round4(v)).collect::<Vec<_>>())
                .collect::<Vec<_>>())
        };
        let w = cov.work;
        let doc = json!({
            "kind": "constellation-design",
            "label": "MODELLED - two-body Keplerian orbits (optional secular J2) around a spherical \
                      body, geometric visibility above an elevation mask, all-in-view dilution of \
                      precision with one receiver clock per constellation unless clock = \"common\"; \
                      no signal power, health or terrain. The Walker geometry and the published \
                      presets are checked against the Galileo OS SDD, the GLONASS ICD and the GPS \
                      SPS Performance Standard slot tables, and the GPS baseline global DOP \
                      statistics against SPS PS Appendix B (see docs/VERIFICATION-MATRIX.md)",
            "units": crate::field_schema::units_block(UNITS),
            "body": {
                "name": body.name,
                "radius_km": body.re / 1000.0,
                "mu_km3_s2": body.mu / 1e9,
                "rotation_rate_deg_s": body.rotation_rate / DEG,
            },
            "inputs": {
                "duration_s": self.duration_s,
                "step_s": self.step_s,
                "epochs": w.epochs,
                "mask_deg": self.mask_deg,
                "pdop_threshold": self.pdop_threshold,
                "grid_step_deg": self.grid_step_deg,
                "lat_min_deg": self.lat_min_deg,
                "lat_max_deg": self.lat_max_deg,
                "lon_min_deg": self.lon_min_deg,
                "lon_max_deg": self.lon_max_deg,
                "clock": self.clock,
                "j2": self.j2,
            },
            "total_satellites": total,
            "constellations": built.iter().enumerate().map(|(i, b)| json!({
                "name": b.name,
                "source": b.source,
                "satellites": b.elements.len(),
                "mean_visible": round4(cov.mean_visible_by_constellation[i]),
                "shells": b.shells,
            })).collect::<Vec<_>>(),
            "global": {
                "availability_pct": round4(cov.global_availability_pct),
                "fix_pct": round4(cov.global_fix_pct),
                "worst_site_availability_pct": round4(cov.worst_site_availability_pct),
                "mean_visible": round4(cov.global_mean_visible),
                "min_visible": cov.global_min_visible,
                "pdop": cov.hist_pdop.json(),
                "hdop": cov.hist_hdop.json(),
                "vdop": cov.hist_vdop.json(),
                "gdop": cov.hist_gdop.json(),
            },
            "grid": {
                "lat_deg": cov.lats_deg,
                "lon_deg": cov.lons_deg,
                "mean_visible": map_f(&cov.mean_visible),
                "min_visible": cov.min_visible,
                "max_visible": cov.max_visible,
                "availability_pct": map_f(&cov.availability_pct),
                "fix_pct": map_f(&cov.fix_pct),
                "mean_pdop": map_opt(&cov.mean_pdop),
                "mean_hdop": map_opt(&cov.mean_hdop),
                "mean_vdop": map_opt(&cov.mean_vdop),
                "mean_gdop": map_opt(&cov.mean_gdop),
                "max_pdop": map_opt(&cov.max_pdop),
            },
            "tracks": {
                "times_s": times,
                "shown": tracks.len(),
                "total": total,
                "stride": if self.max_tracks == 0 { 0 } else { stride },
                "satellites": tracks,
            },
            "work": {
                "epochs": w.epochs,
                "grid_points": w.grid_points,
                "satellites": w.satellites,
                "pair_tests_brute_force": w.pair_tests_brute_force,
                "pair_tests_after_prefilter": w.pair_tests_after_prefilter,
                "visible_pairs": w.visible_pairs,
                "dop_solutions": w.dop_solutions,
                "prefilter_ratio": if w.pair_tests_brute_force > 0 {
                    round4(w.pair_tests_after_prefilter as f64 / w.pair_tests_brute_force as f64)
                } else { 0.0 },
            },
        });
        let names: Vec<&str> = built.iter().map(|b| b.name.as_str()).collect();
        let summary = format!(
            "constellation-design: {total} satellites ({}) around the {}; availability {:.2}% \
             (PDOP <= {} at {} deg mask), worst site {:.2}%, median PDOP {}, mean {:.1} in view; \
             {} grid points x {} epochs (MODELLED)",
            names.join(", "),
            body.name,
            cov.global_availability_pct,
            self.pdop_threshold,
            self.mask_deg,
            cov.worst_site_availability_pct,
            cov.hist_pdop
                .quantile(0.5)
                .map_or("n/a".to_string(), |v| format!("{v:.2}")),
            cov.global_mean_visible,
            w.grid_points,
            w.epochs,
        );
        let svg = to_svg(&cov, &body, &summary, self.pdop_threshold);
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        Ok((json, summary, svg))
    }
}

// ── Chart ────────────────────────────────────────────────────────────────────────

/// One map panel: caption, cell value in `[0, 1]` (`None` = no fix), the two colour ends
/// and the two key labels.
type Panel<'a> = (
    &'static str,
    Box<dyn Fn(usize, usize) -> Option<f64> + 'a>,
    [u8; 3],
    [u8; 3],
    String,
    String,
);

fn lerp_colour(a: [u8; 3], b: [u8; 3], t: f64) -> String {
    let t = t.clamp(0.0, 1.0);
    let c = |i: usize| (a[i] as f64 + (b[i] as f64 - a[i] as f64) * t).round() as u8;
    format!("#{:02x}{:02x}{:02x}", c(0), c(1), c(2))
}

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

/// Two stacked map panels (availability and mean PDOP) in an equirectangular projection,
/// with the Natural Earth land outline when the body is the Earth.
fn to_svg(cov: &CoverageResult, body: &Body, summary: &str, thr: f64) -> String {
    let (mw, mh) = (720.0, 300.0);
    let (x0, top) = (60.0, 84.0);
    let gap = 60.0;
    let (w, h) = (x0 + mw + 120.0, top + 2.0 * mh + gap + 40.0);
    // The one-line summary is too long for the frame; its first clause is the subtitle and
    // the rest goes on a second line.
    let (head, tail) = summary.split_once("; ").unwrap_or((summary, ""));
    let mut s = crate::chart::frame_open(
        w,
        h,
        &format!("Constellation coverage over the {}", body.name),
        &esc(head),
    );
    s.push_str(&format!(
        "<text x=\"24\" y=\"54\" font-size=\"11\" fill=\"#8a8172\">{}</text>",
        esc(tail)
    ));
    let (lat_lo, lat_hi) = (
        cov.lats_deg.first().copied().unwrap_or(-90.0),
        cov.lats_deg.last().copied().unwrap_or(90.0),
    );
    let (lon_lo, lon_hi) = (
        cov.lons_deg.first().copied().unwrap_or(-180.0),
        cov.lons_deg.last().copied().unwrap_or(180.0),
    );
    let dlat = if cov.lats_deg.len() > 1 {
        cov.lats_deg[1] - cov.lats_deg[0]
    } else {
        lat_hi - lat_lo + 1.0
    };
    let dlon = if cov.lons_deg.len() > 1 {
        cov.lons_deg[1] - cov.lons_deg[0]
    } else {
        lon_hi - lon_lo + 1.0
    };
    let (la0, la1) = (lat_lo - dlat / 2.0, lat_hi + dlat / 2.0);
    let (lo0, lo1) = (lon_lo - dlon / 2.0, lon_hi + dlon / 2.0);
    // The PDOP colour scale spans the cell means actually present (at least 0.5 wide and
    // never beyond the availability threshold), so a map that is good everywhere still shows
    // where it is better.
    let means: Vec<f64> = cov.mean_pdop.iter().flatten().flatten().copied().collect();
    let p_lo = means.iter().copied().fold(f64::INFINITY, f64::min);
    let p_lo = if p_lo.is_finite() { p_lo } else { 1.0 };
    let p_hi = means
        .iter()
        .copied()
        .fold(f64::NEG_INFINITY, f64::max)
        .min(thr.max(p_lo + 0.5))
        .max(p_lo + 0.5);
    let panels: [Panel; 2] = [
        (
            "availability (%)",
            Box::new(|a, o| Some(cov.availability_pct[a][o] / 100.0)),
            [0x2a, 0x1f, 0x14],
            [0xe8, 0xc3, 0x8a],
            "0%".into(),
            "100%".into(),
        ),
        (
            "mean PDOP",
            Box::new(move |a, o| cov.mean_pdop[a][o].map(|p| 1.0 - (p - p_lo) / (p_hi - p_lo))),
            [0x2a, 0x1f, 0x14],
            [0x9f, 0xd4, 0xc6],
            format!("{p_hi:.2}+"),
            format!("{p_lo:.2}"),
        ),
    ];
    for (pi, (caption, val, c_lo, c_hi, l_lo, l_hi)) in panels.iter().enumerate() {
        let py = top + pi as f64 * (mh + gap);
        let proj = |lon: f64, lat: f64| -> (f64, f64) {
            (
                x0 + (lon - lo0) / (lo1 - lo0) * mw,
                py + (la1 - lat) / (la1 - la0) * mh,
            )
        };
        s.push_str(&crate::chart::panel_axes(x0, py, mw, py + mh, caption));
        let cw = dlon / (lo1 - lo0) * mw;
        let ch = dlat / (la1 - la0) * mh;
        for (a, &la) in cov.lats_deg.iter().enumerate() {
            for (o, &lo) in cov.lons_deg.iter().enumerate() {
                let (x, y) = proj(lo - dlon / 2.0, la + dlat / 2.0);
                let fill = match val(a, o) {
                    Some(t) => lerp_colour(*c_lo, *c_hi, t),
                    None => "#15120d".to_string(),
                };
                s.push_str(&format!(
                    "<rect x=\"{x:.1}\" y=\"{y:.1}\" width=\"{:.2}\" height=\"{:.2}\" fill=\"{fill}\"/>",
                    cw + 0.3,
                    ch + 0.3
                ));
            }
        }
        if body.name == "Earth" {
            for ring in crate::worldmap::LAND {
                let mut d = String::new();
                let mut prev = f64::NAN;
                for &(rlon, rlat) in ring.iter() {
                    let (rlon, rlat) = (f64::from(rlon), f64::from(rlat));
                    if rlon < lo0 || rlon > lo1 || rlat < la0 || rlat > la1 {
                        prev = f64::NAN;
                        continue;
                    }
                    let (x, y) = proj(rlon, rlat);
                    let cmd = if !prev.is_finite() || (rlon - prev).abs() > 180.0 {
                        'M'
                    } else {
                        'L'
                    };
                    d.push_str(&format!("{cmd}{x:.1} {y:.1}"));
                    prev = rlon;
                }
                if !d.is_empty() {
                    s.push_str(&format!(
                        "<path d=\"{d}\" fill=\"none\" stroke=\"#0c0b08\" stroke-width=\"0.8\" opacity=\"0.8\"/>"
                    ));
                }
            }
        }
        // Colour key.
        let kx = x0 + mw + 30.0;
        for k in 0..20 {
            let t = 1.0 - k as f64 / 19.0;
            s.push_str(&format!(
                "<rect x=\"{kx:.0}\" y=\"{:.1}\" width=\"16\" height=\"{:.1}\" fill=\"{}\"/>",
                py + k as f64 * mh / 20.0,
                mh / 20.0 + 0.3,
                lerp_colour(*c_lo, *c_hi, t)
            ));
        }
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"11\">{}</text>\
             <text x=\"{:.0}\" y=\"{:.0}\" font-size=\"11\">{}</text>",
            kx + 22.0,
            py + 10.0,
            esc(l_hi),
            kx + 22.0,
            py + mh,
            esc(l_lo)
        ));
        // Latitude labels.
        for lat in [-60.0_f64, -30.0, 0.0, 30.0, 60.0] {
            if lat > la0 && lat < la1 {
                let (_, y) = proj(lo0, lat);
                s.push_str(&format!(
                    "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"10\" fill=\"#8c8273\">{lat:.0}</text>",
                    x0 - 6.0,
                    y + 3.0
                ));
            }
        }
    }
    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    fn earth() -> Body {
        Body::earth()
    }

    /// Walker identities: node spacing 360/P (delta) or 180/P (star), in-plane spacing
    /// 360·P/T and inter-plane phase offset 360·F/T hold exactly for every satellite.
    #[test]
    fn walker_geometry_identities_are_exact() {
        for (pattern, t, p, f) in [
            (WalkerPattern::Delta, 24, 3, 1),
            (WalkerPattern::Delta, 24, 6, 2),
            (WalkerPattern::Delta, 1584, 72, 39),
            (WalkerPattern::Star, 66, 6, 2),
            (WalkerPattern::Star, 48, 8, 0),
        ] {
            let w = WalkerSpec {
                pattern,
                total: t,
                planes: p,
                phasing: f,
                a_m: 7_000_000.0,
                e: 0.0,
                i_rad: 53.0 * DEG,
                raan0_rad: 0.0,
                argp_rad: 0.0,
                m0_rad: 0.0,
            };
            let els = w.elements().unwrap();
            assert_eq!(els.len(), t);
            let s = t / p;
            let spread = match pattern {
                WalkerPattern::Delta => 360.0,
                WalkerPattern::Star => 180.0,
            };
            let wrap = |x: f64| {
                let d = x.rem_euclid(360.0);
                d.min(360.0 - d)
            };
            for k in 0..p {
                for j in 0..s {
                    let el = els[k * s + j];
                    let raan = el.raan_rad / DEG;
                    let m = el.m0_rad / DEG;
                    assert!(wrap(raan - spread * k as f64 / p as f64) < 1e-9);
                    let expect_m = 360.0 * (j as f64 * p as f64 + k as f64 * f as f64) / t as f64;
                    assert!(wrap(m - expect_m) < 1e-9, "{t}/{p}/{f} k={k} j={j}");
                    if k + 1 < p {
                        let nxt = els[(k + 1) * s + j];
                        assert!(wrap(nxt.raan_rad / DEG - raan - spread / p as f64) < 1e-9);
                        assert!(
                            wrap(nxt.m0_rad / DEG - m - 360.0 * f as f64 / t as f64) < 1e-9,
                            "phase offset F*360/T"
                        );
                    }
                }
            }
            assert!((w.raan_spacing_rad() / DEG - spread / p as f64).abs() < 1e-12);
            assert!((w.phase_offset_rad() / DEG - 360.0 * f as f64 / t as f64).abs() < 1e-12);
        }
        let bad = WalkerSpec {
            pattern: WalkerPattern::Delta,
            total: 25,
            planes: 3,
            phasing: 1,
            a_m: 7e6,
            e: 0.0,
            i_rad: 0.0,
            raan0_rad: 0.0,
            argp_rad: 0.0,
            m0_rad: 0.0,
        };
        assert!(bad.elements().is_err());
        assert!(WalkerSpec {
            total: 24,
            phasing: 3,
            ..bad
        }
        .elements()
        .is_err());
    }

    /// Galileo OS SDD issue 1.1 Table 23 (24 slots at 2016-11-21 00:00 UTC), transcribed
    /// row by row: the Walker 24/3/1 generator must reproduce every RAAN and mean anomaly.
    #[test]
    fn walker_24_3_1_reproduces_galileo_os_sdd_table_23() {
        let table: [(char, u32, f64, f64); 24] = [
            ('A', 1, 317.632, 180.153),
            ('A', 2, 317.632, 225.153),
            ('A', 3, 317.632, 270.153),
            ('A', 4, 317.632, 315.153),
            ('A', 5, 317.632, 0.153),
            ('A', 6, 317.632, 45.153),
            ('A', 7, 317.632, 90.153),
            ('A', 8, 317.632, 135.153),
            ('B', 1, 77.632, 195.153),
            ('B', 2, 77.632, 240.153),
            ('B', 3, 77.632, 285.153),
            ('B', 4, 77.632, 330.153),
            ('B', 5, 77.632, 15.153),
            ('B', 6, 77.632, 60.153),
            ('B', 7, 77.632, 105.153),
            ('B', 8, 77.632, 150.153),
            ('C', 1, 197.632, 210.153),
            ('C', 2, 197.632, 255.153),
            ('C', 3, 197.632, 300.153),
            ('C', 4, 197.632, 345.153),
            ('C', 5, 197.632, 30.153),
            ('C', 6, 197.632, 75.153),
            ('C', 7, 197.632, 120.153),
            ('C', 8, 197.632, 165.153),
        ];
        let els = galileo_walker().elements().unwrap();
        for (k, &(plane, slot, raan, m)) in table.iter().enumerate() {
            let el = els[k];
            assert!(
                (el.raan_rad / DEG - raan).abs() < 1e-9,
                "{plane}{slot}: RAAN {} vs {raan}",
                el.raan_rad / DEG
            );
            assert!(
                (el.m0_rad / DEG - m).abs() < 1e-9,
                "{plane}{slot}: M {} vs {m}",
                el.m0_rad / DEG
            );
            assert_eq!(el.a_m, 29_599_801.0);
            assert_eq!(el.i_rad, 56.0 * DEG);
        }
    }

    /// The GLONASS ICD 5.2 slot formula and a Walker 24/3/1 at the same node and phase are
    /// the same set of 24 (node, argument of latitude) pairs.
    #[test]
    fn glonass_icd_slot_formula_is_a_walker_24_3_1() {
        let icd = glonass_slots(6_378_136.0);
        let w = WalkerSpec {
            pattern: WalkerPattern::Delta,
            total: 24,
            planes: 3,
            phasing: 1,
            a_m: 6_378_136.0 + 19_100_000.0,
            e: 0.0,
            i_rad: 64.8 * DEG,
            raan0_rad: (251.0 + 15.0 / 60.0) * DEG,
            argp_rad: 0.0,
            // Slot 8 of plane 1 has the smallest u in its plane after wrapping: the
            // pattern's first satellite is any member; take slot 1's u.
            m0_rad: icd[0].1.m0_rad,
        };
        let walker = w.elements().unwrap();
        let key = |el: &Elements| {
            (
                ((el.raan_rad / DEG) * 1e6).round() as i64,
                ((el.m0_rad / DEG).rem_euclid(360.0) * 1e6).round() as i64 % 360_000_000,
            )
        };
        let mut a: Vec<_> = icd.iter().map(|(_, el)| key(el)).collect();
        let mut b: Vec<_> = walker.iter().map(key).collect();
        a.sort_unstable();
        b.sort_unstable();
        assert_eq!(a, b, "ICD slot set differs from Walker 24/3/1");
        // Two ICD anchors by hand: slot 1 u = 145°26′37″ + 15°·24 = 145.4436° (mod 360);
        // slot 9 (plane 2) u = 145.4436° + 15°·(27 − 27 + 25) → +15° relative to slot 1.
        let u1 = icd[0].1.m0_rad / DEG;
        let u9 = icd[8].1.m0_rad / DEG;
        assert!((u1 - (145.0 + 26.0 / 60.0 + 37.0 / 3600.0)).abs() < 1e-9);
        assert!(((u9 - u1).rem_euclid(360.0) - 15.0).abs() < 1e-9);
        assert!((icd[8].1.raan_rad / DEG - (251.25 + 120.0 - 360.0)).abs() < 1e-9);
        // The ICD's draconian period is 11 h 15 min 44 s = 40 544 s; the two-body period at
        // 19 100 km altitude is within 0.2 % of it (the difference is the J2 effect).
        let t = TAU * ((6_378_136.0_f64 + 19_100_000.0).powi(3) / earth().mu).sqrt();
        assert!((t - 40_544.0).abs() / 40_544.0 < 2e-3, "period {t}");
    }

    /// SPS PS 2020 Table 3.2-1 lists, for each slot, the groundtrack equatorial crossing
    /// (the longitude of the northbound equator crossing, modulo 180 deg). Reproduce all 24
    /// and the 12 expanded locations of Table 3.2-2 from RAAN, argument of latitude and the
    /// Greenwich hour angle by propagating to the node (with the secular J2 rates) and
    /// rotating with the Earth.
    ///
    /// Bar, 0.015 deg: the rounding budget of three two-decimal table entries (0.005 on the
    /// RAAN, 0.0025 through the argument of latitude, 0.005 on the crossing). One row is held
    /// to a looser bound, stated here rather than hidden: E3F's crossing is inconsistent with
    /// the table's own RAAN and argument of latitude. Its argument of latitude is 14.60 deg
    /// ahead of E3's, which moves the crossing by 14.60 x (omega_E / n) = 7.30 deg, while the
    /// table moves it by 7.36 deg (the other five fore/aft pairs move by exactly half their
    /// argument-of-latitude step). The engine is checked on E3F to 0.06 deg.
    #[test]
    fn gps_presets_reproduce_the_published_equatorial_crossings() {
        let body = earth();
        let mut rows: Vec<(String, f64, f64, f64)> = GPS_BASELINE_SLOTS
            .iter()
            .map(|&(s, r, u, g)| (s.to_string(), r, u, g))
            .collect();
        for (_, pair) in GPS_EXPANDABLE_SLOTS {
            for (s, r, u, g) in pair {
                rows.push((s.to_string(), r, u, g));
            }
        }
        let mut worst = 0.0_f64;
        for (slot, r, u, gec) in rows {
            let el = gps_slot(r, u);
            let sat = Sat::new(el, &body, true, 0);
            let dt = (TAU - el.m0_rad) / (sat.n + sat.argp_dot);
            let p = sat.position_fixed(dt, body.rotation_rate);
            assert!(p[2].abs() < 1.0, "{slot}: not at the node ({} m)", p[2]);
            let lon = p[1].atan2(p[0]) / DEG;
            // A GPS satellite completes two orbits per sidereal day, so it crosses the
            // equator northbound at two longitudes 180 deg apart; the table states the
            // crossing modulo 180 deg (every published value lies in [0, 180)).
            let d = (lon - gec).rem_euclid(180.0);
            let d = d.min(180.0 - d);
            let bar = if slot == "E3F" { 0.06 } else { 0.015 };
            assert!(
                d < bar,
                "{slot}: crossing {lon:.3} vs published {gec} (|d| = {d:.4})"
            );
            if slot != "E3F" {
                worst = worst.max(d);
            }
        }
        eprintln!("GPS equatorial crossings: worst |computed - SPS PS| = {worst:.4} deg over 35 locations");
        // The secular nodal regression at the reference orbit against Table 3.2-3's
        // -0.0402 deg/day: within 5 % (the table does not state its J2 or Earth radius).
        let s = Sat::new(gps_slot(0.0, 0.0), &body, true, 0);
        let rate = s.raan_dot / DEG * 86_400.0;
        assert!(
            (rate + 0.0402).abs() / 0.0402 < 0.05,
            "nodal regression {rate} deg/day"
        );
    }

    #[test]
    fn gps_expandable_replaces_slots_with_pairs() {
        assert_eq!(gps_slots(&[]).unwrap().len(), 24);
        assert_eq!(gps_slots(&["B1".into(), "D2".into()]).unwrap().len(), 26);
        let all: Vec<String> = GPS_EXPANDABLE_SLOTS
            .iter()
            .map(|(s, _)| s.to_string())
            .collect();
        let v = gps_slots(&all).unwrap();
        assert_eq!(v.len(), 30);
        assert!(v.iter().any(|(id, _)| id == "F2A") && !v.iter().any(|(id, _)| id == "F2"));
        assert!(gps_slots(&["A1".into()]).is_err());
    }

    /// A hand-computed single-epoch DOP: one satellite at the zenith and three at elevation
    /// θ spaced 120° in azimuth. With s = sin θ, c = cos θ the normal matrix is block
    /// diagonal and gives HDOP² = 4/(3c²), VDOP² = 4/(3(1−s)²), TDOP² = (1+3s²)/(3(1−s)²).
    /// At θ = 30°: HDOP = 1.3333, VDOP = 2.3094, PDOP = 2.6667, TDOP = 1.5275, GDOP = 3.0732.
    #[test]
    fn single_epoch_dop_matches_the_hand_computation() {
        let (lat, lon) = (0.3_f64, 1.1_f64);
        let (e, n, u) = enu(lat, lon);
        let user = [6.4e6 * u[0], 6.4e6 * u[1], 6.4e6 * u[2]];
        let th = 30.0 * DEG;
        let mut sats = vec![(
            [
                user[0] + 2e7 * u[0],
                user[1] + 2e7 * u[1],
                user[2] + 2e7 * u[2],
            ],
            0,
        )];
        for k in 0..3 {
            let az = (40.0 + 120.0 * k as f64) * DEG;
            let d: Vec3 = std::array::from_fn(|i| {
                th.cos() * (az.sin() * e[i] + az.cos() * n[i]) + th.sin() * u[i]
            });
            sats.push((
                [
                    user[0] + 2e7 * d[0],
                    user[1] + 2e7 * d[1],
                    user[2] + 2e7 * d[2],
                ],
                0,
            ));
        }
        let d = dop_at(user, &sats).unwrap();
        let (s, c2) = (0.5_f64, 0.75_f64);
        let hdop = (4.0 / (3.0 * c2)).sqrt();
        let vdop = (4.0 / (3.0 * (1.0 - s).powi(2))).sqrt();
        let tdop = ((1.0 + 3.0 * s * s) / (3.0 * (1.0 - s).powi(2))).sqrt();
        let pdop = (hdop * hdop + vdop * vdop).sqrt();
        let gdop = (pdop * pdop + tdop * tdop).sqrt();
        for (got, want, name) in [
            (d.hdop, hdop, "HDOP"),
            (d.vdop, vdop, "VDOP"),
            (d.tdop, tdop, "TDOP"),
            (d.pdop, pdop, "PDOP"),
            (d.gdop, gdop, "GDOP"),
        ] {
            assert!((got - want).abs() < 1e-9, "{name}: {got} vs {want}");
        }
        assert!((pdop - 8.0 / 3.0).abs() < 1e-12);
        // With a common clock the result is exactly the engine's own orbit::dop.
        let pos: Vec<Vec3> = sats.iter().map(|s| s.0).collect();
        let o = crate::orbit::dop(user, &pos).unwrap();
        assert!((o.pdop - d.pdop).abs() < 1e-9 && (o.gdop - d.gdop).abs() < 1e-9);
        assert!((o.hdop - d.hdop).abs() < 1e-9 && (o.vdop - d.vdop).abs() < 1e-9);
    }

    /// A second clock costs one satellite: the same four-satellite geometry split over two
    /// systems has no fix, and adding a fifth restores one with a larger PDOP than the
    /// common-clock solution.
    #[test]
    fn a_clock_per_constellation_needs_one_more_satellite() {
        let (e, n, u) = enu(0.2, 0.4);
        let user = [6.4e6 * u[0], 6.4e6 * u[1], 6.4e6 * u[2]];
        let dir = |el: f64, az: f64| -> Vec3 {
            let (el, az) = (el * DEG, az * DEG);
            std::array::from_fn(|i| {
                user[i] + 2e7 * (el.cos() * (az.sin() * e[i] + az.cos() * n[i]) + el.sin() * u[i])
            })
        };
        let geo = [
            dir(80.0, 0.0),
            dir(20.0, 10.0),
            dir(25.0, 130.0),
            dir(15.0, 250.0),
            dir(40.0, 300.0),
        ];
        let common: Vec<_> = geo.iter().map(|&p| (p, 0)).collect();
        let split4: Vec<_> = geo[..4]
            .iter()
            .enumerate()
            .map(|(k, &p)| (p, k % 2))
            .collect();
        let split5: Vec<_> = geo.iter().enumerate().map(|(k, &p)| (p, k % 2)).collect();
        assert!(dop_at(user, &split4).is_none());
        let a = dop_at(user, &common).unwrap();
        let b = dop_at(user, &split5).unwrap();
        assert!(b.pdop > a.pdop, "{} vs {}", b.pdop, a.pdop);
    }

    fn quick_spec(step_deg: f64, dur: f64, step: f64, mask: f64) -> CoverageSpec {
        CoverageSpec {
            duration_s: dur,
            step_s: step,
            mask_deg: mask,
            pdop_threshold: 6.0,
            grid_step_deg: step_deg,
            lat_min_deg: -90.0,
            lat_max_deg: 90.0,
            lon_min_deg: -180.0,
            lon_max_deg: 180.0,
            clock: ClockModel::PerConstellation,
            j2: false,
        }
    }

    /// The latitude-band prefilter is exact: every map and every counter of visible pairs
    /// matches the brute-force scan that also applies the direct elevation test.
    #[test]
    fn prefilter_matches_brute_force_exactly() {
        let body = earth();
        let leo = WalkerSpec {
            pattern: WalkerPattern::Delta,
            total: 120,
            planes: 12,
            phasing: 5,
            a_m: body.re + 800_000.0,
            e: 0.01,
            i_rad: 70.0 * DEG,
            raan0_rad: 0.3,
            argp_rad: 0.5,
            m0_rad: 0.1,
        }
        .elements()
        .unwrap();
        let gps: Vec<Elements> = gps_slots(&[]).unwrap().into_iter().map(|x| x.1).collect();
        let spec = quick_spec(15.0, 3600.0, 600.0, 10.0);
        let fast = coverage(&body, &[leo.clone(), gps.clone()], &spec, false).unwrap();
        let slow = coverage(&body, &[leo, gps], &spec, true).unwrap();
        assert_eq!(fast.work.visible_pairs, slow.work.visible_pairs);
        assert_eq!(fast.min_visible, slow.min_visible);
        assert_eq!(fast.max_visible, slow.max_visible);
        assert_eq!(fast.work.dop_solutions, slow.work.dop_solutions);
        assert!(fast.work.pair_tests_after_prefilter < slow.work.pair_tests_after_prefilter);
        for (a, b) in fast
            .mean_pdop
            .iter()
            .flatten()
            .zip(slow.mean_pdop.iter().flatten())
        {
            match (a, b) {
                (Some(x), Some(y)) => assert!((x - y).abs() < 1e-12),
                (None, None) => {}
                _ => panic!("fix mismatch"),
            }
        }
    }

    /// GPS baseline 24 slots under the SPS PS Appendix B conditions (one sidereal day,
    /// 5-minute steps, 4×4° global grid, all in view, 5° mask). The SPS PS 2020 §B.3.2.2-3
    /// global HDOP distribution: median 0.94, 90 % 1.16, 95 % 1.25, 98 % 1.37, mean 0.96.
    /// Tolerance 0.03 on each, fixed before the first run. Table 3.8-1: PDOP ≤ 6 for ≥ 98 %
    /// globally and ≥ 88 % at the worst site. Table B.3-1 gives PDOP 50 % = 1.815 for a
    /// degraded 20-24-satellite mix; the full constellation must be no worse.
    #[test]
    fn gps_baseline_global_dop_matches_the_sps_performance_standard() {
        let body = earth();
        let gps: Vec<Elements> = gps_slots(&[]).unwrap().into_iter().map(|x| x.1).collect();
        let mut spec = quick_spec(4.0, 86_164.0, 300.0, 5.0);
        spec.clock = ClockModel::Common;
        let t0 = std::time::Instant::now();
        let r = coverage(&body, &[gps], &spec, false).unwrap();
        let dt = t0.elapsed();
        assert_eq!(
            r.work.epochs, 287,
            "287 five-minute steps in a sidereal day"
        );
        let q = |p| r.quantile("hdop", p).unwrap();
        let mean = r.mean("hdop").unwrap();
        eprintln!(
            "GPS 24-slot global HDOP: median {:.3} p90 {:.3} p95 {:.3} p98 {:.3} mean {:.3} max {:.3}; \
             PDOP median {:.3} p95 {:.3}; VDOP median {:.3} max {:.3}; availability {:.3}% worst site {:.3}% \
             ({} T-S points, {:.2?})",
            q(0.5), q(0.9), q(0.95), q(0.98), mean, r.max("hdop").unwrap(),
            r.quantile("pdop", 0.5).unwrap(), r.quantile("pdop", 0.95).unwrap(),
            r.quantile("vdop", 0.5).unwrap(), r.max("vdop").unwrap(),
            r.global_availability_pct, r.worst_site_availability_pct,
            r.work.grid_points * r.work.epochs, dt
        );
        for (got, want, what) in [
            (q(0.5), 0.94, "median"),
            (q(0.9), 1.16, "90%"),
            (q(0.95), 1.25, "95%"),
            (q(0.98), 1.37, "98%"),
            (mean, 0.96, "mean"),
        ] {
            assert!(
                (got - want).abs() <= 0.03,
                "HDOP {what}: {got:.3} vs SPS PS {want}"
            );
        }
        assert!(r.quantile("pdop", 0.5).unwrap() <= 1.815);
        assert!(r.global_availability_pct >= 98.0);
        assert!(r.worst_site_availability_pct >= 88.0);
    }

    /// Scale: 5 000 satellites in four shells on a 10° grid. Reports the wall-clock time
    /// and the share of pair tests the prefilter removed.
    #[test]
    fn five_thousand_satellites_on_a_coarse_grid() {
        let body = earth();
        let shell = |t, p, f, h: f64, i: f64, pat| {
            WalkerSpec {
                pattern: pat,
                total: t,
                planes: p,
                phasing: f,
                a_m: body.re + h * 1000.0,
                e: 0.0,
                i_rad: i * DEG,
                raan0_rad: 0.0,
                argp_rad: 0.0,
                m0_rad: 0.0,
            }
            .elements()
            .unwrap()
        };
        let cons = vec![
            shell(1600, 32, 1, 550.0, 53.0, WalkerPattern::Delta),
            shell(1600, 32, 7, 540.0, 53.2, WalkerPattern::Delta),
            shell(1000, 20, 3, 570.0, 70.0, WalkerPattern::Delta),
            shell(800, 16, 1, 560.0, 97.6, WalkerPattern::Star),
        ];
        let total: usize = cons.iter().map(Vec::len).sum();
        assert_eq!(total, 5000);
        let mut spec = quick_spec(10.0, 1800.0, 300.0, 25.0);
        spec.clock = ClockModel::Common;
        let t0 = std::time::Instant::now();
        let r = coverage(&body, &cons, &spec, false).unwrap();
        let dt = t0.elapsed();
        let ratio = r.work.pair_tests_after_prefilter as f64 / r.work.pair_tests_brute_force as f64;
        eprintln!(
            "5000-satellite shell: {} grid points x {} epochs in {:.2?}; prefilter kept {:.1}% of {} pair tests; \
             mean {:.1} in view, availability {:.2}%",
            r.work.grid_points, r.work.epochs, dt, 100.0 * ratio, r.work.pair_tests_brute_force,
            r.global_mean_visible, r.global_availability_pct
        );
        assert!(
            ratio < 0.6,
            "the prefilter must remove most pair tests ({ratio})"
        );
        assert!(r.global_mean_visible > 10.0);
        assert!(r.global_fix_pct > 99.0);
    }

    #[test]
    fn lunar_shell_runs_around_the_moon() {
        let src = r#"
kind = "constellation-design"
body = "moon"
duration_s = 7200
step_s = 1200
grid_step_deg = 30
mask_deg = 10
[[constellation]]
name = "relay"
[[constellation.shell]]
total = 12
planes = 3
phasing = 1
altitude_km = 3000
inclination_deg = 60
"#;
        let scn: ConstellationDesignScenario = toml::from_str(src).unwrap();
        let (json, summary, svg) = scn.run_all().unwrap();
        assert!(summary.contains("Moon"));
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["total_satellites"], 12);
        assert_eq!(v["body"]["name"], "Moon");
        assert_eq!(v["grid"]["lat_deg"].as_array().unwrap().len(), 6);
    }

    #[test]
    fn any_solar_system_body_uses_the_body_module_constants() {
        // A relay shell around Europa: the body block, the orbital period and the
        // spin rate come from crate::body (Europa: mu 3.2027121e12 m^3/s^2, mean
        // radius 1 560 800 m, synchronous W-dot 101.3747235 deg/day).
        let src = r#"
kind = "constellation-design"
body = "Europa"
duration_s = 7200
step_s = 1200
grid_step_deg = 30
mask_deg = 10
[[constellation]]
name = "relay"
[[constellation.shell]]
total = 6
planes = 3
phasing = 1
altitude_km = 1500
inclination_deg = 70
"#;
        let scn: ConstellationDesignScenario = toml::from_str(src).unwrap();
        let (json, summary, _svg) = scn.run_all().unwrap();
        assert!(summary.contains("Europa"));
        let v: Value = serde_json::from_str(&json).unwrap();
        let europa = Body::by_name("europa").unwrap();
        assert_eq!(v["body"]["name"], "Europa");
        assert_eq!(europa.mu, 3.202_712_10e12);
        assert_eq!(europa.re, 1_560_800.0);
        let rate = v["body"]["rotation_rate_deg_s"].as_f64().unwrap();
        assert!((rate - 101.374_723_5 / 86_400.0).abs() < 1e-12);
        let (body, built) = scn.build().unwrap();
        assert_eq!((body.mu, body.re), (europa.mu, europa.re));
        assert_eq!(body.rotation_rate, europa.rotation_rate);
        assert_eq!(built[0].elements.len(), 6);
        assert!(built[0]
            .elements
            .iter()
            .all(|e| (e.a_m - (europa.re + 1_500_000.0)).abs() < 1e-6));
        // Every body in the catalogue but the Sun resolves; the Sun and nonsense do not.
        for f in crate::body::SOLAR_SYSTEM {
            let r = body_by_name(f.name);
            assert_eq!(r.is_ok(), f.name != "Sun", "{}", f.name);
        }
        assert!(body_by_name("vulcan")
            .unwrap_err()
            .contains("unknown central body"));
    }

    #[test]
    fn presets_are_earth_only_and_errors_are_clear() {
        let bad = r#"
kind = "constellation-design"
body = "moon"
[[constellation]]
name = "GPS"
preset = "gps-baseline"
"#;
        let scn: ConstellationDesignScenario = toml::from_str(bad).unwrap();
        assert!(scn.run_all().unwrap_err().contains("Earth constellation"));
        let empty = r#"
kind = "constellation-design"
[[constellation]]
name = "none"
"#;
        let scn: ConstellationDesignScenario = toml::from_str(empty).unwrap();
        assert!(scn.run_all().unwrap_err().contains("no satellites"));
    }

    #[test]
    fn preset_counts() {
        let b = earth();
        let count = |p: &str| {
            ConstellationCfg {
                name: p.into(),
                preset: Some(p.into()),
                expanded: None,
                shell: vec![],
                satellite: vec![],
            }
            .build(&b)
            .unwrap()
            .elements
            .len()
        };
        assert_eq!(count("gps-baseline"), 24);
        assert_eq!(count("gps-expandable"), 30);
        assert_eq!(count("galileo"), 24);
        assert_eq!(count("beidou"), 30);
        assert_eq!(count("beidou-meo"), 24);
        assert_eq!(count("glonass"), 24);
    }

    /// The BeiDou GEOs stay over their published longitudes, and the IGSOs share one
    /// ground track crossing the equator at 118°E.
    #[test]
    fn beidou_geo_and_igso_geometry() {
        let body = earth();
        let sl = beidou_slots(true).unwrap();
        for (k, lon) in [80.0, 110.5, 140.0].iter().enumerate() {
            let s = Sat::new(sl[24 + k].1, &body, false, 0);
            for t in [0.0, 21_600.0, 43_200.0] {
                let p = s.position_fixed(t, body.rotation_rate);
                let l = p[1].atan2(p[0]) / DEG;
                assert!((l - lon).abs() < 0.05, "GEO {k} at {l} vs {lon}");
            }
        }
        for k in 0..3 {
            let s = Sat::new(sl[27 + k].1, &body, false, 0);
            let dt = ((TAU - s.el.m0_rad).rem_euclid(TAU)) / s.n;
            let p = s.position_fixed(dt, body.rotation_rate);
            let l = p[1].atan2(p[0]) / DEG;
            assert!((l - 118.0).abs() < 0.1, "IGSO {k} crosses at {l}");
        }
    }
}
