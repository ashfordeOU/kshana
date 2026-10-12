// SPDX-License-Identifier: AGPL-3.0-only
//! Reading the KF-GINS text formats and running Kshana's closed-loop GNSS/INS
//! filter on a KF-GINS dataset with GNSS lever-arm compensation.
//!
//! KF-GINS is the open-source EKF GNSS/INS program of the Integrated and Intelligent
//! Navigation group, GNSS Research Center, Wuhan University (GPL-3.0). Nothing of it is
//! linked or copied here: this module reads the plain-text file formats its README
//! documents, so the same demo dataset can drive both programs.
//!
//! * **IMU file:** GNSS seconds of week, X-Y-Z angle increments (rad), X-Y-Z velocity
//!   increments (m/s). The IMU frame is forward-right-down, which is the body frame
//!   [`NavState`] uses, so no axis change is needed. Columns past the seventh are
//!   ignored, as KF-GINS ignores them.
//! * **GNSS file:** seconds of week, latitude (deg), longitude (deg), ellipsoidal
//!   height (m), position standard deviation north-east-down (m). A 13-column row
//!   (with velocity) carries the standard deviations in columns 8-10, as in KF-GINS.
//! * **Navigation result / truth file:** GNSS week, seconds of week, latitude, longitude
//!   (deg), height (m), velocity north-east-down (m/s), roll, pitch, yaw (deg, ZYX).
//! * **Configuration:** the `kf-gins.yaml` subset KF-GINS reads (top-level scalars and
//!   flow lists, the one-level `imunoise:` map, `#` comments). No YAML dependency.
//!
//! [`run`] reproduces the KF-GINS processing structure on Kshana's filter
//! ([`ClosedLoopInsGnss`] around the 15-state [`GnssInsEkf`]): initial state from the
//! configuration at the first IMU epoch at or after `starttime`; the two-sample
//! coning and sculling terms `(1/12)(Δθ₋ × Δθ)` and `(1/12)(Δθ₋ × Δv + Δv₋ × Δθ)` added
//! to each increment (the rotational term `½ Δθ × Δv` is applied by
//! [`NavState::step_increments`]); a GNSS epoch that falls inside an IMU interval
//! splits that interval's increments linearly at the GNSS time (KF-GINS's own rule,
//! including its 1 ms alignment tolerance); and each fix fused as an antenna position
//! with the lever-arm measurement model of
//! [`ClosedLoopInsGnss::fuse_position_lever_arm`].
//!
//! **What Kshana's filter does not have that KF-GINS has:** the six IMU scale-factor
//! states (KF-GINS runs 21 states; Kshana runs 15), the position-error dynamics and the
//! velocity-error position/transport terms of KF-GINS's `F` matrix, and per-axis
//! process noise (the KF-GINS demo's noise values are equal on all three axes, so the
//! isotropic mapping loses nothing there). The bias process noise is KF-GINS's
//! first-order Gauss-Markov form, `2σ²/τ`.

use super::closed_loop::ClosedLoopInsGnss;
use super::gnss_ins_ekf::{EkfNoise, GnssInsEkf};
use crate::frames::{Geodetic, Vec3};
use crate::inertial::attitude::Quaternion;
use crate::inertial::mechanization::{radii_of_curvature, NavState};
use std::collections::BTreeMap;

const D2R: f64 = std::f64::consts::PI / 180.0;
/// KF-GINS's alignment tolerance between a GNSS time and an IMU time (s).
const TIME_ALIGN_ERR: f64 = 0.001;

/// One IMU record: time and body-frame increments over the interval ending at `t`.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ImuIncrement {
    /// GNSS seconds of week (s).
    pub t: f64,
    /// Angle increment, forward-right-down (rad).
    pub dtheta: Vec3,
    /// Velocity increment, forward-right-down (m/s).
    pub dvel: Vec3,
}

/// One GNSS position fix of the antenna phase centre.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct GnssFix {
    /// GNSS seconds of week (s).
    pub t: f64,
    /// Antenna position (geodetic, radians and metres).
    pub pos: Geodetic,
    /// Position standard deviation north, east, down (m).
    pub std_ned: Vec3,
}

/// One navigation record: a KF-GINS result row, a truth row, or a Kshana solution epoch.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct NavRecord {
    /// GNSS week (0 where the writer does not record it).
    pub week: f64,
    /// GNSS seconds of week (s).
    pub t: f64,
    /// IMU-centre position (geodetic, radians and metres).
    pub pos: Geodetic,
    /// Velocity north, east, down (m/s).
    pub vel: Vec3,
    /// Roll, pitch, yaw (rad, ZYX).
    pub rpy: Vec3,
}

