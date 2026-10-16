// SPDX-License-Identifier: AGPL-3.0-only
//! CAP-06 (b): the `jamming` kind's optional `[terrain]` section against the bars of
//! `docs/design/evidence/jamming-terrain/PREREGISTRATION.md` (committed before the code
//! existed), on the committed real SRTM tile `tests/fixtures/terrain/N36W117_sub6.hgt` with the
//! receiver at Badwater Basin and the ten registered jammer placements.
//!
//! B2 grades the engine against `xval/jamming-terrain/expected.json`, written by
//! `xval/jamming-terrain/oracle.py` (numpy, no shared code) from the tile bytes and the
//! placement table alone. B3: the loss never rises as the jammer rises. B4: the loss reaches
//! every link's J/S and nothing else. B5: the knife-edge function against the oracle's.
//! B1 (additivity) is the units test here, the unchanged jamming tests and goldens, and the
//! before/after scenario run recorded in `docs/design/evidence/jamming-terrain/RESULTS.md`.
//!
//! PIN-SCOPE:    the terrain-shadowing numbers of the ten registered placements against the
//!               committed numpy oracle output.
//! PIN-EXCLUDES: the DEM's own accuracy and the geoid value (inputs, not assessed).

use kshana::altpnt::terrain::DemGrid;
use kshana::frames::{geodetic_to_ecef, Geodetic};
use kshana::jamming::{run_jamming, JammingResult, JammingScenario};
use kshana::jamming_terrain::{knife_edge_loss_db, JammerTerrain};
use std::collections::BTreeMap;

const DEMO: &str = include_str!("../scenarios/jamming-demo.toml");
const HGT: &str = "tests/fixtures/terrain/N36W117_sub6.hgt";
const GEOID_N: f64 = -31.0;
const AGL: f64 = 2.0;
const STEP: f64 = 30.0;
const RECEIVER: (f64, f64) = (36.250, -116.825);
/// The registered placements (latitude °N, longitude °E).
const JAMMERS: [(f64, f64); 10] = [
    (36.450, -116.870),
    (36.220, -116.727),
    (36.170, -116.990),
    (36.100, -116.800),
    (36.300, -116.900),
    (36.200, -116.550),
    (36.400, -116.400),
    (36.050, -116.500),
    (36.600, -116.600),
    (36.300, -116.300),
];

fn terrain_section() -> String {
    format!(
        "[terrain]\ndem_hgt = \"{HGT}\"\nsamples_per_side = 601\nll_lat_deg = 36.0\n\
         ll_lon_deg = -117.0\ngeoid_undulation_m = {GEOID_N:.1}\n"
    )
}

fn dem() -> DemGrid {
    DemGrid::from_srtm_hgt(&std::fs::read(HGT).unwrap(), 601, 36.0, -117.0).unwrap()
}

/// The ellipsoidal height of an antenna `agl` above the DEM at a point.
fn height(dem: &DemGrid, (lat, lon): (f64, f64), agl: f64) -> f64 {
    dem.elevation_at(lat, lon) + agl + GEOID_N
}

/// The demo scenario's text with the registered receiver and the jammer at `jam`, `jam_agl`
/// above the DEM, with or without the `[terrain]` section.
fn scenario_text(dem: &DemGrid, jam: (f64, f64), jam_agl: f64, terrain: bool) -> String {
    let ecef = geodetic_to_ecef(Geodetic {
        lat_rad: jam.0.to_radians(),
        lon_rad: jam.1.to_radians(),
        alt_m: height(dem, jam, jam_agl),
    });
    let text = DEMO
        .replace(
            "lat_deg = 52.0\nlon_deg = 4.0\nalt_m = 0.0",
            &format!(
                "lat_deg = {:?}\nlon_deg = {:?}\nalt_m = {:?}",
                RECEIVER.0,
                RECEIVER.1,
                height(dem, RECEIVER, AGL)
            ),
        )
        .replace(
            "position_ecef_m = [3926375.101, 274488.966, 5002803.345]",
            &format!(
                "position_ecef_m = [{:?}, {:?}, {:?}]",
                ecef[0], ecef[1], ecef[2]
            ),
        );
    assert_ne!(text, DEMO, "the demo's receiver or jammer lines moved");
    if terrain {
        format!("{text}\n{}", terrain_section())
    } else {
        text
    }
}

