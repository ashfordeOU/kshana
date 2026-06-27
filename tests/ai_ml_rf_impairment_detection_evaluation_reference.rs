// SPDX-License-Identifier: AGPL-3.0-only
//! AI/ML RF-impairment-detection **evaluation** validated on **real ESA OPS-SAT
//! telemetry** against scikit-learn (ESA AO 13494; module `impairment_eval`).
//!
//! This EXTENDS the existing real-data island (`tests/opssat_ad_reference.rs`,
//! which pins only the threshold-free ROC AUC) to the **full operating-point
//! characterisation** Kshana's evaluation testbed produces:
//! `impairment_eval::{threshold_for_pfa, confusion_at}` and the derived
//! `Confusion::{pd,pmd,pfa,precision,accuracy,f1}`, plus a per-telemetry-channel
//! detection-rate breakdown, all on the **held-out OPS-SAT-AD test split**
//! (529 segments, 113 real anomalies, 9 channels) for two fully-specified
//! deterministic detectors at >= 4 distinct operating thresholds each.
//!
//! ## Oracle (independent third-party authority, on REAL spacecraft data)
//! scikit-learn 1.8.0 (Pedregosa et al., JMLR 2011; BSD-3-Clause) + numpy 2.4.1
//! on the **OPSSAT-AD** dataset (Ruszczak et al., *Scientific Data* 2025, DOI
//! 10.1038/s41597-025-05035-3; data DOI 10.5281/zenodo.12588359, CC BY 4.0) —
//! real ESA OPS-SAT housekeeping telemetry with ground-truth anomaly labels.
//! The reference vectors are produced offline by
//! `tests/fixtures/opssat/generate_opssat_opcurve_reference.py` (imports ONLY
//! sklearn/numpy, never Kshana) and committed as
//! `tests/fixtures/opssat/opssat_opcurve_reference.txt`, so the island is
//! hermetic (CI needs no Python).
//!
//! ## Why this is a genuine external check (oracle independence)
//! * The operating **threshold** for each target Pfa is derived in the generator
//!   from the *documented* `threshold_for_pfa` semantics via a plain numpy walk
//!   over the unique negative scores — NOT by calling Kshana. The test asserts
//!   Kshana's own `threshold_for_pfa` returns the **bit-identical** threshold.
//! * The confusion counts come from sklearn `confusion_matrix`; Kshana's
//!   `confusion_at` must match them **integer-exact**.
//! * The rates come from sklearn `recall/precision/accuracy/f1_score`; Kshana's
//!   `Confusion` accessors must match to **< 1e-9**.
//! * The AUC comes from sklearn `roc_auc_score`; Kshana's Mann–Whitney `auc`
//!   must match to **< 1e-9**.
//!
//! ## Honest scope
//! Validates the metric/operating-point engine on **real labelled ESA data**.
//! It does NOT validate the synthetic parameter-grounded impairment corpus
//! (which stays MODELLED), nor does it reproduce the OPSSAT-AD paper's best
//! published model (a supervised FCNN at F1 ≈ 0.95) — that needs their trained
//! weights. We reproduce the labelled separation with our own transparent
//! detectors and pin the full operating-point arithmetic against sklearn.

use kshana::impairment_eval::{auc, confusion_at, threshold_for_pfa};

const REF: &str = include_str!("fixtures/opssat/opssat_opcurve_reference.txt");

/// Tolerance for real-valued metrics. AUC (Mann-Whitney vs sklearn rank method)
/// and the count-ratio metrics are the same arithmetic on identical data, so they
/// agree to ~1e-15; this bound is comfortably above that. Confusion counts and the
/// chosen thresholds are required to match EXACTLY (integer / bit-identical f64).
const TOL: f64 = 1e-9;

/// One operating point as the sklearn oracle computed it: the target Pfa, the
/// chosen threshold, the four integer confusion counts, and the derived rates.
struct Op {
    target_pfa: f64,
    threshold: f64,
    tp: usize,
    fp: usize,
    tn: usize,
    fn_: usize,
    pd: f64,
    pmd: f64,
    pfa: f64,
    precision: f64,
    accuracy: f64,
    f1: f64,
}

/// One per-channel detection-rate breakdown row at one operating point.
struct Pc {
    target_pfa: f64,
    channel: String,
    n_pos: usize,
    n_detected: usize,
    pd: f64,
}

#[derive(Default)]
struct Detector {
    name: String,
    labels: Vec<bool>,
    chan: Vec<String>,
    scores: Vec<f64>,
    auc: f64,
    ops: Vec<Op>,
    pcs: Vec<Pc>,
}

struct Reference {
    n_test: usize,
    n_anom: usize,
    n_channels: usize,
    detectors: Vec<Detector>,
}

