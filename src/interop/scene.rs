// SPDX-License-Identifier: AGPL-3.0-only
//! The one geometric description every geospatial writer reads.
//!
//! [`scene_of`] turns a scenario into a [`Scene`]. It propagates with the same
//! propagators, the same time grid and the same epoch the kind's own run uses, so an
//! exported satellite is where the engine put it. For a kind with nothing to place on the
//! Earth it returns [`ExportError::NotApplicable`] with the reason, taken from
//! [`reason_for_kind`].

use super::{round_dp, ExportError, UtcEpoch};
use crate::api::ScenarioKind;
use crate::frames::{ecef_to_geodetic, geodetic_to_ecef, teme_to_ecef, Geodetic, Vec3};
use crate::orbit::Propagator;

/// What a moving object is.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MoverRole {
    /// A navigation or relay satellite.
    Satellite,
    /// The user (receiver) platform, when it moves.
    User,
}

impl MoverRole {
    /// Lower-case label written into the exported properties.
    pub fn as_str(self) -> &'static str {
        match self {
            MoverRole::Satellite => "satellite",
            MoverRole::User => "user",
        }
    }
}

/// An object sampled on the scene's time grid, in two frames.
#[derive(Clone, Debug, PartialEq)]
pub struct Mover {
    /// Identifier, unique within the scene (`G01`, `user`, ...).
    pub id: String,
    /// What the object is.
    pub role: MoverRole,
    /// One-line description written into each format.
    pub description: String,
    /// Position in the Geocentric Celestial Reference System (m), one per scene time.
    pub gcrs_r_m: Vec<Vec3>,
    /// Velocity in the Geocentric Celestial Reference System (m/s), one per scene time.
    pub gcrs_v_m_s: Vec<Vec3>,
    /// Earth-fixed position (m), one per scene time.
    pub ecef_r_m: Vec<Vec3>,
}

impl Mover {
    /// WGS 84 geodetic latitude (deg), longitude (deg) and ellipsoidal height (m) of
    /// sample `i`, from the Earth-fixed position.
    pub fn geodetic(&self, i: usize) -> (f64, f64, f64) {
        let g = ecef_to_geodetic(self.ecef_r_m[i]);
        (g.lat_rad.to_degrees(), g.lon_rad.to_degrees(), g.alt_m)
    }
}

/// What a fixed point is.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SiteRole {
    /// A GNSS (Global Navigation Satellite System) receiver.
    Receiver,
    /// A ground station.
    Station,
    /// An RF (radio-frequency) jammer.
    Jammer,
    /// The origin of a local navigation frame.
    Origin,
}

impl SiteRole {
    /// Lower-case label written into the exported properties.
    pub fn as_str(self) -> &'static str {
        match self {
            SiteRole::Receiver => "receiver",
            SiteRole::Station => "station",
            SiteRole::Jammer => "jammer",
            SiteRole::Origin => "origin",
        }
    }
}

/// A fixed point on or above the Earth.
#[derive(Clone, Debug, PartialEq)]
pub struct Site {
    /// Identifier, unique within the scene.
    pub id: String,
    /// What the point is.
    pub role: SiteRole,
    /// One-line description.
    pub description: String,
    /// WGS 84 geodetic latitude (deg).
    pub lat_deg: f64,
    /// WGS 84 longitude (deg).
    pub lon_deg: f64,
    /// Height above the WGS 84 ellipsoid (m).
    pub h_m: f64,
}

impl Site {
    /// Earth-fixed position (m).
    pub fn ecef_m(&self) -> Vec3 {
        geodetic_to_ecef(Geodetic {
            lat_rad: self.lat_deg.to_radians(),
            lon_rad: self.lon_deg.to_radians(),
            alt_m: self.h_m,
        })
    }
}

/// An untimed track over the ground: the waypoints a navigation kind flies, in order.
#[derive(Clone, Debug, PartialEq)]
pub struct Route {
    /// Identifier, unique within the scene.
    pub id: String,
    /// One-line description.
    pub description: String,
    /// `[latitude, longitude]` in degrees (WGS 84), in flight order.
    pub points: Vec<[f64; 2]>,
}

/// A circle on the ground: the area inside which a jammer takes a satellite away.
#[derive(Clone, Debug, PartialEq)]
pub struct Footprint {
    /// Identifier, unique within the scene.
    pub id: String,
    /// One-line description, including what the radius means.
    pub description: String,
    /// Centre latitude (deg).
    pub centre_lat_deg: f64,
    /// Centre longitude (deg).
    pub centre_lon_deg: f64,
    /// Radius along the ground (m).
    pub radius_m: f64,
    /// The circle as a closed, counter-clockwise ring of `[latitude, longitude]` (deg).
    pub ring: Vec<[f64; 2]>,
}

