// SPDX-License-Identifier: AGPL-3.0-only
//! The laboratory round-trip evidence pack: one signed record that ties together
//! the **scenario** a laboratory ran, the **test conditions** it stated for the run
//! (`kshana.test-conditions/1`, `docs/spec/TEST-CONDITIONS.md`), the **receiver log** the
//! device under test produced, and the **score** of that log against the stated events.
//!
//! It adds a `round_trip` block to a receiver-trust pack's `config.json`, so the manifest's
//! file hashes and the Ed25519 signature cover it. Kshana writes no signal and automates no
//! replay: how a scenario's file reached the receiver (a file played through a simulator,
//! conducted or shielded) is the operator's responsibility and is recorded, not performed.

use super::assemble::{build_pack_with_extra, PackRequest, PackSummary};
use super::bundle::sha256_hex;
use crate::iq::campaign::conditions::{EventKind as CKind, TestConditions};
use crate::receiver_trust::scenario::{self, EventKind};
use serde_json::{json, Value};

/// The tag of the `round_trip` block.
pub const SCHEMA: &str = "kshana.round-trip/1";

/// Largest time difference, in seconds, between an event in the stated conditions and the
/// same event in the scoring scenario.
const EVENT_TOL_S: f64 = 1e-3;

/// What the round trip is and is not, carried in the block.
pub const NOTICE: &str = "Links four records by hash: the scenario, the laboratory's stated \
    test conditions, the receiver log and the score of that log against the stated events. \
    It is not a signal, not a replay recipe and not a certification. How the scenario's \
    motion reached the receiver (a file played through a laboratory simulator, conducted or \
    shielded) was the operator's responsibility and is recorded here only as stated.";

fn kinds_agree(c: CKind, t: EventKind) -> bool {
    matches!(
        (c, t),
        (CKind::Interference, EventKind::Jamming)
            | (CKind::Spoofing, EventKind::Spoofing)
            | (CKind::Outage | CKind::Other, EventKind::Other)
    )
}

/// Check that the stated conditions and the scoring scenario describe the same events,
/// so a pack cannot link a lab record to a score of different truth.
pub fn check_events_agree(
    tc: &TestConditions,
    scn: &scenario::ReceiverTrustScenario,
) -> Result<(), String> {
    if tc.events.len() != scn.events.len() {
        return Err(format!(
            "the test conditions state {} event(s) but the scoring scenario has {}",
            tc.events.len(),
            scn.events.len()
        ));
    }
    let mut a: Vec<_> = tc.events.iter().collect();
    let mut b: Vec<_> = scn.events.iter().collect();
    a.sort_by(|x, y| x.onset_s.total_cmp(&y.onset_s));
    b.sort_by(|x, y| x.onset_s.total_cmp(&y.onset_s));
    for (c, t) in a.into_iter().zip(b) {
        let t_end = t.end_s.unwrap_or(f64::NAN);
        if (c.onset_s - t.onset_s).abs() > EVENT_TOL_S
            || (c.offset_s - t_end).abs() > EVENT_TOL_S
            || !kinds_agree(c.kind, t.kind)
        {
            return Err(format!(
                "event '{}' in the test conditions ({} s to {} s) does not match '{}' in the \
                 scoring scenario ({} s to {:?} s)",
                c.id, c.onset_s, c.offset_s, t.label, t.onset_s, t.end_s
            ));
        }
    }
    Ok(())
}

/// Build the signed round-trip pack.
///
/// `scenario_text` is the scenario that produced the motion (any kind; only its bytes are
/// hashed, as `kshana bench-export` hashed them), `conditions_text` the filled-in
/// `kshana.test-conditions/1` document (TOML or JSON), and `req` the receiver-trust scoring
/// request (its scenario's `[[events]]` are the stated truth the log is scored against).
pub fn build_round_trip_pack(
    req: &PackRequest<'_>,
    scenario_text: &str,
    conditions_text: &str,
    seed: &[u8; 32],
) -> Result<PackSummary, String> {
    let tc = TestConditions::parse(conditions_text)?;
    check_events_agree(&tc, req.scenario)?;
    let result = scenario::run_receiver_trust_bytes(req.scenario, req.log_bytes, req.nav_bytes)?;
    if let Some(h) = &tc.recording.sha256 {
        let have = sha256_hex(req.log_bytes);
        if !h.eq_ignore_ascii_case(&have) {
            return Err(format!(
                "the log's SHA-256 ({have}) is not the one the test conditions state ({h})"
            ));
        }
    }
    let block: Value = json!({
        "schema": SCHEMA,
        "notice": NOTICE,
        "scenario_sha256": sha256_hex(scenario_text.as_bytes()),
        "conditions_schema": tc.schema,
        "conditions_hash": tc.hash(),
        "conditions_recording_id": tc.recording.id,
        "device_under_test": tc.receiver.dut,
        "log_sha256": sha256_hex(req.log_bytes),
        "scoring_scenario_hash": result.scenario_hash,
        "stated_events": tc.events.len(),
        "score": {
            "events_detected": result.events_detected,
            "events_evaluable": result.events_evaluable,
            "first_alarm_s": result.first_alarm_s,
            "label": scenario::LABEL,
        },
    });
    build_pack_with_extra(req, seed, None, Some(block))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn event_kinds_map_one_to_one() {
        assert!(kinds_agree(CKind::Interference, EventKind::Jamming));
        assert!(kinds_agree(CKind::Spoofing, EventKind::Spoofing));
        assert!(kinds_agree(CKind::Outage, EventKind::Other));
        assert!(!kinds_agree(CKind::Spoofing, EventKind::Jamming));
    }
}
