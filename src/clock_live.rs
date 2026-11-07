// SPDX-License-Identifier: AGPL-3.0-only
//! Live clock state (roadmap L4c): `kshana clock-live` reads a linuxptp servo log (`ptp4l`,
//! `phc2sys`, `ts2phc`), a chrony `tracking.log` or `statistics.log`, or Linux PPS `assert` time
//! stamps as they are written, and prints one JSON line per reading.
//!
//! Each reading is marked `kept` exactly when the whole-log reader ([`crate::clock_log`]) keeps
//! it: the selected source only, linuxptp readings only from the servo's first locked state
//! (`s2`) on, a PPS pulse once however often it is polled. So the kept offsets of a live run are
//! the phase series a replay of the same log gives (`tests/clock_live.rs`). Read only: nothing is
//! written to the clock, the servo or the PPS device.

use crate::clock_log::{read_line, ticc_line, ClockLogFormat, LineReading, TiccPhase};
use serde::Serialize;
use std::collections::VecDeque;

/// Readings in the running statistics.
const WINDOW: usize = 64;

/// One line of `kshana clock-live` output.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LiveClockLine {
    /// The reading.
    #[serde(flatten)]
    pub reading: LineReading,
    /// Whether the whole-log reader keeps this reading.
    pub kept: bool,
    /// Kept readings so far.
    pub n_kept: u64,
    /// RMS of the last kept offsets (up to 64), s.
    pub rms_s: Option<f64>,
    /// Largest absolute value among the same offsets, s.
    pub max_abs_s: Option<f64>,
    /// Time since the previous kept reading, s.
    pub since_last_s: Option<f64>,
}

/// The live reader of one log.
pub struct ClockLive {
    fmt: ClockLogFormat,
    clock: Option<String>,
    chosen: Option<String>,
    state_seen: bool,
    locked_once: bool,
    last_seq: Option<u64>,
    last_t: Option<f64>,
    window: VecDeque<f64>,
    n_kept: u64,
    ticc: Option<TiccPhase>,
    tau0: Option<f64>,
}

impl ClockLive {
    /// A reader for `fmt`, keeping the source named `clock` (or, without one, the first source
    /// seen; every line of a chrony tracking log).
    pub fn new(fmt: ClockLogFormat, clock: Option<String>) -> Result<Self, String> {
        Self::with_tau0(fmt, clock, None)
    }

    /// As [`ClockLive::new`], with the sample interval a TICC log needs live (`--tau0`): the
    /// whole-log reader finds it from all the time stamps, which a live reader does not have yet.
    /// For TICC, `clock` names the channel (`chA`, `chB`, `chC` or a `TI...` label).
    pub fn with_tau0(
        fmt: ClockLogFormat,
        clock: Option<String>,
        tau0: Option<f64>,
    ) -> Result<Self, String> {
        if fmt == ClockLogFormat::Ticc && !tau0.is_some_and(|t| t.is_finite() && t > 0.0) {
            return Err(crate::terr!("e-clock-live-ticc-tau0"));
        }
        if fmt != ClockLogFormat::Ticc
            && !matches!(
                fmt,
                ClockLogFormat::Ptp4l
                    | ClockLogFormat::Phc2sys
                    | ClockLogFormat::Ts2phc
                    | ClockLogFormat::ChronyTracking
                    | ClockLogFormat::ChronyStatistics
                    | ClockLogFormat::PpsAssert
            )
        {
            return Err(crate::terr!(
                "e-clock-live-format",
                format = fmt.name().to_string()
            ));
        }
        Ok(Self {
            fmt,
            clock,
            chosen: None,
            state_seen: false,
            locked_once: false,
            last_seq: None,
            last_t: None,
            window: VecDeque::new(),
            n_kept: 0,
            ticc: None,
            tau0,
        })
    }

