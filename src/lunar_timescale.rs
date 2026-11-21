// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar Coordinate Time (TCL) against Barycentric Coordinate Time (TCB), with bounds, and a
//! swappable time scale for lunar products.
//!
//! **TCB − TCL.** At first post-Newtonian order a coordinate time attached to a body moving with
//! barycentric velocity `v` in the external potential `U_ext` (every body but itself) runs against
//! TCB at
//!
//! ```text
//! d(TCB − T_body)/d(TCB) = ( U_ext(x) + v²/2 ) / c²
//! ```
//!
//! For the Earth this mean rate is the IAU defining-derived constant `L_C`; for the Moon it is the
//! lunar counterpart, here called `L_CL`. [`tcb_tcl_rate`] evaluates the integrand at the Moon's
//! centre from the Standish planetary elements ([`crate::ephem::standish_state`], every planet
//! and the Earth-Moon barycentre, with the Sun's own barycentric motion from the planets' masses)
//! and the analytic lunar series ([`crate::ephem::moon_icrf`]); the Earth's and the planets'
//! potentials and the Sun's are summed. [`tcb_tcl`] integrates it from the common origin `T0`.
//!
//! **The check.** The same integrand evaluated at the geocentre (the Moon's potential in place of
//! the Earth's) must give `L_C = 1.48082686741e−8` (IERS Conventions 2010, Table 1.1). Averaged
//! over 2000-2030 it does to the bound stated in [`RATE_BOUND`]; that bound covers the truncated
//! ephemerides (Standish's approximate elements, the analytic Moon), the averaging window and the
//! neglected `1/c⁴` terms, and is the bound every lunar figure here carries.
//!
//! **Origin.** TCB, TCG and TT read the same at `T0` = 1977-01-01T00:00:32.184 TT (JD
//! 2443144.5003725) at the geocentre (IAU 1991/2006). This module takes TCL to read the same as
//! TCB at `T0` at the Moon's centre; the IAU 2024 resolution's own origin convention for TCL is
//! **to confirm** (not read here), and changing it only shifts [`tcb_tcl`] by a constant.
//!
//! **Analytical approximation.** [`fit_approx`] fits `c + L·Δt` and seven periodic terms (the
//! anomalistic year and its half, the synodic month and its half, the anomalistic month, the
//! synodic periods of Jupiter and Venus) to the integral by least squares and reports the largest
//! and RMS error on the fit grid; the tests check that bound on a denser, offset grid the fit never
//! saw. The approximation is what a receiver could carry; the integral is the reference.
//!
//! **Swappable scale.** [`Scale`] names TT, TDB, TCB, TCG, TCL and the repository's surface
//! lunar time LTC ([`crate::lunar_time`]), and [`convert`] carries a time from any one to any other
//! through TT and TCB, so a lunar product (such as an output message) can
//! state its epochs in whichever scale a mission chooses and be re-read in another. The defining
//! constants are IAU 2006 Resolution B3 (`L_B`, `TDB0`) and IAU 2000 Resolution B1.9 (`L_G`); TT
//! to TDB uses [`crate::timescales::tdb_minus_tt`] (two terms, a few tens of microseconds).
//!
//! MODELLED: the rate and the integral are computed from truncated ephemerides; the `L_C` check
//! bounds that truncation, it does not replace a numerical ephemeris.

use crate::ephem::{moon_icrf, standish_state, Planet, StandishTable};
use crate::forces::{MU_EARTH, MU_MOON, MU_SUN};
use serde::Serialize;

type Vec3 = [f64; 3];

/// The honesty label.
pub const LABEL: &str = "MODELLED: first post-Newtonian rate from the Standish approximate planetary elements and \
the analytic lunar series, checked against the IERS value of L_C at the geocentre; the TCL origin convention of the IAU \
2024 resolution is to confirm.";

