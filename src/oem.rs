// SPDX-License-Identifier: Apache-2.0
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
//! Scope (this stage): the writer only. A reader is not part of this milestone;
//! the round trip is validated by re-parsing the emitted ephemeris lines in the
//! test suite against the propagator state they were sampled from.

use crate::rinex::EpochUtc;
use serde::Serialize;

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
}