    /// A TICC line: the selected (or first) channel's phase.
    fn ticc_reading(&mut self, line: &str) -> Option<(LineReading, bool)> {
        let (v, label) = ticc_line(line)?;
        let mine = match &self.clock {
            Some(c) => &label == c,
            None => self.chosen.get_or_insert_with(|| label.clone()) == &label,
        };
        if !mine {
            let r = LineReading {
                source: label,
                t_s: v as f64 / 1e15,
                offset_s: f64::NAN,
                locked: None,
                seq: None,
            };
            return Some((r, false));
        }
        let tau0 = self.tau0?;
        let ph = self
            .ticc
            .get_or_insert_with(|| TiccPhase::new(tau0, label.starts_with("TI")));
        let (offset, t, kept) = match ph.push(v) {
            Some((x, t, _)) => (x, t, true),
            None => (f64::NAN, v as f64 / 1e15, false),
        };
        Some((
            LineReading {
                source: label,
                t_s: t,
                offset_s: offset,
                locked: None,
                seq: None,
            },
            kept,
        ))
    }

    /// Take one line; a reading gives one output line.
    pub fn push(&mut self, line: &str) -> Option<LiveClockLine> {
        if self.fmt == ClockLogFormat::Ticc {
            let (r, kept) = self.ticc_reading(line)?;
            return Some(self.account(r, kept));
        }
        let r = read_line(self.fmt, line)?;
        let mine = match (&self.clock, self.fmt) {
            (Some(c), _) => &r.source == c,
            (None, ClockLogFormat::ChronyTracking | ClockLogFormat::PpsAssert) => true,
            (None, _) => self.chosen.get_or_insert_with(|| r.source.clone()) == &r.source,
        };
        let mut kept = mine;
        if mine && self.fmt == ClockLogFormat::PpsAssert {
            if self.last_seq == r.seq {
                kept = false;
            } else {
                self.last_seq = r.seq;
            }
        }
        if mine && r.locked.is_some() {
            self.state_seen = true;
            if r.locked == Some(true) {
                self.locked_once = true;
            }
        }
        if self.state_seen && !self.locked_once {
            kept = false;
        }
        Some(self.account(r, kept))
    }

    /// Count a reading and update the running statistics.
    fn account(&mut self, r: LineReading, kept: bool) -> LiveClockLine {
        let since = kept.then(|| self.last_t.map(|t| r.t_s - t)).flatten();
        if kept {
            self.n_kept += 1;
            self.last_t = Some(r.t_s);
            self.window.push_back(r.offset_s);
            if self.window.len() > WINDOW {
                self.window.pop_front();
            }
        }
        let n = self.window.len() as f64;
        let (rms, max) = if self.window.is_empty() {
            (None, None)
        } else {
            (
                Some((self.window.iter().map(|x| x * x).sum::<f64>() / n).sqrt()),
                Some(self.window.iter().fold(0.0f64, |m, x| m.max(x.abs()))),
            )
        };
        LiveClockLine {
            reading: r,
            kept,
            n_kept: self.n_kept,
            rms_s: rms,
            max_abs_s: max,
            since_last_s: since,
        }
    }
}

/// Usage text for `kshana clock-live`.
pub fn usage() -> String {
    crate::t!("clock-live-usage")
}

