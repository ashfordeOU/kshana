// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-arm GNSS spoofing and jamming check: receiver-flag fusion with ground kinematics.
//!
//! The window is the `window_s` seconds before the first arming event of the log (the last
//! `window_s` seconds of the log when it never arms). The vehicle is on the ground and still in
//! that window, so a moving solution is itself evidence. Each check gives `PASS`, `WARN` or `FAIL`
//! with its value and thresholds:
//!
//! | check | family | WARN | FAIL |
//! |---|---|---|---|
//! | `spoof_flag` | flag | - | receiver spoofing state ≥ 2 |
//! | `jam_flag` | flag | jamming state 2 | jamming state 3 |
//! | `auth_state` | flag | authentication state 2 (error) | - |
//! | `jam_indicator` | flag | max ≥ `jam_ind_warn` | max ≥ `jam_ind_fail` |
//! | `agc_drop` | flag | AGC falls by more than `agc_drop_warn` of its window maximum | - |
//! | `static_drift` | kinematic | least-squares horizontal drift ≥ `drift_warn_m_s` | ≥ `drift_fail_m_s` |
//! | `static_speed` | kinematic | median reported speed ≥ `speed_warn_m_s` | ≥ `speed_fail_m_s` |
//! | `position_jump` | kinematic | a step ≥ max(`jump_k`·eph, `jump_floor_m`) | twice that |
//! | `receiver_split` | kinematic | instances' median positions apart by ≥ max(`split_k`·√(eph₁²+eph₂²), `split_floor_m`) | three times that |
//! | `clock_step` | time | a step of receiver time against boot time ≥ `clock_warn_s` | ≥ `clock_fail_s` |
//! | `readiness` | readiness | fix < 3, eph > `req_eph_m`, sats < `req_sats` or sacc > `req_sacc_m_s` | - |
//!
//! The readiness thresholds are PX4's documented GNSS requirement defaults (`GNSS_REQ_EPH` 3 m,
//! `GNSS_REQ_NSATS` 6, `GNSS_REQ_SACC` 0.5 m/s; `EKF2_REQ_*` in older releases). **Fusion**: `FAIL`
//! when any check fails, or when `WARN`s come from two or more of the families flag, kinematic and
//! time (a receiver flag corroborated by an independent symptom); otherwise `WARN` when any check
//! warns; otherwise `PASS`. A check without data in the window is `NO_DATA` and does not vote.
//!
//! [`calibrate`] states the false-alarm rate of these thresholds on seeded synthetic clean windows
//! (a still receiver with first-order Gauss-Markov position error) and the detection rate on the
//! same windows with log-level injections (a raised receiver flag, a position drag with matching
//! reported speed, a receiver-time push, a position jump). It is MODELLED: a receiver whose real
//! noise differs moves the false-alarm rate, so the thresholds are starting points to set from the
//! operator's own clean logs (`--config`).

use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

use super::epochs::{FlightLog, GnssEpoch};

/// Thresholds of the check (see the module table).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct PrearmConfig {
    /// Seconds before arming that are checked.
    pub window_s: f64,
    /// Jamming indicator WARN level.
    pub jam_ind_warn: f64,
    /// Jamming indicator FAIL level.
    pub jam_ind_fail: f64,
    /// AGC fractional drop that warns.
    pub agc_drop_warn: f64,
    /// Horizontal drift WARN, m/s.
    pub drift_warn_m_s: f64,
    /// Horizontal drift FAIL, m/s.
    pub drift_fail_m_s: f64,
    /// Median reported speed WARN, m/s.
    pub speed_warn_m_s: f64,
    /// Median reported speed FAIL, m/s.
    pub speed_fail_m_s: f64,
    /// Jump multiple of eph.
    pub jump_k: f64,
    /// Jump floor, metres.
    pub jump_floor_m: f64,
    /// Receiver split multiple of the combined eph.
    pub split_k: f64,
    /// Receiver split floor, metres.
    pub split_floor_m: f64,
    /// Receiver clock step WARN, seconds.
    pub clock_warn_s: f64,
    /// Receiver clock step FAIL, seconds.
    pub clock_fail_s: f64,
    /// Readiness: largest eph, metres.
    pub req_eph_m: f64,
    /// Readiness: fewest satellites.
    pub req_sats: f64,
    /// Readiness: largest speed accuracy, m/s.
    pub req_sacc_m_s: f64,
}

