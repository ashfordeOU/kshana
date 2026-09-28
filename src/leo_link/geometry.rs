// SPDX-License-Identifier: AGPL-3.0-only
//! Satellite and user kinematics, look angles, range rate and Doppler for a LEO (low Earth
//! orbit) or MEO (medium Earth orbit) link.
//!
//! ## Frames
//!
//! Every state is expressed in **ECI0**, the inertial frame whose axes coincide with the
//! Earth-fixed (ECEF) frame at the scenario epoch `t = 0`; ECEF at time `t` is ECI0 turned by
//! `ω⊕·t` about the pole. That is the frame convention of [`crate::constellation`], so a
//! Walker shell or a published GNSS preset built there drops straight in: its node longitude
//! at the epoch is its ECI0 node. A TLE (two-line element set) satellite is propagated by the
//! engine's SGP4 ([`crate::sgp4`]) in TEME, turned to ECEF by the Greenwich mean sidereal time
//! ([`crate::frames::teme_to_ecef`]) and from there to ECI0.
//!
//! ## Range rate, Doppler and Doppler rate
//!
//! With `d = r_sat − r_user`, `ρ = |d|` and `Δv`, `Δa` the relative velocity and acceleration,
//!
//! ```text
//!   ρ̇ = d·Δv/ρ,        ρ̈ = (|Δv|² − ρ̇² + d·Δa)/ρ,
//!   f_D = −f·ρ̇/c,      ḟ_D = −f·ρ̈/c
//! ```
//!
//! (first-order, non-relativistic). The satellite acceleration is the two-body term plus the
//! Earth's `J2` term when the orbit carries `J2`; the user acceleration is the centripetal and
//! Coriolis terms of the Earth's rotation, neglecting the user's own manoeuvres. Every report
//! checks both closed forms against central differences of the propagated range, and states
//! the largest difference.
//!
//! ## Pass design and the Doppler envelope
//!
//! [`design_pass`] places a circular orbit so that a user sees one pass with a chosen maximum
//! elevation at a chosen time. [`max_static_user_range_rate`] searches the whole visibility
//! region of a circular orbit for the largest range rate a static user on a spherical Earth
//! can see, the quantity Leclère, Marathe and Reid tabulate for Pulsar and GPS (arXiv
//! 2509.19551, Table 1).

use super::{C_M_S, J2_EARTH, MU_EARTH, OMEGA_EARTH, RE_EARTH};
use crate::constellation::Elements;
use crate::frames::{geodetic_to_ecef, look_angles, teme_to_ecef, Geodetic};
use std::f64::consts::{PI, TAU};

/// A 3-vector (m, m/s or m/s²).
pub type Vec3 = [f64; 3];

fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn scale(a: Vec3, k: f64) -> Vec3 {
    [a[0] * k, a[1] * k, a[2] * k]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// Turn an ECI0 vector into ECEF at `t` seconds after the epoch.
pub fn eci0_to_ecef(v: Vec3, t: f64) -> Vec3 {
    let (s, c) = (OMEGA_EARTH * t).sin_cos();
    [c * v[0] + s * v[1], -s * v[0] + c * v[1], v[2]]
}

/// Turn an ECEF vector into ECI0 at `t` seconds after the epoch.
pub fn ecef_to_eci0(v: Vec3, t: f64) -> Vec3 {
    let (s, c) = (OMEGA_EARTH * t).sin_cos();
    [c * v[0] - s * v[1], s * v[0] + c * v[1], v[2]]
}

/// Position, velocity and acceleration in ECI0.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Kinematics {
    /// Position (m).
    pub r: Vec3,
    /// Velocity (m/s).
    pub v: Vec3,
    /// Acceleration (m/s²).
    pub a: Vec3,
}

/// Point-mass plus (optionally) `J2` gravitational acceleration at `r` (m/s²), in any
/// Earth-centred frame whose z axis is the pole.
pub fn gravity_accel(r: Vec3, with_j2: bool) -> Vec3 {
    let rn = norm(r);
    let mut a = scale(r, -MU_EARTH / rn.powi(3));
    if with_j2 {
        let z2 = (r[2] / rn).powi(2);
        let k = -1.5 * J2_EARTH * MU_EARTH * RE_EARTH * RE_EARTH / rn.powi(5);
        a[0] += k * r[0] * (1.0 - 5.0 * z2);
        a[1] += k * r[1] * (1.0 - 5.0 * z2);
        a[2] += k * r[2] * (3.0 - 5.0 * z2);
    }
    a
}

