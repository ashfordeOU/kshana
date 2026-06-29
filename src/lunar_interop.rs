// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar interoperability export — the lunar reference frame, lunar time scale and
//! lunar ephemeris emitted in **LunaNet/IOAG-aligned, CCSDS-based interchange forms**
//! with round-trip / field conformance.
//!
//! This is Phase 7 of the lunar PNT suite: it does not invent a new wire format. It
//! **reuses** the crate's existing CCSDS OEM 2.0 emitter/parser ([`crate::oem`]) and the
//! Kshana Interchange Format envelope ([`crate::interchange`]), and re-tags them for the
//! lunar context:
//!
//! - [`export_lunar_oem`] emits a CCSDS Orbit Ephemeris Message whose `REF_FRAME` is the
//!   lunar body frame (`MOON_ME` / `MOON_PA`, the IAU 2015 WGCCRE mean-Earth / principal-axis
//!   lunar frames) and whose `TIME_SYSTEM` is the lunar time scale (`LTC` / `TCL` / `UTC`).
//!   The state grid carries lunar-centred positions (m) and velocities (m/s) per epoch.
//! - [`export_lunar_time_metadata`] emits a small LunaNet/IOAG-aligned lunar-time descriptor
//!   (scale id, secular rate µs/day, published reference band, reference surface) that
//!   round-trips through serde_json.
//! - [`export_kif_lunar`] wraps the OEM + time-metadata + frame artifacts in the existing KIF
//!   envelope, carrying the lunar honesty label (**MODELLED**) so a consumer reads the tier
//!   from the header.
//!
//! ### Honesty boundary (the moat)
//! The field **names and units** are aligned with *public* standards — CCSDS 502.0-B (OEM),
//! the IAU WGCCRE 2015 lunar frame definitions, and the LunaNet Interoperability
//! Specification / IOAG lunar-architecture descriptions of a lunar time scale and lunar
//! body frame. The export is honestly **MODELLED**: the deterministic round-trip and the
//! field-name conformance are the oracle. This is **not** a certified interoperability
//! conformance test, and it claims no agency affiliation, endorsement, heritage,
//! certification or TRL. The frame/time identifiers are interchange labels, not a statement
//! that the underlying ephemeris is a real flight product.
//!
//! ### Round-trip / conformance
//! `oem.rs` ships *both* directions, so the OEM is round-tripped through
//! [`crate::oem::parse_oem`] **and** independently checked by [`oem_conformance`], which
//! verifies the required CCSDS/LunaNet header fields are present, that `REF_FRAME` /
//! `TIME_SYSTEM` carry the expected lunar tokens, and that the `META_START … META_STOP`
//! framing and the position+velocity data lines are well-formed. The time metadata
//! round-trips through [`parse_lunar_time_metadata`].

use crate::interchange::Envelope;
use crate::lunar_service::LunarConstellation;
use crate::oem::{OemFile, OemMetadata, OemSegment, OemStateLine};
use crate::rinex::EpochUtc;
use serde::{Deserialize, Serialize};

/// Honest verification tier carried on every lunar interchange artifact.
pub const LUNAR_HONESTY_LABEL: &str = "MODELLED";

/// A 3-vector (m or m/s, depending on field).
pub type Vec3 = [f64; 3];

/// The lunar body reference frame an artifact is expressed in. The string forms are the
/// IAU 2015 WGCCRE lunar frame identifiers used as CCSDS `REF_FRAME` / LunaNet frame tags.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum LunarFrameId {
    /// Mean-Earth / polar-axis lunar frame (`MOON_ME`).
    MoonMe,
    /// Principal-axis lunar frame (`MOON_PA`).
    MoonPa,
}

impl LunarFrameId {
    /// The CCSDS / LunaNet `REF_FRAME` token for this frame.
    pub fn as_ccsds_str(self) -> &'static str {
        match self {
            LunarFrameId::MoonMe => "MOON_ME",
            LunarFrameId::MoonPa => "MOON_PA",
        }
    }
}