fn parse() -> Reference {
    let mut n_test = 0;
    let mut n_anom = 0;
    let mut n_channels = 0;
    let mut detectors: Vec<Detector> = Vec::new();
    let mut cur: Option<Detector> = None;

    for line in REF.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let (tag, rest) = line.split_once(' ').unwrap_or((line, ""));
        match tag {
            "META" => {
                let f: Vec<&str> = rest.split_whitespace().collect();
                assert_eq!(f.len(), 3, "META needs 3 fields: {line}");
                n_test = f[0].parse().unwrap();
                n_anom = f[1].parse().unwrap();
                n_channels = f[2].parse().unwrap();
            }
            "CHANNELS" => { /* informational; per-channel totals re-derived below */ }
            "DETECTOR" => {
                if let Some(d) = cur.take() {
                    detectors.push(d);
                }
                cur = Some(Detector {
                    name: rest.to_string(),
                    ..Default::default()
                });
            }
            "LABELS" => {
                cur.as_mut().unwrap().labels = rest.split(',').map(|s| s.trim() == "1").collect();
            }
            "CHAN" => {
                cur.as_mut().unwrap().chan =
                    rest.split(',').map(|s| s.trim().to_string()).collect();
            }
            "SCORES" => {
                cur.as_mut().unwrap().scores = rest
                    .split(',')
                    .map(|s| s.trim().parse::<f64>().unwrap())
                    .collect();
            }
            "AUC" => {
                cur.as_mut().unwrap().auc = rest.trim().parse().unwrap();
            }
            "OP" => {
                let f: Vec<&str> = rest.split_whitespace().collect();
                assert_eq!(f.len(), 12, "OP needs 12 fields: {line}");
                let p = |i: usize| f[i].parse::<f64>().unwrap();
                let u = |i: usize| f[i].parse::<usize>().unwrap();
                cur.as_mut().unwrap().ops.push(Op {
                    target_pfa: p(0),
                    threshold: p(1),
                    tp: u(2),
                    fp: u(3),
                    tn: u(4),
                    fn_: u(5),
                    pd: p(6),
                    pmd: p(7),
                    pfa: p(8),
                    precision: p(9),
                    accuracy: p(10),
                    f1: p(11),
                });
            }
            "PC" => {
                let f: Vec<&str> = rest.split_whitespace().collect();
                assert_eq!(f.len(), 5, "PC needs 5 fields: {line}");
                cur.as_mut().unwrap().pcs.push(Pc {
                    target_pfa: f[0].parse().unwrap(),
                    channel: f[1].to_string(),
                    n_pos: f[2].parse().unwrap(),
                    n_detected: f[3].parse().unwrap(),
                    pd: f[4].parse().unwrap(),
                });
            }
            "ENDDET" => {
                detectors.push(cur.take().expect("ENDDET without DETECTOR"));
            }
            other => panic!("unknown tag {other}"),
        }
    }
    if let Some(d) = cur.take() {
        detectors.push(d);
    }
    Reference {
        n_test,
        n_anom,
        n_channels,
        detectors,
    }
}

