// SPDX-License-Identifier: AGPL-3.0-only
//! Correction-stream liveness monitor and per-mountpoint quality scorecard.
//!
//! A [`LivenessMonitor`] is fed the bytes of an RTCM 3 stream as they arrive, with the time they
//! arrived, and is ticked while nothing arrives. It raises an alarm when no frame with a valid
//! CRC-24Q has arrived for `stale_after_s` on a connection that is still open (the case a client
//! that only watches the socket misses), when a message type that was arriving regularly stops
//! (`gap_factor` times its median interval, while other frames keep arriving), and when the stream
//! comes back. At the end it gives a [`Scorecard`]: availability, latency of the MSM observation epochs against the receiving
//! clock, completeness of the observation epochs, CRC failures, the station message and its
//! interval, the bit rate (against a telemetry link's capacity when one is given) and a 0-100
//! score.
//!
//! The score's weights are this module's convention, not a published standard: MODELLED.
//! Latency is the receiving computer's clock minus the epoch time in the MSM header, so it
//! includes that clock's own error; keep the clock disciplined (NTP) before reading it.

use crate::receiver_trust::machines::rtcm3::crc24q;
use crate::receiver_trust::machines::rtcm3_obs::{self, StationArp};
use serde::Serialize;
use std::collections::BTreeMap;

/// Evidence label of every scorecard.
pub const LABEL: &str = "MODELLED";

/// Seconds in a GPS week, as milliseconds.
const WEEK_MS: f64 = 604_800_000.0;
/// Milliseconds in a day.
const DAY_MS: f64 = 86_400_000.0;
/// Seconds from 1970-01-01 to the GPS epoch 1980-01-06.
const GPS_EPOCH_UNIX_S: f64 = 315_964_800.0;

/// Thresholds of the monitor.
#[derive(Clone, Debug, Serialize)]
pub struct MonitorConfig {
    /// Seconds without a valid frame before the stream is called stale (default 3).
    pub stale_after_s: f64,
    /// A message type that has arrived at least three times is called missing after this many
    /// of its median intervals without it (default 3).
    pub gap_factor: f64,
    /// Capacity of the link the corrections will travel over (bits per second), if any.
    pub link_bps: Option<f64>,
}

impl Default for MonitorConfig {
    fn default() -> Self {
        Self {
            stale_after_s: 3.0,
            gap_factor: 3.0,
            link_bps: None,
        }
    }
}

/// One alarm or recovery.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Alarm {
    /// Seconds since the monitor started.
    pub t_s: f64,
    /// `stale`, `recovered`, `message-gap`, `message-resumed`, `closed` or `link-over-budget`.
    pub kind: &'static str,
    /// The message type, for `message-gap` and `message-resumed`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub message: Option<u16>,
    /// Seconds since the last valid frame (or of that message type).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub silent_s: Option<f64>,
}

#[derive(Clone, Debug, Default)]
struct MsgState {
    count: u64,
    last_t: Option<f64>,
    intervals: Vec<f64>,
    gap_open: bool,
}

/// Statistics of one message type.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct MessageStat {
    /// RTCM message number.
    pub message: u16,
    /// Frames received.
    pub count: u64,
    /// Median arrival interval (s), with at least two frames.
    pub median_interval_s: Option<f64>,
    /// For MSM observation messages: distinct epochs received.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub epochs: Option<u64>,
    /// For MSM observation messages: received epochs over the epochs the median epoch interval
    /// implies between the first and the last (0 to 1).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub completeness: Option<f64>,
}

/// Summary of a distribution (ms).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LatencyStat {
    /// Samples (one per MSM epoch).
    pub n: usize,
    /// Median, ms.
    pub median_ms: f64,
    /// 95th percentile, ms.
    pub p95_ms: f64,
    /// Largest, ms.
    pub max_ms: f64,
}

