// SPDX-License-Identifier: AGPL-3.0-only
//! The `solar-system` scenario kind: the whole solar system at one epoch.
//!
//! For every body of [`crate::body::SOLAR_SYSTEM`] (the Sun, the eight planets, Pluto, the Moon,
//! Phobos, Deimos, the four Galilean moons and Titan) the report gives the heliocentric position
//! and velocity in the ICRF (International Celestial Reference Frame, equatorial J2000), the
//! physical constants (gravitational parameter, radii, `J2` where published, sidereal rotation
//! period, the IAU (International Astronomical Union) pole and the prime meridian at the epoch),
//! the light time and one-way and two-way range from an observer body, and an orbit track sampled
//! over one revolution — enough for a page to draw an interactive solar system from the numbers
//! alone. Any number of extra links (`from` → `to`) get the same light-time treatment. The epoch is
//! carried as a Julian date in TDB (Barycentric Dynamical Time).
//!
//! ## Where each number comes from
//!
//! * Positions and velocities: [`crate::ephem_provider::AnalyticSolarSystem`] — the JPL (Jet
//!   Propulsion Laboratory)
//!   Standish Keplerian elements for the planets, the Montenbruck & Gill lunar series for the
//!   Earth-Moon split, and JPL mean elements with the IAU rotation model for the seven moons.
//! * Light time: [`crate::radiometric::light_time_solution`], the fixed-point down-leg solve
//!   the deep-space ranging path already uses, with the transmitter taken at its retarded
//!   position; two-way range from [`crate::radiometric::two_way_range`]; the Sun's Shapiro
//!   delay from [`crate::radiometric::shapiro_delay`].
//! * Constants: [`crate::body::Body`] and [`crate::body::BodyFacts`], each value cited there.
//!
//! ## Labels, per body
//!
//! A planet position is **VALIDATED** where it was checked against JPL Horizons within twice
//! the Standish page's nominal error (`tests/solar_system_horizons_reference.rs`): Mercury to
//! Saturn, the Earth and the Earth-Moon barycentre from Table 1, all eight planets from
//! Tables 2a/2b. Uranus and Neptune from Table 1 (which exceed the page's figures against
//! DE441), Pluto, the Moon and the seven moons are **MODELLED**: measured against Horizons
//! with pinned bars, but no published bound exists to validate them against. Each row
//! carries its own label and method string.

use crate::body::{Body, BodyFacts, SOLAR_SYSTEM};
use crate::ephem::{
    icrf_to_ecliptic, satellite_state, standish_elements, standish_nominal_error, Planet,
    Satellite, StandishTable,
};
use crate::ephem_provider::{AnalyticSolarSystem, EphemerisProvider};
use crate::radiometric::{light_time_solution, shapiro_delay, two_way_range};
use crate::timescales::TwoPartJd;
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

/// Speed of light in vacuum (m/s).
const C_M_S: f64 = 299_792_458.0;
/// Default track sampling: points per orbit.
const DEFAULT_TRACK_POINTS: usize = 120;

/// One extra light-time link.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LinkCfg {
    /// Transmitting body.
    pub from: String,
    /// Receiving body; the link is received at the scenario epoch.
    pub to: String,
}

/// The `solar-system` scenario.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SolarSystemScenario {
    /// Scenario kind tag, ignored by the computation.
    #[serde(default)]
    pub kind: Option<String>,
    /// Epoch as an ISO 8601 UTC date and time, `YYYY-MM-DDTHH:MM:SS`. Default
    /// `2026-01-01T00:00:00`. Converted UTC → TT (leap seconds) → TDB.
    #[serde(default)]
    pub epoch: Option<String>,
    /// Epoch as a TDB Julian date; overrides `epoch` when given.
    #[serde(default)]
    pub epoch_jd_tdb: Option<f64>,
    /// Bodies to report, by name. Default: all eighteen.
    #[serde(default)]
    pub bodies: Option<Vec<String>>,
    /// The body light times and ranges are measured to. Default `Earth`.
    #[serde(default)]
    pub observer: Option<String>,
    /// Points per orbit track (8 to 2000). Default 120.
    #[serde(default)]
    pub track_points: Option<usize>,
    /// Standish table: `auto` (default: Table 1 inside 1800 AD to 2050 AD, else 2a/2b),
    /// `table1` or `table2`.
    #[serde(default)]
    pub table: Option<String>,
    /// Extra links, each received at the epoch.
    #[serde(default)]
    pub links: Option<Vec<LinkCfg>>,
}

/// The epoch the scenario runs at.
#[derive(Clone, Debug, Serialize)]
pub struct EpochOut {
    /// The epoch as given, or the TDB Julian date as text when only that was given.
    pub input: String,
    /// The epoch as a Julian date in Barycentric Dynamical Time (TDB), days.
    pub jd_tdb: f64,
}

/// The Standish page's nominal error for a planet row.
#[derive(Clone, Debug, Serialize)]
pub struct NominalError {
    /// Nominal error in heliocentric longitude (arcsec).
    pub longitude_arcsec: f64,
    /// Nominal error in heliocentric latitude (arcsec).
    pub latitude_arcsec: f64,
    /// Nominal error in heliocentric distance (m).
    pub distance_m: f64,
}

