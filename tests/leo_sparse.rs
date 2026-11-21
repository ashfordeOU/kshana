// SPDX-License-Identifier: AGPL-3.0-only
//! Sparse-geometry LEO-PNT study (`kshana leo-sparse`, src/leo_sparse.rs): the measurement
//! partials, the frame rotation and the properties a formal covariance must have.

use kshana::leo_sparse::{
    doppler_partials, range_partials, range_rate, run_study, to_ecef, Measurements, Study,
};
use std::process::Command;

fn example() -> Study {
    toml::from_str(
        &std::fs::read_to_string(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/examples/leo-sparse/study.toml"
        ))
        .unwrap(),
    )
    .unwrap()
}

#[test]
fn the_doppler_partials_match_a_numerical_derivative() {
    let user = [4_100_000.0, 800_000.0, 4_800_000.0];
    let sat = [4_600_000.0, 1_500_000.0, 5_600_000.0];
    let vsat = [-3_000.0, 6_500.0, 1_200.0];
    let h = doppler_partials(user, sat, vsat);
    for i in 0..3 {
        let d = 1.0;
        let (mut up, mut dn) = (user, user);
        up[i] += d;
        dn[i] -= d;
        let num = (range_rate(up, sat, vsat) - range_rate(dn, sat, vsat)) / (2.0 * d);
        assert!(
            (num - h[i]).abs() < 1e-9 * h[i].abs().max(1e-6),
            "axis {i}: {num} vs {}",
            h[i]
        );
    }
    assert_eq!(
        (h[3], h[4]),
        (0.0, 1.0),
        "Doppler sees the drift, not the bias"
    );
    let r = range_partials(user, sat, 7.0);
    assert_eq!((r[3], r[4]), (1.0, 7.0));
}

#[test]
fn the_earth_fixed_velocity_removes_the_rotation() {
    // A point at rest in the Earth-fixed frame moves at ω × r inertially.
    let r = [6_378_137.0, 0.0, 0.0];
    let v_inertial = [0.0, 7.292_115e-5 * 6_378_137.0, 0.0];
    let (_, v) = to_ecef(r, v_inertial, 0.0);
    assert!(v.iter().all(|x| x.abs() < 1e-6), "{v:?}");
}

#[test]
fn information_only_accumulates_and_two_satellites_do_no_worse() {
    let r = run_study(&example()).unwrap();
    assert_eq!(r.label, "MODELLED");
    assert_eq!(r.cases.len(), 2);
    for c in &r.cases {
        for w in c.reports.windows(2) {
            assert!(
                w[1].sigma_3d_m <= w[0].sigma_3d_m * (1.0 + 1e-9),
                "sigma rose"
            );
            assert!(w[1].measurements >= w[0].measurements);
        }
        assert!(c.reports.iter().all(|x| x.in_view.len() <= c.max_in_view));
    }
    let (one, two) = (&r.cases[0], &r.cases[1]);
    let last = |c: &kshana::leo_sparse::Case| c.reports.last().unwrap().sigma_horizontal_m;
    assert!(last(two) <= last(one) * (1.0 + 1e-9));
    // Doppler alone carries nothing about the clock bias: it stays at its prior.
    let b = one.reports.last().unwrap().sigma_bias_m;
    assert!((b - 1e6).abs() / 1e6 < 1e-6, "{b}");
    assert!(one.reports.last().unwrap().rank <= 4);
}

#[test]
fn with_uninformative_priors_the_sigma_scales_with_the_noise() {
    let mut s = example();
    s.max_in_view = vec![2];
    s.duration_hours = 3.0;
    let a = run_study(&s).unwrap();
    s.doppler_sigma_mps *= 2.0;
    let b = run_study(&s).unwrap();
    let (x, y) = (
        a.cases[0].reports.last().unwrap(),
        b.cases[0].reports.last().unwrap(),
    );
    assert!(
        x.sigma_3d_m < 1e4,
        "the position is observed: {}",
        x.sigma_3d_m
    );
    assert!(
        (y.sigma_3d_m / x.sigma_3d_m - 2.0).abs() < 1e-3,
        "{} {}",
        x.sigma_3d_m,
        y.sigma_3d_m
    );
}

#[test]
fn ranges_make_the_clock_bias_observable_and_the_target_is_timed() {
    let mut s = example();
    s.measurements = Measurements::Both;
    s.max_in_view = vec![2];
    let r = run_study(&s).unwrap();
    let c = &r.cases[0];
    let last = c.reports.last().unwrap();
    assert!(last.sigma_bias_m < 1e3, "{}", last.sigma_bias_m);
    assert_eq!(last.rank, 5);
    if let Some(t) = c.time_to_horizontal_target_s {
        let at = c.reports.iter().find(|x| x.t_s == t).unwrap();
        assert!(at.sigma_horizontal_m <= s.target_horizontal_m);
        assert!(c
            .reports
            .iter()
            .filter(|x| x.t_s < t)
            .all(|x| x.sigma_horizontal_m > s.target_horizontal_m));
    }
}

#[test]
fn bad_studies_are_refused() {
    let base = example();
    let bad: Vec<fn(&mut Study)> = vec![
        |s| s.max_in_view = vec![3],
        |s| s.max_in_view.clear(),
        |s| s.step_s = 0.0,
        |s| s.report_every_s = 1.0,
        |s| s.leo.planes = 5,
        |s| s.leo.altitude_km = 20_000.0,
        |s| s.target_horizontal_m = -1.0,
    ];
    for f in bad {
        let mut s = base.clone();
        f(&mut s);
        assert!(run_study(&s).is_err());
    }
}

#[test]
fn the_command_line_writes_json() {
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["leo-sparse", "examples/leo-sparse/study.toml"])
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["schema"], "kshana.leo-sparse/1");
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["leo-sparse"])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
}
