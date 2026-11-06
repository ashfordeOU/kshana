// SPDX-License-Identifier: AGPL-3.0-only
//! Live directory watch (A3a): a log written in pieces, then rotated into a second file, gives the
//! same epochs as `kshana connect map` on the whole log, with one header and no epoch emitted early.

use kshana::connect::{map, parse_mapping};
use kshana::connect_watch::{flush, step, WatchState};
use kshana::obs::{Record, Station};
use std::path::Path;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn epochs(r: &[Record]) -> Vec<String> {
    r.iter()
        .filter_map(|x| match x {
            Record::Epoch(e) => Some(serde_json::to_string(e).unwrap()),
            _ => None,
        })
        .collect()
}

#[test]
fn pieces_and_rotation_give_the_whole_log() {
    let read = |p: &str| std::fs::read_to_string(root().join(p)).unwrap();
    let mapping = parse_mapping(&read("examples/connect/android-raw.connect.toml")).unwrap();
    let station: Station = toml::from_str(&read("examples/obs/station.toml")).unwrap();
    let whole = read("examples/connect/android-raw.csv");
    let want = map(&mapping, &whole, &station).unwrap();

    let dir = std::env::temp_dir().join(format!(
        "kshana-watch-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let lines: Vec<&str> = whole.lines().collect();
    // The preamble is the comment lines and the header row; the rest are data rows.
    let n_pre = lines.iter().position(|l| l.starts_with("type,")).unwrap() + 1;
    let head = lines[..n_pre].join("\n");
    let rows = &lines[n_pre..];
    let half = rows.len() / 2;
    let mut st = WatchState::default();
    let mut got = Vec::new();
    // File 1 grows in three pieces; the last piece ends without a newline (a write in progress).
    let f1 = dir.join("log-001.csv");
    let third = half / 3;
    let pieces = [
        &rows[..third],
        &rows[third..2 * third],
        &rows[2 * third..half],
    ];
    let mut text = format!("{head}\n");
    std::fs::write(&f1, &text).unwrap();
    got.extend(step(&dir, ".csv", &mapping, &station, &mut st).unwrap());
    for (k, p) in pieces.iter().enumerate() {
        text.push_str(&p.join("\n"));
        if k < 2 {
            text.push('\n');
        }
        std::fs::write(&f1, &text).unwrap();
        got.extend(step(&dir, ".csv", &mapping, &station, &mut st).unwrap());
    }
    // The logger finishes the line and rotates to file 2.
    text.push('\n');
    std::fs::write(&f1, &text).unwrap();
    std::fs::write(
        dir.join("log-002.csv"),
        format!("{head}\n{}\n", rows[half..].join("\n")),
    )
    .unwrap();
    std::fs::write(dir.join("notes.txt"), "ignored\n").unwrap();
    got.extend(step(&dir, ".csv", &mapping, &station, &mut st).unwrap());
    got.extend(flush(&dir, ".csv", &mapping, &station, &mut st).unwrap());
    let _ = std::fs::remove_dir_all(&dir);

    assert_eq!(
        got.iter()
            .filter(|r| matches!(r, Record::Header(_)))
            .count(),
        1
    );
    assert!(
        matches!(&got[0], Record::Header(h) if h.source_format.as_deref() == Some("connect-watch:csv"))
    );
    assert_eq!(st.emitted, epochs(&want).len());
    assert_eq!(epochs(&got), epochs(&want));
}