/// Everything the geospatial writers place: one scenario's geometry.
#[derive(Clone, Debug, PartialEq)]
pub struct Scene {
    /// The scenario's `kind`.
    pub kind: String,
    /// First 12 hex characters of the SHA-256 of the scenario source, as the result
    /// documents and chart footers print it.
    pub scenario_hash: String,
    /// The UTC instant of `t = 0`, when the scene has moving objects.
    pub epoch: Option<UtcEpoch>,
    /// Where the epoch comes from, in words, written into every export.
    pub epoch_note: String,
    /// Sample times (s after the epoch) shared by every mover.
    pub times_s: Vec<f64>,
    /// Moving objects.
    pub movers: Vec<Mover>,
    /// Fixed points.
    pub sites: Vec<Site>,
    /// Untimed ground tracks.
    pub routes: Vec<Route>,
    /// Jammer footprints.
    pub footprints: Vec<Footprint>,
}

impl Scene {
    /// A short human title: `jamming scenario 1a2b3c4d5e6f`.
    pub fn title(&self) -> String {
        format!("{} scenario {}", self.kind, self.scenario_hash)
    }

    fn empty(kind: ScenarioKind, src: &str) -> Scene {
        Scene {
            kind: kind.as_str().to_string(),
            scenario_hash: short_hash(src),
            epoch: None,
            epoch_note: String::new(),
            times_s: Vec::new(),
            movers: Vec::new(),
            sites: Vec::new(),
            routes: Vec::new(),
            footprints: Vec::new(),
        }
    }
}

fn short_hash(src: &str) -> String {
    use sha2::{Digest, Sha256};
    let mut h = Sha256::new();
    h.update(src.as_bytes());
    hex::encode(h.finalize())[..12].to_string()
}

/// The J2000 calendar label the SP3 and OEM exports give `t = 0` when an orbit scenario
/// has no `epoch`.
fn default_orbit_epoch() -> crate::rinex::EpochUtc {
    crate::rinex::EpochUtc {
        year: 2000,
        month: 1,
        day: 1,
        hour: 0,
        minute: 0,
        second: 0.0,
    }
}

/// Upper bound on samples × movers a scene may hold, so an export of a pathological
/// scenario fails with a message instead of exhausting memory.
const MAX_SAMPLES: usize = 5_000_000;

fn time_grid(step_s: f64, duration_s: f64) -> Result<Vec<f64>, ExportError> {
    if !(step_s.is_finite() && step_s > 0.0) {
        return Err(ExportError::Failed(
            "time step must be positive and finite for an export".into(),
        ));
    }
    if !(duration_s.is_finite() && duration_s >= 0.0) {
        return Err(ExportError::Failed(
            "duration must be non-negative and finite for an export".into(),
        ));
    }
    let n = (duration_s / step_s).round() as usize;
    if n >= MAX_SAMPLES {
        return Err(ExportError::Failed(format!(
            "{n} time samples is more than an export writes ({MAX_SAMPLES})"
        )));
    }
    Ok((0..=n).map(|i| i as f64 * step_s).collect())
}

/// Sample propagators on the grid. The TEME→GCRS rotation depends only on the instant,
/// so it is built once per sample and shared by every object dated by the scene epoch.
///
/// With `own_dates`, an object whose data carry their own epoch (an SGP4 satellite's
/// TLE epoch, a broadcast ephemeris's `Toe`, an SP3 file's start; see
/// [`Propagator::own_jd_utc`]) is rotated into the GCRS and Earth-fixed frames at its
/// own instant, since that is the date its TEME position belongs to, while its time tag
/// stays the scene's.
fn sample(
    items: Vec<(String, MoverRole, String, Propagator)>,
    epoch: &UtcEpoch,
    times: &[f64],
    own_dates: bool,
) -> Result<Vec<Mover>, ExportError> {
    if items.len().saturating_mul(times.len()) > MAX_SAMPLES {
        return Err(ExportError::Failed(format!(
            "{} objects x {} samples is more than an export writes ({MAX_SAMPLES})",
            items.len(),
            times.len()
        )));
    }
    let mut movers: Vec<Mover> = items
        .iter()
        .map(|(id, role, d, _)| Mover {
            id: id.clone(),
            role: *role,
            description: d.clone(),
            gcrs_r_m: Vec::with_capacity(times.len()),
            gcrs_v_m_s: Vec::with_capacity(times.len()),
            ecef_r_m: Vec::with_capacity(times.len()),
        })
        .collect();
    for &t in times {
        let jd_utc = epoch.jd_utc(t);
        let m = crate::nutation::teme_to_gcrs_matrix(crate::timescales::utc_to_tt(jd_utc));
        for (k, (_, _, _, p)) in items.iter().enumerate() {
            let s = p.state_eci(t);
            let own = if own_dates { p.own_jd_utc(t) } else { None };
            let (jd, mk) = match own {
                Some(jd) => (
                    jd,
                    crate::nutation::teme_to_gcrs_matrix(crate::timescales::utc_to_tt(jd)),
                ),
                None => (jd_utc, m),
            };
            let mv = &mut movers[k];
            mv.gcrs_r_m.push(crate::precession::mat_vec(&mk, s.r_m));
            mv.gcrs_v_m_s.push(crate::precession::mat_vec(&mk, s.v_m_s));
            // UT1 is taken equal to UTC, as in the SP3 export.
            mv.ecef_r_m.push(teme_to_ecef(s.r_m, jd));
        }
    }
    Ok(movers)
}

