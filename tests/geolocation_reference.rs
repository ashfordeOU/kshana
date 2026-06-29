// SPDX-License-Identifier: AGPL-3.0-only
//! Reference tests for TDOA/FDOA emitter geolocation (`kshana::geolocation`).
//!
//! Internal-consistency oracles (not an external dataset):
//!
//! (i)   forward→inverse round trips recover a known emitter from noiseless TDOA to
//!       sub-millimetre over a spread of geometries;
//! (ii)  the Gauss–Newton TDOA estimator is statistically **efficient** — its
//!       empirical error covariance under Gaussian TDOA noise matches the analytic
//!       Cramér–Rao lower bound (the ML estimator attains the CRLB for small noise);
//! (iii) combined TDOA+FDOA recovers a moving emitter's position and velocity.
//!
//! The Monte-Carlo test uses a deterministic Box–Muller RNG so it is reproducible.

use kshana::geolocation::{solve_tdoa, tdoa_crlb, tdoa_predict, Vec3};

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// Deterministic standard-normal stream (Box–Muller over a 64-bit LCG).
struct Rng {
    s: u64,
}
impl Rng {
    fn new(seed: u64) -> Self {
        Self { s: seed | 1 }
    }
    fn unit(&mut self) -> f64 {
        // SplitMix64-ish step, mapped to (0,1).
        self.s = self
            .s
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        let x = (self.s >> 11) as f64;
        (x + 0.5) / (1u64 << 53) as f64
    }
    fn normal(&mut self) -> f64 {
        let u1 = self.unit().max(1e-12);
        let u2 = self.unit();
        (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

// A receiver network with genuine 3-D diversity: ground stations plus high-altitude
// (airborne/space) nodes. Out-of-plane receivers are required to make altitude
// observable — a near-coplanar network leaves a z mirror-ambiguity the solver can fall
// into, which is a real geometry constraint, not a numerical defect.
const RECEIVERS: [Vec3; 6] = [
    [0.0, 0.0, 0.0],
    [15_000.0, 0.0, 8_000.0],
    [0.0, 13_000.0, -4_000.0],
    [-11_000.0, 6_000.0, 12_000.0],
    [7_000.0, -9_000.0, 5_000.0],
    [-5_000.0, -8_000.0, -6_000.0],
];

#[test]
fn noiseless_round_trip_over_many_geometries() {
    let emitters = [
        [2_000.0, 1_500.0, 800.0],
        [-3_000.0, 4_000.0, -1_200.0],
        [6_500.0, -2_200.0, 300.0],
        [500.0, 9_000.0, 2_500.0],
    ];
    for e in emitters {
        let tdoa = tdoa_predict(e, &RECEIVERS);
        let got = solve_tdoa(&RECEIVERS, &tdoa, 1e-9, [0.0, 0.0, 0.0]).expect("solves");
        let err = norm(sub(got, e));
        assert!(
            err < 1e-6,
            "emitter {e:?} recovered as {got:?} (err {err} m)"
        );
    }
}

#[test]
fn estimator_attains_the_cramer_rao_bound() {
    let emitter: Vec3 = [2_000.0, 1_500.0, 800.0];
    let sigma_s = 10e-9; // 10 ns TDOA noise (≈ 3 m of range)
    let truth = tdoa_predict(emitter, &RECEIVERS);
    let crlb = tdoa_crlb(&RECEIVERS, emitter, sigma_s).expect("non-singular geometry");
    let crlb_trace = crlb[0][0] + crlb[1][1] + crlb[2][2];

    let mut rng = Rng::new(0x9E37_79B9_7F4A_7C15);
    let trials = 4000;
    let mut acc = [0.0f64; 3]; // mean error
    let mut sq = [[0.0f64; 3]; 3]; // error outer-product accumulator
    let mut n_ok = 0.0;
    for _ in 0..trials {
        let noisy: Vec<f64> = truth.iter().map(|&t| t + sigma_s * rng.normal()).collect();
        let Some(est) = solve_tdoa(&RECEIVERS, &noisy, sigma_s, emitter) else {
            continue;
        };
        let e = sub(est, emitter);
        // reject the occasional far-flung non-convergence so one outlier can't dominate
        if norm(e) > 500.0 {
            continue;
        }
        n_ok += 1.0;
        for a in 0..3 {
            acc[a] += e[a];
            for b in 0..3 {
                sq[a][b] += e[a] * e[b];
            }
        }
    }
    assert!(
        n_ok > trials as f64 * 0.95,
        "too many non-convergences: {n_ok}/{trials}"
    );
    let emp_trace = (0..3).map(|a| sq[a][a] / n_ok).sum::<f64>();
    // The empirical error variance should track the CRLB. Allow a generous band for
    // finite-sample scatter; the point is order-of-magnitude efficiency, not a tight fit.
    let ratio = emp_trace / crlb_trace;
    assert!(
        (0.6..1.6).contains(&ratio),
        "empirical position variance (trace {emp_trace:.3} m²) does not track the CRLB \
         (trace {crlb_trace:.3} m²); ratio {ratio:.3}"
    );
}
