// SPDX-License-Identifier: AGPL-3.0-only
//! One trust state for an area from several reference stations (0.41 row B5).
//!
//! The definitions are fixed in `docs/design/evidence/b5-area-trust/PREREGISTRATION.md`, with the
//! readings recorded before this code in `xval/area-trust/README.md`:
//!
//! * each station's epochs are put on a 1 s grid (an epoch belongs to the second that contains its
//!   time tag; the last epoch of a second wins); a station with no epoch for 5 s is `Stale` and is
//!   left out of the counts;
//! * with `N` live stations, `n_D` degraded or worse and `n_U` untrusted, and `k = max(2, ⌈N/3⌉)`:
//!   `UNKNOWN` if `N < 2`, `UNTRUSTED` if `n_U ≥ k`, `DEGRADED` if `n_D ≥ k` or `n_U ≥ 1`, else
//!   `TRUSTED`;
//! * a worse state is published at once (an alert); a better one only after the raw state has been
//!   better for 10 s, and then as the worst raw state of those 10 s.
//!
//! [`station_state`] is section 1's per-station rule over the evidence one station reports for an
//! epoch, and [`synth`] builds a seeded multi-station replay with injected events whose expected
//! station states follow from that rule. This module computes; the live wiring and alert delivery are
//! the A3a/A4 paths.

use serde::{Deserialize, Serialize};

/// One station's state in an epoch.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum StationState {
    /// No alarm.
    Nominal,
    /// A measurement-domain alarm only.
    Degraded,
    /// A fix-domain alarm.
    Untrusted,
}

/// The area state.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "UPPERCASE")]
pub enum AreaState {
    /// Fewer than two live stations.
    Unknown,
    /// No area condition.
    Trusted,
    /// Degraded.
    Degraded,
    /// Untrusted.
    Untrusted,
}

impl AreaState {
    /// Rank on the ordered scale; `None` for `Unknown`.
    fn rank(self) -> Option<u8> {
        match self {
            AreaState::Unknown => None,
            AreaState::Trusted => Some(0),
            AreaState::Degraded => Some(1),
            AreaState::Untrusted => Some(2),
        }
    }
}

/// One station's epochs.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Station {
    /// Identifier.
    pub id: String,
    /// `(t_s, state)` in time order.
    pub epochs: Vec<(f64, StationState)>,
}

/// The stations document (`kshana.area-stations/1`).
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Stations {
    /// The stations.
    pub stations: Vec<Station>,
}

/// One grid second of the area timeline.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct AreaSecond {
    /// Grid second.
    pub g: i64,
    /// Published state.
    pub state: AreaState,
    /// Whether this second raises an alert.
    pub alert: bool,
    /// Live stations.
    pub n: usize,
    /// Of which degraded or worse.
    pub n_d: usize,
    /// Of which untrusted.
    pub n_u: usize,
    /// Stale stations.
    pub stale: usize,
}

/// Seconds without an epoch after which a station is stale.
pub const STALE_AFTER_S: i64 = 5;
/// Seconds a better raw state must hold before it is published.
pub const HOLD_S: usize = 10;

/// The raw area state of one grid second from the live stations' states.
pub fn raw_state(live: &[StationState]) -> (AreaState, usize, usize) {
    let n = live.len();
    let n_d = live
        .iter()
        .filter(|s| **s >= StationState::Degraded)
        .count();
    let n_u = live
        .iter()
        .filter(|s| **s == StationState::Untrusted)
        .count();
    if n < 2 {
        return (AreaState::Unknown, n_d, n_u);
    }
    let k = 2usize.max(n.div_ceil(3));
    let s = if n_u >= k {
        AreaState::Untrusted
    } else if n_d >= k || n_u >= 1 {
        AreaState::Degraded
    } else {
        AreaState::Trusted
    };
    (s, n_d, n_u)
}

/// The area timeline over every grid second from the first epoch to the last.
pub fn timeline(stations: &[Station]) -> Vec<AreaSecond> {
    let (mut lo, mut hi) = (i64::MAX, i64::MIN);
    for s in stations {
        for &(t, _) in &s.epochs {
            let g = t.floor() as i64;
            lo = lo.min(g);
            hi = hi.max(g);
        }
    }
    if lo > hi {
        return Vec::new();
    }
    // Per station: a cursor over its epochs, the state it holds and the second it last reported.
    let mut cursor = vec![0usize; stations.len()];
    let mut held: Vec<Option<(StationState, i64)>> = vec![None; stations.len()];
    let mut out = Vec::with_capacity((hi - lo + 1) as usize);
    let mut raws: Vec<AreaState> = Vec::new();
    let mut published: Option<AreaState> = None;
    for g in lo..=hi {
        let mut live = Vec::with_capacity(stations.len());
        let mut stale = 0;
        for (i, s) in stations.iter().enumerate() {
            while cursor[i] < s.epochs.len() && (s.epochs[cursor[i]].0.floor() as i64) <= g {
                let (t, st) = s.epochs[cursor[i]];
                held[i] = Some((st, t.floor() as i64));
                cursor[i] += 1;
            }
            match held[i] {
                Some((st, last)) if g - last < STALE_AFTER_S => live.push(st),
                _ => stale += 1,
            }
        }
        let (raw, n_d, n_u) = raw_state(&live);
        raws.push(raw);
        let before = published;
        let next = match before {
            None => raw,
            Some(p) if raw == AreaState::Unknown || p == AreaState::Unknown => raw,
            Some(p) => match (raw.rank(), p.rank()) {
                (Some(r), Some(q)) if r > q => raw,
                (Some(r), Some(q)) if r < q => {
                    let window = &raws[raws.len().saturating_sub(HOLD_S)..];
                    let all_better = window.len() == HOLD_S
                        && window.iter().all(|w| w.rank().is_some_and(|x| x < q));
                    if all_better {
                        *window
                            .iter()
                            .max_by_key(|w| w.rank().unwrap_or(0))
                            .unwrap_or(&raw)
                    } else {
                        p
                    }
                }
                _ => p,
            },
        };
        published = Some(next);
        let alert = match before {
            None => false,
            Some(p) => {
                next.rank().is_some_and(|r| r >= 1)
                    && (p == AreaState::Unknown || next.rank() > p.rank())
            }
        };
        out.push(AreaSecond {
            g,
            state: next,
            alert,
            n: live.len(),
            n_d,
            n_u,
            stale,
        });
    }
    out
}

