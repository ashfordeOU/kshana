// SPDX-License-Identifier: AGPL-3.0-only
//! Live trust scoring of an NMEA 0183 stream, and the optional gate.
//!
//! [`LiveEngine`] is the whole of live mode without any input or output: it is given lines
//! as they arrive (with their arrival time on a monotonic clock) and returns, as epochs
//! complete, the trust report of each, the `$PKSHT` sentence, and the lines to forward. The
//! binary reads stdin, a file being appended, a TCP stream or UDP datagrams and writes what
//! this returns.
//!
//! **Same decisions as a file.** An epoch is scored by the monitors of [`super::monitors`]
//! run over the calibration epochs and the most recent seconds of the stream, which is all
//! a causal monitor can see, so a live stream and the same text read as a log give the
//! same score at every epoch (the tests check it).
//!
//! **Gate.** With the gate on, a cycle of sentences is held until its epoch is scored (the
//! cycle ends at the next timed sentence, or after the stream has been quiet for
//! [`LiveCfg::idle_flush_s`]); it is then forwarded unchanged, or, while the epoch is
//! untrusted, with the fix marked invalid. The gate adds up to one cycle of latency and
//! changes nothing else. It is advisory software and not type-approved navigation
//! equipment; see `docs/MARITIME-TRUST.md`.

use std::collections::{BTreeMap, VecDeque};

use serde::{Deserialize, Serialize};

use super::ingest::NmeaFeed;
use super::maritime::REWIND_RATIO;
use super::monitors::{run_monitors, Monitor, TrustState};
use super::scenario::ReceiverTrustScenario;
use super::score::score_from_ratios;
use super::score::Deduction;
use super::{LogEpoch, Timeline, ADVISORY};

/// The `[live]` table of a scenario.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct LiveCfg {
    /// A cycle of sentences is complete when the next timed sentence arrives; when the stream
    /// goes quiet for this long, s, the cycle in progress is completed as it stands (a stall).
    /// Default 1.5: longer than the gap between consecutive timed sentences of a 1 Hz receiver
    /// with jitter, and than the delay of an instrument whose sentences are not synchronous
    /// with the receiver's (a gyro a few tenths of a second behind), so a healthy cycle is
    /// never cut short. Set it above the longest gap between timed sentences your receiver
    /// makes; a stall flush forwards what has arrived and scores the epoch with it.
    pub idle_flush_s: f64,
    /// Gate: after withholding the fix, it is released only after the epochs have been out
    /// of the untrusted band for this long, s. Default 30: so a score that touches the band
    /// edge does not make the fix flicker valid and invalid on the bridge.
    pub gate_release_s: f64,
}

impl Default for LiveCfg {
    fn default() -> Self {
        Self {
            idle_flush_s: 1.5,
            gate_release_s: 30.0,
        }
    }
}

impl LiveCfg {
    /// True for the defaults; used to leave the table out of serialised scenarios.
    pub fn is_default(&self) -> bool {
        *self == LiveCfg::default()
    }

    /// Reject values no stream can use.
    pub fn validate(&self) -> Result<(), String> {
        for (name, v) in [
            ("idle_flush_s", self.idle_flush_s),
            ("gate_release_s", self.gate_release_s),
        ] {
            if !(v.is_finite() && v >= 0.0) {
                return Err(format!("live: {name} must be finite and >= 0 (got {v})"));
            }
        }
        if self.idle_flush_s == 0.0 {
            return Err("live: idle_flush_s must be above 0".into());
        }
        Ok(())
    }
}

/// What the gate did with an epoch's fix.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum GateAction {
    /// The gate is off.
    Off,
    /// The cycle was forwarded unchanged.
    Passed,
    /// The fix was marked invalid in the forwarded cycle.
    Withheld,
}

