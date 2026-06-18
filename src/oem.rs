// SPDX-License-Identifier: AGPL-3.0-only
//! CCSDS Orbit Ephemeris Message (OEM) writer.
//!
//! OEM is the CCSDS standard interchange format for a tabulated orbit:
//! CCSDS 502.0-B Orbit Data Messages, the KVN (Key-Value Notation) form that
//! GMAT, Orekit, STK, NASA GMAT/GMAT-derived tools, and most flight-dynamics
//! systems read and write. Where SP3 is the GNSS analysis-centre format (ECEF,
//! GPS satellites, clocks) OEM is the *spacecraft* ephemeris exchange: an
//! inertial state time series (position **and** velocity) for any object about
//! any centre. Emitting it is what lets a Kshana-propagated orbit be handed to a
//! flight-dynamics tool — the other side of the standards-interop annex from the
//! RINEX/SP3 GNSS ingest.
//!
//! This module is the *export* direction: [`OemFile::from_propagators`] samples a
//! propagated constellation on a time grid — directly in the shared TEME inertial
//! frame, so unlike the SP3 export there is **no Earth-fixed rotation** and the
//! full state ([`crate::orbit::Propagator::state_eci`]: position m, velocity m/s)
//! is written as-is — and [`OemFile::to_oem_string`] serialises it to a valid
//! CCSDS OEM 2.0 message: the `CCSDS_OEM_VERS`/`CREATION_DATE`/`ORIGINATOR`
//! header, then one `META_START … META_STOP` segment per satellite followed by
//! its `epoch X Y Z X_DOT Y_DOT Z_DOT` ephemeris lines (km, km/s).
//!
//! Determinism: the `CREATION_DATE` is a caller-supplied epoch, never wall-clock,
//! so the same run produces byte-identical output (the engine's reproducibility
//! contract). `REF_FRAME` is reported as `TEME` and `TIME_SYSTEM` as `GPS` —
//! honest about the frame the propagators integrate in and the time scale the
//! epoch grid is tagged with; no silent re-labelling to EME2000/UTC the engine
//! does not actually compute.
//!
//! Both directions ship: [`parse_oem`] is the *import* path — the standards-based
//! ingest bridge that lets Kshana read an ephemeris produced by an external
//! flight-dynamics tool (GMAT, Orekit and STK all emit CCSDS OEM), the exact
//! inverse of [`OemFile::to_oem_string`]. It is tolerant of the parts real files
//! carry that this model does not retain — `COMMENT` lines, extra metadata
//! keywords (`USEABLE_*`, `INTERPOLATION*`, …) and `COVARIANCE` blocks are
//! skipped — and rejects (rather than silently fabricating) a position-only
//! ephemeris that has no velocity.

use crate::rinex::EpochUtc;
use serde::{Deserialize, Serialize};

/// The CCSDS OEM metadata block for one segment (one object's ephemeris).
#[derive(Clone, Debug, Serialize)]
pub struct OemMetadata {
    /// `OBJECT_NAME` — a human-readable name (here the satellite identifier).
    pub object_name: String,
    /// `OBJECT_ID` — the object identifier (here the satellite identifier; OEM
    /// uses the international designator for launched objects, but a PRN-style id
    /// is a valid free-form value for objects without one).
    pub object_id: String,
    /// `CENTER_NAME` — the body the state is referenced to (`EARTH`).
    pub center_name: String,
    /// `REF_FRAME` — the reference frame of the state vectors (`TEME`).
    pub ref_frame: String,
    /// `TIME_SYSTEM` — the time scale of the epochs (`GPS`).
    pub time_system: String,
    /// `START_TIME` — the first ephemeris epoch.
    pub start: EpochUtc,
    /// `STOP_TIME` — the last ephemeris epoch.
    pub stop: EpochUtc,
}

/// One ephemeris line: an epoch with the inertial position (km) and velocity
/// (km/s) of the segment's object.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct OemStateLine {
    /// The state epoch (GPS time scale, matching the segment `TIME_SYSTEM`).
    pub epoch: EpochUtc,
    /// Inertial (TEME) position, kilometres.
    pub pos_km: [f64; 3],
    /// Inertial (TEME) velocity, kilometres per second.
    pub vel_km_s: [f64; 3],
}

/// One OEM segment: a metadata block followed by its ephemeris lines. An OEM file
/// carries one segment per object.
#[derive(Clone, Debug, Serialize)]
pub struct OemSegment {
    pub meta: OemMetadata,
    pub states: Vec<OemStateLine>,
}

/// A CCSDS Orbit Ephemeris Message: the header fields and one or more segments.
#[derive(Clone, Debug, Serialize)]
pub struct OemFile {
    /// `CCSDS_OEM_VERS` value (`2.0`).
    pub version: String,
    /// `CREATION_DATE` — caller-supplied (never wall-clock) for determinism.
    pub creation_date: EpochUtc,
    /// `ORIGINATOR` (`KSHANA`).
    pub originator: String,
    /// One segment per object.
    pub segments: Vec<OemSegment>,
}

