// SPDX-License-Identifier: AGPL-3.0-only
//! The fitter: from a truth orbit and clock to a navigation message.
//!
//! * **Keplerian models** (`kepler16`, `kepler-rac`, `liu22`): a Levenberg–Marquardt
//!   least-squares fit of the Keplerian set to the truth ECEF positions over the fit
//!   window. Internally the fit runs on non-singular elements (`e·cos ω`, `e·sin ω` and
//!   the mean argument of latitude `λ0 = M0 + ω`) because a LEO orbit is nearly circular
//!   and `ω`, `M0` are then almost indistinguishable; the message carries the ICD
//!   `e, ω, M0` recovered from them. The start is the osculating state at `toe` with the
//!   J2 secular node rate. Weak zero-centred priors on the rates and harmonics bound the
//!   parameters an arc too short to resolve them would otherwise send to large offsetting
//!   values; the observation weight is 1 cm, so the priors act only in those null
//!   directions. The Jacobian is by central differences.
//! * **`kepler-rac`** then fits the along-track, cross-track and radial residuals of the
//!   Keplerian fit, each with a polynomial in `τ = tk / tau_s` (`tau_s` the power of two at
//!   or above half the fit interval), by linear least squares. Because the least-squares
//!   Keplerian residual is what the Keplerian set cannot span, it oscillates across the
//!   window; a correction polynomial only removes it when its degree exceeds what the
//!   Keplerian set already spans (in practice along-track 7, cross-track 5, radial 6), and
//!   a cross-track polynomial of degree 2 to 4 removes almost nothing.
//! * **`ecef-poly`**: a linear least-squares polynomial per ECEF axis in
//!   `τ = (t − t_ref) / 64 s`.
//! * **Clock**: a linear least-squares fit of `af0, af1, af2` to the truth clock (the
//!   oscillator plus the periodic relativistic term) minus the relativistic term the
//!   message's own user algorithm adds, so a user who adds the ICD term back recovers the
//!   truth. A zero-clock message carries no clock.
//!
//! Linear solves use Householder QR on column-equilibrated matrices.

use super::elements::{
    ephemeris_at, kepler_frame, kepler_point, sub, ClockPoly, EcefPoly, EphemerisModel, Keplerian,
    Liu22Extra, RacPoly, SysTime, OMEGA_E, POLY_TAU_S,
};
use super::truth::{state_to_elements, TruthClock, TruthOrbit};
use serde::{Deserialize, Serialize};

/// Which ephemeris model to fit.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum ModelKind {
    /// Galileo ICD 16-parameter Keplerian set.
    Kepler16,
    /// Keplerian set plus along/cross/radial polynomials of the stated degrees.
    KeplerRac {
        /// Polynomial degrees `[along, cross, radial]`.
        degrees: [usize; 3],
    },
    /// Liu et al. 2025 22-parameter model.
    Liu22,
    /// ECEF polynomial of the stated degree per axis.
    EcefPoly {
        /// Polynomial degree.
        degree: usize,
    },
}

impl ModelKind {
    /// Parse a model name: `kepler16`, `kepler-rac`, `liu22` or `ecef-poly`, with the
    /// degree settings supplied.
    pub fn parse(name: &str, rac_degrees: [usize; 3], poly_degree: usize) -> Result<Self, String> {
        match name {
            "kepler16" => Ok(ModelKind::Kepler16),
            "kepler-rac" => {
                if rac_degrees.iter().any(|&d| d > 7) {
                    return Err(format!(
                        "rac_degrees must each be at most 7; got {rac_degrees:?}"
                    ));
                }
                Ok(ModelKind::KeplerRac {
                    degrees: rac_degrees,
                })
            }
            "liu22" => Ok(ModelKind::Liu22),
            "ecef-poly" => {
                if !(1..=10).contains(&poly_degree) {
                    return Err(format!("poly_degree must be 1-10; got {poly_degree}"));
                }
                Ok(ModelKind::EcefPoly {
                    degree: poly_degree,
                })
            }
            other => Err(format!(
                "unknown ephemeris model '{other}': use kepler16, kepler-rac, liu22 or ecef-poly"
            )),
        }
    }

