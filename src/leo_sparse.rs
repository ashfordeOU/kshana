// SPDX-License-Identifier: AGPL-3.0-only
//! Sparse-geometry LEO-PNT study: what one or two low Earth orbit (LEO) satellites in view can
//! tell a static user about its position and clock over time (`kshana leo-sparse`).
//!
//! A planning study. For a stated Walker LEO constellation and a static user it selects, at each
//! step, at most 1 or 2 satellites above the mask (keeping those already tracked while they stay in
//! view, then the highest), and accumulates the information their measurements carry about the
//! user's state x = [position (3, Earth-fixed), clock bias (m), clock drift (m/s)]:
//!
//! * range (pseudorange) ρ = |s − r| + b + d·t, partials H = [−u, 1, t];
//! * range rate (Doppler) ρ̇ = u·vₛ + d, partials H = [−(vₛ − (u·vₛ)u)/|s − r|, 0, 1],
//!
//! with u the unit vector from the user to the satellite and s, vₛ the satellite's Earth-fixed
//! position and velocity. The information J = Σ HᵀH/σ² plus the stated priors gives the formal
//! covariance P = (J + P₀⁻¹)⁻¹, reported in the user's local east, north and up axes, with the
//! clock bias and drift, the rank of J, and the time at which the horizontal (and 3D) standard
//! deviation first reaches the stated target.
//!
//! It processes no measurements: there is no estimator, no filter and no real-time solution. The
//! states are constant over the window (a static user, a clock with constant drift); satellite
//! orbits are two-body; the measurement noise is white and the satellite ephemerides are taken as
//! exact. A formal covariance shows the information geometry, not achieved accuracy. MODELLED.

use crate::constellation::{Elements, WalkerPattern, WalkerSpec};
use serde::{Deserialize, Serialize};

/// Earth's gravitational parameter, m³/s² (WGS 84).
pub const MU: f64 = 3.986_004_418e14;
/// Earth's rotation rate, rad/s (WGS 84).
pub const OMEGA_E: f64 = 7.292_115e-5;
/// Earth's equatorial radius, m (WGS 84).
pub const RE: f64 = 6_378_137.0;

type V3 = [f64; 3];
type M5 = [[f64; 5]; 5];

fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: V3, b: V3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: V3) -> f64 {
    dot(a, a).sqrt()
}

/// The user.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct User {
    /// Geodetic latitude, degrees (WGS 84).
    pub lat_deg: f64,
    /// Longitude, degrees.
    pub lon_deg: f64,
    /// Ellipsoidal height, m.
    #[serde(default)]
    pub height_m: f64,
}

/// The LEO constellation, a Walker delta pattern.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Leo {
    /// Satellites.
    pub total: usize,
    /// Planes.
    pub planes: usize,
    /// Walker phasing factor.
    pub phasing: usize,
    /// Altitude, km.
    pub altitude_km: f64,
    /// Inclination, degrees.
    pub inclination_deg: f64,
}

/// Which measurements the satellites provide.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Measurements {
    /// Range rate only.
    Doppler,
    /// Pseudorange only.
    Range,
    /// Both.
    Both,
}

/// A study.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Study {
    /// The user.
    pub user: User,
    /// The constellation.
    pub leo: Leo,
    /// Elevation mask, degrees.
    pub mask_deg: f64,
    /// The cases to compute: the largest number of satellites used at once (1, 2, or both).
    pub max_in_view: Vec<usize>,
    /// The measurements.
    pub measurements: Measurements,
    /// Range-rate noise, m/s (1 sigma).
    #[serde(default = "default_doppler")]
    pub doppler_sigma_mps: f64,
    /// Range noise, m (1 sigma).
    #[serde(default = "default_range")]
    pub range_sigma_m: f64,
    /// Window, hours.
    pub duration_hours: f64,
    /// Measurement interval, s.
    pub step_s: f64,
    /// Report interval, s.
    pub report_every_s: f64,
    /// Prior position standard deviation per axis, m (large: unknown).
    #[serde(default = "default_prior_pos")]
    pub prior_position_m: f64,
    /// Prior clock-bias standard deviation, m.
    #[serde(default = "default_prior_bias")]
    pub prior_bias_m: f64,
    /// Prior clock-drift standard deviation, m/s.
    #[serde(default = "default_prior_drift")]
    pub prior_drift_mps: f64,
    /// Target horizontal standard deviation, m.
    pub target_horizontal_m: f64,
    /// Target 3D standard deviation, m (optional).
    #[serde(default)]
    pub target_3d_m: Option<f64>,
}

