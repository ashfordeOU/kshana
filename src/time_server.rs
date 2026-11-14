// SPDX-License-Identifier: AGPL-3.0-only
//! Time-server health from chrony and ntpd (roadmap 0.42 I2): the text of `chronyc tracking` and
//! `chronyc sources`, of `ntpq -p` (the peers billboard) and `ntpq -c rv` (system variables), and the
//! NTP mode 6 control protocol that `ntpq` itself speaks (read status and read variables only).
//!
//! Read only: the only mode 6 requests this module builds are opcode 1 (read status) and opcode 2
//! (read variables). Write variables, configuration and trap requests are never built.
//!
//! Sources: chronyc(1) documentation, chrony 4.6 (`tracking` and `sources` sections, field meanings
//! and the example output); the ntpq documentation of NTP 4.2.8 (peers billboard columns and tally
//! codes); RFC 9327, *Control Messages Protocol for Use with Network Time Protocol Version 4*
//! (header layout, opcodes, fragmentation by offset and the More bit, status words).
//!
//! Signs: chrony reports the system clock as "fast" or "slow" of NTP time and the frequency error as
//! "fast" or "slow"; here a fast clock is positive (`system_offset_s` = system time minus NTP time,
//! `frequency_ppm` > 0 when the clock runs fast). The offsets of `chronyc sources` and `ntpq -p` are
//! carried with the sign the program printed.

use serde::Serialize;
use std::collections::BTreeMap;
use std::net::{SocketAddr, UdpSocket};
use std::time::Duration;

fn bad(what: &str, line: usize) -> String {
    crate::terr!("e-time-server-parse", what = what, line = line)
}

/// A number with a time unit as chrony prints it (`-479ns`, `43ms`, `1.5s`), in seconds.
pub fn chrony_seconds(s: &str) -> Option<f64> {
    let s = s.trim();
    // divide by the power of ten so that `43ms` is the f64 nearest 0.043
    let (num, div) = if let Some(n) = s.strip_suffix("ns") {
        (n, 1e9)
    } else if let Some(n) = s.strip_suffix("us") {
        (n, 1e6)
    } else if let Some(n) = s.strip_suffix("ms") {
        (n, 1e3)
    } else if let Some(n) = s.strip_suffix('s') {
        (n, 1.0)
    } else {
        (s, 1.0)
    };
    num.trim().parse::<f64>().ok().map(|v| v / div)
}

/// A chrony "last RX" age (`11`, `5m`, `2h`, `3d`, `1y`), in seconds; `None` for `-`.
fn chrony_age(s: &str) -> Option<f64> {
    let (n, k) = match s.chars().last()? {
        'm' => (&s[..s.len() - 1], 60.0),
        'h' => (&s[..s.len() - 1], 3600.0),
        'd' => (&s[..s.len() - 1], 86_400.0),
        'y' => (&s[..s.len() - 1], 31_536_000.0),
        _ => (s, 1.0),
    };
    n.parse::<f64>().ok().map(|v| v * k)
}

/// `chronyc tracking`.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct ChronyTracking {
    /// Reference ID (hex) and the name or address in brackets.
    pub reference_id: Option<String>,
    /// The reference's name or address.
    pub reference_name: Option<String>,
    /// Stratum.
    pub stratum: Option<u32>,
    /// Ref time (UTC), as printed.
    pub ref_time_utc: Option<String>,
    /// System time minus NTP time, s (positive: the system clock is fast).
    pub system_offset_s: Option<f64>,
    /// Last offset, s.
    pub last_offset_s: Option<f64>,
    /// RMS offset, s.
    pub rms_offset_s: Option<f64>,
    /// Frequency error, ppm (positive: the clock runs fast).
    pub frequency_ppm: Option<f64>,
    /// Residual frequency, ppm.
    pub residual_freq_ppm: Option<f64>,
    /// Skew, ppm.
    pub skew_ppm: Option<f64>,
    /// Root delay, s.
    pub root_delay_s: Option<f64>,
    /// Root dispersion, s.
    pub root_dispersion_s: Option<f64>,
    /// Update interval, s.
    pub update_interval_s: Option<f64>,
    /// Leap status (`Normal`, `Insert second`, `Delete second`, `Not synchronised`).
    pub leap_status: Option<String>,
}

