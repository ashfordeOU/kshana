// SPDX-License-Identifier: AGPL-3.0-only
//! M131 (row 218), LEO (low Earth orbit) coverage and dilution of precision (DOP) for polar and
//! Arctic users against MEO (medium Earth orbit) GNSS: leg 3 of the three-leg oracle, the
//! geometry on the validated path. Package D8.
//!
//! Re-design disclosed: made after the round-1 full-claim comparison
//! (`leo_polar_coverage_full_claim_orekit_oracle.rs`) failed its position bar on Orekit's SDP4
//! at e = 0 and Orekit's TEME convention. Legs 1 and 2 (`earth_orbit_path_sgp4_erfa_oracle.rs`)
//! check propagation and frames against the reference SGP4 and SOFA; this leg hands Orekit the
//! engine's GCRS (Geocentric Celestial Reference System) positions, which carry no TEME
//! convention, and lets Orekit do the Earth-fixed rotation, visibility and DOP.
//!
//! QUANTITY: as in the round-1 file: per sample the in-view count per system; per latitude and
//! group the mean in view, median PDOP, HDOP and VDOP, availability; and the Earth-fixed
//! position of every satellite at every epoch.
//!
//! INPUTS: configurations A and B and their element sets exactly as committed for round 1
//! (`tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/`), and the engine's GCRS
//! position of every satellite at every epoch (`sgp4::SgpOrbit::gcrs_state`), exported by the
//! fixture writer before the oracle runs; the test asserts they are the engine's own.
//!
//! ORACLE (Library, with P2 for multi-clock groups): Orekit 13.1.8 with Hipparchus 4.0.3
//! (Apache-2.0): each GCRS position transformed to `FramesFactory.getITRF(IERSConventions.IERS_2010,
//! true)` by Orekit's GCRF -> ITRF transform (no Earth orientation parameters loaded); WGS 84
//! `TopocentricFrame` visibility against each system's mask; `DOPComputer` for one clock
//! unknown; NumPy 2.4.6 `linalg.inv`/`matrix_rank` for several (the round-1 driver and script,
//! with the propagation step replaced by the transform).
//!
//! TOLERANCE (fixed before this comparison, 2026-10-02):
//! * T1: Orekit's ITRF position within 0.2 m of the engine's ITRS position, every satellite and
//!   epoch. Source: both sides implement the IAU 2006/2000A CIO-based GCRS -> ITRS; 1 mas of
//!   implementation difference is 0.15 m at the Galileo radius of 29 600 km.
//! * T2 and T3: the round-1 bars, unchanged (in view identical on at least 99.5 % of samples,
//!   every difference a tie within 1e-5 rad of a mask; mean in view within 0.01, median DOP
//!   within 1e-3 relative, availability within 0.005).
//!
//! VERDICT (2026-10-02, first and only run): AGREES at the pre-registered tolerances. T1:
//! worst Earth-fixed position 6.8e-5 m (A) and 6.0e-5 m (B) against 0.2 m. T2: in view identical
//! on 1040/1040 and 3000/3000 samples. T3: mean in view, availability and the presence of a fix
//! identical everywhere; worst median DOP 1.1e-11 (A) and 2.3e-11 (B) relative. Oracle
//! self-check: DOPComputer and the NumPy inverse agree to 1.3e-10 relative. Deliberate mutation:
//! the TEME -> GCRS step frozen at J2000 in `sgp4::teme_to_itrs_matrix_eop` (4739 failures,
//! positions off by up to 188 km, in view identical on 959/1040 and 2725/3000). With legs 1 and
//! 2 (`earth_orbit_path_sgp4_erfa_oracle.rs`) this validates the full claim from the element sets.
//! Pre-registration commit 72ea9eb0. Fixture: `tests/fixtures/leo_polar_coverage_on_path_orekit_oracle/`.

use kshana::jd2::Jd2;
use kshana::leo_fusion::polar::{
    element_sets, latitude_samples, latitude_sweep_on_states, polar_epoch, satellite_states_at,
};
use kshana::leo_fusion::system::{System, SystemCfg};
use serde_json::Value;
use std::fmt::Write as _;

const ROUND1: &str = "tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle";

const DIR: &str = "tests/fixtures/leo_polar_coverage_on_path_orekit_oracle";

const POSITION_M: f64 = 0.2;
const IN_VIEW_SAMPLE_FRACTION: f64 = 0.995;
const TIE_RAD: f64 = 1e-5;
const MEAN_IN_VIEW_ABS: f64 = 0.01;
const MEDIAN_DOP_REL: f64 = 1e-3;
const AVAILABILITY_ABS: f64 = 0.005;

/// One configuration: scenario source, systems, epoch and the polar mode's grid.
struct Config {
    name: &'static str,
    systems: Vec<System>,
    epoch_civil: [f64; 6],
    epoch: Jd2,
    lats: Vec<f64>,
    lons: Vec<f64>,
    times: Vec<f64>,
    threshold: f64,
}

