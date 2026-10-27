// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana interference-map locate` end to end on the synthetic example in `examples/emitter-region/`: the
//! committed outputs match the command, the known emitter lies inside the stated region, no identifier and no
//! word of an actor, intent or conflict reaches any output, every figure and table is labelled, and nothing is
//! overwritten. No network, no real data.

use std::path::{Path, PathBuf};
use std::process::{Command, Output};

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("examples/emitter-region")
}

fn kshana(args: &[&str]) -> Output {
    Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .expect("run kshana")
}

struct Scratch(PathBuf);
impl Drop for Scratch {
    fn drop(&mut self) {
        let _ = std::fs::remove_dir_all(&self.0);
    }
}

fn scratch(name: &str) -> Scratch {
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let d = std::env::temp_dir().join(format!(
        "kshana-emitter-{}-{name}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    Scratch(d)
}

const ATTR: &str = "Synthetic data made up for this example; not a measurement";

fn locate(input: &Path, out: &Path, extra: &[&str]) -> Output {
    let mut a = vec![
        "interference-map",
        "locate",
        input.to_str().unwrap(),
        "--source",
        "adsb",
        "--dataset",
        "custom",
        "--licence",
        "CC0-1.0",
        "--licence-url",
        "https://creativecommons.org/publicdomain/zero/1.0/",
        "--attribution",
        ATTR,
        "--out",
        out.to_str().unwrap(),
    ];
    a.extend_from_slice(extra);
    kshana(&a)
}

const STEM: &str = "emitter-adsb-custom-2026-03-01";
const SUFFIXES: [&str; 4] = [".geojson", "-summary.json", "-sessions.csv", "-figure.svg"];

fn normalise_version(text: &str) -> String {
    let v = env!("CARGO_PKG_VERSION");
    text.replace(
        &format!("\"kshana_version\": \"{v}\""),
        "\"kshana_version\": \"X\"",
    )
}

#[test]
fn committed_example_matches_the_command() {
    let out = scratch("example");
    let o = locate(&root().join("input/adsb-synthetic.csv"), &out.0, &[]);
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    for s in SUFFIXES {
        let fresh = std::fs::read_to_string(out.0.join(format!("{STEM}{s}"))).unwrap();
        let kept = std::fs::read_to_string(root().join(format!("output/{STEM}{s}"))).unwrap();
        assert_eq!(
            normalise_version(&fresh),
            normalise_version(&kept),
            "{s} differs: regenerate with examples/emitter-region/regenerate.sh"
        );
    }
}

fn inside(geo: &serde_json::Value, kind: &str, level: Option<f64>, lat: f64, lon: f64) -> bool {
    for f in geo["features"].as_array().unwrap() {
        let p = &f["properties"];
        if p["kind"] != kind || level.is_some_and(|l| p["confidence"].as_f64() != Some(l)) {
            continue;
        }
        let polys: Vec<&serde_json::Value> = if f["geometry"]["type"] == "MultiPolygon" {
            f["geometry"]["coordinates"]
                .as_array()
                .unwrap()
                .iter()
                .collect()
        } else {
            vec![&f["geometry"]["coordinates"]]
        };
        for poly in polys {
            let mut c = false;
            for ring in poly.as_array().unwrap() {
                let pts: Vec<(f64, f64)> = ring
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|q| (q[0].as_f64().unwrap(), q[1].as_f64().unwrap()))
                    .collect();
                for i in 0..pts.len() - 1 {
                    let (a, b) = (pts[i], pts[i + 1]);
                    if (a.1 > lat) != (b.1 > lat)
                        && lon < (b.0 - a.0) * (lat - a.1) / (b.1 - a.1) + a.0
                    {
                        c = !c;
                    }
                }
            }
            if c {
                return true;
            }
        }
    }
    false
}

#[test]
fn the_known_emitter_is_inside_the_regions_and_a_centroid_never_comes_alone() {
    let geo: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root().join(format!("output/{STEM}.geojson"))).unwrap(),
    )
    .unwrap();
    // The synthetic source is at 40.00 N, 30.00 W.
    assert!(inside(
        &geo,
        "estimated_emitter_region",
        Some(0.95),
        40.0,
        -30.0
    ));
    assert!(inside(
        &geo,
        "estimated_emitter_region",
        Some(0.9),
        40.0,
        -30.0
    ));
    let kinds: Vec<&str> = geo["features"]
        .as_array()
        .unwrap()
        .iter()
        .map(|f| f["properties"]["kind"].as_str().unwrap())
        .collect();
    for k in [
        "estimated_emitter_region",
        "uncertainty_ellipse_95",
        "estimated_emitter_centroid",
    ] {
        assert!(kinds.contains(&k), "{k}");
    }
    for f in geo["features"].as_array().unwrap() {
        if f["properties"]["kind"] == "estimated_emitter_centroid" {
            assert!(f["properties"]["semi_major_km"].as_f64().unwrap() > 0.0);
        }
    }
    let m = &geo["kshana_emitter_region"];
    assert_eq!(m["schema"], "kshana-emitter-region/v1");
    assert_eq!(
        m["method"]["id"],
        "kshana-interference-map/emitter-region/v1"
    );
    assert_eq!(m["data"]["licence"], "CC0-1.0");
    assert_eq!(m["data"]["attribution"], ATTR);
    assert!(m["method"]["assumptions"].as_array().unwrap().len() >= 4);
    assert!(m["method"]["limits"].as_array().unwrap().len() >= 4);
    assert_eq!(geo["evidence"]["tier"], "MODELLED");
    let s = &m["sessions"][0];
    assert!(s["affected_distinct"].as_u64().unwrap() >= 5);
    assert_eq!(s["status"], "constrained");
}