fn default_doppler() -> f64 {
    0.1
}
fn default_range() -> f64 {
    5.0
}
fn default_prior_pos() -> f64 {
    1e6
}
fn default_prior_bias() -> f64 {
    1e6
}
fn default_prior_drift() -> f64 {
    1e3
}

/// The ECI position and velocity of circular or elliptic Keplerian elements at `t` (two-body),
/// the node taken as inertial at t = 0, when the inertial and Earth-fixed axes coincide.
pub fn kepler_state(el: &Elements, t: f64) -> (V3, V3) {
    let n = (MU / el.a_m.powi(3)).sqrt();
    let m = el.m0_rad + n * t;
    let e = el.e;
    let mut ea = m;
    for _ in 0..30 {
        ea -= (ea - e * ea.sin() - m) / (1.0 - e * ea.cos());
    }
    let (s, c) = ea.sin_cos();
    let r = el.a_m * (1.0 - e * c);
    let (xp, yp) = (el.a_m * (c - e), el.a_m * (1.0 - e * e).sqrt() * s);
    let rdot = (MU * el.a_m).sqrt() / r;
    let (vxp, vyp) = (-rdot * s, rdot * (1.0 - e * e).sqrt() * c);
    let (so, co) = el.raan_rad.sin_cos();
    let (si, ci) = el.i_rad.sin_cos();
    let (sw, cw) = el.argp_rad.sin_cos();
    let rot = |x: f64, y: f64| -> V3 {
        [
            (co * cw - so * sw * ci) * x + (-co * sw - so * cw * ci) * y,
            (so * cw + co * sw * ci) * x + (-so * sw + co * cw * ci) * y,
            (sw * si) * x + (cw * si) * y,
        ]
    };
    (rot(xp, yp), rot(vxp, vyp))
}

/// Earth-fixed position and velocity at `t` from ECI ones (rotation ωₑt about z).
pub fn to_ecef(r: V3, v: V3, t: f64) -> (V3, V3) {
    let (s, c) = (OMEGA_E * t).sin_cos();
    let rr = [c * r[0] + s * r[1], -s * r[0] + c * r[1], r[2]];
    let vr = [c * v[0] + s * v[1], -s * v[0] + c * v[1], v[2]];
    // v_ecef = R·v_eci − ω × r_ecef
    (
        rr,
        [vr[0] + OMEGA_E * rr[1], vr[1] - OMEGA_E * rr[0], vr[2]],
    )
}

/// WGS 84 geodetic to Earth-fixed.
pub fn user_ecef(u: &User) -> V3 {
    crate::frames::geodetic_to_ecef(crate::frames::Geodetic {
        lat_rad: u.lat_deg.to_radians(),
        lon_rad: u.lon_deg.to_radians(),
        alt_m: u.height_m,
    })
}

/// The partials of a range-rate measurement with respect to [r, b, d].
pub fn doppler_partials(user: V3, sat: V3, vsat: V3) -> [f64; 5] {
    let los = sub(sat, user);
    let rho = norm(los);
    let u = [los[0] / rho, los[1] / rho, los[2] / rho];
    let uv = dot(u, vsat);
    [
        -(vsat[0] - uv * u[0]) / rho,
        -(vsat[1] - uv * u[1]) / rho,
        -(vsat[2] - uv * u[2]) / rho,
        0.0,
        1.0,
    ]
}

/// The range rate the model predicts (without the drift): u·vₛ.
pub fn range_rate(user: V3, sat: V3, vsat: V3) -> f64 {
    let los = sub(sat, user);
    dot(los, vsat) / norm(los)
}

/// The partials of a range measurement at time `t` with respect to [r, b, d].
pub fn range_partials(user: V3, sat: V3, t: f64) -> [f64; 5] {
    let los = sub(sat, user);
    let rho = norm(los);
    [-los[0] / rho, -los[1] / rho, -los[2] / rho, 1.0, t]
}

