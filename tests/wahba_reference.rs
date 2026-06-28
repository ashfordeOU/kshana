// SPDX-License-Identifier: AGPL-3.0-only
//! Reference tests for Wahba/TRIAD/QUEST attitude determination (`kshana::wahba`).
//!
//! Internal-consistency oracles (not an external dataset):
//!
//! (i)   TRIAD and the q-method recover a known rotation from noiseless vector
//!       observations to machine precision; the q-method gain `λ_max` equals the
//!       sum of weights and the Wahba loss is zero;
//! (ii)  QUEST agrees with the optimal q-method (quaternion up to sign, attitude
//!       matrix, and `λ_max`);
//! (iii) the q-method solution is the *minimiser* of the Wahba loss — perturbing
//!       it in any direction raises the loss;
//! (iv)  the q-method, which optimally fuses all observations, beats two-vector
//!       TRIAD in RMS attitude error under noise (statistical efficiency).
//!
//! The Monte-Carlo tests use a deterministic Box–Muller RNG so they are reproducible.

use kshana::wahba::{
    attitude_matrix_from_quat, matmul3, solve_davenport, solve_quest, transpose3, triad,
    wahba_loss, AttitudeSolution, Mat3, VectorObs,
};

type Vec3 = [f64; 3];

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}
fn unit(a: Vec3) -> Vec3 {
    let n = norm(a);
    [a[0] / n, a[1] / n, a[2] / n]
}
fn mat_vec(m: &Mat3, v: Vec3) -> Vec3 {
    [
        m[0][0] * v[0] + m[0][1] * v[1] + m[0][2] * v[2],
        m[1][0] * v[0] + m[1][1] * v[1] + m[1][2] * v[2],
        m[2][0] * v[0] + m[2][1] * v[1] + m[2][2] * v[2],
    ]
}

/// Active rotation matrix about a (not-necessarily-unit) axis by `angle`
/// (Rodrigues' formula). Used as the ground-truth reference→body attitude.
fn rodrigues(axis: Vec3, angle: f64) -> Mat3 {
    let k = unit(axis);
    let (s, c) = (angle.sin(), angle.cos());
    let v = 1.0 - c;
    [
        [
            c + k[0] * k[0] * v,
            k[0] * k[1] * v - k[2] * s,
            k[0] * k[2] * v + k[1] * s,
        ],
        [
            k[1] * k[0] * v + k[2] * s,
            c + k[1] * k[1] * v,
            k[1] * k[2] * v - k[0] * s,
        ],
        [
            k[2] * k[0] * v - k[1] * s,
            k[2] * k[1] * v + k[0] * s,
            c + k[2] * k[2] * v,
        ],
    ]
}

/// Rotation angle (rad) of the relative rotation `a · bᵀ` — the attitude error
/// between two proper rotation matrices.
fn attitude_error(a: &Mat3, b: &Mat3) -> f64 {
    let rel = matmul3(a, &transpose3(b));
    let tr = rel[0][0] + rel[1][1] + rel[2][2];
    (((tr - 1.0) / 2.0).clamp(-1.0, 1.0)).acos()
}

/// Four well-spread unit reference directions.
fn references() -> [Vec3; 4] {
    [
        unit([1.0, 0.2, -0.3]),
        unit([0.1, 1.0, 0.4]),
        unit([-0.5, 0.3, 1.0]),
        unit([0.7, -0.8, 0.2]),
    ]
}

