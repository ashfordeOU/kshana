// SPDX-License-Identifier: AGPL-3.0-only
//! Library entry points for assessing a vessel's NMEA 0183, for callers that hold the session
//! and the bytes in memory (the Python bindings, the WebAssembly package, the Model Context
//! Protocol server): no files, no clock, no sockets, and bounded work.
//!
//! * [`assess_vessel_log`]: a whole log, scored as a batch run; the same result as
//!   `kshana receiver-trust <session.toml>`.
//! * [`assess_stream_excerpt`]: a bounded piece of a stream, scored the way live mode scores
//!   it, returned in the live JSON-lines schema. The long-running live mode itself (sockets,
//!   files being appended, the gate) is in the binary.

use serde::Serialize;

use super::live::{parse_live_scenario, EpochReport, LiveEngine};
use super::monitors::TrustState;
use super::scenario::{run_receiver_trust_bytes, ReceiverTrustResult};

/// The largest excerpt [`assess_stream_excerpt`] takes, bytes.
pub const MAX_EXCERPT_BYTES: usize = 2 * 1024 * 1024;
/// The most epochs [`assess_stream_excerpt`] scores. Each epoch is scored over the
/// calibration epochs and the last minute or so of the stream, so the work is linear in this.
pub const MAX_EXCERPT_EPOCHS: usize = 20_000;

/// Assess a vessel's NMEA 0183 log: the session TOML (a `[platform] kind = "vessel"` scenario;
/// its `[log]` table is optional and only its `format`, default `nmea`, is used) and the log's
/// bytes. Returns the serialisable batch result: the score model, the monitors that ran and
/// every epoch's score with its deductions.
pub fn assess_vessel_log(session_toml: &str, log: &[u8]) -> Result<ReceiverTrustResult, String> {
    let scn = parse_live_scenario(session_toml)?;
    if !scn.monitors.platform.is_vessel() {
        return Err("a vessel assessment needs [platform] kind = \"vessel\"".into());
    }
    run_receiver_trust_bytes(&scn, log, None)
}

/// The counts and extremes of an excerpt.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ExcerptSummary {
    /// Epochs scored or calibrating.
    pub epochs: usize,
    /// Epochs inside the calibration window.
    pub calibrating: usize,
    /// Epochs in each band after calibration.
    pub nominal: usize,
    /// Epochs in the degraded band.
    pub degraded: usize,
    /// Epochs in the untrusted band.
    pub untrusted: usize,
    /// Lowest score after calibration.
    pub lowest_score: Option<f64>,
    /// Score of the last epoch.
    pub final_score: Option<f64>,
    /// `t_s` of the first untrusted epoch.
    pub first_untrusted_t_s: Option<f64>,
}

/// An assessed excerpt, in the live schema.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ExcerptAssessment {
    /// Version of the per-epoch schema (the live JSON-lines schema).
    pub schema: &'static str,
    /// What this software is and is not.
    pub advisory: &'static str,
    /// One report per epoch, as live mode writes them (the gate is off).
    pub epochs: Vec<EpochReport>,
    /// The `$PKSHT` sentence of the last epoch.
    pub last_pksht: Option<String>,
    /// Counts and extremes.
    pub summary: ExcerptSummary,
}