/// Speed of light, m/s.
pub const C_M_S: f64 = 299_792_458.0;
/// `L_B` (IAU 2006 Resolution B3).
pub const L_B: f64 = 1.550_519_768e-8;
/// `TDB0`, s (IAU 2006 Resolution B3).
pub const TDB0_S: f64 = -6.55e-5;
/// `L_G` (IAU 2000 Resolution B1.9).
pub const L_G: f64 = 6.969_290_134e-10;
/// `L_C` (IERS Conventions 2010, Table 1.1).
pub const L_C_IERS: f64 = 1.480_826_867_41e-8;
/// `T0`: JD of 1977-01-01T00:00:32.184 TT, where TCB, TCG and TT read the same.
pub const T0_JD: f64 = 2_443_144.500_372_5;
/// Bound on the computed mean rates (dimensionless): the agreement of the geocentre rate with
/// `L_C` over 2000-2030, rounded up.
pub const RATE_BOUND: f64 = 2e-12;

/// The span of the Standish Table 1 elements (1800-01-01 to 2050-01-01), JD.
pub const STANDISH_SPAN_JD: (f64, f64) = (2_378_496.5, 2_469_807.5);

/// Sun-to-body mass ratios (IAU 2009 system of astronomical constants).
const MASS_RATIOS: [(Planet, f64); 7] = [
    (Planet::Mercury, 6_023_600.0),
    (Planet::Venus, 408_523.71),
    (Planet::Mars, 3_098_703.59),
    (Planet::Jupiter, 1_047.348_644),
    (Planet::Saturn, 3_497.901_8),
    (Planet::Uranus, 22_902.98),
    (Planet::Neptune, 19_412.26),
];

/// The obliquity of the J2000 ecliptic, rad (IAU 2006, 84381.406″).
const EPS0: f64 = 84_381.406 / 3600.0 * std::f64::consts::PI / 180.0;

fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn scale(a: Vec3, k: f64) -> Vec3 {
    [a[0] * k, a[1] * k, a[2] * k]
}
fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// ICRF (equatorial) to J2000 ecliptic.
fn eq_to_ecl(v: Vec3) -> Vec3 {
    use crate::portable_math::PortableFloat;
    let (s, c) = EPS0.psin_cos();
    [v[0], c * v[1] + s * v[2], -s * v[1] + c * v[2]]
}

/// Which body's coordinate time.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum RateBody {
    /// The Moon's centre (TCL).
    Moon,
    /// The geocentre (TCG): the check against `L_C`.
    Earth,
}