/// Light time and range from one body to the observer.
#[derive(Clone, Debug, Serialize)]
pub struct LinkOut {
    /// Transmitting body.
    pub from: String,
    /// Receiving body; the link is received at the scenario epoch.
    pub to: String,
    /// Geometric distance at the epoch (m).
    pub geometric_distance_m: f64,
    /// Newtonian one-way light time, transmitter at its retarded position (s).
    pub one_way_light_time_s: f64,
    /// `c` times the one-way light time (m).
    pub one_way_range_m: f64,
    /// Round-trip path length `c·(τ_up + τ_down)` received at the epoch (m).
    pub two_way_range_m: f64,
    /// Round-trip light time (s).
    pub two_way_light_time_s: f64,
    /// The Sun's one-way Shapiro delay on the path (s).
    pub shapiro_delay_s: f64,
    /// Angle at the receiver between the Sun and the transmitter (deg): small near a solar
    /// conjunction, where the plasma and the Shapiro delay are largest.
    pub sun_separation_deg: f64,
}

/// One body at the epoch.
#[derive(Clone, Debug, Serialize)]
pub struct BodyOut {
    /// Body name as listed in [`crate::body::SOLAR_SYSTEM`].
    pub name: String,
    /// NAIF (Navigation and Ancillary Information Facility) integer code of the body.
    pub naif_id: i32,
    /// Star, planet, dwarf planet or moon.
    pub class: crate::body::BodyClass,
    /// The body it orbits; `None` for the Sun.
    pub parent: Option<String>,
    /// VALIDATED or MODELLED (or `origin` for the Sun).
    pub label: String,
    /// Name of the ephemeris model that produced the position (Standish table, lunar series, mean
    /// elements, …).
    pub method: String,
    /// Gravitational parameter GM (m³/s²).
    pub gm_m3_s2: f64,
    /// Equatorial radius (m); the 1-bar level for the giant planets, largest semi-axis for Phobos
    /// and Deimos.
    pub radius_equatorial_m: f64,
    /// Volumetric mean radius (m).
    pub radius_mean_m: f64,
    /// Unnormalised second zonal harmonic `J2`, where one is carried (dimensionless).
    pub j2: Option<f64>,
    /// Reference radius the `J2` value is referenced to (m).
    pub j2_reference_radius_m: Option<f64>,
    /// Sidereal rotation period (h); negative for retrograde rotation.
    pub sidereal_rotation_period_h: f64,
    /// IAU pole right ascension at J2000, ICRF (deg; mean value, no rate or periodic terms).
    pub pole_ra_deg: f64,
    /// IAU pole declination at J2000, ICRF (deg; mean value).
    pub pole_dec_deg: f64,
    /// IAU prime-meridian angle `W` at the epoch (deg).
    pub prime_meridian_deg: f64,
    /// Heliocentric ICRF position (m).
    pub position_m: Vec3,
    /// Heliocentric ICRF velocity (m/s).
    pub velocity_m_s: Vec3,
    /// Distance from the Sun (au, 1 au = 149 597 870 700 m).
    pub heliocentric_distance_au: f64,
    /// Heliocentric longitude in the J2000 ecliptic (deg).
    pub ecliptic_longitude_deg: f64,
    /// Heliocentric latitude in the J2000 ecliptic (deg).
    pub ecliptic_latitude_deg: f64,
    /// Position relative to the parent body, ICRF (m).
    pub parent_relative_position_m: Vec3,
    /// Orbital period about the parent (days); `None` for the Sun.
    pub orbital_period_d: Option<f64>,
    /// The Standish page's nominal error for this planet and table; `None` where none is published.
    pub nominal_error: Option<NominalError>,
    /// Light time and range to the observer; `None` for the observer itself.
    pub observer_link: Option<LinkOut>,
    /// `heliocentric` or `parent-centred`.
    pub track_frame: String,
    /// One revolution, ICRF (m), in `track_frame`.
    pub track_m: Vec<Vec3>,
}

/// The `solar-system` report.
#[derive(Clone, Debug, Serialize)]
pub struct SolarSystemReport {
    /// Provenance label of the whole report (MIXED: each body carries its own label).
    pub label: String,
    /// The scenario epoch as given and as a TDB Julian date.
    pub epoch: EpochOut,
    /// Reference frame and units of the positions and velocities (heliocentric ICRF, m and m/s).
    pub frame: String,
    /// Standish table used for the planets (Table 1 or Tables 2a/2b).
    pub standish_table: String,
    /// Name of the body light times and ranges are measured to.
    pub observer: String,
    /// Number of bodies in `bodies`.
    pub n_bodies: usize,
    /// One row per reported body, in the requested order.
    pub bodies: Vec<BodyOut>,
    /// The extra links requested in the scenario, each received at the epoch.
    pub links: Vec<LinkOut>,
}

