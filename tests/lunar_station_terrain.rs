// SPDX-License-Identifier: AGPL-3.0-only
//! Terrain horizon masks on the `lunar-station-coverage` kind (src/lunar_terrain.rs).
//!
//! * The `[terrain]` section is additive: without it the document is unchanged (the frozen
//!   prediction and the goldens pin that byte for byte; here the key is checked absent), and
//!   a stated horizon of zero everywhere under a positive mask gives exactly the flat run's
//!   figures.
//! * A horizon can only remove satellites; the epochs it costs are counted as `terrain_masked`.
//! * The vendored LOLA crop loads (size and SHA-256 checked), is oriented as the source
//!   (Shackleton and Haworth craters are depressions, the Malapert massif stands high), and
//!   gives the station a horizon that is pinned here as a disclosed property of the crop.

use kshana::lunar_station::LunarStationCoverageScenario;
use kshana::lunar_terrain::{horizon_profile, up_of, HorizonParams, PolarDem};
use serde_json::Value;

const DEM: &str = "data/lunar-dem/lola_ldem_75s_1200m_crop.toml";

const SMALL: &str = r#"
kind = "lunar-station-coverage"
points = [
  { lat_deg = -89.0, lon_deg = 0.0 },
  { lat_deg = -88.0, lon_deg = 90.0 },
  { lat_deg = -86.0, lon_deg = 180.0 },
  { lat_deg = -84.0, lon_deg = 270.0 },
  { lat_deg = -90.0, lon_deg = 0.0 },
]
t_span_s = 21600.0
t_step_s = 3600.0
n_trials = 8
"#;

fn run(src: &str) -> Value {
    let s: LunarStationCoverageScenario = toml::from_str(src).expect("parses");
    serde_json::to_value(s.run().expect("runs")).expect("json")
}

fn strip_terrain(mut v: Value) -> Value {
    let o = v.as_object_mut().unwrap();
    o.remove("terrain");
    o.remove("note");
    o.get_mut("inputs_echo")
        .unwrap()
        .as_object_mut()
        .unwrap()
        .remove("terrain");
    for p in o.get_mut("points").unwrap().as_array_mut().unwrap() {
        let p = p.as_object_mut().unwrap();
        p.remove("horizon_max_deg");
        p.remove("sky_open_fraction");
        let un = p.get_mut("unavailable").unwrap().as_object_mut().unwrap();
        un.remove("terrain_masked");
    }
    v
}

#[test]
fn without_terrain_the_document_has_no_terrain_keys() {
    let v = run(SMALL);
    assert!(v.get("terrain").is_none() && v["inputs_echo"].get("terrain").is_none());
    let text = serde_json::to_string(&v).unwrap();
    assert!(!text.contains("horizon_max_deg") && !text.contains("sky_open_fraction"));
    assert_eq!(v["note"], kshana::lunar_station::NOTE);
}

#[test]
fn a_zero_horizon_under_a_positive_mask_is_the_flat_run() {
    let flat = run(SMALL);
    let zero = run(&format!(
        "{SMALL}\n[terrain]\nstation_horizon = {{ source = \"test\", table = [[0.0, 0.0]] }}\n\
         user_horizon = {{ source = \"test\", table = [[0.0, 0.0], [180.0, 0.0]] }}\n"
    ));
    assert_eq!(zero["terrain"]["station"]["horizon_max_deg"], 0.0);
    for p in zero["points"].as_array().unwrap() {
        assert_eq!(p["unavailable"]["terrain_masked"], 0);
    }
    assert_eq!(strip_terrain(zero), strip_terrain(flat));
}

