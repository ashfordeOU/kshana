// SPDX-License-Identifier: AGPL-3.0-only
//! FUT-16: the coupled PNT filters and the `fusion` pack's `[coupled]` mode.
//!
//! MODELLED / InternalConsistency: truth is simulated from the filters' own models, so these
//! tests show χ² consistency (NEES over Monte Carlo seeds), that the position-clock coupling
//! adds information, that the bias state learns a constant bias, and what the coupled pack mode
//! changes, not agreement with an external system.

use kshana::fusion::coupled::{CoupledBiasNoise, CoupledPnt3d, CoupledPntBiasFilter, C_M_PER_S};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

const Q_VA: f64 = 1e-4;
const Q_WF: f64 = 1e-20;
const Q_RW: f64 = 1e-24;

/// Lines of sight (unit, satellite to user) of a five-satellite sky.
fn sky() -> Vec<[f64; 3]> {
    let dirs: [[f64; 3]; 5] = [
        [0.1, 0.2, -0.97],
        [0.8, 0.1, -0.6],
        [-0.6, 0.6, -0.5],
        [-0.2, -0.85, -0.5],
        [0.5, -0.5, -0.7],
    ];
    dirs.iter()
        .map(|d| {
            let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            [d[0] / n, d[1] / n, d[2] / n]
        })
        .collect()
}

/// Mean NEES of the 3-D filter over seeds and epochs, and its expected 95 % band for the
/// number of independent seeds (χ² over seeds·8 dof, normal approximation).
#[test]
fn the_3d_filter_is_nees_consistent_over_seeds() {
    let (seeds, steps, dt, r) = (60usize, 120usize, 1.0f64, 4.0f64);
    let n01 = Normal::new(0.0, 1.0).unwrap();
    let (pv, vv, phv, fv) = (100.0, 1.0, 1e-14, 1e-20);
    let mut sum = 0.0;
    let mut cnt = 0u64;
    let mut last_epoch = Vec::new();
    for s in 0..seeds {
        let mut rng = ChaCha8Rng::seed_from_u64(0x3D00 + s as u64);
        let mut kf = CoupledPnt3d::new(Q_VA, Q_WF, Q_RW, pv, vv, phv, fv);
        let mut xt = [0.0; 8];
        for i in 0..3 {
            xt[i] = pv.sqrt() * n01.sample(&mut rng);
            xt[3 + i] = vv.sqrt() * n01.sample(&mut rng);
        }
        xt[6] = phv.sqrt() * n01.sample(&mut rng);
        xt[7] = fv.sqrt() * n01.sample(&mut rng);
        // Exact process-noise draws (per axis and the clock pair, by Cholesky).
        let chol = |a: f64, b: f64, c: f64| {
            let l00 = a.sqrt();
            let l10 = b / l00;
            (l00, l10, (c - l10 * l10).max(0.0).sqrt())
        };
        let (dt2, dt3) = (dt * dt, dt * dt * dt);
        let pa = chol(Q_VA * dt3 / 3.0, Q_VA * dt2 / 2.0, Q_VA * dt);
        let ca = chol(Q_WF * dt + Q_RW * dt3 / 3.0, Q_RW * dt2 / 2.0, Q_RW * dt);
        for k in 0..steps {
            if k > 0 {
                kf.predict(dt);
                for i in 0..3 {
                    let (w0, w1) = (n01.sample(&mut rng), n01.sample(&mut rng));
                    xt[i] += xt[3 + i] * dt + pa.0 * w0;
                    xt[3 + i] += pa.1 * w0 + pa.2 * w1;
                }
                let (w0, w1) = (n01.sample(&mut rng), n01.sample(&mut rng));
                xt[6] += xt[7] * dt + ca.0 * w0;
                xt[7] += ca.1 * w0 + ca.2 * w1;
            }
            for u in sky() {
                let rho = u[0] * xt[0]
                    + u[1] * xt[1]
                    + u[2] * xt[2]
                    + C_M_PER_S * xt[6]
                    + r.sqrt() * n01.sample(&mut rng);
                kf.update_pseudorange(rho, u, C_M_PER_S, r);
            }
            if k >= steps / 2 {
                sum += kf.nees(&xt).unwrap();
                cnt += 1;
            }
            if k + 1 == steps {
                last_epoch.push(kf.nees(&xt).unwrap());
            }
        }
    }
    let mean = sum / cnt as f64;
    // Last-epoch NEES over independent seeds: sum ~ χ²(8·seeds); 95 % band by normal approx.
    let tot: f64 = last_epoch.iter().sum();
    let dof = 8.0 * seeds as f64;
    let (lo, hi) = (
        dof - 1.96 * (2.0 * dof).sqrt(),
        dof + 1.96 * (2.0 * dof).sqrt(),
    );
    eprintln!("3-D NEES: second-half mean {mean:.3} (8 expected); last-epoch sum {tot:.1} in [{lo:.1}, {hi:.1}]");
    assert!((lo..=hi).contains(&tot));
    assert!((7.0..9.0).contains(&mean));
}

/// A clock-only fix sharpens the position through the cross-covariance a pseudorange creates.
#[test]
fn a_clock_fix_sharpens_the_position_through_the_coupling() {
    let mut kf = CoupledPnt3d::new(Q_VA, Q_WF, Q_RW, 100.0, 1.0, 1e-12, 1e-20);
    for u in sky().into_iter().take(4) {
        kf.update_pseudorange(0.0, u, C_M_PER_S, 4.0);
    }
    let before = kf.pos_sigma_3d();
    kf.update_pseudorange(0.0, [0.0; 3], C_M_PER_S, (C_M_PER_S * 1e-10).powi(2));
    let after = kf.pos_sigma_3d();
    eprintln!("position 1-sigma 3-D: {before:.3} m before, {after:.3} m after a 0.1 ns clock fix");
    assert!(after < 0.8 * before);
}

