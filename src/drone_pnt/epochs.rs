// SPDX-License-Identifier: AGPL-3.0-only
//! The receiver epochs and arming events of a flight log, from a PX4 ULog, an ArduPilot DataFlash
//! log or a JSON Lines file.
//!
//! * **ULog** (PX4): topics `sensor_gps` / `vehicle_gps_position` (either field set the ULog reader
//!   knows: `lat`/`lon` in 1e-7 degrees or `latitude_deg`/`longitude_deg`; `eph`, `epv`, `hdop`,
//!   `vel_m_s`, `s_variance_m_s`, `satellites_used`, `fix_type`, `time_utc_usec`,
//!   `jamming_state`, `spoofing_state`, `jamming_indicator`, `noise_per_ms`,
//!   `automatic_gain_control`, `authentication_state`) and `vehicle_status` (`arming_state`, 2 =
//!   armed). The jamming and spoofing state codes are PX4's (`sensor_gps`/`SensorGnss` message
//!   definitions): 0 unknown, 1 OK/none, 2 warning/indicated (older releases) or mitigated (newer),
//!   3 critical/multiple or detected.
//! * **DataFlash** (ArduPilot): `GPS` (`I`, `Status`, `NSats`, `HDop`, `Lat`, `Lng`, `Alt`, `Spd`,
//!   `GWk`, `GMS`), `GPA` (`I`, `HAcc`, `VAcc`, `SAcc`), `UBX1` (`Instance`, `noisePerMS`, `jamInd`,
//!   `agcCnt`) and `ARM` (`ArmState`). `GPA` and `UBX1` attach to the latest `GPS` epoch of the same
//!   instance. The receiver time is the GPS week and milliseconds (GPS time, not UTC: the clock
//!   check uses its steps only).
//! * **JSON Lines**: one object per line, either an epoch (`t_s` and any of the [`GnssEpoch`] field
//!   names) or an arming event `{"t_s": .., "armed": true}`.

use serde::{Deserialize, Serialize};

use super::dataflash;
use crate::interconnect::ulog;

/// One receiver epoch, every field as the log gives it.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct GnssEpoch {
    /// Time since boot, seconds.
    pub t_s: f64,
    /// Receiver instance (0 first).
    pub instance: u8,
    /// Fix type (0 none, 2 2D, 3 3D, 4+ DGNSS/RTK).
    pub fix_type: u8,
    /// Latitude, degrees.
    pub lat_deg: Option<f64>,
    /// Longitude, degrees.
    pub lon_deg: Option<f64>,
    /// Height, metres.
    pub alt_m: Option<f64>,
    /// Satellites used.
    pub sats: Option<f64>,
    /// Reported horizontal accuracy, metres.
    pub eph_m: Option<f64>,
    /// Reported vertical accuracy, metres.
    pub epv_m: Option<f64>,
    /// HDOP.
    pub hdop: Option<f64>,
    /// Reported ground speed, m/s.
    pub speed_m_s: Option<f64>,
    /// Reported speed accuracy, m/s.
    pub sacc_m_s: Option<f64>,
    /// Receiver jamming state (PX4 codes; ArduPilot logs have none).
    pub jamming_state: Option<u8>,
    /// Receiver spoofing state (PX4 codes).
    pub spoofing_state: Option<u8>,
    /// Receiver authentication state (PX4 `SensorGnss`: 2 = error).
    pub auth_state: Option<u8>,
    /// Receiver jamming indicator (u-blox 0-255).
    pub jam_ind: Option<f64>,
    /// Receiver noise per millisecond.
    pub noise: Option<f64>,
    /// Receiver automatic gain control count.
    pub agc: Option<f64>,
    /// Receiver time, seconds (UTC or GPS time; only its steps are used).
    pub rx_time_s: Option<f64>,
}

/// The epochs and arming events of one log.
#[derive(Clone, Debug, Default, Serialize)]
pub struct FlightLog {
    /// `ulog`, `dataflash` or `jsonl`.
    pub format: &'static str,
    /// Receiver epochs, in log order.
    pub epochs: Vec<GnssEpoch>,
    /// Times (s since boot) at which the vehicle armed.
    pub arm_times_s: Vec<f64>,
    /// Messages or lines skipped as malformed.
    pub malformed: usize,
}

impl FlightLog {
    /// Epochs of one receiver instance, in order.
    pub fn instance(&self, i: u8) -> Vec<&GnssEpoch> {
        self.epochs.iter().filter(|e| e.instance == i).collect()
    }