fn positional_ids(n: usize) -> Vec<String> {
    (1..=n).map(|i| format!("G{i:02}")).collect()
}

fn geodetic_site(id: &str, role: SiteRole, description: String, ecef: Vec3) -> Site {
    let g = ecef_to_geodetic(ecef);
    Site {
        id: id.to_string(),
        role,
        description,
        lat_deg: round_dp(g.lat_rad.to_degrees(), 9),
        lon_deg: round_dp(g.lon_rad.to_degrees(), 9),
        h_m: round_dp(g.alt_m, 4),
    }
}

/// A closed, counter-clockwise circle of `radius_m` along the ground about a centre,
/// on a sphere of the Earth's mean radius (the ellipsoid is not used for the ring; the
/// difference is a fraction of a percent of the radius).
pub fn circle_ring(lat_deg: f64, lon_deg: f64, radius_m: f64, n: usize) -> Vec<[f64; 2]> {
    const R_MEAN_M: f64 = 6_371_008.8;
    let d = radius_m / R_MEAN_M;
    let (p1, l1) = (lat_deg.to_radians(), lon_deg.to_radians());
    let mut ring = Vec::with_capacity(n + 1);
    for k in 0..n {
        // Bearings run from north towards west: counter-clockwise seen from above.
        let brg = -std::f64::consts::TAU * k as f64 / n as f64;
        let p2 = (p1.sin() * d.cos() + p1.cos() * d.sin() * brg.cos()).asin();
        let l2 = l1 + (brg.sin() * d.sin() * p1.cos()).atan2(d.cos() - p1.sin() * p2.sin());
        let mut lon = l2.to_degrees();
        if lon > 180.0 {
            lon -= 360.0;
        } else if lon < -180.0 {
            lon += 360.0;
        }
        ring.push([round_dp(p2.to_degrees(), 9), round_dp(lon, 9)]);
    }
    ring.push(ring[0]);
    ring
}

/// Ground range (m) at which a jammer drives a satellite seen at `sat_el_rad` below the
/// tracking threshold, from the `jamming` kind's own link equations: the jammer is
/// taken at the receiver's horizon (the receive antenna's ground gain), the satellite
/// at the given elevation. `None` when that satellite is not tracked even without the
/// jammer, so no finite radius exists.
pub fn jammer_denial_range_m(
    scn: &crate::jamming::JammingScenario,
    j: &crate::jamming::JammerCfg,
    sat_el_rad: f64,
) -> Option<f64> {
    use crate::jamming::*;
    let g_sat = rx_antenna_gain_db(sat_el_rad);
    let g_jam = rx_antenna_gain_db(0.0);
    let cn0 = nominal_cn0_dbhz(scn.signal_power_dbw, g_sat, scn.temp_k);
    let thr = scn.tracking_threshold_dbhz;
    if cn0 <= thr {
        return None;
    }
    let q = q_factor(&j.jammer_type, j.q_override);
    // (C/N0)_eff = thr  <=>  J/S = q Rc (1/thr - 1/cn0), linear.
    let js_lin = q.max(1e-9)
        * scn.chip_rate_hz
        * (1.0 / 10f64.powf(thr / 10.0) - 1.0 / 10f64.powf(cn0 / 10.0));
    let js_db = 10.0 * js_lin.log10();
    // J/S = P + G + G_jam - FSPL(d) - (S + G_sat)  =>  FSPL(d).
    let fspl = j.power_dbw + j.gain_dbi + g_jam - (scn.signal_power_dbw + g_sat) - js_db;
    let c = 299_792_458.0f64;
    let d = 10f64.powf(
        (fspl - 20.0 * scn.freq_hz.log10() - 20.0 * (4.0 * std::f64::consts::PI / c).log10())
            / 20.0,
    );
    if d.is_finite() && d > 0.0 {
        Some(d)
    } else {
        None
    }
}

