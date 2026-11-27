// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana pbom`: the PNT Bill of Materials profile, validator, generator and diff
//! (src/pbom.rs, docs/PBOM.md). Expected values are worked out by hand from the example
//! configurations in examples/pbom/.

use kshana::pbom;
use serde_json::{json, Value};
use std::path::PathBuf;
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn example(name: &str) -> String {
    std::fs::read_to_string(root().join("examples/pbom").join(name)).unwrap()
}

fn generated(name: &str) -> Value {
    pbom::generate_from_text(name, &example(name)).unwrap()
}

fn unique_dir(tag: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-pbom-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

fn function<'a>(r: &'a pbom::ValidateReport, f: &str) -> &'a pbom::FunctionReport {
    r.analysis
        .as_ref()
        .unwrap()
        .functions
        .iter()
        .find(|x| x.function == f)
        .unwrap()
}

#[test]
fn the_example_generates_a_valid_cyclonedx_pbom() {
    let doc = generated("substation-timing.toml");
    assert_eq!(doc["bomFormat"], "CycloneDX");
    assert_eq!(doc["specVersion"], "1.5");
    assert_eq!(doc["components"].as_array().unwrap().len(), 8);
    assert_eq!(doc["dependencies"].as_array().unwrap().len(), 9);
    let r = pbom::validate(&doc);
    assert!(r.valid, "{:?}", r.errors);
    assert!(r.warnings.is_empty(), "{:?}", r.warnings);
    assert_eq!(r.label, "MODELLED");
}

#[test]
fn the_checked_in_examples_are_what_generate_writes() {
    for (src, out) in [
        ("substation-timing.toml", "substation-timing.pbom.json"),
        (
            "substation-timing-v2.toml",
            "substation-timing-v2.pbom.json",
        ),
    ] {
        let want: Value = serde_json::from_str(&example(out)).unwrap();
        assert_eq!(generated(src), want, "{out} is stale: regenerate it");
    }
}

#[test]
fn generation_is_deterministic_and_the_serial_is_an_rfc4122_v8_uuid() {
    let a = generated("substation-timing.toml");
    let b = generated("substation-timing.toml");
    assert_eq!(a, b);
    let sn = a["serialNumber"].as_str().unwrap();
    let u = sn.strip_prefix("urn:uuid:").unwrap();
    assert_eq!(u.len(), 36);
    assert_eq!(&u[14..15], "8", "version nibble");
    assert!("89ab".contains(&u[19..20]), "variant bits");
    assert_ne!(sn, generated("substation-timing-v2.toml")["serialNumber"]);
}

#[test]
fn the_analysis_finds_the_single_points_of_failure_by_hand() {
    // time: root -> ptp-distribution -> gm-clock (provides time) -> gnss-receiver, and the
    // receiver is kept up by the OCXO fallback. Losing the PTP distribution or the grandmaster
    // cuts time; the antenna, the firmware, either signal and the receiver do not, because the
    // OCXO takes over (with its stated 14 400 s holdover).
    let r = pbom::validate(&generated("substation-timing.toml"));
    let t = function(&r, "time");
    assert!(t.delivered);
    assert_eq!(t.single_points_of_failure, ["ptp-distribution", "gm-clock"]);
    assert_eq!(t.providers, ["gal-e1", "gm-clock", "gps-l1ca", "ocxo"]);
    assert!(t.survives_gnss_loss);
    let left: Vec<(&str, Option<f64>)> = t
        .providers_without_gnss
        .iter()
        .map(|r| (r.reference.as_str(), r.holdover_s))
        .collect();
    assert_eq!(left, [("gm-clock", None), ("ocxo", Some(14400.0))]);
    assert!(
        t.authenticated_provider,
        "Galileo E1 with OSNMA is declared authenticated"
    );
    // position: only the two signals provide it; the grandmaster does not pass position on to
    // the root other than through the receiver, and the OCXO gives none, so losing every GNSS
    // signal loses position.
    let p = function(&r, "position");
    assert!(p.delivered);
    assert!(!p.survives_gnss_loss);
    let a = r.analysis.as_ref().unwrap();
    assert_eq!(a.constellations, ["GPS", "Galileo"]);
    assert_eq!(a.receiver_suppliers, ["Vendor A"]);
    assert_eq!(a.jurisdictions, ["EU", "US"]);
    assert_eq!(a.roles["constellation-signal"], 2);
}