    /// The receiver instances present, sorted.
    pub fn instances(&self) -> Vec<u8> {
        let mut v: Vec<u8> = self.epochs.iter().map(|e| e.instance).collect();
        v.sort_unstable();
        v.dedup();
        v
    }
}

/// Load a log, recognising the format by its first octets.
pub fn load(bytes: &[u8]) -> Result<FlightLog, String> {
    if bytes.starts_with(ulog::MAGIC) {
        from_ulog(bytes)
    } else if bytes.starts_with(&dataflash::HEAD) {
        from_dataflash(bytes)
    } else {
        from_jsonl(&String::from_utf8_lossy(bytes))
    }
}

/// Epochs and arming events from a PX4 ULog.
pub fn from_ulog(bytes: &[u8]) -> Result<FlightLog, String> {
    let (msgs, malformed) = ulog::read_topics(
        bytes,
        &["sensor_gps", "vehicle_gps_position", "vehicle_status"],
    )?;
    let mut log = FlightLog {
        format: "ulog",
        malformed,
        ..FlightLog::default()
    };
    let mut armed = false;
    // `sensor_gps` is the raw receiver; a log with both keeps `sensor_gps` only.
    let has_sensor = msgs.iter().any(|m| m.topic == "sensor_gps");
    for m in &msgs {
        let v = |k: &str| m.values.get(k).copied();
        if m.topic == "vehicle_status" {
            let now = v("arming_state").is_some_and(|s| s == 2.0);
            if now && !armed {
                log.arm_times_s.push(m.boot_s);
            }
            armed = now;
            continue;
        }
        if has_sensor && m.topic != "sensor_gps" {
            continue;
        }
        let pos = m.position();
        let u8v = |k: &str| v(k).map(|x| x as u8);
        log.epochs.push(GnssEpoch {
            t_s: m.boot_s,
            instance: m.multi_id,
            fix_type: u8v("fix_type").unwrap_or(0),
            lat_deg: pos.map(|p| p.0),
            lon_deg: pos.map(|p| p.1),
            alt_m: pos.and_then(|p| p.2),
            sats: v("satellites_used"),
            eph_m: v("eph"),
            epv_m: v("epv"),
            hdop: v("hdop"),
            speed_m_s: v("vel_m_s"),
            sacc_m_s: v("s_variance_m_s"),
            jamming_state: u8v("jamming_state"),
            spoofing_state: u8v("spoofing_state"),
            auth_state: u8v("authentication_state"),
            jam_ind: v("jamming_indicator"),
            noise: v("noise_per_ms"),
            agc: v("automatic_gain_control"),
            rx_time_s: m.utc(),
        });
    }
    Ok(log)
}

/// Epochs and arming events from an ArduPilot DataFlash log.
pub fn from_dataflash(bytes: &[u8]) -> Result<FlightLog, String> {
    let (msgs, malformed) = dataflash::read(bytes, &["GPS", "GPA", "UBX1", "ARM"])?;
    let mut log = FlightLog {
        format: "dataflash",
        malformed,
        ..FlightLog::default()
    };
    let mut armed = false;
    let mut last: std::collections::HashMap<u8, usize> = std::collections::HashMap::new();
    for m in &msgs {
        let t = m.boot_s.unwrap_or(0.0);
        match m.name.as_str() {
            "ARM" => {
                let now = m.v("ArmState").is_some_and(|s| s >= 1.0);
                if now && !armed {
                    log.arm_times_s.push(t);
                }
                armed = now;
            }
            "GPS" => {
                let inst = m.v("I").unwrap_or(0.0) as u8;
                let rx = match (m.v("GWk"), m.v("GMS")) {
                    (Some(w), Some(ms)) if w > 0.0 => Some(w * 604_800.0 + ms / 1000.0),
                    _ => None,
                };
                last.insert(inst, log.epochs.len());
                log.epochs.push(GnssEpoch {
                    t_s: t,
                    instance: inst,
                    fix_type: m.v("Status").unwrap_or(0.0) as u8,
                    lat_deg: m.v("Lat"),
                    lon_deg: m.v("Lng"),
                    alt_m: m.v("Alt"),
                    sats: m.v("NSats"),
                    hdop: m.v("HDop"),
                    speed_m_s: m.v("Spd"),
                    rx_time_s: rx,
                    ..GnssEpoch::default()
                });
            }
            "GPA" | "UBX1" => {
                let key = if m.name == "GPA" { "I" } else { "Instance" };
                let inst = m.v(key).unwrap_or(0.0) as u8;
                let Some(&k) = last.get(&inst) else {
                    continue;
                };
                let e = &mut log.epochs[k];
                if m.name == "GPA" {
                    e.eph_m = m.v("HAcc");
                    e.epv_m = m.v("VAcc");
                    e.sacc_m_s = m.v("SAcc");
                } else {
                    e.jam_ind = m.v("jamInd");
                    e.noise = m.v("noisePerMS");
                    e.agc = m.v("agcCnt");
                }
            }
            _ => {}
        }
    }
    Ok(log)
}