/// The trust report of one epoch: a line of the JSON output.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct EpochReport {
    /// Count of epochs reported, from 1.
    pub seq: u64,
    /// Seconds since the first epoch of the stream.
    pub t_s: f64,
    /// The epoch's time as the stream states it.
    pub time: Option<String>,
    /// `calibrating`, `nominal`, `degraded` or `untrusted`.
    pub state: TrustState,
    /// The trust score, 0 to 100; absent while calibrating.
    pub score: Option<f64>,
    /// The monitors that deducted, largest first, with their ratios and points.
    pub deductions: Vec<Deduction>,
    /// The monitors that alarmed.
    pub alarms: Vec<Monitor>,
    /// What the gate did.
    pub gate: GateAction,
    /// Why no score was produced, when none could be.
    pub note: Option<String>,
    /// The position the receiver reported at this epoch (schema 1.1), `null` when it gave none.
    pub position: Option<ReportedPosition>,
    /// What this software is and is not (schema 1.2).
    pub advisory: &'static str,
}

/// The receiver-reported position of an epoch.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ReportedPosition {
    /// Geodetic latitude, degrees.
    pub lat_deg: f64,
    /// Geodetic longitude, degrees.
    pub lon_deg: f64,
    /// Height, m (ellipsoidal where the sentence gives the geoid separation, else above mean
    /// sea level).
    pub height_m: f64,
}

impl EpochReport {
    /// The report as one JSON line (no trailing newline).
    pub fn to_json_line(&self) -> String {
        serde_json::to_string(self).unwrap_or_else(|_| "{}".into())
    }

    /// The `$PKSHT` sentence for this epoch, with checksum and no line ending. Fields, in
    /// order: `1` the format version; the epoch's UTC time `hhmmss.ss` (empty if the stream
    /// gave none); the score with one decimal (empty while calibrating or when none could
    /// be produced); the band `C` calibrating, `N` nominal, `D` degraded, `U` untrusted;
    /// the gate `-` off, `P` passed, `W` withheld; up to two reasons as
    /// `monitor:points` joined by `/` (empty when nothing deducted).
    pub fn pksht(&self) -> String {
        let tod = self.time.as_deref().and_then(label_tod).unwrap_or_default();
        let score = self.score.map(|s| format!("{s:.1}")).unwrap_or_default();
        let band = match self.state {
            TrustState::Calibrating => 'C',
            TrustState::Nominal => 'N',
            TrustState::Degraded => 'D',
            TrustState::Untrusted => 'U',
        };
        let gate = match self.gate {
            GateAction::Off => '-',
            GateAction::Passed => 'P',
            GateAction::Withheld => 'W',
        };
        let reasons = self
            .deductions
            .iter()
            .take(2)
            .map(|d| format!("{}:{:.1}", monitor_label(d.monitor), d.points))
            .collect::<Vec<_>>()
            .join("/");
        let body = format!("PKSHT,1,{tod},{score},{band},{gate},{reasons}");
        format!("${body}*{:02X}", xor(&body))
    }
}

fn monitor_label(m: Monitor) -> String {
    // The serde name is the stable kebab-case label.
    serde_json::to_value(m)
        .ok()
        .and_then(|v| v.as_str().map(str::to_string))
        .unwrap_or_default()
}

fn xor(body: &str) -> u8 {
    body.bytes().fold(0, |a, b| a ^ b)
}

/// `hhmmss.ss` from an epoch label (`2025-06-14T08:00:01.250Z`, `08:00:01.250 UTC (date not in
/// log)`): the first `hh:mm:ss` by position, not by splitting on a letter.
fn label_tod(label: &str) -> Option<String> {
    let b = label.as_bytes();
    let at = (0..b.len().saturating_sub(7)).find(|&i| {
        let d = |k: usize| b[i + k].is_ascii_digit();
        d(0) && d(1) && b[i + 2] == b':' && d(3) && d(4) && b[i + 5] == b':' && d(6) && d(7)
    })?;
    let hms = &label[at..at + 8];
    let ms = label
        .get(at + 9..at + 12)
        .filter(|_| b.get(at + 8) == Some(&b'.'))
        .and_then(|m| m.parse::<u32>().ok())
        .unwrap_or(0);
    Some(format!(
        "{}{}{}.{:02}",
        &hms[0..2],
        &hms[3..5],
        &hms[6..8],
        ms / 10
    ))
}

