// SPDX-License-Identifier: Apache-2.0
//! Quantum-versus-classical resilience **crossover** study.
//!
//! The packs answer "what is the figure of merit for *this* sensor in *this*
//! scenario". This module answers the question a decision-maker actually asks:
//! **across the realistic published-parameter envelope, *where* does a quantum
//! sensor change the GNSS-outage outcome, and where is the break-even against its
//! classical counterpart?** It runs the validated dead-reckoning pack
//! ([`crate::inertial::run_inertial`]) over a grid of (outage duration × platform
//! vibration PSD), each node a Monte-Carlo ensemble, and reports the advantage
//! *with a 95 % bootstrap confidence interval* plus the break-even contour.
//!
//! It introduces no new physics and no new validation claim: the per-node numbers
//! come from the NaveGo-cross-validated inertial model, the cold-atom noise from
//! the first-principles interferometer model ([`crate::inertial::quantum_imu`]),
//! and the confidence intervals from the same bootstrap the ensemble packs use.
//! The contribution is the reproducible *analysis* — the crossover map itself.
//!
//! Why this map is non-trivial: the cold-atom advantage is **bias-driven** (a tiny
//! post-calibration residual bias makes its ½·b·t² term negligible), so it grows
//! with outage duration; platform vibration degrades only its *random-walk* term
//! (`derived_q_va` folds the vibration floor in quadrature). The two effects pull
//! in opposite directions, so the winner depends on the operating point — exactly
//! what the map exposes.

use crate::inertial::{AccelCfg, CaiCfg, InertialScenario, MetricStat};
use crate::scenario::{GnssState, GnssTimeline, GnssWindow, TimeCfg};
use serde::Serialize;

/// Fixed cold-atom-interferometer physics for the quantum accelerometer. The
/// platform vibration PSD is *not* here — it is the swept axis.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct CaiPhysics {
    pub wavelength_m: f64,
    /// Pulse separation `T` (s).
    pub pulse_sep_t: f64,
    /// Detected atom number `N` per shot.
    pub atom_number: f64,
    /// Initial fringe contrast `C0` ∈ (0, 1].
    pub contrast: f64,
    /// Measurement cycle time `T_c` (s).
    pub cycle_time_s: f64,
}

/// The classical (navigation-grade) accelerometer baseline.
#[derive(Clone, Debug, Serialize)]
pub struct ClassicalImu {
    pub id: String,
    pub provenance: String,
    pub bias: f64,
    pub q_va: f64,
    pub bias_instability: f64,
    pub q_aa: f64,
}

/// An inertial dead-reckoning crossover study: a grid over outage duration ×
/// platform vibration PSD, each node a Monte-Carlo ensemble.
#[derive(Clone, Debug, Serialize)]
pub struct InertialCrossover {
    /// GNSS-available calibration window before the outage (s).
    pub nominal_s: f64,
    /// Outage-duration axis (s).
    pub outages_s: Vec<f64>,
    /// Platform vibration PSD axis `S_a` ((m/s²)²/Hz) along the sensitive axis.
    pub vibration_psds: Vec<f64>,
    /// Cold-atom interferometer physics (the quantum sensor).
    pub cai: CaiPhysics,
    /// Cold-atom post-calibration residual bias (m/s²).
    pub quantum_bias: f64,
    pub quantum_id: String,
    pub quantum_provenance: String,
    /// The navigation-grade baseline.
    pub classical: ClassicalImu,
    /// Integration step (s).
    pub step_s: f64,
    /// Monte-Carlo seeds per node (≥ 2 for a confidence interval).
    pub runs: usize,
    pub seed: u64,
    /// Error-budget threshold (m) for holdover scoring.
    pub threshold_m: f64,
}

/// One grid node: the operating point and the dead-reckoning p95 position error
/// (with 95 % CI) for each sensor, plus the advantage factor.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct CrossoverNode {
    pub outage_s: f64,
    pub vibration_psd: f64,
    pub quantum_p95_m: MetricStat,
    pub classical_p95_m: MetricStat,
    /// `classical.mean / quantum.mean`: > 1 ⇒ the cold-atom unit is better.
    pub advantage: f64,
}

/// The break-even for one outage duration: the vibration PSD at which the
/// cold-atom advantage crosses unity (the nav-grade unit matches it).
#[derive(Clone, Copy, Debug, Serialize)]
pub struct BreakEven {
    pub outage_s: f64,
    /// Vibration PSD at advantage = 1, log-interpolated. `+∞` if the cold-atom
    /// stays ahead across the whole swept range; `0` if it never leads.
    pub psd_at_breakeven: f64,
}

