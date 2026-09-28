// SPDX-License-Identifier: AGPL-3.0-only
//! The records a low Earth orbit (LEO) navigation message carries, and the user
//! algorithm that turns one into a satellite position and clock offset.
//!
//! Four ephemeris models share one message:
//!
//! * [`EphemerisModel::Kepler16`]: the Galileo Open Service (OS) Signal-in-Space (SIS)
//!   Interface Control Document (ICD) Keplerian set (`√A, e, i0, Ω0, ω, M0, Δn, Ω̇, i̇`,
//!   the six second-harmonic terms `Cuc … Cis`, and `toe`) evaluated by the ICD user
//!   algorithm, unchanged.
//! * [`EphemerisModel::KeplerRac`]: the same set plus three correction polynomials in
//!   time along the along-track, cross-track and radial directions (`a0…`, `c0…`, `r0…`),
//!   added after the Keplerian evaluation, in `τ = tk / tau_s` with `tau_s` a transmitted
//!   power of two.
//! * [`EphemerisModel::Liu22`]: the 22-parameter extension of Liu et al. 2025
//!   (doi 10.3390/rs17162894): the 16-parameter set plus `ȧ`, `ṅ`, `Crs3`, `Crc3`,
//!   `Crs1`, `Crc1`.
//! * [`EphemerisModel::EcefPoly`]: an Earth-centred Earth-fixed (ECEF) polynomial per
//!   axis, the "zero-clock" model the ATOMIC payload flew (a 6th-order polynomial valid
//!   for about a minute, the satellite clock steered to GNSS time so no clock terms are
//!   sent; InsideGNSS, "First steps toward a fully operational LEO-PNT payload").
//!
//! ## Interpretations stated plainly
//!
//! * The correction frame is the Keplerian orbit's own frame at the evaluated instant:
//!   radial along the evaluated position, cross-track along the orbit normal built from
//!   the corrected inclination and node, along-track completing the right-handed triad
//!   (in-plane, perpendicular to radial). The polynomials run in `τ = tk / tau_s`, so each
//!   coefficient is in metres. This is Kshana's documented definition; no public document
//!   defines a LEO correction frame for a broadcast message.
//! * Liu et al. 2025 name their six added parameters but the full text was not accessible
//!   when this was written. Kshana evaluates them as: `A = A0 + ȧ·tk`,
//!   `n = n0 + Δn + ½·ṅ·tk` (the GPS civil-navigation convention for a mean-motion rate),
//!   and a radius correction extended by once- and three-per-revolution terms,
//!   `δr += Crs1·sin Φ + Crc1·cos Φ + Crs3·sin 3Φ + Crc3·cos 3Φ`, with `Φ` the argument of
//!   latitude. A different reading would change the fitted values, not the method.
//! * The relativistic clock term: for the Keplerian models the ICD eccentricity term
//!   `F·e·√A·sin E`; for the polynomial model its general form `−2 r·v / c²`, taken from
//!   the polynomial and its derivative (`r·v` is the same in ECEF and in inertial axes
//!   because the Earth rotates about `z`).

use serde::{Deserialize, Serialize};

/// Galileo gravitational constant `μ` (m³/s²), Galileo OS SIS ICD.
pub const MU: f64 = 3.986_004_418e14;
/// Earth rotation rate `Ω̇e` (rad/s), Galileo OS SIS ICD (same value as IS-GPS-200).
pub const OMEGA_E: f64 = 7.292_115_146_7e-5;
/// Speed of light (m/s).
pub const C_LIGHT: f64 = 299_792_458.0;
/// Relativistic clock constant `F = −2√μ / c²` (s/√m), Galileo OS SIS ICD.
pub const F_REL: f64 = -4.442_807_309e-10;
/// Seconds in a week.
pub const WEEK_S: f64 = 604_800.0;
/// Default time scale of the along/cross/radial correction polynomials (s). A fitted
/// message carries its own scale in [`RacPoly::tau_s`], the power of two at or above half
/// its fit interval, so `|τ| <= 1` over the window and the coefficients stay well scaled.
pub const RAC_TAU_S: f64 = 512.0;
/// Time normalisation of the ECEF polynomial model (s): `τ = (t − t_ref) / 64`.
pub const POLY_TAU_S: f64 = 64.0;

