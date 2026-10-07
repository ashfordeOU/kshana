// SPDX-License-Identifier: AGPL-3.0-only
//! The `body-pnt` scenario kind: positioning, navigation and timing (PNT) around any
//! solar-system body.
//!
//! A user — an orbiter or a surface lander — navigates around a central body chosen by name
//! from [`crate::body::SOLAR_SYSTEM`] (Mars, the Moon, Europa, Ganymede, Titan, …), with two
//! kinds of measurement:
//!
//! * **one-way pseudoranges from a small navigation constellation** around the body: a Walker
//!   delta pattern (planes × satellites per plane, inter-plane phasing `f`) in the body's
//!   equatorial frame, flown as two-body orbits with the body's own `J2` secular drift. The
//!   user clock is unknown, so these rows carry a clock-bias column;
//! * optionally a **deep-space ranging link from Earth**: a two-way range from the Earth's
//!   centre, which is clock-free, reported as a one-way range with its own noise. The Earth's
//!   direction and distance come from [`crate::ephem_provider::AnalyticSolarSystem`] at every
//!   epoch, and the light time and round trip Earth ↔ body from
//!   [`crate::solar_system::link`].
//!
//! Visibility is geometric: a line of sight is blocked when it passes inside the body's mean
//! radius (the same chord test the `mars-pnt` kind uses), and a surface user also needs the
//! elevation mask.
//!
//! At every epoch the pack forms the dilution of precision (DOP; GDOP geometric, PDOP position)
//! from the constellation alone ([`crate::orbit::dop`]), the formal position uncertainty of the
//! weighted geometry with the Earth row folded in, and a seeded least-squares fix through the
//! crate's Gauss-Newton solver ([`crate::batch_ls::gauss_newton`]) — once from the constellation
//! alone and once with the Earth link — so the report shows what the deep-space link adds.
//!
//! ## Label
//!
//! **MODELLED.** The geometry, the two-body relay orbits, the Gaussian noise levels and the
//! instantaneous (not light-time-retarded) measurement model are modelling choices; the pack is not
//! validated against any mission's navigation data. The body constants are published values (cited
//! in [`crate::body`]; IAU = International Astronomical Union), and the Earth-to-body geometry
//! inherits the ephemeris labels of the `solar-system` kind.

use crate::body::Body;
use crate::ephem_provider::{AnalyticSolarSystem, EphemerisProvider};
use crate::mars_frame::bodyfixed_to_inertial;
use crate::mars_pnt::chord_clears_sphere;
use crate::palette::chart::{BLUE, CYAN, MUTED};
use crate::solar_system::{link, parse_table, resolve_epoch, EpochOut, LinkOut};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

const DEG: f64 = std::f64::consts::PI / 180.0;
/// Default epoch: 2027-02-19, the Mars opposition, far from a solar conjunction.
const DEFAULT_EPOCH: &str = "2027-02-19T00:00:00";

/// The navigating user.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct UserCfg {
    /// `orbiter` (default) or `surface`.
    #[serde(default)]
    pub kind: Option<String>,
    /// Orbiter: altitude of the semi-major axis above the mean radius (km). Default 400.
    #[serde(default)]
    pub altitude_km: Option<f64>,
    /// Orbiter: inclination to the body's equator (deg). Default 75.
    #[serde(default)]
    pub inclination_deg: Option<f64>,
    /// Orbiter: right ascension of the node in the body's equatorial frame (deg). Default 0.
    #[serde(default)]
    pub raan_deg: Option<f64>,
    /// Orbiter: argument of latitude at the epoch (deg). Default 0.
    #[serde(default)]
    pub u0_deg: Option<f64>,
    /// Orbiter: eccentricity. Default 0.
    #[serde(default)]
    pub eccentricity: Option<f64>,
    /// Surface: planetocentric latitude (deg). Default 0.
    #[serde(default)]
    pub lat_deg: Option<f64>,
    /// Surface: east longitude (deg). Default 0.
    #[serde(default)]
    pub lon_deg: Option<f64>,
    /// Surface: height above the mean radius (m). Default 0.
    #[serde(default)]
    pub height_m: Option<f64>,
}

/// The navigation constellation around the body.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ConstellationCfg {
    /// Orbital planes. Default 3.
    #[serde(default)]
    pub planes: Option<usize>,
    /// Satellites per plane. Default 4.
    #[serde(default)]
    pub sats_per_plane: Option<usize>,
    /// Altitude above the mean radius (km). Default: three mean radii.
    #[serde(default)]
    pub altitude_km: Option<f64>,
    /// Inclination to the body's equator (deg). Default 60.
    #[serde(default)]
    pub inclination_deg: Option<f64>,
    /// Walker inter-plane phasing `f`. Default 1.
    #[serde(default)]
    pub phasing_f: Option<f64>,
    /// One-sigma pseudorange noise (m). Default 1.
    #[serde(default)]
    pub sigma_range_m: Option<f64>,
    /// Elevation mask for a surface user (deg). Default 10.
    #[serde(default)]
    pub mask_deg: Option<f64>,
}

/// The deep-space ranging link from Earth.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct EarthLinkCfg {
    /// Use the Earth range in the fix. Default true.
    #[serde(default)]
    pub enabled: Option<bool>,
    /// One-sigma one-way range noise of the two-way measurement (m). Default 1.
    #[serde(default)]
    pub sigma_range_m: Option<f64>,
}

