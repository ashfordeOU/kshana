// SPDX-License-Identifier: AGPL-3.0-only
//! Linux timing-stack verification from status outputs and PPS data (`kshana timing-stack`,
//! docs/TIMING-STACK.md).
//!
//! Every check reads text a host already prints; nothing here touches a clock, a servo or a
//! device. The parsers of `kshana connect timing` ([`crate::time_server`], [`crate::ptp_mgmt`])
//! and of the clock logs ([`crate::clock_log`]) are reused.
//!
//! | subcommand | input | checks |
//! |---|---|---|
//! | `tai` | `pmc 'GET TIME_PROPERTIES_DATA_SET'`, `phc_ctl <dev> cmp`, optionally `chronyc tracking` | the PTP UTC offset against the leap-second table, `currentUtcOffsetValid`, `ptpTimescale`, and the PHC-to-system offset (a PTP-timescale PHC sits TAI−UTC from a UTC system clock; 0 s means the PHC was set to UTC); chrony's leap status and offset |
//! | `ts2phc` | a `ts2phc` log | lock state, offsets while locked, missed pulses, a stale alarm |
//! | `pps` | Linux PPS `assert` stamps | sequence gaps and repeats, the jitter of the host clock against the pulse and what it says about the path (kernel PPS or user-space DCD polling), a stale alarm |
//! | `shm` | `ntpshmmon` output | per-unit sample rate and offset, a stale alarm when a unit stops |
//! | `ntpq` | `ntpq -p` and optionally `ntpq -c rv` | misreports: a selected peer that is unreachable or long silent, a selected peer whose offset disagrees with the system offset, lines the column layout broke |
//! | `nts` | `chronyc -N authdata`, one or more clients | the NTS interoperability matrix: per server and client, the mode, AEAD algorithm, cookies and NAKs, and a verdict |
//!
//! **Staleness.** A source is stale when its last sample is older than `stale_after_s` (3 s by
//! default) at the capture's end (`--end`, Unix seconds or the clock the input uses) or between
//! two samples; the alarm carries the time it would have fired, `last + stale_after_s`.
//!
//! The thresholds (the jitter bands that separate a kernel PPS path from DCD polling, the stale
//! time, the offset limits) are this module's conventions: MODELLED.

use crate::clock_log::{read_line, ClockLogFormat};
use serde::Serialize;
use serde_json::{json, Value};

/// The honesty label.
pub const LABEL: &str =
    "MODELLED: checks of status outputs against stated thresholds (this module's conventions); \
read only, nothing is changed on the host.";

/// One finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// `error`, `warning` or `info`.
    pub severity: &'static str,
    /// What.
    pub check: &'static str,
    /// The value seen, when there is one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub value: Option<f64>,
    /// The source or unit it concerns.
    #[serde(skip_serializing_if = "String::is_empty")]
    pub source: String,
}

fn finding(
    severity: &'static str,
    check: &'static str,
    value: Option<f64>,
    source: &str,
) -> Finding {
    Finding {
        severity,
        check,
        value,
        source: source.to_string(),
    }
}

/// A staleness alarm.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Alarm {
    /// The source.
    pub source: String,
    /// Time of the last sample before the silence.
    pub last_t: f64,
    /// When the alarm fires: `last_t + stale_after_s`.
    pub alarm_t: f64,
    /// How long the silence lasted (to the next sample or the capture end), s.
    pub silent_s: f64,
}

/// Stale alarms of a sorted sample-time series.
pub fn stale_alarms(source: &str, times: &[f64], end: Option<f64>, after: f64) -> Vec<Alarm> {
    let mut out = Vec::new();
    for w in times.windows(2) {
        if w[1] - w[0] > after {
            out.push(Alarm {
                source: source.to_string(),
                last_t: w[0],
                alarm_t: w[0] + after,
                silent_s: w[1] - w[0],
            });
        }
    }
    if let (Some(&last), Some(e)) = (times.last(), end) {
        if e - last > after {
            out.push(Alarm {
                source: source.to_string(),
                last_t: last,
                alarm_t: last + after,
                silent_s: e - last,
            });
        }
    }
    out
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    Some(v[v.len() / 2])
}

