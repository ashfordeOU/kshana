// SPDX-License-Identifier: AGPL-3.0-only
//! `conflict-resilience` scenario — layered-PNT resilience in a contested / conflict
//! environment (paper P7).
//!
//! A PNT user in a conflict zone fields several navigation *layers* (open-service GNSS,
//! wideband GNSS, an authenticated constellation, an augmentation relay, …). Each layer
//! has a base availability, a 1σ position accuracy, and a per-vector *vulnerability* to
//! the shared jamming / spoofing threat. This pack answers two questions a resilience
//! architect needs before trusting "more layers = safer":
//!
//! 1. **How much does layering actually buy?** At a given threat intensity, the surviving
//!    layers are fused by the closed-form inverse-variance rule
//!    `σ_fused = (Σ_i 1/σ_i²)^(−1/2)`, and the probability that *every* layer is denied at
//!    once (total loss of PNT) is reported against the intensity sweep. The headline
//!    **resilience ratio** is the single-layer total-loss probability over the layered
//!    total-loss probability — how many times *less* often the layered user loses PNT.
//!
//! 2. **Does that benefit survive correlation?** Real RF layers share a band and a threat
//!    vector, so their denials are *correlated*, not independent. A one-factor Gaussian
//!    copula couples the layers with correlation `ρ`, and the resilience ratio is swept
//!    against `ρ` — quantifying how the independence-assumption benefit **shrinks** as the
//!    denials become correlated (correlation defeats layering).
//!
//! ## Validated vs Modelled
//! * **Validated (vs an independent oracle).** The Monte-Carlo total-loss probability
//!   converges to the closed-form independent product `Π_i p_deny_i` (a test asserts the
//!   MC estimate matches the closed form within Monte-Carlo standard error at a fixed
//!   seed and large N). The inverse-variance fuse is a closed-form identity
//!   (`fuse([3,4]) = 12/5`, checked). At `ρ = 0` the Gaussian copula reduces to the
//!   independent model (their MC total-loss estimates agree within MC error for the same
//!   seed), and the copula preserves each layer's marginal denial rate for every `ρ`
//!   (each layer's empirical denial rate matches its target within MC error).
//! * **Modelled.** The per-layer vulnerability / availability / accuracy magnitudes are
//!   `Modelled` inputs with provenance (see [`crate::conflict_threat_params`]); the
//!   specific ~7× headline ratio and the shape of the ratio-vs-correlation curve are
//!   properties of that Modelled parameterisation, not certified figures. Not a certified
//!   navigation-availability product.

use crate::conflict_threat_params::conflict_baseline;
use crate::mcda::sensitivity::{tornado, TornadoBar};
use crate::resilience::stats::{dirichlet_weights, percentile_ci};
use rand::Rng;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::StandardNormal;
use serde::Deserialize;

/// The honesty label carried on every result document.
const LABEL: &str = "MODELLED layered-PNT conflict resilience (P7). VALIDATED core: the \
Monte-Carlo total-loss probability converges to the closed-form independent product \
Pi_i p_deny_i (asserted within Monte-Carlo standard error at a fixed seed and large N); \
the inverse-variance position fuse sigma_fused = (sum_i 1/sigma_i^2)^(-1/2) is a \
closed-form identity; at correlation rho=0 the Gaussian copula reduces exactly to the \
independent model (agreeing within MC error for the same seed) and preserves each \
layer's marginal denial rate at every rho. MODELLED: the per-layer vulnerability / \
availability / accuracy magnitudes are sourced-but-Modelled inputs (see \
crate::conflict_threat_params — JammerTest 2024, TEXBAT, EASA SIB, LunaNet/IOAG); the \
~7x headline resilience ratio and the ratio-vs-correlation curve shape are properties \
of that Modelled parameterisation, not certified figures. Not a certified navigation-\
availability product.";

/// One PNT layer in the conflict architecture.
#[derive(Clone, Debug, Deserialize)]
pub struct ConflictLayer {
    /// Human-readable layer name; filled with `layer {i}` when absent.
    #[serde(default)]
    pub name: String,
    /// Base availability absent any threat, in `[0, 1]`.
    pub availability: f64,
    /// 1σ position error of the layer (metres).
    pub sigma_m: f64,
    /// Per-vector denial vulnerability (denial sensitivity), in `[0, 1]`.
    pub vulnerability: f64,
    /// Coupling weight to the shared threat vector, in `[0, 1]`.
    pub vector_weight: f64,
}

/// The per-vector denial probability of `layer` at threat `intensity`:
/// `clamp(vulnerability · intensity · vector_weight, 0, 1)`.
pub fn deny_prob(layer: &ConflictLayer, intensity: f64) -> f64 {
    (layer.vulnerability * intensity * layer.vector_weight).clamp(0.0, 1.0)
}

/// The probability `layer` yields a usable fix at `intensity`: available **and** not
/// denied, `availability · (1 − p_deny)`.
pub fn usable_prob(layer: &ConflictLayer, intensity: f64) -> f64 {
    layer.availability.clamp(0.0, 1.0) * (1.0 - deny_prob(layer, intensity))
}

/// The probability `layer` yields **no** usable fix — its per-layer loss probability
/// `1 − availability · (1 − p_deny)`.
pub fn layer_loss_prob(layer: &ConflictLayer, intensity: f64) -> f64 {
    1.0 - usable_prob(layer, intensity)
}

/// Closed-form total-loss probability (every layer unusable) for **independent** denial:
/// `Π_i layer_loss_prob_i`. With `availability = 1` this reduces to `Π_i p_deny_i` — the
/// Validated oracle the Monte-Carlo converges to.
pub fn total_loss_closed_form(layers: &[ConflictLayer], intensity: f64) -> f64 {
    layers
        .iter()
        .map(|l| layer_loss_prob(l, intensity))
        .product()
}

/// The closed-form inverse-variance position fuse over the surviving 1σ errors,
/// `(Σ_i 1/σ_i²)^(−1/2)`. Returns `None` when no layer survives (a total loss). This is
/// a closed-form identity — the Validated fusion core.
pub fn inverse_variance_fuse(sigmas: &[f64]) -> Option<f64> {
    if sigmas.is_empty() {
        return None;
    }
    let info: f64 = sigmas.iter().map(|s| 1.0 / (s * s)).sum();
    if info > 0.0 && info.is_finite() {
        Some(info.sqrt().recip())
    } else {
        None
    }
}

