// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's **range-rate / azimuth-elevation batch orbit determination with an
//! elevation mask** ([`kshana::orbit_determination::determine_orbit_batch_tracking`]) against
//! **Orekit 12.2**'s `BatchLSEstimator` (Levenberg–Marquardt; CS GROUP, Apache-2.0, with
//! Hipparchus 3.1 on OpenJDK 21), and kshana's variational state-transition matrix
//! ([`kshana::orbit_determination::propagate_with_stm`]) against Orekit's
//! (`NumericalPropagator.setupMatricesComputation`).
//!
//! Both sides model identical physics, so what is compared is the estimator, its analytic
//! measurement partials and its STM: two-body + J2 in GCRF integrated by fixed-step RK4 of step
//! `dt`; fixed inertial stations on a 6378 km sphere; instantaneous geometric range, range-rate and
//! azimuth/elevation (NO light time, aberration or refraction) — on the Orekit side through the
//! custom `GeometricRange` / `GeometricRangeRate` / `GeometricAzEl` measurement classes, whose values
//! the driver cross-checks against Orekit's own `TopocentricFrame` (`TOPOCHECK` lines, ~1e-9 m and
//! ~1e-14 rad). The elevation mask and the seeded noise are applied once, by the Orekit driver; both
//! estimators fit the identical observation list with identical `1/σ²` weights.
//!
//! Pre-registered bars B1–B9: `xval/od-measurements-orekit/PREREGISTRATION.md` (committed alone,
//! before the first comparison run). Measured numbers: `xval/od-measurements-orekit/RESULTS.md`.
//! Every bar passes except B4 on two noiseless scenarios: Orekit's own estimate sits 1.5–1.7 cm from
//! the truth it simulated (kshana's sits < 1e-8 m from it), so kshana–Orekit misses the 1 cm bar.
//!
//! PIN-SCOPE:    the committed Orekit fixture `tests/fixtures/od_tracking_measurements/
//!               od_tracking_measurements_reference.txt` (8 scenarios: range-rate, az/el and mixed,
//!               LEO and MEO, noiseless and seeded-noisy, 5°/10° masks) and the pre-registered
//!               bars B1–B9 on visibility, simulated values, STM, recovered state and post-fit RMS.
//!               B4 (kshana vs Orekit epoch state, noiseless, ≤ 1 cm) is MISSED on `rr_leo` and
//!               `mixed_leo` (1.46 / 1.74 cm); the miss is pinned at its recorded size, not passed.
//! PIN-EXCLUDES: light time, Earth rotation, real station coordinates, refraction, biases,
//!               higher-order gravity and non-gravitational forces, sequential filtering, and the
//!               range-only path (pinned by `tests/batch_sequential_orbit_determination_reference.rs`).

use kshana::orbit_determination::{
    determine_orbit_batch_tracking, propagate_with_stm, simulate_tracking, MeasurementType,
    Station, TrackingObs,
};

const REF: &str =
    include_str!("fixtures/od_tracking_measurements/od_tracking_measurements_reference.txt");

// Pre-registered bars (xval/od-measurements-orekit/PREREGISTRATION.md).
const B2_RANGE: f64 = 1e-3; // m
const B2_RANGE_RATE: f64 = 1e-6; // m/s
const B2_ANGLE: f64 = 1e-9; // rad
const B3_STM_REL: f64 = 1e-6;
const B4_POS: f64 = 1e-2; // m
const B4_VEL: f64 = 1e-5; // m/s
                          // B4 is MISSED on two scenarios (xval/od-measurements-orekit/RESULTS.md). The miss is pinned,
                          // not hidden: exactly these scenarios miss, by no more than the recorded amounts (rr_leo
                          // 1.464e-2 m / 4.59e-6 m/s, mixed_leo 1.740e-2 m / 1.139e-5 m/s). kshana itself recovers the
                          // truth to < 1e-8 m on the same data (B5); the offset is Orekit's estimate vs its own simulated
                          // truth, unchanged when its convergence threshold is tightened from 1e-9 to 1e-14.