#[allow(clippy::needless_range_loop)]
/// The inverse of a symmetric positive-definite 5 × 5 matrix, through its diagonal scaling
/// D⁻¹ᐟ² M D⁻¹ᐟ² (unit diagonal), so that states whose information differs by many orders of
/// magnitude (a clock bias held only by its prior beside a well-observed drift) are not mistaken
/// for a singular matrix. `None` when a diagonal is not positive or the scaled matrix is singular.
fn invert(m: M5) -> Option<M5> {
    let mut d = [0.0; 5];
    for i in 0..5 {
        if !(m[i][i] > 0.0 && m[i][i].is_finite()) {
            return None;
        }
        d[i] = m[i][i].sqrt();
    }
    let mut a = [[0.0; 5]; 5];
    for i in 0..5 {
        for j in 0..5 {
            a[i][j] = m[i][j] / (d[i] * d[j]);
        }
    }
    let mut inv = [[0.0; 5]; 5];
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for col in 0..5 {
        let piv = (col..5).max_by(|&x, &y| a[x][col].abs().total_cmp(&a[y][col].abs()))?;
        if a[piv][col].abs() <= 1e-13 {
            return None;
        }
        a.swap(col, piv);
        inv.swap(col, piv);
        let p = a[col][col];
        for k in 0..5 {
            a[col][k] /= p;
            inv[col][k] /= p;
        }
        for r in 0..5 {
            if r != col && a[r][col] != 0.0 {
                let f = a[r][col];
                for k in 0..5 {
                    a[r][k] -= f * a[col][k];
                    inv[r][k] -= f * inv[col][k];
                }
            }
        }
    }
    for i in 0..5 {
        for j in 0..5 {
            inv[i][j] /= d[i] * d[j];
        }
    }
    Some(inv)
}

/// The number of eigenvalues of the symmetric `j` above `rel` times the largest (Jacobi rotations).
#[allow(clippy::needless_range_loop)]
pub fn rank(j: &M5, rel: f64) -> usize {
    let mut a = *j;
    for _ in 0..100 {
        let mut off = 0.0;
        for p in 0..5 {
            for q in p + 1..5 {
                off += a[p][q] * a[p][q];
            }
        }
        if off < 1e-30 {
            break;
        }
        for p in 0..5 {
            for q in p + 1..5 {
                if a[p][q].abs() < 1e-300 {
                    continue;
                }
                let theta = (a[q][q] - a[p][p]) / (2.0 * a[p][q]);
                let t = theta.signum() / (theta.abs() + (theta * theta + 1.0).sqrt());
                let t = if theta == 0.0 { 1.0 } else { t };
                let c = 1.0 / (t * t + 1.0).sqrt();
                let s = t * c;
                for k in 0..5 {
                    let (akp, akq) = (a[k][p], a[k][q]);
                    a[k][p] = c * akp - s * akq;
                    a[k][q] = s * akp + c * akq;
                }
                for k in 0..5 {
                    let (apk, aqk) = (a[p][k], a[q][k]);
                    a[p][k] = c * apk - s * aqk;
                    a[q][k] = s * apk + c * aqk;
                }
            }
        }
    }
    let ev: Vec<f64> = (0..5).map(|i| a[i][i].abs()).collect();
    let max = ev.iter().cloned().fold(0.0, f64::max);
    if max == 0.0 {
        return 0;
    }
    ev.iter().filter(|&&e| e > rel * max).count()
}

/// One report of a case.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Report {
    /// Time since the start, s.
    pub t_s: f64,
    /// Satellites used at this instant (constellation indices).
    pub in_view: Vec<usize>,
    /// Measurements accumulated so far.
    pub measurements: usize,
    /// East, north, up standard deviations, m.
    pub sigma_enu_m: [f64; 3],
    /// Horizontal standard deviation, m.
    pub sigma_horizontal_m: f64,
    /// 3D standard deviation, m.
    pub sigma_3d_m: f64,
    /// Clock-bias standard deviation, m.
    pub sigma_bias_m: f64,
    /// Clock-drift standard deviation, m/s.
    pub sigma_drift_mps: f64,
    /// The rank of the accumulated information (without the priors), of 5.
    pub rank: usize,
}

/// One case's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Case {
    /// The largest number of satellites used at once.
    pub max_in_view: usize,
    /// The reports.
    pub reports: Vec<Report>,
    /// The first report time at which the horizontal sigma reaches the target, s.
    pub time_to_horizontal_target_s: Option<f64>,
    /// The first report time at which the 3D sigma reaches its target, s.
    pub time_to_3d_target_s: Option<f64>,
    /// Distinct satellites used over the window.
    pub satellites_used: usize,
}

