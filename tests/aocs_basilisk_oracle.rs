// SPDX-License-Identifier: AGPL-3.0-only
//! Closed-loop MRP feedback attitude control with balanced reaction wheels against Basilisk 2.9.1
//! (ISC).
//!
//! ORACLE (Library): Basilisk, used as a separate tool. The modules are `spacecraft.Spacecraft`,
//! `reactionWheelStateEffector` (BalancedWheels, motor-torque limit on), `simpleNav` (no noise),
//! `inertial3D`, `attTrackingError`, `mrpFeedback` (K, P, no integral term) and `rwMotorTorque`
//! (three control axes). They run in one task at dt = 0.1 s with Basilisk's RK4. The generator,
//! fixture and provenance are in `tests/fixtures/aocs_basilisk_oracle/`.
//!
//! KSHANA SIDE: `aocs::simulate`, with its own quaternion RK4 at the same dt and a zero-order hold
//! on the motor torques.
//!
//! BARS, registered in `xval/aocs-basilisk/PREREGISTRATION.md` (commit 27d6831a, before the
//! Kshana code and before any comparison). At every 1 s sample over 600 s, in each of the three
//! cases:
//!
//! - A1: every MRP component within 1e-9;
//! - A2: every body-rate component within 1e-9 rad/s;
//! - A3: every wheel speed within 1e-6 rad/s;
//! - A4: every applied motor torque within 1e-9 N m.
//!
//! Two further checks:
//!
//! - A0 (convention check): the commanded wheel torques at t = 0 within 1e-12 N m.
//! - A5: case C saturates a wheel within the first 10 s in both tools.

use kshana::aocs::{quaternion_from_mrp, simulate, AocsConfig, AocsState, Wheel};

const REF: &str = include_str!("fixtures/aocs_basilisk_oracle/aocs_basilisk_oracle.txt");
const DT: f64 = 0.1;
const DURATION_S: f64 = 600.0;
const A0_NM: f64 = 1e-12;
const A1: f64 = 1e-9;
const A2_RAD_S: f64 = 1e-9;
const A3_RAD_S: f64 = 1e-6;
const A4_NM: f64 = 1e-9;

struct Case {
    name: String,
    cfg: AocsConfig,
    init: AocsState,
    rows: Vec<Vec<f64>>,
}

fn nums(s: &str) -> Vec<f64> {
    s.split_whitespace().map(|t| t.parse().unwrap()).collect()
}

fn cases() -> Vec<Case> {
    let mut out: Vec<Case> = Vec::new();
    for line in REF.lines() {
        let (tag, rest) = line.split_once(' ').unwrap();
        match tag {
            "case" => out.push(Case {
                name: rest.to_string(),
                cfg: AocsConfig {
                    inertia: [[0.0; 3]; 3],
                    wheels: vec![],
                    k: 3.5,
                    p: 30.0,
                },
                init: AocsState {
                    q: quaternion_from_mrp([0.0; 3]),
                    omega: [0.0; 3],
                    wheel_speed: vec![],
                },
                rows: vec![],
            }),
            "inertia" => {
                let v = nums(rest);
                let c = out.last_mut().unwrap();
                for r in 0..3 {
                    for k in 0..3 {
                        c.cfg.inertia[r][k] = v[3 * r + k];
                    }
                }
            }
            "wheel" => {
                let v = nums(rest);
                let c = out.last_mut().unwrap();
                c.cfg.wheels.push(Wheel {
                    gs: [v[0], v[1], v[2]],
                    js: v[3],
                    u_max: v[4],
                });
                c.init.wheel_speed.push(v[5]);
            }
            "init" => {
                let v = nums(rest);
                let c = out.last_mut().unwrap();
                c.init.q = quaternion_from_mrp([v[0], v[1], v[2]]);
                c.init.omega = [v[3], v[4], v[5]];
            }
            "row" => out.last_mut().unwrap().rows.push(nums(rest)),
            _ => panic!("unknown line {line}"),
        }
    }
    out
}

#[test]
fn the_fixture_holds_the_three_registered_cases() {
    let cs = cases();
    let names: Vec<&str> = cs.iter().map(|c| c.name.as_str()).collect();
    assert_eq!(names, ["A", "B", "C"]);
    for c in &cs {
        c.cfg.validate().unwrap();
        // PIN-SCOPE:    the registered sample count, 600 s at 1 s plus the start
        // PIN-EXCLUDES: the sampled values, which the bars below check
        assert_eq!(c.rows.len(), 601, "case {}", c.name);
        assert_eq!(c.cfg.wheels.len(), if c.name == "A" { 3 } else { 4 });
    }
}

#[test]
fn a0_commanded_torques_at_t0_match_basilisk() {
    for c in cases() {
        let n = c.cfg.wheels.len();
        let lr = c.cfg.required_torque(&c.init);
        let u = c.cfg.motor_torques_unclipped(lr);
        let row = &c.rows[0];
        for i in 0..n {
            let b = row[7 + n + i];
            assert!(
                (u[i] - b).abs() <= A0_NM,
                "case {} wheel {i}: {} vs {}",
                c.name,
                u[i],
                b
            );
        }
    }
}

#[test]
fn a1_to_a4_the_closed_loop_matches_basilisk_at_every_sample() {
    for c in cases() {
        let n = c.cfg.wheels.len();
        let steps = (DURATION_S / DT).round() as usize;
        let run = simulate(&c.cfg, &c.init, DT, steps, 10);
        assert_eq!(run.len(), c.rows.len());
        let (mut w1, mut w2, mut w3, mut w4) = (0.0_f64, 0.0_f64, 0.0_f64, 0.0_f64);
        for (k, (s, row)) in run.iter().zip(&c.rows).enumerate() {
            assert!((s.t_s - row[0]).abs() < 1e-9);
            for a in 0..3 {
                w1 = w1.max((s.sigma[a] - row[1 + a]).abs());
                w2 = w2.max((s.omega[a] - row[4 + a]).abs());
            }
            for i in 0..n {
                w3 = w3.max((s.wheel_speed[i] - row[7 + i]).abs());
                w4 = w4.max((s.u[i] - row[7 + 2 * n + i]).abs());
            }
            assert!(
                w1 <= A1 && w2 <= A2_RAD_S && w3 <= A3_RAD_S && w4 <= A4_NM,
                "case {} first miss at sample {k} (t = {} s): sigma {w1:.3e}, omega {w2:.3e}, \
                 wheel speed {w3:.3e}, torque {w4:.3e}",
                c.name,
                s.t_s
            );
        }
        eprintln!(
            "case {}: worst sigma {w1:.3e}, omega {w2:.3e} rad/s, wheel speed {w3:.3e} rad/s, \
             torque {w4:.3e} N m",
            c.name
        );
    }
}

#[test]
fn a5_case_c_saturates_in_both_tools() {
    let c = cases().into_iter().find(|c| c.name == "C").unwrap();
    let n = c.cfg.wheels.len();
    let u_max = c.cfg.wheels[0].u_max;
    let at_limit = |u: f64| (u.abs() - u_max).abs() < 1e-15;
    let basilisk = c.rows[..=10]
        .iter()
        .any(|r| (0..n).any(|i| at_limit(r[7 + 2 * n + i])));
    let run = simulate(&c.cfg, &c.init, DT, 100, 10);
    let kshana = run.iter().any(|s| s.u.iter().any(|&u| at_limit(u)));
    assert!(basilisk && kshana, "basilisk {basilisk}, kshana {kshana}");
}
