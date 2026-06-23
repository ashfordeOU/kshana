// SPDX-License-Identifier: AGPL-3.0-only
//! O2 — additive, hash-stable study metadata.
//!
//! A `RunResult` serialized with `meta: None` must produce JSON with NO `"meta"`
//! key (byte back-compat for existing runs), and `hash_scenario` of a scenario
//! must be identical regardless of any study metadata (meta lives on the
//! `RunResult` artifact, not on the `Scenario` inputs that are hashed).

use kshana::fom::{FoMScores, Sample};
use kshana::interchange::SCHEMA_VERSION;
use kshana::report::{hash_scenario, ClockRun, RunResult, StudyMeta};
use kshana::scenario::{ClockCfg, GnssState, GnssTimeline, GnssWindow, Scenario, TimeCfg};
use kshana::types::ModelSpec;

fn demo_scenario() -> Scenario {
    Scenario {
        seed: 1,
        threshold_ns: 100.0,
        runs: 1,
        time: TimeCfg {
            step_s: 10.0,
            duration_s: 60.0,
        },
        gnss: GnssTimeline {
            windows: vec![
                GnssWindow {
                    t0: 0.0,
                    t1: 30.0,
                    state: GnssState::Nominal,
                },
                GnssWindow {
                    t0: 30.0,
                    t1: 60.0,
                    state: GnssState::Denied,
                },
            ],
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
    }
}

fn run_of(id: &str) -> ClockRun {
    ClockRun {
        spec: ModelSpec {
            id: id.into(),
            kind: "clock".into(),
            provenance: "x".into(),
            params: serde_json::json!({}),
        },
        series: vec![Sample {
            t: 0.0,
            error_ns: 0.0,
            gnss: GnssState::Nominal,
        }],
        fom: FoMScores {
            timing_rms_ns: 0.0,
            timing_p95_ns: 0.0,
            holdover_s: 0.0,
            resilience_slope_ns_per_s: 0.0,
            availability: 1.0,
            integrity: None,
            security: None,
        },
        adev_curve: vec![],
        filter_health: None,
    }
}

fn result_with_meta(meta: Option<StudyMeta>) -> RunResult {
    RunResult {
        schema_version: SCHEMA_VERSION.into(),
        engine_version: "test".into(),
        scenario_hash: "abc".into(),
        seed: 1,
        threshold_ns: 20.0,
        quantum: run_of("optical"),
        classical: run_of("csac"),
        eci_track: None,
        meta,
    }
}

#[test]
fn no_meta_means_no_meta_key_in_json() {
    let json = serde_json::to_string(&result_with_meta(None)).unwrap();
    assert!(
        !json.contains("\"meta\""),
        "meta=None must not serialize a \"meta\" key (byte back-compat): {json}"
    );
}

#[test]
fn empty_study_meta_omits_all_optional_fields() {
    // A StudyMeta with all-None fields serializes to an empty object — each field
    // is skip_serializing_if Option::is_none, mirroring the eci_track pattern.
    let meta = StudyMeta {
        study_title: None,
        generated_utc: None,
        author: None,
        disclaimer: None,
    };
    let json = serde_json::to_string(&meta).unwrap();
    assert_eq!(json, "{}", "all-None StudyMeta must serialize to '{{}}'");
}

#[test]
fn present_meta_is_serialized() {
    let meta = StudyMeta {
        study_title: Some("My Study".into()),
        generated_utc: Some("2026-06-23T00:00:00Z".into()),
        author: None,
        disclaimer: None,
    };
    let json = serde_json::to_string(&result_with_meta(Some(meta))).unwrap();
    assert!(
        json.contains("\"meta\""),
        "present meta must serialize: {json}"
    );
    assert!(json.contains("\"study_title\":\"My Study\""));
    assert!(json.contains("\"generated_utc\":\"2026-06-23T00:00:00Z\""));
    // Absent optional sub-fields must not appear.
    assert!(!json.contains("\"author\""));
    assert!(!json.contains("\"disclaimer\""));
}

#[test]
fn scenario_hash_is_independent_of_any_meta() {
    // The scenario hash hashes scenario *inputs* only; study metadata lives on the
    // RunResult artifact, never on the Scenario, so the hash cannot move with it.
    let scn = demo_scenario();
    let baseline = hash_scenario(&scn);

    // Attaching rich meta to a RunResult built around the same scenario does not
    // change the scenario hash, because hash_scenario takes only the Scenario.
    let meta = StudyMeta {
        study_title: Some("Whatever".into()),
        generated_utc: Some("2026-06-23T12:00:00Z".into()),
        author: Some("Author".into()),
        disclaimer: Some("MODELLED".into()),
    };
    let _withed = result_with_meta(Some(meta));
    let again = hash_scenario(&scn);
    assert_eq!(baseline, again);
    assert_eq!(baseline.len(), 64);
}
