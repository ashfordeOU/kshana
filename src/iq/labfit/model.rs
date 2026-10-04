// SPDX-License-Identifier: AGPL-3.0-only
//! The two lock models and the forward simulation of one satellite's loss of lock and
//! reacquisition under a stated condition.
//!
//! Both models reduce to the same detector: lock is dropped once the modelled C/N0 has
//! stayed below a drop threshold for a drop dwell, and regained once it has stayed at or
//! above a (higher or equal) re-lock threshold for a re-lock dwell. That is the
//! two-threshold, confirmation-dwell detector of [`crate::tracking_loop::LockDetector`]
//! taken to continuous time, so event times are continuous in every parameter and a
//! ramped test pins the thresholds to a fraction of a dB.
//!
//! * [`ModelKind::TrackingLoop`] derives the thresholds from loop physics through
//!   [`crate::tracking_loop::LoopConfig::thresholds`]: the fitted parameters are the
//!   carrier-loop noise bandwidth and the pull-in bandwidth ratio (plus the two dwells);
//!   integration time, correlator spacing, the code loop and the allowances are held
//!   fixed at stated values, and each run's platform dynamics enter the thresholds.
//! * [`ModelKind::Empirical`] fits the thresholds directly (drop C/N0 and hysteresis,
//!   plus the two dwells) and ignores dynamics: the per-receiver baseline.
//!
//! The modelled C/N0 of a satellite is its nominal (pre-onset median) value lowered by
//! the stated level plus a fitted calibration offset ([`super::schema::Conditions`]).
//! Only the first loss after onset and the first reacquisition after it are modelled.

use serde::Serialize;

use super::schema::{Conditions, Interp, LoopFixedCfg};
use crate::tracking_loop::LoopConfig;

/// Which lock model.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum ModelKind {
    /// Thresholds from the tracking-loop model of [`crate::tracking_loop`].
    TrackingLoop,
    /// Thresholds fitted directly: the per-receiver empirical baseline.
    Empirical,
}

impl ModelKind {
    /// Both models, in report order.
    pub const ALL: [ModelKind; 2] = [ModelKind::TrackingLoop, ModelKind::Empirical];

    /// The label used in reports.
    pub fn as_str(self) -> &'static str {
        match self {
            ModelKind::TrackingLoop => "tracking-loop",
            ModelKind::Empirical => "empirical",
        }
    }

    /// Names of the four fitted parameters, in order.
    pub fn param_names(self) -> [&'static str; 4] {
        match self {
            ModelKind::TrackingLoop => [
                "pll_bandwidth_hz",
                "pullin_ratio",
                "drop_dwell_s",
                "relock_dwell_s",
            ],
            ModelKind::Empirical => [
                "drop_cn0_dbhz",
                "hysteresis_db",
                "drop_dwell_s",
                "relock_dwell_s",
            ],
        }
    }

    /// Lower and upper bounds of the four parameters.
    pub fn bounds(self, b: &super::schema::BoundsCfg) -> ([f64; 4], [f64; 4]) {
        let p = match self {
            ModelKind::TrackingLoop => [
                b.pll_bandwidth_hz,
                b.pullin_ratio,
                b.drop_dwell_s,
                b.relock_dwell_s,
            ],
            ModelKind::Empirical => [
                b.drop_cn0_dbhz,
                b.hysteresis_db,
                b.drop_dwell_s,
                b.relock_dwell_s,
            ],
        };
        (
            [p[0][0], p[1][0], p[2][0], p[3][0]],
            [p[0][1], p[1][1], p[2][1], p[3][1]],
        )
    }
}

/// The effective detector a model implies for one run's conditions.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct LockParams {
    /// C/N0 below which lock is lost (dB-Hz); `+∞` when the loop cannot hold the
    /// run's dynamics at any C/N0.
    pub drop_cn0_dbhz: f64,
    /// C/N0 that must be regained to re-lock (dB-Hz); `+∞` as above.
    pub relock_cn0_dbhz: f64,
    /// Drop dwell (s).
    pub drop_dwell_s: f64,
    /// Re-lock dwell (s).
    pub relock_dwell_s: f64,
}

/// The loop configuration of the tracking-loop model at bandwidth `pll_bw_hz` and
/// pull-in ratio `ratio`.
pub fn loop_config(fixed: &LoopFixedCfg, pll_bw_hz: f64, ratio: f64) -> LoopConfig {
    LoopConfig {
        pll_bandwidth_hz: pll_bw_hz,
        dll_bandwidth_hz: fixed.dll_bandwidth_hz,
        integration_s: fixed.integration_s,
        spacing_chips: fixed.spacing_chips,
        carrier_allowance_deg: fixed.carrier_allowance_deg,
        code_allowance_chips: fixed
            .code_allowance_chips
            .unwrap_or(fixed.spacing_chips / 2.0),
        pullin_bandwidth_ratio: ratio,
    }
}

/// The detector `kind` with parameters `theta` implies under `cond`.
pub fn lock_params(
    kind: ModelKind,
    theta: &[f64; 4],
    fixed: &LoopFixedCfg,
    cond: &Conditions,
) -> LockParams {
    let (drop, relock) = match kind {
        ModelKind::TrackingLoop => {
            let th = loop_config(fixed, theta[0], theta[1])
                .thresholds(cond.doppler_rate_hz_per_s, cond.code_slew_chips_per_s);
            let d = th.drop_cn0_dbhz.unwrap_or(f64::INFINITY);
            let r = th.relock_cn0_dbhz.unwrap_or(f64::INFINITY).max(d);
            (d, r)
        }
        ModelKind::Empirical => (theta[0], theta[0] + theta[1].max(0.0)),
    };
    LockParams {
        drop_cn0_dbhz: drop,
        relock_cn0_dbhz: relock,
        drop_dwell_s: theta[2].max(0.0),
        relock_dwell_s: theta[3].max(0.0),
    }
}