#[test]
fn opssat_operating_points_match_scikit_learn_on_real_esa_telemetry() {
    let r = parse();

    // Pin the real-data shape (the gate scopes the 529-row / 113-anomaly split).
    assert_eq!(r.n_test, 529, "OPSSAT-AD test split size changed");
    assert_eq!(r.n_anom, 113, "OPSSAT-AD test anomaly count changed");
    assert_eq!(r.n_channels, 9, "OPSSAT-AD test channel count changed");
    assert_eq!(r.detectors.len(), 2, "expected exactly 2 detectors");

    let mut op_checks = 0usize;
    let mut pc_checks = 0usize;

    for d in &r.detectors {
        // Every detector scores the whole real test split.
        assert_eq!(d.labels.len(), 529, "{}: labels", d.name);
        assert_eq!(d.scores.len(), 529, "{}: scores", d.name);
        assert_eq!(d.chan.len(), 529, "{}: channels", d.name);
        assert_eq!(
            d.labels.iter().filter(|&&l| l).count(),
            113,
            "{}: anomaly count",
            d.name
        );

        let labeled: Vec<(bool, f64)> = d
            .labels
            .iter()
            .zip(&d.scores)
            .map(|(&l, &s)| (l, s))
            .collect();
        let pos: Vec<f64> = labeled
            .iter()
            .filter(|(l, _)| *l)
            .map(|(_, s)| *s)
            .collect();
        let neg: Vec<f64> = labeled
            .iter()
            .filter(|(l, _)| !*l)
            .map(|(_, s)| *s)
            .collect();

        // (1) Threshold-free AUC vs sklearn roc_auc_score.
        let got_auc = auc(&pos, &neg);
        assert!(
            (got_auc - d.auc).abs() <= TOL,
            "{}: AUC {got_auc:.15} vs sklearn {:.15}",
            d.name,
            d.auc
        );

        // Track distinct thresholds so each detector clears the >= 4 requirement.
        let mut distinct_thr: Vec<f64> = Vec::new();

        for op in &d.ops {
            // (2) Kshana's threshold_for_pfa must return the IDENTICAL threshold
            // the independent generator derived from the documented definition.
            // For these (finite, achievable) targets the chosen threshold is an
            // exact score value, so we require a bit-identical f64 match.
            let thr = threshold_for_pfa(&neg, op.target_pfa);
            assert_eq!(
                thr.to_bits(),
                op.threshold.to_bits(),
                "{}: threshold_for_pfa({}) = {thr:?} vs oracle {:?}",
                d.name,
                op.target_pfa,
                op.threshold
            );
            if !distinct_thr.iter().any(|&t| t.to_bits() == thr.to_bits()) {
                distinct_thr.push(thr);
            }

            // (3) Confusion counts at that threshold, integer-exact vs sklearn.
            let c = confusion_at(&labeled, thr);
            assert_eq!(
                (c.tp, c.fp, c.tn, c.fn_),
                (op.tp, op.fp, op.tn, op.fn_),
                "{}: confusion @ target_pfa={} thr={thr:?}",
                d.name,
                op.target_pfa
            );
            assert_eq!(c.n(), 529, "{}: confusion total", d.name);

            // (4) Derived rates vs sklearn recall/precision/accuracy/f1 (< 1e-9).
            for (label, got, want) in [
                ("pd", c.pd(), op.pd),
                ("pmd", c.pmd(), op.pmd),
                ("pfa", c.pfa(), op.pfa),
                ("precision", c.precision(), op.precision),
                ("accuracy", c.accuracy(), op.accuracy),
                ("f1", c.f1(), op.f1),
            ] {
                assert!(
                    (got - want).abs() <= TOL,
                    "{}: {label} {got:.15} vs sklearn {want:.15} @ target_pfa={}",
                    d.name,
                    op.target_pfa
                );
            }

            // The achieved Pfa must respect the requested cap (conservative
            // operating point) — a real-detection sanity check, not a tautology.
            assert!(
                c.pfa() <= op.target_pfa + 1e-12,
                "{}: achieved Pfa {} exceeds target {}",
                d.name,
                c.pfa(),
                op.target_pfa
            );

            op_checks += 1;
        }

        // >= 4 distinct operating thresholds per detector (n_peaks is integer-
        // valued so some targets coincide — still > 4 distinct here).
        assert!(
            distinct_thr.len() >= 4,
            "{}: only {} distinct thresholds (need >= 4)",
            d.name,
            distinct_thr.len()
        );

        // (5) Per-channel detection-rate breakdown. Recompute the detection of each
        // channel's anomaly-positive segments using Kshana's exact decision rule
        // (`score >= threshold`, the rule confusion_at / evaluate apply) and match
        // sklearn's per-channel recall integer-exact and its ratio to < 1e-9.
        for pc in &d.pcs {
            let thr = threshold_for_pfa(&neg, pc.target_pfa);
            let mut n_pos = 0usize;
            let mut n_detected = 0usize;
            for i in 0..d.scores.len() {
                if d.chan[i] == pc.channel && d.labels[i] {
                    n_pos += 1;
                    if d.scores[i] >= thr {
                        n_detected += 1;
                    }
                }
            }
            assert_eq!(
                (n_pos, n_detected),
                (pc.n_pos, pc.n_detected),
                "{}: per-channel {} counts @ target_pfa={}",
                d.name,
                pc.channel,
                pc.target_pfa
            );
            let got_pd = if n_pos == 0 {
                0.0
            } else {
                n_detected as f64 / n_pos as f64
            };
            assert!(
                (got_pd - pc.pd).abs() <= TOL,
                "{}: per-channel {} Pd {got_pd:.15} vs sklearn {:.15} @ target_pfa={}",
                d.name,
                pc.channel,
                pc.pd,
                pc.target_pfa
            );
            pc_checks += 1;
        }
    }

    // Coverage floors: >= 4 operating points per detector and a full 9-channel
    // breakdown at each one, so the gate genuinely exercises the engine.
    assert!(
        op_checks >= 8,
        "expected >= 8 operating-point checks (2 detectors x >= 4), got {op_checks}"
    );
    assert!(
        pc_checks >= 72,
        "expected >= 72 per-channel checks (2 x >= 4 x 9), got {pc_checks}"
    );

    eprintln!(
        "[opssat-opcurve] real ESA OPS-SAT test split (n=529, anomalies=113, 9 channels): \
         {} detectors, {op_checks} operating-point confusion/rate checks + {pc_checks} \
         per-channel detection-rate checks, all matching scikit-learn 1.8.0 \
         (confusion integer-exact, thresholds bit-exact, rates/AUC < 1e-9)",
        r.detectors.len()
    );
}