fn first_num(v: &str) -> Option<f64> {
    v.split_whitespace().next()?.parse().ok()
}
fn signed_by(v: &str, minus: &str) -> Option<f64> {
    let x = first_num(v)?;
    Some(if v.contains(minus) { -x } else { x })
}

/// Parse `chronyc tracking` output. An unknown label is passed over; a known label whose value does
/// not parse is an error naming the line.
pub fn parse_chrony_tracking(text: &str) -> Result<ChronyTracking, String> {
    let mut t = ChronyTracking::default();
    let mut any = false;
    for (n, line) in text.lines().enumerate() {
        let Some((k, v)) = line.split_once(':') else {
            continue;
        };
        let (k, v) = (k.trim(), v.trim());
        let ok = match k {
            "Reference ID" => {
                let mut it = v.splitn(2, ' ');
                t.reference_id = it.next().map(str::to_string);
                t.reference_name = it.next().map(|s| {
                    s.trim()
                        .trim_start_matches('(')
                        .trim_end_matches(')')
                        .to_string()
                });
                true
            }
            "Stratum" => {
                t.stratum = v.parse().ok();
                t.stratum.is_some()
            }
            "Ref time (UTC)" => {
                t.ref_time_utc = Some(v.to_string());
                true
            }
            "System time" => {
                t.system_offset_s = signed_by(v, "slow");
                t.system_offset_s.is_some()
            }
            "Last offset" => {
                t.last_offset_s = first_num(v);
                t.last_offset_s.is_some()
            }
            "RMS offset" => {
                t.rms_offset_s = first_num(v);
                t.rms_offset_s.is_some()
            }
            "Frequency" => {
                t.frequency_ppm = signed_by(v, "slow");
                t.frequency_ppm.is_some()
            }
            "Residual freq" => {
                t.residual_freq_ppm = first_num(v);
                t.residual_freq_ppm.is_some()
            }
            "Skew" => {
                t.skew_ppm = first_num(v);
                t.skew_ppm.is_some()
            }
            "Root delay" => {
                t.root_delay_s = first_num(v);
                t.root_delay_s.is_some()
            }
            "Root dispersion" => {
                t.root_dispersion_s = first_num(v);
                t.root_dispersion_s.is_some()
            }
            "Update interval" => {
                t.update_interval_s = first_num(v);
                t.update_interval_s.is_some()
            }
            "Leap status" => {
                t.leap_status = Some(v.to_string());
                true
            }
            _ => continue,
        };
        if !ok {
            return Err(bad(k, n + 1));
        }
        any = true;
    }
    if !any {
        return Err(bad("tracking", 0));
    }
    Ok(t)
}

/// One row of `chronyc sources`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ChronySource {
    /// Mode: `^` server, `=` peer, `#` local reference clock.
    pub mode: char,
    /// State: `*` selected, `+` combined, `-` not combined, `?` unusable, `x` falseticker,
    /// `~` too variable.
    pub state: char,
    /// Name or address.
    pub name: String,
    /// Stratum.
    pub stratum: u32,
    /// Poll interval, log2 s.
    pub poll: i32,
    /// Reach register (octal as printed, here as a number).
    pub reach: u32,
    /// Seconds since the last good sample (`None` when printed as `-`).
    pub last_rx_s: Option<f64>,
    /// Adjusted offset of the last sample, s.
    pub offset_s: Option<f64>,
    /// Measured offset of the last sample, s.
    pub measured_offset_s: Option<f64>,
    /// Error margin, s.
    pub error_s: Option<f64>,
}

