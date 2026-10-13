// SPDX-License-Identifier: AGPL-3.0-only
//! Keplerian-orbit propagation and GNSS line-of-sight visibility.
//!
//! A deterministic, dependency-free geometry layer that derives GNSS
//! availability and position dilution of precision from real orbital geometry
//! instead of hand-authored windows: a user spacecraft and a GNSS constellation
//! are propagated on Keplerian orbits (circular by default, with optional
//! eccentricity and J2 secular nodal/apsidal drift), and a GNSS satellite counts
//! as visible when Earth does not occult the line of sight and it clears the
//! user's elevation mask. The visible-satellite count maps to a [`GnssState`].
//!
//! Constants: Earth gravitational parameter `mu = 3.986004418e14 m^3/s^2`
//! (WGS-84 / EGM), the WGS-84 ellipsoid (equatorial radius and flattening) for
//! line-of-sight occultation, and the WGS-84 equatorial radius and J2 for the
//! precession rates. The mean radius `6371.0 km` (IUGG mean) seeds circular-orbit
//! altitudes. The
//! two-body + J2-secular model is intentional and documented; it is not a
//! precise-ephemeris propagator.

use crate::portable_math::PortableFloat;
use crate::scenario::{ClockCfg, GnssState, GnssTimeline, GnssWindow, TimeCfg};
use crate::skyline::Skyline;
use serde::{Deserialize, Serialize};

/// Earth gravitational parameter (m^3/s^2), WGS-84 / EGM-96 GM.
pub const MU_EARTH: f64 = 3.986_004_418e14;
/// Spherical Earth mean radius (m), IUGG mean radius R1.
pub const R_EARTH_M: f64 = 6_371_000.0;
/// Earth equatorial radius (m), WGS-84 — used in the J2 precession rates.
pub const R_EARTH_EQUATORIAL_M: f64 = 6_378_137.0;
/// Earth second zonal harmonic J2 (dimensionless), EGM-96 / WGS-84.
pub const J2_EARTH: f64 = 1.082_626_68e-3;

type Vec3 = [f64; 3];

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn normalize(a: Vec3) -> Option<Vec3> {
    let n = norm(a);
    if n == 0.0 {
        None
    } else {
        Some([a[0] / n, a[1] / n, a[2] / n])
    }
}

/// Solve Kepler's equation `M = E - e sin E` for the eccentric anomaly `E` (rad)
/// by Newton-Raphson. Exact for the circular case (`e = 0` returns `M`).
pub(crate) fn solve_kepler(mean_anomaly: f64, e: f64) -> f64 {
    if e == 0.0 {
        return mean_anomaly;
    }
    let mut ea = mean_anomaly;
    for _ in 0..30 {
        let d = (ea - e * ea.psin() - mean_anomaly) / (1.0 - e * ea.pcos());
        ea -= d;
        if d.abs() < 1e-13 {
            break;
        }
    }
    ea
}

/// A Keplerian orbit from classical elements: semi-major axis (m), eccentricity,
/// inclination, RAAN, argument of perigee, and mean anomaly at epoch (rad), plus
/// optional secular drift rates for the node and perigee (e.g. from J2). A
/// circular orbit is the `e = 0` special case, for which `u0_rad` is the argument
/// of latitude at epoch.
#[derive(Clone, Copy, Debug)]
pub struct Orbit {
    /// Semi-major axis (m); equals the orbital radius when circular.
    pub radius_m: f64,
    pub eccentricity: f64,
    pub inclination_rad: f64,
    pub raan_rad: f64,
    pub argp_rad: f64,
    /// Mean anomaly at epoch (rad); the argument of latitude when circular.
    pub u0_rad: f64,
    /// Secular RAAN rate (rad/s) — J2 nodal regression when set via [`with_j2`].
    ///
    /// [`with_j2`]: Self::with_j2
    pub raan_dot: f64,
    /// Secular argument-of-perigee rate (rad/s) — J2 apsidal precession.
    pub argp_dot: f64,
}

impl Orbit {
    /// A circular orbit: radius (m), inclination, RAAN, and argument of latitude
    /// at epoch (rad).
    pub fn new(radius_m: f64, inclination_rad: f64, raan_rad: f64, u0_rad: f64) -> Self {
        Self {
            radius_m,
            eccentricity: 0.0,
            inclination_rad,
            raan_rad,
            argp_rad: 0.0,
            u0_rad,
            raan_dot: 0.0,
            argp_dot: 0.0,
        }
    }

    /// A Keplerian orbit from classical elements (angles in rad, `a` in m).
    pub fn keplerian(
        a: f64,
        eccentricity: f64,
        inclination_rad: f64,
        raan_rad: f64,
        argp_rad: f64,
        mean_anomaly0_rad: f64,
    ) -> Self {
        Self {
            radius_m: a,
            eccentricity,
            inclination_rad,
            raan_rad,
            argp_rad,
            u0_rad: mean_anomaly0_rad,
            raan_dot: 0.0,
            argp_dot: 0.0,
        }
    }

    /// Add the secular J2 nodal regression and apsidal precession rates for these
    /// elements (Vallado, *Fundamentals of Astrodynamics and Applications*):
    ///
    /// ```text
    ///   Omega_dot = -1.5 n J2 (Re/p)^2 cos i
    ///   argp_dot  =  0.75 n J2 (Re/p)^2 (5 cos^2 i - 1),   p = a (1 - e^2).
    /// ```
    pub fn with_j2(mut self) -> Self {
        let n = self.mean_motion();
        let p = self.radius_m * (1.0 - self.eccentricity * self.eccentricity);
        let factor = n * J2_EARTH * (R_EARTH_EQUATORIAL_M / p).ppowi(2);
        let ci = self.inclination_rad.pcos();
        self.raan_dot = -1.5 * factor * ci;
        self.argp_dot = 0.75 * factor * (5.0 * ci * ci - 1.0);
        self
    }

    /// Mean motion (rad/s) = sqrt(mu / a^3).
    pub fn mean_motion(&self) -> f64 {
        (MU_EARTH / self.radius_m.ppowi(3)).sqrt()
    }

    /// Orbital period (s) = 2 pi / n.
    pub fn period_s(&self) -> f64 {
        std::f64::consts::TAU / self.mean_motion()
    }

    /// True when this is a plain circular orbit with no secular drift — the
    /// closed-form fast path, preserved bit-for-bit.
    pub fn is_circular(&self) -> bool {
        self.eccentricity == 0.0 && self.raan_dot == 0.0 && self.argp_dot == 0.0
    }

    /// Earth-centred inertial position (m) at time `t` (s).
    ///
    /// The mean anomaly advances as `M = u0 + n t`; Kepler's equation gives the
    /// eccentric then true anomaly, the radius is `a(1 - e cos E)`, and the
    /// in-plane position at argument of latitude `argp + nu` is rotated by the
    /// inclination about x and the (drifting) RAAN about z.
    pub fn position_eci(&self, t: f64) -> Vec3 {
        let n = self.mean_motion();
        let (si, ci) = self.inclination_rad.psin_cos();
        if self.is_circular() {
            // Closed-form circular case (identical to the original formulation).
            let u = self.u0_rad + n * t;
            let (su, cu) = u.psin_cos();
            let (so, co) = self.raan_rad.psin_cos();
            let r = self.radius_m;
            let (x, y, z) = (r * cu, r * su * ci, r * su * si);
            return [x * co - y * so, x * so + y * co, z];
        }
        let e = self.eccentricity;
        let raan = self.raan_rad + self.raan_dot * t;
        let argp = self.argp_rad + self.argp_dot * t;
        let m = self.u0_rad + n * t;
        let ea = solve_kepler(m, e);
        let r = self.radius_m * (1.0 - e * ea.pcos());
        // True anomaly from the eccentric anomaly.
        let nu = 2.0
            * ((1.0 + e).sqrt() * (ea * 0.5).psin()).patan2((1.0 - e).sqrt() * (ea * 0.5).pcos());
        let (su, cu) = (argp + nu).psin_cos();
        let (so, co) = raan.psin_cos();
        let (x, y, z) = (r * cu, r * su * ci, r * su * si);
        [x * co - y * so, x * so + y * co, z]
    }

    /// Earth-centred inertial velocity (m/s) at time `t` (s).
    ///
    /// Computed by a symmetric central difference of [`position_eci`] (error
    /// `O(h^2)`); validated against the vis-viva speed `sqrt(mu(2/r - 1/a))` in
    /// the unit tests. The Keplerian model has no analytic closed form once the
    /// J2 secular drifts are switched on, so the difference quotient keeps a
    /// single consistent velocity definition across the circular, eccentric and
    /// drifting cases.
    ///
    /// [`position_eci`]: Self::position_eci
    pub fn velocity_eci(&self, t: f64) -> Vec3 {
        const H: f64 = 0.5; // seconds
        let a = self.position_eci(t - H);
        let b = self.position_eci(t + H);
        [
            (b[0] - a[0]) / (2.0 * H),
            (b[1] - a[1]) / (2.0 * H),
            (b[2] - a[2]) / (2.0 * H),
        ]
    }
}

/// A satellite propagator: either the engine's analytic Keplerian [`Orbit`]
/// (two-body, optionally with secular J2) or a full SGP4/SDP4 propagator built
/// from a complete two-line element set. A constellation can mix the two — a
/// block of line-2-only elements stays Keplerian, while full TLEs use SGP4.
///
/// Time is seconds from the scenario epoch; for SGP4 that epoch is each
/// satellite's own TLE epoch, so a real constellation should be given from a
/// common epoch (as a snapshot study assumes).
#[derive(Clone, Debug)]
pub enum Propagator {
    Kepler(Orbit),
    Sgp4(Box<crate::sgp4::Sgp4>),
    /// A GPS/Galileo/QZSS/BeiDou satellite driven by a broadcast ephemeris parsed
    /// from a RINEX navigation file. Time `t` (s) is measured from the ephemeris
    /// reference time `Toe`; position comes from the IS-GPS-200 user algorithm in
    /// ECEF, rotated into the shared TEME inertial frame. This lets real broadcast
    /// data flow through the same geometry/visibility/integrity pipeline as the
    /// analytic propagators.
    Rinex(Box<crate::rinex::RinexEphemeris>),
    /// A GLONASS satellite driven by a RINEX broadcast ephemeris: a PZ-90
    /// state vector RK4-integrated from the reference epoch, then rotated into the
    /// shared TEME inertial frame. Time `t` (s) is measured from that epoch.
    Glonass(Box<crate::glonass::GlonassEphemeris>),
    /// A satellite driven by an SP3 precise ephemeris: the tabulated ECEF
    /// positions are interpolated (10th-order, 11-point Lagrange, matching
    /// RTKLIB's `peph2pos` `NMAX = 10`) and rotated into the shared
    /// TEME inertial frame. Time `t` (s) is measured from the SP3 file start.
    Sp3Precise(Box<crate::sp3::Sp3Interpolator>),
}

/// Time step (s) used to finite-difference a [`Propagator::Rinex`] position into
/// a velocity: the broadcast ephemeris gives position only. A one-second central
/// difference resolves the ~3.9 km/s orbital velocity to better than a mm/s.
const RINEX_VEL_DT_S: f64 = 1.0;

/// Full inertial state of a propagated body at one instant: position (m) and
/// velocity (m/s) in the same Earth-centred inertial frame as [`Propagator::position_eci`].
///
/// SGP4 computes the TEME velocity as part of every step; exposing it here lets
/// downstream code (Doppler, range-rate, relative geometry) use it instead of
/// recomputing or discarding it.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct StateEci {
    /// Position (m).
    pub r_m: Vec3,
    /// Velocity (m/s).
    pub v_m_s: Vec3,
}

/// The reference frame a propagated state can be expressed in. The propagators
/// emit [`Frame::Teme`] natively (the SGP4 frame); [`Frame::Gcrs`] and
/// [`Frame::Itrs`] are reached through the validated reductions in
/// [`crate::nutation`] (TEME→GCRS) and [`crate::cio`] (the IAU 2006/2000A CIO
/// GCRS→ITRS chain).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Frame {
    /// True Equator, Mean Equinox — the native SGP4/propagator output frame.
    Teme,
    /// Geocentric Celestial Reference System (≈ J2000), the inertial frame.
    Gcrs,
    /// International Terrestrial Reference System — Earth-fixed (ECEF).
    Itrs,
}

impl Propagator {
    /// Inertial position (m) at time `t` (s). For an SGP4 satellite this is the
    /// TEME position; a propagation error (e.g. a decayed satellite) returns the
    /// geocentre, which is then treated as not visible by the geometry checks.
    pub fn position_eci(&self, t: f64) -> Vec3 {
        match self {
            Propagator::Kepler(o) => o.position_eci(t),
            Propagator::Sgp4(s) => match s.propagate(t / 60.0) {
                Ok((r_km, _v)) => [r_km[0] * 1000.0, r_km[1] * 1000.0, r_km[2] * 1000.0],
                Err(_) => [0.0, 0.0, 0.0],
            },
            Propagator::Rinex(e) => e.sv_position_teme(e.toe + t),
            Propagator::Glonass(e) => e.position_teme(t),
            Propagator::Sp3Precise(e) => e.position_teme(t),
        }
    }

