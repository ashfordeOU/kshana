// SPDX-License-Identifier: Apache-2.0
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
//! (WGS-84 / EGM), a spherical Earth of mean radius `6371.0 km` (IUGG mean) for
//! occultation, the WGS-84 equatorial radius and J2 for the precession rates. The
//! two-body + J2-secular model is intentional and documented; it is not a
//! precise-ephemeris propagator.

use crate::scenario::{ClockCfg, GnssState, GnssTimeline, GnssWindow, TimeCfg};
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
fn solve_kepler(mean_anomaly: f64, e: f64) -> f64 {
    if e == 0.0 {
        return mean_anomaly;
    }
    let mut ea = mean_anomaly;
    for _ in 0..30 {
        let d = (ea - e * ea.sin() - mean_anomaly) / (1.0 - e * ea.cos());
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
        let factor = n * J2_EARTH * (R_EARTH_EQUATORIAL_M / p).powi(2);
        let ci = self.inclination_rad.cos();
        self.raan_dot = -1.5 * factor * ci;
        self.argp_dot = 0.75 * factor * (5.0 * ci * ci - 1.0);
        self
    }

    /// Mean motion (rad/s) = sqrt(mu / a^3).
    pub fn mean_motion(&self) -> f64 {
        (MU_EARTH / self.radius_m.powi(3)).sqrt()
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
        let (si, ci) = self.inclination_rad.sin_cos();
        if self.is_circular() {
            // Closed-form circular case (identical to the original formulation).
            let u = self.u0_rad + n * t;
            let (su, cu) = u.sin_cos();
            let (so, co) = self.raan_rad.sin_cos();
            let r = self.radius_m;
            let (x, y, z) = (r * cu, r * su * ci, r * su * si);
            return [x * co - y * so, x * so + y * co, z];
        }
        let e = self.eccentricity;
        let raan = self.raan_rad + self.raan_dot * t;
        let argp = self.argp_rad + self.argp_dot * t;
        let m = self.u0_rad + n * t;
        let ea = solve_kepler(m, e);
        let r = self.radius_m * (1.0 - e * ea.cos());
        // True anomaly from the eccentric anomaly.
        let nu =
            2.0 * ((1.0 + e).sqrt() * (ea * 0.5).sin()).atan2((1.0 - e).sqrt() * (ea * 0.5).cos());
        let (su, cu) = (argp + nu).sin_cos();
        let (so, co) = raan.sin_cos();
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
    /// positions are interpolated (9th-order Lagrange) and rotated into the shared
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

/// True when the Earth sphere (radius `R_EARTH_M`) occults the line of sight
/// between `user` and `sat`: the closest point of the segment to Earth's centre
/// lies inside the sphere.
pub fn earth_occults(user: Vec3, sat: Vec3) -> bool {
    let d = sub(sat, user);
    let dd = dot(d, d);
    if dd == 0.0 {
        return false;
    }
    let lambda = (-dot(user, d) / dd).clamp(0.0, 1.0);
    let closest = [
        user[0] + lambda * d[0],
        user[1] + lambda * d[1],
        user[2] + lambda * d[2],
    ];
    norm(closest) < R_EARTH_M
}

/// Elevation angle (degrees) of `sat` above the user's local horizontal — the
/// plane perpendicular to the user's radial (geocentric "up"). Negative below
/// the horizon. `sin(elevation) = up . line_of_sight`.
pub fn elevation_deg(user: Vec3, sat: Vec3) -> f64 {
    let los = sub(sat, user);
    let los_n = norm(los);
    let u_n = norm(user);
    if los_n == 0.0 || u_n == 0.0 {
        return 0.0;
    }
    let sin_el = dot(user, los) / (u_n * los_n);
    sin_el.clamp(-1.0, 1.0).asin().to_degrees()
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
    let mut a = [[0.0_f64; 4]; 4];
    let mut used = 0usize;
    for &s in sats {
        let Some(e) = los_unit(user, s) else {
            continue;
        };
        let row = [-e[0], -e[1], -e[2], 1.0];
        for i in 0..4 {
            for j in 0..4 {
                a[i][j] += row[i] * row[j];
            }
        }
        used += 1;
    }
    if used < 4 {
        return None;
    }
    let q = invert4(a)?;
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
    Some(Dop {
        gdop,
        pdop,
        hdop,
        vdop,
        tdop,
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
                },
            );
        }
        if let Some(text) = &self.rinex {
            // Keplerian systems (GPS/Galileo/QZSS/BeiDou) and the GLONASS
            // state-vector model are parsed by their respective readers and
            // combined into one constellation.
            let mut sats: Vec<Propagator> = crate::rinex::parse_nav(text)?
                .into_iter()
                .map(Propagator::from)
                .collect();
            sats.extend(
                crate::glonass::parse_glonass_nav(text)?
                    .into_iter()
                    .map(Propagator::from),
            );
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
    pub user: OrbitCfg,
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
            assert!((ea - e * ea.sin() - m).abs() < 1e-12, "M={m} e={e}");
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
        let crit_i = (1.0_f64 / 5.0_f64.sqrt()).acos();
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
            user: OrbitCfg {
                altitude_km: 35786.0,
                inclination_deg: 0.0,
                raan_deg: 0.0,
                u0_deg: 0.0,
                eccentricity: 0.0,
                argp_deg: 0.0,
                j2: false,
            },
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
            export_sp3: false,
            export_omm: false,
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
    fn timeline_has_expected_length_and_walker_count() {
        let scn = scenario(6, 4);
        let sats = scn.constellation.satellites().unwrap();
        assert_eq!(sats.len(), 24);
        let tl = build_timeline(
            &scn.user.to_orbit(),
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