/// A system-time instant: a week number and a time of week (s). Differences are taken
/// week and seconds apart, so sub-millimetre motion survives the arithmetic (an absolute
/// f64 second count of ~1.4e9 s would round at ~0.2 µs, 1.7 mm of LEO motion).
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct SysTime {
    /// Week number since the system-time origin (Kshana uses the GPS origin, 1980-01-06).
    pub week: u32,
    /// Time of week (s), in `[0, 604800)` once normalised.
    pub tow: f64,
}

impl SysTime {
    /// A normalised instant: the time of week folded into `[0, 604800)`.
    pub fn new(week: u32, tow: f64) -> Self {
        let mut s = SysTime { week, tow };
        s.normalise();
        s
    }

    fn normalise(&mut self) {
        while self.tow >= WEEK_S {
            self.tow -= WEEK_S;
            self.week += 1;
        }
        while self.tow < 0.0 && self.week > 0 {
            self.tow += WEEK_S;
            self.week -= 1;
        }
    }

    /// This instant plus `dt` seconds.
    pub fn plus(&self, dt: f64) -> Self {
        SysTime::new(self.week, self.tow + dt)
    }

    /// `self − other` in seconds.
    pub fn minus(&self, other: &SysTime) -> f64 {
        (self.week as f64 - other.week as f64) * WEEK_S + (self.tow - other.tow)
    }
}

/// The Galileo OS SIS ICD Keplerian parameter set. Angles in radians (the ICD transmits
/// semicircles; the binary codec converts), distances in metres, `toe` a time of week in
/// seconds within the message week.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct Keplerian {
    /// Square root of the semi-major axis (√m).
    pub sqrt_a: f64,
    /// Eccentricity.
    pub e: f64,
    /// Inclination at reference time (rad).
    pub i0: f64,
    /// Longitude of ascending node at weekly epoch (rad).
    pub omega0: f64,
    /// Argument of perigee (rad).
    pub omega: f64,
    /// Mean anomaly at reference time (rad).
    pub m0: f64,
    /// Mean-motion difference (rad/s).
    pub delta_n: f64,
    /// Rate of right ascension (rad/s).
    pub omega_dot: f64,
    /// Rate of inclination (rad/s).
    pub i_dot: f64,
    /// Argument-of-latitude cosine harmonic (rad).
    pub cuc: f64,
    /// Argument-of-latitude sine harmonic (rad).
    pub cus: f64,
    /// Orbit-radius cosine harmonic (m).
    pub crc: f64,
    /// Orbit-radius sine harmonic (m).
    pub crs: f64,
    /// Inclination cosine harmonic (rad).
    pub cic: f64,
    /// Inclination sine harmonic (rad).
    pub cis: f64,
    /// Ephemeris reference time of week (s).
    pub toe: f64,
}

/// The six parameters Liu et al. 2025 add to the 16-parameter set.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct Liu22Extra {
    /// Semi-major-axis rate `ȧ` (m/s).
    pub a_dot: f64,
    /// Mean-motion rate `ṅ` (rad/s²).
    pub n_dot: f64,
    /// Radius sine harmonic at three per revolution (m).
    pub crs3: f64,
    /// Radius cosine harmonic at three per revolution (m).
    pub crc3: f64,
    /// Radius sine harmonic at once per revolution (m).
    pub crs1: f64,
    /// Radius cosine harmonic at once per revolution (m).
    pub crc1: f64,
}

/// Along-track, cross-track and radial correction polynomials in `τ = tk / tau_s`,
/// coefficients in metres, lowest order first.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct RacPoly {
    /// Time scale of `τ` (s): a power of two from 1 s to 32768 s.
    pub tau_s: f64,
    /// Along-track coefficients `a0, a1, …` (m).
    pub along: Vec<f64>,
    /// Cross-track coefficients `c0, c1, …` (m).
    pub cross: Vec<f64>,
    /// Radial coefficients `r0, r1, …` (m).
    pub radial: Vec<f64>,
}

