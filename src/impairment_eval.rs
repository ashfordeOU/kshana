// SPDX-License-Identifier: Apache-2.0
//! AI-algorithm **evaluation testbed** for RF-impairment detection — the
//! "Characterisation and Evaluation of Machine-Learning Techniques" layer.
//!
//! This is the *referee*, not a classifier. It (1) generates a **labelled,
//! parameter-grounded corpus** of RF-impairment cases by composing Kshana's
//! existing jamming ([`crate::jamming`]), signal-quality / AGC
//! ([`crate::spoof_monitors`]) and detection ([`crate::detection`]) models, and
//! (2) scores *any* candidate detector/classifier behind the
//! [`ImpairmentDetector`] trait with the standard operating-characteristic
//! metrics a reviewer expects: ROC, AUC, confusion matrix, and Pfa/Pmd at a
//! chosen operating point, with a per-impairment-class detection breakdown.
//!
//! ## Honest scope (load-bearing)
//! * The corpus is **synthetic and parameter-grounded** — generative-model
//!   labels over measurement-domain observables (TEXBAT-style *parameters*,
//!   never raw IQ or field captures). An AUC here is an AUC **over
//!   model-derived labels**, and is reported as exactly that.
//! * The bundled detectors are **transparent published-method baselines**
//!   (energy / AGC-excess / SQM-imbalance / RAIM-parity threshold tests, after
//!   Kaplan & Hegarty and the GNSS-integrity literature) — **not**
//!   state-of-the-art classifiers. The harness reports measured operating
//!   characteristics; it never asserts a detector is "good" in absolute terms.
//! * The corpus is, by construction, a **separability / pipeline sanity harness,
//!   not a difficulty benchmark**: each impaired class drives a largely distinct
//!   observable away from nominal at low noise, so a high AUC here demonstrates
//!   that the metric pipeline works and that a detector reads the right observable
//!   — it is **not** an indication of field-detection performance. (The
//!   matched-power `SpoofTime` class is deliberately the hard, near-nominal case.)
//! * A leakage guard ([`Split::has_leakage`]) catches **exact case duplication**
//!   across the train/test partitions; [`stratified_split`] keeps the partition
//!   keys disjoint by construction. (It does *not* yet detect near-duplicate
//!   *parameters* across partitions — a stronger guard is a roadmap item.)
//!
//! Nothing here is "validated" — it is a *modelled* evaluation harness; see
//! [`crate::verification`] for the honesty invariant (a row may be labelled
//! validated only with an external oracle).

use crate::jamming::{effective_cn0_dbhz, q_factor};
use crate::spoof_monitors::{early_late_ideal, AgcMonitor, SqmMonitor};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

/// The C/A chip rate (chips/s) used as the despreading rate for the jamming model.
const CA_CHIP_RATE_HZ: f64 = 1.023e6;

/// The impairment classes the corpus spans. `Nominal` is the only non-impaired
/// class; everything else is a positive (impaired) case for binary detection.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ImpairmentClass {
    /// Clean signal — thermal noise only.
    Nominal,
    /// Broadband interference (raises AGC, drops effective C/N₀, RAIM-invisible).
    Jamming,
    /// Time-only spoof / meaconing (correlation distortion, common-mode bias).
    SpoofTime,
    /// Position-push spoof (drives a RAIM-detectable measurement inconsistency).
    SpoofPosition,
    /// Multipath (Early/Late correlation imbalance, no added power).
    Multipath,
}

impl ImpairmentClass {
    /// All classes, nominal first.
    pub fn all() -> [ImpairmentClass; 5] {
        use ImpairmentClass::*;
        [Nominal, Jamming, SpoofTime, SpoofPosition, Multipath]
    }
    /// The impaired (positive) classes only.
    pub fn impaired() -> [ImpairmentClass; 4] {
        use ImpairmentClass::*;
        [Jamming, SpoofTime, SpoofPosition, Multipath]
    }
    /// Whether this class is an impairment (the binary-detection positive label).
    pub fn is_impaired(self) -> bool {
        self != ImpairmentClass::Nominal
    }
    /// A short human label.
    pub fn label(self) -> &'static str {
        use ImpairmentClass::*;
        match self {
            Nominal => "nominal",
            Jamming => "jamming",
            SpoofTime => "spoof-time",
            SpoofPosition => "spoof-position",
            Multipath => "multipath",
        }
    }
}