/// The study's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct StudyResult {
    /// Always `kshana.leo-sparse/1`.
    pub schema: String,
    /// Always MODELLED.
    pub label: String,
    /// The study.
    pub study: Study,
    /// One per requested case.
    pub cases: Vec<Case>,
}

/// Check a study's numbers.
pub fn check(s: &Study) -> Result<(), String> {
    let pos = |v: f64| v.is_finite() && v > 0.0;
    let ok = (-90.0..=90.0).contains(&s.user.lat_deg)
        && s.user.lon_deg.is_finite()
        && s.user.height_m.is_finite()
        && s.leo.total > 0
        && s.leo.planes > 0
        && s.leo.total.is_multiple_of(s.leo.planes)
        && s.leo.phasing < s.leo.planes
        && pos(s.leo.altitude_km)
        && s.leo.altitude_km < 3000.0
        && (0.0..=180.0).contains(&s.leo.inclination_deg)
        && (0.0..90.0).contains(&s.mask_deg)
        && !s.max_in_view.is_empty()
        && s.max_in_view.iter().all(|&n| n == 1 || n == 2)
        && pos(s.doppler_sigma_mps)
        && pos(s.range_sigma_m)
        && pos(s.duration_hours)
        && pos(s.step_s)
        && s.duration_hours * 3600.0 / s.step_s <= 200_000.0
        && pos(s.report_every_s)
        && s.report_every_s >= s.step_s
        && pos(s.prior_position_m)
        && pos(s.prior_bias_m)
        && pos(s.prior_drift_mps)
        && pos(s.target_horizontal_m)
        && s.target_3d_m.is_none_or(pos);
    if ok {
        Ok(())
    } else {
        Err(crate::terr!("e-leo-sparse-bad-study"))
    }
}

fn elevation_deg(user: V3, sat: V3) -> f64 {
    let d = sub(sat, user);
    (dot(d, user) / (norm(d) * norm(user))).asin().to_degrees()
}

