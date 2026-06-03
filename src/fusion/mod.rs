// SPDX-License-Identifier: Apache-2.0
//! Joint Kalman sensor-fusion estimator.
//!
//! The hybrid pack *composes* independent holdover/dead-reckoning predictors; this
//! pack runs a single recursive estimator that **is** the navigation solution. A
//! joint Kalman filter over the clock state `[phase, frequency]` and the position
//! state `[position, velocity]` is disciplined by GNSS while it is available
//! (learning the clock frequency offset and the platform velocity), then coasts
//! through the outage propagating those estimates; optical time transfer can aid
//! the clock block during the gap. The delivered error is the filter's estimate
//! residual against truth, and the filter's joint covariance gives a joint
//! integrity bound.
//!
//! For a static platform the clock-error and position-error states are dynamically
//! independent, so the optimal joint filter is block-diagonal — each block is a
//! two-state Kalman filter ([`KalmanClock`] is reused for both, with `q_va` driving
//! velocity in the position block, whose coast variance `q_va*T^3/3` is exactly the
//! Groves velocity-random-walk position variance). The value over open-loop
//! composition is a single consistent estimator with a joint covariance, and a
//! clean substrate for cross-aiding. Estimating constant sensor biases with an
//! augmented state is future work; this demo uses noise-driven sensors so the
//! filter process noise is consistent with truth.

pub mod gnss_ins_ekf;

use crate::hybrid::{score_hybrid, HybridResult, HybridSample, HybridScenario, SuiteRun};
use crate::inertial::{AccelCfg, AccelModel};
use crate::kalman::KalmanClock;
use crate::models::{ClockModel, ErrorModel};
use crate::run::{PHASE_MEAS_VAR_S2, PROTECTION_K};
use crate::scenario::{ClockCfg, GnssState};
use crate::security::{spoof_detection_score, SPOOF_DETECT_K, SPOOF_MONITOR_S};
use crate::timetransfer::TimeTransferLink;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use sha2::{Digest, Sha256};

/// GNSS position-measurement noise variance (m^2): a ~1 m, 1-sigma fix while
/// nominal, setting the position covariance floor for the filter.
const POS_MEAS_VAR_M2: f64 = 1.0;
/// Initial frequency-offset variance (1/s)^2: the filter starts ignorant of the
/// clock's frequency offset and learns it from GNSS (covers offsets up to ~1e-9).
const INIT_FREQ_VAR: f64 = 1e-18;
/// Initial velocity-error variance (m/s)^2: the filter starts ignorant of the
/// platform velocity error and learns it from GNSS.
const INIT_VEL_VAR: f64 = 1.0;

fn run_fused_suite(
    scn: &HybridScenario,
    clock_cfg: &ClockCfg,
    accel_cfg: &AccelCfg,
    seed: u64,
) -> SuiteRun {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    // Truth sensors (their accumulated error is what the filter estimates).
    let mut clock = ClockModel::new(
        &clock_cfg.id,
        &clock_cfg.provenance,
        clock_cfg.y0,
        clock_cfg.q_wf,
        clock_cfg.q_rw,
    )
    .with_drift(clock_cfg.drift)
    .with_flicker(clock_cfg.flicker_floor);
    let mut accel = AccelModel::new(
        &accel_cfg.id,
        &accel_cfg.provenance,
        accel_cfg.bias,
        accel_cfg.q_va,
    )
    .with_gyro(accel_cfg.gyro_bias, accel_cfg.q_arw)
    .with_accel_random_walk(accel_cfg.q_aa)
    .with_bias_instability(accel_cfg.bias_instability);

    // Joint filter: clock block [phase, freq] and position block [pos, vel].
    let mut clock_kf = KalmanClock::new(clock_cfg.q_wf, clock_cfg.q_rw, PHASE_MEAS_VAR_S2)
        .with_initial_cov(PHASE_MEAS_VAR_S2, INIT_FREQ_VAR);
    let mut pos_kf = KalmanClock::new(0.0, accel_cfg.q_va.max(1e-30), POS_MEAS_VAR_M2)
        .with_initial_cov(POS_MEAS_VAR_M2, INIT_VEL_VAR);
    let link = if scn.resync.enabled {
        Some(TimeTransferLink::new(
            "optical-isl",
            "time-transfer clock-aiding",
            scn.resync.sigma_j_s,
        ))
    } else {
        None
    };
    let resync_var = scn.resync.sigma_j_s * scn.resync.sigma_j_s;

    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let mut series = Vec::with_capacity(n + 1);
    let mut last_resync = 0.0;
    let (mut outage, mut contained) = (0u64, 0u64);

    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 {
            clock.step(dt, &mut rng);
            accel.step(dt, &mut rng);
            clock_kf.predict(dt);
            pos_kf.predict(dt);
        }
        let gnss = scn.gnss.state_at(t);
        // Open-loop truth errors: the clock's accumulated phase and the
        // dead-reckoned position. The filter, not a re-sync, does the correcting.
        let truth_phase = clock.phase();
        let truth_pos = accel.pos();

        match gnss {
            GnssState::Nominal => {
                // GNSS observes the truth time and position directly.
                clock_kf.update(truth_phase);
                pos_kf.update(truth_pos);
                last_resync = t;
            }
            _ => {
                if let Some(link) = &link {
                    if t - last_resync >= scn.resync.interval_s {
                        // Optical ISL: a noisy measurement of the truth time.
                        clock_kf.update_with_r(truth_phase + link.sample(&mut rng), resync_var);
                        last_resync = t;
                    }
                }
                let timing_s = truth_phase - clock_kf.phase_est();
                let position_m = truth_pos - pos_kf.phase_est();
                outage += 1;
                let phase_bound = PROTECTION_K
                    * (clock_kf.phase_var() + if link.is_some() { resync_var } else { 0.0 }).sqrt();
                let pos_bound = PROTECTION_K * pos_kf.phase_sigma();
                if timing_s.abs() <= phase_bound && position_m.abs() <= pos_bound {
                    contained += 1;
                }
            }
        }
        // Delivered solution = filter estimate; reported error = estimate residual.
        let timing_ns = (truth_phase - clock_kf.phase_est()) * 1e9;
        let position_m = truth_pos - pos_kf.phase_est();
        series.push(HybridSample {
            t,
            timing_ns,
            position_m,
            gnss,
        });
    }

    let mut fom = score_hybrid(&series, scn.timing_spec_ns, scn.position_spec_m);
    if outage > 0 {
        fom.integrity = Some(contained as f64 / outage as f64);
    }
    fom.security = Some(spoof_detection_score(
        clock_cfg.q_wf,
        clock_cfg.q_rw,
        PHASE_MEAS_VAR_S2,
        scn.timing_spec_ns,
        SPOOF_MONITOR_S,
        dt,
        SPOOF_DETECT_K,
    ));
    SuiteRun {
        clock_spec: clock.spec(),
        accel_spec: accel.spec(),
        series,
        fom,
    }
}

