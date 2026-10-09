// SPDX-License-Identifier: AGPL-3.0-only
//! The training scenarios in `scenarios/training/`: determinism, checksum validity, every
//! sentence read back by the receiver-trust NMEA reader, a golden excerpt per scenario,
//! the injected events visible in the output, and the stream sinks on localhost.
//!
//! To rewrite a golden excerpt after an intended change, run with `KSHANA_BLESS_GOLDEN=1`
//! and review the diff.

use kshana::nmea_synth::config::TrainingScenario;
use kshana::nmea_synth::gen::{generate, Generated};
use kshana::nmea_synth::stream::{self, Pace, Sink, TcpServer, UdpSink, WriterSink};
use kshana::receiver_trust::ingest::read_nmea;
use std::io::Read;
use std::net::{TcpStream, UdpSocket};
use std::path::PathBuf;
use std::time::Duration;

/// (name, epochs pinned in the golden excerpt)
const SCENARIOS: [(&str, &[usize]); 4] = [
    ("open-sea-jamming", &[0, 330, 500]),
    ("coastal-drag-off", &[0, 600]),
    ("port-approach-time-spoof", &[0, 700]),
    ("combined-event", &[0, 400, 900, 1500]),
];

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn load(name: &str) -> TrainingScenario {
    let p = root()
        .join("scenarios/training")
        .join(format!("{name}.toml"));
    let text = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    TrainingScenario::parse(&text).unwrap_or_else(|e| panic!("{name}: {e}"))
}

fn run(name: &str) -> Generated {
    generate(&load(name)).unwrap()
}

fn xor(s: &str) -> u8 {
    s.bytes().fold(0, |a, b| a ^ b)
}

/// Expected field count (commas + 1) per sentence type; GSV and GSA are checked apart.
fn strict_check(line: &str) {
    assert!(line.len() <= 80, "over the 82-character limit: {line}");
    assert!(line.starts_with('$'), "{line}");
    let star = line
        .rfind('*')
        .unwrap_or_else(|| panic!("no checksum: {line}"));
    let body = &line[1..star];
    let want = u8::from_str_radix(&line[star + 1..], 16).expect("hex checksum");
    assert_eq!(xor(body), want, "bad checksum: {line}");
    assert_eq!(line.len() - star - 1, 2, "checksum is two digits: {line}");
    assert!(line.is_ascii());
    let f: Vec<&str> = body.split(',').collect();
    let kind = &f[0][f[0].len() - 3..];
    let fields = |n: usize| assert_eq!(f.len(), n, "{kind} field count: {line}");
    match kind {
        "GGA" => fields(15),
        "RMC" => fields(14),
        "VTG" => fields(10),
        "GNS" => fields(14),
        "ZDA" => fields(7),
        "HDT" => fields(3),
        "VBW" => fields(11),
        "GSA" => fields(19),
        "GSV" => {
            assert!(
                f.len() == 5 || (f.len() - 5) % 4 == 0 && f.len() <= 21,
                "{line}"
            );
            assert!(
                f.len() % 4 == 1,
                "GSV groups of four plus a signal id: {line}"
            );
        }
        "SHT" => {}
        other => panic!("unexpected sentence type {other}"),
    }
}

#[test]
fn every_sentence_is_checksum_valid_and_the_reader_accepts_it() {
    for (name, _) in SCENARIOS {
        let g = run(name);
        let text = g.nmea_text();
        let mut n = 0;
        for l in text.lines() {
            strict_check(l);
            n += 1;
        }
        assert!(text.ends_with("\r\n"));
        assert!(n > g.epochs.len() * 8, "{name}: only {n} sentences");
        let tl = read_nmea(&text).unwrap();
        assert_eq!(
            tl.skipped_records, 0,
            "{name}: the reader skipped sentences"
        );
        assert!(tl.epochs.len() > 100, "{name}");
        assert!(
            tl.epochs.iter().any(|e| !e.cn0.is_empty()),
            "{name}: no C/N0 read back"
        );
        assert!(tl.observables.contains(&"fix".to_string()));
    }
}