/// The `body-pnt` scenario.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct BodyPntScenario {
    /// Scenario kind tag, ignored by the computation.
    #[serde(default)]
    pub kind: Option<String>,
    /// Central body by name. Default `Mars`.
    #[serde(default)]
    pub body: Option<String>,
    /// Epoch, ISO 8601 UTC. Default `2027-02-19T00:00:00` (a Mars opposition).
    #[serde(default)]
    pub epoch: Option<String>,
    /// Epoch as a TDB Julian date; overrides `epoch`.
    #[serde(default)]
    pub epoch_jd_tdb: Option<f64>,
    /// Span of the run (s). Default 86400.
    #[serde(default)]
    pub duration_s: Option<f64>,
    /// Epoch spacing (s). Default 600.
    #[serde(default)]
    pub step_s: Option<f64>,
    /// Noise seed. Default 1.
    #[serde(default)]
    pub seed: Option<u64>,
    /// Standish table for the Earth-to-body geometry: `auto`, `table1` or `table2`.
    #[serde(default)]
    pub table: Option<String>,
    /// The navigating user (orbiter or surface lander); defaults apply when absent.
    #[serde(default)]
    pub user: Option<UserCfg>,
    /// The navigation relay constellation around the body; defaults apply when absent.
    #[serde(default)]
    pub constellation: Option<ConstellationCfg>,
    /// The deep-space ranging link from Earth; defaults apply when absent.
    #[serde(default)]
    pub earth_link: Option<EarthLinkCfg>,
}

/// The central body as used.
#[derive(Clone, Debug, Serialize)]
pub struct BodyOut {
    /// Body name as listed in [`crate::body::SOLAR_SYSTEM`].
    pub name: String,
    /// Gravitational parameter GM of the body (m³/s²).
    pub gm_m3_s2: f64,
    /// Volumetric mean radius (m): the occultation sphere and the surface for a lander.
    pub radius_mean_m: f64,
    /// Unnormalised second zonal harmonic `J2`, where one is carried (dimensionless).
    pub j2: Option<f64>,
    /// Reference radius the `J2` value is referenced to (m).
    pub j2_reference_radius_m: Option<f64>,
    /// Sidereal rotation period (h) from the IAU prime-meridian rate; negative for retrograde
    /// rotation.
    pub sidereal_rotation_period_h: f64,
}

/// One epoch of the run.
#[derive(Clone, Debug, Serialize)]
pub struct EpochRow {
    /// Time since the scenario epoch (s).
    pub t_s: f64,
    /// Relays whose line of sight clears the body (and the elevation mask, for a surface user).
    pub n_relays_visible: usize,
    /// `true` when the Earth's centre is above the body's limb for the user at this epoch.
    pub earth_visible: bool,
    /// Constellation-only dilution of precision; absent below four relays.
    pub gdop: Option<f64>,
    /// Constellation-only position dilution of precision (PDOP); absent below four relays.
    pub pdop: Option<f64>,
    /// Formal one-sigma position uncertainty of the constellation alone (m).
    pub formal_sigma_relays_m: Option<f64>,
    /// Formal one-sigma position uncertainty with the Earth range folded in (m).
    pub formal_sigma_with_earth_m: Option<f64>,
    /// Position error of the seeded constellation-only fix (m).
    pub error_relays_m: Option<f64>,
    /// Position error of the seeded fix with the Earth range (m).
    pub error_with_earth_m: Option<f64>,
    /// User distance from the body's centre (m).
    pub user_radius_m: f64,
    /// Geometric Earth-to-user range (m).
    pub earth_range_m: f64,
}

/// Figures of merit over the run.
#[derive(Clone, Debug, Serialize)]
pub struct Fom {
    /// Epochs in the run.
    pub n_epochs: usize,
    /// Fraction of epochs (0 to 1) with a converged constellation-only fix (at least four relays).
    pub availability_relays: f64,
    /// Fraction of epochs (0 to 1) with a converged fix once the Earth range is added.
    pub availability_with_earth: f64,
    /// Fraction of epochs (0 to 1) with the Earth above the body's limb for the user.
    pub earth_visibility: f64,
    /// Mean number of relays in view over the epochs.
    pub mean_relays_visible: f64,
    /// Median constellation-only PDOP over epochs with four or more relays.
    pub median_pdop: Option<f64>,
    /// Root-mean-square position error of the seeded constellation-only fixes (m).
    pub rms_error_relays_m: Option<f64>,
    /// Root-mean-square position error of the seeded fixes with the Earth range (m).
    pub rms_error_with_earth_m: Option<f64>,
    /// Median formal one-sigma position uncertainty, constellation only (m).
    pub median_formal_sigma_relays_m: Option<f64>,
    /// Median formal one-sigma position uncertainty with the Earth range (m).
    pub median_formal_sigma_with_earth_m: Option<f64>,
    /// Root-mean-square of each fix error over its own formal sigma, constellation only: near 1
    /// when the noise and the covariance describe the same model.
    pub rms_normalised_error_relays: Option<f64>,
    /// The same, with the Earth range.
    pub rms_normalised_error_with_earth: Option<f64>,
}