#[derive(Deserialize)]
struct ArmLine {
    t_s: f64,
    armed: bool,
}

/// Epochs and arming events from JSON Lines.
pub fn from_jsonl(text: &str) -> Result<FlightLog, String> {
    let mut log = FlightLog {
        format: "jsonl",
        ..FlightLog::default()
    };
    for line in text.lines().map(str::trim).filter(|l| !l.is_empty()) {
        let Ok(v) = serde_json::from_str::<serde_json::Value>(line) else {
            log.malformed += 1;
            continue;
        };
        if v.get("armed").is_some() {
            match serde_json::from_value::<ArmLine>(v) {
                Ok(a) if a.armed && a.t_s.is_finite() => log.arm_times_s.push(a.t_s),
                Ok(_) => {}
                Err(_) => log.malformed += 1,
            }
            continue;
        }
        match serde_json::from_value::<GnssEpoch>(v) {
            Ok(e) if e.t_s.is_finite() => log.epochs.push(e),
            _ => log.malformed += 1,
        }
    }
    if log.epochs.is_empty() {
        return Err(crate::terr!("e-drone-no-epochs"));
    }
    Ok(log)
}

/// Test and fixture encoder: a PX4 ULog with a `sensor_gps` subscription (instance 0, and 1 when
/// any row has instance 1) and a `vehicle_status` subscription. Rows are epochs; `arm_s` is the
/// time the vehicle arms (a `vehicle_status` message each second, `arming_state` 1 before and 2
/// from then). Writes no file.
pub fn encode_ulog(rows: &[GnssEpoch], arm_s: Option<f64>) -> Vec<u8> {
    fn msg(ty: u8, body: &[u8]) -> Vec<u8> {
        let mut m = (body.len() as u16).to_le_bytes().to_vec();
        m.push(ty);
        m.extend_from_slice(body);
        m
    }
    let mut b = ulog::MAGIC.to_vec();
    b.push(1);
    b.extend_from_slice(&0u64.to_le_bytes());
    b.extend(msg(b'F', b"sensor_gps:uint64_t timestamp;uint64_t time_utc_usec;double latitude_deg;double longitude_deg;double altitude_msl_m;float eph;float epv;float hdop;float vel_m_s;float s_variance_m_s;int32_t jamming_indicator;int32_t noise_per_ms;uint16_t automatic_gain_control;uint8_t jamming_state;uint8_t spoofing_state;uint8_t authentication_state;uint8_t fix_type;uint8_t satellites_used;uint8_t[3] _padding0;"));
    b.extend(msg(
        b'F',
        b"vehicle_status:uint64_t timestamp;uint8_t arming_state;uint8_t[7] _padding0;",
    ));
    let sub = |multi: u8, id: u16, name: &[u8]| {
        let mut a = vec![multi];
        a.extend_from_slice(&id.to_le_bytes());
        a.extend_from_slice(name);
        msg(b'A', &a)
    };
    b.extend(sub(0, 1, b"sensor_gps"));
    b.extend(sub(1, 2, b"sensor_gps"));
    b.extend(sub(0, 3, b"vehicle_status"));
    let t_end = rows.iter().map(|r| r.t_s).fold(0.0, f64::max);
    let mut status_t = 0.0;
    let write_status = |b: &mut Vec<u8>, upto: f64, status_t: &mut f64| {
        while *status_t <= upto {
            let mut d = 3u16.to_le_bytes().to_vec();
            d.extend_from_slice(&((*status_t * 1e6) as u64).to_le_bytes());
            d.push(if arm_s.is_some_and(|a| *status_t >= a) {
                2
            } else {
                1
            });
            b.extend(msg(b'D', &d));
            *status_t += 1.0;
        }
    };
    for r in rows {
        write_status(&mut b, r.t_s, &mut status_t);
        let mut d = (u16::from(r.instance.min(1)) + 1).to_le_bytes().to_vec();
        d.extend_from_slice(&((r.t_s * 1e6) as u64).to_le_bytes());
        d.extend_from_slice(&((r.rx_time_s.unwrap_or(0.0) * 1e6) as u64).to_le_bytes());
        for v in [r.lat_deg, r.lon_deg, r.alt_m] {
            d.extend_from_slice(&v.unwrap_or(0.0).to_le_bytes());
        }
        for v in [r.eph_m, r.epv_m, r.hdop, r.speed_m_s, r.sacc_m_s] {
            d.extend_from_slice(&(v.unwrap_or(0.0) as f32).to_le_bytes());
        }
        d.extend_from_slice(&(r.jam_ind.unwrap_or(0.0) as i32).to_le_bytes());
        d.extend_from_slice(&(r.noise.unwrap_or(0.0) as i32).to_le_bytes());
        d.extend_from_slice(&(r.agc.unwrap_or(0.0) as u16).to_le_bytes());
        d.extend_from_slice(&[
            r.jamming_state.unwrap_or(0),
            r.spoofing_state.unwrap_or(0),
            r.auth_state.unwrap_or(0),
            r.fix_type,
            r.sats.unwrap_or(0.0) as u8,
        ]);
        b.extend(msg(b'D', &d));
    }
    write_status(&mut b, t_end + 1.0, &mut status_t);
    b
}