/// Parse a live session: the same TOML as a batch scenario, except that `[log]` is not
/// needed (and not used when present).
pub fn parse_live_scenario(src: &str) -> Result<ReceiverTrustScenario, String> {
    let mut v: toml::Table = toml::from_str(src).map_err(|e| format!("invalid session: {e}"))?;
    v.entry("log").or_insert_with(|| {
        let mut t = toml::Table::new();
        t.insert("format".into(), "nmea".into());
        t.insert("text".into(), "".into());
        toml::Value::Table(t)
    });
    v.try_into().map_err(|e| format!("invalid session: {e}"))
}

/// What one call returns.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct LiveOut {
    /// Lines to forward downstream, in order, each with its original line ending; the
    /// sentences of a cycle (marked invalid while withheld) followed by its `$PKSHT`.
    /// Empty unless the gate is on.
    pub forward: Vec<Vec<u8>>,
    /// The reports of the epochs that completed.
    pub reports: Vec<EpochReport>,
}

/// Longest cycle of lines held before it is completed as it stands.
const MAX_CYCLE_LINES: usize = 5_000;
/// Most calibration epochs kept.
const MAX_CAL_EPOCHS: usize = 20_000;
/// Most recent epochs kept after calibration.
const MAX_RECENT_EPOCHS: usize = 20_000;

/// The live trust engine.
///
/// Each epoch after calibration is scored by the batch monitors over the calibration epochs
/// and the last minute or so of the stream, so the cost of an epoch grows with the number of
/// calibration epochs (about `calibration_s` times the epoch rate); a short calibration window
/// keeps it small.
pub struct LiveEngine {
    scn: ReceiverTrustScenario,
    gate: bool,
    feed: NmeaFeed,
    /// Lines of the cycle in progress, as received.
    pending: Vec<Vec<u8>>,
    last_arrival: Option<f64>,
    /// Epochs of the calibration window, kept for the baseline.
    cal: Vec<LogEpoch>,
    /// The most recent epochs after calibration, as far back as any monitor looks.
    recent: VecDeque<LogEpoch>,
    lookback_s: f64,
    seq: u64,
    host_clock: bool,
    withheld: bool,
    /// The time since which epochs have been out of the untrusted band, while withheld.
    clear_since: Option<f64>,
}

impl LiveEngine {
    /// A new engine. The scenario must declare a vessel platform; its `[log]` is not used.
    pub fn new(scn: &ReceiverTrustScenario, gate: bool) -> Result<Self, String> {
        let cfg = &scn.monitors;
        cfg.validate()?;
        if !cfg.platform.is_vessel() {
            return Err(
                "live mode needs [platform] kind = \"vessel\": the trust score is for a moving \
                 platform"
                    .into(),
            );
        }
        // Everything a monitor looks back on: two kinematic windows, the evidence hold and
        // the smoothing window, plus a margin.
        let lookback_s = 2.0 * cfg.maritime.kin_window_s
            + 10.0
            + cfg.score.evidence_hold_s
            + cfg.maritime.smooth_s
            + 5.0;
        Ok(Self {
            scn: scn.clone(),
            gate,
            feed: NmeaFeed::new(),
            pending: Vec::new(),
            last_arrival: None,
            cal: Vec::new(),
            recent: VecDeque::new(),
            lookback_s,
            seq: 0,
            host_clock: true,
            withheld: false,
            clear_since: None,
        })
    }

    /// Whether the arrival times given to [`Self::feed_line`] are compared with the
    /// receiver's time (default on). Turn it off for a stream that is not arriving in real
    /// time, such as a stored log read as fast as it can be: then the receiver's time and the
    /// host clock have nothing to say about each other.
    pub fn set_host_clock(&mut self, on: bool) {
        self.host_clock = on;
    }