fn numbers(line: &str, lineno: usize, min: usize) -> Result<Option<Vec<f64>>, String> {
    let line = line.trim();
    if line.is_empty() || line.starts_with('#') || line.starts_with('%') {
        return Ok(None);
    }
    let v: Result<Vec<f64>, _> = line
        .split(|c: char| c.is_whitespace() || c == ',')
        .filter(|s| !s.is_empty())
        .map(str::parse::<f64>)
        .collect();
    let v = v.map_err(|e| format!("line {lineno}: {e}"))?;
    if v.len() < min {
        return Err(format!(
            "line {lineno}: {} columns, at least {min} expected",
            v.len()
        ));
    }
    Ok(Some(v))
}

/// Parse a KF-GINS IMU text file (7 or more whitespace-separated columns).
pub fn parse_imu(text: &str) -> Result<Vec<ImuIncrement>, String> {
    let mut out = Vec::new();
    for (i, line) in text.lines().enumerate() {
        if let Some(v) = numbers(line, i + 1, 7)? {
            out.push(ImuIncrement {
                t: v[0],
                dtheta: [v[1], v[2], v[3]],
                dvel: [v[4], v[5], v[6]],
            });
        }
    }
    Ok(out)
}

/// Parse a KF-GINS GNSS position file (7 columns, or 13 with velocity).
pub fn parse_gnss(text: &str) -> Result<Vec<GnssFix>, String> {
    let mut out = Vec::new();
    for (i, line) in text.lines().enumerate() {
        if let Some(v) = numbers(line, i + 1, 7)? {
            let s = if v.len() >= 13 { 7 } else { 4 };
            if v.len() > 7 && v.len() < 10 {
                return Err(format!("line {}: {} columns", i + 1, v.len()));
            }
            out.push(GnssFix {
                t: v[0],
                pos: Geodetic {
                    lat_rad: v[1] * D2R,
                    lon_rad: v[2] * D2R,
                    alt_m: v[3],
                },
                std_ned: [v[s], v[s + 1], v[s + 2]],
            });
        }
    }
    Ok(out)
}

/// Parse a KF-GINS navigation-result or truth file (11 columns).
pub fn parse_nav(text: &str) -> Result<Vec<NavRecord>, String> {
    let mut out = Vec::new();
    for (i, line) in text.lines().enumerate() {
        if let Some(v) = numbers(line, i + 1, 11)? {
            out.push(NavRecord {
                week: v[0],
                t: v[1],
                pos: Geodetic {
                    lat_rad: v[2] * D2R,
                    lon_rad: v[3] * D2R,
                    alt_m: v[4],
                },
                vel: [v[5], v[6], v[7]],
                rpy: [v[8] * D2R, v[9] * D2R, v[10] * D2R],
            });
        }
    }
    Ok(out)
}

/// A value of the YAML subset: a scalar (kept as text) or a flow list of scalars.
#[derive(Clone, Debug, PartialEq)]
pub enum YamlValue {
    /// A scalar, unquoted.
    Scalar(String),
    /// A flow list `[a, b, c]`.
    List(Vec<String>),
}

/// Read the YAML subset of `kf-gins.yaml` into a flat map. Nested keys (one level,
/// by indentation under a key with no value) are joined with a dot, so
/// `imunoise:` / `  arw: [...]` becomes `imunoise.arw`. `#` starts a comment outside
/// quotes. Anything outside the subset (block lists, multi-line scalars, anchors) is
/// an error rather than a guess.
pub fn parse_yaml_subset(text: &str) -> Result<BTreeMap<String, YamlValue>, String> {
    let mut out = BTreeMap::new();
    let mut parent: Option<String> = None;
    for (i, raw) in text.lines().enumerate() {
        let lineno = i + 1;
        let line = strip_comment(raw);
        if line.trim().is_empty() {
            continue;
        }
        let indent = line.len() - line.trim_start().len();
        let body = line.trim();
        if body.starts_with('-') {
            return Err(format!("line {lineno}: block lists are not supported"));
        }
        let (key, val) = body
            .split_once(':')
            .ok_or_else(|| format!("line {lineno}: expected `key: value`"))?;
        let key = key.trim().to_string();
        let val = val.trim();
        let full = if indent > 0 {
            match &parent {
                Some(p) => format!("{p}.{key}"),
                None => return Err(format!("line {lineno}: indented key without a parent")),
            }
        } else {
            parent = None;
            key.clone()
        };
        if val.is_empty() {
            if indent > 0 {
                return Err(format!("line {lineno}: only one level of nesting"));
            }
            parent = Some(key);
            continue;
        }
        let value = if let Some(inner) = val.strip_prefix('[') {
            let inner = inner
                .strip_suffix(']')
                .ok_or_else(|| format!("line {lineno}: unterminated flow list"))?;
            YamlValue::List(
                inner
                    .split(',')
                    .map(|s| unquote(s.trim()))
                    .filter(|s| !s.is_empty())
                    .collect(),
            )
        } else {
            YamlValue::Scalar(unquote(val))
        };
        out.insert(full, value);
    }
    Ok(out)
}

