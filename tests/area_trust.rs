// SPDX-License-Identifier: AGPL-3.0-only
//! B5 area trust (0.41). T1: on seeded multi-station replays (4 to 50 stations, at least 500 events in
//! all) the engine's area timeline equals the independent oracle's (`xval/area-trust/oracle.py`) in
//! every grid second: state, alert, live, degraded, untrusted and stale counts. T2: every event that puts
//! at least `k` stations in alarm in one second raises the expected area alert; an event with fewer
//! raises no `UNTRUSTED`. T5: the same seed gives the same stations document, byte for byte, and the
//! document the oracle read is the one the generator writes now.
//!
//! The fixtures are `tests/fixtures/area_trust/replay_<seed>.stations.json.gz` (the generator's output)
//! and `replay_<seed>.expected.jsonl.gz` (the oracle's). Regenerate with
//! `cargo test --test area_trust -- --ignored write_fixtures` and then
//! `python3 -I xval/area-trust/oracle.py` on each document (see `xval/area-trust/README.md`).

use flate2::read::GzDecoder;
use kshana::area_trust::synth::{replay, Replay};
use kshana::area_trust::{
    raw_state, timeline, timeline_jsonl, AreaState, Station, StationState, Stations,
};
use std::io::Read;
use std::path::PathBuf;

