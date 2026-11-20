// SPDX-License-Identifier: AGPL-3.0-only
//! Behavioural cases for autopilot and ROS estimators.
//!
//! Each case states an expected behaviour that a public issue reports broken, and checks a
//! **trace** of the estimator's inputs and outputs against it. The cases are behavioural checks
//! only: no estimator or fusion algorithm is shipped here; the user runs their own estimator
//! (SITL, replay, bench) and exports the named channels.
//!
//! A trace is JSON Lines, one object per sample with `t` (seconds) and numeric channels; `null`
//! reads as not-a-number. Default channel names are given per case and can be renamed with the
//! `channels` object of the case parameters (`--params '{"channels": {"yaw_est": "XKF1.Yaw"}}'`).
//!
//! | case | cites | expected behaviour |
//! |---|---|---|
//! | `driver-output` | ArduPilot issues 34150, 35085 | a GNSS driver's output is well formed: time increases, values finite, latitude and longitude in range and not (0, 0) with a fix, fix type 0-8, positive accuracy with a fix |
//! | `receiver-selection` | PX4 issues 28813, 28894 | the selected receiver is healthy whenever another is (after `dwell_s`), and the selection does not flap |
//! | `gnss-heading` | PX4 issue 28893; ArduPilot forum thread on EKF3 yaw realignment with NO_FIX | estimator yaw follows a valid GNSS heading within `tol_deg`, and does not step while the receiver has no fix |
//! | `estimator-init` | ArduPilot issue 34894 | the estimator declares its position valid only after the GNSS gate (fix ≥ 3, eph ≤ `req_eph_m`, sats ≥ `req_sats`) has held for `req_time_s` (PX4 `GNSS_REQ_TIME` default 10 s), and starts within `k_eph`·eph of GNSS |
//! | `source-switch` | ArduPilot forum thread on ExtNav and GPS switching position jump | a change of position source moves the estimate by no more than `pos_step_tol_m` beyond the motion its velocity explains |
//! | `utm-zone` | robot_localization issues 951, 904 | UTM coordinates agree with a reference transverse Mercator (Krüger series, WGS 84) to `tol_m`, and a zone change does not jump the odometry |
//! | `replay-determinism` | robot_localization issue 957 | a replay of the same input reproduces each channel `x` as `x_replay` to `tol` |
//! | `nan-guard` | robot_localization issue 982 | no estimator channel becomes non-finite once it has been finite |

use serde_json::{json, Map, Value};

/// One trace: sample times and named channels of the same length.
#[derive(Clone, Debug, Default)]
pub struct Trace {
    /// Sample times, seconds.
    pub t: Vec<f64>,
    /// Channels by name; a sample without the channel is NaN.
    pub ch: std::collections::BTreeMap<String, Vec<f64>>,
}

impl Trace {
    /// Read JSON Lines (see the module notes).
    pub fn from_jsonl(text: &str) -> Result<Trace, String> {
        let mut rows: Vec<Map<String, Value>> = Vec::new();
        for line in text.lines().map(str::trim).filter(|l| !l.is_empty()) {
            match serde_json::from_str::<Value>(line) {
                Ok(Value::Object(m)) if m.get("t").and_then(Value::as_f64).is_some() => {
                    rows.push(m)
                }
                _ => {
                    return Err(crate::terr!(
                        "e-drone-trace-bad-line",
                        line = line.chars().take(80).collect::<String>()
                    ))
                }
            }
        }
        let mut tr = Trace::default();
        for (k, r) in rows.iter().enumerate() {
            tr.t.push(r["t"].as_f64().unwrap_or(f64::NAN));
            for (name, v) in r {
                if name == "t" {
                    continue;
                }
                let col = tr
                    .ch
                    .entry(name.clone())
                    .or_insert_with(|| vec![f64::NAN; k]);
                col.resize(k, f64::NAN);
                col.push(v.as_f64().unwrap_or(f64::NAN));
            }
        }
        let n = tr.t.len();
        for c in tr.ch.values_mut() {
            c.resize(n, f64::NAN);
        }
        Ok(tr)
    }

    fn add(&mut self, name: &str, v: Vec<f64>) {
        self.ch.insert(name.to_string(), v);
    }
}