/// Barycentric states (heliocentric ecliptic frame shifted by the Sun's barycentric offset) of the
/// Sun, the planets, the Earth and the Moon at `jd_tdb`: `(mu, position, velocity)`.
fn bodies(jd_tdb: f64) -> Option<Vec<(&'static str, f64, Vec3, Vec3)>> {
    let t = (jd_tdb - 2_451_545.0) / 36_525.0;
    let tab = StandishTable::Table1;
    let mut out: Vec<(&'static str, f64, Vec3, Vec3)> = Vec::new();
    let mut m_tot = MU_SUN;
    let mut mr = [0.0; 3];
    let mut mv = [0.0; 3];
    for (p, ratio) in MASS_RATIOS {
        let s = standish_state(p, t, tab)?;
        let mu = MU_SUN / ratio;
        out.push(("planet", mu, s.pos_m, s.vel_m_s));
        m_tot += mu;
        mr = add(mr, scale(s.pos_m, mu));
        mv = add(mv, scale(s.vel_m_s, mu));
    }
    let emb = standish_state(Planet::EarthMoonBarycentre, t, tab)?;
    let mu_emb = MU_EARTH + MU_MOON;
    m_tot += mu_emb;
    mr = add(mr, scale(emb.pos_m, mu_emb));
    mv = add(mv, scale(emb.vel_m_s, mu_emb));
    // Geocentric Moon, ecliptic; its velocity by a central difference.
    let h = 60.0 / 86_400.0;
    let rm = eq_to_ecl(moon_icrf(jd_tdb));
    let vm = scale(
        sub(
            eq_to_ecl(moon_icrf(jd_tdb + h)),
            eq_to_ecl(moon_icrf(jd_tdb - h)),
        ),
        1.0 / 120.0,
    );
    let fm = MU_MOON / mu_emb;
    let earth_r = sub(emb.pos_m, scale(rm, fm));
    let earth_v = sub(emb.vel_m_s, scale(vm, fm));
    let moon_r = add(earth_r, rm);
    let moon_v = add(earth_v, vm);
    // The Sun's offset from the barycentre: −Σ μ r / M.
    let sun_r = scale(mr, -1.0 / m_tot);
    let sun_v = scale(mv, -1.0 / m_tot);
    let shift =
        |(n, mu, r, v): (&'static str, f64, Vec3, Vec3)| (n, mu, add(r, sun_r), add(v, sun_v));
    let mut all: Vec<_> = out.into_iter().map(shift).collect();
    all.push(("sun", MU_SUN, sun_r, sun_v));
    all.push(shift(("earth", MU_EARTH, earth_r, earth_v)));
    all.push(shift(("moon", MU_MOON, moon_r, moon_v)));
    Some(all)
}

/// The instantaneous rate `(U_ext + v²/2)/c²` at the body's centre at `jd_tdb`; `None` outside
/// the Standish elements' span.
pub fn tcb_rate(body: RateBody, jd_tdb: f64) -> Option<f64> {
    if !(STANDISH_SPAN_JD.0..=STANDISH_SPAN_JD.1).contains(&jd_tdb) {
        return None;
    }
    let all = bodies(jd_tdb)?;
    let me = match body {
        RateBody::Moon => "moon",
        RateBody::Earth => "earth",
    };
    let (_, _, r, v) = *all.iter().find(|b| b.0 == me)?;
    let u: f64 = all
        .iter()
        .filter(|b| b.0 != me)
        .map(|b| b.1 / norm(sub(b.2, r)))
        .sum();
    let v2 = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
    Some((u + 0.5 * v2) / (C_M_S * C_M_S))
}

/// Mean rate over `[jd0, jd1]` sampled every `step_days` (Simpson's rule).
pub fn mean_rate(body: RateBody, jd0: f64, jd1: f64, step_days: f64) -> Option<f64> {
    let n = (((jd1 - jd0) / step_days).round() as usize).max(2) & !1;
    let h = (jd1 - jd0) / n as f64;
    let mut s = 0.0;
    for k in 0..=n {
        let w = if k == 0 || k == n {
            1.0
        } else if k % 2 == 1 {
            4.0
        } else {
            2.0
        };
        s += w * tcb_rate(body, jd0 + k as f64 * h)?;
    }
    Some(s * h / 3.0 / (jd1 - jd0))
}

/// `TCB − TCL` (s) at `jd_tcb`, integrated from [`T0_JD`] with a Simpson step of about a day, and its
/// bound (s): [`RATE_BOUND`] times the elapsed time.
pub fn tcb_tcl(jd_tcb: f64) -> Option<(f64, f64)> {
    let span = jd_tcb - T0_JD;
    if span == 0.0 {
        return Some((0.0, 0.0));
    }
    let n = (((span.abs()) / 1.0).ceil() as usize).max(2);
    let n = n + (n & 1);
    let h = span / n as f64;
    let mut s = 0.0;
    for k in 0..=n {
        let w = if k == 0 || k == n {
            1.0
        } else if k % 2 == 1 {
            4.0
        } else {
            2.0
        };
        s += w * tcb_rate(RateBody::Moon, T0_JD + k as f64 * h)?;
    }
    let value = s * h / 3.0 * 86_400.0;
    Some((value, RATE_BOUND * span.abs() * 86_400.0))
}

/// Periods (days) of the analytical approximation's terms: the anomalistic year and its half
/// (the Earth-Moon barycentre's eccentric orbit), the synodic month and its half (the Moon's
/// motion about the Earth against the Sun's direction), the anomalistic month, and the synodic
/// periods of Jupiter, Venus, Mars and Saturn, the third harmonic of the year, the evection, and
/// the 411.8-day beat of the anomalistic month with the year.
pub const APPROX_PERIODS_DAYS: [f64; 12] = [
    365.259_636,
    182.629_818,
    121.753_212,
    29.530_589,
    14.765_294,
    27.554_550,
    31.811_939,
    411.784,
    398.88,
    583.92,
    779.94,
    378.09,
];

/// The analytical approximation `TCB − TCL ≈ c + L·Δt + Σ (a_k sin ω_kΔt + b_k cos ω_kΔt)`,
/// `Δt` in seconds since [`T0_JD`], fitted by least squares to the numerical integral, with the
/// largest error found on a dense grid.
#[derive(Clone, Debug, Serialize)]
pub struct Approx {
    /// Constant, s.
    pub c_s: f64,
    /// Mean rate `L_CL`.
    pub l: f64,
    /// `(period_days, a_s, b_s)` per term.
    pub terms: Vec<(f64, f64, f64)>,
    /// Fit span, JD TCB.
    pub span_jd: [f64; 2],
    /// Dense-grid step, days.
    pub grid_days: f64,
    /// Grid points.
    pub grid_points: usize,
    /// Largest |approximation − integral| on the grid, s.
    pub max_error_s: f64,
    /// Root mean square error on the grid, s.
    pub rms_error_s: f64,
}

impl Approx {
    /// Evaluate at a JD (TCB).
    pub fn eval(&self, jd: f64) -> f64 {
        use crate::portable_math::PortableFloat;
        let dt = (jd - T0_JD) * 86_400.0;
        let mut v = self.c_s + self.l * dt;
        for &(p, a, b) in &self.terms {
            let w = 2.0 * std::f64::consts::PI / (p * 86_400.0);
            let (sn, cs) = (w * dt).psin_cos();
            v += a * sn + b * cs;
        }
        v
    }
}

/// `TCB − TCL` (s) on a regular grid from `jd0` with step `h` days, `n` points (Simpson on each
/// pair of half steps, accumulated).
fn integral_grid(jd0: f64, h: f64, n: usize) -> Option<Vec<f64>> {
    let (start, _) = tcb_tcl(jd0)?;
    let mut out = Vec::with_capacity(n);
    out.push(start);
    let mut acc = start;
    let mut r0 = tcb_rate(RateBody::Moon, jd0)?;
    for k in 1..n {
        let a = jd0 + (k - 1) as f64 * h;
        let rm = tcb_rate(RateBody::Moon, a + h / 2.0)?;
        let r1 = tcb_rate(RateBody::Moon, a + h)?;
        acc += (r0 + 4.0 * rm + r1) * h / 6.0 * 86_400.0;
        out.push(acc);
        r0 = r1;
    }
    Some(out)
}

fn solve(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let n = b.len();
    for i in 0..n {
        let p = (i..n).max_by(|&x, &y| a[x][i].abs().total_cmp(&a[y][i].abs()))?;
        a.swap(i, p);
        b.swap(i, p);
        if a[i][i].abs() < 1e-300 {
            return None;
        }
        let pivot = a[i].clone();
        for r in i + 1..n {
            let f = a[r][i] / pivot[i];
            for (x, p) in a[r].iter_mut().zip(&pivot).skip(i) {
                *x -= f * p;
            }
            b[r] -= f * b[i];
        }
    }
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let s: f64 = (i + 1..n).map(|c| a[i][c] * x[c]).sum();
        x[i] = (b[i] - s) / a[i][i];
    }
    Some(x)
}

/// Fit the approximation over `[jd0, jd1]` on a grid of `grid_days` and report its error on that
/// grid; `None` outside the ephemerides' span.
pub fn fit_approx(jd0: f64, jd1: f64, grid_days: f64) -> Option<Approx> {
    use crate::portable_math::PortableFloat;
    let n = ((jd1 - jd0) / grid_days).floor() as usize + 1;
    let y = integral_grid(jd0, grid_days, n)?;
    let k = 2 + 2 * APPROX_PERIODS_DAYS.len();
    // Scale the time column so the normal equations stay well conditioned.
    let t_scale = (jd1 - T0_JD) * 86_400.0;
    let row = |jd: f64| -> Vec<f64> {
        let dt = (jd - T0_JD) * 86_400.0;
        let mut r = vec![1.0, dt / t_scale];
        for p in APPROX_PERIODS_DAYS {
            let w = 2.0 * std::f64::consts::PI / (p * 86_400.0);
            let (sn, cs) = (w * dt).psin_cos();
            r.push(sn);
            r.push(cs);
        }
        r
    };
    let mut ata = vec![vec![0.0; k]; k];
    let mut aty = vec![0.0; k];
    for (i, yi) in y.iter().enumerate() {
        let r = row(jd0 + i as f64 * grid_days);
        for a in 0..k {
            aty[a] += r[a] * yi;
            for b in 0..k {
                ata[a][b] += r[a] * r[b];
            }
        }
    }
    let x = solve(ata, aty)?;
    let mut ap = Approx {
        c_s: x[0],
        l: x[1] / t_scale,
        terms: APPROX_PERIODS_DAYS
            .iter()
            .enumerate()
            .map(|(i, &p)| (p, x[2 + 2 * i], x[3 + 2 * i]))
            .collect(),
        span_jd: [jd0, jd1],
        grid_days,
        grid_points: n,
        max_error_s: 0.0,
        rms_error_s: 0.0,
    };
    let mut ss = 0.0;
    for (i, yi) in y.iter().enumerate() {
        let e = ap.eval(jd0 + i as f64 * grid_days) - yi;
        ap.max_error_s = ap.max_error_s.max(e.abs());
        ss += e * e;
    }
    ap.rms_error_s = (ss / n as f64).sqrt();
    Some(ap)
}

/// A time scale. It serialises as its name (`TT`, ..., `LTC`).
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Scale {
    /// Terrestrial Time.
    Tt,
    /// Barycentric Dynamical Time.
    Tdb,
    /// Barycentric Coordinate Time.
    Tcb,
    /// Geocentric Coordinate Time.
    Tcg,
    /// Lunar Coordinate Time.
    Tcl,
    /// The repository's lunar-surface time ([`crate::lunar_time`]), with its origin (JD TT).
    Ltc {
        /// TT JD at which LTC reads TT.
        origin_jd_tt: f64,
    },
}

impl Serialize for Scale {
    fn serialize<S: serde::Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        s.serialize_str(self.name())
    }
}

