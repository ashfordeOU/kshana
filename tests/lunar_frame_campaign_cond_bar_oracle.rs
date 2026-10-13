// SPDX-License-Identifier: AGPL-3.0-only
//! The P2 (NumPy) leg of `lunar-frame-campaign` at the condition-scaled bar of
//! `docs/design/evidence/mr05-lunar-datum-cond/PREREGISTRATION.md` (committed alone, b887eb05),
//! on eight scenarios: the six of `tests/lunar_vlbi_campaign_spice_oracle.rs` and two fresh ones,
//! `stations_estimated_fresh` and `stations_fixed_fresh`, the default network on the date
//! D = 2026-12-01 chosen by `examples/mr05_fresh_date_probe.rs` after the pre-registration.
//!
//! ## Oracle
//!
//! `tests/fixtures/lunar_frame_campaign_cond_bar/run_p2.py` runs `campaign_summary` of
//! `tests/fixtures/lunar_vlbi_campaign_spice_oracle/gen_reference.py` unmodified (NumPy `eigh`,
//! `inv`, `pinv`; SciPy `null_space`) on the engine's committed Jacobians
//! (`../lunar_vlbi_campaign_spice_oracle/inputs.json` and `fresh_inputs.json`) and computes the
//! condition ingredient with `numpy.linalg.eigvalsh`. Output: `reference.json`.
//!
//! ## Bar (fixed in the pre-registration)
//!
//! `kappa = max(kappa(F), kappa(T^T F T))` (each the largest eigenvalue over the smallest above
//! `rel_tol` times the largest), `t = max(1e-12, 10 kappa 2^-53)`. Helmert rank and defect equal;
//! full rank: the seven datum sigmas and the translation norm within `t` relative, the condition
//! within `t` relative, each Helmert eigenvalue within `t lambda_max` absolute, the weakest
//! direction within `t lambda_max / (lambda_2 - lambda_1)` rad; defective: the null space within
//! `t lambda_max / lambda_(d+1)` rad; stations estimated: the largest inter-beacon correlation
//! within `t` absolute and the independence-discarded translation norm within `t` relative;
//! stations fixed: off-block fraction exactly 0 on both sides.
//!
//! ## Result
//!
//! First run 2026-10-13 (NumPy 2.5.4, SciPy 1.18.1): **NOT MET**, a finding; the row stays
//! MODELLED. Six of eight scenarios hold every check (default, arc_16h, arc_48h, delay_sigma_3x,
//! collinear_beacons, stations_fixed_fresh; worst gap 0.13 of its bar, the arc_16h weakest direction at the arccos resolution). `stations_estimated`
//! (t = 5.9e-7, kappa 5.3e8) fails 8 checks: datum sigmas up to 6.8e-6, translation norm
//! 3.6e-6, condition 9.1e-6, independence-discarded norm 3.5e-6. On `stations_estimated_fresh`
//! the unchanged oracle raises (NumPy `inv` of a singular independence-discarded covariance: the
//! south-pole beacon has no observation on D), so it cannot be evaluated. The strict test is
//! ignored; `finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios` pins exactly
//! these nine failed checks. Results: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md.

#[path = "support/fixture_pin.rs"]
mod fixture_pin;

use kshana::lunar_frame_campaign::{
    campaign_jacobian_row, BeaconInput, LunarFrameCampaignScenario,
};

type J = serde_json::Value;

fn fixture(path: &str) -> J {
    let path = format!("{}/tests/fixtures/{path}", env!("CARGO_MANIFEST_DIR"));
    let text = std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    serde_json::from_str(&text).expect("json")
}

fn f(v: &J) -> f64 {
    v.as_f64()
        .unwrap_or_else(|| panic!("expected a number, got {v}"))
}

fn fv(v: &J) -> Vec<f64> {
    v.as_array()
        .unwrap_or_else(|| panic!("expected an array, got {v}"))
        .iter()
        .map(f)
        .collect()
}

fn mat(v: &J) -> Vec<Vec<f64>> {
    v.as_array().expect("matrix").iter().map(fv).collect()
}