#[test]
fn every_sentence_type_is_present_each_epoch() {
    let g = run("open-sea-jamming");
    for kind in [
        "GGA", "RMC", "VTG", "GSV", "GSA", "GNS", "ZDA", "HDT", "VBW",
    ] {
        for e in g.epochs.iter().step_by(37) {
            assert!(
                e.lines.iter().any(|l| l[3..6] == *kind
                    || l[1..].starts_with("HEHDT") && kind == "HDT"
                    || l[1..].starts_with("VDVBW") && kind == "VBW"),
                "epoch {} lacks {kind}",
                e.t_s
            );
        }
    }
}

#[test]
fn deterministic_per_seed_and_sensitive_to_it() {
    let a = run("combined-event").nmea_text();
    let b = run("combined-event").nmea_text();
    assert_eq!(a, b);
    let mut s = load("combined-event");
    s.scenario.seed += 1;
    assert_ne!(a, generate(&s).unwrap().nmea_text());
    let j1 = run("combined-event").log.to_json();
    assert_eq!(j1, run("combined-event").log.to_json());
}

#[test]
fn golden_excerpts() {
    for (name, ts) in SCENARIOS {
        let g = run(name);
        let mut out = String::new();
        for &t in ts {
            out.push_str(&format!("# epoch {t}\n"));
            for l in &g.epochs[t].lines {
                out.push_str(l);
                out.push('\n');
            }
        }
        let path = root()
            .join("tests/fixtures/nmea_training")
            .join(format!("{name}.golden.nmea"));
        if std::env::var("KSHANA_BLESS_GOLDEN").is_ok() {
            std::fs::write(&path, &out).unwrap();
        }
        let want = std::fs::read_to_string(&path)
            .unwrap_or_else(|e| panic!("{}: {e} (run with KSHANA_BLESS_GOLDEN=1)", path.display()));
        assert_eq!(
            out,
            want.replace("\r\n", "\n"),
            "{name}: golden excerpt changed"
        );
    }
}

fn row_at(g: &Generated, t: f64) -> &kshana::nmea_synth::log::TrackRow {
    g.log
        .track
        .iter()
        .find(|r| r.t_s == t)
        .unwrap_or_else(|| panic!("no row at {t}"))
}

#[test]
fn jamming_loses_the_fix_and_recovers_after_reacquisition() {
    let g = run("open-sea-jamming");
    assert!(row_at(&g, 200.0).fix_valid);
    assert!(!row_at(&g, 500.0).fix_valid, "fix must be lost mid-jamming");
    assert!(row_at(&g, 500.0).n_used < 4);
    assert!(
        row_at(&g, 900.0).fix_valid,
        "fix must be back well after the jammer clears"
    );
    // The lost fix is visible in the sentences: GGA quality 0, RMC status V.
    let e = &g.epochs[500];
    assert!(e
        .lines
        .iter()
        .any(|l| l.starts_with("$GNGGA") && l.contains(",,,,,0,00,99.99")));
    assert!(e
        .lines
        .iter()
        .any(|l| l.starts_with("$GNRMC") && l.contains(",V,")));
    // C/N0 fell, then returned.
    let c = |t| row_at(&g, t).mean_cn0_dbhz;
    assert!(c(200.0).unwrap() > 38.0);
    assert!(c(500.0).is_none_or(|v| v < 25.0));
    assert!(c(900.0).unwrap() > 38.0);
    let kinds: Vec<&str> = g.log.timeline.iter().map(|t| t.what.as_str()).collect();
    for k in [
        "onset",
        "fix-lost",
        "full-effect",
        "recovery-begins",
        "fix-regained",
        "recovered",
    ] {
        assert!(kinds.contains(&k), "timeline lacks {k}: {kinds:?}");
    }
}