fn scenario(dem: &DemGrid, jam: (f64, f64), jam_agl: f64, terrain: bool) -> JammingScenario {
    toml::from_str(&scenario_text(dem, jam, jam_agl, terrain)).unwrap()
}

fn run(s: &JammingScenario) -> JammingResult {
    run_jamming(s).unwrap()
}

fn terrain_of(r: &JammingResult) -> &JammerTerrain {
    r.jammer_terrain.as_ref().expect("a jammer_terrain block")
}

fn expected() -> serde_json::Value {
    serde_json::from_str(include_str!("../xval/jamming-terrain/expected.json")).unwrap()
}

/// B2: every placement against the independent numpy recomputation.
#[test]
fn b2_every_placement_matches_the_independent_numpy_recomputation() {
    let dem = dem();
    let e = expected();
    let rows = e["placements"].as_array().unwrap();
    assert_eq!(rows.len(), JAMMERS.len());
    let (mut worst_nu, mut worst_loss) = (0.0f64, 0.0f64);
    for (row, &jam) in rows.iter().zip(&JAMMERS) {
        assert_eq!(row["jammer_lat_deg"].as_f64().unwrap(), jam.0);
        assert_eq!(row["jammer_lon_deg"].as_f64().unwrap(), jam.1);
        let r = run(&scenario(&dem, jam, AGL, true));
        let t = terrain_of(&r);
        let f = |k: &str| row[k].as_f64().unwrap();
        let index = (t.obstacle_distance_m / STEP).round() as u64;
        let (dn, dl) = (
            (t.nu_max - f("nu_max")).abs(),
            (t.diffraction_loss_db - f("diffraction_loss_db")).abs(),
        );
        eprintln!(
            "B2 {jam:?}: points {} obstacle {index} at {:.0} m, terrain {:.1} m, path {:.0} m, \
             nu {:.6}, loss {:.4} dB; |dnu| {dn:.2e}, |dloss| {dl:.2e} dB",
            t.profile_points,
            t.obstacle_distance_m,
            t.obstacle_terrain_m,
            t.path_length_m,
            t.nu_max,
            t.diffraction_loss_db
        );
        assert_eq!(
            t.profile_points as u64,
            row["profile_points"].as_u64().unwrap()
        );
        assert_eq!(index, row["obstacle_index"].as_u64().unwrap(), "{jam:?}");
        assert!(dn <= 1e-9, "{jam:?}: nu {} vs {}", t.nu_max, f("nu_max"));
        assert!(
            dl <= 1e-9,
            "{jam:?}: loss {} vs {}",
            t.diffraction_loss_db,
            f("diffraction_loss_db")
        );
        worst_nu = worst_nu.max(dn);
        worst_loss = worst_loss.max(dl);
    }
    eprintln!("B2: worst |dnu| {worst_nu:.2e}, worst |dloss| {worst_loss:.2e} dB");
}

/// B3: raising the jammer from 2 m to 5000 m above the DEM never increases the loss.
#[test]
fn b3_the_loss_never_rises_as_the_jammer_rises() {
    let dem = dem();
    for &jam in &JAMMERS {
        let mut last = f64::INFINITY;
        let mut first = None;
        for k in 0..50 {
            let agl = AGL + 100.0 * k as f64;
            let loss = terrain_of(&run(&scenario(&dem, jam, agl, true))).diffraction_loss_db;
            first.get_or_insert(loss);
            assert!(
                loss <= last,
                "{jam:?} at {agl} m: {loss} dB after {last} dB"
            );
            last = loss;
        }
        eprintln!(
            "B3 {jam:?}: {:.3} dB at 2 m, {last:.3} dB at 4902 m",
            first.unwrap()
        );
    }
}

