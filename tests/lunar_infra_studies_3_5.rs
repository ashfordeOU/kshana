// SPDX-License-Identifier: AGPL-3.0-only
//! Studies 3 to 5 of the `lunar-infrastructure` kind (`frame-coestimation`, `space-tie`,
//! `geodesy-sensitivity`) against bars F1 to F3, T1 to T3 and G1 to G4 of
//! `xval/lunar-infra/PREREGISTRATION.md` (committed before any of these studies was scored).
//! Results and verdicts: `xval/lunar-infra/RESULTS.md`.
//!
//! PIN-SCOPE:    the one scored run of each committed example (seed 20261019), the numpy oracles of
//!               the datum partials (F2), the space-tie information (T3) and the geodesy information
//!               (G2), and the miss of bar G3 (the CRLB trace is not monotone when a family raises the rank)
//! PIN-EXCLUDES: the values of the Love numbers, which the study does not claim to estimate

use kshana::lunar_infra::frame::range_row;
use kshana::lunar_infra::geodesy::{
    clock_forward, clock_partials, clock_rate_sensitivities, clock_tidal_amplitude, geom, grav_forward,
    grav_partials, llr_forward, llr_partials, p2, random_cases,
};
use serde_json::Value;

fn run(toml: &str) -> Value {
    let out = kshana::api::run_toml(toml).expect("scenario runs");
    serde_json::from_str(&out.json).unwrap()
}

fn example(name: &str) -> String {
    std::fs::read_to_string(format!("scenarios/lunar-infrastructure-{name}.toml")).unwrap()
}

fn f(v: &Value) -> f64 {
    v.as_f64().unwrap()
}

// ------------------------------------------------------------------ study 3

#[test]
fn f1_f3_orbiter_links_add_information() {
    let v = run(&example("frame-coestimation"));
    let r = &v["random_station_sets"];
    assert_eq!(r["sets"], 20);
    assert_eq!(r["trace_not_larger"], 20, "F1 on the random sets");
    assert_eq!(r["lambda_min_not_smaller"], 20, "F1 on the random sets");
    assert!(f(&v["with_orbiter_links"]["crlb_trace"]) <= f(&v["without_orbiter_links"]["crlb_trace"]), "F1 on the example");
    assert!(f(&v["with_orbiter_links"]["lambda_min"]) >= f(&v["without_orbiter_links"]["lambda_min"]), "F1 on the example");
    // F3: at least 2.0 times; found about 111 times (pinned from the one scored run).
    let ratio = f(&v["lambda_min_ratio"]);
    assert!(ratio >= 2.0, "F3: {ratio}");
    assert!((100.0..125.0).contains(&ratio), "pinned value moved: {ratio}");
    assert_eq!(v["with_orbiter_links"]["rank"], 7);
    assert_eq!(v["without_orbiter_links"]["rank"], 7);
}

#[test]
fn f2_datum_partials_equal_an_independent_finite_difference() {
    let k: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/frame_partials.json")).unwrap();
    let o: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/frame_oracle.json")).unwrap();
    let cases = k["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 50);
    let col_scale = [1.0, 1.0, 1.0, 1.7374e6, 1.7374e6, 1.7374e6, 1.7374e6];
    let mut worst: f64 = 0.0;
    for (i, c) in cases.iter().enumerate() {
        let ob: Vec<f64> = c["observer"].as_array().unwrap().iter().map(f).collect();
        let pt: Vec<f64> = c["point"].as_array().unwrap().iter().map(f).collect();
        let row = range_row([ob[0], ob[1], ob[2]], [pt[0], pt[1], pt[2]]);
        for j in 0..7 {
            let want = f(&o["rows"][i][j]);
            // Relative to the value, with a floor of 1e-3 of the column's natural scale.
            let rel = (row[j] - want).abs() / (want.abs() + 1e-3 * col_scale[j]);
            worst = worst.max(rel);
            assert_eq!(f(&c["row"][j]), row[j], "the fixture is the current code");
        }
    }
    assert!(worst <= 1e-6, "worst relative difference {worst:e}");
}

// ------------------------------------------------------------------ study 4

fn pair<'a>(row: &'a Value, name: &str) -> &'a Value {
    &row["offsets"][name]["translation_sigma_m"]
}

#[test]
fn t1_translation_sigmas_do_not_fall_as_the_local_tie_loosens() {
    let v = run(&example("space-tie"));
    let sweep = v["arcs"][0]["sweep"].as_array().unwrap();
    let ties: Vec<f64> = sweep.iter().map(|r| f(&r["local_tie_sigma_m"])).collect();
    assert_eq!(ties, vec![0.001, 0.01, 0.1, 1.0]);
    for name in ["vlbi_minus_gnss", "slr_minus_gnss", "slr_minus_vlbi"] {
        for axis in 0..3 {
            for w in sweep.windows(2) {
                assert!(f(&pair(&w[1], name)[axis]) >= f(&pair(&w[0], name)[axis]), "{name} axis {axis}");
            }
        }
    }
}

#[test]
fn t2_with_perfect_techniques_the_translation_sigma_is_the_local_tie_floor() {
    let toml = example("space-tie").replace("local_tie_sigma_m = 0.001", "local_tie_sigma_m = 0.001\nsigma_scale = 1e-6");
    let v = run(&toml);
    for row in v["arcs"][0]["sweep"].as_array().unwrap() {
        let floor = f(&row["floor_translation_sigma_m"]);
        for name in ["vlbi_minus_gnss", "slr_minus_gnss", "slr_minus_vlbi"] {
            for axis in 0..3 {
                let s = f(&pair(row, name)[axis]);
                assert!(((s - floor) / floor).abs() <= 0.01, "{name} axis {axis}: {s} vs floor {floor}");
            }
        }
    }
}

