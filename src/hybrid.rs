// SPDX-License-Identifier: Apache-2.0
use crate::estimator::HoldoverEstimator;
use crate::inertial::{AccelCfg, AccelModel};
use crate::kalman::KalmanClock;
use crate::models::{ClockModel, ErrorModel};
use crate::run::{PHASE_MEAS_VAR_S2, PROTECTION_K};
use crate::scenario::{ClockCfg, GnssState, GnssTimeline, TimeCfg};
use crate::security::{spoof_detection_score, SPOOF_DETECT_K, SPOOF_MONITOR_S};
use crate::timetransfer::TimeTransferLink;
use crate::types::{ModelSpec, Seconds};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// Optional optical inter-satellite time-transfer clock-aiding during outage.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ResyncCfg {
    pub enabled: bool,
    pub interval_s: f64,
    pub sigma_j_s: f64,
}

/// A hybrid PNT scenario: a clock + an accelerometer per suite, with optional
/// optical ISL time-transfer re-sync of the clock during the outage.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct HybridScenario {
    pub seed: u64,
    pub timing_spec_ns: f64,
    pub position_spec_m: f64,
    pub time: TimeCfg,
    pub gnss: GnssTimeline,
    pub resync: ResyncCfg,
    pub clock_quantum: ClockCfg,
    pub clock_classical: ClockCfg,
    pub accel_quantum: AccelCfg,
    pub accel_classical: AccelCfg,
}

/// One combined PNT sample: timing error (ns) and position error (m).
#[derive(Clone, Debug, Serialize)]
pub struct HybridSample {
    pub t: Seconds,
    pub timing_ns: f64,
    pub position_m: f64,
    pub gnss: GnssState,
}

/// Combined PNT figures of merit. `integrity` and `security` are populated by the
/// run layer (the timing-channel Kalman protection bound and the clock-aided
/// spoof-detection score); the rest are scored from the sample series.
#[derive(Clone, Debug, Serialize)]
pub struct HybridFoM {
    pub timing_holdover_s: f64,
    pub position_holdover_s: f64,
    pub pnt_holdover_s: f64,
    pub timing_p95_ns: f64,
    pub position_p95_m: f64,
    pub pnt_availability: f64,
    pub integrity: Option<f64>,
    pub security: Option<f64>,
}

/// Score combined PNT against a timing spec (ns) and a position spec (m).
pub fn score_hybrid(
    samples: &[HybridSample],
    timing_spec_ns: f64,
    position_spec_m: f64,
) -> HybridFoM {
    let n = samples.len().max(1) as f64;
    let both_in_spec = samples
        .iter()
        .filter(|s| s.timing_ns.abs() <= timing_spec_ns && s.position_m.abs() <= position_spec_m)
        .count();
    let pnt_availability = both_in_spec as f64 / n;

    let outage: Vec<&HybridSample> = samples
        .iter()
        .filter(|s| s.gnss != GnssState::Nominal)
        .collect();
    if outage.is_empty() {
        return HybridFoM {
            timing_holdover_s: 0.0,
            position_holdover_s: 0.0,
            pnt_holdover_s: 0.0,
            timing_p95_ns: 0.0,
            position_p95_m: 0.0,
            pnt_availability,
            integrity: None,
            security: None,
        };
    }
    // Holdover: worst-case (shortest) coast across outage segments, grid-bounded,
    // computed independently for timing, position, and the combined PNT solution.
    use crate::fom::worst_case_holdover;
    let holdover = |breach: &dyn Fn(&HybridSample) -> bool| {
        let segs: Vec<(Seconds, bool, bool)> = samples
            .iter()
            .map(|s| (s.t, s.gnss != GnssState::Nominal, breach(s)))
            .collect();
        worst_case_holdover(&segs)
    };
    let timing_holdover_s = holdover(&|s| s.timing_ns.abs() > timing_spec_ns);
    let position_holdover_s = holdover(&|s| s.position_m.abs() > position_spec_m);
    let pnt_holdover_s =
        holdover(&|s| s.timing_ns.abs() > timing_spec_ns || s.position_m.abs() > position_spec_m);

    let p95 = |mut v: Vec<f64>| {
        v.sort_by(|a, b| a.total_cmp(b));
        let idx = (((v.len().saturating_sub(1)) as f64) * 0.95).round() as usize;
        v.get(idx).copied().unwrap_or(0.0)
    };
    let timing_p95_ns = p95(outage.iter().map(|s| s.timing_ns.abs()).collect());
    let position_p95_m = p95(outage.iter().map(|s| s.position_m.abs()).collect());

    HybridFoM {
        timing_holdover_s,
        position_holdover_s,
        pnt_holdover_s,
        timing_p95_ns,
        position_p95_m,
        pnt_availability,
        integrity: None,
        security: None,
    }
}

/// One suite's run (a clock + an accelerometer, with optional ISL re-sync).
#[derive(Clone, Debug, Serialize)]
pub struct SuiteRun {
    pub clock_spec: ModelSpec,
    pub accel_spec: ModelSpec,
    pub series: Vec<HybridSample>,
    pub fom: HybridFoM,
}