/// The `body-pnt` report.
#[derive(Clone, Debug, Serialize)]
pub struct BodyPntReport {
    /// Provenance label of the whole report (MODELLED), with what the model assumes.
    pub label: String,
    /// The scenario epoch as given and as a Julian date in Barycentric Dynamical Time (TDB).
    pub epoch: EpochOut,
    /// The central body and the published constants used for it.
    pub body: BodyOut,
    /// `orbiter` or `surface`.
    pub user_kind: String,
    /// Navigation satellites in the Walker pattern (planes × satellites per plane).
    pub n_relays: usize,
    /// Relay altitude above the body's mean radius (m).
    pub relay_altitude_m: f64,
    /// Two-body period of the relay orbit, `2π·sqrt(a³/GM)` (s).
    pub relay_period_s: f64,
    /// One-sigma pseudorange noise of a relay measurement (m).
    pub sigma_relay_range_m: f64,
    /// One-sigma one-way range noise of the two-way Earth measurement (m).
    pub sigma_earth_range_m: f64,
    /// `true` when the Earth range was folded into the second fix.
    pub earth_link_used: bool,
    /// The body-to-Earth downlink at the epoch: light time, round trip, Shapiro delay, and the
    /// Sun-Earth-body angle at the Earth (small near a solar conjunction).
    pub earth_to_body: LinkOut,
    /// Figures of merit over the whole run.
    pub fom: Fom,
    /// Per-epoch rows, one every `step_s` seconds from the epoch.
    pub epochs: Vec<EpochRow>,
}

/// A circular or elliptical two-body orbit about the body, in the body's equatorial frame, with
/// the body's `J2` secular drift of the node, perigee and mean anomaly.
#[derive(Clone, Copy, Debug)]
struct EqOrbit {
    a: f64,
    e: f64,
    inc: f64,
    raan0: f64,
    argp0: f64,
    m0: f64,
    n: f64,
    raan_dot: f64,
    argp_dot: f64,
    m_dot: f64,
}

impl EqOrbit {
    fn new(body: &Body, a: f64, e: f64, inc: f64, raan0: f64, u0: f64) -> Self {
        let n = (body.mu / (a * a * a)).sqrt();
        let j2 = body.zonals.first().copied().unwrap_or(0.0);
        let p = a * (1.0 - e * e);
        let k = j2 * (body.re / p).powi(2);
        let ci = inc.cos();
        Self {
            a,
            e,
            inc,
            raan0,
            argp0: 0.0,
            m0: u0,
            n,
            raan_dot: -1.5 * n * k * ci,
            argp_dot: 0.75 * n * k * (5.0 * ci * ci - 1.0),
            m_dot: n * (1.0 + 0.75 * k * (1.0 - e * e).sqrt() * (3.0 * ci * ci - 1.0)),
        }
    }

    /// Position in the body's equatorial frame at `t` seconds after the epoch.
    fn position(&self, t: f64) -> Vec3 {
        let m = self.m0 + self.m_dot * t;
        let ecc_anom = crate::ephem::solve_kepler(m, self.e);
        let (se, ce) = ecc_anom.sin_cos();
        let x = self.a * (ce - self.e);
        let y = self.a * (1.0 - self.e * self.e).sqrt() * se;
        let (sw, cw) = (self.argp0 + self.argp_dot * t).sin_cos();
        let (so, co) = (self.raan0 + self.raan_dot * t).sin_cos();
        let (si, ci) = self.inc.sin_cos();
        [
            (cw * co - sw * so * ci) * x + (-sw * co - cw * so * ci) * y,
            (cw * so + sw * co * ci) * x + (-sw * so + cw * co * ci) * y,
            (sw * si) * x + (cw * si) * y,
        ]
    }
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// Weighted normal matrix of the rows `[−e, clock]` and its position covariance trace root.
fn formal_sigma(user: Vec3, rows: &[(Vec3, bool, f64)]) -> Option<f64> {
    let mut a = [[0.0_f64; 4]; 4];
    for (target, has_clock, sigma) in rows {
        let d = sub(*target, user);
        let r = norm(d);
        if r <= 0.0 {
            continue;
        }
        let h = [
            -d[0] / r,
            -d[1] / r,
            -d[2] / r,
            if *has_clock { 1.0 } else { 0.0 },
        ];
        let w = 1.0 / (sigma * sigma);
        for i in 0..4 {
            for j in 0..4 {
                a[i][j] += w * h[i] * h[j];
            }
        }
    }
    let q = crate::orbit::invert4(a)?;
    let tr = q[0][0] + q[1][1] + q[2][2];
    // A near-singular normal matrix inverts to garbage rather than failing: reject negative or
    // non-finite traces.
    (tr.is_finite() && tr > 0.0).then(|| tr.sqrt())
}

/// A seeded least-squares fix from `(target, has_clock, measured range)` rows, started 10 km
/// from truth; returns the position error (m).
fn fix_error(truth: Vec3, rows: &[(Vec3, bool, f64)], sigmas: &[f64]) -> Option<f64> {
    if rows.len() < 4 {
        return None;
    }
    let h = |x: &[f64]| -> Vec<f64> {
        rows.iter()
            .map(|(t, clk, _)| norm(sub([x[0], x[1], x[2]], *t)) + if *clk { x[3] } else { 0.0 })
            .collect()
    };
    let z: Vec<f64> = rows.iter().map(|r| r.2).collect();
    let w: Vec<f64> = sigmas.iter().map(|s| 1.0 / (s * s)).collect();
    let x0 = [truth[0] + 1.0e4, truth[1] - 1.0e4, truth[2] + 1.0e4, 0.0];
    let sol = crate::batch_ls::gauss_newton(h, &z, &w, &x0, 30, 1e-3)?;
    if !sol.converged {
        return None;
    }
    let e = norm(sub([sol.x[0], sol.x[1], sol.x[2]], truth));
    e.is_finite().then_some(e)
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.total_cmp(b));
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

fn rms(v: &[f64]) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    Some((v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt())
}

impl BodyPntScenario {
    /// Run and render: JSON (with a units block), a text summary and the SVG chart.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.compute()?;
        Ok((report_json(&r)?, summary(&r), to_svg(&r)))
    }

