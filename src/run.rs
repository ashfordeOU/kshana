// SPDX-License-Identifier: Apache-2.0
use crate::estimator::HoldoverEstimator;
use crate::fom::{score, Sample};
use crate::kalman::KalmanClock;
use crate::models::{ClockModel, ErrorModel};
use crate::report::{ClockRun, RunResult};
use crate::scenario::{ClockCfg, GnssState, Scenario};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;

/// GNSS-disciplined phase measurement noise (variance, s^2). Represents the
/// timing noise on the truth observation available while GNSS is nominal
/// (~0.1 ns, 1-sigma); it sets the synchronised covariance floor for the filter.
const PHASE_MEAS_VAR_S2: f64 = 1e-20;

/// 3-sigma protection level for the integrity check.
const PROTECTION_K: f64 = 3.0;

fn run_clock(scn: &Scenario, cfg: &ClockCfg, seed: u64) -> ClockRun {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut clock = ClockModel::new(&cfg.id, &cfg.provenance, cfg.y0, cfg.q_wf, cfg.q_rw)
        .with_drift(cfg.drift)
        .with_flicker(cfg.flicker_floor);
    let mut est = HoldoverEstimator::new();
    // Kalman estimator running alongside the analytic predictor: it is disciplined
    // to the truth while GNSS is nominal and coasts open-loop during the outage,
    // where its 1-sigma phase uncertainty is the protection bound. Integrity is the
    // fraction of outage samples whose actual error stays inside the k-sigma bound.
    let mut kf = KalmanClock::new(cfg.q_wf, cfg.q_rw, PHASE_MEAS_VAR_S2);
    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let mut series = Vec::with_capacity(n + 1);
    let (mut outage_samples, mut contained) = (0u64, 0u64);
    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 {
            clock.step(dt, &mut rng);
            kf.predict(dt);
        }
        let gnss = scn.gnss.state_at(t);
        let err_s = est.timing_error(t, clock.phase(), clock.det_freq(), clock.drift_rate(), gnss);
        if gnss == GnssState::Nominal {
            // Truth is observed: the timing error is zero and the filter re-syncs.
            kf.update(0.0);
        } else {
            outage_samples += 1;
            if err_s.abs() <= PROTECTION_K * kf.phase_sigma() {
                contained += 1;
            }
        }
        series.push(Sample {
            t,
            error_ns: err_s * 1e9,
            gnss,
        });
    }
    let mut fom = score(&series, scn.threshold_ns);
    // Integrity: how reliably the filter's protection bound contains the truth.
    if outage_samples > 0 {
        fom.integrity = Some(contained as f64 / outage_samples as f64);
    }
    ClockRun {
        spec: clock.spec(),
        series,
        fom,
    }
}

/// Run the clock-holdover scenario for both clocks and assemble the result.
pub fn run(scn: &Scenario) -> RunResult {
    RunResult {
        schema_version: "0.1".into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: crate::report::hash_scenario(scn),
        seed: scn.seed,
        threshold_ns: scn.threshold_ns,
        quantum: run_clock(scn, &scn.clock_quantum, scn.seed),
        classical: run_clock(
            scn,
            &scn.clock_classical,
            scn.seed.wrapping_add(0x9e3779b97f4a7c15),
        ),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::*;

    fn demo() -> Scenario {
        Scenario {
            seed: 7,
            threshold_ns: 100.0,
            time: TimeCfg {
                step_s: 10.0,
                duration_s: 3600.0,
            },
            gnss: GnssTimeline {
                windows: vec![
                    GnssWindow {
                        t0: 0.0,
                        t1: 600.0,
                        state: GnssState::Nominal,
                    },
                    GnssWindow {
                        t0: 600.0,
                        t1: 3600.0,
                        state: GnssState::Denied,
                    },
                ],
            },
            clock_quantum: ClockCfg {
                id: "optical".into(),
                provenance: "demo".into(),
                y0: 1e-13,
                q_wf: 1e-26,
                q_rw: 1e-34,
                drift: 0.0,
                flicker_floor: 0.0,
            },
            clock_classical: ClockCfg {
                id: "csac".into(),
                provenance: "demo".into(),
                y0: 1e-11,
                q_wf: 1e-24,
                q_rw: 1e-32,
                drift: 0.0,
                flicker_floor: 0.0,
            },
        }
    }

    #[test]
    fn nominal_window_has_zero_error() {
        let r = run(&demo());
        assert_eq!(r.quantum.series[0].error_ns, 0.0);
    }

    #[test]
    fn quantum_outperforms_classical() {
        let r = run(&demo());
        assert!(r.quantum.fom.timing_p95_ns < r.classical.fom.timing_p95_ns);
        assert!(r.quantum.fom.availability >= r.classical.fom.availability);
    }

    #[test]
    fn integrity_is_populated_and_bound_is_reliable() {
        // The Kalman protection bound, whose process noise matches the truth model,
        // should contain the actual error on the overwhelming majority of outage
        // samples (3-sigma => ~99.7% for a well-matched filter).
        let r = run(&demo());
        let qi = r
            .quantum
            .fom
            .integrity
            .expect("quantum integrity populated");
        let ci = r
            .classical
            .fom
            .integrity
            .expect("classical integrity populated");
        assert!(qi >= 0.95, "quantum integrity too low: {qi}");
        assert!(ci >= 0.95, "classical integrity too low: {ci}");
        assert!(qi <= 1.0 && ci <= 1.0);
    }
}