/// The per-mountpoint scorecard.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Scorecard {
    /// Always `MODELLED`.
    pub label: &'static str,
    /// The thresholds used.
    pub stale_after_s: f64,
    /// Length of the run (s).
    pub duration_s: f64,
    /// Bytes received.
    pub bytes: u64,
    /// Frames with a valid CRC-24Q.
    pub frames: u64,
    /// Frames whose CRC did not check.
    pub bad_crc: u64,
    /// Fraction of the run that was not stale (0 to 1).
    pub availability: f64,
    /// Times the stream went stale.
    pub stale_events: u64,
    /// Longest time without a valid frame (s), including a silence still open at the end.
    pub longest_silence_s: f64,
    /// Latency of the MSM epochs against the receiving clock.
    pub latency: Option<LatencyStat>,
    /// Lowest completeness over the MSM message types (0 to 1).
    pub completeness: Option<f64>,
    /// Per message type.
    pub messages: Vec<MessageStat>,
    /// The last 1005/1006 station message.
    pub station: Option<StationArp>,
    /// Mean bit rate over the run (bit/s).
    pub mean_bps: f64,
    /// Largest bit rate over any whole second (bit/s).
    pub peak_bps: f64,
    /// The link capacity checked against, if given.
    pub link_bps: Option<f64>,
    /// `link_bps` minus `peak_bps`, if a link was given (negative: the link cannot carry it).
    pub link_margin_bps: Option<f64>,
    /// The 0-100 score (see [`score`]).
    pub score: f64,
    /// Every alarm, in order.
    pub alarms: Vec<Alarm>,
}

/// The monitor.
#[derive(Clone, Debug)]
pub struct LivenessMonitor {
    cfg: MonitorConfig,
    buf: Vec<u8>,
    bytes: u64,
    frames: u64,
    bad_crc: u64,
    last_frame_t: f64,
    stale_since: Option<f64>,
    stale_total_s: f64,
    stale_events: u64,
    longest_silence_s: f64,
    msgs: BTreeMap<u16, MsgState>,
    epochs: BTreeMap<u16, Vec<f64>>,
    latencies_ms: Vec<f64>,
    station: Option<StationArp>,
    per_second: BTreeMap<i64, u64>,
    alarms: Vec<Alarm>,
    closed: bool,
}

/// GPS milliseconds of week, BeiDou milliseconds of week and GLONASS milliseconds of the Moscow
/// day for a UTC instant given as seconds since 1970-01-01.
pub fn receive_clock(unix_s: f64) -> ReceiveClock {
    let day = unix_s.div_euclid(86_400.0) as i64;
    let leap = crate::gnss_time::tai_minus_utc_on_day(day).unwrap_or(37) - 19;
    let gps_s = unix_s - GPS_EPOCH_UNIX_S + leap as f64;
    let gps_ms = gps_s.rem_euclid(604_800.0) * 1e3;
    ReceiveClock {
        gps_tow_ms: gps_ms,
        bdt_tow_ms: (gps_ms - 14_000.0).rem_euclid(WEEK_MS),
        glonass_ms_of_day: ((unix_s + 3.0 * 3600.0).rem_euclid(86_400.0)) * 1e3,
    }
}

/// The receiving clock in the time scales the MSM epoch fields use.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ReceiveClock {
    /// GPS time of week, ms (GPS, Galileo, QZSS, SBAS and NavIC MSM epochs).
    pub gps_tow_ms: f64,
    /// BeiDou time of week, ms.
    pub bdt_tow_ms: f64,
    /// GLONASS time (UTC(SU) + 3 h) of day, ms.
    pub glonass_ms_of_day: f64,
}

/// `a - b` wrapped into half a period either side of zero.
fn wrapped(a: f64, b: f64, period: f64) -> f64 {
    let d = (a - b).rem_euclid(period);
    if d > period / 2.0 {
        d - period
    } else {
        d
    }
}

