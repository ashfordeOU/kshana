// SPDX-License-Identifier: AGPL-3.0-only
//! B3c (0.42 V1): the TDOA locator successor's synthetic gate, recorded (`docs/design/evidence/
//! b3c-tdoa-locator-successor/RESULTS.md`, readings U1 to U14 in `xval/tdoa-locator-b3c/README.md`).
//!
//! * The gate's recorded verdicts: G-wb (chirp and noise) MET, G-all NOT MET (T1, the CW third, as said before the run).
//! * U12: on gate seeds 9001 to 9020 the engine agrees with the independent numpy oracle (`oracle.py`, its output
//!   committed as `oracle_9001-9020.json`) within the readings' tolerances. Seeds 9001 to 9003 (one per waveform) run
//!   by default; all 20 with the ignored tests.
//! * U11 (T4): the whole gate (1 000 sessions) gives the recorded bytes. Ignored by default; the `b3b-determinism` CI
//!   job runs it on Linux, macOS and Windows.
//!
//! PIN-SCOPE: the recorded B3c gate (verdicts, metrics, classes, not-located counts) and the engine-oracle agreement
//! on seeds 9001 to 9020.
//! PIN-EXCLUDES: any real jammer, station or clock; the Jammertest 2027 run (not made); any surface other than the
//! Rust library.

use flate2::read::GzDecoder;
use kshana::locate_tdoa::session;
use kshana::locate_tdoa_b3c::{gate_summary, locate, B3cResult, GATE_SEEDS};
use std::io::Read;
use std::path::PathBuf;

fn xval() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/tdoa-locator-b3c")
}

fn gate_doc() -> String {
    let mut s = String::new();
    GzDecoder::new(std::fs::File::open(xval().join("gate.json.gz")).unwrap())
        .read_to_string(&mut s)
        .unwrap();
    s
}

#[test]
fn b3c_gate_recorded_verdict() {
    let doc: serde_json::Value = serde_json::from_str(&gate_doc()).unwrap();
    let s = &doc["summary"];
    let wb = &s["g_wb"];
    assert_eq!(wb["sessions"], 666);
    assert_eq!(wb["verdict"], "MET");
    assert_eq!(
        (wb["t1"].as_str(), wb["t2"].as_str(), wb["t3"].as_str()),
        (Some("MET"), Some("MET"), Some("MET"))
    );
    assert_eq!(wb["t1_coverage"], 0.9369369369369369);
    assert!(
        (wb["t2_median_area_share"].as_f64().unwrap() - 2.968_711_490_199_096_4e-6).abs() < 1e-18
    );
    assert!((wb["t3_centroid_ratio"].as_f64().unwrap() - 0.004_947_423_018_121_554).abs() < 1e-15);
    assert_eq!(wb["not_located"], 9);
    let all = &s["g_all"];
    assert_eq!(all["sessions"], 1000);
    assert_eq!(all["verdict"], "NOT MET");
    assert_eq!(all["t1"], "NOT MET");
    assert_eq!(all["t1_coverage"], 0.624);
    assert_eq!(
        (all["t2"].as_str(), all["t3"].as_str()),
        (Some("MET"), Some("MET"))
    );
    assert_eq!(all["not_located"], 343);
    let classes = &s["classes"];
    assert_eq!(
        (
            classes["narrowband"].as_u64(),
            classes["periodic"].as_u64(),
            classes["aperiodic"].as_u64()
        ),
        (Some(334), Some(333), Some(333))
    );
    // Every CW session is narrowband and not located; every chirp periodic; every noise session aperiodic.
    for r in doc["rows"].as_array().unwrap() {
        let class = match r["waveform"].as_str().unwrap() {
            "cw" => "narrowband",
            "chirp" => "periodic",
            _ => "aperiodic",
        };
        assert_eq!(r["class"], class, "seed {}", r["seed"]);
    }
}

fn oracle_check(seeds: std::ops::RangeInclusive<u64>) {
    let oracle: Vec<serde_json::Value> = serde_json::from_str(
        &std::fs::read_to_string(xval().join("oracle_9001-9020.json")).unwrap(),
    )
    .unwrap();
    let mut checked = 0;
    for o in oracle
        .iter()
        .filter(|o| seeds.contains(&o["seed"].as_u64().unwrap()))
    {
        let seed = o["seed"].as_u64().unwrap();
        let e = serde_json::to_value(locate(&session(seed, GATE_SEEDS.0))).unwrap();
        for key in ["reference", "class", "k_star", "located", "covered"] {
            assert_eq!(e[key], o[key], "seed {seed}: {key}");
        }
        match (e["period_samples"].as_f64(), o["period_samples"].as_f64()) {
            (Some(a), Some(b)) => assert!((a - b).abs() <= 1e-3, "seed {seed}: period"),
            (None, None) => {}
            _ => panic!("seed {seed}: period class differs"),
        }
        let pairs = |k: &str| -> Vec<(f64, f64)> {
            e[k].as_array()
                .unwrap()
                .iter()
                .zip(o[k].as_array().unwrap())
                .map(|(a, b)| (a.as_f64().unwrap(), b.as_f64().unwrap()))
                .collect()
        };
        for (a, b) in pairs("tau_s") {
            assert!((a - b).abs() <= 1e-10, "seed {seed}: tau {a} against {b}");
        }
        for (a, b) in pairs("sigma_s") {
            assert!(
                (a - b).abs() <= 1e-9 * b,
                "seed {seed}: sigma {a} against {b}"
            );
        }
        if e["class"] != "narrowband" {
            let d =
                |i: usize| e["estimate"][i].as_f64().unwrap() - o["estimate"][i].as_f64().unwrap();
            assert!(
                (d(0) * d(0) + d(1) * d(1)).sqrt() <= 0.05,
                "seed {seed}: solution"
            );
            let (ae, ao) = (
                e["region_area_m2"].as_f64().unwrap(),
                o["region_area_m2"].as_f64().unwrap(),
            );
            assert!((ae - ao).abs() <= 1e-4 * ao, "seed {seed}: region area");
        }
        checked += 1;
    }
    assert_eq!(checked, seeds.count());
}

#[test]
fn u12_engine_agrees_with_the_oracle_one_session_per_waveform() {
    oracle_check(9001..=9003);
}

#[test]
#[ignore]
fn u12_engine_agrees_with_the_oracle_on_all_twenty() {
    oracle_check(9001..=9020);
}

#[test]
#[ignore]
fn u11_the_gate_reproduces_its_recorded_bytes() {
    let seeds: Vec<u64> = (GATE_SEEDS.0..=GATE_SEEDS.1).collect();
    let threads = std::thread::available_parallelism().map_or(1, |n| n.get());
    let mut rows: Vec<B3cResult> = std::thread::scope(|sc| {
        let hs: Vec<_> = (0..threads)
            .map(|t| {
                let mine: Vec<u64> = seeds.iter().copied().skip(t).step_by(threads).collect();
                sc.spawn(move || {
                    mine.into_iter()
                        .map(|s| locate(&session(s, GATE_SEEDS.0)))
                        .collect::<Vec<_>>()
                })
            })
            .collect();
        hs.into_iter().flat_map(|h| h.join().unwrap()).collect()
    });
    rows.sort_by_key(|r| r.seed);
    let doc =
        serde_json::json!({"seeds": GATE_SEEDS, "summary": gate_summary(&rows), "rows": rows});
    assert!(
        format!("{doc}\n") == gate_doc(),
        "U11: the gate gives its recorded bytes"
    );
}