/// Why a kind has no scene, or `None` when it has one. Each reason is a statement about
/// the kind's scenario input, checked against every bundled scenario of that kind.
pub fn reason_for_kind(kind: ScenarioKind) -> Option<String> {
    use ScenarioKind as K;
    let no_position = String::from(
        "the scenario input carries no horizontal position (no latitude and longitude, no \
         Earth-centred coordinates, no orbital elements beyond at most an altitude), so there \
         is nothing to place on the Earth",
    );
    let off_earth = String::from(
        "the kind's geometry is centred on the Moon, Mars or another solar-system body; \
         CZML, KML and GeoJSON describe positions on or about the Earth, and this release writes \
         STK ephemerides with CentralBody Earth only",
    );
    let composite = String::from(
        "the scenario sweeps another scenario over a grid; export the swept scenario on its own",
    );
    let r = match kind {
        K::Orbit
        | K::Integrity
        | K::Ephemeris
        | K::Passes
        | K::Jamming
        | K::GnssSim
        | K::GnssIns
        | K::Pvt
        | K::Terrain
        | K::TerrainSlam
        | K::GravityMap
        | K::CombinedAltPnt => return None,
        K::Clock
        | K::Inertial
        | K::TimeTransfer
        | K::QuantumTimeTransfer
        | K::QuantumGnssFreeNav
        | K::QuantumAnomalyDetect
        | K::Hybrid
        | K::Fusion
        | K::HybridUkf
        | K::Spoof
        | K::SpoofDetect
        | K::ImpairmentEval
        | K::QuantumTrade
        | K::SpaceWeather
        | K::Reentry
        | K::EoCoverage
        | K::SpacePacket
        | K::AttitudeBudget
        | K::LinkBudget
        | K::RealtimeFrameEop
        | K::HybridOpticalRf
        | K::ConflictResilience
        | K::ApertureDutyCycle
        | K::InsTrnCoast
        | K::TrackingLoop
        | K::AraimReferenceCheck
        | K::TelecomTiming
        | K::SlotTiming
        | K::Spectrum => no_position,
        K::LeoPass | K::LeoPntChain => return None,
        K::LeoSignal => "the `leo-signal` kind analyses signal designs (spectra, tracking, \
             acquisition, compatibility) with no satellite or user position; export the \
             `leo-pass` or `leo-pnt-chain` scenario that flies the design"
            .to_string(),
        K::LeoNavmsg => "not exported in this release: the `leo-navmsg` truth orbit is a fitting \
             reference whose Earth rotation angle at the epoch is an input (`theta0_deg`, default \
             0), not derived from the calendar date, so its Earth-fixed positions are not tied to \
             a date"
            .to_string(),
        K::LeoPvt | K::LeoPpp | K::NtnPositioning => "not exported in this release: the fused \
             positioning kinds place their satellites in an Earth-fixed frame relative to an \
             epoch they never name, so a time-tagged export would have to invent the calendar \
             date (export the `leo-pass` or `leo-pnt-chain` scenario instead)"
            .to_string(),
        K::LaunchWindow => "the `launch-window` scenario gives the launch site's latitude but no
             longitude, so the site cannot be placed"
            .to_string(),
        K::LunarIntegrity
        | K::LunarTime
        | K::LunarVlbi
        | K::LunarCombination
        | K::LunarFrameRealise
        | K::LunarFrameCampaign
        | K::LunarLlrDatum
        | K::LunarService
        | K::LunarDpnt
        | K::LunarInterop
        | K::LunarTimeBudget
        | K::CislunarObservability
        | K::CislunarArcRecovery
        | K::LunarAttackSurface
        | K::LunarJamming
        | K::LunarBeacon
        | K::LunarVlbiFim
        | K::MarsPnt
        | K::SolarSystem
        | K::BodyPnt => off_earth,
        K::Sweep | K::SweepNd => composite,
        K::Campaign => "a campaign has no scene of its own: each member scenario is exported \
             as its own file set (see `interop::export_campaign`)"
            .to_string(),
        K::ConstellationDesign => "not exported in this release: `constellation-design` places its \
             satellites in a body-fixed frame relative to an epoch it never names, so a time-tagged \
             export would have to invent the calendar date"
            .to_string(),
        K::EarthGnssLunar => "not exported in this release: the Earth Global Navigation \
             Satellite System (GNSS) constellation of `earth-gnss-lunar` is seen from a receiver at lunar distance, whose trajectory the kind \
             does not expose as a time series"
            .to_string(),
        K::OemInterop => "not exported in this release: `oem-interop` reads and writes a CCSDS \
             (Consultative Committee for Space Data Systems) Orbit Ephemeris Message, which is \
             itself the ephemeris interchange file"
            .to_string(),
    };
    Some(r)
}

