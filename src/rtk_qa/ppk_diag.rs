// SPDX-License-Identifier: AGPL-3.0-only
//! PPK "no fix" diagnostics from the raw logs.
//!
//! When post-processing gives no fixed solution, the cause is usually in the logs rather than in
//! the processing: the rover never logged carrier phase (raw measurement output off), the base
//! and rover files do not overlap in time or never share an epoch, too few satellites are common
//! to both, the receiver kept losing lock (loss-of-lock indicators), the signal was weak, there
//! are gaps in the log, it is single-frequency, or the baseline is long. [`diagnose`] reads the
//! rover's (and, when given, the base's) RINEX observation file and lists the likely causes,
//! failures first. The thresholds are this module's: MODELLED.

use crate::rinex_obs::RinexObs;
use serde::Serialize;
use std::collections::BTreeSet;

/// Evidence label of every report.
pub const LABEL: &str = "MODELLED";

/// What one log holds.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LogStats {
    /// Epochs.
    pub epochs: usize,
    /// Median epoch interval, s.
    pub interval_s: Option<f64>,
    /// Span from the first to the last epoch, s.
    pub span_s: f64,
    /// Gaps longer than one and a half intervals.
    pub gaps: usize,
    /// Longest gap, s.
    pub longest_gap_s: f64,
    /// Median, over epochs, of satellites with carrier phase on any band.
    pub median_phase_sats: f64,
    /// Median, over epochs, of satellites with carrier phase on two or more bands.
    pub median_dual_band_sats: f64,
    /// Observations whose loss-of-lock indicator is set.
    pub loss_of_lock: usize,
    /// Loss-of-lock events per satellite-hour of phase tracking.
    pub loss_of_lock_per_sat_hour: f64,
    /// Mean signal strength on the first band (dB-Hz), where logged.
    pub mean_snr_dbhz: Option<f64>,
    /// Satellite systems seen (`GERC`).
    pub systems: String,
}

/// One likely cause.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Cause {
    /// What it is.
    pub code: &'static str,
    /// `fail`, `warn` or `info`.
    pub severity: &'static str,
    /// The figure behind it (s, km, a count or dB-Hz, by code).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub value: Option<f64>,
}

/// The diagnosis.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PpkDiagnosis {
    /// Always `MODELLED`.
    pub label: &'static str,
    /// The rover log.
    pub rover: LogStats,
    /// The base log, if given.
    pub base: Option<LogStats>,
    /// Time both logs cover, s.
    pub overlap_s: Option<f64>,
    /// Epochs present in both (to 1 ms).
    pub common_epochs: Option<usize>,
    /// Median, over common epochs, of satellites with phase in both.
    pub median_common_sats: Option<f64>,
    /// Distance between the header positions, km.
    pub baseline_km: Option<f64>,
    /// Likely causes, failures first.
    pub causes: Vec<Cause>,
}

fn secs(e: &crate::rinex::EpochUtc) -> f64 {
    crate::gnss_time::days_from_civil(i64::from(e.year), e.month, e.day) as f64 * 86_400.0
        + f64::from(e.hour) * 3600.0
        + f64::from(e.minute) * 60.0
        + e.second
}

fn median(mut v: Vec<f64>) -> f64 {
    if v.is_empty() {
        return 0.0;
    }
    v.sort_by(f64::total_cmp);
    v[v.len() / 2]
}

/// Per epoch: the satellites with phase, and the number with phase on 2+ bands.
fn phase_sats(o: &RinexObs) -> Vec<(f64, BTreeSet<String>, usize)> {
    let mut out = Vec::new();
    for e in &o.epochs {
        if e.flag > 1 {
            continue;
        }
        let mut set = BTreeSet::new();
        let mut dual = 0;
        for s in &e.sats {
            let Some(codes) = s.sat.chars().next().and_then(|c| o.header.codes_for(c)) else {
                continue;
            };
            let mut bands = BTreeSet::new();
            for (k, c) in codes.iter().enumerate() {
                if c.starts_with('L')
                    && s.obs
                        .get(k)
                        .is_some_and(|x| x.as_ref().is_some_and(|v| v.value != 0.0))
                {
                    bands.insert(c.chars().nth(1).unwrap_or('?'));
                }
            }
            if !bands.is_empty() {
                set.insert(s.sat.clone());
            }
            if bands.len() >= 2 {
                dual += 1;
            }
        }
        out.push((secs(&e.time), set, dual));
    }
    out
}

