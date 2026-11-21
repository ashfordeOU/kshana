// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana adsb-indicators`: on synthetic tracks with an interference area where aircraft stop
//! reporting, jump and report low accuracy, the area's cells are flagged and the rest are not,
//! the denominators count the silent aircraft, the indicators agree with the low-accuracy share,
//! and no identifier is written.
use kshana::adsb_indicators::*;
use kshana::interference_map::grid::Grid;

/// 160 aircraft flying east at 450 kt over 40–44 N, 20–24 E, one report every 4 s at FL350. Half
/// cross the band 41.5–42.5 N. Inside the area 41.5–42.5 N, 21.5–22.5 E: aircraft 0, 1 and 2 mod 5
/// fall silent, aircraft 3 mod 5 jump 0.05° north on every other report, and every report has
/// NIC and NACp 0.
fn synthetic() -> String {
    let mut s = String::from("timestamp,aircraft_id,lat,lon,alt_baro_ft,gs_kt,nic,nacp\n");
    let t0 = 1_772_323_200.0; // 2026-03-01T00:00:00Z
    for a in 0..160 {
        let lat = if a % 2 == 0 {
            41.55 + 0.9 * (a as f64 / 160.0)
        } else {
            40.1 + 3.8 * (a as f64 / 160.0)
        };
        let lat = if a % 2 == 1 && (41.5..=42.5).contains(&lat) {
            lat + 1.1
        } else {
            lat
        };
        let speed_deg_s = 450.0 * 0.514444 / (111_320.0 * f64::cos(lat.to_radians()));
        let start = t0 + 30.0 * a as f64;
        let mut k = 0;
        loop {
            let t = start + 4.0 * k as f64;
            let lon = 20.0 + speed_deg_s * (t - start);
            if lon > 24.0 {
                break;
            }
            let inside = (41.5..=42.5).contains(&lat) && (21.5..=22.5).contains(&lon);
            k += 1;
            if inside && a % 5 < 3 {
                continue; // silent
            }
            let (mut la, nic, nacp) = if inside { (lat, 0, 0) } else { (lat, 8, 9) };
            if inside && a % 5 == 3 && k % 2 == 0 {
                la += 0.05;
            }
            s.push_str(&format!(
                "{t},AC{a:04},{la:.5},{lon:.5},35000,450,{nic},{nacp}\n"
            ));
        }
    }
    s
}

#[test]
fn the_area_is_flagged_and_nothing_else() {
    let text = synthetic();
    let doc = indicators(&text, &Grid::new(0.5).unwrap(), &Params::PREREGISTERED_V1).unwrap();
    assert_eq!(doc["schema"], SCHEMA);
    assert_eq!(doc["label"], "MODELLED");
    let feats = doc["days"][0]["cells"]["features"].as_array().unwrap();
    let mut flagged_inside = 0;
    for f in feats {
        let p = &f["properties"];
        let (i, j) = (p["cell_i"].as_i64().unwrap(), p["cell_j"].as_i64().unwrap());
        // The area is cells i = 263..264 (41.5–42.5 N), j = 403..404 (21.5–22.5 E).
        let inside = (263..=264).contains(&i) && (403..=404).contains(&j);
        let flags = p["flags"].as_array().unwrap();
        if inside {
            assert!(flags.iter().any(|x| x == "update_rate_collapse"), "{p}");
            assert!(flags.iter().any(|x| x == "track_inconsistency"), "{p}");
            // Silent aircraft are in the denominator: more exposed than reporting.
            assert!(
                p["exposed_aircraft"].as_u64().unwrap()
                    > p["reporting_aircraft"].as_u64().unwrap_or(0)
            );
            flagged_inside += 1;
        } else {
            assert!(flags.is_empty(), "cell {i},{j}: {p}");
        }
    }
    assert_eq!(flagged_inside, 4);
    let agree = &doc["agreement_with_low_accuracy"];
    assert!(agree["spearman_gap"].as_f64().unwrap() > 0.5, "{agree}");
    assert_eq!(agree["table"]["low_flag_only"], 0);
    assert_eq!(agree["table"]["indicator_only"], 0);
    // The exposed denominator lowers the low-accuracy share where aircraft fell silent.
    for d in doc["denominator_effect"].as_array().unwrap() {
        assert!(
            d["low_share_of_exposed"].as_f64().unwrap()
                <= d["low_share_of_reporting"].as_f64().unwrap() + 1e-12
        );
    }
    // No identifier reaches the output.
    let out = serde_json::to_string(&doc).unwrap();
    assert!(!out.contains("AC00"));
}

#[test]
fn errors_and_small_samples() {
    assert!(matches!(
        indicators(
            "timestamp,lat,lon\n",
            &Grid::new(0.5).unwrap(),
            &Params::PREREGISTERED_V1
        ),
        Err(IndicatorError::MissingColumn("aircraft_id"))
    ));
    // Three aircraft: nothing is published.
    let text = "timestamp,aircraft_id,lat,lon,alt_baro_ft\n1772323200,A,42,22,35000\n1772323204,B,42,22,35000\n1772323208,C,42,22,35000\n";
    let doc = indicators(text, &Grid::new(0.5).unwrap(), &Params::PREREGISTERED_V1).unwrap();
    assert_eq!(doc["days"][0]["cells_published"], 0);
    assert_eq!(doc["days"][0]["cells_suppressed_below_min_distinct"], 1);
}

#[test]
fn the_command_line() {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-adsb-indicators-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let csv = dir.join("a.csv");
    std::fs::write(&csv, synthetic()).unwrap();
    let run = |args: &[&str]| {
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
    let (code, out, err) = run(&["adsb-indicators", &csv.display().to_string()]);
    assert_eq!(code, 0, "{err}");
    assert!(err.contains("MODELLED"));
    let d: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(d["method"]["method"], METHOD_ID);
    assert_eq!(
        run(&[
            "adsb-indicators",
            &csv.display().to_string(),
            "--cell-deg",
            "50"
        ])
        .0,
        2
    );
    assert_eq!(run(&["adsb-indicators"]).0, 2);
    let _ = std::fs::remove_dir_all(&dir);
}