impl Default for PrearmConfig {
    fn default() -> Self {
        PrearmConfig {
            window_s: 30.0,
            jam_ind_warn: 100.0,
            jam_ind_fail: 200.0,
            agc_drop_warn: 0.3,
            drift_warn_m_s: 0.15,
            drift_fail_m_s: 0.35,
            speed_warn_m_s: 0.3,
            speed_fail_m_s: 0.8,
            jump_k: 5.0,
            jump_floor_m: 8.0,
            split_k: 5.0,
            split_floor_m: 5.0,
            clock_warn_s: 0.2,
            clock_fail_s: 1.0,
            req_eph_m: 3.0,
            req_sats: 6.0,
            req_sacc_m_s: 0.5,
        }
    }
}

impl PrearmConfig {
    /// Read thresholds from JSON (missing keys keep their defaults).
    pub fn from_json(text: &str) -> Result<Self, String> {
        serde_json::from_str(text).map_err(|e| e.to_string())
    }
}

/// A check outcome or the fused verdict.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize, Deserialize)]
#[serde(rename_all = "SCREAMING_SNAKE_CASE")]
pub enum Verdict {
    /// The check had no data in the window.
    NoData,
    /// Nothing found.
    Pass,
    /// A symptom below the failing level.
    Warn,
    /// Arming is not recommended.
    Fail,
}

/// One check's result.
#[derive(Clone, Debug, Serialize)]
pub struct CheckResult {
    /// Check id (module table).
    pub id: &'static str,
    /// `flag`, `kinematic`, `time` or `readiness`.
    pub family: &'static str,
    /// The outcome.
    pub verdict: Verdict,
    /// The statistic that was compared.
    pub value: Option<f64>,
    /// WARN level of the statistic, where it has one.
    pub warn_at: Option<f64>,
    /// FAIL level of the statistic, where it has one.
    pub fail_at: Option<f64>,
}

/// The pre-arm report.
#[derive(Clone, Debug, Serialize)]
pub struct PrearmReport {
    /// Report format tag.
    pub format: &'static str,
    /// Evidence label.
    pub evidence: &'static str,
    /// Input log format.
    pub log_format: &'static str,
    /// Window start and end, s since boot.
    pub window_s: [f64; 2],
    /// Whether the window ends at an arming event (else at the end of the log).
    pub ends_at_arming: bool,
    /// Epochs in the window.
    pub epochs: usize,
    /// Every check.
    pub checks: Vec<CheckResult>,
    /// The fused verdict.
    pub verdict: Verdict,
    /// Playbook step ids for the verdict (docs/DRONE-PNT.md, "Response playbook").
    pub playbook: Vec<&'static str>,
}

const R_EARTH: f64 = 6_378_137.0;

fn grade(v: f64, warn: Option<f64>, fail: Option<f64>) -> Verdict {
    if fail.is_some_and(|f| v >= f) {
        Verdict::Fail
    } else if warn.is_some_and(|w| v >= w) {
        Verdict::Warn
    } else {
        Verdict::Pass
    }
}