/// What one log holds.
pub fn stats(o: &RinexObs) -> LogStats {
    let ps = phase_sats(o);
    let times: Vec<f64> = ps.iter().map(|p| p.0).collect();
    let diffs: Vec<f64> = times
        .windows(2)
        .map(|w| w[1] - w[0])
        .filter(|d| *d > 0.0)
        .collect();
    let interval = if diffs.is_empty() {
        None
    } else {
        Some(median(diffs.clone()))
    };
    let (gaps, longest) = match interval {
        Some(i) => (
            diffs.iter().filter(|d| **d > 1.5 * i).count(),
            diffs
                .iter()
                .copied()
                .filter(|d| *d > 1.5 * i)
                .fold(0.0, f64::max),
        ),
        None => (0, 0.0),
    };
    let mut lol = 0usize;
    let mut snr = Vec::new();
    let mut systems = BTreeSet::new();
    for e in &o.epochs {
        for s in &e.sats {
            let sys = s.sat.chars().next().unwrap_or('?');
            systems.insert(sys);
            let Some(codes) = o.header.codes_for(sys) else {
                continue;
            };
            for (k, c) in codes.iter().enumerate() {
                let Some(Some(v)) = s.obs.get(k) else {
                    continue;
                };
                if c.starts_with('L') && v.lli.is_some_and(|l| l & 1 == 1) {
                    lol += 1;
                }
                if c.starts_with('S') && c.chars().nth(1) == Some('1') && v.value > 0.0 {
                    snr.push(v.value);
                }
            }
        }
    }
    let sat_hours: f64 =
        ps.iter().map(|p| p.1.len() as f64).sum::<f64>() * interval.unwrap_or(0.0) / 3600.0;
    LogStats {
        epochs: ps.len(),
        interval_s: interval,
        span_s: times.last().copied().unwrap_or(0.0) - times.first().copied().unwrap_or(0.0),
        gaps,
        longest_gap_s: longest,
        median_phase_sats: median(ps.iter().map(|p| p.1.len() as f64).collect()),
        median_dual_band_sats: median(ps.iter().map(|p| p.2 as f64).collect()),
        loss_of_lock: lol,
        loss_of_lock_per_sat_hour: if sat_hours > 0.0 {
            lol as f64 / sat_hours
        } else {
            0.0
        },
        mean_snr_dbhz: if snr.is_empty() {
            None
        } else {
            Some(snr.iter().sum::<f64>() / snr.len() as f64)
        },
        systems: systems.into_iter().collect(),
    }
}

/// Diagnose a rover log, with its base log when there is one.
pub fn diagnose(rover: &RinexObs, base: Option<&RinexObs>) -> PpkDiagnosis {
    let rs = stats(rover);
    let mut causes = Vec::new();
    let mut push = |code, severity, value| {
        causes.push(Cause {
            code,
            severity,
            value,
        })
    };
    if rs.median_phase_sats == 0.0 {
        push("no-carrier-phase", "fail", None);
    } else if rs.median_phase_sats < 5.0 {
        push("few-satellites", "warn", Some(rs.median_phase_sats));
    }
    if rs.median_phase_sats > 0.0 && rs.median_dual_band_sats < 4.0 {
        push("single-frequency", "info", Some(rs.median_dual_band_sats));
    }
    if rs.loss_of_lock_per_sat_hour > 10.0 {
        push(
            "frequent-loss-of-lock",
            "warn",
            Some(rs.loss_of_lock_per_sat_hour),
        );
    }
    if rs.gaps > 0 {
        push("data-gaps", "warn", Some(rs.longest_gap_s));
    }
    if let Some(s) = rs.mean_snr_dbhz.filter(|s| *s < 35.0) {
        push("low-signal", "warn", Some(s));
    }
    let (mut overlap, mut common, mut common_sats, mut baseline) = (None, None, None, None);
    let bs = base.map(stats);
    if let (Some(b), Some(bst)) = (base, &bs) {
        let rp = phase_sats(rover);
        let bp = phase_sats(b);
        let (r0, r1) = (
            rp.first().map_or(0.0, |p| p.0),
            rp.last().map_or(0.0, |p| p.0),
        );
        let (b0, b1) = (
            bp.first().map_or(0.0, |p| p.0),
            bp.last().map_or(0.0, |p| p.0),
        );
        let ov = (r1.min(b1) - r0.max(b0)).max(0.0);
        let has_overlap = !rp.is_empty() && !bp.is_empty() && r0.max(b0) <= r1.min(b1);
        overlap = Some(ov);
        let mut n = 0usize;
        let mut cs = Vec::new();
        let mut j = 0;
        for (t, set, _) in &rp {
            while j < bp.len() && bp[j].0 < t - 0.0005 {
                j += 1;
            }
            if j < bp.len() && (bp[j].0 - t).abs() <= 0.0005 {
                n += 1;
                cs.push(set.intersection(&bp[j].1).count() as f64);
            }
        }
        common = Some(n);
        let mc = median(cs);
        common_sats = Some(mc);
        if bst.median_phase_sats == 0.0 {
            push("base-no-carrier-phase", "fail", None);
        }
        if !has_overlap {
            push("no-time-overlap", "fail", None);
        } else if n == 0 {
            push("no-common-epochs", "fail", None);
        } else {
            if ov < 600.0 {
                push("short-overlap", "warn", Some(ov));
            }
            if mc < 4.0 {
                push("few-common-satellites", "fail", Some(mc));
            } else if mc < 6.0 {
                push("few-common-satellites", "warn", Some(mc));
            }
        }
        if let (Some(ri), Some(bi)) = (rs.interval_s, bst.interval_s) {
            if bi > ri * 1.5 {
                push("base-interval-coarse", "info", Some(bi));
            }
        }
        if let (Some(a), Some(c)) = (rover.header.approx_xyz, b.header.approx_xyz) {
            let d = ((a[0] - c[0]).powi(2) + (a[1] - c[1]).powi(2) + (a[2] - c[2]).powi(2)).sqrt()
                / 1000.0;
            if a.iter().any(|v| *v != 0.0) && c.iter().any(|v| *v != 0.0) {
                baseline = Some(d);
                if d > 20.0 {
                    push("long-baseline", "warn", Some(d));
                }
            }
        }
    }
    let rank = |s: &str| match s {
        "fail" => 0,
        "warn" => 1,
        _ => 2,
    };
    causes.sort_by_key(|c| rank(c.severity));
    PpkDiagnosis {
        label: LABEL,
        rover: rs,
        base: bs,
        overlap_s: overlap,
        common_epochs: common,
        median_common_sats: common_sats,
        baseline_km: baseline,
        causes,
    }
}