    /// Compute the report.
    pub fn compute(&self) -> Result<BodyPntReport, String> {
        let body_name = self.body.as_deref().unwrap_or("Mars");
        let body = Body::by_name(body_name).ok_or_else(|| format!("unknown body '{body_name}'"))?;
        if body.name == "Earth" || body.name == "Sun" {
            return Err(format!(
                "body-pnt navigates around a body other than the Earth with an Earth link; \
                 {} is not supported here",
                body.name
            ));
        }
        let facts = body.facts().expect("every Body::by_name body has a record");
        let radius = facts.radius_mean_m;
        let epoch = resolve_epoch(
            Some(self.epoch.as_deref().unwrap_or(DEFAULT_EPOCH)),
            self.epoch_jd_tdb,
        )?;
        let jd0 = epoch.jd_tdb;
        let eph = AnalyticSolarSystem {
            table: parse_table(self.table.as_deref())?,
        };
        let duration = self.duration_s.unwrap_or(86_400.0);
        let step = self.step_s.unwrap_or(600.0);
        if !(duration > 0.0 && step > 0.0) || duration / step > 20_000.0 {
            return Err(format!(
                "duration_s and step_s must be positive with at most 20000 epochs; got {duration} and {step}"
            ));
        }

        let user_cfg = self.user.clone().unwrap_or_default();
        let user_kind = user_cfg.kind.as_deref().unwrap_or("orbiter").to_string();
        let surface = match user_kind.as_str() {
            "orbiter" => false,
            "surface" => true,
            k => return Err(format!("user.kind must be orbiter or surface; got '{k}'")),
        };
        let user_orbit = if surface {
            None
        } else {
            let alt = user_cfg.altitude_km.unwrap_or(400.0) * 1e3;
            let e = user_cfg.eccentricity.unwrap_or(0.0);
            if !(0.0..0.9).contains(&e) || alt <= 0.0 {
                return Err("user altitude must be positive and eccentricity in [0, 0.9)".into());
            }
            let a = radius + alt;
            if a * (1.0 - e) <= radius {
                return Err("the user orbit's periapsis is below the surface".to_string());
            }
            Some(EqOrbit::new(
                &body,
                a,
                e,
                user_cfg.inclination_deg.unwrap_or(75.0) * DEG,
                user_cfg.raan_deg.unwrap_or(0.0) * DEG,
                user_cfg.u0_deg.unwrap_or(0.0) * DEG,
            ))
        };
        let lat = user_cfg.lat_deg.unwrap_or(0.0) * DEG;
        let lon = user_cfg.lon_deg.unwrap_or(0.0) * DEG;
        let r_surface = radius + user_cfg.height_m.unwrap_or(0.0);
        let user_bf = [
            r_surface * lat.cos() * lon.cos(),
            r_surface * lat.cos() * lon.sin(),
            r_surface * lat.sin(),
        ];

        let c = self.constellation.clone().unwrap_or_default();
        let planes = c.planes.unwrap_or(3);
        let per_plane = c.sats_per_plane.unwrap_or(4);
        if planes == 0 || per_plane == 0 || planes * per_plane > 200 {
            return Err("constellation needs 1 to 200 satellites in at least one plane".into());
        }
        let relay_alt = c.altitude_km.map(|k| k * 1e3).unwrap_or(3.0 * radius);
        if relay_alt <= 0.0 {
            return Err("constellation altitude must be positive".to_string());
        }
        let relay_a = radius + relay_alt;
        let relay_inc = c.inclination_deg.unwrap_or(60.0) * DEG;
        let f = c.phasing_f.unwrap_or(1.0);
        let sigma_relay = c.sigma_range_m.unwrap_or(1.0);
        let mask = c.mask_deg.unwrap_or(10.0) * DEG;
        let total = planes * per_plane;
        let mut relays = Vec::with_capacity(total);
        for p in 0..planes {
            for s in 0..per_plane {
                let raan = 2.0 * std::f64::consts::PI * p as f64 / planes as f64;
                let u = 2.0
                    * std::f64::consts::PI
                    * (s as f64 / per_plane as f64 + f * p as f64 / total as f64);
                relays.push(EqOrbit::new(&body, relay_a, 0.0, relay_inc, raan, u));
            }
        }

        let el = self.earth_link.clone().unwrap_or_default();
        let earth_used = el.enabled.unwrap_or(true);
        let sigma_earth = el.sigma_range_m.unwrap_or(1.0);
        if !(sigma_relay > 0.0 && sigma_earth > 0.0) {
            return Err("range sigmas must be positive".to_string());
        }
        let earth_to_body = link(&eph, &body, &Body::earth(), jd0)?;

        // The body's equatorial frame: the body-fixed frame with the prime meridian frozen at 0.
        let mut eq_frame = body.clone();
        eq_frame.prime_w0 = 0.0;
        eq_frame.prime_w_dot = 0.0;
        eq_frame.iau_terms = eq_frame
            .iau_terms
            .map(crate::body::IauRotationTerms::without_prime_meridian);

        let mut rng = ChaCha8Rng::seed_from_u64(self.seed.unwrap_or(1));
        let n_relay = Normal::new(0.0, sigma_relay).map_err(|e| e.to_string())?;
        let n_earth = Normal::new(0.0, sigma_earth).map_err(|e| e.to_string())?;
        let clock_bias_m = 1.0e3;

        let n_epochs = (duration / step).floor() as usize + 1;
        let mut epochs = Vec::with_capacity(n_epochs);
        for k in 0..n_epochs {
            let t = k as f64 * step;
            let jd = jd0 + t / 86_400.0;
            let user = match &user_orbit {
                Some(o) => bodyfixed_to_inertial(o.position(t), &eq_frame, jd),
                None => bodyfixed_to_inertial(user_bf, &body, jd),
            };
            let earth = eph
                .relative_position(&Body::earth(), &body, jd)
                .ok_or_else(|| format!("no Earth position relative to {} at JD {jd}", body.name))?;
            let up = {
                let r = norm(user);
                [user[0] / r, user[1] / r, user[2] / r]
            };
            let sees = |target: Vec3| -> bool {
                // A surface user sits on the sphere; test the chord from just above it.
                let from = if surface {
                    [user[0] + up[0], user[1] + up[1], user[2] + up[2]]
                } else {
                    user
                };
                if !chord_clears_sphere(from, target, radius) {
                    return false;
                }
                if surface {
                    let d = sub(target, user);
                    let sin_el = dot(d, up) / norm(d);
                    return sin_el >= mask.sin();
                }
                true
            };
            let visible: Vec<Vec3> = relays
                .iter()
                .map(|o| bodyfixed_to_inertial(o.position(t), &eq_frame, jd))
                .filter(|s| sees(*s))
                .collect();
            let earth_visible = sees(earth);

            let dop = crate::orbit::dop(user, &visible);
            let relay_rows: Vec<(Vec3, bool, f64)> =
                visible.iter().map(|s| (*s, true, sigma_relay)).collect();
            let formal_relays = if visible.len() >= 4 {
                formal_sigma(user, &relay_rows)
            } else {
                None
            };
            let mut all_rows = relay_rows.clone();
            if earth_used && earth_visible {
                all_rows.push((earth, false, sigma_earth));
            }
            let formal_all = if all_rows.len() >= 4 {
                formal_sigma(user, &all_rows)
            } else {
                None
            };

            // Seeded measurements: one draw per visible relay, then the Earth row.
            let meas_relays: Vec<(Vec3, bool, f64)> = visible
                .iter()
                .map(|s| {
                    (
                        *s,
                        true,
                        norm(sub(user, *s)) + clock_bias_m + n_relay.sample(&mut rng),
                    )
                })
                .collect();
            let mut meas_all = meas_relays.clone();
            let mut sig_all = vec![sigma_relay; meas_relays.len()];
            if earth_used && earth_visible {
                meas_all.push((
                    earth,
                    false,
                    norm(sub(user, earth)) + n_earth.sample(&mut rng),
                ));
                sig_all.push(sigma_earth);
            }
            let err_relays = if formal_relays.is_some() {
                fix_error(user, &meas_relays, &vec![sigma_relay; meas_relays.len()])
            } else {
                None
            };
            let err_all = if formal_all.is_some() {
                fix_error(user, &meas_all, &sig_all)
            } else {
                None
            };

            epochs.push(EpochRow {
                t_s: t,
                n_relays_visible: visible.len(),
                earth_visible,
                gdop: dop.map(|d| d.gdop),
                pdop: dop.map(|d| d.pdop),
                formal_sigma_relays_m: formal_relays,
                formal_sigma_with_earth_m: formal_all,
                error_relays_m: err_relays,
                error_with_earth_m: err_all,
                user_radius_m: norm(user),
                earth_range_m: norm(sub(user, earth)),
            });
        }

        let n = epochs.len() as f64;
        let err_r: Vec<f64> = epochs.iter().filter_map(|e| e.error_relays_m).collect();
        let err_a: Vec<f64> = epochs.iter().filter_map(|e| e.error_with_earth_m).collect();
        let norm_r: Vec<f64> = epochs
            .iter()
            .filter_map(|e| Some(e.error_relays_m? / e.formal_sigma_relays_m?))
            .collect();
        let norm_a: Vec<f64> = epochs
            .iter()
            .filter_map(|e| Some(e.error_with_earth_m? / e.formal_sigma_with_earth_m?))
            .collect();
        let fom = Fom {
            n_epochs: epochs.len(),
            availability_relays: err_r.len() as f64 / n,
            availability_with_earth: err_a.len() as f64 / n,
            earth_visibility: epochs.iter().filter(|e| e.earth_visible).count() as f64 / n,
            mean_relays_visible: epochs
                .iter()
                .map(|e| e.n_relays_visible as f64)
                .sum::<f64>()
                / n,
            median_pdop: median(epochs.iter().filter_map(|e| e.pdop).collect()),
            rms_error_relays_m: rms(&err_r),
            rms_error_with_earth_m: rms(&err_a),
            median_formal_sigma_relays_m: median(
                epochs
                    .iter()
                    .filter_map(|e| e.formal_sigma_relays_m)
                    .collect(),
            ),
            median_formal_sigma_with_earth_m: median(
                epochs
                    .iter()
                    .filter_map(|e| e.formal_sigma_with_earth_m)
                    .collect(),
            ),
            rms_normalised_error_relays: rms(&norm_r),
            rms_normalised_error_with_earth: rms(&norm_a),
        };

        Ok(BodyPntReport {
            label: "MODELLED: two-body relay orbits with J2 secular drift, geometric visibility, \
                    Gaussian range noise and an instantaneous measurement model around a body \
                    from the published constants; not validated against a mission's navigation \
                    data. The Earth-to-body geometry inherits the solar-system ephemeris labels."
                .to_string(),
            epoch,
            body: BodyOut {
                name: body.name.to_string(),
                gm_m3_s2: body.mu,
                radius_mean_m: radius,
                j2: facts.j2.map(|j| j.0),
                j2_reference_radius_m: facts.j2.map(|j| j.1),
                sidereal_rotation_period_h: 2.0 * std::f64::consts::PI / body.prime_w_dot * 24.0,
            },
            user_kind,
            n_relays: total,
            relay_altitude_m: relay_alt,
            relay_period_s: 2.0 * std::f64::consts::PI / relays[0].n,
            sigma_relay_range_m: sigma_relay,
            sigma_earth_range_m: sigma_earth,
            earth_link_used: earth_used,
            earth_to_body,
            fom,
            epochs,
        })
    }
}