/// Parse an ISO 8601 UTC epoch `YYYY-MM-DDTHH:MM:SS[.s][Z]` to a TDB Julian date. UTC before
/// 1972 takes the 1972 leap-second offset (pre-1972 UTC is not modelled).
pub(crate) fn epoch_to_jd_tdb(epoch: &str) -> Result<f64, String> {
    let s = epoch.trim();
    let (date, time) = s
        .split_once('T')
        .ok_or_else(|| format!("epoch '{s}' must be YYYY-MM-DDTHH:MM:SS"))?;
    let d: Vec<&str> = date.split('-').collect();
    let time = time.strip_suffix('Z').unwrap_or(time);
    let t: Vec<&str> = time.split(':').collect();
    if d.len() != 3 || t.len() != 3 {
        return Err(format!("epoch '{s}' must be YYYY-MM-DDTHH:MM:SS"));
    }
    let bad = |what: &str, v: &str| format!("epoch '{s}': bad {what} '{v}'");
    let year: i32 = d[0].parse().map_err(|_| bad("year", d[0]))?;
    let month: u32 = d[1].parse().map_err(|_| bad("month", d[1]))?;
    let day: u32 = d[2].parse().map_err(|_| bad("day", d[2]))?;
    let hour: u32 = t[0].parse().map_err(|_| bad("hour", t[0]))?;
    let minute: u32 = t[1].parse().map_err(|_| bad("minute", t[1]))?;
    let second: f64 = t[2].parse().map_err(|_| bad("second", t[2]))?;
    if !(1..=12).contains(&month) || !(1..=31).contains(&day) || hour > 23 || minute > 59 {
        return Err(format!("epoch '{s}' is out of range"));
    }
    let jd_utc = crate::timescales::julian_date(year, month, day, hour, minute, second);
    Ok(crate::timescales::tt_to_tdb(crate::timescales::utc_to_tt(
        jd_utc,
    )))
}

/// Resolve the scenario epoch from an ISO string and an optional TDB Julian date.
pub(crate) fn resolve_epoch(epoch: Option<&str>, jd: Option<f64>) -> Result<EpochOut, String> {
    match (jd, epoch) {
        (Some(jd), _) => {
            if !jd.is_finite() {
                return Err("epoch_jd_tdb must be finite".to_string());
            }
            Ok(EpochOut {
                input: format!("JD {jd} TDB"),
                jd_tdb: jd,
            })
        }
        (None, e) => {
            let e = e.unwrap_or("2026-01-01T00:00:00");
            Ok(EpochOut {
                input: e.to_string(),
                jd_tdb: epoch_to_jd_tdb(e)?,
            })
        }
    }
}

/// Parse the `table` field.
pub(crate) fn parse_table(s: Option<&str>) -> Result<Option<StandishTable>, String> {
    match s.map(|v| v.trim().to_ascii_lowercase()) {
        None => Ok(None),
        Some(v) if v == "auto" => Ok(None),
        Some(v) if v == "table1" => Ok(Some(StandishTable::Table1)),
        Some(v) if v == "table2" => Ok(Some(StandishTable::Table2)),
        Some(v) => Err(format!("table must be auto, table1 or table2; got '{v}'")),
    }
}

/// The Standish planet behind a body name, if any.
fn planet_of(name: &str) -> Option<Planet> {
    Some(match name {
        "Mercury" => Planet::Mercury,
        "Venus" => Planet::Venus,
        "Earth" => Planet::EarthMoonBarycentre,
        "Mars" => Planet::Mars,
        "Jupiter" => Planet::Jupiter,
        "Saturn" => Planet::Saturn,
        "Uranus" => Planet::Uranus,
        "Neptune" => Planet::Neptune,
        "Pluto" => Planet::Pluto,
        _ => return None,
    })
}

fn satellite_of(name: &str) -> Option<Satellite> {
    Satellite::ALL.iter().copied().find(|s| s.name() == name)
}

/// The evidence label of a body's position under a table (see the module docs).
pub fn position_label(name: &str, table: StandishTable) -> &'static str {
    match (name, table) {
        ("Sun", _) => "origin",
        ("Mercury" | "Venus" | "Earth" | "Mars" | "Jupiter" | "Saturn", _) => "VALIDATED",
        ("Uranus" | "Neptune", StandishTable::Table2) => "VALIDATED",
        _ => "MODELLED",
    }
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Light time, range and Shapiro delay from `from` to `to`, received at `jd_tdb`, on the
/// analytic solar system in its heliocentric frame: [`link_on`] with the Sun as the centre.
pub fn link(
    eph: &AnalyticSolarSystem,
    from: &Body,
    to: &Body,
    jd_tdb: f64,
) -> Result<LinkOut, String> {
    link_on(eph, &Body::sun(), from, to, jd_tdb)
}