fn median(v: &[f64]) -> Option<f64> {
    quantile(v, 0.5)
}

fn quantile(v: &[f64], q: f64) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    let mut s = v.to_vec();
    s.sort_by(f64::total_cmp);
    let i = ((s.len() - 1) as f64 * q).round() as usize;
    Some(s[i.min(s.len() - 1)])
}

fn is_msm(msg: u16) -> bool {
    (1071..=1137).contains(&msg) && (1..=7).contains(&(msg % 10))
}

impl LivenessMonitor {
    /// A monitor started at `t = 0`.
    pub fn new(cfg: MonitorConfig) -> Self {
        Self {
            cfg,
            buf: Vec::new(),
            bytes: 0,
            frames: 0,
            bad_crc: 0,
            last_frame_t: 0.0,
            stale_since: None,
            stale_total_s: 0.0,
            stale_events: 0,
            longest_silence_s: 0.0,
            msgs: BTreeMap::new(),
            epochs: BTreeMap::new(),
            latencies_ms: Vec::new(),
            station: None,
            per_second: BTreeMap::new(),
            alarms: Vec::new(),
            closed: false,
        }
    }

    /// Take bytes that arrived at `t` (s since start); `clock` is the receiving clock at that
    /// moment, for latency (none: no latency is computed). Returns the alarms this raised.
    pub fn push(&mut self, t: f64, bytes: &[u8], clock: Option<ReceiveClock>) -> Vec<Alarm> {
        let before = self.alarms.len();
        self.bytes += bytes.len() as u64;
        *self.per_second.entry(t.floor() as i64).or_default() += bytes.len() as u64;
        self.buf.extend_from_slice(bytes);
        let mut i = 0;
        let mut got_frame = false;
        while i + 6 <= self.buf.len() {
            if self.buf[i] != 0xD3 || self.buf[i + 1] & 0xFC != 0 {
                i += 1;
                continue;
            }
            let len = (usize::from(self.buf[i + 1] & 3) << 8) | usize::from(self.buf[i + 2]);
            let end = i + 3 + len + 3;
            if end > self.buf.len() {
                break;
            }
            let want = (u32::from(self.buf[end - 3]) << 16)
                | (u32::from(self.buf[end - 2]) << 8)
                | u32::from(self.buf[end - 1]);
            if crc24q(&self.buf[i..end - 3]) != want {
                self.bad_crc += 1;
                i += 1;
                continue;
            }
            let frame = self.buf[i..end].to_vec();
            i = end;
            if len < 2 {
                continue;
            }
            if !got_frame {
                got_frame = true;
                self.on_frame_time(t);
            }
            self.frames += 1;
            let msg = (u16::from(frame[3]) << 4) | (u16::from(frame[4]) >> 4);
            self.on_message(t, msg, &frame, clock);
        }
        self.buf.drain(..i);
        // Keep at most one maximum-length frame of unconsumed bytes.
        if self.buf.len() > 1029 {
            let cut = self.buf.len() - 1029;
            self.buf.drain(..cut);
        }
        self.check(t);
        self.alarms[before..].to_vec()
    }

    fn on_frame_time(&mut self, t: f64) {
        let silent = t - self.last_frame_t;
        self.longest_silence_s = self.longest_silence_s.max(silent);
        if let Some(s) = self.stale_since.take() {
            self.stale_total_s += t - s;
            self.alarms.push(Alarm {
                t_s: t,
                kind: "recovered",
                message: None,
                silent_s: Some(silent),
            });
        }
        self.last_frame_t = t;
    }

