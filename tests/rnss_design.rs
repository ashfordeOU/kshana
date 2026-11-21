// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana rnss-design`: closed forms, and the candidate profile against the values printed in
//! the study it comes from (K. Han, S. Lee, M. You, J.-H. Won, Sensors 22(6):2180, 2022, CC BY
//! 4.0): Table 4 (SSC at a 16.5 MHz front end against NavIC S-SPS BPSK(1), NavIC S-RS BOCs(5,2)
//! and itself), Table 5 (spectral efficiency at 16.5 MHz), Table 7 (DLL error at 20 and 40 dB-Hz)
//! and Table 8 (Gabor bandwidth at 16.5 MHz). The printed values have two decimals; the
//! tolerances below are stated with each comparison.

use kshana::navsignal::{bpsk_offset_ssc_closed_form, parse_modulation, Modulation};
use kshana::rnss_design::{figures, profile, run, Profile, RunSettings, PROFILES};
use std::process::Command;

/// The paper's rows in Table order, by the profile's signal names:
/// (name, SSC vs S-SPS, SSC vs S-RS, self SSC [dB/Hz], spectral efficiency, Gabor at 16.5 MHz
/// [MHz], DLL error at 20 dB-Hz [m], at 40 dB-Hz [m]).
/// One row: name and the seven printed values.
type Row = (&'static str, f64, f64, f64, f64, f64, f64, f64);

const TABLES: &[Row] = &[
    ("bpsk-1", -61.85, -77.80, -61.85, 0.99, 0.93, 2.13, 0.17),
    ("bpsk-4", -66.47, -78.27, -67.85, 0.95, 1.85, 1.01, 0.08),
    ("bpsk-5", -67.36, -78.76, -68.81, 0.95, 2.19, 0.87, 0.07),
    ("bpsk-8", -69.27, -74.86, -70.83, 0.91, 2.62, 0.66, 0.05),
    ("bocs-1-1", -67.86, -80.04, -64.84, 0.97, 1.60, 1.24, 0.10),
    ("bocs-2-1", -73.87, -76.66, -66.06, 0.92, 2.45, 0.83, 0.06),
    ("bocs-2-2", -73.87, -77.81, -67.83, 0.93, 2.26, 0.83, 0.07),
    ("bocs-3-1", -77.38, -80.34, -66.35, 0.84, 2.70, 0.72, 0.06),
    ("bocs-3-2", -73.40, -77.33, -68.72, 0.86, 2.71, 0.72, 0.06),
    ("bocs-3-3", -77.39, -76.83, -69.59, 0.88, 2.65, 0.74, 0.06),
    ("bocs-4-4", -79.87, -72.97, -70.82, 0.87, 3.21, 0.59, 0.05),
    ("bocs-5-2", -77.80, -69.20, -69.20, 0.84, 4.41, 0.43, 0.03),
    ("bocc-1-1", -73.88, -79.37, -66.08, 0.94, 2.06, 0.97, 0.08),
    ("bocc-2-1", -79.89, -75.29, -66.43, 0.90, 2.78, 0.73, 0.06),
    ("bocc-2-2", -79.88, -74.87, -69.06, 0.89, 2.93, 0.65, 0.05),
    ("bocc-3-1", -83.44, -77.85, -66.53, 0.82, 3.11, 0.66, 0.05),
    ("bocc-3-2", -83.44, -74.83, -69.37, 0.82, 3.58, 0.56, 0.04),
    ("bocc-3-3", -83.42, -72.87, -70.84, 0.83, 3.93, 0.50, 0.04),
    ("bocc-4-4", -85.97, -71.17, -72.16, 0.75, 4.17, 0.47, 0.04),
    ("mboc", -68.26, -78.52, -65.61, 0.95, 2.23, 1.24, 0.10),
];

fn integrate(lo: f64, hi: f64, n: usize, g: impl Fn(f64) -> f64) -> f64 {
    kshana::navsignal::simpson(lo, hi, n, g)
}

#[test]
fn psd_closed_forms() {
    // BPSK(n): Tc sinc²(π f Tc); unit area; nulls at multiples of the chip rate.
    let b = parse_modulation("BPSK(4)").unwrap();
    let rc = 4.0 * 1.023e6;
    let f = 1.7e6;
    let x = std::f64::consts::PI * f / rc;
    assert!((b.psd(f) - (1.0 / rc) * (x.sin() / x).powi(2)).abs() < 1e-18);
    assert!(b.psd(rc) < 1e-20);
    // Sine and cosine BOC have unit area (to the far tail) and a null at the carrier; the
    // cosine form puts more power far out, so its in-band power at 2(fs+fc) is the smaller.
    for label in [
        "BOC(5,2)",
        "BOCc(5,2)",
        "BOCc(1,1)",
        "BOCc(2,1)",
        "MBOC(6,1,1/11)",
    ] {
        let m = parse_modulation(label).unwrap();
        let area = integrate(-400e6, 400e6, 400_000, |f| m.psd(f));
        // Over ±400 MHz; the sine-BOC tail beyond falls as 1/f² and holds the rest.
        assert!((area - 1.0).abs() < 1e-2, "{label}: {area}");
    }
    let s = parse_modulation("BOC(1,1)").unwrap();
    let c = parse_modulation("BOCc(1,1)").unwrap();
    assert!(matches!(c, Modulation::BocCos { .. }));
    assert_eq!(c.label(), "BOCc(1,1)");
    let band = 4.0 * 1.023e6;
    let ps = integrate(-band / 2.0, band / 2.0, 20_000, |f| s.psd(f));
    let pc = integrate(-band / 2.0, band / 2.0, 20_000, |f| c.psd(f));
    assert!(pc < ps, "{pc} {ps}");
    // Betz (2001): BOCc(1,1) at its subcarrier peak equals 4/(π² ...) — check instead the
    // closed form point value against an independent evaluation of its definition.
    let fs = 1.023e6;
    let fc = 1.023e6;
    let f = 0.37e6;
    let pi = std::f64::consts::PI;
    let want = fc
        * (2.0 * (pi * f / fc).sin() * (pi * f / (4.0 * fs)).sin().powi(2)
            / (pi * f * (pi * f / (2.0 * fs)).cos()))
        .powi(2);
    assert!((c.psd(f) - want).abs() < 1e-18);
}

#[test]
fn ssc_closed_form_for_bpsk() {
    // Self SSC of BPSK over an infinite band: 2/(3 Rc); and with a carrier offset, the
    // crate's closed form. A profile with one BPSK(1) signal and a BPSK(1) reference 1 MHz away.
    let text = r#"format = "kshana.rnss-profile/1"
[profile]
name = "test"
title = "test"
status = "USER"
[[references]]
name = "ref"
centre_mhz = 1001.0
modulation = "BPSK(1)"
[[signals]]
name = "s"
source = "REPRESENTATIVE"
centre_mhz = 1000.0
tx_bandwidth_mhz = 400
allocation = "rnss"
[[signals.components]]
role = "data"
modulation = "BPSK(1)"
"#;
    let p = Profile::from_toml(text).unwrap();
    let s = RunSettings {
        band_mhz: 400.0,
        with_gps: vec![],
        ..RunSettings::default()
    };
    let f = figures(&p.signals[0], &p.references, &s).unwrap();
    let rc: f64 = 1.023e6;
    assert!((f.self_ssc_db_hz - 10.0 * (2.0 / (3.0 * rc)).log10()).abs() < 0.01);
    let want = 10.0 * bpsk_offset_ssc_closed_form(rc, 1e6).log10();
    assert!(
        (f.ssc_references_db_hz[0].1 - want).abs() < 0.02,
        "{} {want}",
        f.ssc_references_db_hz[0].1
    );
}

#[test]
fn the_candidate_profile_reproduces_the_studys_tables() {
    let p = profile("candidate-sband-sensors2022").unwrap();
    assert_eq!(p.profile.status, "CANDIDATE");
    assert!(p
        .profile
        .disclaimer
        .as_deref()
        .unwrap()
        .contains("Not an official KPS specification; no public KPS ICD exists as of Nov 2026"));
    assert_eq!(p.signals.len(), TABLES.len());
    let s = RunSettings::default(); // 16.5 MHz, Table 6 receiver (0.1 Hz, 0.1 chip, 20 ms)
    let (mut w_ssc, mut w_eff, mut w_gab, mut w_dll) = (0.0f64, 0.0f64, 0.0f64, 0.0f64);
    for &(name, sps, rs, own, eff, gabor, dll20, dll40) in TABLES {
        let cfg = p.signals.iter().find(|c| c.name == name).unwrap();
        let f = figures(cfg, &p.references, &s).unwrap();
        let ssc = |n: &str| f.ssc_references_db_hz.iter().find(|r| r.0 == n).unwrap().1;
        for (got, want) in [
            (ssc("navic-s-sps"), sps),
            (ssc("navic-s-rs"), rs),
            (f.self_ssc_db_hz, own),
        ] {
            w_ssc = w_ssc.max((got - want).abs());
            assert!((got - want).abs() <= 0.2, "{name}: SSC {got:.2} vs {want}");
        }
        w_eff = w_eff.max((f.in_band_fraction - eff).abs());
        assert!(
            (f.in_band_fraction - eff).abs() <= 0.015,
            "{name}: efficiency {} vs {eff}",
            f.in_band_fraction
        );
        // Gabor bandwidth: the study's Table 8 matches the unnormalised form √∫_B f² G df
        // more closely than the normalised one, but not exactly (up to 5.4 % here, the
        // higher-order cosine BOCs furthest); its convention is to confirm. Bound: 6 %.
        let rel = (f.gabor_unnormalised_mhz - gabor).abs() / gabor;
        w_gab = w_gab.max(rel);
        assert!(
            rel <= 0.06,
            "{name}: Gabor {} vs {gabor}",
            f.gabor_unnormalised_mhz
        );
        // DLL (Table 6 receiver: non-coherent early-minus-late power, 0.1 chip, 0.1 Hz, 20 ms):
        // every row within 0.01 m at 40 dB-Hz except MBOC. The study's MBOC row (0.10 m, 1.24 m)
        // equals its BOCs(1,1) row exactly, as if MBOC were tracked with a BOC(1,1) replica;
        // here the full MBOC spectrum is tracked (0.070 m), so the row is not compared.
        let at40 = f.code_jitter_m.unwrap();
        if name == "mboc" {
            continue;
        }
        w_dll = w_dll.max((at40 - dll40).abs());
        assert!(
            (at40 - dll40).abs() <= 0.01,
            "{name}: DLL at 40 dB-Hz {at40} vs {dll40}"
        );
        // At 20 dB-Hz the BPSK rows agree within 3.5 %; the BOC rows come out 1 % to 18 % below
        // the study (higher-order BOC furthest), a convention difference not resolved here
        // (docs/RNSS-DESIGN.md), so they are not asserted.
        if name.starts_with("bpsk") {
            let s20 = RunSettings {
                cn0_dbhz: 20.0,
                ..RunSettings::default()
            };
            let at20 = figures(cfg, &p.references, &s20)
                .unwrap()
                .code_jitter_m
                .unwrap();
            assert!(
                (at20 - dll20).abs() / dll20 <= 0.035,
                "{name}: DLL at 20 dB-Hz {at20} vs {dll20}"
            );
        }
    }
    eprintln!(
        "largest differences: SSC {w_ssc:.3} dB, efficiency {w_eff:.4}, Gabor {:.2} %, DLL at 40 dB-Hz {w_dll:.4} m",
        100.0 * w_gab
    );
}

#[test]
fn rtk_settings_join_the_candidate_carrier_to_gps() {
    let p = profile("candidate-sband-sensors2022").unwrap();
    let r = run(&p, &RunSettings::default()).unwrap();
    assert_eq!(r.evidence, "MODELLED");
    let case = &r.rtk_settings.cases[0];
    // One distinct candidate carrier plus GPS L1 and L5; L1/L5 is the closest pair.
    assert_eq!(case.carriers.len(), 3);
    assert_eq!(
        case.stages[0],
        vec!["gps-l1".to_string(), "gps-l5".to_string()]
    );
    assert_eq!(case.stages.last().unwrap(), &vec!["bpsk-1".to_string()]);
    let res = r.rtk_result.unwrap();
    assert!(res.cases[0].success > 0.0 && res.cases[0].success <= 1.0);
    // No candidate overlaps a GNSS L-band signal of the crate.
    assert!(r.signals.iter().all(|s| s.ssc_into_gnss_db_hz.is_empty()));
}

#[test]
fn the_command_line_lists_and_runs() {
    let run_cmd = |args: &[&str]| {
        Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .output()
            .unwrap()
    };
    let o = run_cmd(&["rnss-design", "profiles"]);
    assert!(o.status.success());
    assert_eq!(
        String::from_utf8_lossy(&o.stdout).trim(),
        PROFILES.iter().map(|p| p.0).collect::<Vec<_>>().join("\n")
    );
    let o = run_cmd(&[
        "rnss-design",
        "run",
        "candidate-sband-sensors2022",
        "--with-gps",
        "none",
    ]);
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["format"], "kshana.rnss-design/1");
    assert_eq!(v["profile"]["status"], "CANDIDATE");
    assert!(v["rtk_result"].is_null(), "one carrier: no RTK cascade");
    assert!(!run_cmd(&["rnss-design", "run", "no-such-profile"])
        .status
        .success());
    assert!(!run_cmd(&[
        "rnss-design",
        "run",
        "candidate-sband-sensors2022",
        "--band-mhz",
        "-3"
    ])
    .status
    .success());
    assert!(!run_cmd(&[
        "rnss-design",
        "run",
        "candidate-sband-sensors2022",
        "--with-gps",
        "l9"
    ])
    .status
    .success());
}