fn run_suite(
    scn: &HybridScenario,
    clock_cfg: &ClockCfg,
    accel_cfg: &AccelCfg,
    seed: u64,
) -> SuiteRun {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut clock = ClockModel::new(
        &clock_cfg.id,
        &clock_cfg.provenance,
        clock_cfg.y0,
        clock_cfg.q_wf,
        clock_cfg.q_rw,
    )
    .with_drift(clock_cfg.drift)
    .with_flicker(clock_cfg.flicker_floor);
    let mut est = HoldoverEstimator::new();
    let mut accel = AccelModel::new(
        &accel_cfg.id,
        &accel_cfg.provenance,
        accel_cfg.bias,
        accel_cfg.q_va,
    )
    .with_gyro(accel_cfg.gyro_bias, accel_cfg.q_arw)
    // Previously dropped here: the hybrid suite built the accelerometer without
    // its acceleration-random-walk and bias-instability terms, so two of the four
    // IMU noise terms were silently ignored (the standalone inertial pack applies
    // all four). Chain them so the hybrid run uses the same error budget.
    .with_accel_random_walk(accel_cfg.q_aa)
    .with_bias_instability(accel_cfg.bias_instability);
    let link = if scn.resync.enabled {
        Some(TimeTransferLink::new(
            "optical-isl",
            "time-transfer clock-aiding",
            scn.resync.sigma_j_s,
        ))
    } else {
        None
    };
    // Kalman timing estimator running alongside, disciplined to truth while GNSS is
    // nominal and re-anchored (more loosely) at each optical re-sync; its 1-sigma
    // bound is the timing-integrity protection level during the outage.
    let mut kf = KalmanClock::new(clock_cfg.q_wf, clock_cfg.q_rw, PHASE_MEAS_VAR_S2);
    let resync_var = scn.resync.sigma_j_s * scn.resync.sigma_j_s;

    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let mut series = Vec::with_capacity(n + 1);
    let mut last_resync = 0.0;
    let (mut outage_timing, mut contained) = (0u64, 0u64);

    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 {
            clock.step(dt, &mut rng);
            accel.step(dt, &mut rng);
            kf.predict(dt);
        }
        let gnss = scn.gnss.state_at(t);
        let (timing_ns, position_m) = match gnss {
            GnssState::Nominal => {
                est.timing_error(
                    t,
                    clock.phase(),
                    clock.det_freq(),
                    clock.drift_rate(),
                    GnssState::Nominal,
                );
                accel.reset();
                last_resync = t;
                kf.update_with_r(0.0, PHASE_MEAS_VAR_S2);
                (0.0, 0.0)
            }
            _ => {
                let mut did_resync = false;
                let jitter = if let Some(link) = &link {
                    if t - last_resync >= scn.resync.interval_s {
                        // optical ISL re-sync: re-anchor the clock prediction to truth.
                        est.timing_error(
                            t,
                            clock.phase(),
                            clock.det_freq(),
                            clock.drift_rate(),
                            GnssState::Nominal,
                        );
                        last_resync = t;
                        did_resync = true;
                    }
                    // residual link measurement uncertainty, fresh (zero-mean) each step
                    link.sample(&mut rng)
                } else {
                    0.0
                };
                let timing_s =
                    est.timing_error(t, clock.phase(), clock.det_freq(), clock.drift_rate(), gnss)
                        + jitter;
                if did_resync {
                    // Re-anchor the filter at the (noisier) link uncertainty.
                    kf.update_with_r(0.0, resync_var);
                }
                outage_timing += 1;
                // The delivered timing solution carries the link's fresh per-step
                // jitter on top of the clock estimate, so the protection bound is
                // the filter variance plus that measurement-noise floor.
                let floor = if scn.resync.enabled { resync_var } else { 0.0 };
                let bound = PROTECTION_K * (kf.phase_var() + floor).sqrt();
                if timing_s.abs() <= bound {
                    contained += 1;
                }
                (timing_s * 1e9, accel.pos())
            }
        };
        series.push(HybridSample {
            t,
            timing_ns,
            position_m,
            gnss,
        });
    }
    let mut fom = score_hybrid(&series, scn.timing_spec_ns, scn.position_spec_m);
    if outage_timing > 0 {
        fom.integrity = Some(contained as f64 / outage_timing as f64);
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

#[derive(Clone, Debug, Serialize)]
pub struct HybridResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub timing_spec_ns: f64,
    pub position_spec_m: f64,
    pub quantum: SuiteRun,
    pub classical: SuiteRun,
}

fn hash_hybrid(scn: &HybridScenario) -> String {
    let c = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

/// Run the hybrid PNT scenario for the all-quantum and all-classical suites.
pub fn run_hybrid(scn: &HybridScenario) -> HybridResult {
    HybridResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_hybrid(scn),
        seed: scn.seed,
        timing_spec_ns: scn.timing_spec_ns,
        position_spec_m: scn.position_spec_m,
        quantum: run_suite(scn, &scn.clock_quantum, &scn.accel_quantum, scn.seed),
        classical: run_suite(
            scn,
            &scn.clock_classical,
            &scn.accel_classical,
            scn.seed.wrapping_add(0x9e3779b97f4a7c15),
        ),
    }
}

