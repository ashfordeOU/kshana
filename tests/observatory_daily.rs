// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana interference-map daily` and `sensitivity` (`docs/observatory/METHOD.md`): the release
//! rules are enforced by the command, the three files and their manifest are written once and never
//! overwritten, and a published product names no cause.

use std::path::{Path, PathBuf};
use std::process::{Command, Output};

const INPUT: &str = "examples/interference-map/input/adsb.csv";
const DAY: &str = "2026-03-01";

fn kshana(args: &[&str]) -> Output {
    Command::new(env!("CARGO_BIN_EXE_kshana"))
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .args(args)
        .output()
        .unwrap()
}

fn text(o: &Output) -> String {
    String::from_utf8_lossy(&o.stdout).to_string() + &String::from_utf8_lossy(&o.stderr)
}

struct Scratch(PathBuf);
impl Scratch {
    fn new(name: &str) -> Self {
        let p = std::env::temp_dir().join(format!("kshana-obs-{name}-{}", std::process::id()));
        let _ = std::fs::remove_dir_all(&p);
        Self(p)
    }
    fn path(&self) -> &Path {
        &self.0
    }
}
impl Drop for Scratch {
    fn drop(&mut self) {
        let _ = std::fs::remove_dir_all(&self.0);
    }
}

fn custom() -> Vec<&'static str> {
    vec![
        "--dataset",
        "custom",
        "--licence",
        "ODbL-1.0",
        "--licence-url",
        "https://opendatacommons.org/licenses/odbl/1-0/",
        "--attribution",
        "synthetic sample",
    ]
}

fn daily(out: &Path, extra: &[&str]) -> Output {
    let mut a = vec![
        "interference-map",
        "daily",
        INPUT,
        "--day",
        DAY,
        "--out",
        out.to_str().unwrap(),
    ];
    a.extend(custom());
    a.extend_from_slice(extra);
    kshana(&a)
}

#[test]
fn a_day_writes_three_files_and_a_manifest_that_matches_them_and_is_never_overwritten() {
    let s = Scratch::new("daily");
    let o = daily(s.path(), &[]);
    assert!(o.status.success(), "{}", text(&o));
    let stem = format!("observatory-adsb-custom-{DAY}");
    for ext in ["geojson", "png", "incidents.json", "manifest.json"] {
        assert!(s.path().join(format!("{stem}.{ext}")).exists(), "{ext}");
    }
    let man: serde_json::Value = serde_json::from_slice(
        &std::fs::read(s.path().join(format!("{stem}.manifest.json"))).unwrap(),
    )
    .unwrap();
    for f in man["files"].as_array().unwrap() {
        let bytes = std::fs::read(s.path().join(f["name"].as_str().unwrap())).unwrap();
        assert_eq!(f["bytes"].as_u64().unwrap() as usize, bytes.len());
        assert_eq!(
            f["sha256"].as_str().unwrap(),
            kshana::bench::sha256_hex(&bytes)
        );
    }
    let again = daily(s.path(), &[]);
    assert!(!again.status.success());
    assert!(
        text(&again).contains("does not overwrite"),
        "{}",
        text(&again)
    );
}

#[test]
fn the_map_has_three_states_the_incident_has_no_cause_and_the_notice_is_present() {
    let s = Scratch::new("states");
    assert!(daily(s.path(), &[]).status.success());
    let stem = format!("observatory-adsb-custom-{DAY}");
    let map: serde_json::Value =
        serde_json::from_slice(&std::fs::read(s.path().join(format!("{stem}.geojson"))).unwrap())
            .unwrap();
    let states: std::collections::BTreeSet<&str> = map["features"]
        .as_array()
        .unwrap()
        .iter()
        .map(|f| f["properties"]["state"].as_str().unwrap())
        .collect();
    for st in &states {
        assert!(
            ["degraded", "not_degraded", "not_observed"].contains(st),
            "{st}"
        );
    }
    assert!(states.contains("degraded") && states.contains("not_observed"));
    assert_eq!(
        map["kshana_observatory"]["schema"],
        "kshana-observatory-day/1"
    );
    assert!(map["kshana_observatory"]["notice"]
        .as_str()
        .unwrap()
        .contains("No cause is attributed"));
    let inc: serde_json::Value = serde_json::from_slice(
        &std::fs::read(s.path().join(format!("{stem}.incidents.json"))).unwrap(),
    )
    .unwrap();
    assert_eq!(inc["schema"], "kshana-incident-report/1");
    assert_eq!(inc["cause"], "not attributed");
    assert_eq!(inc["incidents"].as_array().unwrap().len(), 1);
    // No aircraft identifier anywhere in the files.
    let all = std::fs::read_to_string(s.path().join(format!("{stem}.geojson"))).unwrap()
        + &std::fs::read_to_string(s.path().join(format!("{stem}.incidents.json"))).unwrap();
    assert!(!all.contains("SYN-"));
}