    /// Inertial velocity (m/s) at time `t` (s). For an SGP4 satellite this is the
    /// analytic TEME velocity the propagator already computes (previously
    /// discarded); a propagation error returns zero. A RINEX satellite has no
    /// analytic velocity, so it is recovered by a central finite difference of
    /// the inertial position.
    pub fn velocity_eci(&self, t: f64) -> Vec3 {
        match self {
            Propagator::Kepler(o) => o.velocity_eci(t),
            Propagator::Sgp4(s) => match s.propagate(t / 60.0) {
                Ok((_r, v_km_s)) => [v_km_s[0] * 1000.0, v_km_s[1] * 1000.0, v_km_s[2] * 1000.0],
                Err(_) => [0.0, 0.0, 0.0],
            },
            Propagator::Rinex(e) => {
                let ahead = e.sv_position_teme(e.toe + t + RINEX_VEL_DT_S);
                let behind = e.sv_position_teme(e.toe + t - RINEX_VEL_DT_S);
                [
                    (ahead[0] - behind[0]) / (2.0 * RINEX_VEL_DT_S),
                    (ahead[1] - behind[1]) / (2.0 * RINEX_VEL_DT_S),
                    (ahead[2] - behind[2]) / (2.0 * RINEX_VEL_DT_S),
                ]
            }
            Propagator::Glonass(e) => {
                let ahead = e.position_teme(t + RINEX_VEL_DT_S);
                let behind = e.position_teme(t - RINEX_VEL_DT_S);
                [
                    (ahead[0] - behind[0]) / (2.0 * RINEX_VEL_DT_S),
                    (ahead[1] - behind[1]) / (2.0 * RINEX_VEL_DT_S),
                    (ahead[2] - behind[2]) / (2.0 * RINEX_VEL_DT_S),
                ]
            }
            Propagator::Sp3Precise(e) => {
                let ahead = e.position_teme(t + RINEX_VEL_DT_S);
                let behind = e.position_teme(t - RINEX_VEL_DT_S);
                [
                    (ahead[0] - behind[0]) / (2.0 * RINEX_VEL_DT_S),
                    (ahead[1] - behind[1]) / (2.0 * RINEX_VEL_DT_S),
                    (ahead[2] - behind[2]) / (2.0 * RINEX_VEL_DT_S),
                ]
            }
        }
    }

    /// Full inertial state (position m, velocity m/s) at time `t` (s). For SGP4
    /// this returns both from a single propagation step rather than two; a
    /// propagation error returns the zero state.
    pub fn state_eci(&self, t: f64) -> StateEci {
        match self {
            Propagator::Kepler(o) => StateEci {
                r_m: o.position_eci(t),
                v_m_s: o.velocity_eci(t),
            },
            Propagator::Sgp4(s) => match s.propagate(t / 60.0) {
                Ok((r_km, v_km_s)) => StateEci {
                    r_m: [r_km[0] * 1000.0, r_km[1] * 1000.0, r_km[2] * 1000.0],
                    v_m_s: [v_km_s[0] * 1000.0, v_km_s[1] * 1000.0, v_km_s[2] * 1000.0],
                },
                Err(_) => StateEci {
                    r_m: [0.0, 0.0, 0.0],
                    v_m_s: [0.0, 0.0, 0.0],
                },
            },
            Propagator::Rinex(_) | Propagator::Glonass(_) | Propagator::Sp3Precise(_) => StateEci {
                r_m: self.position_eci(t),
                v_m_s: self.velocity_eci(t),
            },
        }
    }

    /// Position (m) at time `t` (s) expressed in `frame`. `jd_tt` is the absolute
    /// Terrestrial Time Julian date at that instant (the scenario epoch plus `t`),
    /// `jd_ut1` drives Earth rotation for [`Frame::Itrs`], and `xp,yp` are the
    /// polar-motion coordinates (radians; see [`crate::frames::arcsec`]). For
    /// [`Frame::Teme`] the date arguments are ignored. GCRS uses the validated
    /// TEME→GCRS reduction; ITRS chains that into the IAU 2006/2000A CIO
    /// GCRS→ITRS rotation.
    pub fn position_in_frame(
        &self,
        t: f64,
        frame: Frame,
        jd_tt: f64,
        jd_ut1: f64,
        xp: f64,
        yp: f64,
    ) -> Vec3 {
        let r_teme = self.position_eci(t);
        match frame {
            Frame::Teme => r_teme,
            Frame::Gcrs => crate::nutation::teme_to_gcrs(r_teme, [0.0; 3], jd_tt).0,
            Frame::Itrs => {
                let r_gcrs = crate::nutation::teme_to_gcrs(r_teme, [0.0; 3], jd_tt).0;
                crate::cio::gcrs_to_itrs(r_gcrs, jd_tt, jd_ut1, xp, yp)
            }
        }
    }

    /// Full inertial state (position m, velocity m/s) at time `t` (s) in the GCRS
    /// (≈ J2000) frame, via the validated TEME→GCRS reduction. `jd_tt` is the
    /// absolute Terrestrial Time Julian date at that instant.
    pub fn state_gcrs(&self, t: f64, jd_tt: f64) -> StateEci {
        let s = self.state_eci(t);
        let (r, v) = crate::nutation::teme_to_gcrs(s.r_m, s.v_m_s, jd_tt);
        StateEci { r_m: r, v_m_s: v }
    }

    /// The absolute instant of time `t` (s), as the UTC (UT1 taken equal to UTC)
    /// Julian Date the propagator itself dates it by, for a propagator whose data
    /// carry their own epoch: an SGP4 satellite's TLE epoch plus `t`, a broadcast
    /// ephemeris's `Toe` plus `t` (the same date its Earth-fixed position is rotated
    /// into TEME with), an SP3 file's start plus `t`. `None` for a Keplerian orbit,
    /// whose `t = 0` is only what the scenario calls it.
    pub fn own_jd_utc(&self, t: f64) -> Option<f64> {
        match self {
            Propagator::Kepler(_) => None,
            Propagator::Sgp4(s) => Some(s.epoch_jd_utc() + t / 86_400.0),
            Propagator::Rinex(e) => Some(e.jd_ut1(e.toe + t)),
            Propagator::Glonass(e) => Some(e.jd_ut1(t)),
            Propagator::Sp3Precise(e) => Some(e.jd_ut1(t)),
        }
    }

    /// Nominal orbital period (s).
    pub fn period_s(&self) -> f64 {
        match self {
            Propagator::Kepler(o) => o.period_s(),
            Propagator::Sgp4(s) => s.period_s(),
            Propagator::Rinex(e) => e.orbital_period_s(),
            Propagator::Glonass(e) => e.orbital_period_s(),
            Propagator::Sp3Precise(e) => e.approx_period_s(),
        }
    }
}

impl From<Orbit> for Propagator {
    fn from(o: Orbit) -> Self {
        Propagator::Kepler(o)
    }
}

impl From<crate::rinex::RinexEphemeris> for Propagator {
    fn from(e: crate::rinex::RinexEphemeris) -> Self {
        Propagator::Rinex(Box::new(e))
    }
}

impl From<crate::glonass::GlonassEphemeris> for Propagator {
    fn from(e: crate::glonass::GlonassEphemeris) -> Self {
        Propagator::Glonass(Box::new(e))
    }
}

impl From<crate::sp3::Sp3Interpolator> for Propagator {
    fn from(e: crate::sp3::Sp3Interpolator) -> Self {
        Propagator::Sp3Precise(Box::new(e))
    }
}

/// A representative atmospheric shell thickness (km) for occultation: a line of
/// sight passing below roughly this height skims the dense lower atmosphere,
/// where signals are strongly refracted and attenuated. Used by
/// [`earth_occults_with_atmosphere`]; the bare [`earth_occults`] is a solid-Earth
/// geometric test that excludes it.
pub const ATMOSPHERE_OCCULT_KM: f64 = 50.0;

/// True when the solid Earth occults the line of sight between `user` and `sat`.
/// The Earth is modelled as an oblate spheroid — equatorial radius
/// [`R_EARTH_M`] (the engine's mean Earth radius, the same value all positions
/// are built on) flattened at the poles by the WGS-84 flattening — so a ray
/// grazing the flatter poles is no longer wrongly blocked the way a pure sphere
/// blocks it. Anchoring the equator at `R_EARTH_M` keeps the occultation model
/// consistent with the engine's spherical-Earth position convention, so a
/// near-surface user is not spuriously placed underground. Positions are metres
/// in an Earth-centred frame whose z-axis is the polar axis (ECEF, or ECI to
/// within polar motion). Atmospheric blockage is a separate effect — see
/// [`earth_occults_with_atmosphere`] — and operational visibility additionally
/// applies the elevation mask in [`visible_count`].
pub fn earth_occults(user: Vec3, sat: Vec3) -> bool {
    earth_occults_with_atmosphere(user, sat, 0.0)
}

/// Like [`earth_occults`], but inflates the blocking spheroid by `atmosphere_km`
/// so a ray skimming the dense lower atmosphere counts as occulted. See
/// [`ATMOSPHERE_OCCULT_KM`] for a representative value.
pub fn earth_occults_with_atmosphere(user: Vec3, sat: Vec3, atmosphere_km: f64) -> bool {
    // Oblate spheroid anchored at the engine's mean Earth radius: equatorial
    // radius a = R_EARTH_M, polar radius b = a(1 - f). Map it to a sphere of
    // radius a by scaling the polar (z) axis by a/b, then test the closest
    // approach of the scaled segment to Earth's centre against a plus any
    // atmosphere shell.
    let a = R_EARTH_M;
    let sz = 1.0 / (1.0 - crate::frames::WGS84_F);
    let scale = |p: Vec3| [p[0], p[1], p[2] * sz];
    let u = scale(user);
    let d = sub(scale(sat), u);
    let dd = dot(d, d);
    if dd == 0.0 {
        return false;
    }
    let lambda = (-dot(u, d) / dd).clamp(0.0, 1.0);
    let closest = [
        u[0] + lambda * d[0],
        u[1] + lambda * d[1],
        u[2] + lambda * d[2],
    ];
    norm(closest) < a + atmosphere_km * 1000.0
}

/// Elevation angle (degrees) of `sat` above the user's local horizontal — the
/// plane perpendicular to the user's radial (geocentric "up"). Negative below
/// the horizon. `sin(elevation) = up . line_of_sight`.
///
/// This is the geocentric approximation used by the analytic, inertial-frame
/// visibility model, where the user position is not tied to a specific
/// earth-fixed ground station. For a true ground-station observer, use the
/// geodetic topocentric look angles measured against the WGS-84 ellipsoid normal
/// in [`crate::frames::look_angles`] (the path the ephemeris ground-station
/// scenario uses); geocentric and geodetic elevation differ by up to ~0.2° at
/// mid-latitudes.
pub fn elevation_deg(user: Vec3, sat: Vec3) -> f64 {
    let los = sub(sat, user);
    let los_n = norm(los);
    let u_n = norm(user);
    if los_n == 0.0 || u_n == 0.0 {
        return 0.0;
    }
    let sin_el = dot(user, los) / (u_n * los_n);
    sin_el.clamp(-1.0, 1.0).pasin().to_degrees()
}

/// Number of GNSS satellites visible from the user at time `t`: not Earth-occulted
/// and at or above the `mask_deg` elevation mask.
pub fn visible_count(user: &Orbit, gnss: &[Propagator], t: f64, mask_deg: f64) -> usize {
    let up = user.position_eci(t);
    gnss.iter()
        .filter(|g| {
            let sp = g.position_eci(t);
            !earth_occults(up, sp) && elevation_deg(up, sp) >= mask_deg
        })
        .count()
}

/// Map a visible-satellite count to a GNSS state: at least four satellites give a
/// full 3D + time fix (`Nominal`); one to three is `Degraded`; none is `Denied`.
pub fn gnss_state(visible: usize) -> GnssState {
    match visible {
        0 => GnssState::Denied,
        1..=3 => GnssState::Degraded,
        _ => GnssState::Nominal,
    }
}

/// Default user-equivalent range error (m, 1-sigma): the per-satellite
/// pseudorange error budget that, scaled by the position dilution of precision,
/// gives the position accuracy. ~1 m is representative of a modern dual-frequency
/// GNSS user-equivalent range error (Kaplan & Hegarty, *Understanding GPS/GNSS*).
pub const DEFAULT_UERE_M: f64 = 1.0;
fn default_uere_m() -> f64 {
    DEFAULT_UERE_M
}

/// Unit line-of-sight vector from `user` to `sat`; `None` if they coincide.
pub fn los_unit(user: Vec3, sat: Vec3) -> Option<Vec3> {
    normalize(sub(sat, user))
}

/// Local East-North-Up basis (each a unit vector in the inertial frame) at the
/// `user` position: Up is the geocentric radial, East is perpendicular to both
/// the polar axis and Up, North completes the right-handed set. `None` at the
/// geocentre. Near the poles (Up ∥ polar axis) the x-axis seeds East instead.
pub fn enu_basis(user: Vec3) -> Option<(Vec3, Vec3, Vec3)> {
    let up = normalize(user)?;
    let seed = if cross([0.0, 0.0, 1.0], up)
        .iter()
        .map(|c| c * c)
        .sum::<f64>()
        > 1e-12
    {
        [0.0, 0.0, 1.0]
    } else {
        [1.0, 0.0, 0.0]
    };
    let east = normalize(cross(seed, up))?;
    let north = cross(up, east);
    Some((east, north, up))
}

/// Invert a 4x4 matrix by Gauss-Jordan elimination with partial pivoting.
/// `None` if the matrix is singular (rank-deficient geometry).
pub(crate) fn invert4(mut a: [[f64; 4]; 4]) -> Option<[[f64; 4]; 4]> {
    let mut inv = [[0.0; 4]; 4];
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for col in 0..4 {
        let mut piv = col;
        for r in (col + 1)..4 {
            if a[r][col].abs() > a[piv][col].abs() {
                piv = r;
            }
        }
        if a[piv][col].abs() < 1e-12 {
            return None;
        }
        a.swap(col, piv);
        inv.swap(col, piv);
        let d = a[col][col];
        for j in 0..4 {
            a[col][j] /= d;
            inv[col][j] /= d;
        }
        for r in 0..4 {
            if r == col {
                continue;
            }
            let f = a[r][col];
            if f != 0.0 {
                for j in 0..4 {
                    a[r][j] -= f * a[col][j];
                    inv[r][j] -= f * inv[col][j];
                }
            }
        }
    }
    Some(inv)
}