    fn on_message(&mut self, t: f64, msg: u16, frame: &[u8], clock: Option<ReceiveClock>) {
        let st = self.msgs.entry(msg).or_default();
        if let Some(last) = st.last_t {
            if t > last {
                st.intervals.push(t - last);
                if st.intervals.len() > 512 {
                    st.intervals.remove(0);
                }
            }
        }
        st.count += 1;
        st.last_t = Some(t);
        if st.gap_open {
            st.gap_open = false;
            self.alarms.push(Alarm {
                t_s: t,
                kind: "message-resumed",
                message: Some(msg),
                silent_s: None,
            });
        }
        if msg == 1005 || msg == 1006 || is_msm(msg) {
            let d = rtcm3_obs::decode(frame);
            if let Some(s) = d.stations.into_iter().last() {
                self.station = Some(s);
            }
            for m in d.msm {
                let ep =
                    f64::from(m.epoch_ms) + m.glonass_day.map_or(0.0, |d| f64::from(d) * DAY_MS);
                let e = self.epochs.entry(msg).or_default();
                if e.last() != Some(&ep) {
                    e.push(ep);
                    if let Some(c) = clock {
                        let lat = match msg / 10 {
                            108 => wrapped(c.glonass_ms_of_day, f64::from(m.epoch_ms), DAY_MS),
                            112 => wrapped(c.bdt_tow_ms, f64::from(m.epoch_ms), WEEK_MS),
                            _ => wrapped(c.gps_tow_ms, f64::from(m.epoch_ms), WEEK_MS),
                        };
                        self.latencies_ms.push(lat);
                    }
                }
            }
        }
    }

    /// Evaluate the alarms at `t` with nothing new arrived. Returns the alarms this raised.
    pub fn tick(&mut self, t: f64) -> Vec<Alarm> {
        let before = self.alarms.len();
        self.check(t);
        self.alarms[before..].to_vec()
    }

    fn check(&mut self, t: f64) {
        if self.closed {
            return;
        }
        let silent = t - self.last_frame_t;
        if self.stale_since.is_none() && silent >= self.cfg.stale_after_s {
            self.stale_since = Some(t);
            self.stale_events += 1;
            self.alarms.push(Alarm {
                t_s: t,
                kind: "stale",
                message: None,
                silent_s: Some(silent),
            });
        }
        if self.stale_since.is_some() {
            return; // the whole stream is silent: no per-message alarms on top
        }
        let factor = self.cfg.gap_factor;
        let mut raised = Vec::new();
        for (msg, st) in &mut self.msgs {
            if st.gap_open || st.count < 3 {
                continue;
            }
            let (Some(m), Some(last)) = (median(&st.intervals), st.last_t) else {
                continue;
            };
            // only when other frames kept arriving: a whole stream going quiet is `stale`
            if m > 0.0 && t - last > factor * m && self.last_frame_t > last {
                st.gap_open = true;
                raised.push(Alarm {
                    t_s: t,
                    kind: "message-gap",
                    message: Some(*msg),
                    silent_s: Some(t - last),
                });
            }
        }
        self.alarms.extend(raised);
    }

    /// The connection closed at `t`.
    pub fn close(&mut self, t: f64) -> Vec<Alarm> {
        if self.closed {
            return Vec::new();
        }
        let a = Alarm {
            t_s: t,
            kind: "closed",
            message: None,
            silent_s: Some(t - self.last_frame_t),
        };
        self.alarms.push(a.clone());
        self.closed = true;
        vec![a]
    }