/// The cases, with the public issue each cites.
pub const CASES: &[(&str, &[&str])] = &[
    (
        "driver-output",
        &[
            "https://github.com/ArduPilot/ardupilot/issues/34150",
            "https://github.com/ArduPilot/ardupilot/issues/35085",
        ],
    ),
    (
        "receiver-selection",
        &[
            "https://github.com/PX4/PX4-Autopilot/issues/28813",
            "https://github.com/PX4/PX4-Autopilot/issues/28894",
        ],
    ),
    (
        "gnss-heading",
        &[
            "https://github.com/PX4/PX4-Autopilot/issues/28893",
            "https://discuss.ardupilot.org/t/ekf3-doing-yaw-realignment-to-gps-velocity-with-gps-in-no-fix-status/128863",
        ],
    ),
    (
        "estimator-init",
        &["https://github.com/ArduPilot/ardupilot/issues/34894"],
    ),
    (
        "source-switch",
        &["https://discuss.ardupilot.org/t/ekf3-running-extnav-and-gps-leads-to-position-jump-if-gps-is-enabled-again/143535"],
    ),
    (
        "utm-zone",
        &[
            "https://github.com/cra-ros-pkg/robot_localization/issues/951",
            "https://github.com/cra-ros-pkg/robot_localization/issues/904",
        ],
    ),
    (
        "replay-determinism",
        &["https://github.com/cra-ros-pkg/robot_localization/issues/957"],
    ),
    (
        "nan-guard",
        &["https://github.com/cra-ros-pkg/robot_localization/issues/982"],
    ),
];

struct Ctx<'a> {
    tr: &'a Trace,
    p: &'a Value,
}

impl Ctx<'_> {
    fn num(&self, k: &str, d: f64) -> f64 {
        self.p.get(k).and_then(Value::as_f64).unwrap_or(d)
    }
    fn name(&self, k: &str) -> String {
        self.p
            .get("channels")
            .and_then(|c| c.get(k))
            .and_then(Value::as_str)
            .unwrap_or(k)
            .to_string()
    }
    fn ch(&self, k: &str) -> Result<&Vec<f64>, String> {
        let n = self.name(k);
        self.tr
            .ch
            .get(&n)
            .ok_or_else(|| crate::terr!("e-drone-trace-missing-channel", channel = n))
    }
    fn opt(&self, k: &str) -> Option<&Vec<f64>> {
        self.tr.ch.get(&self.name(k))
    }
}

fn wrap180(d: f64) -> f64 {
    (d + 180.0).rem_euclid(360.0) - 180.0
}

/// Run one case on a trace. Returns the case report (`verdict` `PASS` or `FAIL`, the measured
/// values, the issues cited).
pub fn run_case(case: &str, tr: &Trace, params: &Value) -> Result<Value, String> {
    let cites = CASES
        .iter()
        .find(|(c, _)| *c == case)
        .map(|(_, r)| *r)
        .ok_or_else(|| crate::terr!("e-drone-unknown-case", case = case))?;
    let c = Ctx { tr, p: params };
    let (pass, detail) = match case {
        "driver-output" => driver_output(&c)?,
        "receiver-selection" => receiver_selection(&c)?,
        "gnss-heading" => gnss_heading(&c)?,
        "estimator-init" => estimator_init(&c)?,
        "source-switch" => source_switch(&c)?,
        "utm-zone" => utm_zone(&c)?,
        "replay-determinism" => replay(&c)?,
        _ => nan_guard(&c)?,
    };
    Ok(json!({
        "case": case,
        "cites": cites,
        "samples": tr.t.len(),
        "verdict": if pass { "PASS" } else { "FAIL" },
        "detail": detail,
        "evidence": super::EVIDENCE,
    }))
}