/// A horizon can only remove satellites from a site's visible set: the epochs it leaves
/// with fewer than four at a point are counted as `terrain_masked`, and `user_lt4` keeps
/// its flat meaning. Availability itself is not
/// monotone: an epoch is also unavailable when the point uses a satellite the station does
/// not see, and a horizon that hides that satellite from the point can turn the epoch
/// available (the bundled terrain scenario shows it: region availability 91.9 % flat,
/// 93.0 % with the DEM).
#[test]
fn a_horizon_only_removes_satellites_and_a_wall_removes_everything() {
    let flat = run(SMALL);
    let walled = run(&format!(
        "{SMALL}\n[terrain]\nuser_horizon = {{ source = \"ILLUSTRATIVE\", table = [[0.0, 70.0], [90.0, 20.0], [180.0, 70.0], [270.0, 20.0]] }}\n"
    ));
    let fp = flat["points"].as_array().unwrap();
    let wp = walled["points"].as_array().unwrap();
    let mut more = 0;
    for (f, w) in fp.iter().zip(wp) {
        let un = |v: &Value, k: &str| v["unavailable"][k].as_u64().unwrap();
        // user_lt4 keeps its flat meaning; the epochs the horizon costs are terrain_masked.
        assert_eq!(un(w, "user_lt4"), un(f, "user_lt4"));
        assert!(f["unavailable"].get("terrain_masked").is_none());
        if un(w, "terrain_masked") > 0 {
            more += 1;
        }
        assert!(w["horizon_max_deg"].as_f64().unwrap() >= 70.0 - 1e-9);
    }
    assert!(more > 0, "a 70 deg wall should hide satellites");
    let blind = run(&format!(
        "{SMALL}\n[terrain]\nstation_horizon = {{ source = \"test\", table = [[0.0, 89.0]] }}\n"
    ));
    assert_eq!(blind["region"]["availability"], 0.0);
    assert!(blind["budget_at_station_and_at_edge"]["station"].is_null());
    assert_eq!(blind["note"], kshana::lunar_station::NOTE_TERRAIN);
}

#[test]
fn bad_terrain_sections_are_refused() {
    for bad in [
        "[terrain]\n",
        "[terrain]\nstation_horizon = { source = \"\", table = [[0.0, 1.0]] }\n",
        "[terrain]\nstation_horizon = { source = \"x\", table = [[0.0, 95.0]] }\n",
        "[terrain]\nuser_horizon = { source = \"x\", table = [[10.0, 1.0], [5.0, 1.0]] }\n",
        "[terrain]\ndem_path = \"no/such/descriptor.toml\"\n",
        "[terrain]\nunknown = 1\n",
    ] {
        let src = format!("{SMALL}\n{bad}");
        let r = toml::from_str::<LunarStationCoverageScenario>(&src)
            .map_err(|e| e.to_string())
            .and_then(|s| s.run().map(|_| ()));
        assert!(r.is_err(), "accepted: {bad}");
    }
}

/// The vendored crop: real LOLA heights, oriented as the source.
#[test]
fn the_vendored_crop_loads_and_is_oriented_as_the_source() {
    let (dem, echo) = PolarDem::load(DEM).expect("loads");
    assert_eq!((dem.lines, dem.samples), (700, 700));
    assert_eq!(echo.map_scale_m, 1200.0);
    let h = |lat: f64, lon: f64| dem.height_at_deg(lat, lon).unwrap();
    // Crater floors (published centre coordinates) are kilometres below the
    // surroundings; the Malapert massif stands kilometres above.
    assert!(
        h(-89.66, 129.2) < -1500.0,
        "Shackleton {}",
        h(-89.66, 129.2)
    );
    assert!(h(-87.45, -5.0) < -2000.0, "Haworth {}", h(-87.45, -5.0));
    assert!(h(-86.0, 0.0) > 3500.0, "Malapert {}", h(-86.0, 0.0));
    // The mirror image (longitude negated) does not show Shackleton's depression.
    assert!(h(-89.66, -129.2) > 0.0);
    // Outside the crop: no value.
    assert!(dem.height_at_deg(-70.0, 0.0).is_none());
}