    /// Give the engine one line (with its terminator, if it had one) that arrived at
    /// `arrival_s` seconds on a monotonic clock.
    pub fn feed_line(&mut self, raw: &[u8], arrival_s: f64) -> LiveOut {
        self.pending.push(raw.to_vec());
        self.last_arrival = Some(arrival_s);
        if self.pending.len() >= MAX_CYCLE_LINES {
            // A cycle this long is not a cycle (no timed sentence, or a flood): complete it.
            return self.finish();
        }
        let host = self.host_clock.then_some(arrival_s);
        self.feed.feed(&String::from_utf8_lossy(raw), host);
        if self.feed.open_epochs() > 1 {
            // A newer timed sentence closed the epochs before it; the line just fed belongs
            // to the new cycle.
            let closed = self.feed.take_closed_epochs();
            let last = self.pending.pop().unwrap_or_default();
            let lines = std::mem::take(&mut self.pending);
            self.pending.push(last);
            return self.cycle(closed, lines, arrival_s);
        }
        LiveOut::default()
    }

    /// Tell the engine the time has reached `now_s` with no new line: when the stream has
    /// been quiet for the idle time the cycle in progress is complete.
    pub fn idle(&mut self, now_s: f64) -> LiveOut {
        match self.last_arrival {
            Some(t)
                if !self.pending.is_empty() && now_s - t >= self.scn.monitors.live.idle_flush_s =>
            {
                let epochs = self.feed.take_epochs();
                let lines = std::mem::take(&mut self.pending);
                self.cycle(epochs, lines, now_s)
            }
            _ => LiveOut::default(),
        }
    }

    /// The stream ended: complete the cycle in progress.
    pub fn finish(&mut self) -> LiveOut {
        let epochs = self.feed.take_epochs();
        let lines = std::mem::take(&mut self.pending);
        let now = self.last_arrival.unwrap_or(0.0);
        self.cycle(epochs, lines, now)
    }

    /// Score the epochs of a completed cycle and build what to forward.
    fn cycle(&mut self, epochs: Vec<LogEpoch>, lines: Vec<Vec<u8>>, now_s: f64) -> LiveOut {
        let mut out = LiveOut::default();
        let mut any_untrusted = false;
        let mut reports = Vec::new();
        for e in epochs {
            let (state, score, deductions, alarms, note) = self.score(e.clone());
            any_untrusted |= state == TrustState::Untrusted;
            self.seq += 1;
            reports.push((
                EpochReport {
                    seq: self.seq,
                    t_s: e.t_s,
                    time: e.time_label.clone(),
                    state,
                    score,
                    deductions,
                    alarms,
                    gate: GateAction::Off,
                    note,
                    position: e.fix.map(|f| ReportedPosition {
                        lat_deg: f.lat_deg,
                        lon_deg: f.lon_deg,
                        height_m: f.height_m,
                    }),
                    advisory: ADVISORY,
                },
                e.t_s,
            ));
        }
        // The gate: withhold on an untrusted epoch; release only after the stated time
        // out of the untrusted band. The release is timed on this computer's clock when the
        // stream is arriving in real time, never on the receiver's time, which is what a
        // spoofer controls; for a replay (no host clock) the receiver's time is all there is.
        let t_now = reports.last().map(|(_, t)| *t);
        if self.gate {
            if any_untrusted {
                self.withheld = true;
                self.clear_since = None;
            } else if self.withheld {
                let clock = if self.host_clock { Some(now_s) } else { t_now };
                if let Some(t) = clock {
                    let since = *self.clear_since.get_or_insert(t);
                    if t - since >= self.scn.monitors.live.gate_release_s {
                        self.withheld = false;
                        self.clear_since = None;
                    }
                }
            }
        }
        let action = match (self.gate, self.withheld) {
            (false, _) => GateAction::Off,
            (true, true) => GateAction::Withheld,
            (true, false) => GateAction::Passed,
        };
        for (r, _) in reports.iter_mut() {
            r.gate = action;
        }
        if self.gate {
            for line in lines {
                out.forward.push(if self.withheld {
                    withhold_line(&line)
                } else {
                    line
                });
            }
            for (r, _) in &reports {
                out.forward.push(format!("{}\r\n", r.pksht()).into_bytes());
            }
        }
        out.reports = reports.into_iter().map(|(r, _)| r).collect();
        out
    }