#[test]
fn drag_off_keeps_a_valid_fix_that_walks_away() {
    let g = run("coastal-drag-off");
    for r in g
        .log
        .track
        .iter()
        .filter(|r| r.t_s >= 420.0 && r.t_s < 1140.0)
    {
        assert!(r.fix_valid, "t={}: the receiver must keep its fix", r.t_s);
    }
    let err = |t| row_at(&g, t).position_error_m.unwrap();
    assert!(err(300.0) < 10.0);
    assert!(
        (err(600.0) - 700.0).abs() < 25.0,
        "half way: {}",
        err(600.0)
    );
    assert!((err(900.0) - 1400.0).abs() < 25.0, "full: {}", err(900.0));
    assert!(err(1200.0) < 10.0, "released: {}", err(1200.0));
    // The raised uniform level.
    let c = row_at(&g, 900.0).mean_cn0_dbhz.unwrap();
    assert!((c - 46.0).abs() < 1.0, "{c}");
    // The receiver's SOG/COG deviate while the position is being dragged; HDT does not.
    let r = row_at(&g, 500.0);
    assert!((r.reported_cog_deg.unwrap() - r.true_cog_deg).abs() > 5.0);
}

#[test]
fn time_spoof_moves_the_time_fields_only() {
    let g = run("port-approach-time-spoof");
    assert_eq!(row_at(&g, 200.0).time_offset_s, 0.0);
    assert_eq!(row_at(&g, 600.0).time_offset_s, 45.0);
    assert_eq!(row_at(&g, 900.0).time_offset_s, 0.0);
    assert!(row_at(&g, 600.0).position_error_m.unwrap() < 12.0);
    // ZDA at epoch 600 carries true time plus 45 s: 22:50:00 + 45 s.
    let zda = g.epochs[600]
        .lines
        .iter()
        .find(|l| l.contains("ZDA"))
        .unwrap();
    assert!(zda.starts_with("$GNZDA,225045.00,21,07,2026"), "{zda}");
    // The run ends at 23:00:00 on the start date, with the spoof released.
    let last = g
        .epochs
        .last()
        .unwrap()
        .lines
        .iter()
        .find(|l| l.contains("ZDA"))
        .unwrap();
    assert!(last.starts_with("$GNZDA,230000.00,21,07,2026"), "{last}");
}

#[test]
fn combined_event_runs_in_sequence() {
    let g = run("combined-event");
    assert!(!row_at(&g, 400.0).fix_valid, "jammed");
    let r = row_at(&g, 600.0);
    assert!(r.fix_valid, "re-acquired on the counterfeit signal");
    assert!(r.position_error_m.unwrap() > 300.0);
    assert!((row_at(&g, 1000.0).time_offset_s - 20.0).abs() < 1e-9);
    assert_eq!(row_at(&g, 1500.0).time_offset_s, -30.0);
    assert!(
        (row_at(&g, 1500.0).position_error_m.unwrap() - 15.4 * 1852.0 / 3600.0 * 30.0).abs() < 25.0
    );
    assert!(g.log.events.len() == 4);
    assert!(g.log.to_text().contains("Trainer note"));
    assert!(g.log.to_json().contains("\"kshana-nmea-training/1\""));
}

#[test]
fn reader_fix_matches_the_instructor_log() {
    // What a consumer reads back is the *reported* position, not the true one.
    let g = run("coastal-drag-off");
    let tl = read_nmea(&g.nmea_text()).unwrap();
    let e = &tl.epochs[900];
    let fix = e.fix.expect("valid fix");
    let r = row_at(&g, 900.0);
    assert!((fix.lat_deg - r.reported_lat_deg.unwrap()).abs() < 2e-5);
    assert!((fix.lon_deg - r.reported_lon_deg.unwrap()).abs() < 2e-5);
}

#[test]
fn track_respects_the_vessel_limits() {
    let g = run("combined-event");
    let sog: Vec<f64> = g.log.track.iter().map(|r| r.true_sog_kn).collect();
    assert!(sog.iter().all(|s| *s > 5.0 && *s < 20.0));
}