/// Units and provenance for every numeric leaf. See [`crate::field_schema`].
const UNITS: &[(&str, &str, &str, &str)] = &[
    ("epoch.jd_tdb", "day", "input", "scenario epoch as a Julian date in Barycentric Dynamical Time (TDB)"),
    ("body.gm_m3_s2", "m^3/s^2", "published", "central body's gravitational parameter GM, cited in body.rs"),
    ("body.radius_mean_m", "m", "published", "central body's mean radius: the occultation sphere and the surface"),
    ("body.j2", "1", "published", "central body's unnormalised J2 where one is carried; drives the relay and user secular drift"),
    ("body.j2_reference_radius_m", "m", "published", "the radius the J2 value is referenced to"),
    ("body.sidereal_rotation_period_h", "h", "derived", "360 degrees over the IAU prime-meridian rate; negative for retrograde rotation"),
    ("n_relays", "count", "input", "navigation satellites in the Walker pattern"),
    ("relay_altitude_m", "m", "input", "relay altitude above the mean radius"),
    ("relay_period_s", "s", "closed-form", "two-body period of the relay orbit, 2 pi sqrt(a^3/GM)"),
    ("sigma_relay_range_m", "m", "modelled-input", "one-sigma pseudorange noise of a relay measurement"),
    ("sigma_earth_range_m", "m", "modelled-input", "one-sigma one-way range noise of the two-way Earth measurement"),
    ("earth_to_body.geometric_distance_m", "m", "computed", "Earth-to-body distance at the epoch"),
    ("earth_to_body.one_way_light_time_s", "s", "computed", "Newtonian light time from the body (retarded) to the Earth at the epoch"),
    ("earth_to_body.one_way_range_m", "m", "computed", "speed of light times the one-way light time"),
    ("earth_to_body.two_way_range_m", "m", "computed", "round-trip path length received at the epoch"),
    ("earth_to_body.two_way_light_time_s", "s", "computed", "round-trip light time"),
    ("earth_to_body.shapiro_delay_s", "s", "closed-form", "the Sun's one-way Shapiro delay on the Earth-to-body path"),
    ("earth_to_body.sun_separation_deg", "deg", "computed", "Sun-Earth-body angle at the Earth; small near a solar conjunction, where plasma and Shapiro delay grow"),
    ("fom.n_epochs", "count", "computed", "epochs in the run"),
    ("fom.availability_relays", "1", "computed", "fraction of epochs with a converged constellation-only fix (at least four relays)"),
    ("fom.availability_with_earth", "1", "computed", "fraction of epochs with a converged fix once the Earth range is added"),
    ("fom.earth_visibility", "1", "computed", "fraction of epochs the Earth is above the body's limb for the user"),
    ("fom.mean_relays_visible", "count", "computed", "mean number of relays in view"),
    ("fom.median_pdop", "1", "computed", "median constellation-only position dilution of precision over epochs with four or more relays"),
    ("fom.rms_error_relays_m", "m", "computed", "root-mean-square position error of the seeded constellation-only fixes"),
    ("fom.rms_error_with_earth_m", "m", "computed", "root-mean-square position error of the seeded fixes with the Earth range"),
    ("fom.median_formal_sigma_relays_m", "m", "computed", "median formal one-sigma position uncertainty, constellation only"),
    ("fom.median_formal_sigma_with_earth_m", "m", "computed", "median formal one-sigma position uncertainty with the Earth range"),
    ("fom.rms_normalised_error_relays", "1", "computed", "root-mean-square of fix error over formal sigma, constellation only; near 1 when noise and covariance agree"),
    ("fom.rms_normalised_error_with_earth", "1", "computed", "root-mean-square of fix error over formal sigma with the Earth range"),
    ("epochs[].t_s", "s", "computed", "seconds after the epoch"),
    ("epochs[].n_relays_visible", "count", "computed", "relays whose line of sight clears the body (and the mask, for a surface user)"),
    ("epochs[].gdop", "1", "computed", "constellation-only geometric dilution of precision"),
    ("epochs[].pdop", "1", "computed", "constellation-only position dilution of precision"),
    ("epochs[].formal_sigma_relays_m", "m", "computed", "formal one-sigma position uncertainty from the weighted relay geometry"),
    ("epochs[].formal_sigma_with_earth_m", "m", "computed", "formal one-sigma position uncertainty with the clock-free Earth row added"),
    ("epochs[].error_relays_m", "m", "computed", "position error of the seeded Gauss-Newton fix, constellation only"),
    ("epochs[].error_with_earth_m", "m", "computed", "position error of the seeded Gauss-Newton fix with the Earth range"),
    ("epochs[].user_radius_m", "m", "computed", "user distance from the body's centre"),
    ("epochs[].earth_range_m", "m", "computed", "geometric Earth-to-user range"),
];

