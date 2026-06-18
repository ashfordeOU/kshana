// SPDX-License-Identifier: AGPL-3.0-only
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

impl InertialCrossover {
    /// The canonical inertial crossover used in the paper, fully reproducible from
    /// this fixed configuration. A cold-atom-interferometer accelerometer triad of
    /// Exail/Templier class (Templier et al., *Sci. Adv.* 2022, arXiv:2209.13209 —
    /// post-calibration residual bias 5.88e-7 m/s²; here the noise is *derived* from
    /// the interferometer physics rather than the datasheet) is compared against a
    /// navigation-grade quartz unit (Honeywell QA-2000 class; Groves 2013) over GNSS
    /// outages from 30 s to 30 min, with the platform vibration PSD swept from an
    /// isolated optical bench (~1 µg/√Hz) to a moving vehicle (~3 mg/√Hz).
    pub fn paper_inertial() -> Self {
        // PSD ((m/s²)²/Hz) from an ASD in µg/√Hz: S_a = (u·g0·1e-6)².
        let g0 = 9.806_65_f64;
        let psd_from_ug = |u: f64| {
            let a = u * g0 * 1e-6;
            a * a
        };
        // Log-spaced 1 → 3000 µg/√Hz (isolated bench → moving vehicle), 9 points.
        let vibration_psds = (0..9)
            .map(|i| {
                let u = 10f64.powf((i as f64) / 8.0 * (3000f64).log10());
                psd_from_ug(u)
            })
            .collect();
        InertialCrossover {
            nominal_s: 120.0,
            outages_s: vec![30.0, 60.0, 120.0, 300.0, 600.0, 1200.0, 1800.0],
            vibration_psds,
            cai: CaiPhysics {
                wavelength_m: crate::inertial::quantum_imu::RB87_D2_WAVELENGTH_M,
                pulse_sep_t: 0.02, // 20 ms — a mobile cold-atom interrogation
                atom_number: 1.0e6,
                contrast: 0.5,
                cycle_time_s: 0.5,
            },
            quantum_bias: 5.88e-7,
            quantum_id: "cold-atom-cai".into(),
            quantum_provenance: "Exail/Templier-class cold-atom accelerometer triad; \
                bias 5.88e-7 m/s² (Templier et al., Sci. Adv. 2022); noise derived from \
                interferometer physics; laboratory maturity, not deployed"
                .into(),
            classical: ClassicalImu {
                id: "nav-grade-quartz".into(),
                provenance: "Navigation-grade quartz (Honeywell QA-2000 / Groves 2013): \
                    bias 1.57e-3 m/s², noise ~20 µg/√Hz, bias instability ~1 µg"
                    .into(),
                bias: 1.57e-3,
                q_va: 3.8416e-8,
                bias_instability: 1.0e-5,
                q_aa: 1.0e-13,
            },
            step_s: 2.0,
            runs: 64,
            seed: 42,
            threshold_m: 100.0,
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

// ---------------------------------------------------------------------------
// Clock lever: holdover time across clock technologies, with TRL labels.
//
// Unlike the inertial lever there is no winner-flip — an optical-lattice clock
// dominates a CSAC on stability — so the honest, decision-relevant result is the
// *holdover time to a timing threshold* for each technology, with a confidence
// interval, and an explicit **technology-readiness label**: the optical clock is a
// ground-laboratory figure, not flown, so it is shown alongside a flight-qualified
// maser and the deployed CSAC/OCXO it would actually replace. This directly answers
// the "lab-ceiling-vs-deployed-floor" objection: the advantage is real but its
// maturity is stated, and a same-TRL (deployed) pair is included.
// ---------------------------------------------------------------------------

/// One clock technology, with a technology-readiness label.
#[derive(Clone, Debug, Serialize)]
pub struct ClockSpec {
    pub id: String,
    pub provenance: String,
    /// `flight-qualified` | `deployed` | `ground-lab`.
    pub trl: String,
    /// Post-sync residual fractional-frequency offset.
    pub y0: f64,
    /// White-FM PSD `q_wf = σ_y(1 s)²`.
    pub q_wf: f64,
    /// Random-walk-FM PSD.
    pub q_rw: f64,
    /// Linear aging / drift (per second).
    pub drift: f64,
    /// Flicker-FM Allan floor (0 = none).
    pub flicker_floor: f64,
}

/// A clock holdover study: timing error vs holdover duration for several clock
/// technologies, each a Monte-Carlo ensemble, plus the holdover time to threshold.
#[derive(Clone, Debug, Serialize)]
pub struct ClockHoldover {
    pub clocks: Vec<ClockSpec>,
    /// Holdover-duration axis (s).
    pub holdovers_s: Vec<f64>,
    /// Timing-error budget (ns) whose first crossing is the holdover time.
    pub threshold_ns: f64,
    /// GNSS-sync window before the holdover (s).
    pub sync_s: f64,
    pub step_s: f64,
    pub runs: usize,
    pub seed: u64,
}

#[derive(Clone, Copy, Debug, Serialize)]
pub struct ClockCurvePoint {
    pub holdover_s: f64,
    pub timing_p95_ns: MetricStat,
}

#[derive(Clone, Debug, Serialize)]
pub struct ClockCurve {
    pub id: String,
    pub provenance: String,
    pub trl: String,
    pub points: Vec<ClockCurvePoint>,
    /// Holdover (s) at which the p95 timing error first exceeds the threshold,
    /// log-interpolated; `+∞` if it stays under threshold across the whole range.
    pub time_to_threshold_s: f64,
}

#[derive(Clone, Debug, Serialize)]
pub struct ClockHoldoverResult {
    pub schema_version: String,
    pub engine_version: String,
    pub metric: String,
    pub threshold_ns: f64,
    pub holdovers_s: Vec<f64>,
    pub curves: Vec<ClockCurve>,
}

impl ClockHoldover {
    fn scenario(&self, clock: &ClockSpec, holdover_s: f64, seed: u64) -> crate::scenario::Scenario {
        let cfg = |c: &ClockSpec| crate::scenario::ClockCfg {
            id: c.id.clone(),
            provenance: c.provenance.clone(),
            y0: c.y0,
            q_wf: c.q_wf,
            q_rw: c.q_rw,
            drift: c.drift,
            flicker_floor: c.flicker_floor,
        };
        crate::scenario::Scenario {
            seed,
            threshold_ns: self.threshold_ns,
            runs: 1, // the study ensembles externally over seeds
            time: TimeCfg {
                step_s: self.step_s,
                duration_s: self.sync_s + holdover_s,
            },
            gnss: GnssTimeline {
                windows: vec![
                    GnssWindow {
                        t0: 0.0,
                        t1: self.sync_s,
                        state: GnssState::Nominal,
                    },
                    GnssWindow {
                        t0: self.sync_s,
                        t1: self.sync_s + holdover_s,
                        state: GnssState::Denied,
                    },
                ],
            },
            // The clock under test occupies the `quantum` slot we read; the
            // `classical` slot is a copy (ignored) so one run yields its curve.
            clock_quantum: cfg(clock),
            clock_classical: cfg(clock),
        }
    }

    /// Run the study: each clock's timing-error curve (ensembled) and its holdover
    /// time to the threshold.
    pub fn run(&self) -> ClockHoldoverResult {
        let golden = 0x9e37_79b9_7f4a_7c15_u64;
        let curves = self
            .clocks
            .iter()
            .map(|clock| {
                let points: Vec<ClockCurvePoint> = self
                    .holdovers_s
                    .iter()
                    .enumerate()
                    .map(|(hi, &h)| {
                        let mut vals = Vec::with_capacity(self.runs.max(2));
                        for k in 0..self.runs.max(2) {
                            let seed = self.seed.wrapping_add((k as u64).wrapping_mul(golden));
                            let r = crate::run::run(&self.scenario(clock, h, seed));
                            vals.push(r.quantum.fom.timing_p95_ns);
                        }
                        let boot = self.seed ^ (hi as u64).wrapping_mul(0x100_0001);
                        ClockCurvePoint {
                            holdover_s: h,
                            timing_p95_ns: crate::inertial::metric_stat(&vals, boot),
                        }
                    })
                    .collect();
                let ttt = time_to_threshold(
                    &points
                        .iter()
                        .map(|p| (p.holdover_s, p.timing_p95_ns.mean))
                        .collect::<Vec<_>>(),
                    self.threshold_ns,
                );
                ClockCurve {
                    id: clock.id.clone(),
                    provenance: clock.provenance.clone(),
                    trl: clock.trl.clone(),
                    points,
                    time_to_threshold_s: ttt,
                }
            })
            .collect();
        ClockHoldoverResult {
            schema_version: "0.1".into(),
            engine_version: env!("CARGO_PKG_VERSION").into(),
            metric: "timing_p95_ns".into(),
            threshold_ns: self.threshold_ns,
            holdovers_s: self.holdovers_s.clone(),
            curves,
        }
    }

    /// The canonical clock holdover study used in the paper: a three-rung
    /// technology-readiness ladder — a ground-laboratory strontium optical-lattice
    /// clock, a flight-qualified active hydrogen maser (ACES/PHARAO class, actually
    /// flown on the ISS), and the deployed CSAC it would replace. The ladder is the
    /// point: it shows the optical clock's margin is a *laboratory* figure while the
    /// already-flown maser is the realistic option. Holdover to a 1 µs budget.
    pub fn paper_clocks() -> Self {
        ClockHoldover {
            clocks: vec![
                ClockSpec {
                    id: "optical-sr-lattice".into(),
                    provenance: "Strontium optical-lattice clock, space-oriented goal \
                        σ_y(1s)=1e-15 (Origlia et al. 2015, arXiv:1503.08457); ground-lab"
                        .into(),
                    trl: "ground-lab".into(),
                    y0: 1.0e-15,
                    q_wf: 1.0e-30,
                    q_rw: 0.0,
                    drift: 0.0,
                    flicker_floor: 1.0e-17,
                },
                ClockSpec {
                    id: "h-maser-aces".into(),
                    provenance: "Active hydrogen maser, ACES/PHARAO class on ISS \
                        σ_y(1s)≈1.5e-13; flight-qualified"
                        .into(),
                    trl: "flight-qualified".into(),
                    y0: 1.5e-13,
                    q_wf: 2.25e-26,
                    q_rw: 0.0,
                    drift: 0.0,
                    flicker_floor: 1.0e-15,
                },
                ClockSpec {
                    id: "csac-sa45s".into(),
                    provenance: "Microchip SA.45s chip-scale atomic clock \
                        σ_y(1s)=3e-10; deployed"
                        .into(),
                    trl: "deployed".into(),
                    y0: 3.0e-10,
                    q_wf: 9.0e-20,
                    q_rw: 0.0,
                    drift: 0.0,
                    flicker_floor: 3.0e-11,
                },
            ],
            holdovers_s: vec![
                60.0, 120.0, 300.0, 600.0, 1200.0, 3600.0, 7200.0, 21600.0, 43200.0, 86400.0,
            ],
            threshold_ns: 1000.0, // 1 µs
            sync_s: 600.0,
            step_s: 10.0,
            runs: 32,
            seed: 42,
        }
    }
}

/// First holdover at which `points` (`(holdover, error)`, ascending holdover) cross
/// `threshold`, linearly interpolated; `+∞` if it never crosses.
pub fn time_to_threshold(points: &[(f64, f64)], threshold: f64) -> f64 {
    for w in points.windows(2) {
        let (t0, e0) = w[0];
        let (t1, e1) = w[1];
        if e0 < threshold && e1 >= threshold {
            let frac = (threshold - e0) / (e1 - e0);
            return t0 + frac * (t1 - t0);
        }
    }
    if points
        .first()
        .map(|&(_, e)| e >= threshold)
        .unwrap_or(false)
    {
        return points[0].0;
    }
    f64::INFINITY
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

    fn small_clocks() -> ClockHoldover {
        ClockHoldover {
            clocks: vec![
                ClockSpec {
                    id: "optical".into(),
                    provenance: "Sr lattice".into(),
                    trl: "ground-lab".into(),
                    y0: 1.0e-15,
                    q_wf: 1.0e-30,
                    q_rw: 0.0,
                    drift: 0.0,
                    flicker_floor: 1.0e-17,
                },
                ClockSpec {
                    id: "csac".into(),
                    provenance: "SA.45s".into(),
                    trl: "deployed".into(),
                    y0: 3.0e-10,
                    q_wf: 9.0e-20,
                    q_rw: 0.0,
                    drift: 0.0,
                    flicker_floor: 3.0e-11,
                },
            ],
            holdovers_s: vec![60.0, 600.0, 3600.0],
            threshold_ns: 1000.0,
            sync_s: 120.0,
            step_s: 10.0,
            runs: 8,
            seed: 42,
        }
    }

    #[test]
    fn time_to_threshold_interpolates() {
        let pts = [(0.0, 1.0), (100.0, 5.0), (200.0, 15.0)];
        // crosses 10 between (100, 5) and (200, 15): frac=(10-5)/(15-5)=0.5 → 150.
        assert!((time_to_threshold(&pts, 10.0) - 150.0).abs() < 1e-9);
        assert!(time_to_threshold(&pts, 100.0).is_infinite());
        assert_eq!(time_to_threshold(&[(0.0, 50.0), (100.0, 80.0)], 10.0), 0.0);
    }

    #[test]
    fn clock_optical_is_quieter_than_csac_and_carries_trl() {
        let r = small_clocks().run();
        let curve = |id: &str| r.curves.iter().find(|c| c.id == id).unwrap();
        let last = small_clocks().holdovers_s.len() - 1;
        let opt = curve("optical").points[last].timing_p95_ns.mean;
        let csac = curve("csac").points[last].timing_p95_ns.mean;
        // The 1e-15 optical clock accumulates far less timing error than the 3e-10
        // CSAC over the same holdover (the holdover is frequency-calibrated, so this
        // is noise/flicker-limited — the optical floor is ~10⁴× lower).
        assert!(
            opt > 0.0 && csac > opt,
            "optical {opt} ns should beat csac {csac} ns"
        );
        // Every curve carries a non-empty technology-readiness label.
        assert!(r.curves.iter().all(|c| !c.trl.is_empty()));
        // The paper study is a three-rung TRL ladder (ground-lab / flight-qualified
        // / deployed) so it is not exclusively a lab-ceiling-vs-deployed-floor pair.
        let p = ClockHoldover::paper_clocks();
        let mut trls: Vec<&str> = p.clocks.iter().map(|c| c.trl.as_str()).collect();
        trls.sort();
        trls.dedup();
        assert_eq!(trls, vec!["deployed", "flight-qualified", "ground-lab"]);
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
    fn paper_inertial_study_has_the_expected_shape_and_trend() {
        let s = InertialCrossover::paper_inertial();
        let r = s.run();
        assert_eq!(r.nodes.len(), s.outages_s.len() * s.vibration_psds.len());
        assert_eq!(r.breakeven.len(), s.outages_s.len());
        let nv = s.vibration_psds.len();
        // On an isolated bench (lowest PSD) the cold-atom advantage is large for
        // every outage, and it falls monotonically to the noisiest platform.
        for i in 0..s.outages_s.len() {
            let quiet = r.nodes[i * nv].advantage;
            let noisy = r.nodes[i * nv + nv - 1].advantage;
            assert!(
                quiet > 10.0,
                "isolated-bench advantage should be large: {quiet}"
            );
            assert!(noisy < quiet, "advantage must fall with vibration");
        }
        // A genuine crossover exists for every outage within the swept platform
        // range, and the break-even vibration RISES monotonically with outage
        // duration — the cold-atom's bias advantage (∝ t²) tolerates more platform
        // vibration the longer the outage. This monotone contour is the result.
        let bes: Vec<f64> = r.breakeven.iter().map(|b| b.psd_at_breakeven).collect();
        for b in &bes {
            assert!(
                b.is_finite() && *b > 0.0,
                "break-even should be finite in range: {b}"
            );
        }
        for w in bes.windows(2) {
            assert!(
                w[1] > w[0],
                "break-even must rise with outage duration: {:?}",
                w
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