fn result(
    id: &'static str,
    family: &'static str,
    value: Option<f64>,
    warn_at: Option<f64>,
    fail_at: Option<f64>,
) -> CheckResult {
    CheckResult {
        id,
        family,
        verdict: value.map_or(Verdict::NoData, |v| grade(v, warn_at, fail_at)),
        value,
        warn_at,
        fail_at,
    }
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    v.retain(|x| x.is_finite());
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

fn max_of(it: impl Iterator<Item = f64>) -> Option<f64> {
    it.filter(|x| x.is_finite()).reduce(f64::max)
}

/// East and north metres of each positioned epoch from the first, with its time.
fn en(eps: &[&GnssEpoch]) -> Vec<(f64, f64, f64)> {
    let pos: Vec<_> = eps
        .iter()
        .filter(|e| e.fix_type >= 2)
        .filter_map(|e| Some((e.t_s, e.lat_deg?, e.lon_deg?)))
        .filter(|(_, la, lo)| la.is_finite() && lo.is_finite() && (*la != 0.0 || *lo != 0.0))
        .collect();
    let Some(&(_, la0, lo0)) = pos.first() else {
        return Vec::new();
    };
    let c = la0.to_radians().cos();
    pos.iter()
        .map(|&(t, la, lo)| {
            (
                t,
                (lo - lo0).to_radians() * R_EARTH * c,
                (la - la0).to_radians() * R_EARTH,
            )
        })
        .collect()
}

/// Least-squares horizontal velocity magnitude of a track, m/s.
fn drift(track: &[(f64, f64, f64)]) -> Option<f64> {
    if track.len() < 5 {
        return None;
    }
    let n = track.len() as f64;
    let tm = track.iter().map(|p| p.0).sum::<f64>() / n;
    let sxx: f64 = track.iter().map(|p| (p.0 - tm).powi(2)).sum();
    if sxx <= 0.0 {
        return None;
    }
    let se: f64 = track.iter().map(|p| (p.0 - tm) * p.1).sum();
    let sn: f64 = track.iter().map(|p| (p.0 - tm) * p.2).sum();
    Some(((se / sxx).powi(2) + (sn / sxx).powi(2)).sqrt())
}

/// Run the check on a log.
pub fn check(log: &FlightLog, cfg: &PrearmConfig) -> PrearmReport {
    let t_end_log = max_of(log.epochs.iter().map(|e| e.t_s)).unwrap_or(0.0);
    let arm = log.arm_times_s.iter().copied().reduce(f64::min);
    let t1 = arm.unwrap_or(t_end_log);
    let t0 = t1 - cfg.window_s.max(0.0);
    let win: Vec<&GnssEpoch> = log
        .epochs
        .iter()
        .filter(|e| e.t_s >= t0 && e.t_s <= t1)
        .collect();
    let primary: Vec<&GnssEpoch> = win.iter().copied().filter(|e| e.instance == 0).collect();
    let all = |f: fn(&GnssEpoch) -> Option<f64>| max_of(win.iter().filter_map(|e| f(e)));
    let mut checks = Vec::new();

    // Flag family.
    let spoof = all(|e| e.spoofing_state.map(f64::from));
    checks.push(result("spoof_flag", "flag", spoof, None, Some(2.0)));
    let jam = all(|e| e.jamming_state.map(f64::from));
    checks.push(result("jam_flag", "flag", jam, Some(2.0), Some(3.0)));
    let auth = win
        .iter()
        .filter_map(|e| e.auth_state)
        .map(|a| if a == 2 { 1.0 } else { 0.0 })
        .reduce(f64::max);
    checks.push(result("auth_state", "flag", auth, Some(1.0), None));
    let ji = all(|e| e.jam_ind);
    checks.push(result(
        "jam_indicator",
        "flag",
        ji,
        Some(cfg.jam_ind_warn),
        Some(cfg.jam_ind_fail),
    ));
    let agc: Vec<f64> = primary.iter().filter_map(|e| e.agc).collect();
    let agc_drop = max_of(agc.iter().copied())
        .filter(|m| *m > 0.0)
        .and_then(|m| Some((m - agc.iter().copied().reduce(f64::min)?) / m));
    checks.push(result(
        "agc_drop",
        "flag",
        agc_drop,
        Some(cfg.agc_drop_warn),
        None,
    ));

    // Kinematic family.
    let track = en(&primary);
    checks.push(result(
        "static_drift",
        "kinematic",
        drift(&track),
        Some(cfg.drift_warn_m_s),
        Some(cfg.drift_fail_m_s),
    ));
    let spd = median(primary.iter().filter_map(|e| e.speed_m_s).collect());
    checks.push(result(
        "static_speed",
        "kinematic",
        spd,
        Some(cfg.speed_warn_m_s),
        Some(cfg.speed_fail_m_s),
    ));
    let eph = median(primary.iter().filter_map(|e| e.eph_m).collect()).unwrap_or(2.0);
    let jump_lim = (cfg.jump_k * eph).max(cfg.jump_floor_m);
    let jump = max_of(
        track
            .windows(2)
            .map(|w| ((w[1].1 - w[0].1).powi(2) + (w[1].2 - w[0].2).powi(2)).sqrt()),
    );
    checks.push(result(
        "position_jump",
        "kinematic",
        jump,
        Some(jump_lim),
        Some(2.0 * jump_lim),
    ));
    checks.push(split_check(&win, cfg));

    // Time family: steps of (receiver time - boot time) away from their median.
    let off: Vec<f64> = primary
        .iter()
        .filter_map(|e| Some(e.rx_time_s? - e.t_s))
        .collect();
    let steps: Vec<f64> = off.windows(2).map(|w| w[1] - w[0]).collect();
    let clock = median(steps.clone()).and_then(|m| max_of(steps.iter().map(|s| (s - m).abs())));
    checks.push(result(
        "clock_step",
        "time",
        clock,
        Some(cfg.clock_warn_s),
        Some(cfg.clock_fail_s),
    ));

    // Readiness (PX4 GNSS_REQ_* defaults).
    let not_ready = (!primary.is_empty()).then(|| {
        let bad = primary.iter().any(|e| {
            e.fix_type < 3
                || e.eph_m.is_some_and(|v| v > cfg.req_eph_m)
                || e.sats.is_some_and(|v| v < cfg.req_sats)
                || e.sacc_m_s.is_some_and(|v| v > cfg.req_sacc_m_s)
        });
        if bad {
            1.0
        } else {
            0.0
        }
    });
    checks.push(result("readiness", "readiness", not_ready, Some(1.0), None));

    let verdict = fuse(&checks);
    PrearmReport {
        format: "kshana.drone-prearm/1",
        evidence: super::EVIDENCE,
        log_format: log.format,
        window_s: [t0, t1],
        ends_at_arming: arm.is_some(),
        epochs: win.len(),
        checks,
        verdict,
        playbook: playbook(verdict),
    }
}

fn split_check(win: &[&GnssEpoch], cfg: &PrearmConfig) -> CheckResult {
    let med = |i: u8| {
        let e: Vec<&GnssEpoch> = win.iter().copied().filter(|e| e.instance == i).collect();
        let t = en(&e);
        let lat = median(e.iter().filter_map(|x| x.lat_deg).collect())?;
        let lon = median(e.iter().filter_map(|x| x.lon_deg).collect())?;
        let eph = median(e.iter().filter_map(|x| x.eph_m).collect()).unwrap_or(2.0);
        (!t.is_empty()).then_some((lat, lon, eph))
    };
    match (med(0), med(1)) {
        (Some(a), Some(b)) => {
            let c = a.0.to_radians().cos();
            let d = (((b.1 - a.1).to_radians() * R_EARTH * c).powi(2)
                + ((b.0 - a.0).to_radians() * R_EARTH).powi(2))
            .sqrt();
            let lim = (cfg.split_k * (a.2 * a.2 + b.2 * b.2).sqrt()).max(cfg.split_floor_m);
            result(
                "receiver_split",
                "kinematic",
                Some(d),
                Some(lim),
                Some(3.0 * lim),
            )
        }
        _ => result("receiver_split", "kinematic", None, None, None),
    }
}

/// The fusion rule (module notes).
pub fn fuse(checks: &[CheckResult]) -> Verdict {
    if checks.iter().any(|c| c.verdict == Verdict::Fail) {
        return Verdict::Fail;
    }
    let mut fams: Vec<&str> = checks
        .iter()
        .filter(|c| c.verdict == Verdict::Warn && c.family != "readiness")
        .map(|c| c.family)
        .collect();
    fams.sort_unstable();
    fams.dedup();
    if fams.len() >= 2 {
        Verdict::Fail
    } else if checks.iter().any(|c| c.verdict == Verdict::Warn) {
        Verdict::Warn
    } else {
        Verdict::Pass
    }
}

/// Playbook step ids for a verdict (their text is in docs/DRONE-PNT.md).
pub fn playbook(v: Verdict) -> Vec<&'static str> {
    match v {
        Verdict::Pass | Verdict::NoData => vec!["P0"],
        Verdict::Warn => vec!["W1", "W2", "W3"],
        Verdict::Fail => vec!["F1", "F2", "F3", "F4", "F5"],
    }
}

