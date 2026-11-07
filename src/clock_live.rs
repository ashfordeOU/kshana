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

use crate::clock_log::{read_line, ClockLogFormat, LineReading};
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
}

impl ClockLive {
    /// A reader for `fmt`, keeping the source named `clock` (or, without one, the first source
    /// seen; every line of a chrony tracking log).
    pub fn new(fmt: ClockLogFormat, clock: Option<String>) -> Result<Self, String> {
        if !matches!(
            fmt,
            ClockLogFormat::Ptp4l
                | ClockLogFormat::Phc2sys
                | ClockLogFormat::Ts2phc
                | ClockLogFormat::ChronyTracking
                | ClockLogFormat::ChronyStatistics
                | ClockLogFormat::PpsAssert
        ) {
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
        })
    }

    /// Take one line; a reading gives one output line.
    pub fn push(&mut self, line: &str) -> Option<LiveClockLine> {
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
        Some(LiveClockLine {
            reading: r,
            kept,
            n_kept: self.n_kept,
            rms_s: rms,
            max_abs_s: max,
            since_last_s: since,
        })
    }
}

/// Usage text for `kshana clock-live`.
pub fn usage() -> String {
    crate::t!("clock-live-usage")
}

/// `kshana clock-live --format <f> --from <-|tcp:host:port|file> [--clock <name>] [--follow]
/// [--poll-s <s>] [--max-seconds <s>]`.
pub fn run(args: &[String]) -> Result<(), String> {
    let mut fmt = None;
    let mut from = None;
    let mut clock = None;
    let mut follow = false;
    let mut poll = None;
    let mut max_s = None;
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
    let mut live = ClockLive::new(fmt, clock)?;
    let start = std::time::Instant::now();
    let over = || max_s.is_some_and(|m| start.elapsed().as_secs_f64() >= m);
    let mut emit = |line: &str| -> Result<(), String> {
        use std::io::Write;
        if let Some(o) = live.push(line) {
            let mut out = std::io::stdout().lock();
            writeln!(
                out,
                "{}",
                serde_json::to_string(&o).map_err(|e| e.to_string())?
            )
            .and_then(|()| out.flush())
            .map_err(|e| e.to_string())?;
        }
        Ok(())
    };
    let io = |e: std::io::Error| format!("{from}: {e}");
    if let Some(p) = poll {
        // A file read whole at every poll: the PPS device's `assert`, or a status file.
        while !over() {
            let text = std::fs::read_to_string(&from).map_err(io)?;
            for l in text.lines() {
                emit(l)?;
            }
            std::thread::sleep(std::time::Duration::from_secs_f64(p));
        }
        return Ok(());
    }
    use std::io::BufRead;
    let reader: Box<dyn std::io::Read> = if from == "-" {
        Box::new(std::io::stdin())
    } else if let Some(addr) = from.strip_prefix("tcp:") {
        Box::new(std::net::TcpStream::connect(addr).map_err(io)?)
    } else {
        Box::new(std::fs::File::open(&from).map_err(io)?)
    };
    let mut r = std::io::BufReader::new(reader);
    let mut line = String::new();
    loop {
        if over() {
            break;
        }
        line.clear();
        let n = r.read_line(&mut line).map_err(io)?;
        if n == 0 {
            if !follow {
                break;
            }
            // A log still being written: wait for the next line.
            std::thread::sleep(std::time::Duration::from_millis(100));
            continue;
        }
        if !line.ends_with('\n') && follow {
            // A line still being written: read the rest of it on the next pass.
            let mut rest = String::new();
            while !rest.ends_with('\n') && !over() {
                std::thread::sleep(std::time::Duration::from_millis(20));
                rest.clear();
                if r.read_line(&mut rest).map_err(io)? == 0 {
                    continue;
                }
                line.push_str(&rest);
            }
        }
        emit(&line)?;
    }
    Ok(())
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
    }
}