/// The measurement-domain observables a detector consumes for one case.
/// Each field is a quantity a real receiver/monitor exposes — composed here from
/// Kshana's existing models, never from raw IQ.
#[derive(Clone, Copy, Debug)]
pub struct CaseObservables {
    /// Jammer-to-signal ratio presented to the receiver (dB); very low when absent.
    pub js_db: f64,
    /// Drop in effective C/N₀ versus the nominal link (dB), from the anti-jam eq.
    pub cn0_drop_db: f64,
    /// AGC power excess over the expected floor (dB) — the added-transmitter signature.
    pub agc_excess_db: f64,
    /// Early-minus-Late correlator imbalance `(E−L)/(E+L)` — the distortion signature.
    pub sqm_el_metric: f64,
    /// RAIM parity-space test statistic (χ²-like) — the measurement-inconsistency signature.
    pub parity_stat: f64,
}

/// The generating parameters of a case, kept so a split can be checked for leakage.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CaseParams {
    /// The driving severity of the impairment (units depend on class; 0 for nominal).
    pub severity: f64,
    /// A unique key `(class, index)`-derived id — the leakage-guard primitive.
    pub key: u64,
}

/// One labelled case: a class, its generating parameters, and its observables.
#[derive(Clone, Copy, Debug)]
pub struct LabeledCase {
    /// Ground-truth class (the generative-model label).
    pub class: ImpairmentClass,
    /// Generating parameters (severity + leakage key).
    pub params: CaseParams,
    /// The observables a detector sees.
    pub obs: CaseObservables,
}

impl LabeledCase {
    /// The binary-detection ground truth (positive = impaired).
    pub fn is_impaired(&self) -> bool {
        self.class.is_impaired()
    }
}

/// Corpus generation configuration.
#[derive(Clone, Copy, Debug)]
pub struct CorpusConfig {
    /// Cases generated per class (so the corpus is class-balanced).
    pub n_per_class: usize,
    /// Nominal (un-impaired) C/N₀ (dB-Hz).
    pub nominal_cn0_dbhz: f64,
    /// 1σ measurement noise applied to AGC/parity observables (dB / unitless).
    pub meas_noise: f64,
}

impl Default for CorpusConfig {
    fn default() -> Self {
        Self {
            n_per_class: 200,
            nominal_cn0_dbhz: 45.0,
            meas_noise: 0.6,
        }
    }
}