// ---------------------------------------------------------------------------------------------
// Calibration
// ---------------------------------------------------------------------------------------------

/// A log-level injection used by [`calibrate`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
#[serde(tag = "kind", rename_all = "snake_case")]
pub enum Injection {
    /// No injection: a clean window.
    Clean,
    /// The receiver raises its spoofing state to 2 for the last `secs` of the window.
    SpoofFlag {
        /// Seconds flagged.
        secs: f64,
    },
    /// The solution is dragged at `rate_m_s` (with the matching reported speed) for the second
    /// half of the window.
    Drag {
        /// Drag rate, m/s.
        rate_m_s: f64,
    },
    /// Receiver time jumps by `step_s` at mid-window.
    TimePush {
        /// Step, s.
        step_s: f64,
    },
    /// The solution jumps by `metres` at mid-window and stays.
    Jump {
        /// Jump, m.
        metres: f64,
    },
}

/// A synthetic still pre-arm window (5 Hz, `window_s` long, then an arming event), with an
/// injection. Clean model: per-axis first-order Gauss-Markov position error (σ 1.0 m, τ 60 s),
/// reported eph 1.5 m, speed noise 0.03 m/s per axis, receiver-time jitter 10 ms, spoofing and
/// jamming states 1, jamming indicator uniform 20-60, AGC 5000 ± 50.
pub fn synth_window(window_s: f64, inj: Injection, rng: &mut ChaCha8Rng) -> FlightLog {
    let dt = 0.2;
    let n = (window_s / dt).round() as usize + 1;
    let (sigma, tau) = (1.0, 60.0);
    let phi = (-dt / tau).exp();
    let q = sigma * (1.0 - phi * phi).sqrt();
    let unit = Normal::new(0.0, 1.0).expect("unit normal");
    let (mut ee, mut en_) = (sigma * unit.sample(rng), sigma * unit.sample(rng));
    let (lat0, lon0) = (47.397_742, 8.545_594);
    let c = lat0_cos(lat0);
    let t_boot0 = 100.0;
    let rx0 = 1_700_000_000.0;
    let mut eps = Vec::with_capacity(n);
    for k in 0..n {
        let t = k as f64 * dt;
        ee = phi * ee + q * unit.sample(rng);
        en_ = phi * en_ + q * unit.sample(rng);
        let (ve, vn) = (0.03 * unit.sample(rng), 0.03 * unit.sample(rng));
        let half = t >= window_s / 2.0;
        let (mut de, mut dn, mut spd) = (ee, en_, (ve * ve + vn * vn).sqrt());
        let mut spoof = 1u8;
        let mut rx = rx0 + t + 0.01 * unit.sample(rng);
        match inj {
            Injection::Clean => {}
            Injection::SpoofFlag { secs } => {
                if t >= window_s - secs {
                    spoof = 2;
                }
            }
            Injection::Drag { rate_m_s } => {
                if half {
                    de += rate_m_s * (t - window_s / 2.0);
                    spd = ((ve + rate_m_s).powi(2) + vn * vn).sqrt();
                }
            }
            Injection::TimePush { step_s } => {
                if half {
                    rx += step_s;
                }
            }
            Injection::Jump { metres } => {
                if half {
                    dn += metres;
                }
            }
        }
        eps.push(GnssEpoch {
            t_s: t_boot0 + t,
            instance: 0,
            fix_type: 3,
            lat_deg: Some(lat0 + (dn / R_EARTH).to_degrees()),
            lon_deg: Some(lon0 + (de / (R_EARTH * c)).to_degrees()),
            alt_m: Some(488.0),
            sats: Some(14.0),
            eph_m: Some(1.5),
            epv_m: Some(2.5),
            hdop: Some(0.8),
            speed_m_s: Some(spd),
            sacc_m_s: Some(0.2),
            jamming_state: Some(1),
            spoofing_state: Some(spoof),
            auth_state: None,
            jam_ind: Some(rng.gen_range(20.0..60.0)),
            noise: Some(90.0),
            agc: Some(5000.0 + 50.0 * unit.sample(rng)),
            rx_time_s: Some(rx),
        });
    }
    FlightLog {
        format: "synthetic",
        epochs: eps,
        arm_times_s: vec![t_boot0 + window_s],
        malformed: 0,
    }
}