/// Light time, range and Shapiro delay from `from` to `to`, received at `jd_tdb` (TDB), on any
/// [`EphemerisProvider`], with every position taken relative to `center` (the Sun for the
/// analytic solar system; the solar-system barycentre for a planetary-ephemeris provider).
///
/// The one-way light time is [`light_time_solution`]: the receiver `to` at the reception epoch,
/// the transmitter `from` at its retarded position. The Sun's Shapiro delay is formed from the
/// transmitter and receiver positions relative to the Sun at their own epochs, so it does not
/// depend on the centre chosen.
pub fn link_on<E: EphemerisProvider>(
    eph: &E,
    center: &Body,
    from: &Body,
    to: &Body,
    jd_tdb: f64,
) -> Result<LinkOut, String> {
    let sun = Body::sun();
    let unavailable = || {
        format!(
            "no ephemeris for the {} to {} link at JD {jd_tdb} TDB",
            from.name, to.name
        )
    };
    let rx = eph
        .relative_position(to, center, jd_tdb)
        .ok_or_else(unavailable)?;
    let tx_now = eph
        .relative_position(from, center, jd_tdb)
        .ok_or_else(unavailable)?;
    let t_rx = TwoPartJd::from_f64(jd_tdb);
    let lt = light_time_solution(rx, t_rx, from, center, eph).ok_or_else(unavailable)?;
    let two_way = two_way_range(rx, from, center, t_rx, eph).ok_or_else(unavailable)?;
    let sun_rx = eph
        .relative_position(&sun, center, jd_tdb)
        .ok_or_else(unavailable)?;
    let sun_tx = eph
        .relative_position(&sun, center, lt.tx_epoch.to_f64())
        .ok_or_else(unavailable)?;
    let to_sun = sub(sun_rx, rx);
    let to_tx = sub(lt.tx_pos, rx);
    let cos_sep = (to_sun[0] * to_tx[0] + to_sun[1] * to_tx[1] + to_sun[2] * to_tx[2])
        / (norm(to_sun) * norm(to_tx)).max(f64::MIN_POSITIVE);
    Ok(LinkOut {
        from: from.name.to_string(),
        to: to.name.to_string(),
        geometric_distance_m: norm(sub(tx_now, rx)),
        one_way_light_time_s: lt.tau_s,
        one_way_range_m: lt.tau_s * C_M_S,
        two_way_range_m: two_way,
        two_way_light_time_s: two_way / C_M_S,
        shapiro_delay_s: shapiro_delay(
            sub(lt.tx_pos, sun_tx),
            sub(rx, sun_rx),
            crate::forces::MU_SUN,
        ),
        sun_separation_deg: cos_sep.clamp(-1.0, 1.0).acos().to_degrees(),
    })
}