/// Generate a deterministic, class-balanced, labelled corpus.
///
/// Reproducible: the same `(cfg, seed)` yields byte-identical observables. The
/// observables are composed from the real jamming / AGC / SQM models plus seeded
/// Gaussian measurement noise; the severity of each impaired case is drawn from a
/// class-specific range so detectors face a spread of conditions.
pub fn generate_corpus(cfg: &CorpusConfig, seed: u64) -> Vec<LabeledCase> {
    let n = cfg.n_per_class.max(1);
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let q = q_factor("broadband", None);
    let mut out = Vec::with_capacity(n * 5);
    for (ci, class) in ImpairmentClass::all().into_iter().enumerate() {
        for i in 0..n {
            // Deterministic per-case noise draws.
            let z =
                |rng: &mut ChaCha8Rng, s: f64| Normal::new(0.0, s.max(1e-9)).unwrap().sample(rng);
            let u = |rng: &mut ChaCha8Rng| rand::Rng::gen_range(rng, 0.0..1.0);
            let frac = (i as f64 + 0.5) / n as f64; // spread severity deterministically
            let nm = cfg.meas_noise;

            let (severity, obs) = match class {
                ImpairmentClass::Nominal => {
                    // The −10 dB is a nominal NOISE-FLOOR proxy (no jammer present),
                    // not a real interferer — it gives a small near-zero C/N₀ "drop".
                    let cn0_drop = (cfg.nominal_cn0_dbhz
                        - effective_cn0_dbhz(cfg.nominal_cn0_dbhz, -10.0, q, CA_CHIP_RATE_HZ))
                    .max(0.0)
                        + z(&mut rng, nm * 0.3).abs();
                    let agc = z(&mut rng, nm);
                    let (e, l) = early_late_ideal(0.5);
                    let sqm = SqmMonitor::new().el_metric(e, l) + z(&mut rng, nm * 0.03);
                    let parity = z(&mut rng, 1.0).abs(); // |N(0,1)| ~ χ-like noise floor
                    (
                        0.0,
                        CaseObservables {
                            js_db: -10.0 + z(&mut rng, nm),
                            cn0_drop_db: cn0_drop,
                            agc_excess_db: agc,
                            sqm_el_metric: sqm,
                            parity_stat: parity,
                        },
                    )
                }
                ImpairmentClass::Jamming => {
                    let js = 4.0 + frac * 24.0 + z(&mut rng, 0.5); // 4..28 dB J/S
                    let cn0_drop = cfg.nominal_cn0_dbhz
                        - effective_cn0_dbhz(cfg.nominal_cn0_dbhz, js, q, CA_CHIP_RATE_HZ);
                    let agc = AgcMonitor::new(0.0).excess_db(0.45 * js) + z(&mut rng, nm);
                    let (e, l) = early_late_ideal(0.5);
                    let sqm = SqmMonitor::new().el_metric(e, l) + z(&mut rng, nm * 0.03);
                    let parity = z(&mut rng, 1.0).abs(); // common-mode → RAIM-invisible
                    (
                        js,
                        CaseObservables {
                            js_db: js,
                            cn0_drop_db: cn0_drop + z(&mut rng, nm * 0.3),
                            agc_excess_db: agc,
                            sqm_el_metric: sqm,
                            parity_stat: parity,
                        },
                    )
                }
                ImpairmentClass::SpoofTime => {
                    let pa = frac * 9.0 + z(&mut rng, 0.4); // 0..9 dB power advantage (can be matched)
                    let agc = AgcMonitor::new(0.0).excess_db(pa) + z(&mut rng, nm);
                    let sqm = 0.14 + z(&mut rng, nm * 0.05); // correlation interaction
                    let parity = (0.6 + z(&mut rng, 1.0)).abs(); // common-mode, weak RAIM signal
                    (
                        pa,
                        CaseObservables {
                            js_db: -10.0 + z(&mut rng, nm),
                            cn0_drop_db: z(&mut rng, nm * 0.3).abs(),
                            agc_excess_db: agc,
                            sqm_el_metric: sqm,
                            parity_stat: parity,
                        },
                    )
                }
                ImpairmentClass::SpoofPosition => {
                    let pa = frac * 7.0 + z(&mut rng, 0.4); // 0..7 dB
                    let push = 3.0 + frac * 9.0; // position-push → RAIM residual
                    let agc = AgcMonitor::new(0.0).excess_db(pa) + z(&mut rng, nm);
                    let sqm = 0.09 + z(&mut rng, nm * 0.05);
                    let parity = (push + z(&mut rng, 1.0)).abs();
                    (
                        push,
                        CaseObservables {
                            js_db: -10.0 + z(&mut rng, nm),
                            cn0_drop_db: z(&mut rng, nm * 0.3).abs(),
                            agc_excess_db: agc,
                            sqm_el_metric: sqm,
                            parity_stat: parity,
                        },
                    )
                }
                ImpairmentClass::Multipath => {
                    let imb = 0.10 + frac * 0.30; // 0.10..0.40 E/L imbalance
                    let _ = u(&mut rng); // consume one draw to keep per-class RNG stream length uniform
                    let sqm = imb + z(&mut rng, nm * 0.04);
                    let parity = (0.8 + z(&mut rng, 1.0)).abs();
                    (
                        imb,
                        CaseObservables {
                            js_db: -10.0 + z(&mut rng, nm),
                            cn0_drop_db: z(&mut rng, nm * 0.3).abs(),
                            agc_excess_db: z(&mut rng, nm),
                            sqm_el_metric: sqm,
                            parity_stat: parity,
                        },
                    )
                }
            };
            let key = (ci as u64) << 32 | i as u64;
            out.push(LabeledCase {
                class,
                params: CaseParams { severity, key },
                obs,
            });
        }
    }
    out
}

/// A candidate detector/classifier: maps an observable to a scalar decision
/// statistic (higher ⇒ more likely impaired). Implement this for any classical
/// or ML detector (the latter via the Python binding) to score it here.
pub trait ImpairmentDetector {
    /// A short name for the report.
    fn name(&self) -> &str;
    /// The decision statistic for a case (monotone in "impaired-ness").
    fn score(&self, obs: &CaseObservables) -> f64;
}