/// The crossover study result: schema-versioned and fully reproducible from the
/// config (the per-node ensembles and bootstrap are fixed-seed).
#[derive(Clone, Debug, Serialize)]
pub struct CrossoverResult {
    pub schema_version: String,
    pub engine_version: String,
    pub metric: String,
    pub outages_s: Vec<f64>,
    pub vibration_psds: Vec<f64>,
    /// Row-major: outage outer, vibration inner.
    pub nodes: Vec<CrossoverNode>,
    pub breakeven: Vec<BreakEven>,
}

impl InertialCrossover {
    /// Build the dead-reckoning scenario for one operating point: a GNSS-available
    /// calibration window, then a denied outage, with the cold-atom sensor driven
    /// by CAI physics at this vibration PSD and the nav-grade baseline alongside.
    fn node_scenario(&self, outage_s: f64, vib_psd: f64) -> InertialScenario {
        let quantum = AccelCfg {
            id: self.quantum_id.clone(),
            provenance: self.quantum_provenance.clone(),
            bias: self.quantum_bias,
            q_va: 0.0, // ignored: derived from the cai block below
            gyro_bias: 0.0,
            q_arw: 0.0,
            q_aa: 0.0,
            bias_instability: 0.0,
            cai: Some(CaiCfg {
                wavelength_m: self.cai.wavelength_m,
                pulse_sep_t: self.cai.pulse_sep_t,
                atom_number: self.cai.atom_number,
                contrast: self.cai.contrast,
                cycle_time_s: self.cai.cycle_time_s,
                vibration_psd: vib_psd,
            }),
        };
        let classical = AccelCfg {
            id: self.classical.id.clone(),
            provenance: self.classical.provenance.clone(),
            bias: self.classical.bias,
            q_va: self.classical.q_va,
            gyro_bias: 0.0,
            q_arw: 0.0,
            q_aa: self.classical.q_aa,
            bias_instability: self.classical.bias_instability,
            cai: None,
        };
        InertialScenario {
            seed: self.seed,
            threshold_m: self.threshold_m,
            time: TimeCfg {
                step_s: self.step_s,
                duration_s: self.nominal_s + outage_s,
            },
            gnss: GnssTimeline {
                windows: vec![
                    GnssWindow {
                        t0: 0.0,
                        t1: self.nominal_s,
                        state: GnssState::Nominal,
                    },
                    GnssWindow {
                        t0: self.nominal_s,
                        t1: self.nominal_s + outage_s,
                        state: GnssState::Denied,
                    },
                ],
            },
            accel_quantum: quantum,
            accel_classical: classical,
            runs: self.runs.max(2),
        }
    }

    /// Run the study: every (outage × vibration) node as a Monte-Carlo ensemble,
    /// then the break-even contour.
    pub fn run(&self) -> CrossoverResult {
        let mut nodes = Vec::with_capacity(self.outages_s.len() * self.vibration_psds.len());
        for &outage in &self.outages_s {
            for &psd in &self.vibration_psds {
                let scn = self.node_scenario(outage, psd);
                let r = crate::inertial::run_inertial(&scn);
                let q = ensemble_p95(&r.quantum);
                let c = ensemble_p95(&r.classical);
                let advantage = if q.mean > 0.0 {
                    c.mean / q.mean
                } else {
                    f64::INFINITY
                };
                nodes.push(CrossoverNode {
                    outage_s: outage,
                    vibration_psd: psd,
                    quantum_p95_m: q,
                    classical_p95_m: c,
                    advantage,
                });
            }
        }
        let breakeven = self
            .outages_s
            .iter()
            .enumerate()
            .map(|(i, &outage)| {
                let row: Vec<(f64, f64)> = self
                    .vibration_psds
                    .iter()
                    .enumerate()
                    .map(|(j, &psd)| (psd, nodes[i * self.vibration_psds.len() + j].advantage))
                    .collect();
                BreakEven {
                    outage_s: outage,
                    psd_at_breakeven: breakeven_psd(&row),
                }
            })
            .collect();
        CrossoverResult {
            schema_version: "0.1".into(),
            engine_version: env!("CARGO_PKG_VERSION").into(),
            metric: "pos_p95_m".into(),
            outages_s: self.outages_s.clone(),
            vibration_psds: self.vibration_psds.clone(),
            nodes,
            breakeven,
        }
    }
}

/// The ensemble p95 stat from an [`crate::inertial::AccelRun`] (present because the
/// study always runs `runs ≥ 2`).
fn ensemble_p95(run: &crate::inertial::AccelRun) -> MetricStat {
    run.ensemble
        .map(|e| e.pos_p95_m)
        // Degenerate single-run fallback (study clamps runs ≥ 2, so unreached).
        .unwrap_or(MetricStat {
            mean: run.fom.pos_p95_m,
            std: 0.0,
            p05: run.fom.pos_p95_m,
            p50: run.fom.pos_p95_m,
            p95: run.fom.pos_p95_m,
            ci95_low: run.fom.pos_p95_m,
            ci95_high: run.fom.pos_p95_m,
        })
}