/// Deterministic standard-normal stream (Box–Muller over a SplitMix64-ish LCG).
struct Rng {
    s: u64,
}
impl Rng {
    fn new(seed: u64) -> Self {
        Self { s: seed | 1 }
    }
    fn u01(&mut self) -> f64 {
        self.s = self
            .s
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        let x = (self.s >> 11) as f64;
        (x + 0.5) / (1u64 << 53) as f64
    }
    fn normal(&mut self) -> f64 {
        let u1 = self.u01().max(1e-12);
        let u2 = self.u01();
        (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

#[test]
fn triad_recovers_known_rotation_noiseless() {
    let a_true = rodrigues([0.3, -0.7, 0.5], 0.9);
    let refs = references();
    let (r1, r2) = (refs[0], refs[1]);
    let b1 = mat_vec(&a_true, r1);
    let b2 = mat_vec(&a_true, r2);

    let a_est = triad(b1, r1, b2, r2).expect("non-degenerate");
    assert!(
        attitude_error(&a_est, &a_true) < 1e-12,
        "TRIAD error {} rad",
        attitude_error(&a_est, &a_true)
    );
    // Primary direction recovered exactly.
    let got = mat_vec(&a_est, r1);
    assert!(norm([got[0] - b1[0], got[1] - b1[1], got[2] - b1[2]]) < 1e-12);
}

#[test]
fn davenport_recovers_known_rotation_noiseless() {
    let a_true = rodrigues([0.2, 0.4, -0.9], 1.7);
    let refs = references();
    let weights = [0.4, 0.3, 0.2, 0.1];
    let obs: Vec<VectorObs> = refs
        .iter()
        .zip(weights)
        .map(|(&r, w)| VectorObs {
            body: mat_vec(&a_true, r),
            reference: r,
            weight: w,
        })
        .collect();

    let sol = solve_davenport(&obs).expect("solves");
    assert!(
        attitude_error(&sol.dcm, &a_true) < 1e-10,
        "q-method error {} rad",
        attitude_error(&sol.dcm, &a_true)
    );
    // A·rᵢ ≈ bᵢ for every observation.
    for o in &obs {
        let ar = mat_vec(&sol.dcm, unit(o.reference));
        let b = unit(o.body);
        assert!(norm([ar[0] - b[0], ar[1] - b[1], ar[2] - b[2]]) < 1e-9);
    }
    // λ_max == Σ weights and loss ≈ 0 for a perfect fit.
    let sum_w: f64 = weights.iter().sum();
    assert!((sol.max_eigenvalue - sum_w).abs() < 1e-9, "λ={}", sol.max_eigenvalue);
    assert!(sol.loss < 1e-12, "loss {}", sol.loss);
}

#[test]
#[allow(clippy::needless_range_loop)]
fn quaternion_is_consistent_with_the_library_convention() {
    let a_true = rodrigues([-0.6, 0.1, 0.8], 2.3);
    let refs = references();
    let obs: Vec<VectorObs> = refs
        .iter()
        .map(|&r| VectorObs {
            body: mat_vec(&a_true, r),
            reference: r,
            weight: 0.25,
        })
        .collect();
    let sol: AttitudeSolution = solve_davenport(&obs).expect("solves");

    // transpose(quat.to_dcm()) == dcm (the library quaternion is body→nav).
    let from_quat = transpose3(&sol.quat.to_dcm());
    for i in 0..3 {
        for j in 0..3 {
            assert!(
                (from_quat[i][j] - sol.dcm[i][j]).abs() < 1e-9,
                "[{i}][{j}] {} vs {}",
                from_quat[i][j],
                sol.dcm[i][j]
            );
        }
    }
    // Quaternion is unit, dcm is a proper rotation.
    let q = sol.quat;
    let qn = (q.w * q.w + q.x * q.x + q.y * q.y + q.z * q.z).sqrt();
    assert!((qn - 1.0).abs() < 1e-9, "‖q‖ = {qn}");
    let ata = matmul3(&transpose3(&sol.dcm), &sol.dcm);
    for i in 0..3 {
        for j in 0..3 {
            let e = if i == j { 1.0 } else { 0.0 };
            assert!((ata[i][j] - e).abs() < 1e-9, "AᵀA not identity");
        }
    }
}

#[test]
fn quest_matches_the_optimal_q_method() {
    let a_true = rodrigues([0.5, -0.2, 0.4], 1.1);
    let refs = references();
    let mut rng = Rng::new(0xD1B5_4A32_D192_ED03);
    let sigma = 5e-4;
    let obs: Vec<VectorObs> = refs
        .iter()
        .map(|&r| {
            let mut b = mat_vec(&a_true, r);
            for c in b.iter_mut() {
                *c += sigma * rng.normal();
            }
            VectorObs {
                body: b,
                reference: r,
                weight: 0.25,
            }
        })
        .collect();

    let dav = solve_davenport(&obs).expect("q-method solves");
    let quest = solve_quest(&obs).expect("QUEST solves (not 180°)");

    // λ_max agrees.
    assert!(
        (dav.max_eigenvalue - quest.max_eigenvalue).abs() < 1e-8,
        "λ: {} vs {}",
        dav.max_eigenvalue,
        quest.max_eigenvalue
    );
    // Attitude matrices agree.
    assert!(
        attitude_error(&dav.dcm, &quest.dcm) < 1e-7,
        "QUEST vs q-method {} rad",
        attitude_error(&dav.dcm, &quest.dcm)
    );
}

#[test]
fn q_method_solution_minimises_the_wahba_loss() {
    // Noisy observations so the optimum has strictly positive loss.
    let a_true = rodrigues([0.1, 0.9, -0.4], 0.6);
    let refs = references();
    let mut rng = Rng::new(0x0BAD_C0DE_1234_5678);
    let obs: Vec<VectorObs> = refs
        .iter()
        .map(|&r| {
            let mut b = mat_vec(&a_true, r);
            for c in b.iter_mut() {
                *c += 0.02 * rng.normal();
            }
            VectorObs {
                body: b,
                reference: r,
                weight: 0.25,
            }
        })
        .collect();

    let sol = solve_davenport(&obs).expect("solves");
    let opt_loss = wahba_loss(&sol.dcm, &obs);
    assert!(opt_loss > 0.0, "expected non-zero loss under noise");

    // Any small perturbation of the optimum raises the loss.
    let mut worse = 0;
    for axis in [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]] {
        for &ang in &[-1e-2, -1e-3, 1e-3, 1e-2] {
            let perturbed = matmul3(&rodrigues(axis, ang), &sol.dcm);
            let l = wahba_loss(&perturbed, &obs);
            assert!(
                l >= opt_loss - 1e-12,
                "perturbation lowered loss: {l} < {opt_loss}"
            );
            if l > opt_loss + 1e-9 {
                worse += 1;
            }
        }
    }
    assert!(worse >= 10, "perturbations barely changed the loss ({worse})");
}

#[test]
fn q_method_beats_triad_under_noise() {
    // The optimal estimator fuses all four observations; TRIAD uses only two.
    // Over many noisy trials the q-method must have the smaller RMS attitude error.
    let refs = references();
    let mut rng = Rng::new(0xACE1_5EED_F00D_2026);
    let sigma = 1e-2;
    let trials = 2000;
    let (mut sse_q, mut sse_t) = (0.0_f64, 0.0_f64);

    for t in 0..trials {
        // Vary the truth each trial so the comparison is not geometry-specific.
        let axis = [
            (t as f64 * 0.7).sin(),
            (t as f64 * 1.3).cos(),
            (t as f64 * 0.4 + 0.5).sin(),
        ];
        let a_true = rodrigues(axis, 0.5 + 0.3 * ((t as f64) * 0.11).sin());

        let obs: Vec<VectorObs> = refs
            .iter()
            .map(|&r| {
                let mut b = mat_vec(&a_true, r);
                for c in b.iter_mut() {
                    *c += sigma * rng.normal();
                }
                VectorObs {
                    body: b,
                    reference: r,
                    weight: 0.25,
                }
            })
            .collect();

        let q = solve_davenport(&obs).expect("q-method solves");
        let eq = attitude_error(&q.dcm, &a_true);
        sse_q += eq * eq;

        let t_est = triad(obs[0].body, obs[0].reference, obs[1].body, obs[1].reference)
            .expect("non-degenerate");
        let et = attitude_error(&t_est, &a_true);
        sse_t += et * et;
    }
    let rms_q = (sse_q / trials as f64).sqrt();
    let rms_t = (sse_t / trials as f64).sqrt();
    assert!(
        rms_q < rms_t,
        "expected q-method RMS ({rms_q}) < TRIAD RMS ({rms_t})"
    );
}

#[test]
fn degenerate_inputs_are_rejected() {
    // Fewer than two usable observations.
    let single = [VectorObs {
        body: [1.0, 0.0, 0.0],
        reference: [1.0, 0.0, 0.0],
        weight: 1.0,
    }];
    assert!(solve_davenport(&single).is_none());
    assert!(solve_quest(&single).is_none());
    // TRIAD with parallel vectors.
    assert!(triad([1.0, 0.0, 0.0], [1.0, 0.0, 0.0], [2.0, 0.0, 0.0], [3.0, 0.0, 0.0]).is_none());
}

#[test]
#[allow(clippy::needless_range_loop)]
fn attitude_matrix_from_quat_is_orthonormal() {
    // A randomly chosen quaternion produces a proper rotation.
    let q = [0.3, -0.5, 0.7, 0.2];
    let a = attitude_matrix_from_quat(q);
    let ata = matmul3(&transpose3(&a), &a);
    for i in 0..3 {
        for j in 0..3 {
            let e = if i == j { 1.0 } else { 0.0 };
            assert!((ata[i][j] - e).abs() < 1e-12, "not orthonormal");
        }
    }
}