    /// The model code.
    pub fn code(&self) -> &'static str {
        match self {
            ModelKind::Kepler16 => "kepler16",
            ModelKind::KeplerRac { .. } => "kepler-rac",
            ModelKind::Liu22 => "liu22",
            ModelKind::EcefPoly { .. } => "ecef-poly",
        }
    }
}

/// A fitted ephemeris and clock, with fit diagnostics.
#[derive(Clone, Debug)]
pub struct Fitted {
    /// Week the reference times count in.
    pub week: u32,
    /// The ephemeris.
    pub ephemeris: EphemerisModel,
    /// The clock polynomial, or `None` for a zero-clock fit.
    pub clock: Option<ClockPoly>,
    /// Levenberg–Marquardt iterations (0 for linear models).
    pub iterations: usize,
    /// Root-mean-square 3D position residual at the fit samples after the Keplerian
    /// stage (m); for `ecef-poly`, after the polynomial.
    pub kepler_rms_m: f64,
}

/// Solve the linear least-squares problem `min ‖A x − b‖` by Householder QR on the
/// column-equilibrated matrix. `a` is row-major (`m` rows of `n`). `None` when a column is
/// all zero or the triangular factor is singular.
pub fn lstsq(a: &[Vec<f64>], b: &[f64]) -> Option<Vec<f64>> {
    let m = a.len();
    if m == 0 || b.len() != m {
        return None;
    }
    let n = a[0].len();
    if n == 0 || m < n {
        return None;
    }
    // Column scales.
    let mut scale = vec![0.0; n];
    for row in a {
        for (j, s) in scale.iter_mut().enumerate() {
            *s += row[j] * row[j];
        }
    }
    for s in scale.iter_mut() {
        *s = s.sqrt();
        if *s == 0.0 || !s.is_finite() {
            return None;
        }
    }
    // Column-major working copy.
    let mut q: Vec<Vec<f64>> = (0..n)
        .map(|j| (0..m).map(|i| a[i][j] / scale[j]).collect())
        .collect();
    let mut y = b.to_vec();
    for k in 0..n {
        let normx: f64 = q[k][k..].iter().map(|v| v * v).sum::<f64>().sqrt();
        if normx == 0.0 {
            return None;
        }
        let alpha = if q[k][k] > 0.0 { -normx } else { normx };
        let mut v: Vec<f64> = q[k][k..].to_vec();
        v[0] -= alpha;
        let vnorm2: f64 = v.iter().map(|x| x * x).sum();
        if vnorm2 == 0.0 {
            continue;
        }
        for col in q.iter_mut().skip(k) {
            let d: f64 = v.iter().zip(&col[k..]).map(|(a, b)| a * b).sum();
            let f = 2.0 * d / vnorm2;
            for (i, vi) in v.iter().enumerate() {
                col[k + i] -= f * vi;
            }
        }
        let d: f64 = v.iter().zip(&y[k..]).map(|(a, b)| a * b).sum();
        let f = 2.0 * d / vnorm2;
        for (i, vi) in v.iter().enumerate() {
            y[k + i] -= f * vi;
        }
    }
    // Back substitution on R (upper triangle of q).
    let mut x = vec![0.0; n];
    let rmax = (0..n).map(|k| q[k][k].abs()).fold(0.0, f64::max);
    for k in (0..n).rev() {
        let rkk = q[k][k];
        if rkk.abs() <= rmax * 1e-15 {
            return None;
        }
        let mut s = y[k];
        for j in k + 1..n {
            s -= q[j][k] * x[j];
        }
        x[k] = s / rkk;
    }
    for (xj, s) in x.iter_mut().zip(&scale) {
        *xj /= s;
    }
    Some(x)
}

/// Linear least-squares polynomial fit (degree `deg`) of `ys` at abscissae `xs`.
pub fn polyfit(xs: &[f64], ys: &[f64], deg: usize) -> Option<Vec<f64>> {
    let rows: Vec<Vec<f64>> = xs
        .iter()
        .map(|&x| (0..=deg).map(|k| x.powi(k as i32)).collect())
        .collect();
    lstsq(&rows, ys)
}

/// Number of Keplerian parameters in the non-singular internal vector.
fn n_params(liu: bool) -> usize {
    if liu {
        21
    } else {
        15
    }
}

