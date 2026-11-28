// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana transition scan`: the semi-codeless dependency scanner (src/transition_scan.rs,
//! docs/TRANSITION-SCAN.md). The fixtures in tests/fixtures/transition_scan/ are synthetic
//! headers written for these cases; the verdict for each is worked out by hand from the
//! RINEX code tables. Two real headers already in the repository (ABMF and WTZR extracts)
//! are scanned as well.

use kshana::transition_scan::{self as ts, CodeClass};
use std::path::PathBuf;
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn fx(name: &str) -> (String, Vec<u8>) {
    let p = root().join("tests/fixtures/transition_scan").join(name);
    (name.to_string(), std::fs::read(p).unwrap())
}

fn unique_dir(tag: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-transition-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

#[test]
fn codes_are_classified_as_the_rinex_tables_define_them() {
    use CodeClass::*;
    for (code, want) in [
        ("C2W", SemiCodeless),
        ("L2W", SemiCodeless),
        ("C2D", SemiCodeless),
        ("C2P", SemiCodeless),
        ("L2N", SemiCodeless),
        ("C1W", SemiCodeless),
        ("C2L", L2c),
        ("L2S", L2c),
        ("C2X", L2c),
        ("C5Q", L5),
        ("L5I", L5),
        ("S5X", L5),
        ("C1C", L1Civil),
        ("C1L", L1Civil),
        ("C2C", Other),
        ("C7Q", Other),
    ] {
        assert_eq!(ts::classify(code, 3), want, "{code}");
    }
    for (code, want) in [
        ("P2", SemiCodeless),
        ("P1", SemiCodeless),
        ("C2", L2c),
        ("C5", L5),
        ("L2", L2Unstated),
        ("C1", L1Civil),
    ] {
        assert_eq!(ts::classify(code, 2), want, "{code}");
    }
}

#[test]
fn headers_of_rinex_2_3_4_and_crinex_are_read() {
    let h = ts::parse_obs_header(&String::from_utf8(fx("aaaa0010.26o").1).unwrap()).unwrap();
    assert_eq!(h.major, 2);
    assert_eq!(h.marker.as_deref(), Some("AAAA"));
    assert_eq!(
        h.gps_codes,
        ["L1", "L2", "C1", "P1", "P2", "D1", "D2", "S1", "S2"]
    );
    let h = ts::parse_obs_header(
        &String::from_utf8(fx("BBBB00XXX_R_20263240000_01D_30S_MO.rnx").1).unwrap(),
    )
    .unwrap();
    assert_eq!(h.major, 3);
    assert_eq!(
        h.gps_codes.len(),
        14,
        "continuation line read, Galileo left out"
    );
    assert_eq!(h.receiver.as_deref(), Some("GENERIC RX-B"));
    assert_eq!(h.receiver_version.as_deref(), Some("2.3"));
    assert_eq!(h.first_obs.as_deref(), Some("2026-11-20T00:00:00"));
    let h = ts::parse_obs_header(
        &String::from_utf8(fx("FFFF00XXX_R_20263240000_01D_30S_GO.crx").1).unwrap(),
    )
    .unwrap();
    assert!(h.crinex);
    assert_eq!(h.gps_codes, ["C1C", "L1C", "C2W", "L2W"]);
    assert!(ts::parse_obs_header("hello").is_err());
}

#[test]
fn the_site_log_gives_the_installed_receiver() {
    let log = ts::parse_site_log(&String::from_utf8(fx("gggg_20261120.log").1).unwrap()).unwrap();
    assert_eq!(log.station, "GGGG");
    assert_eq!(log.receivers.len(), 2, "the 3.x template is not a receiver");
    let cur = log.current().unwrap();
    assert_eq!(cur.receiver, "GENERIC RX-G");
    assert_eq!(cur.firmware.as_deref(), Some("6.2"));
    assert_eq!(cur.satellite_system.as_deref(), Some("GPS+GLO+GAL+BDS"));
    assert_eq!(
        log.receivers[0].removed.as_deref(),
        Some("2021-06-01T00:00Z")
    );
}

fn scan_all() -> ts::Report {
    let names = [
        "aaaa0010.26o",
        "BBBB00XXX_R_20263240000_01D_30S_MO.rnx",
        "BBBB00XXX_R_20250010000_01D_30S_MO.rnx",
        "CCCC00XXX_R_20263240000_01D_30S_GO.rnx",
        "DDDD00XXX_R_20263240000_01D_30S_GO.rnx",
        "eeee0010.26o",
        "FFFF00XXX_R_20263240000_01D_30S_GO.crx",
        "gggg_20261120.log",
        "bbbb_20261120.log",
        "notes.txt",
    ];
    ts::scan(&names.iter().map(|n| fx(n)).collect::<Vec<_>>())
}

fn station<'a>(r: &'a ts::Report, id: &str) -> &'a ts::Station {
    r.stations.iter().find(|s| s.id == id).unwrap()
}