/// Energy / C/N₀-drop baseline (catches broadband jamming).
pub struct EnergyDetector;
impl ImpairmentDetector for EnergyDetector {
    fn name(&self) -> &str {
        "energy(cn0-drop)"
    }
    fn score(&self, o: &CaseObservables) -> f64 {
        o.cn0_drop_db
    }
}

/// AGC-excess baseline (catches overpowered jamming / spoofing).
pub struct AgcDetector;
impl ImpairmentDetector for AgcDetector {
    fn name(&self) -> &str {
        "agc-excess"
    }
    fn score(&self, o: &CaseObservables) -> f64 {
        o.agc_excess_db
    }
}

/// Signal-quality (Early/Late) baseline (catches multipath / matched-power spoof).
pub struct SqmDetector;
impl ImpairmentDetector for SqmDetector {
    fn name(&self) -> &str {
        "sqm-imbalance"
    }
    fn score(&self, o: &CaseObservables) -> f64 {
        o.sqm_el_metric.abs()
    }
}

/// RAIM parity baseline (catches position-push spoofing).
pub struct ParityDetector;
impl ImpairmentDetector for ParityDetector {
    fn name(&self) -> &str {
        "raim-parity"
    }
    fn score(&self, o: &CaseObservables) -> f64 {
        o.parity_stat
    }
}

/// A transparent fused baseline: the max of the four published-method statistics,
/// each scaled to a comparable range. Not SOTA — a documented combiner that
/// catches the union of failure modes its layers each see.
pub struct FusedDetector;
impl ImpairmentDetector for FusedDetector {
    fn name(&self) -> &str {
        "fused(max-z)"
    }
    fn score(&self, o: &CaseObservables) -> f64 {
        let a = o.cn0_drop_db / 6.0;
        let b = o.agc_excess_db / 3.0;
        let c = o.sqm_el_metric.abs() / 0.1;
        let d = o.parity_stat / 3.0;
        a.max(b).max(c).max(d)
    }
}

/// One ROC operating point.
#[derive(Clone, Copy, Debug)]
pub struct RocPoint {
    /// Decision threshold.
    pub threshold: f64,
    /// False-alarm probability (FP / negatives) — the x-axis.
    pub pfa: f64,
    /// Detection probability (TP / positives) — the y-axis.
    pub pd: f64,
}

/// A 2×2 confusion matrix at one operating threshold.
#[derive(Clone, Copy, Debug, Default)]
pub struct Confusion {
    /// True positives (impaired, flagged).
    pub tp: usize,
    /// False positives (nominal, flagged).
    pub fp: usize,
    /// True negatives (nominal, not flagged).
    pub tn: usize,
    /// False negatives (impaired, missed).
    pub fn_: usize,
}

impl Confusion {
    /// Total cases.
    pub fn n(&self) -> usize {
        self.tp + self.fp + self.tn + self.fn_
    }
    /// Detection probability P_d = TP/(TP+FN).
    pub fn pd(&self) -> f64 {
        ratio(self.tp, self.tp + self.fn_)
    }
    /// Missed-detection probability P_md = 1 − P_d.
    pub fn pmd(&self) -> f64 {
        1.0 - self.pd()
    }
    /// False-alarm probability P_fa = FP/(FP+TN).
    pub fn pfa(&self) -> f64 {
        ratio(self.fp, self.fp + self.tn)
    }
    /// Precision = TP/(TP+FP).
    pub fn precision(&self) -> f64 {
        ratio(self.tp, self.tp + self.fp)
    }
    /// Accuracy = (TP+TN)/N.
    pub fn accuracy(&self) -> f64 {
        ratio(self.tp + self.tn, self.n())
    }
    /// F1 = 2·precision·recall/(precision+recall).
    pub fn f1(&self) -> f64 {
        let (p, r) = (self.precision(), self.pd());
        if p + r <= 0.0 {
            0.0
        } else {
            2.0 * p * r / (p + r)
        }
    }
}

fn ratio(num: usize, den: usize) -> f64 {
    if den == 0 {
        0.0
    } else {
        num as f64 / den as f64
    }
}