/// How a satellite moves.
#[derive(Clone, Debug)]
pub enum SatMotion {
    /// Keplerian elements in ECI0 (see [`crate::constellation`]), with the secular `J2` drift of
    /// the node and perigee when `j2` is set.
    Kepler {
        /// The element set at the epoch.
        el: Elements,
        /// Mean motion (rad/s).
        n: f64,
        /// Node rate (rad/s).
        raan_dot: f64,
        /// Perigee rate (rad/s).
        argp_dot: f64,
        /// Whether `J2` enters the drift and the acceleration.
        j2: bool,
    },
    /// SGP4 from a TLE.
    Sgp4 {
        /// The initialised propagator.
        prop: Box<crate::sgp4::Sgp4>,
        /// Minutes from the TLE epoch to the scenario epoch.
        tsince0_min: f64,
        /// Scenario epoch as a UTC Julian date (used as UT1 for the sidereal angle).
        jd0: f64,
    },
}

impl SatMotion {
    /// A Keplerian satellite from an element set (constellation-design convention).
    pub fn kepler(el: Elements, j2: bool) -> Self {
        let n = (MU_EARTH / el.a_m.powi(3)).sqrt();
        let (mut raan_dot, mut argp_dot) = (0.0, 0.0);
        if j2 {
            let p = el.a_m * (1.0 - el.e * el.e);
            let f = n * J2_EARTH * (RE_EARTH / p).powi(2);
            let ci = el.i_rad.cos();
            raan_dot = -1.5 * f * ci;
            argp_dot = 0.75 * f * (5.0 * ci * ci - 1.0);
        }
        SatMotion::Kepler {
            el,
            n,
            raan_dot,
            argp_dot,
            j2,
        }
    }

    /// An SGP4 satellite from TLE lines, the scenario epoch given as a UTC Julian date.
    pub fn from_tle(line1: &str, line2: &str, jd0_utc: f64) -> Result<Self, String> {
        let tle = crate::tle::parse_tle(line1, line2)?;
        let prop = tle.to_sgp4(crate::sgp4::wgs72(), false);
        let jd_tle = 2_433_281.5 + tle.epoch_days_1950;
        Ok(SatMotion::Sgp4 {
            prop: Box::new(prop),
            tsince0_min: (jd0_utc - jd_tle) * 1440.0,
            jd0: jd0_utc,
        })
    }

    /// Whether the acceleration includes `J2`.
    pub fn has_j2(&self) -> bool {
        match self {
            SatMotion::Kepler { j2, .. } => *j2,
            SatMotion::Sgp4 { .. } => true,
        }
    }

    /// State in ECI0 at `t` seconds after the epoch.
    pub fn state(&self, t: f64) -> Result<Kinematics, String> {
        match self {
            SatMotion::Kepler {
                el,
                n,
                raan_dot,
                argp_dot,
                j2,
            } => {
                let m = el.m0_rad + n * t;
                let ea = crate::ephem::solve_kepler(m, el.e);
                let (se, ce) = ea.sin_cos();
                let e = el.e;
                let b = (1.0 - e * e).sqrt();
                // Perifocal position and its time derivative along the Keplerian ellipse.
                let x = el.a_m * (ce - e);
                let y = el.a_m * b * se;
                let edot = n / (1.0 - e * ce);
                let vx = -el.a_m * se * edot;
                let vy = el.a_m * b * ce * edot;
                let w = el.argp_rad + argp_dot * t;
                let o = el.raan_rad + raan_dot * t;
                let (sw, cw) = w.sin_cos();
                let (so, co) = o.sin_cos();
                let (si, ci) = el.i_rad.sin_cos();
                let p = [cw * co - sw * so * ci, cw * so + sw * co * ci, sw * si];
                let q = [-sw * co - cw * so * ci, -sw * so + cw * co * ci, cw * si];
                let r = add(scale(p, x), scale(q, y));
                let h = [so * si, -co * si, ci];
                let v = add(
                    add(scale(p, vx), scale(q, vy)),
                    add(
                        scale(cross([0.0, 0.0, 1.0], r), *raan_dot),
                        scale(cross(h, r), *argp_dot),
                    ),
                );
                Ok(Kinematics {
                    r,
                    v,
                    a: gravity_accel(r, *j2),
                })
            }
            SatMotion::Sgp4 {
                prop,
                tsince0_min,
                jd0,
            } => {
                let (rk, vk) = prop
                    .propagate(tsince0_min + t / 60.0)
                    .map_err(|code| format!("SGP4 error code {code} at t = {t} s"))?;
                let jd = jd0 + t / 86_400.0;
                let r_teme = scale(rk, 1e3);
                let v_teme = scale(vk, 1e3);
                let r_ecef = teme_to_ecef(r_teme, jd);
                // Rotating the velocity by the same angle gives the inertial velocity expressed
                // on the Earth-fixed axes; the ECI0 turn below keeps it inertial.
                let v_rot = teme_to_ecef(v_teme, jd);
                let r = ecef_to_eci0(r_ecef, t);
                let v = ecef_to_eci0(v_rot, t);
                Ok(Kinematics {
                    r,
                    v,
                    a: gravity_accel(r, true),
                })
            }
        }
    }
}