const B4_RECORDED_MISSES: [&str; 2] = ["rr_leo", "mixed_leo"];
const B4_MISS_POS: f64 = 2e-2; // m, recorded-miss regression bound (not a pass bar)
const B4_MISS_VEL: f64 = 1.2e-5; // m/s, recorded-miss regression bound (not a pass bar)
const B6_POS: f64 = 5e-2; // m
const B6_VEL: f64 = 5e-5; // m/s
const B7_RMS_REL: f64 = 1e-3;
const B8_RMS_FRAC: f64 = 1e-3;

#[derive(Default)]
struct Scen {
    name: String,
    dt: f64,
    n: usize,
    mask_deg: f64,
    kinds: Vec<MeasurementType>,
    noisy: bool,
    truth: Vec<f64>,
    guess: Vec<f64>,
    stations: Vec<Station>,
    sigma: [f64; 3],
    obs: Vec<TrackingObs>,
    stm: Vec<(usize, Vec<f64>)>,
    orekit: Vec<f64>,
    orekit_rms: Vec<f64>,
}

fn nums(s: &str) -> Vec<f64> {
    s.trim()
        .split(',')
        .map(|x| {
            x.trim()
                .parse::<f64>()
                .unwrap_or_else(|_| panic!("bad {x}"))
        })
        .collect()
}

fn kind_of(t: &str) -> MeasurementType {
    match t {
        "R" => MeasurementType::Range,
        "RR" => MeasurementType::RangeRate,
        "AE" => MeasurementType::AzEl,
        _ => panic!("unknown kind {t}"),
    }
}

fn parse() -> Vec<Scen> {
    let mut out: Vec<Scen> = Vec::new();
    for line in REF
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
    {
        let (tag, rest) = line.split_once(' ').expect("tagged line");
        let f: Vec<&str> = rest.split('|').map(str::trim).collect();
        if tag == "SCEN" {
            out.push(Scen {
                name: f[0].to_string(),
                dt: f[1].parse().unwrap(),
                n: f[2].parse().unwrap(),
                mask_deg: f[3].parse().unwrap(),
                kinds: f[5].split(',').map(kind_of).collect(),
                noisy: f[6] == "1",
                ..Default::default()
            });
            continue;
        }
        let s = out.last_mut().expect("record after SCEN");
        match tag {
            "TRUTH" => s.truth = nums(f[0]),
            "GUESS" => s.guess = nums(f[0]),
            "STATION" => {
                let p = nums(f[1]);
                s.stations.push(Station {
                    pos: [p[0], p[1], p[2]],
                });
            }
            "SIGMA" => {
                let v = nums(f[0]);
                s.sigma = [v[0], v[1], v[2]];
            }
            "OBS" => {
                let kind = kind_of(f[2]);
                let v = nums(f[3]);
                let sig = match kind {
                    MeasurementType::Range => [s.sigma[0], 0.0],
                    MeasurementType::RangeRate => [s.sigma[1], 0.0],
                    MeasurementType::AzEl => [s.sigma[2], s.sigma[2]],
                };
                s.obs.push(TrackingObs {
                    epoch: f[0].parse().unwrap(),
                    station: f[1].parse().unwrap(),
                    kind,
                    value: [v[0], *v.get(1).unwrap_or(&0.0)],
                    sigma: sig,
                });
            }
            "STM" => s.stm.push((f[0].parse().unwrap(), nums(f[1]))),
            "OREKIT_BATCH" => s.orekit = nums(f[0]),
            "OREKIT_RMS" => s.orekit_rms = nums(f[0]),
            _ => {}
        }
    }
    out
}

fn dist(a: &[f64], b: &[f64], off: usize) -> f64 {
    (0..3)
        .map(|k| (a[off + k] - b[off + k]).powi(2))
        .sum::<f64>()
        .sqrt()
}

