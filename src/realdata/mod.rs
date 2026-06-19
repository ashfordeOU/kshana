// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data ingest adapters for the optimism-gap probe.
//!
//! These adapters bridge public GNSS-impairment datasets into the *same* validated
//! engines that generate the synthetic corpus, then emit
//! [`ProbeRecord`](crate::impairment_study::ProbeRecord)s the H4 pipeline consumes
//! ([`crate::impairment_study::build_real_gap_rows`]). Nothing here re-implements
//! physics: C/N0 comes from [`crate::rinex_obs`], SQM from
//! [`crate::spoof_monitors::SqmMonitor`], RAIM from [`crate::rinex::parse_nav`] +
//! [`crate::pvt`] + [`crate::spoof_monitors::parity_raim_test`]. The adapters only
//! parse file formats and orient each observable.
//!
//! ## The ragged schema (Phase A + Phase B)
//!
//! No single public dataset exposes all five observables, so each adapter emits only
//! what its source carries and [`build_real_gap_rows`](crate::impairment_study::build_real_gap_rows)
//! scores every available observable as its own "detector":
//!
//! | observable | adapter | typical source |
//! |------------|---------|----------------|
//! | `cn0`      | [`rinex`], [`ubx`], [`gnsslogger`] | RINEX `S` codes, UBX-NAV-SAT, Android `Cn0DbHz` |
//! | `agc`      | [`ubx`], [`gnsslogger`] | UBX-MON-RF `agcCnt`, Android `AgcDb` |
//! | `jamind`   | [`ubx`] | UBX-MON-RF `jamInd` |
//! | `sqm`      | [`sqm`] | SDR correlator dumps (TEXBAT/OAKBAT via GNSS-SDR/FGI-GSRx) |
//! | `raim`     | [`raim`] | RINEX obs + nav (pseudorange parity) |
//!
//! ## Orientation
//!
//! [`ProbeRecord::score`](crate::impairment_study::ProbeRecord) must read *higher ⇒
//! more impaired*. Orientation is a fixed physical input, never fitted to labels (that
//! would be circular): C/N0 is [`Orient::Negate`] (jamming lowers it), a RAIM/SQM
//! deviation statistic is [`Orient::Raw`] (it already rises with impairment), and AGC
//! polarity is receiver-dependent so its adapters take it as a parameter.

pub mod gnsslogger;
pub mod raim;
pub mod rinex;
pub mod sqm;
pub mod ubx;

use crate::impairment_study::ProbeRecord;

/// How a raw observable maps to an impairment score (which must rise with impairment).
///
/// This is a *physical* choice, set from the observable's nature, never inferred from
/// the labels — orienting by the labels would leak the answer into the score.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Orient {
    /// The raw value already rises with impairment (AGC power-excess dB, a RAIM χ²
    /// statistic, an `|SQM|` imbalance). Used as-is.
    Raw,
    /// The raw value *falls* with impairment (C/N0 in dB-Hz; an AGC *gain* count that
    /// a receiver turns down under jamming). Negated so the score rises.
    Negate,
}

impl Orient {
    /// Apply the orientation to a raw observable.
    pub fn apply(self, raw: f64) -> f64 {
        match self {
            Orient::Raw => raw,
            Orient::Negate => -raw,
        }
    }
}

/// One physics-oriented observable extracted from a real receiver/log file.
///
/// `raw` is preserved in native units for transparent provenance; `score` is what the
/// AUC pipeline consumes, oriented so higher ⇒ more impaired.
#[derive(Clone, Debug, PartialEq)]
pub struct Observation {
    /// Detector / observable name, e.g. `"cn0"`, `"agc"`, `"sqm"`, `"raim"`.
    pub detector: String,
    /// Raw observable in its native units (dB-Hz, AGC counts, χ², …).
    pub raw: f64,
    /// Impairment score: `orient.apply(raw)`, oriented so higher ⇒ more impaired.
    pub score: f64,
}

impl Observation {
    /// Build an observation, applying `orient` to `raw` to form the score.
    pub fn new(detector: impl Into<String>, raw: f64, orient: Orient) -> Self {
        Self {
            detector: detector.into(),
            raw,
            score: orient.apply(raw),
        }
    }
}

/// The experiment label stamped onto every observation parsed from one file. In these
/// datasets a single file is one condition: a clean run (`is_nominal`) or one attack
/// `class` at one severity `shift_bin` (one designated bin is the in-distribution
/// reference passed to [`build_real_gap_rows`](crate::impairment_study::build_real_gap_rows)).
#[derive(Clone, Copy, Debug)]
pub struct FileLabel<'a> {
    /// Impairment class (e.g. `"jamming"`); ignored by the pipeline when `is_nominal`.
    pub class: &'a str,
    /// Severity / condition group (e.g. `"jsr20"`); one bin is the ID reference.
    pub shift_bin: &'a str,
    /// Whether this file is a clean (nominal) run — the AUC negatives.
    pub is_nominal: bool,
}

/// Stamp a file's [`FileLabel`] onto its extracted observations to form probe records.
pub fn to_records(obs: &[Observation], label: &FileLabel) -> Vec<ProbeRecord> {
    obs.iter()
        .map(|o| {
            ProbeRecord::new(
                o.detector.clone(),
                label.class,
                label.shift_bin,
                o.score,
                label.is_nominal,
            )
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn negate_orientation_flips_sign_so_lower_cn0_scores_higher() {
        // A 30 dB-Hz (jammed) observation must out-score a 45 dB-Hz (clean) one.
        let jammed = Observation::new("cn0", 30.0, Orient::Negate);
        let clean = Observation::new("cn0", 45.0, Orient::Negate);
        assert_eq!(jammed.raw, 30.0);
        assert_eq!(jammed.score, -30.0);
        assert!(jammed.score > clean.score, "lower C/N0 must score higher");
    }

    #[test]
    fn raw_orientation_passes_value_through() {
        let o = Observation::new("raim", 12.5, Orient::Raw);
        assert_eq!(o.raw, 12.5);
        assert_eq!(o.score, 12.5);
    }

    #[test]
    fn to_records_stamps_the_file_label_on_every_observation() {
        let obs = vec![
            Observation::new("cn0", 40.0, Orient::Negate),
            Observation::new("cn0", 35.0, Orient::Negate),
        ];
        let label = FileLabel {
            class: "jamming",
            shift_bin: "jsr20",
            is_nominal: false,
        };
        let recs = to_records(&obs, &label);
        assert_eq!(recs.len(), 2);
        for (r, o) in recs.iter().zip(&obs) {
            assert_eq!(r.detector, "cn0");
            assert_eq!(r.class, "jamming");
            assert_eq!(r.shift_bin, "jsr20");
            assert!(!r.is_nominal);
            assert_eq!(r.score, o.score);
        }
    }

    #[test]
    fn nominal_label_marks_records_as_negatives_and_ignores_class() {
        let obs = vec![Observation::new("cn0", 46.0, Orient::Negate)];
        let label = FileLabel {
            class: "nominal",
            shift_bin: "id",
            is_nominal: true,
        };
        let recs = to_records(&obs, &label);
        assert!(recs[0].is_nominal);
    }
}
