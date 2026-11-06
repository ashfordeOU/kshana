// SPDX-License-Identifier: AGPL-3.0-only
//! Live ingest at scale (A3b): one wildcard subscription split into one feed per station gives each
//! station exactly the epochs of `kshana connect map` on that station's own log, and the load harness
//! keeps up with a small offered load in both modes. The full target (1,000 stations at 1 Hz) is run
//! in release by `kshana connect load-test`; see docs/CONNECT.md.

use kshana::connect::{map, parse_mapping};
use kshana::connect_load::{run_memory, run_mqtt};
use kshana::connect_mqtt::TopicFeeds;
use kshana::obs::{Record, Station};
use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn epochs_of(r: &[Record], station: &str) -> Vec<serde_json::Value> {
    r.iter()
        .filter_map(|x| match x {
            Record::Epoch(e) if e.station == station => {
                let mut v = serde_json::to_value(e).unwrap();
                v["station"] = serde_json::Value::Null;
                Some(v)
            }
            _ => None,
        })
        .collect()
}

#[test]
fn per_topic_feeds_keep_stations_apart() {
    let read = |p: &str| std::fs::read_to_string(root().join(p)).unwrap();
    let mapping = parse_mapping(&read("examples/connect/timing-monitor.connect.toml")).unwrap();
    let station: Station = toml::from_str(&read("examples/obs/station.toml")).unwrap();
    let whole = read("examples/connect/timing-monitor.csv");
    let lines: Vec<&str> = whole.lines().filter(|l| !l.starts_with('#')).collect();
    let header = lines[0];
    let rows = &lines[1..];
    let want = map(&mapping, &whole, &station).unwrap();

    // Two stations publish the same log, interleaved row by row, with one row of station b late.
    let mut feeds = TopicFeeds::new(&mapping, Some(header)).unwrap();
    let mut got = Vec::new();
    for (i, r) in rows.iter().enumerate() {
        got.extend(
            feeds
                .push("site/rx/a", r.as_bytes(), &mapping, &station)
                .unwrap(),
        );
        if i > 0 {
            got.extend(
                feeds
                    .push("site/rx/b", rows[i - 1].as_bytes(), &mapping, &station)
                    .unwrap(),
            );
        }
    }
    got.extend(
        feeds
            .push(
                "site/rx/b",
                rows[rows.len() - 1].as_bytes(),
                &mapping,
                &station,
            )
            .unwrap(),
    );
    got.extend(feeds.flush(&mapping).unwrap());
    assert_eq!(feeds.len(), 2);
    let base = epochs_of(&want, &station.id);
    assert!(!base.is_empty());
    for s in ["a", "b"] {
        assert_eq!(
            epochs_of(&got, &format!("{}/{s}", station.id)),
            base,
            "station {s}"
        );
    }
    let headers: Vec<&str> = got
        .iter()
        .filter_map(|x| match x {
            Record::Header(h) => Some(h.station.id.as_str()),
            _ => None,
        })
        .collect();
    assert_eq!(headers.len(), 2, "one header per station");
}

#[test]
fn a_small_load_keeps_up_in_memory_and_over_mqtt() {
    let m = run_memory(100, 2.0, 3).unwrap();
    assert_eq!(m.messages, 600);
    assert_eq!(
        m.epochs, 600,
        "every row is an epoch, the last of each station released at the end"
    );
    assert!(m.pass, "{m:?}");
    // Paced in real time: 50 stations at 4 Hz for 2 s takes about 2 s of wall time.
    let q = run_mqtt(50, 4.0, 2).unwrap();
    assert_eq!((q.messages, q.epochs), (400, 400), "{q:?}");
    assert!(q.pass, "{q:?}");
    assert!(q.wall_s >= 1.7, "paced: {q:?}");
}