/// The geometry cofactor matrix `Q = (HᵀH)⁻¹` of the unit-variance least-squares
/// position-and-clock solution: the one kernel behind [`dop`] and [`dop_cov`] (validated
/// against gnss_lib_py in `tests/dop_reference.rs`) and the [`crate::geometry`] API.
///
/// `los` holds the unit lines of sight from the user to each satellite, in any right-handed
/// Cartesian frame; `Q`'s position block is in that frame. Each row of the design matrix `H`
/// is `[-e_x, -e_y, -e_z, c_0 … c_{n-1}]` with a one in the column of the satellite's
/// receiver-clock term, `clock[i]` (`clock` empty puts every satellite on clock 0). With
/// `n_clocks = 1` this is the classic four-state solution. Returns the `(3 + n_clocks)`-square
/// matrix, or `None` with fewer satellites than states or a singular geometry. The normal
/// matrix is accumulated and inverted (Gauss-Jordan with partial pivoting, the algorithm of
/// `invert4`) in the same order of operations [`dop`] always used, so its results are
/// unchanged bit for bit.
pub fn cofactor_from_los(los: &[Vec3], clock: &[usize], n_clocks: usize) -> Option<Vec<Vec<f64>>> {
    if n_clocks == 0 || (!clock.is_empty() && clock.len() != los.len()) {
        return None;
    }
    let n = 3 + n_clocks;
    if los.len() < n {
        return None;
    }
    let mut a = vec![vec![0.0_f64; n]; n];
    let mut row = vec![0.0_f64; n];
    for (k, e) in los.iter().enumerate() {
        let c = clock.get(k).copied().unwrap_or(0);
        if c >= n_clocks {
            return None;
        }
        row.iter_mut().for_each(|r| *r = 0.0);
        row[0] = -e[0];
        row[1] = -e[1];
        row[2] = -e[2];
        row[3 + c] = 1.0;
        for i in 0..n {
            for j in 0..n {
                a[i][j] += row[i] * row[j];
            }
        }
    }
    invert_square(a)
}

/// Invert a square matrix by Gauss-Jordan elimination with partial pivoting, the algorithm
/// of `invert4` for any size. `None` if it is singular.
fn invert_square(mut a: Vec<Vec<f64>>) -> Option<Vec<Vec<f64>>> {
    let n = a.len();
    let mut inv = vec![vec![0.0; n]; n];
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for col in 0..n {
        let mut piv = col;
        for r in (col + 1)..n {
            if a[r][col].abs() > a[piv][col].abs() {
                piv = r;
            }
        }
        if a[piv][col].abs() < 1e-12 {
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
            if r == col {
                continue;
            }
            let f = a[r][col];
            if f != 0.0 {
                for j in 0..n {
                    a[r][j] -= f * a[col][j];
                    inv[r][j] -= f * inv[col][j];
                }
            }
        }
    }
    Some(inv)
}

/// Dilution-of-precision factors from the geometry of the visible satellites:
/// geometric, position, horizontal, vertical, and time DOP. Multiply by the
/// user-equivalent range error (1-sigma) to get the corresponding accuracy.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Dop {
    pub gdop: f64,
    pub pdop: f64,
    pub hdop: f64,
    pub vdop: f64,
    pub tdop: f64,
}

/// Dilution of precision at `user` from the line-of-sight geometry to the
/// visible satellites. Each satellite contributes a row `[-e_x, -e_y, -e_z, 1]`
/// (unit line of sight plus the clock term) to the design matrix `H`; the
/// covariance factor is `Q = (HᵀH)⁻¹`. Returns `None` with fewer than four
/// usable satellites or a singular (e.g. coplanar) geometry. HDOP/VDOP are taken
/// in the user's local East-North-Up frame.
pub fn dop(user: Vec3, sats: &[Vec3]) -> Option<Dop> {
    dop_cov(user, sats).map(|c| c.dop)
}

/// The covariance factor `Q = (HᵀH)⁻¹` behind [`dop`], in the inertial frame of `user` and
/// `sats` with the clock last (`[x, y, z, c·δt]`): [`dop_cov`]'s `q`, so `σ²·Q` is the
/// least-squares covariance whose traces [`dop`] reports. `None` exactly where [`dop`] is.
pub fn dop_cofactor(user: Vec3, sats: &[Vec3]) -> Option<[[f64; 4]; 4]> {
    dop_cov(user, sats).map(|c| c.q)
}

/// The DOP factors together with the geometry covariance they reduce from: the unit-variance
/// cofactor matrix `Q = (HᵀH)⁻¹` of the four-state (position and one clock) solution, in the
/// frame of the inputs, and its east-north-up position block.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DopCov {
    /// The five DOP factors, exactly as [`dop`] returns them.
    pub dop: Dop,
    /// `Q` (4 × 4: x, y, z, clock) in the input frame.
    pub q: [[f64; 4]; 4],
    /// The position block of `Q` rotated into the user's east-north-up frame (3 × 3).
    pub q_enu: [[f64; 3]; 3],
}

/// [`dop`] with the covariance exposed: `dop` is this function's reduction, so its VALIDATED
/// scalars are unchanged (and still pinned by `tests/dop_reference.rs`). `None` exactly when
/// [`dop`] is `None`.
pub fn dop_cov(user: Vec3, sats: &[Vec3]) -> Option<DopCov> {
    let los: Vec<Vec3> = sats.iter().filter_map(|&s| los_unit(user, s)).collect();
    let qv = cofactor_from_los(&los, &[], 1)?;
    let mut q = [[0.0_f64; 4]; 4];
    for (i, row) in qv.iter().enumerate() {
        q[i].copy_from_slice(row);
    }
    let pdop = (q[0][0] + q[1][1] + q[2][2]).sqrt();
    let tdop = q[3][3].sqrt();
    let gdop = (q[0][0] + q[1][1] + q[2][2] + q[3][3]).sqrt();
    let (east, north, up) = enu_basis(user)?;
    // Variance of the position solution along a unit direction v: vᵀ Q_pos v.
    let var_along = |v: Vec3| -> f64 {
        let qv = [
            q[0][0] * v[0] + q[0][1] * v[1] + q[0][2] * v[2],
            q[1][0] * v[0] + q[1][1] * v[1] + q[1][2] * v[2],
            q[2][0] * v[0] + q[2][1] * v[1] + q[2][2] * v[2],
        ];
        (v[0] * qv[0] + v[1] * qv[1] + v[2] * qv[2]).max(0.0)
    };
    let hdop = (var_along(east) + var_along(north)).sqrt();
    let vdop = var_along(up).sqrt();
    let basis = [east, north, up];
    let mut q_enu = [[0.0_f64; 3]; 3];
    for (i, a) in basis.iter().enumerate() {
        for (j, b) in basis.iter().enumerate() {
            let mut v = 0.0;
            for k in 0..3 {
                for l in 0..3 {
                    v += a[k] * q[k][l] * b[l];
                }
            }
            q_enu[i][j] = v;
        }
    }
    Some(DopCov {
        dop: Dop {
            gdop,
            pdop,
            hdop,
            vdop,
            tdop,
        },
        q,
        q_enu,
    })
}

/// A single orbit, configured by altitude and angles in friendly units. With a
/// non-zero `eccentricity`, `altitude_km` sets the semi-major-axis altitude
/// (`a = mean Earth radius + altitude_km`), so perigee/apogee are `a(1 ∓ e)`, and
/// `u0_deg` is read as the mean anomaly at epoch. Setting `j2 = true` adds the
/// secular nodal regression and apsidal precession from Earth oblateness.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct OrbitCfg {
    pub altitude_km: f64,
    pub inclination_deg: f64,
    #[serde(default)]
    pub raan_deg: f64,
    #[serde(default)]
    pub u0_deg: f64,
    #[serde(default)]
    pub eccentricity: f64,
    #[serde(default)]
    pub argp_deg: f64,
    #[serde(default)]
    pub j2: bool,
}

impl OrbitCfg {
    pub fn to_orbit(&self) -> Orbit {
        let o = Orbit::keplerian(
            R_EARTH_M + self.altitude_km * 1000.0,
            self.eccentricity,
            self.inclination_deg.to_radians(),
            self.raan_deg.to_radians(),
            self.argp_deg.to_radians(),
            self.u0_deg.to_radians(),
        );
        if self.j2 {
            o.with_j2()
        } else {
            o
        }
    }
}

/// A GNSS constellation. Either a synthetic Walker-delta pattern (`planes`
/// equally-spaced orbital planes, `sats_per_plane` satellites each, a common
/// altitude and inclination, and an inter-plane phasing factor `phasing_f`), or,
/// when `tle` is given, the real satellites parsed from a block of two-line
/// element sets (the Walker fields are then ignored).
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ConstellationCfg {
    #[serde(default)]
    pub altitude_km: f64,
    #[serde(default)]
    pub inclination_deg: f64,
    #[serde(default)]
    pub planes: usize,
    #[serde(default)]
    pub sats_per_plane: usize,
    #[serde(default)]
    pub phasing_f: f64,
    /// Optional block of TLEs; if present, the constellation is parsed from it.
    #[serde(default)]
    pub tle: Option<String>,
    /// Optional inline RINEX 3 navigation text; if present (and no `tle` is
    /// given), the constellation is the GPS broadcast-ephemeris satellites parsed
    /// from it, each a [`Propagator::Rinex`]. This is how a real RINEX file drives
    /// a scenario from the CLI or the in-browser playground (inline text, no file
    /// I/O), feeding the same geometry/visibility/integrity pipeline.
    #[serde(default)]
    pub rinex: Option<String>,
    /// When `true`, every TLE line's column-69 checksum must be valid. Defaults
    /// to lenient because synthetic/teaching element sets carry placeholder
    /// checksums (e.g. the bundled Walker scenarios).
    #[serde(default)]
    pub strict_checksum: bool,
}

impl ConstellationCfg {
    /// Generate the constellation's satellite propagators: parsed from the TLE
    /// block if one is given (full two-line sets become SGP4 propagators,
    /// line-2-only blocks stay analytic Keplerian), otherwise the synthetic
    /// Walker-delta pattern (Keplerian).
    pub fn satellites(&self) -> Result<Vec<Propagator>, String> {
        if let Some(text) = &self.tle {
            return crate::tle::parse_propagators_opts(
                text,
                crate::tle::ParseOpts {
                    strict_checksum: self.strict_checksum,
                    ..Default::default()
                },
            );
        }
        if let Some(text) = &self.rinex {
            // Keplerian systems (GPS/Galileo/QZSS/BeiDou) and the GLONASS
            // state-vector model are parsed by their respective readers and
            // combined into one constellation — ONE propagator per satellite,
            // not one per broadcast record. A daily navigation file carries a
            // record roughly every two hours per satellite, so mapping every
            // record would put a dozen copies of each satellite in the sky at
            // once, scattered around its own orbit, and every visibility count,
            // DOP and protection level taken over that set would be fiction.
            let keplerian = crate::rinex::parse_nav(text)?;
            let mut sats: Vec<Propagator> = Vec::new();
            // Reference epoch for the snapshot: the earliest Toe in the file,
            // i.e. the file's own start. Each satellite then contributes the
            // record whose Toe is nearest it, by the same nearest-Toe rule the
            // PVT solver already uses. A satellite with no record inside that
            // fit window has no valid ephemeris at the reference epoch and is
            // left out rather than propagated from an arbitrary later record.
            let ref_tow = keplerian
                .iter()
                .map(|e| e.toe)
                .fold(f64::INFINITY, f64::min);
            let mut seen: Vec<(char, u8)> = Vec::new();
            for e in &keplerian {
                if seen.contains(&(e.system, e.prn)) {
                    continue;
                }
                seen.push((e.system, e.prn));
                if let Some(best) =
                    crate::pvt::select_ephemeris(&keplerian, e.system, e.prn, ref_tow)
                {
                    sats.push(Propagator::from(*best));
                }
            }
            // GLONASS records carry a calendar epoch rather than a time of week,
            // and `select_ephemeris` does not cover them, so the same one-per-slot
            // rule is applied on that scale: nearest epoch to the file's earliest
            // GLONASS epoch. No fit window is imposed here — the state-vector model
            // has no published fit interval to borrow — so every slot present in
            // the file appears exactly once.
            let glonass = crate::glonass::parse_glonass_nav(text)?;
            let ref_s = glonass
                .iter()
                .map(|e| e.epoch.seconds_from_gps_epoch())
                .fold(f64::INFINITY, f64::min);
            let mut seen_slots: Vec<u8> = Vec::new();
            for e in &glonass {
                if seen_slots.contains(&e.prn) {
                    continue;
                }
                seen_slots.push(e.prn);
                let best = glonass
                    .iter()
                    .filter(|c| c.prn == e.prn)
                    .min_by(|a, b| {
                        let da = (a.epoch.seconds_from_gps_epoch() - ref_s).abs();
                        let db = (b.epoch.seconds_from_gps_epoch() - ref_s).abs();
                        da.total_cmp(&db)
                    })
                    .expect("the slot was taken from this list");
                sats.push(Propagator::from(*best));
            }
            if sats.is_empty() {
                return Err("rinex block parsed but contained no supported ephemerides".into());
            }
            return Ok(sats);
        }
        let r = R_EARTH_M + self.altitude_km * 1000.0;
        let inc = self.inclination_deg.to_radians();
        let total = (self.planes * self.sats_per_plane) as f64;
        let mut sats = Vec::with_capacity(self.planes * self.sats_per_plane);
        for p in 0..self.planes {
            let raan = std::f64::consts::TAU * p as f64 / self.planes as f64;
            for s in 0..self.sats_per_plane {
                let u = std::f64::consts::TAU
                    * (s as f64 / self.sats_per_plane as f64 + self.phasing_f * p as f64 / total);
                sats.push(Propagator::Kepler(Orbit::new(r, inc, raan, u)));
            }
        }
        Ok(sats)
    }
}