impl Default for RacPoly {
    fn default() -> Self {
        RacPoly {
            tau_s: RAC_TAU_S,
            along: Vec::new(),
            cross: Vec::new(),
            radial: Vec::new(),
        }
    }
}

/// The correction time scale for a fit interval: the power of two at or above half of it.
pub fn rac_tau_for(interval_s: f64) -> f64 {
    let half = (interval_s / 2.0).max(1.0);
    2f64.powi(half.log2().ceil() as i32).clamp(1.0, 32768.0)
}

/// An ECEF polynomial per axis in `τ = (t − t_ref) / 64 s`, coefficients in metres.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct EcefPoly {
    /// Reference time of week of the polynomial (s), within the message week.
    pub t_ref: f64,
    /// `[x, y, z]` coefficient lists (m), lowest order first.
    pub coeffs: [Vec<f64>; 3],
}

/// Which ephemeris model a message carries.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(tag = "model", rename_all = "kebab-case")]
pub enum EphemerisModel {
    /// Galileo ICD 16-parameter Keplerian set, no corrections.
    Kepler16 {
        /// The Keplerian set.
        kepler: Keplerian,
    },
    /// Keplerian set plus along/cross/radial correction polynomials.
    KeplerRac {
        /// The Keplerian set.
        kepler: Keplerian,
        /// The correction polynomials.
        rac: RacPoly,
    },
    /// Liu et al. 2025 22-parameter model.
    Liu22 {
        /// The Keplerian set.
        kepler: Keplerian,
        /// The six added parameters.
        extra: Liu22Extra,
    },
    /// ECEF polynomial ("zero-clock" when the message carries no clock).
    EcefPoly {
        /// The polynomial.
        poly: EcefPoly,
    },
}

impl EphemerisModel {
    /// A short, stable model code: `kepler16`, `kepler-rac`, `liu22` or `ecef-poly`.
    pub fn code(&self) -> &'static str {
        match self {
            EphemerisModel::Kepler16 { .. } => "kepler16",
            EphemerisModel::KeplerRac { .. } => "kepler-rac",
            EphemerisModel::Liu22 { .. } => "liu22",
            EphemerisModel::EcefPoly { .. } => "ecef-poly",
        }
    }

    /// The Keplerian set, where the model has one.
    pub fn kepler(&self) -> Option<&Keplerian> {
        match self {
            EphemerisModel::Kepler16 { kepler }
            | EphemerisModel::KeplerRac { kepler, .. }
            | EphemerisModel::Liu22 { kepler, .. } => Some(kepler),
            EphemerisModel::EcefPoly { .. } => None,
        }
    }

    /// Number of ephemeris parameters the model transmits (the reference time included).
    pub fn n_parameters(&self) -> usize {
        match self {
            EphemerisModel::Kepler16 { .. } => 16,
            EphemerisModel::KeplerRac { rac, .. } => {
                16 + rac.along.len() + rac.cross.len() + rac.radial.len()
            }
            EphemerisModel::Liu22 { .. } => 22,
            EphemerisModel::EcefPoly { poly } => {
                1 + poly.coeffs.iter().map(Vec::len).sum::<usize>()
            }
        }
    }
}

/// Second-order clock polynomial: `dt = af0 + af1·(t − toc) + af2·(t − toc)²`.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct ClockPoly {
    /// Clock reference time of week (s).
    pub toc: f64,
    /// Bias (s).
    pub af0: f64,
    /// Drift (s/s).
    pub af1: f64,
    /// Drift rate (s/s²).
    pub af2: f64,
}

/// Klobuchar-style broadcast ionospheric coefficients (IS-GPS-200 §20.3.3.5.1.7):
/// `alpha` in s/semicircleⁿ, `beta` in s/semicircleⁿ.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct KlobucharSet {
    /// Amplitude coefficients α0…α3.
    pub alpha: [f64; 4],
    /// Period coefficients β0…β3.
    pub beta: [f64; 4],
}