/// Words that would name or imply an actor, a state, a military or an intent, or conflict. A whole-word match,
/// so "stated" and "estimated" do not trip "state".
const BANNED: [&str; 24] = [
    "attack",
    "attacker",
    "hostile",
    "adversary",
    "adversarial",
    "enemy",
    "military",
    "army",
    "navy",
    "war",
    "warfare",
    "intent",
    "intentional",
    "deliberate",
    "state",
    "regime",
    "government",
    "armed",
    "weapon",
    "sabotage",
    "target",
    "culprit",
    "perpetrator",
    "actor",
];

fn words(text: &str) -> Vec<String> {
    text.split(|c: char| !c.is_ascii_alphabetic())
        .filter(|w| !w.is_empty())
        .map(str::to_ascii_lowercase)
        .collect()
}

#[test]
fn outputs_carry_no_identifier_no_banned_word_and_an_evidence_label() {
    let out = scratch("wording");
    let o = locate(&root().join("input/adsb-synthetic.csv"), &out.0, &[]);
    assert!(o.status.success());
    let stdout = String::from_utf8_lossy(&o.stdout).to_string();
    let mut all = vec![stdout];
    for s in SUFFIXES {
        all.push(std::fs::read_to_string(out.0.join(format!("{STEM}{s}"))).unwrap());
    }
    for text in &all {
        assert!(
            !text.contains("SYN-"),
            "an aircraft identifier reached an output"
        );
        for w in words(text) {
            assert!(!BANNED.contains(&w.as_str()), "banned word `{w}`");
        }
    }
    // The neutral wording is present.
    assert!(
        all[1].contains("estimated emitter region") || all[1].contains("Estimated emitter regions")
    );
    // Every figure and table is labelled.
    assert!(
        all[3].starts_with("# evidence"),
        "{}",
        &all[3][..60.min(all[3].len())]
    );
    assert!(all[4].contains("data-tier=\"MODELLED\"") && all[4].contains("Evidence: MODELLED"));
    assert_eq!(
        serde_json::from_str::<serde_json::Value>(&all[2]).unwrap()["evidence"]["tier"],
        "MODELLED"
    );
}

#[test]
fn refusals_leave_nothing_and_nothing_is_overwritten() {
    let out = scratch("refuse");
    let input = root().join("input/adsb-synthetic.csv");
    let first = locate(&input, &out.0, &[]);
    assert!(first.status.success());
    let again = locate(&input, &out.0, &[]);
    assert!(!again.status.success());
    assert!(String::from_utf8_lossy(&again.stderr).contains("already exists"));
    // No --source.
    let o = kshana(&[
        "interference-map",
        "locate",
        input.to_str().unwrap(),
        "--dataset",
        "adsb-lol",
        "--out",
        out.0.join("x").to_str().unwrap(),
    ]);
    assert!(!o.status.success());
    assert!(!out.0.join("x").exists());
    // An AIS dataset for ADS-B input is refused.
    let o = kshana(&[
        "interference-map",
        "locate",
        input.to_str().unwrap(),
        "--source",
        "adsb",
        "--dataset",
        "kystverket",
        "--out",
        out.0.join("y").to_str().unwrap(),
    ]);
    assert!(!o.status.success());
    assert!(!out.0.join("y").exists());
    // A bad level.
    let o = locate(&input, &out.0.join("z"), &["--levels", "0.5,1.5"]);
    assert!(!o.status.success());
}

#[test]
fn an_option_off_the_preregistered_value_is_announced() {
    let out = scratch("opt");
    let o = locate(
        &root().join("input/adsb-synthetic.csv"),
        &out.0,
        &["--cell-km", "20"],
    );
    assert!(o.status.success());
    assert!(String::from_utf8_lossy(&o.stderr).contains("not the pre-registered method"));
}

#[test]
fn few_aircraft_publish_nothing_and_say_so() {
    let out = scratch("few");
    let mut csv = String::from("timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp\n");
    for a in 0..3 {
        for k in 0..6 {
            csv.push_str(&format!(
                "{},F{a},50.0,10.0,33000,10,11\n",
                1_772_359_200 - 3600 + 60 * k
            ));
        }
        for k in 0..10 {
            csv.push_str(&format!(
                "{},F{a},50.1,10.2,33000,0,0\n",
                1_772_359_200 + 120 * k
            ));
        }
    }
    let f = out.0.join("in.csv");
    std::fs::write(&f, csv).unwrap();
    let o = locate(&f, &out.0.join("o"), &[]);
    assert!(o.status.success());
    let sum: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(out.0.join(format!("o/{STEM}-summary.json"))).unwrap(),
    )
    .unwrap();
    assert_eq!(sum["kshana_emitter_region"]["sessions_published"], 0);
    assert_eq!(sum["kshana_emitter_region"]["sessions_withheld"], 1);
}