impl SolarSystemScenario {
    /// Run and render: JSON (with a units block), a text summary and the SVG chart.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.compute()?;
        Ok((report_json(&r)?, summary(&r), to_svg(&r)))
    }

    /// Compute the report.
    pub fn compute(&self) -> Result<SolarSystemReport, String> {
        let epoch = resolve_epoch(self.epoch.as_deref(), self.epoch_jd_tdb)?;
        let jd = epoch.jd_tdb;
        let eph = AnalyticSolarSystem {
            table: parse_table(self.table.as_deref())?,
        };
        let table = eph.table_at(jd).ok_or_else(|| {
            format!("epoch JD {jd} TDB is outside 3000 BC to 3000 AD, the Standish tables' range")
        })?;
        let t = (jd - 2_451_545.0) / 36_525.0;
        let n_track = self.track_points.unwrap_or(DEFAULT_TRACK_POINTS);
        if !(8..=2000).contains(&n_track) {
            return Err(format!("track_points must be 8 to 2000; got {n_track}"));
        }
        let observer_name = self.observer.as_deref().unwrap_or("Earth");
        let observer = Body::by_name(observer_name)
            .ok_or_else(|| format!("unknown observer body '{observer_name}'"))?;

        let selected: Vec<&'static BodyFacts> = match &self.bodies {
            None => SOLAR_SYSTEM.iter().collect(),
            Some(names) => {
                if names.is_empty() {
                    return Err("bodies must name at least one body".to_string());
                }
                let mut v = Vec::new();
                for n in names {
                    let b = Body::by_name(n).ok_or_else(|| format!("unknown body '{n}'"))?;
                    let fct = b.facts().expect("every Body::by_name body has a record");
                    if !v.iter().any(|x: &&BodyFacts| x.name == fct.name) {
                        v.push(fct);
                    }
                }
                v
            }
        };

        let mut bodies = Vec::with_capacity(selected.len());
        for fct in selected {
            let body = fct.body();
            let name = fct.name;
            let (pos, vel) = eph.heliocentric_state(name, jd).ok_or_else(|| {
                format!("no position for {name} at JD {jd} TDB (Pluto is 1800 AD to 2050 AD only)")
            })?;
            let parent_pos = match fct.parent {
                Some(p) => eph
                    .heliocentric_state(p, jd)
                    .map(|s| s.0)
                    .unwrap_or([0.0; 3]),
                None => [0.0; 3],
            };
            let ecl = icrf_to_ecliptic(pos);
            let r = norm(pos);
            let (lon, lat) = if r > 0.0 {
                (
                    ecl[1].atan2(ecl[0]).to_degrees().rem_euclid(360.0),
                    (ecl[2] / r).asin().to_degrees(),
                )
            } else {
                (0.0, 0.0)
            };
            let planet_table = if name == "Pluto" {
                StandishTable::Table1
            } else {
                table
            };
            let (track_frame, track_m, period_d) = match (planet_of(name), satellite_of(name)) {
                (Some(p), _) => {
                    let el = standish_elements(p, t, planet_table)
                        .ok_or_else(|| format!("no Standish elements for {name}"))?;
                    let track = el
                        .track(n_track)
                        .into_iter()
                        .map(crate::ephem::ecliptic_to_icrf)
                        .collect();
                    ("heliocentric", track, Some(el.period_s() / 86_400.0))
                }
                (None, Some(sat)) => {
                    let p = sat.period_s();
                    let track = (0..n_track)
                        .map(|k| {
                            satellite_state(sat, jd + p / 86_400.0 * (k as f64) / (n_track as f64))
                                .pos_m
                        })
                        .collect();
                    ("parent-centred", track, Some(p / 86_400.0))
                }
                _ if name == "Moon" => {
                    let p_d = 27.321_661;
                    let track = (0..n_track)
                        .map(|k| crate::ephem::moon_icrf(jd + p_d * (k as f64) / (n_track as f64)))
                        .collect();
                    ("parent-centred", track, Some(p_d))
                }
                _ => ("heliocentric", vec![[0.0; 3]], None),
            };
            let nominal = planet_of(name)
                .and_then(|p| standish_nominal_error(p, planet_table))
                .map(|e| NominalError {
                    longitude_arcsec: e[0],
                    latitude_arcsec: e[1],
                    distance_m: e[2],
                });
            let observer_link = if name == observer.name {
                None
            } else {
                Some(link(&eph, &body, &observer, jd)?)
            };
            bodies.push(BodyOut {
                name: name.to_string(),
                naif_id: fct.naif_id,
                class: fct.class,
                parent: fct.parent.map(str::to_string),
                label: position_label(name, planet_table).to_string(),
                method: eph.method(name, jd),
                gm_m3_s2: body.mu,
                radius_equatorial_m: fct.radius_equatorial_m,
                radius_mean_m: fct.radius_mean_m,
                j2: fct.j2.map(|j| j.0),
                j2_reference_radius_m: fct.j2.map(|j| j.1),
                sidereal_rotation_period_h: 2.0 * std::f64::consts::PI / body.prime_w_dot * 24.0,
                pole_ra_deg: body.pole_ra0.to_degrees(),
                pole_dec_deg: body.pole_dec0.to_degrees(),
                prime_meridian_deg: body.prime_meridian(jd).to_degrees(),
                position_m: pos,
                velocity_m_s: vel,
                heliocentric_distance_au: r / crate::ephem::AU_M,
                ecliptic_longitude_deg: lon,
                ecliptic_latitude_deg: lat,
                parent_relative_position_m: sub(pos, parent_pos),
                orbital_period_d: period_d,
                nominal_error: nominal,
                observer_link,
                track_frame: track_frame.to_string(),
                track_m,
            });
        }

        let mut links = Vec::new();
        for l in self.links.as_deref().unwrap_or(&[]) {
            let from =
                Body::by_name(&l.from).ok_or_else(|| format!("unknown link body '{}'", l.from))?;
            let to = Body::by_name(&l.to).ok_or_else(|| format!("unknown link body '{}'", l.to))?;
            if from.name == to.name {
                return Err(format!(
                    "a link needs two different bodies; got {}",
                    from.name
                ));
            }
            links.push(link(&eph, &from, &to, jd)?);
        }

        Ok(SolarSystemReport {
            label: "MIXED: each body carries its own label. Planet positions are VALIDATED \
                    against JPL Horizons within twice the Standish nominal error (Mercury to \
                    Saturn and the Earth from Table 1; all eight planets from Tables 2a/2b); \
                    Uranus and Neptune from Table 1, Pluto, the Moon and the seven moons are \
                    MODELLED. Light times are Newtonian, from the same positions."
                .to_string(),
            epoch,
            frame: "ICRF (equatorial J2000), heliocentric; metres, metres per second".to_string(),
            standish_table: table.label().to_string(),
            observer: observer.name.to_string(),
            n_bodies: bodies.len(),
            bodies,
            links,
        })
    }
}

