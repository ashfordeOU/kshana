// SPDX-License-Identifier: AGPL-3.0-only
//! Single-run orchestration: driving a parsed scenario through the estimator and
//! scoring it into a result.
use crate::estimator::HoldoverEstimator;
use crate::fom::{score, Sample};
use crate::kalman::KalmanClock;
use crate::models::{ClockModel, ErrorModel};
use crate::report::{ClockRun, RunResult};
use crate::scenario::{ClockCfg, GnssState, Scenario};
use crate::security::{spoof_detection_score, SPOOF_DETECT_K, SPOOF_MONITOR_S};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;

/// GNSS-disciplined phase measurement noise (variance, s^2). Represents the
/// timing noise on the truth observation available while GNSS is nominal
/// (~0.1 ns, 1-sigma); it sets the synchronised covariance floor for the filter.
pub(crate) const PHASE_MEAS_VAR_S2: f64 = 1e-20;

/// 3-sigma protection level for the integrity check.
pub(crate) const PROTECTION_K: f64 = 3.0;

/// Monte-Carlo ensemble size and length for the filter-health (NIS/NEES) check.
/// `seeds × steps` pooled samples (≈ 12 800) give a tight χ² band while staying
/// well under a millisecond per clock.
const HEALTH_STEPS: usize = 200;
const HEALTH_SEEDS: usize = 64;
/// Decorrelate the health ensemble's seed stream from the scenario's run seed.
const HEALTH_SEED_SALT: u64 = 0x0F11_7E12_8EA1_7777;

pub(crate) fn run_clock(scn: &Scenario, cfg: &ClockCfg, seed: u64) -> ClockRun {
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
    // Raw clock phase over the whole run, for the Allan-deviation curve.
    let mut phase = Vec::with_capacity(n + 1);
    let (mut outage_samples, mut contained) = (0u64, 0u64);
    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 {
            clock.step(dt, &mut rng);
            kf.predict(dt);
        }
        let gnss = scn.gnss.state_at(t);
        let ph = clock.phase();
        phase.push(ph);
        let err_s = est.timing_error(t, ph, clock.det_freq(), clock.drift_rate(), gnss);
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
    // Security: clock-aided spoof-detection score relative to the timing spec.
    fom.security = Some(spoof_detection_score(
        cfg.q_wf,
        cfg.q_rw,
        PHASE_MEAS_VAR_S2,
        scn.threshold_ns,
        SPOOF_MONITOR_S,
        dt,
        SPOOF_DETECT_K,
    ));
    // Filter-consistency health: a Monte-Carlo NIS/NEES check that the deployed
    // Kalman tuning (Q matched to the truth model, q_factor = 1) is self-consistent.
    let filter_health = Some(crate::filter_health::assess(
        crate::filter_health::HealthConfig {
            q_wf: cfg.q_wf,
            q_rw: cfg.q_rw,
            r: PHASE_MEAS_VAR_S2,
            dt,
            steps: HEALTH_STEPS,
            seeds: HEALTH_SEEDS,
            q_factor: 1.0,
            base_seed: seed ^ HEALTH_SEED_SALT,
        },
    ));
    ClockRun {
        spec: clock.spec(),
        series,
        fom,
        adev_curve: crate::allan::overlapping_adev_curve(&phase, dt),
        filter_health,
    }
}

/// Run a clock-holdover scenario whose GNSS availability is derived from orbital
/// geometry. The user orbit, constellation, and elevation mask produce a
/// visibility timeline, which then drives the standard clock-holdover run.
pub fn run_orbit_clock(scn: &crate::orbit::OrbitClockScenario) -> Result<RunResult, String> {
    let user = scn.user.to_orbit();
    let sats = scn.all_satellites()?;
    let timeline = crate::orbit::build_timeline(
        &user,
        &sats,
        scn.time.step_s,
        scn.time.duration_s,
        scn.mask_deg,
    );
    let inner = Scenario {
        seed: scn.seed,
        threshold_ns: scn.threshold_ns,
        runs: 1,
        time: scn.time.clone(),
        gnss: timeline,
        clock_quantum: scn.clock_quantum.clone(),
        clock_classical: scn.clock_classical.clone(),
    };
    let mut result = run(&inner);
    // Emit the propagated user track (km) so the playground can draw the 3D orbit.
    // This is the orbit pack's only extra output; non-orbit runs leave it `None`.
    result.eci_track = Some(sample_eci_track_km(
        &user,
        scn.time.step_s,
        scn.time.duration_s,
    ));
    Ok(result)
}

/// Run the clock-holdover scenario for both clocks and assemble the result.
pub fn run(scn: &Scenario) -> RunResult {
    RunResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
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
        eci_track: None,
        meta: None,
    }
}

/// Cap on the propagated `eci_track` length, so the orbit-pack JSON stays small
/// (one sample per ~2 min over a day ≈ 720 points). The track is decimated to at
/// most this many points by striding the time grid.
const MAX_ECI_TRACK: usize = 720;