/// The lunar time scale an artifact's epochs are tagged with. The string forms are the
/// CCSDS `TIME_SYSTEM` / LunaNet time-scale tags.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum LunarTimeId {
    /// Lunar Coordinate Time (`LTC`).
    Ltc,
    /// Lunar coordinate time scale, barycentric-style label (`TCL`).
    Tcl,
    /// Coordinated Universal Time (`UTC`) — the Earth tie.
    Utc,
}

impl LunarTimeId {
    /// The CCSDS / LunaNet `TIME_SYSTEM` token for this time scale.
    pub fn as_ccsds_str(self) -> &'static str {
        match self {
            LunarTimeId::Ltc => "LTC",
            LunarTimeId::Tcl => "TCL",
            LunarTimeId::Utc => "UTC",
        }
    }
}

/// One ephemeris state in the lunar body frame: time past the segment start (s), lunar-centred
/// position (m) and velocity (m/s).
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct EphemState {
    /// Seconds past the segment epoch.
    pub t_s: f64,
    /// Lunar-centred position (m) in the segment's `REF_FRAME`.
    pub pos_m: Vec3,
    /// Lunar-centred velocity (m/s) in the segment's `REF_FRAME`.
    pub vel_m_s: Vec3,
}

/// A deterministic calendar epoch the OEM grid hangs off (the CCSDS `START_TIME`).
const OEM_EPOCH: EpochUtc = EpochUtc {
    year: 2030,
    month: 1,
    day: 1,
    hour: 0,
    minute: 0,
    second: 0.0,
};

/// Build the calendar epoch `OEM_EPOCH + offset_s` using the same small-magnitude
/// seconds-of-day arithmetic as [`crate::oem::OemFile::from_propagators`] so a clean grid
/// stays clean (the JD is only used for the integer-day rollover).
fn epoch_at(offset_s: f64) -> EpochUtc {
    let day_jd0 =
        crate::timescales::julian_date(OEM_EPOCH.year, OEM_EPOCH.month, OEM_EPOCH.day, 0, 0, 0.0);
    let base_sod =
        OEM_EPOCH.hour as f64 * 3600.0 + OEM_EPOCH.minute as f64 * 60.0 + OEM_EPOCH.second;
    let total = base_sod + offset_s;
    let day_add = (total / 86_400.0).floor();
    let mut sod = total - day_add * 86_400.0;
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
}

/// Export a lunar ephemeris as a CCSDS OEM 2.0 (KVN) message in the lunar body frame.
///
/// The OEM header `REF_FRAME` is set to the lunar frame token (`MOON_ME` / `MOON_PA`) and
/// `TIME_SYSTEM` to the lunar time token (`LTC` / `TCL` / `UTC`); `CENTER_NAME` is `MOON`.
/// The state grid is written in km / km·s⁻¹ (the OEM unit convention) from the supplied
/// `states` (m / m·s⁻¹). The `CREATION_DATE` is a fixed deterministic epoch (never
/// wall-clock) so the same inputs produce byte-identical output.
///
/// Reuses [`crate::oem::OemFile::to_oem_string`] verbatim for the serialisation — this is a
/// re-tag of the existing CCSDS emitter for the lunar context, not a new format.
pub fn export_lunar_oem(
    object: &str,
    frame: LunarFrameId,
    time_system: LunarTimeId,
    states: &[EphemState],
) -> String {
    let oem_states: Vec<OemStateLine> = states
        .iter()
        .map(|s| OemStateLine {
            epoch: epoch_at(s.t_s),
            pos_km: [
                s.pos_m[0] / 1000.0,
                s.pos_m[1] / 1000.0,
                s.pos_m[2] / 1000.0,
            ],
            vel_km_s: [
                s.vel_m_s[0] / 1000.0,
                s.vel_m_s[1] / 1000.0,
                s.vel_m_s[2] / 1000.0,
            ],
        })
        .collect();
    let (start, stop) = match (states.first(), states.last()) {
        (Some(a), Some(b)) => (epoch_at(a.t_s), epoch_at(b.t_s)),
        _ => (epoch_at(0.0), epoch_at(0.0)),
    };
    let file = OemFile {
        version: "2.0".to_string(),
        creation_date: OEM_EPOCH,
        originator: "KSHANA".to_string(),
        segments: vec![OemSegment {
            meta: OemMetadata {
                object_name: object.to_string(),
                object_id: object.to_string(),
                center_name: "MOON".to_string(),
                ref_frame: frame.as_ccsds_str().to_string(),
                time_system: time_system.as_ccsds_str().to_string(),
                start,
                stop,
            },
            states: oem_states,
        }],
    };
    file.to_oem_string()
}