impl OemFile {
    /// Build an OEM from a propagated constellation: each satellite becomes one
    /// segment whose ephemeris lines are the propagator's inertial state sampled
    /// every `step_s` for `num_epochs` epochs, starting at calendar epoch `start`
    /// (GPS time scale). Because OEM is written in the inertial (TEME) frame the
    /// state is taken straight from [`crate::orbit::Propagator::state_eci`] with
    /// no Earth-fixed rotation — position m → km, velocity m/s → km/s.
    /// `creation_date` stamps the header deterministically.
    pub fn from_propagators(
        ids: &[String],
        sats: &[crate::orbit::Propagator],
        start: EpochUtc,
        step_s: f64,
        num_epochs: usize,
        creation_date: EpochUtc,
    ) -> Self {
        // The epoch grid is exactly `start + i·step_s`. Computing it by adding the
        // offset to the start Julian Date and converting back loses ~tens of µs to
        // f64 cancellation against the ~2.46e6-day JD magnitude (a 15-min grid then
        // reads `00:30:00.000013`). Instead keep the time-of-day arithmetic in
        // small-magnitude seconds and use the JD only for the integer day rollover,
        // whose midnight JD is exactly representable — so a clean grid stays clean.
        let day_jd0 = crate::timescales::julian_date(start.year, start.month, start.day, 0, 0, 0.0);
        let base_sod = start.hour as f64 * 3600.0 + start.minute as f64 * 60.0 + start.second;
        let epoch_at = |i: usize| -> EpochUtc {
            let total = base_sod + i as f64 * step_s;
            let day_add = (total / 86_400.0).floor();
            let mut sod = total - day_add * 86_400.0; // seconds of day, [0, 86400)
            let date = crate::timescales::civil_from_jd(day_jd0 + day_add);
            let hour = (sod / 3600.0).floor();
            sod -= hour * 3600.0;
            let minute = (sod / 60.0).floor();
            sod -= minute * 60.0;
            EpochUtc {
                year: date.year,
                month: date.month,
                day: date.day,
                hour: hour as u32,
                minute: minute as u32,
                second: sod,
            }
        };
        let last = num_epochs.saturating_sub(1);
        let mut segments = Vec::with_capacity(sats.len());
        for (id, sat) in ids.iter().zip(sats.iter()) {
            let mut states = Vec::with_capacity(num_epochs);
            for i in 0..num_epochs {
                let t = i as f64 * step_s;
                let s = sat.state_eci(t);
                states.push(OemStateLine {
                    epoch: epoch_at(i),
                    pos_km: [s.r_m[0] / 1000.0, s.r_m[1] / 1000.0, s.r_m[2] / 1000.0],
                    vel_km_s: [
                        s.v_m_s[0] / 1000.0,
                        s.v_m_s[1] / 1000.0,
                        s.v_m_s[2] / 1000.0,
                    ],
                });
            }
            segments.push(OemSegment {
                meta: OemMetadata {
                    object_name: id.clone(),
                    object_id: id.clone(),
                    center_name: "EARTH".to_string(),
                    ref_frame: "TEME".to_string(),
                    time_system: "GPS".to_string(),
                    start: epoch_at(0),
                    stop: epoch_at(last),
                },
                states,
            });
        }
        OemFile {
            version: "2.0".to_string(),
            creation_date,
            originator: "KSHANA".to_string(),
            segments,
        }
    }

    /// Serialise to CCSDS OEM 2.0 KVN text: the header, then for each segment a
    /// `META_START … META_STOP` block and its `epoch X Y Z X_DOT Y_DOT Z_DOT`
    /// ephemeris lines (km, km/s). Segments are separated by a blank line.
    pub fn to_oem_string(&self) -> String {
        let mut out = String::new();
        out.push_str(&format!("CCSDS_OEM_VERS = {}\n", self.version));
        out.push_str(&format!(
            "CREATION_DATE = {}\n",
            iso8601(&self.creation_date)
        ));
        out.push_str(&format!("ORIGINATOR = {}\n", self.originator));
        for seg in &self.segments {
            out.push('\n');
            out.push_str("META_START\n");
            out.push_str(&format!("OBJECT_NAME = {}\n", seg.meta.object_name));
            out.push_str(&format!("OBJECT_ID = {}\n", seg.meta.object_id));
            out.push_str(&format!("CENTER_NAME = {}\n", seg.meta.center_name));
            out.push_str(&format!("REF_FRAME = {}\n", seg.meta.ref_frame));
            out.push_str(&format!("TIME_SYSTEM = {}\n", seg.meta.time_system));
            out.push_str(&format!("START_TIME = {}\n", iso8601(&seg.meta.start)));
            out.push_str(&format!("STOP_TIME = {}\n", iso8601(&seg.meta.stop)));
            out.push_str("META_STOP\n");
            out.push('\n');
            for st in &seg.states {
                out.push_str(&format!(
                    "{} {:.6} {:.6} {:.6} {:.9} {:.9} {:.9}\n",
                    iso8601(&st.epoch),
                    st.pos_km[0],
                    st.pos_km[1],
                    st.pos_km[2],
                    st.vel_km_s[0],
                    st.vel_km_s[1],
                    st.vel_km_s[2],
                ));
            }
        }
        out
    }
}