/// Sample the user spacecraft's propagated ECI position over the scenario's time
/// grid (`step_s`, `duration_s`), in kilometres, decimated to at most
/// [`MAX_ECI_TRACK`] points. The magnitude of each sample is an independent
/// physical fact (e.g. a GPS orbit is ~26,560 km — IS-GPS-200), so it is a
/// non-circular oracle for the orbit visualisation.
fn sample_eci_track_km(user: &crate::orbit::Orbit, step_s: f64, duration_s: f64) -> Vec<[f64; 3]> {
    let n = (duration_s / step_s).round() as usize;
    // The full grid has n+1 samples (i = 0..=n). Stride by ceil((n+1)/cap) so the
    // decimated track keeps at most MAX_ECI_TRACK points while still spanning the
    // whole grid (the final sample is included explicitly below).
    let stride = (n + 1).div_ceil(MAX_ECI_TRACK).max(1);
    let sample = |i: usize| {
        let p = user.position_eci(i as f64 * step_s);
        [p[0] / 1000.0, p[1] / 1000.0, p[2] / 1000.0]
    };
    let mut track = Vec::new();
    let mut last_i = 0;
    let mut i = 0;
    while i <= n {
        track.push(sample(i));
        last_i = i;
        i += stride;
    }
    // Always include the final grid sample so the track spans the whole run, even
    // when n is not a multiple of the stride.
    if last_i != n {
        track.push(sample(n));
    }
    track
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::*;

    fn demo() -> Scenario {
        Scenario {
            seed: 7,
            threshold_ns: 100.0,
            runs: 1,
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

    #[test]
    fn security_is_populated_and_quantum_leads() {
        // Both clocks report a spoof-detection score; the quieter quantum clock
        // has a tighter detection floor and so scores at least as high.
        let r = run(&demo());
        let qs = r.quantum.fom.security.expect("quantum security populated");
        let cs = r
            .classical
            .fom
            .security
            .expect("classical security populated");
        assert!((0.0..=1.0).contains(&qs) && (0.0..=1.0).contains(&cs));
        assert!(qs >= cs, "quantum security {qs} < classical {cs}");
    }

    // An orbit scenario whose user spacecraft sits at the GPS orbital radius:
    // semi-major axis 26,559.7 km (IS-GPS-200 nominal) → altitude above the mean
    // Earth radius (6371 km) of 20,188.7 km. The constellation is irrelevant to
    // the user track, so a small synthetic Walker pattern keeps the test fast.
    const ORBIT_GPS_USER: &str = r#"
kind = "orbit"
seed = 7
threshold_ns = 10.0
mask_deg = 5.0

[time]
step_s = 120.0
duration_s = 43200.0

[user]
altitude_km = 20188.7
inclination_deg = 55.0
u0_deg = 0.0

[constellation]
altitude_km = 20180.0
inclination_deg = 55.0
planes = 3
sats_per_plane = 3
phasing_f = 1.0

[clock_quantum]
id = "optical"
provenance = "test"
y0 = 1.0e-15
q_wf = 1.0e-30
q_rw = 1.0e-40

[clock_classical]
id = "csac"
provenance = "test"
y0 = 1.0e-11
q_wf = 9.0e-20
q_rw = 1.0e-28
"#;

    #[test]
    fn orbit_run_emits_eci_track_with_grid_length_and_consistent_first_radius() {
        let scn: crate::orbit::OrbitClockScenario = toml::from_str(ORBIT_GPS_USER).unwrap();
        let r = run_orbit_clock(&scn).expect("orbit run");
        let track = r.eci_track.expect("orbit run emits eci_track");
        assert!(!track.is_empty(), "track is non-empty");

        // Length: the full grid has n+1 = duration/step + 1 = 361 samples; with a
        // ≤720-point cap and stride 1 it is emitted in full.
        let n = (scn.time.duration_s / scn.time.step_s).round() as usize;
        assert_eq!(track.len(), n + 1, "track length matches grid samples");

        // Engine-internal consistency: the first track sample's magnitude equals
        // |user.position_eci(0)| (in km).
        let p0 = scn.user.to_orbit().position_eci(0.0);
        let r0_km = (p0[0].powi(2) + p0[1].powi(2) + p0[2].powi(2)).sqrt() / 1000.0;
        let first = track[0];
        let track_r0 = (first[0].powi(2) + first[1].powi(2) + first[2].powi(2)).sqrt();
        assert!(
            (track_r0 - r0_km).abs() < 1e-6,
            "first track radius {track_r0} != user radius {r0_km}"
        );

        // External oracle (non-circular): the GPS nominal semi-major axis is
        // 26,559.7 km (IS-GPS-200 / published constellation parameter). The user
        // here is configured at that radius, so |r| must match within tolerance.
        assert!(
            (track_r0 - 26_559.7).abs() < 2_000.0,
            "GPS-altitude user radius {track_r0} km not ≈ 26,559.7 km"
        );
    }

    #[test]
    fn eci_track_is_decimated_below_the_cap() {
        // A day at a 60 s step would be 1441 grid samples; the cap (720) decimates.
        let mut scn: crate::orbit::OrbitClockScenario = toml::from_str(ORBIT_GPS_USER).unwrap();
        scn.time.step_s = 60.0;
        scn.time.duration_s = 86400.0;
        let r = run_orbit_clock(&scn).expect("orbit run");
        let track = r.eci_track.expect("eci_track");
        assert!(
            track.len() <= MAX_ECI_TRACK,
            "decimated track {} exceeds cap {MAX_ECI_TRACK}",
            track.len()
        );
        assert!(track.len() > 1, "decimated track keeps more than one point");
    }

    #[test]
    fn non_orbit_run_has_no_eci_track() {
        let r = run(&demo());
        assert!(r.eci_track.is_none(), "clock run carries no eci_track");
    }
}