    /// The trust of one epoch.
    #[allow(clippy::type_complexity)]
    fn score(
        &mut self,
        e: LogEpoch,
    ) -> (
        TrustState,
        Option<f64>,
        Vec<Deduction>,
        Vec<Monitor>,
        Option<String>,
    ) {
        let cal_s = self.scn.monitors.calibration_s;
        // An epoch whose time ran backwards (a replay, a rewind) is never calibration and
        // never joins the history the monitors look back on: it is scored for what it is.
        if e.marine.as_ref().is_some_and(|m| m.time_rewound) {
            let sc = score_from_ratios(
                &BTreeMap::from([(Monitor::TimeConsistency, REWIND_RATIO)]),
                &self.scn.monitors.score,
            );
            return (
                sc.band,
                Some(sc.score),
                sc.deductions,
                vec![Monitor::TimeConsistency],
                Some("the receiver's time ran backwards: a replay or a clock fault".into()),
            );
        }
        if e.t_s < cal_s {
            if self.cal.len() < MAX_CAL_EPOCHS {
                self.cal.push(e);
            }
            return (TrustState::Calibrating, None, Vec::new(), Vec::new(), None);
        }
        let t = e.t_s;
        self.recent.push_back(e);
        if self.recent.len() > MAX_RECENT_EPOCHS {
            self.recent.pop_front();
        }
        while self
            .recent
            .front()
            .is_some_and(|p| t - p.t_s > self.lookback_s)
        {
            self.recent.pop_front();
        }
        let tl = Timeline {
            epochs: self.cal.iter().chain(self.recent.iter()).cloned().collect(),
            ..Timeline::default()
        };
        match run_monitors(&tl, None, &self.scn.monitors) {
            Ok(r) => match r.epochs.last() {
                Some(last) => {
                    let (score, ded) = last
                        .score
                        .as_ref()
                        .map(|s| (Some(s.score), s.deductions.clone()))
                        .unwrap_or((None, Vec::new()));
                    (last.state, score, ded, last.alarms.clone(), None)
                }
                None => (
                    TrustState::Untrusted,
                    None,
                    Vec::new(),
                    Vec::new(),
                    Some("no result for the epoch".into()),
                ),
            },
            // After calibration an error is a fault in what is being assessed or how it is set
            // up (a declared heading sensor that sends nothing, too few calibration epochs):
            // the layer cannot vouch for the fix, so it fails closed.
            Err(msg) => (
                TrustState::Untrusted,
                None,
                Vec::new(),
                Vec::new(),
                Some(format!("no score could be produced: {msg}")),
            ),
        }
    }
}

