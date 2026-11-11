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
//! Version 2 (`PREREGISTRATION-v2.md`, readings W1 to W11 in the same README) changes one clause:
//! `DEGRADED` if `n_D ≥ k` or `n_U ≥ m`, with `m = 2` for `N ≤ 6` and `m = 1` above. A stations
//! document selects it with `"area_rule": "v2"`; without the field the rule is version 1, with the
//! same bytes. [`AreaRule`] selects it on the other paths.
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

/// Which pre-registered area rule applies (readings W1 to W3).
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum AreaRule {
    /// Version 1: `DEGRADED` if `n_D ≥ k` or `n_U ≥ 1`.
    #[default]
    V1,
    /// Version 2: `DEGRADED` if `n_D ≥ k` or `n_U ≥ m`, `m = 2` for `N ≤ 6`, else 1.
    V2,
    /// Version 3 (X6): version 2's aggregation; v3 changes what feeds it ([`v3`]).
    V3,
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

/// The raw area state of one grid second from the live stations' states (version 1's rule).
pub fn raw_state(live: &[StationState]) -> (AreaState, usize, usize) {
    raw_state_with(live, AreaRule::V1)
}

/// The raw area state of one grid second under `rule`.
pub fn raw_state_with(live: &[StationState], rule: AreaRule) -> (AreaState, usize, usize) {
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
    // Untrusted stations that make the area DEGRADED: v1 one; v2 two for 6 or fewer stations (W1).
    let m = match rule {
        AreaRule::V2 | AreaRule::V3 if n <= 6 => 2,
        _ => 1,
    };
    let s = if n_u >= k {
        AreaState::Untrusted
    } else if n_d >= k || n_u >= m {
        AreaState::Degraded
    } else {
        AreaState::Trusted
    };
    (s, n_d, n_u)
}

/// The published state and the alert, second by second (hysteresis and alert rule of section 2).
#[derive(Clone, Debug, Default)]
struct Publisher {
    /// The last [`HOLD_S`] raw states, this second's included.
    raws: std::collections::VecDeque<AreaState>,
    published: Option<AreaState>,
}

impl Publisher {
    fn step(&mut self, raw: AreaState) -> (AreaState, bool) {
        if self.raws.len() == HOLD_S {
            self.raws.pop_front();
        }
        self.raws.push_back(raw);
        let before = self.published;
        let next = match before {
            None => raw,
            Some(p) if raw == AreaState::Unknown || p == AreaState::Unknown => raw,
            Some(p) => match (raw.rank(), p.rank()) {
                (Some(r), Some(q)) if r > q => raw,
                (Some(r), Some(q)) if r < q => {
                    let all_better = self.raws.len() == HOLD_S
                        && self.raws.iter().all(|w| w.rank().is_some_and(|x| x < q));
                    if all_better {
                        *self
                            .raws
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
        self.published = Some(next);
        let alert = match before {
            None => false,
            Some(p) => {
                next.rank().is_some_and(|r| r >= 1)
                    && (p == AreaState::Unknown || next.rank() > p.rank())
            }
        };
        (next, alert)
    }
}

/// One grid second from the stations' held states.
fn second(
    g: i64,
    held: &[Option<(StationState, i64)>],
    publisher: &mut Publisher,
    rule: AreaRule,
) -> AreaSecond {
    let mut live = Vec::with_capacity(held.len());
    let mut stale = 0;
    for h in held {
        match h {
            Some((st, last)) if g - last < STALE_AFTER_S => live.push(*st),
            _ => stale += 1,
        }
    }
    let (raw, n_d, n_u) = raw_state_with(&live, rule);
    let (state, alert) = publisher.step(raw);
    AreaSecond {
        g,
        state,
        alert,
        n: live.len(),
        n_d,
        n_u,
        stale,
    }
}

/// The area timeline over every grid second from the first epoch to the last (version 1's rule).
pub fn timeline(stations: &[Station]) -> Vec<AreaSecond> {
    timeline_with(stations, AreaRule::V1)
}

/// The area timeline under `rule`.
pub fn timeline_with(stations: &[Station], rule: AreaRule) -> Vec<AreaSecond> {
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
    // Per station: a cursor over its epochs, and the state it holds with the second it last reported.
    let mut cursor = vec![0usize; stations.len()];
    let mut held: Vec<Option<(StationState, i64)>> = vec![None; stations.len()];
    let mut out = Vec::with_capacity((hi - lo + 1) as usize);
    let mut publisher = Publisher::default();
    for g in lo..=hi {
        for (i, s) in stations.iter().enumerate() {
            while cursor[i] < s.epochs.len() && (s.epochs[cursor[i]].0.floor() as i64) <= g {
                let (t, st) = s.epochs[cursor[i]];
                held[i] = Some((st, t.floor() as i64));
                cursor[i] += 1;
            }
        }
        out.push(second(g, &held, &mut publisher, rule));
    }
    out
}

/// The area rule on a live stream: station epochs arrive in time order per station, the stations
/// interleaved, and each grid second is decided as soon as it can be. A second closes when every
/// station has reported in it, or when an epoch of a later second arrives (the seconds between are
/// closed in order). The closed seconds are exactly [`timeline`]'s over the same epochs, provided no
/// epoch arrives for a second that has already closed; such an epoch is counted in `late` and left out.
#[derive(Clone, Debug)]
pub struct AreaLive {
    held: Vec<Option<(StationState, i64)>>,
    reported: Vec<bool>,
    open: Option<i64>,
    publisher: Publisher,
    rule: AreaRule,
    /// Epochs that arrived for a second already closed (left out).
    pub late: u64,
}

impl AreaLive {
    /// A live area of `n` stations, numbered `0..n`, under version 1's rule.
    pub fn new(n: usize) -> AreaLive {
        AreaLive::with_rule(n, AreaRule::V1)
    }

    /// A live area of `n` stations under `rule` (W3: the live path takes the rule explicitly).
    pub fn with_rule(n: usize, rule: AreaRule) -> AreaLive {
        AreaLive {
            held: vec![None; n],
            reported: vec![false; n],
            open: None,
            publisher: Publisher::default(),
            rule,
            late: 0,
        }
    }

    /// Take station `i`'s epoch at `t_s`; returns the seconds this closes, in order.
    pub fn push(&mut self, i: usize, t_s: f64, state: StationState) -> Vec<AreaSecond> {
        let g = t_s.floor() as i64;
        let mut out = Vec::new();
        if i >= self.held.len() {
            return out;
        }
        match self.open {
            Some(o) if g < o => {
                self.late += 1;
                return out;
            }
            Some(o) if g > o => {
                out.push(self.close(o));
                for gap in o + 1..g {
                    out.push(second(gap, &self.held, &mut self.publisher, self.rule));
                }
            }
            _ => {}
        }
        self.open = Some(g);
        self.held[i] = Some((state, g));
        self.reported[i] = true;
        if self.reported.iter().all(|r| *r) {
            out.push(self.close(g));
            self.open = Some(g + 1);
        }
        out
    }

    /// Close the open second, if one has an epoch in it.
    pub fn flush(&mut self) -> Vec<AreaSecond> {
        match self.open {
            Some(o) if self.reported.iter().any(|r| *r) => vec![self.close(o)],
            _ => Vec::new(),
        }
    }

    fn close(&mut self, g: i64) -> AreaSecond {
        self.reported.iter_mut().for_each(|r| *r = false);
        second(g, &self.held, &mut self.publisher, self.rule)
    }
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
/// and in time order. `"area_rule": "v2"` selects version 2's rule (W3), `"v3"` version 3's, which
/// aggregates as version 2 (X6); without it, version 1. A `kshana.area-measurements/1` document is
/// run through version 3's satellite-fault screen ([`v3::measurements_jsonl`]).
pub fn timeline_jsonl(stations_json: &str) -> Result<String, String> {
    if v3::is_measurements(stations_json) {
        return v3::measurements_jsonl(stations_json, false);
    }
    #[derive(Deserialize)]
    struct Rule {
        #[serde(default)]
        area_rule: AreaRule,
    }
    let doc: Stations = serde_json::from_str(stations_json)
        .map_err(|e| crate::terr!("e-area-trust-stations", e = e))?;
    let rule = serde_json::from_str::<Rule>(stations_json)
        .map_err(|e| crate::terr!("e-area-trust-stations", e = e))?
        .area_rule;
    for s in &doc.stations {
        let ordered = s.epochs.iter().all(|(t, _)| t.is_finite())
            && s.epochs.windows(2).all(|w| w[0].0 <= w[1].0);
        if !ordered {
            return Err(crate::terr!("e-area-trust-epoch-order", id = s.id.as_str()));
        }
    }
    let mut out = String::new();
    for g in timeline_with(&doc.stations, rule) {
        out.push_str(&serde_json::to_string(&g).map_err(|e| e.to_string())?);
        out.push('\n');
    }
    Ok(out)
}

/// `kshana area-trust [--detail] <document>`: the area timeline on standard output (JSON Lines).
/// `--detail` (a measurements document only) writes each station's horizontal error before and after
/// the satellite-fault screen instead.
#[cfg(not(target_arch = "wasm32"))]
pub fn run(args: &[String]) -> Result<(), String> {
    let (detail, path) = match args {
        [p] if !p.starts_with("--") => (false, p),
        [d, p] if d == "--detail" && !p.starts_with("--") => (true, p),
        _ => return Err(crate::t!("area-trust-usage")),
    };
    let text = std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))?;
    if detail {
        print!("{}", v3::measurements_jsonl(&text, true)?);
    } else {
        print!("{}", timeline_jsonl(&text)?);
    }
    Ok(())
}

pub mod synth;
pub mod v3;

#[cfg(test)]
mod tests {
    use super::*;
    use StationState::{Degraded as D, Nominal as N, Untrusted as U};

    #[test]
    fn v2_one_untrusted_station_alone_moves_a_small_area_no_more() {
        // W1, W2: with 6 or fewer stations one Untrusted station alone moves nothing in v2.
        assert_eq!(
            raw_state_with(&[U, N, N, N], AreaRule::V1).0,
            AreaState::Degraded
        );
        assert_eq!(
            raw_state_with(&[U, N, N, N], AreaRule::V2).0,
            AreaState::Trusted
        );
        assert_eq!(
            raw_state_with(&[U, N, N, N, N, N], AreaRule::V2).0,
            AreaState::Trusted
        );
        // Another station in alarm makes n_D >= k = 2, and two Untrusted meet the UNTRUSTED clause.
        assert_eq!(
            raw_state_with(&[U, D, N, N], AreaRule::V2).0,
            AreaState::Degraded
        );
        assert_eq!(
            raw_state_with(&[U, U, N, N], AreaRule::V2).0,
            AreaState::Untrusted
        );
        // Above 6 stations m = 1: v2 is v1.
        let seven = [U, N, N, N, N, N, N];
        assert_eq!(raw_state_with(&seven, AreaRule::V2).0, AreaState::Degraded);
        assert_eq!(
            raw_state_with(&seven, AreaRule::V2),
            raw_state_with(&seven, AreaRule::V1)
        );
        assert_eq!(raw_state_with(&[U], AreaRule::V2).0, AreaState::Unknown);
        assert_eq!(
            raw_state(&[U, N, N, N]),
            raw_state_with(&[U, N, N, N], AreaRule::V1)
        );
    }

    #[test]
    fn the_document_field_selects_the_rule_and_v1_keeps_its_bytes() {
        let doc = |rule: &str| {
            format!(
                r#"{{{rule}"stations":[{{"id":"a","epochs":[[0,"nominal"],[1,"untrusted"],[2,"untrusted"]]}},
                {{"id":"b","epochs":[[0,"nominal"],[1,"nominal"],[2,"nominal"]]}},
                {{"id":"c","epochs":[[0,"nominal"],[1,"nominal"],[2,"nominal"]]}}]}}"#
            )
        };
        let v1 = timeline_jsonl(&doc("")).expect("v1");
        assert_eq!(
            timeline_jsonl(&doc(r#""area_rule":"v1","#)).expect("v1"),
            v1
        );
        assert!(v1.contains(r#""state":"DEGRADED","alert":true"#));
        let v2 = timeline_jsonl(&doc(r#""area_rule":"v2","#)).expect("v2");
        assert!(!v2.contains("DEGRADED") && v2.contains(r#""state":"TRUSTED""#));
        // X6: a stations document with "v3" is aggregated as v2.
        assert_eq!(
            timeline_jsonl(&doc(r#""area_rule":"v3","#)).expect("v3"),
            v2
        );
        assert!(timeline_jsonl(&doc(r#""area_rule":"v4","#)).is_err());
    }

    #[test]
    fn the_live_path_takes_the_rule() {
        let mut v1 = AreaLive::new(3);
        let mut v2 = AreaLive::with_rule(3, AreaRule::V2);
        let mut last = (Vec::new(), Vec::new());
        for (i, st) in [U, N, N].into_iter().enumerate() {
            last.0 = v1.push(i, 0.0, st);
            last.1 = v2.push(i, 0.0, st);
        }
        assert_eq!(last.0[0].state, AreaState::Degraded);
        assert_eq!(last.1[0].state, AreaState::Trusted);
    }
}
