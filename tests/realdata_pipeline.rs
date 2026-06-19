// SPDX-License-Identifier: AGPL-3.0-only
//! End-to-end wiring check: real-data adapters -> probe records -> optimism-gap pipeline.
//!
//! The adapter unit tests prove each format is parsed and oriented correctly; this
//! proves the *shape* they produce feeds the analysis. It drives the [`gnsslogger`] and
//! [`sqm`] adapters with format-accurate inputs across an in-distribution bin and a
//! shifted bin (each carrying both clean and impaired runs), then runs the same
//! [`build_real_gap_rows`] / [`real_loocv`] the synthetic study uses. These inputs are
//! synthetic; the test asserts the pipeline runs and returns finite numbers, not a
//! scientific result (a real optimism gap needs a downloaded labelled corpus).

use kshana::impairment_study::{build_real_gap_rows, real_loocv, CvAxis};
use kshana::realdata::{gnsslogger, sqm, to_records, FileLabel, Observation, Orient};

/// A GnssLogger CSV with `n` Raw rows at the given mean C/N0 and AGC, with a small
/// deterministic per-row spread so the AUC is not degenerate.
fn phone_csv(n: usize, cn0: f64, agc: f64) -> String {
    let mut s = String::from("# Raw,Svid,Cn0DbHz,AgcDb\n");
    for i in 0..n {
        let d = (i % 5) as f64 * 0.4 - 0.8;
        s.push_str(&format!("Raw,{},{:.2},{:.2}\n", i + 1, cn0 + d, agc + d));
    }
    s
}

/// A correlator CSV with `n` rows at the given Early/Late imbalance (0 = symmetric).
fn corr_csv(n: usize, imbalance: f64) -> String {
    // Pick |E|, |L| so (|E|-|L|)/(|E|+|L|) = imbalance, with |E|+|L| = 2.
    let e = 1.0 + imbalance;
    let l = 1.0 - imbalance;
    let mut s = String::from("epoch_s,prn,early_i,early_q,late_i,late_q\n");
    for i in 0..n {
        let d = (i % 5) as f64 * 0.01;
        s.push_str(&format!("{}.0,5,{:.4},0.0,{:.4},0.0\n", i, e + d, l));
    }
    s
}

/// Ingest one file's observations and stamp its experiment label.
fn ingest(
    obs: Vec<Observation>,
    class: &str,
    shift_bin: &str,
    is_nominal: bool,
) -> Vec<kshana::impairment_study::ProbeRecord> {
    to_records(
        &obs,
        &FileLabel {
            class,
            shift_bin,
            is_nominal,
        },
    )
}

#[test]
fn adapters_feed_the_optimism_gap_pipeline_end_to_end() {
    let n = 12;
    let mut records = Vec::new();

    // GnssLogger gives cn0 and agc; sqm gives the imbalance detector. Each bin carries a
    // clean (nominal) run and an impaired run, in the in-distribution bin "id" and a
    // shifted bin "strong" (stronger impairment).
    for (bin, jam_cn0, jam_agc, spoof_imb) in
        [("id", 38.0, 15.0, 0.10), ("strong", 28.0, 8.0, 0.30)]
    {
        // Clean negatives (same in both bins).
        records.extend(ingest(
            gnsslogger::observations(&phone_csv(n, 45.0, 21.0), Orient::Negate),
            "nominal",
            bin,
            true,
        ));
        records.extend(ingest(
            sqm::observations(&corr_csv(n, 0.0)),
            "nominal",
            bin,
            true,
        ));
        // Impaired positives.
        records.extend(ingest(
            gnsslogger::observations(&phone_csv(n, jam_cn0, jam_agc), Orient::Negate),
            "jamming",
            bin,
            false,
        ));
        records.extend(ingest(
            sqm::observations(&corr_csv(n, spoof_imb)),
            "spoofing",
            bin,
            false,
        ));
    }

    // Build gap samples: cn0/jamming, agc/jamming, sqm/spoofing -> 3 detectors, 2 classes.
    let samples = build_real_gap_rows(&records, "id", 0.05);
    let detectors: std::collections::BTreeSet<_> =
        samples.iter().map(|s| s.detector.as_str()).collect();
    assert!(
        detectors.contains("cn0") && detectors.contains("agc") && detectors.contains("sqm"),
        "expected cn0, agc and sqm gap samples, got {detectors:?}"
    );

    // The cross-detector and cross-class leave-one-out CV must run and return finite
    // figures (with so few synthetic samples the R^2 itself is not meaningful).
    for axis in [CvAxis::Detector, CvAxis::Class] {
        let cv = real_loocv(&samples, 0.1, axis);
        assert!(cv.n_folds >= 1, "CV produced no folds on axis {axis:?}");
        assert!(cv.r2.is_finite(), "CV R^2 not finite on axis {axis:?}");
        assert!(
            cv.rmse.is_finite() && cv.rmse >= 0.0,
            "CV RMSE invalid on axis {axis:?}"
        );
    }
}