impl Scale {
    /// Its name.
    pub fn name(&self) -> &'static str {
        match self {
            Scale::Tt => "TT",
            Scale::Tdb => "TDB",
            Scale::Tcb => "TCB",
            Scale::Tcg => "TCG",
            Scale::Tcl => "TCL",
            Scale::Ltc { .. } => "LTC",
        }
    }

    /// Parse a name: `tt`, `tdb`, `tcb`, `tcg`, `tcl`, `ltc` (origin J2000).
    pub fn parse(name: &str) -> Option<Scale> {
        Some(match name.to_ascii_lowercase().as_str() {
            "tt" => Scale::Tt,
            "tdb" => Scale::Tdb,
            "tcb" => Scale::Tcb,
            "tcg" => Scale::Tcg,
            "tcl" => Scale::Tcl,
            "ltc" => Scale::Ltc {
                origin_jd_tt: crate::timescales::JD_J2000,
            },
            _ => return None,
        })
    }
}

/// An epoch: whole Julian day number and seconds into it, in one scale (two parts so the
/// seconds keep nanosecond resolution).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Epoch {
    /// The scale.
    pub scale: Scale,
    /// Julian day (an integer value plus one half: days start at midnight).
    pub jd0: f64,
    /// Seconds since `jd0`.
    pub s: f64,
}

