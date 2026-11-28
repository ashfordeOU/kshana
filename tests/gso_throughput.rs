// SPDX-License-Identifier: AGPL-3.0-only
//! FCC 26-26 protection criteria (`kshana gso-throughput`).
//!
//! * The shipped reference-link set is FCC 26-26 Appendix B: 328 links, 28 with ACM, each
//!   carrier number once, at the pinned SHA-256.
//! * The test vectors from the document: every Appendix B column its legend defines from other
//!   columns (C/(N+I), margins, UT or GW, pass_rain_only, the 0 dB ACM threshold), plus the
//!   elevation and clear-sky C/N, recomputed for all 328 links within the stated tolerances.
//! * Hand-derived evaluation (tests/fixtures/gso-throughput/exceeds.json), efficiency table
//!   0/5/10 dB -> 1/2/3 bit/s/Hz:
//!   - link 5310 (ACM, threshold 0 dB, internal C/I 40 dB): sample 0.9 x C/N 22 dB, I/N -12 dB
//!     gives C/(N+I) 21.93 dB without and 21.67 dB with (3 bit/s/Hz both); sample 0.1 x C/N
//!     5.5 dB, I/N -8 dB gives 5.50 dB (2) and 4.86 dB (1). Throughput 2.9 -> 2.8, degraded
//!     throughput 1 - 2.8/2.9 = 3.448 % > 3 %.
//!   - link 6 (no ACM, threshold 9 dB, internal C/I 19.586 dB): sample 0.01 x C/N 10 dB with
//!     I/N -5 dB falls from 9.547 dB to 8.458 dB, below 9 dB: availability change 1 percentage
//!     point > 0.1; 99 % of the time has no NGSO interference, so the I/N criterion holds.
//!   - avoidance: the declared 4 deg and a sample at 3.5 deg -> 3.5 deg >= 3.

use std::path::{Path, PathBuf};
use std::process::Command;

use kshana::gso_throughput::{
    appendix_b, check_links, efficiency, evaluate, parse_links, sha256_hex, EfficiencyStep,
    LinkSetInfo, RunInput, LINKS_CSV, LINK_SET_COUNT, LINK_SET_SHA256,
};

fn fixture(n: &str) -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/gso-throughput")
        .join(n)
}

fn info() -> LinkSetInfo {
    LinkSetInfo {
        id: "fcc-26-26-appendix-b".into(),
        sha256: sha256_hex(LINKS_CSV.as_bytes()),
        matches_pinned_fcc_26_26: true,
        links: LINK_SET_COUNT,
        source: "test".into(),
    }
}

fn input(n: &str) -> (RunInput, Vec<u8>) {
    let b = std::fs::read(fixture(n)).unwrap();
    (serde_json::from_slice(&b).unwrap(), b)
}

#[test]
fn the_shipped_link_set_is_appendix_b() {
    let links = appendix_b();
    assert_eq!(links.len(), LINK_SET_COUNT);
    assert_eq!(sha256_hex(LINKS_CSV.as_bytes()), LINK_SET_SHA256);
    assert_eq!(links.iter().filter(|l| l.acm).count(), 28);
    let first = &links[0];
    assert_eq!(
        (first.carrier_num, first.geo_network_name.as_str()),
        (6, "IDR-1")
    );
    assert_eq!(first.obj_cni_threshold_db, 9.0);
    let last = links.last().unwrap();
    assert_eq!(
        (last.carrier_num, last.geo_network_name.as_str(), last.acm),
        (5310, "JUPITER 97W", true)
    );
    // A name with a comma is read whole.
    assert!(links
        .iter()
        .any(|l| l.geo_network_name == "Telecom 2, Videosat, Digtal TV"));
}

#[test]
fn every_derived_appendix_b_column_is_reproduced() {
    let r = check_links(&appendix_b(), info());
    assert_eq!(r.links, 328);
    assert!(r.failures.is_empty(), "{:#?}", r.failures);
    assert_eq!(r.within, r.checks);
    let cols: Vec<_> = r.columns.iter().map(|c| (c.column, c.checked)).collect();
    assert_eq!(
        cols,
        vec![
            ("calc_gso_elevation_deg", 328),
            ("calc_cn_clearsky_dB", 328),
            ("calc_cni_clearsky_dB", 328),
            ("calc_cni_clearsky_margin_dB", 328),
            ("calc_cni_rain_margin_dB", 328),
            ("UT or GW", 328),
            ("pass_rain_only", 300),
            ("obj_cni_threshold_dB (ACM)", 28),
        ]
    );
}

#[test]
fn a_changed_row_is_caught() {
    let bad = LINKS_CSV.replacen(",23.49822729641318,", ",23.6,", 1);
    let links = parse_links(&bad).unwrap();
    let r = check_links(&links, info());
    // The link budget no longer gives 23.6 dB, and the C/(N+I) column no longer follows from it.
    let cols: Vec<_> = r
        .failures
        .iter()
        .map(|f| {
            (
                f["carrier_num"].as_i64().unwrap(),
                f["check"]["column"].as_str().unwrap(),
            )
        })
        .collect();
    assert_eq!(
        cols,
        vec![(6, "calc_cn_clearsky_dB"), (6, "calc_cni_clearsky_dB")]
    );
}

