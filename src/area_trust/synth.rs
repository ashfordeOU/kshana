// SPDX-License-Identifier: AGPL-3.0-only
//! A seeded multi-station replay with injected events (B5 data item 1), at the level of the
//! per-station evidence of section 1: horizontal position error, the C/N0 template statistic, and the
//! AGC, jamming, loss-of-lock, clock and OSNMA monitor outcomes. Each station's state follows from
//! [`super::station_state`], so the truth of every event (how many stations it puts in alarm at once)
//! is exact. Stations also drop out for a few seconds in the quiet time between events, so the stale
//! rule is exercised. Same seed, same replay.

use super::{h_s, station_state, Station, StationEvidence, StationState};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha20Rng;
use serde::Serialize;

/// The kinds of injected event.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum EventKind {
    /// C/N0 reduced by 3 to 20 dB.
    Cn0Drop,
    /// The AGC monitor alarms.
    AgcRise,
    /// The jamming-indicator monitor alarms.
    JamIndicator,
    /// The loss-of-lock monitor alarms.
    LossOfLock,
    /// The position is offset by 10 to 500 m.
    PositionOffset,
    /// The clock monitor alarms.
    ClockStep,
    /// OSNMA tags fail.
    OsnmaFail,
}

const KINDS: [EventKind; 7] = [
    EventKind::Cn0Drop,
    EventKind::AgcRise,
    EventKind::JamIndicator,
    EventKind::LossOfLock,
    EventKind::PositionOffset,
    EventKind::ClockStep,
    EventKind::OsnmaFail,
];

/// One injected event and its exact effect.
#[derive(Clone, Debug, Serialize)]
pub struct InjectedEvent {
    /// Kind.
    pub kind: EventKind,
    /// Onset, s (a whole second; the event covers grid seconds `onset_s .. end_s`).
    pub onset_s: f64,
    /// End, s (exclusive).
    pub end_s: f64,
    /// Its size (dB for a C/N0 drop, m for a position offset; 0 otherwise).
    pub size: f64,
    /// The stations it is applied to.
    pub stations: Vec<String>,
    /// The stations the per-station rule puts in alarm (degraded or worse) in any second of it.
    pub in_alarm: Vec<String>,
    /// Of those, the ones in `Untrusted` in any second of it.
    pub untrusted: Vec<String>,
    /// The most stations in alarm in one second.
    pub peak_in_alarm: usize,
    /// The most stations untrusted in one second.
    pub peak_untrusted: usize,
}

/// The replay.
#[derive(Clone, Debug, Serialize)]
pub struct Replay {
    /// The stations' epochs.
    pub stations: Vec<Station>,
    /// The events.
    pub events: Vec<InjectedEvent>,
    /// Number of stations (all live during every event).
    pub n_stations: usize,
}

/// Seconds of calibration before the first event.
const CAL_S: usize = 120;
/// Quiet margin around an event inside which no station drops out, s.
const MARGIN_S: f64 = 15.0;