impl Epoch {
    /// A JD split into a day and seconds.
    pub fn from_jd(scale: Scale, jd: f64) -> Self {
        let jd0 = (jd - 0.5).floor() + 0.5;
        Epoch {
            scale,
            jd0,
            s: (jd - jd0) * 86_400.0,
        }
    }
    /// The JD (loses resolution: about 40 µs).
    pub fn jd(&self) -> f64 {
        self.jd0 + self.s / 86_400.0
    }
    fn shifted(mut self, ds: f64, to: Scale) -> Self {
        self.s += ds;
        self.scale = to;
        let k = (self.s / 86_400.0).floor();
        self.jd0 += k;
        self.s -= k * 86_400.0;
        self
    }
    /// Seconds since `T0` (only for the linear relations, where 1e-7 s resolution suffices).
    fn since_t0(&self) -> f64 {
        (self.jd0 - T0_JD) * 86_400.0 + self.s
    }
}

fn to_tt(e: Epoch) -> Option<Epoch> {
    Some(match e.scale {
        Scale::Tt => e,
        Scale::Tcg => e.shifted(-L_G * e.since_t0(), Scale::Tt),
        Scale::Tdb => {
            let d = crate::timescales::tdb_minus_tt(e.jd());
            e.shifted(-d, Scale::Tt)
        }
        Scale::Tcb => {
            // TDB = TCB − L_B·(TCB − T0) + TDB0.
            let tdb = e.shifted(-L_B * e.since_t0() + TDB0_S, Scale::Tdb);
            to_tt(tdb)?
        }
        Scale::Tcl => {
            let (d, _) = tcb_tcl(e.jd())?;
            to_tt(e.shifted(d, Scale::Tcb))?
        }
        Scale::Ltc { origin_jd_tt } => {
            let t_jc = (origin_jd_tt - crate::timescales::JD_J2000) / 36_525.0;
            let rate = crate::lunar_time::rate_s_per_s(t_jc);
            let since = (e.jd0 - origin_jd_tt) * 86_400.0 + e.s;
            e.shifted(-since * rate / (1.0 + rate), Scale::Tt)
        }
    })
}