/// A user on or above the WGS-84 ellipsoid, static or moving at a constant ground speed and
/// heading at constant height.
#[derive(Clone, Copy, Debug)]
pub struct UserMotion {
    /// Geodetic position at the epoch.
    pub start: Geodetic,
    /// Ground speed (m/s).
    pub speed_m_s: f64,
    /// Heading clockwise from north (rad).
    pub heading_rad: f64,
}

/// The user at one instant: geodetic position and ECI0 kinematics.
#[derive(Clone, Copy, Debug)]
pub struct UserState {
    /// Geodetic position.
    pub geo: Geodetic,
    /// ECEF position (m).
    pub r_ecef: Vec3,
    /// ECI0 kinematics.
    pub kin: Kinematics,
}

impl UserMotion {
    /// State at `t` seconds after the epoch. The track follows the local east and north
    /// directions on a sphere of the local radius (adequate over a pass of minutes); the
    /// acceleration is the Earth-rotation part only.
    pub fn state(&self, t: f64) -> UserState {
        let (sh, ch) = self.heading_rad.sin_cos();
        let vn = self.speed_m_s * ch;
        let ve = self.speed_m_s * sh;
        let rloc = RE_EARTH + self.start.alt_m;
        let lat = self.start.lat_rad + vn * t / rloc;
        let lon = self.start.lon_rad + ve * t / (rloc * lat.cos().max(1e-6));
        let geo = Geodetic {
            lat_rad: lat,
            lon_rad: lon,
            alt_m: self.start.alt_m,
        };
        let r_ecef = geodetic_to_ecef(geo);
        let (sl, cl) = lat.sin_cos();
        let (so, co) = lon.sin_cos();
        let east = [-so, co, 0.0];
        let north = [-sl * co, -sl * so, cl];
        let v_ecef = add(scale(east, ve), scale(north, vn));
        let w = [0.0, 0.0, OMEGA_EARTH];
        let v_in = add(v_ecef, cross(w, r_ecef));
        let a_in = add(cross(w, cross(w, r_ecef)), scale(cross(w, v_ecef), 2.0));
        UserState {
            geo,
            r_ecef,
            kin: Kinematics {
                r: ecef_to_eci0(r_ecef, t),
                v: ecef_to_eci0(v_in, t),
                a: ecef_to_eci0(a_in, t),
            },
        }
    }
}

/// Link geometry at one instant.
#[derive(Clone, Copy, Debug)]
pub struct LinkGeometry {
    /// Azimuth clockwise from true north (deg).
    pub az_deg: f64,
    /// Geodetic elevation (deg).
    pub el_deg: f64,
    /// Slant range (m).
    pub range_m: f64,
    /// Range rate (m/s), positive when receding.
    pub range_rate_m_s: f64,
    /// Range acceleration (m/s²).
    pub range_accel_m_s2: f64,
    /// Nadir angle at the satellite toward the user (rad).
    pub nadir_angle_rad: f64,
    /// Satellite geocentric radius (m).
    pub sat_radius_m: f64,
}

/// Range rate and range acceleration from relative kinematics (closed forms of the module
/// documentation).
pub fn range_rate_and_accel(sat: &Kinematics, user: &Kinematics) -> (f64, f64, f64) {
    let d = sub(sat.r, user.r);
    let dv = sub(sat.v, user.v);
    let da = sub(sat.a, user.a);
    let rho = norm(d);
    let rdot = dot(d, dv) / rho;
    let rddot = (dot(dv, dv) - rdot * rdot + dot(d, da)) / rho;
    (rho, rdot, rddot)
}