/// A LunaNet/IOAG-aligned lunar-time descriptor: the scale identifier, its secular rate
/// against terrestrial time, the published reference band the rate sits in, and the
/// reference surface the scale is defined on. Round-trips through serde_json.
///
/// **MODELLED** — the rate is the crate's closed-form relativistic figure (see
/// [`crate::lunar_time`]), reported with its published 56–59 µs/day band; this is a
/// descriptor for interchange, not a certified time-scale realisation.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct LunarTimeMeta {
    /// The lunar time-scale identifier (`LTC` / `TCL`), the CCSDS `TIME_SYSTEM`-style tag.
    pub scale_id: String,
    /// The secular rate of the lunar-surface clock vs terrestrial time (µs/day).
    pub rate_us_per_day: f64,
    /// Published reference-band lower bound (µs/day).
    pub band_low_us_per_day: f64,
    /// Published reference-band upper bound (µs/day).
    pub band_high_us_per_day: f64,
    /// The reference surface the scale is defined on (e.g. the mean lunar surface / selenoid).
    pub reference_surface: String,
    /// The honesty tier carried on the descriptor (always [`LUNAR_HONESTY_LABEL`]).
    pub honesty: String,
}

/// Build a [`LunarTimeMeta`] descriptor from a secular rate (µs/day), the published band
/// `(low, high)` and a reference-surface label. The scale id is `LTC`.
pub fn export_lunar_time_metadata(
    rate_us_per_day: f64,
    band: (f64, f64),
    reference: &str,
) -> LunarTimeMeta {
    LunarTimeMeta {
        scale_id: LunarTimeId::Ltc.as_ccsds_str().to_string(),
        rate_us_per_day,
        band_low_us_per_day: band.0,
        band_high_us_per_day: band.1,
        reference_surface: reference.to_string(),
        honesty: LUNAR_HONESTY_LABEL.to_string(),
    }
}

/// Parse a [`LunarTimeMeta`] from its serde_json form — the inverse of serialising
/// [`export_lunar_time_metadata`]. Returns `None` on any malformed input.
pub fn parse_lunar_time_metadata(json: &str) -> Option<LunarTimeMeta> {
    serde_json::from_str(json).ok()
}

/// The lunar artifacts that go into a KIF envelope: the OEM ephemeris, the frame label, the
/// time-scale label and the lunar-time descriptor. Serialises as the KIF payload.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct LunarInteropArtifacts {
    /// CCSDS OEM 2.0 (KVN) ephemeris text.
    pub oem: String,
    /// The lunar body frame token (`MOON_ME` / `MOON_PA`).
    pub frame: String,
    /// The lunar time-scale token (`LTC` / `TCL` / `UTC`).
    pub time_system: String,
    /// The LunaNet/IOAG-aligned lunar-time descriptor.
    pub time_metadata: LunarTimeMeta,
    /// The honesty tier (always [`LUNAR_HONESTY_LABEL`]).
    pub honesty: String,
}

/// Wrap the lunar artifacts (OEM + frame + time + descriptor) in the existing KIF envelope,
/// returning compact canonical JSON. The envelope `kind` is `"lunar-interop"` and the lunar
/// honesty label (**MODELLED**) is carried inside the payload.
///
/// Reuses [`crate::interchange::Envelope::wrap`] verbatim — the lunar export rides the same
/// self-describing, versioned interchange envelope as every other Kshana artifact.
pub fn export_kif_lunar(
    object: &str,
    frame: LunarFrameId,
    time_system: LunarTimeId,
    states: &[EphemState],
    time_metadata: &LunarTimeMeta,
) -> String {
    let artifacts = LunarInteropArtifacts {
        oem: export_lunar_oem(object, frame, time_system, states),
        frame: frame.as_ccsds_str().to_string(),
        time_system: time_system.as_ccsds_str().to_string(),
        time_metadata: time_metadata.clone(),
        honesty: LUNAR_HONESTY_LABEL.to_string(),
    };
    // `LunarInteropArtifacts` is four `String` fields plus a `LunarTimeMeta`
    // (`String`s + `f64`s); it contains no non-string-keyed map, so the
    // `serde_json::to_value` inside `Envelope::wrap` cannot fail.
    Envelope::wrap("lunar-interop", &artifacts)
        .expect(
            "LunarInteropArtifacts (Strings + f64s, no non-string-keyed maps) always serialises",
        )
        .to_json()
}