/// Parse `chronyc sources` output (the table below the `====` rule).
pub fn parse_chrony_sources(text: &str) -> Result<Vec<ChronySource>, String> {
    let mut out = Vec::new();
    let mut body = false;
    for (n, line) in text.lines().enumerate() {
        if line.starts_with("====") {
            body = true;
            continue;
        }
        if !body || line.trim().is_empty() {
            continue;
        }
        let row = (|| {
            let mut ch = line.chars();
            let (mode, state) = (ch.next()?, ch.next()?);
            let rest = line.get(2..)?;
            // five columns (name, stratum, poll, reach, last RX), then the last sample
            let mut idx = 0usize;
            let bytes = rest.as_bytes();
            let mut head: Vec<&str> = Vec::with_capacity(5);
            while head.len() < 5 {
                while idx < bytes.len() && bytes[idx] == b' ' {
                    idx += 1;
                }
                let start = idx;
                while idx < bytes.len() && bytes[idx] != b' ' {
                    idx += 1;
                }
                if start == idx {
                    return None;
                }
                head.push(&rest[start..idx]);
            }
            let tail = &rest[idx..];
            let (off, rest2) = tail.split_once('[')?;
            let (meas, rest3) = rest2.split_once(']')?;
            let err = rest3.trim().strip_prefix("+/-")?;
            Some(ChronySource {
                mode,
                state,
                name: head[0].to_string(),
                stratum: head[1].parse().ok()?,
                poll: head[2].parse().ok()?,
                reach: u32::from_str_radix(head[3], 8).ok()?,
                last_rx_s: chrony_age(head[4]),
                offset_s: chrony_seconds(&off.replace(' ', "")),
                measured_offset_s: chrony_seconds(&meas.replace(' ', "")),
                error_s: chrony_seconds(&err.replace(' ', "")),
            })
        })();
        match row {
            Some(r) => out.push(r),
            None => return Err(bad("sources", n + 1)),
        }
    }
    Ok(out)
}

/// One row of `ntpq -p`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct NtpqPeer {
    /// Tally code: ` ` reject, `x` falseticker, `.` excess, `-` outlier, `+` candidate, `#` backup,
    /// `*` system peer, `o` PPS peer.
    pub tally: char,
    /// Remote.
    pub remote: String,
    /// Reference id.
    pub refid: String,
    /// Stratum.
    pub stratum: u32,
    /// Type (`u` unicast, `b` broadcast, `l` local, ...).
    pub kind: String,
    /// Seconds since the last packet (`None` when printed as `-`).
    pub when_s: Option<f64>,
    /// Poll interval, s.
    pub poll_s: f64,
    /// Reach register (octal).
    pub reach: u32,
    /// Delay, ms.
    pub delay_ms: f64,
    /// Offset, ms.
    pub offset_ms: f64,
    /// Jitter (or dispersion in older versions), ms.
    pub jitter_ms: f64,
}

fn ntpq_age(s: &str) -> Option<f64> {
    if s == "-" {
        return None;
    }
    chrony_age(s)
}

/// Parse `ntpq -p` (or `-pn`) output. A remote too long for its column, printed alone on a line, is
/// joined with the line that follows.
pub fn parse_ntpq_peers(text: &str) -> Result<Vec<NtpqPeer>, String> {
    let mut out = Vec::new();
    let mut body = false;
    let mut pending: Option<String> = None;
    for (n, line) in text.lines().enumerate() {
        if line.starts_with("====") {
            body = true;
            continue;
        }
        if !body || line.trim().is_empty() {
            continue;
        }
        let line = match pending.take() {
            Some(p) => format!("{p} {}", line.trim_start()),
            None => line.to_string(),
        };
        let tally = line.chars().next().unwrap_or(' ');
        let w: Vec<&str> = line.get(1..).unwrap_or("").split_whitespace().collect();
        if w.len() == 1 {
            pending = Some(line.clone());
            continue;
        }
        let row = (|| {
            if w.len() < 10 {
                return None;
            }
            Some(NtpqPeer {
                tally,
                remote: w[0].to_string(),
                refid: w[1].to_string(),
                stratum: w[2].parse().ok()?,
                kind: w[3].to_string(),
                when_s: ntpq_age(w[4]),
                poll_s: chrony_age(w[5])?,
                reach: u32::from_str_radix(w[6], 8).ok()?,
                delay_ms: w[7].parse().ok()?,
                offset_ms: w[8].parse().ok()?,
                jitter_ms: w[9].parse().ok()?,
            })
        })();
        match row {
            Some(r) => out.push(r),
            None => return Err(bad("peers", n + 1)),
        }
    }
    Ok(out)
}

