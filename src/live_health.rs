// SPDX-License-Identifier: AGPL-3.0-only
//! Multi-sensor timing and health for the live readers (roadmap L4e).
//!
//! * **One time base.** Every live reading is stamped with the host clock when its line arrived
//!   (`host_s`, Unix seconds), minus a per-device latency (`--latency-s`, measured once against a
//!   common reference such as a PPS edge). The host clock is the one chrony, PTP or PPS disciplines,
//!   so readings from several devices on one host share a time base whatever their own clocks say.
//! * **A watchdog per sensor.** `stale` when no reading has arrived for `--stale-s` seconds,
//!   `frozen` when `--frozen-n` readings in a row carry the same value, `out-of-range` when the value
//!   leaves `--range lo,hi`; each condition is reported once when it starts and once when it clears.
//! * **Hot-plug.** With `--reconnect`, a device or connection that ends or fails is opened again
//!   every second; the time with no input is reported as a `gap` with its start and end. A gap is
//!   marked, never filled: no reading is invented for it.
//!
//! Events are JSON lines on standard output beside the readings, each with `"event"` set.

use serde::Serialize;
use std::time::{Duration, Instant, SystemTime, UNIX_EPOCH};

/// Watchdog and time-base settings of one sensor.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct HealthConfig {
    /// The sensor's name in events.
    pub name: String,
    /// Report `stale` after this many seconds without a reading.
    pub stale_s: Option<f64>,
    /// Report `frozen` after this many identical values in a row (at least 2).
    pub frozen_n: Option<u32>,
    /// Report `out-of-range` outside `[lo, hi]`.
    pub range: Option<(f64, f64)>,
    /// The device's latency, subtracted from the arrival time, s.
    pub latency_s: f64,
}

/// A health event.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct HealthEvent {
    /// `stale`, `stale-cleared`, `frozen`, `frozen-cleared`, `out-of-range`, `in-range` or `gap`.
    pub event: &'static str,
    /// The sensor.
    pub sensor: String,
    /// Host time of the event, s.
    pub host_s: f64,
    /// For `gap`: when the input stopped, s.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub from_s: Option<f64>,
    /// The value that started or cleared the condition.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub value: Option<f64>,
}

/// The watchdog of one sensor.
pub struct Health {
    cfg: HealthConfig,
    last_arrival: Option<f64>,
    stale: bool,
    last_value: Option<f64>,
    same: u32,
    frozen: bool,
    out: bool,
}

/// Unix time now, s.
pub fn host_now() -> f64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_secs_f64())
        .unwrap_or(0.0)
}

impl Health {
    /// A watchdog with `cfg`.
    pub fn new(cfg: HealthConfig) -> Self {
        Self {
            cfg,
            last_arrival: None,
            stale: false,
            last_value: None,
            same: 0,
            frozen: false,
            out: false,
        }
    }

    /// The reading's time on the common base: its arrival minus the device latency.
    pub fn stamp(&self, arrival_s: f64) -> f64 {
        arrival_s - self.cfg.latency_s
    }

    fn ev(&self, event: &'static str, host_s: f64, value: Option<f64>) -> HealthEvent {
        HealthEvent {
            event,
            sensor: self.cfg.name.clone(),
            host_s,
            from_s: None,
            value,
        }
    }

    /// A reading arrived at `arrival_s` with `value` (the sensor's primary value, if it has one).
    pub fn on_reading(&mut self, arrival_s: f64, value: Option<f64>) -> Vec<HealthEvent> {
        let mut out = Vec::new();
        if self.stale {
            self.stale = false;
            out.push(self.ev("stale-cleared", arrival_s, value));
        }
        self.last_arrival = Some(arrival_s);
        let Some(v) = value.filter(|v| v.is_finite()) else {
            return out;
        };
        if let Some(n) = self.cfg.frozen_n.filter(|n| *n >= 2) {
            if self.last_value == Some(v) {
                self.same += 1;
            } else {
                self.same = 1;
                if self.frozen {
                    self.frozen = false;
                    out.push(self.ev("frozen-cleared", arrival_s, Some(v)));
                }
            }
            if self.same >= n && !self.frozen {
                self.frozen = true;
                out.push(self.ev("frozen", arrival_s, Some(v)));
            }
        }
        self.last_value = Some(v);
        if let Some((lo, hi)) = self.cfg.range {
            let outside = !(lo..=hi).contains(&v);
            if outside != self.out {
                self.out = outside;
                out.push(self.ev(
                    if outside { "out-of-range" } else { "in-range" },
                    arrival_s,
                    Some(v),
                ));
            }
        }
        out
    }

