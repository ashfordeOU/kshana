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
//!   lunar body frame under its SANA-registered name (`MOON_ME`, or `MOON_PA440` for the DE440
//!   principal axes) and whose `TIME_SYSTEM` is `TDB` by default (`UTC` too; the unregistered
//!   lunar tokens `LTC` / `TCL` only on explicit request, with a `COMMENT` saying so). The
//!   scenario's sample states are rotated from Moon-centred inertial axes into the named body
//!   frame with the DE440 orientation ([`crate::lunar_oem`]). Files with the older unversioned
//!   `MOON_PA` are still read.
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
use crate::palette::chart::{BG, CORAL, FONT_SANS, INK_2, LIME, MUTED, TITLE};
use crate::rinex::EpochUtc;
use serde::{Deserialize, Serialize};

/// Honest verification tier carried on every lunar interchange artifact.
pub const LUNAR_HONESTY_LABEL: &str = "MODELLED";

/// A 3-vector (m or m/s, depending on field).
pub type Vec3 = [f64; 3];

/// The lunar body reference frame an artifact is expressed in. The string forms are values of
/// the SANA "Celestial Body Reference Frames" registry that CCSDS 502.0-B-3 points `REF_FRAME`
/// to: `MOON_ME` and `MOON_PAxxx` (the principal-axis frame of a named JPL DE; written here as
/// `MOON_PA440` for DE440, the separator-free spelling being our reading, to confirm). See
/// docs/LUNAR-OEM.md.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum LunarFrameId {
    /// Moon-centred, ICRF axes (`ICRF` with `CENTER_NAME = MOON`): the inertial frame the sample
    /// states are computed in, written unrotated. The default, because it needs no epoch.
    Icrf,
    /// Mean-Earth / polar-axis lunar frame (`MOON_ME`), realised from DE440 as NAIF
    /// `MOON_ME_DE440_ME421`.
    MoonMe,
    /// DE440 principal-axis lunar frame (`MOON_PA440`).
    MoonPa,
}

impl LunarFrameId {
    /// The CCSDS `REF_FRAME` token written for this frame.
    pub fn as_ccsds_str(self) -> &'static str {
        match self {
            LunarFrameId::Icrf => "ICRF",
            LunarFrameId::MoonMe => "MOON_ME",
            LunarFrameId::MoonPa => "MOON_PA440",
        }
    }

    /// Read a `REF_FRAME` token, including the older unversioned `MOON_PA` this module wrote
    /// before it used registered names (read as DE440 PA) and the NAIF names.
    pub fn parse(token: &str) -> Option<LunarFrameId> {
        match token.trim().to_ascii_uppercase().as_str() {
            "ICRF" => Some(LunarFrameId::Icrf),
            "MOON_ME" | "MOON_ME_DE440_ME421" => Some(LunarFrameId::MoonMe),
            "MOON_PA" | "MOON_PA440" | "MOON_PA_DE440" => Some(LunarFrameId::MoonPa),
            _ => None,
        }
    }

    /// The `COMMENT` that states how the frame is realised.
    fn realisation(self) -> &'static str {
        match self {
            LunarFrameId::Icrf => {
                "REF_FRAME ICRF: Moon-centred, ICRF axes; the inertial states, not rotated into a body frame"
            }
            LunarFrameId::MoonMe => {
                "REF_FRAME MOON_ME realised as NAIF MOON_ME_DE440_ME421 (DE440 PA with the constant offset of moon_de440_220930.tf)"
            }
            LunarFrameId::MoonPa => "REF_FRAME MOON_PA440: the DE440 principal-axis frame",
        }
    }

    /// Whether the frame turns with the Moon, so that inertial states need an absolute epoch
    /// to be rotated into it.
    pub fn is_body_fixed(self) -> bool {
        !matches!(self, LunarFrameId::Icrf)
    }

    fn oem_frame(self) -> crate::lunar_oem::Frame {
        match self {
            LunarFrameId::Icrf => crate::lunar_oem::Frame::Icrf,
            LunarFrameId::MoonMe => crate::lunar_oem::Frame::MoonMe,
            LunarFrameId::MoonPa => crate::lunar_oem::Frame::MoonPa440,
        }
    }
}

