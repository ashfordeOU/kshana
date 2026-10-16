// SPDX-License-Identifier: AGPL-3.0-only
//! The `entry-heating` 3-DoF ballistic entry against the published Stardust nominal (CAP-28).
//!
//! ORACLE (published value): P. N. Desai, R. A. Mitcheltree, F. M. Cheatwood, *Entry
//! Trajectory Issues for the Stardust Sample Return Capsule* (1999, NASA NTRS 20050042027). With
//! the launch-configuration mass of 45.8 kg, the six-degree-of-freedom nominal decelerates from
//! 12.6 km/s planet-relative and has a maximum deceleration of 33.4 g. The entry interface comes
//! from Desai, Lyons, Tooley and Kangas (2008, NTRS 20090004445): radius 6503.14 km, inertial
//! 12.9 km/s at −8.2 deg.
//!
//! BARS, registered in `xval/entry-stardust/PREREGISTRATION.md` (commit 62cde2b8, before any run
//! on these inputs):
//!
//! - E1: peak deceleration within ±10 % of 33.4 g;
//! - E2: planet-relative entry speed within 0.1 km/s of 12.6 km/s.
//!
//! The peak convective heat flux and the heading sensitivity are recorded without a bar.

use kshana::entry_eo_ascent::entry_heating::EntryHeatingScenario;
use serde_json::Value;

const PUBLISHED_PEAK_G: f64 = 33.4;
const E1_REL: f64 = 0.10;
const PUBLISHED_REL_SPEED_KM_S: f64 = 12.6;
const E2_KM_S: f64 = 0.1;

fn registered(heading_deg: f64) -> EntryHeatingScenario {
    EntryHeatingScenario {
        body: "earth".into(),
        atmosphere: Some("us76".into()),
        entry_interface_altitude_m: 125_003.0,
        velocity_frame: "inertial".into(),
        entry_speed_m_s: 12_900.0,
        flight_path_angle_deg: 8.2,
        latitude_deg: 41.0,
        heading_deg,
        mass_kg: 45.8,
        reference_area_m2: std::f64::consts::PI * 0.811 * 0.811 / 4.0,
        nose_radius_m: 0.2202,
        drag_coefficient: 1.4828,
        lift_to_drag: 0.0,
        rotating_planet: true,
        step_s: 0.05,
        terminal_altitude_m: 10_000.0,
        ..Default::default()
    }
}

fn run(s: &EntryHeatingScenario) -> Value {
    let (j, _) = s.run_json().expect("run");
    serde_json::from_str(&j).unwrap()
}

#[test]
fn stardust_published_nominal_e1_e2() {
    let v = run(&registered(100.0));
    let g = v["peak_deceleration"]["g"].as_f64().unwrap();
    let v_rel = v["relative_entry"]["speed_m_s"].as_f64().unwrap() / 1000.0;
    let q = v["peak_heat_flux"]["w_cm2"].as_f64().unwrap();
    let side: Vec<f64> = [70.0, 130.0]
        .iter()
        .map(|h| {
            run(&registered(*h))["peak_deceleration"]["g"]
                .as_f64()
                .unwrap()
        })
        .collect();
    eprintln!(
        "Stardust: peak {g:.2} g (published 33.4 g, ratio {:.4}); relative entry speed \
         {v_rel:.3} km/s (published 12.6); peak convective q {q:.0} W/cm2 (recorded only); \
         heading 70 / 130 deg: {:.2} / {:.2} g",
        g / PUBLISHED_PEAK_G,
        side[0],
        side[1]
    );
    assert_eq!(v["outcome"], "terminal-altitude");
    assert!((g / PUBLISHED_PEAK_G - 1.0).abs() <= E1_REL, "E1: {g:.2} g");
    assert!(
        (v_rel - PUBLISHED_REL_SPEED_KM_S).abs() <= E2_KM_S,
        "E2: {v_rel:.3} km/s"
    );
}