/// Units and provenance for every numeric leaf. See [`crate::field_schema`].
const UNITS: &[(&str, &str, &str, &str)] = &[
    ("epoch.jd_tdb", "day", "input", "scenario epoch as a Julian date in Barycentric Dynamical Time (TDB)"),
    ("n_bodies", "count", "computed", "bodies in the report"),
    ("bodies[].naif_id", "1", "published", "NAIF (Navigation and Ancillary Information Facility) integer code of the body"),
    ("bodies[].gm_m3_s2", "m^3/s^2", "published", "gravitational parameter GM: JPL Horizons body records for the planets, the JPL satellite physical-parameter table for the moons"),
    ("bodies[].radius_equatorial_m", "m", "published", "equatorial radius (1-bar level for the giant planets; largest semi-axis for Phobos and Deimos), JPL physical-parameter tables"),
    ("bodies[].radius_mean_m", "m", "published", "volumetric mean radius, JPL physical-parameter tables"),
    ("bodies[].j2", "1", "published", "unnormalised second zonal harmonic where one is carried, cited in body.rs"),
    ("bodies[].j2_reference_radius_m", "m", "published", "the radius the J2 value is referenced to"),
    ("bodies[].sidereal_rotation_period_h", "h", "derived", "360 degrees over the IAU prime-meridian rate; negative for retrograde rotation"),
    ("bodies[].pole_ra_deg", "deg", "published", "IAU pole right ascension at J2000 (WGCCRE mean value, without T-rate or periodic terms)"),
    ("bodies[].pole_dec_deg", "deg", "published", "IAU pole declination at J2000 (WGCCRE mean value)"),
    ("bodies[].prime_meridian_deg", "deg", "computed", "IAU prime-meridian angle W at the epoch, W0 plus the rate times days from J2000"),
    ("bodies[].position_m[]", "m", "computed", "heliocentric position in the ICRF, x y z"),
    ("bodies[].velocity_m_s[]", "m/s", "computed", "heliocentric velocity in the ICRF, x y z (two-body derivative for the planets)"),
    ("bodies[].heliocentric_distance_au", "au", "computed", "distance from the Sun in astronomical units (1 au = 149 597 870 700 m)"),
    ("bodies[].ecliptic_longitude_deg", "deg", "computed", "heliocentric longitude in the J2000 ecliptic"),
    ("bodies[].ecliptic_latitude_deg", "deg", "computed", "heliocentric latitude in the J2000 ecliptic"),
    ("bodies[].parent_relative_position_m[]", "m", "computed", "position relative to the parent body in the ICRF, x y z"),
    ("bodies[].orbital_period_d", "day", "computed", "orbital period about the parent: the Standish anomalistic period for planets, the IAU synchronous period for the moons"),
    ("bodies[].nominal_error.longitude_arcsec", "arcsec", "published", "the Standish page's nominal error in heliocentric longitude for this planet and table"),
    ("bodies[].nominal_error.latitude_arcsec", "arcsec", "published", "the Standish page's nominal error in heliocentric latitude"),
    ("bodies[].nominal_error.distance_m", "m", "published", "the Standish page's nominal error in heliocentric distance"),
    ("bodies[].observer_link.geometric_distance_m", "m", "computed", "straight-line distance to the observer at the epoch"),
    ("bodies[].observer_link.one_way_light_time_s", "s", "computed", "Newtonian down-leg light time to the observer, body at its retarded position"),
    ("bodies[].observer_link.one_way_range_m", "m", "computed", "speed of light times the one-way light time"),
    ("bodies[].observer_link.two_way_range_m", "m", "computed", "round-trip path length, observer to body and back, received at the epoch"),
    ("bodies[].observer_link.two_way_light_time_s", "s", "computed", "round-trip light time"),
    ("bodies[].observer_link.shapiro_delay_s", "s", "closed-form", "the Sun's one-way Shapiro (gravitational) delay on the path, Moyer form with gamma = 1"),
    ("bodies[].observer_link.sun_separation_deg", "deg", "computed", "angle at the observer between the Sun and the body"),
    ("bodies[].track_m[][]", "m", "computed", "one revolution sampled evenly (planets in mean anomaly on the epoch's Standish ellipse, moons in time), ICRF, in track_frame"),
    ("links[].geometric_distance_m", "m", "computed", "straight-line distance between the two bodies at the epoch"),
    ("links[].one_way_light_time_s", "s", "computed", "Newtonian light time from the transmitter (retarded) to the receiver at the epoch"),
    ("links[].one_way_range_m", "m", "computed", "speed of light times the one-way light time"),
    ("links[].two_way_range_m", "m", "computed", "round-trip path length received at the epoch"),
    ("links[].two_way_light_time_s", "s", "computed", "round-trip light time"),
    ("links[].shapiro_delay_s", "s", "closed-form", "the Sun's one-way Shapiro delay on the path"),
    ("links[].sun_separation_deg", "deg", "computed", "angle at the receiver between the Sun and the transmitter"),
];

/// Render a `(path, unit, provenance, definition)` table as a `units` block through the shared
/// [`crate::field_schema::units_block`]. Every provenance string is from the closed vocabulary
/// (the unit test `every_emitted_number_has_a_unit` audits the rendered block).
pub(crate) fn units_block_from(
    rows: &[(&'static str, &'static str, &'static str, &'static str)],
) -> serde_json::Value {
    let fields: Vec<crate::field_schema::FieldUnit> = rows
        .iter()
        .map(|(path, unit, prov, def)| crate::field_schema::FieldUnit {
            path,
            unit,
            provenance: crate::field_schema::ProvenanceClass::parse(prov)
                .expect("every provenance in the units tables is from the closed vocabulary"),
            definition: def,
        })
        .collect();
    crate::field_schema::units_block(&fields)
}

fn units_block() -> serde_json::Value {
    units_block_from(UNITS)
}

fn report_json(r: &SolarSystemReport) -> Result<String, String> {
    let mut doc = serde_json::to_value(r).map_err(|e| format!("serialising report: {e}"))?;
    match doc.as_object_mut() {
        Some(o) => {
            o.insert("units".into(), units_block());
        }
        None => return Err("the report must serialise to a JSON object".to_string()),
    }
    serde_json::to_string_pretty(&doc).map_err(|e| format!("serialising report: {e}"))
}

