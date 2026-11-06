// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana.obs/1`: one schema for station and system observations.
//!
//! An observation file is JSON Lines. The first record is the **header**: the schema id, the station
//! (identity, position, antenna, receiver, firmware, operator, and whether the data is partner input)
//! and what the source carries. Every later record is an **epoch** (the same per-epoch observation
//! every receiver-log reader in [`crate::receiver_trust`] returns: C/N0 per satellite, AGC, jamming
//! indicator, the receiver's fix, sky, DOP, its own spoofing and jamming flags and OSNMA status, the
//! marine sentences), optionally with a reference to an IQ recording, or an **alarm** a monitor or a
//! station raised.
//!
//! Every reader that brings data into Kshana (receiver logs today; live feeds, partner data and
//! station networks as they arrive) writes this one schema, so every consumer reads one schema.
//! [`check`] states what a valid file is; `docs/OBS-SCHEMA.md` describes it and
//! `docs/spec/obs-1.schema.json` is its JSON Schema.

use crate::receiver_trust::{LogEpoch, LogFormat, Timeline};
use serde::{Deserialize, Serialize};

/// The schema id every header carries.
pub const SCHEMA: &str = "kshana.obs/1";

/// The station or system the observations come from.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Station {
    /// A stable identifier, unique within a network.
    pub id: String,
    /// WGS 84 latitude of the antenna, degrees.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub lat_deg: Option<f64>,
    /// WGS 84 longitude of the antenna, degrees.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub lon_deg: Option<f64>,
    /// Ellipsoidal height of the antenna reference point, metres.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub height_m: Option<f64>,
    /// Antenna type as the operator names it (an ANTEX name where there is one).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub antenna: Option<String>,
    /// Receiver type.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub receiver: Option<String>,
    /// Receiver firmware version.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub firmware: Option<String>,
    /// Who operates the station (an organisation or a role, never a person's private details).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub operator: Option<String>,
    /// True when the data is supplied by a partner (results built on it are labelled PARTNER).
    #[serde(default)]
    pub partner_input: bool,
}

/// The first record of a file.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Header {
    /// Always [`SCHEMA`].
    pub schema: String,
    /// The station.
    pub station: Station,
    /// The source format the epochs were read from (`ubx`, `rinex`, `nmea`, ...), when known.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub source_format: Option<String>,
    /// The first epoch's absolute time as the source states it, when known.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub start_label: Option<String>,
    /// The observables the source actually carries (`cn0`, `agc`, `jam_ind`, `fix`, ...).
    #[serde(default)]
    pub observables: Vec<String>,
    /// Records the reader skipped as corrupt or unsupported.
    #[serde(default)]
    pub skipped_records: usize,
}

/// A reference from an epoch to the IQ recording that covers it.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct IqRef {
    /// Path of the recording (SigMF data file or its metadata), relative to the observation file.
    pub path: String,
    /// SHA-256 of the data file, hex, when known.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub sha256: Option<String>,
    /// Sample rate, hertz.
    pub sample_rate_hz: f64,
    /// Centre frequency, hertz.
    pub centre_hz: f64,
    /// Offset of this epoch into the recording, samples.
    pub offset_samples: u64,
}

/// One epoch of observations.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct EpochRecord {
    /// The station id (equal to the header's).
    pub station: String,
    /// The observation, in the shape every receiver-log reader returns.
    #[serde(flatten)]
    pub epoch: LogEpoch,
    /// The IQ recording covering this epoch, when there is one.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub iq_ref: Option<IqRef>,
}

/// How serious an alarm is.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Severity {
    /// For the record.
    Info,
    /// Degraded; keep watching.
    Warning,
    /// Act on it.
    Alarm,
}

/// An alarm a monitor or a station raised.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AlarmRecord {
    /// The station id (equal to the header's).
    pub station: String,
    /// Seconds since the first epoch.
    pub t_s: f64,
    /// What raised it, as a stable machine name (`jamming`, `spoofing`, `osnma-fail`, ...).
    pub kind: String,
    /// How serious it is.
    pub severity: Severity,
    /// A free-text note, when the source gives one.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub note: Option<String>,
}

/// One line of an observation file.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(tag = "type", rename_all = "kebab-case")]
pub enum Record {
    /// The first line.
    Header(Header),
    /// An epoch (boxed: it is much larger than the other records).
    Epoch(Box<EpochRecord>),
    /// An alarm.
    Alarm(AlarmRecord),
}