#[test]
fn t3_space_tie_information_equals_an_independent_numpy_assembly() {
    let k: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/tie_geometry.json")).unwrap();
    let o: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/tie_oracle.json")).unwrap();
    let (a, b) = (&k["information"], &o["information"]);
    let mut worst: f64 = 0.0;
    for i in 0..23 {
        for j in 0..23 {
            let (x, y) = (f(&a[i][j]), f(&b[i][j]));
            let scale = (f(&b[i][i]) * f(&b[j][j])).sqrt();
            worst = worst.max((x - y).abs() / scale);
        }
    }
    assert!(worst <= 1e-9, "worst relative difference {worst:e}");
}

// ------------------------------------------------------------------ study 5

#[test]
fn g1_analytic_partials_equal_a_central_finite_difference() {
    let cases = random_cases(50, 20261019);
    let mut worst: f64 = 0.0;
    for (g, u, p) in cases {
        let site = p;
        let ana = llr_partials(&g, u, p);
        let gp = grav_partials(&g, site);
        let cp = clock_partials(&g, site);
        for i in 0..5 {
            let mut e = [0.0; 5];
            e[i] = 1.0;
            let m = [-e[0], -e[1], -e[2], -e[3], -e[4]];
            let fd_l = (llr_forward(&g, u, p, &e) - llr_forward(&g, u, p, &m)) / 2.0;
            let fd_g = (grav_forward(&g, site, &e) - grav_forward(&g, site, &m)) / 2.0;
            let fd_c = (clock_forward(&g, site, &e) - clock_forward(&g, site, &m)) / 2.0;
            for (a, b) in [(ana[i], fd_l), (gp[i], fd_g), (cp[i], fd_c)] {
                if a != 0.0 || b != 0.0 {
                    worst = worst.max((a - b).abs() / (a.abs().max(b.abs())));
                }
            }
        }
    }
    assert!(worst <= 1e-8, "worst relative difference {worst:e}");
}

#[test]
fn g2_geodesy_information_equals_an_independent_numpy_assembly() {
    let k: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/geodesy_geometry.json")).unwrap();
    let o: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/geodesy_oracle.json")).unwrap();
    let (a, b) = (&k["rust_information"], &o["information"]);
    let mut worst: f64 = 0.0;
    for i in 0..5 {
        for j in 0..5 {
            let (x, y) = (f(&a[i][j]), f(&b[i][j]));
            let scale = (f(&b[i][i]) * f(&b[j][j])).sqrt();
            worst = worst.max((x - y).abs() / scale);
        }
    }
    assert!(worst <= 1e-6, "worst relative difference {worst:e}");
}

#[test]
fn g3_a_family_never_lowers_the_smallest_eigenvalue_but_can_raise_the_pseudo_inverse_trace() {
    let v = run(&example("geodesy-sensitivity"));
    let a = &v["adding_a_family"];
    assert_eq!(a["pairs_checked"], 28);
    // Half of the bar holds: lambda_min never falls (information is added).
    assert_eq!(a["lambda_min_not_smaller"], 28);
    // The other half is NOT MET: when an added family raises the rank, the Moore-Penrose trace gains a
    // term and may rise. Pinned: 16 of the 28 additions leave the trace no larger.
    assert_eq!(a["trace_not_larger"], 16);
    assert_eq!(v["rank"], 5);
}

#[test]
fn g4_the_clock_tide_ties_to_the_lunar_time_constants() {
    let o: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/geodesy_oracle.json")).unwrap();
    let d = kshana::lunar_time::EARTH_MOON_DISTANCE_M;
    let want = f(&o["clock_amplitude"]);
    let got = clock_tidal_amplitude(d);
    assert!(((got - want) / want).abs() <= 1e-9, "{got:e} vs {want:e}");
    // d/dk2 = W2/c^2 and d/dh2 = -W2/c^2, at cos psi = 1 (P2 = 1).
    let (dk, dh) = clock_rate_sensitivities(d, 1.0);
    assert!(((dk - want) / want).abs() <= 1e-9);
    assert!(((dh + want) / want).abs() <= 1e-9);
    let w = p2(0.3);
    let (dk3, dh3) = clock_rate_sensitivities(d, 0.3);
    assert!(((dk3 - want * w) / (want * w)).abs() <= 1e-9 && dh3 == -dk3);
    let _ = geom(0.0);
}

#[test]
fn every_numeric_field_of_every_study_carries_a_unit_and_a_provenance_class() {
    for name in ["od-consistency", "od-consistency-model-error", "frame-coestimation", "space-tie", "geodesy-sensitivity"] {
        let v = run(&example(name));
        let audit = kshana::field_schema::audit_document(&v);
        assert!(audit.malformed.is_empty(), "{name}: {:?}", audit.malformed.iter().map(|m| &m.key).collect::<Vec<_>>());
        assert!(audit.missing.is_empty(), "{name}: no units entry for {:?}", audit.missing);
        assert!(!audit.covered.is_empty());
    }
    let audit = kshana::field_schema::audit_document(&run(&example("carrier-phase")));
    assert!(audit.missing.is_empty(), "carrier-phase: {:?}", audit.missing);
}