fn strip_comment(line: &str) -> &str {
    let mut in_q: Option<char> = None;
    for (i, c) in line.char_indices() {
        match (c, in_q) {
            ('"', None) | ('\'', None) => in_q = Some(c),
            (q, Some(open)) if q == open => in_q = None,
            ('#', None) => return &line[..i],
            _ => {}
        }
    }
    line
}

fn unquote(s: &str) -> String {
    let s = s.trim();
    if s.len() >= 2
        && ((s.starts_with('"') && s.ends_with('"')) || (s.starts_with('\'') && s.ends_with('\'')))
    {
        s[1..s.len() - 1].to_string()
    } else {
        s.to_string()
    }
}

/// The KF-GINS configuration, in the units of `kf-gins.yaml`.
#[derive(Clone, Debug, PartialEq)]
pub struct KfGinsConfig {
    /// IMU file path as written in the configuration.
    pub imupath: String,
    /// GNSS file path as written in the configuration.
    pub gnsspath: String,
    /// IMU sample rate (Hz), used for the interval of the first sample.
    pub imudatarate: f64,
    /// Processing start (s of week).
    pub starttime: f64,
    /// Processing end (s of week); negative means the end of the IMU file.
    pub endtime: f64,
    /// Initial position: latitude, longitude (deg), height (m).
    pub initpos: Vec3,
    /// Initial velocity north, east, down (m/s).
    pub initvel: Vec3,
    /// Initial roll, pitch, yaw (deg).
    pub initatt: Vec3,
    /// Initial gyro bias (deg/h).
    pub initgyrbias: Vec3,
    /// Initial accelerometer bias (mGal).
    pub initaccbias: Vec3,
    /// Initial position std north, east, down (m).
    pub initposstd: Vec3,
    /// Initial velocity std north, east, down (m/s).
    pub initvelstd: Vec3,
    /// Initial roll, pitch, yaw std (deg).
    pub initattstd: Vec3,
    /// Initial gyro-bias std (deg/h); defaults to `imunoise.gbstd`.
    pub initbgstd: Vec3,
    /// Initial accelerometer-bias std (mGal); defaults to `imunoise.abstd`.
    pub initbastd: Vec3,
    /// Angle random walk (deg/sqrt(h)).
    pub arw: Vec3,
    /// Velocity random walk (m/s/sqrt(h)).
    pub vrw: Vec3,
    /// Gyro-bias Gauss-Markov std (deg/h).
    pub gbstd: Vec3,
    /// Accelerometer-bias Gauss-Markov std (mGal).
    pub abstd: Vec3,
    /// Gyro scale-factor std (ppm). Read, not used: Kshana has no scale-factor state.
    pub gsstd: Vec3,
    /// Accelerometer scale-factor std (ppm). Read, not used.
    pub asstd: Vec3,
    /// Gauss-Markov correlation time (h).
    pub corrtime_h: f64,
    /// GNSS antenna lever arm in the IMU frame, forward-right-down (m).
    pub antlever: Vec3,
}