fn rms_detrended(t: &[f64], y: &[f64]) -> Option<f64> {
    let n = t.len();
    if n < 3 {
        return None;
    }
    let nf = n as f64;
    let mt = t.iter().sum::<f64>() / nf;
    let my = y.iter().sum::<f64>() / nf;
    let sxx: f64 = t.iter().map(|x| (x - mt) * (x - mt)).sum();
    let b = if sxx > 0.0 {
        t.iter()
            .zip(y)
            .map(|(x, v)| (x - mt) * (v - my))
            .sum::<f64>()
            / sxx
    } else {
        0.0
    };
    let ss: f64 = t
        .iter()
        .zip(y)
        .map(|(x, v)| {
            let r = v - my - b * (x - mt);
            r * r
        })
        .sum();
    Some((ss / (nf - 2.0)).sqrt())
}

// ───────────────────────────── tai ─────────────────────────────

/// `phc_ctl ... cmp`: the offset it prints, s (`offset from CLOCK_REALTIME is <n>ns`).
pub fn parse_phc_ctl_cmp(text: &str) -> Option<f64> {
    let i = text.find("offset from CLOCK_REALTIME is")?;
    let rest = text[i + "offset from CLOCK_REALTIME is".len()..].trim_start();
    let num: String = rest
        .chars()
        .take_while(|c| c.is_ascii_digit() || *c == '-' || *c == '+')
        .collect();
    let ns: i64 = num.parse().ok()?;
    Some(ns as f64 * 1e-9)
}

/// The `tai` check.
pub fn check_tai(
    pmc: Option<&str>,
    phc_ctl: Option<&str>,
    chrony: Option<&str>,
    tai_utc_s: f64,
) -> Value {
    let mut f = Vec::new();
    let mut ptp_timescale: Option<bool> = None;
    let mut utc_offset: Option<f64> = None;
    if let Some(t) = pmc {
        let blocks = crate::ptp_mgmt::parse_pmc(t);
        let tp = blocks.iter().find(|b| b.id == "TIME_PROPERTIES_DATA_SET");
        match tp {
            None => f.push(finding("error", "pmc-no-time-properties", None, "")),
            Some(b) => {
                let num = |k: &str| b.fields.get(k).and_then(|v| v.parse::<f64>().ok());
                utc_offset = num("currentUtcOffset");
                ptp_timescale = num("ptpTimescale").map(|x| x != 0.0);
                if let Some(o) = utc_offset {
                    if (o - tai_utc_s).abs() > 0.5 {
                        f.push(finding(
                            "error",
                            "ptp-utc-offset-not-tai-utc",
                            Some(o),
                            "pmc",
                        ));
                    }
                }
                if num("currentUtcOffsetValid") == Some(0.0) {
                    f.push(finding(
                        "warning",
                        "ptp-utc-offset-not-valid",
                        Some(0.0),
                        "pmc",
                    ));
                }
                if ptp_timescale == Some(false) {
                    f.push(finding("warning", "ptp-arb-timescale", Some(0.0), "pmc"));
                }
            }
        }
    }
    let mut phc_minus_sys: Option<f64> = None;
    if let Some(t) = phc_ctl {
        match parse_phc_ctl_cmp(t) {
            None => f.push(finding("error", "phc-ctl-unreadable", None, "")),
            Some(o) => {
                phc_minus_sys = Some(o);
                let expect = utc_offset.unwrap_or(tai_utc_s);
                let a = o.abs();
                if a < 0.5 {
                    // The PHC reads UTC: wrong when the domain is on the PTP (TAI) timescale.
                    if ptp_timescale != Some(false) {
                        f.push(finding("error", "phc-on-utc", Some(o), "phc_ctl"));
                    }
                } else if (a - expect).abs() > 1e-3 {
                    f.push(finding(
                        "error",
                        "phc-offset-unexplained",
                        Some(o),
                        "phc_ctl",
                    ));
                }
                // The sign phc_ctl prints is not interpreted here (to confirm per version).
            }
        }
    }
    if let Some(t) = chrony {
        match crate::time_server::parse_chrony_tracking(t) {
            Err(_) => f.push(finding("error", "chrony-tracking-unreadable", None, "")),
            Ok(tr) => {
                if let Some(l) = &tr.leap_status {
                    if l != "Normal" && l != "Insert second" && l != "Delete second" {
                        f.push(finding("error", "chrony-not-synchronised", None, "chrony"));
                    }
                }
                if let Some(o) = tr.system_offset_s {
                    if o.abs() > 1e-3 {
                        f.push(finding(
                            "warning",
                            "chrony-offset-over-1ms",
                            Some(o),
                            "chrony",
                        ));
                    }
                    if (o.abs() - tai_utc_s).abs() < 1.0 {
                        f.push(finding(
                            "error",
                            "chrony-offset-is-tai-utc",
                            Some(o),
                            "chrony",
                        ));
                    }
                }
            }
        }
    }
    json!({
        "schema": "kshana.timing-stack/1",
        "check": "tai",
        "label": LABEL,
        "tai_minus_utc_s": tai_utc_s,
        "ptp_current_utc_offset_s": utc_offset,
        "ptp_timescale": ptp_timescale,
        "phc_minus_system_s": phc_minus_sys,
        "findings": f,
        "ok": f.iter().all(|x| x.severity != "error"),
    })
}

