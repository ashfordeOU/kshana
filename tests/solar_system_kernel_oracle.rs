// SPDX-License-Identifier: AGPL-3.0-only
//! The `solar-system` kind with `planetary_kernel_path` against SPICE.
//!
//! Pre-registration: `docs/design/evidence/cap31-solar-system-kernel/PREREGISTRATION.md`
//! (f8e946ea). Oracle: `tests/fixtures/solar_system_kernel/` (SPICE spkezr on the full
//! de440s.bsp; NOTICE.md). The engine reads one bit-for-bit de440s cut per epoch. Bars: Mercury,
//! Venus, the Earth and the Moon within 1 mm and 1e-6 m/s; the kernel block lists exactly those
//! four; every other body keeps its analytic label.
//!
//! ## Result
//!
//! First run 2026-10-13: all hold. 12 states, worst position 3.3e-5 m, velocity 1.0e-11 m/s; the
//! kernel block lists exactly Mercury, Venus, the Earth and the Moon; every other body keeps its
//! analytic label; without a kernel the report has no kernel block.

use kshana::api::run_toml;
use serde_json::Value;

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/solar_system_kernel"
);

#[test]
fn kernel_backed_solar_system_matches_spice() {
    let text = std::fs::read_to_string(format!("{DIR}/reference.csv")).expect("reference");
    let (mut wp, mut wv, mut n) = (0.0_f64, 0.0_f64, 0);
    for jd in [2_461_041.5_f64, 2_462_668.0, 2_466_519.5] {
        let toml = format!(
            "kind = \"solar-system\"\nepoch_jd_tdb = {jd}\nplanetary_kernel_path = \"{DIR}/de440s_cut_jd{jd:.1}.bsp\"\n"
        );
        let v: Value = serde_json::from_str(&run_toml(&toml).expect("runs").json).expect("json");
        let kb: Vec<&str> = v["kernel"]["bodies"]
            .as_array()
            .expect("kernel block")
            .iter()
            .map(|b| b.as_str().unwrap())
            .collect();
        assert_eq!(
            kb,
            ["Mercury", "Venus", "Earth", "Moon"],
            "kernel bodies at {jd}"
        );
        assert_eq!(v["kernel"]["origin"], "Sun");
        for b in v["bodies"].as_array().unwrap() {
            let name = b["name"].as_str().unwrap();
            let label = b["label"].as_str().unwrap();
            assert_eq!(
                label == "KERNEL",
                kb.contains(&name),
                "{name} at {jd}: label {label}"
            );
        }
        for line in text
            .lines()
            .filter(|l| !l.starts_with('#') && !l.is_empty())
        {
            let f: Vec<&str> = line.split(',').collect();
            if f[0].parse::<f64>().unwrap() != jd {
                continue;
            }
            let r: Vec<f64> = f[2..].iter().map(|x| x.parse().unwrap()).collect();
            let b = v["bodies"]
                .as_array()
                .unwrap()
                .iter()
                .find(|b| b["name"] == f[1])
                .expect("body");
            let p: Vec<f64> = b["position_m"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect();
            let q: Vec<f64> = b["velocity_m_s"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect();
            let dp = (0..3).map(|k| (p[k] - r[k]).powi(2)).sum::<f64>().sqrt();
            let dv = (0..3)
                .map(|k| (q[k] - r[3 + k]).powi(2))
                .sum::<f64>()
                .sqrt();
            println!("{jd} {:<8} position {dp:.3e} m velocity {dv:.3e} m/s", f[1]);
            wp = wp.max(dp);
            wv = wv.max(dv);
            n += 1;
        }
    }
    println!("{n} states: worst position {wp:.3e} m, velocity {wv:.3e} m/s");
    assert_eq!(n, 12);
    assert!(wp <= 1e-3 && wv <= 1e-6);
}

#[test]
fn without_a_kernel_the_report_has_no_kernel_block() {
    let v: Value =
        serde_json::from_str(&run_toml("kind = \"solar-system\"\n").expect("runs").json).unwrap();
    assert!(v.get("kernel").is_none());
    assert!(v["bodies"]
        .as_array()
        .unwrap()
        .iter()
        .all(|b| b["label"] != "KERNEL"));
}