// ------------------------------------------------------------------ per-station evidence (section 1)

/// What one station reports for an epoch, already reduced to section 1's statistics.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct StationEvidence {
    /// Horizontal position error against the surveyed position, m.
    pub horiz_err_m: f64,
    /// The station's alarm threshold `H_s`, m (5 × the calibration 95th percentile, at least 10 m).
    pub h_s_m: f64,
    /// Median C/N0 minus the elevation template over satellites above 15°, dB.
    pub cn0_delta_db: f64,
    /// The existing AGC monitor alarmed.
    pub agc_alarm: bool,
    /// The existing jamming-indicator monitor alarmed.
    pub jam_alarm: bool,
    /// The existing loss-of-lock monitor alarmed.
    pub lock_alarm: bool,
    /// The existing clock monitor alarmed.
    pub clock_alarm: bool,
    /// OSNMA: `Some(false)` a failed tag, `Some(true)` verified, `None` unavailable (never "passed").
    pub osnma_ok: Option<bool>,
}

/// The C/N0 template threshold, dB.
pub const CN0_ALARM_DB: f64 = -6.0;

/// Section 1's mapping: a fix-domain alarm (position, clock, OSNMA) gives `Untrusted`; a
/// measurement-domain alarm only (C/N0 template, AGC, jamming indicator, loss of lock) `Degraded`.
pub fn station_state(e: &StationEvidence) -> StationState {
    let fix = e.horiz_err_m > e.h_s_m || e.clock_alarm || e.osnma_ok == Some(false);
    let meas = e.cn0_delta_db < CN0_ALARM_DB || e.agc_alarm || e.jam_alarm || e.lock_alarm;
    if fix {
        StationState::Untrusted
    } else if meas {
        StationState::Degraded
    } else {
        StationState::Nominal
    }
}

/// `H_s` from a calibration window of horizontal errors: 5 × their 95th percentile (linear
/// interpolation), at least 10 m.
pub fn h_s(calibration_horiz_m: &[f64]) -> f64 {
    let mut v: Vec<f64> = calibration_horiz_m
        .iter()
        .copied()
        .filter(|x| x.is_finite())
        .collect();
    if v.is_empty() {
        return 10.0;
    }
    v.sort_by(f64::total_cmp);
    let pos = (v.len() - 1) as f64 * 0.95;
    let lo = pos.floor() as usize;
    let hi = (lo + 1).min(v.len() - 1);
    let p95 = v[lo] + (v[hi] - v[lo]) * (pos - lo as f64);
    (5.0 * p95).max(10.0)
}

/// The timeline of a `kshana.area-stations/1` document as JSON Lines, one line per grid second
/// (`{"g":…,"state":…,"alert":…,"n":…,"n_d":…,"n_u":…,"stale":…}`): the bytes the oracle writes, and
/// the same on the command line, in Python and in WebAssembly. Each station's epochs must be finite
/// and in time order.
pub fn timeline_jsonl(stations_json: &str) -> Result<String, String> {
    let doc: Stations = serde_json::from_str(stations_json)
        .map_err(|e| crate::terr!("e-area-trust-stations", e = e))?;
    for s in &doc.stations {
        let ordered = s.epochs.iter().all(|(t, _)| t.is_finite())
            && s.epochs.windows(2).all(|w| w[0].0 <= w[1].0);
        if !ordered {
            return Err(crate::terr!("e-area-trust-epoch-order", id = s.id.as_str()));
        }
    }
    let mut out = String::new();
    for g in timeline(&doc.stations) {
        out.push_str(&serde_json::to_string(&g).map_err(|e| e.to_string())?);
        out.push('\n');
    }
    Ok(out)
}

/// `kshana area-trust <stations.json>`: the area timeline on standard output (JSON Lines).
#[cfg(not(target_arch = "wasm32"))]
pub fn run(args: &[String]) -> Result<(), String> {
    let path = match args {
        [p] if !p.starts_with("--") => p,
        _ => return Err(crate::t!("area-trust-usage")),
    };
    let text = std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))?;
    print!("{}", timeline_jsonl(&text)?);
    Ok(())
}

pub mod synth;
