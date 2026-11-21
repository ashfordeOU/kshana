// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana interference-atlas`: persistent cells form zones, versions are content hashes that
//! detect a change and chain, the station C/N0 layer finds a simultaneous drop one ground-track
//! repeat later, and the ground-against-airborne comparison reads the day's cell.
use kshana::interference_atlas::*;
use serde_json::{json, Value};

fn day(date: &str, cells: &[(i64, i64, &str)]) -> String {
    let feats: Vec<Value> = cells
        .iter()
        .map(|(i, j, s)| json!({"type": "Feature", "geometry": null, "properties": {"cell_i": i, "cell_j": j, "status": s}}))
        .collect();
    json!({"type": "FeatureCollection", "kshana_interference_map": {"date": date, "grid": {"cell_deg": 0.5},
        "method": {"id": "kshana-interference-map/adsb/v2"}}, "features": feats})
    .to_string()
}

fn five_days() -> Vec<(String, String)> {
    (1..=5)
        .map(|d| {
            let date = format!("2026-03-0{d}");
            let z = if d == 3 { "not_degraded" } else { "degraded" };
            let once = if d == 2 { "degraded" } else { "not_degraded" };
            let cells = [
                (100, 200, z),
                (100, 201, z),
                (101, 202, z),
                (120, 300, once),
                (130, 310, "insufficient_sample"),
            ];
            (format!("day{d}.geojson"), day(&date, &cells))
        })
        .collect()
}

#[test]
fn persistent_cells_form_zones_and_versions_detect_changes() {
    let a = build(&five_days(), &AtlasParams::PREREGISTERED_V1, None).unwrap();
    assert_eq!(a["schema"], ATLAS_SCHEMA);
    let zones = a["zones"].as_array().unwrap();
    assert_eq!(zones.len(), 1, "{zones:?}");
    assert_eq!(zones[0]["cells"], 3); // 8-connected: (101,202) touches (100,201) at a corner
    assert_eq!(zones[0]["days_degraded_any_cell"], 4);
    let c = a["cells"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| c["cell_i"] == 100 && c["cell_j"] == 200)
        .unwrap();
    assert_eq!(c["days_called"], 5);
    assert_eq!(c["persistence"], 0.8);
    assert!(a["cells"]
        .as_array()
        .unwrap()
        .iter()
        .all(|c| c["cell_i"] != 130));
    assert!(verify(&a));
    // Same inputs, same version; a changed atlas fails.
    assert_eq!(
        a["version"],
        build(&five_days(), &AtlasParams::PREREGISTERED_V1, None).unwrap()["version"]
    );
    let mut t = a.clone();
    t["zones"][0]["cells"] = json!(4);
    assert!(!verify(&t));
    // Round trip through text keeps the version valid.
    let back: Value = serde_json::from_str(&serde_json::to_string_pretty(&a).unwrap()).unwrap();
    assert!(verify(&back));
    // A chained version names its predecessor and differs from it.
    let b = build(
        &five_days()[..4],
        &AtlasParams::PREREGISTERED_V1,
        a["version"].as_str(),
    )
    .unwrap();
    assert_eq!(b["previous_version"], a["version"]);
    assert_ne!(b["version"], a["version"]);
    assert!(verify(&b));
}

#[test]
fn mixed_or_bad_inputs_are_refused_and_the_example_product_reads() {
    let mut v = five_days();
    v.push(("x".into(), day("2026-03-06", &[]).replace("0.5", "1.0")));
    assert_eq!(
        build(&v, &AtlasParams::PREREGISTERED_V1, None),
        Err(AtlasError::Mixed)
    );
    assert!(matches!(
        build(
            &[("n".into(), "{}".into())],
            &AtlasParams::PREREGISTERED_V1,
            None
        ),
        Err(AtlasError::NotAProduct(_))
    ));
    assert_eq!(
        build(&[], &AtlasParams::PREREGISTERED_V1, None),
        Err(AtlasError::Empty)
    );
    let p = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("examples/interference-map/output/adsb-custom-2026-03-01.geojson");
    let ex = std::fs::read_to_string(p).unwrap();
    let a = build(&[("ex".into(), ex)], &AtlasParams::PREREGISTERED_V1, None).unwrap();
    assert!(!a["cells"].as_array().unwrap().is_empty());
    assert_eq!(a["source"], "kshana-interference-map/adsb");
}

