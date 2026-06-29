// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana Interchange Format (KIF) — a neutral, versioned, self-describing
//! envelope for Kshana artifacts (scenarios, run results, trade studies, …).
//!
//! The open engine already emits versioned JSON result artifacts (see
//! [`crate::report::RunResult`] and [`docs/SCHEMA.md`]). This module turns that
//! convention into a *standard*: one place that owns the schema version, a
//! recognisable format tag, an explicit compatibility contract, and a
//! round-trippable wrapper any third-party tool can read **before** it commits
//! to a payload schema. That is what makes Kshana citable as an interchange
//! format rather than just a program's output.
//!
//! ### Why an envelope
//! A consumer that finds a `.json` on disk needs three things before it parses
//! the body: *is this a Kshana artifact?* ([`Envelope::format`]), *what kind?*
//! ([`Envelope::kind`]), and *can my version of the reader understand it?*
//! ([`Envelope::compatibility`]). The envelope answers all three from the
//! header alone, so a tool can route or reject without knowing the payload type.
//!
//! ### Determinism
//! The envelope carries **no timestamp**. Kshana's core promise is bit-for-bit
//! reproducibility — `scenario + seed + engine_version` reproduces a run, and
//! the scenario hash is stable. A wall-clock stamp would break that, so it is
//! deliberately omitted; provenance lives in [`Envelope::engine_version`] and
//! the payload's own `scenario_hash`.
//!
//! ### Compatibility rule (pre-1.0 semantics)
//! Versions are `MAJOR.MINOR`. New fields are added with `#[serde(default)]`
//! (the additive discipline), so a reader can always parse an artifact of the
//! **same major and an equal-or-older minor**. A strictly newer minor may carry
//! fields this reader does not know how to honour, and a different major is a
//! structural break — both are refused. See [`compatibility`].

use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::fmt;

/// Current interchange schema version, `MAJOR.MINOR`.
///
/// **Single source of truth.** Every artifact stamps this value; result structs
/// across the crate reference it rather than copying the literal, so the version
/// can never drift between packs.
pub const SCHEMA_VERSION: &str = "0.7";

/// Format discriminator stamped in every envelope so a foreign tool can
/// recognise a Kshana artifact before it commits to a payload schema.
pub const FORMAT_TAG: &str = "kshana-interchange";

/// A self-describing wrapper around any Kshana artifact.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Envelope {
    /// Always [`FORMAT_TAG`]; lets a consumer recognise the file.
    pub format: String,
    /// The [`SCHEMA_VERSION`] in force when the payload was produced.
    pub schema_version: String,
    /// Artifact kind, e.g. `"scenario"`, `"run-result"`, `"trade-study"`.
    pub kind: String,
    /// Crate version (`Cargo.toml`) that produced the payload.
    pub engine_version: String,
    /// The wrapped artifact, as canonical JSON.
    pub payload: Value,
}

/// Version-compatibility verdict for a consumer reading a foreign artifact.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Compatibility {
    /// Same major, artifact minor ≤ ours — readable under the additive-field
    /// discipline.
    Compatible,
    /// Same major, artifact minor strictly newer than ours — produced by a
    /// later engine; this reader may miss fields, so it is refused.
    ForwardIncompatible,
    /// Different major — a structural break; refused.
    MajorIncompatible,
    /// Version string is not `MAJOR.MINOR` of unsigned integers.
    Malformed,
}

/// Errors from reading or building an [`Envelope`].
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum InterchangeError {
    /// Payload failed to serialize into JSON during [`Envelope::wrap`].
    Encode(String),
    /// The JSON did not deserialize into an [`Envelope`].
    Parse(String),
    /// The `format` field was not [`FORMAT_TAG`] (carries what was found).
    NotKshana(String),
    /// Version mismatch; carries the verdict and the offending version string.
    Incompatible(Compatibility, String),
    /// The payload did not deserialize into the requested type.
    Payload(String),
}

impl fmt::Display for InterchangeError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            InterchangeError::Encode(e) => write!(f, "failed to encode payload: {e}"),
            InterchangeError::Parse(e) => write!(f, "not a valid interchange envelope: {e}"),
            InterchangeError::NotKshana(found) => {
                write!(
                    f,
                    "not a Kshana artifact: format is {found:?}, expected {FORMAT_TAG:?}"
                )
            }
            InterchangeError::Incompatible(verdict, v) => {
                write!(f, "incompatible schema version {v:?} ({verdict:?}); this engine speaks {SCHEMA_VERSION:?}")
            }
            InterchangeError::Payload(e) => {
                write!(f, "payload did not match the requested type: {e}")
            }
        }
    }
}

impl std::error::Error for InterchangeError {}