/// The result of checking an OEM string against the required CCSDS/LunaNet header and data
/// fields. `pass` is true only when every required field is present and the expected lunar
/// `REF_FRAME` / `TIME_SYSTEM` tokens are carried; `present_fields` lists the required header
/// fields that were found, and `missing_fields` the ones that were not.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct OemConformance {
    /// Whether every required field is present (and the data block is well-formed).
    pub pass: bool,
    /// The required header fields that were found.
    pub present_fields: Vec<String>,
    /// The required header fields that were missing.
    pub missing_fields: Vec<String>,
    /// The `REF_FRAME` value found (if any).
    pub ref_frame: Option<String>,
    /// The `TIME_SYSTEM` value found (if any).
    pub time_system: Option<String>,
    /// Number of well-formed data lines (epoch + 6 components) seen.
    pub data_lines: usize,
}

/// The required CCSDS/LunaNet header keywords an OEM must carry to be conformant for the
/// lunar interchange (the seven mandatory metadata keywords plus the structural framing).
const REQUIRED_OEM_FIELDS: &[&str] = &[
    "CCSDS_OEM_VERS",
    "META_START",
    "OBJECT_NAME",
    "CENTER_NAME",
    "REF_FRAME",
    "TIME_SYSTEM",
    "START_TIME",
    "STOP_TIME",
    "META_STOP",
];

/// Check that an OEM string carries the required CCSDS/LunaNet header fields, the expected
/// lunar `REF_FRAME` / `TIME_SYSTEM` tokens, the `META_START … META_STOP` framing and at
/// least one well-formed position+velocity data line.
///
/// This is the **field-conformance** oracle used alongside the full
/// [`crate::oem::parse_oem`] round-trip: even when the parser would accept a message, this
/// reports a structured pass / field list so a broken export (e.g. a dropped `TIME_SYSTEM`)
/// is caught and named. `pass` requires every required field present, a lunar `REF_FRAME`
/// token (`MOON_*`), a non-empty `TIME_SYSTEM`, and ≥ 1 data line.
pub fn oem_conformance(oem: &str) -> OemConformance {
    let mut present = Vec::new();
    let mut missing = Vec::new();
    for &field in REQUIRED_OEM_FIELDS {
        // `META_START` / `META_STOP` are bare structural keywords; the rest are `KEY = …`.
        let found = if field == "META_START" || field == "META_STOP" {
            oem.lines().any(|l| l.trim() == field)
        } else {
            oem.lines().any(|l| {
                l.split_once('=')
                    .map(|(k, _)| k.trim() == field)
                    .unwrap_or(false)
            })
        };
        if found {
            present.push(field.to_string());
        } else {
            missing.push(field.to_string());
        }
    }

    let value_of = |key: &str| -> Option<String> {
        oem.lines().find_map(|l| {
            l.split_once('=').and_then(|(k, v)| {
                if k.trim() == key {
                    Some(v.trim().to_string())
                } else {
                    None
                }
            })
        })
    };
    let ref_frame = value_of("REF_FRAME");
    let time_system = value_of("TIME_SYSTEM");

    // Count well-formed data lines: a line with a 'T'-bearing first token (an ISO epoch) and
    // 6 or 9 numeric components after it.
    let data_lines = oem
        .lines()
        .filter(|l| {
            let toks: Vec<&str> = l.split_whitespace().collect();
            if toks.len() != 7 && toks.len() != 10 {
                return false;
            }
            if !toks[0].contains('T') || !toks[0].contains('-') {
                return false;
            }
            toks[1..7].iter().all(|t| t.parse::<f64>().is_ok())
        })
        .count();

    let frame_is_lunar = ref_frame
        .as_deref()
        .map(|f| f.starts_with("MOON_"))
        .unwrap_or(false);
    let time_present = time_system
        .as_deref()
        .map(|t| !t.is_empty())
        .unwrap_or(false);

    let pass = missing.is_empty() && frame_is_lunar && time_present && data_lines >= 1;

    OemConformance {
        pass,
        present_fields: present,
        missing_fields: missing,
        ref_frame,
        time_system,
        data_lines,
    }
}