fn u(v: &J) -> usize {
    v.as_u64()
        .unwrap_or_else(|| panic!("expected an integer, got {v}")) as usize
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

/// Largest principal angle (rad) between the spans of two orthonormal column lists.
fn principal_angle_rad(a: &[Vec<f64>], b: &[Vec<f64>]) -> f64 {
    assert_eq!(a.len(), b.len(), "subspace dimensions differ");
    let mut worst = 1.0_f64;
    for x in a {
        let mut p2 = 0.0;
        for y in b {
            let d: f64 = x.iter().zip(y).map(|(p, q)| p * q).sum();
            p2 += d * d;
        }
        worst = worst.min(p2.sqrt());
    }
    worst.min(1.0).acos()
}

fn scenario(name: &str) -> LunarFrameCampaignScenario {
    let b = |n: &str, alt: f64| BeaconInput {
        name: Some(n.to_string()),
        lat_deg: 0.0,
        lon_deg: 0.0,
        alt_m: Some(alt),
    };
    let d = LunarFrameCampaignScenario::default;
    let fresh = |datum: &str| LunarFrameCampaignScenario {
        epoch_year: Some(2026),
        epoch_month: Some(12),
        epoch_day: Some(1),
        station_datum: Some(datum.to_string()),
        ..d()
    };
    match name {
        "default" => d(),
        "arc_16h" => LunarFrameCampaignScenario {
            arc_hours: Some(16.0),
            ..d()
        },
        "arc_48h" => LunarFrameCampaignScenario {
            arc_hours: Some(48.0),
            ..d()
        },
        "stations_estimated" => LunarFrameCampaignScenario {
            station_datum: Some("estimated-anchor-first".to_string()),
            ..d()
        },
        "delay_sigma_3x" => LunarFrameCampaignScenario {
            delay_sigma_s: Some(3.0e-11),
            ..d()
        },
        "collinear_beacons" => LunarFrameCampaignScenario {
            beacons: Some(vec![b("a", 0.0), b("b", 1000.0), b("c", 2000.0)]),
            ..d()
        },
        "stations_estimated_fresh" => fresh("estimated-anchor-first"),
        "stations_fixed_fresh" => fresh("fixed"),
        other => panic!("unknown scenario {other}"),
    }
}

const NAMES: [&str; 8] = [
    "default",
    "arc_16h",
    "arc_48h",
    "stations_estimated",
    "delay_sigma_3x",
    "collinear_beacons",
    "stations_estimated_fresh",
    "stations_fixed_fresh",
];

/// One check: (scenario, quantity, gap, bar). Equality checks carry gap 0 or 1 and bar 0.
type Check = (&'static str, String, f64, f64);

fn checks() -> Vec<Check> {
    let reference = fixture("lunar_frame_campaign_cond_bar/reference.json");
    let refs = reference["scenarios"].as_array().expect("scenarios");
    assert_eq!(refs.len(), 8);
    let mut out: Vec<Check> = Vec::new();
    for (name, r) in NAMES.iter().zip(refs) {
        assert_eq!(r["name"].as_str(), Some(*name));
        let t = f(&r["t"]);
        let p = &r["p2"];
        let sc = scenario(name);
        let (json, _) = sc.run_json().expect("scenario runs");
        let v: J = serde_json::from_str(&json).expect("json");
        let helm = &v["helmert"];
        let acc = &v["datum_accuracy"];
        let mut push = |q: &str, gap: f64, bar: f64| out.push((name, q.to_string(), gap, bar));
        let eq = |a: bool| if a { 0.0 } else { 1.0 };
        if let Some(e) = p["error"].as_str() {
            // The unchanged oracle could not evaluate the scenario: no check can pass.
            push(&format!("oracle evaluates the scenario ({e})"), 1.0, 0.0);
            continue;
        }
        push(
            "Helmert rank equal",
            eq(u(&helm["rank"]) == u(&p["rank"])),
            0.0,
        );
        push(
            "Helmert defect equal",
            eq(u(&helm["defect"]) == u(&p["defect"])),
            0.0,
        );
        let lam = fv(&p["eigenvalues"]);
        let lmax = lam.iter().cloned().fold(0.0_f64, f64::max);
        if u(&p["defect"]) == 0 {
            let mut es = fv(&acc["translation_sigma_m"]);
            es.extend(fv(&acc["rotation_sigma_urad"]));
            es.push(f(&acc["scale_sigma_ppb"]) / 1e3);
            for (k, (a, b)) in es.iter().zip(fv(&p["sigma"])).enumerate() {
                push(&format!("datum sigma {k}"), rel(*a, b), t);
            }
            push(
                "translation sigma norm",
                rel(
                    f(&acc["translation_sigma_norm_m"]),
                    f(&p["translation_norm_m"]),
                ),
                t,
            );
            push(
                "Helmert condition",
                rel(f(&helm["condition_number"]), f(&p["condition"])),
                t,
            );
            for (k, (a, b)) in fv(&helm["eigenvalues"]).iter().zip(&lam).enumerate() {
                push(
                    &format!("Helmert eigenvalue {k} / lambda_max"),
                    (a - b).abs() / lmax,
                    t,
                );
            }
            let ang = principal_angle_rad(
                &[fv(&helm["weakest_direction"]["direction"])],
                &[fv(&p["weakest_direction"])],
            );
            push("weakest direction (rad)", ang, t * lmax / (lam[1] - lam[0]));
        } else {
            let d = u(&p["defect"]);
            let engine_null: Vec<Vec<f64>> = helm["unobservable_directions"]
                .as_array()
                .expect("null rows")
                .iter()
                .map(|r| fv(&r["direction"]))
                .collect();
            let ang = principal_angle_rad(&engine_null, &mat(&p["null_space_columns"]));
            push("null space (rad)", ang, t * lmax / lam[d]);
        }
        let bi = &v["beacon_information"];
        if u(&r["n_station_columns"]) == 0 {
            push(
                "engine off-block exactly 0",
                eq(f(&bi["offblock_fraction"]) == 0.0),
                0.0,
            );
            push(
                "oracle off-block exactly 0",
                eq(f(&p["offblock_fraction"]) == 0.0),
                0.0,
            );
        } else {
            push(
                "max inter-beacon correlation (abs)",
                (f(&bi["max_interbeacon_correlation"]) - f(&p["max_interbeacon_correlation"]))
                    .abs(),
                t,
            );
            push(
                "independence-discarded translation norm",
                rel(
                    f(&v["comparison"]["independence_discarded"]["translation_sigma_norm_m"]),
                    f(&p["independence_discarded_translation_norm_m"]),
                ),
                t,
            );
        }
    }
    for (name, q, gap, bar) in &out {
        println!(
            "{name:<26} {q:<42} gap {gap:.3e}  bar {bar:.3e}{}",
            if gap <= bar { "" } else { "  OUTSIDE" }
        );
    }
    out
}

/// The engine still builds the committed fresh Jacobians (within 1e-12 of each row's scale).
#[test]
fn fresh_inputs_are_the_engines() {
    let inputs = fixture("lunar_frame_campaign_cond_bar/fresh_inputs.json");
    for inp in inputs["lunar_frame_campaign"].as_array().expect("inputs") {
        let name = inp["name"].as_str().expect("name");
        let sc = scenario(name);
        let sched = sc.schedule().expect("schedule");
        let n_sc = u(&inp["n_station_columns"]);
        let dim = n_sc + 3 * sched.geoms.len();
        let jac: Vec<Vec<f64>> = sched
            .observations
            .iter()
            .map(|&o| campaign_jacobian_row(&sched.geoms[o.beacon][o.epoch], n_sc, o, dim))
            .collect();
        if let Err(e) = fixture_pin::check_rows_scaled(
            &jac,
            &mat(&inp["engine_jacobian"]),
            fixture_pin::NEAR_BIT,
            "engine_jacobian",
        ) {
            panic!("{name}: Jacobian drifted from the fixture: {e}");
        }
    }
}

/// The pre-registered P2 comparison on all eight scenarios, strict. Ignored: NOT MET (the
/// finding below).
#[test]
#[ignore = "MR-05 finding: stations_estimated outside the condition-scaled bar; stations_estimated_fresh not evaluable by the unchanged oracle"]
fn lunar_frame_campaign_matches_numpy_at_the_condition_scaled_bar() {
    let bad: Vec<Check> = checks().into_iter().filter(|c| c.2 > c.3).collect();
    assert!(bad.is_empty(), "outside the bar: {bad:#?}");
}

/// The checks outside the bar on the first run (2026-10-13), by scenario and quantity.
const FINDING: &[(&str, &str)] = &[
    ("stations_estimated", "datum sigma 1"),
    ("stations_estimated", "datum sigma 2"),
    ("stations_estimated", "datum sigma 3"),
    ("stations_estimated", "datum sigma 4"),
    ("stations_estimated", "datum sigma 5"),
    ("stations_estimated", "translation sigma norm"),
    ("stations_estimated", "Helmert condition"),
    (
        "stations_estimated",
        "independence-discarded translation norm",
    ),
    (
        "stations_estimated_fresh",
        "oracle evaluates the scenario (LinAlgError: Singular matrix)",
    ),
];

/// The finding, pinned: exactly the recorded checks fall outside the bar (it fails if any of
/// them comes inside, so the row is re-examined, or if another one goes outside).
#[test]
fn finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios() {
    let bad: Vec<(&str, String)> = checks()
        .into_iter()
        .filter(|c| c.2 > c.3)
        .map(|c| (c.0, c.1))
        .collect();
    let want: Vec<(&str, String)> = FINDING.iter().map(|(a, b)| (*a, b.to_string())).collect();
    assert_eq!(bad, want, "the P2 finding changed");
}