#[test]
fn the_efficiency_table_is_a_step() {
    let t = [
        EfficiencyStep {
            cni_db: 0.0,
            bps_per_hz: 1.0,
        },
        EfficiencyStep {
            cni_db: 5.0,
            bps_per_hz: 2.0,
        },
    ];
    assert_eq!(efficiency(&t, -0.1), 0.0);
    assert_eq!(efficiency(&t, 0.0), 1.0);
    assert_eq!(efficiency(&t, 4.99), 1.0);
    assert_eq!(efficiency(&t, 5.0), 2.0);
}

#[test]
fn hand_derived_exceedances() {
    let (inp, b) = input("exceeds.json");
    let r = evaluate(
        &inp,
        &appendix_b(),
        info(),
        &[("exceeds.json".into(), b.clone())],
    )
    .unwrap();
    assert_eq!(r.label, "MODELLED");
    assert_eq!(r.inputs[0]["sha256"], sha256_hex(&b));
    let l = &r.links[0];
    assert_eq!(l.carrier_num, 5310);
    let dt = &l.criteria[0];
    assert_eq!(dt.provision, "47 CFR 25.146(a)(3)(i)(A)");
    assert!((dt.value - 100.0 / 29.0).abs() < 1e-9, "{}", dt.value);
    assert!(!dt.meets);
    assert!(l.criteria[1].meets && l.criteria[1].value.abs() < 1e-12);
    let l6 = &r.links[1];
    assert_eq!(l6.carrier_num, 6);
    assert!((l6.criteria[0].value - 1.0).abs() < 1e-9);
    assert!(!l6.criteria[0].meets);
    assert_eq!(l6.criteria[1].provision, "47 CFR 25.146(a)(3)(i)(C)");
    assert!((l6.criteria[1].value - 99.0).abs() < 1e-9 && l6.criteria[1].meets);
    let a = r.avoidance.as_ref().unwrap();
    assert!((a.value - 3.5).abs() < 1e-12 && a.meets);
    assert_eq!(r.exceedances, 2);
    assert_eq!(r.links_exceeding, vec![5310, 6]);
    assert_eq!(
        r.reference_links_not_evaluated.len(),
        LINK_SET_COUNT - r.links.len()
    );
}

#[test]
fn hand_derived_meets_and_avoidance_angle() {
    let (mut inp, b) = input("meets.json");
    let r = evaluate(&inp, &appendix_b(), info(), &[("meets.json".into(), b)]).unwrap();
    assert_eq!(r.exceedances, 0, "{r:#?}");
    // 85 % of the time free of NGSO interference, 15 % at -9 dB.
    assert!((r.links[1].criteria[1].value - 85.0).abs() < 1e-9);
    inp.links[0].samples[1].avoidance_angle_deg = Some(2.9);
    let r = evaluate(&inp, &appendix_b(), info(), &[]).unwrap();
    assert_eq!(r.exceedances, 1);
    assert!(!r.avoidance.unwrap().meets);
}

#[test]
fn bad_inputs_are_refused() {
    let (inp, _) = input("meets.json");
    let mut x = inp.clone();
    x.links[0].carrier_num = 999_999;
    assert!(evaluate(&x, &appendix_b(), info(), &[])
        .unwrap_err()
        .contains("not in the reference-link set"));
    let mut x = inp.clone();
    x.spectral_efficiency.swap(0, 1);
    assert!(evaluate(&x, &appendix_b(), info(), &[]).is_err());
    let mut x = inp.clone();
    x.spectral_efficiency.clear();
    assert!(evaluate(&x, &appendix_b(), info(), &[])
        .unwrap_err()
        .contains("spectral_efficiency"));
    let mut x = inp.clone();
    x.format = "other".into();
    assert!(evaluate(&x, &appendix_b(), info(), &[]).is_err());
    let mut x = inp;
    x.links[1].samples[0].weight = 0.0;
    assert!(evaluate(&x, &appendix_b(), info(), &[]).is_err());
}

fn unique_dir(tag: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-gso-throughput-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

#[test]
fn the_command_line_writes_a_run_record_and_exits_on_exceedance() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let ok = Command::new(bin)
        .args(["gso-throughput", "check-links"])
        .output()
        .unwrap();
    assert_eq!(
        ok.status.code(),
        Some(0),
        "{}",
        String::from_utf8_lossy(&ok.stderr)
    );
    let dir = unique_dir("cli");
    let out = dir.join("run.json");
    let r = Command::new(bin)
        .args(["gso-throughput", "evaluate"])
        .arg(fixture("exceeds.json"))
        .arg("--out")
        .arg(&out)
        .output()
        .unwrap();
    assert_eq!(r.status.code(), Some(1));
    let v: serde_json::Value = serde_json::from_slice(&std::fs::read(&out).unwrap()).unwrap();
    assert_eq!(v["format"], "kshana.gso-throughput-report/1");
    assert_eq!(v["label"], "MODELLED");
    assert_eq!(v["link_set"]["matches_pinned_fcc_26_26"], true);
    assert_eq!(
        v["inputs"][0]["sha256"],
        sha256_hex(&std::fs::read(fixture("exceeds.json")).unwrap())
    );
    let m = Command::new(bin)
        .args(["gso-throughput", "evaluate"])
        .arg(fixture("meets.json"))
        .output()
        .unwrap();
    assert_eq!(m.status.code(), Some(0));
    let _ = std::fs::remove_dir_all(&dir);
}