/// Parse an NTP variable list (`ntpq -c rv` output, or the data of a mode 6 read-variables
/// response): `name=value` pairs separated by commas, values optionally in double quotes (which may
/// hold commas). A leading `associd=0 status=0615 leap_none, ...` line is read too: its words without
/// `=` are kept under `status_text`.
pub fn parse_varlist(text: &str) -> BTreeMap<String, String> {
    let mut out = BTreeMap::new();
    let mut words: Vec<String> = Vec::new();
    let mut cur = String::new();
    let mut quoted = false;
    let mut items = Vec::new();
    for c in text.chars() {
        match c {
            '"' => {
                quoted = !quoted;
                cur.push(c);
            }
            ',' | '\n' | '\r' if !quoted => {
                items.push(std::mem::take(&mut cur));
            }
            _ => cur.push(c),
        }
    }
    items.push(cur);
    // A word without `=` continues the value before it (ntpq prints `reftime=<hex>  Sat, Nov 14 ...`
    // unquoted); words after `status=` are the status text (`leap_none, sync_ntp, ...`).
    let mut last: Option<String> = None;
    for it in items {
        let it = it.trim();
        if it.is_empty() {
            continue;
        }
        let parts: Vec<&str> = if it.contains('"') {
            vec![it]
        } else {
            it.split_whitespace().collect()
        };
        let mut first = true;
        for p in parts {
            match p.split_once('=') {
                Some((k, v)) => {
                    out.insert(k.trim().to_string(), v.trim().trim_matches('"').to_string());
                    last = Some(k.trim().to_string());
                }
                None => match last.as_deref() {
                    Some(k) if k != "status" && k != "associd" => {
                        if let Some(v) = out.get_mut(k) {
                            v.push_str(if first { ", " } else { " " });
                            v.push_str(p);
                        }
                    }
                    _ => words.push(p.to_string()),
                },
            }
            first = false;
        }
    }
    if !words.is_empty() {
        out.insert("status_text".into(), words.join(" "));
    }
    out
}

/// The health of one time server, in common terms, from whichever source was read.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Health {
    /// `chrony` or `ntpd`.
    pub daemon: String,
    /// Whether the daemon reports itself synchronised (chrony: leap status other than
    /// `Not synchronised` and stratum below 16; ntpd: leap indicator other than 11 and stratum below 16).
    pub synchronised: Option<bool>,
    /// Stratum.
    pub stratum: Option<u32>,
    /// The reference (name, address or refid).
    pub reference: Option<String>,
    /// Offset of the system clock from its reference, s (chrony: system time minus NTP time;
    /// ntpd: the `offset` variable, converted from ms).
    pub offset_s: Option<f64>,
    /// Root delay, s.
    pub root_delay_s: Option<f64>,
    /// Root dispersion, s.
    pub root_dispersion_s: Option<f64>,
    /// Leap state as the daemon names it.
    pub leap: Option<String>,
    /// Sources or peers listed, and how many are reachable (reach register non-zero).
    pub sources: Option<(usize, usize)>,
    /// The selected source or system peer.
    pub selected: Option<String>,
}

/// Health from `chronyc tracking` and, optionally, `chronyc sources`.
pub fn health_chrony(t: &ChronyTracking, sources: Option<&[ChronySource]>) -> Health {
    let leap = t.leap_status.clone();
    Health {
        daemon: "chrony".into(),
        synchronised: match (&leap, t.stratum) {
            (Some(l), Some(s)) => Some(l != "Not synchronised" && s < 16),
            _ => None,
        },
        stratum: t.stratum,
        reference: t.reference_name.clone().or(t.reference_id.clone()),
        offset_s: t.system_offset_s,
        root_delay_s: t.root_delay_s,
        root_dispersion_s: t.root_dispersion_s,
        leap,
        sources: sources.map(|s| (s.len(), s.iter().filter(|x| x.reach != 0).count())),
        selected: sources.and_then(|s| s.iter().find(|x| x.state == '*').map(|x| x.name.clone())),
    }
}