fn driver_output(c: &Ctx) -> Result<(bool, Value), String> {
    let (lat, lon, fix) = (c.ch("lat")?, c.ch("lon")?, c.ch("fix")?);
    let eph = c.opt("eph");
    let t = &c.tr.t;
    let back = t
        .windows(2)
        .filter(|w| w[1].partial_cmp(&w[0]) != Some(std::cmp::Ordering::Greater))
        .count();
    let (mut range, mut null_island, mut bad_fix, mut bad_acc) = (0, 0, 0, 0);
    for k in 0..t.len() {
        let f = fix[k];
        if !(f.is_finite() && (0.0..=8.0).contains(&f) && f.fract() == 0.0) {
            bad_fix += 1;
            continue;
        }
        if f < 2.0 {
            continue;
        }
        if !(lat[k].is_finite() && lon[k].is_finite())
            || lat[k].abs() > 90.0
            || lon[k].abs() > 180.0
        {
            range += 1;
        } else if lat[k] == 0.0 && lon[k] == 0.0 {
            null_island += 1;
        }
        if eph.is_some_and(|e| !(e[k].is_finite() && e[k] > 0.0)) {
            bad_acc += 1;
        }
    }
    let pass = back + range + null_island + bad_fix + bad_acc == 0;
    Ok((
        pass,
        json!({"time_not_increasing": back, "position_out_of_range": range, "zero_position_with_fix": null_island,
               "fix_type_invalid": bad_fix, "accuracy_not_positive_with_fix": bad_acc}),
    ))
}

fn receiver_selection(c: &Ctx) -> Result<(bool, Value), String> {
    let sel = c.ch("sel")?;
    let n_rx = c.num("receivers", 2.0).clamp(1.0, 8.0) as usize;
    let req_eph = c.num("req_eph_m", 5.0);
    let dwell = c.num("dwell_s", 2.0);
    let max_rate = c.num("max_switches_per_min", 6.0);
    let mut healthy: Vec<Vec<bool>> = Vec::new();
    for i in 0..n_rx {
        let fix = c.ch(&format!("fix{i}"))?;
        let eph = c.opt(&format!("eph{i}"));
        let spoof = c.opt(&format!("spoof{i}"));
        healthy.push(
            (0..c.tr.t.len())
                .map(|k| {
                    fix[k] >= 3.0
                        && eph.is_none_or(|e| e[k] <= req_eph)
                        && spoof.is_none_or(|s| s[k].is_nan() || s[k] < 2.0)
                })
                .collect(),
        );
    }
    let t = &c.tr.t;
    let (mut bad_since, mut worst): (Option<f64>, f64) = (None, 0.0);
    let mut switches = 0;
    for k in 0..t.len() {
        let s = sel[k];
        let idx = (s.is_finite() && s >= 0.0).then_some(s as usize);
        let sel_ok = idx.is_some_and(|i| healthy.get(i).is_some_and(|h| h[k]));
        let other_ok = (0..n_rx).any(|i| Some(i) != idx && healthy[i][k]);
        if !sel_ok && other_ok {
            let since = *bad_since.get_or_insert(t[k]);
            worst = worst.max(t[k] - since);
        } else {
            bad_since = None;
        }
        if k > 0 && sel[k] != sel[k - 1] {
            switches += 1;
        }
    }
    let minutes = ((t.last().unwrap_or(&0.0) - t.first().unwrap_or(&0.0)) / 60.0).max(1.0 / 60.0);
    let rate = f64::from(switches) / minutes.max(1.0);
    let pass = worst <= dwell && rate <= max_rate;
    Ok((
        pass,
        json!({"longest_on_unhealthy_s": worst, "dwell_s": dwell, "switches": switches,
               "switches_per_min": rate, "max_switches_per_min": max_rate}),
    ))
}

fn gnss_heading(c: &Ctx) -> Result<(bool, Value), String> {
    let (est, gy, fix) = (c.ch("yaw_est")?, c.ch("yaw_gnss")?, c.ch("fix")?);
    let tol = c.num("tol_deg", 10.0);
    let conv = c.num("converge_s", 5.0);
    let step_tol = c.num("step_tol_deg", 15.0);
    let t = &c.tr.t;
    let mut valid_since: Option<f64> = None;
    let (mut worst_err, mut worst_step): (f64, f64) = (0.0, 0.0);
    for k in 0..t.len() {
        if gy[k].is_finite() && fix[k] >= 3.0 {
            let since = *valid_since.get_or_insert(t[k]);
            if t[k] - since >= conv {
                worst_err = worst_err.max(wrap180(est[k] - gy[k]).abs());
            }
        } else {
            valid_since = None;
        }
        if k > 0 && fix[k] < 3.0 && fix[k - 1] < 3.0 {
            worst_step = worst_step.max(wrap180(est[k] - est[k - 1]).abs());
        }
    }
    let pass = worst_err <= tol && worst_step <= step_tol;
    Ok((
        pass,
        json!({"max_heading_error_deg": worst_err, "tol_deg": tol,
               "max_yaw_step_without_fix_deg": worst_step, "step_tol_deg": step_tol}),
    ))
}