// ───────────────────────────── ts2phc and pps ─────────────────────────────

/// The `ts2phc` check.
pub fn check_ts2phc(text: &str, end: Option<f64>, stale_after: f64, max_offset_s: f64) -> Value {
    let r: Vec<_> = text
        .lines()
        .filter_map(|l| read_line(ClockLogFormat::Ts2phc, l))
        .collect();
    let mut f = Vec::new();
    let times: Vec<f64> = r.iter().map(|x| x.t_s).collect();
    let locked: Vec<_> = r.iter().filter(|x| x.locked == Some(true)).collect();
    let offs: Vec<f64> = locked.iter().map(|x| x.offset_s).collect();
    let max_abs = offs.iter().map(|x| x.abs()).fold(0.0, f64::max);
    if r.is_empty() {
        f.push(finding("error", "no-ts2phc-readings", None, ""));
    } else if locked.is_empty() {
        f.push(finding("error", "never-locked", None, ""));
    }
    if max_abs > max_offset_s {
        f.push(finding("warning", "offset-over-limit", Some(max_abs), ""));
    }
    let mut unlocks = 0;
    for w in r.windows(2) {
        if w[0].locked == Some(true) && w[1].locked == Some(false) {
            unlocks += 1;
        }
    }
    if unlocks > 0 {
        f.push(finding("warning", "lost-lock", Some(unlocks as f64), ""));
    }
    let missed: usize = times
        .windows(2)
        .map(|w| ((w[1] - w[0]).round() as i64 - 1).max(0) as usize)
        .sum();
    if missed > 0 {
        f.push(finding("warning", "missed-pulses", Some(missed as f64), ""));
    }
    let alarms = stale_alarms("ts2phc", &times, end, stale_after);
    json!({
        "schema": "kshana.timing-stack/1",
        "check": "ts2phc",
        "label": LABEL,
        "readings": r.len(),
        "locked_readings": locked.len(),
        "max_abs_offset_s": max_abs,
        "rms_offset_s": rms_detrended(&locked.iter().map(|x| x.t_s).collect::<Vec<_>>(), &offs),
        "missed_pulses": missed,
        "stale_alarms": alarms,
        "findings": f,
        "ok": f.iter().all(|x| x.severity != "error") && alarms.is_empty(),
    })
}

/// Jitter bands of the PPS path, s: below the first a kernel (interrupt) time stamp, above the
/// second user-space polling of the DCD line (TIOCMIWAIT), between them indeterminate.
pub const PPS_KERNEL_MAX_S: f64 = 20e-6;
/// See [`PPS_KERNEL_MAX_S`].
pub const PPS_POLLED_MIN_S: f64 = 50e-6;