/// Health from ntpd system variables (`ntpq -c rv`, or a mode 6 read) and, optionally, the peers.
pub fn health_ntpd(vars: &BTreeMap<String, String>, peers: Option<&[NtpqPeer]>) -> Health {
    let num = |k: &str| vars.get(k).and_then(|v| v.parse::<f64>().ok());
    let leap = vars.get("leap").cloned();
    let stratum = num("stratum").map(|v| v as u32);
    Health {
        daemon: "ntpd".into(),
        synchronised: match (&leap, stratum) {
            (Some(l), Some(s)) => Some(l != "11" && l != "3" && s < 16),
            _ => None,
        },
        stratum,
        reference: vars.get("refid").cloned(),
        offset_s: num("offset").map(|v| v / 1e3),
        root_delay_s: num("rootdelay").map(|v| v / 1e3),
        root_dispersion_s: num("rootdisp").map(|v| v / 1e3),
        leap,
        sources: peers.map(|p| (p.len(), p.iter().filter(|x| x.reach != 0).count())),
        selected: peers.and_then(|p| p.iter().find(|x| x.tally == '*').map(|x| x.remote.clone())),
    }
}

// ----------------------------------------------------------------------------- mode 6

/// Read status.
pub const OP_READ_STATUS: u8 = 1;
/// Read variables.
pub const OP_READ_VARIABLES: u8 = 2;

/// A mode 6 control message (RFC 9327 figure 1).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Control {
    /// Version number.
    pub version: u8,
    /// Response bit.
    pub response: bool,
    /// Error bit.
    pub error: bool,
    /// More bit.
    pub more: bool,
    /// Opcode.
    pub opcode: u8,
    /// Sequence number.
    pub sequence: u16,
    /// Status word.
    pub status: u16,
    /// Association id.
    pub association: u16,
    /// Offset of this fragment's data.
    pub offset: u16,
    /// The data.
    pub data: Vec<u8>,
}

/// Encode a control message, padded to a multiple of 4 octets. Only read status and read
/// variables are encoded (and their responses, for the loopback test server); any other opcode gives
/// `None`.
pub fn encode_control(c: &Control) -> Option<Vec<u8>> {
    if !matches!(c.opcode, OP_READ_STATUS | OP_READ_VARIABLES) || c.data.len() > 468 {
        return None;
    }
    let mut b = vec![
        (c.version & 7) << 3 | 6,
        u8::from(c.response) << 7
            | u8::from(c.error) << 6
            | u8::from(c.more) << 5
            | (c.opcode & 0x1F),
    ];
    for v in [
        c.sequence,
        c.status,
        c.association,
        c.offset,
        c.data.len() as u16,
    ] {
        b.extend(v.to_be_bytes());
    }
    b.extend(&c.data);
    while !b.len().is_multiple_of(4) {
        b.push(0);
    }
    Some(b)
}

/// Decode a control message.
pub fn decode_control(b: &[u8]) -> Option<Control> {
    if b.len() < 12 || b[0] & 7 != 6 {
        return None;
    }
    let be = |o: usize| u16::from_be_bytes([b[o], b[o + 1]]);
    let count = usize::from(be(10));
    Some(Control {
        version: (b[0] >> 3) & 7,
        response: b[1] & 0x80 != 0,
        error: b[1] & 0x40 != 0,
        more: b[1] & 0x20 != 0,
        opcode: b[1] & 0x1F,
        sequence: be(2),
        status: be(4),
        association: be(6),
        offset: be(8),
        data: b.get(12..12 + count)?.to_vec(),
    })
}

/// The fields of a system status word (RFC 9327 section 3.1).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct SystemStatus {
    /// Leap indicator (3 = unsynchronised).
    pub leap: u8,
    /// Clock source (6 = UDP/NTP, 4 = satellite, 1 = calibrated atomic clock or PPS).
    pub source: u8,
    /// System event counter.
    pub event_count: u8,
    /// Last system event code.
    pub event_code: u8,
}