    /// Time passes with no reading: report `stale` once the threshold is crossed.
    pub fn on_idle(&mut self, now_s: f64) -> Vec<HealthEvent> {
        match (self.cfg.stale_s, self.last_arrival) {
            (Some(s), Some(last)) if !self.stale && now_s - last > s => {
                self.stale = true;
                vec![self.ev("stale", now_s, None)]
            }
            _ => Vec::new(),
        }
    }

    /// The input was lost at `from_s` and is back at `to_s`.
    pub fn gap(&self, from_s: f64, to_s: f64) -> HealthEvent {
        HealthEvent {
            event: "gap",
            sensor: self.cfg.name.clone(),
            host_s: to_s,
            from_s: Some(from_s),
            value: None,
        }
    }
}

/// How a live input is followed.
#[derive(Clone, Debug, Default)]
pub struct FollowOptions {
    /// At the end of a file, wait for more lines.
    pub follow: bool,
    /// Stop after this many seconds.
    pub max_s: Option<f64>,
    /// Open the input again when it ends or fails (a device unplugged, a connection dropped).
    pub reconnect: bool,
}

/// Read `from` (`-`, `tcp:host:port`, or a file or device) a line at a time. `line(text, arrival)`
/// gets each whole line with its host arrival time; `idle(now)` is called about every 100 ms while
/// nothing arrives; `gap(from, to)` when a reconnect brought the input back.
pub fn follow(
    from: &str,
    opts: &FollowOptions,
    mut line: impl FnMut(&str, f64) -> Result<(), String>,
    mut idle: impl FnMut(f64) -> Result<(), String>,
    mut gap: impl FnMut(f64, f64) -> Result<(), String>,
) -> Result<(), String> {
    use std::io::Read;
    let start = Instant::now();
    let over = || {
        opts.max_s
            .is_some_and(|m| start.elapsed().as_secs_f64() >= m)
    };
    let open = || -> Result<Box<dyn Read + Send>, String> {
        let io = |e: std::io::Error| format!("{from}: {e}");
        Ok(if from == "-" {
            Box::new(std::io::stdin())
        } else if let Some(addr) = from.strip_prefix("tcp:") {
            let s = std::net::TcpStream::connect(addr).map_err(io)?;
            Box::new(s)
        } else {
            Box::new(std::fs::File::open(from).map_err(io)?)
        })
    };
    // A reader thread hands lines over, so idle time is seen while a read blocks.
    let (tx, rx) = std::sync::mpsc::channel::<Result<Option<String>, String>>();
    let spawn = |mut r: Box<dyn Read + Send>, tx: std::sync::mpsc::Sender<_>, follow: bool| {
        std::thread::spawn(move || {
            let mut buf = Vec::new();
            let mut chunk = [0u8; 8192];
            loop {
                match r.read(&mut chunk) {
                    Ok(0) if follow => std::thread::sleep(Duration::from_millis(50)),
                    Ok(0) => {
                        if !buf.is_empty() {
                            let _ = tx.send(Ok(Some(String::from_utf8_lossy(&buf).into_owned())));
                        }
                        let _ = tx.send(Ok(None));
                        return;
                    }
                    Ok(n) => {
                        buf.extend_from_slice(&chunk[..n]);
                        while let Some(p) = buf.iter().position(|&b| b == b'\n') {
                            let l: Vec<u8> = buf.drain(..=p).collect();
                            if tx
                                .send(Ok(Some(String::from_utf8_lossy(&l).into_owned())))
                                .is_err()
                            {
                                return;
                            }
                        }
                    }
                    Err(e) if e.kind() == std::io::ErrorKind::Interrupted => {}
                    Err(e) => {
                        let _ = tx.send(Err(e.to_string()));
                        return;
                    }
                }
            }
        });
    };
    spawn(open()?, tx.clone(), opts.follow);
    let mut lost_at: Option<f64> = None;
    let mut next_try = Instant::now();
    while !over() {
        if let Some(from_s) = lost_at {
            if Instant::now() >= next_try {
                match open() {
                    Ok(r) => {
                        spawn(r, tx.clone(), opts.follow);
                        gap(from_s, host_now())?;
                        lost_at = None;
                    }
                    Err(_) => next_try = Instant::now() + Duration::from_secs(1),
                }
            }
        }
        match rx.recv_timeout(Duration::from_millis(100)) {
            Ok(Ok(Some(l))) => line(&l, host_now())?,
            Ok(Ok(None)) | Ok(Err(_)) if opts.reconnect && lost_at.is_none() => {
                lost_at = Some(host_now());
                next_try = Instant::now() + Duration::from_secs(1);
            }
            Ok(Ok(None)) => {
                if lost_at.is_none() {
                    return Ok(());
                }
            }
            Ok(Err(e)) => {
                if lost_at.is_none() {
                    return Err(format!("{from}: {e}"));
                }
            }
            Err(_) => idle(host_now())?,
        }
    }
    Ok(())
}