fn report_json(r: &BodyPntReport) -> Result<String, String> {
    let mut doc = serde_json::to_value(r).map_err(|e| format!("serialising report: {e}"))?;
    match doc.as_object_mut() {
        Some(o) => {
            o.insert("units".into(), crate::solar_system::units_block_from(UNITS));
        }
        None => return Err("the report must serialise to a JSON object".to_string()),
    }
    serde_json::to_string_pretty(&doc).map_err(|e| format!("serialising report: {e}"))
}

fn opt(v: Option<f64>, scale: f64, unit: &str) -> String {
    v.map(|x| format!("{:.3} {unit}", x * scale))
        .unwrap_or_else(|| "n/a".to_string())
}

/// The text summary.
pub fn summary(r: &BodyPntReport) -> String {
    format!(
        "Positioning around {} — {} user, {} relays at {:.0} km, {} epochs\n  \
         Earth light time {:.1} s one-way, {:.1} s round trip; Sun-Earth-body angle {:.1} deg\n  \
         availability: {:.3} constellation only, {:.3} with the Earth range (Earth in view {:.3})\n  \
         median PDOP {}; RMS error {} constellation only, {} with the Earth range\n  \
         median formal sigma {} constellation only, {} with the Earth range\n",
        r.body.name,
        r.user_kind,
        r.n_relays,
        r.relay_altitude_m / 1e3,
        r.fom.n_epochs,
        r.earth_to_body.one_way_light_time_s,
        r.earth_to_body.two_way_light_time_s,
        r.earth_to_body.sun_separation_deg,
        r.fom.availability_relays,
        r.fom.availability_with_earth,
        r.fom.earth_visibility,
        opt(r.fom.median_pdop, 1.0, ""),
        opt(r.fom.rms_error_relays_m, 1.0, "m"),
        opt(r.fom.rms_error_with_earth_m, 1.0, "m"),
        opt(r.fom.median_formal_sigma_relays_m, 1.0, "m"),
        opt(r.fom.median_formal_sigma_with_earth_m, 1.0, "m"),
    )
}