/// Galileo NeQuick-G effective-ionisation coefficients (Galileo OS SIS ICD §5.1.6) and the
/// five region storm flags.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct NequickSet {
    /// `ai0` (solar flux units, sfu).
    pub ai0: f64,
    /// `ai1` (sfu per degree of modified dip latitude).
    pub ai1: f64,
    /// `ai2` (sfu per degree²).
    pub ai2: f64,
    /// Ionospheric disturbance flags for regions 1 to 5.
    pub storm_flags: [bool; 5],
}

/// System-time-to-UTC conversion parameters, Galileo OS SIS ICD §5.1.7 structure (the
/// GPS ICD uses the same fields).
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct UtcOffset {
    /// Constant term `A0` (s).
    pub a0: f64,
    /// Rate term `A1` (s/s).
    pub a1: f64,
    /// Leap-second count before the next event `ΔtLS` (s).
    pub dt_ls: i32,
    /// UTC data reference time of week `t0t` (s).
    pub t_ot: f64,
    /// UTC data reference week `WNot` (full week number here; the codec sends it modulo 256).
    pub wn_ot: u32,
    /// Week of the next leap-second event `WNLSF` (full week number; modulo 256 on the wire).
    pub wn_lsf: u32,
    /// Day number at the end of which the leap second occurs `DN` (1 = Sunday … 7).
    pub dn: u8,
    /// Leap-second count after the event `ΔtLSF` (s).
    pub dt_lsf: i32,
}

/// The "other services" block.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct Services {
    /// Klobuchar-style ionospheric coefficients, if carried.
    pub klobuchar: Option<KlobucharSet>,
    /// NeQuick-G coefficients, if carried.
    pub nequick: Option<NequickSet>,
    /// System-time-to-UTC parameters, if carried.
    pub utc: Option<UtcOffset>,
}

/// One LEO navigation message: auxiliary data, synchronisation data, ephemeris, clock
/// and other services.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct LeoNavMessage {
    /// Space-vehicle identifier (SVID), 1–255.
    pub svid: u8,
    /// Issue of data (IOD), 0–1023.
    pub iod: u16,
    /// Band / signal identifier, 0–15 (the scenario's band table gives the frequency).
    pub band: u8,
    /// Signal health status, 0–3 (Galileo signal-health-status convention: 0 OK,
    /// 1 out of service, 2 extended operations, 3 in test).
    pub health: u8,
    /// Week number of the message (the week `toe`, `toc` and `t_ref` count in).
    pub week: u32,
    /// Time of week of transmission (s).
    pub tow: f64,
    /// Clock polynomial, or `None` for a zero-clock message.
    pub clock: Option<ClockPoly>,
    /// Ephemeris.
    pub ephemeris: EphemerisModel,
    /// Other services.
    pub services: Services,
}

/// A satellite state computed from a message.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SatState {
    /// ECEF position (m).
    pub pos: [f64; 3],
    /// Satellite clock offset (s), relativistic term included.
    pub clock_s: f64,
    /// Unit vectors of the message's along, cross, radial frame (ECEF).
    pub frame: RacFrame,
}

/// Unit vectors of an along-track, cross-track, radial frame.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct RacFrame {
    /// Along-track (in-plane, perpendicular to radial).
    pub along: [f64; 3],
    /// Cross-track (orbit normal).
    pub cross: [f64; 3],
    /// Radial.
    pub radial: [f64; 3],
}

impl RacFrame {
    /// The frame from an ECEF position and an inertial-sense velocity expressed in ECEF
    /// axes (radial `r̂`, cross `r × v` normalised, along `cross × radial`).
    pub fn from_rv(r: [f64; 3], v: [f64; 3]) -> RacFrame {
        let radial = unit(r);
        let cross = unit(cross3(r, v));
        let along = cross3(cross, radial);
        RacFrame {
            along,
            cross,
            radial,
        }
    }

    /// Components of `d` along (along, cross, radial).
    pub fn project(&self, d: [f64; 3]) -> [f64; 3] {
        [dot(d, self.along), dot(d, self.cross), dot(d, self.radial)]
    }
}

