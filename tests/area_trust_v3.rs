// SPDX-License-Identifier: AGPL-3.0-only
//! B5 area trust, version 3 (`PREREGISTRATION-v3.md`, readings X4 to X12 in `xval/area-trust/README.md`).
//!
//! T1: on the seeded satellite-fault replays (4, 5, 7 and 10 stations, 520 epochs) the engine's JSON
//! Lines (flagged satellite, station states, loss-of-lock flags and the area timeline) are
//! `oracle_v3.py`'s bytes, through the library and the command line; the horizontal errors before and
//! after the screen agree within 1e-6 m (X12). The v2 replays and boundary documents with
//! `"area_rule": "v3"` give v2's bytes (X6). T2 (X8): every injected single-satellite fault that alarms
//! at least `k` stations is flagged with that satellite and raises no area alert after the screen; an
//! error at one station is not flagged; two faulty satellites are not explained by one; loss of lock
//! alone leaves the station nominal with the alarm in its record. T5: the generator writes the same
//! documents now, byte for byte, as the oracle read.
//!
//! Fixtures: `tests/fixtures/area_trust/v3_<seed>.measurements.json.gz` (the generator's output),
//! `v3_<seed>.expected.jsonl.gz` and `v3_<seed>.detail.jsonl.gz` (the oracle's). Regenerate with
//! `cargo test --test area_trust_v3 -- --ignored write_v3_fixtures`, then
//! `python3 -I xval/area-trust/oracle_v3.py [--detail]` on each document.

use flate2::read::GzDecoder;
use kshana::area_trust::v3::{fault_replay, measurements_jsonl, FaultReplay, Injection};
use kshana::area_trust::{timeline_jsonl, StationState};
use std::io::Read;
use std::path::PathBuf;

/// (seed, stations, epochs): 520 epochs in all (X7: at least 500).
const SETS: [(u64, usize, usize); 4] = [
    (5101, 4, 130),
    (5102, 5, 130),
    (5103, 7, 130),
    (5104, 10, 130),
];

fn dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/area_trust")
}

fn gunzip(path: PathBuf) -> String {
    let mut s = String::new();
    GzDecoder::new(
        std::fs::File::open(&path).unwrap_or_else(|e| panic!("{}: {e}", path.display())),
    )
    .read_to_string(&mut s)
    .unwrap();
    s
}

fn document(r: &FaultReplay) -> String {
    serde_json::to_string(&r.doc).unwrap()
}

#[test]
#[ignore]
fn write_v3_fixtures() {
    use flate2::{write::GzEncoder, Compression};
    use std::io::Write;
    for (seed, n, e) in SETS {
        let r = fault_replay(seed, n, e);
        let path = dir().join(format!("v3_{seed}.measurements.json.gz"));
        let mut gz = GzEncoder::new(std::fs::File::create(&path).unwrap(), Compression::best());
        gz.write_all(document(&r).as_bytes()).unwrap();
        gz.finish().unwrap();
        println!(
            "seed {seed}: {n} stations, {e} epochs, {} redrawn",
            r.redrawn
        );
    }
}

#[test]
fn t5_the_generator_writes_the_documents_the_oracle_read() {
    for (seed, n, e) in SETS {
        let r = fault_replay(seed, n, e);
        let committed = gunzip(dir().join(format!("v3_{seed}.measurements.json.gz")));
        assert!(
            document(&r) == committed,
            "T5: seed {seed} gives the committed document"
        );
    }
}