/// Geometry between a satellite state and a user state at `t`.
pub fn link_geometry(sat: &Kinematics, user: &UserState, t: f64) -> LinkGeometry {
    let sat_ecef = eci0_to_ecef(sat.r, t);
    let la = look_angles(user.geo, sat_ecef);
    let (rho, rdot, rddot) = range_rate_and_accel(sat, &user.kin);
    let to_user = sub(user.kin.r, sat.r);
    let to_centre = scale(sat.r, -1.0);
    let c = dot(to_user, to_centre) / (norm(to_user) * norm(to_centre));
    LinkGeometry {
        az_deg: la.az_rad.to_degrees(),
        el_deg: la.el_rad.to_degrees(),
        range_m: rho,
        range_rate_m_s: rdot,
        range_accel_m_s2: rddot,
        nadir_angle_rad: c.clamp(-1.0, 1.0).acos(),
        sat_radius_m: norm(sat.r),
    }
}

/// Carrier Doppler shift (Hz) at carrier `f_hz` for range rate `range_rate_m_s`.
pub fn doppler_hz(f_hz: f64, range_rate_m_s: f64) -> f64 {
    -f_hz * range_rate_m_s / C_M_S
}

/// Carrier Doppler rate (Hz/s) at carrier `f_hz` for range acceleration `range_accel_m_s2`.
pub fn doppler_rate_hz_s(f_hz: f64, range_accel_m_s2: f64) -> f64 {
    -f_hz * range_accel_m_s2 / C_M_S
}

/// Central-difference check of the closed forms at `t`: returns
/// `(|ρ̇ − ρ̇_num|, |ρ̈ − ρ̈_num|)` with step `h` seconds.
pub fn numerical_check(
    sat: &SatMotion,
    user: &UserMotion,
    t: f64,
    h: f64,
) -> Result<(f64, f64), String> {
    let range = |tt: f64| -> Result<(f64, f64), String> {
        let s = sat.state(tt)?;
        let u = user.state(tt);
        let (rho, rdot, _) = range_rate_and_accel(&s, &u.kin);
        Ok((rho, rdot))
    };
    let (_, rdot0) = range(t)?;
    let s0 = sat.state(t)?;
    let (_, _, rddot0) = range_rate_and_accel(&s0, &user.state(t).kin);
    let (rp, rdp) = range(t + h)?;
    let (rm, rdm) = range(t - h)?;
    let rdot_num = (rp - rm) / (2.0 * h);
    let rddot_num = (rdp - rdm) / (2.0 * h);
    Ok(((rdot0 - rdot_num).abs(), (rddot0 - rddot_num).abs()))
}

/// Inclination (rad) of a sun-synchronous circular orbit at altitude `alt_m` above the
/// equatorial radius: the node must advance 360° per tropical year,
/// `cos i = −Ω̇_ss / (1.5·n·J2·(Re/a)²)`. `None` above the altitude where no inclination works.
pub fn sun_synchronous_inclination_rad(alt_m: f64) -> Option<f64> {
    let a = RE_EARTH + alt_m;
    let n = (MU_EARTH / a.powi(3)).sqrt();
    let omega_ss = TAU / (365.242_19 * 86_400.0);
    let c = -omega_ss / (1.5 * n * J2_EARTH * (RE_EARTH / a).powi(2));
    (c.abs() <= 1.0).then(|| c.acos())
}

/// Geocentric latitude and longitude (rad) of an ECEF position.
fn geocentric_lat_lon(r: Vec3) -> (f64, f64) {
    let p = (r[0] * r[0] + r[1] * r[1]).sqrt();
    (r[2].atan2(p), r[1].atan2(r[0]))
}

/// Direction of a designed pass over the user.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum PassDirection {
    /// Northbound (ascending) through the user's latitude.
    Ascending,
    /// Southbound (descending) through the user's latitude.
    Descending,
}