/// Score a bounded excerpt of a vessel's NMEA 0183 stream as live mode would. The session is as
/// for [`assess_vessel_log`]. The excerpt must hold the calibration window (`calibration_s`,
/// default 60 s) before anything is scored, and is limited to [`MAX_EXCERPT_BYTES`] and
/// [`MAX_EXCERPT_EPOCHS`]. The receiver's time is not compared with a host clock (an excerpt
/// is not arriving in real time).
pub fn assess_stream_excerpt(
    session_toml: &str,
    excerpt: &[u8],
) -> Result<ExcerptAssessment, String> {
    if excerpt.len() > MAX_EXCERPT_BYTES {
        return Err(format!(
            "excerpt is {} bytes; the limit is {MAX_EXCERPT_BYTES}",
            excerpt.len()
        ));
    }
    let scn = parse_live_scenario(session_toml)?;
    let mut engine = LiveEngine::new(&scn, false)?;
    engine.set_host_clock(false);
    let mut epochs: Vec<EpochReport> = Vec::new();
    let mut push = |out: super::live::LiveOut| -> Result<(), String> {
        epochs.extend(out.reports);
        if epochs.len() > MAX_EXCERPT_EPOCHS {
            return Err(format!(
                "excerpt holds more than {MAX_EXCERPT_EPOCHS} epochs; cut it shorter"
            ));
        }
        Ok(())
    };
    for line in excerpt.split_inclusive(|b| *b == b'\n') {
        push(engine.feed_line(line, 0.0))?;
    }
    push(engine.finish())?;
    if let Some(e) = epochs.iter().find_map(|e| e.note.clone()) {
        return Err(e);
    }
    let after: Vec<&EpochReport> = epochs
        .iter()
        .filter(|e| e.state != TrustState::Calibrating)
        .collect();
    if after.is_empty() {
        return Err(format!(
            "the excerpt ends inside the {} s calibration window ({} epochs): nothing was scored",
            scn.monitors.calibration_s,
            epochs.len()
        ));
    }
    let count = |s: TrustState| after.iter().filter(|e| e.state == s).count();
    let summary = ExcerptSummary {
        epochs: epochs.len(),
        calibrating: epochs.len() - after.len(),
        nominal: count(TrustState::Nominal),
        degraded: count(TrustState::Degraded),
        untrusted: count(TrustState::Untrusted),
        lowest_score: after.iter().filter_map(|e| e.score).min_by(f64::total_cmp),
        final_score: epochs.last().and_then(|e| e.score),
        first_untrusted_t_s: after
            .iter()
            .find(|e| e.state == TrustState::Untrusted)
            .map(|e| e.t_s),
    };
    let last_pksht = epochs.last().map(EpochReport::pksht);
    Ok(ExcerptAssessment {
        schema: "1.2",
        advisory: super::ADVISORY,
        epochs,
        last_pksht,
        summary,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::receiver_trust::synth::{synth_voyage, DragSpec, VoyageSpec};

    const SESSION: &str = "kind = \"receiver-trust\"\n[monitors]\ncalibration_s = 30.0\n\
        [platform]\nkind = \"vessel\"\nantenna_height_m = 18.0\nheading_sensor = true\n";

    fn voyage(duration_s: f64, drag: bool) -> String {
        synth_voyage(&VoyageSpec {
            duration_s,
            drag: drag.then_some(DragSpec {
                onset_s: 150.0,
                accel_mps2: 0.02,
                speed_mps: 3.0,
                bearing_rel_deg: 90.0,
                cn0_common_dbhz: Some(46.0),
                cn0_ramp_s: 60.0,
            }),
            ..Default::default()
        })
    }

    #[test]
    fn batch_assessment_takes_session_and_bytes() {
        let r = assess_vessel_log(SESSION, voyage(240.0, true).as_bytes()).unwrap();
        assert_eq!(r.log.epochs, 241);
        assert!(r.score_model.is_some());
        assert!(r.states.untrusted_epochs > 0);
        let j = serde_json::to_string(&r).unwrap();
        assert!(j.contains("\"score_model\""));
        assert!(assess_vessel_log("kind = \"receiver-trust\"\n", b"").is_err());
    }

    #[test]
    fn excerpt_gives_the_batch_scores_in_the_live_schema() {
        let text = voyage(240.0, true);
        let ex = assess_stream_excerpt(SESSION, text.as_bytes()).unwrap();
        let batch = assess_vessel_log(SESSION, text.as_bytes()).unwrap();
        assert_eq!(ex.schema, "1.2");
        assert_eq!(ex.epochs.len(), batch.epochs.len());
        for (l, b) in ex.epochs.iter().zip(&batch.epochs) {
            assert_eq!((l.t_s, l.state), (b.t_s, b.state));
            assert_eq!(l.score, b.score.as_ref().map(|s| s.score));
        }
        assert_eq!(ex.summary.calibrating, 30);
        assert_eq!(
            ex.summary.nominal + ex.summary.degraded + ex.summary.untrusted,
            211
        );
        assert!(ex.summary.first_untrusted_t_s.is_some());
        assert!(ex.last_pksht.unwrap().starts_with("$PKSHT,1,"));
    }

    #[test]
    fn excerpt_limits_and_short_excerpts_are_errors() {
        let big = vec![b'x'; MAX_EXCERPT_BYTES + 1];
        assert!(assess_stream_excerpt(SESSION, &big)
            .unwrap_err()
            .contains("limit"));
        let short = voyage(20.0, false);
        let e = assess_stream_excerpt(SESSION, short.as_bytes()).unwrap_err();
        assert!(e.contains("calibration window"), "{e}");
        assert!(assess_stream_excerpt("kind = \"receiver-trust\"\n", b"").is_err());
    }
}