#[test]
fn each_station_gets_the_verdict_worked_out_by_hand() {
    let r = scan_all();
    let ids: Vec<&str> = r.stations.iter().map(|s| s.id.as_str()).collect();
    assert_eq!(
        ids,
        ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG"]
    );
    let want = [
        // RINEX 2: P1/P2 and no C2/C5
        ("AAAA", "yes", false, false, "not-ready"),
        // W codes beside L2C and L5 (the 2026 file, not the 2025 one)
        ("BBBB", "partial", true, true, "switch-needed"),
        ("CCCC", "no", true, true, "ready"),
        ("DDDD", "no", false, false, "single-frequency"),
        // RINEX 2 L2 phase with no P2 or C2: the tracking is not stated
        ("EEEE", "unknown", false, false, "unknown"),
        ("FFFF", "yes", false, false, "not-ready"),
        ("GGGG", "unknown", false, false, "unknown"),
    ];
    for (id, dep, l2c, l5, ready) in want {
        let v = &station(&r, id).verdict;
        assert_eq!(
            (v.semi_codeless_dependent, v.l2c, v.l5, v.readiness),
            (dep, l2c, l5, ready),
            "{id}: {:?}",
            v.reasons
        );
    }
    let b = station(&r, "BBBB");
    assert_eq!(b.files.len(), 2);
    assert_eq!(b.files[0].path, "BBBB00XXX_R_20263240000_01D_30S_MO.rnx");
    assert!(b.verdict.reasons.iter().any(|x| x.contains("GENERIC RX-X")));
    assert!(station(&r, "GGGG").verdict.reasons[0].contains("GENERIC RX-G (firmware 6.2)"));
    assert_eq!(
        r.fleet,
        ts::Fleet {
            stations: 7,
            dependent: 2,
            partial: 1,
            not_dependent: 2,
            unknown: 2,
            l2c: 2,
            l5: 2
        }
    );
    assert_eq!(r.skipped.len(), 1);
    assert_eq!(r.skipped[0].path, "notes.txt");
    assert_eq!(r.label, "MODELLED");
    assert!(r
        .condition
        .wording
        .contains("24 operational satellites broadcasting L5"));
    // the input hash is of the bytes given
    assert_eq!(
        station(&r, "CCCC").files[0].sha256,
        hex::encode(<sha2::Sha256 as sha2::Digest>::digest(
            fx("CCCC00XXX_R_20263240000_01D_30S_GO.rnx").1
        ))
    );
}

#[test]
fn gzip_input_is_read_and_unix_compress_is_named() {
    use std::io::Write;
    let (name, bytes) = fx("CCCC00XXX_R_20263240000_01D_30S_GO.rnx");
    let mut gz = flate2::write::GzEncoder::new(Vec::new(), flate2::Compression::default());
    gz.write_all(&bytes).unwrap();
    let r = ts::scan(&[
        (format!("{name}.gz"), gz.finish().unwrap()),
        ("x.Z".into(), vec![0x1f, 0x9d, 0x90]),
    ]);
    assert_eq!(r.stations[0].verdict.readiness, "ready");
    assert!(r.skipped[0].reason.contains(".Z"));
}

#[test]
fn real_igs_headers_in_the_repository_are_scanned() {
    // ABMF (Leica GR25) and WTZR (Leica GR50) extracts used elsewhere in the tests declare
    // C2W / L2W and no L2C or L5 code for GPS: dependent, as the extracts stand.
    let inputs: Vec<(String, Vec<u8>)> = [
        "tests/fixtures/joint_pvt_dual_freq_itrf_rtklib_oracle/abmf_2018133_300s_GE_dual.rnx",
        "tests/fixtures/gnss_wettzell_2025055/wtzr_2025055_0006_G.rnx",
    ]
    .iter()
    .map(|p| (p.to_string(), std::fs::read(root().join(p)).unwrap()))
    .collect();
    let r = ts::scan(&inputs);
    for id in ["ABMF", "WTZR"] {
        let s = station(&r, id);
        assert_eq!(s.verdict.semi_codeless_dependent, "yes", "{id}");
        assert!(s.files[0]
            .header
            .receiver
            .as_deref()
            .unwrap()
            .starts_with("LEICA"));
    }
}

#[test]
fn the_cli_prints_text_or_json_and_writes_both() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let dir = root().join("tests/fixtures/transition_scan");
    let out = Command::new(bin)
        .args(["transition", "scan"])
        .arg(&dir)
        .output()
        .unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let text = String::from_utf8_lossy(&out.stdout);
    assert!(
        text.contains("BBBB: semi-codeless dependent partial; L2C yes; L5 yes"),
        "{text}"
    );
    assert!(text.contains("Fleet: 2 dependent, 1 partial, 2 not dependent, 2 unknown"));
    assert!(text.contains("gps.gov"));

    let base = unique_dir("cli").join("scan");
    let out = Command::new(bin)
        .args(["transition", "scan", "--json", "--out"])
        .arg(&base)
        .arg(&dir)
        .output()
        .unwrap();
    assert!(out.status.success());
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["fleet"]["stations"], 7);
    let written: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(base.with_extension("json")).unwrap())
            .unwrap();
    assert_eq!(written, v);
    assert!(std::fs::read_to_string(base.with_extension("txt"))
        .unwrap()
        .contains("Fleet:"));
    let _ = std::fs::remove_dir_all(base.parent().unwrap());

    let bad = Command::new(bin)
        .args(["transition", "scan", "--nope"])
        .output()
        .unwrap();
    assert!(!bad.status.success());
    let none = Command::new(bin)
        .args(["transition", "scan"])
        .arg(dir.join("notes.txt"))
        .output()
        .unwrap();
    assert!(!none.status.success());
}