impl KfGinsConfig {
    /// Fill the configuration from the text of a `kf-gins.yaml`.
    pub fn from_yaml(text: &str) -> Result<Self, String> {
        let m = parse_yaml_subset(text)?;
        let scalar = |k: &str| -> Result<String, String> {
            match m.get(k) {
                Some(YamlValue::Scalar(s)) => Ok(s.clone()),
                Some(YamlValue::List(_)) => Err(format!("`{k}` is a list, a scalar expected")),
                None => Err(format!("`{k}` missing")),
            }
        };
        let num = |k: &str| -> Result<f64, String> {
            scalar(k)?.parse::<f64>().map_err(|e| format!("`{k}`: {e}"))
        };
        let v3 = |k: &str| -> Result<Option<Vec3>, String> {
            match m.get(k) {
                Some(YamlValue::List(l)) if l.len() == 3 => {
                    let mut o = [0.0; 3];
                    for (j, s) in l.iter().enumerate() {
                        o[j] = s.parse::<f64>().map_err(|e| format!("`{k}`: {e}"))?;
                    }
                    Ok(Some(o))
                }
                Some(_) => Err(format!("`{k}` must be a three-element list")),
                None => Ok(None),
            }
        };
        let req = |k: &str| -> Result<Vec3, String> { v3(k)?.ok_or(format!("`{k}` missing")) };
        let gbstd = req("imunoise.gbstd")?;
        let abstd = req("imunoise.abstd")?;
        Ok(Self {
            imupath: scalar("imupath")?,
            gnsspath: scalar("gnsspath")?,
            imudatarate: num("imudatarate")?,
            starttime: num("starttime")?,
            endtime: num("endtime")?,
            initpos: req("initpos")?,
            initvel: req("initvel")?,
            initatt: req("initatt")?,
            initgyrbias: v3("initgyrbias")?.unwrap_or([0.0; 3]),
            initaccbias: v3("initaccbias")?.unwrap_or([0.0; 3]),
            initposstd: req("initposstd")?,
            initvelstd: req("initvelstd")?,
            initattstd: req("initattstd")?,
            initbgstd: v3("initbgstd")?.unwrap_or(gbstd),
            initbastd: v3("initbastd")?.unwrap_or(abstd),
            arw: req("imunoise.arw")?,
            vrw: req("imunoise.vrw")?,
            gbstd,
            abstd,
            gsstd: v3("imunoise.gsstd")?.unwrap_or([0.0; 3]),
            asstd: v3("imunoise.asstd")?.unwrap_or([0.0; 3]),
            corrtime_h: num("imunoise.corrtime")?,
            antlever: req("antlever")?,
        })
    }

    /// The Kshana EKF configured from this file: per-axis initial sigmas and the
    /// isotropic process noise (mean of squares across axes), in SI units.
    pub fn ekf(&self) -> GnssInsEkf {
        let tau = self.corrtime_h * 3600.0;
        let ms = |v: Vec3, k: f64| (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]) / 3.0 * k * k;
        let arw_k = D2R / 60.0; // deg/sqrt(h) -> rad/sqrt(s)
        let vrw_k = 1.0 / 60.0; // m/s/sqrt(h) -> m/s/sqrt(s)
        let gb_k = D2R / 3600.0; // deg/h -> rad/s
        let ab_k = 1e-5; // mGal -> m/s^2
        let noise = EkfNoise {
            vrw_psd: ms(self.vrw, vrw_k),
            arw_psd: ms(self.arw, arw_k),
            accel_bias_rw_psd: 2.0 * ms(self.abstd, ab_k) / tau,
            gyro_bias_rw_psd: 2.0 * ms(self.gbstd, gb_k) / tau,
            accel_bias_tau: tau,
            gyro_bias_tau: tau,
        };
        let mut s = [0.0; 15];
        for k in 0..3 {
            s[k] = self.initposstd[k];
            s[3 + k] = self.initvelstd[k];
            s[6 + k] = self.initattstd[k] * D2R;
            s[9 + k] = self.initbastd[k] * ab_k;
            s[12 + k] = self.initbgstd[k] * gb_k;
        }
        GnssInsEkf::with_initial_sigmas(s, noise)
    }
}

/// Body-to-NED DCM from roll, pitch, yaw (rad), ZYX order as in KF-GINS.
pub fn dcm_from_euler(rpy: Vec3) -> [[f64; 3]; 3] {
    let (sr, cr) = rpy[0].sin_cos();
    let (sp, cp) = rpy[1].sin_cos();
    let (sy, cy) = rpy[2].sin_cos();
    [
        [cp * cy, sr * sp * cy - cr * sy, cr * sp * cy + sr * sy],
        [cp * sy, sr * sp * sy + cr * cy, cr * sp * sy - sr * cy],
        [-sp, sr * cp, cr * cp],
    ]
}