fn estimator_init(c: &Ctx) -> Result<(bool, Value), String> {
    let (valid, fix, eph, sats) = (
        c.ch("est_valid")?,
        c.ch("fix")?,
        c.ch("eph")?,
        c.ch("sats")?,
    );
    let req_eph = c.num("req_eph_m", 3.0);
    let req_sats = c.num("req_sats", 6.0);
    let req_time = c.num("req_time_s", 10.0);
    let k_eph = c.num("k_eph", 3.0);
    let t = &c.tr.t;
    let mut gate_since: Option<f64> = None;
    let mut gate_ready_at: Option<f64> = None;
    let mut init: Option<usize> = None;
    for k in 0..t.len() {
        if fix[k] >= 3.0 && eph[k] <= req_eph && sats[k] >= req_sats {
            let s = *gate_since.get_or_insert(t[k]);
            if gate_ready_at.is_none() && t[k] - s >= req_time {
                gate_ready_at = Some(t[k]);
            }
        } else {
            gate_since = None;
        }
        if init.is_none() && valid[k] >= 1.0 {
            init = Some(k);
        }
    }
    let early = match (init, gate_ready_at) {
        (Some(k), Some(g)) => t[k] < g,
        (Some(_), None) => true,
        _ => false,
    };
    let offset = init.and_then(|k| {
        let (en, ee, gn, ge) = (
            c.opt("est_n")?,
            c.opt("est_e")?,
            c.opt("gnss_n")?,
            c.opt("gnss_e")?,
        );
        Some(((en[k] - gn[k]).powi(2) + (ee[k] - ge[k]).powi(2)).sqrt())
    });
    let lim = init.map(|k| k_eph * eph[k].max(0.1));
    let far = matches!((offset, lim), (Some(o), Some(l)) if o > l);
    Ok((
        !early && !far,
        json!({"init_t": init.map(|k| t[k]), "gnss_gate_ready_t": gate_ready_at, "initialised_early": early,
               "init_offset_m": offset, "init_offset_limit_m": lim}),
    ))
}

fn source_switch(c: &Ctx) -> Result<(bool, Value), String> {
    let (src, n, e) = (c.ch("src")?, c.ch("est_n")?, c.ch("est_e")?);
    let (vn, ve) = (c.opt("est_vn"), c.opt("est_ve"));
    let tol = c.num("pos_step_tol_m", 2.0);
    let settle = c.num("settle_s", 1.0);
    let t = &c.tr.t;
    let mut worst: f64 = 0.0;
    let mut events = 0;
    for k in 1..t.len() {
        if src[k] == src[k - 1] {
            continue;
        }
        events += 1;
        let mut j = k;
        while j < t.len() && t[j] - t[k] <= settle {
            let dt = t[j] - t[j - 1];
            let (pn, pe) = match (vn, ve) {
                (Some(a), Some(b)) => (a[j - 1] * dt, b[j - 1] * dt),
                _ => (0.0, 0.0),
            };
            let step = ((n[j] - n[j - 1] - pn).powi(2) + (e[j] - e[j - 1] - pe).powi(2)).sqrt();
            worst = worst.max(step);
            j += 1;
        }
    }
    Ok((
        worst <= tol,
        json!({"switch_events": events, "max_unexplained_step_m": worst, "pos_step_tol_m": tol}),
    ))
}

