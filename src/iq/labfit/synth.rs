// SPDX-License-Identifier: AGPL-3.0-only
//! Synthetic lab runs from known parameters, for testing the fit: the forward model of
//! [`super::model`] drives which satellites a timeline reports, and the reported C/N0 is
//! the modelled C/N0 plus seeded Gaussian noise. An optional per-satellite threshold
//! jitter (seeded) stands in for satellite-to-satellite variation the models do not
//! carry, so a fit to jittered runs has a non-zero residual and a real bootstrap spread.
//!
//! Synthetic runs are test inputs: a fit that recovers their parameters shows the fit
//! inverts the model, not that the model describes a receiver.

use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

use super::model::{lock_params, simulate_sat, ModelKind};
use super::schema::{Conditions, LoopFixedCfg};
use crate::receiver_trust::{LogEpoch, SatCn0, Timeline};

/// How a synthetic run is sampled.
#[derive(Clone, Debug, PartialEq)]
pub struct SynthSpec {
    /// Satellites and their nominal C/N0 (dB-Hz).
    pub sats: Vec<(String, f64)>,
    /// Epoch spacing (s).
    pub epoch_s: f64,
    /// Time of the last epoch (s).
    pub run_end_s: f64,
    /// Standard deviation of the reported C/N0 noise (dB).
    pub cn0_noise_db: f64,
    /// Standard deviation of a per-satellite shift of both thresholds (dB).
    pub threshold_jitter_db: f64,
    /// Seed of both noise draws.
    pub seed: u64,
}

fn normal(sd: f64) -> Option<Normal<f64>> {
    (sd.is_finite() && sd > 0.0)
        .then(|| Normal::new(0.0, sd).ok())
        .flatten()
}

/// A timeline that the model `kind` with parameters `theta` and level calibration
/// `offset_db` would produce under `cond`.
pub fn synthesize_timeline(
    kind: ModelKind,
    theta: &[f64; 4],
    fixed: &LoopFixedCfg,
    offset_db: f64,
    cond: &Conditions,
    spec: &SynthSpec,
) -> Timeline {
    let mut rng = ChaCha8Rng::seed_from_u64(spec.seed);
    let jit = normal(spec.threshold_jitter_db);
    let noise = normal(spec.cn0_noise_db);
    let base = lock_params(kind, theta, fixed, cond);
    let events: Vec<_> = spec
        .sats
        .iter()
        .map(|(_, nominal)| {
            let mut lp = base;
            if let Some(j) = &jit {
                let d = j.sample(&mut rng);
                lp.drop_cn0_dbhz += d;
                lp.relock_cn0_dbhz += d;
            }
            simulate_sat(cond, *nominal, offset_db, &lp, spec.run_end_s)
        })
        .collect();
    let n = (spec.run_end_s / spec.epoch_s).floor() as usize;
    let mut epochs = Vec::with_capacity(n + 1);
    for k in 0..=n {
        let t = k as f64 * spec.epoch_s;
        let mut cn0 = Vec::new();
        for ((sat, nominal), ev) in spec.sats.iter().zip(&events) {
            let locked = match (ev.loss_s, ev.reacq_s) {
                (None, _) => true,
                (Some(l), None) => t < l,
                (Some(l), Some(r)) => t < l || t >= r,
            };
            if locked {
                let e = noise.as_ref().map_or(0.0, |d| d.sample(&mut rng));
                cn0.push(SatCn0 {
                    sat: sat.clone(),
                    band: "S1C".into(),
                    cn0_dbhz: cond.cn0_at(*nominal, t, offset_db) + e,
                });
            }
        }
        epochs.push(LogEpoch {
            t_s: t,
            cn0,
            ..LogEpoch::default()
        });
    }
    Timeline {
        epochs,
        start_label: None,
        observables: vec!["cn0".into()],
        skipped_records: 0,
    }
}