/// Take the health flags (`--sensor <name>`, `--stale-s`, `--frozen-n`, `--range lo,hi`,
/// `--latency-s`, `--reconnect`) out of `args`; the settings, whether to reconnect, and the other
/// arguments.
pub fn split_args(
    args: &[String],
    default_name: &str,
) -> Result<(HealthConfig, bool, Vec<String>), String> {
    let bad = |k: &str| crate::terr!("e-live-health-flag", name = k.to_string());
    let mut cfg = HealthConfig {
        name: default_name.to_string(),
        ..Default::default()
    };
    let (mut reconnect, mut rest, mut i) = (false, Vec::new(), 0);
    while i < args.len() {
        let k = args[i].as_str();
        let v = args.get(i + 1);
        let num = |v: Option<&String>| {
            v.and_then(|v| v.parse::<f64>().ok())
                .filter(|x| x.is_finite())
        };
        match k {
            "--reconnect" => {
                reconnect = true;
                i += 1;
                continue;
            }
            "--sensor" => cfg.name = v.ok_or_else(|| bad(k))?.clone(),
            "--stale-s" => cfg.stale_s = Some(num(v).filter(|x| *x > 0.0).ok_or_else(|| bad(k))?),
            "--latency-s" => cfg.latency_s = num(v).ok_or_else(|| bad(k))?,
            "--frozen-n" => {
                cfg.frozen_n = Some(
                    v.and_then(|v| v.parse::<u32>().ok())
                        .filter(|n| *n >= 2)
                        .ok_or_else(|| bad(k))?,
                )
            }
            "--range" => {
                let (lo, hi) = v
                    .and_then(|v| v.split_once(','))
                    .and_then(|(a, b)| {
                        Some((a.trim().parse::<f64>().ok()?, b.trim().parse::<f64>().ok()?))
                    })
                    .filter(|(a, b)| a.is_finite() && b.is_finite() && a <= b)
                    .ok_or_else(|| bad(k))?;
                cfg.range = Some((lo, hi));
            }
            _ => {
                rest.push(args[i].clone());
                i += 1;
                continue;
            }
        }
        i += 2;
    }
    Ok((cfg, reconnect, rest))
}

/// Print `v` as one JSON line with `host_s` added (when given), and flush.
pub fn print_line<T: Serialize>(v: &T, host_s: Option<f64>) -> Result<(), String> {
    use std::io::Write;
    let mut j = serde_json::to_value(v).map_err(|e| e.to_string())?;
    if let (Some(h), Some(o)) = (host_s, j.as_object_mut()) {
        o.insert("host_s".into(), serde_json::json!(h));
    }
    let mut out = std::io::stdout().lock();
    writeln!(out, "{j}")
        .and_then(|()| out.flush())
        .map_err(|e| e.to_string())
}

/// Print health events.
pub fn print_events(events: &[HealthEvent]) -> Result<(), String> {
    events.iter().try_for_each(|e| print_line(e, None))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn cfg() -> HealthConfig {
        HealthConfig {
            name: "gnss".into(),
            stale_s: Some(2.0),
            frozen_n: Some(3),
            range: Some((-1.0, 1.0)),
            latency_s: 0.25,
        }
    }

    #[test]
    fn stale_frozen_and_range_are_reported_once_each_way() {
        let mut h = Health::new(cfg());
        assert_eq!(h.stamp(100.0), 99.75);
        assert!(h.on_reading(100.0, Some(0.1)).is_empty());
        assert!(h.on_idle(101.0).is_empty());
        let e = h.on_idle(102.5);
        assert_eq!(e[0].event, "stale");
        assert!(h.on_idle(103.0).is_empty(), "reported once");
        let e = h.on_reading(103.1, Some(0.1));
        assert_eq!(e[0].event, "stale-cleared");
        let e = h.on_reading(104.0, Some(0.1));
        assert_eq!(e[0].event, "frozen", "three identical values");
        let e = h.on_reading(105.0, Some(1.5));
        let kinds: Vec<&str> = e.iter().map(|x| x.event).collect();
        assert_eq!(kinds, ["frozen-cleared", "out-of-range"]);
        assert_eq!(h.on_reading(106.0, Some(0.0))[0].event, "in-range");
        let g = h.gap(10.0, 12.5);
        assert_eq!((g.event, g.from_s, g.host_s), ("gap", Some(10.0), 12.5));
    }
}