/// Roll, pitch, yaw (rad, ZYX) of a body-to-NED DCM; yaw in `[0, 2π)`.
pub fn euler_from_dcm(c: [[f64; 3]; 3]) -> Vec3 {
    let pitch = (-c[2][0]).atan2((c[2][1] * c[2][1] + c[2][2] * c[2][2]).sqrt());
    let roll = c[2][1].atan2(c[2][2]);
    let yaw = c[1][0]
        .atan2(c[0][0])
        .rem_euclid(2.0 * std::f64::consts::PI);
    [roll, pitch, yaw]
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// Options of a [`run`].
#[derive(Clone, Copy, Debug)]
pub struct RunOptions {
    /// Apply the antenna lever arm in the GNSS update. `false` fuses each fix as if the
    /// antenna were at the IMU centre (an ablation, to show what the lever arm is worth).
    pub lever_arm: bool,
}

impl Default for RunOptions {
    fn default() -> Self {
        Self { lever_arm: true }
    }
}

/// The output of a [`run`].
#[derive(Clone, Debug)]
pub struct KfGinsRun {
    /// The solution at every IMU epoch from the initial epoch on (IMU centre).
    pub solution: Vec<NavRecord>,
    /// GNSS fixes fused.
    pub n_updates: usize,
    /// GNSS fixes skipped as ill-conditioned.
    pub n_skipped: usize,
}

fn record(t: f64, nav: &NavState) -> NavRecord {
    NavRecord {
        week: 0.0,
        t,
        pos: nav.p_llh,
        vel: nav.v_ned,
        rpy: euler_from_dcm(nav.q.to_dcm()),
    }
}

/// Run Kshana's closed-loop loosely coupled filter over a KF-GINS dataset.
///
/// The processing window, initial state, noise and lever arm come from `cfg`;
/// `imu` and `gnss` are the parsed files. The structure follows KF-GINS (see the
/// module documentation): the state is initialised at the first IMU epoch at or after
/// `starttime`, fixes at or before `starttime` are dropped, and a fix is fused at the
/// IMU epoch it aligns with (1 ms) or at its own time inside an IMU interval, by
/// splitting the interval's increments.
pub fn run(
    cfg: &KfGinsConfig,
    imu: &[ImuIncrement],
    gnss: &[GnssFix],
    opts: RunOptions,
) -> Result<KfGinsRun, String> {
    let endtime = if cfg.endtime < 0.0 {
        f64::INFINITY
    } else {
        cfg.endtime
    };
    let k0 = imu
        .iter()
        .position(|s| s.t >= cfg.starttime)
        .ok_or("no IMU sample at or after starttime")?;
    let q0 = Quaternion::from_dcm(dcm_from_euler([
        cfg.initatt[0] * D2R,
        cfg.initatt[1] * D2R,
        cfg.initatt[2] * D2R,
    ]));
    let p0 = Geodetic {
        lat_rad: cfg.initpos[0] * D2R,
        lon_rad: cfg.initpos[1] * D2R,
        alt_m: cfg.initpos[2],
    };
    let mut nav = ClosedLoopInsGnss::new(NavState::new(q0, cfg.initvel, p0), cfg.ekf());
    // KF-GINS starts its bias estimates at initgyrbias / initaccbias; Kshana's running
    // estimates start at zero, so a non-zero initial bias is removed from the increments.
    let bg0 = [
        cfg.initgyrbias[0] * D2R / 3600.0,
        cfg.initgyrbias[1] * D2R / 3600.0,
        cfg.initgyrbias[2] * D2R / 3600.0,
    ];
    let ba0 = [
        cfg.initaccbias[0] * 1e-5,
        cfg.initaccbias[1] * 1e-5,
        cfg.initaccbias[2] * 1e-5,
    ];
    let lever = if opts.lever_arm {
        cfg.antlever
    } else {
        [0.0; 3]
    };

    let mut gi = gnss.iter().position(|g| g.t > cfg.starttime);
    let mut solution = vec![record(imu[k0].t, &nav.nav)];
    let (mut n_updates, mut n_skipped) = (0usize, 0usize);
    let nominal_dt = 1.0 / cfg.imudatarate;
    // Previous (whole-interval) increments, for the two-sample terms.
    let mut prev: (Vec3, Vec3) = (imu[k0].dtheta, imu[k0].dvel);

    let mut fuse = |nav: &mut ClosedLoopInsGnss, g: &GnssFix| {
        if nav
            .fuse_position_lever_arm(g.pos, lever, g.std_ned)
            .is_some()
        {
            n_updates += 1;
        } else {
            n_skipped += 1;
        }
    };
    // Propagate a (possibly partial) interval: the two-sample terms use the previous
    // whole interval's increments, as KF-GINS does after its own interpolation.
    let step = |nav: &mut ClosedLoopInsGnss, prev: (Vec3, Vec3), dth: Vec3, dv: Vec3, dt: f64| {
        let con = cross(prev.0, dth);
        let s1 = cross(prev.0, dv);
        let s2 = cross(prev.1, dth);
        let th = [
            dth[0] - bg0[0] * dt + con[0] / 12.0,
            dth[1] - bg0[1] * dt + con[1] / 12.0,
            dth[2] - bg0[2] * dt + con[2] / 12.0,
        ];
        let v = [
            dv[0] - ba0[0] * dt + (s1[0] + s2[0]) / 12.0,
            dv[1] - ba0[1] * dt + (s1[1] + s2[1]) / 12.0,
            dv[2] - ba0[2] * dt + (s1[2] + s2[2]) / 12.0,
        ];
        nav.propagate_increments(th, v, dt);
    };

    for k in (k0 + 1)..imu.len() {
        let cur = imu[k];
        if cur.t > endtime {
            break;
        }
        let t_prev = imu[k - 1].t;
        let dt_raw = cur.t - t_prev;
        let dt = if dt_raw < 0.1 { dt_raw } else { nominal_dt };
        if dt <= 0.0 {
            return Err(format!("IMU time not increasing at {}", cur.t));
        }
        // Drop fixes that fell behind (more than the tolerance before this interval).
        while let Some(j) = gi {
            if gnss[j].t < t_prev - TIME_ALIGN_ERR {
                gi = (j + 1 < gnss.len()).then_some(j + 1);
            } else {
                break;
            }
        }
        let fix = gi.map(|j| gnss[j]);
        let mut fused = false;
        // KF-GINS keeps the (reduced) second part of a split interval as the previous
        // increment of the next interval.
        let mut next_prev = (cur.dtheta, cur.dvel);
        match fix {
            Some(g) if (t_prev - g.t).abs() < TIME_ALIGN_ERR => {
                fuse(&mut nav, &g);
                fused = true;
                step(&mut nav, prev, cur.dtheta, cur.dvel, dt);
            }
            Some(g) if (cur.t - g.t).abs() <= TIME_ALIGN_ERR => {
                step(&mut nav, prev, cur.dtheta, cur.dvel, dt);
                fuse(&mut nav, &g);
                fused = true;
            }
            Some(g) if t_prev < g.t && g.t < cur.t => {
                let lam = (g.t - t_prev) / dt_raw;
                let th1 = [
                    cur.dtheta[0] * lam,
                    cur.dtheta[1] * lam,
                    cur.dtheta[2] * lam,
                ];
                let v1 = [cur.dvel[0] * lam, cur.dvel[1] * lam, cur.dvel[2] * lam];
                let dt1 = g.t - t_prev;
                step(&mut nav, prev, th1, v1, dt1);
                fuse(&mut nav, &g);
                fused = true;
                let th2 = [
                    cur.dtheta[0] - th1[0],
                    cur.dtheta[1] - th1[1],
                    cur.dtheta[2] - th1[2],
                ];
                let v2 = [
                    cur.dvel[0] - v1[0],
                    cur.dvel[1] - v1[1],
                    cur.dvel[2] - v1[2],
                ];
                step(&mut nav, (th1, v1), th2, v2, dt - dt1);
                next_prev = (th2, v2);
            }
            _ => step(&mut nav, prev, cur.dtheta, cur.dvel, dt),
        }
        if fused {
            let j = gi.expect("a fused fix has an index");
            gi = (j + 1 < gnss.len()).then_some(j + 1);
        }
        prev = next_prev;
        solution.push(record(cur.t, &nav.nav));
    }
    Ok(KfGinsRun {
        solution,
        n_updates,
        n_skipped,
    })
}

/// Position-error statistics of a solution against a reference trajectory.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PositionScore {
    /// Reference epochs scored.
    pub n: usize,
    /// RMS of north error (m).
    pub north_rms: f64,
    /// RMS of east error (m).
    pub east_rms: f64,
    /// RMS of down error (m) — the vertical RMS.
    pub down_rms: f64,
    /// `sqrt(mean(N² + E²))` (m).
    pub horizontal_rms: f64,
    /// Largest `sqrt(N² + E²)` (m).
    pub horizontal_max: f64,
    /// Largest `|D|` (m).
    pub vertical_max: f64,
    /// RMS of the yaw error, wrapped to `(-π, π]` (rad).
    pub yaw_rms: f64,
}

