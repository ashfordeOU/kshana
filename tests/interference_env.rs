// SPDX-License-Identifier: AGPL-3.0-only
//! Interference environments (`kshana interference-env`, src/interference_env.rs) against the
//! published numbers of Recommendations ITU-R M.1903-1 (Tables 1 and 2) and M.2030-0 (equations
//! and the Annex 2 worked examples).

use kshana::interference_env::{
    aggregate_pdc, baseline, degradation, evaluate, n0_eff_blanking, n0_eff_saturating, receiver,
    relative_threshold_db, threshold_dbw, Environment, Mode, Source, BOLTZMANN, TABLE1_BREAKPOINTS,
};
use std::process::Command;

#[test]
fn m1903_table1_is_reproduced_at_every_breakpoint() {
    for (bw, rel) in TABLE1_BREAKPOINTS {
        assert!((relative_threshold_db(bw) - rel).abs() < 1e-9, "{bw} Hz");
    }
    // The flat ends of the table.
    assert_eq!(relative_threshold_db(10.0), -10.0);
    assert_eq!(relative_threshold_db(700.0), -10.0);
    assert_eq!(relative_threshold_db(100e6), 21.0);
    // 0 dB from 100 kHz to 1 MHz.
    assert_eq!(relative_threshold_db(500e3), 0.0);
}

#[test]
fn the_log_interpolation_matches_a_constant_density_above_one_megahertz() {
    // Table 1 note (1): above 1 MHz the density must not exceed the wideband threshold; the
    // 0 to 13 dB segment over 1 to 20 MHz is that constant-density line within 0.011 dB (13 dB
    // against 10·log10(20) = 13.0103 dB at the end).
    for bw in [2e6, 5e6, 10e6, 15e6, 20e6] {
        let flat = 10.0 * (bw / 1e6f64).log10();
        assert!((relative_threshold_db(bw) - flat).abs() < 0.011, "{bw}");
    }
}

#[test]
fn table1_and_table2_agree_for_the_type1_receivers() {
    for id in ["sbas-cat1-type1", "gbas-cat1-3-type1"] {
        let r = receiver(id).unwrap();
        // Narrow-band (≤ 700 Hz) is the 1 MHz level minus 10 dB: Table 2's narrow-band value.
        assert_eq!(threshold_dbw(r, Mode::Tracking, 100.0), Some(-150.5));
        assert_eq!(threshold_dbw(r, Mode::Tracking, 1e6), Some(-140.5));
        assert_eq!(threshold_dbw(r, Mode::Acquisition, 100.0), Some(-156.5));
        assert_eq!(threshold_dbw(r, Mode::Acquisition, 1e6), Some(-146.5));
        // Above 1 MHz the density cap holds (note (1)).
        let t = threshold_dbw(r, Mode::Tracking, 10e6).unwrap();
        assert!(t <= -140.5 + 10.0 + 1e-9 && t > -130.52, "{t}");
    }
    // A-RNSS: the values the Recommendation's text states (-146.9 dBW/MHz, -156.9 dBW); no curve
    // between 700 Hz and 1 MHz.
    let a = receiver("a-rnss").unwrap();
    assert_eq!(threshold_dbw(a, Mode::Tracking, 500.0), Some(-156.9));
    assert_eq!(threshold_dbw(a, Mode::Tracking, 1e6), Some(-146.9));
    assert_eq!(threshold_dbw(a, Mode::Tracking, 10e3), None);
}

#[test]
fn m2030_annex2_example_1_sbas_ground_reference() {
    // PW = 44 µs, PRF = 500 Hz, recovery 1 µs: PDC_Y = 0.0225, ratio 1.04657, 0.198 dB (< 0.2 dB).
    let b = baseline("l2-sbas-ground-reference").unwrap();
    let d = degradation(b, 44e-6, 500.0, 0.0, None).unwrap();
    assert!((d.pdc_y - 0.0225).abs() < 1e-12);
    assert!((d.ratio - 1.04657).abs() < 5e-6, "{}", d.ratio);
    assert_eq!(d.ratio_db, 0.198);
    assert!(d.within_allowable);
}

#[test]
fn m2030_annex2_example_2_high_precision_semicodeless() {
    // Same source; N_LIM = 2 and baseline PDC 0.0765: ratio 1.09963, 0.413 dB (> 0.2 dB).
    let b = baseline("l2-high-precision-semicodeless").unwrap();
    let d = degradation(b, 44e-6, 500.0, 0.0, None).unwrap();
    assert!((d.ratio - 1.09963).abs() < 5e-6, "{}", d.ratio);
    // The Recommendation prints 0.413 dB; 10·log10(1.099627) = 0.4125, so the printed value is
    // rounded up from the same ratio: agree within 0.001 dB.
    assert!((d.ratio_db - 0.413).abs() <= 0.001 + 1e-9, "{}", d.ratio_db);
    assert!(!d.within_allowable);
}