/// `kshana clock-live --format <f> --from <-|tcp:host:port|file> [--clock <name>] [--follow]
/// [--poll-s <s>] [--max-seconds <s>]`.
pub fn run(args: &[String]) -> Result<(), String> {
    let (hcfg, reconnect, args) = crate::live_health::split_args(args, "clock")?;
    let mut fmt = None;
    let mut from = None;
    let mut clock = None;
    let mut follow = false;
    let mut poll = None;
    let mut max_s = None;
    let mut tau0 = None;
    let mut i = 0;
    let secs = |v: Option<&String>, k: &str| -> Result<f64, String> {
        v.and_then(|v| v.parse::<f64>().ok())
            .filter(|x| x.is_finite() && *x > 0.0)
            .ok_or_else(|| crate::terr!("e-clock-live-positive", name = k.to_string()))
    };
    while i < args.len() {
        let v = args.get(i + 1);
        match args[i].as_str() {
            "--format" => fmt = Some(ClockLogFormat::from_name(v.ok_or_else(usage)?)?),
            "--from" => from = Some(v.ok_or_else(usage)?.clone()),
            "--clock" => clock = Some(v.ok_or_else(usage)?.clone()),
            "--poll-s" => poll = Some(secs(v, "--poll-s")?),
            "--max-seconds" => max_s = Some(secs(v, "--max-seconds")?),
            "--tau0" => tau0 = Some(secs(v, "--tau0")?),
            "--follow" => {
                follow = true;
                i += 1;
                continue;
            }
            _ => return Err(usage()),
        }
        i += 2;
    }
    let (Some(fmt), Some(from)) = (fmt, from) else {
        return Err(usage());
    };
    let live = std::cell::RefCell::new(ClockLive::with_tau0(fmt, clock, tau0)?);
    let health = std::cell::RefCell::new(crate::live_health::Health::new(hcfg));
    let emit = |line: &str, arrival: f64| -> Result<(), String> {
        let Some(o) = live.borrow_mut().push(line) else {
            return Ok(());
        };
        let mut h = health.borrow_mut();
        let events = h.on_reading(arrival, o.kept.then_some(o.reading.offset_s));
        crate::live_health::print_line(&o, Some(h.stamp(arrival)))?;
        crate::live_health::print_events(&events)
    };
    if let Some(p) = poll {
        // A file read whole at every poll: the PPS device's `assert`, or a status file.
        let start = std::time::Instant::now();
        while !max_s.is_some_and(|m| start.elapsed().as_secs_f64() >= m) {
            let text = std::fs::read_to_string(&from).map_err(|e| format!("{from}: {e}"))?;
            let now = crate::live_health::host_now();
            for l in text.lines() {
                emit(l, now)?;
            }
            let ev = health.borrow_mut().on_idle(now);
            crate::live_health::print_events(&ev)?;
            std::thread::sleep(std::time::Duration::from_secs_f64(p));
        }
        return Ok(());
    }
    let opts = crate::live_health::FollowOptions {
        follow,
        max_s,
        reconnect,
    };
    crate::live_health::follow(
        &from,
        &opts,
        emit,
        |now| crate::live_health::print_events(&health.borrow_mut().on_idle(now)),
        |a, b| crate::live_health::print_events(&[health.borrow().gap(a, b)]),
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn linuxptp_readings_count_from_the_first_lock() {
        let mut l = ClockLive::new(ClockLogFormat::Ptp4l, None).unwrap();
        let line = |t: u32, off: i64, s: &str| {
            format!("ptp4l[{t}.000]: master offset {off} {s} freq +0 path delay 500")
        };
        assert!(!l.push(&line(1, 90_000, "s0")).unwrap().kept);
        assert!(!l.push(&line(2, 4_000, "s1")).unwrap().kept);
        let o = l.push(&line(3, -20, "s2")).unwrap();
        assert!(o.kept && o.reading.offset_s == -20e-9 && o.n_kept == 1);
        let o = l.push(&line(4, 30, "s2")).unwrap();
        assert_eq!(o.since_last_s, Some(1.0));
        assert!((o.max_abs_s.unwrap() - 30e-9).abs() < 1e-18);
        assert!(l.push("not a reading").is_none());
    }

    #[test]
    fn a_pps_pulse_read_twice_is_kept_once() {
        let mut l = ClockLive::new(ClockLogFormat::PpsAssert, None).unwrap();
        let a = l.push("1700000000.000001200#77").unwrap();
        assert!(a.kept && (a.reading.offset_s - 1.2e-6).abs() < 1e-15 && a.reading.t_s == 1.7e9);
        assert!(!l.push("1700000000.000001200#77").unwrap().kept);
        let b = l.push("1700000000.999999000#78").unwrap();
        assert!(b.kept && (b.reading.offset_s + 1e-6).abs() < 1e-15);
        assert_eq!(b.reading.t_s, 1_700_000_001.0);
        assert!(ClockLive::new(ClockLogFormat::Ticc, None).is_err());
        assert!(ClockLive::new(ClockLogFormat::TimeLab, None).is_err());
    }
}