/// (seed, stations, events): 4 to 50 stations, 520 events in all.
const SETS: [(u64, usize, usize); 7] = [
    (4101, 4, 90),
    (4102, 5, 80),
    (4103, 7, 80),
    (4104, 10, 80),
    (4105, 16, 70),
    (4106, 25, 60),
    (4107, 50, 60),
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

fn document(rep: &Replay) -> String {
    serde_json::to_string(&Stations {
        stations: rep.stations.clone(),
    })
    .unwrap()
}

#[test]
#[ignore]
fn write_fixtures() {
    use flate2::{write::GzEncoder, Compression};
    use std::io::Write;
    for (seed, n, e) in SETS {
        let rep = replay(seed, n, e);
        let path = dir().join(format!("replay_{seed}.stations.json.gz"));
        let mut gz = GzEncoder::new(std::fs::File::create(path).unwrap(), Compression::best());
        gz.write_all(document(&rep).as_bytes()).unwrap();
        gz.finish().unwrap();
    }
}

#[test]
fn t1_t5_the_engine_equals_the_oracle_every_second() {
    let mut events = 0;
    let mut seconds = 0;
    for (seed, n, e) in SETS {
        let rep = replay(seed, n, e);
        let doc = document(&rep);
        assert_eq!(doc, document(&replay(seed, n, e)), "T5: seed {seed}");
        assert_eq!(
            doc,
            gunzip(dir().join(format!("replay_{seed}.stations.json.gz"))),
            "T5: the document the oracle read is the one the generator writes (seed {seed})"
        );
        let parsed: Stations = serde_json::from_str(&doc).unwrap();
        let got = timeline(&parsed.stations);
        let oracle_text = gunzip(dir().join(format!("replay_{seed}.expected.jsonl.gz")));
        assert!(
            timeline_jsonl(&doc).unwrap() == oracle_text,
            "T1/T5: the JSON Lines are the oracle's bytes (seed {seed})"
        );
        let expected: Vec<serde_json::Value> = oracle_text
            .lines()
            .map(|l| serde_json::from_str(l).unwrap())
            .collect();
        assert_eq!(got.len(), expected.len(), "seed {seed}");
        for (g, x) in got.iter().zip(&expected) {
            assert_eq!(
                serde_json::to_value(g).unwrap(),
                *x,
                "T1: seed {seed}, grid second {}",
                g.g
            );
        }
        events += rep.events.len();
        seconds += got.len();
    }
    assert!(events >= 500, "{events} events");
    println!("T1: {seconds} grid seconds over {events} events, all equal to the oracle");
}

#[test]
fn t2_every_event_of_k_or_more_stations_raises_its_alert() {
    let (mut big, mut small, mut untrusted_big) = (0, 0, 0);
    for (seed, n, e) in SETS {
        let rep = replay(seed, n, e);
        let tl = timeline(&rep.stations);
        let k = 2usize.max(rep.n_stations.div_ceil(3));
        for ev in &rep.events {
            let window: Vec<_> = tl
                .iter()
                .filter(|s| (s.g as f64) >= ev.onset_s && (s.g as f64) < ev.end_s)
                .collect();
            assert!(
                window.iter().all(|s| s.n == rep.n_stations),
                "every station live during an event"
            );
            let expected = if ev.peak_untrusted >= k {
                AreaState::Untrusted
            } else if ev.peak_in_alarm >= k || ev.peak_untrusted >= 1 {
                AreaState::Degraded
            } else {
                AreaState::Trusted
            };
            let alerted: Vec<AreaState> =
                window.iter().filter(|s| s.alert).map(|s| s.state).collect();
            if ev.peak_in_alarm >= k {
                big += 1;
                untrusted_big += usize::from(expected == AreaState::Untrusted);
                assert!(
                    alerted.contains(&expected),
                    "seed {seed}: {ev:?} expected an alert to {expected:?}, got {alerted:?}"
                );
            } else {
                small += 1;
                assert!(
                    !alerted.contains(&AreaState::Untrusted),
                    "seed {seed}: {ev:?} has fewer than k = {k} stations in alarm"
                );
            }
            // The area returns to TRUSTED before the next event (quiet gaps outlast the hold).
            let after = tl
                .iter()
                .find(|s| s.g as f64 == ev.end_s + 24.0)
                .map(|s| s.state);
            if let Some(a) = after {
                assert!(
                    matches!(a, AreaState::Trusted | AreaState::Unknown),
                    "seed {seed}: {a:?} after {ev:?}"
                );
            }
        }
    }
    println!("T2: {big} events with at least k stations in alarm ({untrusted_big} untrusted), all alerted; {small} with fewer, no UNTRUSTED");
    assert!(big >= 100 && small >= 100 && untrusted_big >= 30);
}

/// The hand-built boundary documents are in the fixtures too (`<name>.stations.json`), with the
/// oracle's timeline (`<name>.expected.jsonl`).
fn same_as_oracle(name: &str, stations: &[Station]) {
    let doc = serde_json::to_string(&Stations {
        stations: stations.to_vec(),
    })
    .unwrap();
    let path = dir().join(format!("{name}.stations.json"));
    if std::env::var_os("KSHANA_WRITE_AREA_FIXTURES").is_some() {
        std::fs::write(&path, &doc).unwrap();
        return;
    }
    assert_eq!(doc, std::fs::read_to_string(&path).unwrap(), "{name}");
    let expected: Vec<serde_json::Value> =
        std::fs::read_to_string(dir().join(format!("{name}.expected.jsonl")))
            .unwrap()
            .lines()
            .map(|l| serde_json::from_str(l).unwrap())
            .collect();
    let got: Vec<serde_json::Value> = timeline(stations)
        .iter()
        .map(|g| serde_json::to_value(g).unwrap())
        .collect();
    assert_eq!(got, expected, "{name}");
}

fn st(epochs: &[(f64, StationState)]) -> Station {
    Station {
        id: "x".into(),
        epochs: epochs.to_vec(),
    }
}

#[test]
fn boundary_rules() {
    use StationState::*;
    // k = max(2, ceil(N/3)).
    assert_eq!(raw_state(&[Untrusted]).0, AreaState::Unknown);
    assert_eq!(raw_state(&[Nominal, Untrusted]).0, AreaState::Degraded);
    assert_eq!(raw_state(&[Untrusted, Untrusted]).0, AreaState::Untrusted);
    let nine = |d: usize| {
        let mut v = vec![Nominal; 9];
        v[..d].fill(Degraded);
        raw_state(&v).0
    };
    assert_eq!(nine(2), AreaState::Trusted, "2 of 9 < k = 3");
    assert_eq!(nine(3), AreaState::Degraded);
    let mut ten = vec![Nominal; 10];
    ten[..3].fill(Untrusted);
    assert_eq!(raw_state(&ten).0, AreaState::Degraded, "3 of 10 < k = 4");
    ten[3] = Untrusted;
    assert_eq!(raw_state(&ten).0, AreaState::Untrusted);

    // The last epoch of a second wins; a station stale after 5 s without an epoch.
    let a = st(&[(0.1, Nominal), (0.9, Untrusted), (1.0, Untrusted)]);
    let b = st(&[(0.0, Untrusted), (4.5, Untrusted), (7.0, Untrusted)]);
    let tl = timeline(&[a.clone(), b.clone()]);
    same_as_oracle("boundary_stale", &[a, b]);
    assert_eq!(tl[0].state, AreaState::Untrusted, "{:?}", tl[0]);
    assert!(!tl[0].alert, "the first second raises no alert");
    // a's last epoch is at 1: live through 5, stale from 6.
    assert_eq!((tl[5].n, tl[5].stale), (2, 0));
    assert_eq!(
        (tl[6].n, tl[6].stale, tl[6].state),
        (1, 1, AreaState::Unknown)
    );
    // b reports again at 7; a is still stale, so UNKNOWN stays.
    assert_eq!(tl[7].state, AreaState::Unknown);

    // Hysteresis: worse at once, better only after 10 s, as the worst raw state of those 10 s.
    let mut ep_a = Vec::new();
    let mut ep_b = Vec::new();
    for g in 0..40 {
        let t = g as f64 + 0.5;
        let (sa, sb) = match g {
            5..=7 => (Untrusted, Untrusted),
            8..=12 => (Untrusted, Nominal),
            _ => (Nominal, Nominal),
        };
        ep_a.push((t, sa));
        ep_b.push((t, sb));
    }
    let tl = timeline(&[st(&ep_a), st(&ep_b)]);
    same_as_oracle("boundary_hold", &[st(&ep_a), st(&ep_b)]);
    assert_eq!(tl[5].state, AreaState::Untrusted);
    assert!(tl[5].alert);
    // Raw is DEGRADED from 8 to 12 and TRUSTED from 13: better than UNTRUSTED for 10 s by 17, when
    // the worst of 8..=17 is DEGRADED.
    assert_eq!(tl[16].state, AreaState::Untrusted);
    assert_eq!(tl[17].state, AreaState::Degraded);
    assert!(!tl[17].alert, "an improvement is not an alert");
    // Then TRUSTED once 13..=22 hold: at 22 (better than DEGRADED since 13).
    assert_eq!(tl[21].state, AreaState::Degraded);
    assert_eq!(tl[22].state, AreaState::Trusted);
    assert!(timeline(&[]).is_empty());
    assert!(timeline_jsonl("{}").is_err());
    assert!(
        timeline_jsonl(r#"{"stations":[{"id":"a","epochs":[[2.0,"nominal"],[1.0,"nominal"]]}]}"#)
            .is_err(),
        "epochs out of time order are refused"
    );
}

/// T4 was NOT MET (`docs/design/evidence/b5-area-trust/RESULTS.md`): the miss is pinned here, from the
/// result the scored run wrote (`tests/area_trust_igs.rs` reproduces it from the fetched files).
#[test]
fn t4_miss_is_recorded() {
    let r: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(
            PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/area-trust/t4_result.json"),
        )
        .unwrap(),
    )
    .unwrap();
    assert_eq!(r["verdict"], "NOT MET");
    assert_eq!(r["scored_days"], 13.0);
    assert_eq!(r["alerts_degraded_or_worse"], 23);
    assert_eq!(r["alerts_untrusted"], 0);
    assert!(r["per_area_day_degraded_or_worse"].as_f64().unwrap() > 1.0);
}