// ---------------------------------------------------------------------------
// Sample lunar ephemeris (illustrative; from the public-source LCNS-class set)
// ---------------------------------------------------------------------------

/// A sample lunar ephemeris in the MCI frame for one satellite of the illustrative,
/// public-source LCNS-class constellation: `n` states stepped `step_s` apart, position from
/// [`crate::lunar_service::LunarSat::position_mci`] and velocity by central finite difference
/// of the same analytic position. **Illustrative; public-source; not affiliated with ESA.**
fn sample_lunar_states(n: usize, step_s: f64) -> Vec<EphemState> {
    let sat = LunarConstellation::illustrative_lcns(1).sats[0];
    let dt = 1.0_f64; // 1 s half-step for the velocity finite difference
    (0..n)
        .map(|i| {
            let t = i as f64 * step_s;
            let pos = sat.position_mci(t);
            let p_plus = sat.position_mci(t + dt);
            let p_minus = sat.position_mci(t - dt);
            let vel = [
                (p_plus[0] - p_minus[0]) / (2.0 * dt),
                (p_plus[1] - p_minus[1]) / (2.0 * dt),
                (p_plus[2] - p_minus[2]) / (2.0 * dt),
            ];
            EphemState {
                t_s: t,
                pos_m: pos,
                vel_m_s: vel,
            }
        })
        .collect()
}

// ---------------------------------------------------------------------------
// Scenario
// ---------------------------------------------------------------------------

fn d_frame() -> String {
    "MOON_ME".to_string()
}
fn d_time_system() -> String {
    "LTC".to_string()
}
fn d_n_states() -> usize {
    9
}
fn d_step_min() -> f64 {
    30.0
}
fn d_object() -> String {
    "LCNS-ILLUSTRATIVE-1".to_string()
}

/// A runnable lunar interoperability export scenario. The TOML
/// `kind = "lunar-interop-export"` entry the engine dispatches here builds a sample lunar
/// ephemeris (illustrative LCNS-class), exports it as a CCSDS OEM in the chosen lunar frame /
/// time scale, builds the LunaNet/IOAG-aligned lunar-time descriptor, wraps everything in the
/// KIF envelope, and reports which artifacts were emitted plus the round-trip / field
/// conformance result.
///
/// **MODELLED** — deterministic round-trip + field conformance is the oracle; not a certified
/// interoperability conformance test; no agency affiliation/endorsement/heritage/TRL claimed.
#[derive(Clone, Debug, Deserialize)]
pub struct LunarInteropScenario {
    /// Lunar body frame: `MOON_ME` (mean-Earth) or `MOON_PA` (principal-axis).
    #[serde(default = "d_frame")]
    pub frame: String,
    /// Lunar time scale: `LTC`, `TCL` or `UTC`.
    #[serde(default = "d_time_system")]
    pub time_system: String,
    /// Number of ephemeris states to emit.
    #[serde(default = "d_n_states")]
    pub n_states: usize,
    /// Calendar epoch label (informational; the OEM grid hangs off a fixed deterministic
    /// epoch). Free-form ISO-style string.
    #[serde(default)]
    pub epoch: String,
    /// Step between states (minutes).
    #[serde(default = "d_step_min")]
    pub step_min: f64,
    /// Object name written to the OEM `OBJECT_NAME` / `OBJECT_ID`.
    #[serde(default = "d_object")]
    pub object: String,
}

