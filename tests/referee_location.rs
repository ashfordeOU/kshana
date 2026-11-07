// SPDX-License-Identifier: AGPL-3.0-only
//! B2 (0.41): the referee's location metrics against the independent oracle, on the truth set
//! committed before the engine code (`xval/referee-location/`, `tests/fixtures/referee_location/`),
//! under the bars of `docs/design/evidence/b2-referee-metrics/PREREGISTRATION.md`:
//! R1 exactness, R2 boundary rules, R3 calibration of the metric, R4 surfaces (the command line here;
//! see RESULTS.md for the others).
//!
//! PIN-SCOPE:    the location metrics of src/jammertest/location.rs on truth_v1 and reports_v1
//! PIN-EXCLUDES: any locator's accuracy; the existing referee (score.rs), which these metrics do not touch

use kshana::jammertest::location::{score, Reports, Truth};
use serde_json::Value;
use std::io::Read;
use std::path::{Path, PathBuf};

fn fixture(name: &str) -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/referee_location")
        .join(name)
}

fn read(name: &str) -> String {
    let p = fixture(name);
    let bytes = std::fs::read(&p).unwrap();
    if name.ends_with(".gz") {
        let mut s = String::new();
        flate2::read::GzDecoder::new(&bytes[..])
            .read_to_string(&mut s)
            .unwrap();
        s
    } else {
        String::from_utf8(bytes).unwrap()
    }
}

fn opt(v: &Value) -> Option<f64> {
    v.as_f64()
}

#[test]
fn the_metrics_equal_the_oracle_on_every_case() {
    let truth: Truth = serde_json::from_str(&read("truth_v1.json")).unwrap();
    let reports: Reports = serde_json::from_str(&read("reports_v1.json.gz")).unwrap();
    let exp: Value = serde_json::from_str(&read("expected_v1.json.gz")).unwrap();
    let got = serde_json::to_value(score(&truth, &reports.reports).unwrap()).unwrap();
    let mut misses: Vec<String> = Vec::new();
    let mut worst_e = 0.0f64;
    let mut worst_area = 0.0f64;

    // R1 per report: attribution, scored, e within 1e-6 m, v, containment identical, area to 1e-6 relative.
    let (ge, ee) = (
        got["reports"].as_array().unwrap(),
        exp["reports"].as_array().unwrap(),
    );
    assert_eq!(ge.len(), ee.len());
    for (g, e) in ge.iter().zip(ee) {
        let k = &e["index"];
        if g["event"] != e["event"] || g["scored"] != e["scored"] {
            misses.push(format!(
                "report {k}: attribution {} {} vs {} {}",
                g["event"], g["scored"], e["event"], e["scored"]
            ));
            continue;
        }
        if e["scored"] != true {
            continue;
        }
        let d = (g["e_m"].as_f64().unwrap() - e["e_m"].as_f64().unwrap()).abs();
        worst_e = worst_e.max(d);
        if d > 1e-6 {
            misses.push(format!("report {k}: e {} vs {}", g["e_m"], e["e_m"]));
        }
        match (opt(&g["v_m"]), opt(&e["v_m"])) {
            (None, None) => {}
            (Some(a), Some(b)) if (a - b).abs() <= 1e-6 => {}
            (a, b) => misses.push(format!("report {k}: v {a:?} vs {b:?}")),
        }
        let (gr, er) = (
            g["regions"].as_array().unwrap(),
            e["regions"].as_array().unwrap(),
        );
        assert_eq!(gr.len(), er.len());
        for (a, b) in gr.iter().zip(er) {
            if a["contains"] != b["contains"] || a["kind"] != b["kind"] {
                misses.push(format!(
                    "report {k}: region {} {} vs {} {}",
                    a["kind"], a["contains"], b["kind"], b["contains"]
                ));
            }
            let (x, y) = (
                a["area_m2"].as_f64().unwrap(),
                b["area_m2"].as_f64().unwrap(),
            );
            let rel = if y == 0.0 {
                x.abs()
            } else {
                ((x - y) / y).abs()
            };
            worst_area = worst_area.max(rel);
            if rel > 1e-6 {
                misses.push(format!("report {k}: area {x} vs {y}"));
            }
        }
    }

    // R1 per event and pooled: counts identical, times identical, statistics to the same tolerances.
    let close = |a: &Value, b: &Value, tol: f64| match (a.as_f64(), b.as_f64()) {
        (None, None) => a == b,
        (Some(x), Some(y)) => (x - y).abs() <= tol * y.abs().max(1.0),
        _ => false,
    };
    let mut cmp_agg = |name: &str, g: &Value, e: &Value| {
        for key in ["n_reports", "n_scored", "located", "n_not_located"] {
            if g.get(key) != e.get(key) {
                misses.push(format!(
                    "{name}: {key} {:?} vs {:?}",
                    g.get(key),
                    e.get(key)
                ));
            }
        }
        for key in ["median_e_m", "p90_e_m"] {
            if !close(&g[key], &e[key], 1e-9) {
                misses.push(format!("{name}: {key} {} vs {}", g[key], e[key]));
            }
        }
        for (lv, c) in e["coverage"].as_object().unwrap() {
            let gc = &g["coverage"][lv];
            for key in ["n", "h", "k_min", "binomial_ok"] {
                if gc[key] != c[key] {
                    misses.push(format!(
                        "{name}: coverage {lv} {key} {} vs {}",
                        gc[key], c[key]
                    ));
                }
            }
            if !close(&g["median_area_m2"][lv], &e["median_area_m2"][lv], 1e-6) {
                misses.push(format!("{name}: median area {lv}"));
            }
        }
        for key in ["ttfl_s", "ttfl_median_s"] {
            if e.get(key).is_some() && g[key] != e[key] && !close(&g[key], &e[key], 0.0) {
                misses.push(format!("{name}: {key} {} vs {}", g[key], e[key]));
            }
        }
        for key in ["ttl_s", "ttl_median_s"] {
            if let Some(m) = e.get(key).and_then(Value::as_object) {
                for (r, v) in m {
                    if !close(&g[key][r], v, 0.0) {
                        misses.push(format!("{name}: {key} {r} {} vs {}", g[key][r], v));
                    }
                }
            }
        }
    };
    for (g, e) in got["events"]
        .as_array()
        .unwrap()
        .iter()
        .zip(exp["events"].as_array().unwrap())
    {
        cmp_agg(e["id"].as_str().unwrap(), g, e);
    }
    cmp_agg("pooled", &got["pooled"], &exp["pooled"]);
    let (gf, ef) = (&got["false_locations"], &exp["false_locations"]);
    if gf["count"] != ef["count"]
        || !close(&gf["clean_s"], &ef["clean_s"], 0.0)
        || !close(&gf["per_hour"], &ef["per_hour"], 1e-12)
    {
        misses.push(format!("false locations {gf} vs {ef}"));
    }

    // The hand-worked anchors, to the digits printed in the pre-registration.
    let r = &got["reports"];
    assert!((r[0]["e_m"].as_f64().unwrap() - 1113.194908).abs() < 5e-7);
    assert_eq!(r[1]["regions"][0]["contains"], true);
    assert_eq!(r[2]["regions"][0]["contains"], false);
    assert!((r[1]["regions"][0]["area_m2"].as_f64().unwrap() - 94_113.705).abs() < 5e-4);
    assert_eq!(
        (
            r[3]["regions"][0]["contains"].clone(),
            r[4]["regions"][0]["contains"].clone()
        ),
        (Value::Bool(true), Value::Bool(false))
    );

    println!("B2 R1: worst |e - oracle| = {worst_e:e} m, worst area relative = {worst_area:e}, misses = {}", misses.len());
    assert!(
        misses.is_empty(),
        "{} misses:\n{}",
        misses.len(),
        misses.join("\n")
    );
}