/// Score `sol` against `reference` at every reference epoch accepted by `keep` that
/// lies strictly inside the solution's time span. The solution is linearly
/// interpolated in time (yaw on the shortest arc); the north/east/down error uses the
/// WGS-84 radii at the reference point. Returns `None` when no epoch is scored.
pub fn score(
    sol: &[NavRecord],
    reference: &[NavRecord],
    keep: impl Fn(&NavRecord) -> bool,
) -> Option<PositionScore> {
    if sol.len() < 2 {
        return None;
    }
    let (t0, t1) = (sol[0].t, sol[sol.len() - 1].t);
    let mut i = 0usize;
    let (mut sn, mut se, mut sd, mut sy) = (0.0, 0.0, 0.0, 0.0);
    let (mut hmax, mut vmax) = (0.0f64, 0.0f64);
    let mut n = 0usize;
    let two_pi = 2.0 * std::f64::consts::PI;
    let wrap = |a: f64| {
        let w = a.rem_euclid(two_pi);
        if w > std::f64::consts::PI {
            w - two_pi
        } else {
            w
        }
    };
    for r in reference {
        if r.t <= t0 || r.t >= t1 || !keep(r) {
            continue;
        }
        while i + 1 < sol.len() && sol[i + 1].t < r.t {
            i += 1;
        }
        if i + 1 >= sol.len() || sol[i].t > r.t {
            continue;
        }
        let (a, b) = (&sol[i], &sol[i + 1]);
        let w = (r.t - a.t) / (b.t - a.t);
        let lat = a.pos.lat_rad + w * (b.pos.lat_rad - a.pos.lat_rad);
        let lon = a.pos.lon_rad + w * (b.pos.lon_rad - a.pos.lon_rad);
        let h = a.pos.alt_m + w * (b.pos.alt_m - a.pos.alt_m);
        let yaw = a.rpy[2] + w * wrap(b.rpy[2] - a.rpy[2]);
        let (rn, re) = radii_of_curvature(r.pos.lat_rad);
        let dn = (lat - r.pos.lat_rad) * (rn + r.pos.alt_m);
        let de = (lon - r.pos.lon_rad) * (re + r.pos.alt_m) * r.pos.lat_rad.cos();
        let dd = -(h - r.pos.alt_m);
        let dy = wrap(yaw - r.rpy[2]);
        sn += dn * dn;
        se += de * de;
        sd += dd * dd;
        sy += dy * dy;
        hmax = hmax.max((dn * dn + de * de).sqrt());
        vmax = vmax.max(dd.abs());
        n += 1;
    }
    if n == 0 {
        return None;
    }
    let m = n as f64;
    Some(PositionScore {
        n,
        north_rms: (sn / m).sqrt(),
        east_rms: (se / m).sqrt(),
        down_rms: (sd / m).sqrt(),
        horizontal_rms: ((sn + se) / m).sqrt(),
        horizontal_max: hmax,
        vertical_max: vmax,
        yaw_rms: (sy / m).sqrt(),
    })
}