/// The `pps` check.
pub fn check_pps(text: &str, end: Option<f64>, stale_after: f64) -> Value {
    let r: Vec<_> = text
        .lines()
        .filter_map(|l| read_line(ClockLogFormat::PpsAssert, l))
        .collect();
    let mut f = Vec::new();
    let mut gaps = 0u64;
    let mut repeats = 0u64;
    for w in r.windows(2) {
        match (w[0].seq, w[1].seq) {
            (Some(a), Some(b)) if b == a => repeats += 1,
            (Some(a), Some(b)) if b > a + 1 => gaps += b - a - 1,
            _ => {}
        }
    }
    // A repeated sequence number is the same pulse read twice: keep the first.
    let mut kept = Vec::new();
    for x in &r {
        if kept
            .last()
            .is_none_or(|p: &&crate::clock_log::LineReading| p.seq != x.seq)
        {
            kept.push(x);
        }
    }
    let t: Vec<f64> = kept.iter().map(|x| x.t_s).collect();
    let y: Vec<f64> = kept.iter().map(|x| x.offset_s).collect();
    let jitter = rms_detrended(&t, &y);
    let path = match jitter {
        Some(j) if j <= PPS_KERNEL_MAX_S => "kernel-pps",
        Some(j) if j >= PPS_POLLED_MIN_S => "dcd-polling-likely",
        Some(_) => "indeterminate",
        None => "unknown",
    };
    if r.is_empty() {
        f.push(finding("error", "no-pps-stamps", None, ""));
    }
    if gaps > 0 {
        f.push(finding(
            "warning",
            "missed-pulses",
            Some(gaps as f64),
            "pps",
        ));
    }
    if path == "dcd-polling-likely" {
        f.push(finding(
            "warning",
            "pps-jitter-suggests-polling",
            jitter,
            "pps",
        ));
    }
    let alarms = stale_alarms("pps", &t, end, stale_after);
    json!({
        "schema": "kshana.timing-stack/1",
        "check": "pps",
        "label": LABEL,
        "pulses": kept.len(),
        "repeated_reads": repeats,
        "missed_pulses": gaps,
        "jitter_rms_s": jitter,
        "path": path,
        "path_bands_s": [PPS_KERNEL_MAX_S, PPS_POLLED_MIN_S],
        "stale_alarms": alarms,
        "findings": f,
        "ok": f.iter().all(|x| x.severity != "error") && alarms.is_empty(),
    })
}

// ───────────────────────────── shm ─────────────────────────────

/// One `ntpshmmon` sample: unit, seen (receipt) time, clock time, real time.
#[derive(Clone, Debug, PartialEq)]
pub struct ShmSample {
    /// Unit (`NTP0`, `NTP1`, ...).
    pub unit: String,
    /// When the sample was seen, s.
    pub seen: f64,
    /// Clock − real, s.
    pub offset: f64,
}

/// Read `ntpshmmon` lines: `sample <unit> <seen> <clock> <real> ...` (as gpsd's `ntpshmmon`
/// prints them; the column order is to confirm per version).
pub fn parse_ntpshmmon(text: &str) -> Vec<ShmSample> {
    text.lines()
        .filter_map(|l| {
            let w: Vec<&str> = l.split_whitespace().collect();
            if w.len() < 5 || w[0] != "sample" {
                return None;
            }
            let seen: f64 = w[2].parse().ok()?;
            let clock: f64 = w[3].parse().ok()?;
            let real: f64 = w[4].parse().ok()?;
            Some(ShmSample {
                unit: w[1].to_string(),
                seen,
                offset: clock - real,
            })
        })
        .collect()
}

/// The `shm` check.
pub fn check_shm(text: &str, end: Option<f64>, stale_after: f64) -> Value {
    let s = parse_ntpshmmon(text);
    let mut units: Vec<String> = s.iter().map(|x| x.unit.clone()).collect();
    units.sort();
    units.dedup();
    let mut per = Vec::new();
    let mut alarms = Vec::new();
    for u in &units {
        let mine: Vec<&ShmSample> = s.iter().filter(|x| &x.unit == u).collect();
        let times: Vec<f64> = mine.iter().map(|x| x.seen).collect();
        let a = stale_alarms(u, &times, end, stale_after);
        per.push(json!({
            "unit": u,
            "samples": mine.len(),
            "median_interval_s": median(times.windows(2).map(|w| w[1] - w[0]).collect()),
            "median_offset_s": median(mine.iter().map(|x| x.offset).collect()),
            "last_seen": times.last(),
            "stale": !a.is_empty(),
        }));
        alarms.extend(a);
    }
    let mut f = Vec::new();
    if s.is_empty() {
        f.push(finding("error", "no-shm-samples", None, ""));
    }
    json!({
        "schema": "kshana.timing-stack/1",
        "check": "shm",
        "label": LABEL,
        "units": per,
        "stale_alarms": alarms,
        "findings": f,
        "ok": f.is_empty() && alarms.is_empty(),
    })
}

