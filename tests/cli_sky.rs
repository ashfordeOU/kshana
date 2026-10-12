// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana sky` and `kshana skyline`: the sky-geometry functions and the skyline presets from
//! the command line.

use std::process::Command;

fn kshana(args: &[&str]) -> (bool, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .expect("run kshana");
    (
        out.status.success(),
        String::from_utf8_lossy(&out.stdout).into_owned(),
        String::from_utf8_lossy(&out.stderr).into_owned(),
    )
}

#[test]
fn sky_reads_a_toml_request_and_prints_json() {
    let dir = std::env::temp_dir().join(format!("kshana-cli-sky-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let req = dir.join("request.toml");
    std::fs::write(
        &req,
        "mask_deg = 5.0\n\
         [[satellites]]\nid = \"G01\"\naz_deg = 0.0\nel_deg = 80.0\n\
         [[satellites]]\nid = \"G02\"\naz_deg = 10.0\nel_deg = 30.0\n\
         [[satellites]]\nid = \"G03\"\naz_deg = 170.0\nel_deg = 40.0\n\
         [[satellites]]\nid = \"G04\"\naz_deg = 95.0\nel_deg = 12.0\n\
         [[satellites]]\nid = \"E11\"\naz_deg = 190.0\nel_deg = 35.0\n\
         [[satellites]]\nid = \"E12\"\naz_deg = 350.0\nel_deg = 50.0\n\
         [[satellites]]\nid = \"E13\"\naz_deg = 10.0\nel_deg = 70.0\n\
         [skyline]\npreset = \"city-street\"\n",
    )
    .unwrap();
    let (ok, out, err) = kshana(&["sky", req.to_str().unwrap()]);
    assert!(ok, "{err}");
    let v: serde_json::Value = serde_json::from_str(&out).expect("JSON on stdout");
    assert_eq!(v["label"], "MODELLED");
    assert_eq!(v["clock_labels"], serde_json::json!(["G", "E"]));
    assert_eq!(v["n_masked"], 1, "G04 at 095 deg is under the east wall");
    assert!(v["ellipse"]["semi_major_m"].as_f64().unwrap() > 0.0);

    let (ok, out, err) = kshana(&[
        "sky",
        req.to_str().unwrap(),
        "--monte-carlo",
        "200",
        "--seed",
        "36",
    ]);
    assert!(ok, "{err}");
    let mc: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(mc["samples_enu_m"].as_array().unwrap().len(), 200);
    let (ok, svg, _) = kshana(&["sky", req.to_str().unwrap(), "--svg"]);
    assert!(ok && svg.trim_start().starts_with("<svg"));
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn sky_takes_a_site_and_presets_as_flags() {
    let (ok, out, err) = kshana(&[
        "sky",
        "--site",
        "59.91,10.75,5",
        "--systems",
        "gps-baseline,galileo",
        "--time",
        "3600",
        "--skyline-preset",
        "fjord",
        "--uere",
        "1.5",
    ]);
    assert!(ok, "{err}");
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert!(v["n_masked"].as_u64().unwrap() > 0);
    assert!(v["advisory"]
        .as_str()
        .unwrap()
        .contains("not type-approved"));
    let (ok, _, err) = kshana(&["sky", "--site", "91,0", "--systems", "galileo"]);
    assert!(!ok && err.contains("lat_deg"), "{err}");
}

#[test]
fn skyline_lists_and_describes_presets() {
    let (ok, out, _) = kshana(&["skyline", "--presets"]);
    assert!(ok);
    let list: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(list.as_array().unwrap().len(), 4);
    let (ok, out, _) = kshana(&["skyline", "--preset", "fjord", "--json"]);
    assert!(ok);
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["label"], "REPRESENTATIVE");
    assert!(v["table"][90].as_f64().unwrap() > 21.0);
    assert!(v["table"][0].as_f64().unwrap() < 1.0);
    let (ok, _, err) = kshana(&["skyline", "--preset", "moon"]);
    assert!(!ok && err.contains("unknown skyline preset"), "{err}");
    let (ok, _, err) = kshana(&["skyline"]);
    assert!(!ok && err.contains("usage"), "{err}");
}

#[test]
fn sky_reads_element_sets_and_dates_the_sky() {
    let tle = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/celestrak/gps-ops_2026-06-07.txt"
    );
    let (ok, out, err) = kshana(&[
        "sky",
        "--site",
        "52.0,5.0,45",
        "--tle",
        tle,
        "--tle-system",
        "G",
        "--epoch",
        "2026-06-07T12:00:00Z",
        "--skyline-preset",
        "city-street",
    ]);
    assert!(ok, "{err}");
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["sky_source"], "tle-at-epoch");
    assert_eq!(v["epoch_utc"], "2026-06-07T12:00:00.000000Z");
    assert!(v["sky_statement"]
        .as_str()
        .unwrap()
        .contains("not a measurement"));
    let (ok, _, err) = kshana(&["sky", "--site", "52,5", "--tle", "/nonexistent.tle"]);
    assert!(!ok && err.contains("cannot read"), "{err}");
}