/// Build the scene of a scenario (TOML source).
pub fn scene_of(src: &str) -> Result<Scene, ExportError> {
    let kind = ScenarioKind::classify(src).map_err(|e| ExportError::Failed(e.to_string()))?;
    if let Some(why) = reason_for_kind(kind) {
        return Err(ExportError::NotApplicable(why));
    }
    let bad = |e: toml::de::Error| {
        ExportError::Failed(format!("invalid {} scenario: {e}", kind.as_str()))
    };
    let mut scene = Scene::empty(kind, src);
    match kind {
        ScenarioKind::Orbit => {
            let scn: crate::orbit::OrbitClockScenario = toml::from_str(src).map_err(bad)?;
            let sats = scn.all_satellites().map_err(ExportError::Failed)?;
            let given = scn.epoch.as_ref().map(|e| {
                (
                    UtcEpoch::from_epoch_utc(e),
                    "the scenario's `epoch`, read as UTC".to_string(),
                )
            });
            orbit_like(&mut scene, given, &scn.time, &scn.user, sats)?;
        }
        ScenarioKind::Integrity => {
            let scn: crate::raim::IntegrityScenario = toml::from_str(src).map_err(bad)?;
            let mut sats = scn
                .constellation
                .satellites()
                .map_err(ExportError::Failed)?;
            for c in &scn.constellations {
                sats.extend(c.satellites().map_err(ExportError::Failed)?);
            }
            // The integrity kind has no `epoch` of its own, so t = 0 is dated as for an
            // orbit scenario without one.
            orbit_like(&mut scene, None, &scn.time, &scn.user, sats)?;
        }
        ScenarioKind::Jamming => {
            let scn: crate::jamming::JammingScenario = toml::from_str(src).map_err(bad)?;
            walker_scene(&mut scene, &scn.time, &scn.constellation)?;
            scene.sites.push(receiver_site(
                scn.receiver.lat_deg,
                scn.receiver.lon_deg,
                scn.receiver.alt_m,
            ));
            if let Some(j) = &scn.jammer {
                let site = geodetic_site(
                    "jammer",
                    SiteRole::Jammer,
                    format!(
                        "{} jammer, {} dBW transmit power, {} dBi antenna gain",
                        j.jammer_type, j.power_dbw, j.gain_dbi
                    ),
                    j.position_ecef_m,
                );
                let rings = [
                    (
                        "footprint/denial",
                        std::f64::consts::FRAC_PI_2,
                        "ground range within which a satellite at the zenith, the strongest, \
                         falls below the tracking threshold: every satellite is lost",
                    ),
                    (
                        "footprint/onset",
                        scn.mask_deg.to_radians(),
                        "ground range within which a satellite at the elevation mask, the \
                         weakest, falls below the tracking threshold: tracking starts to fail",
                    ),
                ];
                for (id, el, what) in rings {
                    if let Some(r) = jammer_denial_range_m(&scn, j, el) {
                        scene.footprints.push(Footprint {
                            id: id.to_string(),
                            description: format!(
                                "{what}; {:.0} m, from the jamming kind's link equations with \
                                 the jammer at the receiver's horizon and free-space loss",
                                r
                            ),
                            centre_lat_deg: site.lat_deg,
                            centre_lon_deg: site.lon_deg,
                            radius_m: round_dp(r, 3),
                            ring: circle_ring(site.lat_deg, site.lon_deg, r, 72),
                        });
                    }
                }
                scene.sites.push(site);
            }
        }
        ScenarioKind::GnssSim => {
            let scn: crate::gnss_sim::GnssSimScenario = toml::from_str(src).map_err(bad)?;
            walker_scene(&mut scene, &scn.time, &scn.constellation)?;
            scene.sites.push(receiver_site(
                scn.receiver.lat_deg,
                scn.receiver.lon_deg,
                scn.receiver.alt_m,
            ));
        }
        ScenarioKind::LeoPass => {
            let scn: crate::leo_pass::LeoPassScenario = toml::from_str(src).map_err(bad)?;
            leo_pass_scene(&mut scene, &scn)?;
        }
        ScenarioKind::LeoPntChain => {
            let scn: crate::leo_pnt_chain::LeoPntChainScenario =
                toml::from_str(src).map_err(bad)?;
            let pass = scn.pass_scenario().map_err(ExportError::Failed)?;
            leo_pass_scene(&mut scene, &pass)?;
            scene.epoch_note = format!("{} (the chain's [pass] stage)", scene.epoch_note);
        }
        ScenarioKind::Passes => {
            let scn: crate::passes::PassesScenario = toml::from_str(src).map_err(bad)?;
            let e = scn.epoch_calendar();
            let epoch = UtcEpoch::from_calendar(
                e[0] as i32,
                e[1] as u32,
                e[2] as u32,
                e[3] as u32,
                e[4] as u32,
                e[5],
            );
            scene.epoch = Some(epoch);
            scene.epoch_note = "the scenario's `epoch` (2024-01-01T00:00:00Z when absent), the \
                                window start the pass prediction uses"
                .into();
            scene.times_s = time_grid(scn.step_s, scn.duration_hours * 3600.0)?;
            scene.movers = sample(
                vec![(
                    "satellite".into(),
                    MoverRole::Satellite,
                    format!(
                        "circular orbit, {} km altitude, {} deg inclination (Keplerian, as the \
                         passes kind propagates it)",
                        scn.altitude_km, scn.inclination_deg
                    ),
                    scn.propagator(),
                )],
                &epoch,
                &scene.times_s,
                false,
            )?;
            scene.sites.push(Site {
                id: "station".into(),
                role: SiteRole::Station,
                description: format!("ground station, {} deg elevation mask", scn.mask_deg),
                lat_deg: scn.station_lat_deg,
                lon_deg: scn.station_lon_deg,
                h_m: scn.station_alt_m,
            });
        }
        ScenarioKind::Ephemeris => {
            let scn: crate::ephemeris::EphemerisScenario = toml::from_str(src).map_err(bad)?;
            let r = crate::ephemeris::run_ephemeris(&scn).map_err(ExportError::Failed)?;
            let epoch = UtcEpoch::from_jd_utc(r.jd_utc0);
            scene.epoch = Some(epoch);
            scene.epoch_note = "the ephemeris kind's t = 0 (`jd_utc0`): the scenario's `epoch` \
                                when given, otherwise the TLE epoch"
                .into();
            scene.times_s = r.samples.iter().map(|s| s.t_s).collect();
            scene.movers.push(Mover {
                id: "satellite".into(),
                role: MoverRole::Satellite,
                description: format!(
                    "{}; GCRS and Earth-fixed states are the ephemeris kind's own output \
                     (UT1 and polar motion as the scenario sets them)",
                    r.source
                ),
                gcrs_r_m: r.samples.iter().map(|s| s.gcrs_r_m).collect(),
                gcrs_v_m_s: r.samples.iter().map(|s| s.gcrs_v_m_s).collect(),
                ecef_r_m: r.samples.iter().map(|s| s.ecef_r_m).collect(),
            });
            if let Some(st) = scn.station {
                scene.sites.push(Site {
                    id: "station".into(),
                    role: SiteRole::Station,
                    description: "ground station".into(),
                    lat_deg: st.lat_deg,
                    lon_deg: st.lon_deg,
                    h_m: st.alt_m,
                });
            }
        }
        ScenarioKind::GnssIns => {
            let scn: crate::fusion::pack::GnssInsScenario = toml::from_str(src).map_err(bad)?;
            scene.epoch_note = "static scene: the gnss-ins kind flies its trajectory in a local \
                                tangent plane from this origin and exports no calendar time"
                .into();
            scene.sites.push(Site {
                id: "origin".into(),
                role: SiteRole::Origin,
                description: "tangent-plane origin; the simulated trajectory starts here and is \
                              flown in a flat local frame, so only the origin is placed"
                    .into(),
                lat_deg: scn.lat_deg,
                lon_deg: scn.lon_deg,
                h_m: scn.alt_m,
            });
        }
        ScenarioKind::Pvt => {
            let v: toml::Value = toml::from_str(src).map_err(bad)?;
            let truth = v
                .get("truth_ecef")
                .and_then(|a| a.as_array())
                .map(|a| a.iter().filter_map(toml_f64).collect::<Vec<f64>>())
                .filter(|a| a.len() == 3);
            let Some(t) = truth else {
                return Err(ExportError::NotApplicable(
                    "this pvt scenario gives no `truth_ecef`, the only position it states".into(),
                ));
            };
            scene.epoch_note = "static scene: the receiver's reference position only".into();
            scene.sites.push(geodetic_site(
                "receiver",
                SiteRole::Receiver,
                "receiver reference position (`truth_ecef`), the truth the solution is scored \
                 against"
                    .into(),
                [t[0], t[1], t[2]],
            ));
        }
        ScenarioKind::Terrain
        | ScenarioKind::TerrainSlam
        | ScenarioKind::GravityMap
        | ScenarioKind::CombinedAltPnt => {
            let v: toml::Value = toml::from_str(src).map_err(bad)?;
            let track = straight_track(&v).map_err(ExportError::Failed)?;
            scene.epoch_note = format!(
                "static scene: the {} kind flies an untimed track of waypoints",
                kind.as_str()
            );
            scene.routes.push(Route {
                id: "track".into(),
                description: format!(
                    "true track flown GPS-denied: {} waypoints from start_lat_deg/start_lon_deg \
                     in steps of step_lat_deg/step_lon_deg",
                    track.len()
                ),
                points: track,
            });
        }
        _ => {
            return Err(ExportError::NotApplicable(format!(
                "`{}` has no scene",
                kind.as_str()
            )))
        }
    }
    Ok(scene)
}