/// The text summary.
pub fn summary(r: &SolarSystemReport) -> String {
    let mut s = format!(
        "Solar system at {} (JD {:.5} TDB), {} bodies, observer {}\n  {}\n",
        r.epoch.input, r.epoch.jd_tdb, r.n_bodies, r.observer, r.standish_table
    );
    for b in &r.bodies {
        let lt = b
            .observer_link
            .as_ref()
            .map(|l| format!("light time {:>9.1} s", l.one_way_light_time_s))
            .unwrap_or_else(|| "observer".to_string());
        s.push_str(&format!(
            "  {:<9} {:>8.4} au  lon {:>7.2} deg  {lt}  [{}]\n",
            b.name, b.heliocentric_distance_au, b.ecliptic_longitude_deg, b.label
        ));
    }
    for l in &r.links {
        s.push_str(&format!(
            "  link {} -> {}: one-way {:.3} s, two-way {:.3} s, Shapiro {:.1} us, Sun {:.1} deg\n",
            l.from,
            l.to,
            l.one_way_light_time_s,
            l.two_way_light_time_s,
            l.shapiro_delay_s * 1e6,
            l.sun_separation_deg
        ));
    }
    s
}

/// A two-panel top-down chart in the J2000 ecliptic plane: the inner system out to Mars and
/// the whole system out to Pluto, each with its orbit tracks and body positions.
pub fn to_svg(r: &SolarSystemReport) -> String {
    let (w, h) = (960.0, 520.0);
    let mut s = crate::chart::frame_open(
        w,
        h,
        "Solar system — J2000 ecliptic, top-down",
        &format!(
            "epoch {} · {} · positions from the Standish elements",
            r.epoch.input, r.standish_table
        ),
    );
    let panels = [
        (40.0, "Inner system (to Mars)", 1.75),
        (500.0, "Whole system (to Pluto)", 50.0),
    ];
    for (x0, caption, extent_au) in panels {
        let (pw, top) = (420.0, 70.0);
        let cx = x0 + pw / 2.0;
        let cy = top + pw / 2.0;
        let k = (pw / 2.0) / (extent_au * crate::ephem::AU_M);
        s.push_str(&crate::chart::panel_axes(x0, top, pw, top + pw, caption));
        s.push_str(&format!(
            "<circle cx=\"{cx:.1}\" cy=\"{cy:.1}\" r=\"4\" fill=\"#e0b050\"/>"
        ));
        for b in &r.bodies {
            if b.class == crate::body::BodyClass::Moon || b.name == "Sun" {
                continue;
            }
            let a = b.heliocentric_distance_au;
            if a > extent_au * 1.05 {
                continue;
            }
            let pts: Vec<String> = b
                .track_m
                .iter()
                .map(|p| {
                    let e = icrf_to_ecliptic(*p);
                    format!("{:.1},{:.1}", cx + e[0] * k, cy - e[1] * k)
                })
                .collect();
            s.push_str(&format!(
                "<polygon points=\"{}\" fill=\"none\" stroke=\"#4a3f30\" stroke-width=\"1\"/>",
                pts.join(" ")
            ));
            let e = icrf_to_ecliptic(b.position_m);
            let (px, py) = (cx + e[0] * k, cy - e[1] * k);
            let colour = if b.label == "VALIDATED" {
                "#7fc97f"
            } else {
                "#c79e63"
            };
            s.push_str(&format!(
                "<circle cx=\"{px:.1}\" cy=\"{py:.1}\" r=\"3.5\" fill=\"{colour}\"/>"
            ));
            // Label only what the panel resolves: the inner planets crowd the Sun at the
            // whole-system scale.
            if a > extent_au / 25.0 {
                s.push_str(&format!(
                    "<text x=\"{:.1}\" y=\"{:.1}\" font-size=\"10\">{}</text>",
                    px + 5.0,
                    py - 4.0,
                    b.name
                ));
            }
        }
    }
    s.push_str(
        "<text x=\"40\" y=\"510\" font-size=\"10\" fill=\"#8a8172\">green: VALIDATED against \
         JPL Horizons · amber: MODELLED · moons are listed in result.json with parent-centred \
         tracks</text></svg>",
    );
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    fn run(src: &str) -> SolarSystemReport {
        let scn: SolarSystemScenario = toml::from_str(src).expect("toml");
        scn.compute().expect("compute")
    }

    #[test]
    fn defaults_report_all_eighteen_bodies_with_tracks() {
        let r = run("kind = \"solar-system\"\n");
        assert_eq!(r.n_bodies, 18);
        assert_eq!(r.observer, "Earth");
        for b in &r.bodies {
            if b.name != "Sun" {
                assert_eq!(b.track_m.len(), DEFAULT_TRACK_POINTS, "{}", b.name);
                assert!(b.orbital_period_d.unwrap() > 0.0, "{}", b.name);
            }
            assert_eq!(b.observer_link.is_none(), b.name == "Earth", "{}", b.name);
        }
    }

    #[test]
    fn earth_heliocentric_distance_is_one_au_and_period_one_year() {
        let r = run("kind = \"solar-system\"\nbodies = [\"Earth\", \"Neptune\"]\n");
        let e = &r.bodies[0];
        assert!(
            (0.98..1.02).contains(&e.heliocentric_distance_au),
            "{}",
            e.heliocentric_distance_au
        );
        // The Standish Earth-Moon barycentre period is the anomalistic year, 365.26 days.
        assert!((e.orbital_period_d.unwrap() - 365.26).abs() < 0.05);
        let n = &r.bodies[1];
        assert!((29.0..31.0).contains(&n.heliocentric_distance_au));
        assert_eq!(n.label, "MODELLED", "Neptune from Table 1 is MODELLED");
    }

    #[test]
    fn a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position() {
        let r = run("kind = \"solar-system\"\nbodies = [\"Mars\"]\n");
        let m = &r.bodies[0];
        let d0 = norm(sub(m.track_m[0], m.position_m));
        assert!(d0 < 1.0, "track starts {d0} m from the epoch position");
        let rmin = m.track_m.iter().map(|p| norm(*p)).fold(f64::MAX, f64::min);
        let rmax = m.track_m.iter().map(|p| norm(*p)).fold(0.0, f64::max);
        // Mars perihelion 1.381 au, aphelion 1.666 au.
        assert!((rmin / crate::ephem::AU_M - 1.381).abs() < 0.005);
        assert!((rmax / crate::ephem::AU_M - 1.666).abs() < 0.005);
    }

    #[test]
    fn light_time_is_distance_over_c_to_first_order_and_two_way_is_twice_it() {
        let r = run(
            "kind = \"solar-system\"\nbodies = [\"Mars\"]\n[[links]]\nfrom = \"Jupiter\"\nto = \"Mars\"\n",
        );
        let l = r.bodies[0].observer_link.as_ref().unwrap();
        // The retarded solve moves the transmitter by v·τ; the difference from d/c is below
        // (relative Earth-Mars speed)/c times the light time.
        let d_over_c = l.geometric_distance_m / C_M_S;
        assert!((l.one_way_light_time_s - d_over_c).abs() < 1e-4 * d_over_c + 0.1);
        assert!((l.two_way_light_time_s / l.one_way_light_time_s - 2.0).abs() < 1e-3);
        assert!(l.shapiro_delay_s > 0.0 && l.shapiro_delay_s < 3e-4);
        assert_eq!(r.links.len(), 1);
        assert_eq!(r.links[0].from, "Jupiter");
    }

    #[test]
    fn moons_orbit_their_planets_at_their_mean_distance() {
        let r = run("kind = \"solar-system\"\nbodies = [\"Io\", \"Moon\", \"Titan\"]\n");
        for (b, a) in r.bodies.iter().zip([421_800e3, 384_400e3, 1_221_900e3]) {
            let d = norm(b.parent_relative_position_m);
            assert!((d / a - 1.0).abs() < 0.08, "{} at {d} m, mean {a}", b.name);
            assert_eq!(b.track_frame, "parent-centred");
            assert_eq!(b.label, "MODELLED");
        }
    }

    #[test]
    fn pluto_outside_its_table_is_an_error_not_a_guess() {
        let scn: SolarSystemScenario = toml::from_str(
            "kind = \"solar-system\"\nepoch = \"2200-01-01T00:00:00\"\nbodies = [\"Pluto\"]\n",
        )
        .unwrap();
        assert!(scn.compute().unwrap_err().contains("Pluto"));
    }

    #[test]
    fn table2_marks_uranus_validated_and_bad_inputs_are_rejected() {
        let r = run("kind = \"solar-system\"\ntable = \"table2\"\nbodies = [\"Uranus\"]\n");
        assert_eq!(r.bodies[0].label, "VALIDATED");
        for bad in [
            "kind = \"solar-system\"\ntable = \"vsop\"\n",
            "kind = \"solar-system\"\nobserver = \"Vulcan\"\n",
            "kind = \"solar-system\"\ntrack_points = 3\n",
            "kind = \"solar-system\"\nepoch = \"2026-13-01T00:00:00\"\n",
            "kind = \"solar-system\"\nepoch_jd_tdb = 99000.0\n",
        ] {
            let scn: SolarSystemScenario = toml::from_str(bad).unwrap();
            assert!(scn.compute().is_err(), "{bad}");
        }
    }

    #[test]
    fn the_epoch_parser_matches_j2000() {
        // 2000-01-01T11:58:55.816 UTC is J2000.0 TT; TDB differs by < 2 ms.
        let jd = epoch_to_jd_tdb("2000-01-01T11:58:55.816").unwrap();
        assert!((jd - 2_451_545.0).abs() * 86_400.0 < 0.01, "{jd}");
    }

    #[test]
    fn every_emitted_number_has_a_unit() {
        let (json, _, svg) = SolarSystemScenario::default().run_output().unwrap();
        let doc: serde_json::Value = serde_json::from_str(&json).unwrap();
        let audit = crate::field_schema::audit_document(&doc);
        assert!(
            audit.is_complete(),
            "missing {:?} malformed {:?}",
            audit.missing,
            audit.malformed
        );
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
    }
}