/// Read a log of `format` (`ubx`, `rinex`, `android`, `sbf`, `nmea`, `rtklib-pos`, `novatel`,
/// `rtcm3`, `gnss-sdr`) into an observation file for `station`.
pub fn from_log(format: &str, bytes: &[u8], station: &Station) -> Result<Vec<Record>, String> {
    if format == "iec61162-450" {
        // Maritime network datagrams: unwrap to NMEA 0183, then read as NMEA (A2c).
        let u = crate::iec61162_450::unwrap(bytes);
        let tl = crate::receiver_trust::ingest::read_log(LogFormat::Nmea, u.nmea.as_bytes())?;
        return Ok(from_timeline(&tl, station, Some(format)));
    }
    let fmt: LogFormat = serde_json::from_value(serde_json::Value::String(format.to_string()))
        .map_err(|_| crate::terr!("e-obs-unknown-format", format = format.to_string()))?;
    let tl = crate::receiver_trust::ingest::read_log(fmt, bytes)?;
    Ok(from_timeline(&tl, station, Some(format)))
}

/// An observation file from a timeline a reader returned.
pub fn from_timeline(tl: &Timeline, station: &Station, format: Option<&str>) -> Vec<Record> {
    let mut out = Vec::with_capacity(tl.epochs.len() + 1);
    out.push(Record::Header(Header {
        schema: SCHEMA.to_string(),
        station: station.clone(),
        source_format: format.map(str::to_string),
        start_label: tl.start_label.clone(),
        observables: tl.observables.clone(),
        skipped_records: tl.skipped_records,
    }));
    out.extend(tl.epochs.iter().map(|e| {
        Record::Epoch(Box::new(EpochRecord {
            station: station.id.clone(),
            epoch: e.clone(),
            iq_ref: None,
        }))
    }));
    out
}

/// The records as JSON Lines, one record per line, each line ending in a newline.
pub fn to_jsonl(records: &[Record]) -> Result<String, String> {
    let mut s = String::new();
    for r in records {
        s.push_str(&serde_json::to_string(r).map_err(|e| e.to_string())?);
        s.push('\n');
    }
    Ok(s)
}

/// What [`check`] found in a valid file.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct CheckReport {
    /// The schema id.
    pub schema: String,
    /// The station id.
    pub station: String,
    /// Epoch records.
    pub epochs: usize,
    /// Alarm records.
    pub alarms: usize,
    /// Epochs that reference an IQ recording.
    pub iq_refs: usize,
    /// Whether the header marks the data as partner input.
    pub partner_input: bool,
}

/// Check an observation file: a header first with this schema, then epochs and alarms of the same
/// station, epochs in non-decreasing time, finite times, sensible IQ references. Returns the
/// records and a summary, or the first problem with its line number.
pub fn check(text: &str) -> Result<(Vec<Record>, CheckReport), String> {
    let mut records = Vec::new();
    let mut header: Option<Header> = None;
    let mut last_t = f64::NEG_INFINITY;
    let (mut epochs, mut alarms, mut iq_refs) = (0usize, 0usize, 0usize);
    for (i, line) in text.lines().enumerate() {
        let n = i + 1;
        if line.trim().is_empty() {
            continue;
        }
        let rec: Record = serde_json::from_str(line)
            .map_err(|e| crate::terr!("e-obs-bad-line", line = n.to_string(), e = e.to_string()))?;
        match (&header, &rec) {
            (None, Record::Header(h)) => {
                if h.schema != SCHEMA {
                    return Err(crate::terr!(
                        "e-obs-bad-schema",
                        found = h.schema.clone(),
                        expected = SCHEMA.to_string()
                    ));
                }
                if h.station.id.trim().is_empty() {
                    return Err(crate::terr!("e-obs-no-station-id"));
                }
                header = Some(h.clone());
            }
            (None, _) => return Err(crate::terr!("e-obs-not-header")),
            (Some(_), Record::Header(_)) => {
                return Err(crate::terr!("e-obs-second-header", line = n.to_string()))
            }
            (Some(h), Record::Epoch(e)) => {
                same_station(&h.station.id, &e.station, n)?;
                let t = e.epoch.t_s;
                if !t.is_finite() || t < last_t {
                    return Err(crate::terr!("e-obs-time-order", line = n.to_string()));
                }
                last_t = t;
                if let Some(q) = &e.iq_ref {
                    if !(q.sample_rate_hz.is_finite()
                        && q.sample_rate_hz > 0.0
                        && q.centre_hz.is_finite())
                        || q.path.trim().is_empty()
                    {
                        return Err(crate::terr!("e-obs-bad-iq-ref", line = n.to_string()));
                    }
                    iq_refs += 1;
                }
                epochs += 1;
            }
            (Some(h), Record::Alarm(a)) => {
                same_station(&h.station.id, &a.station, n)?;
                if !a.t_s.is_finite() || a.kind.trim().is_empty() {
                    return Err(crate::terr!("e-obs-bad-alarm", line = n.to_string()));
                }
                alarms += 1;
            }
        }
        records.push(rec);
    }
    let h = header.ok_or_else(|| crate::terr!("e-obs-not-header"))?;
    let report = CheckReport {
        schema: h.schema.clone(),
        station: h.station.id.clone(),
        epochs,
        alarms,
        iq_refs,
        partner_input: h.station.partner_input,
    };
    Ok((records, report))
}