fn lat0_cos(lat: f64) -> f64 {
    lat.to_radians().cos()
}

/// One row of the calibration table.
#[derive(Clone, Debug, Serialize)]
pub struct CalibrationRow {
    /// The injection.
    pub injection: Injection,
    /// Windows run.
    pub runs: usize,
    /// Fraction whose fused verdict is not `PASS`.
    pub not_pass_rate: f64,
    /// Fraction whose fused verdict is `FAIL`.
    pub fail_rate: f64,
    /// Per check: fraction of windows where it is `WARN` or `FAIL`.
    pub per_check_alarm_rate: std::collections::BTreeMap<&'static str, f64>,
}

/// The calibration report.
#[derive(Clone, Debug, Serialize)]
pub struct Calibration {
    /// Report format tag.
    pub format: &'static str,
    /// Evidence label.
    pub evidence: &'static str,
    /// The seed.
    pub seed: u64,
    /// The thresholds evaluated.
    pub config: PrearmConfig,
    /// The clean row first (its rates are false-alarm rates), then each injection.
    pub rows: Vec<CalibrationRow>,
}

/// The injections of the calibration table.
pub fn calibration_injections() -> Vec<Injection> {
    vec![
        Injection::Clean,
        Injection::SpoofFlag { secs: 2.0 },
        Injection::Drag { rate_m_s: 0.2 },
        Injection::Drag { rate_m_s: 0.5 },
        Injection::Drag { rate_m_s: 1.0 },
        Injection::TimePush { step_s: 0.5 },
        Injection::TimePush { step_s: 2.0 },
        Injection::Jump { metres: 20.0 },
    ]
}