/// WGS 84 transverse Mercator (UTM) forward projection, Krüger series to n⁴ (Karney 2011, eq. 35):
/// (zone, easting m, northing m) for a latitude and longitude in degrees, with the zone given or,
/// when `None`, the standard 6-degree zone of the longitude (Norway and Svalbard exceptions not
/// applied). Southern hemisphere northings carry the 10 000 km false northing.
pub fn utm_forward(lat_deg: f64, lon_deg: f64, zone: Option<u8>) -> (u8, f64, f64) {
    let zone =
        zone.unwrap_or_else(|| (((lon_deg + 180.0) / 6.0).floor() as i32).clamp(0, 59) as u8 + 1);
    let lon0 = f64::from(zone) * 6.0 - 183.0;
    let a: f64 = 6_378_137.0;
    let f: f64 = 1.0 / 298.257_223_563;
    let n = f / (2.0 - f);
    let k0 = 0.9996;
    let big_a = a / (1.0 + n) * (1.0 + n * n / 4.0 + n.powi(4) / 64.0);
    let alpha = [
        n / 2.0 - 2.0 * n * n / 3.0 + 5.0 * n.powi(3) / 16.0 + 41.0 * n.powi(4) / 180.0,
        13.0 * n * n / 48.0 - 3.0 * n.powi(3) / 5.0 + 557.0 * n.powi(4) / 1440.0,
        61.0 * n.powi(3) / 240.0 - 103.0 * n.powi(4) / 140.0,
        49561.0 * n.powi(4) / 161280.0,
    ];
    let e = (f * (2.0 - f)).sqrt();
    let phi = lat_deg.to_radians();
    let lam = wrap180(lon_deg - lon0).to_radians();
    let tau = phi.tan();
    let sigma = (e * (e * tau / (1.0 + tau * tau).sqrt()).atanh()).sinh();
    let tau_p = tau * (1.0 + sigma * sigma).sqrt() - sigma * (1.0 + tau * tau).sqrt();
    let xi_p = tau_p.atan2(lam.cos());
    let eta_p = (lam.sin() / (tau_p * tau_p + lam.cos().powi(2)).sqrt()).asinh();
    let (mut xi, mut eta) = (xi_p, eta_p);
    for (j, al) in alpha.iter().enumerate() {
        let m = 2.0 * (j as f64 + 1.0);
        xi += al * (m * xi_p).sin() * (m * eta_p).cosh();
        eta += al * (m * xi_p).cos() * (m * eta_p).sinh();
    }
    let east = 500_000.0 + k0 * big_a * eta;
    let mut north = k0 * big_a * xi;
    if lat_deg < 0.0 {
        north += 10_000_000.0;
    }
    (zone, east, north)
}

fn utm_zone(c: &Ctx) -> Result<(bool, Value), String> {
    let (lat, lon, e, n) = (c.ch("lat")?, c.ch("lon")?, c.ch("utm_e")?, c.ch("utm_n")?);
    let zone = c.opt("utm_zone");
    let tol = c.num("tol_m", 0.05);
    let jump_tol = c.num("odom_jump_m", 100.0);
    let mut worst: f64 = 0.0;
    let mut jumps = 0;
    for k in 0..c.tr.t.len() {
        let z = zone
            .map(|z| z[k])
            .filter(|z| z.is_finite() && (1.0..=60.0).contains(z));
        let (_, re, rn) = utm_forward(lat[k], lon[k], z.map(|z| z as u8));
        worst = worst.max(((re - e[k]).powi(2) + (rn - n[k]).powi(2)).sqrt());
        if k > 0 && ((e[k] - e[k - 1]).powi(2) + (n[k] - n[k - 1]).powi(2)).sqrt() > jump_tol {
            jumps += 1;
        }
    }
    Ok((
        worst <= tol && jumps == 0,
        json!({"max_utm_error_m": worst, "tol_m": tol, "odometry_jumps": jumps, "odom_jump_m": jump_tol}),
    ))
}

fn replay(c: &Ctx) -> Result<(bool, Value), String> {
    let tol = c.num("tol", 1e-6);
    let mut worst: f64 = 0.0;
    let mut pairs = 0;
    for (name, a) in &c.tr.ch {
        if let Some(b) = c.tr.ch.get(&format!("{name}_replay")) {
            pairs += 1;
            for (x, y) in a.iter().zip(b) {
                let d = if x.is_nan() && y.is_nan() {
                    0.0
                } else {
                    (x - y).abs()
                };
                worst = worst.max(if d.is_nan() { f64::INFINITY } else { d });
            }
        }
    }
    if pairs == 0 {
        return Err(crate::terr!(
            "e-drone-trace-missing-channel",
            channel = "*_replay"
        ));
    }
    Ok((
        worst <= tol,
        json!({"channel_pairs": pairs, "max_difference": if worst.is_finite() { json!(worst) } else { Value::Null }, "tol": tol}),
    ))
}