/// The confusion matrix for `labeled` (`(is_positive, score)`) at `threshold`
/// (predict positive iff `score >= threshold`).
pub fn confusion_at(labeled: &[(bool, f64)], threshold: f64) -> Confusion {
    let mut c = Confusion::default();
    for &(pos, s) in labeled {
        let flag = s >= threshold;
        match (pos, flag) {
            (true, true) => c.tp += 1,
            (true, false) => c.fn_ += 1,
            (false, true) => c.fp += 1,
            (false, false) => c.tn += 1,
        }
    }
    c
}

/// The ROC curve: one point per distinct score threshold, plus the (0,0)/(1,1)
/// endpoints, ordered by increasing P_fa. Monotone non-decreasing in both axes.
pub fn roc_curve(labeled: &[(bool, f64)]) -> Vec<RocPoint> {
    let mut thr: Vec<f64> = labeled.iter().map(|&(_, s)| s).collect();
    thr.sort_by(|a, b| b.partial_cmp(a).unwrap());
    thr.dedup();
    let mut pts = vec![RocPoint {
        threshold: f64::INFINITY,
        pfa: 0.0,
        pd: 0.0,
    }];
    for &t in &thr {
        let c = confusion_at(labeled, t);
        pts.push(RocPoint {
            threshold: t,
            pfa: c.pfa(),
            pd: c.pd(),
        });
    }
    pts.push(RocPoint {
        threshold: f64::NEG_INFINITY,
        pfa: 1.0,
        pd: 1.0,
    });
    pts
}

/// AUC via the Mann–Whitney U statistic: the probability a random positive
/// scores above a random negative (ties count ½). Exact, threshold-free.
/// Returns `NaN` for a degenerate (one-class) input rather than masking it as a
/// benign 0.5 — an empty positive or negative set is not a "chance" AUC.
pub fn auc(pos: &[f64], neg: &[f64]) -> f64 {
    if pos.is_empty() || neg.is_empty() {
        return f64::NAN;
    }
    let mut acc = 0.0;
    for &p in pos {
        for &n in neg {
            acc += if p > n {
                1.0
            } else if (p - n).abs() == 0.0 {
                0.5
            } else {
                0.0
            };
        }
    }
    acc / (pos.len() as f64 * neg.len() as f64)
}

/// The largest decision threshold whose negative-set false-alarm rate (under the
/// `score >= threshold` rule) does **not exceed** `target_pfa` — the conventional,
/// conservative operating point. Tie-correct: if many negatives share a value, all
/// of them count toward P_fa, so the chosen threshold respects the cap exactly
/// (achieved P_fa is granular to 1/n). `target ≤ 0` ⇒ `+∞` (flag nothing, P_fa = 0);
/// `target ≥ 1` ⇒ `−∞` (flag everything).
pub fn threshold_for_pfa(neg_scores: &[f64], target_pfa: f64) -> f64 {
    if neg_scores.is_empty() {
        return f64::INFINITY;
    }
    let target = target_pfa.clamp(0.0, 1.0);
    if target <= 0.0 {
        return f64::INFINITY; // flag nothing → P_fa = 0 exactly, at any score scale
    }
    if target >= 1.0 {
        return f64::NEG_INFINITY; // flag everything → P_fa = 1
    }
    let n = neg_scores.len() as f64;
    let mut s = neg_scores.to_vec();
    s.sort_by(|a, b| b.partial_cmp(a).unwrap()); // descending
    let mut uniq = s.clone();
    uniq.dedup();
    // Walk unique scores high→low; P_fa = count(neg >= v)/n increases monotonically.
    // Keep the largest v whose P_fa stays within the target; stop once it exceeds.
    let mut thr = f64::INFINITY; // nothing flagged ⇒ P_fa = 0 (if even the top overshoots)
    for &v in &uniq {
        let pfa = s.iter().filter(|&&x| x >= v).count() as f64 / n;
        if pfa <= target + 1e-12 {
            thr = v;
        } else {
            break;
        }
    }
    thr
}

/// The full evaluation report for one detector over one corpus.
#[derive(Clone, Debug)]
pub struct EvalReport {
    /// Detector name.
    pub detector: String,
    /// Cases scored.
    pub n_cases: usize,
    /// Threshold-free AUC over model-derived labels.
    pub auc: f64,
    /// The ROC curve.
    pub roc: Vec<RocPoint>,
    /// The target P_fa used to set the operating point.
    pub target_pfa: f64,
    /// The confusion matrix at the operating point.
    pub operating: Confusion,
    /// Per-impaired-class detection rate at the operating point.
    pub per_class_pd: Vec<(ImpairmentClass, f64)>,
}