/// Two panels over time: relays in view (bars) and the formal one-sigma position uncertainty
/// with and without the Earth range.
pub fn to_svg(r: &BodyPntReport) -> String {
    let (w, h) = (900.0, 480.0);
    let mut s = crate::chart::frame_open(
        w,
        h,
        &format!("Positioning around {}", r.body.name),
        &format!(
            "{} user · {} relays · Earth light time {:.1} s · MODELLED",
            r.user_kind, r.n_relays, r.earth_to_body.one_way_light_time_s
        ),
    );
    let (ml, pw) = (70.0, 800.0);
    let t_max = r.epochs.last().map(|e| e.t_s).unwrap_or(1.0).max(1.0);
    let x = |t: f64| ml + pw * t / t_max;
    // Panel 1: relays in view.
    let (top1, ph1) = (70.0, 150.0);
    let n_max = r.n_relays.max(1) as f64;
    s.push_str(&crate::chart::panel_axes(
        ml,
        top1,
        pw,
        top1 + ph1,
        "relays in view",
    ));
    s.push_str(&crate::chart::y_axis(ml, top1, pw, ph1, n_max, "count"));
    let bw = (pw / r.epochs.len().max(1) as f64).max(1.0);
    for e in &r.epochs {
        let hgt = ph1 * e.n_relays_visible as f64 / n_max;
        s.push_str(&format!(
            "<rect x=\"{:.1}\" y=\"{:.1}\" width=\"{bw:.1}\" height=\"{hgt:.1}\" fill=\"{BLUE}\"/>",
            x(e.t_s),
            top1 + ph1 - hgt
        ));
    }
    // Panel 2: formal sigma, log10 scale.
    let (top2, ph2) = (280.0, 160.0);
    s.push_str(&crate::chart::panel_axes(
        ml,
        top2,
        pw,
        top2 + ph2,
        "formal one-sigma position (log10 m): blue constellation only, amber with the Earth range",
    ));
    let logs: Vec<f64> = r
        .epochs
        .iter()
        .flat_map(|e| [e.formal_sigma_relays_m, e.formal_sigma_with_earth_m])
        .flatten()
        .filter(|v| *v > 0.0)
        .map(f64::log10)
        .collect();
    let lo = logs
        .iter()
        .copied()
        .fold(f64::MAX, f64::min)
        .min(0.0)
        .floor();
    let hi = logs
        .iter()
        .copied()
        .fold(f64::MIN, f64::max)
        .max(lo + 1.0)
        .ceil();
    let y = |v: f64| top2 + ph2 - ph2 * (v.log10() - lo) / (hi - lo);
    for (sel, colour) in [(0, BLUE), (1, CYAN)] {
        let pts: Vec<String> = r
            .epochs
            .iter()
            .filter_map(|e| {
                let v = if sel == 0 {
                    e.formal_sigma_relays_m
                } else {
                    e.formal_sigma_with_earth_m
                }?;
                (v > 0.0).then(|| format!("{:.1},{:.1}", x(e.t_s), y(v)))
            })
            .collect();
        for p in pts {
            let (px, py) = p.split_once(',').unwrap_or(("0", "0"));
            s.push_str(&format!(
                "<circle cx=\"{px}\" cy=\"{py}\" r=\"1.6\" fill=\"{colour}\"/>"
            ));
        }
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"10\" fill=\"{MUTED}\">10^{lo:.0} m</text>\
         <text x=\"{:.0}\" y=\"{:.0}\" font-size=\"10\" fill=\"{MUTED}\">10^{hi:.0} m</text>",
        ml - 60.0,
        top2 + ph2,
        ml - 60.0,
        top2 + 10.0
    ));
    s.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"470\" font-size=\"10\" fill=\"{MUTED}\">time since epoch, 0 to {:.0} s</text></svg>",
        t_max
    ));
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    fn run(src: &str) -> BodyPntReport {
        let scn: BodyPntScenario = toml::from_str(src).expect("toml");
        scn.compute().expect("compute")
    }

    #[test]
    fn defaults_run_around_mars_and_every_number_has_a_unit() {
        let (json, _, svg) = BodyPntScenario::default().run_output().unwrap();
        let doc: serde_json::Value = serde_json::from_str(&json).unwrap();
        let audit = crate::field_schema::audit_document(&doc);
        assert!(
            audit.is_complete(),
            "missing {:?} malformed {:?}",
            audit.missing,
            audit.malformed
        );
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        assert_eq!(doc["body"]["name"], "Mars");
    }

    #[test]
    fn relay_period_is_keplers_third_law_for_the_body() {
        let r =
            run("kind = \"body-pnt\"\nbody = \"Europa\"\n[constellation]\naltitude_km = 1000.0\n");
        let a = r.body.radius_mean_m + 1.0e6;
        let want = 2.0 * std::f64::consts::PI * (a * a * a / r.body.gm_m3_s2).sqrt();
        assert!((r.relay_period_s - want).abs() < 1e-6 * want);
    }

    #[test]
    fn an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface() {
        let r = run("kind = \"body-pnt\"\nduration_s = 7200.0\n[user]\naltitude_km = 300.0\n");
        for e in &r.epochs {
            assert!((e.user_radius_m - (r.body.radius_mean_m + 3.0e5)).abs() < 1.0);
        }
        let s = run(
            "kind = \"body-pnt\"\nbody = \"Ganymede\"\nduration_s = 3600.0\n[user]\nkind = \"surface\"\nlat_deg = 20.0\n",
        );
        for e in &s.epochs {
            assert!((e.user_radius_m - s.body.radius_mean_m).abs() < 1e-3);
        }
    }

    #[test]
    fn the_earth_range_never_worsens_the_formal_uncertainty() {
        let r = run("kind = \"body-pnt\"\nduration_s = 43200.0\n");
        for e in &r.epochs {
            if let (Some(a), Some(b)) = (e.formal_sigma_relays_m, e.formal_sigma_with_earth_m) {
                assert!(b <= a * (1.0 + 1e-9), "t {}: {b} > {a}", e.t_s);
            }
        }
        assert!(r.fom.availability_with_earth >= r.fom.availability_relays);
    }

    #[test]
    fn seeded_fix_errors_are_consistent_with_the_formal_sigma() {
        // Each fix error over its own formal sigma: for a three-dimensional Gaussian error with
        // covariance Q, E[|e|^2] = trace(Q), so the root-mean-square ratio is near 1. Over a day
        // of epochs it must land in [0.6, 1.5], each way.
        let r = run("kind = \"body-pnt\"\n");
        for v in [
            r.fom.rms_normalised_error_relays.expect("fixes"),
            r.fom.rms_normalised_error_with_earth.expect("fixes"),
        ] {
            assert!((0.6..1.5).contains(&v), "normalised RMS {v}");
        }
        assert!(
            r.fom.availability_relays > 0.9,
            "{}",
            r.fom.availability_relays
        );
    }

    #[test]
    fn earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic() {
        let a = run("kind = \"body-pnt\"\nduration_s = 3600.0\n");
        let b = run("kind = \"body-pnt\"\nduration_s = 3600.0\n");
        assert!((180.0..1400.0).contains(&a.earth_to_body.one_way_light_time_s));
        assert_eq!(
            serde_json::to_string(&a).unwrap(),
            serde_json::to_string(&b).unwrap()
        );
    }

    #[test]
    fn bad_inputs_are_rejected() {
        for bad in [
            "kind = \"body-pnt\"\nbody = \"Earth\"\n",
            "kind = \"body-pnt\"\nbody = \"Vulcan\"\n",
            "kind = \"body-pnt\"\n[user]\nkind = \"balloon\"\n",
            "kind = \"body-pnt\"\nstep_s = 0.0\n",
            "kind = \"body-pnt\"\n[constellation]\nplanes = 0\n",
            "kind = \"body-pnt\"\n[user]\naltitude_km = 100.0\neccentricity = 0.5\n",
        ] {
            let scn: BodyPntScenario = toml::from_str(bad).unwrap();
            assert!(scn.compute().is_err(), "{bad}");
        }
    }
}