/// Parse a `MAJOR.MINOR` version into `(major, minor)`, rejecting anything that
/// is not exactly two unsigned-integer components.
fn parse_version(v: &str) -> Option<(u32, u32)> {
    let mut parts = v.split('.');
    let major = parts.next()?.parse::<u32>().ok()?;
    let minor = parts.next()?.parse::<u32>().ok()?;
    if parts.next().is_some() {
        return None; // exactly MAJOR.MINOR — "0.7.1" is malformed for this format
    }
    Some((major, minor))
}

/// Classify a foreign artifact's `schema_version` against this engine's
/// [`SCHEMA_VERSION`]. See the module docs for the rule.
pub fn compatibility(version: &str) -> Compatibility {
    let (cur_major, cur_minor) = parse_version(SCHEMA_VERSION)
        .expect("SCHEMA_VERSION is the compile-time constant \"0.7\", which parses as MAJOR.MINOR");
    match parse_version(version) {
        None => Compatibility::Malformed,
        Some((major, _)) if major != cur_major => Compatibility::MajorIncompatible,
        Some((_, minor)) if minor > cur_minor => Compatibility::ForwardIncompatible,
        Some(_) => Compatibility::Compatible,
    }
}

impl Envelope {
    /// Wrap any serializable artifact, stamping the format tag, current schema
    /// version, and engine version.
    pub fn wrap(kind: &str, payload: &impl Serialize) -> Result<Envelope, InterchangeError> {
        let payload =
            serde_json::to_value(payload).map_err(|e| InterchangeError::Encode(e.to_string()))?;
        Ok(Envelope {
            format: FORMAT_TAG.into(),
            schema_version: SCHEMA_VERSION.into(),
            kind: kind.into(),
            engine_version: env!("CARGO_PKG_VERSION").into(),
            payload,
        })
    }

    /// Compact canonical JSON.
    pub fn to_json(&self) -> String {
        // `Envelope` is four `String` fields plus a `serde_json::Value` payload.
        // `Value` serialises infallibly (its object keys are `String`), and JSON
        // string serialisation never fails for such data, so this cannot error.
        serde_json::to_string(self)
            .expect("Envelope (Strings + serde_json::Value) always serialises")
    }

    /// Indented JSON for files a human will read.
    pub fn to_json_pretty(&self) -> String {
        // See `to_json`: `Envelope` (four `String`s + a `serde_json::Value`) serialises
        // infallibly.
        serde_json::to_string_pretty(self)
            .expect("Envelope (Strings + serde_json::Value) always serialises")
    }

    /// Read an envelope from JSON, **validating** that it is a Kshana artifact
    /// of a compatible version. Use this on the boundary; it refuses foreign or
    /// future-versioned input rather than silently mis-parsing it.
    pub fn parse(json: &str) -> Result<Envelope, InterchangeError> {
        let envelope: Envelope =
            serde_json::from_str(json).map_err(|e| InterchangeError::Parse(e.to_string()))?;
        if envelope.format != FORMAT_TAG {
            return Err(InterchangeError::NotKshana(envelope.format));
        }
        match compatibility(&envelope.schema_version) {
            Compatibility::Compatible => Ok(envelope),
            verdict => Err(InterchangeError::Incompatible(
                verdict,
                envelope.schema_version,
            )),
        }
    }

    /// This envelope's compatibility verdict against the running engine.
    pub fn compatibility(&self) -> Compatibility {
        compatibility(&self.schema_version)
    }