fn same_station(expected: &str, found: &str, line: usize) -> Result<(), String> {
    if expected == found {
        Ok(())
    } else {
        Err(crate::terr!(
            "e-obs-station-mismatch",
            line = line.to_string(),
            found = found.to_string(),
            expected = expected.to_string()
        ))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn station() -> Station {
        Station {
            id: "site-1".into(),
            lat_deg: Some(59.44),
            lon_deg: Some(24.75),
            height_m: Some(30.0),
            receiver: Some("test receiver".into()),
            ..Default::default()
        }
    }

    const NMEA: &str = include_str!("../examples/receiver-trust/illustrative-jamming.nmea");

    #[test]
    fn a_log_becomes_a_file_that_checks_and_round_trips() {
        let recs = from_log("nmea", NMEA.as_bytes(), &station()).unwrap();
        assert!(matches!(recs[0], Record::Header(_)));
        let text = to_jsonl(&recs).unwrap();
        let (back, rep) = check(&text).unwrap();
        assert_eq!(back, recs);
        assert_eq!(rep.schema, SCHEMA);
        assert_eq!(rep.station, "site-1");
        assert_eq!(rep.epochs, recs.len() - 1);
        assert!(rep.epochs > 0);
        assert!(text.lines().next().unwrap().contains("\"type\":\"header\""));
    }

    #[test]
    fn unknown_format_is_named() {
        let e = from_log("morse", b"", &station()).unwrap_err();
        assert!(e.contains("morse"), "{e}");
    }

    fn epoch_line(station: &str, t: f64) -> String {
        let r = Record::Epoch(Box::new(EpochRecord {
            station: station.into(),
            epoch: LogEpoch {
                t_s: t,
                ..Default::default()
            },
            iq_ref: None,
        }));
        serde_json::to_string(&r).unwrap()
    }

    fn header_line() -> String {
        serde_json::to_string(&from_timeline(&Timeline::default(), &station(), None)[0]).unwrap()
    }

    #[test]
    fn check_refuses_each_kind_of_bad_file() {
        // no header first
        assert!(check(&epoch_line("site-1", 0.0)).is_err());
        // wrong schema
        let bad = header_line().replace(SCHEMA, "kshana.obs/9");
        assert!(check(&bad).unwrap_err().contains("kshana.obs/9"));
        // another station's epoch
        let t = format!("{}\n{}\n", header_line(), epoch_line("site-2", 0.0));
        assert!(check(&t).unwrap_err().contains("site-2"));
        // time going backwards
        let t = format!(
            "{}\n{}\n{}\n",
            header_line(),
            epoch_line("site-1", 2.0),
            epoch_line("site-1", 1.0)
        );
        assert!(check(&t).is_err());
        // two headers
        let t = format!("{}\n{}\n", header_line(), header_line());
        assert!(check(&t).is_err());
        // a valid file with an alarm and an IQ reference
        let alarm = serde_json::to_string(&Record::Alarm(AlarmRecord {
            station: "site-1".into(),
            t_s: 1.0,
            kind: "jamming".into(),
            severity: Severity::Alarm,
            note: None,
        }))
        .unwrap();
        let iq = serde_json::to_string(&Record::Epoch(Box::new(EpochRecord {
            station: "site-1".into(),
            epoch: LogEpoch {
                t_s: 1.0,
                ..Default::default()
            },
            iq_ref: Some(IqRef {
                path: "rec.sigmf-data".into(),
                sha256: None,
                sample_rate_hz: 4e6,
                centre_hz: 1_575.42e6,
                offset_samples: 4_000_000,
            }),
        })))
        .unwrap();
        let t = format!(
            "{}\n{}\n{}\n{}\n",
            header_line(),
            epoch_line("site-1", 0.0),
            iq,
            alarm
        );
        let (_, rep) = check(&t).unwrap();
        assert_eq!((rep.epochs, rep.alarms, rep.iq_refs), (2, 1, 1));
    }
}
