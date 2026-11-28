// SPDX-License-Identifier: AGPL-3.0-only
//! ITU Resolution 35 deployment check on the fictional system in tests/fixtures/itu-res35: two
//! notified plane groups (2 x 10 satellites at 53 deg / 550 km, 1 x 10 at 97.6 deg / 600 km,
//! total N = 30), OMM JSON for two dates, TLEs for the polar group and a SATCAT-style CSV.
//!
//! Hand-derived expectations (Resolution 35 (Rev.WRC-23) resolves 4, 7, 8, 11):
//! * M1 needs floor(0.10 x 30) = 3, M2 floor(0.50 x 30) = 15, M3 30 - 1 = 29;
//! * regulatory period ended 2022-06-15 -> milestones 2024-06-15, 2027-06-15, 2029-06-15, reports
//!   due 30 days later; ended 2019-05-01 -> 2023-01-01, 2026-01-01, 2028-01-01, reports due
//!   1 February;
//! * as of 2026-11-20: G1 holds 12 station-keeping objects plus one with a single set
//!   (station-keeping unknown) = 13; one at 350 km is still raising (not in a notified plane);
//!   one has elements from 2026-09-01 only (stale); G2 holds 3, of which one lost 8 km of
//!   semi-major axis in 10 days (not station-keeping); one payload decayed in the catalogue and
//!   one rocket body is not a payload. Counted: 13 + 3 = 16 deployed, 12 + 2 = 14 station-keeping.

use std::path::{Path, PathBuf};
use std::process::Command;

use kshana::itu_res35::{
    evaluate, mean_orbit, parse_date, parse_input, Parsed, FORMAT, SOURCE_URL,
};

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/itu-res35")
}

fn read(n: &str) -> (String, Vec<u8>) {
    (n.to_string(), std::fs::read(dir().join(n)).unwrap())
}

fn all_inputs() -> Vec<(String, Vec<u8>)> {
    [
        "gp-2026-11-10.json",
        "gp-2026-11-20.json",
        "polar.tle",
        "satcat.csv",
    ]
    .iter()
    .map(|n| read(n))
    .collect()
}

#[test]
fn counts_and_milestones_match_the_hand_derivation() {
    let (fname, fb) = read("filing.toml");
    let r = evaluate(&fname, &fb, &all_inputs(), None).unwrap();
    assert_eq!(r.format, FORMAT);
    assert_eq!(r.label, "MODELLED");
    assert_eq!(r.source["url"], SOURCE_URL);
    assert_eq!(r.total_satellites, 30);
    assert_eq!(r.as_of, "2026-11-20");
    assert_eq!(r.regime, "resolves 7");
    let g: Vec<_> = r
        .plane_groups
        .iter()
        .map(|g| {
            (
                g.id.as_str(),
                g.notified,
                g.deployed,
                g.station_keeping,
                g.station_keeping_unknown,
            )
        })
        .collect();
    assert_eq!(
        g,
        vec![
            ("G1-53deg-550km", 20, 13, 12, 1),
            ("G2-97.6deg-600km", 10, 3, 2, 0)
        ]
    );
    assert_eq!((r.deployed, r.station_keeping), (16, 14));
    let m: Vec<_> = r
        .milestones
        .iter()
        .map(|m| {
            (
                m.id,
                m.date.as_str(),
                m.report_due.as_str(),
                m.required,
                m.state,
                m.shortfall,
            )
        })
        .collect();
    assert_eq!(
        m,
        vec![
            ("M1", "2024-06-15", "2024-07-15", 3, "passed", 0),
            ("M2", "2027-06-15", "2027-07-15", 15, "upcoming", 0),
            ("M3", "2029-06-15", "2029-07-15", 29, "upcoming", 13),
        ]
    );
    let status = |n: u32| r.objects.iter().find(|o| o.norad == n).unwrap();
    assert_eq!(status(90014).status, "not-in-notified-plane");
    assert_eq!(status(90015).status, "stale-elements");
    assert_eq!(status(90016).status, "decayed");
    assert_eq!(status(90017).status, "not-a-payload");
    assert_eq!(status(90013).station_keeping, "unknown");
    assert_eq!(status(90023).station_keeping, "not-station-keeping");
    assert!(status(90023).sma_range_km.unwrap() > 7.0);
    // Every input is hashed, in order: the filing first.
    let roles: Vec<_> = r.inputs.iter().map(|i| i.role).collect();
    assert_eq!(
        roles,
        ["filing", "elements", "elements", "elements", "satcat"]
    );
    assert!(r.inputs.iter().all(|i| i.sha256.len() == 64));
}