#[test]
fn position_needs_both_receiver_parts_and_one_signal() {
    // Without the OCXO the receiver is a single point of failure for position, and so are its
    // antenna and firmware (all required), but neither signal alone is (either is enough).
    let mut doc = generated("substation-timing.toml");
    let comps = doc["components"].as_array_mut().unwrap();
    comps.retain(|c| c["bom-ref"] != "ocxo");
    doc["dependencies"]
        .as_array_mut()
        .unwrap()
        .retain(|d| d["ref"] != "ocxo");
    let r = pbom::validate(&doc);
    assert!(r.valid, "{:?}", r.errors);
    let p = function(&r, "position");
    assert_eq!(
        p.single_points_of_failure,
        [
            "ptp-distribution",
            "gm-clock",
            "gnss-receiver",
            "receiver-fw",
            "gnss-antenna"
        ]
    );
    assert!(!function(&r, "time").survives_gnss_loss);
}

#[test]
fn the_diff_reports_the_added_fallback_and_the_resolved_single_point() {
    let d = pbom::diff(
        &generated("substation-timing.toml"),
        &generated("substation-timing-v2.toml"),
    )
    .unwrap();
    assert_eq!(d.added.len(), 1);
    assert_eq!(d.added[0].reference, "fibre-utc");
    assert!(d.removed.is_empty());
    let changed: Vec<&str> = d.changed.iter().map(|c| c.reference.as_str()).collect();
    assert_eq!(changed, ["system", "receiver-fw"]);
    let fw = &d.changed[1].changes;
    assert_eq!(fw[0].field, "version");
    assert_eq!(fw[0].before, json!("4.2.1"));
    assert_eq!(fw[0].after, json!("4.3.0"));
    let t = d.functions.iter().find(|f| f.function == "time").unwrap();
    assert_eq!(t.resolved_single_points_of_failure, ["gm-clock"]);
    assert!(t.new_single_points_of_failure.is_empty());
    let f = d
        .functions
        .iter()
        .find(|f| f.function == "frequency")
        .unwrap();
    assert_eq!(f.resolved_single_points_of_failure, ["gm-clock"]);
}

fn problems(doc: &Value) -> Vec<String> {
    pbom::validate(doc)
        .errors
        .into_iter()
        .map(|p| format!("{} {}", p.path, p.problem))
        .collect()
}

#[test]
fn the_validator_rejects_what_the_profile_forbids() {
    let base = generated("substation-timing.toml");

    let mut d = base.clone();
    d["bomFormat"] = json!("SPDX");
    assert!(problems(&d)[0].starts_with("/bomFormat"));

    let mut d = base.clone();
    d["metadata"]["properties"] = json!([]);
    assert!(problems(&d)[0].starts_with("/metadata/properties"));

    // a role outside the list
    let mut d = base.clone();
    d["components"][0]["properties"][0]["value"] = json!("jammer");
    assert!(problems(&d).iter().any(|p| p.contains("role \"jammer\"")));

    // a dangling dependsOn
    let mut d = base.clone();
    d["dependencies"][0]["dependsOn"] = json!(["nowhere"]);
    assert!(problems(&d)
        .iter()
        .any(|p| p.contains("\"nowhere\" names no component")));

    // a duplicate bom-ref
    let mut d = base.clone();
    d["components"][1]["bom-ref"] = json!("ptp-distribution");
    assert!(problems(&d)
        .iter()
        .any(|p| p.contains("used more than once")));

    // an unknown profile property and a bad holdover
    let mut d = base.clone();
    d["components"][0]["properties"]
        .as_array_mut()
        .unwrap()
        .push(json!({"name": "kshana:pbom:accuracy", "value": "1"}));
    assert!(problems(&d)
        .iter()
        .any(|p| p.contains("kshana:pbom:accuracy")));
    let ocxo = base["components"]
        .as_array()
        .unwrap()
        .iter()
        .position(|c| c["bom-ref"] == "ocxo")
        .unwrap();
    let mut d = base.clone();
    for p in d["components"][ocxo]["properties"].as_array_mut().unwrap() {
        if p["name"] == "kshana:pbom:holdover-s" {
            p["value"] = json!("-5");
        }
    }
    assert!(problems(&d).iter().any(|p| p.contains("holdover-s")));

    // a constellation-signal without its signal
    let mut d = base.clone();
    let gps = 5;
    assert_eq!(d["components"][gps]["bom-ref"], "gps-l1ca");
    d["components"][gps]["properties"]
        .as_array_mut()
        .unwrap()
        .retain(|p| p["name"] != "kshana:pbom:signal");
    assert!(problems(&d)
        .iter()
        .any(|p| p.contains("needs constellation and signal")));

    // any-of not in dependsOn
    let mut d = base.clone();
    for dep in d["dependencies"].as_array_mut().unwrap() {
        if dep["ref"] == "gnss-receiver" {
            dep["dependsOn"] = json!(["gnss-antenna", "receiver-fw", "gps-l1ca"]);
        }
    }
    assert!(problems(&d)
        .iter()
        .any(|p| p.contains("any-of \"gal-e1\" is not in this element's dependsOn")));
}