/// Test and fixture encoder: an ArduPilot DataFlash log with `GPS`, `GPA`, `UBX1` and `ARM`
/// messages for the rows (one `ARM` message at `arm_s`). Writes no file.
pub fn encode_dataflash(rows: &[GnssEpoch], arm_s: Option<f64>) -> Vec<u8> {
    let defs = [
        (
            130u8,
            "GPS",
            "QBBIHBcLLeffffB",
            "TimeUS,I,Status,GMS,GWk,NSats,HDop,Lat,Lng,Alt,Spd,GCrs,VZ,Yaw,U",
        ),
        (131u8, "GPA", "QBCfffB", "TimeUS,I,VDop,HAcc,VAcc,SAcc,VV"),
        (
            132u8,
            "UBX1",
            "QBHBBHI",
            "TimeUS,Instance,noisePerMS,jamInd,aPower,agcCnt,config",
        ),
        (
            133u8,
            "ARM",
            "QBIBB",
            "TimeUS,ArmState,ArmChecks,Forced,Method",
        ),
    ];
    let mut out = Vec::new();
    let mut armed = false;
    for r in rows {
        if let Some(a) = arm_s {
            if !armed && r.t_s >= a {
                out.push((133u8, vec![a * 1e6, 1.0, 0.0, 0.0, 0.0]));
                armed = true;
            }
        }
        let us = r.t_s * 1e6;
        let (wk, ms) = match r.rx_time_s {
            Some(t) => ((t / 604_800.0).floor(), (t % 604_800.0) * 1000.0),
            None => (0.0, 0.0),
        };
        let i = f64::from(r.instance);
        out.push((
            130,
            vec![
                us,
                i,
                f64::from(r.fix_type),
                ms,
                wk,
                r.sats.unwrap_or(0.0),
                r.hdop.unwrap_or(0.0),
                r.lat_deg.unwrap_or(0.0),
                r.lon_deg.unwrap_or(0.0),
                r.alt_m.unwrap_or(0.0),
                r.speed_m_s.unwrap_or(0.0),
                0.0,
                0.0,
                0.0,
                1.0,
            ],
        ));
        out.push((
            131,
            vec![
                us,
                i,
                0.0,
                r.eph_m.unwrap_or(0.0),
                r.epv_m.unwrap_or(0.0),
                r.sacc_m_s.unwrap_or(0.0),
                1.0,
            ],
        ));
        if r.jam_ind.is_some() || r.agc.is_some() {
            out.push((
                132,
                vec![
                    us,
                    i,
                    r.noise.unwrap_or(0.0),
                    r.jam_ind.unwrap_or(0.0),
                    2.0,
                    r.agc.unwrap_or(0.0),
                    0.0,
                ],
            ));
        }
    }
    dataflash::encode(&defs, &out)
}
