use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use crate::estimator::HoldoverEstimator;
use crate::fom::{score, Sample};
use crate::models::{ClockModel, ErrorModel};
use crate::report::{ClockRun, RunResult};
use crate::scenario::{ClockCfg, Scenario};

fn run_clock(scn: &Scenario, cfg: &ClockCfg, seed: u64) -> ClockRun {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut clock = ClockModel::new(&cfg.id, &cfg.provenance, cfg.y0, cfg.q_wf, cfg.q_rw)
        .with_drift(cfg.drift);
    let mut est = HoldoverEstimator::new();
    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let mut series = Vec::with_capacity(n + 1);
    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 { clock.step(dt, &mut rng); }
        let gnss = scn.gnss.state_at(t);
        let err_s = est.timing_error(t, clock.phase(), clock.det_freq(), clock.drift_rate(), gnss);
        series.push(Sample { t, error_ns: err_s * 1e9, gnss });
    }
    let fom = score(&series, scn.threshold_ns);
    ClockRun { spec: clock.spec(), series, fom }
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
        classical: run_clock(scn, &scn.clock_classical, scn.seed.wrapping_add(0x9e3779b97f4a7c15)),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::*;

    fn demo() -> Scenario {
        Scenario {
            seed: 7, threshold_ns: 100.0,
            time: TimeCfg { step_s: 10.0, duration_s: 3600.0 },
            gnss: GnssTimeline { windows: vec![
                GnssWindow { t0: 0.0, t1: 600.0, state: GnssState::Nominal },
                GnssWindow { t0: 600.0, t1: 3600.0, state: GnssState::Denied },
            ]},
            clock_quantum:   ClockCfg { id: "optical".into(), provenance: "demo".into(), y0: 1e-13, q_wf: 1e-26, q_rw: 1e-34, drift: 0.0 },
            clock_classical: ClockCfg { id: "csac".into(),    provenance: "demo".into(), y0: 1e-11, q_wf: 1e-24, q_rw: 1e-32, drift: 0.0 },
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
}
