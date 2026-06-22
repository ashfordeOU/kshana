// SPDX-License-Identifier: AGPL-3.0-only
//! Phase-B signal-quality-monitoring (`sqm`) adapter: correlator I/Q → SQM imbalance.
//!
//! The Early/Late correlation distortion that betrays meaconing, replay, and
//! matched-power spoofing is only visible inside a tracking loop, so the raw IQ of
//! TEXBAT/OAKBAT must first run through an open software receiver (GNSS-SDR or
//! FGI-GSRx) that dumps per-epoch correlator taps. This adapter ingests those taps and
//! reuses the validated [`SqmMonitor::el_metric`] — the same Early-minus-Late monitor
//! the synthetic corpus uses — so the real-data SQM detector is identical physics, only
//! fed real correlators.
//!
//! ## Input schema (SDR-agnostic)
//!
//! A header row names the columns; the parser maps by name (order-independent). The
//! required taps are the complex Early and Late correlators:
//!
//! ```text
//! epoch_s,prn,early_i,early_q,late_i,late_q
//! 0.0,5,4.90,0.30,4.88,0.31
//! ```
//!
//! Map your SDR's dump to these columns:
//! * **GNSS-SDR** `Tracking_dump`: `Early = abs_E`, `Late = abs_L` (or the raw
//!   `E={d_E_I,d_E_Q}`, `L={d_L_I,d_L_Q}` taps).
//! * **FGI-GSRx** `trackResults`: `E = {IE, QE}`, `L = {IL, QL}`.
//!
//! The SQM score is `|(|E| − |L|)/(|E| + |L|)|` (symmetric peak ⇒ 0; distortion ⇒
//! larger), already rising with impairment, so it is [`Orient::Raw`].

use super::{Observation, Orient};
use crate::spoof_monitors::SqmMonitor;

/// Extract `sqm` observations from correlator-dump CSV text. Each row's Early and Late
/// complex taps give an Early-minus-Late imbalance; its magnitude is the score. Rows
/// missing a required tap are skipped. Returns empty if no header / required columns.
pub fn observations(text: &str) -> Vec<Observation> {
    let mut lines = text
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'));
    let Some(header) = lines.next() else {
        return Vec::new();
    };
    let cols: Vec<&str> = header.split(',').map(str::trim).collect();
    let idx = |name: &str| cols.iter().position(|c| *c == name);
    let (Some(ei), Some(eq), Some(li), Some(lq)) =
        (idx("early_i"), idx("early_q"), idx("late_i"), idx("late_q"))
    else {
        return Vec::new();
    };

    let monitor = SqmMonitor::new();
    let mut out = Vec::new();
    for line in lines {
        let f: Vec<&str> = line.split(',').map(str::trim).collect();
        let get = |i: usize| f.get(i).and_then(|s| s.parse::<f64>().ok());
        let (Some(e_i), Some(e_q), Some(l_i), Some(l_q)) = (get(ei), get(eq), get(li), get(lq))
        else {
            continue;
        };
        let e_mag = e_i.hypot(e_q);
        let l_mag = l_i.hypot(l_q);
        let imbalance = monitor.el_metric(e_mag, l_mag).abs();
        out.push(Observation::new("sqm", imbalance, Orient::Raw));
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn symmetric_correlator_scores_zero_distorted_scores_higher() {
        // Row 1 symmetric: |E| = |L| = 5  -> imbalance 0 (clean).
        // Row 2 distorted: |E| = 5, |L| = 3 -> (5-3)/(5+3) = 0.25.
        let csv = "\
epoch_s,prn,early_i,early_q,late_i,late_q
0.0,5,3.0,4.0,3.0,4.0
1.0,5,3.0,4.0,3.0,0.0
";
        let obs = observations(csv);
        assert_eq!(obs.len(), 2);
        assert!(obs.iter().all(|o| o.detector == "sqm"));
        assert!((obs[0].score - 0.0).abs() < 1e-12, "symmetric peak -> 0");
        assert!((obs[1].score - 0.25).abs() < 1e-12, "expected |ELP| = 0.25");
        assert!(obs[1].score > obs[0].score);
    }

    #[test]
    fn score_is_the_unsigned_imbalance_for_either_skew_direction() {
        // Late-stronger (|E|=3,|L|=5) must score the same magnitude as early-stronger.
        let csv = "\
epoch_s,prn,early_i,early_q,late_i,late_q
0.0,5,3.0,0.0,5.0,0.0
";
        let obs = observations(csv);
        assert!((obs[0].score - 0.25).abs() < 1e-12);
    }

    #[test]
    fn column_order_is_resolved_by_name() {
        // Same data, columns shuffled: result must be identical (0.25).
        let csv = "\
late_q,early_i,prn,late_i,early_q,epoch_s
0.0,3.0,5,5.0,0.0,0.0
";
        let obs = observations(csv);
        assert_eq!(obs.len(), 1);
        assert!((obs[0].score - 0.25).abs() < 1e-12);
    }

    #[test]
    fn missing_required_columns_yields_nothing() {
        let csv = "epoch_s,prn,early_i\n0.0,5,3.0\n";
        assert!(observations(csv).is_empty());
    }

    #[test]
    fn empty_input_yields_nothing() {
        assert!(observations("").is_empty());
        assert!(observations("# only a comment\n").is_empty());
    }
}