/// A sentence with its fix marked invalid, or the line unchanged when it carries no fix.
///
/// GGA: quality 0. RMC: status `V` (and the mode indicator `N`, the navigational status
/// `V`, where present). GNS: every mode character `N`. GLL: status `V`, mode `N`. VTG: mode
/// `N` where present. The checksum is recomputed (kept absent where the sentence had none)
/// and the line ending is preserved.
pub fn withhold_line(raw: &[u8]) -> Vec<u8> {
    let Ok(text) = std::str::from_utf8(raw) else {
        return raw.to_vec();
    };
    let Some(start) = text.find('$') else {
        return raw.to_vec();
    };
    let rest = &text[start + 1..];
    let end = rest.find(['*', '\r', '\n']).unwrap_or(rest.len());
    let had_checksum = rest[end..].starts_with('*');
    let mut f: Vec<String> = rest[..end].split(',').map(str::to_string).collect();
    let tail_start = if had_checksum {
        // '*' and exactly two hex digits that match the sentence: otherwise it is corrupt, and
        // rewriting it would give it a valid checksum it never had.
        let hex = rest
            .get(end + 1..end + 3)
            .filter(|h| h.bytes().all(|c| c.is_ascii_hexdigit()));
        match hex.and_then(|h| u8::from_str_radix(h, 16).ok()) {
            Some(want) if want == xor(&rest[..end]) => end + 3,
            _ => return raw.to_vec(),
        }
    } else {
        end
    };
    let addr = f[0].clone();
    if addr.len() != 5 || !addr.is_ascii() {
        return raw.to_vec();
    }
    let set = |f: &mut Vec<String>, i: usize, v: &str| {
        if i < f.len() {
            f[i] = v.to_string();
        }
    };
    match &addr[2..] {
        "GGA" => set(&mut f, 6, "0"),
        "RMC" => {
            set(&mut f, 2, "V");
            if f.len() > 12 && !f[12].is_empty() {
                set(&mut f, 12, "N");
            }
            if f.len() > 13 && !f[13].is_empty() {
                set(&mut f, 13, "V");
            }
        }
        "GNS" => {
            if f.len() > 6 {
                let n = f[6].chars().count().max(1);
                f[6] = "N".repeat(n);
            }
        }
        "GLL" => {
            set(&mut f, 6, "V");
            if f.len() > 7 && !f[7].is_empty() {
                set(&mut f, 7, "N");
            }
        }
        "VTG" => {
            if f.len() > 9 && !f[9].is_empty() {
                set(&mut f, 9, "N");
            }
        }
        _ => return raw.to_vec(),
    }
    let body = f.join(",");
    let mut out = String::with_capacity(raw.len());
    out.push_str(&text[..start + 1]);
    out.push_str(&body);
    if had_checksum {
        out.push_str(&format!("*{:02X}", xor(&body)));
    }
    out.push_str(&rest[tail_start..]);
    out.into_bytes()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn nmea(body: &str) -> String {
        format!("${body}*{:02X}\r\n", xor(body))
    }

    #[test]
    fn withhold_marks_each_fix_sentence_invalid_and_fixes_the_checksum() {
        let gga = nmea("GPGGA,100000.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,");
        let out = String::from_utf8(withhold_line(gga.as_bytes())).unwrap();
        assert_eq!(
            out,
            nmea("GPGGA,100000.00,5430.0000,N,01830.0000,E,0,10,0.9,18.4,M,26.5,M,,")
        );
        let rmc = nmea("GPRMC,100000.00,A,5430.0000,N,01830.0000,E,15.2,45.5,140625,,,A,V");
        assert_eq!(
            String::from_utf8(withhold_line(rmc.as_bytes())).unwrap(),
            nmea("GPRMC,100000.00,V,5430.0000,N,01830.0000,E,15.2,45.5,140625,,,N,V")
        );
        let gns = nmea("GNGNS,100000.00,5430.0000,N,01830.0000,E,AA,10,0.9,18.4,26.5,,");
        assert_eq!(
            String::from_utf8(withhold_line(gns.as_bytes())).unwrap(),
            nmea("GNGNS,100000.00,5430.0000,N,01830.0000,E,NN,10,0.9,18.4,26.5,,")
        );
        let gll = nmea("GPGLL,5430.0000,N,01830.0000,E,100000.00,A,A");
        assert_eq!(
            String::from_utf8(withhold_line(gll.as_bytes())).unwrap(),
            nmea("GPGLL,5430.0000,N,01830.0000,E,100000.00,V,N")
        );
        let vtg = nmea("GPVTG,45.5,T,,M,15.2,N,28.2,K,A");
        assert_eq!(
            String::from_utf8(withhold_line(vtg.as_bytes())).unwrap(),
            nmea("GPVTG,45.5,T,,M,15.2,N,28.2,K,N")
        );
    }

    #[test]
    fn withhold_does_not_launder_a_corrupt_or_malformed_checksum() {
        // A wrong checksum is left wrong; a short one is left alone with its line ending.
        for line in [
            "$GPGGA,100000.00,5430.0,N,01830.0,E,1,10,0.9,18.4,M,26.5,M,,*00\r\n",
            "$GPGGA,100000.00,5430.0,N,01830.0,E,1,10,0.9,18.4,M,26.5,M,,*5\r\n",
            "$GPGGA,100000.00,5430.0,N,01830.0,E,1,10,0.9,18.4,M,26.5,M,,*+5\r\n",
        ] {
            assert_eq!(withhold_line(line.as_bytes()), line.as_bytes(), "{line:?}");
        }
    }

    #[test]
    fn label_time_is_taken_by_position() {
        assert_eq!(label_tod("2025-06-14T08:01:40.250Z").unwrap(), "080140.25");
        assert_eq!(
            label_tod("12:35:19.000 UTC (date not in log)").unwrap(),
            "123519.00"
        );
        assert_eq!(label_tod("no time here"), None);
    }

    #[test]
    fn withhold_leaves_every_other_line_byte_for_byte() {
        for line in [
            nmea("HEHDT,52.5,T"),
            nmea("GPGSV,2,1,05,03,62,040,45"),
            nmea("PKSHT,1,,,N,-,"),
            "garbage with no sentence\r\n".to_string(),
            // A VTG from before the mode field existed has nothing to mark.
            "$GPVTG,45.5,T,,M,15.2,N,28.2,K\r\n".to_string(),
        ] {
            assert_eq!(withhold_line(line.as_bytes()), line.as_bytes(), "{line:?}");
        }
        // No checksum and a bare line feed: both kept as they were.
        let bare = b"$GPGGA,100000.00,5430.0,N,01830.0,E,1,10,0.9,18.4,M,26.5,M,,\n";
        assert_eq!(
            withhold_line(bare),
            b"$GPGGA,100000.00,5430.0,N,01830.0,E,0,10,0.9,18.4,M,26.5,M,,\n"
        );
        // Not UTF-8: unchanged.
        let bin = [0xB5u8, 0x62, 0xFF, b'\n'];
        assert_eq!(withhold_line(&bin), bin);
    }

    #[test]
    fn pksht_fields_and_checksum() {
        let r = EpochReport {
            seq: 7,
            t_s: 100.0,
            time: Some("2025-06-14T08:01:40.250Z".into()),
            state: TrustState::Untrusted,
            score: Some(23.4),
            deductions: vec![
                Deduction {
                    monitor: Monitor::HeadingCourse,
                    ratio: 2.0,
                    points: 40.0,
                },
                Deduction {
                    monitor: Monitor::Cn0Spread,
                    ratio: 1.6,
                    points: 30.0,
                },
                Deduction {
                    monitor: Monitor::SpeedLog,
                    ratio: 1.0,
                    points: 20.0,
                },
            ],
            alarms: vec![],
            gate: GateAction::Withheld,
            note: None,
            position: None,
            advisory: ADVISORY,
        };
        let s = r.pksht();
        let body = "PKSHT,1,080140.25,23.4,U,W,heading-course:40.0/cn0-spread:30.0";
        assert_eq!(s, format!("${body}*{:02X}", xor(body)));
        assert!(s.len() + 2 <= 82, "NMEA 0183 sentence length limit");
        let calibrating = EpochReport {
            state: TrustState::Calibrating,
            score: None,
            deductions: vec![],
            gate: GateAction::Off,
            time: None,
            ..r
        };
        assert!(calibrating.pksht().starts_with("$PKSHT,1,,,C,-,*"));
    }
}