fn to_kepler(p: &[f64], toe: f64) -> (Keplerian, Option<Liu22Extra>) {
    let e = p[1].hypot(p[2]);
    let omega = if e > 0.0 { p[2].atan2(p[1]) } else { 0.0 };
    let k = Keplerian {
        sqrt_a: p[0],
        e,
        i0: p[3],
        omega0: wrap_pi(p[4]),
        omega,
        m0: wrap_pi(p[5] - omega),
        delta_n: p[6],
        omega_dot: p[7],
        i_dot: p[8],
        cuc: p[9],
        cus: p[10],
        crc: p[11],
        crs: p[12],
        cic: p[13],
        cis: p[14],
        toe,
    };
    let extra = if p.len() > 15 {
        Some(Liu22Extra {
            a_dot: p[15],
            n_dot: p[16],
            crs3: p[17],
            crc3: p[18],
            crs1: p[19],
            crc1: p[20],
        })
    } else {
        None
    };
    (k, extra)
}

/// Wrap an angle into `(−π, π]`.
pub fn wrap_pi(a: f64) -> f64 {
    let t = std::f64::consts::TAU;
    let mut x = a % t;
    if x > std::f64::consts::PI {
        x -= t;
    } else if x <= -std::f64::consts::PI {
        x += t;
    }
    x
}

/// Finite-difference steps of the internal parameters.
const FD_STEP: [f64; 21] = [
    1e-4, 1e-8, 1e-8, 1e-9, 1e-9, 1e-9, 1e-13, 1e-13, 1e-13, 1e-9, 1e-9, 1e-3, 1e-3, 1e-9, 1e-9,
    1e-6, 1e-16, 1e-3, 1e-3, 1e-3, 1e-3,
];
/// One-sigma zero-centred priors (`0` = none) of the internal parameters.
const PRIOR_SIGMA: [f64; 21] = [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1e-6, 1e-6, 1e-7, 1e-3, 1e-3, 5e3, 5e3, 1e-3, 1e-3, 1.0, 1e-11,
    5e3, 5e3, 5e3, 5e3,
];
/// Time scale of the clock fit's normal equations (s); conditioning only.
const CLOCK_SCALE_S: f64 = 512.0;
/// Observation weight: one-sigma position residual (m).
const OBS_SIGMA_M: f64 = 0.01;

/// Sample times of a fit window: `n` points from `start` to `start + len`.
pub fn sample_times(start: &SysTime, len: f64, sample_s: f64) -> Vec<SysTime> {
    let n = (len / sample_s).round().max(2.0) as usize;
    (0..=n)
        .map(|k| start.plus(len * k as f64 / n as f64))
        .collect()
}