#[test]
fn a_cycle_is_an_error_and_an_unreached_element_a_warning() {
    let mut d = generated("substation-timing.toml");
    for dep in d["dependencies"].as_array_mut().unwrap() {
        if dep["ref"] == "receiver-fw" {
            dep["dependsOn"] = json!(["gm-clock"]);
        }
    }
    let p = problems(&d);
    assert!(p.iter().any(|p| p.contains("has a cycle")), "{p:?}");

    let mut d = generated("substation-timing.toml");
    d["components"].as_array_mut().unwrap().push(json!({
        "type": "device", "bom-ref": "spare", "name": "Spare receiver",
        "properties": [{"name": "kshana:pbom:role", "value": "receiver"}]
    }));
    let r = pbom::validate(&d);
    assert!(r.valid, "{:?}", r.errors);
    assert!(r.warnings.iter().any(|w| w.problem.contains("\"spare\"")));
}

#[test]
fn a_scenario_gives_a_draft_with_its_mapping_stated() {
    let text = std::fs::read_to_string(root().join("scenarios/hybrid-pnt.toml")).unwrap();
    let doc = pbom::generate_from_text("scenarios/hybrid-pnt.toml", &text).unwrap();
    let r = pbom::validate(&doc);
    assert!(r.valid, "{:?}", r.errors);
    let refs: Vec<&str> = doc["components"]
        .as_array()
        .unwrap()
        .iter()
        .map(|c| c["bom-ref"].as_str().unwrap())
        .collect();
    assert_eq!(
        refs,
        [
            "gnss-signals",
            "gnss-receiver",
            "accel-classical",
            "accel-quantum",
            "clock-classical",
            "clock-quantum"
        ]
    );
    let note = doc["metadata"]["properties"][1]["value"].as_str().unwrap();
    assert!(note.contains("tables not mapped: [resync, time]"), "{note}");
    // the clocks keep time through a GNSS loss in the declared structure
    assert!(function(&r, "time").survives_gnss_loss);
}

#[test]
fn the_profile_schema_is_valid_json_and_names_every_role() {
    let s: Value = serde_json::from_str(pbom::SCHEMA).unwrap();
    let roles = &s["definitions"]["component"]["properties"]["properties"]["contains"]
        ["properties"]["value"]["enum"];
    let listed: Vec<&str> = roles
        .as_array()
        .unwrap()
        .iter()
        .map(|v| v.as_str().unwrap())
        .collect();
    assert_eq!(listed, pbom::ROLES);
}

#[test]
fn the_cli_generates_validates_and_diffs() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let dir = unique_dir("cli");
    let out = dir.join("a.json");
    let st = Command::new(bin)
        .args(["pbom", "generate"])
        .arg(root().join("examples/pbom/substation-timing.toml"))
        .arg("--out")
        .arg(&out)
        .status()
        .unwrap();
    assert!(st.success());
    let v = Command::new(bin)
        .args(["pbom", "validate"])
        .arg(&out)
        .output()
        .unwrap();
    assert!(v.status.success());
    let rep: Value = serde_json::from_slice(&v.stdout).unwrap();
    assert_eq!(rep["valid"], true);

    let mut bad: Value = serde_json::from_str(&std::fs::read_to_string(&out).unwrap()).unwrap();
    bad["bomFormat"] = json!("x");
    let badp = dir.join("bad.json");
    std::fs::write(&badp, bad.to_string()).unwrap();
    let v = Command::new(bin)
        .args(["pbom", "validate"])
        .arg(&badp)
        .output()
        .unwrap();
    assert!(!v.status.success());
    let rep: Value = serde_json::from_slice(&v.stdout).unwrap();
    assert_eq!(rep["valid"], false);

    let d = Command::new(bin)
        .args(["pbom", "diff"])
        .arg(root().join("examples/pbom/substation-timing.pbom.json"))
        .arg(root().join("examples/pbom/substation-timing-v2.pbom.json"))
        .output()
        .unwrap();
    assert!(d.status.success());
    let rep: Value = serde_json::from_slice(&d.stdout).unwrap();
    assert_eq!(rep["added"][0]["ref"], "fibre-utc");

    let s = Command::new(bin).args(["pbom", "schema"]).output().unwrap();
    assert!(s.status.success());
    assert_eq!(String::from_utf8_lossy(&s.stdout), pbom::SCHEMA);

    let u = Command::new(bin)
        .args(["pbom", "nothing"])
        .output()
        .unwrap();
    assert!(!u.status.success());
    assert!(String::from_utf8_lossy(&u.stderr).contains("kshana pbom"));
    let _ = std::fs::remove_dir_all(&dir);
}