fn nan_guard(c: &Ctx) -> Result<(bool, Value), String> {
    let prefix =
        c.p.get("prefix")
            .and_then(Value::as_str)
            .unwrap_or("est_")
            .to_string();
    let mut bad = Map::new();
    for (name, v) in c.tr.ch.iter().filter(|(n, _)| n.starts_with(&prefix)) {
        if let Some(first) = v.iter().position(|x| x.is_finite()) {
            let n = v[first..].iter().filter(|x| !x.is_finite()).count();
            if n > 0 {
                bad.insert(name.clone(), json!(n));
            }
        }
    }
    Ok((bad.is_empty(), json!({"non_finite_after_finite": bad})))
}

// ---------------------------------------------------------------------------------------------
// Reference traces
// ---------------------------------------------------------------------------------------------

fn seq(n: usize, dt: f64) -> Vec<f64> {
    (0..n).map(|k| k as f64 * dt).collect()
}

/// An expected (`good = true`) or faulty reference trace for a case, and its parameters.
/// The faulty trace reproduces the behaviour the cited issue reports, in synthetic form.
pub fn reference_trace(case: &str, good: bool) -> (Trace, Value) {
    let mut tr = Trace::default();
    let n = 200;
    tr.t = seq(n, 0.1);
    let mut params = json!({});
    match case {
        "driver-output" => {
            let mut lat = vec![47.4; n];
            let lon = vec![8.5; n];
            let fix = vec![3.0; n];
            if !good {
                lat[50] = 0.0;
                tr.t[120] = tr.t[119];
            }
            tr.add("lat", lat);
            tr.add(
                "lon",
                if good {
                    lon
                } else {
                    lon.iter()
                        .enumerate()
                        .map(|(k, v)| if k == 50 { 0.0 } else { *v })
                        .collect()
                },
            );
            tr.add("fix", fix);
            tr.add("eph", vec![1.2; n]);
        }
        "receiver-selection" => {
            let spoof0: Vec<f64> = (0..n).map(|k| if k >= 80 { 3.0 } else { 1.0 }).collect();
            let sel: Vec<f64> = (0..n)
                .map(|k| if good && k >= 90 { 1.0 } else { 0.0 })
                .collect();
            tr.add("sel", sel);
            for i in 0..2 {
                tr.add(&format!("fix{i}"), vec![3.0; n]);
                tr.add(&format!("eph{i}"), vec![1.5; n]);
            }
            tr.add("spoof0", spoof0);
            tr.add("spoof1", vec![1.0; n]);
        }
        "gnss-heading" => {
            let fix: Vec<f64> = (0..n)
                .map(|k| if (100..150).contains(&k) { 1.0 } else { 3.0 })
                .collect();
            let gy: Vec<f64> = (0..n)
                .map(|k| if fix[k] >= 3.0 { 90.0 } else { f64::NAN })
                .collect();
            let est: Vec<f64> = (0..n)
                .map(|k| {
                    if !good && (120..150).contains(&k) {
                        150.0
                    } else {
                        91.0
                    }
                })
                .collect();
            tr.add("fix", fix);
            tr.add("yaw_gnss", gy);
            tr.add("yaw_est", est);
        }
        "estimator-init" => {
            tr.t = seq(n, 0.2);
            let eph: Vec<f64> = (0..n).map(|k| if k < 50 { 8.0 } else { 1.5 }).collect();
            let valid_at = if good { 110 } else { 60 };
            tr.add(
                "est_valid",
                (0..n)
                    .map(|k| if k >= valid_at { 1.0 } else { 0.0 })
                    .collect(),
            );
            tr.add("fix", vec![3.0; n]);
            tr.add("eph", eph);
            tr.add("sats", vec![12.0; n]);
        }
        "source-switch" => {
            let src: Vec<f64> = (0..n).map(|k| if k >= 100 { 1.0 } else { 0.0 }).collect();
            let est_n: Vec<f64> = (0..n)
                .map(|k| k as f64 * 0.1 + if !good && k >= 100 { 6.0 } else { 0.0 })
                .collect();
            tr.add("src", src);
            tr.add("est_n", est_n);
            tr.add("est_e", vec![0.0; n]);
            tr.add("est_vn", vec![1.0; n]);
            tr.add("est_ve", vec![0.0; n]);
        }
        "utm-zone" => {
            // A track crossing the 12° E zone boundary (zones 32/33) at 48° N.
            let (mut lat, mut lon, mut e, mut nn, mut z) = (vec![], vec![], vec![], vec![], vec![]);
            for k in 0..n {
                let la = 48.0;
                let lo = 11.999 + k as f64 * 1e-5;
                let zone = if good { Some(32) } else { None };
                let (zz, ee, no) = utm_forward(la, lo, zone);
                lat.push(la);
                lon.push(lo);
                e.push(ee);
                nn.push(no);
                z.push(f64::from(zz));
            }
            tr.add("lat", lat);
            tr.add("lon", lon);
            tr.add("utm_e", e);
            tr.add("utm_n", nn);
            tr.add("utm_zone", z);
        }
        "replay-determinism" => {
            let x: Vec<f64> = (0..n).map(|k| (k as f64 * 0.01).sin()).collect();
            let xr: Vec<f64> = x
                .iter()
                .map(|v| {
                    if good {
                        *v
                    } else {
                        f64::from(*v as f32) + 1e-4
                    }
                })
                .collect();
            tr.add("est_x", x);
            tr.add("est_x_replay", xr);
        }
        _ => {
            let mut x: Vec<f64> = (0..n).map(|k| k as f64).collect();
            if !good {
                x[150] = f64::NAN;
            }
            tr.add("est_x", x);
            params = json!({"prefix": "est_"});
        }
    }
    (tr, params)
}