    /// Deserialize the payload into a concrete type. Works for any artifact
    /// whose type implements `Deserialize` (e.g. [`crate::scenario::Scenario`]).
    /// Result artifacts are serialize-only by design and are read as the raw
    /// [`Envelope::payload`] `Value`.
    pub fn payload_as<T: serde::de::DeserializeOwned>(&self) -> Result<T, InterchangeError> {
        serde_json::from_value(self.payload.clone())
            .map_err(|e| InterchangeError::Payload(e.to_string()))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
    struct Demo {
        a: u32,
        b: String,
    }

    fn demo() -> Demo {
        Demo {
            a: 7,
            b: "optical-sr-lattice".into(),
        }
    }

    #[test]
    fn schema_version_constant_is_well_formed() {
        // Guards the `expect` inside `compatibility`.
        assert!(parse_version(SCHEMA_VERSION).is_some());
    }

    #[test]
    fn wrap_stamps_header_fields() {
        let env = Envelope::wrap("run-result", &demo()).unwrap();
        assert_eq!(env.format, FORMAT_TAG);
        assert_eq!(env.schema_version, SCHEMA_VERSION);
        assert_eq!(env.kind, "run-result");
        assert_eq!(env.engine_version, env!("CARGO_PKG_VERSION"));
        assert_eq!(env.payload["a"], 7);
    }

    #[test]
    fn round_trip_preserves_payload_and_header() {
        let env = Envelope::wrap("scenario", &demo()).unwrap();
        let json = env.to_json();
        let back = Envelope::parse(&json).unwrap();
        assert_eq!(back, env);
        let payload: Demo = back.payload_as().unwrap();
        assert_eq!(payload, demo());
    }

    #[test]
    fn pretty_json_is_self_describing() {
        let json = Envelope::wrap("scenario", &demo())
            .unwrap()
            .to_json_pretty();
        assert!(json.contains(FORMAT_TAG));
        assert!(json.contains("schema_version"));
        assert!(json.contains("engine_version"));
    }

    #[test]
    fn parse_rejects_non_kshana_artifact() {
        let alien = r#"{"format":"some-other-tool","schema_version":"0.7","kind":"x","engine_version":"1","payload":{}}"#;
        match Envelope::parse(alien) {
            Err(InterchangeError::NotKshana(found)) => assert_eq!(found, "some-other-tool"),
            other => panic!("expected NotKshana, got {other:?}"),
        }
    }

    #[test]
    fn parse_rejects_garbage() {
        assert!(matches!(
            Envelope::parse("not json at all"),
            Err(InterchangeError::Parse(_))
        ));
    }

    #[test]
    fn parse_rejects_forward_and_major_incompatible() {
        let mk = |v: &str| {
            format!(
                r#"{{"format":"{FORMAT_TAG}","schema_version":"{v}","kind":"x","engine_version":"1","payload":{{}}}}"#
            )
        };
        // A newer minor than this engine knows.
        match Envelope::parse(&mk("0.99")) {
            Err(InterchangeError::Incompatible(Compatibility::ForwardIncompatible, v)) => {
                assert_eq!(v, "0.99")
            }
            other => panic!("expected ForwardIncompatible, got {other:?}"),
        }
        // A different major.
        match Envelope::parse(&mk("1.0")) {
            Err(InterchangeError::Incompatible(Compatibility::MajorIncompatible, v)) => {
                assert_eq!(v, "1.0")
            }
            other => panic!("expected MajorIncompatible, got {other:?}"),
        }
    }

    #[test]
    fn compatibility_rule_table() {
        // Current is 0.7.
        assert_eq!(compatibility("0.7"), Compatibility::Compatible); // exact
        assert_eq!(compatibility("0.6"), Compatibility::Compatible); // older minor, readable
        assert_eq!(compatibility("0.0"), Compatibility::Compatible); // oldest minor, readable
        assert_eq!(compatibility("0.8"), Compatibility::ForwardIncompatible); // newer minor
        assert_eq!(compatibility("1.0"), Compatibility::MajorIncompatible); // newer major
        assert_eq!(compatibility("1.7"), Compatibility::MajorIncompatible); // diff major
        assert_eq!(compatibility("0"), Compatibility::Malformed); // missing minor
        assert_eq!(compatibility("0.7.1"), Compatibility::Malformed); // patch component
        assert_eq!(compatibility("x.y"), Compatibility::Malformed); // non-numeric
        assert_eq!(compatibility(""), Compatibility::Malformed); // empty
    }

    #[test]
    fn payload_as_reports_type_mismatch() {
        let env = Envelope::wrap("scenario", &demo()).unwrap();
        // `Demo.a` is a number, not a struct — asking for the wrong shape fails.
        let wrong: Result<Vec<u32>, _> = env.payload_as();
        assert!(matches!(wrong, Err(InterchangeError::Payload(_))));
    }

    #[test]
    fn wraps_and_round_trips_a_real_scenario() {
        // Proves the envelope works on a real, Deserialize-able artifact.
        use crate::scenario::*;
        let scn = Scenario {
            seed: 1,
            threshold_ns: 100.0,
            runs: 1,
            time: TimeCfg {
                step_s: 10.0,
                duration_s: 60.0,
            },
            gnss: GnssTimeline {
                windows: vec![GnssWindow {
                    t0: 0.0,
                    t1: 60.0,
                    state: GnssState::Denied,
                }],
            },
            clock_quantum: ClockCfg {
                id: "q".into(),
                provenance: "d".into(),
                y0: 1e-13,
                q_wf: 1e-26,
                q_rw: 1e-32,
                drift: 0.0,
                flicker_floor: 0.0,
            },
            clock_classical: ClockCfg {
                id: "c".into(),
                provenance: "d".into(),
                y0: 1e-11,
                q_wf: 1e-24,
                q_rw: 1e-30,
                drift: 0.0,
                flicker_floor: 0.0,
            },
        };
        let env = Envelope::wrap("scenario", &scn).unwrap();
        let back: Scenario = Envelope::parse(&env.to_json())
            .unwrap()
            .payload_as()
            .unwrap();
        assert_eq!(back.seed, scn.seed);
        assert_eq!(back.threshold_ns, scn.threshold_ns);
        assert_eq!(back.gnss.windows.len(), 1);
    }
}
