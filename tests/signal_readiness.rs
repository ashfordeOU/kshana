// SPDX-License-Identifier: AGPL-3.0-only
//! Future-signal readiness (`kshana signal-readiness`, src/signal_readiness.rs): a receiver
//! profile against the published numbering and signal plans, and a real RINEX 4 observation file
//! (the IGS/MGEX MAO0 slice already in the tests) against the profile.

use kshana::signal_readiness::{
    check_file, check_profile, report, summarise_rinex, Level, Profile, SystemProfile, REFERENCES,
    SBAS_ALLOCATED_ABOVE_138,
};
use std::process::Command;

const MAO0: &str =
    include_str!("fixtures/rinex4_obs_mao0_2023198/MAO000USA_R_20231980000_4EP_30S_MO.rnx");

fn legacy() -> Profile {
    toml::from_str(
        &std::fs::read_to_string(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/examples/signal-readiness/legacy-receiver.toml"
        ))
        .unwrap(),
    )
    .unwrap()
}

fn ready() -> Profile {
    let sp = |max: u32, codes: &[&str]| SystemProfile {
        max_number: max,
        codes: codes.iter().map(|c| c.to_string()).collect(),
        in_solution: true,
    };
    Profile {
        name: "ready".into(),
        gps: Some(sp(63, &["C1C", "C1W", "C2W", "C2L", "C5Q", "C1L"])),
        sbas: Some(sp(158, &["C1C", "C5I"])),
        galileo: Some(sp(36, &["C1C", "C6C", "C5Q", "C7Q", "C8Q"])),
        beidou: Some(sp(63, &["C1P", "C5P", "C2I", "C7I", "C6I", "C7D"])),
        qzss: Some(sp(10, &["C1C", "C2L", "C5Q", "C1L", "C1Z", "C5P"])),
    }
}

fn checks(f: &[kshana::signal_readiness::Finding], sys: char) -> Vec<String> {
    f.iter()
        .filter(|x| x.system == sys)
        .map(|x| x.check.clone())
        .collect()
}

#[test]
fn the_reference_ranges_are_the_published_ones() {
    let r: Vec<(char, u32, u32)> = REFERENCES
        .iter()
        .map(|r| (r.system, r.min, r.max))
        .collect();
    assert_eq!(
        r,
        vec![
            ('G', 1, 63),
            ('S', 120, 158),
            ('E', 1, 36),
            ('C', 1, 63),
            ('J', 1, 10)
        ]
    );
    assert!(REFERENCES.iter().all(|r| !r.source.is_empty()));
    // Every listed SBAS allocation is above 138 and within the SBAS range.
    assert!(SBAS_ALLOCATED_ABOVE_138
        .iter()
        .all(|(p, _)| (139..=158).contains(p)));
}

#[test]
fn a_legacy_profile_shows_its_gaps() {
    let f = check_profile(&legacy());
    assert!(checks(&f, 'G').contains(&"number-range".into()));
    assert!(
        checks(&f, 'C').contains(&"not-in-solution".into()),
        "BeiDou not a core system"
    );
    assert!(checks(&f, 'J').contains(&"system-absent".into()));
    let l1c = f
        .iter()
        .find(|x| x.check == "signal-not-tracked" && x.detail["signal"] == "GPS L1C")
        .expect("no L1C finding");
    assert_eq!(l1c.level, Level::Gap);
    let sbas = f
        .iter()
        .find(|x| x.system == 'S' && x.check == "number-range")
        .unwrap();
    let dropped = sbas.detail["allocated_prns_dropped"].as_array().unwrap();
    assert_eq!(dropped.len(), SBAS_ALLOCATED_ABOVE_138.len());
    assert_eq!(dropped[0]["prn"], 139);
}

#[test]
fn a_ready_profile_has_no_gaps() {
    let f = check_profile(&ready());
    assert!(f.is_empty(), "{f:#?}");
}

#[test]
fn the_mgex_file_holds_beidou_beyond_37_and_the_new_signals() {
    let s = summarise_rinex(MAO0).unwrap();
    assert!(s.version >= 4.0);
    let c = &s.satellites[&'C'];
    for sat in ["C57", "C59", "C62"] {
        assert!(c.contains(sat), "{sat}");
    }
    // Against the legacy profile: BeiDou above 37 dropped, GPS L1C and BDS B1C/B2a codes not tracked.
    let f = check_file(&legacy(), &s);
    let beyond = f
        .iter()
        .find(|x| x.system == 'C' && x.check == "satellites-beyond-range")
        .unwrap();
    let sats: Vec<&str> = beyond.detail["satellites"]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| v.as_str().unwrap())
        .collect();
    assert!(sats.contains(&"C57") && !sats.contains(&"C01"));
    let g = f
        .iter()
        .find(|x| x.system == 'G' && x.check == "codes-not-tracked")
        .unwrap();
    assert!(g.detail["codes"]
        .as_array()
        .unwrap()
        .iter()
        .any(|c| c == "C1L"));
    assert!(f
        .iter()
        .any(|x| x.check == "signal-in-data" && x.detail["signal"] == "BDS B2a"));
    assert!(checks(&f, 'J').contains(&"system-dropped".into()));
    // Against the ready profile nothing is dropped.
    let f = check_file(&ready(), &s);
    assert!(f.iter().all(|x| x.level == Level::Info), "{f:#?}");
}

#[test]
fn the_report_counts_and_refuses_a_non_rinex_file() {
    let r = report(&legacy(), &[("mao0".into(), MAO0.into())]).unwrap();
    assert_eq!(r.schema, "kshana.signal-readiness/1");
    assert!(r.counts["gap"] > 0 && r.counts["drop"] > 0);
    assert!(report(&legacy(), &[("x".into(), "not rinex".into())]).is_err());
}

#[test]
fn the_command_line_writes_the_report() {
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args([
            "signal-readiness",
            "examples/signal-readiness/legacy-receiver.toml",
            "tests/fixtures/rinex4_obs_mao0_2023198/MAO000USA_R_20231980000_4EP_30S_MO.rnx",
        ])
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["profile"], "example legacy dual-system receiver");
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["signal-readiness", "--bogus"])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
}