/// A minimal RINEX 3 observation file of six GPS satellites with S1C only.
fn obs(day: u32, start_s: f64, n: usize, drop: impl Fn(usize) -> f64) -> String {
    let mut s = String::new();
    s.push_str(&format!(
        "{:<60}{}\n",
        "     3.04           OBSERVATION DATA    G", "RINEX VERSION / TYPE"
    ));
    s.push_str(&format!(
        "{:<60}{}\n",
        "  4000000.0000  1000000.0000  4800000.0000", "APPROX POSITION XYZ"
    ));
    s.push_str(&format!("{:<60}{}\n", "G    1 S1C", "SYS / # / OBS TYPES"));
    s.push_str(&format!("{:<60}{}\n", "    30.000", "INTERVAL"));
    s.push_str(&format!("{:<60}{}\n", "", "END OF HEADER"));
    for k in 0..n {
        let sod = start_s + 30.0 * k as f64;
        let (h, m, sec) = (
            (sod / 3600.0).floor(),
            ((sod % 3600.0) / 60.0).floor(),
            sod % 60.0,
        );
        s.push_str(&format!(
            "> 2026 03 {day:02} {:02} {:02}{:11.7}  0  6\n",
            h as u32, m as u32, sec
        ));
        for prn in 1..=6 {
            let v = 40.0 + prn as f64 - drop(k);
            s.push_str(&format!("G{prn:02}{v:14.3}\n"));
        }
    }
    s
}

#[test]
fn the_station_layer_finds_a_simultaneous_drop() {
    // Day 2's epoch at 00:00:26 + 30·k is one ground-track repeat (86 156 s) after day 1's
    // epoch 9 + k (00:04:30 + 30·k): 86 400 + 26 − 86 156 = 270 s.
    let earlier = kshana::rinex_obs::parse_obs(&obs(1, 0.0, 200, |_| 0.0)).unwrap();
    let today = kshana::rinex_obs::parse_obs(&obs(2, 26.0, 150, |k| {
        if (40..60).contains(&k) {
            10.0
        } else {
            0.0
        }
    }))
    .unwrap();
    let layer = cors_layer(&today, &earlier, &CorsParams::PREREGISTERED_V1).unwrap();
    assert_eq!(layer["schema"], CORS_SCHEMA);
    let iv = layer["intervals"].as_array().unwrap();
    assert_eq!(iv.len(), 1, "{iv:?}");
    assert_eq!(iv[0]["epochs"], 20);
    // Against a product whose cell at the station is degraded: both.
    let g = kshana::frames::ecef_to_geodetic([4_000_000.0, 1_000_000.0, 4_800_000.0]);
    let (lat, lon) = (g.lat_rad.to_degrees(), g.lon_rad.to_degrees());
    let grid = kshana::interference_map::grid::Grid::new(0.5).unwrap();
    let c = grid.cell_of(lat, lon);
    let prod: Value =
        serde_json::from_str(&day("2026-03-02", &[(c.i as i64, c.j as i64, "degraded")])).unwrap();
    assert_eq!(
        ground_vs_airborne(&layer, &prod, lat, lon)["comparison"],
        "both"
    );
    let prod2: Value = serde_json::from_str(&day("2026-03-02", &[])).unwrap();
    assert_eq!(
        ground_vs_airborne(&layer, &prod2, lat, lon)["comparison"],
        "not_observed"
    );
    // No common satellites: an error.
    let empty = kshana::rinex_obs::parse_obs(&obs(5, 0.0, 3, |_| 0.0)).unwrap();
    assert_eq!(
        cors_layer(&empty, &earlier, &CorsParams::PREREGISTERED_V1),
        Err(AtlasError::NoCn0)
    );
}