fn configs() -> Vec<Config> {
    vec![
        load(
            "A",
            "scenarios/polar-arctic-leo-coverage.toml",
            [2026.0, 1.0, 1.0, 0.0, 0.0, 0.0],
        ),
        load(
            "B",
            "tests/fixtures/leo_polar_coverage_orekit_oracle/variant_masks_clocks.toml",
            [2024.0, 3.0, 20.0, 12.0, 0.0, 0.0],
        ),
    ]
}

fn load(name: &'static str, path: &str, c: [f64; 6]) -> Config {
    let toml_src = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("{path}: {e}"));
    let doc: toml::Value = toml::from_str(&toml_src).unwrap();
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
    let (duration, step) = (f(&doc["duration_s"]), f(&doc["step_s"]));
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
    let epoch = Jd2::from_utc_calendar(
        c[0] as i32,
        c[1] as u32,
        c[2] as u32,
        c[3] as u32,
        c[4] as u32,
        c[5],
    )
    .unwrap();
    Config {
        name,
        systems,
        epoch_civil: c,
        epoch,
        lats,
        lons,
        times,
        threshold: thr,
    }
}

/// The engine's GCRS position and velocity of every satellite at every epoch, as CSV.
fn gcrs_csv(c: &Config) -> String {
    let mut csv =
        String::from("# epoch_index,satellite_index,x_m,y_m,z_m,vx_m_s,vy_m_s,vz_m_s (GCRS)\n");
    let sets = element_sets(&c.systems, c.epoch);
    for (e, &t) in c.times.iter().enumerate() {
        for (k, (set, _)) in sets.iter().enumerate() {
            let (r, v) = kshana::sgp4::SgpOrbit::new(*set)
                .gcrs_state(c.epoch.add_seconds(t))
                .unwrap();
            writeln!(
                csv,
                "{e},{k},{:?},{:?},{:?},{:?},{:?},{:?}",
                r[0], r[1], r[2], v[0], v[1], v[2]
            )
            .unwrap();
        }
    }
    csv
}

/// Writes the engine's GCRS states; run by `generate.sh` before the oracle.
#[test]
#[ignore = "fixture generator: run by tests/fixtures/leo_polar_coverage_on_path_orekit_oracle/generate.sh"]
fn write_the_fixture_inputs() {
    std::fs::create_dir_all(DIR).unwrap();
    for c in configs() {
        std::fs::write(format!("{DIR}/states_gcrs_{}.csv", c.name), gcrs_csv(&c)).unwrap();
    }
}

