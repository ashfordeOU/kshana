// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana ais-integrity` (src/ais_integrity.rs, docs/AIS-INTEGRITY.md): every labelled synthetic
//! fixture gives exactly its labelled flags and events, NMEA input with TAG-block times reads the same
//! way as CSV, the CLI writes the documented JSON Lines, the committed fixtures are what their
//! generator writes, and the false-alarm and detection rates on the M4 synthetic scene hold.

use std::collections::{BTreeMap, BTreeSet};
use std::path::{Path, PathBuf};
use std::process::Command;

use kshana::ais_integrity::{analyse, read_places, Detector, Input, Params, Report};
use kshana::interference_map::land::LandMask;
use serde_json::Value;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn fixture(name: &str) -> PathBuf {
    root().join("tests/fixtures/ais_integrity").join(name)
}

fn unique_dir(tag: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-ais-integrity-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

fn land() -> LandMask {
    let p = Params::PREREGISTERED_V1;
    LandMask::from_geojson_str(
        &std::fs::read_to_string(fixture("land.geojson")).unwrap(),
        p.land_buffer_m,
    )
    .unwrap()
}

fn run_fixture(name: &str) -> kshana::ais_integrity::Analysis {
    let mut inp = Input::new();
    inp.read_csv(std::fs::read_to_string(fixture(name)).unwrap().as_bytes())
        .unwrap();
    let places = read_places(
        std::fs::read_to_string(fixture("places.csv"))
            .unwrap()
            .as_bytes(),
    )
    .unwrap();
    let mut mask = land();
    analyse(&inp, &Params::PREREGISTERED_V1, Some(&mut mask), &places)
}

#[test]
fn every_labelled_fixture_gives_exactly_its_flags_and_events() {
    let labels: Value =
        serde_json::from_str(&std::fs::read_to_string(fixture("labels.json")).unwrap()).unwrap();
    for (file, want) in labels.as_object().unwrap() {
        let an = run_fixture(file);
        let mut got: BTreeMap<String, BTreeSet<&str>> = BTreeMap::new();
        for (id, ..) in &an.tracks {
            got.entry(id.clone()).or_default();
        }
        for f in &an.flags {
            got.entry(f.vessel_id.clone())
                .or_default()
                .insert(f.detector.name());
        }
        let want_flags: BTreeMap<String, BTreeSet<&str>> = want["flags"]
            .as_object()
            .unwrap()
            .iter()
            .map(|(k, v)| {
                (
                    k.clone(),
                    v.as_array()
                        .unwrap()
                        .iter()
                        .map(|d| d.as_str().unwrap())
                        .collect(),
                )
            })
            .collect();
        assert_eq!(got, want_flags, "{file}: {:#?}", an.flags);
        let got_events: BTreeSet<Vec<String>> =
            an.events.iter().map(|e| e.vessels.clone()).collect();
        let want_events: BTreeSet<Vec<String>> = want["events"]
            .as_array()
            .unwrap()
            .iter()
            .map(|e| {
                e.as_array()
                    .unwrap()
                    .iter()
                    .map(|v| v.as_str().unwrap().to_string())
                    .collect()
            })
            .collect();
        assert_eq!(got_events, want_events, "{file}: {:#?}", an.events);
    }
}

#[test]
fn simultaneous_episodes_in_two_areas_are_two_events() {
    let an = run_fixture("two_areas.csv");
    assert_eq!(an.events.len(), 2);
    let (a, b) = (&an.events[0], &an.events[1]);
    // The two events overlap in time and are separated in space.
    assert!(a.span.0 <= b.span.1 && b.span.0 <= a.span.1);
    assert!(a.area[2] < b.area[0] || b.area[2] < a.area[0]);
    // Every flag of the fixture is in one of them.
    assert!(an.flags.iter().all(|f| f.event.is_some()));
}

#[test]
fn flags_carry_the_measured_numbers() {
    let an = run_fixture("simultaneous_jump.csv");
    let f = an
        .flags
        .iter()
        .find(|f| f.detector == Detector::PositionJump)
        .unwrap();
    // The fixture offsets by (-28 km, +31 km): a jump of about 41.8 km.
    let d = f.detail["max_jump_m"].as_f64().unwrap();
    assert!((d - 41_773.0).abs() < 200.0, "{d}");
    assert!(f.detail["max_implied_speed_kn"].as_f64().unwrap() > 1000.0);
    assert_eq!(f.hits, 1);
    let an = run_fixture("berth_drift.csv");
    let f = an
        .flags
        .iter()
        .find(|f| f.detector == Detector::DriftWhileStationary)
        .unwrap();
    let v = f.detail["max_track_speed_kn"].as_f64().unwrap();
    assert!((1.2..=1.8).contains(&v), "{v}");
    assert_eq!(f.detail["reasons"], serde_json::json!(["nav_status_5"]));
}

// --- NMEA input -------------------------------------------------------------------------------------

fn put(b: &mut Vec<u8>, v: i64, n: usize) {
    for i in (0..n).rev() {
        b.push(((v >> i) & 1) as u8);
    }
}

fn put_text(b: &mut Vec<u8>, s: &str, chars: usize) {
    let mut s: Vec<u8> = s.bytes().collect();
    s.resize(chars, b'@');
    for c in s {
        put(b, i64::from(if c >= 64 { c - 64 } else { c }), 6);
    }
}

fn armour(bits: &[u8]) -> (String, usize) {
    let fill = (6 - bits.len() % 6) % 6;
    let mut b = bits.to_vec();
    b.extend(std::iter::repeat_n(0, fill));
    let s = b
        .chunks(6)
        .map(|c| {
            let v = c.iter().fold(0u8, |a, &x| (a << 1) | x);
            char::from(if v < 40 { v + 48 } else { v + 56 })
        })
        .collect();
    (s, fill)
}

fn xor(s: &str) -> u8 {
    s.bytes().fold(0, |a, b| a ^ b)
}

fn sentence(bits: &[u8], t: i64) -> String {
    let (payload, fill) = armour(bits);
    let body = format!("AIVDM,1,1,,A,{payload},{fill}");
    let tag = format!("c:{t}");
    format!("\\{tag}*{:02X}\\!{body}*{:02X}", xor(&tag), xor(&body))
}

fn type1(mmsi: i64, lat: f64, lon: f64, sog_kn: f64, nav: i64) -> Vec<u8> {
    let mut b = Vec::new();
    put(&mut b, 1, 6);
    put(&mut b, 0, 2);
    put(&mut b, mmsi, 30);
    put(&mut b, nav, 4);
    put(&mut b, 0, 8);
    put(&mut b, (sog_kn * 10.0).round() as i64, 10);
    put(&mut b, 1, 1);
    put(&mut b, (lon * 600_000.0).round() as i64, 28);
    put(&mut b, (lat * 600_000.0).round() as i64, 27);
    put(&mut b, 900, 12);
    put(&mut b, 90, 9);
    put(&mut b, 0, 6);
    put(&mut b, 0, 2);
    put(&mut b, 0, 3);
    put(&mut b, 0, 1);
    put(&mut b, 0, 19);
    b
}

fn type5(mmsi: i64, imo: i64, name: &str) -> Vec<u8> {
    let mut b = Vec::new();
    put(&mut b, 5, 6);
    put(&mut b, 0, 2);
    put(&mut b, mmsi, 30);
    put(&mut b, 0, 2);
    put(&mut b, imo, 30);
    put_text(&mut b, "TEST", 7);
    put_text(&mut b, name, 20);
    put(&mut b, 70, 8);
    put(&mut b, 0, 30);
    put(&mut b, 1, 4);
    put(&mut b, 0, 20);
    put(&mut b, 50, 8);
    put_text(&mut b, "", 20);
    put(&mut b, 0, 2);
    b
}

#[test]
fn nmea_with_tag_block_times_reads_like_csv() {
    let t0 = 1_735_646_400i64;
    let mut text = String::new();
    for k in 0..20i64 {
        // East at 10 knots, then 30 km north from report 10 on.
        let lat = 28.5 + if k >= 10 { 0.27 } else { 0.0 };
        let lon = -90.0 + k as f64 * 60.0 * 10.0 * 1852.0 / 3600.0 / (111_195.0 * 0.878);
        text.push_str(&sentence(
            &type1(366_000_001, lat, lon, 10.0, 0),
            t0 + k * 60,
        ));
        text.push('\n');
    }
    text.push_str(&sentence(
        &type5(366_000_001, 9_074_729, "SYNTHETIC ONE"),
        t0,
    ));
    text.push('\n');
    text.push_str(&sentence(
        &type5(366_000_002, 9_074_729, "SYNTHETIC TWO"),
        t0,
    ));
    text.push('\n');
    // The second identifier reports at overlapping times, far away.
    for k in 0..5i64 {
        text.push_str(&sentence(
            &type1(366_000_002, 25.0, -85.0, 0.0, 1),
            t0 + k * 60,
        ));
        text.push('\n');
    }
    // A sentence with a broken checksum, and a report with no TAG block (no time).
    text.push_str("!AIVDM,1,1,,A,13u?etPv2;0n:dDPwUM1U1Cb069D,0*00\n");
    let (p, _) = armour(&type1(366_000_003, 28.0, -89.0, 1.0, 0));
    let body = format!("AIVDM,1,1,,A,{p},0");
    text.push_str(&format!("!{body}*{:02X}\n", xor(&body)));

    let mut inp = Input::new();
    inp.read_nmea(text.as_bytes()).unwrap();
    assert_eq!(inp.stats.bad_checksum, 1);
    assert_eq!(inp.stats.rejected_no_time, 1);
    assert_eq!(inp.stats.used, 25);
    let an = analyse(&inp, &Params::PREREGISTERED_V1, None, &[]);
    let got: BTreeSet<(&str, &str)> = an
        .flags
        .iter()
        .map(|f| (f.vessel_id.as_str(), f.detector.name()))
        .collect();
    let want: BTreeSet<(&str, &str)> = [
        ("366000001", "position_jump"),
        ("366000001", "shared_imo"),
        ("366000002", "shared_imo"),
    ]
    .into_iter()
    .collect();
    assert_eq!(got, want, "{:#?}", an.flags);
}

// --- the command line ----------------------------------------------------------------------------

fn kshana(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).to_string(),
        String::from_utf8_lossy(&out.stderr).to_string(),
    )
}