#[test]
fn the_command_line() {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-interference-atlas-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let mut paths = Vec::new();
    for (n, t) in five_days() {
        let p = dir.join(n);
        std::fs::write(&p, t).unwrap();
        paths.push(p.display().to_string());
    }
    let run = |args: &[String]| {
        let o = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .output()
            .unwrap();
        (
            o.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&o.stdout).to_string(),
            String::from_utf8_lossy(&o.stderr).to_string(),
        )
    };
    let atlas = dir.join("atlas.json").display().to_string();
    let mut args = vec!["interference-atlas".to_string(), "build".into()];
    args.extend(paths.iter().cloned());
    args.extend(["--out".into(), atlas.clone()]);
    let (code, _, err) = run(&args);
    assert_eq!(code, 0, "{err}");
    assert!(err.contains("1 zones") || err.contains("zones"), "{err}");
    assert_eq!(
        run(&["interference-atlas".into(), "verify".into(), atlas.clone()]).0,
        0
    );
    let text = std::fs::read_to_string(&atlas)
        .unwrap()
        .replace("\"days_called\": 5", "\"days_called\": 6");
    std::fs::write(&atlas, text).unwrap();
    assert_eq!(
        run(&["interference-atlas".into(), "verify".into(), atlas.clone()]).0,
        1
    );
    assert_eq!(run(&["interference-atlas".into(), "build".into()]).0, 2);
    let _ = std::fs::remove_dir_all(&dir);
}

/// An observatory day product (`kshana interference-map daily`): its cells carry `state`, and its
/// `data` block names the source licence.
fn observatory_day(date: &str, cells: &[(i64, i64, &str)]) -> String {
    let feats: Vec<Value> = cells
        .iter()
        .map(|(i, j, s)| json!({"type": "Feature", "geometry": null, "properties": {"cell_i": i, "cell_j": j, "state": s}}))
        .collect();
    json!({"type": "FeatureCollection", "kshana_observatory": {"date": date, "grid": {"cell_deg": 0.5},
        "method": {"id": "kshana-interference-map/adsb/v2"},
        "data": {"dataset": "adsb-lol", "licence": "ODbL-1.0",
                 "licence_url": "https://opendatacommons.org/licenses/odbl/1-0/",
                 "attribution": "Contains aircraft position data from adsb.lol, made available under the Open Database License (ODbL 1.0)"}},
        "features": feats})
    .to_string()
}

#[test]
fn observatory_day_products_build_an_atlas_that_carries_their_licence() {
    let days: Vec<(String, String)> = (1..=4)
        .map(|d| {
            let date = format!("2026-09-1{d}");
            let s = if d == 2 { "not_degraded" } else { "degraded" };
            let cells = [(300, 400, s), (300, 401, s), (310, 410, "not_observed")];
            (format!("obs{d}.geojson"), observatory_day(&date, &cells))
        })
        .collect();
    let a = build(&days, &AtlasParams::PREREGISTERED_V1, None).unwrap();
    // Degraded on 3 of 4 called days: persistence 0.75, one zone of two cells; `not_observed` is
    // not a call.
    let zones = a["zones"].as_array().unwrap();
    assert_eq!(zones.len(), 1, "{zones:?}");
    assert_eq!(zones[0]["cells"], 2);
    assert!(a["cells"]
        .as_array()
        .unwrap()
        .iter()
        .all(|c| c["cell_i"] != 310));
    // The licence of the source data travels with the atlas, once.
    let ds = a["data_sources"].as_array().unwrap();
    assert_eq!(ds.len(), 1);
    assert_eq!(ds[0]["licence"], "ODbL-1.0");
    assert!(ds[0]["attribution"].as_str().unwrap().contains("adsb.lol"));
    assert!(verify(&a));
}