fn toml_f64(v: &toml::Value) -> Option<f64> {
    v.as_float().or_else(|| v.as_integer().map(|i| i as f64))
}

/// The waypoints of the straight-track kinds, `start + i·step` for `i` in
/// `0..waypoints`, exactly as their runs generate the truth.
pub fn straight_track(v: &toml::Value) -> Result<Vec<[f64; 2]>, String> {
    let f = |k: &str| {
        v.get(k)
            .and_then(toml_f64)
            .ok_or_else(|| format!("missing numeric `{k}`"))
    };
    let (la0, lo0, dla, dlo) = (
        f("start_lat_deg")?,
        f("start_lon_deg")?,
        f("step_lat_deg")?,
        f("step_lon_deg")?,
    );
    let n = v
        .get("waypoints")
        .and_then(|w| w.as_integer())
        .ok_or("missing integer `waypoints`")?;
    if !(1..=1_000_000).contains(&n) {
        return Err(format!("waypoints = {n} is outside 1..=1000000"));
    }
    Ok((0..n as usize)
        .map(|i| {
            [
                round_dp(la0 + dla * i as f64, 9),
                round_dp(lo0 + dlo * i as f64, 9),
            ]
        })
        .collect())
}

fn receiver_site(lat: f64, lon: f64, h: f64) -> Site {
    Site {
        id: "receiver".into(),
        role: SiteRole::Receiver,
        description: "GNSS receiver".into(),
        lat_deg: lat,
        lon_deg: lon,
        h_m: h,
    }
}