/// Score a detector over the corpus and produce its evaluation report at a chosen
/// operating P_fa. Reports measured operating characteristics only — it makes no
/// absolute "good/bad" judgement.
pub fn evaluate<D: ImpairmentDetector>(
    det: &D,
    corpus: &[LabeledCase],
    target_pfa: f64,
) -> EvalReport {
    let labeled: Vec<(bool, f64)> = corpus
        .iter()
        .map(|c| (c.is_impaired(), det.score(&c.obs)))
        .collect();
    let pos: Vec<f64> = labeled
        .iter()
        .filter(|(p, _)| *p)
        .map(|(_, s)| *s)
        .collect();
    let neg: Vec<f64> = labeled
        .iter()
        .filter(|(p, _)| !*p)
        .map(|(_, s)| *s)
        .collect();
    let thr = threshold_for_pfa(&neg, target_pfa);
    let operating = confusion_at(&labeled, thr);
    let mut per_class_pd = Vec::new();
    for class in ImpairmentClass::impaired() {
        let mut tp = 0usize;
        let mut tot = 0usize;
        for c in corpus.iter().filter(|c| c.class == class) {
            tot += 1;
            if det.score(&c.obs) >= thr {
                tp += 1;
            }
        }
        per_class_pd.push((class, ratio(tp, tot)));
    }
    EvalReport {
        detector: det.name().to_string(),
        n_cases: corpus.len(),
        auc: auc(&pos, &neg),
        roc: roc_curve(&labeled),
        target_pfa,
        operating,
        per_class_pd,
    }
}

/// A train/test partition of a corpus.
#[derive(Clone, Debug)]
pub struct Split {
    /// Training partition.
    pub train: Vec<LabeledCase>,
    /// Held-out test partition.
    pub test: Vec<LabeledCase>,
}

impl Split {
    /// Leakage guard: true if any case **key** appears in both partitions — i.e. an
    /// exact case was duplicated across train/test. ([`stratified_split`] keeps keys
    /// disjoint by construction, so this fires only on a hand-built leaky split. It
    /// does **not** detect near-duplicate generating *parameters* — a stronger,
    /// roadmap guard.)
    pub fn has_leakage(&self) -> bool {
        use std::collections::HashSet;
        let train_keys: HashSet<u64> = self.train.iter().map(|c| c.params.key).collect();
        self.test.iter().any(|c| train_keys.contains(&c.params.key))
    }
}

/// A deterministic, **class-stratified** train/test split: each class is split in
/// the same `frac_train` proportion, so neither partition is class-skewed and the
/// keys are disjoint by construction (no exact-duplication leakage).
pub fn stratified_split(corpus: &[LabeledCase], frac_train: f64, seed: u64) -> Split {
    let frac = frac_train.clamp(0.0, 1.0);
    let mut train = Vec::new();
    let mut test = Vec::new();
    for class in ImpairmentClass::all() {
        let mut group: Vec<LabeledCase> = corpus
            .iter()
            .filter(|c| c.class == class)
            .copied()
            .collect();
        // Deterministic shuffle via sort on a seeded key.
        group.sort_by(|a, b| {
            let ka = hash2(seed, a.params.key);
            let kb = hash2(seed, b.params.key);
            ka.cmp(&kb)
        });
        let n_train = (group.len() as f64 * frac).round() as usize;
        for (i, c) in group.into_iter().enumerate() {
            if i < n_train {
                train.push(c);
            } else {
                test.push(c);
            }
        }
    }
    Split { train, test }
}