fn from_tt(e: Epoch, to: Scale) -> Option<Epoch> {
    debug_assert_eq!(e.scale, Scale::Tt);
    Some(match to {
        Scale::Tt => e,
        Scale::Tcg => e.shifted(L_G / (1.0 - L_G) * e.since_t0(), Scale::Tcg),
        Scale::Tdb => e.shifted(crate::timescales::tdb_minus_tt(e.jd()), Scale::Tdb),
        Scale::Tcb => {
            let tdb = from_tt(e, Scale::Tdb)?;
            // TCB − T0 = (TDB − T0 − TDB0) / (1 − L_B).
            let x = tdb.since_t0();
            tdb.shifted((x - TDB0_S) / (1.0 - L_B) - x, Scale::Tcb)
        }
        Scale::Tcl => {
            let tcb = from_tt(e, Scale::Tcb)?;
            let (d, _) = tcb_tcl(tcb.jd())?;
            tcb.shifted(-d, Scale::Tcl)
        }
        Scale::Ltc { origin_jd_tt } => {
            let t_jc = (origin_jd_tt - crate::timescales::JD_J2000) / 36_525.0;
            let rate = crate::lunar_time::rate_s_per_s(t_jc);
            let since = (e.jd0 - origin_jd_tt) * 86_400.0 + e.s;
            e.shifted(since * rate, to)
        }
    })
}