#[test]
fn invalid_scenarios_are_refused_with_a_reason() {
    let base =
        std::fs::read_to_string(root().join("scenarios/training/open-sea-jamming.toml")).unwrap();
    let bad = |from: &str, to: &str| TrainingScenario::parse(&base.replace(from, to)).unwrap_err();
    assert!(
        bad("cn0_drop_db = 34", "cn0_drop_db = 34\nfinal_offset_m = 5").contains("final_offset_m")
    );
    assert!(bad("seed = 11", "seed = 11\nsede = 3").contains("sede"));
    assert!(bad("rate_hz = 1", "rate_hz = 3").contains("rate_hz"));
    assert!(bad(
        "start_utc = \"2026-05-14T06:00:00Z\"",
        "start_utc = \"yesterday\""
    )
    .contains("start_utc"));
    assert!(bad("start_s = 300", "start_s = 5000").contains("start_s"));
    let ts = "[[event]]\nkind = \"time-spoof\"\nstart_s = 10\nduration_s = 100\nramp_s = 10\noffset_s = 30\n";
    let e = TrainingScenario::parse(&format!("{base}\n{ts}")).unwrap_err();
    assert!(e.contains("run backwards"), "{e}");
    let dr =
        "[[event]]\nkind = \"drag-off\"\nstart_s = 10\nduration_s = 100\nfinal_offset_m = 100\n";
    assert!(TrainingScenario::parse(&format!("{base}\n{dr}"))
        .unwrap_err()
        .contains("exactly one"));
}

#[test]
fn file_sink_and_tcp_and_udp_on_localhost_carry_the_same_bytes() {
    let g = run("open-sea-jamming");
    let want = g.nmea_text();
    let few = &g.epochs[..5];

    // File-like sink.
    let mut buf = Vec::new();
    {
        let mut sinks: Vec<Box<dyn Sink + '_>> = vec![Box::new(WriterSink(&mut buf))];
        stream::run(&g.epochs, &mut sinks, Pace::Max).unwrap();
    }
    assert_eq!(String::from_utf8(buf).unwrap(), want);

    // TCP: a client connects first, the server then streams everything and closes.
    let server = TcpServer::bind("127.0.0.1:0").unwrap();
    let addr = server.local_addr();
    let client = std::thread::spawn(move || {
        let mut s = TcpStream::connect(addr).unwrap();
        s.set_read_timeout(Some(Duration::from_secs(20))).unwrap();
        let mut out = String::new();
        s.read_to_string(&mut out).unwrap();
        out
    });
    assert!(server.wait_for_clients(1, Some(Duration::from_secs(10))));
    let epochs = g.epochs.clone();
    {
        let mut sinks: Vec<Box<dyn Sink>> = vec![Box::new(server)];
        stream::run(&epochs, &mut sinks, Pace::Max).unwrap();
    } // the server drops here, which closes the client's stream
    assert_eq!(client.join().unwrap(), want);

    // UDP: one sentence per datagram.
    let rx = UdpSocket::bind("127.0.0.1:0").unwrap();
    rx.set_read_timeout(Some(Duration::from_secs(5))).unwrap();
    let dest = rx.local_addr().unwrap();
    let mut sink = UdpSink::new(dest, false).unwrap();
    for e in few {
        sink.send(e).unwrap();
    }
    let n: usize = few.iter().map(|e| e.lines.len()).sum();
    let mut got = String::new();
    let mut b = [0u8; 256];
    for _ in 0..n {
        let k = rx.recv(&mut b).unwrap();
        got.push_str(std::str::from_utf8(&b[..k]).unwrap());
    }
    let expect: String = few
        .iter()
        .flat_map(|e| e.lines.iter())
        .map(|l| format!("{l}\r\n"))
        .collect();
    assert_eq!(got, expect);
}

#[test]
fn accelerated_pacing_takes_the_expected_wall_time() {
    let mut s = load("open-sea-jamming");
    s.scenario.duration_s = 20.0;
    s.events.clear();
    let g = generate(&s).unwrap();
    let mut sinks: Vec<Box<dyn Sink>> = vec![Box::new(WriterSink(Vec::new()))];
    let t0 = std::time::Instant::now();
    stream::run(&g.epochs, &mut sinks, Pace::Speed(20.0)).unwrap();
    let dt = t0.elapsed().as_secs_f64();
    assert!(
        (0.9..3.0).contains(&dt),
        "20 s at 20x should take about 1 s, took {dt}"
    );
}
