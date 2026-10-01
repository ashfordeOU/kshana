// SPDX-License-Identifier: AGPL-3.0-only
//! Torque-free rigid-body attitude dynamics against Basilisk 2.9.1 (ISC).
//!
//! ORACLE (Library): Basilisk's `spacecraft.Spacecraft` hub, general non-diagonal inertia, no gravity
//! body and no effectors, integrated by Basilisk's `svIntegratorRKF78` (rel tol 1e-12, abs tol 1e-14,
//! 1 s task step) and sampled every 100 s for 1e4 s. Basilisk propagates MRPs and its own coupled hub
//! equations in C++; Kshana propagates a quaternion with its own fixed-step RK4. Before the comparison
//! was run the oracle was checked for convergence: rerunning it at 0.25 s and 0.1 s task steps moves
//! the recorded states by at most 3.4e-12 (MRP) and 4.4e-13 rad/s.
//!
//! KSHANA SIDE: `attitude_dynamics::propagate`, dt = 0.01 s, zero torque.
//!
//! TOLERANCES (fixed before the first comparison, 2026-10-01): at every 100 s sample over 0 to 1e4 s,
//! every quaternion component within 1e-9 of Basilisk's Euler parameters of [BN] (sign aligned),
//! and every body-rate component within 1e-9 rad/s. At t = 0 the test first checks the convention:
//! Kshana's body-to-inertial DCM equals Basilisk's [BN] transposed to 1e-15.
//!
//! Fixture, generator and provenance: `tests/fixtures/attitude_dynamics_basilisk_oracle/`.

use kshana::attitude_dynamics::{propagate, AttitudeState, Inertia};
use kshana::inertial::attitude::Quaternion;

const REF: &str = include_str!(
    "fixtures/attitude_dynamics_basilisk_oracle/attitude_dynamics_basilisk_oracle.txt"
);

const Q_TOL: f64 = 1e-9;
const W_TOL: f64 = 1e-9; // rad/s
const DT: f64 = 0.01; // s
const SAMPLE_S: f64 = 100.0;

fn nums(s: &str) -> Vec<f64> {
    s.split_whitespace().map(|t| t.parse().unwrap()).collect()
}

struct Case {
    inertia: [[f64; 3]; 3],
    omega0: [f64; 3],
    axis: [f64; 3],
    angle: f64,
    bn0: Vec<f64>,
    samples: Vec<(f64, [f64; 4], [f64; 3])>,
}

fn parse() -> Vec<(String, Case)> {
    let mut out: Vec<(String, Case)> = Vec::new();
    for line in REF.lines() {
        let (tag, rest) = match line.split_once(' ') {
            Some(p) if !line.starts_with('#') => p,
            _ => continue,
        };
        let f: Vec<&str> = rest.split('|').map(str::trim).collect();
        let id = f[0].to_string();
        match tag {
            "CASE" => {
                let i = nums(f[1]);
                let w = nums(f[2]);
                let a = nums(f[3]);
                out.push((
                    id,
                    Case {
                        inertia: [[i[0], i[1], i[2]], [i[3], i[4], i[5]], [i[6], i[7], i[8]]],
                        omega0: [w[0], w[1], w[2]],
                        axis: [a[0], a[1], a[2]],
                        angle: f[4].parse().unwrap(),
                        bn0: Vec::new(),
                        samples: Vec::new(),
                    },
                ));
            }
            "BN0" => out.last_mut().unwrap().1.bn0 = nums(f[1]),
            "S" => {
                let b = nums(f[2]);
                let w = nums(f[3]);
                out.last_mut().unwrap().1.samples.push((
                    f[1].parse().unwrap(),
                    [b[0], b[1], b[2], b[3]],
                    [w[0], w[1], w[2]],
                ));
            }
            _ => {}
        }
    }
    out
}

#[test]
fn torque_free_motion_matches_basilisk() {
    let cases = parse();
    assert_eq!(cases.len(), 2);
    let steps_per_sample = (SAMPLE_S / DT).round() as usize;
    let mut failures = Vec::new();
    for (id, c) in &cases {
        assert_eq!(c.samples.len(), 101, "case {id}: expected 101 samples");
        let inertia = Inertia::general(c.inertia);
        let q0 = Quaternion::from_axis_angle(c.axis, c.angle);
        // Convention check: Kshana's body->inertial DCM is Basilisk's [BN] transposed.
        let dcm = q0.to_dcm();
        for (i, row) in dcm.iter().enumerate() {
            for (j, value) in row.iter().enumerate() {
                let d = (value - c.bn0[3 * j + i]).abs();
                assert!(
                    d < 1e-15,
                    "case {id}: convention mismatch at ({i},{j}): {d:e}"
                );
            }
        }
        let mut s = AttitudeState::new(q0, c.omega0);
        let (mut worst_q, mut worst_w) = (0.0_f64, 0.0_f64);
        for (k, (t, beta, w)) in c.samples.iter().enumerate() {
            assert!(
                (t - k as f64 * SAMPLE_S).abs() < 1e-6,
                "case {id}: sample time {t}"
            );
            if k > 0 {
                s = propagate(&inertia, &s, [0.0; 3], DT, steps_per_sample);
            }
            let q = [s.q.w, s.q.x, s.q.y, s.q.z];
            let sign = if q[0] * beta[0] + q[1] * beta[1] + q[2] * beta[2] + q[3] * beta[3] < 0.0 {
                -1.0
            } else {
                1.0
            };
            let dq = (0..4)
                .map(|i| (sign * q[i] - beta[i]).abs())
                .fold(0.0, f64::max);
            let dw = (0..3)
                .map(|i| (s.omega[i] - w[i]).abs())
                .fold(0.0, f64::max);
            worst_q = worst_q.max(dq);
            worst_w = worst_w.max(dw);
            if dq > Q_TOL || dw > W_TOL {
                failures.push(format!("case {id} t={t} s: |dq|={dq:e} |dw|={dw:e} rad/s"));
            }
        }
        eprintln!("case {id}: worst |dq| {worst_q:e}, worst |dw| {worst_w:e} rad/s over 1e4 s");
    }
    assert!(
        failures.is_empty(),
        "disagreements:\n{}",
        failures.join("\n")
    );
}