// ───────────────────────────── ntpq ─────────────────────────────

/// The `ntpq` misreport check.
pub fn check_ntpq(peers: &str, rv: Option<&str>) -> Value {
    let mut f = Vec::new();
    let parsed = crate::time_server::parse_ntpq_peers(peers).unwrap_or_default();
    // Body lines: after the `====` rule, not blank.
    let mut body = false;
    let mut lines = 0usize;
    for l in peers.lines() {
        if l.starts_with("====") {
            body = true;
            continue;
        }
        if body && !l.trim().is_empty() && !l.starts_with(' ') {
            lines += 1;
        }
    }
    if lines > parsed.len() {
        f.push(finding(
            "warning",
            "lines-not-parsed",
            Some((lines - parsed.len()) as f64),
            "",
        ));
    }
    let sys = parsed.iter().find(|p| p.tally == '*');
    match sys {
        None => f.push(finding("warning", "no-system-peer", None, "")),
        Some(p) => {
            if p.reach == 0 {
                f.push(finding(
                    "error",
                    "selected-peer-unreachable",
                    Some(0.0),
                    &p.remote,
                ));
            }
            if p.when_s.is_some_and(|w| w > 8.0 * p.poll_s) {
                f.push(finding(
                    "error",
                    "selected-peer-silent",
                    p.when_s,
                    &p.remote,
                ));
            }
            if let Some(rv) = rv {
                let v = crate::time_server::parse_varlist(rv);
                if let Some(o) = v.get("offset").and_then(|x| x.parse::<f64>().ok()) {
                    let tol = (10.0 * p.jitter_ms).max(1.0);
                    if (o - p.offset_ms).abs() > tol {
                        f.push(finding(
                            "warning",
                            "system-offset-disagrees-with-selected-peer",
                            Some(o - p.offset_ms),
                            &p.remote,
                        ));
                    }
                }
            }
        }
    }
    for p in &parsed {
        if p.tally != '*' && p.tally != 'o' && p.reach == 0 && p.when_s.is_some() {
            f.push(finding("info", "unreachable-peer", Some(0.0), &p.remote));
        }
    }
    json!({
        "schema": "kshana.timing-stack/1",
        "check": "ntpq",
        "label": LABEL,
        "peers": parsed.len(),
        "body_lines": lines,
        "findings": f,
        "ok": f.iter().all(|x| x.severity != "error"),
    })
}

// ───────────────────────────── nts ─────────────────────────────

/// One `chronyc -N authdata` row.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct AuthRow {
    /// Server name or address.
    pub server: String,
    /// `NTS`, `SK` (symmetric key) or `-`.
    pub mode: String,
    /// AEAD algorithm number (RFC 8915 registry) or key type.
    pub key_type: Option<u32>,
    /// Its name, when known.
    pub aead: &'static str,
    /// NAKs.
    pub naks: Option<u64>,
    /// Cookies held.
    pub cookies: Option<u64>,
    /// `ok`, `degraded` or `not-authenticated`.
    pub verdict: &'static str,
}

fn aead_name(t: Option<u32>) -> &'static str {
    match t {
        Some(15) => "AEAD_AES_SIV_CMAC_256",
        Some(30) => "AEAD_AES_128_GCM_SIV",
        Some(_) => "other",
        None => "",
    }
}

/// Read `chronyc -N authdata`: `Name/IP Mode KeyID Type KLen Last Atmp NAK Cook CLen`.
pub fn parse_authdata(text: &str) -> Vec<AuthRow> {
    let mut out = Vec::new();
    let mut body = false;
    for l in text.lines() {
        if l.starts_with("====") {
            body = true;
            continue;
        }
        let w: Vec<&str> = l.split_whitespace().collect();
        if !body || w.len() < 10 {
            continue;
        }
        let key_type = w[3].parse().ok();
        let naks = w[7].parse().ok();
        let cookies = w[8].parse().ok();
        let mode = w[1].to_string();
        let verdict = if mode != "NTS" {
            "not-authenticated"
        } else if naks.unwrap_or(0) > 0 || cookies == Some(0) {
            "degraded"
        } else {
            "ok"
        };
        out.push(AuthRow {
            server: w[0].to_string(),
            mode,
            key_type,
            aead: aead_name(key_type),
            naks,
            cookies,
            verdict,
        });
    }
    out
}