/// Convert an epoch to another scale; `None` outside the ephemerides' span (TCL only).
pub fn convert(e: Epoch, to: Scale) -> Option<Epoch> {
    if e.scale == to {
        return Some(e);
    }
    from_tt(to_tt(e)?, to)
}

/// The TCB − TCL report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// Mean rate at the Moon over the window, `L_CL`.
    pub l_cl: f64,
    /// Mean rate at the geocentre over the same window.
    pub l_c_computed: f64,
    /// `L_C` (IERS 2010).
    pub l_c_iers: f64,
    /// Bound on both rates.
    pub rate_bound: f64,
    /// `L_CL − L_C`: the Moon's coordinate time against the Earth's, ns/day.
    pub tcg_minus_tcl_ns_per_day: f64,
    /// Smallest and largest instantaneous lunar rate over the window.
    pub rate_min: f64,
    /// Largest.
    pub rate_max: f64,
    /// `TCB − TCL` at the requested epoch, s.
    pub tcb_minus_tcl_s: f64,
    /// Its bound, s.
    pub tcb_minus_tcl_bound_s: f64,
    /// The epoch, JD TCB.
    pub jd_tcb: f64,
    /// The averaging window, JD TDB.
    pub window_jd: [f64; 2],
}

/// Build the report for an epoch (JD TCB) and an averaging window (JD TDB).
pub fn report(jd_tcb: f64, window: [f64; 2]) -> Option<Report> {
    let l_cl = mean_rate(RateBody::Moon, window[0], window[1], 1.0)?;
    let l_c = mean_rate(RateBody::Earth, window[0], window[1], 1.0)?;
    let (mut lo, mut hi) = (f64::INFINITY, f64::NEG_INFINITY);
    let mut jd = window[0];
    while jd <= window[1] {
        let r = tcb_rate(RateBody::Moon, jd)?;
        lo = lo.min(r);
        hi = hi.max(r);
        jd += 0.25;
    }
    let (d, b) = tcb_tcl(jd_tcb)?;
    Some(Report {
        schema: "kshana.lunar-tcb-tcl/1",
        label: LABEL,
        l_cl,
        l_c_computed: l_c,
        l_c_iers: L_C_IERS,
        rate_bound: RATE_BOUND,
        tcg_minus_tcl_ns_per_day: (l_cl - l_c) * 86_400.0 * 1e9,
        rate_min: lo,
        rate_max: hi,
        tcb_minus_tcl_s: d,
        tcb_minus_tcl_bound_s: b,
        jd_tcb,
        window_jd: window,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    const J2000: f64 = 2_451_545.0;
    const J2030: f64 = 2_462_502.5;

    #[test]
    fn the_geocentre_gives_l_c() {
        let l = mean_rate(RateBody::Earth, J2000, J2030, 1.0).unwrap();
        assert!((l - L_C_IERS).abs() < RATE_BOUND, "{l:e} vs {L_C_IERS:e}");
    }

    #[test]
    fn the_moon_rate_and_the_tcg_tcl_difference() {
        let lm = mean_rate(RateBody::Moon, J2000, J2030, 1.0).unwrap();
        let le = mean_rate(RateBody::Earth, J2000, J2030, 1.0).unwrap();
        // The Moon sits in the Earth's potential (GM/r ≈ 1.04e6 m²/s²) and moves about it at
        // ≈ 1 km/s: L_CL − L_C ≈ (GM/r + v²/2)/c² ≈ 1.7e-11, about 1.5 µs/day, the published
        // TCG − TCL rate of [`crate::lunar_time::TCG_TCL_RATE_REF_NS_DAY`] to within its band.
        let ns_day = (lm - le) * 86_400.0 * 1e9;
        assert!(
            (ns_day - crate::lunar_time::TCG_TCL_RATE_REF_NS_DAY).abs() < 30.0,
            "{ns_day}"
        );
    }

    #[test]
    fn tcb_tcl_grows_at_the_lunar_rate() {
        let (d, b) = tcb_tcl(J2000).unwrap();
        let elapsed = (J2000 - T0_JD) * 86_400.0;
        let lm = mean_rate(RateBody::Moon, T0_JD, J2000, 1.0).unwrap();
        assert!((d - lm * elapsed).abs() < 1e-6 * d, "{d} {}", lm * elapsed);
        assert!(b > 0.0 && b < 2e-3, "{b}");
        // About 10.76 s by 2000 (L_C·Δt ≈ 10.748 s plus the lunar part).
        assert!(d > 10.7 && d < 10.8, "{d}");
        assert_eq!(tcb_tcl(T0_JD).unwrap(), (0.0, 0.0));
    }

    #[test]
    fn the_defining_relations_at_j2000() {
        let tt = Epoch::from_jd(Scale::Tt, J2000);
        let tcg = convert(tt, Scale::Tcg).unwrap();
        let d = (tcg.jd0 - tt.jd0) * 86_400.0 + tcg.s - tt.s;
        // TCG − TT at J2000 ≈ 0.5058 s.
        assert!((d - 0.505_8).abs() < 1e-4, "{d}");
        let tcb = convert(tt, Scale::Tcb).unwrap();
        let tdb = convert(tt, Scale::Tdb).unwrap();
        let d = (tcb.jd0 - tdb.jd0) * 86_400.0 + tcb.s - tdb.s;
        // TCB − TDB at J2000 ≈ 11.2537 s.
        assert!((d - 11.253_7).abs() < 2e-4, "{d}");
    }

    #[test]
    fn every_conversion_round_trips() {
        let scales = [
            Scale::Tt,
            Scale::Tdb,
            Scale::Tcb,
            Scale::Tcg,
            Scale::Tcl,
            Scale::parse("ltc").unwrap(),
        ];
        let e0 = Epoch::from_jd(Scale::Tt, 2_461_000.25);
        for a in scales {
            let ea = convert(e0, a).unwrap();
            for b in scales {
                let back = convert(convert(ea, b).unwrap(), a).unwrap();
                let err = (back.jd0 - ea.jd0) * 86_400.0 + back.s - ea.s;
                assert!(err.abs() < 2e-6, "{a:?} -> {b:?}: {err}");
            }
        }
    }

    #[test]
    fn the_approximation_bound_holds_on_a_denser_grid() {
        // Fit on a one-day grid over 2014-2030, then check on a quarter-day grid offset by an
        // eighth of a day: the bound found at fit time must hold (with a 50 % allowance) on points
        // the fit never saw.
        let (a, b) = (2_456_658.5, 2_462_867.5);
        let ap = fit_approx(a, b, 1.0).unwrap();
        // About 13 µs largest and 5 µs RMS over 2014-2030 with the twelve terms.
        assert!(ap.max_error_s < 2e-5, "{}", ap.max_error_s);
        assert!((ap.l - mean_rate(RateBody::Moon, a, b, 1.0).unwrap()).abs() < 1e-11);
        let h = 0.25;
        let n = ((b - a - 1.0) / h) as usize;
        let y = integral_grid(a + 0.125, h, n).unwrap();
        let worst = y
            .iter()
            .enumerate()
            .map(|(i, v)| (ap.eval(a + 0.125 + i as f64 * h) - v).abs())
            .fold(0.0, f64::max);
        assert!(
            worst <= 1.5 * ap.max_error_s + 1e-9,
            "{worst} vs {}",
            ap.max_error_s
        );
    }

    #[test]
    fn outside_the_ephemeris_span_there_is_no_answer() {
        assert!(tcb_rate(RateBody::Moon, 2_470_000.0).is_none());
        assert!(convert(Epoch::from_jd(Scale::Tt, 2_480_000.0), Scale::Tcl).is_none());
    }

    #[test]
    fn scale_names() {
        assert_eq!(Scale::parse("TCL"), Some(Scale::Tcl));
        assert!(Scale::parse("utc").is_none());
    }
}
