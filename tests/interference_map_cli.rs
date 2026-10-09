// SPDX-License-Identifier: AGPL-3.0-only
//! End-to-end tests of `kshana interference-map` and `kshana route-exposure` on synthetic
//! inputs generated here. No network, no real data, no identifiers of real aircraft or
//! vessels: every identifier is a made-up label.

use std::path::{Path, PathBuf};
use std::process::{Command, Output};

fn kshana(args: &[&str]) -> Output {
    Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .expect("run kshana")
}

fn scratch(name: &str) -> PathBuf {
    let d = std::env::temp_dir().join(format!("kshana-imap-{}-{name}", std::process::id()));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn p(path: &Path) -> &str {
    path.to_str().unwrap()
}

/// Seven 0.5-degree cells along 50.2 N, 12 aircraft each. In the cell at 12.2 E, 7 of the
/// 12 aircraft report NACp 0 / NIC 0 for the whole pass.
fn adsb_fixture() -> String {
    let mut csv = String::from("timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp\n");
    for cell in 0..7 {
        let lon = 10.2 + 0.5 * cell as f64;
        for a in 0..12 {
            let id = format!("SYN{cell}{a:02}");
            for k in 0..6 {
                csv.push_str(&format!(
                    "2026-03-01T09:0{k}:00Z,{id},40.1,5.1,33000,10,11\n"
                ));
            }
            let hit = cell == 2 && a < 7;
            let (nic, nacp) = if hit { (0, 0) } else { (9, 10) };
            for k in 0..4 {
                csv.push_str(&format!(
                    "2026-03-01T10:0{k}:00Z,{id},50.2,{lon},33000,{nic},{nacp}\n"
                ));
            }
        }
    }
    csv
}

const ROUTE: &str = r#"{"type":"Feature","properties":{},"geometry":{"type":"LineString","coordinates":[[10.0,50.2],[13.5,50.2]]}}"#;

#[test]
fn adsb_end_to_end_with_route_exposure() {
    let dir = scratch("adsb");
    let input = dir.join("in.csv");
    std::fs::write(&input, adsb_fixture()).unwrap();
    let out = dir.join("out");
    let r = kshana(&[
        "interference-map",
        "adsb",
        p(&input),
        "--dataset",
        "adsb-lol",
        "--out",
        p(&out),
    ]);
    assert!(r.status.success(), "{}", String::from_utf8_lossy(&r.stderr));

    let text = std::fs::read_to_string(out.join("adsb-2026-03-01.geojson")).unwrap();
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    let m = &v["kshana_interference_map"];
    assert_eq!(m["data"]["licence"], "ODbL-1.0");
    assert!(m["data"]["attribution"]
        .as_str()
        .unwrap()
        .contains("adsb.lol"));
    assert_eq!(m["method"]["id"], "kshana-interference-map/adsb/v1");
    assert_eq!(m["date"], "2026-03-01");
    let degraded: Vec<_> = v["features"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|f| f["properties"]["degraded"] == true)
        .collect();
    assert_eq!(degraded.len(), 1);
    assert!(!text.contains("SYN"), "no identifier may reach the output");

    // Route 10.0 E to 13.5 E: seven cells, one degraded.
    let route = dir.join("route.geojson");
    std::fs::write(&route, ROUTE).unwrap();
    let report = dir.join("report.json");
    let r = kshana(&[
        "route-exposure",
        "--route",
        p(&route),
        "--map",
        p(&out),
        "--out",
        p(&report),
        "--json",
    ]);
    assert!(r.status.success(), "{}", String::from_utf8_lossy(&r.stderr));
    let rep: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&report).unwrap()).unwrap();
    let row = &rep["kshana_route_exposure"]["rows"][0];
    assert_eq!(row["date"], "2026-03-01");
    let deg = row["share_degraded"].as_f64().unwrap();
    assert!((deg - 1.0 / 7.0).abs() < 0.01, "{deg}");
    assert!(row["map_attribution"]
        .as_str()
        .unwrap()
        .contains("adsb.lol"));

    // Date range excluding the day is an error, not an empty success.
    let r = kshana(&[
        "route-exposure",
        "--route",
        p(&route),
        "--map",
        p(&out),
        "--from",
        "2026-03-02",
    ]);
    assert!(!r.status.success());
}

