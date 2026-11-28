// SPDX-License-Identifier: AGPL-3.0-only
//! First-72-hours breakup exposure (`kshana breakup-exposure`) on the fictional catalogue in
//! tests/fixtures/breakup-exposure (parent 99001 at 800 km, 98.6 deg).
//!
//! Hand-derived expectations:
//! * explosion, S = 1, Lc = 0.1 m: N = 6 x 0.1^-1.6 = 238.86 fragments;
//! * catastrophic collision 1000 kg + 1 kg at 10 km/s (1 x 1e8 / 2000 = 50 J/g >= 40 J/g):
//!   N = 0.1 x 1001^0.75 x 0.1^-1.71 = 912.69; with 0.5 kg (25 J/g) it is non-catastrophic and
//!   M = 0.5 x 10^2 = 50 kg, N = 96.43;
//! * A/m up to 0.1 m2/kg (chi = -1), explosion: median ejection speed 10^1.65 = 44.67 m/s, 90th
//!   percentile 10^(1.65 + 0.4 x 1.28155) = 145.4 m/s;
//! * the shell's extremes are the tangential kicks: perigee and apogee from vis-viva with the
//!   speed changed by -145.4 and +145.4 m/s at the parent's radius (within 5 km of the sampled
//!   sphere); the 1800 km and geostationary objects do not intersect it, the others do; the
//!   co-planar object 20 deg ahead of the parent spends the whole window inside and ranks first.

use std::path::{Path, PathBuf};
use std::process::Command;

use kshana::breakup_exposure::{
    collision_mass, evaluate, fragment_count, normal_quantile, parse_catalogue, two_body,
};

fn fixtures() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/breakup-exposure")
}

fn read(n: &str) -> (String, Vec<u8>) {
    (n.to_string(), std::fs::read(fixtures().join(n)).unwrap())
}

#[test]
fn the_model_formulas_match_the_hand_derivation() {
    assert!((fragment_count(false, 1.0, 0.1) - 238.86).abs() < 0.01);
    let (m, r) = collision_mass(1000.0, 1.0, 10.0);
    assert_eq!((m, r), (1001.0, "catastrophic"));
    assert!((fragment_count(true, m, 0.1) - 912.69).abs() < 0.01);
    let (m, r) = collision_mass(1000.0, 0.5, 10.0);
    assert_eq!((m, r), (50.0, "non-catastrophic"));
    assert!((fragment_count(true, m, 0.1) - 96.43).abs() < 0.01);
    assert!((normal_quantile(0.99) - 2.326_347_874).abs() < 1e-8);
    assert!((normal_quantile(0.9) - 1.281_551_566).abs() < 1e-8);
    assert!((normal_quantile(0.5)).abs() < 1e-12);
}

#[test]
fn the_explosion_report_matches_the_hand_derivation() {
    let (en, eb) = read("explosion.toml");
    let r = evaluate(&en, &eb, &[read("catalogue.json")]).unwrap();
    assert_eq!(r.label, "MODELLED");
    assert!((r.fragments_at_or_above_min_length - 238.86).abs() < 0.01);
    assert!((r.shell.delta_v_median_m_s - 44.67).abs() < 0.01);
    assert!((r.shell.delta_v_max_m_s - 145.4).abs() < 0.1);
    // Tangential kicks at the parent's state (independent vis-viva at the same radius).
    let objs = parse_catalogue(&String::from_utf8(read("catalogue.json").1).unwrap()).unwrap();
    let parent = objs.iter().find(|o| o.norad == 99001).unwrap();
    let orbit = kshana::sgp4::SgpOrbit::new(parent.set);
    let t0 = kshana::breakup_exposure::parse_epoch("2026-11-20T06:00:00Z").unwrap();
    let (r0, v0) = orbit.teme_state(t0).unwrap();
    let vn = (v0[0] * v0[0] + v0[1] * v0[1] + v0[2] * v0[2]).sqrt();
    let dv = r.shell.delta_v_max_m_s;
    let scale = |k: f64| [v0[0] * k, v0[1] * k, v0[2] * k];
    let (rp_retro, _, _) = two_body(r0, scale((vn - dv) / vn));
    let (_, ra_pro, _) = two_body(r0, scale((vn + dv) / vn));
    let km = |x: f64| x / 1e3 - 6378.137;
    assert!(
        (r.shell.perigee_min_km - km(rp_retro)).abs() < 5.0,
        "{:?}",
        r.shell
    );
    assert!(
        (r.shell.apogee_max_km - km(ra_pro)).abs() < 5.0,
        "{:?}",
        r.shell
    );
    assert!(r.shell.perigee_min_km < 550.0 && r.shell.apogee_max_km < 1800.0);
    assert_eq!(r.objects_screened, 6);
    let hit: Vec<u32> = r.exposure.iter().map(|e| e.norad).collect();
    for n in [99002, 99003, 99004, 99007] {
        assert!(hit.contains(&n), "{n} {hit:?}");
    }
    assert!(!hit.contains(&99005) && !hit.contains(&99006));
    let first = &r.exposure[0];
    assert_eq!((first.rank, first.norad), (1, 99002));
    assert!((first.percent_in_shell - 100.0).abs() < 1e-9);
    assert!(first.min_distance_to_centre_km < 3000.0);
    // Ranks are by hours inside the shell.
    assert!(r
        .exposure
        .windows(2)
        .all(|w| w[0].hours_in_shell >= w[1].hours_in_shell));
    assert_eq!(r.inputs.len(), 2);
}

#[test]
fn the_collision_and_bad_events() {
    let (en, eb) = read("collision.toml");
    let r = evaluate(&en, &eb, &[read("catalogue.json")]).unwrap();
    assert_eq!(r.collision_regime, Some("catastrophic"));
    assert!((r.fragments_at_or_above_min_length - 912.69).abs() < 0.01);
    // Collision fragments are faster (0.9 chi + 2.9): the shell is wider than the explosion's.
    assert!(r.shell.delta_v_max_m_s > 145.4);
    let bad = String::from_utf8(eb)
        .unwrap()
        .replace("parent_norad = 99001", "parent_norad = 12345");
    assert!(evaluate(&en, bad.as_bytes(), &[read("catalogue.json")])
        .unwrap_err()
        .contains("not in the catalogue"));
    let bad = String::from_utf8(read("explosion.toml").1)
        .unwrap()
        .replace("kind = \"explosion\"", "kind = \"implosion\"");
    assert!(evaluate(&en, bad.as_bytes(), &[read("catalogue.json")]).is_err());
}

fn unique_dir(tag: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-breakup-exposure-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

#[test]
fn the_command_line_writes_the_report() {
    let dir = unique_dir("cli");
    let out = dir.join("report.json");
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("breakup-exposure")
        .arg(fixtures().join("collision.toml"))
        .arg(fixtures().join("catalogue.json"))
        .arg("--out")
        .arg(&out)
        .output()
        .unwrap();
    assert_eq!(
        o.status.code(),
        Some(0),
        "{}",
        String::from_utf8_lossy(&o.stderr)
    );
    let v: serde_json::Value = serde_json::from_slice(&std::fs::read(&out).unwrap()).unwrap();
    assert_eq!(v["format"], "kshana.breakup-exposure/1");
    assert_eq!(v["label"], "MODELLED");
    assert_eq!(v["inputs"].as_array().unwrap().len(), 2);
    let _ = std::fs::remove_dir_all(&dir);
}