#[test]
fn t1_t5_the_engine_equals_oracle_v3() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let mut epochs = 0;
    let mut seconds = 0;
    let mut flagged = 0;
    for (seed, _, _) in SETS {
        let path = dir().join(format!("v3_{seed}.measurements.json.gz"));
        let doc = gunzip(path);
        let oracle = gunzip(dir().join(format!("v3_{seed}.expected.jsonl.gz")));
        let engine = timeline_jsonl(&doc).unwrap();
        if engine != oracle {
            let first = engine
                .lines()
                .zip(oracle.lines())
                .find(|(a, b)| a != b)
                .map(|(a, b)| format!("engine {a}\noracle {b}"));
            panic!("T1: seed {seed} differs from oracle_v3: {first:?}");
        }
        // The command line, on the same document.
        let tmp =
            std::env::temp_dir().join(format!("kshana-b5v3-{seed}-{}.json", std::process::id()));
        std::fs::write(&tmp, &doc).unwrap();
        let cli = std::process::Command::new(bin)
            .args(["area-trust", tmp.to_str().unwrap()])
            .output()
            .unwrap();
        assert!(
            cli.status.success() && cli.stdout == oracle.as_bytes(),
            "T5: the command line gives oracle_v3's bytes (seed {seed})"
        );
        // X12: the horizontal errors within 1e-6 m; a missing fix missing in both.
        let detail = measurements_jsonl(&doc, true).unwrap();
        let oracle_detail = gunzip(dir().join(format!("v3_{seed}.detail.jsonl.gz")));
        for (a, b) in detail.lines().zip(oracle_detail.lines()) {
            let a: serde_json::Value = serde_json::from_str(a).unwrap();
            let b: serde_json::Value = serde_json::from_str(b).unwrap();
            assert_eq!(a["t"], b["t"]);
            assert_eq!(a["satellite_fault"], b["satellite_fault"], "seed {seed}");
            for key in ["err_h_m", "err_h_screened_m"] {
                for (x, y) in a[key]
                    .as_array()
                    .unwrap()
                    .iter()
                    .zip(b[key].as_array().unwrap())
                {
                    match (x.as_f64(), y.as_f64()) {
                        (Some(x), Some(y)) => assert!(
                            (x - y).abs() <= 1e-6,
                            "X12: seed {seed} t {} {key}: {x} against {y}",
                            a["t"]
                        ),
                        (None, None) => {}
                        _ => panic!("X12: a fix missing in one only (seed {seed}, t {})", a["t"]),
                    }
                }
            }
        }
        assert_eq!(detail.lines().count(), oracle_detail.lines().count());
        let _ = std::fs::remove_file(&tmp);
        for l in oracle.lines() {
            if l.contains(r#""kind":"epoch""#) {
                epochs += 1;
                if !l.contains(r#""satellite_fault":null"#) {
                    flagged += 1;
                }
            } else {
                seconds += 1;
            }
        }
    }
    println!("T1 v3: {epochs} epochs ({flagged} flagged) and {seconds} grid seconds, all equal to oracle_v3");
    assert!(epochs >= 500);
}