#[test]
fn r2_a_degenerate_covariance_is_an_error_not_a_miss() {
    let truth: Truth = serde_json::from_str(&read("truth_v1.json")).unwrap();
    let reports: Reports = serde_json::from_str(&read("reports_degenerate_v1.json")).unwrap();
    let e = score(&truth, &reports.reports).unwrap_err();
    assert!(e.contains("positive definite"), "{e}");
}

#[test]
fn r3_the_calibrated_population_covers_at_its_levels() {
    let truth: Truth = serde_json::from_str(&read("truth_v1.json")).unwrap();
    let reports: Reports = serde_json::from_str(&read("reports_v1.json.gz")).unwrap();
    let got = score(&truth, &reports.reports).unwrap();
    // Two-sided 99 % binomial intervals for n = 10 000.
    for (lv, lo, hi) in [
        ("0.95", 0.9444, 0.9556),
        ("0.9", 0.8923, 0.9077),
        ("0.5", 0.4871, 0.5129),
    ] {
        let (h, n): (usize, usize) = got
            .events
            .iter()
            .filter(|e| e.id.as_deref().is_some_and(|i| i.starts_with("CAL")))
            .map(|e| (e.coverage[lv].h, e.coverage[lv].n))
            .fold((0, 0), |a, b| (a.0 + b.0, a.1 + b.1));
        assert_eq!(n, 10_000);
        let rate = h as f64 / n as f64;
        println!("B2 R3: coverage at {lv}: {h}/{n} = {rate:.4}");
        assert!((lo..=hi).contains(&rate), "{lv}: {rate}");
    }
}

#[test]
fn r4_the_command_line_gives_the_library_bytes() {
    let truth = read("truth_v1.json");
    let reports = read("reports_v1.json.gz");
    let lib = kshana::jammertest::location::score_json(&truth, &reports).unwrap();
    // The bytes every surface must give (Python and WebAssembly check the same digest:
    // tests/python/test_bindings.py, web/smoke.mjs).
    use sha2::{Digest, Sha256};
    let digest = hex::encode(Sha256::digest(lib.as_bytes()));
    assert_eq!(digest, read("score_v1.sha256").trim());
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-b2-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let rp = dir.join("reports.json");
    std::fs::write(&rp, &reports).unwrap();
    let out = dir.join("score.json");
    let o = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["jammertest", "locate-score", "--truth"])
        .arg(fixture("truth_v1.json"))
        .arg("--reports")
        .arg(&rp)
        .arg("--out")
        .arg(&out)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    assert_eq!(std::fs::read_to_string(&out).unwrap(), lib);
    let _ = std::fs::remove_dir_all(&dir);
}