/// The reference epochs the pre-registered metric scores: whole GNSS seconds (the truth
/// file's exact rows; its other rows carry IMU times rounded to 1 ms), first row of
/// each second only.
pub fn whole_second_epochs(reference: &[NavRecord]) -> Vec<NavRecord> {
    let mut out: Vec<NavRecord> = Vec::new();
    for r in reference {
        if (r.t - r.t.round()).abs() < 1e-6 && out.last().is_none_or(|l| l.t.round() != r.t.round())
        {
            out.push(*r);
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn imu_rows_parse_and_extra_columns_are_ignored() {
        let t =
            "# header\n100.005 1e-6 -2e-6 3e-6 0.01 -0.02 -0.049\n\n100.010 0 0 0 0 0 -0.05 7.5\n";
        let v = parse_imu(t).unwrap();
        assert_eq!(v.len(), 2);
        assert_eq!(v[0].t, 100.005);
        assert_eq!(v[0].dtheta, [1e-6, -2e-6, 3e-6]);
        assert_eq!(v[0].dvel, [0.01, -0.02, -0.049]);
        assert_eq!(v[1].dvel[2], -0.05);
        assert!(parse_imu("1 2 3\n").is_err());
        assert!(parse_imu("1 2 3 4 5 6 x\n").is_err());
    }

    #[test]
    fn gnss_rows_parse_in_both_widths() {
        let t = "200.000 30.5 114.25 21.0 0.010 0.020 0.030\n";
        let v = parse_gnss(t).unwrap();
        assert!((v[0].pos.lat_rad - 30.5 * D2R).abs() < 1e-15);
        assert!((v[0].pos.lon_rad - 114.25 * D2R).abs() < 1e-15);
        assert_eq!(v[0].pos.alt_m, 21.0);
        assert_eq!(v[0].std_ned, [0.010, 0.020, 0.030]);
        let t13 = "200 30 114 21 1.0 2.0 3.0 0.1 0.2 0.3 0.4 0.5 0.6\n";
        let w = parse_gnss(t13).unwrap();
        assert_eq!(w[0].std_ned, [0.1, 0.2, 0.3]);
        assert!(parse_gnss("200 30 114 21 1 2 3 4\n").is_err());
    }

    #[test]
    fn nav_rows_parse() {
        let t = " 2017 456250.000  30.1  114.2  20.9  0.5 -0.25 0.125  1.0 -2.0 185.5 \n";
        let v = parse_nav(t).unwrap();
        assert_eq!(v[0].week, 2017.0);
        assert_eq!(v[0].t, 456250.0);
        assert_eq!(v[0].vel, [0.5, -0.25, 0.125]);
        assert!((v[0].rpy[2] - 185.5 * D2R).abs() < 1e-15);
    }

    const YAML: &str = r#"# comment
imupath: "./d/imu.txt"   # trailing
gnsspath: './d/gnss.txt'
imudatarate: 200
starttime: 1000
endtime: -1
initpos: [ 30.0, 114.0, 20.0 ]
initvel: [ 0.0, 0.0, 0.0 ]
initatt: [ 1.0, -2.0, 185.0 ]
initgyrbias: [ 0, 0, 0 ]
initposstd: [ 0.005, 0.004, 0.008 ]
initvelstd: [ 0.003, 0.004, 0.004 ]
initattstd: [ 0.003, 0.003, 0.023 ]
#initbgstd: [ 1, 1, 1 ]
imunoise:
  arw: [0.003, 0.003, 0.003]          # [deg/sqrt(hr)]
  vrw: [0.03, 0.03, 0.03]
  gbstd: [0.027, 0.027, 0.027]
  abstd: [15.0, 15.0, 15.0]
  gsstd: [300.0, 300.0, 300.0]
  asstd: [300.0, 300.0, 300.0]
  corrtime: 4.0
antlever:  [ 0.136, -0.301, -0.184 ]
"#;

    #[test]
    fn yaml_subset_reads_the_config_shape() {
        let m = parse_yaml_subset(YAML).unwrap();
        assert_eq!(m["imupath"], YamlValue::Scalar("./d/imu.txt".into()));
        assert_eq!(m["gnsspath"], YamlValue::Scalar("./d/gnss.txt".into()));
        assert_eq!(m["imunoise.corrtime"], YamlValue::Scalar("4.0".into()));
        assert!(!m.contains_key("initbgstd"));
        let c = KfGinsConfig::from_yaml(YAML).unwrap();
        assert_eq!(c.starttime, 1000.0);
        assert_eq!(c.endtime, -1.0);
        assert_eq!(c.antlever, [0.136, -0.301, -0.184]);
        assert_eq!(c.initbgstd, [0.027; 3]); // defaulted from gbstd
        assert_eq!(c.initaccbias, [0.0; 3]); // absent -> zero
        assert_eq!(c.initattstd, [0.003, 0.003, 0.023]);
        assert!(parse_yaml_subset("a:\n  - x\n").is_err());
        assert!(parse_yaml_subset("a: [1, 2\n").is_err());
        assert!(KfGinsConfig::from_yaml("imupath: x\n").is_err());
    }

    #[test]
    fn euler_dcm_round_trip() {
        let rpy = [0.0149, -0.0355, 3.2410];
        let back = euler_from_dcm(dcm_from_euler(rpy));
        for k in 0..3 {
            assert!((back[k] - rpy[k]).abs() < 1e-12);
        }
    }

    #[test]
    fn whole_second_epochs_dedupe() {
        let mk = |t: f64| NavRecord {
            week: 0.0,
            t,
            pos: Geodetic {
                lat_rad: 0.5,
                lon_rad: 2.0,
                alt_m: 0.0,
            },
            vel: [0.0; 3],
            rpy: [0.0; 3],
        };
        let r = vec![mk(10.0), mk(10.0), mk(10.004), mk(10.999), mk(11.0)];
        let w = whole_second_epochs(&r);
        assert_eq!(w.iter().map(|x| x.t).collect::<Vec<_>>(), vec![10.0, 11.0]);
    }
}