/// Format an epoch as the CCSDS calendar time `yyyy-mm-ddTHH:MM:SS.ffffff`.
fn iso8601(e: &EpochUtc) -> String {
    format!(
        "{:04}-{:02}-{:02}T{:02}:{:02}:{:09.6}",
        e.year, e.month, e.day, e.hour, e.minute, e.second
    )
}

/// Parse an ISO-8601 calendar epoch `yyyy-mm-ddTHH:MM:SS[.fff][Z]` into an
/// [`EpochUtc`], keeping the value in whatever time scale the message declares (no
/// scale conversion). The day-of-year form (`yyyy-dddT…`) is not supported.
fn parse_iso8601_epoch(s: &str) -> Result<EpochUtc, String> {
    let s = s.trim();
    let (date, time) = s
        .split_once('T')
        .ok_or_else(|| format!("epoch missing 'T' date/time separator: {s}"))?;
    let d: Vec<&str> = date.split('-').collect();
    if d.len() != 3 {
        return Err(format!(
            "unsupported OEM epoch date '{date}' (expected yyyy-mm-dd)"
        ));
    }
    let time = time.strip_suffix('Z').unwrap_or(time);
    let t: Vec<&str> = time.split(':').collect();
    if t.len() != 3 {
        return Err(format!(
            "unsupported OEM epoch time '{time}' (expected HH:MM:SS)"
        ));
    }
    let year: i32 = d[0]
        .parse()
        .map_err(|_| format!("bad epoch year: {}", d[0]))?;
    let month: u32 = d[1]
        .parse()
        .map_err(|_| format!("bad epoch month: {}", d[1]))?;
    let day: u32 = d[2]
        .parse()
        .map_err(|_| format!("bad epoch day: {}", d[2]))?;
    let hour: u32 = t[0]
        .parse()
        .map_err(|_| format!("bad epoch hour: {}", t[0]))?;
    let minute: u32 = t[1]
        .parse()
        .map_err(|_| format!("bad epoch minute: {}", t[1]))?;
    let second: f64 = t[2]
        .parse()
        .map_err(|_| format!("bad epoch second: {}", t[2]))?;
    if !(1..=12).contains(&month)
        || !(1..=31).contains(&day)
        || hour > 23
        || minute > 59
        || !(0.0..61.0).contains(&second)
    {
        return Err(format!("OEM epoch field out of range: {s}"));
    }
    Ok(EpochUtc {
        year,
        month,
        day,
        hour,
        minute,
        second,
    })
}

/// Split a KVN `KEY = VALUE` line into its trimmed key and value, or `None` when
/// the line carries no `=` (a data line or a structural keyword).
fn split_kv(line: &str) -> Option<(String, String)> {
    let (k, v) = line.split_once('=')?;
    Some((k.trim().to_string(), v.trim().to_string()))
}