/// Split a system status word.
pub fn system_status(w: u16) -> SystemStatus {
    SystemStatus {
        leap: (w >> 14) as u8,
        source: ((w >> 8) & 0x3F) as u8,
        event_count: ((w >> 4) & 0xF) as u8,
        event_code: (w & 0xF) as u8,
    }
}

/// What a read-variables query returned.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ReadVars {
    /// The status word of the response.
    pub status: u16,
    /// The status word split (meaningful for association 0, the system).
    pub system_status: SystemStatus,
    /// The variables.
    pub variables: BTreeMap<String, String>,
}

/// Send a read-variables request for `association` (0 = the system) to an ntpd and reassemble the
/// response fragments by their offsets.
pub fn query_readvars(
    target: SocketAddr,
    association: u16,
    timeout: Duration,
) -> Result<ReadVars, String> {
    let bind = if target.is_ipv4() {
        "0.0.0.0:0"
    } else {
        "[::]:0"
    };
    let sock = UdpSocket::bind(bind).map_err(|e| e.to_string())?;
    sock.set_read_timeout(Some(timeout))
        .map_err(|e| e.to_string())?;
    let seq: u16 = 1;
    let req = encode_control(&Control {
        version: 2,
        response: false,
        error: false,
        more: false,
        opcode: OP_READ_VARIABLES,
        sequence: seq,
        status: 0,
        association,
        offset: 0,
        data: Vec::new(),
    })
    .ok_or_else(|| crate::terr!("e-ntp-mode6", why = "encode"))?;
    sock.send_to(&req, target).map_err(|e| e.to_string())?;
    let mut frags: BTreeMap<u16, Vec<u8>> = BTreeMap::new();
    let mut last_seen = false;
    let mut status = 0u16;
    let mut buf = [0u8; 2048];
    while !(last_seen && contiguous(&frags)) {
        let (n, from) = sock
            .recv_from(&mut buf)
            .map_err(|_| crate::terr!("e-ntp-mode6", why = "timeout"))?;
        if from != target {
            continue;
        }
        let Some(c) = decode_control(&buf[..n]) else {
            continue;
        };
        if !c.response || c.sequence != seq || c.opcode != OP_READ_VARIABLES {
            continue;
        }
        if c.error {
            return Err(crate::terr!("e-ntp-mode6", why = "error"));
        }
        status = c.status;
        if !c.more {
            last_seen = true;
        }
        frags.insert(c.offset, c.data);
    }
    let data: Vec<u8> = frags.into_values().flatten().collect();
    Ok(ReadVars {
        status,
        system_status: system_status(status),
        variables: parse_varlist(&String::from_utf8_lossy(&data)),
    })
}

fn contiguous(f: &BTreeMap<u16, Vec<u8>>) -> bool {
    let mut next = 0usize;
    for (&o, d) in f {
        if usize::from(o) != next {
            return false;
        }
        next += d.len();
    }
    true
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn units_and_ages() {
        assert_eq!(chrony_seconds("-479ns"), Some(-479e-9));
        assert_eq!(chrony_seconds("43ms"), Some(0.043));
        assert_eq!(chrony_seconds("-2629us"), Some(-2629e-6));
        assert_eq!(chrony_age("5m"), Some(300.0));
        assert_eq!(chrony_age("11"), Some(11.0));
    }

    #[test]
    fn a_status_word_splits_into_its_fields() {
        // 0x0615: leap 0, source 6 (UDP/NTP), 1 event, code 5 (clock synchronized)
        let s = system_status(0x0615);
        assert_eq!(
            (s.leap, s.source, s.event_count, s.event_code),
            (0, 6, 1, 5)
        );
    }

    #[test]
    fn write_and_other_opcodes_are_never_encoded() {
        let mut c = Control {
            version: 2,
            response: false,
            error: false,
            more: false,
            opcode: 3,
            sequence: 1,
            status: 0,
            association: 0,
            offset: 0,
            data: vec![],
        };
        assert!(encode_control(&c).is_none());
        c.opcode = 8;
        assert!(encode_control(&c).is_none());
        c.opcode = OP_READ_VARIABLES;
        assert_eq!(encode_control(&c).unwrap().len(), 12);
    }
}