/// Build a GNSS availability timeline by sampling the visible-satellite count on
/// the time grid: each step becomes one half-open window with its derived state.
pub fn build_timeline(
    user: &Orbit,
    gnss: &[Propagator],
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
) -> GnssTimeline {
    let n = (duration_s / step_s).round() as usize;
    let mut windows = Vec::with_capacity(n + 1);
    for i in 0..=n {
        let t = i as f64 * step_s;
        let state = gnss_state(visible_count(user, gnss, t, mask_deg));
        windows.push(GnssWindow {
            t0: t,
            t1: t + step_s,
            state,
        });
    }
    GnssTimeline { windows }
}

/// Positions of the GNSS satellites visible from the user at time `t`: not
/// Earth-occulted and at or above the elevation mask.
pub fn visible_positions(user: &Orbit, gnss: &[Propagator], t: f64, mask_deg: f64) -> Vec<Vec3> {
    let up = user.position_eci(t);
    gnss.iter()
        .filter_map(|g| {
            let sp = g.position_eci(t);
            (!earth_occults(up, sp) && elevation_deg(up, sp) >= mask_deg).then_some(sp)
        })
        .collect()
}

/// Like [`visible_positions`], but also returns the constellation `labels` of the
/// visible satellites (aligned with `gnss`/`labels` by index) — the geometry input
/// a dual-/multi-constellation ARAIM evaluation needs. Panics if `labels` is shorter
/// than `gnss`.
pub fn visible_positions_labeled(
    user: &Orbit,
    gnss: &[Propagator],
    labels: &[u8],
    t: f64,
    mask_deg: f64,
) -> (Vec<Vec3>, Vec<u8>) {
    let up = user.position_eci(t);
    let mut positions = Vec::new();
    let mut out_labels = Vec::new();
    for (g, &label) in gnss.iter().zip(labels.iter()) {
        let sp = g.position_eci(t);
        if !earth_occults(up, sp) && elevation_deg(up, sp) >= mask_deg {
            positions.push(sp);
            out_labels.push(label);
        }
    }
    (positions, out_labels)
}

/// A ground site for the orbit-sampled kinds (`orbit`, `integrity`): the design note's
/// `user_site`, the alternative to an orbiting `user`. Elevation and azimuth are then geodetic
/// (WGS-84, [`crate::frames::look_angles`]), so a skyline applies.
#[derive(Clone, Copy, Debug, PartialEq, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SiteCfg {
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg east).
    pub lon_deg: f64,
    /// Height above the WGS-84 ellipsoid (m).
    #[serde(default)]
    pub height_m: f64,
}

impl SiteCfg {
    /// The site as a geodetic position, after a range check.
    pub fn geodetic(&self) -> Result<crate::frames::Geodetic, String> {
        if !(self.lat_deg.is_finite() && self.lon_deg.is_finite() && self.height_m.is_finite())
            || self.lat_deg.abs() > 90.0
        {
            return Err("user_site: lat_deg must be in [-90, 90] and every field finite".into());
        }
        Ok(crate::frames::Geodetic {
            lat_rad: self.lat_deg.to_radians(),
            lon_rad: self.lon_deg.to_radians(),
            alt_m: self.height_m,
        })
    }
}

/// Where the user of an orbit-sampled kind is: an orbit (the 0.35 behaviour, geocentric
/// elevation, no Earth-fixed azimuth) or a ground site fixed to the rotating Earth.
#[derive(Clone, Debug)]
pub enum UserPath {
    /// An orbiting user.
    Orbit(Orbit),
    /// A ground site. Its geometry is done Earth-fixed at one absolute instant per sample,
    /// `jd0_ut1 + t / 86400`: every satellite is propagated to that instant (a propagator that
    /// dates its own data, [`Propagator::own_jd_utc`], is advanced by the time from its own
    /// epoch to it; a Keplerian orbit counts `t` from `jd0_ut1`), and its true-equator,
    /// mean-equinox position is rotated to Earth-fixed at it
    /// ([`crate::frames::teme_to_ecef`]). So the sky is one sky, not each element set at its
    /// own epoch plus `t` as an orbiting user's samples are. [`UserPath::dated_by`] sets
    /// `jd0_ut1` from the propagators when the scenario states no epoch.
    Site {
        /// The site.
        geo: crate::frames::Geodetic,
        /// Its Earth-fixed position (m).
        ecef: Vec3,
        /// UT1 Julian date of `t = 0` for Keplerian satellites and for the inertial track.
        jd0_ut1: f64,
    },
}

impl UserPath {
    /// A ground site whose `t = 0` is the UT1 Julian date `jd0_ut1`.
    pub fn site(cfg: &SiteCfg, jd0_ut1: f64) -> Result<Self, String> {
        let geo = cfg.geodetic()?;
        Ok(UserPath::Site {
            geo,
            ecef: crate::frames::geodetic_to_ecef(geo),
            jd0_ut1,
        })
    }

    /// The user's position in the frame its geometry is done in (m): inertial for an orbiting
    /// user (as [`UserPath::position_eci`]), Earth-fixed for a ground site. Satellite positions
    /// in the same frame come from [`UserPath::satellite_position`].
    pub fn position(&self, t: f64) -> Vec3 {
        match self {
            UserPath::Orbit(o) => o.position_eci(t),
            UserPath::Site { ecef, .. } => *ecef,
        }
    }

    /// The position of satellite `g` at `t` in the frame of [`UserPath::position`]: its
    /// inertial position at `t` for an orbiting user (the 0.35 behaviour); for a ground site,
    /// Earth-fixed at the absolute instant `jd0_ut1 + t / 86400` (see [`UserPath::Site`]). A
    /// propagation failure stays at the geocentre, which the visibility test rejects.
    pub fn satellite_position(&self, g: &Propagator, t: f64) -> Vec3 {
        match self {
            UserPath::Orbit(_) => g.position_eci(t),
            UserPath::Site { jd0_ut1, .. } => {
                let jd = jd0_ut1 + t / 86_400.0;
                let t_own = match g.own_jd_utc(0.0) {
                    Some(own0) => (jd0_ut1 - own0) * 86_400.0 + t,
                    None => t,
                };
                crate::frames::teme_to_ecef(g.position_eci(t_own), jd)
            }
        }
    }

    /// Date a ground site's `t = 0` from its satellites when the scenario states no epoch:
    /// the newest epoch among the propagators that carry one (element sets, broadcast
    /// ephemerides, SP3), so a catalogue is propagated forward from its freshest set rather
    /// than to the J2000 default decades away. `stated` keeps the scenario's own epoch; with
    /// only Keplerian satellites, or for an orbiting user, nothing changes.
    pub fn dated_by(self, stated: bool, gnss: &[Propagator]) -> Self {
        match self {
            UserPath::Site { geo, ecef, jd0_ut1 } if !stated => {
                let newest = gnss
                    .iter()
                    .filter_map(|g| g.own_jd_utc(0.0))
                    .fold(None, |a: Option<f64>, j| Some(a.map_or(j, |a| a.max(j))));
                UserPath::Site {
                    geo,
                    ecef,
                    jd0_ut1: newest.unwrap_or(jd0_ut1),
                }
            }
            other => other,
        }
    }

    /// The user's inertial position at `t` (m), turned with the Earth from `jd0_ut1` for a
    /// ground site (the exported track).
    pub fn position_eci(&self, t: f64) -> Vec3 {
        match self {
            UserPath::Orbit(o) => o.position_eci(t),
            UserPath::Site { ecef, jd0_ut1, .. } => {
                let theta = crate::sgp4::gstime(jd0_ut1 + t / 86_400.0);
                let (sn, c) = theta.psin_cos();
                [
                    c * ecef[0] - sn * ecef[1],
                    sn * ecef[0] + c * ecef[1],
                    ecef[2],
                ]
            }
        }
    }

    /// The local east-north-up basis of the user at `t`, each a unit vector in the frame of
    /// [`UserPath::position`]. An orbiting user keeps the geocentric basis of [`enu_basis`]
    /// (the 0.35 behaviour); a ground site uses the geodetic one (Up along the WGS-84
    /// ellipsoid normal), Earth-fixed, the frame its look angles and its horizontal and
    /// vertical errors are defined in.
    pub fn enu_basis(&self, t: f64) -> Option<(Vec3, Vec3, Vec3)> {
        match self {
            UserPath::Orbit(o) => enu_basis(o.position_eci(t)),
            UserPath::Site { geo, .. } => {
                let lon = geo.lon_rad;
                let (sl, cl) = geo.lat_rad.psin_cos();
                let (so, co) = lon.psin_cos();
                Some((
                    [-so, co, 0.0],
                    [-sl * co, -sl * so, cl],
                    [cl * co, cl * so, sl],
                ))
            }
        }
    }

    /// Whether the satellite at `sat` (in the frame of [`UserPath::position`], from
    /// [`UserPath::satellite_position`]) is in view at `t` under `mask_deg` and an optional
    /// skyline, and whether it is above the mask but hidden by the skyline. For an orbiting
    /// user with no skyline the first is exactly the 0.35 test
    /// `!earth_occults && elevation_deg >= mask_deg`.
    pub fn view(&self, t: f64, sat: Vec3, mask_deg: f64, sky: Option<&Skyline>) -> (bool, bool) {
        let up = self.position(t);
        if earth_occults(up, sat) {
            return (false, false);
        }
        match (self, sky) {
            (UserPath::Orbit(_), None) => (elevation_deg(up, sat) >= mask_deg, false),
            (UserPath::Orbit(_), Some(sky)) => {
                let el = elevation_deg(up, sat);
                let az = || azimuth_deg(up, sat);
                let vis = sky.visible_lazy(el, mask_deg, az);
                (vis, !vis && el >= mask_deg)
            }
            (UserPath::Site { geo, .. }, sky) => {
                let l = crate::frames::look_angles(*geo, sat);
                let (az, el) = (l.az_rad.to_degrees(), l.el_rad.to_degrees());
                match sky {
                    None => (el >= mask_deg, false),
                    Some(sky) => (sky.visible(az, el, mask_deg), sky.masked(az, el, mask_deg)),
                }
            }
        }
    }
}

/// Azimuth (degrees clockwise from north, in `[0, 360)`) of `sat` as seen from `user`, in the
/// geocentric east-north-up frame of [`enu_basis`]; zero at the geocentre.
pub fn azimuth_deg(user: Vec3, sat: Vec3) -> f64 {
    let Some((east, north, _)) = enu_basis(user) else {
        return 0.0;
    };
    let los = sub(sat, user);
    crate::skyline::azimuth_from_en(dot(los, east), dot(los, north))
}

/// The satellites in view of a [`UserPath`] at `t`: their positions (in the frame of
/// [`UserPath::position`]: inertial for an orbit, Earth-fixed for a ground site), their labels
/// (when `labels` is given, aligned with `gnss`), and how many were above the mask but hidden
/// by the skyline.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct SkyView {
    /// Positions of the satellites in view, in the frame of [`UserPath::position`].
    pub positions: Vec<Vec3>,
    /// Their labels (empty when none were given).
    pub labels: Vec<u8>,
    /// Satellites above the mask but below the skyline.
    pub masked: usize,
}

/// The satellites in view of `user` at `t` under `mask_deg` and an optional skyline.
pub fn sky_view(
    user: &UserPath,
    gnss: &[Propagator],
    labels: Option<&[u8]>,
    t: f64,
    mask_deg: f64,
    sky: Option<&Skyline>,
) -> SkyView {
    let mut v = SkyView::default();
    for (i, g) in gnss.iter().enumerate() {
        let sp = user.satellite_position(g, t);
        let (vis, masked) = user.view(t, sp, mask_deg, sky);
        if vis {
            v.positions.push(sp);
            if let Some(l) = labels {
                v.labels.push(l[i]);
            }
        }
        if masked {
            v.masked += 1;
        }
    }
    v
}

/// [`build_timeline`] for a [`UserPath`] under an optional skyline.
pub fn build_timeline_at(
    user: &UserPath,
    gnss: &[Propagator],
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    sky: Option<&Skyline>,
) -> GnssTimeline {
    let n = (duration_s / step_s).round() as usize;
    let mut windows = Vec::with_capacity(n + 1);
    for i in 0..=n {
        let t = i as f64 * step_s;
        let state = gnss_state(sky_view(user, gnss, None, t, mask_deg, sky).positions.len());
        windows.push(GnssWindow {
            t0: t,
            t1: t + step_s,
            state,
        });
    }
    GnssTimeline { windows }
}

