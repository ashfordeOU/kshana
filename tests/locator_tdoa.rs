// SPDX-License-Identifier: AGPL-3.0-only
//! B3b (0.41): the TDOA jammer locator's synthetic gate, recorded (`docs/design/evidence/b3b-tdoa-locator/
//! RESULTS.md`, readings T1 to T17 in `xval/tdoa-locator/README.md`).
//!
//! * The gate's recorded verdict, the misses included: T1, T2 and T3 NOT MET.
//! * T16: on gate seeds 6001 to 6020 the engine agrees with the independent numpy oracle (`oracle.py`, its output
//!   committed as `oracle_6001-6020.json`) within the reading's tolerances, except the solution and region of seed
//!   6002, where Gauss–Newton diverges in both (recorded).
//! * T4: the whole gate (1 000 sessions) gives the recorded bytes. Ignored by default (a few minutes in release,
//!   longer in a debug build); the `b3b-determinism` CI job runs it on Linux, macOS and Windows.

use flate2::read::GzDecoder;
use kshana::locate_tdoa::{gate_summary, locate, session, SessionResult, GATE_SEEDS};
use std::io::Read;
use std::path::PathBuf;

fn xval() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/tdoa-locator")
}

fn gate_doc() -> String {
    let mut s = String::new();
    GzDecoder::new(std::fs::File::open(xval().join("gate.json.gz")).unwrap())
        .read_to_string(&mut s)
        .unwrap();
    s
}

#[test]
fn b3b_gate_recorded_verdict() {
    let doc: serde_json::Value = serde_json::from_str(&gate_doc()).unwrap();
    let s = &doc["summary"];
    assert_eq!(s["sessions"], 1000);
    assert_eq!(s["t1_coverage"], 0.044);
    assert_eq!(s["t1"], "NOT MET");
    assert_eq!(s["t2_median_area_share"], 1.0);
    assert_eq!(s["t2"], "NOT MET");
    assert_eq!(s["t3"], "NOT MET");
    assert!((s["t3_centroid_ratio"].as_f64().unwrap() - 3.347_367_360_464_606).abs() < 1e-12);
    assert_eq!(s["not_located"], 872);
    let per = s["per_waveform"].as_array().unwrap();
    let nl: Vec<u64> = per
        .iter()
        .map(|w| w["not_located"].as_u64().unwrap())
        .collect();
    assert_eq!(nl, vec![334, 324, 214], "not located: CW, chirp, noise");
}

#[test]
fn t16_the_engine_agrees_with_the_oracle() {
    let oracle: Vec<serde_json::Value> = serde_json::from_str(
        &std::fs::read_to_string(xval().join("oracle_6001-6020.json")).unwrap(),
    )
    .unwrap();
    let mut exact = 0;
    for o in &oracle {
        let seed = o["seed"].as_u64().unwrap();
        let e = serde_json::to_value(locate(&session(seed, GATE_SEEDS.0))).unwrap();
        for key in ["reference", "k_star", "located", "covered"] {
            assert_eq!(e[key], o[key], "seed {seed}: {key}");
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
            assert!((a - b).abs() <= 1e-12, "seed {seed}: tau {a} against {b}");
        }
        for (a, b) in pairs("sigma_s") {
            assert!(
                (a - b).abs() <= 1e-9 * b,
                "seed {seed}: sigma {a} against {b}"
            );
        }
        let f = |v: &serde_json::Value, k: &str| v[k].as_f64().unwrap();
        assert!(
            (f(&e, "error_m") - f(o, "error_m")).abs() <= 1e-3,
            "seed {seed}: error"
        );
        if seed == 6002 {
            // Recorded: Gauss-Newton diverges in both implementations (estimates about 5e8 m and 8e7 m from the
            // domain); both are not located, so the scored outputs agree while the diverged solutions do not.
            assert_eq!(e["located"], false);
            continue;
        }
        let (de, dn) = (
            e["estimate"][0].as_f64().unwrap() - o["estimate"][0].as_f64().unwrap(),
            e["estimate"][1].as_f64().unwrap() - o["estimate"][1].as_f64().unwrap(),
        );
        assert!((de * de + dn * dn).sqrt() <= 1e-3, "seed {seed}: solution");
        let (ae, ao) = (f(&e, "region_area_m2"), f(o, "region_area_m2"));
        assert!((ae - ao).abs() <= 1e-6 * ao, "seed {seed}: region area");
        exact += 1;
    }
    assert_eq!(exact, 19);
}

#[test]
#[ignore]
fn t4_the_gate_reproduces_its_recorded_bytes() {
    let seeds: Vec<u64> = (GATE_SEEDS.0..=GATE_SEEDS.1).collect();
    let threads = std::thread::available_parallelism().map_or(1, |n| n.get());
    let mut rows: Vec<SessionResult> = std::thread::scope(|sc| {
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
        "T4: the gate gives its recorded bytes"
    );
}