/// Import a CCSDS OEM 2.0 (KVN) message — the inverse of
/// [`OemFile::to_oem_string`] and the standards-based ingest bridge for
/// ephemerides produced by external flight-dynamics tools (GMAT, Orekit, STK all
/// emit OEM).
///
/// Robustness: `COMMENT` lines, unknown metadata keywords (`USEABLE_*`,
/// `INTERPOLATION*`, `REF_FRAME_EPOCH`, …) and `COVARIANCE_START … COVARIANCE_STOP`
/// blocks are skipped. The seven mandatory metadata keywords
/// (`OBJECT_NAME`/`OBJECT_ID`/`CENTER_NAME`/`REF_FRAME`/`TIME_SYSTEM`/`START_TIME`/`STOP_TIME`)
/// are required. A data line must carry position **and** velocity (6 components,
/// or 9 with acceleration which is read then ignored); a position-only ephemeris
/// is rejected rather than given a fabricated zero velocity. Epochs are retained
/// in the segment's declared `TIME_SYSTEM`.
pub fn parse_oem(text: &str) -> Result<OemFile, String> {
    let mut version: Option<String> = None;
    let mut creation_date: Option<EpochUtc> = None;
    let mut originator: Option<String> = None;
    let mut segments: Vec<OemSegment> = Vec::new();

    let mut lines = text.lines().peekable();

    // --- header: KVN lines up to the first META_START ---
    while let Some(raw) = lines.peek() {
        let line = raw.trim();
        if line.is_empty() || line.starts_with("COMMENT") {
            lines.next();
            continue;
        }
        if line == "META_START" {
            break;
        }
        let (k, v) = split_kv(line).ok_or_else(|| format!("unexpected OEM header line: {line}"))?;
        match k.as_str() {
            "CCSDS_OEM_VERS" => version = Some(v),
            "CREATION_DATE" => creation_date = Some(parse_iso8601_epoch(&v)?),
            "ORIGINATOR" => originator = Some(v),
            _ => {} // tolerate unknown header keywords
        }
        lines.next();
    }

    // --- segments ---
    while let Some(raw) = lines.peek() {
        let line = raw.trim();
        if line.is_empty() || line.starts_with("COMMENT") {
            lines.next();
            continue;
        }
        if line != "META_START" {
            return Err(format!("expected META_START, found: {line}"));
        }
        lines.next(); // consume META_START

        // metadata block, terminated by META_STOP
        let mut object_name = None;
        let mut object_id = None;
        let mut center_name = None;
        let mut ref_frame = None;
        let mut time_system = None;
        let mut start = None;
        let mut stop = None;
        let mut saw_meta_stop = false;
        for raw in lines.by_ref() {
            let line = raw.trim();
            if line.is_empty() || line.starts_with("COMMENT") {
                continue;
            }
            if line == "META_STOP" {
                saw_meta_stop = true;
                break;
            }
            let (k, v) =
                split_kv(line).ok_or_else(|| format!("unexpected OEM metadata line: {line}"))?;
            match k.as_str() {
                "OBJECT_NAME" => object_name = Some(v),
                "OBJECT_ID" => object_id = Some(v),
                "CENTER_NAME" => center_name = Some(v),
                "REF_FRAME" => ref_frame = Some(v),
                "TIME_SYSTEM" => time_system = Some(v),
                "START_TIME" => start = Some(parse_iso8601_epoch(&v)?),
                "STOP_TIME" => stop = Some(parse_iso8601_epoch(&v)?),
                _ => {} // USEABLE_*, INTERPOLATION*, REF_FRAME_EPOCH, … tolerated
            }
        }
        if !saw_meta_stop {
            return Err("OEM segment metadata missing META_STOP".to_string());
        }
        let meta = OemMetadata {
            object_name: object_name.ok_or("OEM metadata missing OBJECT_NAME")?,
            object_id: object_id.ok_or("OEM metadata missing OBJECT_ID")?,
            center_name: center_name.ok_or("OEM metadata missing CENTER_NAME")?,
            ref_frame: ref_frame.ok_or("OEM metadata missing REF_FRAME")?,
            time_system: time_system.ok_or("OEM metadata missing TIME_SYSTEM")?,
            start: start.ok_or("OEM metadata missing START_TIME")?,
            stop: stop.ok_or("OEM metadata missing STOP_TIME")?,
        };

        // data block: ephemeris lines until the next META_START or EOF, skipping
        // COMMENT lines and COVARIANCE_START … COVARIANCE_STOP blocks.
        let mut states = Vec::new();
        let mut in_cov = false;
        while let Some(raw) = lines.peek() {
            let line = raw.trim();
            if line == "META_START" {
                break;
            }
            lines.next();
            if line.is_empty() || line.starts_with("COMMENT") {
                continue;
            }
            if line == "COVARIANCE_START" {
                in_cov = true;
                continue;
            }
            if line == "COVARIANCE_STOP" {
                in_cov = false;
                continue;
            }
            if in_cov {
                continue;
            }
            let toks: Vec<&str> = line.split_whitespace().collect();
            let epoch = parse_iso8601_epoch(toks[0])?;
            let n = toks.len() - 1;
            if n != 6 && n != 9 {
                return Err(format!(
                    "OEM data line needs position+velocity (6) or +acceleration (9) \
                     components, got {n}: {line}"
                ));
            }
            let mut vals = [0.0f64; 6];
            for (k, t) in toks[1..7].iter().enumerate() {
                vals[k] = t
                    .parse::<f64>()
                    .map_err(|_| format!("non-numeric OEM state value '{t}' in: {line}"))?;
            }
            states.push(OemStateLine {
                epoch,
                pos_km: [vals[0], vals[1], vals[2]],
                vel_km_s: [vals[3], vals[4], vals[5]],
            });
        }
        segments.push(OemSegment { meta, states });
    }

    Ok(OemFile {
        version: version.ok_or("OEM missing CCSDS_OEM_VERS header")?,
        creation_date: creation_date.ok_or("OEM missing CREATION_DATE header")?,
        originator: originator.ok_or("OEM missing ORIGINATOR header")?,
        segments,
    })
}

/// Seconds from a segment's first epoch to each of its state epochs, via the
/// Julian date so day rollovers are handled exactly.
fn segment_epoch_seconds(seg: &OemSegment) -> Vec<f64> {
    let jd = |e: &EpochUtc| {
        crate::timescales::julian_date(e.year, e.month, e.day, e.hour, e.minute, e.second)
    };
    let t0 = seg.states.first().map(|s| jd(&s.epoch)).unwrap_or(0.0);
    seg.states
        .iter()
        .map(|s| (jd(&s.epoch) - t0) * 86_400.0)
        .collect()
}

/// Largest central-difference velocity-consistency residual (km/s) over a
/// segment's interior epochs: how well the stated velocities match a numerical
/// derivative of the stated positions. Small for a smooth ephemeris; large for an
/// inconsistent one. `None` when there are fewer than three states.
fn velocity_consistency_residual(seg: &OemSegment) -> Option<f64> {
    if seg.states.len() < 3 {
        return None;
    }
    let t = segment_epoch_seconds(seg);
    let mut worst = 0.0f64;
    for i in 1..seg.states.len() - 1 {
        let dt = t[i + 1] - t[i - 1];
        if dt <= 0.0 {
            continue;
        }
        let mut res2 = 0.0;
        for k in 0..3 {
            let v_est = (seg.states[i + 1].pos_km[k] - seg.states[i - 1].pos_km[k]) / dt;
            let d = v_est - seg.states[i].vel_km_s[k];
            res2 += d * d;
        }
        worst = worst.max(res2.sqrt());
    }
    Some(worst)
}