/// Break-even vibration PSD: the PSD at which `advantage` crosses 1, found by
/// log-PSD / linear-advantage interpolation on the first bracketing pair. The
/// advantage decreases monotonically in PSD (more vibration ⇒ more cold-atom
/// noise), so the first crossing is the break-even. Returns `+∞` if the cold-atom
/// leads across the whole range, `0` if it never leads.
///
/// `row` is `(psd, advantage)` in ascending PSD order.
pub fn breakeven_psd(row: &[(f64, f64)]) -> f64 {
    if row.is_empty() {
        return f64::NAN;
    }
    if row.iter().all(|&(_, a)| a >= 1.0) {
        return f64::INFINITY;
    }
    if row.iter().all(|&(_, a)| a < 1.0) {
        return 0.0;
    }
    for w in row.windows(2) {
        let (p0, a0) = w[0];
        let (p1, a1) = w[1];
        if a0 >= 1.0 && a1 < 1.0 {
            // Interpolate in log10(psd) against advantage for the unity crossing.
            let (l0, l1) = (p0.max(1e-300).log10(), p1.max(1e-300).log10());
            let frac = (a0 - 1.0) / (a0 - a1); // a0 ≥ 1 > a1 ⇒ frac ∈ [0, 1]
            return 10f64.powf(l0 + frac * (l1 - l0));
        }
    }
    f64::NAN
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A small but realistic inertial crossover: an Exail-class cold-atom triad vs
    /// a navigation-grade quartz unit, over short outages and a vibration sweep.
    fn study() -> InertialCrossover {
        InertialCrossover {
            nominal_s: 60.0,
            outages_s: vec![120.0, 600.0],
            vibration_psds: vec![1e-10, 1e-8, 1e-6, 1e-4],
            cai: CaiPhysics {
                wavelength_m: crate::inertial::quantum_imu::RB87_D2_WAVELENGTH_M,
                pulse_sep_t: 0.05,
                atom_number: 1e6,
                contrast: 0.5,
                cycle_time_s: 0.5,
            },
            quantum_bias: 5.88e-7,
            quantum_id: "cold-atom".into(),
            quantum_provenance: "Templier et al. 2022 (lab)".into(),
            classical: ClassicalImu {
                id: "nav-grade".into(),
                provenance: "Honeywell QA-2000 / Groves".into(),
                bias: 1.57e-3,
                q_va: 3.8416e-8,
                bias_instability: 1.0e-5,
                q_aa: 1.0e-13,
            },
            step_s: 5.0,
            runs: 16,
            seed: 42,
            threshold_m: 100.0,
        }
    }

    #[test]
    fn breakeven_interpolates_the_unity_crossing() {
        // advantage descending across PSD; crosses 1 between psd=1e-7 (a=2) and
        // psd=1e-6 (a=0.5). frac = (2-1)/(2-0.5)=0.667 in log10 from -7 to -6.
        let row = [(1e-9, 4.0), (1e-7, 2.0), (1e-6, 0.5), (1e-5, 0.2)];
        let be = breakeven_psd(&row);
        let expect = 10f64.powf(-7.0 + (2.0 - 1.0) / (2.0 - 0.5) * (-6.0 - -7.0));
        assert!(
            (be - expect).abs() / expect < 1e-9,
            "be={be} expect={expect}"
        );
        // All-ahead ⇒ +∞; all-behind ⇒ 0.
        assert!(breakeven_psd(&[(1e-9, 3.0), (1e-6, 1.5)]).is_infinite());
        assert_eq!(breakeven_psd(&[(1e-9, 0.9), (1e-6, 0.2)]), 0.0);
    }

    #[test]
    fn study_is_deterministic() {
        let a = study().run();
        let b = study().run();
        assert_eq!(a.nodes.len(), b.nodes.len());
        for (x, y) in a.nodes.iter().zip(&b.nodes) {
            assert_eq!(
                x.advantage.to_bits(),
                y.advantage.to_bits(),
                "node advantage differs"
            );
            assert_eq!(
                x.quantum_p95_m.mean.to_bits(),
                y.quantum_p95_m.mean.to_bits()
            );
        }
    }

    #[test]
    fn advantage_falls_as_platform_vibration_rises() {
        // For a fixed outage, raising the platform vibration PSD raises the
        // cold-atom random-walk noise (its bias advantage is unchanged), so the
        // advantage over the nav-grade unit must shrink from the quietest to the
        // noisiest platform.
        let r = study().run();
        let nv = r.vibration_psds.len();
        for (i, _outage) in r.outages_s.iter().enumerate() {
            let quiet = r.nodes[i * nv].advantage; // lowest PSD
            let noisy = r.nodes[i * nv + nv - 1].advantage; // highest PSD
            assert!(
                noisy < quiet,
                "advantage should fall with vibration: quiet={quiet} noisy={noisy}"
            );
        }
    }
}