fn hash2(a: u64, b: u64) -> u64 {
    let mut x = a ^ b.wrapping_mul(0x9e37_79b9_7f4a_7c15);
    x ^= x >> 30;
    x = x.wrapping_mul(0xbf58_476d_1ce4_e5b9);
    x ^= x >> 27;
    x
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn corpus_is_class_balanced_and_labelled() {
        let cfg = CorpusConfig {
            n_per_class: 50,
            ..Default::default()
        };
        let c = generate_corpus(&cfg, 7);
        assert_eq!(c.len(), 250);
        for class in ImpairmentClass::all() {
            assert_eq!(c.iter().filter(|x| x.class == class).count(), 50);
        }
        // exactly one non-impaired class.
        let pos = c.iter().filter(|x| x.is_impaired()).count();
        assert_eq!(pos, 200);
    }

    #[test]
    fn corpus_is_reproducible_by_seed() {
        let cfg = CorpusConfig::default();
        let a = generate_corpus(&cfg, 42);
        let b = generate_corpus(&cfg, 42);
        let d = generate_corpus(&cfg, 43);
        assert_eq!(a.len(), b.len());
        for (x, y) in a.iter().zip(b.iter()) {
            assert_eq!(x.obs.agc_excess_db.to_bits(), y.obs.agc_excess_db.to_bits());
            assert_eq!(x.obs.parity_stat.to_bits(), y.obs.parity_stat.to_bits());
        }
        // a different seed gives a different corpus (not all-equal).
        let differ = a
            .iter()
            .zip(d.iter())
            .any(|(x, y)| x.obs.agc_excess_db.to_bits() != y.obs.agc_excess_db.to_bits());
        assert!(differ);
    }

    #[test]
    fn auc_perfect_separation_is_one_and_identical_is_half() {
        let pos = [5.0, 6.0, 7.0, 8.0];
        let neg = [0.0, 1.0, 2.0, 3.0];
        assert!((auc(&pos, &neg) - 1.0).abs() < 1e-12);
        // identical distributions ⇒ 0.5 (all ties).
        let same = [1.0, 2.0, 3.0];
        assert!((auc(&same, &same) - 0.5).abs() < 1e-12);
        // fully reversed ⇒ 0.
        assert!((auc(&neg, &pos)).abs() < 1e-12);
        // Mixed data with ONE tie exercises the ½-weight branch non-trivially:
        // pairs (1,2)=0, (1,3)=0, (2,2)=½, (2,3)=0 ⇒ 0.5/4 = 0.125.
        assert!((auc(&[1.0, 2.0], &[2.0, 3.0]) - 0.125).abs() < 1e-12);
        // degenerate one-class input ⇒ NaN, not a benign 0.5.
        assert!(auc(&[], &neg).is_nan());
    }

    #[test]
    fn roc_is_monotone_nondecreasing() {
        let cfg = CorpusConfig {
            n_per_class: 80,
            ..Default::default()
        };
        let corpus = generate_corpus(&cfg, 1);
        let labeled: Vec<(bool, f64)> = corpus
            .iter()
            .map(|c| (c.is_impaired(), FusedDetector.score(&c.obs)))
            .collect();
        let roc = roc_curve(&labeled);
        for w in roc.windows(2) {
            assert!(w[1].pfa >= w[0].pfa - 1e-12, "pfa must be non-decreasing");
            assert!(w[1].pd >= w[0].pd - 1e-12, "pd must be non-decreasing");
        }
        assert!((roc.first().unwrap().pfa).abs() < 1e-12);
        assert!((roc.last().unwrap().pfa - 1.0).abs() < 1e-12);
    }

    #[test]
    fn confusion_counts_sum_to_n() {
        let cfg = CorpusConfig {
            n_per_class: 40,
            ..Default::default()
        };
        let corpus = generate_corpus(&cfg, 5);
        let labeled: Vec<(bool, f64)> = corpus
            .iter()
            .map(|c| (c.is_impaired(), AgcDetector.score(&c.obs)))
            .collect();
        let c = confusion_at(&labeled, 1.5);
        assert_eq!(c.n(), corpus.len());
        // Exercise the `>=` decision rule, not just the bookkeeping: at −∞ everything
        // is flagged (no misses, no true-negs); at +∞ nothing is (no positives flagged).
        let pos_n = corpus.iter().filter(|c| c.is_impaired()).count();
        let neg_n = corpus.len() - pos_n;
        let all = confusion_at(&labeled, f64::NEG_INFINITY);
        assert_eq!((all.tp, all.fn_, all.tn), (pos_n, 0, 0));
        let none = confusion_at(&labeled, f64::INFINITY);
        assert_eq!((none.tp, none.fp, none.tn), (0, 0, neg_n));
    }

    #[test]
    fn fused_aggregates_layer_separability_on_synthetic_corpus() {
        let cfg = CorpusConfig {
            n_per_class: 300,
            ..Default::default()
        };
        let corpus = generate_corpus(&cfg, 11);
        // High AUC here reflects the SYNTHETIC corpus's built-in separability (over
        // model-derived labels), NOT detector merit or field performance.
        let rep = evaluate(&FusedDetector, &corpus, 0.05);
        assert!(
            rep.auc > 0.8,
            "fused AUC {} reflects corpus separability, not detector merit",
            rep.auc
        );
        // Each published-method layer is the strongest on the class it targets.
        let agc = evaluate(&AgcDetector, &corpus, 0.05);
        let sqm = evaluate(&SqmDetector, &corpus, 0.05);
        let parity = evaluate(&ParityDetector, &corpus, 0.05);
        let energy = evaluate(&EnergyDetector, &corpus, 0.05);
        let pd = |r: &EvalReport, k: ImpairmentClass| {
            r.per_class_pd.iter().find(|(c, _)| *c == k).unwrap().1
        };
        // RAIM-parity catches position-push best; SQM catches multipath best;
        // energy/CN0 catches jamming best.
        assert!(
            pd(&parity, ImpairmentClass::SpoofPosition)
                > pd(&energy, ImpairmentClass::SpoofPosition)
        );
        assert!(pd(&sqm, ImpairmentClass::Multipath) > pd(&agc, ImpairmentClass::Multipath));
        assert!(pd(&energy, ImpairmentClass::Jamming) > pd(&sqm, ImpairmentClass::Jamming));
    }

    #[test]
    fn operating_point_pfa_is_near_target() {
        let cfg = CorpusConfig {
            n_per_class: 500,
            ..Default::default()
        };
        let corpus = generate_corpus(&cfg, 3);
        let rep = evaluate(&FusedDetector, &corpus, 0.05);
        assert!(
            (rep.operating.pfa() - 0.05).abs() < 0.03,
            "pfa {}",
            rep.operating.pfa()
        );
    }

    #[test]
    fn stratified_split_has_no_leakage_but_guard_catches_a_leaky_one() {
        let cfg = CorpusConfig {
            n_per_class: 60,
            ..Default::default()
        };
        let corpus = generate_corpus(&cfg, 9);
        let split = stratified_split(&corpus, 0.7, 9);
        assert!(!split.has_leakage(), "clean stratified split must not leak");
        // The real non-leakage invariant: the two partitions' key sets are disjoint.
        use std::collections::HashSet;
        let tr: HashSet<u64> = split.train.iter().map(|c| c.params.key).collect();
        let te: HashSet<u64> = split.test.iter().map(|c| c.params.key).collect();
        assert!(
            tr.is_disjoint(&te),
            "train/test keys must be disjoint by construction"
        );
        // each class split ~70/30
        for class in ImpairmentClass::all() {
            let tr = split.train.iter().filter(|c| c.class == class).count();
            assert!(
                (tr as i64 - 42).abs() <= 1,
                "class {} train={}",
                class.label(),
                tr
            );
        }
        // deliberately leak: copy a train case into test.
        let mut leaky = split.clone();
        leaky.test.push(leaky.train[0]);
        assert!(leaky.has_leakage(), "guard must catch a duplicated case");
    }

    #[test]
    fn a_perfect_oracle_detector_scores_auc_one() {
        // Confirms the AUC metric increases with class separability on this synthetic
        // corpus (a detector reading the elevated observable should score near-perfect).
        struct Oracle;
        impl ImpairmentDetector for Oracle {
            fn name(&self) -> &str {
                "oracle"
            }
            fn score(&self, o: &CaseObservables) -> f64 {
                // any impaired case has at least one elevated observable; nominal ~0.
                o.cn0_drop_db
                    .max(o.agc_excess_db)
                    .max(o.sqm_el_metric.abs() * 100.0)
                    .max(o.parity_stat)
            }
        }
        let cfg = CorpusConfig {
            n_per_class: 100,
            meas_noise: 0.0,
            ..Default::default()
        };
        let corpus = generate_corpus(&cfg, 2);
        let rep = evaluate(&Oracle, &corpus, 0.01);
        assert!(rep.auc > 0.95, "oracle AUC {}", rep.auc);
    }
}