fn oem_default_oem_text() -> Option<String> {
    None
}

/// The `oem-interop` scenario: demonstrate the CCSDS OEM **import** bridge that
/// lets Kshana ingest ephemerides produced by external flight-dynamics tools
/// (GMAT, Orekit, STK). With no input it round-trips a generated reference orbit
/// (self-contained, reproducible) and reports the round-trip fidelity; given an
/// inline `oem_text` it ingests that file and reports what it parsed plus a
/// velocity-consistency check.
#[derive(Deserialize)]
pub struct OemInteropScenario {
    /// Inline CCSDS OEM text to ingest. When absent, a generated reference orbit
    /// is exported and re-imported instead (the round-trip demonstrator).
    #[serde(default = "oem_default_oem_text")]
    pub oem_text: Option<String>,
}

impl OemInteropScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        // Source the OEM text: either the caller's file, or a generated reference
        // orbit we also keep to measure round-trip error.
        let (oem_text, truth): (String, Option<OemFile>) = match &self.oem_text {
            Some(t) => (t.clone(), None),
            None => {
                let start = EpochUtc {
                    year: 2024,
                    month: 1,
                    day: 1,
                    hour: 0,
                    minute: 0,
                    second: 0.0,
                };
                let sats = vec![
                    crate::orbit::Propagator::Kepler(crate::orbit::Orbit::keplerian(
                        26_560_000.0,
                        0.01,
                        0.96,
                        0.3,
                        0.2,
                        0.4,
                    )),
                    crate::orbit::Propagator::Kepler(crate::orbit::Orbit::new(
                        6_778_000.0,
                        0.001,
                        0.9,
                        0.0,
                    )),
                ];
                let ids = vec!["REF-MEO".to_string(), "REF-LEO".to_string()];
                let written = OemFile::from_propagators(&ids, &sats, start, 300.0, 6, start);
                (written.to_oem_string(), Some(written))
            }
        };

        let parsed = parse_oem(&oem_text)?;
        if parsed.segments.is_empty() {
            return Err("OEM carried no segments".to_string());
        }

        let mut n_states_total = 0usize;
        let seg_json: Vec<serde_json::Value> = parsed
            .segments
            .iter()
            .map(|seg| {
                n_states_total += seg.states.len();
                let t = segment_epoch_seconds(seg);
                let span = t.last().copied().unwrap_or(0.0);
                serde_json::json!({
                    "object_id": seg.meta.object_id,
                    "object_name": seg.meta.object_name,
                    "center_name": seg.meta.center_name,
                    "ref_frame": seg.meta.ref_frame,
                    "time_system": seg.meta.time_system,
                    "n_states": seg.states.len(),
                    "span_s": span,
                    "velocity_consistency_residual_km_s": velocity_consistency_residual(seg),
                })
            })
            .collect();

        // Round-trip fidelity, when we generated the source ourselves.
        let (mut rt_pos, mut rt_vel) = (None, None);
        if let Some(truth) = &truth {
            let (mut max_p, mut max_v) = (0.0f64, 0.0f64);
            for (ws, rs) in truth.segments.iter().zip(parsed.segments.iter()) {
                for (w, r) in ws.states.iter().zip(rs.states.iter()) {
                    for k in 0..3 {
                        max_p = max_p.max((w.pos_km[k] - r.pos_km[k]).abs());
                        max_v = max_v.max((w.vel_km_s[k] - r.vel_km_s[k]).abs());
                    }
                }
            }
            rt_pos = Some(max_p);
            rt_vel = Some(max_v);
        }

        let source = if truth.is_some() {
            "round-trip"
        } else {
            "ingested"
        };
        let json = serde_json::json!({
            "kind": "oem-interop",
            "label": "MODELLED — CCSDS OEM import/round-trip interop bridge \
                      (GMAT/Orekit/STK emit OEM); a structural + physical ingest \
                      check, NOT an orbit-accuracy validation of the source",
            "source": source,
            "originator": parsed.originator,
            "n_segments": parsed.segments.len(),
            "n_states_total": n_states_total,
            "segments": seg_json,
            "round_trip_max_pos_error_km": rt_pos,
            "round_trip_max_vel_error_km_s": rt_vel,
        });
        let summary = match (rt_pos, rt_vel) {
            (Some(p), Some(v)) => format!(
                "oem-interop: round-tripped {} segment(s), {} states; max round-trip \
                 error {:.2e} km / {:.2e} km/s (MODELLED interop)",
                parsed.segments.len(),
                n_states_total,
                p,
                v
            ),
            _ => format!(
                "oem-interop: ingested {} segment(s), {} states from external OEM \
                 (originator {}) (MODELLED interop)",
                parsed.segments.len(),
                n_states_total,
                parsed.originator
            ),
        };
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::orbit::{Orbit, Propagator};

    fn start_epoch() -> EpochUtc {
        EpochUtc {
            year: 2023,
            month: 1,
            day: 1,
            hour: 0,
            minute: 0,
            second: 0.0,
        }
    }

    // Pull the whitespace-separated numeric ephemeris lines (the ones beginning
    // with a `yyyy-` date) back out of the emitted text, as (epoch, [6 floats]).
    fn ephemeris_lines(text: &str) -> Vec<(String, [f64; 6])> {
        let mut rows = Vec::new();
        for line in text.lines() {
            let toks: Vec<&str> = line.split_whitespace().collect();
            if toks.len() == 7 && toks[0].len() >= 10 && toks[0].as_bytes()[4] == b'-' {
                let mut v = [0.0f64; 6];
                let mut ok = true;
                for (k, t) in toks[1..].iter().enumerate() {
                    match t.parse::<f64>() {
                        Ok(x) => v[k] = x,
                        Err(_) => {
                            ok = false;
                            break;
                        }
                    }
                }
                if ok {
                    rows.push((toks[0].to_string(), v));
                }
            }
        }
        rows
    }

    #[test]
    fn iso8601_formats_a_padded_calendar_time() {
        let e = EpochUtc {
            year: 2023,
            month: 1,
            day: 2,
            hour: 3,
            minute: 4,
            second: 5.5,
        };
        assert_eq!(iso8601(&e), "2023-01-02T03:04:05.500000");
        assert_eq!(iso8601(&start_epoch()), "2023-01-01T00:00:00.000000");
    }

    #[test]
    fn header_and_segment_structure_is_valid_oem() {
        let a = 26_560_000.0;
        let sats = vec![Propagator::Kepler(Orbit::new(a, 0.96, 0.0, 0.0))];
        let ids = vec!["G01".to_string()];
        let f = OemFile::from_propagators(&ids, &sats, start_epoch(), 900.0, 4, start_epoch());
        let text = f.to_oem_string();
        // Mandatory header keywords, in order.
        assert!(text.starts_with("CCSDS_OEM_VERS = 2.0\n"));
        assert!(text.contains("CREATION_DATE = 2023-01-01T00:00:00.000000\n"));
        assert!(text.contains("ORIGINATOR = KSHANA\n"));
        // One segment with all mandatory metadata keywords.
        assert_eq!(text.matches("META_START").count(), 1);
        assert_eq!(text.matches("META_STOP").count(), 1);
        for kw in [
            "OBJECT_NAME = G01",
            "OBJECT_ID = G01",
            "CENTER_NAME = EARTH",
            "REF_FRAME = TEME",
            "TIME_SYSTEM = GPS",
            "START_TIME = 2023-01-01T00:00:00.000000",
            "STOP_TIME = 2023-01-01T00:45:00.000000",
        ] {
            assert!(text.contains(kw), "missing metadata keyword: {kw}");
        }
        // Four ephemeris lines (one per epoch).
        assert_eq!(ephemeris_lines(&text).len(), 4);
    }

    #[test]
    fn ephemeris_values_match_the_propagator_state() {
        // The written km / (km/s) values must equal the propagator's inertial
        // state in m / (m/s) at each epoch, divided by 1000 — i.e. TEME, no frame
        // rotation. Checked against a known Kepler orbit at t = 0 and t = 900 s.
        let a = 26_560_000.0;
        let orbit = Orbit::keplerian(a, 0.01, 0.9, 0.3, 0.2, 0.4);
        let sats = vec![Propagator::Kepler(orbit)];
        let ids = vec!["G01".to_string()];
        let f = OemFile::from_propagators(&ids, &sats, start_epoch(), 900.0, 5, start_epoch());
        let rows = ephemeris_lines(&f.to_oem_string());
        assert_eq!(rows.len(), 5);
        for (i, (_epoch, vals)) in rows.iter().enumerate() {
            let s = Propagator::Kepler(orbit).state_eci(i as f64 * 900.0);
            for k in 0..3 {
                assert!(
                    (vals[k] - s.r_m[k] / 1000.0).abs() < 1e-3,
                    "epoch {i} pos axis {k}: wrote {} km",
                    vals[k]
                );
                assert!(
                    (vals[k + 3] - s.v_m_s[k] / 1000.0).abs() < 1e-6,
                    "epoch {i} vel axis {k}: wrote {} km/s",
                    vals[k + 3]
                );
            }
        }
        // Sanity: GPS-altitude radius (~26 560 km) and ~3.9 km/s speed.
        let (_e0, v0) = &rows[0];
        let r = (v0[0].powi(2) + v0[1].powi(2) + v0[2].powi(2)).sqrt();
        let speed = (v0[3].powi(2) + v0[4].powi(2) + v0[5].powi(2)).sqrt();
        assert!((r - a / 1000.0).abs() < 400.0, "radius {r:.1} km");
        assert!((3.0..4.5).contains(&speed), "speed {speed:.3} km/s");
    }

    #[test]
    fn each_satellite_becomes_its_own_segment() {
        let a = 26_560_000.0;
        let sats = vec![
            Propagator::Kepler(Orbit::new(a, 0.96, 0.0, 0.0)),
            Propagator::Kepler(Orbit::new(a, 0.96, std::f64::consts::PI, 1.0)),
        ];
        let ids = vec!["G01".to_string(), "G02".to_string()];
        let f = OemFile::from_propagators(&ids, &sats, start_epoch(), 900.0, 3, start_epoch());
        assert_eq!(f.segments.len(), 2);
        let text = f.to_oem_string();
        // Two metadata blocks, two object ids, 2 × 3 = 6 ephemeris lines total.
        assert_eq!(text.matches("META_START").count(), 2);
        assert!(text.contains("OBJECT_ID = G01"));
        assert!(text.contains("OBJECT_ID = G02"));
        assert_eq!(ephemeris_lines(&text).len(), 6);
        // STOP_TIME is the third epoch (2 × 900 s = 30 min after start).
        assert!(text.contains("STOP_TIME = 2023-01-01T00:30:00.000000"));
    }

    #[test]
    fn creation_date_is_caller_supplied_not_wall_clock() {
        // Determinism: the same inputs (including an explicit creation date)
        // produce byte-identical output across calls.
        let a = 26_560_000.0;
        let sats = vec![Propagator::Kepler(Orbit::new(a, 0.96, 0.0, 0.0))];
        let ids = vec!["G01".to_string()];
        let made = EpochUtc {
            year: 2026,
            month: 6,
            day: 3,
            hour: 12,
            minute: 0,
            second: 0.0,
        };
        let f1 = OemFile::from_propagators(&ids, &sats, start_epoch(), 900.0, 4, made);
        let f2 = OemFile::from_propagators(&ids, &sats, start_epoch(), 900.0, 4, made);
        let t1 = f1.to_oem_string();
        assert_eq!(t1, f2.to_oem_string(), "output must be deterministic");
        assert!(t1.contains("CREATION_DATE = 2026-06-03T12:00:00.000000\n"));
    }

    // ---- importer (the GMAT/Orekit/STK interop bridge: read what they emit) ----

    /// A real external-tool-style OEM (extra keywords, COMMENT lines, a covariance
    /// block) the importer must ingest. Vendored so the parser is exercised against
    /// a file on disk, the way an external flight-dynamics ephemeris would arrive.
    const EXTERNAL_LEO: &str = include_str!("../tests/fixtures/interop/external_leo.oem");

    #[test]
    fn parses_an_external_oem_with_extra_keywords_comments_and_covariance() {
        let f = parse_oem(EXTERNAL_LEO).expect("external OEM parses");
        assert_eq!(f.version, "2.0");
        assert_eq!(f.originator, "EXTERNAL-FDS");
        assert_eq!(f.creation_date.year, 2024);
        assert_eq!(f.segments.len(), 1);
        let seg = &f.segments[0];
        assert_eq!(seg.meta.object_name, "EXAMPLESAT");
        assert_eq!(seg.meta.object_id, "2024-001A");
        assert_eq!(seg.meta.center_name, "EARTH");
        assert_eq!(seg.meta.ref_frame, "EME2000");
        assert_eq!(seg.meta.time_system, "UTC");
        // Four data lines; the covariance block is skipped, not parsed as states.
        assert_eq!(seg.states.len(), 4);
        let s0 = &seg.states[0];
        assert_eq!(s0.epoch.hour, 0);
        assert!((s0.pos_km[0] - (-6045.0)).abs() < 1e-9);
        assert!((s0.pos_km[1] - (-3490.0)).abs() < 1e-9);
        assert!((s0.pos_km[2] - 2500.0).abs() < 1e-9);
        assert!((s0.vel_km_s[0] - (-3.457)).abs() < 1e-9);
        assert!((s0.vel_km_s[1] - 6.618).abs() < 1e-9);
        assert!((s0.vel_km_s[2] - 2.534).abs() < 1e-9);
        // Row-0 is the Vallado example: ~7411 km radius, ~7.9 km/s speed.
        let r = (s0.pos_km[0].powi(2) + s0.pos_km[1].powi(2) + s0.pos_km[2].powi(2)).sqrt();
        let v = (s0.vel_km_s[0].powi(2) + s0.vel_km_s[1].powi(2) + s0.vel_km_s[2].powi(2)).sqrt();
        assert!((7000.0..7800.0).contains(&r), "radius {r:.1} km");
        assert!((7.0..8.5).contains(&v), "speed {v:.3} km/s");
    }

    #[test]
    fn write_then_read_round_trips_the_full_state() {
        // The importer is the exact inverse of the writer: every epoch, position
        // (km) and velocity (km/s) survives a to_oem_string → parse_oem round trip
        // to format precision (6 dp position, 9 dp velocity).
        let orbit = Orbit::keplerian(26_560_000.0, 0.01, 0.9, 0.3, 0.2, 0.4);
        let sats = vec![
            Propagator::Kepler(orbit),
            Propagator::Kepler(Orbit::new(26_560_000.0, 0.96, std::f64::consts::PI, 1.0)),
        ];
        let ids = vec!["G01".to_string(), "G02".to_string()];
        let written =
            OemFile::from_propagators(&ids, &sats, start_epoch(), 600.0, 6, start_epoch());
        let reparsed = parse_oem(&written.to_oem_string()).expect("round trip parses");
        assert_eq!(reparsed.segments.len(), written.segments.len());
        for (ws, rs) in written.segments.iter().zip(reparsed.segments.iter()) {
            assert_eq!(rs.meta.object_id, ws.meta.object_id);
            assert_eq!(rs.states.len(), ws.states.len());
            for (w, r) in ws.states.iter().zip(rs.states.iter()) {
                assert_eq!(r.epoch, w.epoch);
                for k in 0..3 {
                    assert!((r.pos_km[k] - w.pos_km[k]).abs() < 1e-6, "pos axis {k}");
                    assert!((r.vel_km_s[k] - w.vel_km_s[k]).abs() < 1e-9, "vel axis {k}");
                }
            }
        }
    }

    #[test]
    fn importer_tolerates_position_velocity_acceleration_lines() {
        // CCSDS allows pos / pos+vel / pos+vel+accel data lines; a 9-column line
        // keeps the first six (position, velocity) and ignores the acceleration.
        let oem = "CCSDS_OEM_VERS = 2.0\n\
                   CREATION_DATE = 2024-01-01T00:00:00.000000\n\
                   ORIGINATOR = T\n\n\
                   META_START\n\
                   OBJECT_NAME = A\nOBJECT_ID = A\nCENTER_NAME = EARTH\n\
                   REF_FRAME = TEME\nTIME_SYSTEM = GPS\n\
                   START_TIME = 2024-01-01T00:00:00.000000\n\
                   STOP_TIME = 2024-01-01T00:00:00.000000\n\
                   META_STOP\n\n\
                   2024-01-01T00:00:00.000000 7000.0 0.0 0.0 0.0 7.5 0.0 -0.001 0.0 0.0\n";
        let f = parse_oem(oem).expect("pos+vel+accel parses");
        let s = &f.segments[0].states[0];
        assert_eq!(s.pos_km, [7000.0, 0.0, 0.0]);
        assert_eq!(s.vel_km_s, [0.0, 7.5, 0.0]);
    }

    #[test]
    fn importer_rejects_position_only_ephemeris() {
        // A position-only (3-column) line has no velocity; rather than fabricate a
        // zero velocity, the importer rejects it with a clear error.
        let oem = "CCSDS_OEM_VERS = 2.0\n\
                   CREATION_DATE = 2024-01-01T00:00:00.000000\n\
                   ORIGINATOR = T\n\n\
                   META_START\n\
                   OBJECT_NAME = A\nOBJECT_ID = A\nCENTER_NAME = EARTH\n\
                   REF_FRAME = TEME\nTIME_SYSTEM = GPS\n\
                   START_TIME = 2024-01-01T00:00:00.000000\n\
                   STOP_TIME = 2024-01-01T00:00:00.000000\n\
                   META_STOP\n\n\
                   2024-01-01T00:00:00.000000 7000.0 0.0 0.0\n";
        assert!(parse_oem(oem).is_err(), "position-only must be rejected");
    }

    #[test]
    fn oem_interop_default_round_trip_is_high_fidelity_and_modelled() {
        let scn = OemInteropScenario { oem_text: None };
        let (j1, summary) = scn.run_json().unwrap();
        let (j2, _) = scn.run_json().unwrap();
        assert_eq!(j1, j2, "scenario must be reproducible");
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "oem-interop");
        assert_eq!(v["source"], "round-trip");
        assert_eq!(v["n_segments"], 2);
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(!j1.contains("VALIDATED"));
        // Round-trip error is at the OEM print precision (6 dp km / 9 dp km/s).
        let p = v["round_trip_max_pos_error_km"].as_f64().unwrap();
        let vel = v["round_trip_max_vel_error_km_s"].as_f64().unwrap();
        assert!(p < 1e-5, "round-trip pos error {p} km");
        assert!(vel < 1e-8, "round-trip vel error {vel} km/s");
        assert!(summary.contains("round-tripped"));
    }

    #[test]
    fn oem_interop_ingests_an_external_file() {
        let scn = OemInteropScenario {
            oem_text: Some(EXTERNAL_LEO.to_string()),
        };
        let (j, _) = scn.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&j).unwrap();
        assert_eq!(v["source"], "ingested");
        assert_eq!(v["n_segments"], 1);
        assert_eq!(v["n_states_total"], 4);
        assert_eq!(v["originator"], "EXTERNAL-FDS");
        assert_eq!(v["segments"][0]["ref_frame"], "EME2000");
        // No round-trip error keys for an ingested (not self-generated) file.
        assert!(v["round_trip_max_pos_error_km"].is_null());
    }

    #[test]
    fn importer_rejects_a_segment_missing_mandatory_metadata() {
        // REF_FRAME is mandatory CCSDS OEM metadata; its absence is a clean error.
        let oem = "CCSDS_OEM_VERS = 2.0\n\
                   CREATION_DATE = 2024-01-01T00:00:00.000000\n\
                   ORIGINATOR = T\n\n\
                   META_START\n\
                   OBJECT_NAME = A\nOBJECT_ID = A\nCENTER_NAME = EARTH\n\
                   TIME_SYSTEM = GPS\n\
                   START_TIME = 2024-01-01T00:00:00.000000\n\
                   STOP_TIME = 2024-01-01T00:00:00.000000\n\
                   META_STOP\n\n\
                   2024-01-01T00:00:00.000000 7000.0 0.0 0.0 0.0 7.5 0.0\n";
        assert!(
            parse_oem(oem).is_err(),
            "missing REF_FRAME must be rejected"
        );
    }
}