/// The DEM horizon of the default station site (89 S, 0 E), 2 m mast, 1 deg azimuth,
/// 600 m steps to 150 km: the highest horizon is about 4.0 deg (toward azimuth 171 deg,
/// across the higher ground near the pole), below the 5 deg mask, so at this site the DEM
/// does not bind.
/// PIN-SCOPE:    the ray-marched horizon maximum (to 0.05 deg) and its azimuth at that site
///               from the vendored crop
/// PIN-EXCLUDES: any claim about the real horizon at the site finer than the crop's 1.2 km
#[test]
fn the_station_site_horizon_from_the_crop() {
    let (dem, _) = PolarDem::load(DEM).expect("loads");
    let p = HorizonParams {
        antenna_height_m: 2.0,
        azimuth_step_deg: 1.0,
        range_step_m: 600.0,
        max_range_m: 150_000.0,
    };
    let h = horizon_profile(&dem, up_of(-89.0, 0.0), &p).expect("horizon");
    assert_eq!(h.profile.len(), 360);
    let (az, el) = h
        .profile
        .iter()
        .cloned()
        .fold((0.0, -90.0), |m, v| if v.1 > m.1 { v } else { m });
    eprintln!(
        "site height {:.1} m, max horizon {el:.3} deg at az {az}, truncated {}",
        h.site_height_m, h.rays_truncated
    );
    assert_eq!(h.rays_truncated, 0);
    assert!((el - 4.0).abs() < 0.05, "max horizon {el}");
    assert_eq!(az, 171.0);
    assert!(h.profile.iter().all(|v| v.1 < 5.0));
}

// ── moonlight-service-volume ─────────────────────────────────────────────────

const SV: &str = r#"
kind = "moonlight-service-volume"
lat_min_deg = -90.0
lat_max_deg = -80.0
lat_step_deg = 5.0
lon_step_deg = 90.0
horizon_hours = 6.0
step_min = 60.0
"#;

fn run_sv(src: &str) -> Value {
    let s: kshana::lunar_service::LunarServiceScenario = toml::from_str(src).expect("parses");
    serde_json::to_value(s.try_run().expect("runs")).expect("json")
}

#[test]
fn service_volume_terrain_is_additive_and_only_removes_satellites() {
    let flat = run_sv(SV);
    assert!(flat.get("terrain").is_none());
    let mut zero = run_sv(&format!(
        "{SV}\n[terrain]\nuser_horizon = {{ source = \"test\", table = [[0.0, 0.0]] }}\n"
    ));
    assert_eq!(zero["terrain"]["n_points_outside_dem"], 0);
    zero.as_object_mut().unwrap().remove("terrain");
    assert_eq!(
        zero, flat,
        "a zero horizon under a 5 deg mask is the flat run"
    );
    let walled = run_sv(&format!(
        "{SV}\n[terrain]\nuser_horizon = {{ source = \"ILLUSTRATIVE\", table = [[0.0, 70.0], [90.0, 20.0], [180.0, 70.0], [270.0, 20.0]] }}\n"
    ));
    let f = |v: &Value, k: &str| v[k].as_f64().unwrap();
    assert!(f(&walled, "coverage_pct") < f(&flat, "coverage_pct"));
    assert!(walled["max_sats"].as_u64() <= flat["max_sats"].as_u64());
    let station =
        format!("{SV}\n[terrain]\nstation_horizon = {{ source = \"x\", table = [[0.0, 1.0]] }}\n");
    let s: kshana::lunar_service::LunarServiceScenario = toml::from_str(&station).unwrap();
    assert!(s.try_run().unwrap_err().contains("station_horizon"));
}

/// PIN-SCOPE:    the SHA-256 of the vendored DEM image the run echoes
/// PIN-EXCLUDES: the horizons themselves
#[test]
fn service_volume_dem_points_outside_the_crop_keep_the_flat_mask() {
    let src = format!(
        "{SV}\nlat_max_deg = -70.0\n[terrain]\ndem_path = \"{DEM}\"\nmax_range_km = 50.0\n"
    )
    .replace("lat_max_deg = -80.0\n", "");
    let v = run_sv(&src);
    let t = &v["terrain"];
    // Rings at -90, -85, -80, -75, -70: the crop reaches about 76.2 S, so -75 and -70
    // (4 points each) are outside it.
    assert_eq!(t["n_points_outside_dem"], 8, "{t}");
    assert_eq!(
        t["dem"]["image_sha256"],
        "639eb45c21e3df38cffbcf8048da4f3a92aa150b9aea534e10712be0dad4edab"
    );
}