/// Run `runs` seeded windows per injection and tabulate the alarm rates.
pub fn calibrate(cfg: &PrearmConfig, runs: usize, seed: u64) -> Calibration {
    let mut rows = Vec::new();
    for (k, inj) in calibration_injections().into_iter().enumerate() {
        let mut rng =
            ChaCha8Rng::seed_from_u64(seed.wrapping_mul(1_000_003).wrapping_add(k as u64));
        let (mut not_pass, mut fail) = (0usize, 0usize);
        let mut per: std::collections::BTreeMap<&'static str, usize> = Default::default();
        for _ in 0..runs {
            let log = synth_window(cfg.window_s, inj, &mut rng);
            let r = check(&log, cfg);
            if r.verdict != Verdict::Pass {
                not_pass += 1;
            }
            if r.verdict == Verdict::Fail {
                fail += 1;
            }
            for c in &r.checks {
                let e = per.entry(c.id).or_default();
                if matches!(c.verdict, Verdict::Warn | Verdict::Fail) {
                    *e += 1;
                }
            }
        }
        let rate = |x: usize| x as f64 / runs.max(1) as f64;
        rows.push(CalibrationRow {
            injection: inj,
            runs,
            not_pass_rate: rate(not_pass),
            fail_rate: rate(fail),
            per_check_alarm_rate: per.into_iter().map(|(k, v)| (k, rate(v))).collect(),
        });
    }
    Calibration {
        format: "kshana.drone-prearm-calibration/1",
        evidence: super::EVIDENCE,
        seed,
        config: cfg.clone(),
        rows,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn clean_window_passes_and_a_flag_fails() {
        let mut rng = ChaCha8Rng::seed_from_u64(7);
        let cfg = PrearmConfig::default();
        let clean = synth_window(30.0, Injection::Clean, &mut rng);
        let r = check(&clean, &cfg);
        assert_eq!(r.verdict, Verdict::Pass, "{:#?}", r.checks);
        assert!(r.ends_at_arming);
        let bad = synth_window(30.0, Injection::SpoofFlag { secs: 1.0 }, &mut rng);
        let r = check(&bad, &cfg);
        assert_eq!(r.verdict, Verdict::Fail);
        assert_eq!(r.playbook[0], "F1");
    }

    #[test]
    fn two_warning_families_fuse_to_fail() {
        let c = |id, family, v| CheckResult {
            id,
            family,
            verdict: v,
            value: None,
            warn_at: None,
            fail_at: None,
        };
        let one = [
            c("jam_flag", "flag", Verdict::Warn),
            c("readiness", "readiness", Verdict::Warn),
        ];
        assert_eq!(fuse(&one), Verdict::Warn);
        let two = [
            c("jam_flag", "flag", Verdict::Warn),
            c("static_speed", "kinematic", Verdict::Warn),
        ];
        assert_eq!(fuse(&two), Verdict::Fail);
        let none = [c("x", "flag", Verdict::NoData)];
        assert_eq!(fuse(&none), Verdict::Pass);
    }
}