#[test]
fn ais_end_to_end_with_land_polygons() {
    let dir = scratch("ais");
    let mut csv = String::from("timestamp,vessel_id,lat,lon,sog_kn\n");
    // Ordinary traffic, plus six vessels reporting from inside a synthetic island.
    for v in 0..6 {
        for k in 0..4 {
            csv.push_str(&format!(
                "2026-03-01T10:0{k}:00Z,SHIP{v},{},24.9,11\n",
                59.60 + 0.01 * v as f64
            ));
            csv.push_str(&format!(
                "2026-03-01T11:0{k}:00Z,LAND{v},{},24.5,4\n",
                60.50 + 0.01 * v as f64
            ));
        }
    }
    let input = dir.join("ais.csv");
    let land = dir.join("land.geojson");
    std::fs::write(&input, csv).unwrap();
    std::fs::write(
        &land,
        r#"{"type":"Polygon","coordinates":[[[24,60],[25,60],[25,61],[24,61],[24,60]]]}"#,
    )
    .unwrap();
    let out = dir.join("out");
    let r = kshana(&[
        "interference-map",
        "ais",
        p(&input),
        "--dataset",
        "kystverket",
        "--land",
        p(&land),
        "--out",
        p(&out),
    ]);
    assert!(r.status.success(), "{}", String::from_utf8_lossy(&r.stderr));
    let text = std::fs::read_to_string(out.join("ais-2026-03-01.geojson")).unwrap();
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    assert_eq!(v["kshana_interference_map"]["data"]["licence"], "NLOD-2.0");
    assert!(v["kshana_interference_map"]["data"]["coverage_notes"][0]
        .as_str()
        .unwrap()
        .contains("15 m"));
    let flagged: Vec<_> = v["features"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|f| f["properties"]["status"] == "anomalous")
        .collect();
    assert_eq!(flagged.len(), 1, "{text}");
    assert!(!text.contains("SHIP") && !text.contains("LAND"));
}

#[test]
fn refusals_are_clear() {
    let dir = scratch("refuse");
    let input = dir.join("in.csv");
    std::fs::write(&input, adsb_fixture()).unwrap();
    let out = dir.join("out");
    let run = |extra: &[&str]| {
        let mut a = vec!["interference-map", "adsb", p(&input), "--out", p(&out)];
        a.extend_from_slice(extra);
        let r = kshana(&a);
        (
            r.status.code(),
            String::from_utf8_lossy(&r.stderr).to_string(),
        )
    };
    let (c, e) = run(&[]);
    assert_eq!(c, Some(2));
    assert!(e.contains("--dataset is required"), "{e}");
    let (c, e) = run(&["--dataset", "opensky"]);
    assert_eq!(c, Some(2));
    assert!(e.contains("unknown dataset"), "{e}");
    let (c, e) = run(&["--dataset", "kystverket"]);
    assert_eq!(c, Some(2));
    assert!(e.contains("is ais data"), "{e}");
    let (c, e) = run(&["--dataset", "custom"]);
    assert_eq!(c, Some(2));
    assert!(e.contains("--licence"), "{e}");
    assert!(!out.exists(), "nothing is written when a refusal happens");
    // fetch-land never reaches the network without its flag.
    let r = kshana(&[
        "interference-map",
        "fetch-land",
        "--out",
        p(&dir.join("land.geojson")),
    ]);
    assert_eq!(r.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&r.stderr).contains("--allow-network"));
    assert!(!dir.join("land.geojson").exists());
}

#[test]
fn custom_dataset_embeds_what_the_user_supplies() {
    let dir = scratch("custom");
    let input = dir.join("in.csv");
    std::fs::write(&input, adsb_fixture()).unwrap();
    let out = dir.join("out");
    let r = kshana(&[
        "interference-map",
        "adsb",
        p(&input),
        "--dataset",
        "custom",
        "--licence",
        "CC0-1.0",
        "--licence-url",
        "https://example.invalid/l",
        "--attribution",
        "Synthetic test data",
        "--out",
        p(&out),
    ]);
    assert!(r.status.success());
    let v: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(out.join("adsb-2026-03-01.geojson")).unwrap(),
    )
    .unwrap();
    assert_eq!(
        v["kshana_interference_map"]["data"]["attribution"],
        "Synthetic test data"
    );
}