/// Record a bar miss instead of stopping at the first one, so every number is reported.
macro_rules! check {
    ($misses:expr, $cond:expr, $($fmt:tt)*) => {{
        let ok: bool = $cond;
        if !ok {
            $misses.push(format!($($fmt)*));
        }
    }};
}

#[test]
fn tracking_od_matches_orekit_batch_ls_within_the_preregistered_bars() {
    let scen = parse();
    assert_eq!(scen.len(), 8, "eight scenarios in the fixture");
    let mut worst = [0.0f64; 10];
    let mut misses: Vec<String> = Vec::new();
    let mut b4_missed: Vec<String> = Vec::new();
    for s in &scen {
        assert!(
            s.obs.len() >= 40,
            "{}: {} observations",
            s.name,
            s.obs.len()
        );
        let sig_for = |k: MeasurementType| match k {
            MeasurementType::Range => [s.sigma[0], 0.0],
            MeasurementType::RangeRate => [s.sigma[1], 0.0],
            MeasurementType::AzEl => [s.sigma[2], s.sigma[2]],
        };
        let kinds: Vec<(MeasurementType, [f64; 2])> =
            s.kinds.iter().map(|&k| (k, sig_for(k))).collect();

        // B1: kshana's elevation mask reproduces the oracle's visible set exactly.
        let sim = simulate_tracking(
            &s.truth,
            &s.stations,
            s.dt,
            s.n,
            &kinds,
            s.mask_deg.to_radians(),
        );
        let key = |o: &TrackingObs| (o.epoch, o.station, o.kind);
        assert_eq!(
            sim.iter().map(key).collect::<Vec<_>>(),
            s.obs.iter().map(key).collect::<Vec<_>>(),
            "{}: B1 visible set differs",
            s.name
        );

        // B2: noiseless values agree.
        if !s.noisy {
            for (a, b) in sim.iter().zip(&s.obs) {
                for c in 0..a.kind.dim() {
                    let d = (a.value[c] - b.value[c]).abs();
                    let (bar, slot) = match a.kind {
                        MeasurementType::Range => (B2_RANGE, 0),
                        MeasurementType::RangeRate => (B2_RANGE_RATE, 1),
                        MeasurementType::AzEl => (B2_ANGLE, 2),
                    };
                    worst[slot] = worst[slot].max(d);
                    check!(
                        misses,
                        d <= bar,
                        "{}: B2 {:?}[{c}] differs by {d}",
                        s.name,
                        a.kind
                    );
                }
            }
        }

        // B3: STM blocks.
        let traj = propagate_with_stm(&s.truth, s.dt, s.n);
        for (k, flat) in &s.stm {
            let phi = traj[*k].1;
            for (bi, bj) in [(0, 0), (0, 3), (3, 0), (3, 3)] {
                let (mut dmax, mut omax) = (0.0f64, 0.0f64);
                for i in bi..bi + 3 {
                    for j in bj..bj + 3 {
                        let o = flat[i * 6 + j];
                        dmax = dmax.max((phi[i][j] - o).abs());
                        omax = omax.max(o.abs());
                    }
                }
                worst[3] = worst[3].max(dmax / omax);
                check!(
                    misses,
                    dmax <= B3_STM_REL * omax,
                    "{}: B3 STM block ({bi},{bj}) at k={k}: {dmax} vs scale {omax}",
                    s.name
                );
            }
        }

        // B4–B9: the estimate.
        let fit = determine_orbit_batch_tracking(&s.obs, &s.guess, &s.stations, s.dt, 50, 1e-6)
            .unwrap_or_else(|| panic!("{}: tracking OD failed", s.name));
        check!(
            misses,
            fit.converged,
            "{}: B9 not converged: {fit:?}",
            s.name
        );
        let (dp, dv) = (dist(&fit.x, &s.orekit, 0), dist(&fit.x, &s.orekit, 3));
        let (tp, tv) = (dist(&fit.x, &s.truth, 0), dist(&fit.x, &s.truth, 3));
        let k_rms = [
            fit.rms_range,
            fit.rms_range_rate,
            fit.rms_azimuth,
            fit.rms_elevation,
        ];
        let sig4 = [s.sigma[0], s.sigma[1], s.sigma[2], s.sigma[2]];
        eprintln!(
            "{:16} obs {:4} kshana GN iters {:2} | kshana-Orekit dr {:.3e} m dv {:.3e} m/s | \
             kshana-truth dr {:.3e} m dv {:.3e} m/s | norm-RMS {:.4} | RMS k {:?} o {:?}",
            s.name,
            s.obs.len(),
            fit.iterations,
            dp,
            dv,
            tp,
            tv,
            fit.normalized_rms,
            k_rms,
            s.orekit_rms
        );
        if s.noisy {
            worst[6] = worst[6].max(dp);
            worst[7] = worst[7].max(dv);
            check!(
                misses,
                dp <= B6_POS && dv <= B6_VEL,
                "{}: B6 {dp} m {dv} m/s",
                s.name
            );
            for (j, kr) in k_rms.iter().enumerate() {
                match kr {
                    Some(v) => {
                        let rel = (v - s.orekit_rms[j]).abs() / s.orekit_rms[j];
                        worst[8] = worst[8].max(rel);
                        check!(
                            misses,
                            rel <= B7_RMS_REL,
                            "{}: B7 type {j}: {v} vs {}",
                            s.name,
                            s.orekit_rms[j]
                        );
                    }
                    None => assert!(s.orekit_rms[j].is_nan(), "{}: type {j} presence", s.name),
                }
            }
        } else {
            worst[4] = worst[4].max(dp.max(tp));
            worst[5] = worst[5].max(dv.max(tv));
            if dp <= B4_POS && dv <= B4_VEL {
                check!(
                    misses,
                    !B4_RECORDED_MISSES.contains(&s.name.as_str()),
                    "{}: B4 now passes ({dp} m {dv} m/s); update RESULTS.md and this pin",
                    s.name
                );
            } else {
                b4_missed.push(s.name.clone());
                eprintln!("RECORDED MISS {}: B4 {dp:.3e} m {dv:.3e} m/s", s.name);
                check!(
                    misses,
                    B4_RECORDED_MISSES.contains(&s.name.as_str())
                        && dp <= B4_MISS_POS
                        && dv <= B4_MISS_VEL,
                    "{}: B4 {dp} m {dv} m/s (unrecorded or larger miss)",
                    s.name
                );
            }
            check!(
                misses,
                tp <= B4_POS && tv <= B4_VEL,
                "{}: B5 {tp} m {tv} m/s",
                s.name
            );
            for (j, kr) in k_rms.iter().enumerate() {
                if let Some(v) = kr {
                    worst[9] = worst[9].max(v / sig4[j]);
                    check!(
                        misses,
                        *v <= B8_RMS_FRAC * sig4[j],
                        "{}: B8 type {j}: {v}",
                        s.name
                    );
                }
            }
        }
    }
    eprintln!(
        "WORST: B2 range {:.3e} m, rr {:.3e} m/s, angle {:.3e} rad | B3 STM rel {:.3e} | \
         B4/B5 pos {:.3e} m vel {:.3e} m/s | B6 pos {:.3e} m vel {:.3e} m/s | B7 RMS rel {:.3e} | \
         B8 RMS/sigma {:.3e}",
        worst[0],
        worst[1],
        worst[2],
        worst[3],
        worst[4],
        worst[5],
        worst[6],
        worst[7],
        worst[8],
        worst[9]
    );
    assert_eq!(b4_missed, B4_RECORDED_MISSES, "the recorded B4 misses");
    for m in &misses {
        eprintln!("MISS {m}");
    }
    assert!(
        misses.is_empty(),
        "{} pre-registered bar misses",
        misses.len()
    );
}