/// B4: with the section every link's J/S drops by exactly the loss; the satellite side is
/// unchanged.
#[test]
fn b4_the_loss_reaches_every_js_and_nothing_else() {
    let dem = dem();
    for &jam in &JAMMERS {
        let with = run(&scenario(&dem, jam, AGL, true));
        let without = run(&scenario(&dem, jam, AGL, false));
        let loss = terrain_of(&with).diffraction_loss_db;
        assert!(without.jammer_terrain.is_none());
        let key = |r: &JammingResult| -> BTreeMap<(i64, usize), (f64, f64)> {
            r.epochs
                .iter()
                .flat_map(|e| {
                    e.sats.iter().map(move |l| {
                        (
                            ((e.t * 1000.0).round() as i64, l.prn),
                            (l.js_db, l.cn0_nominal_dbhz),
                        )
                    })
                })
                .collect()
        };
        let (a, b) = (key(&with), key(&without));
        assert_eq!(a.len(), b.len());
        for (k, (js, cn0)) in &a {
            let (js0, cn00) = b[k];
            assert!(
                (js - (js0 - loss)).abs() <= 1e-12,
                "{jam:?} {k:?}: {js} vs {js0} - {loss}"
            );
            assert_eq!(*cn0, cn00, "{jam:?} {k:?}");
        }
    }
}

/// B5: the knife-edge loss function against the oracle's evaluation of the P.526-15 expression.
#[test]
fn b5_the_knife_edge_function_matches_the_reference_expression() {
    let e = expected();
    let rows = e["knife_edge_loss_db"].as_array().unwrap();
    assert_eq!(rows.len(), 6);
    for row in rows {
        let (nu, j) = (row["nu"].as_f64().unwrap(), row["j_db"].as_f64().unwrap());
        let got = knife_edge_loss_db(nu);
        assert!((got - j).abs() <= 1e-12, "J({nu}) = {got} vs {j}");
    }
    assert_eq!(knife_edge_loss_db(-0.78), 0.0);
}

/// B1 (units): the `jammer_terrain` units are emitted only with the section.
#[test]
fn b1_terrain_units_only_with_the_section() {
    let units = |extra: &str| {
        let out = kshana::api::run_toml(&format!("{DEMO}\n{extra}"));
        let v: serde_json::Value = serde_json::from_str(&out.unwrap().json).unwrap();
        v["units"].clone()
    };
    let plain = units("");
    assert!(plain.get("jammer_terrain.diffraction_loss_db").is_none());
    // The demo's own jammer and receiver sit outside the tile, so the section errors there;
    // the units come from a run whose profile lies on the tile.
    let dem = dem();
    let out = kshana::api::run_toml(&scenario_text(&dem, JAMMERS[0], AGL, true)).unwrap();
    let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
    assert_eq!(
        v["units"]["jammer_terrain.diffraction_loss_db"]["unit"],
        "dB"
    );
    assert_eq!(v["units"]["jammer_terrain.profile_points"]["unit"], "count");
}

/// A section without a jammer, a profile leaving the tile and a bad number are errors.
#[test]
fn invalid_terrain_sections_are_errors() {
    let off_tile = match kshana::api::run_toml(&format!("{DEMO}\n{}", terrain_section())) {
        Ok(_) => panic!("the demo geometry is outside the tile"),
        Err(e) => e,
    };
    assert!(off_tile.contains("outside the DEM tile"), "{off_tile}");
    let dem = dem();
    let mut s = scenario(&dem, JAMMERS[0], AGL, true);
    s.jammer = None;
    assert!(run_jamming(&s).unwrap_err().contains("needs a [jammer]"));
    let mut s = scenario(&dem, JAMMERS[0], AGL, true);
    s.terrain.as_mut().unwrap().profile_step_m = 0.0;
    assert!(run_jamming(&s).unwrap_err().contains("profile_step_m"));
}