/// T2 on v3 (X8), scored once on 12 November 2026 and recorded here, the misses included:
/// - common faults alarming at least `k` stations: 123 of 127 flagged with the injected satellite and
///   cleared; 4 not flagged (seed 5103 t 16, 46 and 83; seed 5104 t 40): without the faulty satellite
///   one or two stations, left with 6 or 7 satellites, still exceed their `H_s`, so no single satellite
///   explains the epoch under X4;
/// - errors at one station only: none flagged (all 83);
/// - two faulty satellites alarming at least `k` stations: 65 of 67 not flagged; 2 flagged (seed 5101
///   t 30, G02, errors 680.8 m and 27.7 m; seed 5102 t 84, G07, errors 129.4 m and 65.4 m): the
///   smaller error alone alarms no station, so removing one satellite clears them all;
/// - loss of lock alone: the station stays nominal with the alarm in its record (all 40 epochs).
#[test]
fn t2_v3_recorded() {
    use kshana::area_trust::v3::{screen, station_state};
    let (mut caught, mut one, mut two_unflagged, mut lock) = (0, 0, 0, 0);
    let (mut missed, mut two_flagged, mut one_flagged) = (Vec::new(), Vec::new(), Vec::new());
    let mut common_total = 0;
    let mut two_total = 0;
    for (seed, n, e) in SETS {
        let r = fault_replay(seed, n, e);
        for (ep, inj) in r.doc.epochs.iter().zip(&r.injections) {
            let st = &r.doc.stations;
            let sc = screen(st, &ep.stations);
            let alarmed = (0..n)
                .filter(|&i| sc.err_h_m[i].is_some_and(|x| x > st[i].h_s_m))
                .count();
            let n_fix = sc.err_h_m.iter().filter(|x| x.is_some()).count();
            let k = 2usize.max(n_fix.div_ceil(3));
            match inj {
                Injection::CommonFault { sat, .. } if alarmed >= k => {
                    common_total += 1;
                    let cleared =
                        (0..n).all(|i| sc.err_h_screened_m[i].is_some_and(|x| x <= st[i].h_s_m));
                    if sc.satellite_fault.as_deref() == Some(sat.as_str()) && cleared {
                        caught += 1;
                    } else {
                        missed.push((seed, ep.t));
                    }
                }
                Injection::OneStation { .. } => {
                    if sc.satellite_fault.is_some() {
                        one_flagged.push((seed, ep.t));
                    } else {
                        one += 1;
                    }
                }
                Injection::TwoSatellites { .. } if alarmed >= k => {
                    two_total += 1;
                    match &sc.satellite_fault {
                        None => two_unflagged += 1,
                        Some(f) => two_flagged.push((seed, ep.t, f.clone())),
                    }
                }
                Injection::LockAlone { stations } => {
                    for &i in stations {
                        let rep = ep.stations[i].as_ref().unwrap();
                        assert!(rep.lock_alarm);
                        assert_eq!(
                            station_state(rep, sc.err_h_screened_m[i], st[i].h_s_m),
                            StationState::Nominal,
                            "X8: loss of lock alone leaves the station nominal (seed {seed} t {})",
                            ep.t
                        );
                    }
                    lock += 1;
                }
                _ => {}
            }
        }
    }
    println!(
        "T2 v3: common faults {caught} of {common_total} flagged and cleared, missed {missed:?}; \
         one-station errors {one} not flagged, flagged {one_flagged:?}; two-satellite epochs \
         {two_unflagged} of {two_total} not flagged, flagged {two_flagged:?}; lock-only epochs {lock} nominal"
    );
    assert_eq!((caught, common_total), (123, 127));
    assert_eq!(missed, vec![(5103, 16), (5103, 46), (5103, 83), (5104, 40)]);
    assert!(one_flagged.is_empty());
    assert_eq!((two_unflagged, two_total), (65, 67));
    assert_eq!(
        two_flagged,
        vec![(5101, 30, "G02".to_string()), (5102, 84, "G07".to_string())]
    );
    assert_eq!((one, lock), (ONE_STATION_EPOCHS, LOCK_ONLY_EPOCHS));
}

/// Recorded with T2 (counts of the replays' one-station and lock-only epochs).
const ONE_STATION_EPOCHS: usize = 83;
const LOCK_ONLY_EPOCHS: usize = 40;

#[test]
fn t2_v3_no_area_alert_from_a_flagged_fault() {
    // An epoch whose only cause is a common fault that the screen clears leaves every station nominal.
    for (seed, n, e) in SETS {
        let r = fault_replay(seed, n, e);
        let out = timeline_jsonl(&serde_json::to_string(&r.doc).unwrap()).unwrap();
        for (line, inj) in out
            .lines()
            .filter(|l| l.contains(r#""kind":"epoch""#))
            .zip(&r.injections)
        {
            if matches!(inj, Injection::CommonFault { .. })
                && !line.contains(r#""satellite_fault":null"#)
            {
                assert!(
                    !line.contains("untrusted") && !line.contains("degraded"),
                    "X8: seed {seed}: a flagged epoch leaves no station in alarm: {line}"
                );
            }
        }
        let _ = n;
    }
}