/// The per-satellite export site is masked by the terrain like a grid point: with a
/// `terrain` section every export row gains `clears_terrain` (visible and at or above the
/// site's horizon at its azimuth), the report gains the site's horizon echo, and the CSV
/// gains the column. Without a `terrain` section the export is unchanged.
#[test]
fn the_export_site_is_masked_by_the_terrain() {
    let site = "export_site_lat_deg = -89.0\nexport_site_lon_deg = 0.0\n";
    let src = format!("{site}{SV}");
    let flat = run_sv(&src);
    let rows = flat["per_sat_geometry"].as_array().expect("export rows");
    assert!(rows.iter().all(|r| r.get("clears_terrain").is_none()));
    assert!(flat.get("export_site_terrain").is_none());

    // A uniform 20 deg wall at every azimuth.
    let walled_src = format!(
        "{src}\n[terrain]\nuser_horizon = {{ source = \"ILLUSTRATIVE\", table = [[0.0, 20.0], [180.0, 20.0]] }}\n"
    );
    let walled = run_sv(&walled_src);
    let rows = walled["per_sat_geometry"].as_array().unwrap();
    let (mut visible, mut cleared) = (0, 0);
    for r in rows {
        let el = r["el_deg"].as_f64().unwrap();
        let vis = r["visible"].as_bool().unwrap();
        let clears = r["clears_terrain"]
            .as_bool()
            .expect("clears_terrain present");
        assert_eq!(clears, vis && el >= 20.0, "{r}");
        visible += vis as usize;
        cleared += clears as usize;
    }
    assert!(
        cleared < visible,
        "the wall must hide some visible satellites ({cleared} of {visible})"
    );
    // The geometry itself does not move.
    let strip = |v: &Value| -> Vec<Value> {
        v["per_sat_geometry"]
            .as_array()
            .unwrap()
            .iter()
            .map(|r| {
                let mut r = r.clone();
                r.as_object_mut().unwrap().remove("clears_terrain");
                r
            })
            .collect()
    };
    assert_eq!(strip(&walled), strip(&flat));
    let e = &walled["export_site_terrain"];
    assert_eq!(e["horizon_max_deg"], 20.0);
    assert_eq!(e["sources"][0], "ILLUSTRATIVE");

    // The runtime CSV carries the column only with terrain.
    let out = kshana::api::run_toml(&walled_src).unwrap();
    let csv = out.csv.expect("export csv");
    assert!(
        csv.lines().any(|l| l.ends_with(",clears_terrain")),
        "{}",
        &csv[..400]
    );
    let plain = kshana::api::run_toml(&src).unwrap().csv.unwrap();
    assert!(!plain.contains("clears_terrain"));
    // Every numeric field has a unit, the export rows' own included, with and without
    // terrain.
    for doc_src in [&walled_src, &src] {
        let json = kshana::api::run_toml(doc_src).unwrap().json;
        let audit = kshana::field_schema::audit_document(&serde_json::from_str(&json).unwrap());
        assert!(audit.missing.is_empty(), "{:?}", audit.missing);
        assert!(audit.malformed.is_empty());
    }
    // A document without an export site carries none of the export-row units.
    let no_export: Value = serde_json::from_str(&kshana::api::run_toml(SV).unwrap().json).unwrap();
    assert!(no_export["units"].get("per_sat_geometry[].t_s").is_none());
}

// ── a latitude/longitude DEM tile (realdata::lola_dem) ───────────────────────

/// The vendored polar crop resampled onto a realdata::lola_dem latitude/longitude tile
/// (90 to 83 deg S every 0.01 deg, all longitudes every 0.5 deg; the user points reach 84 S), written to a unique
/// temporary file.
fn crop_as_tile(label: &str) -> std::path::PathBuf {
    let (dem, _) = PolarDem::load(DEM).expect("loads");
    let tile =
        kshana::lunar_terrain::rasterise_tile(&dem, (-90.0, -83.0), (-180.0, 180.0), 701, 721);
    let nanos = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let path = std::env::temp_dir().join(format!(
        "kshana-dem-tile-{label}-{}-{nanos}.txt",
        std::process::id()
    ));
    std::fs::write(&path, tile.to_text()).unwrap();
    path
}