#[test]
fn the_release_rules_are_refused_by_the_command() {
    let s = Scratch::new("rules");
    // A day that has not ended plus 24 h yet.
    let mut a = vec![
        "interference-map",
        "daily",
        INPUT,
        "--day",
        "2099-12-31",
        "--out",
        s.path().to_str().unwrap(),
    ];
    a.extend(custom());
    let o = kshana(&a);
    assert_eq!(o.status.code(), Some(2));
    assert!(text(&o).contains("not publishable yet"), "{}", text(&o));
    // Shorter delay, finer cell.
    let o = daily(s.path(), &["--delay-hours", "12"]);
    assert!(text(&o).contains("24 or more"), "{}", text(&o));
    let o = daily(s.path(), &["--cell-deg", "0.25"]);
    assert!(text(&o).contains("0.5 or coarser"), "{}", text(&o));
    assert!(!s.path().exists() || std::fs::read_dir(s.path()).unwrap().count() == 0);
}

#[test]
fn opensky_data_is_refused() {
    let s = Scratch::new("opensky");
    let o = kshana(&[
        "interference-map",
        "daily",
        INPUT,
        "--day",
        DAY,
        "--out",
        s.path().to_str().unwrap(),
        "--dataset",
        "custom",
        "--licence",
        "OpenSky data licence",
        "--licence-url",
        "https://opensky-network.org/about/terms-of-use",
        "--attribution",
        "OpenSky Network",
    ]);
    assert_eq!(o.status.code(), Some(2));
    assert!(text(&o).contains("OpenSky"), "{}", text(&o));
}

#[test]
fn the_sensitivity_study_reproduces_the_registered_call_and_changes_one_parameter_at_a_time() {
    let s = Scratch::new("sens");
    let out = s.path().join("s.json");
    std::fs::create_dir_all(s.path()).unwrap();
    let mut a = vec![
        "interference-map",
        "sensitivity",
        INPUT,
        "--day",
        DAY,
        "--out",
        out.to_str().unwrap(),
    ];
    a.extend(custom());
    let o = kshana(&a);
    assert!(o.status.success(), "{}", text(&o));
    let v: serde_json::Value = serde_json::from_slice(&std::fs::read(&out).unwrap()).unwrap();
    assert_eq!(v["schema"], "kshana-observatory-sensitivity/1");
    // The registered call equals what `daily` publishes for the same day.
    assert_eq!(v["registered"]["cells_degraded"], 1);
    assert_eq!(v["registered"]["cells_published"], 11);
    let vars = v["variants"].as_array().unwrap();
    assert_eq!(vars.len(), 23);
    // Pinned finding on the synthetic sample: raising the sample or baseline floors removes the
    // only degraded cell; the accuracy-code thresholds do not move it.
    let get = |p: &str, val: &str| {
        vars.iter()
            .find(|x| x["parameter"] == p && x["value"] == val)
            .unwrap()["cells_degraded"]
            .as_u64()
            .unwrap()
    };
    assert_eq!(get("min_aircraft", "15"), 0);
    assert_eq!(get("min_reports_per_aircraft", "5"), 0);
    assert_eq!(get("low_nacp_max", "5"), 1);
    assert!(v["caveat"]
        .as_str()
        .unwrap()
        .contains("not which value is right"));
}