fn s(p: &Path) -> String {
    p.display().to_string()
}

#[test]
fn the_cli_writes_the_documented_json_lines() {
    let dir = unique_dir("cli");
    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let out = dir.join("flags.jsonl");
    let (code, _, err) = kshana(&[
        "ais-integrity",
        &s(&fixture("patterns.csv")),
        "--land",
        &s(&fixture("land.geojson")),
        "--places",
        &s(&fixture("places.csv")),
        "--out",
        &s(&out),
    ]);
    assert_eq!(code, 0, "{err}");
    assert!(err.contains("(MODELLED)"), "{err}");
    let text = std::fs::read_to_string(&out).unwrap();
    let lines: Vec<Value> = text
        .lines()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect();
    assert_eq!(lines[0]["kind"], "header");
    assert_eq!(lines[0]["schema"], kshana::ais_integrity::SCHEMA);
    assert_eq!(lines[0]["evidence"], "MODELLED");
    assert_eq!(lines[0]["on_land_detector"], "enabled");
    assert_eq!(lines[0]["listed_places"], 1);
    let last = lines.last().unwrap();
    assert_eq!(last["kind"], "summary");
    let flags = lines.iter().filter(|l| l["kind"] == "flag").count();
    assert_eq!(last["flags"], flags);
    assert!(lines
        .iter()
        .filter(|l| l["kind"] == "flag")
        .all(|l| l["evidence"] == "MODELLED"));
    assert_eq!(lines.iter().filter(|l| l["kind"] == "event").count(), 1);
    let ev = lines.iter().find(|l| l["kind"] == "event").unwrap();
    assert_eq!(ev["vessels"], 6);
    assert!(ev["reported_area"]["south"].is_number());

    // The same bytes on stdout, every time.
    let (code, a, _) = kshana(&[
        "ais-integrity",
        &s(&fixture("patterns.csv")),
        "--land",
        &s(&fixture("land.geojson")),
        "--places",
        &s(&fixture("places.csv")),
    ]);
    assert_eq!(code, 0);
    assert_eq!(a, text);
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn the_cli_refuses_bad_arguments_and_inputs() {
    let (code, _, err) = kshana(&["ais-integrity"]);
    assert_eq!(code, 2);
    assert!(err.contains("kshana ais-integrity"), "{err}");
    let (code, out, _) = kshana(&["ais-integrity", "--help"]);
    assert_eq!(code, 0);
    assert!(out.contains("--places"), "{out}");
    let f = s(&fixture("patterns.csv"));
    let (code, _, err) = kshana(&["ais-integrity", &f, "--bogus"]);
    assert_eq!(code, 2);
    assert!(err.contains("--bogus"), "{err}");
    let (code, _, err) = kshana(&["ais-integrity", &f, "--format", "xml"]);
    assert_eq!(code, 2);
    assert!(err.contains("xml"), "{err}");
    let (code, _, _) = kshana(&["ais-integrity", &f, "--out"]);
    assert_eq!(code, 2);
    let dir = unique_dir("bad");
    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let places = dir.join("places.csv");
    std::fs::write(&places, "name,lat,lon,radius_m\nnowhere,95,0,100\n").unwrap();
    let (code, _, err) = kshana(&["ais-integrity", &f, "--places", &s(&places)]);
    assert_eq!(code, 2);
    assert!(err.contains("nowhere,95,0,100"), "{err}");
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn the_committed_fixtures_are_what_the_generator_writes() {
    let Ok(probe) = Command::new("python3").arg("--version").output() else {
        panic!("python3 is needed to check the fixture generator");
    };
    assert!(probe.status.success());
    let dir = unique_dir("gen");
    let st = Command::new("python3")
        .arg("-I")
        .arg(fixture("gen_fixtures.py"))
        .arg(&dir)
        .status()
        .unwrap();
    assert!(st.success());
    for name in [
        "simultaneous_jump.csv",
        "berth_drift.csv",
        "two_areas.csv",
        "patterns.csv",
        "places.csv",
        "land.geojson",
        "labels.json",
    ] {
        assert_eq!(
            std::fs::read(dir.join(name)).unwrap(),
            std::fs::read(fixture(name)).unwrap(),
            "{name} differs from what gen_fixtures.py writes"
        );
    }
    std::fs::remove_dir_all(&dir).ok();
}

// --- false alarms and detection on the M4 synthetic scene ----------------------------------------

/// Per M4 label: tracks, tracks with any flag, and flags per detector. Identities are moved from the
/// generator's 2000xxxxx range (no allocated MMSI prefix) to 230xxxxxx so that the identity-format
/// detector does not fire on the generator's numbering. `max_index` keeps the vessels whose index
/// is below it (a duplicate keeps its original's identity).
fn m4_rates(
    seed: u64,
    max_index: u64,
) -> BTreeMap<String, (usize, usize, BTreeMap<&'static str, usize>)> {
    let scene = kshana::m4_dark_vessel::generate(seed);
    let mut inp = Input::new();
    let t0 = 1_767_225_600.0; // 2026-01-01T00:00:00Z
    for &(t, id, lat, lon) in &scene.ais {
        let i = id - 200_000_000;
        if i >= max_index {
            continue;
        }
        inp.push(
            &(230_000_000 + i).to_string(),
            Report {
                t: t0 + f64::from(t),
                lat,
                lon,
                sog: None,
                stw: None,
                nav_status: None,
            },
        );
    }
    let an = analyse(&inp, &Params::PREREGISTERED_V1, None, &[]);
    let mut by_id: BTreeMap<String, Vec<&'static str>> = BTreeMap::new();
    for f in &an.flags {
        by_id
            .entry(f.vessel_id.clone())
            .or_default()
            .push(f.detector.name());
    }
    let mut out: BTreeMap<String, (usize, usize, BTreeMap<&'static str, usize>)> = BTreeMap::new();
    for v in scene.truth["vessels"].as_array().unwrap() {
        let i = v["id"].as_u64().unwrap() - 200_000_000;
        if i >= max_index {
            continue;
        }
        let label = v["label"].as_str().unwrap().to_string();
        let e = out.entry(label).or_default();
        e.0 += 1;
        if let Some(d) = by_id.get(&(230_000_000 + i).to_string()) {
            e.1 += 1;
            for n in d {
                *e.2.entry(*n).or_default() += 1;
            }
        }
    }
    out
}

#[test]
fn m4_scene_false_alarms_and_detection_on_a_subset() {
    let r = m4_rates(1, 400);
    let normal = &r["NORMAL"];
    assert!(normal.0 > 250);
    assert_eq!(normal.1, 0, "false alarms on NORMAL tracks: {:?}", normal.2);
    assert_eq!(r["GAP"].1, 0, "{:?}", r["GAP"]);
    let dup = &r["IDENTITY-DUPLICATE"];
    assert!(dup.0 >= 5);
    assert_eq!(dup.2.get("identity_conflict"), Some(&dup.0), "{dup:?}");
    let off = &r["POSITION-OFFSET"];
    assert!(off.0 >= 10);
    assert!(
        off.2.get("position_jump").copied().unwrap_or(0) * 100 >= off.0 * 95,
        "{off:?}"
    );
}

/// The full-scene figures quoted in docs/AIS-INTEGRITY.md
/// (`cargo test --test ais_integrity m4_full -- --ignored --nocapture`, about a minute).
#[test]
#[ignore = "three full M4 scenes, about a minute: the method page's table"]
fn m4_full_scene_table() {
    for seed in [1u64, 2, 3] {
        let r = m4_rates(seed, u64::MAX);
        for (label, (n, flagged, dets)) in &r {
            println!("seed {seed} {label}: {n} tracks, {flagged} flagged, {dets:?}");
        }
        assert_eq!(r["NORMAL"].1, 0);
    }
}