    /// The scorecard at `t` (the end of the run).
    pub fn scorecard(&self, t: f64) -> Scorecard {
        let duration = t.max(1e-9);
        let open_silence = t - self.last_frame_t;
        let stale_total = self.stale_total_s + self.stale_since.map_or(0.0, |s| (t - s).max(0.0));
        let availability = (1.0 - stale_total / duration).clamp(0.0, 1.0);
        let latency = if self.latencies_ms.is_empty() {
            None
        } else {
            Some(LatencyStat {
                n: self.latencies_ms.len(),
                median_ms: median(&self.latencies_ms).unwrap_or(0.0),
                p95_ms: quantile(&self.latencies_ms, 0.95).unwrap_or(0.0),
                max_ms: self
                    .latencies_ms
                    .iter()
                    .copied()
                    .fold(f64::NEG_INFINITY, f64::max),
            })
        };
        let mut messages = Vec::new();
        let mut completeness: Option<f64> = None;
        for (msg, st) in &self.msgs {
            let (epochs, comp) = match self.epochs.get(msg) {
                Some(e) if e.len() >= 2 => {
                    let mut d: Vec<f64> = e
                        .windows(2)
                        .map(|w| w[1] - w[0])
                        .filter(|x| *x > 0.0)
                        .collect();
                    d.sort_by(f64::total_cmp);
                    let step = median(&d).unwrap_or(0.0);
                    let span = e.last().unwrap_or(&0.0) - e.first().unwrap_or(&0.0);
                    let c = if step > 0.0 && span > 0.0 {
                        (e.len() as f64 / (span / step + 1.0).round()).min(1.0)
                    } else {
                        1.0
                    };
                    completeness = Some(completeness.map_or(c, |x| x.min(c)));
                    (Some(e.len() as u64), Some(c))
                }
                Some(e) => (Some(e.len() as u64), None),
                None => (None, None),
            };
            messages.push(MessageStat {
                message: *msg,
                count: st.count,
                median_interval_s: median(&st.intervals),
                epochs,
                completeness: comp,
            });
        }
        let mean_bps = self.bytes as f64 * 8.0 / duration;
        let peak_bps = self
            .per_second
            .values()
            .map(|b| *b as f64 * 8.0)
            .fold(0.0, f64::max);
        let mut card = Scorecard {
            label: LABEL,
            stale_after_s: self.cfg.stale_after_s,
            duration_s: t,
            bytes: self.bytes,
            frames: self.frames,
            bad_crc: self.bad_crc,
            availability,
            stale_events: self.stale_events,
            longest_silence_s: self.longest_silence_s.max(open_silence),
            latency,
            completeness,
            messages,
            station: self.station.clone(),
            mean_bps,
            peak_bps,
            link_bps: self.cfg.link_bps,
            link_margin_bps: self.cfg.link_bps.map(|l| l - peak_bps),
            score: 0.0,
            alarms: self.alarms.clone(),
        };
        if card.link_margin_bps.is_some_and(|m| m < 0.0) {
            card.alarms.push(Alarm {
                t_s: t,
                kind: "link-over-budget",
                message: None,
                silent_s: None,
            });
        }
        card.score = score(&card);
        card
    }
}

