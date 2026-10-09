// SPDX-License-Identifier: AGPL-3.0-only
//! Pins the sample outputs in `examples/interference-map/output/` to the command that
//! produces them (`examples/interference-map/regenerate.sh`). If a method, threshold or
//! output-field change alters them, regenerate with that script and commit the result.
//! Inputs are synthetic; no network.

use std::path::{Path, PathBuf};
use std::process::Command;

const ATTR: &str = "Synthetic data generated for Kshana documentation. Not real observations.";
const LIC: [&str; 6] = [
    "--dataset",
    "custom",
    "--licence",
    "CC0-1.0",
    "--licence-url",
    "https://creativecommons.org/publicdomain/zero/1.0/",
];

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("examples/interference-map")
}

fn run(args: &[&str]) {
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
}

/// The Kshana version is the one field that changes between releases without any change
/// to the sample, so it is not part of the pin.
fn normalised(path: &Path) -> serde_json::Value {
    let mut v: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
    v["kshana_interference_map"]["kshana_version"] = "X".into();
    v
}

#[test]
fn committed_samples_match_the_regeneration_command() {
    let r = root();
    let out = std::env::temp_dir().join(format!("kshana-imap-examples-{}", std::process::id()));
    let _ = std::fs::remove_dir_all(&out);
    let (adsb_in, ais_in, land) = (
        r.join("input/adsb.csv"),
        r.join("input/ais.csv"),
        r.join("input/land.geojson"),
    );
    let s = |p: &Path| p.to_str().unwrap().to_string();
    let mut a = vec!["interference-map".to_string(), "adsb".into(), s(&adsb_in)];
    a.extend(LIC.iter().map(|x| x.to_string()));
    a.extend(["--attribution".into(), ATTR.into(), "--out".into(), s(&out)]);
    run(&a.iter().map(String::as_str).collect::<Vec<_>>());
    let mut b = vec!["interference-map".to_string(), "ais".into(), s(&ais_in)];
    b.extend(LIC.iter().map(|x| x.to_string()));
    b.extend([
        "--attribution".into(),
        ATTR.into(),
        "--land".into(),
        s(&land),
        "--out".into(),
        s(&out),
    ]);
    run(&b.iter().map(String::as_str).collect::<Vec<_>>());

    for name in ["adsb-2026-03-01.geojson", "ais-2026-03-01.geojson"] {
        assert_eq!(
            normalised(&out.join(name)),
            normalised(&r.join("output").join(name)),
            "{name} differs from the committed sample: run examples/interference-map/regenerate.sh"
        );
    }
    let mut names: Vec<String> = std::fs::read_dir(r.join("output"))
        .unwrap()
        .map(|e| e.unwrap().file_name().to_string_lossy().into_owned())
        .collect();
    names.sort();
    assert_eq!(names, ["adsb-2026-03-01.geojson", "ais-2026-03-01.geojson"]);
}

#[test]
fn samples_show_every_state_and_carry_no_identifiers() {
    let r = root().join("output");
    let mut statuses = std::collections::BTreeSet::new();
    for name in ["adsb-2026-03-01.geojson", "ais-2026-03-01.geojson"] {
        let text = std::fs::read_to_string(r.join(name)).unwrap();
        assert!(!text.contains("SYN-"), "an identifier label reached {name}");
        let v: serde_json::Value = serde_json::from_str(&text).unwrap();
        let m = &v["kshana_interference_map"];
        assert_eq!(m["format_version"], 1);
        assert_eq!(m["data"]["licence"], "CC0-1.0");
        assert_eq!(m["data"]["attribution"], ATTR);
        for f in v["features"].as_array().unwrap() {
            statuses.insert(f["properties"]["status"].as_str().unwrap().to_string());
        }
    }
    for s in [
        "degraded",
        "not_degraded",
        "insufficient_sample",
        "anomalous",
        "not_anomalous",
    ] {
        assert!(statuses.contains(s), "the samples lack a `{s}` cell");
    }
}