/// The time scale an artifact's epochs are tagged with: the CCSDS `TIME_SYSTEM` token. The
/// SANA "Time Systems" registry lists no lunar time scale, so the default is `TDB`; `LTC` and
/// `TCL` are written only when asked for explicitly, with a `COMMENT` saying the value is not
/// registered.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum LunarTimeId {
    /// Barycentric Dynamical Time (`TDB`), SANA-registered; the default.
    Tdb,
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
            LunarTimeId::Tdb => "TDB",
            LunarTimeId::Ltc => "LTC",
            LunarTimeId::Tcl => "TCL",
            LunarTimeId::Utc => "UTC",
        }
    }

    /// Whether the token is a value of the SANA "Time Systems" registry (read 21 November 2026).
    pub fn sana_registered(self) -> bool {
        matches!(self, LunarTimeId::Tdb | LunarTimeId::Utc)
    }

    /// Read a `TIME_SYSTEM` token.
    pub fn parse(token: &str) -> Option<LunarTimeId> {
        match token.trim().to_ascii_uppercase().as_str() {
            "TDB" => Some(LunarTimeId::Tdb),
            "LTC" => Some(LunarTimeId::Ltc),
            "TCL" => Some(LunarTimeId::Tcl),
            "UTC" => Some(LunarTimeId::Utc),
            _ => None,
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

/// The calendar epoch `base + offset_s`, using the same small-magnitude seconds-of-day
/// arithmetic as [`crate::oem::OemFile::from_propagators`] so a clean grid stays clean (the
/// JD is only used for the integer-day rollover).
fn epoch_from(base: &EpochUtc, offset_s: f64) -> EpochUtc {
    let day_jd0 = crate::timescales::julian_date(base.year, base.month, base.day, 0, 0, 0.0);
    let base_sod = base.hour as f64 * 3600.0 + base.minute as f64 * 60.0 + base.second;
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
/// The OEM header `REF_FRAME` is set to the SANA-registered lunar frame token (`MOON_ME` /
/// `MOON_PA440`) and `TIME_SYSTEM` to the time token (`TDB` by default, `UTC`, or on explicit
/// request the unregistered `LTC` / `TCL`); `CENTER_NAME` is `MOON`. `COMMENT` lines at the
/// start of the metadata state the frame's realisation and, for `LTC` / `TCL`, that the value
/// is not SANA-registered. The states must already be in the named frame.
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
    export_lunar_oem_at(object, frame, time_system, states, &OEM_EPOCH)
}

/// [`export_lunar_oem`] on a grid that starts at `start` (`start + t_s` for each state) instead
/// of the fixed 2030-01-01T00:00:00 label: the epoch a scenario's `epoch_tdb` anchors.
pub fn export_lunar_oem_at(
    object: &str,
    frame: LunarFrameId,
    time_system: LunarTimeId,
    states: &[EphemState],
    start: &EpochUtc,
) -> String {
    let epoch_at = |t: f64| epoch_from(start, t);
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
    let mut comments = vec![frame.realisation().to_string()];
    if !time_system.sana_registered() {
        comments.push(format!(
            "TIME_SYSTEM {} is not a SANA-registered value (the SANA Time Systems registry lists no lunar time scale); written on explicit request",
            time_system.as_ccsds_str()
        ));
    }
    let text = file.to_oem_string();
    let mut out = String::with_capacity(text.len() + 256);
    for line in text.split_inclusive('\n') {
        out.push_str(line);
        if line.trim_end() == "META_START" {
            for c in &comments {
                out.push_str("COMMENT ");
                out.push_str(c);
                out.push('\n');
            }
        }
    }
    out
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
    /// The lunar body frame token (`MOON_ME` / `MOON_PA440`).
    pub frame: String,
    /// The time-scale token (`TDB` / `UTC`, or on request `LTC` / `TCL`).
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
    export_kif_lunar_at(
        object,
        frame,
        time_system,
        states,
        time_metadata,
        &OEM_EPOCH,
    )
}

/// [`export_kif_lunar`] with the OEM grid starting at `start` ([`export_lunar_oem_at`]).
pub fn export_kif_lunar_at(
    object: &str,
    frame: LunarFrameId,
    time_system: LunarTimeId,
    states: &[EphemState],
    time_metadata: &LunarTimeMeta,
    start: &EpochUtc,
) -> String {
    let artifacts = LunarInteropArtifacts {
        oem: export_lunar_oem_at(object, frame, time_system, states, start),
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
/// is caught and named. `pass` requires every required field present, a `REF_FRAME` the lunar
/// interchange writes or reads (`ICRF`, `MOON_ME`, `MOON_PA440` and the older spellings,
/// [`LunarFrameId::parse`]), a non-empty `TIME_SYSTEM`, and ≥ 1 data line.
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
        .map(|f| LunarFrameId::parse(f).is_some())
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

/// Moon-centred inertial states (ICRF axes) in the frame `frame`, the state at `t_s` being taken
/// at the TDB epoch `start_tdb + t_s`. For [`LunarFrameId::Icrf`] the states are returned as
/// they are. For a body frame each state is rotated with [`crate::lunar_oem::convert_state`]
/// (the DE440 orientation), and an epoch outside the orientation series (2014 to 2030) is an
/// error: before 0.42 such a state kept its inertial values under the body-frame label.
pub fn in_frame(
    states: &[EphemState],
    frame: LunarFrameId,
    start_tdb: &EpochUtc,
) -> Result<Vec<EphemState>, String> {
    if !frame.is_body_fixed() {
        return Ok(states.to_vec());
    }
    states
        .iter()
        .map(|s| {
            let e = epoch_from(start_tdb, s.t_s);
            let jd =
                crate::timescales::julian_date(e.year, e.month, e.day, e.hour, e.minute, e.second);
            let r = [s.pos_m[0] / 1e3, s.pos_m[1] / 1e3, s.pos_m[2] / 1e3];
            let v = [s.vel_m_s[0] / 1e3, s.vel_m_s[1] / 1e3, s.vel_m_s[2] / 1e3];
            let (r, v) = crate::lunar_oem::convert_state(
                crate::lunar_oem::Frame::Icrf,
                frame.oem_frame(),
                jd,
                r,
                v,
            )?;
            Ok(EphemState {
                t_s: s.t_s,
                pos_m: [r[0] * 1e3, r[1] * 1e3, r[2] * 1e3],
                vel_m_s: [v[0] * 1e3, v[1] * 1e3, v[2] * 1e3],
            })
        })
        .collect()
}

// ---------------------------------------------------------------------------
// Scenario
// ---------------------------------------------------------------------------

fn d_frame() -> String {
    "ICRF".to_string()
}
fn d_time_system() -> String {
    "TDB".to_string()
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
    /// Frame: `ICRF` (default: Moon-centred, ICRF axes, the sample states as computed), or a
    /// lunar body frame, `MOON_ME` (mean-Earth) or `MOON_PA440` (DE440 principal axes; `MOON_PA`
    /// is read as `MOON_PA440`), which needs `epoch_tdb`.
    #[serde(default = "d_frame")]
    pub frame: String,
    /// The TDB epoch of the first state, `YYYY-MM-DDTHH:MM:SS`. It anchors the grid
    /// (`epoch_tdb + t`, written with `TIME_SYSTEM = TDB`) and is required to rotate the
    /// inertial states into a body frame. Without it the grid is the fixed label
    /// 2030-01-01T00:00:00 + t and only `ICRF` is written.
    #[serde(default)]
    pub epoch_tdb: Option<String>,
    /// Time scale: `TDB` (default) or `UTC`; `LTC` or `TCL` only with
    /// `allow_unregistered_time_system = true`, as they are not SANA-registered.
    #[serde(default = "d_time_system")]
    pub time_system: String,
    /// Opt in to writing the unregistered lunar time tokens `LTC` / `TCL`.
    #[serde(default)]
    pub allow_unregistered_time_system: bool,
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
            epoch_tdb: None,
            time_system: d_time_system(),
            allow_unregistered_time_system: false,
            n_states: d_n_states(),
            epoch: String::new(),
            step_min: d_step_min(),
            object: d_object(),
        }
    }
}

/// Unit and provenance class for every numeric field the `lunar-interop-export` report
/// emits.
///
/// The report is [`LunarInteropReport`], serialised by the scenario dispatcher. Its four
/// numeric leaves are all cardinalities of emitted artefacts except `kif_bytes`, which is
/// the byte length of the KIF envelope's JSON text.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "n_states",
            unit: "count",
            provenance: Input,
            definition: "number of ephemeris states exported, the configured value floored \
                         at 1",
        },
        FieldUnit {
            path: "oem_line_count",
            unit: "count",
            provenance: Computed,
            definition: "total number of text lines in the emitted CCSDS OEM message, \
                         headers and data lines together",
        },
        FieldUnit {
            path: "conformance.data_lines",
            unit: "count",
            provenance: Computed,
            definition: "number of well-formed OEM data lines found by the conformance \
                         check: an epoch token followed by 6 or 9 numeric components",
        },
        FieldUnit {
            path: "kif_bytes",
            unit: "octet",
            provenance: Computed,
            definition: "byte length of the serialised KIF envelope JSON wrapping the \
                         emitted artefacts",
        },
    ]
};

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
    /// Check the frame and time tokens: a known frame, a known time scale, and `LTC` / `TCL`
    /// only with the opt-in.
    pub fn validate(&self) -> Result<(), String> {
        if LunarFrameId::parse(&self.frame).is_none() {
            return Err(crate::terr!(
                "e-lunar-interop-unknown-frame",
                frame = self.frame.clone()
            ));
        }
        match LunarTimeId::parse(&self.time_system) {
            None => Err(crate::terr!(
                "e-lunar-interop-unknown-time-system",
                time_system = self.time_system.clone()
            )),
            Some(t) if !t.sana_registered() && !self.allow_unregistered_time_system => {
                Err(crate::terr!(
                    "e-lunar-interop-unregistered-time-system",
                    time_system = self.time_system.clone()
                ))
            }
            Some(_) => Ok(()),
        }?;
        let last_s = (self.n_states.max(1) - 1) as f64 * self.step_min * 60.0;
        if !last_s.is_finite() || last_s < 0.0 {
            return Err(crate::terr!(
                "e-lunar-interop-bad-step",
                step = self.step_min
            ));
        }
        let start = self.start_tdb()?;
        let frame = self.frame_id();
        if frame.is_body_fixed() {
            // A body frame turns with the Moon: the inertial states can be rotated into it only
            // at an absolute epoch, and only inside the DE440 orientation series.
            let Some(start) = start else {
                return Err(crate::terr!(
                    "e-lunar-interop-body-frame-needs-epoch",
                    frame = frame.as_ccsds_str()
                ));
            };
            for t in [0.0, last_s] {
                let e = epoch_from(&start, t);
                let jd = crate::timescales::julian_date(
                    e.year, e.month, e.day, e.hour, e.minute, e.second,
                );
                crate::lunar_frame::try_icrf_to_moon_pa_de440(jd).map_err(|e| e.to_string())?;
            }
        }
        if start.is_some() && self.time_id() != LunarTimeId::Tdb {
            return Err(crate::terr!(
                "e-lunar-interop-epoch-needs-tdb",
                time_system = self.time_system.clone()
            ));
        }
        Ok(())
    }

    /// The parsed `epoch_tdb`, if given.
    fn start_tdb(&self) -> Result<Option<EpochUtc>, String> {
        match &self.epoch_tdb {
            None => Ok(None),
            Some(s) => crate::sil_obs::parse_epoch(s)
                .map(Some)
                .ok_or_else(|| crate::terr!("e-lunar-interop-bad-epoch", epoch = s.clone())),
        }
    }

    /// Resolve the configured frame token to a [`LunarFrameId`] (defaults to `ICRF`).
    fn frame_id(&self) -> LunarFrameId {
        LunarFrameId::parse(&self.frame).unwrap_or(LunarFrameId::Icrf)
    }

    /// Resolve the configured time-scale token to a [`LunarTimeId`] (defaults to `TDB`; `LTC`
    /// and `TCL` fall back to `TDB` unless opted in, which [`Self::validate`] reports).
    fn time_id(&self) -> LunarTimeId {
        match LunarTimeId::parse(&self.time_system) {
            Some(t) if t.sana_registered() || self.allow_unregistered_time_system => t,
            _ => LunarTimeId::Tdb,
        }
    }

    /// Run the export, returning a structured [`LunarInteropReport`]. The scenario is
    /// validated first ([`Self::validate`]): a body frame without `epoch_tdb`, or an epoch
    /// outside the orientation series, is an error, never a silently unrotated file.
    pub fn run(&self) -> Result<LunarInteropReport, String> {
        self.validate()?;
        let frame = self.frame_id();
        let time_system = self.time_id();
        let n = self.n_states.max(1);
        let step_s = self.step_min * 60.0;
        let start = self.start_tdb()?.unwrap_or(OEM_EPOCH);
        let states = in_frame(&sample_lunar_states(n, step_s), frame, &start)?;

        let oem = export_lunar_oem_at(&self.object, frame, time_system, &states, &start);
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

        let kif = export_kif_lunar_at(&self.object, frame, time_system, &states, &meta, &start);

        Ok(LunarInteropReport {
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
        })
    }
}