/// Fit a message to the truth over `[start, start + len]`.
pub fn fit_message(
    truth: &TruthOrbit,
    clock: Option<&TruthClock>,
    kind: ModelKind,
    start: &SysTime,
    len: f64,
    sample_s: f64,
) -> Result<Fitted, String> {
    if len.is_nan() || len < 10.0 {
        return Err(format!("fit interval must be at least 10 s; got {len}"));
    }
    let t0 = truth.dt_of(start);
    if t0 < -1e-6 || t0 + len > truth.span_s() + 1e-6 {
        return Err(format!(
            "fit window [{t0:.0}, {:.0}] s lies outside the truth arc [0, {:.0}] s",
            t0 + len,
            truth.span_s()
        ));
    }
    let centre = start.plus(len / 2.0);
    // Integer-second reference time, as the codec transmits it.
    let reft = SysTime::new(centre.week, centre.tow.round());
    let week = reft.week;
    let toe = reft.tow;
    let times = sample_times(start, len, sample_s);
    let obs: Vec<[f64; 3]> = times
        .iter()
        .map(|t| truth.state_ecef(truth.dt_of(t)).0)
        .collect();
    let (ephemeris, iterations, kepler_rms_m) = match kind {
        ModelKind::EcefPoly { degree } => {
            let taus: Vec<f64> = times.iter().map(|t| t.minus(&reft) / POLY_TAU_S).collect();
            let mut coeffs: [Vec<f64>; 3] = Default::default();
            for (ax, c) in coeffs.iter_mut().enumerate() {
                let ys: Vec<f64> = obs.iter().map(|o| o[ax]).collect();
                *c = polyfit(&taus, &ys, degree)
                    .ok_or("ECEF polynomial fit is singular (too few samples for the degree)")?;
            }
            let model = EphemerisModel::EcefPoly {
                poly: EcefPoly { t_ref: toe, coeffs },
            };
            let rms = rms3(&model, week, &times, &obs);
            (model, 0, rms)
        }
        _ => {
            let liu = matches!(kind, ModelKind::Liu22);
            let (p, iters) = fit_kepler(truth, &reft, &times, &obs, liu)?;
            let (kep, extra) = to_kepler(&p, toe);
            let base = match extra {
                Some(extra) => EphemerisModel::Liu22 { kepler: kep, extra },
                None => EphemerisModel::Kepler16 { kepler: kep },
            };
            let rms = rms3(&base, week, &times, &obs);
            let model = if let ModelKind::KeplerRac { degrees } = kind {
                let tau_s = super::elements::rac_tau_for(len);
                let mut comps = [Vec::new(), Vec::new(), Vec::new()];
                let mut taus = Vec::with_capacity(times.len());
                for (t, o) in times.iter().zip(&obs) {
                    let tk = t.minus(&reft);
                    let ev = kepler_point(&kep, None, tk);
                    let f = kepler_frame(&ev);
                    let d = f.project(sub(*o, ev.pos));
                    for c in 0..3 {
                        comps[c].push(d[c]);
                    }
                    taus.push(tk / tau_s);
                }
                let fitc = |c: usize| -> Result<Vec<f64>, String> {
                    polyfit(&taus, &comps[c], degrees[c]).ok_or_else(|| {
                        "correction polynomial fit is singular (too few samples for the degree)"
                            .to_string()
                    })
                };
                EphemerisModel::KeplerRac {
                    kepler: kep,
                    rac: RacPoly {
                        tau_s,
                        along: fitc(0)?,
                        cross: fitc(1)?,
                        radial: fitc(2)?,
                    },
                }
            } else {
                base
            };
            (model, iters, rms)
        }
    };
    let clock = match clock {
        Some(c) => Some(fit_clock(truth, c, &ephemeris, week, toe, &times)?),
        None => None,
    };
    Ok(Fitted {
        week,
        ephemeris,
        clock,
        iterations,
        kepler_rms_m,
    })
}

fn rms3(model: &EphemerisModel, week: u32, times: &[SysTime], obs: &[[f64; 3]]) -> f64 {
    let s: f64 = times
        .iter()
        .zip(obs)
        .map(|(t, o)| {
            let d = sub(ephemeris_at(model, week, t).0, *o);
            d[0] * d[0] + d[1] * d[1] + d[2] * d[2]
        })
        .sum();
    (s / times.len() as f64).sqrt()
}

fn fit_clock(
    truth: &TruthOrbit,
    clock: &TruthClock,
    model: &EphemerisModel,
    week: u32,
    toc: f64,
    times: &[SysTime],
) -> Result<ClockPoly, String> {
    let reft = SysTime { week, tow: toc };
    let mut xs = Vec::with_capacity(times.len());
    let mut ys = Vec::with_capacity(times.len());
    for t in times {
        let dt = truth.dt_of(t);
        let apparent = clock.apparent_s(truth, dt);
        let rel_user = ephemeris_at(model, week, t).2;
        xs.push(t.minus(&reft) / CLOCK_SCALE_S);
        // Work in nanoseconds for conditioning.
        ys.push((apparent - rel_user) * 1e9);
    }
    let c = polyfit(&xs, &ys, 2).ok_or("clock fit is singular")?;
    Ok(ClockPoly {
        toc,
        af0: c[0] * 1e-9,
        af1: c[1] * 1e-9 / CLOCK_SCALE_S,
        af2: c[2] * 1e-9 / (CLOCK_SCALE_S * CLOCK_SCALE_S),
    })
}