/// `dem_tile_path` wires realdata::lola_dem into the horizon ray march: the station's
/// horizon from a tile resampled from the vendored crop agrees with the crop's own to
/// 0.5 deg at every whole degree (the bound was fixed before the first run: two bilinear
/// resamplings of a 1.2 km grid), the report echoes the tile with its units, and the two
/// DEM inputs are refused together.
#[test]
fn a_lat_lon_dem_tile_gives_the_station_the_crop_horizon() {
    let tile = crop_as_tile("station");
    let tile_s = tile.to_str().unwrap();
    let base = format!("{SMALL}\n[terrain]\nmax_range_km = 60.0\n");
    let polar = run(&format!("{base}dem_path = \"{DEM}\"\n"));
    let by_tile_src = format!("{base}dem_tile_path = \"{tile_s}\"\n");
    let by_tile = run(&by_tile_src);
    let prof = |v: &Value| -> Vec<f64> {
        v["terrain"]["station"]["profile_deg"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect()
    };
    let (a, b) = (prof(&polar), prof(&by_tile));
    assert_eq!(a.len(), 360);
    let worst = a
        .iter()
        .zip(&b)
        .map(|(x, y)| (x - y).abs())
        .fold(0.0_f64, f64::max);
    eprintln!("station horizon, tile vs crop: worst {worst:.3} deg");
    assert!(worst <= 0.5, "worst |tile - crop| = {worst} deg");

    let t = &by_tile["terrain"];
    assert!(t.get("dem").is_none());
    assert_eq!(t["dem_tile"]["n_lat"], 701);
    assert_eq!(t["dem_tile"]["sha256"].as_str().unwrap().len(), 64);
    assert!(t["station"]["sources"]
        .as_array()
        .unwrap()
        .iter()
        .any(|s| s == "dem"));
    let out = kshana::api::run_toml(&by_tile_src).unwrap();
    let doc: Value = serde_json::from_str(&out.json).unwrap();
    assert!(kshana::field_schema::audit_document(&doc)
        .missing
        .is_empty());
    assert!(doc["units"].get("terrain.dem_tile.pixel_m").is_some());
    let polar_doc: Value = serde_json::from_str(
        &kshana::api::run_toml(&format!("{base}dem_path = \"{DEM}\"\n"))
            .unwrap()
            .json,
    )
    .unwrap();
    assert!(polar_doc["units"].get("terrain.dem_tile.pixel_m").is_none());

    let both = format!("{base}dem_path = \"{DEM}\"\ndem_tile_path = \"{tile_s}\"\n");
    let s: LunarStationCoverageScenario = toml::from_str(&both).unwrap();
    assert!(s.run().unwrap_err().contains("not both"));

    // The service volume reads the same tile at its grid points.
    let sv = run_sv(&format!(
        "{SV}\n[terrain]\nmax_range_km = 30.0\ndem_tile_path = \"{tile_s}\"\n"
    ));
    assert_eq!(sv["terrain"]["dem_tile"]["n_lon"], 721);
    assert!(sv["terrain"]["user_sources"]
        .as_array()
        .unwrap()
        .iter()
        .any(|s| s == "dem"));
    let _ = std::fs::remove_file(&tile);
}

// ── units ─────────────────────────────────────────────────────────────────────

fn audit(src: &str) -> kshana::field_schema::DocumentAudit {
    let out = kshana::api::run_toml(src).expect("runs");
    kshana::field_schema::audit_document(&serde_json::from_str(&out.json).unwrap())
}

/// Every numeric field a terrain document emits (stated horizons and the DEM, both kinds)
/// has a unit; the terrain units appear only in a document that carries `[terrain]`, so a
/// flat document's units block is unchanged.
#[test]
fn every_terrain_field_has_a_unit_and_only_terrain_documents_carry_them() {
    let station = format!(
        "{SMALL}\n[terrain]\ndem_path = \"{DEM}\"\nmax_range_km = 40.0\nrange_step_m = 1200.0\n\
         station_horizon = {{ source = \"ILLUSTRATIVE\", table = [[0.0, 3.0], [180.0, 6.0]] }}\n\
         user_horizon = {{ source = \"ILLUSTRATIVE\", table = [[0.0, 2.0]] }}\n"
    );
    let sv = format!(
        "{SV}\n[terrain]\ndem_path = \"{DEM}\"\nmax_range_km = 40.0\nrange_step_m = 1200.0\n\
         user_horizon = {{ source = \"ILLUSTRATIVE\", table = [[0.0, 2.0]] }}\n"
    );
    for src in [&station, &sv] {
        let a = audit(src);
        assert!(a.missing.is_empty(), "missing units: {:?}", a.missing);
        assert!(
            a.malformed.is_empty(),
            "malformed units: {:?}",
            a.malformed.len()
        );
    }
    for flat in [SMALL, SV] {
        let out = kshana::api::run_toml(flat).expect("runs");
        let doc: Value = serde_json::from_str(&out.json).unwrap();
        assert!(
            !doc["units"]
                .as_object()
                .unwrap()
                .keys()
                .any(|k| k.contains("terrain") || k.contains("horizon")),
            "a flat document's units block must not change"
        );
    }
}

// ── independent numpy ray-cast (pre-registered) ───────────────────────────────

/// The pre-registered comparison (tests/fixtures/lunar_terrain/PREREGISTRATION.md, committed
/// alone in edbb9b02 before the script existed): scripts/gen_lunar_terrain_ref.py, numpy only,
/// re-computes the horizon at five sites on the vendored crop. Bars B1 to B3: site heights to
/// 1e-6 m, all 1800 elevations to 1e-6 deg, truncated-ray counts exact. Checks the arithmetic,
/// not the model.
#[test]
fn the_horizon_matches_the_preregistered_numpy_ray_cast() {
    let r: Value = serde_json::from_str(
        &std::fs::read_to_string("tests/fixtures/lunar_terrain/reference.json").expect("ref"),
    )
    .unwrap();
    let (dem, echo) = PolarDem::load(DEM).expect("loads");
    assert_eq!(r["image_sha256"].as_str().unwrap(), echo.image_sha256);
    let p = HorizonParams {
        antenna_height_m: r["antenna_height_m"].as_f64().unwrap(),
        azimuth_step_deg: r["azimuth_step_deg"].as_f64().unwrap(),
        range_step_m: r["range_step_m"].as_f64().unwrap(),
        max_range_m: r["max_range_m"].as_f64().unwrap(),
    };
    let (mut worst_h, mut worst_el, mut n) = (0.0_f64, 0.0_f64, 0usize);
    for s in r["sites"].as_array().unwrap() {
        let (lat, lon) = (
            s["lat_deg"].as_f64().unwrap(),
            s["lon_deg"].as_f64().unwrap(),
        );
        let h = horizon_profile(&dem, up_of(lat, lon), &p).expect("horizon");
        worst_h = worst_h.max((h.site_height_m - s["site_height_m"].as_f64().unwrap()).abs());
        assert_eq!(
            h.rays_truncated as u64,
            s["rays_truncated"].as_u64().unwrap(),
            "B3 at {lat},{lon}"
        );
        let refp = s["profile_deg"].as_array().unwrap();
        assert_eq!(refp.len(), h.profile.len());
        for (a, b) in h.profile.iter().zip(refp) {
            worst_el = worst_el.max((a.1 - b.as_f64().unwrap()).abs());
            n += 1;
        }
    }
    eprintln!("numpy ray-cast: worst site height {worst_h:e} m, worst elevation {worst_el:e} deg over {n}");
    assert_eq!(n, 1800);
    assert!(worst_h <= 1e-6, "B1: {worst_h} m");
    assert!(worst_el <= 1e-6, "B2: {worst_el} deg");
}