/// Request for [`design_pass`].
#[derive(Clone, Copy, Debug)]
pub struct PassRequest {
    /// Circular-orbit altitude above the equatorial radius (m).
    pub altitude_m: f64,
    /// Inclination (rad).
    pub inclination_rad: f64,
    /// Target maximum elevation (deg).
    pub max_elevation_deg: f64,
    /// Time of closest approach after the epoch (s).
    pub tca_s: f64,
    /// Northbound or southbound.
    pub direction: PassDirection,
    /// Place the ground track east (`true`) or west of the user.
    pub east: bool,
    /// Secular `J2` drift.
    pub j2: bool,
}

/// Maximum elevation (deg) a satellite reaches for `user` within `tca ± window`, and when.
pub fn max_elevation(
    sat: &SatMotion,
    user: &UserMotion,
    tca: f64,
    window: f64,
) -> Result<(f64, f64), String> {
    let el_at = |t: f64| -> Result<f64, String> {
        let s = sat.state(t)?;
        let u = user.state(t);
        Ok(link_geometry(&s, &u, t).el_deg)
    };
    let step = 5.0;
    let n = (2.0 * window / step).ceil() as usize;
    let (mut best_t, mut best) = (tca, f64::MIN);
    for k in 0..=n {
        let t = tca - window + k as f64 * step;
        let e = el_at(t)?;
        if e > best {
            best = e;
            best_t = t;
        }
    }
    // Golden-section refinement around the sampled maximum.
    let (mut a, mut b) = (best_t - step, best_t + step);
    let g = 0.5 * (5f64.sqrt() - 1.0);
    for _ in 0..40 {
        let c = b - g * (b - a);
        let d = a + g * (b - a);
        if el_at(c)? > el_at(d)? {
            b = d;
        } else {
            a = c;
        }
    }
    let t = 0.5 * (a + b);
    Ok((el_at(t)?.max(best), t))
}

/// Place a circular orbit so that `user` sees a pass that peaks near `req.max_elevation_deg`
/// at about `req.tca_s`. The sub-satellite point at `tca_s` is put at the user's geocentric
/// latitude, offset in longitude; the offset is found by bisection on the maximum elevation.
/// Returns the element set (constellation-design convention) and the achieved maximum
/// elevation. Fails when the inclination cannot reach the user's latitude.
pub fn design_pass(user: &UserMotion, req: &PassRequest) -> Result<(Elements, f64), String> {
    let a = RE_EARTH + req.altitude_m;
    let inc = req.inclination_rad;
    let u_state = user.state(req.tca_s);
    let (phi, lam_user) = geocentric_lat_lon(u_state.r_ecef);
    let s = phi.sin() / inc.sin();
    if s.abs() > 1.0 {
        return Err(format!(
            "an orbit inclined {:.2} deg never passes over latitude {:.2} deg",
            inc.to_degrees(),
            phi.to_degrees()
        ));
    }
    let u_star = match req.direction {
        PassDirection::Ascending => s.asin(),
        PassDirection::Descending => PI - s.asin(),
    };
    let probe = SatMotion::kepler(
        Elements {
            a_m: a,
            e: 0.0,
            i_rad: inc,
            raan_rad: 0.0,
            argp_rad: 0.0,
            m0_rad: 0.0,
        },
        req.j2,
    );
    let (n, raan_dot, argp_dot) = match probe {
        SatMotion::Kepler {
            n,
            raan_dot,
            argp_dot,
            ..
        } => (n, raan_dot, argp_dot),
        SatMotion::Sgp4 { .. } => unreachable!("kepler() builds a Kepler motion"),
    };
    let build = |delta: f64| -> Elements {
        let node_star = lam_user + delta + OMEGA_EARTH * req.tca_s
            - (inc.cos() * u_star.sin()).atan2(u_star.cos());
        Elements {
            a_m: a,
            e: 0.0,
            i_rad: inc,
            raan_rad: (node_star - raan_dot * req.tca_s).rem_euclid(TAU),
            argp_rad: 0.0,
            m0_rad: (u_star - (n + argp_dot) * req.tca_s).rem_euclid(TAU),
        }
    };
    let window = 900.0;
    let maxel = |delta: f64| -> Result<f64, String> {
        let m = SatMotion::kepler(build(delta), req.j2);
        Ok(max_elevation(&m, user, req.tca_s, window)?.0)
    };
    // The offset of the highest pass is near zero; find it, then walk outward.
    let (mut lo, mut hi) = (-0.05, 0.05);
    let g = 0.5 * (5f64.sqrt() - 1.0);
    for _ in 0..40 {
        let c = hi - g * (hi - lo);
        let d = lo + g * (hi - lo);
        if maxel(c)? > maxel(d)? {
            hi = d;
        } else {
            lo = c;
        }
    }
    let d_peak = 0.5 * (lo + hi);
    let top = maxel(d_peak)?;
    let target = req.max_elevation_deg.clamp(0.0, 90.0);
    if target >= top {
        return Ok((build(d_peak), top));
    }
    let sign = if req.east { 1.0 } else { -1.0 };
    let (mut near, mut far) = (0.0_f64, 0.6_f64);
    if maxel(d_peak + sign * far)? > target {
        return Err("the requested maximum elevation is below the horizon reach".into());
    }
    for _ in 0..60 {
        let mid = 0.5 * (near + far);
        if maxel(d_peak + sign * mid)? > target {
            near = mid;
        } else {
            far = mid;
        }
    }
    let delta = d_peak + sign * 0.5 * (near + far);
    Ok((build(delta), maxel(delta)?))
}