fn walker_scene(
    scene: &mut Scene,
    time: &crate::scenario::TimeCfg,
    w: &crate::walker::WalkerSgp4,
) -> Result<(), ExportError> {
    let epoch = UtcEpoch::from_jd_utc(crate::walker::walker_epoch_jd());
    scene.epoch = Some(epoch);
    scene.epoch_note = "the Walker constellation's own SGP4 element epoch, which the engine also \
                        uses to rotate the satellites into the Earth-fixed frame"
        .into();
    scene.times_s = time_grid(time.step_s, time.duration_s)?;
    let sats = w.satellites();
    let ids = positional_ids(sats.len());
    let desc = format!(
        "Walker {}/{}/{} at {} km, {} deg inclination (SGP4)",
        w.total(),
        w.planes,
        w.phasing_f,
        w.altitude_km,
        w.inclination_deg
    );
    let items = ids
        .into_iter()
        .zip(sats)
        .map(|(id, p)| (id, MoverRole::Satellite, desc.clone(), p))
        .collect();
    scene.movers = sample(items, &epoch, &scene.times_s, false)?;
    Ok(())
}

/// The UTC instant of `t = 0` when a scenario gives no `epoch`, with the note written
/// into each export: the earliest epoch the satellites' own data carry, or, when no
/// satellite carries one (Keplerian elements only), 2000-01-01T00:00:00Z, the label the
/// SP3 and OEM exports give `t = 0`.
fn default_epoch(sats: &[Propagator]) -> (UtcEpoch, String) {
    let own: Vec<f64> = sats.iter().filter_map(|p| p.own_jd_utc(0.0)).collect();
    let Some(first) = own.iter().copied().reduce(f64::min) else {
        return (
            UtcEpoch::from_epoch_utc(&default_orbit_epoch()),
            "the scenario gives no `epoch` and its satellites carry none (Keplerian \
             elements); t = 0 is labelled 2000-01-01T00:00:00Z, the default the SP3 and OEM \
             exports use"
                .to_string(),
        );
    };
    let last = own.iter().copied().reduce(f64::max).unwrap_or(first);
    let epoch = UtcEpoch::from_jd_utc(first);
    let spread_h = (last - first) * 24.0;
    let note = if spread_h > 0.0 {
        format!(
            "the scenario gives no `epoch`; t = 0 is {}, the earliest epoch the satellites' \
             own data carry (TLE, broadcast-ephemeris or SP3 epoch). Each satellite is \
             propagated from its own epoch, and those span {:.3} h: the time tags follow the \
             engine's premise that every satellite starts at t = 0, while each position is \
             rotated into the GCRS and Earth-fixed frames at that satellite's own instant. \
             The SP3 and OEM exports label t = 0 as 2000-01-01T00:00:00Z instead",
            epoch.iso(0.0),
            spread_h
        )
    } else {
        format!(
            "the scenario gives no `epoch`; t = 0 is {}, the epoch the satellites' own data \
             carry (TLE, broadcast-ephemeris or SP3 epoch). The SP3 and OEM exports label t = \
             0 as 2000-01-01T00:00:00Z instead",
            epoch.iso(0.0)
        )
    };
    (epoch, note)
}

