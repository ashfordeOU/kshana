// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the inputs of the M131 oracle comparison (`tests/leo_polar_coverage_orekit_oracle.rs`):
//! for each configuration, the sweep grid, each system's role, mask and clock model
//! (`inputs_<c>.json`) and the engine's Earth-fixed satellite positions and velocities at every
//! epoch (`states_<c>.csv`, every value printed to round-trip exactly). The grid follows the
//! `leo-pvt` polar mode's rule; the test checks that the polar mode's report equals the sweep on
//! these states over this grid.
//!
//! Run from the repository root:
//! `cargo run --example gen_leo_polar_coverage_oracle_inputs`.

use kshana::leo_fusion::joint_pvt::SystemClock;
use kshana::leo_fusion::system::{System, SystemCfg};
use std::fmt::Write as _;

const DIR: &str = "tests/fixtures/leo_polar_coverage_orekit_oracle";

fn main() {
    for (name, path) in [
        ("A", "scenarios/polar-arctic-leo-coverage.toml".to_string()),
        ("B", format!("{DIR}/variant_masks_clocks.toml")),
    ] {
        let src = std::fs::read_to_string(&path).unwrap();
        let doc: toml::Value = toml::from_str(&src).unwrap();
        let systems: Vec<System> = doc["system"]
            .as_array()
            .unwrap()
            .iter()
            .map(|v| {
                let cfg: SystemCfg = v.clone().try_into().unwrap();
                cfg.build().unwrap()
            })
            .collect();
        let f = |v: &toml::Value| v.as_float().unwrap();
        let duration = f(&doc["duration_s"]);
        let step = f(&doc["step_s"]);
        let p = &doc["polar"];
        let (ls, os, thr) = (
            f(&p["lat_step_deg"]),
            f(&p["lon_step_deg"]),
            f(&p["pdop_threshold"]),
        );
        // The polar mode's grid (leo_fusion::pvt_kind, mode "polar").
        let mut lats = Vec::new();
        let mut l: f64 = 0.0;
        while l <= 90.0 + 1e-9 {
            lats.push(l.min(89.9));
            l += ls;
        }
        let lons: Vec<f64> = (0..((360.0 / os).floor() as usize).max(1))
            .map(|k| -180.0 + k as f64 * os)
            .collect();
        let times: Vec<f64> = (0..=((duration / step).floor() as usize))
            .map(|k| k as f64 * step)
            .collect();
        let sys_json: Vec<serde_json::Value> = systems
            .iter()
            .map(|s| {
                serde_json::json!({
                    "name": s.name,
                    "role": s.role,
                    "mask_rad": s.mask_rad,
                    "clock": match s.clock {
                        SystemClock::Estimated => "estimated",
                        SystemClock::Known(_) => "known",
                    },
                    "n_satellites": s.orbits.len(),
                })
            })
            .collect();
        let inputs = serde_json::json!({
            "config": name,
            "scenario": path,
            "lats_deg": lats,
            "lons_deg": lons,
            "times_s": times,
            "pdop_threshold": thr,
            "site_height_m": 0.0,
            "systems": sys_json,
        });
        std::fs::write(
            format!("{DIR}/inputs_{name}.json"),
            serde_json::to_string_pretty(&inputs).unwrap() + "\n",
        )
        .unwrap();
        let mut csv = String::from(
            "# epoch_index,t_s,system_index,satellite_index,x_m,y_m,z_m,vx_m_s,vy_m_s,vz_m_s (Earth-fixed)\n",
        );
        for (e, &t) in times.iter().enumerate() {
            for (k, s) in systems.iter().enumerate() {
                for (j, o) in s.orbits.iter().enumerate() {
                    let (r, v) = o.state(t);
                    writeln!(
                        csv,
                        "{e},{t:?},{k},{j},{:?},{:?},{:?},{:?},{:?},{:?}",
                        r[0], r[1], r[2], v[0], v[1], v[2]
                    )
                    .unwrap();
                }
            }
        }
        std::fs::write(format!("{DIR}/states_{name}.csv"), csv).unwrap();
        println!(
            "config {name}: {} systems, {} latitudes, {} longitudes, {} epochs",
            systems.len(),
            lats.len(),
            lons.len(),
            times.len()
        );
    }
}