/// Result of [`max_static_user_range_rate`].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DopplerEnvelope {
    /// Circular orbital speed `√(μ/r)` (m/s).
    pub orbital_speed_m_s: f64,
    /// Largest Earth-fixed satellite speed over the orbit (m/s).
    pub max_ecef_speed_m_s: f64,
    /// Largest range rate seen by a static user anywhere on the sphere at or above 0° elevation
    /// (m/s).
    pub max_range_rate_m_s: f64,
}

/// Largest range rate a static user on a sphere of radius `re_m` sees from a circular orbit at
/// altitude `alt_m` above that sphere and inclination `inc_rad`, over every orbit position and
/// every user on the satellite's horizon (0° elevation), with the Earth turning at
/// [`OMEGA_EARTH`]. A 1° grid in argument of latitude and horizon azimuth is refined by a
/// shrinking local grid.
pub fn max_static_user_range_rate(alt_m: f64, inc_rad: f64, re_m: f64) -> DopplerEnvelope {
    let rs = re_m + alt_m;
    let vs = (MU_EARTH / rs).sqrt();
    let lam0 = (re_m / rs).acos();
    let (si, ci) = inc_rad.sin_cos();
    let w = [0.0, 0.0, OMEGA_EARTH];
    let rr = |u: f64, az: f64| -> f64 {
        let (su, cu) = u.sin_cos();
        let s = [rs * cu, rs * su * ci, rs * su * si];
        let v = [-vs * su, vs * cu * ci, vs * cu * si];
        let sh = scale(s, 1.0 / rs);
        let e1 = scale(v, 1.0 / vs);
        let e2 = cross(sh, e1);
        let d = add(scale(e1, az.cos()), scale(e2, az.sin()));
        let user = scale(add(scale(sh, lam0.cos()), scale(d, lam0.sin())), re_m);
        let vu = cross(w, user);
        let los = sub(s, user);
        (dot(los, sub(v, vu)) / norm(los)).abs()
    };
    let mut best = (0.0, 0.0, 0.0);
    for i in 0..360 {
        for j in 0..360 {
            let (u, az) = ((i as f64).to_radians(), (j as f64).to_radians());
            let val = rr(u, az);
            if val > best.0 {
                best = (val, u, az);
            }
        }
    }
    let mut span = 1f64.to_radians();
    for _ in 0..30 {
        let (_, u0, a0) = best;
        for i in -4..=4 {
            for j in -4..=4 {
                let (u, az) = (u0 + span * i as f64 / 4.0, a0 + span * j as f64 / 4.0);
                let val = rr(u, az);
                if val > best.0 {
                    best = (val, u, az);
                }
            }
        }
        span *= 0.5;
    }
    let mut max_ecef = 0.0_f64;
    for i in 0..3600 {
        let u = (i as f64 * 0.1).to_radians();
        let (su, cu) = u.sin_cos();
        let s = [rs * cu, rs * su * ci, rs * su * si];
        let v = [-vs * su, vs * cu * ci, vs * cu * si];
        max_ecef = max_ecef.max(norm(sub(v, cross(w, s))));
    }
    DopplerEnvelope {
        orbital_speed_m_s: vs,
        max_ecef_speed_m_s: max_ecef,
        max_range_rate_m_s: best.0,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn user_at(lat: f64, lon: f64) -> UserMotion {
        UserMotion {
            start: Geodetic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: 0.0,
            },
            speed_m_s: 0.0,
            heading_rad: 0.0,
        }
    }

    #[test]
    fn kepler_velocity_is_the_derivative_of_the_position() {
        let el = Elements {
            a_m: RE_EARTH + 700e3,
            e: 0.01,
            i_rad: 1.2,
            raan_rad: 0.4,
            argp_rad: 0.7,
            m0_rad: 2.0,
        };
        for j2 in [false, true] {
            let m = SatMotion::kepler(el, j2);
            for t in [0.0, 1234.5, 5000.0] {
                let h = 0.01;
                let p = m.state(t + h).unwrap().r;
                let q = m.state(t - h).unwrap().r;
                let vn = scale(sub(p, q), 0.5 / h);
                let v = m.state(t).unwrap().v;
                assert!(norm(sub(v, vn)) < 1e-4, "j2 {j2}: {:?} vs {:?}", v, vn);
            }
        }
    }

    #[test]
    fn closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion() {
        let user = user_at(48.0, 11.0);
        let req = PassRequest {
            altitude_m: 510e3,
            inclination_rad: 97.4f64.to_radians(),
            max_elevation_deg: 70.0,
            tca_s: 400.0,
            direction: PassDirection::Ascending,
            east: true,
            j2: false,
        };
        let (el, _) = design_pass(&user, &req).unwrap();
        let sat = SatMotion::kepler(el, false);
        for t in [150.0, 300.0, 400.0, 500.0, 650.0] {
            let (d1, d2) = numerical_check(&sat, &user, t, 0.05).unwrap();
            // Central-difference truncation over 0.05 s stays below 1e-3 (0.017 Hz at 5 GHz).
            assert!(d1 < 1e-3, "range rate {d1}");
            assert!(d2 < 1e-3, "range accel {d2}");
        }
    }

    #[test]
    fn a_designed_pass_reaches_the_requested_elevation() {
        let user = user_at(40.4, -3.7);
        for (target, dir) in [
            (80.0, PassDirection::Ascending),
            (45.0, PassDirection::Descending),
            (20.0, PassDirection::Ascending),
        ] {
            let req = PassRequest {
                altitude_m: 510e3,
                inclination_rad: sun_synchronous_inclination_rad(510e3).unwrap(),
                max_elevation_deg: target,
                tca_s: 450.0,
                direction: dir,
                east: true,
                j2: true,
            };
            let (el, got) = design_pass(&user, &req).unwrap();
            assert!((got - target).abs() < 0.05, "{target} -> {got}");
            let sat = SatMotion::kepler(el, true);
            let (e, t) = max_elevation(&sat, &user, 450.0, 900.0).unwrap();
            assert!(
                (e - target).abs() < 0.05 && (t - 450.0).abs() < 60.0,
                "{e} at {t}"
            );
        }
    }

    #[test]
    fn sun_synchronous_inclination_at_510_km_is_near_97_4_deg() {
        let i = sun_synchronous_inclination_rad(510e3).unwrap().to_degrees();
        assert!((97.3..97.6).contains(&i), "{i}");
    }

    #[test]
    fn a_tle_satellite_runs_through_sgp4_with_a_consistent_velocity() {
        // ISS-like TLE (public format example); only internal consistency is checked here.
        let l1 = "1 25544U 98067A   26270.50000000  .00016717  00000-0  30000-3 0  9990";
        let l2 = "2 25544  51.6400 200.0000 0005000  90.0000 270.0000 15.50000000100008";
        let l1 = fix_checksum(l1);
        let l2 = fix_checksum(l2);
        let jd0 = crate::timescales::julian_date(2026, 9, 27, 12, 0, 0.0);
        let sat = SatMotion::from_tle(&l1, &l2, jd0).unwrap();
        let h = 0.5;
        let p = sat.state(100.0 + h).unwrap().r;
        let q = sat.state(100.0 - h).unwrap().r;
        let vn = scale(sub(p, q), 0.5 / h);
        let v = sat.state(100.0).unwrap().v;
        assert!(norm(sub(v, vn)) < 0.05, "{}", norm(sub(v, vn)));
    }

    fn fix_checksum(line: &str) -> String {
        let body = &line[..68];
        format!("{body}{}", crate::tle::tle_checksum(body))
    }
}