/// SVG: per-suite PNT spec utilization = max(|timing|/timing_spec, |position|/position_spec).
/// The dashed line at 1.0 is the spec; above it = PNT failed.
pub fn to_svg(result: &HybridResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (80.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let util = |s: &HybridSample| {
        (s.timing_ns.abs() / result.timing_spec_ns).max(s.position_m.abs() / result.position_spec_m)
    };
    let c = &result.classical.series;
    let q = &result.quantum.series;
    let t_max = c.iter().map(|s| s.t).fold(1.0_f64, f64::max);
    let y_max = 3.0_f64; // cap at 300% of spec so the spec line stays visible
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |u: f64| mt + ph - (u.min(y_max) / y_max) * ph;
    let points = |series: &[HybridSample]| {
        series
            .iter()
            .map(|s| format!("{:.1},{:.1}", xof(s.t), yof(util(s))))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let thr_y = yof(1.0);
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Hybrid PNT spec utilization during GNSS outage (1.0 = spec)</text>", ml));
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "spec utilization",
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{thr_y:.1}\" x2=\"{:.0}\" y2=\"{thr_y:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"6 4\"/>", ml + pw));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#e5645a\">spec (1.0)</text>",
        ml + 4.0,
        thr_y - 4.0
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#d2925e\" stroke-width=\"2\" points=\"{}\"/>",
        points(c)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#e0bd84\" stroke-width=\"2\" points=\"{}\"/>",
        points(q)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#d2925e\">classical suite</text>",
        ml + 10.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#e0bd84\">quantum suite</text>",
        ml + 10.0
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::GnssState::Denied;

    #[test]
    fn hand_derived_hybrid_scores() {
        let s = |t: f64, tn: f64, pm: f64| HybridSample {
            t,
            timing_ns: tn,
            position_m: pm,
            gnss: Denied,
        };
        // timing_spec=20 ns, position_spec=100 m.
        let samples = vec![s(0.0, 0.0, 0.0), s(1.0, 10.0, 150.0), s(2.0, 30.0, 200.0)];
        let f = score_hybrid(&samples, 20.0, 100.0);
        assert_eq!(f.position_holdover_s, 1.0); // position breaches first at t=1 (150>100)
        assert_eq!(f.timing_holdover_s, 2.0); // timing breaches at t=2 (30>20)
        assert_eq!(f.pnt_holdover_s, 1.0); // either: position at t=1
        assert!((f.pnt_availability - 1.0 / 3.0).abs() < 1e-9); // only t=0 has both in spec
        assert_eq!(f.timing_p95_ns, 30.0);
        assert_eq!(f.position_p95_m, 200.0);
        assert!(f.integrity.is_none() && f.security.is_none());
    }

    #[test]
    fn run_populates_integrity_and_security() {
        let scn: HybridScenario =
            toml::from_str(include_str!("../scenarios/hybrid-pnt.toml")).expect("scenario parses");
        let r = run_hybrid(&scn);
        for suite in [&r.quantum, &r.classical] {
            let integ = suite.fom.integrity.expect("integrity populated");
            let sec = suite.fom.security.expect("security populated");
            // The protection bound (filter variance + link-jitter floor) must
            // contain the delivered timing error on the large majority of samples,
            // for the link-aided quantum suite as well as the classical one.
            assert!((0.9..=1.0).contains(&integ), "integrity {integ}");
            assert!((0.0..=1.0).contains(&sec), "security {sec}");
        }
        // The quieter quantum clock has at least as high a spoof-detection score.
        assert!(r.quantum.fom.security.unwrap() >= r.classical.fom.security.unwrap());
    }

    #[test]
    fn hybrid_applies_accel_random_walk_and_bias_instability() {
        // Regression: run_suite used to drop q_aa and bias_instability, so the
        // hybrid accelerometer ignored two of its four IMU noise terms. A run with
        // those terms set must now differ from one without them.
        let mut without: HybridScenario =
            toml::from_str(include_str!("../scenarios/hybrid-pnt.toml")).unwrap();
        without.accel_quantum.q_aa = 0.0;
        without.accel_quantum.bias_instability = 0.0;

        let mut with: HybridScenario =
            toml::from_str(include_str!("../scenarios/hybrid-pnt.toml")).unwrap();
        with.accel_quantum.q_aa = 1e-9;
        with.accel_quantum.bias_instability = 1e-4;

        let p_without = run_hybrid(&without).quantum.fom.position_p95_m;
        let p_with = run_hybrid(&with).quantum.fom.position_p95_m;
        assert!(
            (p_with - p_without).abs() > 1e-9,
            "accel random-walk and bias-instability must change the hybrid position FoM \
             (with {p_with}, without {p_without})"
        );
    }
}