/// A small "artifacts / conformance" summary card for a [`LunarInteropReport`].
pub fn lunar_interop_svg(r: &LunarInteropReport) -> String {
    let (w, h) = (820.0_f64, 220.0_f64);
    let pass_colour = if r.conformance.pass { LIME } else { CORAL };
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"{FONT_SANS}\" font-size=\"12\" fill=\"{INK_2}\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"{BG}\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"30\" font-size=\"15\" font-weight=\"bold\" fill=\"{TITLE}\">{}</text>",
        crate::t!("lunar-interop-chart-title")
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"58\">{}</text>",
        crate::t!(
            "lunar-interop-chart-header",
            frame = r.frame,
            time_system = r.time_system,
            n_states = r.n_states,
            oem_lines = r.oem_line_count
        )
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"82\">{}</text>",
        crate::t!(
            "lunar-interop-chart-artifacts",
            list = r.artifacts_emitted.join(", ")
        )
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"110\" fill=\"{pass_colour}\" font-weight=\"bold\">{}</text>",
        crate::t!(
            "lunar-interop-chart-conformance",
            verdict = if r.conformance.pass {
                crate::t!("lunar-interop-chart-pass")
            } else {
                crate::t!("lunar-interop-chart-fail")
            },
            present = r.conformance.present_fields.len(),
            missing = r.conformance.missing_fields.len(),
            data_lines = r.conformance.data_lines
        )
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"134\">{}</text>",
        crate::t!(
            "lunar-interop-chart-roundtrip",
            oem = if r.oem_roundtrip_ok {
                crate::t!("lunar-interop-chart-ok")
            } else {
                crate::t!("lunar-interop-chart-fail")
            },
            time_metadata = if r.time_metadata_roundtrip_ok {
                crate::t!("lunar-interop-chart-ok")
            } else {
                crate::t!("lunar-interop-chart-fail")
            },
            kif_bytes = r.kif_bytes
        )
    ));
    svg.push_str(&format!(
        "<text x=\"24\" y=\"170\" font-size=\"11\" fill=\"{MUTED}\">{}</text>",
        crate::t!(
            "lunar-interop-chart-footnote",
            label = crate::t!("fom-verdict-modelled")
        )
    ));
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
        let report = scn.run().unwrap();
        assert!(report.conformance.pass);
        assert!(report.oem_roundtrip_ok);
        assert!(report.time_metadata_roundtrip_ok);
        // The default frame is the states' own inertial frame, which needs no epoch.
        assert_eq!(report.frame, "ICRF");
        // The default time system is the SANA-registered TDB.
        assert_eq!(report.time_system, "TDB");
        assert_eq!(report.honesty, LUNAR_HONESTY_LABEL);
        assert!(report.kif_bytes > 0);
        assert_eq!(report.artifacts_emitted.len(), 3);
        // Serialises to JSON and the SVG is well-formed.
        let json = serde_json::to_string(&report).unwrap();
        assert!(json.starts_with('{'));
        assert!(lunar_interop_svg(&report).starts_with("<svg"));
    }

    #[test]
    fn registered_names_by_default_and_lunar_time_only_on_request() {
        let st = sample_lunar_states(3, 600.0);
        let pa = export_lunar_oem("X", LunarFrameId::MoonPa, LunarTimeId::Tdb, &st);
        assert!(pa.contains("REF_FRAME = MOON_PA440"));
        assert!(pa.contains("TIME_SYSTEM = TDB"));
        assert!(pa.contains("COMMENT REF_FRAME MOON_PA440: the DE440 principal-axis frame"));
        assert!(!pa.contains("not a SANA-registered"));
        let ltc = export_lunar_oem("X", LunarFrameId::MoonMe, LunarTimeId::Ltc, &st);
        assert!(ltc.contains("TIME_SYSTEM = LTC"));
        assert!(ltc.contains("COMMENT TIME_SYSTEM LTC is not a SANA-registered value"));
        // The comments sit at the start of the metadata and the file still parses.
        assert!(crate::oem::parse_oem(&ltc).is_ok());
        assert!(oem_conformance(&ltc).pass);
        // The scenario refuses LTC/TCL unless opted in, and unknown tokens.
        let mut scn = LunarInteropScenario {
            time_system: "LTC".into(),
            ..LunarInteropScenario::default()
        };
        assert!(scn.validate().is_err());
        scn.allow_unregistered_time_system = true;
        assert!(scn.validate().is_ok());
        assert_eq!(scn.run().unwrap().time_system, "LTC");
        scn.frame = "MOON_XX".into();
        assert!(scn.validate().is_err());
        let late = LunarInteropScenario {
            frame: "MOON_ME".into(),
            epoch_tdb: Some("2030-01-01T00:00:00".into()),
            n_states: 100,
            step_min: 10_000.0,
            ..LunarInteropScenario::default()
        };
        assert!(
            late.validate().is_err(),
            "past the DE440 orientation series"
        );
    }

    #[test]
    fn the_written_states_are_in_the_stated_frame() {
        // End to end: the OEM the scenario writes, read back and converted from its stated
        // REF_FRAME to ICRF by the independent conversion path (crate::lunar_oem, which reads
        // the frame from the file), equals the inertial sample to the OEM's printed precision.
        let inertial = sample_lunar_states(5, 1800.0);
        for frame in [LunarFrameId::MoonMe, LunarFrameId::MoonPa] {
            let oem = export_lunar_oem(
                "X",
                frame,
                LunarTimeId::Tdb,
                &in_frame(&inertial, frame, &OEM_EPOCH).unwrap(),
            );
            let parsed = crate::oem::parse_oem(&oem).unwrap();
            let back = crate::lunar_oem::convert(&parsed, crate::lunar_oem::Frame::Icrf).unwrap();
            for (got, want) in back.oem.segments[0].states.iter().zip(&inertial) {
                for k in 0..3 {
                    assert!(
                        (got.pos_km[k] - want.pos_m[k] / 1e3).abs() < 2e-6,
                        "{frame:?}"
                    );
                    assert!(
                        (got.vel_km_s[k] - want.vel_m_s[k] / 1e3).abs() < 3e-9,
                        "{frame:?}"
                    );
                }
            }
            // Labelled as inertial data (no rotation), the file would be off by kilometres.
            let wrong = export_lunar_oem("X", frame, LunarTimeId::Tdb, &inertial);
            let back = crate::lunar_oem::convert(
                &crate::oem::parse_oem(&wrong).unwrap(),
                crate::lunar_oem::Frame::Icrf,
            )
            .unwrap();
            let d = back.oem.segments[0].states[0].pos_km[0] - inertial[0].pos_m[0] / 1e3;
            let e = back.oem.segments[0].states[0].pos_km[1] - inertial[0].pos_m[1] / 1e3;
            assert!(d.hypot(e) > 1.0, "{frame:?}: {d} {e}");
        }
    }

    #[test]
    fn without_an_epoch_the_states_are_written_as_the_inertial_frame_they_are_in() {
        // PIN-SCOPE:    the frame label and the state values of an export with no epoch_tdb.
        // PIN-EXCLUDES: the state values' accuracy (an illustrative ephemeris).
        let scn = LunarInteropScenario::default();
        assert!(scn.epoch_tdb.is_none());
        let n = scn.n_states;
        let inertial = sample_lunar_states(n, scn.step_min * 60.0);
        let states = in_frame(&inertial, LunarFrameId::Icrf, &OEM_EPOCH).unwrap();
        assert_eq!(states, inertial, "ICRF is not rotated");
        let oem = export_lunar_oem("X", LunarFrameId::Icrf, LunarTimeId::Tdb, &states);
        let f = crate::oem::parse_oem(&oem).unwrap();
        assert_eq!(f.segments[0].meta.ref_frame, "ICRF");
        assert_eq!(f.segments[0].meta.center_name, "MOON");
        assert!(oem.contains("COMMENT REF_FRAME ICRF: Moon-centred, ICRF axes"));
        for (l, s) in f.segments[0].states.iter().zip(&inertial) {
            for k in 0..3 {
                assert!((l.pos_km[k] - s.pos_m[k] / 1e3).abs() < 1e-6);
            }
        }
        // A body frame without an epoch is refused, not written unrotated.
        for frame in ["MOON_ME", "MOON_PA440"] {
            let s = LunarInteropScenario {
                frame: frame.into(),
                ..LunarInteropScenario::default()
            };
            let e = s.validate().unwrap_err();
            assert!(e.contains("epoch_tdb"), "{e}");
            assert!(s.run().is_err());
        }
    }

    #[test]
    fn with_an_epoch_the_states_are_rotated_into_the_body_frame_at_that_epoch() {
        let epoch = "2026-06-01T12:00:00";
        let scn = LunarInteropScenario {
            frame: "MOON_PA440".into(),
            epoch_tdb: Some(epoch.into()),
            ..LunarInteropScenario::default()
        };
        let r = scn.run().unwrap();
        assert_eq!(r.frame, "MOON_PA440");
        assert!(r.conformance.pass && r.oem_roundtrip_ok);
        // The grid starts at the epoch, and the file converts back to the inertial states
        // through the independent path that reads the frame and the epochs from the file.
        let start = crate::sil_obs::parse_epoch(epoch).unwrap();
        let inertial = sample_lunar_states(scn.n_states, scn.step_min * 60.0);
        let body = in_frame(&inertial, LunarFrameId::MoonPa, &start).unwrap();
        let oem = export_lunar_oem_at("X", LunarFrameId::MoonPa, LunarTimeId::Tdb, &body, &start);
        let parsed = crate::oem::parse_oem(&oem).unwrap();
        let first = &parsed.segments[0].states[0].epoch;
        assert_eq!(
            (first.year, first.month, first.day, first.hour),
            (2026, 6, 1, 12)
        );
        let back = crate::lunar_oem::convert(&parsed, crate::lunar_oem::Frame::Icrf).unwrap();
        for (got, want) in back.oem.segments[0].states.iter().zip(&inertial) {
            for k in 0..3 {
                assert!((got.pos_km[k] - want.pos_m[k] / 1e3).abs() < 2e-6);
            }
        }
        // The same states rotated at another epoch differ: the epoch matters.
        let other = in_frame(&inertial, LunarFrameId::MoonPa, &OEM_EPOCH).unwrap();
        assert!((other[0].pos_m[0] - body[0].pos_m[0]).abs() > 1.0);
        // An epoch outside the DE440 orientation series is refused, at validation and in
        // in_frame (no state is kept inertial under the body label).
        let out = LunarInteropScenario {
            epoch_tdb: Some("2040-01-01T00:00:00".into()),
            ..scn.clone()
        };
        assert!(out.validate().is_err());
        let far = crate::sil_obs::parse_epoch("2040-01-01T00:00:00").unwrap();
        assert!(in_frame(&inertial, LunarFrameId::MoonPa, &far).is_err());
        // An epoch is TDB: another time system with it is refused, as is a bad date.
        let utc = LunarInteropScenario {
            time_system: "UTC".into(),
            ..scn.clone()
        };
        assert!(utc.validate().is_err());
        let bad = LunarInteropScenario {
            epoch_tdb: Some("June 2026".into()),
            ..scn
        };
        assert!(bad.validate().is_err());
    }

    #[test]
    fn old_tokens_are_still_read() {
        assert_eq!(LunarFrameId::parse("MOON_PA"), Some(LunarFrameId::MoonPa));
        assert_eq!(
            LunarFrameId::parse("moon_pa_de440"),
            Some(LunarFrameId::MoonPa)
        );
        assert_eq!(LunarFrameId::parse("MOON_ME"), Some(LunarFrameId::MoonMe));
        assert_eq!(LunarTimeId::parse("tcl"), Some(LunarTimeId::Tcl));
        assert!(!LunarTimeId::Ltc.sana_registered());
        assert!(LunarTimeId::Utc.sana_registered());
    }

    #[test]
    fn sample_states_are_rotated_into_the_body_frame() {
        // The inertial sample and the exported state differ by the lunar orientation, keep
        // the radius, and convert back to the inertial state.
        let st = sample_lunar_states(2, 600.0);
        for f in [LunarFrameId::MoonMe, LunarFrameId::MoonPa] {
            let b = in_frame(&st, f, &OEM_EPOCH).unwrap();
            let norm = |v: Vec3| (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
            assert!((norm(b[0].pos_m) - norm(st[0].pos_m)).abs() < 1e-6);
            assert!((b[0].pos_m[0] - st[0].pos_m[0]).abs() > 1.0);
            let e = epoch_from(&OEM_EPOCH, 0.0);
            let jd = crate::timescales::julian_date(e.year, e.month, e.day, 0, 0, 0.0);
            let r = b[0].pos_m.map(|x| x / 1e3);
            let v = b[0].vel_m_s.map(|x| x / 1e3);
            let (ri, vi) = crate::lunar_oem::convert_state(
                f.oem_frame(),
                crate::lunar_oem::Frame::Icrf,
                jd,
                r,
                v,
            )
            .unwrap();
            for k in 0..3 {
                assert!((ri[k] * 1e3 - st[0].pos_m[k]).abs() < 1e-6);
                assert!((vi[k] * 1e3 - st[0].vel_m_s[k]).abs() < 1e-9);
            }
        }
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