fn hash_fusion(scn: &HybridScenario) -> String {
    let c = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

/// Run the joint-fusion PNT scenario for the all-quantum and all-classical suites.
pub fn run_fusion(scn: &HybridScenario) -> HybridResult {
    HybridResult {
        schema_version: "0.7".into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_fusion(scn),
        seed: scn.seed,
        timing_spec_ns: scn.timing_spec_ns,
        position_spec_m: scn.position_spec_m,
        quantum: run_fused_suite(scn, &scn.clock_quantum, &scn.accel_quantum, scn.seed),
        classical: run_fused_suite(
            scn,
            &scn.clock_classical,
            &scn.accel_classical,
            scn.seed.wrapping_add(0x9e3779b97f4a7c15),
        ),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scenario() -> HybridScenario {
        toml::from_str(include_str!("../../scenarios/fusion-pnt.toml"))
            .expect("fusion scenario parses")
    }

    #[test]
    fn quantum_suite_holds_pnt_longer() {
        let r = run_fusion(&scenario());
        assert!(r.quantum.fom.pnt_holdover_s >= r.classical.fom.pnt_holdover_s);
        assert!(r.quantum.fom.timing_p95_ns <= r.classical.fom.timing_p95_ns);
    }

    #[test]
    fn joint_integrity_is_populated_and_reliable() {
        // With noise-consistent sensors the joint covariance should contain the
        // actual joint error on the large majority of outage samples.
        let r = run_fusion(&scenario());
        for suite in [&r.quantum, &r.classical] {
            let integ = suite.fom.integrity.expect("joint integrity populated");
            assert!((0.9..=1.0).contains(&integ), "integrity {integ}");
            assert!(suite.fom.security.is_some());
        }
    }

    #[test]
    fn filter_tracks_truth_while_nominal() {
        // During the GNSS-nominal lead-in the filter is disciplined to truth, so
        // the delivered error is essentially zero.
        let r = run_fusion(&scenario());
        let early = &r.quantum.series[1];
        assert!(early.gnss == GnssState::Nominal);
        assert!(early.timing_ns.abs() < 1e-3, "timing {}", early.timing_ns);
        // Position is only resolved to the GNSS noise (~1 m), well inside the spec.
        assert!(
            early.position_m.abs() < 1.0,
            "position {}",
            early.position_m
        );
    }

    #[test]
    fn fusion_is_reproducible() {
        let a = run_fusion(&scenario());
        let b = run_fusion(&scenario());
        assert_eq!(a.quantum.fom.pnt_holdover_s, b.quantum.fom.pnt_holdover_s);
        assert_eq!(a.classical.fom.timing_p95_ns, b.classical.fom.timing_p95_ns);
    }
}