/// The 0-100 score: 40 for availability, 20 for latency (full at a median of 1 s or less, none
/// at 5 s or more; full when no MSM epoch gave a latency), 20 for completeness (full when there
/// is no MSM), 10 for intact frames (none at 10 % or more CRC failures) and 10 for a station
/// message (1005 or 1006). A convention of this module, MODELLED; the parts are in the card.
pub fn score(c: &Scorecard) -> f64 {
    let lat = c.latency.as_ref().map_or(1.0, |l| {
        (1.0 - (l.median_ms.abs() - 1000.0) / 4000.0).clamp(0.0, 1.0)
    });
    let comp = c.completeness.unwrap_or(1.0);
    let total = c.frames + c.bad_crc;
    let crc = if total == 0 {
        0.0
    } else {
        (1.0 - (c.bad_crc as f64 / total as f64) * 10.0).clamp(0.0, 1.0)
    };
    let station = if c.station.is_some() { 1.0 } else { 0.0 };
    let s = 40.0 * c.availability + 20.0 * lat + 20.0 * comp + 10.0 * crc + 10.0 * station;
    if c.frames == 0 {
        0.0
    } else {
        (s * 10.0).round() / 10.0
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::receiver_trust::machines::rtcm3_obs::{encode_station, frame};

    fn station_frame() -> Vec<u8> {
        let s = StationArp {
            message: 1005,
            station_id: 7,
            itrf_year: 0,
            gps: true,
            glonass: false,
            galileo: true,
            non_physical: false,
            ecef_m: [3_100_000.0, 1_400_000.0, 5_450_000.0],
            antenna_height_m: None,
        };
        frame(&encode_station(&s)).unwrap()
    }

    #[test]
    fn a_silent_open_stream_alarms_once_and_recovers() {
        let mut m = LivenessMonitor::new(MonitorConfig::default());
        let f = station_frame();
        for k in 0..10 {
            assert!(m.push(f64::from(k) * 0.5, &f, None).is_empty());
        }
        // last frame at 4.5 s; junk bytes do not count as a frame
        assert!(m.push(5.0, &[0x00, 0x11, 0x22], None).is_empty());
        assert!(m.tick(7.0).is_empty());
        let a = m.tick(7.6);
        assert_eq!(a.len(), 1);
        assert_eq!(a[0].kind, "stale");
        assert!(a[0].silent_s.unwrap() >= 3.0 && a[0].t_s - 4.5 <= 5.0);
        assert!(m.tick(9.0).is_empty(), "one alarm per silence");
        let r = m.push(10.0, &f, None);
        assert_eq!(r[0].kind, "recovered");
        let c = m.scorecard(10.0);
        assert_eq!(c.stale_events, 1);
        assert!((c.availability - (1.0 - 2.4 / 10.0)).abs() < 1e-9);
        assert!((c.longest_silence_s - 5.5).abs() < 1e-9);
        assert!(c.station.is_some());
    }

    #[test]
    fn a_message_type_that_stops_raises_a_gap() {
        let mut m = LivenessMonitor::new(MonitorConfig::default());
        let f = station_frame();
        // a frame of another type: 1033 with a short body
        let mut p = vec![(1033u16 >> 4) as u8, ((1033u16 & 0xF) << 4) as u8];
        p.extend([0u8; 6]);
        let other = frame(&p).unwrap();
        for k in 0..10 {
            m.push(f64::from(k), &f, None);
            m.push(f64::from(k) + 0.1, &other, None);
        }
        for k in 10..20 {
            let a = m.push(f64::from(k) + 0.1, &other, None);
            if k == 11 {
                assert!(a.is_empty());
            }
            if k == 12 {
                assert_eq!(a.len(), 1);
                assert_eq!(a[0].kind, "message-gap");
                assert_eq!(a[0].message, Some(1005));
            }
        }
        let back = m.push(20.5, &f, None);
        assert_eq!(back[0].kind, "message-resumed");
    }

    #[test]
    fn the_receive_clock_follows_gps_time() {
        // 2026-01-01T00:00:00Z: GPS week 2399 begins 2025-12-28; Thursday 00:00 UTC is
        // 4 days + 18 s into the week.
        let unix = 1_767_225_600.0;
        let c = receive_clock(unix);
        assert!((c.gps_tow_ms - (4.0 * 86_400.0 + 18.0) * 1e3).abs() < 1e-3);
        assert!((c.bdt_tow_ms - (4.0 * 86_400.0 + 4.0) * 1e3).abs() < 1e-3);
        assert!((c.glonass_ms_of_day - 3.0 * 3600.0 * 1e3).abs() < 1e-3);
        assert!((wrapped(1000.0, WEEK_MS - 500.0, WEEK_MS) - 1500.0).abs() < 1e-9);
    }

    #[test]
    fn link_capacity_below_the_peak_is_reported() {
        let mut m = LivenessMonitor::new(MonitorConfig {
            link_bps: Some(100.0),
            ..MonitorConfig::default()
        });
        let f = station_frame();
        m.push(0.2, &f, None);
        m.push(0.4, &f, None);
        let c = m.scorecard(1.0);
        assert!(c.peak_bps > 100.0);
        assert!(c.link_margin_bps.unwrap() < 0.0);
        assert!(c.alarms.iter().any(|a| a.kind == "link-over-budget"));
    }
}