#[test]
fn a_system_whose_period_ended_before_2021_uses_resolves_8() {
    let (fname, fb) = read("filing-pre2021.toml");
    let only_latest = vec![read("gp-2026-11-20.json")];
    let r = evaluate(&fname, &fb, &only_latest, None).unwrap();
    assert_eq!(r.regime, "resolves 8");
    let m: Vec<_> = r
        .milestones
        .iter()
        .map(|m| (m.provision, m.date.as_str(), m.report_due.as_str(), m.state))
        .collect();
    assert_eq!(
        m,
        vec![
            ("resolves 8a)", "2023-01-01", "2023-02-01", "passed"),
            ("resolves 8b)", "2026-01-01", "2026-02-01", "passed"),
            ("resolves 8c)", "2028-01-01", "2028-02-01", "upcoming"),
        ]
    );
    // From the latest OMM file alone: G1 13 deployed, none decidable as station-keeping.
    assert_eq!(r.deployed, 13);
    assert_eq!(r.station_keeping, 0);
    let m2 = &r.milestones[1];
    assert_eq!((m2.required, m2.shortfall, m2.met_at_as_of), (15, 2, false));
    // resolves 11b): a modified total of at most twice the number deployed.
    assert_eq!(m2.max_total_if_modified, 26);
}

#[test]
fn the_as_of_date_limits_the_sets_used() {
    let (fname, fb) = read("filing.toml");
    let r = evaluate(&fname, &fb, &all_inputs(), parse_date("2026-11-15")).unwrap();
    // Only the 2026-11-10 sets: 12 G1 objects, one span-less each (unknown), and 3 polar ones.
    assert_eq!(r.as_of, "2026-11-15");
    assert_eq!(r.plane_groups[0].deployed, 12);
    assert_eq!(r.plane_groups[0].station_keeping_unknown, 12);
}

#[test]
fn readers_agree_on_the_same_orbit() {
    // The TLE and an OMM record of the same orbit give the same mean orbit.
    let Parsed::Elements(t) =
        parse_input(&String::from_utf8(read("polar.tle").1).unwrap()).unwrap()
    else {
        panic!("TLE file read as a catalogue");
    };
    assert_eq!(t.len(), 6);
    assert_eq!(t[0].norad, 90021);
    assert_eq!(t[0].name, "EXNGSO-P1");
    assert_eq!(t[0].object_id, "2025-002A");
    let o = mean_orbit(
        t[0].mean_motion_rev_day,
        t[0].eccentricity,
        t[0].inclination_deg,
    );
    // 600 km target, e = 1e-4: apogee 600 + a e = 600.70 km, perigee 599.30 km (to the TLE's
    // 8-decimal mean motion).
    assert!((o.apogee_km - 600.70).abs() < 0.02, "{o:?}");
    assert!((o.perigee_km - 599.30).abs() < 0.02, "{o:?}");
    // Kepler alone at 15.5 rev/day gives a = 6794.87 km; the SGP4 un-Kozai step adds about
    // 0.5 km at 51.6 deg (d1 = 0.75 J2 (3 cos^2 i - 1) = 1.29e-4, del = d1 / ak^2).
    let iss = mean_orbit(15.5, 0.0, 51.6);
    let kepler = (398_600.8f64 / (15.5 * std::f64::consts::TAU / 86_400.0f64).powi(2)).cbrt();
    assert!((kepler - 6794.87).abs() < 0.01, "{kepler}");
    assert!(
        (iss.sma_km - kepler - 0.51).abs() < 0.05,
        "{}",
        iss.sma_km - kepler
    );
}

#[test]
fn bad_filings_are_refused() {
    let (_, fb) = read("filing.toml");
    let text = String::from_utf8(fb).unwrap();
    for (from, to) in [
        ("2022-06-15", "2022-02-30"),
        (
            "satellites_per_plane = 10\ninclination_deg = 97.6",
            "satellites_per_plane = 0\ninclination_deg = 97.6",
        ),
        ("altitude_km = 25.0", "altitude_km = -1.0"),
    ] {
        assert!(text.contains(from), "{from}");
        let bad = text.replace(from, to);
        assert!(
            evaluate("f", bad.as_bytes(), &all_inputs(), None).is_err(),
            "{to}"
        );
    }
}

#[test]
fn cli_text_json_and_exit_codes() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let d = dir();
    let p = |n: &str| d.join(n).to_string_lossy().to_string();
    let out = Command::new(bin)
        .args([
            "itu-res35",
            "report",
            &p("filing.toml"),
            &p("gp-2026-11-10.json"),
            &p("gp-2026-11-20.json"),
            &p("polar.tle"),
            &p("satcat.csv"),
        ])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(0));
    let s = String::from_utf8_lossy(&out.stdout);
    assert!(
        s.contains("counted toward the total: 16 deployed, 14 station-keeping"),
        "{s}"
    );
    assert!(s.contains("MODELLED"));
    let out = Command::new(bin)
        .args([
            "itu-res35",
            "report",
            &p("filing-pre2021.toml"),
            &p("gp-2026-11-20.json"),
            "--json",
        ])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(1), "M2 passed and short");
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["format"], FORMAT);
    assert_eq!(v["milestones"][1]["shortfall"], 2);
    let out = Command::new(bin)
        .args(["itu-res35", "milestones", &p("filing.toml"), "--json"])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(0));
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["milestones"][2]["required"], 29);
    let out = Command::new(bin)
        .args(["itu-res35", "report", &p("filing.toml")])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(2));
    let out = Command::new(bin)
        .args(["itu-res35", "report", &p("filing.toml"), &p("missing.json")])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(2));
}