#[test]
fn the_bias_filter_learns_a_constant_bias_and_stays_consistent() {
    let (seeds, steps, dt, r, b_sigma) = (60usize, 400usize, 1.0f64, 1.0f64, 1e-3f64);
    let noise = CoupledBiasNoise {
        q_va: 1e-6,
        q_ba: 0.0,
        q_wf: Q_WF,
        q_rw: Q_RW,
    };
    let n01 = Normal::new(0.0, 1.0).unwrap();
    let geoms = [1.0, -0.7, 0.4, -0.2];
    let mut last = Vec::new();
    let mut bias_err = Vec::new();
    for s in 0..seeds {
        let mut rng = ChaCha8Rng::seed_from_u64(0xB1A5 + s as u64);
        let p0 = [1.0, 0.01, 1e-16, 1e-22, b_sigma * b_sigma];
        let mut kf = CoupledPntBiasFilter::new(noise, p0);
        let mut xt = [
            n01.sample(&mut rng),
            0.1 * n01.sample(&mut rng),
            1e-8 * n01.sample(&mut rng),
            1e-11 * n01.sample(&mut rng),
            b_sigma * n01.sample(&mut rng),
        ];
        let (dt2, dt3) = (dt * dt, dt * dt * dt);
        let l00 = (noise.q_va * dt3 / 3.0).sqrt();
        let l10 = noise.q_va * dt2 / 2.0 / l00;
        let l11 = (noise.q_va * dt - l10 * l10).max(0.0).sqrt();
        let c00 = (Q_WF * dt + Q_RW * dt3 / 3.0).sqrt();
        let c10 = Q_RW * dt2 / 2.0 / c00;
        let c11 = (Q_RW * dt - c10 * c10).max(0.0).sqrt();
        for k in 0..steps {
            if k > 0 {
                kf.predict(dt);
                let (w0, w1, w2, w3) = (
                    n01.sample(&mut rng),
                    n01.sample(&mut rng),
                    n01.sample(&mut rng),
                    n01.sample(&mut rng),
                );
                xt[0] += xt[1] * dt + xt[4] * dt2 / 2.0 + l00 * w0;
                xt[1] += xt[4] * dt + l10 * w0 + l11 * w1;
                xt[2] += xt[3] * dt + c00 * w2;
                xt[3] += c10 * w2 + c11 * w3;
            }
            for &g in &geoms {
                let rho = g * xt[0] + C_M_PER_S * xt[2] + r.sqrt() * n01.sample(&mut rng);
                kf.update_pseudorange(rho, g, C_M_PER_S, r);
            }
        }
        last.push(kf.nees(&xt).unwrap());
        bias_err.push(((kf.accel_bias_est() - xt[4]) / kf.accel_bias_sigma()).abs());
    }
    let tot: f64 = last.iter().sum();
    let dof = 5.0 * seeds as f64;
    let (lo, hi) = (
        dof - 1.96 * (2.0 * dof).sqrt(),
        dof + 1.96 * (2.0 * dof).sqrt(),
    );
    let within = bias_err.iter().filter(|&&z| z < 3.0).count();
    eprintln!("bias filter: last-epoch NEES sum {tot:.1} in [{lo:.1}, {hi:.1}]; bias within 3 sigma {within}/{seeds}");
    assert!((lo..=hi).contains(&tot));
    assert!(within >= seeds - 2);
}

fn load(name: &str) -> String {
    std::fs::read_to_string(format!(
        "{}/scenarios/{name}.toml",
        env!("CARGO_MANIFEST_DIR")
    ))
    .unwrap()
}

/// With biased accelerometers the coupled bias-state mode keeps the position bounded and its
/// integrity, where the decoupled filters (no bias state) lose both.
#[test]
fn the_coupled_pack_mode_learns_the_accelerometer_bias() {
    let coupled = load("fusion-pnt-coupled");
    let decoupled: String = coupled[..coupled.find("\n[coupled]").unwrap()].to_string();
    let parse = |s: &str| -> serde_json::Value {
        serde_json::from_str(&kshana::api::run_toml(s).unwrap().json).unwrap()
    };
    let (a, b) = (parse(&coupled), parse(&decoupled));
    for suite in ["quantum", "classical"] {
        let pa = a[suite]["fom"]["position_p95_m"].as_f64().unwrap();
        let pb = b[suite]["fom"]["position_p95_m"].as_f64().unwrap();
        let ia = a[suite]["fom"]["integrity"].as_f64().unwrap();
        let ib = b[suite]["fom"]["integrity"].as_f64().unwrap();
        eprintln!("{suite}: coupled position p95 {pa:.1} m, integrity {ia:.3}; decoupled {pb:.1} m, {ib:.3}");
        assert!(pa < 0.25 * pb && ia > 0.9 && ia > ib);
    }
}

#[test]
fn the_hybrid_kind_refuses_a_coupled_table_and_a_bad_geometry_is_refused() {
    let mut hybrid = load("hybrid-pnt");
    hybrid.push_str("\n[coupled]\nsigma_pr_m = 1.0\n");
    assert!(kshana::api::run_toml(&hybrid).is_err());
    let bad = load("fusion-pnt-coupled")
        .replace("geometry = [1.0, -0.7, 0.4, -0.2]", "geometry = [1.0, 1.0]");
    assert!(kshana::api::run_toml(&bad).is_err());
}