/// Run every case on its expected and faulty reference traces. A case is reproduced
/// when the first passes and the second fails.
pub fn self_test() -> Value {
    let mut rows = Vec::new();
    let mut all = true;
    for (case, cites) in CASES {
        let mut v = Vec::new();
        for good in [true, false] {
            let (tr, p) = reference_trace(case, good);
            let r =
                run_case(case, &tr, &p).unwrap_or_else(|e| json!({"verdict": "ERROR", "error": e}));
            v.push(r["verdict"].as_str().unwrap_or("ERROR").to_string());
        }
        let ok = v[0] == "PASS" && v[1] == "FAIL";
        all &= ok;
        rows.push(json!({"case": case, "cites": cites, "expected_trace": v[0], "faulty_trace": v[1], "reproduced": ok}));
    }
    json!({"format": "kshana.drone-estimator-cases/1", "evidence": super::EVIDENCE, "all_reproduced": all, "cases": rows})
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_reference_case_is_reproduced() {
        let r = self_test();
        assert_eq!(r["all_reproduced"], true, "{r:#}");
    }

    #[test]
    fn utm_matches_published_points() {
        // Zone 32 central meridian (9° E) on the equator: easting 500 km, northing 0.
        let (z, e, n) = utm_forward(0.0, 9.0, None);
        assert_eq!(z, 32);
        assert!((e - 500_000.0).abs() < 1e-6 && n.abs() < 1e-6);
        // Scale on the central meridian: northing of 45° N = k0 × meridian arc (4 984 944.378 m).
        let (_, _, n45) = utm_forward(45.0, 9.0, None);
        assert!((n45 - 0.9996 * 4_984_944.378).abs() < 0.01, "{n45}");
    }

    #[test]
    fn jsonl_traces_fill_missing_samples_with_nan() {
        let tr = Trace::from_jsonl("{\"t\":0,\"a\":1}\n{\"t\":1,\"b\":2}\n{\"t\":2,\"a\":null}\n")
            .unwrap();
        assert_eq!(tr.t.len(), 3);
        assert_eq!(tr.ch["a"][0], 1.0);
        assert!(tr.ch["a"][1].is_nan() && tr.ch["a"][2].is_nan());
        assert!(tr.ch["b"][0].is_nan() && tr.ch["b"][1] == 2.0);
        assert!(Trace::from_jsonl("[1]").is_err());
    }
}