/// A `leo-pass` scene: every LEO satellite and the user, from the kind's own propagators
/// and time grid. The kind works in ECI0, the inertial frame aligned with the Earth-fixed
/// frame at the epoch; each sample is turned into the Earth-fixed frame at its own time
/// by the kind's Earth rotation, and from there into the GCRS through TEME at that
/// instant (UT1 taken equal to UTC, polar motion neglected, as in the other exports).
fn leo_pass_scene(
    scene: &mut Scene,
    scn: &crate::leo_pass::LeoPassScenario,
) -> Result<(), ExportError> {
    use crate::leo_link::geometry::{eci0_to_ecef, Kinematics};
    let tr = scn.tracks().map_err(ExportError::Failed)?;
    if tr.satellites.len().saturating_mul(tr.times_s.len()) > MAX_SAMPLES {
        return Err(ExportError::Failed(format!(
            "{} objects x {} samples is more than an export writes ({MAX_SAMPLES})",
            tr.satellites.len(),
            tr.times_s.len()
        )));
    }
    let epoch = UtcEpoch::from_jd_utc(tr.epoch_jd_utc);
    scene.epoch = Some(epoch);
    scene.epoch_note = tr.epoch_label.clone();
    scene.times_s = tr.times_s.clone();
    let times = tr.times_s.clone();
    let mover = |id: String, role: MoverRole, description: String, st: &[Kinematics]| {
        let mut m = Mover {
            id,
            role,
            description,
            gcrs_r_m: Vec::with_capacity(times.len()),
            gcrs_v_m_s: Vec::with_capacity(times.len()),
            ecef_r_m: Vec::with_capacity(times.len()),
        };
        for (k, &t) in times.iter().enumerate() {
            let jd = epoch.jd_utc(t);
            let mk = crate::nutation::teme_to_gcrs_matrix(crate::timescales::utc_to_tt(jd));
            let r_ecef = eci0_to_ecef(st[k].r, t);
            let v_axes = eci0_to_ecef(st[k].v, t);
            let r_teme = crate::frames::ecef_to_teme(r_ecef, jd);
            let v_teme = crate::frames::ecef_to_teme(v_axes, jd);
            m.gcrs_r_m.push(crate::precession::mat_vec(&mk, r_teme));
            m.gcrs_v_m_s.push(crate::precession::mat_vec(&mk, v_teme));
            m.ecef_r_m.push(r_ecef);
        }
        m
    };
    for (id, d, st) in &tr.satellites {
        scene
            .movers
            .push(mover(id.clone(), MoverRole::Satellite, d.clone(), st));
    }
    let (lat, lon, h) = tr.user_start;
    if tr.user_moving {
        scene.movers.push(mover(
            "user".into(),
            MoverRole::User,
            format!(
                "{} user, moving (the kind's constant speed and heading)",
                tr.user_environment
            ),
            &tr.user,
        ));
    } else {
        scene.sites.push(Site {
            id: "user".into(),
            role: SiteRole::Receiver,
            description: format!("{} user (receiver)", tr.user_environment),
            lat_deg: round_dp(lat, 9),
            lon_deg: round_dp(lon, 9),
            h_m: round_dp(h, 4),
        });
    }
    Ok(())
}

fn orbit_like(
    scene: &mut Scene,
    given: Option<(UtcEpoch, String)>,
    time: &crate::scenario::TimeCfg,
    user: &crate::orbit::OrbitCfg,
    sats: Vec<Propagator>,
) -> Result<(), ExportError> {
    // A satellite is dated by its own data only when the scenario names no epoch; an
    // explicit `epoch` labels t = 0 for every object, as the engine's other exports read it.
    let own_dates = given.is_none();
    let (epoch, note) = given.unwrap_or_else(|| default_epoch(&sats));
    scene.epoch = Some(epoch);
    scene.epoch_note = note;
    scene.times_s = time_grid(time.step_s, time.duration_s)?;
    let ids = positional_ids(sats.len());
    let mut items: Vec<(String, MoverRole, String, Propagator)> = ids
        .into_iter()
        .zip(sats)
        .map(|(id, p)| {
            (
                id,
                MoverRole::Satellite,
                "constellation satellite, identified by position as in the SP3 and OEM exports"
                    .to_string(),
                p,
            )
        })
        .collect();
    items.push((
        "user".into(),
        MoverRole::User,
        format!(
            "user orbit, {} km altitude, {} deg inclination (Keplerian{})",
            user.altitude_km,
            user.inclination_deg,
            if user.j2 { ", secular J2" } else { "" }
        ),
        Propagator::Kepler(user.to_orbit()),
    ));
    scene.movers = sample(items, &epoch, &scene.times_s, own_dates)?;
    Ok(())
}
