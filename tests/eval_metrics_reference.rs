// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate Kshana's detector-agnostic evaluation testbed
//! (`impairment_eval`'s metric engine) against an **independent third-party
//! authority**: scikit-learn 1.9.0 (Pedregosa et al., JMLR 2011) — the de-facto
//! reference for ROC/AUC/confusion-matrix metrics.
//!
//! The evaluation metrics are deterministic functions of (labels, scores), so
//! matching scikit-learn's numbers for identical data is a genuine external
//! cross-check of the metric maths — the same kind of validation DOP gets
//! against gnss_lib_py and the reference frames against IAU SOFA/ERFA.
//!
//! Scope (honest): this validates *what the testbed computes* — AUC,
//! P_d/P_md/P_fa, precision/accuracy/F1 and the confusion matrix at a threshold.
//! It does **not** validate the synthetic impairment corpus (parameter-grounded,
//! not field/IQ) or the bespoke methodology guards (disjoint-key split, leakage
//! guard, distribution-shift optimism report), which remain honestly MODELLED.
//!
//! Reference data, provenance and the committed generator are in
//! `tests/fixtures/mleval/` (`eval_reference.txt`, `NOTICE`,
//! `generate_eval_reference.py`). Scores/thresholds are stored at full f64
//! precision so the per-threshold confusion counts agree exactly (integer match)
//! and the derived ratios / AUC agree to < 1e-9.

use kshana::impairment_eval::{auc, confusion_at};

const REF: &str = include_str!("fixtures/mleval/eval_reference.txt");

/// Tight tolerance for the real-valued metrics. AUC (Mann-Whitney vs sklearn's
/// rank method) and the count-ratio metrics are the same arithmetic on identical
/// data, so they agree to ~1e-15; the bound below is comfortably above that.
const TOL: f64 = 1e-9;

/// One operating point: the threshold, the four confusion counts, and the
/// derived rates — all as scikit-learn computed them.
struct Thr {
    t: f64,
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

#[derive(Default)]
struct Dataset {
    name: String,
    labeled: Vec<(bool, f64)>,
    pos: Vec<f64>,
    neg: Vec<f64>,
    auc: f64,
    thresholds: Vec<Thr>,
}

fn parse() -> Vec<Dataset> {
    let mut sets = Vec::new();
    let mut cur: Option<Dataset> = None;
    let mut labels: Vec<bool> = Vec::new();
    for line in REF.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let (tag, rest) = line.split_once(' ').unwrap_or((line, ""));
        match tag {
            "DATASET" => {
                cur = Some(Dataset {
                    name: rest.to_string(),
                    ..Default::default()
                });
                labels = Vec::new();
            }
            "L" => {
                labels = rest.split(',').map(|s| s.trim() == "1").collect();
            }
            "S" => {
                let d = cur.as_mut().expect("S before DATASET");
                let scores: Vec<f64> = rest.split(',').map(|s| s.trim().parse().unwrap()).collect();
                assert_eq!(labels.len(), scores.len(), "{}: L/S length", d.name);
                for (&lab, &sc) in labels.iter().zip(&scores) {
                    d.labeled.push((lab, sc));
                    if lab {
                        d.pos.push(sc);
                    } else {
                        d.neg.push(sc);
                    }
                }
            }
            "AUC" => {
                cur.as_mut().unwrap().auc = rest.trim().parse().unwrap();
            }
            "THR" => {
                let f: Vec<&str> = rest.split_whitespace().collect();
                assert_eq!(f.len(), 11, "THR needs 11 fields: {line}");
                let p = |i: usize| f[i].parse::<f64>().unwrap();
                let u = |i: usize| f[i].parse::<usize>().unwrap();
                cur.as_mut().unwrap().thresholds.push(Thr {
                    t: p(0),
                    tp: u(1),
                    fp: u(2),
                    tn: u(3),
                    fn_: u(4),
                    pd: p(5),
                    pmd: p(6),
                    pfa: p(7),
                    precision: p(8),
                    accuracy: p(9),
                    f1: p(10),
                });
            }
            "END" => sets.push(cur.take().expect("END without DATASET")),
            other => panic!("unknown tag {other}"),
        }
    }
    sets
}

#[test]
fn eval_metrics_match_scikit_learn_reference() {
    let sets = parse();
    assert!(
        sets.len() >= 5,
        "expected >= 5 datasets, got {}",
        sets.len()
    );

    let mut thr_checked = 0usize;
    for d in &sets {
        // AUC vs scikit-learn roc_auc_score (Mann-Whitney, ties ½).
        let got_auc = auc(&d.pos, &d.neg);
        assert!(
            (got_auc - d.auc).abs() <= TOL,
            "{}: AUC {got_auc:.12} vs sklearn {:.12}",
            d.name,
            d.auc
        );

        for thr in &d.thresholds {
            let t = thr.t;
            let c = confusion_at(&d.labeled, t);
            // Confusion counts must match scikit-learn exactly (integer).
            assert_eq!(
                (c.tp, c.fp, c.tn, c.fn_),
                (thr.tp, thr.fp, thr.tn, thr.fn_),
                "{}: counts @ t={t}",
                d.name
            );
            // Derived metrics to a tight tolerance.
            for (name, got, want) in [
                ("pd", c.pd(), thr.pd),
                ("pmd", c.pmd(), thr.pmd),
                ("pfa", c.pfa(), thr.pfa),
                ("precision", c.precision(), thr.precision),
                ("accuracy", c.accuracy(), thr.accuracy),
                ("f1", c.f1(), thr.f1),
            ] {
                assert!(
                    (got - want).abs() <= TOL,
                    "{}: {name} {got:.12} vs sklearn {want:.12} @ t={t}",
                    d.name
                );
            }
            thr_checked += 1;
        }
    }
    assert!(
        thr_checked >= 20,
        "expected >= 20 threshold checks, got {thr_checked}"
    );

    // The fixture must exercise both tails of discrimination (a perfect detector
    // and a worse-than-chance one), so the oracle isn't all mid-range.
    assert!(
        sets.iter().any(|d| (d.auc - 1.0).abs() < TOL),
        "need an AUC=1 case"
    );
    assert!(
        sets.iter().any(|d| d.auc < 0.5),
        "need a sub-chance AUC case"
    );
}