fn initial_params(truth: &TruthOrbit, reft: &SysTime, liu: bool) -> Vec<f64> {
    let dt = truth.dt_of(reft);
    let (r, v) = truth.state_inertial(dt);
    let (a, e, i, raan, argp, m) = state_to_elements(r, v);
    let rates = crate::forces::j2_secular_rates(a, e, i);
    let mut p = vec![0.0; n_params(liu)];
    p[0] = a.sqrt();
    p[1] = e * argp.cos();
    p[2] = e * argp.sin();
    p[3] = i;
    p[4] = wrap_pi(raan - truth.theta(dt) + OMEGA_E * reft.tow);
    p[5] = wrap_pi(m + argp);
    p[7] = rates.raan;
    p
}

fn kepler_residuals(
    p: &[f64],
    reft: &SysTime,
    times: &[SysTime],
    obs: &[[f64; 3]],
    out: &mut Vec<f64>,
) {
    out.clear();
    let (k, extra) = to_kepler(p, reft.tow);
    for (t, o) in times.iter().zip(obs) {
        let tk = t.minus(reft);
        let pos = kepler_point(&k, extra.as_ref(), tk).pos;
        for c in 0..3 {
            out.push((pos[c] - o[c]) / OBS_SIGMA_M);
        }
    }
    for (j, &pj) in p.iter().enumerate() {
        if PRIOR_SIGMA[j] > 0.0 {
            out.push(pj / PRIOR_SIGMA[j]);
        }
    }
}

fn fit_kepler(
    truth: &TruthOrbit,
    reft: &SysTime,
    times: &[SysTime],
    obs: &[[f64; 3]],
    liu: bool,
) -> Result<(Vec<f64>, usize), String> {
    let np = n_params(liu);
    let mut p = initial_params(truth, reft, liu);
    let mut r = Vec::new();
    kepler_residuals(&p, reft, times, obs, &mut r);
    let mut cost: f64 = r.iter().map(|x| x * x).sum();
    let mut lambda: f64 = 1e-3;
    let mut iters = 0;
    let mut stall = 0;
    let (mut rp, mut rm) = (Vec::new(), Vec::new());
    for it in 0..80 {
        iters = it + 1;
        // Jacobian by central differences: jac[i][j].
        let m = r.len();
        let mut jac = vec![vec![0.0; np]; m];
        for j in 0..np {
            let h = FD_STEP[j];
            let mut q = p.clone();
            q[j] = p[j] + h;
            kepler_residuals(&q, reft, times, obs, &mut rp);
            q[j] = p[j] - h;
            kepler_residuals(&q, reft, times, obs, &mut rm);
            for i in 0..m {
                jac[i][j] = (rp[i] - rm[i]) / (2.0 * h);
            }
        }
        let colnorm: Vec<f64> = (0..np)
            .map(|j| jac.iter().map(|row| row[j] * row[j]).sum::<f64>().sqrt())
            .collect();
        let mut improved = false;
        for _ in 0..12 {
            let mut a = jac.clone();
            let mut b: Vec<f64> = r.iter().map(|x| -x).collect();
            for j in 0..np {
                let mut row = vec![0.0; np];
                row[j] = lambda.sqrt() * colnorm[j].max(1e-30);
                a.push(row);
                b.push(0.0);
            }
            let Some(dp) = lstsq(&a, &b) else {
                lambda *= 10.0;
                continue;
            };
            let q: Vec<f64> = p.iter().zip(&dp).map(|(a, b)| a + b).collect();
            let mut rq = Vec::new();
            kepler_residuals(&q, reft, times, obs, &mut rq);
            let cq: f64 = rq.iter().map(|x| x * x).sum();
            if cq.is_finite() && cq < cost {
                let cost_before = cost;
                let rel = (cost - cq) / cost.max(1e-300);
                p = q;
                r = rq;
                cost = cq;
                lambda = (lambda / 5.0).max(1e-12);
                improved = true;
                // Converged: the cost (in units of the 1 cm observation weight) stopped
                // moving, relatively or absolutely.
                if rel < 1e-10 || (cost_before - cq) < 1e-6 {
                    stall += 1;
                    if stall >= 3 {
                        return Ok((p, iters));
                    }
                } else {
                    stall = 0;
                }
                break;
            }
            lambda *= 8.0;
        }
        if !improved {
            break;
        }
    }
    if !cost.is_finite() {
        return Err("Keplerian fit diverged".to_string());
    }
    Ok((p, iters))
}