/// Run a study.
pub fn run_study(s: &Study) -> Result<StudyResult, String> {
    check(s)?;
    let spec = WalkerSpec {
        pattern: WalkerPattern::Delta,
        total: s.leo.total,
        planes: s.leo.planes,
        phasing: s.leo.phasing,
        a_m: RE + s.leo.altitude_km * 1e3,
        e: 0.0,
        i_rad: s.leo.inclination_deg.to_radians(),
        raan0_rad: 0.0,
        argp_rad: 0.0,
        m0_rad: 0.0,
    };
    let els = spec.elements()?;
    let user = user_ecef(&s.user);
    let (lat, lon) = (s.user.lat_deg.to_radians(), s.user.lon_deg.to_radians());
    // Rows of the Earth-fixed to east-north-up rotation.
    let enu = [
        [-lon.sin(), lon.cos(), 0.0],
        [-lat.sin() * lon.cos(), -lat.sin() * lon.sin(), lat.cos()],
        [lat.cos() * lon.cos(), lat.cos() * lon.sin(), lat.sin()],
    ];
    let n = (s.duration_hours * 3600.0 / s.step_s).floor() as usize;
    let every = (s.report_every_s / s.step_s).round().max(1.0) as usize;
    let mut cases = Vec::new();
    for &cap in &s.max_in_view {
        let mut j = [[0.0; 5]; 5];
        let mut tracked: Vec<usize> = Vec::new();
        let mut used = std::collections::BTreeSet::new();
        let mut count = 0usize;
        let mut reports = Vec::new();
        let (mut t_h, mut t_3) = (None, None);
        for k in 0..=n {
            let t = k as f64 * s.step_s;
            let states: Vec<(V3, V3)> = els
                .iter()
                .map(|el| {
                    let (r, v) = kepler_state(el, t);
                    to_ecef(r, v, t)
                })
                .collect();
            let visible: Vec<usize> = (0..states.len())
                .filter(|&i| elevation_deg(user, states[i].0) >= s.mask_deg)
                .collect();
            tracked.retain(|i| visible.contains(i));
            let mut rest: Vec<usize> = visible
                .iter()
                .copied()
                .filter(|i| !tracked.contains(i))
                .collect();
            rest.sort_by(|&a, &b| {
                elevation_deg(user, states[b].0).total_cmp(&elevation_deg(user, states[a].0))
            });
            for i in rest {
                if tracked.len() >= cap {
                    break;
                }
                tracked.push(i);
            }
            for &i in &tracked {
                used.insert(i);
                let (sp, sv) = states[i];
                let mut add = |h: [f64; 5], sigma: f64| {
                    for a in 0..5 {
                        for b in 0..5 {
                            j[a][b] += h[a] * h[b] / (sigma * sigma);
                        }
                    }
                    count += 1;
                };
                if matches!(s.measurements, Measurements::Doppler | Measurements::Both) {
                    add(doppler_partials(user, sp, sv), s.doppler_sigma_mps);
                }
                if matches!(s.measurements, Measurements::Range | Measurements::Both) {
                    add(range_partials(user, sp, t), s.range_sigma_m);
                }
            }
            if k % every == 0 || k == n {
                let mut info = j;
                let prior = [
                    s.prior_position_m,
                    s.prior_position_m,
                    s.prior_position_m,
                    s.prior_bias_m,
                    s.prior_drift_mps,
                ];
                for (i, p) in prior.iter().enumerate() {
                    info[i][i] += 1.0 / (p * p);
                }
                let Some(p) = invert(info) else {
                    return Err(crate::terr!("e-leo-sparse-singular"));
                };
                // Position covariance in east, north, up.
                let mut c = [[0.0; 3]; 3];
                for a in 0..3 {
                    for b in 0..3 {
                        for x in 0..3 {
                            for y in 0..3 {
                                c[a][b] += enu[a][x] * p[x][y] * enu[b][y];
                            }
                        }
                    }
                }
                let se = [c[0][0].sqrt(), c[1][1].sqrt(), c[2][2].sqrt()];
                let sh = (c[0][0] + c[1][1]).sqrt();
                let s3 = (c[0][0] + c[1][1] + c[2][2]).sqrt();
                if t_h.is_none() && sh <= s.target_horizontal_m {
                    t_h = Some(t);
                }
                if t_3.is_none() && s.target_3d_m.is_some_and(|x| s3 <= x) {
                    t_3 = Some(t);
                }
                reports.push(Report {
                    t_s: t,
                    in_view: tracked.clone(),
                    measurements: count,
                    sigma_enu_m: se.map(round),
                    sigma_horizontal_m: round(sh),
                    sigma_3d_m: round(s3),
                    sigma_bias_m: round(p[3][3].sqrt()),
                    sigma_drift_mps: round(p[4][4].sqrt()),
                    rank: rank(&j, 1e-12),
                });
            }
        }
        cases.push(Case {
            max_in_view: cap,
            reports,
            time_to_horizontal_target_s: t_h,
            time_to_3d_target_s: t_3,
            satellites_used: used.len(),
        });
    }
    Ok(StudyResult {
        schema: "kshana.leo-sparse/1".to_string(),
        label: "MODELLED".to_string(),
        study: s.clone(),
        cases,
    })
}

fn round(v: f64) -> f64 {
    if v.abs() >= 1.0 {
        (v * 1e3).round() / 1e3
    } else {
        let k = 10f64.powi(6 - v.abs().log10().floor() as i32);
        (v * k).round() / k
    }
}

/// `kshana leo-sparse <study.toml>`: the result as JSON.
pub fn run(args: &[String]) -> Result<(), String> {
    let [path] = args else {
        return Err(crate::t!("leo-sparse-usage"));
    };
    if path.starts_with("--") {
        return Err(crate::t!("leo-sparse-usage"));
    }
    let text = std::fs::read_to_string(path).map_err(|e| {
        crate::terr!(
            "e-leo-sparse-cannot-read",
            path = path.clone(),
            e = e.to_string()
        )
    })?;
    let study: Study = toml::from_str(&text).map_err(|e| {
        crate::terr!(
            "e-leo-sparse-bad-file",
            path = path.clone(),
            e = e.to_string()
        )
    })?;
    let r = run_study(&study)?;
    println!(
        "{}",
        serde_json::to_string_pretty(&r).map_err(|e| e.to_string())?
    );
    Ok(())
}