pub(crate) fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
pub(crate) fn cross3(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
pub(crate) fn norm(a: [f64; 3]) -> f64 {
    dot(a, a).sqrt()
}
pub(crate) fn unit(a: [f64; 3]) -> [f64; 3] {
    let n = norm(a);
    [a[0] / n, a[1] / n, a[2] / n]
}
pub(crate) fn sub(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// A polynomial with coefficients lowest order first, at `x`.
pub fn polyval(c: &[f64], x: f64) -> f64 {
    c.iter().rev().fold(0.0, |acc, &k| acc * x + k)
}

/// Derivative of [`polyval`] with respect to `x`.
pub fn polyder(c: &[f64], x: f64) -> f64 {
    let mut acc = 0.0;
    for (k, &ck) in c.iter().enumerate().skip(1).rev() {
        acc = acc * x + k as f64 * ck;
    }
    acc
}

/// `tk = t − toe` in seconds, with `toe` a time of week in `week`.
pub fn tk_from(week: u32, toe: f64, t: &SysTime) -> f64 {
    t.minus(&SysTime { week, tow: toe })
}

/// Intermediate quantities of the Keplerian user algorithm.
#[derive(Clone, Copy, Debug)]
pub struct KeplerPoint {
    /// ECEF position (m), harmonic corrections included.
    pub pos: [f64; 3],
    /// Eccentric anomaly (rad).
    pub ecc_anomaly: f64,
    /// Corrected argument of latitude (rad).
    pub u: f64,
    /// Corrected inclination (rad).
    pub i: f64,
    /// Corrected ECEF node longitude (rad).
    pub node: f64,
}

/// The Galileo OS SIS ICD user algorithm (its Table 58, the same sequence as IS-GPS-200
/// §20.3.3.4.3.1), with the optional Liu et al. 2025 terms. `tk` is `t − toe` (s).
pub fn kepler_point(k: &Keplerian, extra: Option<&Liu22Extra>, tk: f64) -> KeplerPoint {
    let a0 = k.sqrt_a * k.sqrt_a;
    let n0 = (MU / (a0 * a0 * a0)).sqrt();
    let (a, n) = match extra {
        Some(x) => (a0 + x.a_dot * tk, n0 + k.delta_n + 0.5 * x.n_dot * tk),
        None => (a0, n0 + k.delta_n),
    };
    let mk = k.m0 + n * tk;
    let mut ek = mk;
    for _ in 0..30 {
        let d = (ek - k.e * ek.sin() - mk) / (1.0 - k.e * ek.cos());
        ek -= d;
        if d.abs() < 1e-15 {
            break;
        }
    }
    let nu = ((1.0 - k.e * k.e).sqrt() * ek.sin()).atan2(ek.cos() - k.e);
    let phi = nu + k.omega;
    let (s2, c2) = (2.0 * phi).sin_cos();
    let du = k.cus * s2 + k.cuc * c2;
    let mut dr = k.crs * s2 + k.crc * c2;
    if let Some(x) = extra {
        let (s1, c1) = phi.sin_cos();
        let (s3, c3) = (3.0 * phi).sin_cos();
        dr += x.crs1 * s1 + x.crc1 * c1 + x.crs3 * s3 + x.crc3 * c3;
    }
    let di = k.cis * s2 + k.cic * c2;
    let u = phi + du;
    let r = a * (1.0 - k.e * ek.cos()) + dr;
    let i = k.i0 + di + k.i_dot * tk;
    let (su, cu) = u.sin_cos();
    let (xp, yp) = (r * cu, r * su);
    let node = k.omega0 + (k.omega_dot - OMEGA_E) * tk - OMEGA_E * k.toe;
    let (so, co) = node.sin_cos();
    let (si, ci) = i.sin_cos();
    KeplerPoint {
        pos: [xp * co - yp * ci * so, xp * so + yp * ci * co, yp * si],
        ecc_anomaly: ek,
        u,
        i,
        node,
    }
}

/// The along, cross, radial frame of a Keplerian point.
pub fn kepler_frame(ev: &KeplerPoint) -> RacFrame {
    let (su, cu) = ev.u.sin_cos();
    let (si, ci) = ev.i.sin_cos();
    let (so, co) = ev.node.sin_cos();
    RacFrame {
        radial: [cu * co - su * ci * so, cu * so + su * ci * co, su * si],
        along: [-su * co - cu * ci * so, -su * so + cu * ci * co, cu * si],
        cross: [si * so, -si * co, ci],
    }
}

/// The ICD relativistic clock term `F·e·√A·sin E` (s).
pub fn kepler_relativistic_s(k: &Keplerian, ecc_anomaly: f64) -> f64 {
    F_REL * k.e * k.sqrt_a * ecc_anomaly.sin()
}

/// An ephemeris at `t`: ECEF position (m), the along/cross/radial frame, and the
/// relativistic clock term (s) the model's user algorithm adds.
pub fn ephemeris_at(model: &EphemerisModel, week: u32, t: &SysTime) -> ([f64; 3], RacFrame, f64) {
    match model {
        EphemerisModel::Kepler16 { kepler } => {
            let ev = kepler_point(kepler, None, tk_from(week, kepler.toe, t));
            (
                ev.pos,
                kepler_frame(&ev),
                kepler_relativistic_s(kepler, ev.ecc_anomaly),
            )
        }
        EphemerisModel::Liu22 { kepler, extra } => {
            let ev = kepler_point(kepler, Some(extra), tk_from(week, kepler.toe, t));
            (
                ev.pos,
                kepler_frame(&ev),
                kepler_relativistic_s(kepler, ev.ecc_anomaly),
            )
        }
        EphemerisModel::KeplerRac { kepler, rac } => {
            let tk = tk_from(week, kepler.toe, t);
            let ev = kepler_point(kepler, None, tk);
            let f = kepler_frame(&ev);
            let tau = tk / rac.tau_s;
            let (da, dc, dr) = (
                polyval(&rac.along, tau),
                polyval(&rac.cross, tau),
                polyval(&rac.radial, tau),
            );
            let mut p = ev.pos;
            for (k, pk) in p.iter_mut().enumerate() {
                *pk += da * f.along[k] + dc * f.cross[k] + dr * f.radial[k];
            }
            (p, f, kepler_relativistic_s(kepler, ev.ecc_anomaly))
        }
        EphemerisModel::EcefPoly { poly } => {
            let dt = t.minus(&SysTime {
                week,
                tow: poly.t_ref,
            });
            let tau = dt / POLY_TAU_S;
            let p = [
                polyval(&poly.coeffs[0], tau),
                polyval(&poly.coeffs[1], tau),
                polyval(&poly.coeffs[2], tau),
            ];
            let ve = [
                polyder(&poly.coeffs[0], tau) / POLY_TAU_S,
                polyder(&poly.coeffs[1], tau) / POLY_TAU_S,
                polyder(&poly.coeffs[2], tau) / POLY_TAU_S,
            ];
            // Inertial-sense velocity in ECEF axes: v_ecef + ω × r.
            let vi = [ve[0] - OMEGA_E * p[1], ve[1] + OMEGA_E * p[0], ve[2]];
            let rel = -2.0 * dot(p, ve) / (C_LIGHT * C_LIGHT);
            (p, RacFrame::from_rv(p, vi), rel)
        }
    }
}

/// The complete user algorithm: satellite ECEF position and clock offset at `t`.
pub fn sat_state(msg: &LeoNavMessage, t: &SysTime) -> SatState {
    let (pos, frame, rel) = ephemeris_at(&msg.ephemeris, msg.week, t);
    let clock_s = match &msg.clock {
        Some(c) => {
            let dt = t.minus(&SysTime {
                week: msg.week,
                tow: c.toc,
            });
            c.af0 + c.af1 * dt + c.af2 * dt * dt + rel
        }
        None => 0.0,
    };
    SatState {
        pos,
        clock_s,
        frame,
    }
}