/// The first loss and first reacquisition of one satellite.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize)]
pub struct LockEvents {
    /// Time lock is declared lost (s), if it is within the run.
    pub loss_s: Option<f64>,
    /// Time lock is declared regained after that loss (s), if it is within the run.
    pub reacq_s: Option<f64>,
}

/// One linear piece of the stated level within the event: `[a, b]` with level going
/// from `la` to `lb`.
#[derive(Clone, Copy, Debug)]
struct Piece {
    a: f64,
    b: f64,
    la: f64,
    lb: f64,
}

fn pieces(cond: &Conditions, t1: f64) -> Vec<Piece> {
    let pts = cond.sorted_levels();
    let start = cond.onset_s;
    let end = cond.event_end_s().min(t1);
    if pts.is_empty() || end <= start {
        return Vec::new();
    }
    let mut bps = vec![start];
    bps.extend(pts.iter().map(|p| p.t_s).filter(|&t| t > start && t < end));
    bps.push(end);
    bps.dedup();
    bps.windows(2)
        .map(|w| {
            let (a, b) = (w[0], w[1]);
            let la = super::schema::level_in(&pts, cond.interp, a).unwrap_or(0.0);
            let lb = match cond.interp {
                Interp::Step => la,
                Interp::Linear => super::schema::level_in(&pts, cond.interp, b).unwrap_or(la),
            };
            Piece { a, b, la, lb }
        })
        .collect()
}

fn push_merge(v: &mut Vec<(f64, f64)>, a: f64, b: f64) {
    if b < a {
        return;
    }
    if let Some(last) = v.last_mut() {
        if a <= last.1 + 1e-12 {
            last.1 = last.1.max(b);
            return;
        }
    }
    v.push((a, b));
}

/// Intervals of `[t0, t1]` where the modelled C/N0 is below `threshold_dbhz`, merged and
/// in time order.
pub fn below_intervals(
    cond: &Conditions,
    nominal_dbhz: f64,
    threshold_dbhz: f64,
    offset_db: f64,
    t0: f64,
    t1: f64,
) -> Vec<(f64, f64)> {
    let mut out = Vec::new();
    if t1 <= t0 {
        return out;
    }
    let outside_below = nominal_dbhz < threshold_dbhz;
    let lstar = cond.level_threshold(nominal_dbhz, threshold_dbhz, offset_db);
    let ps = pieces(cond, f64::INFINITY);
    let (ev_a, ev_b) = match (ps.first(), ps.last()) {
        (Some(f), Some(l)) => (f.a, l.b),
        _ => (f64::INFINITY, f64::INFINITY),
    };
    // Before the event.
    if outside_below {
        push_merge(&mut out, t0, ev_a.min(t1));
    }
    for p in &ps {
        let (a, b) = (p.a.max(t0), p.b.min(t1));
        if b <= a {
            continue;
        }
        let (sa, sb) = if p.la == p.lb {
            if p.la > lstar {
                (p.a, p.b)
            } else {
                continue;
            }
        } else {
            let tc = p.a + (lstar - p.la) / (p.lb - p.la) * (p.b - p.a);
            if p.lb > p.la {
                (tc.max(p.a), p.b)
            } else {
                (p.a, tc.min(p.b))
            }
        };
        let (sa, sb) = (sa.max(a), sb.min(b));
        if sb > sa {
            push_merge(&mut out, sa, sb);
        }
    }
    // After the event.
    if outside_below && ev_b < t1 {
        push_merge(&mut out, ev_b.max(t0), t1);
    }
    out
}

/// Forward model: the first loss of lock after onset and the first reacquisition after
/// it, for a satellite of nominal C/N0 `nominal_dbhz` that is locked at onset, over a
/// run that ends at `run_end_s`.
pub fn simulate_sat(
    cond: &Conditions,
    nominal_dbhz: f64,
    offset_db: f64,
    lp: &LockParams,
    run_end_s: f64,
) -> LockEvents {
    let t0 = cond.onset_s;
    let below = below_intervals(
        cond,
        nominal_dbhz,
        lp.drop_cn0_dbhz,
        offset_db,
        t0,
        run_end_s,
    );
    let loss = below.iter().find_map(|&(a, b)| {
        let t = a + lp.drop_dwell_s;
        (b - a > 0.0 && t <= b).then_some(t)
    });
    let Some(tl) = loss else {
        return LockEvents::default();
    };
    // Good (re-lock) intervals: the complement of "below the re-lock threshold" on
    // [tl, run_end].
    let bad = below_intervals(
        cond,
        nominal_dbhz,
        lp.relock_cn0_dbhz,
        offset_db,
        tl,
        run_end_s,
    );
    let mut good = Vec::new();
    let mut cur = tl;
    for &(a, b) in &bad {
        if a > cur {
            good.push((cur, a));
        }
        cur = cur.max(b);
    }
    if cur < run_end_s {
        good.push((cur, run_end_s));
    }
    let reacq = good.iter().find_map(|&(a, b)| {
        let t = a + lp.relock_dwell_s;
        (b - a > 0.0 && t <= b).then_some(t)
    });
    LockEvents {
        loss_s: Some(tl),
        reacq_s: reacq,
    }
}