/// Build a replay: `n_stations` stations at 1 Hz (epochs at `k + 0.25` s), `n_events` events in
/// sequence with quiet gaps of 25 to 60 s.
pub fn replay(seed: u64, n_stations: usize, n_events: usize) -> Replay {
    let mut r = ChaCha20Rng::seed_from_u64(seed);
    let ids: Vec<String> = (0..n_stations).map(|i| format!("S{i:02}")).collect();
    let sig_h: Vec<f64> = (0..n_stations).map(|_| r.gen_range(0.8..3.0)).collect();
    // Plan the events.
    let mut t = CAL_S as f64 + 30.0;
    let mut planned = Vec::new();
    for _ in 0..n_events {
        let kind = KINDS[r.gen_range(0..KINDS.len())];
        let dur = r.gen_range(20..60) as f64;
        // Sometimes a few stations, sometimes many.
        let m = if r.gen_bool(0.5) || n_stations < 2 {
            r.gen_range(1..=2.min(n_stations))
        } else {
            r.gen_range(2..=n_stations)
        };
        let mut pool: Vec<usize> = (0..n_stations).collect();
        let mut chosen = Vec::new();
        for _ in 0..m {
            chosen.push(pool.remove(r.gen_range(0..pool.len())));
        }
        chosen.sort_unstable();
        let size = match kind {
            EventKind::Cn0Drop => r.gen_range(3.0..20.0f64).round(),
            EventKind::PositionOffset => r.gen_range(10.0..500.0f64).round(),
            _ => 0.0,
        };
        planned.push((kind, t, t + dur, size, chosen));
        t += dur + r.gen_range(25..60) as f64;
    }
    let total = t as usize + 10;
    let quiet = |ts: f64| {
        planned
            .iter()
            .all(|(_, on, off, _, _)| ts < on - MARGIN_S || ts >= off + MARGIN_S)
    };
    // Per station and second: the state (None while dropped out).
    let mut grid: Vec<Vec<Option<StationState>>> = Vec::with_capacity(n_stations);
    for (si, &sig) in sig_h.iter().enumerate() {
        let mut errs = Vec::with_capacity(total);
        let mut cn0 = Vec::with_capacity(total);
        for _ in 0..total {
            let (a, b): (f64, f64) = (r.gen_range(-1.0..1.0), r.gen_range(-1.0..1.0));
            errs.push(sig * (a * a + b * b).sqrt());
            cn0.push(r.gen_range(-1.5..1.5));
        }
        // About one dropout of 2 to 12 s per 600 s, in quiet time only.
        let mut absent = vec![false; total];
        for _ in 0..total.div_ceil(600) {
            let start = r.gen_range(1..total - 13);
            let len = r.gen_range(2..=12);
            if (start..start + len).all(|k| quiet(k as f64)) {
                absent[start..start + len].fill(true);
            }
        }
        let hs = h_s(&errs[..CAL_S]);
        let mut row = Vec::with_capacity(total);
        for (k, (&err, &dc)) in errs.iter().zip(&cn0).enumerate() {
            let ts = k as f64;
            let mut e = StationEvidence {
                horiz_err_m: err,
                h_s_m: hs,
                cn0_delta_db: dc,
                agc_alarm: false,
                jam_alarm: false,
                lock_alarm: false,
                clock_alarm: false,
                osnma_ok: Some(true),
            };
            for (kind, on, off, size, chosen) in &planned {
                if !(chosen.contains(&si) && ts >= *on && ts < *off) {
                    continue;
                }
                match kind {
                    EventKind::Cn0Drop => e.cn0_delta_db -= size,
                    EventKind::AgcRise => e.agc_alarm = true,
                    EventKind::JamIndicator => e.jam_alarm = true,
                    EventKind::LossOfLock => e.lock_alarm = true,
                    EventKind::PositionOffset => e.horiz_err_m += size,
                    EventKind::ClockStep => e.clock_alarm = true,
                    EventKind::OsnmaFail => e.osnma_ok = Some(false),
                }
            }
            row.push((!absent[k]).then(|| station_state(&e)));
        }
        grid.push(row);
    }
    let stations = ids
        .iter()
        .zip(&grid)
        .map(|(id, row)| Station {
            id: id.clone(),
            epochs: row
                .iter()
                .enumerate()
                .filter_map(|(k, s)| s.map(|s| (k as f64 + 0.25, s)))
                .collect(),
        })
        .collect();
    let events = planned
        .into_iter()
        .map(|(kind, on, off, size, chosen)| {
            let (mut al, mut un) = (Vec::new(), Vec::new());
            let (mut peak_d, mut peak_u) = (0, 0);
            for k in on as usize..off as usize {
                let col: Vec<StationState> = grid
                    .iter()
                    .map(|row| row[k].unwrap_or(StationState::Nominal))
                    .collect();
                let d = col.iter().filter(|s| **s >= StationState::Degraded).count();
                let u = col
                    .iter()
                    .filter(|s| **s == StationState::Untrusted)
                    .count();
                peak_d = peak_d.max(d);
                peak_u = peak_u.max(u);
                for (si, s) in col.iter().enumerate() {
                    if *s >= StationState::Degraded && !al.contains(&si) {
                        al.push(si);
                    }
                    if *s == StationState::Untrusted && !un.contains(&si) {
                        un.push(si);
                    }
                }
            }
            al.sort_unstable();
            un.sort_unstable();
            let name = |v: Vec<usize>| v.into_iter().map(|i| ids[i].clone()).collect();
            InjectedEvent {
                kind,
                onset_s: on,
                end_s: off,
                size,
                stations: chosen.iter().map(|&i| ids[i].clone()).collect(),
                in_alarm: name(al),
                untrusted: name(un),
                peak_in_alarm: peak_d,
                peak_untrusted: peak_u,
            }
        })
        .collect();
    Replay {
        stations,
        events,
        n_stations,
    }
}