/// [`summarize_dop`] for a [`UserPath`] under an optional skyline.
pub fn summarize_dop_at(
    user: &UserPath,
    gnss: &[Propagator],
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    sky: Option<&Skyline>,
    sigma_uere_m: f64,
) -> DopSummary {
    let n = (duration_s / step_s).round() as usize;
    let mut pdops = Vec::new();
    for i in 0..=n {
        let t = i as f64 * step_s;
        let view = sky_view(user, gnss, None, t, mask_deg, sky);
        // PDOP is the trace of the position block, the same in any rotated frame, so the
        // geocentric-up split inside `dop` does not reach this summary.
        if let Some(d) = dop(user.position(t), &view.positions) {
            pdops.push(d.pdop);
        }
    }
    let best_pdop = pdops.iter().copied().fold(None, |acc: Option<f64>, p| {
        Some(acc.map_or(p, |a| a.min(p)))
    });
    let median_pdop = median_sorted(pdops.clone());
    DopSummary {
        samples_total: n + 1,
        samples_with_fix: pdops.len(),
        sigma_uere_m,
        best_pdop,
        median_pdop,
        best_position_sigma_m: best_pdop.map(|p| p * sigma_uere_m),
        median_position_sigma_m: median_pdop.map(|p| p * sigma_uere_m),
    }
}

/// Resolve the user of an orbit-sampled kind from its exclusive `user` / `user_site` fields
/// and check the `[skyline]` section against it: a skyline needs a ground site, because an
/// orbiting user has no Earth-fixed azimuth.
pub fn resolve_user(
    user: Option<&OrbitCfg>,
    user_site: Option<&SiteCfg>,
    skyline: Option<&crate::skyline::SkylineCfg>,
    jd0_ut1: f64,
) -> Result<(UserPath, Option<Skyline>), String> {
    let path = match (user, user_site) {
        (Some(_), Some(_)) => {
            return Err(
                "give the user as `user` (an orbit) or `user_site` (a ground site), not both"
                    .into(),
            )
        }
        (None, None) => {
            return Err(
                "missing the user: give `user` (an orbit) or `user_site` (a ground site)".into(),
            )
        }
        (Some(u), None) => UserPath::Orbit(u.to_orbit()),
        (None, Some(s)) => UserPath::site(s, jd0_ut1)?,
    };
    if skyline.is_some() && matches!(path, UserPath::Orbit(_)) {
        return Err(
            "a [skyline] needs a ground site: give `user_site = { lat_deg, lon_deg, height_m }` \
                    instead of an orbiting `user` (an orbit has no Earth-fixed azimuth)"
                .into(),
        );
    }
    Ok((path, crate::skyline::resolve(skyline)?))
}

/// Unit and provenance class for the numeric fields the `orbit` report's `geometry`
/// block emits — the [`DopSummary`] this module computes.
///
/// The `orbit` result document is a serialised [`crate::report::RunResult`] flattened
/// alongside this `geometry` object, so `api.rs` attaches the table with
/// `json_of_with_units` rather than the pack building a `units` key inline. This table
/// covers only the `geometry.*` paths; the clock and figure-of-merit half of the
/// document (`seed`, `threshold_ns`, `quantum.*`, `classical.*`, `eci_track[][]`) is
/// described by the module that computes the run result.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "geometry.samples_total",
            unit: "count",
            provenance: Computed,
            definition: "time-grid samples at which the geometry was evaluated, \
                         round(duration_s / step_s) + 1",
        },
        FieldUnit {
            path: "geometry.samples_with_fix",
            unit: "count",
            provenance: Computed,
            definition: "samples at which at least four satellites cleared the elevation \
                         mask with a non-singular geometry, so a position fix exists",
        },
        FieldUnit {
            path: "geometry.sigma_uere_m",
            unit: "m",
            provenance: ModelledInput,
            definition: "1-sigma user-equivalent range error: the per-satellite pseudorange \
                         error budget the dilution of precision is scaled by; the default \
                         1 m is a representative dual-frequency budget line, not a \
                         measurement, and the caller may override it",
        },
        FieldUnit {
            path: "geometry.best_pdop",
            unit: "1",
            provenance: Computed,
            definition: "smallest position dilution of precision (PDOP) over the grid: the \
                         dimensionless sqrt of the trace of the position block of \
                         (H^T H)^-1; null when no sample had a fix",
        },
        FieldUnit {
            path: "geometry.median_pdop",
            unit: "1",
            provenance: Computed,
            definition: "median position dilution of precision (PDOP) over the samples that \
                         had a fix, dimensionless; null when no sample had a fix",
        },
        FieldUnit {
            path: "geometry.best_position_sigma_m",
            unit: "m",
            provenance: Computed,
            definition: "best_pdop * sigma_uere_m: the 1-sigma 3-D position accuracy at the \
                         most favourable geometry; null when no sample had a fix",
        },
        FieldUnit {
            path: "geometry.median_position_sigma_m",
            unit: "m",
            provenance: Computed,
            definition: "median_pdop * sigma_uere_m: the 1-sigma 3-D position accuracy at \
                         the typical geometry; null when no sample had a fix",
        },
    ]
};

/// A geometry summary over the run: how often a position fix is possible and the
/// resulting position accuracy (position DOP times the user-equivalent range
/// error). Best is the most favourable geometry, median the typical one.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DopSummary {
    pub samples_total: usize,
    pub samples_with_fix: usize,
    pub sigma_uere_m: f64,
    pub best_pdop: Option<f64>,
    pub median_pdop: Option<f64>,
    pub best_position_sigma_m: Option<f64>,
    pub median_position_sigma_m: Option<f64>,
}

fn median_sorted(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

/// Sample the position dilution of precision on the time grid and summarise it.
/// `sigma_uere_m` is the 1-sigma user-equivalent range error; the position
/// accuracy at each sample is `pdop * sigma_uere_m`.
pub fn summarize_dop(
    user: &Orbit,
    gnss: &[Propagator],
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    sigma_uere_m: f64,
) -> DopSummary {
    let n = (duration_s / step_s).round() as usize;
    let mut pdops = Vec::new();
    for i in 0..=n {
        let t = i as f64 * step_s;
        if let Some(d) = dop(
            user.position_eci(t),
            &visible_positions(user, gnss, t, mask_deg),
        ) {
            pdops.push(d.pdop);
        }
    }
    let best_pdop = pdops.iter().copied().fold(None, |acc: Option<f64>, p| {
        Some(acc.map_or(p, |a| a.min(p)))
    });
    let median_pdop = median_sorted(pdops.clone());
    DopSummary {
        samples_total: n + 1,
        samples_with_fix: pdops.len(),
        sigma_uere_m,
        best_pdop,
        median_pdop,
        best_position_sigma_m: best_pdop.map(|p| p * sigma_uere_m),
        median_position_sigma_m: median_pdop.map(|p| p * sigma_uere_m),
    }
}

/// A clock-holdover scenario whose GNSS availability is derived from orbital
/// geometry: a user spacecraft, a GNSS constellation, and an elevation mask,
/// rather than hand-authored windows.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct OrbitClockScenario {
    pub seed: u64,
    pub threshold_ns: f64,
    pub mask_deg: f64,
    /// 1-sigma user-equivalent range error (m) for the position-accuracy summary.
    #[serde(default = "default_uere_m")]
    pub sigma_uere_m: f64,
    pub time: TimeCfg,
    /// The user as an orbit. Exactly one of `user` and `user_site` is given.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub user: Option<OrbitCfg>,
    /// The user as a ground site (design note item 1): geodetic elevation and azimuth, so a
    /// `[skyline]` applies. Exactly one of `user` and `user_site` is given.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub user_site: Option<SiteCfg>,
    pub constellation: ConstellationCfg,
    /// Additional constellations combined with `constellation` for multi-GNSS
    /// availability and dilution of precision (e.g. GPS plus Galileo).
    #[serde(default)]
    pub constellations: Vec<ConstellationCfg>,
    pub clock_quantum: ClockCfg,
    pub clock_classical: ClockCfg,
    /// Optional calendar epoch (UTC/GPS) labelling time `t = 0`, used when exporting
    /// the propagated constellation to SP3. Defaults to 2000-01-01 00:00:00.
    #[serde(default)]
    pub epoch: Option<crate::rinex::EpochUtc>,
    /// When `true`, the CLI also writes the propagated constellation to an SP3-c file
    /// (`<scenario>.sp3`) alongside the usual result/chart/report outputs.
    #[serde(default)]
    pub export_sp3: bool,
    /// When `true`, the CLI also writes the constellation's mean elements to a CCSDS
    /// OMM file (`<scenario>.omm`). Only meaningful for a TLE-defined constellation;
    /// a synthetic Walker or RINEX scenario has no TLE mean elements to export.
    #[serde(default)]
    pub export_omm: bool,
    /// When `true`, the CLI also writes the propagated constellation to a CCSDS OEM
    /// (Orbit Ephemeris Message) file (`<scenario>.oem`): the inertial state time
    /// series — position AND velocity — in the spacecraft-ephemeris interchange
    /// format flight-dynamics tools (GMAT/Orekit/STK) read. Unlike SP3 (Earth-fixed,
    /// position-only) OEM carries the full TEME state, so it is the velocity-carrying
    /// export. Works for any constellation (Walker / TLE / RINEX).
    #[serde(default)]
    pub export_oem: bool,
    /// Optional azimuth-dependent skyline over `mask_deg` (see [`crate::skyline`]); needs a
    /// `user_site`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub skyline: Option<crate::skyline::SkylineCfg>,
}

/// Default SP3 start epoch when a scenario does not declare one: J2000 calendar date.
pub(crate) const DEFAULT_SP3_EPOCH: crate::rinex::EpochUtc = crate::rinex::EpochUtc {
    year: 2000,
    month: 1,
    day: 1,
    hour: 0,
    minute: 0,
    second: 0.0,
};

impl OrbitClockScenario {
    /// UT1 Julian date of `t = 0`: the scenario's `epoch`, or the J2000 default the SP3
    /// export uses.
    pub fn jd0_ut1(&self) -> f64 {
        let e = self.epoch.unwrap_or(DEFAULT_SP3_EPOCH);
        crate::timescales::julian_date(e.year, e.month, e.day, e.hour, e.minute, e.second)
    }

    /// The user (an orbit or a ground site) and the skyline, checked against each other.
    pub fn user_and_sky(&self) -> Result<(UserPath, Option<Skyline>), String> {
        resolve_user(
            self.user.as_ref(),
            self.user_site.as_ref(),
            self.skyline.as_ref(),
            self.jd0_ut1(),
        )
    }

    /// [`OrbitClockScenario::user_and_sky`] with a ground site dated for `gnss`
    /// ([`UserPath::dated_by`]): the scenario's `epoch` when it states one, else the newest
    /// propagator epoch.
    pub fn user_and_sky_for(
        &self,
        gnss: &[Propagator],
    ) -> Result<(UserPath, Option<Skyline>), String> {
        let (u, s) = self.user_and_sky()?;
        Ok((u.dated_by(self.epoch.is_some(), gnss), s))
    }

    /// All satellites visible to the user: the primary constellation plus any
    /// additional ones, parsed and combined.
    pub fn all_satellites(&self) -> Result<Vec<Propagator>, String> {
        let mut sats = self.constellation.satellites()?;
        for c in &self.constellations {
            sats.extend(c.satellites()?);
        }
        Ok(sats)
    }

    /// Export the propagated constellation as an SP3-c position file: each satellite
    /// is sampled on the scenario's time grid and rotated into ECEF. Satellite IDs
    /// are assigned positionally (`Gnn`) since the TLE name lines are not carried
    /// through the propagators. The start epoch is the scenario's `epoch` (or the
    /// J2000 default). This is the export half of SP3 interop — Kshana orbits out,
    /// in the format Ginan/RTKLIB/gLAB ingest.
    pub fn to_sp3_string(&self) -> Result<String, String> {
        let sats = self.all_satellites()?;
        if sats.is_empty() {
            return Err("no satellites to export".into());
        }
        let ids: Vec<String> = (1..=sats.len()).map(|i| format!("G{i:02}")).collect();
        let start = self.epoch.unwrap_or(DEFAULT_SP3_EPOCH);
        let start_jd_ut1 = crate::timescales::julian_date(
            start.year,
            start.month,
            start.day,
            start.hour,
            start.minute,
            start.second,
        );
        let step_s = self.time.step_s;
        if step_s <= 0.0 {
            return Err("time.step_s must be positive for SP3 export".into());
        }
        let num_epochs = (self.time.duration_s / step_s).round() as usize + 1;
        Ok(crate::sp3::Sp3File::from_propagators(
            &ids,
            &sats,
            start,
            start_jd_ut1,
            step_s,
            num_epochs,
        )
        .to_sp3_string())
    }

    /// Export the constellation's mean elements as a CCSDS OMM catalogue: one OMM
    /// message per TLE-defined satellite (the primary constellation plus any extra
    /// `constellations`), concatenated in KVN form. Errors if no constellation is
    /// TLE-defined — a synthetic Walker or RINEX scenario has no mean elements to
    /// publish. `CREATION_DATE` is the scenario's `epoch` (or the J2000 default) in
    /// calendar form, so the output is reproducible rather than wall-clock-stamped.
    pub fn to_omm_string(&self) -> Result<String, String> {
        let e = self.epoch.unwrap_or(DEFAULT_SP3_EPOCH);
        let creation = format!(
            "{:04}-{:02}-{:02}T{:02}:{:02}:{:06.3}",
            e.year, e.month, e.day, e.hour, e.minute, e.second
        );
        let mut blocks: Vec<&str> = Vec::new();
        if let Some(t) = &self.constellation.tle {
            blocks.push(t.as_str());
        }
        for c in &self.constellations {
            if let Some(t) = &c.tle {
                blocks.push(t.as_str());
            }
        }
        let mut files = Vec::new();
        for b in blocks {
            files.extend(crate::omm::OmmFile::from_tle_block(b, "Kshana", &creation)?);
        }
        if files.is_empty() {
            return Err(
                "OMM export requires a TLE-defined constellation; this scenario has none".into(),
            );
        }
        Ok(files
            .iter()
            .map(|f| f.to_omm_kvn())
            .collect::<Vec<_>>()
            .join("\n"))
    }