/// The closed-form resilience ratio at `intensity`: the `primary` single layer's loss
/// probability over the layered total-loss probability. `∞` when the layered loss is
/// exactly zero (a perfectly available, un-deniable layer exists).
pub fn resilience_ratio_closed_form(
    layers: &[ConflictLayer],
    intensity: f64,
    primary: usize,
) -> f64 {
    let layered = total_loss_closed_form(layers, intensity);
    let single = layers
        .get(primary)
        .map(|l| layer_loss_prob(l, intensity))
        .unwrap_or(1.0);
    if layered > 0.0 {
        single / layered
    } else {
        f64::INFINITY
    }
}

/// Inverse standard-normal CDF (probit) via Acklam's rational approximation (absolute
/// error < 1.15e-9 across `(0, 1)`). Endpoints map to `∓∞` so a never-/always-denied
/// layer keeps an exact marginal under the copula.
fn inv_norm_cdf(p: f64) -> f64 {
    if p <= 0.0 {
        return f64::NEG_INFINITY;
    }
    if p >= 1.0 {
        return f64::INFINITY;
    }
    const A: [f64; 6] = [
        -3.969683028665376e+01,
        2.209460984245205e+02,
        -2.759285104469687e+02,
        1.38357751867269e+02,
        -3.066479806614716e+01,
        2.506628277459239e+00,
    ];
    const B: [f64; 5] = [
        -5.447609879822406e+01,
        1.615858368580409e+02,
        -1.556989798598866e+02,
        6.680131188771972e+01,
        -1.328068155288572e+01,
    ];
    const C: [f64; 6] = [
        -7.784894002430293e-03,
        -3.223964580411365e-01,
        -2.400758277161838e+00,
        -2.549732539343734e+00,
        4.374664141464968e+00,
        2.938163982698783e+00,
    ];
    const D: [f64; 4] = [
        7.784695709041462e-03,
        3.224671290700398e-01,
        2.445134137142996e+00,
        3.754408661907416e+00,
    ];
    let plow = 0.02425;
    let phigh = 1.0 - plow;
    if p < plow {
        let q = (-2.0 * p.ln()).sqrt();
        (((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    } else if p <= phigh {
        let q = p - 0.5;
        let r = q * q;
        (((((A[0] * r + A[1]) * r + A[2]) * r + A[3]) * r + A[4]) * r + A[5]) * q
            / (((((B[0] * r + B[1]) * r + B[2]) * r + B[3]) * r + B[4]) * r + 1.0)
    } else {
        let q = (-2.0 * (1.0 - p).ln()).sqrt();
        -(((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    }
}

/// Monte-Carlo statistics at one threat intensity.
#[derive(Clone, Debug)]
pub struct IntensityStats {
    /// The threat intensity this row was run at.
    pub intensity: f64,
    /// Number of Monte-Carlo trials.
    pub trials: usize,
    /// Empirical total-loss probability (fraction of trials with no usable layer).
    pub total_loss_probability: f64,
    /// The closed-form independent total-loss probability at this intensity.
    pub total_loss_closed_form: f64,
    /// Median fused 1σ position error over non-total-loss trials (metres); `NaN` when
    /// every trial was a total loss.
    pub median_fused_error_m: f64,
    /// Mean fused 1σ position error over non-total-loss trials (metres).
    pub mean_fused_error_m: f64,
    /// Empirical per-layer usable fraction.
    pub per_layer_usable: Vec<f64>,
    /// Empirical per-layer denial rate (the copula marginal-preservation check).
    pub per_layer_deny_rate: Vec<f64>,
}

/// Accumulate one trial's per-layer draws into running counters.
struct Accum {
    total_loss: u64,
    usable: Vec<u64>,
    denied: Vec<u64>,
    fused: Vec<f64>,
}

impl Accum {
    fn new(n: usize) -> Self {
        Accum {
            total_loss: 0,
            usable: vec![0; n],
            denied: vec![0; n],
            fused: Vec::new(),
        }
    }

    fn finish(mut self, layers: &[ConflictLayer], intensity: f64, trials: usize) -> IntensityStats {
        let (median, mean) = if self.fused.is_empty() {
            (f64::NAN, f64::NAN)
        } else {
            self.fused.sort_by(f64::total_cmp);
            let median = self.fused[self.fused.len() / 2];
            let mean = self.fused.iter().sum::<f64>() / self.fused.len() as f64;
            (median, mean)
        };
        let inv = 1.0 / trials as f64;
        IntensityStats {
            intensity,
            trials,
            total_loss_probability: self.total_loss as f64 * inv,
            total_loss_closed_form: total_loss_closed_form(layers, intensity),
            median_fused_error_m: median,
            mean_fused_error_m: mean,
            per_layer_usable: self.usable.iter().map(|&c| c as f64 * inv).collect(),
            per_layer_deny_rate: self.denied.iter().map(|&c| c as f64 * inv).collect(),
        }
    }
}

/// One independent Monte-Carlo trial: each layer is available with `availability` and,
/// if available, denied with `p_deny` — both drawn independently.
fn independent_trial(
    layers: &[ConflictLayer],
    deny: &[f64],
    acc: &mut Accum,
    rng: &mut ChaCha8Rng,
) {
    let mut sigmas = Vec::with_capacity(layers.len());
    for (i, l) in layers.iter().enumerate() {
        let avail_ok = rng.gen_range(0.0..1.0) < l.availability;
        let denied = rng.gen_range(0.0..1.0) < deny[i];
        if denied {
            acc.denied[i] += 1;
        }
        if avail_ok && !denied {
            acc.usable[i] += 1;
            sigmas.push(l.sigma_m);
        }
    }
    match inverse_variance_fuse(&sigmas) {
        Some(f) => acc.fused.push(f),
        None => acc.total_loss += 1,
    }
}

/// The **independent** intensity Monte-Carlo (L34). Each layer's denial is an
/// independent Bernoulli, so the total-loss probability estimates the closed-form
/// product `Π_i layer_loss_prob_i`.
pub fn simulate_independent(
    layers: &[ConflictLayer],
    intensity: f64,
    trials: usize,
    seed: u64,
) -> IntensityStats {
    let deny: Vec<f64> = layers.iter().map(|l| deny_prob(l, intensity)).collect();
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut acc = Accum::new(layers.len());
    for _ in 0..trials {
        independent_trial(layers, &deny, &mut acc, &mut rng);
    }
    acc.finish(layers, intensity, trials)
}

/// One correlated Monte-Carlo trial: denials are coupled by a one-factor Gaussian
/// copula `z_i = √ρ·w + √(1−ρ)·e_i`; layer `i` is denied iff `z_i < Φ⁻¹(p_deny_i)`,
/// which preserves the marginal denial rate `p_deny_i` for every `ρ`. Availability is
/// drawn independently.
fn correlated_trial(
    layers: &[ConflictLayer],
    thresh: &[f64],
    a: f64,
    b: f64,
    acc: &mut Accum,
    rng: &mut ChaCha8Rng,
) {
    let w: f64 = rng.sample(StandardNormal);
    let mut sigmas = Vec::with_capacity(layers.len());
    for (i, l) in layers.iter().enumerate() {
        let e: f64 = rng.sample(StandardNormal);
        let z = a * w + b * e;
        let denied = z < thresh[i];
        let avail_ok = rng.gen_range(0.0..1.0) < l.availability;
        if denied {
            acc.denied[i] += 1;
        }
        if avail_ok && !denied {
            acc.usable[i] += 1;
            sigmas.push(l.sigma_m);
        }
    }
    match inverse_variance_fuse(&sigmas) {
        Some(f) => acc.fused.push(f),
        None => acc.total_loss += 1,
    }
}

/// The **correlated** intensity Monte-Carlo (L35): a one-factor Gaussian copula couples
/// the layers' denials with equicorrelation `rho`. At `rho = 0` this reduces to
/// [`simulate_independent`]; the copula preserves each layer's marginal denial rate for
/// every `rho`.
pub fn simulate_correlated(
    layers: &[ConflictLayer],
    intensity: f64,
    rho: f64,
    trials: usize,
    seed: u64,
) -> IntensityStats {
    let rho = rho.clamp(0.0, 1.0);
    let thresh: Vec<f64> = layers
        .iter()
        .map(|l| inv_norm_cdf(deny_prob(l, intensity)))
        .collect();
    let a = rho.sqrt();
    let b = (1.0 - rho).sqrt();
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut acc = Accum::new(layers.len());
    for _ in 0..trials {
        correlated_trial(layers, &thresh, a, b, &mut acc, &mut rng);
    }
    acc.finish(layers, intensity, trials)
}

/// Deterministically decorrelate a sub-stream seed from the base seed and an index.
fn mix_seed(seed: u64, i: usize) -> u64 {
    seed ^ (i as u64).wrapping_mul(0x9E37_79B9_7F4A_7C15)
}

/// Sweep the independent Monte-Carlo across an intensity grid.
pub fn sweep_intensity(
    layers: &[ConflictLayer],
    grid: &[f64],
    trials: usize,
    seed: u64,
) -> Vec<IntensityStats> {
    grid.iter()
        .enumerate()
        .map(|(i, &intensity)| simulate_independent(layers, intensity, trials, mix_seed(seed, i)))
        .collect()
}

/// The resilience ratio at one correlation value.
#[derive(Clone, Debug)]
pub struct CorrelationStats {
    /// Denial correlation `ρ`.
    pub rho: f64,
    /// Empirical layered total-loss probability (all layers denied at once).
    pub layered_total_loss: f64,
    /// Empirical single-layer (primary) loss probability — rho-invariant in expectation.
    pub single_layer_loss: f64,
    /// The resilience ratio `single_layer_loss / layered_total_loss`.
    pub resilience_ratio: f64,
    /// Empirical per-layer denial rate (the marginal-preservation check across `ρ`).
    pub per_layer_deny_rate: Vec<f64>,
}

/// Sweep the resilience ratio against denial correlation at a fixed threat intensity —
/// the L35 "correlation defeats layering" curve.
pub fn sweep_correlation(
    layers: &[ConflictLayer],
    intensity: f64,
    rho_grid: &[f64],
    primary: usize,
    trials: usize,
    seed: u64,
) -> Vec<CorrelationStats> {
    rho_grid
        .iter()
        .enumerate()
        .map(|(i, &rho)| {
            let s = simulate_correlated(layers, intensity, rho, trials, mix_seed(seed, 1000 + i));
            let single = s
                .per_layer_usable
                .get(primary)
                .map(|&u| 1.0 - u)
                .unwrap_or(1.0);
            let ratio = if s.total_loss_probability > 0.0 {
                single / s.total_loss_probability
            } else {
                f64::INFINITY
            };
            CorrelationStats {
                rho,
                layered_total_loss: s.total_loss_probability,
                single_layer_loss: single,
                resilience_ratio: ratio,
                per_layer_deny_rate: s.per_layer_deny_rate,
            }
        })
        .collect()
}

/// One tornado bar of the prior sensitivity: which layer's vulnerability-prior weight
/// most swings the layered-over-single decision margin.
#[derive(Clone, Debug)]
pub struct TornadoEntry {
    /// Layer index (criterion).
    pub layer_index: usize,
    /// Layer name.
    pub layer_name: String,
    /// Absolute swing in the layered-over-single margin under a ±`delta` weight nudge.
    pub swing: f64,
}

/// The L35(a) sensitivity of the headline over the sourced vulnerability priors.
#[derive(Clone, Debug)]
pub struct PriorSensitivity {
    /// The intensity the headline is evaluated at.
    pub reference_intensity: f64,
    /// The nominal (catalog-nominal priors) closed-form resilience ratio.
    pub nominal_ratio: f64,
    /// 95% CI of the resilience ratio as each layer's vulnerability is drawn uniformly
    /// over its sourced `[min, max]` prior.
    pub ratio_ci: (f64, f64),
    /// 95% CI of the total-loss probability over the same prior draws.
    pub total_loss_ci: (f64, f64),
    /// 95% CI of the resilience ratio when the adversary's total threat effort is
    /// re-allocated across the layers' vectors via a seeded Dirichlet draw.
    pub effort_ratio_ci: (f64, f64),
    /// Number of Monte-Carlo prior samples.
    pub samples: usize,
    /// Tornado over the vulnerability-prior weights (widest swing first).
    pub tornado: Vec<TornadoEntry>,
}

/// Compute the L35(a) prior sensitivity: a vulnerability-prior Monte-Carlo (percentile
/// CI), a Dirichlet threat-effort re-allocation (percentile CI), and an MCDA tornado
/// over the vulnerability priors — reusing [`crate::resilience::stats`] and
/// [`crate::mcda::sensitivity`].
pub fn prior_sensitivity(
    layers: &[ConflictLayer],
    priors: &[(f64, f64)],
    intensity: f64,
    primary: usize,
    samples: usize,
    seed: u64,
) -> PriorSensitivity {
    let nominal_ratio = resilience_ratio_closed_form(layers, intensity, primary);

    // (1) Vulnerability-prior Monte-Carlo: draw each layer's vulnerability uniformly over
    // its sourced [min, max] and record the resilience ratio and total loss.
    let mut rng = ChaCha8Rng::seed_from_u64(mix_seed(seed, 7));
    let mut ratios = Vec::with_capacity(samples);
    let mut losses = Vec::with_capacity(samples);
    for _ in 0..samples {
        let mut sampled = layers.to_vec();
        for (l, &(lo, hi)) in sampled.iter_mut().zip(priors.iter()) {
            l.vulnerability = if hi > lo { rng.gen_range(lo..hi) } else { lo };
        }
        ratios.push(resilience_ratio_closed_form(&sampled, intensity, primary));
        losses.push(total_loss_closed_form(&sampled, intensity));
    }

    // (2) Dirichlet threat-effort re-allocation: keep the total shared effort fixed and
    // re-split it across the layers' vectors from a seeded Dirichlet simplex.
    let total_weight: f64 = layers.iter().map(|l| l.vector_weight).sum();
    let alpha: Vec<f64> = layers
        .iter()
        .map(|l| (l.vector_weight * 8.0).max(1e-3))
        .collect();
    let mut effort_ratios = Vec::with_capacity(samples);
    for s in 0..samples {
        let split = dirichlet_weights(&alpha, mix_seed(seed, 20_000 + s));
        let mut reweighted = layers.to_vec();
        for (l, &frac) in reweighted.iter_mut().zip(split.iter()) {
            l.vector_weight = (frac * total_weight).clamp(0.0, 1.0);
        }
        effort_ratios.push(resilience_ratio_closed_form(
            &reweighted,
            intensity,
            primary,
        ));
    }

    // (3) MCDA tornado: alternatives {layered, single}, criteria = layers, weights =
    // normalised nominal vulnerabilities. The bars rank which layer's vulnerability-prior
    // weight most swings the layered-over-single decision margin.
    let weights: Vec<f64> = layers.iter().map(|l| l.vulnerability.max(0.0)).collect();
    let layered_row: Vec<f64> = layers.iter().map(|l| usable_prob(l, intensity)).collect();
    let mut single_row = vec![0.0; layers.len()];
    if let Some(slot) = single_row.get_mut(primary) {
        *slot = usable_prob(&layers[primary], intensity);
    }
    let vm = vec![layered_row, single_row];
    let bars: Vec<TornadoBar> = tornado(&weights, &vm, 0.25);
    let tornado_entries: Vec<TornadoEntry> = bars
        .iter()
        .map(|b| TornadoEntry {
            layer_index: b.criterion,
            layer_name: layers
                .get(b.criterion)
                .map(|l| l.name.clone())
                .unwrap_or_default(),
            swing: b.swing,
        })
        .collect();

    PriorSensitivity {
        reference_intensity: intensity,
        nominal_ratio,
        ratio_ci: percentile_ci(&ratios, 0.05),
        total_loss_ci: percentile_ci(&losses, 0.05),
        effort_ratio_ci: percentile_ci(&effort_ratios, 0.05),
        samples,
        tornado: tornado_entries,
    }
}

/// The intensity grid specification `{ min, max, steps }`.
#[derive(Clone, Debug, Deserialize)]
pub struct IntensityGrid {
    /// Lowest intensity (default 0.0).
    pub min: Option<f64>,
    /// Highest intensity (default 1.0) — also the headline reference intensity.
    pub max: Option<f64>,
    /// Number of grid points (default 11, min 2).
    pub steps: Option<usize>,
}

impl IntensityGrid {
    fn values(&self) -> Result<Vec<f64>, String> {
        let min = self.min.unwrap_or(0.0);
        let max = self.max.unwrap_or(1.0);
        let steps = self.steps.unwrap_or(11);
        if !(min.is_finite() && max.is_finite()) || max <= min {
            return Err(format!(
                "intensity grid must have finite min < max, got [{min}, {max}]"
            ));
        }
        if steps < 2 {
            return Err(format!("intensity grid needs >= 2 steps, got {steps}"));
        }
        Ok((0..steps)
            .map(|i| min + (max - min) * i as f64 / (steps - 1) as f64)
            .collect())
    }
}

/// The correlation grid specification `{ values = [...] }`.
#[derive(Clone, Debug, Deserialize)]
pub struct CorrelationGrid {
    /// Explicit correlation values (default `[0, 0.2, 0.4, 0.6, 0.8, 0.95]`).
    pub values: Option<Vec<f64>>,
}

impl CorrelationGrid {
    fn values(&self) -> Result<Vec<f64>, String> {
        let v = self
            .values
            .clone()
            .unwrap_or_else(|| vec![0.0, 0.2, 0.4, 0.6, 0.8, 0.95]);
        if v.is_empty() {
            return Err("correlation grid must have at least one value".to_string());
        }
        for &r in &v {
            if !(0.0..=1.0).contains(&r) {
                return Err(format!("correlation values must lie in [0, 1], got {r}"));
            }
        }
        Ok(v)
    }
}

/// The `conflict-resilience` scenario. Every field is optional; with no fields the
/// scenario runs the sourced four-layer conflict baseline over `[0, 1]` intensity and a
/// default correlation grid.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct ConflictResilienceScenario {
    /// The PNT layers; empty ⇒ the sourced conflict baseline
    /// ([`crate::conflict_threat_params::conflict_baseline`]).
    #[serde(default)]
    pub layers: Vec<ConflictLayer>,
    /// The threat-intensity grid.
    #[serde(default)]
    pub intensity: Option<IntensityGrid>,
    /// The denial-correlation grid.
    #[serde(default)]
    pub correlation: Option<CorrelationGrid>,
    /// Monte-Carlo trials per grid point (default 4000).
    #[serde(default)]
    pub trials: Option<usize>,
    /// Seed for the (ChaCha8) deterministic RNG (default 20260709).
    #[serde(default)]
    pub seed: Option<u64>,
    /// Index of the single layer used as the ratio baseline (default 0).
    #[serde(default)]
    pub primary_layer: Option<usize>,
}

/// The fully computed analysis.
struct Computed {
    layers: Vec<ConflictLayer>,
    priors: Vec<(f64, f64)>,
    primary: usize,
    trials: usize,
    grid: Vec<f64>,
    reference_intensity: f64,
    intensity_sweep: Vec<IntensityStats>,
    correlation_sweep: Vec<CorrelationStats>,
    ratio_closed_form: f64,
    ratio_mc_independent: f64,
    sensitivity: PriorSensitivity,
}

impl ConflictResilienceScenario {
    /// Resolve the layer set (sourced baseline when none is supplied) and the paired
    /// `[min, max]` vulnerability priors (from the catalog for the baseline; a ±0.1 band
    /// around the nominal for user-supplied layers).
    fn resolved(&self) -> (Vec<ConflictLayer>, Vec<(f64, f64)>) {
        if self.layers.is_empty() {
            let base = conflict_baseline();
            let layers = base
                .iter()
                .map(|p| ConflictLayer {
                    name: p.layer.to_string(),
                    availability: p.availability,
                    sigma_m: p.sigma_m,
                    vulnerability: p.vulnerability_nominal,
                    vector_weight: p.vector_weight,
                })
                .collect();
            let priors = base
                .iter()
                .map(|p| (p.vulnerability_min, p.vulnerability_max))
                .collect();
            (layers, priors)
        } else {
            let layers: Vec<ConflictLayer> = self
                .layers
                .iter()
                .enumerate()
                .map(|(i, l)| {
                    let mut l = l.clone();
                    if l.name.trim().is_empty() {
                        l.name = format!("layer {i}");
                    }
                    l
                })
                .collect();
            let priors = layers
                .iter()
                .map(|l| {
                    (
                        (l.vulnerability - 0.1).clamp(0.0, 1.0),
                        (l.vulnerability + 0.1).clamp(0.0, 1.0),
                    )
                })
                .collect();
            (layers, priors)
        }
    }

    fn compute(&self) -> Result<Computed, String> {
        let (layers, priors) = self.resolved();
        if layers.is_empty() {
            return Err("conflict-resilience needs at least one layer".to_string());
        }
        for (i, l) in layers.iter().enumerate() {
            if !(0.0..=1.0).contains(&l.availability) {
                return Err(format!(
                    "layer {i} availability {} not in [0, 1]",
                    l.availability
                ));
            }
            if !(l.sigma_m.is_finite() && l.sigma_m > 0.0) {
                return Err(format!("layer {i} sigma_m must be finite and positive"));
            }
            if !(l.vulnerability.is_finite() && l.vulnerability >= 0.0) {
                return Err(format!("layer {i} vulnerability must be finite and >= 0"));
            }
            if !(l.vector_weight.is_finite() && l.vector_weight >= 0.0) {
                return Err(format!("layer {i} vector_weight must be finite and >= 0"));
            }
        }
        let primary = self.primary_layer.unwrap_or(0);
        if primary >= layers.len() {
            return Err(format!(
                "primary_layer {primary} out of range (0..{})",
                layers.len()
            ));
        }
        let trials = self.trials.unwrap_or(4000);
        if trials == 0 {
            return Err("trials must be >= 1".to_string());
        }
        let seed = self.seed.unwrap_or(20_260_709);
        let grid = self
            .intensity
            .clone()
            .unwrap_or(IntensityGrid {
                min: None,
                max: None,
                steps: None,
            })
            .values()?;
        let rho_grid = self
            .correlation
            .clone()
            .unwrap_or(CorrelationGrid { values: None })
            .values()?;
        let reference_intensity = *grid
            .last()
            .ok_or_else(|| "intensity grid unexpectedly empty".to_string())?;

        let intensity_sweep = sweep_intensity(&layers, &grid, trials, seed);
        let correlation_sweep = sweep_correlation(
            &layers,
            reference_intensity,
            &rho_grid,
            primary,
            trials,
            seed,
        );
        let ratio_closed_form = resilience_ratio_closed_form(&layers, reference_intensity, primary);
        // The Monte-Carlo headline ratio at rho = 0 (the independence assumption).
        let ratio_mc_independent = {
            let s = simulate_independent(&layers, reference_intensity, trials, mix_seed(seed, 42));
            let single = s
                .per_layer_usable
                .get(primary)
                .map(|&u| 1.0 - u)
                .unwrap_or(1.0);
            if s.total_loss_probability > 0.0 {
                single / s.total_loss_probability
            } else {
                f64::INFINITY
            }
        };
        let sensitivity =
            prior_sensitivity(&layers, &priors, reference_intensity, primary, 2000, seed);

        Ok(Computed {
            layers,
            priors,
            primary,
            trials,
            grid,
            reference_intensity,
            intensity_sweep,
            correlation_sweep,
            ratio_closed_form,
            ratio_mc_independent,
            sensitivity,
        })
    }

    /// Run the scenario, returning `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, summary(&c), svg(&c)))
    }

    fn json(&self, c: &Computed) -> Result<String, String> {
        let layers: Vec<serde_json::Value> = c
            .layers
            .iter()
            .enumerate()
            .map(|(i, l)| {
                let (lo, hi) = c.priors[i];
                serde_json::json!({
                    "index": i,
                    "name": l.name,
                    "availability": l.availability,
                    "sigma_m": l.sigma_m,
                    "vulnerability": l.vulnerability,
                    "vector_weight": l.vector_weight,
                    "vulnerability_prior_min": lo,
                    "vulnerability_prior_max": hi,
                    "deny_prob_at_reference": deny_prob(l, c.reference_intensity),
                    "loss_prob_at_reference": layer_loss_prob(l, c.reference_intensity),
                })
            })
            .collect();

        let intensity_sweep: Vec<serde_json::Value> = c
            .intensity_sweep
            .iter()
            .map(|s| {
                serde_json::json!({
                    "intensity": s.intensity,
                    "total_loss_probability": s.total_loss_probability,
                    "total_loss_closed_form": s.total_loss_closed_form,
                    "median_fused_error_m": num_or_null(s.median_fused_error_m),
                    "mean_fused_error_m": num_or_null(s.mean_fused_error_m),
                    "per_layer_usable": s.per_layer_usable,
                    "per_layer_deny_rate": s.per_layer_deny_rate,
                })
            })
            .collect();

        let correlation_sweep: Vec<serde_json::Value> = c
            .correlation_sweep
            .iter()
            .map(|s| {
                serde_json::json!({
                    "rho": s.rho,
                    "layered_total_loss": s.layered_total_loss,
                    "single_layer_loss": s.single_layer_loss,
                    "resilience_ratio": num_or_null(s.resilience_ratio),
                    "per_layer_deny_rate": s.per_layer_deny_rate,
                })
            })
            .collect();

        let tornado: Vec<serde_json::Value> = c
            .sensitivity
            .tornado
            .iter()
            .map(|t| {
                serde_json::json!({
                    "layer_index": t.layer_index,
                    "layer_name": t.layer_name,
                    "margin_swing": t.swing,
                })
            })
            .collect();

        let ratio_min = c
            .correlation_sweep
            .iter()
            .map(|s| s.resilience_ratio)
            .filter(|r| r.is_finite())
            .fold(f64::INFINITY, f64::min);

        let doc = serde_json::json!({
            "kind": "conflict-resilience",
            "label": LABEL,
            "trials": c.trials,
            "primary_layer": c.primary,
            "reference_intensity": c.reference_intensity,
            "intensity_grid": c.grid,
            "layers": layers,
            "resilience_ratio": {
                "closed_form_independent": num_or_null(c.ratio_closed_form),
                "monte_carlo_independent": num_or_null(c.ratio_mc_independent),
                "headline": "~7x layered-vs-single-layer reduction in total-loss probability under the INDEPENDENCE assumption; see correlation_sweep for how it shrinks as denial correlation rises (correlation defeats layering).",
                "note": "Validated: the layered total-loss Monte-Carlo converges to the closed-form independent product; the inverse-variance fuse is a closed-form identity. Modelled: the specific ~7x magnitude follows from the sourced-but-Modelled per-layer priors."
            },
            "intensity_sweep": {
                "rows": intensity_sweep,
                "note": "Validated: total_loss_probability (MC) converges to total_loss_closed_form (Π_i layer_loss_prob_i) within MC standard error; median/mean fused error use the closed-form inverse-variance fuse over survivors. Modelled: the per-layer magnitudes."
            },
            "correlation_sweep": {
                "reference_intensity": c.reference_intensity,
                "rows": correlation_sweep,
                "min_ratio_over_grid": num_or_null(ratio_min),
                "note": "Validated: at rho=0 the copula reduces to the independent model and every rho preserves each layer's marginal denial rate (see per_layer_deny_rate). Modelled: the ratio-vs-correlation curve shape. As rho→1 the shared-vector denials co-occur and the resilience ratio collapses toward 1 — correlation defeats layering."
            },
            "prior_sensitivity": {
                "reference_intensity": c.sensitivity.reference_intensity,
                "nominal_ratio": num_or_null(c.sensitivity.nominal_ratio),
                "ratio_ci_95": [c.sensitivity.ratio_ci.0, c.sensitivity.ratio_ci.1],
                "total_loss_ci_95": [c.sensitivity.total_loss_ci.0, c.sensitivity.total_loss_ci.1],
                "effort_reallocation_ratio_ci_95": [c.sensitivity.effort_ratio_ci.0, c.sensitivity.effort_ratio_ci.1],
                "samples": c.sensitivity.samples,
                "tornado": tornado,
                "note": "Modelled sensitivity of the headline over the SOURCED vulnerability priors (crate::conflict_threat_params): the ratio/total-loss 95% CIs come from a uniform draw over each layer's [min,max] prior via resilience::stats::percentile_ci; the effort-reallocation CI re-splits the adversary's total threat effort across vectors via resilience::stats::dirichlet_weights; the tornado (mcda::sensitivity::tornado) ranks which vulnerability-prior weight most swings the layered-over-single decision margin. Cited priors are Modelled inputs with provenance, not Validated."
            }
        });
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }
}

/// Emit a finite `f64` as a JSON number, or `null` for a non-finite value.
fn num_or_null(x: f64) -> serde_json::Value {
    if x.is_finite() {
        serde_json::Value::from(x)
    } else {
        serde_json::Value::Null
    }
}

fn summary(c: &Computed) -> String {
    let first = c.correlation_sweep.first();
    let last = c.correlation_sweep.last();
    let ratio_lo = format!(
        "{:.2}",
        c.sensitivity.ratio_ci.0.min(c.sensitivity.ratio_ci.1)
    );
    let ratio_hi = format!(
        "{:.2}",
        c.sensitivity.ratio_ci.0.max(c.sensitivity.ratio_ci.1)
    );
    format!(
        "conflict-resilience | {} layers ({} baseline) | reference intensity {:.2} | \
         resilience ratio closed-form {:.2}x MC {:.2}x (layered vs single-layer) | \
         correlation defeats layering: ratio {:.2}x @ rho {:.2} -> {:.2}x @ rho {:.2} | \
         prior CI [{ratio_lo}-{ratio_hi}]x | ~7x headline MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals",
        c.layers.len(),
        c.primary,
        c.reference_intensity,
        c.ratio_closed_form,
        c.ratio_mc_independent,
        first.map(|s| s.resilience_ratio).unwrap_or(f64::NAN),
        first.map(|s| s.rho).unwrap_or(0.0),
        last.map(|s| s.resilience_ratio).unwrap_or(f64::NAN),
        last.map(|s| s.rho).unwrap_or(0.0),
    )
}

/// Deterministic two-panel SVG: total-loss vs intensity (left) and resilience ratio vs
/// correlation (right). Fixed-precision formatting so no last-ULP jitter forks the bytes.
fn svg(c: &Computed) -> String {
    let (w, h) = (900.0_f64, 420.0_f64);
    let mut s = String::new();
    s.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    s.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    s.push_str(
        "<text x=\"24\" y=\"24\" font-size=\"15\" font-weight=\"bold\">Layered-PNT conflict resilience (P7)</text>",
    );
    s.push_str(
        "<text x=\"24\" y=\"40\" font-size=\"11\" fill=\"#8a8172\">total-loss vs threat intensity (MC vs closed form) · resilience ratio vs denial correlation · MODELLED priors, VALIDATED MC-&gt;closed-form / copula marginals</text>",
    );

    // ── Left panel: total-loss probability vs intensity ──
    let (lx, ly, lw, lh) = (60.0_f64, 76.0_f64, 360.0_f64, 288.0_f64);
    let axis_y = ly + lh;
    s.push_str(&format!(
        "<text x=\"{lx:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"#8a8172\">total-loss probability vs intensity</text>",
        ly - 8.0
    ));
    s.push_str(&format!(
        "<line x1=\"{lx:.0}\" y1=\"{ly:.0}\" x2=\"{lx:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    s.push_str(&format!(
        "<line x1=\"{lx:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        lx + lw
    ));
    // y is a probability in [0, 1].
    for g in 0..=4 {
        let frac = g as f64 / 4.0;
        let gy = axis_y - frac * lh;
        s.push_str(&format!(
            "<line x1=\"{lx:.0}\" y1=\"{gy:.1}\" x2=\"{:.0}\" y2=\"{gy:.1}\" stroke=\"#241d15\" stroke-dasharray=\"3 4\"/>",
            lx + lw
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#6b6355\">{:.2}</text>",
            lx - 6.0,
            gy + 4.0,
            frac
        ));
    }
    let imax = c.grid.last().copied().unwrap_or(1.0).max(1e-9);
    let xof = |t: f64| lx + (t / imax) * lw;
    let yof = |p: f64| axis_y - p.clamp(0.0, 1.0) * lh;
    // Layered MC total-loss curve.
    let mut mc = String::new();
    let mut cf = String::new();
    let mut single = String::new();
    for s2 in &c.intensity_sweep {
        mc.push_str(&format!(
            "{:.1},{:.1} ",
            xof(s2.intensity),
            yof(s2.total_loss_probability)
        ));
        cf.push_str(&format!(
            "{:.1},{:.1} ",
            xof(s2.intensity),
            yof(s2.total_loss_closed_form)
        ));
        let single_loss = s2
            .per_layer_usable
            .get(c.primary)
            .map(|&u| 1.0 - u)
            .unwrap_or(1.0);
        single.push_str(&format!(
            "{:.1},{:.1} ",
            xof(s2.intensity),
            yof(single_loss)
        ));
    }
    s.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#7a7161\" stroke-width=\"3\" stroke-dasharray=\"2 4\" points=\"{}\"/>",
        cf.trim_end()
    ));
    s.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#d2925e\" stroke-width=\"2\" points=\"{}\"/>",
        mc.trim_end()
    ));
    s.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#c05a4d\" stroke-width=\"1.5\" stroke-dasharray=\"5 3\" points=\"{}\"/>",
        single.trim_end()
    ));
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8a8172\">threat intensity</text>",
        lx + lw / 2.0,
        axis_y + 26.0
    ));
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" fill=\"#d2925e\" font-size=\"10\">layered MC</text>",
        lx + 8.0,
        ly + 12.0
    ));
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" fill=\"#c05a4d\" font-size=\"10\">single layer</text>",
        lx + 8.0,
        ly + 26.0
    ));

    // ── Right panel: resilience ratio vs correlation ──
    let (rx, ryy, rw, rh) = (520.0_f64, 76.0_f64, 340.0_f64, 288.0_f64);
    let raxis_y = ryy + rh;
    s.push_str(&format!(
        "<text x=\"{rx:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"#8a8172\">resilience ratio vs denial correlation</text>",
        ryy - 8.0
    ));
    s.push_str(&format!(
        "<line x1=\"{rx:.0}\" y1=\"{ryy:.0}\" x2=\"{rx:.0}\" y2=\"{raxis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    s.push_str(&format!(
        "<line x1=\"{rx:.0}\" y1=\"{raxis_y:.0}\" x2=\"{:.0}\" y2=\"{raxis_y:.0}\" stroke=\"#342c21\"/>",
        rx + rw
    ));
    let ratio_max = c
        .correlation_sweep
        .iter()
        .map(|s| s.resilience_ratio)
        .filter(|r| r.is_finite())
        .fold(1.0_f64, f64::max)
        .max(1.0);
    for g in 0..=4 {
        let frac = g as f64 / 4.0;
        let gy = raxis_y - frac * rh;
        let val = frac * ratio_max;
        s.push_str(&format!(
            "<line x1=\"{rx:.0}\" y1=\"{gy:.1}\" x2=\"{:.0}\" y2=\"{gy:.1}\" stroke=\"#241d15\" stroke-dasharray=\"3 4\"/>",
            rx + rw
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#6b6355\">{:.1}x</text>",
            rx - 6.0,
            gy + 4.0,
            val
        ));
    }
    let rxof = |rho: f64| rx + rho.clamp(0.0, 1.0) * rw;
    let ryof = |r: f64| raxis_y - (r / ratio_max).clamp(0.0, 1.0) * rh;
    let mut rpts = String::new();
    for s2 in &c.correlation_sweep {
        if s2.resilience_ratio.is_finite() {
            rpts.push_str(&format!(
                "{:.1},{:.1} ",
                rxof(s2.rho),
                ryof(s2.resilience_ratio)
            ));
        }
    }
    s.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#5fb0c9\" stroke-width=\"2\" points=\"{}\"/>",
        rpts.trim_end()
    ));
    for s2 in &c.correlation_sweep {
        if s2.resilience_ratio.is_finite() {
            s.push_str(&format!(
                "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"2.6\" fill=\"#e0bd84\"/>",
                rxof(s2.rho),
                ryof(s2.resilience_ratio)
            ));
        }
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8a8172\">denial correlation ρ</text>",
        rx + rw / 2.0,
        raxis_y + 26.0
    ));
    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    fn avail1_layers() -> Vec<ConflictLayer> {
        // Availability 1.0 so total loss = Π p_deny_i exactly — the clean L34 oracle.
        vec![
            ConflictLayer {
                name: "a".into(),
                availability: 1.0,
                sigma_m: 3.0,
                vulnerability: 0.9,
                vector_weight: 0.6,
            },
            ConflictLayer {
                name: "b".into(),
                availability: 1.0,
                sigma_m: 4.0,
                vulnerability: 0.8,
                vector_weight: 0.6,
            },
            ConflictLayer {
                name: "c".into(),
                availability: 1.0,
                sigma_m: 5.0,
                vulnerability: 0.85,
                vector_weight: 0.6,
            },
        ]
    }

    #[test]
    fn inverse_variance_fuse_is_the_closed_form_identity() {
        // fuse([3,4]) = (1/9 + 1/16)^(-1/2) = (25/144)^(-1/2) = 12/5 = 2.4.
        let f = inverse_variance_fuse(&[3.0, 4.0]).unwrap();
        assert!((f - 2.4).abs() < 1e-12, "fuse = {f}");
        // fuse([σ, σ]) = σ/√2.
        let g = inverse_variance_fuse(&[2.0, 2.0]).unwrap();
        assert!((g - 2.0 / 2.0_f64.sqrt()).abs() < 1e-12, "fuse = {g}");
        // A single layer fuses to itself.
        assert_eq!(inverse_variance_fuse(&[7.0]).unwrap(), 7.0);
        // No survivors -> no fix.
        assert!(inverse_variance_fuse(&[]).is_none());
    }

    #[test]
    fn mc_total_loss_converges_to_closed_form_product() {
        // ORACLE (Validated): the independent MC total-loss probability converges to the
        // closed-form Π_i p_deny_i (availability = 1) within MC standard error.
        let layers = avail1_layers();
        let intensity = 1.0;
        let closed = total_loss_closed_form(&layers, intensity);
        // = Π p_deny_i = (0.9*0.6)*(0.8*0.6)*(0.85*0.6) = 0.54*0.48*0.51.
        let expect = (0.9 * 0.6) * (0.8 * 0.6) * (0.85 * 0.6);
        assert!(
            (closed - expect).abs() < 1e-12,
            "closed {closed} vs {expect}"
        );
        let n = 200_000;
        let s = simulate_independent(&layers, intensity, n, 12345);
        let stderr = (closed * (1.0 - closed) / n as f64).sqrt();
        assert!(
            (s.total_loss_probability - closed).abs() < 5.0 * stderr,
            "MC {} vs closed {} (5σ = {})",
            s.total_loss_probability,
            closed,
            5.0 * stderr
        );
    }

    #[test]
    fn copula_at_rho_zero_matches_the_independent_model() {
        // ORACLE (Validated): at rho = 0 the correlated MC total-loss equals the
        // independent MC total-loss (same seed) within MC error.
        let layers = avail1_layers();
        let intensity = 1.0;
        let n = 200_000;
        let indep = simulate_independent(&layers, intensity, n, 999);
        let corr0 = simulate_correlated(&layers, intensity, 0.0, n, 999);
        let p = indep.total_loss_probability;
        let stderr = (p * (1.0 - p) / n as f64).sqrt();
        assert!(
            (indep.total_loss_probability - corr0.total_loss_probability).abs() < 5.0 * stderr,
            "indep {} vs copula(rho=0) {}",
            indep.total_loss_probability,
            corr0.total_loss_probability
        );
    }

    #[test]
    fn copula_preserves_marginal_denial_rates_at_every_rho() {
        // ORACLE (Validated): the Gaussian-copula marginal denial rate of each layer
        // matches its target p_deny_i for any rho, within MC error.
        let layers = avail1_layers();
        let intensity = 1.0;
        let targets: Vec<f64> = layers.iter().map(|l| deny_prob(l, intensity)).collect();
        let n = 200_000;
        for &rho in &[0.0, 0.5, 0.9] {
            let s = simulate_correlated(&layers, intensity, rho, n, 4242);
            for (i, (&emp, &tgt)) in s.per_layer_deny_rate.iter().zip(targets.iter()).enumerate() {
                let stderr = (tgt * (1.0 - tgt) / n as f64).sqrt();
                assert!(
                    (emp - tgt).abs() < 5.0 * stderr,
                    "rho {rho} layer {i}: empirical {emp} vs target {tgt}"
                );
            }
        }
    }

    #[test]
    fn default_scenario_reproduces_the_seven_x_headline() {
        let (json, summary, svg) = ConflictResilienceScenario::default().run_output().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "conflict-resilience");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(v["label"].as_str().unwrap().contains("VALIDATED"));
        // Closed-form and MC headline ratio both land in the ~7x band.
        let cf = v["resilience_ratio"]["closed_form_independent"]
            .as_f64()
            .unwrap();
        let mc = v["resilience_ratio"]["monte_carlo_independent"]
            .as_f64()
            .unwrap();
        assert!((6.0..8.0).contains(&cf), "closed-form ratio {cf} not ~7x");
        assert!((5.5..8.5).contains(&mc), "MC ratio {mc} not ~7x");
        assert!(summary.contains("conflict-resilience"));
        assert!(summary.contains("~7x"));
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
    }

    #[test]
    fn correlation_shrinks_the_resilience_ratio() {
        // The headline point: as denial correlation rises, the ~7x benefit collapses
        // toward 1 (correlation defeats layering).
        let (json, _s, _svg) = ConflictResilienceScenario::default().run_output().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let rows = v["correlation_sweep"]["rows"].as_array().unwrap();
        let first = rows.first().unwrap();
        let last = rows.last().unwrap();
        assert!((first["rho"].as_f64().unwrap() - 0.0).abs() < 1e-9);
        let r0 = first["resilience_ratio"].as_f64().unwrap();
        let r1 = last["resilience_ratio"].as_f64().unwrap();
        assert!(r0 > 5.0, "ratio at rho=0 should be ~7x, got {r0}");
        assert!(r1 < r0, "ratio must shrink with correlation: {r0} -> {r1}");
        assert!(
            r1 < 2.5,
            "ratio at high correlation should collapse toward 1, got {r1}"
        );
    }

    #[test]
    fn is_deterministic() {
        let scn = ConflictResilienceScenario::default();
        assert_eq!(scn.run_output().unwrap(), scn.run_output().unwrap());
    }

    #[test]
    fn sensitivity_ranges_over_the_sourced_priors() {
        let (json, _s, _svg) = ConflictResilienceScenario::default().run_output().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let ps = &v["prior_sensitivity"];
        let ci = ps["ratio_ci_95"].as_array().unwrap();
        let lo = ci[0].as_f64().unwrap();
        let hi = ci[1].as_f64().unwrap();
        assert!(lo <= hi, "CI must be ordered: [{lo}, {hi}]");
        assert!(
            hi > lo,
            "the prior sweep must produce a non-degenerate spread"
        );
        // The tornado lists every layer.
        let tornado = ps["tornado"].as_array().unwrap();
        assert_eq!(tornado.len(), 4);
        // Layers carry their sourced [min,max] priors.
        let layers = v["layers"].as_array().unwrap();
        for l in layers {
            assert!(
                l["vulnerability_prior_min"].as_f64().unwrap()
                    <= l["vulnerability"].as_f64().unwrap()
            );
            assert!(
                l["vulnerability_prior_max"].as_f64().unwrap()
                    >= l["vulnerability"].as_f64().unwrap()
            );
        }
    }

    #[test]
    fn rejects_degenerate_configuration() {
        // Empty intensity grid via max <= min.
        let scn = ConflictResilienceScenario {
            intensity: Some(IntensityGrid {
                min: Some(1.0),
                max: Some(0.0),
                steps: Some(5),
            }),
            ..Default::default()
        };
        assert!(scn.run_output().is_err());
        // Primary index out of range.
        let scn = ConflictResilienceScenario {
            primary_layer: Some(99),
            ..Default::default()
        };
        assert!(scn.run_output().is_err());
        // Zero trials.
        let scn = ConflictResilienceScenario {
            trials: Some(0),
            ..Default::default()
        };
        assert!(scn.run_output().is_err());
    }

    #[test]
    fn user_supplied_layers_run_and_name_themselves() {
        let src = r#"
kind = "conflict-resilience"
trials = 500
[[layers]]
availability = 1.0
sigma_m = 3.0
vulnerability = 0.9
vector_weight = 0.6
[[layers]]
availability = 1.0
sigma_m = 4.0
vulnerability = 0.8
vector_weight = 0.6
"#;
        let scn: ConflictResilienceScenario = toml::from_str(src).unwrap();
        let (json, _s, _svg) = scn.run_output().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let layers = v["layers"].as_array().unwrap();
        assert_eq!(layers.len(), 2);
        assert_eq!(layers[0]["name"], "layer 0");
    }
}