#[test]
fn the_committed_states_are_the_engines_and_the_grid_is_round_1s() {
    for c in configs() {
        let committed =
            std::fs::read_to_string(format!("{DIR}/states_gcrs_{}.csv", c.name)).unwrap();
        assert_eq!(gcrs_csv(&c), committed, "config {}", c.name);
        // The configurations, grids and element sets are round 1's, unchanged.
        let inputs: Value = serde_json::from_str(
            &std::fs::read_to_string(format!("{ROUND1}/inputs_{}.json", c.name)).unwrap(),
        )
        .unwrap();
        let t: Vec<f64> = inputs["times_s"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect();
        assert_eq!(t, c.times);
        let e: Vec<f64> = inputs["epoch_utc"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect();
        assert_eq!(e, c.epoch_civil.to_vec());
    }
    // Configuration A's epoch is the polar mode's.
    assert_eq!(configs()[0].epoch, polar_epoch());
}

fn oracle(name: &str) -> Value {
    serde_json::from_str(
        &std::fs::read_to_string(format!("{DIR}/oracle_{name}.json")).unwrap_or_else(|e| {
            panic!("{DIR}/oracle_{name}.json: {e} (run generate.sh to rebuild the oracle)")
        }),
    )
    .unwrap()
}

fn close_rel(x: Option<f64>, y: Option<f64>, rel: f64) -> bool {
    match (x, y) {
        (Some(x), Some(y)) => (x - y).abs() <= rel * y.abs(),
        (None, None) => true,
        _ => false,
    }
}

/// Every pre-registered comparison of one configuration (T1 against Orekit's GCRF -> ITRF);
/// returns the failures and a summary.
fn compare(c: &Config, o: &Value) -> (Vec<String>, String) {
    let mut fails = Vec::new();
    let states = satellite_states_at(&c.systems, c.epoch, &c.times);
    let n_sat: usize = c.systems.iter().map(|s| s.orbits.len()).sum();
    // T1: Earth-fixed positions.
    let pos = o["positions_m"].as_array().unwrap();
    assert_eq!(pos.len(), c.times.len(), "config {}: oracle epochs", c.name);
    let mut worst_pos = 0.0_f64;
    for (e, (mine, theirs)) in states.iter().zip(pos).enumerate() {
        let theirs = theirs.as_array().unwrap();
        assert_eq!(
            mine.len(),
            n_sat,
            "config {}: every satellite propagates",
            c.name
        );
        assert_eq!(theirs.len(), n_sat, "config {}: oracle satellites", c.name);
        for (k, ((r, _), q)) in mine.iter().zip(theirs).enumerate() {
            let q: Vec<f64> = q
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect();
            let d = ((r[0] - q[0]).powi(2) + (r[1] - q[1]).powi(2) + (r[2] - q[2]).powi(2)).sqrt();
            worst_pos = worst_pos.max(d);
            if d > POSITION_M {
                fails.push(format!(
                    "config {} epoch {e} satellite {k}: position off by {d:.3} m",
                    c.name
                ));
            }
        }
    }
    // T2: per-sample in-view counts per system.
    let samples: std::collections::HashMap<(u64, u64, u64), &Value> = o["samples"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| {
            let k = |n: &str| x[n].as_u64().unwrap();
            ((k("lat_i"), k("lon_i"), k("epoch")), x)
        })
        .collect();
    let (mut n, mut same, mut worst_margin_of_diff) = (0usize, 0usize, 0.0_f64);
    for (li, &lat) in c.lats.iter().enumerate() {
        for s in latitude_samples(&c.systems, &states, lat, &c.lons) {
            let lon_i = c.lons.iter().position(|&x| x == s.lon_deg).unwrap();
            let os = samples
                .get(&(li as u64, lon_i as u64, s.epoch as u64))
                .unwrap_or_else(|| {
                    panic!(
                        "config {}: no oracle sample {li} {lon_i} {}",
                        c.name, s.epoch
                    )
                });
            let theirs: Vec<usize> = os["in_view_by_system"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_u64().unwrap() as usize)
                .collect();
            n += 1;
            if theirs == s.in_view_by_system {
                same += 1;
            } else {
                let margin = os["min_margin_rad"].as_f64().unwrap();
                worst_margin_of_diff = worst_margin_of_diff.max(margin);
                if margin > TIE_RAD {
                    fails.push(format!(
                        "config {} sample lat {lat} lon {} epoch {}: in view {:?} vs Orekit {theirs:?}, nearest mask margin {margin:.3e} rad",
                        c.name, s.lon_deg, s.epoch, s.in_view_by_system
                    ));
                }
            }
        }
    }
    if (same as f64) < IN_VIEW_SAMPLE_FRACTION * n as f64 {
        fails.push(format!(
            "config {}: in view identical on {same}/{n} samples",
            c.name
        ));
    }
    // T3: the reported figures.
    let mine = latitude_sweep_on_states(&c.systems, &states, &c.lats, &c.lons, c.threshold);
    let rows = o["rows"].as_array().unwrap();
    let mut worst_dop = 0.0_f64;
    for (r, orow) in mine.iter().zip(rows) {
        for (name, a) in [("gnss", &r.gnss), ("leo", &r.leo), ("fused", &r.fused)] {
            let b = &orow[name];
            let ok_mean =
                (a.mean_in_view - b["mean_in_view"].as_f64().unwrap()).abs() <= MEAN_IN_VIEW_ABS;
            let ok_avail =
                (a.availability - b["availability"].as_f64().unwrap()).abs() <= AVAILABILITY_ABS;
            let mut ok_dop = true;
            for (x, key) in [
                (a.median_pdop, "median_pdop"),
                (a.median_hdop, "median_hdop"),
                (a.median_vdop, "median_vdop"),
            ] {
                let y = b[key].as_f64();
                if let (Some(x), Some(y)) = (x, y) {
                    worst_dop = worst_dop.max((x - y).abs() / y.abs());
                }
                ok_dop &= close_rel(x, y, MEDIAN_DOP_REL);
            }
            if !(ok_mean && ok_avail && ok_dop) {
                fails.push(format!(
                    "config {} lat {} {name}: {a:?} vs Orekit {b}",
                    c.name, r.lat_deg
                ));
            }
        }
    }
    let summary = format!(
        "config {}: worst position {worst_pos:.3e} m; in view identical {same}/{n} (worst margin of a differing sample {worst_margin_of_diff:.3e} rad); worst median DOP {worst_dop:.3e} relative",
        c.name
    );
    (fails, summary)
}

#[test]
fn the_polar_sweep_on_the_validated_path_agrees_with_orekit_geometry_and_dop() {
    let mut all = Vec::new();
    for c in configs() {
        let (fails, summary) = compare(&c, &oracle(c.name));
        println!("{summary}");
        all.extend(fails);
    }
    assert!(
        all.is_empty(),
        "{} failures:\n{}",
        all.len(),
        all.iter().take(40).cloned().collect::<Vec<_>>().join("\n")
    );
}