#[test]
fn the_effective_noise_equations_reduce_without_pulses() {
    // M.2030: with no pulsed RFI, N0,EFF = N0 + I0,WB.
    assert_eq!(n0_eff_blanking(0.0, 0.5, 0.0), 1.5);
    assert_eq!(n0_eff_saturating(0.0, 0.5, 0.0, 2.0), 1.5);
    // Hard limiter (N_LIM = 1, R = 0): 1/(1-PDC)^2.
    let p = 0.1;
    assert!((n0_eff_saturating(p, 0.0, 0.0, 1.0) - 1.0 / (1.0 - p) / (1.0 - p)).abs() < 1e-12);
    // Equation (3): independent groups.
    assert!((aggregate_pdc(&[0.1, 0.2]) - 0.28).abs() < 1e-12);
}

#[test]
fn an_environment_is_evaluated_against_the_thresholds() {
    let text = std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/examples/interference-env/l1-mixed.toml"
    ))
    .unwrap();
    let env: Environment = toml::from_str(&text).unwrap();
    let e = evaluate(&env).unwrap();
    assert_eq!(e.label, "MODELLED");
    // CW at -158 dBW against -150.5 dBW: 7.5 dB below.
    assert_eq!(e.continuous[0].margin_db, Some(7.5));
    // -150 dB(W/MHz) over 2 MHz is -146.99 dBW against about -137.49 dBW.
    let w = &e.continuous[1];
    assert!((w.power_dbw - (-146.99)).abs() < 0.01);
    assert!(
        (w.margin_db.unwrap() - 9.5).abs() < 0.02,
        "{:?}",
        w.margin_db
    );
    // Pulsed: the strong group is above the -135 dBW saturation level and blanked with the
    // 25 µs recovery time: PDC = (3.5 + 25) µs × 2700 Hz.
    let p = e.pulsed.unwrap();
    assert!((p.pdc - 28.5e-6 * 2700.0).abs() < 1e-6);
    // The weak group is below it: R_I = P·dc/(k·T·B).
    let r_i = 10f64.powf(-14.5) * 3.5e-6 * 5400.0 / (BOLTZMANN * 513.0 * 20.46e6);
    assert!((p.r_i - r_i).abs() < 1e-6, "{} {}", p.r_i, r_i);
    let i0 = 10f64.powf(-15.0) / 1e6 / (BOLTZMANN * 513.0);
    let want = (1.0 + i0 + r_i) / (1.0 - p.pdc);
    assert!((p.n0_eff_over_n0 - want).abs() < 1e-5);
}

#[test]
fn bad_environments_are_refused() {
    let mut env = Environment {
        receiver: "nope".into(),
        mode: Mode::Tracking,
        noise_temperature_k: None,
        precorrelation_bw_hz: None,
        n_lim: None,
        blanker_threshold_dbw: None,
        sources: vec![],
    };
    assert!(evaluate(&env).is_err());
    env.receiver = "sbas-cat1-type1".into();
    env.sources = vec![Source::Pulsed {
        name: "p".into(),
        peak_dbw: -100.0,
        pulse_width_s: 1e-6,
        prf_hz: 100.0,
    }];
    assert!(evaluate(&env).is_err(), "pulsed needs the receiver's noise");
    env.sources = vec![Source::Wideband {
        name: "w".into(),
        density_dbw_mhz: -150.0,
        bandwidth_hz: -1.0,
    }];
    assert!(evaluate(&env).is_err());
    let b = baseline("l5-air-nav-1-cdma").unwrap();
    assert!(
        degradation(b, 1e-3, 2000.0, 0.0, None).is_err(),
        "duty cycle above 1"
    );
}

#[test]
fn the_command_line_writes_json() {
    let run = |args: &[&str]| {
        Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .current_dir(env!("CARGO_MANIFEST_DIR"))
            .output()
            .unwrap()
    };
    let o = run(&[
        "interference-env",
        "evaluate",
        "examples/interference-env/l1-mixed.toml",
    ]);
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["label"], "MODELLED");
    let o = run(&[
        "interference-env",
        "degradation",
        "--baseline",
        "l2-sbas-ground-reference",
        "--pulse-width",
        "44e-6",
        "--prf",
        "500",
    ]);
    assert!(o.status.success());
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["ratio_db"], 0.198);
    let o = run(&["interference-env", "thresholds", "--receiver", "a-rnss"]);
    assert!(o.status.success());
    let o = run(&["interference-env", "thresholds", "--bogus"]);
    assert_eq!(o.status.code(), Some(2));
}