    /// Export the propagated constellation as a CCSDS OEM (Orbit Ephemeris Message):
    /// each satellite is sampled on the scenario's time grid directly in the inertial
    /// TEME frame and written with its full state — position AND velocity (km, km/s).
    /// This is the velocity-carrying spacecraft-ephemeris interchange format
    /// (GMAT/Orekit/STK), the complement of the position-only Earth-fixed SP3 export.
    /// Works for any constellation (Walker / TLE / RINEX). Satellite IDs are assigned
    /// positionally (`Gnn`). The start epoch and the deterministic `CREATION_DATE` are
    /// the scenario's `epoch` (or the J2000 default).
    pub fn to_oem_string(&self) -> Result<String, String> {
        let sats = self.all_satellites()?;
        if sats.is_empty() {
            return Err("no satellites to export".into());
        }
        let ids: Vec<String> = (1..=sats.len()).map(|i| format!("G{i:02}")).collect();
        let start = self.epoch.unwrap_or(DEFAULT_SP3_EPOCH);
        let step_s = self.time.step_s;
        if step_s <= 0.0 {
            return Err("time.step_s must be positive for OEM export".into());
        }
        let num_epochs = (self.time.duration_s / step_s).round() as usize + 1;
        Ok(
            crate::oem::OemFile::from_propagators(&ids, &sats, start, step_s, num_epochs, start)
                .to_oem_string(),
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::f64::consts::{FRAC_PI_2, PI};

    #[test]
    fn period_matches_mean_motion() {
        let o = Orbit::new(7.0e6, 0.0, 0.0, 0.0);
        assert!((o.mean_motion() * o.period_s() - std::f64::consts::TAU).abs() < 1e-9);
    }

    #[test]
    fn position_in_frame_is_consistent_across_frames() {
        let p = Propagator::Kepler(Orbit::new(7.0e6, 0.9, 0.5, 0.3));
        let (jd_tt, jd_ut1) = (2_451_545.0 + 4000.0, 2_451_545.0 + 4000.0);
        let t = 1234.0;
        let norm = |v: Vec3| (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
        let teme = p.position_in_frame(t, Frame::Teme, jd_tt, jd_ut1, 0.0, 0.0);
        let gcrs = p.position_in_frame(t, Frame::Gcrs, jd_tt, jd_ut1, 0.0, 0.0);
        let itrs = p.position_in_frame(t, Frame::Itrs, jd_tt, jd_ut1, 0.0, 0.0);
        // TEME passthrough is exactly position_eci; all three are pure rotations of
        // the same vector, so magnitude is preserved across frames.
        assert_eq!(teme, p.position_eci(t));
        assert!((norm(gcrs) - norm(teme)).abs() < 1e-6, "GCRS preserves |r|");
        assert!((norm(itrs) - norm(teme)).abs() < 1e-6, "ITRS preserves |r|");
        // GCRS is rotated off TEME by precession+nutation (tens of arcsec → tens of
        // metres at this radius), i.e. distinct but not wildly different.
        let d_gcrs = norm([gcrs[0] - teme[0], gcrs[1] - teme[1], gcrs[2] - teme[2]]);
        assert!((1.0..50_000.0).contains(&d_gcrs), "GCRS−TEME = {d_gcrs} m");
        // ITRS is the Earth-fixed frame: it differs from the inertial frames by the
        // full sidereal rotation, so it is far from TEME (thousands of km here).
        let d_itrs = norm([itrs[0] - teme[0], itrs[1] - teme[1], itrs[2] - teme[2]]);
        assert!(
            d_itrs > 1.0e6,
            "ITRS−TEME should be a large (sidereal) shift"
        );
        // The ITRS position equals the CIO GCRS→ITRS of the GCRS position.
        let itrs_via_gcrs = crate::cio::gcrs_to_itrs(gcrs, jd_tt, jd_ut1, 0.0, 0.0);
        for k in 0..3 {
            assert!(
                (itrs[k] - itrs_via_gcrs[k]).abs() < 1e-6,
                "ITRS path consistency[{k}]"
            );
        }
    }

    #[test]
    fn state_gcrs_preserves_speed_and_position_magnitude() {
        let p = Propagator::Kepler(Orbit::new(7.0e6, 0.3, 0.4, 0.2));
        let jd_tt = 2_451_545.0 + 4000.0;
        let t = 800.0;
        let teme = p.state_eci(t);
        let gcrs = p.state_gcrs(t, jd_tt);
        let norm = |v: Vec3| (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
        assert!((norm(gcrs.r_m) - norm(teme.r_m)).abs() < 1e-6);
        assert!((norm(gcrs.v_m_s) - norm(teme.v_m_s)).abs() < 1e-9);
    }

    #[test]
    fn position_returns_after_one_period() {
        let o = Orbit::new(7.0e6, 0.9, 0.5, 0.3);
        let p0 = o.position_eci(0.0);
        let p1 = o.position_eci(o.period_s());
        for k in 0..3 {
            assert!(
                (p0[k] - p1[k]).abs() < 1e-3,
                "axis {k}: {} vs {}",
                p0[k],
                p1[k]
            );
        }
    }

    #[test]
    fn equatorial_orbit_is_planar() {
        let o = Orbit::new(7.0e6, 0.0, 0.0, 0.0);
        for i in 0..8 {
            let t = i as f64 * 300.0;
            assert!(o.position_eci(t)[2].abs() < 1e-6, "z not ~0 at t={t}");
        }
        // Radius is preserved.
        assert!((norm(o.position_eci(1234.0)) - 7.0e6).abs() < 1e-3);
    }

    #[test]
    fn circular_velocity_matches_vis_viva() {
        // For a circular orbit the speed is sqrt(mu/r) and v is perpendicular to r.
        let o = Orbit::new(7.0e6, 0.6, 0.4, 0.2);
        let expect = (MU_EARTH / 7.0e6).sqrt();
        let r = o.position_eci(321.0);
        let v = o.velocity_eci(321.0);
        assert!(
            (norm(v) - expect).abs() / expect < 1e-6,
            "speed {} vs vis-viva {expect}",
            norm(v)
        );
        let dot = r[0] * v[0] + r[1] * v[1] + r[2] * v[2];
        assert!(
            dot.abs() / (norm(r) * norm(v)) < 1e-5,
            "r.v should be ~0 for a circular orbit, got {dot}"
        );
    }

    #[test]
    fn eccentric_velocity_matches_vis_viva() {
        // vis-viva: v^2 = mu(2/r - 1/a) holds at every point of a Keplerian orbit.
        let a = 8.0e6;
        let e = 0.2;
        let o = Orbit::keplerian(a, e, 0.5, 0.3, 0.1, 0.7);
        for &t in &[0.0, 600.0, 1500.0, 3000.0] {
            let r = norm(o.position_eci(t));
            let v = norm(o.velocity_eci(t));
            let expect = (MU_EARTH * (2.0 / r - 1.0 / a)).sqrt();
            assert!((v - expect).abs() / expect < 1e-4, "t={t}: {v} vs {expect}");
        }
    }

    #[test]
    fn propagator_state_eci_is_consistent() {
        // state_eci must agree with the separate position/velocity accessors.
        let p = Propagator::Kepler(Orbit::new(7.0e6, 0.3, 0.0, 0.0));
        let s = p.state_eci(500.0);
        assert_eq!(s.r_m, p.position_eci(500.0));
        assert_eq!(s.v_m_s, p.velocity_eci(500.0));
    }

    // A minimal RINEX 3 GPS navigation file (Toe = 172 800 s, GPS week 2244),
    // reused from the parser's own fixture, to drive a Propagator::Rinex.
    const RINEX_SAMPLE: &str = "\
     3.04           N: GNSS NAV DATA    G: GPS              RINEX VERSION / TYPE
                                                            END OF HEADER
G01 2023 01 01 00 00 00 4.567890123456D-04 1.136868377216D-12 0.000000000000D+00
     6.500000000000D+01-1.234375000000D+01 4.567890123456D-09-1.234567890123D+00
    -6.146728992462D-07 1.234567890123D-02 7.430091500282D-06 5.153679868698D+03
     1.728000000000D+05 1.117587089539D-08-1.234567890123D+00 7.450580596924D-09
     9.876543210987D-01 2.612500000000D+02 5.678901234567D-01-8.123456789012D-09
    -2.345678901234D-10 1.000000000000D+00 2.244000000000D+03 0.000000000000D+00
     2.000000000000D+00 0.000000000000D+00-1.117587089539D-08 6.500000000000D+01
     1.674000000000D+05 4.000000000000D+00 0.000000000000D+00 0.000000000000D+00";

    fn rinex_propagator() -> Propagator {
        crate::rinex::parse_nav(RINEX_SAMPLE).unwrap()[0].into()
    }

    #[test]
    fn rinex_propagator_position_is_a_gps_orbit_in_eci() {
        // At t = 0 (the ephemeris reference time Toe) the inertial position must
        // be the TEME rotation of the broadcast ECEF position, at GPS radius.
        let p = rinex_propagator();
        let eph = &crate::rinex::parse_nav(RINEX_SAMPLE).unwrap()[0];
        assert_eq!(p.position_eci(0.0), eph.sv_position_teme(eph.toe));
        let r = norm(p.position_eci(0.0));
        assert!((r - 26_560_000.0).abs() < 600_000.0, "r = {r:.0} m");
    }

    #[test]
    fn rinex_propagator_velocity_is_a_gps_orbital_speed() {
        // A GPS satellite's inertial speed is ~3.9 km/s, and the velocity is
        // nearly perpendicular to the radius (small radial term from e ≈ 0.012).
        let p = rinex_propagator();
        let r = p.position_eci(0.0);
        let v = p.velocity_eci(0.0);
        let speed = norm(v);
        assert!(
            (3.0e3..4.5e3).contains(&speed),
            "inertial speed {speed:.1} m/s"
        );
        let cos_angle = dot(r, v).abs() / (norm(r) * speed);
        assert!(
            cos_angle < 0.2,
            "r·v not near-perpendicular: cos = {cos_angle:.3}"
        );
    }

    #[test]
    fn rinex_propagator_state_eci_matches_accessors_and_period() {
        let p = rinex_propagator();
        let s = p.state_eci(300.0);
        assert_eq!(s.r_m, p.position_eci(300.0));
        assert_eq!(s.v_m_s, p.velocity_eci(300.0));
        // ~11 h 58 m GPS period.
        assert!(
            (4.2e4..4.4e4).contains(&p.period_s()),
            "period {} s",
            p.period_s()
        );
    }

    #[test]
    fn constellation_from_rinex_block_builds_broadcast_propagators() {
        // A constellation configured with an inline RINEX block yields one
        // Propagator::Rinex per parsed GPS ephemeris — the end-to-end path that
        // lets a real broadcast file drive a scenario.
        let cfg = ConstellationCfg {
            altitude_km: 0.0,
            inclination_deg: 0.0,
            planes: 0,
            sats_per_plane: 0,
            phasing_f: 0.0,
            tle: None,
            rinex: Some(RINEX_SAMPLE.to_string()),
            strict_checksum: false,
        };
        let sats = cfg.satellites().expect("rinex constellation builds");
        assert_eq!(sats.len(), 1);
        assert!(matches!(sats[0], Propagator::Rinex(_)));
        // It propagates as a GPS orbit.
        assert!((norm(sats[0].position_eci(0.0)) - 26_560_000.0).abs() < 600_000.0);
    }

    #[test]
    fn constellation_from_mixed_gps_and_galileo_rinex() {
        // A multi-GNSS RINEX block (one GPS + one Galileo record) builds a
        // constellation containing both — Galileo now flows through the same
        // pipeline as GPS.
        let galileo = RINEX_SAMPLE
            .replace("G01 2023 01 01 00 00 00", "E11 2023 01 01 00 00 00")
            .replace("5.153679868698D+03", "5.440611572266D+03");
        // Append the Galileo record (its 8 data lines) after the GPS one.
        let gal_record = galileo.lines().skip(2).collect::<Vec<_>>().join("\n");
        let mixed = format!("{RINEX_SAMPLE}\n{gal_record}");
        let cfg = ConstellationCfg {
            altitude_km: 0.0,
            inclination_deg: 0.0,
            planes: 0,
            sats_per_plane: 0,
            phasing_f: 0.0,
            tle: None,
            rinex: Some(mixed),
            strict_checksum: false,
        };
        let sats = cfg.satellites().expect("mixed constellation builds");
        assert_eq!(sats.len(), 2);
        assert!(sats.iter().all(|s| matches!(s, Propagator::Rinex(_))));
    }

    // A RINEX 3 GLONASS record (epoch + three state-vector lines).
    const GLONASS_RECORD: &str =
        "R01 2023 01 01 00 15 00-1.234567890123D-04 0.000000000000D+00 9.000000000000D+02
     7.150123046875D+03 2.500000000000D+00 9.313225746155D-10 0.000000000000D+00
    -1.512345678901D+04 2.800000000000D+00 0.000000000000D+00 1.000000000000D+00
     1.890123456789D+04 1.300000000000D+00-1.862645149231D-09 0.000000000000D+00";

    #[test]
    fn glonass_propagator_is_a_glonass_orbit() {
        let header = "     3.04           N: GNSS NAV DATA    R: GLONASS          RINEX VERSION / TYPE\n                                                            END OF HEADER\n";
        let text = format!("{header}{GLONASS_RECORD}");
        let eph = crate::glonass::parse_glonass_nav(&text).unwrap()[0];
        let p: Propagator = eph.into();
        assert!(matches!(p, Propagator::Glonass(_)));
        // GLONASS satellites orbit at ~25 500 km; the period is ~11 h 15 m.
        assert!((norm(p.position_eci(0.0)) - 25_500_000.0).abs() < 1_000_000.0);
        assert!(
            (3.9e4..4.2e4).contains(&p.period_s()),
            "period {} s",
            p.period_s()
        );
    }

    #[test]
    fn constellation_from_mixed_gps_and_glonass_rinex() {
        // A block with a GPS record and a GLONASS record builds a two-satellite
        // constellation — one Keplerian, one state-vector — through one rinex field.
        let mixed = format!("{RINEX_SAMPLE}\n{GLONASS_RECORD}");
        let cfg = ConstellationCfg {
            altitude_km: 0.0,
            inclination_deg: 0.0,
            planes: 0,
            sats_per_plane: 0,
            phasing_f: 0.0,
            tle: None,
            rinex: Some(mixed),
            strict_checksum: false,
        };
        let sats = cfg.satellites().expect("mixed GPS+GLONASS builds");
        assert_eq!(sats.len(), 2);
        assert!(sats.iter().any(|s| matches!(s, Propagator::Rinex(_))));
        assert!(sats.iter().any(|s| matches!(s, Propagator::Glonass(_))));
    }

    #[test]
    fn constellation_from_a_real_broadcast_file_has_one_propagator_per_satellite() {
        // A real daily IGS navigation file carries a fresh record per satellite
        // roughly every two hours, so one propagator per RECORD puts several
        // copies of the same satellite in the sky at once, each at its own Toe
        // and so at a different point on its orbit. That phantom constellation
        // reports a physically impossible geometry (BRDC below gave 57
        // propagators for 32 GPS satellites, GDOP 0.42, where a real GPS sky is
        // ~31 satellites at GDOP 1.5-2.5). The constellation must be one
        // propagator per (system, PRN).
        const BRDM: &str = include_str!("../tests/fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx");
        const BRDC: &str = include_str!("../tests/fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx");
        for (name, text) in [("BRDM00DLR", BRDM), ("BRDC00WRD", BRDC)] {
            let cfg = ConstellationCfg {
                altitude_km: 0.0,
                inclination_deg: 0.0,
                planes: 0,
                sats_per_plane: 0,
                phasing_f: 0.0,
                tle: None,
                rinex: Some(text.to_string()),
                strict_checksum: false,
            };
            let sats = cfg
                .satellites()
                .unwrap_or_else(|e| panic!("{name}: real nav file builds a constellation: {e}"));
            let mut keys: Vec<(char, u8)> = sats
                .iter()
                .map(|p| match p {
                    Propagator::Rinex(e) => (e.system, e.prn),
                    Propagator::Glonass(e) => ('R', e.prn),
                    other => panic!("{name}: unexpected propagator {other:?}"),
                })
                .collect();
            let built = keys.len();
            keys.sort_unstable();
            keys.dedup();
            assert_eq!(
                keys.len(),
                built,
                "{name}: {} propagators for {} distinct satellites",
                built,
                keys.len()
            );
            // No satellite the parsers decode is lost on the way: every distinct
            // (system, PRN) in the file is still represented exactly once.
            let mut parsed: Vec<(char, u8)> = crate::rinex::parse_nav(text)
                .expect("nav parses")
                .iter()
                .map(|e| (e.system, e.prn))
                .collect();
            parsed.extend(
                crate::glonass::parse_glonass_nav(text)
                    .expect("glonass parses")
                    .iter()
                    .map(|e| ('R', e.prn)),
            );
            parsed.sort_unstable();
            parsed.dedup();
            assert_eq!(keys, parsed, "{name}: satellite set changed");
        }
    }

    #[test]
    fn constellation_rejects_a_rinex_block_with_no_gps_ephemerides() {
        let cfg = ConstellationCfg {
            altitude_km: 0.0,
            inclination_deg: 0.0,
            planes: 0,
            sats_per_plane: 0,
            phasing_f: 0.0,
            tle: None,
            rinex: Some("     3.04           N: GNSS NAV DATA\n        END OF HEADER".to_string()),
            strict_checksum: false,
        };
        assert!(cfg.satellites().is_err());
    }

    #[test]
    fn polar_orbit_stays_in_x_z_plane() {
        // i = 90 deg, RAAN = 0: the orbit plane contains the z-axis, so Y stays ~0.
        let o = Orbit::new(7.0e6, FRAC_PI_2, 0.0, 0.0);
        for i in 0..8 {
            let t = i as f64 * 300.0;
            assert!(o.position_eci(t)[1].abs() < 1e-6, "y not ~0 at t={t}");
        }
    }

    #[test]
    fn kepler_solution_satisfies_the_equation() {
        // E must satisfy M = E - e sin E; check the residual across e and M.
        for &(m, e) in &[(1.0, 0.3), (0.2, 0.7), (3.0, 0.1), (-1.5, 0.5)] {
            let ea = solve_kepler(m, e);
            assert!((ea - e * ea.psin() - m).abs() < 1e-12, "M={m} e={e}");
        }
        assert_eq!(solve_kepler(1.234, 0.0), 1.234); // circular is exact
    }

    #[test]
    fn eccentric_orbit_hits_perigee_and_apogee_radii() {
        // At epoch (M=0) the body is at perigee r=a(1-e); half a period later
        // (M=pi) it is at apogee r=a(1+e). Equatorial, so it stays in the z=0 plane.
        let (a, e) = (1.0e7, 0.2);
        let o = Orbit::keplerian(a, e, 0.0, 0.0, 0.0, 0.0);
        let rp = norm(o.position_eci(0.0));
        let ra = norm(o.position_eci(o.period_s() * 0.5));
        assert!((rp - a * (1.0 - e)).abs() < 1.0, "perigee {rp}");
        assert!((ra - a * (1.0 + e)).abs() < 1.0, "apogee {ra}");
        assert!(
            o.position_eci(1234.0)[2].abs() < 1e-6,
            "equatorial stays planar"
        );
    }

    #[test]
    fn keplerian_with_zero_eccentricity_matches_the_circular_orbit() {
        let circ = Orbit::new(7.0e6, 0.6, 0.4, 0.3);
        let kep = Orbit::keplerian(7.0e6, 0.0, 0.6, 0.4, 0.0, 0.3);
        for i in 0..6 {
            let t = i as f64 * 500.0;
            let (c, k) = (circ.position_eci(t), kep.position_eci(t));
            for axis in 0..3 {
                assert!((c[axis] - k[axis]).abs() < 1e-9, "axis {axis} at t={t}");
            }
        }
    }

    #[test]
    fn j2_precession_signs_and_critical_inclination() {
        // Prograde (i<90 deg): the node regresses (Omega_dot < 0).
        let prograde = Orbit::keplerian(7.0e6, 0.0, 0.9, 0.0, 0.0, 0.0).with_j2();
        assert!(prograde.raan_dot < 0.0, "prograde node should regress");
        // Polar (i=90 deg): no nodal regression.
        let polar = Orbit::keplerian(7.0e6, 0.0, FRAC_PI_2, 0.0, 0.0, 0.0).with_j2();
        assert!(
            polar.raan_dot.abs() < 1e-12,
            "polar raan_dot={}",
            polar.raan_dot
        );
        // Retrograde (i>90 deg): the node advances.
        let retro = Orbit::keplerian(7.0e6, 0.0, 2.0, 0.0, 0.0, 0.0).with_j2();
        assert!(retro.raan_dot > 0.0, "retrograde node should advance");
        // Critical inclination i = acos(1/sqrt(5)) ~ 63.43 deg: apsides do not drift.
        let crit_i = (1.0_f64 / 5.0_f64.sqrt()).pacos();
        let crit = Orbit::keplerian(7.0e6, 0.01, crit_i, 0.0, 0.0, 0.0).with_j2();
        assert!(crit.argp_dot.abs() < 1e-15, "argp_dot={}", crit.argp_dot);
    }

    #[test]
    fn antipodal_satellite_is_occulted() {
        // User and satellite on opposite sides of Earth: line of sight through the
        // centre is blocked.
        let user = [7.0e6, 0.0, 0.0];
        let sat = [-2.0e7, 0.0, 0.0];
        assert!(earth_occults(user, sat));
    }

    #[test]
    fn radially_outward_satellite_is_visible_and_overhead() {
        // Satellite straight up from the user: not occulted, elevation 90 deg.
        let user = [7.0e6, 0.0, 0.0];
        let sat = [2.0e7, 0.0, 0.0];
        assert!(!earth_occults(user, sat));
        assert!((elevation_deg(user, sat) - 90.0).abs() < 1e-9);
    }

    #[test]
    fn tangential_satellite_is_on_the_horizon() {
        // Satellite displaced purely tangentially sits on the local horizon (0 deg).
        let user = [7.0e6, 0.0, 0.0];
        let sat = [7.0e6, 1.0e6, 0.0];
        assert!((elevation_deg(user, sat) - 0.0).abs() < 1e-9);
    }

    #[test]
    fn occultation_accounts_for_oblateness() {
        // The same grazing radius (6360 km) the oblate spheroid resolves two ways:
        // over the flattened pole (polar radius ~6350 km) the ray clears, while
        // over the equator (radius 6371 km) it is blocked. A pure 6371 km sphere
        // would block both. Tangent geometry: the segment midpoint is the closest
        // approach.
        let polar_user = [1.0e7, 0.0, 6.360e6];
        let polar_sat = [-1.0e7, 0.0, 6.360e6];
        assert!(
            !earth_occults(polar_user, polar_sat),
            "a polar grazing ray should clear the flattened pole"
        );

        let equ_user = [6.360e6, 1.0e7, 0.0];
        let equ_sat = [6.360e6, -1.0e7, 0.0];
        assert!(
            earth_occults(equ_user, equ_sat),
            "an equatorial grazing ray at the same radius should be blocked"
        );
    }

    #[test]
    fn occultation_can_include_an_atmosphere_shell() {
        // A ray grazing 6385 km clears the solid Earth (equatorial radius 6371 km)
        // but is occulted once the dense lower-atmosphere shell is added.
        let user = [6.385e6, 1.0e7, 0.0];
        let sat = [6.385e6, -1.0e7, 0.0];
        assert!(!earth_occults(user, sat), "clears the solid Earth");
        assert!(
            earth_occults_with_atmosphere(user, sat, ATMOSPHERE_OCCULT_KM),
            "blocked when grazing through the atmosphere"
        );
    }

    fn clock(id: &str, y0: f64, q_wf: f64, q_rw: f64) -> ClockCfg {
        ClockCfg {
            id: id.into(),
            provenance: "test".into(),
            y0,
            q_wf,
            q_rw,
            drift: 0.0,
            flicker_floor: 0.0,
        }
    }

    fn scenario(planes: usize, sats_per_plane: usize) -> OrbitClockScenario {
        OrbitClockScenario {
            seed: 7,
            threshold_ns: 100.0,
            mask_deg: 5.0,
            sigma_uere_m: 1.0,
            time: TimeCfg {
                step_s: 60.0,
                duration_s: 7200.0,
            },
            // User above the GNSS constellation (geostationary altitude).
            user: Some(OrbitCfg {
                altitude_km: 35786.0,
                inclination_deg: 0.0,
                raan_deg: 0.0,
                u0_deg: 0.0,
                eccentricity: 0.0,
                argp_deg: 0.0,
                j2: false,
            }),
            user_site: None,
            // GPS-like Walker constellation (MEO ~20,180 km, 55 deg).
            constellation: ConstellationCfg {
                altitude_km: 20180.0,
                inclination_deg: 55.0,
                planes,
                sats_per_plane,
                phasing_f: 1.0,
                tle: None,
                rinex: None,
                strict_checksum: false,
            },
            constellations: vec![],
            clock_quantum: clock("optical", 1e-13, 1e-26, 1e-34),
            clock_classical: clock("csac", 1e-11, 1e-24, 1e-32),
            epoch: None,
            skyline: None,
            export_sp3: false,
            export_omm: false,
            export_oem: false,
        }
    }

    // A two-object three-line TLE block used to drive the OMM export tests.
    const TWO_SAT_TLE: &str = "ISS (ZARYA)\n\
        1 25544U 98067A   24001.00000000  .00000000  00000-0  00000-0 0  9990\n\
        2 25544  51.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537\n\
        VANGUARD 1\n\
        1 00005U 58002B   00179.78495062  .00000023  00000-0  28098-4 0  4753\n\
        2 00005  34.2682 348.7242 1859667 331.7664  19.3264 10.82419157413667";

    #[test]
    fn to_omm_string_emits_one_message_per_tle_satellite() {
        let mut scn = scenario(3, 1);
        scn.constellation = ConstellationCfg {
            altitude_km: 0.0,
            inclination_deg: 0.0,
            planes: 0,
            sats_per_plane: 0,
            phasing_f: 0.0,
            tle: Some(TWO_SAT_TLE.into()),
            rinex: None,
            strict_checksum: false,
        };
        let omm = scn
            .to_omm_string()
            .expect("OMM export from a TLE constellation");
        assert_eq!(omm.matches("CCSDS_OMM_VERS = 2.0").count(), 2);
        assert!(omm.contains("NORAD_CAT_ID = 25544"));
        assert!(omm.contains("NORAD_CAT_ID = 5"));
        assert!(omm.contains("OBJECT_ID = 1998-067A"));
        // The originator is stamped on every message.
        assert_eq!(omm.matches("ORIGINATOR = Kshana").count(), 2);
    }

    #[test]
    fn to_omm_string_errors_for_a_synthetic_walker_scenario() {
        // The default fixture is a synthetic Walker constellation with no TLEs.
        let scn = scenario(6, 4);
        assert!(scn.to_omm_string().is_err());
    }

    #[test]
    fn a_ground_site_turns_with_the_earth_and_sees_geodetic_look_angles() {
        let site = SiteCfg {
            lat_deg: 52.0,
            lon_deg: 5.0,
            height_m: 45.0,
        };
        let jd0 = 2_451_545.0;
        let user = UserPath::site(&site, jd0).unwrap();
        let UserPath::Site { ecef, geo, .. } = &user else {
            panic!("a site")
        };
        for t in [0.0, 3600.0, 43_200.0] {
            let back = crate::frames::teme_to_ecef(user.position_eci(t), jd0 + t / 86_400.0);
            for k in 0..3 {
                assert!((back[k] - ecef[k]).abs() < 1e-6, "t {t}");
            }
        }
        // A satellite straight above the site (along the ellipsoid normal) is at 90 deg.
        let (sl, cl) = geo.lat_rad.psin_cos();
        let (so, co) = geo.lon_rad.psin_cos();
        let up = [cl * co, cl * so, sl];
        let sat_ecef = [0, 1, 2].map(|k| ecef[k] + 2.0e7 * up[k]);
        let t = 600.0;
        assert_eq!(user.position(t), *ecef);
        assert_eq!(user.view(t, sat_ecef, 89.9, None), (true, false));
        // A skyline cannot hide the zenith; refusals of the user fields.
        let sky = crate::skyline::preset("city-street").unwrap().skyline();
        assert_eq!(user.view(t, sat_ecef, 5.0, Some(&sky)), (true, false));
        let orbit = OrbitCfg {
            altitude_km: 500.0,
            inclination_deg: 0.0,
            raan_deg: 0.0,
            u0_deg: 0.0,
            eccentricity: 0.0,
            argp_deg: 0.0,
            j2: false,
        };
        let cfg = crate::skyline::SkylineCfg::default();
        assert!(resolve_user(Some(&orbit), Some(&site), None, jd0).is_err());
        assert!(resolve_user(None, None, None, jd0).is_err());
        assert!(resolve_user(Some(&orbit), None, Some(&cfg), jd0)
            .unwrap_err()
            .contains("user_site"));
        assert!(resolve_user(None, Some(&site), Some(&cfg), jd0).is_ok());
    }

    #[test]
    fn a_ground_site_splits_horizontal_and_vertical_along_the_geodetic_up() {
        // The reference: the ENU components of a line of sight from the geodetic look angles
        // (frames::look_angles, the WGS-84 ellipsoid normal), compared with the projection
        // onto the site's basis, both Earth-fixed.
        let user = UserPath::site(
            &SiteCfg {
                lat_deg: 45.0,
                lon_deg: -73.0,
                height_m: 120.0,
            },
            2_451_545.0,
        )
        .unwrap();
        let UserPath::Site { geo, ecef, .. } = &user else {
            panic!("a site")
        };
        let (e, n, u) = user.enu_basis(0.0).unwrap();
        for (a, b) in [(e, n), (n, u), (u, e)] {
            assert!(dot(a, b).abs() < 1e-15);
        }
        for sat in [
            [1.5e7, -1.9e7, 1.2e7],
            [-2.0e7, 4.0e6, 1.8e7],
            [9.0e6, 2.1e7, -3.0e6],
        ] {
            let l = crate::frames::look_angles(*geo, sat);
            let (sa, ca) = l.az_rad.psin_cos();
            let (se, ce) = l.el_rad.psin_cos();
            let reference = [l.range_m * ce * sa, l.range_m * ce * ca, l.range_m * se];
            let d = sub(sat, *ecef);
            let got = [dot(d, e), dot(d, n), dot(d, u)];
            for k in 0..3 {
                assert!((got[k] - reference[k]).abs() < 1e-6 * l.range_m, "axis {k}");
            }
        }
        // The geodetic up leans from the geocentric radial by the deflection (~0.19 deg at 45
        // deg), and an orbiting user keeps the geocentric basis exactly.
        let (_, _, radial) = enu_basis(*ecef).unwrap();
        let lean = dot(u, radial).clamp(-1.0, 1.0).pacos().to_degrees();
        assert!(lean > 0.18 && lean < 0.2, "{lean}");
        let orbit = UserPath::Orbit(
            OrbitCfg {
                altitude_km: 700.0,
                inclination_deg: 51.6,
                raan_deg: 10.0,
                u0_deg: 30.0,
                eccentricity: 0.0,
                argp_deg: 0.0,
                j2: false,
            }
            .to_orbit(),
        );
        assert_eq!(orbit.enu_basis(900.0), enu_basis(orbit.position_eci(900.0)));
        assert_eq!(orbit.position(900.0), orbit.position_eci(900.0));
    }

    #[test]
    fn a_ground_site_puts_every_element_set_on_one_instant() {
        // SGP4 counts `t` from each element set's own epoch, so a ground site advances each
        // set to the one absolute instant jd0 + t and turns the Earth to that instant; jd0
        // defaults to the newest set's epoch.
        let text = include_str!("../tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
        let sats = crate::tle::parse_propagators(text).unwrap();
        let site = SiteCfg {
            lat_deg: 52.0,
            lon_deg: 5.0,
            height_m: 45.0,
        };
        let j2000 = UserPath::site(&site, 2_451_545.0).unwrap();
        let newest = sats
            .iter()
            .map(|g| g.own_jd_utc(0.0).unwrap())
            .fold(f64::MIN, f64::max);
        let UserPath::Site { jd0_ut1, .. } = j2000.clone().dated_by(false, &sats) else {
            panic!("a site")
        };
        assert_eq!(jd0_ut1, newest);
        let UserPath::Site { jd0_ut1, .. } = j2000.clone().dated_by(true, &sats) else {
            panic!("a site")
        };
        assert_eq!(jd0_ut1, 2_451_545.0, "a stated epoch is kept");
        let user = j2000.dated_by(false, &sats);
        for g in &sats {
            for t in [0.0, 5400.0] {
                let jd = newest + t / 86_400.0;
                let t_own = (newest - g.own_jd_utc(0.0).unwrap()) * 86_400.0 + t;
                let truth = crate::frames::teme_to_ecef(g.position_eci(t_own), jd);
                assert_eq!(user.satellite_position(g, t), truth);
            }
        }
        // One consistent sky: a full GPS constellation keeps at least four in view all day.
        for k in 0..=144 {
            let v = sky_view(&user, &sats, None, k as f64 * 600.0, 5.0, None);
            assert!(
                v.positions.len() >= 4,
                "{} at sample {k}",
                v.positions.len()
            );
        }
    }

    #[test]
    fn timeline_has_expected_length_and_walker_count() {
        let scn = scenario(6, 4);
        let sats = scn.constellation.satellites().unwrap();
        assert_eq!(sats.len(), 24);
        let tl = build_timeline(
            &scn.user.as_ref().unwrap().to_orbit(),
            &sats,
            scn.time.step_s,
            scn.time.duration_s,
            scn.mask_deg,
        );
        assert_eq!(tl.windows.len(), 7200 / 60 + 1);
    }

    #[test]
    fn sparse_constellation_forces_outage_and_quantum_wins() {
        // Three satellites can never give a 4-satellite fix, so every sample is a
        // GNSS outage: the run is pure holdover and the quantum clock must lead.
        let scn = scenario(1, 3);
        let r = crate::run::run_orbit_clock(&scn).unwrap();
        let any_outage = r
            .quantum
            .series
            .iter()
            .any(|s| s.gnss != GnssState::Nominal);
        assert!(
            any_outage,
            "sparse constellation should never reach Nominal"
        );
        assert!(r.quantum.fom.timing_p95_ns <= r.classical.fom.timing_p95_ns);
        assert!(r.quantum.fom.integrity.is_some());
    }

    #[test]
    fn additional_constellations_add_their_satellites() {
        // A second constellation combines with the first for visibility/DOP.
        let mut scn = scenario(6, 4);
        assert_eq!(scn.all_satellites().unwrap().len(), 24);
        scn.constellations.push(ConstellationCfg {
            altitude_km: 23222.0, // Galileo-like
            inclination_deg: 56.0,
            planes: 3,
            sats_per_plane: 8,
            phasing_f: 1.0,
            tle: None,
            rinex: None,
            strict_checksum: false,
        });
        assert_eq!(scn.all_satellites().unwrap().len(), 24 + 24);
    }

    #[test]
    fn orbit_scenario_is_reproducible() {
        let run = || {
            let r = crate::run::run_orbit_clock(&scenario(6, 4)).unwrap();
            (r.quantum.fom.timing_p95_ns, r.classical.fom.timing_p95_ns)
        };
        assert_eq!(run(), run());
    }

    #[test]
    fn invert4_recovers_identity_and_diagonal() {
        let id = [
            [1.0, 0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0],
        ];
        assert_eq!(invert4(id), Some(id));
        let diag = [
            [2.0, 0.0, 0.0, 0.0],
            [0.0, 4.0, 0.0, 0.0],
            [0.0, 0.0, 0.5, 0.0],
            [0.0, 0.0, 0.0, 8.0],
        ];
        let inv = invert4(diag).expect("non-singular");
        for (i, recip) in [0.5, 0.25, 2.0, 0.125].iter().enumerate() {
            assert!((inv[i][i] - recip).abs() < 1e-12, "diag {i}");
        }
        // A singular matrix (zero column) has no inverse.
        assert_eq!(invert4([[0.0; 4]; 4]), None);
    }

    #[test]
    fn dop_needs_four_satellites() {
        let user = [7.0e6, 0.0, 0.0];
        let three = [[2e7, 0.0, 0.0], [0.0, 2e7, 0.0], [0.0, 0.0, 2e7]];
        assert_eq!(dop(user, &three), None);
    }

    #[test]
    fn dop_of_a_regular_tetrahedron_is_the_closed_form() {
        // Four lines of sight along regular-tetrahedron unit vectors sum to zero
        // and give sum(e e^T) = (4/3) I, so Q = diag(3/4, 3/4, 3/4, 1/4):
        //   PDOP = sqrt(9/4) = 1.5         TDOP = sqrt(1/4) = 0.5
        //   GDOP = sqrt(10/4) = 1.5811388  (isotropic position cov)
        //   HDOP = sqrt(3/4 + 3/4) = 1.2247449   VDOP = sqrt(3/4) = 0.8660254
        let s = 3.0_f64.sqrt();
        let dirs = [
            [1.0 / s, 1.0 / s, 1.0 / s],
            [1.0 / s, -1.0 / s, -1.0 / s],
            [-1.0 / s, 1.0 / s, -1.0 / s],
            [-1.0 / s, -1.0 / s, 1.0 / s],
        ];
        let user = [7.0e6, 0.0, 0.0];
        // Place each satellite along its line of sight so los_unit recovers `dir`.
        let sats: Vec<Vec3> = dirs
            .iter()
            .map(|d| {
                [
                    user[0] + 2e7 * d[0],
                    user[1] + 2e7 * d[1],
                    user[2] + 2e7 * d[2],
                ]
            })
            .collect();
        let dop = dop(user, &sats).expect("non-singular tetrahedron");
        assert!((dop.pdop - 1.5).abs() < 1e-9, "pdop={}", dop.pdop);
        assert!((dop.tdop - 0.5).abs() < 1e-9, "tdop={}", dop.tdop);
        assert!(
            (dop.gdop - 2.5_f64.sqrt()).abs() < 1e-9,
            "gdop={}",
            dop.gdop
        );
        assert!(
            (dop.hdop - 1.5_f64.sqrt()).abs() < 1e-9,
            "hdop={}",
            dop.hdop
        );
        assert!(
            (dop.vdop - 0.75_f64.sqrt()).abs() < 1e-9,
            "vdop={}",
            dop.vdop
        );
    }

    #[test]
    fn dop_summary_reports_fixes_and_position_accuracy() {
        // A full GPS-like constellation seen from a 7000 km user gives a position
        // fix at every sample; position sigma = pdop * uere with a known ratio.
        let scn = scenario(6, 4);
        let user = Orbit::new(7.0e6, 0.0, 0.0, 0.0);
        let sats = scn.constellation.satellites().unwrap();
        let summary = summarize_dop(&user, &sats, 300.0, 3600.0, 5.0, 2.0);
        assert_eq!(summary.samples_total, 3600 / 300 + 1);
        assert!(summary.samples_with_fix > 0);
        let best = summary.best_pdop.expect("a fix exists");
        assert!(best > 0.0 && best < 100.0, "best pdop {best}");
        // Position accuracy is the PDOP scaled by the UERE.
        assert!((summary.best_position_sigma_m.unwrap() - best * 2.0).abs() < 1e-9);
    }

    #[test]
    fn visible_count_and_state_mapping() {
        assert_eq!(gnss_state(0), GnssState::Denied);
        assert_eq!(gnss_state(3), GnssState::Degraded);
        assert_eq!(gnss_state(4), GnssState::Nominal);
        // A user at 7000 km with four MEO satellites spread around it: the two on
        // the user's side are visible, the antipodal ones are Earth-occulted.
        let user = Orbit::new(7.0e6, 0.0, 0.0, 0.0); // at (7e6, 0, 0) at t=0
        let meo = 2.0e7 + R_EARTH_M;
        let gnss: Vec<Propagator> = vec![
            Orbit::new(meo, 0.0, 0.0, 0.0).into(), // overhead -> visible
            Orbit::new(meo, 0.0, 0.0, PI).into(),  // antipodal -> occulted
            Orbit::new(meo, 0.0, 0.0, 0.3).into(), // near side -> visible
            Orbit::new(meo, 0.0, 0.0, PI - 0.3).into(), // far side -> occulted
        ];
        assert_eq!(visible_count(&user, &gnss, 0.0, 0.0), 2);
    }
}