impl Default for LunarInteropScenario {
    fn default() -> Self {
        Self {
            frame: d_frame(),
            time_system: d_time_system(),
            n_states: d_n_states(),
            epoch: String::new(),
            step_min: d_step_min(),
            object: d_object(),
        }
    }
}

/// The result of a [`LunarInteropScenario`].
#[derive(Clone, Debug, Serialize)]
pub struct LunarInteropReport {
    /// The lunar body frame token emitted.
    pub frame: String,
    /// The lunar time-scale token emitted.
    pub time_system: String,
    /// The artifact kinds emitted.
    pub artifacts_emitted: Vec<String>,
    /// Number of states in the ephemeris.
    pub n_states: usize,
    /// Total line count of the OEM string.
    pub oem_line_count: usize,
    /// OEM field-conformance result.
    pub conformance: OemConformance,
    /// Whether the OEM round-trips through [`crate::oem::parse_oem`] back to an equal segment.
    pub oem_roundtrip_ok: bool,
    /// Whether the lunar-time metadata round-trips through serde_json unchanged.
    pub time_metadata_roundtrip_ok: bool,
    /// Byte length of the KIF envelope JSON.
    pub kif_bytes: usize,
    /// The honesty tier (always [`LUNAR_HONESTY_LABEL`]).
    pub honesty: String,
}

impl LunarInteropScenario {
    /// Resolve the configured frame token to a [`LunarFrameId`] (defaults to `MOON_ME`).
    fn frame_id(&self) -> LunarFrameId {
        match self.frame.to_uppercase().as_str() {
            "MOON_PA" => LunarFrameId::MoonPa,
            _ => LunarFrameId::MoonMe,
        }
    }

    /// Resolve the configured time-scale token to a [`LunarTimeId`] (defaults to `LTC`).
    fn time_id(&self) -> LunarTimeId {
        match self.time_system.to_uppercase().as_str() {
            "TCL" => LunarTimeId::Tcl,
            "UTC" => LunarTimeId::Utc,
            _ => LunarTimeId::Ltc,
        }
    }

    /// Run the export, returning a structured [`LunarInteropReport`].
    pub fn run(&self) -> LunarInteropReport {
        let frame = self.frame_id();
        let time_system = self.time_id();
        let n = self.n_states.max(1);
        let step_s = self.step_min * 60.0;
        let states = sample_lunar_states(n, step_s);

        let oem = export_lunar_oem(&self.object, frame, time_system, &states);
        let conformance = oem_conformance(&oem);

        // OEM round-trip: parse the emitted message and check the lunar frame/time and
        // state count survive (oem.rs ships a parser, so this is a true round-trip).
        let oem_roundtrip_ok = match crate::oem::parse_oem(&oem) {
            Ok(parsed) => {
                parsed.segments.len() == 1
                    && parsed.segments[0].meta.ref_frame == frame.as_ccsds_str()
                    && parsed.segments[0].meta.time_system == time_system.as_ccsds_str()
                    && parsed.segments[0].states.len() == n
            }
            Err(_) => false,
        };

        // Time metadata: build from the crate's relativistic rate, round-trip through serde.
        let breakdown = crate::lunar_time::lunar_rate_breakdown(0.0);
        let meta = export_lunar_time_metadata(
            breakdown.total_us_per_day,
            (breakdown.band_low, breakdown.band_high),
            "mean lunar surface (selenoid)",
        );
        // `LunarTimeMeta` is `String`s + `f64`s with no non-string-keyed map, so JSON
        // serialisation cannot fail.
        let meta_json = serde_json::to_string(&meta)
            .expect("LunarTimeMeta (Strings + f64s, no non-string-keyed maps) always serialises");
        let time_metadata_roundtrip_ok =
            parse_lunar_time_metadata(&meta_json) == Some(meta.clone());

        let kif = export_kif_lunar(&self.object, frame, time_system, &states, &meta);

        LunarInteropReport {
            frame: frame.as_ccsds_str().to_string(),
            time_system: time_system.as_ccsds_str().to_string(),
            artifacts_emitted: vec![
                "ccsds-oem".to_string(),
                "lunar-time-metadata".to_string(),
                "kif-envelope".to_string(),
            ],
            n_states: n,
            oem_line_count: oem.lines().count(),
            conformance,
            oem_roundtrip_ok,
            time_metadata_roundtrip_ok,
            kif_bytes: kif.len(),
            honesty: LUNAR_HONESTY_LABEL.to_string(),
        }
    }
}

