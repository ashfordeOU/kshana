// SPDX-License-Identifier: Apache-2.0
//! Scenario dispatch shared by the CLI and the language bindings.
//!
//! [`run_toml`] parses a scenario from a TOML string, dispatches on its `kind`,
//! runs the matching pack, and returns the result as pretty JSON together with an
//! SVG chart and a one-line summary. The CLI, the Python binding, and the
//! WebAssembly binding all go through this one entry point so they never drift.

use crate::scenario::GnssState;
use serde::Deserialize;

/// The outputs of a scenario run: the result document, an SVG chart, and a
/// human-readable one-line summary.
pub struct RunOutput {
    pub json: String,
    pub svg: String,
    pub summary: String,
}

#[derive(Deserialize)]
struct Kind {
    #[serde(default)]
    kind: String,
}

fn json_of<T: serde::Serialize>(v: &T) -> String {
    serde_json::to_string_pretty(v).expect("result serialises")
}

fn integ(i: Option<f64>) -> String {
    i.map_or_else(|| "n/a".to_string(), |v| format!("{v:.3}"))
}

/// Parse, dispatch, and run a scenario given as a TOML string.
pub fn run_toml(src: &str) -> Result<RunOutput, String> {
    let kind: Kind = toml::from_str(src).unwrap_or(Kind {
        kind: String::new(),
    });
    match kind.kind.as_str() {
        "inertial" => {
            let scn: crate::inertial::InertialScenario =
                toml::from_str(src).map_err(|e| format!("invalid inertial scenario: {e}"))?;
            let r = crate::inertial::run_inertial(&scn);
            let summary = format!(
                "scenario {} | quantum holdover {:.0}s p95 {:.2}m | classical holdover {:.0}s p95 {:.1}m",
                &r.scenario_hash[..12],
                r.quantum.fom.holdover_s, r.quantum.fom.pos_p95_m,
                r.classical.fom.holdover_s, r.classical.fom.pos_p95_m,
            );
            Ok(RunOutput {
                json: json_of(&r),
                svg: crate::inertial::to_svg(&r),
                summary,
            })
        }
        "timetransfer" => {
            let scn: crate::timetransfer::TimeTransferScenario =
                toml::from_str(src).map_err(|e| format!("invalid time-transfer scenario: {e}"))?;
            let r = crate::timetransfer::run_timetransfer(&scn);
            let summary = format!(
                "scenario {} | optical sync_rms {:.2}ps range_rms {:.3}mm | RF sync_rms {:.1}ps range_rms {:.1}mm",
                &r.scenario_hash[..12],
                r.quantum.fom.sync_rms_ps, r.quantum.fom.range_rms_mm,
                r.classical.fom.sync_rms_ps, r.classical.fom.range_rms_mm,
            );
            Ok(RunOutput {
                json: json_of(&r),
                svg: crate::timetransfer::to_svg(&r),
                summary,
            })
        }
        "hybrid" => {
            let scn: crate::hybrid::HybridScenario =
                toml::from_str(src).map_err(|e| format!("invalid hybrid scenario: {e}"))?;
            let r = crate::hybrid::run_hybrid(&scn);
            let summary = format!(
                "scenario {} | quantum PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) | classical PNT-holdover {:.0}s (t {:.0}s/p {:.0}s)",
                &r.scenario_hash[..12],
                r.quantum.fom.pnt_holdover_s, r.quantum.fom.timing_holdover_s, r.quantum.fom.position_holdover_s,
                r.classical.fom.pnt_holdover_s, r.classical.fom.timing_holdover_s, r.classical.fom.position_holdover_s,
            );
            Ok(RunOutput {
                json: json_of(&r),
                svg: crate::hybrid::to_svg(&r),
                summary,
            })
        }
        "orbit" => {
            let scn: crate::orbit::OrbitClockScenario =
                toml::from_str(src).map_err(|e| format!("invalid orbit scenario: {e}"))?;
            let r = crate::run::run_orbit_clock(&scn);
            let nominal = r
                .quantum
                .series
                .iter()
                .filter(|s| s.gnss == GnssState::Nominal)
                .count();
            let summary = format!(
                "scenario {} | {}/{} samples GNSS-nominal | quantum holdover {:.0}s p95 {:.1}ns integrity {} security {} | classical holdover {:.0}s p95 {:.1}ns integrity {} security {}",
                &r.scenario_hash[..12],
                nominal, r.quantum.series.len(),
                r.quantum.fom.holdover_s, r.quantum.fom.timing_p95_ns, integ(r.quantum.fom.integrity), integ(r.quantum.fom.security),
                r.classical.fom.holdover_s, r.classical.fom.timing_p95_ns, integ(r.classical.fom.integrity), integ(r.classical.fom.security),
            );
            Ok(RunOutput {
                json: json_of(&r),
                svg: crate::report::to_svg(&r),
                summary,
            })
        }
        _ => {
            let scn: crate::scenario::Scenario =
                toml::from_str(src).map_err(|e| format!("invalid scenario: {e}"))?;
            let r = crate::run::run(&scn);
            let summary = format!(
                "scenario {} | quantum holdover {:.0}s p95 {:.1}ns integrity {} security {} | classical holdover {:.0}s p95 {:.1}ns integrity {} security {}",
                &r.scenario_hash[..12],
                r.quantum.fom.holdover_s, r.quantum.fom.timing_p95_ns, integ(r.quantum.fom.integrity), integ(r.quantum.fom.security),
                r.classical.fom.holdover_s, r.classical.fom.timing_p95_ns, integ(r.classical.fom.integrity), integ(r.classical.fom.security),
            );
            Ok(RunOutput {
                json: json_of(&r),
                svg: crate::report::to_svg(&r),
                summary,
            })
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn dispatches_each_kind_and_emits_json_and_svg() {
        for src in [
            include_str!("../scenarios/clock-holdover.toml"),
            include_str!("../scenarios/imu-deadreckoning.toml"),
            include_str!("../scenarios/timetransfer.toml"),
            include_str!("../scenarios/hybrid-pnt.toml"),
            include_str!("../scenarios/orbit-gnss-challenged.toml"),
        ] {
            let out = run_toml(src).expect("scenario runs");
            assert!(out.json.starts_with('{'));
            assert!(out.svg.starts_with("<svg"));
            assert!(out.summary.starts_with("scenario "));
        }
    }

    #[test]
    fn invalid_scenario_is_an_error() {
        assert!(run_toml("kind = \"orbit\"\nnot_valid = true").is_err());
    }
}