/// The NTS interoperability matrix over `(client, authdata text)` pairs.
pub fn check_nts(clients: &[(String, String)]) -> Value {
    let mut servers: Vec<String> = Vec::new();
    let mut cells = Vec::new();
    for (c, text) in clients {
        for r in parse_authdata(text) {
            if !servers.contains(&r.server) {
                servers.push(r.server.clone());
            }
            cells.push(json!({ "client": c, "row": r }));
        }
    }
    let bad = cells.iter().filter(|c| c["row"]["verdict"] != "ok").count();
    json!({
        "schema": "kshana.timing-stack/1",
        "check": "nts",
        "label": LABEL,
        "clients": clients.iter().map(|c| c.0.clone()).collect::<Vec<_>>(),
        "servers": servers,
        "matrix": cells,
        "not_ok": bad,
        "ok": bad == 0 && !cells.is_empty(),
    })
}

// ───────────────────────────── command line ─────────────────────────────

/// `kshana timing-stack <tai|ts2phc|pps|shm|ntpq|nts> ...`. Exit 0 when every check passes, 1 when
/// one fails or alarms, 2 on a usage or input error.
pub fn run_cli(args: &[String]) -> i32 {
    match cli(args) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn cli(args: &[String]) -> Result<i32, String> {
    let Some(sub) = args.first() else {
        return Err(crate::t!("timing-stack-usage"));
    };
    if sub == "--help" || sub == "-h" || args.iter().any(|a| a == "--help") {
        println!("{}", crate::t!("timing-stack-usage"));
        return Ok(0);
    }
    let mut pos = Vec::new();
    let mut kv: Vec<(String, String)> = Vec::new();
    let mut it = args[1..].iter();
    while let Some(a) = it.next() {
        if a.starts_with("--") {
            let v = it
                .next()
                .ok_or_else(|| crate::terr!("e-timing-stack-missing-value", option = a))?;
            kv.push((a.clone(), v.clone()));
        } else {
            pos.push(a.clone());
        }
    }
    let known: &[&str] = match sub.as_str() {
        "tai" => &["--pmc", "--phc-ctl", "--chrony", "--tai-utc", "--out"],
        "ts2phc" => &["--end", "--stale-after", "--max-offset", "--out"],
        "pps" | "shm" => &["--end", "--stale-after", "--out"],
        "ntpq" => &["--rv", "--out"],
        "nts" => &["--client", "--out"],
        _ => return Err(crate::t!("timing-stack-usage")),
    };
    if let Some((k, _)) = kv.iter().find(|(k, _)| !known.contains(&k.as_str())) {
        return Err(crate::terr!("e-timing-stack-unknown-option", option = k));
    }
    let get = |k: &str| kv.iter().rev().find(|p| p.0 == k).map(|p| p.1.clone());
    let num = |k: &str| -> Result<Option<f64>, String> {
        get(k)
            .map(|v| {
                v.parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite())
                    .ok_or_else(|| crate::terr!("e-timing-stack-bad-number", option = k, value = v))
            })
            .transpose()
    };
    let read = |p: &str| {
        std::fs::read_to_string(p)
            .map_err(|e| crate::terr!("e-timing-stack-cannot-read", path = p, e = e))
    };
    let one = || -> Result<String, String> {
        match pos.as_slice() {
            [p] => read(p),
            _ => Err(crate::t!("timing-stack-usage")),
        }
    };
    let stale = num("--stale-after")?.unwrap_or(3.0);
    let end = num("--end")?;
    let v = match sub.as_str() {
        "tai" => {
            let o = |k: &str| get(k).map(|p| read(&p)).transpose();
            let (pmc, phc, chrony) = (o("--pmc")?, o("--phc-ctl")?, o("--chrony")?);
            if pmc.is_none() && phc.is_none() && chrony.is_none() {
                return Err(crate::t!("timing-stack-usage"));
            }
            let tai_utc = match num("--tai-utc")? {
                Some(x) => x,
                None => crate::timescales::leap_second_table()
                    .last()
                    .map(|e| f64::from(e.3))
                    .unwrap_or(37.0),
            };
            check_tai(pmc.as_deref(), phc.as_deref(), chrony.as_deref(), tai_utc)
        }
        "ts2phc" => check_ts2phc(&one()?, end, stale, num("--max-offset")?.unwrap_or(1e-6)),
        "pps" => check_pps(&one()?, end, stale),
        "shm" => check_shm(&one()?, end, stale),
        "ntpq" => {
            let rv = get("--rv").map(|p| read(&p)).transpose()?;
            check_ntpq(&one()?, rv.as_deref())
        }
        "nts" => {
            let mut clients = Vec::new();
            for (k, v) in &kv {
                if k != "--client" {
                    continue;
                }
                let (name, path) = v.split_once('=').unwrap_or(("chrony", v.as_str()));
                clients.push((name.to_string(), read(path)?));
            }
            for p in &pos {
                clients.push(("chrony".to_string(), read(p)?));
            }
            if clients.is_empty() {
                return Err(crate::t!("timing-stack-usage"));
            }
            check_nts(&clients)
        }
        _ => unreachable!(),
    };
    let text = serde_json::to_string_pretty(&v).map_err(|e| e.to_string())? + "\n";
    match get("--out") {
        Some(p) => std::fs::write(&p, text)
            .map_err(|e| crate::terr!("e-timing-stack-cannot-write", path = p, e = e))?,
        None => print!("{text}"),
    }
    Ok(i32::from(v["ok"] != true))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn stale_alarm_times() {
        let t: Vec<f64> = (0..10).map(f64::from).collect();
        assert!(stale_alarms("x", &t, Some(10.0), 3.0).is_empty());
        let a = stale_alarms("x", &t, Some(30.0), 3.0);
        assert_eq!(a.len(), 1);
        assert_eq!(a[0].alarm_t, 12.0);
        let gap = [0.0, 1.0, 2.0, 9.0, 10.0];
        assert_eq!(stale_alarms("x", &gap, None, 3.0)[0].alarm_t, 5.0);
    }

    #[test]
    fn phc_ctl_and_authdata_parse() {
        assert_eq!(
            parse_phc_ctl_cmp("phc_ctl[1234.5]: offset from CLOCK_REALTIME is -37000000012ns\n"),
            Some(-37.000_000_012)
        );
        assert!(parse_phc_ctl_cmp("nothing").is_none());
        let a = "Name/IP address             Mode KeyID Type KLen Last Atmp  NAK Cook CLen\n\
=========================================================================\n\
nts.example.org              NTS     1   15  256  33m    0    0    8  100\n\
ntp.example.net                -     0    0    0    -    0    0    0    0\n";
        let r = parse_authdata(a);
        assert_eq!(r.len(), 2);
        assert_eq!(r[0].verdict, "ok");
        assert_eq!(r[0].aead, "AEAD_AES_SIV_CMAC_256");
        assert_eq!(r[1].verdict, "not-authenticated");
    }

    #[test]
    fn tai_checks() {
        let pmc = "sending: GET TIME_PROPERTIES_DATA_SET\n\
\t001122.fffe.334455-0 seq 0 RESPONSE MANAGEMENT TIME_PROPERTIES_DATA_SET\n\
\t\tcurrentUtcOffset      37\n\t\tleap61                0\n\t\tleap59                0\n\
\t\tcurrentUtcOffsetValid 1\n\t\tptpTimescale          1\n\t\ttimeTraceable         1\n\
\t\tfrequencyTraceable    1\n\t\ttimeSource            0x20\n";
        let good = check_tai(
            Some(pmc),
            Some("offset from CLOCK_REALTIME is -37000000050ns"),
            None,
            37.0,
        );
        assert_eq!(good["ok"], true, "{good}");
        let utc = check_tai(
            Some(pmc),
            Some("offset from CLOCK_REALTIME is 120ns"),
            None,
            37.0,
        );
        assert!(utc["findings"].to_string().contains("phc-on-utc"));
        let wrong = pmc.replace("currentUtcOffset      37", "currentUtcOffset      36");
        let w = check_tai(Some(&wrong), None, None, 37.0);
        assert!(w["findings"]
            .to_string()
            .contains("ptp-utc-offset-not-tai-utc"));
    }
}