/// A small "artifacts / conformance" summary card for a [`LunarInteropReport`].
pub fn lunar_interop_svg(r: &LunarInteropReport) -> String {
    let (w, h) = (820.0_f64, 220.0_f64);
    let pass_colour = if r.conformance.pass {
        "#7fd18a"
    } else {
        "#e5645a"
    };
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(
        "<text x=\"24\" y=\"30\" font-size=\"15\" font-weight=\"bold\" fill=\"#e0bd84\">\
         Lunar interoperability export — CCSDS OEM + KIF (LunaNet/IOAG-aligned)</text>",
    );
    svg.push_str(&format!(
        "<text x=\"24\" y=\"58\">REF_FRAME = {} | TIME_SYSTEM = {} | {} states | OEM {} lines</text>",
        r.frame, r.time_system, r.n_states, r.oem_line_count
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"82\">artifacts: {}</text>",
        r.artifacts_emitted.join(", ")
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"110\" fill=\"{pass_colour}\" font-weight=\"bold\">field conformance: {} ({} present, {} missing, {} data lines)</text>",
        if r.conformance.pass { "PASS" } else { "FAIL" },
        r.conformance.present_fields.len(),
        r.conformance.missing_fields.len(),
        r.conformance.data_lines,
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"134\">OEM round-trip: {} | time-metadata round-trip: {} | KIF {} bytes</text>",
        if r.oem_roundtrip_ok { "OK" } else { "FAIL" },
        if r.time_metadata_roundtrip_ok { "OK" } else { "FAIL" },
        r.kif_bytes,
    ));
    svg.push_str(
        "<text x=\"24\" y=\"170\" font-size=\"11\" fill=\"#9a9080\">Round-trip / field conformance vs \
         CCSDS OEM + published LunaNet/IOAG field semantics. MODELLED — not a certified \
         interoperability conformance test; no agency endorsement.</text>",
    );
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn oem_carries_lunar_frame_and_time() {
        let states = sample_lunar_states(5, 600.0);
        let oem = export_lunar_oem("LCNS-1", LunarFrameId::MoonMe, LunarTimeId::Ltc, &states);
        // The lunar REF_FRAME and TIME_SYSTEM tokens are present in the header.
        assert!(
            oem.contains("REF_FRAME = MOON_ME"),
            "OEM missing lunar REF_FRAME line:\n{oem}"
        );
        assert!(
            oem.contains("TIME_SYSTEM = LTC"),
            "OEM missing lunar TIME_SYSTEM line:\n{oem}"
        );
        assert!(oem.contains("CENTER_NAME = MOON"));
        // The object and data lines are present.
        assert!(oem.contains("OBJECT_NAME = LCNS-1"));
        assert!(oem.contains("META_START") && oem.contains("META_STOP"));
        // At least one data line: an epoch with a 'T' separator followed by 6 numbers.
        let has_data = oem.lines().any(|l| {
            let toks: Vec<&str> = l.split_whitespace().collect();
            toks.len() == 7 && toks[0].contains('T')
        });
        assert!(has_data, "OEM has no well-formed data line:\n{oem}");

        // The principal-axis frame token is also emitted when requested.
        let oem_pa = export_lunar_oem("LCNS-1", LunarFrameId::MoonPa, LunarTimeId::Tcl, &states);
        assert!(oem_pa.contains("REF_FRAME = MOON_PA"));
        assert!(oem_pa.contains("TIME_SYSTEM = TCL"));
    }

    #[test]
    fn time_metadata_roundtrips() {
        let meta = export_lunar_time_metadata(57.5, (56.0, 59.0), "mean lunar surface (selenoid)");
        let json = serde_json::to_string(&meta).unwrap();
        let back = parse_lunar_time_metadata(&json).expect("round-trips");
        assert_eq!(back, meta);
        // The rate / band / reference survive verbatim.
        assert_eq!(back.rate_us_per_day, 57.5);
        assert_eq!(back.band_low_us_per_day, 56.0);
        assert_eq!(back.band_high_us_per_day, 59.0);
        assert_eq!(back.reference_surface, "mean lunar surface (selenoid)");
        assert_eq!(back.honesty, LUNAR_HONESTY_LABEL);
        // Garbage does not parse.
        assert!(parse_lunar_time_metadata("not json").is_none());
    }

    #[test]
    fn kif_envelope_roundtrips_or_validates() {
        let states = sample_lunar_states(4, 600.0);
        let meta = export_lunar_time_metadata(57.5, (56.0, 59.0), "selenoid");
        let kif = export_kif_lunar(
            "LCNS-1",
            LunarFrameId::MoonMe,
            LunarTimeId::Ltc,
            &states,
            &meta,
        );
        // interchange.rs ships a parser, so this is a true round-trip back to equal artifacts.
        let env = Envelope::parse(&kif).expect("KIF parses");
        assert_eq!(env.kind, "lunar-interop");
        let artifacts: LunarInteropArtifacts = env.payload_as().expect("payload deserialises");
        assert_eq!(artifacts.frame, "MOON_ME");
        assert_eq!(artifacts.time_system, "LTC");
        assert_eq!(artifacts.time_metadata, meta);
        // The MODELLED honesty label is present on the artifacts.
        assert_eq!(artifacts.honesty, LUNAR_HONESTY_LABEL);
        assert!(kif.contains("MODELLED"));
        // The embedded OEM still carries the lunar frame.
        assert!(artifacts.oem.contains("REF_FRAME = MOON_ME"));
    }

    #[test]
    fn conformance_flags_missing_fields() {
        let states = sample_lunar_states(3, 600.0);
        let good = export_lunar_oem("LCNS-1", LunarFrameId::MoonMe, LunarTimeId::Ltc, &states);
        let ok = oem_conformance(&good);
        assert!(ok.pass, "well-formed lunar OEM should pass: {ok:?}");
        assert!(ok.missing_fields.is_empty());
        assert_eq!(ok.ref_frame.as_deref(), Some("MOON_ME"));
        assert_eq!(ok.time_system.as_deref(), Some("LTC"));
        assert!(ok.data_lines >= 1);

        // A deliberately broken OEM with the TIME_SYSTEM line removed must FAIL.
        let broken: String = good
            .lines()
            .filter(|l| !l.trim_start().starts_with("TIME_SYSTEM"))
            .collect::<Vec<_>>()
            .join("\n");
        let bad = oem_conformance(&broken);
        assert!(!bad.pass, "OEM missing TIME_SYSTEM must fail conformance");
        assert!(
            bad.missing_fields.iter().any(|f| f == "TIME_SYSTEM"),
            "TIME_SYSTEM should be reported missing: {bad:?}"
        );
    }

    #[test]
    fn scenario_runs_through_dispatch_shape() {
        let scn = LunarInteropScenario::default();
        let report = scn.run();
        assert!(report.conformance.pass);
        assert!(report.oem_roundtrip_ok);
        assert!(report.time_metadata_roundtrip_ok);
        assert_eq!(report.frame, "MOON_ME");
        assert_eq!(report.time_system, "LTC");
        assert_eq!(report.honesty, LUNAR_HONESTY_LABEL);
        assert!(report.kif_bytes > 0);
        assert_eq!(report.artifacts_emitted.len(), 3);
        // Serialises to JSON and the SVG is well-formed.
        let json = serde_json::to_string(&report).unwrap();
        assert!(json.starts_with('{'));
        assert!(lunar_interop_svg(&report).starts_with("<svg"));
    }

    #[test]
    fn sample_states_velocity_matches_orbit_speed() {
        // Sanity: the finite-difference velocity has the right magnitude (~1 km/s for the
        // illustrative lunar orbit), i.e. the ephemeris is physically meaningful.
        let states = sample_lunar_states(2, 600.0);
        let v = states[0].vel_m_s;
        let speed = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
        assert!(
            (200.0..5000.0).contains(&speed),
            "lunar-orbit speed out of expected range: {speed} m/s"
        );
    }
}