#[test]
fn help_and_unknown_subcommand() {
    let r = kshana(&["interference-map", "--help"]);
    assert!(r.status.success());
    assert!(String::from_utf8_lossy(&r.stdout).contains("fetch-land"));
    let r = kshana(&["interference-map", "bogus"]);
    assert_eq!(r.status.code(), Some(2));
    let r = kshana(&["route-exposure", "--help"]);
    assert!(r.status.success());
}

/// A synthetic readsb history trace (the layout of an extracted adsb.lol daily archive).
fn trace(icao: &str, lon: f64, nic: u8, nacp: u8) -> String {
    let e = |k: u32, lat: f64, lon: f64, nic: u8, nacp: u8| {
        format!(
            "[{}, {lat}, {lon}, 33000, 450.0, 90.0, 0, 0, {{\"nic\": {nic}, \"nac_p\": {nacp}}}, \"adsb_icao\", 33100, null, null, null]",
            k * 10
        )
    };
    let mut v: Vec<String> = (0..6).map(|k| e(k, 40.1, 5.1, 10, 11)).collect();
    v.extend((6..10).map(|k| e(k, 50.2, lon, nic, nacp)));
    format!(
        "{{\"icao\": \"{icao}\", \"timestamp\": 1772359200.0, \"trace\": [{}]}}",
        v.join(",")
    )
}

#[test]
fn adsb_reads_an_extracted_readsb_archive_directory() {
    use std::io::Write;
    let dir = scratch("readsb");
    let tree = dir.join("traces");
    for cell in 0..7 {
        let lon = 10.2 + 0.5 * cell as f64;
        for a in 0..12 {
            let id = format!("syn{cell}x{a:02}");
            let (nic, nacp) = if cell == 2 && a < 7 { (0, 0) } else { (9, 10) };
            let sub = tree.join(&id[..5]);
            std::fs::create_dir_all(&sub).unwrap();
            // readsb writes gzip under a plain .json name.
            let mut e = flate2::write::GzEncoder::new(Vec::new(), flate2::Compression::fast());
            e.write_all(trace(&id, lon, nic, nacp).as_bytes()).unwrap();
            std::fs::write(
                sub.join(format!("trace_full_{id}.json")),
                e.finish().unwrap(),
            )
            .unwrap();
        }
    }
    // Files the reader must ignore or count: a recent-trace file, and a corrupt full trace.
    std::fs::write(tree.join("trace_recent_x.json"), "ignored").unwrap();
    std::fs::write(tree.join("trace_full_corrupt.json"), [0x1f, 0x8b, 1, 2, 3]).unwrap();

    let out = dir.join("out");
    let r = kshana(&[
        "interference-map",
        "adsb",
        p(&tree),
        "--dataset",
        "adsb-lol",
        "--out",
        p(&out),
    ]);
    assert!(r.status.success(), "{}", String::from_utf8_lossy(&r.stderr));
    let text = std::fs::read_to_string(out.join("adsb-2026-03-01.geojson")).unwrap();
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    let stats = &v["kshana_interference_map"]["method"]["input_stats"];
    assert_eq!(stats["trace_files"], 84);
    assert_eq!(stats["trace_files_unreadable"], 1);
    let degraded = v["features"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|f| f["properties"]["degraded"] == true)
        .count();
    assert_eq!(degraded, 1);
    assert!(!text.contains("syn"), "no identifier may reach the output");

    // An empty directory is an error, not an empty success.
    let empty = dir.join("empty");
    std::fs::create_dir_all(&empty).unwrap();
    let r = kshana(&[
        "interference-map",
        "adsb",
        p(&empty),
        "--dataset",
        "adsb-lol",
        "--out",
        p(&dir.join("o2")),
    ]);
    assert_eq!(r.status.code(), Some(2));
}
