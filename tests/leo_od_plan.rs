// SPDX-License-Identifier: AGPL-3.0-only
//! BeiDou-LEO interoperability planning and the LEO-aided orbit determination covariance study
//! (`kshana leo-od-plan`, src/leo_od_plan.rs): the propagator, the visibility geometry, and the
//! properties a formal covariance must have.

use kshana::constellation::Elements;
use kshana::leo_od_plan::{clears, kepler_state, off_nadir_deg, propagate, run_plan, Plan, RE};
use std::process::Command;

fn example() -> Plan {
    toml::from_str(
        &std::fs::read_to_string(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/examples/leo-od-plan/plan.toml"
        ))
        .unwrap(),
    )
    .unwrap()
}

#[test]
fn the_rk4_propagator_follows_the_kepler_orbit() {
    let el = Elements {
        a_m: RE + 21_528_000.0,
        e: 0.01,
        i_rad: 55f64.to_radians(),
        raan_rad: 0.3,
        argp_rad: 0.2,
        m0_rad: 0.1,
    };
    let (r0, v0) = kepler_state(&el, 0.0);
    let step = 300.0;
    let n = 288; // 24 h
    let track = propagate([r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]], step, n);
    for k in [0, 100, 288] {
        let (rk, _) = kepler_state(&el, k as f64 * step);
        let d: f64 = (0..3)
            .map(|i| (track[k][i] - rk[i]).powi(2))
            .sum::<f64>()
            .sqrt();
        assert!(d < 1.0, "step {k}: {d} m");
    }
}

#[test]
fn the_visibility_geometry() {
    let a = [RE + 900e3, 0.0, 0.0];
    // Straight through the Earth: blocked; a short chord above it: clear.
    assert!(!clears(a, [-(RE + 900e3), 0.0, 0.0], RE + 100e3));
    assert!(clears(a, [RE + 900e3, 1e5, 0.0], RE + 100e3));
    // An observer on the nadir line is at 0 degrees off nadir.
    let sat = [RE + 21_528e3, 0.0, 0.0];
    assert!(off_nadir_deg(sat, a) < 1e-9);
    // The Earth's edge from MEO is about 13.2 degrees off nadir.
    let edge = (RE / (RE + 21_528e3)).asin().to_degrees();
    assert!((edge - 13.2).abs() < 0.1, "{edge}");
}

#[test]
fn leo_tracking_only_adds_information() {
    let r = run_plan(&example()).unwrap();
    assert_eq!(r.label, "MODELLED");
    assert_eq!(r.satellites.len(), 24, "the 24 nominal MEO slots");
    for s in &r.satellites {
        assert!(s.combined_coverage >= s.ground_coverage.max(s.leo_coverage) - 1e-12);
        if let (Some(g), Some(c)) = (s.sigma_pos_ground_m, s.sigma_pos_combined_m) {
            assert!(c <= g + 1e-9, "{}: {c} > {g}", s.slot);
        }
    }
    assert!(r.median_improvement.unwrap() > 1.0);
}

#[test]
fn the_formal_sigma_scales_exactly_with_the_range_noise() {
    let mut p = example();
    p.leo = None;
    p.arc_hours = 12.0;
    let a = run_plan(&p).unwrap();
    p.ground_sigma_m *= 2.0;
    let b = run_plan(&p).unwrap();
    for (x, y) in a.satellites.iter().zip(&b.satellites) {
        if let (Some(sx), Some(sy)) = (x.sigma_pos_ground_m, y.sigma_pos_ground_m) {
            assert!((sy / sx - 2.0).abs() < 2e-3, "{} {sx} {sy}", x.slot);
        }
        assert_eq!(x.leo_coverage, 0.0);
    }
}

#[test]
fn a_narrower_beam_sees_fewer_leo_receivers() {
    let mut p = example();
    p.arc_hours = 6.0;
    let wide = run_plan(&p).unwrap();
    p.bds_half_beamwidth_deg = 12.0; // inside the Earth's edge: only the near side
    let narrow = run_plan(&p).unwrap();
    let mean =
        |r: &kshana::leo_od_plan::PlanResult| r.satellites.iter().map(|s| s.mean_leo).sum::<f64>();
    assert!(mean(&narrow) < mean(&wide));
}

#[test]
fn bad_plans_are_refused() {
    let base = example();
    let bad: Vec<fn(&mut Plan)> = vec![
        (|p| p.step_s = 0.0),
        (|p| p.arc_hours = f64::NAN),
        (|p| p.ground_sigma_m = -1.0),
        (|p| p.bds_half_beamwidth_deg = 120.0),
        (|p| p.leo.as_mut().unwrap().planes = 7),
        (|p| p.step_s = 0.1),
    ];
    for f in bad {
        let mut p = base.clone();
        f(&mut p);
        assert!(run_plan(&p).is_err());
    }
}

#[test]
fn the_command_line_writes_json() {
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["leo-od-plan", "examples/leo-od-plan/plan.toml"])
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["label"], "MODELLED");
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["leo-od-plan"])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
}
