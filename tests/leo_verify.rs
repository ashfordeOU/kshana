// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana leo-verify`: the LEO-PNT verification tools (src/leo_verify/, docs/LEO-VERIFY.md).

use kshana::leo_verify::{
    burst, cost, doppler_integrity, indoor, jam_claim, rain, rtk_ar, run_json, tdev,
};
use serde_json::Value;

fn example(name: &str) -> String {
    let p = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("examples/leo-verify")
        .join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

fn report(part: &str, file: &str) -> Value {
    let out = run_json(part, &example(file)).unwrap_or_else(|e| panic!("{part}: {e}"));
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["part"], part);
    assert_eq!(v["label"], "MODELLED");
    v["result"].clone()
}

#[test]
fn every_example_runs_and_is_labelled_modelled() {
    for (part, file) in [
        ("burst-timing", "burst-timing.json"),
        ("holdover-tdev", "holdover-tdev.json"),
        ("cost", "cost.json"),
        ("indoor", "indoor.json"),
        ("rain-fade", "rain-fade.json"),
        ("rtk-ar", "rtk-ar.json"),
        ("jam-claim", "jam-claim.json"),
        ("doppler-integrity", "doppler-integrity-arctic.json"),
    ] {
        report(part, file);
    }
    assert!(run_json("no-such-part", "{}").is_err());
    assert!(run_json("cost", "{").is_err());
}

#[test]
fn bursts_more_often_give_a_smaller_time_error() {
    let base: burst::BurstInput = serde_json::from_str(&example("burst-timing.json")).unwrap();
    let mut dense = base.clone();
    dense.outages.clear();
    dense.bursts.as_mut().unwrap().period_s = 120.0;
    let mut sparse = dense.clone();
    sparse.bursts.as_mut().unwrap().period_s = 1800.0;
    let d = burst::run(&dense).unwrap();
    let s = burst::run(&sparse).unwrap();
    assert!(d.predicted_max_sigma_ns < s.predicted_max_sigma_ns);
    assert!(d.median_rms_ns < s.median_rms_ns);
    assert!(d.longest_gap_s < s.longest_gap_s);
    // The filter is consistent with the simulated clock.
    assert!(
        (0.7..1.4).contains(&d.median_normalised_rms),
        "{}",
        d.median_normalised_rms
    );
    assert!(!d.tdev_ns.is_empty() && !d.mtie_ns.is_empty());
    // The gap budget falls as the threshold tightens.
    let mut tight = dense.clone();
    tight.threshold_ns = 200.0;
    assert!(burst::run(&tight).unwrap().longest_gap_allowed_s < d.longest_gap_allowed_s);
}

#[test]
fn an_outage_shows_in_the_gap_and_the_bound() {
    let with: burst::BurstInput = serde_json::from_str(&example("burst-timing.json")).unwrap();
    let mut without = with.clone();
    without.outages.clear();
    let a = burst::run(&with).unwrap();
    let b = burst::run(&without).unwrap();
    assert!(a.longest_gap_s > b.longest_gap_s);
    assert!(a.predicted_max_sigma_ns > b.predicted_max_sigma_ns);
}

#[test]
fn tdev_prediction_matches_a_simulated_record_of_the_same_model() {
    // Backlog acceptance: the TDEV prediction matches the analytic model. Every simulated point
    // (averaging factor four and more, twelve intervals of record) within 20 %.
    let inp: tdev::TdevInput = serde_json::from_str(&example("holdover-tdev.json")).unwrap();
    for clock in ["ocxo", "rubidium", "csac"] {
        let mut i = inp.clone();
        i.clock = kshana::oscillator::ClockRef::Preset(clock.into());
        i.taus_s = vec![4.0, 16.0, 64.0, 256.0, 1024.0, 4096.0];
        i.include_drift = false;
        let r = tdev::run(&i).unwrap();
        let worst = r.simulated_worst_deviation.expect("simulated");
        assert!(worst < 0.2, "{clock}: worst deviation {worst}");
        assert!(r.rows.iter().all(|row| row.simulated_ratio.is_some()));
    }
}

#[test]
fn tdev_terms_add_in_quadrature_and_drift_grows_as_tau_squared() {
    let inp: tdev::TdevInput = serde_json::from_str(&example("holdover-tdev.json")).unwrap();
    let r = tdev::run(&inp).unwrap();
    for row in &r.rows {
        let sum = (row.white_fm_ns.powi(2)
            + row.flicker_fm_ns.powi(2)
            + row.random_walk_fm_ns.powi(2)
            + row.drift_ns.powi(2))
        .sqrt();
        assert!((sum - row.tdev_ns).abs() <= 1e-9 * row.tdev_ns.max(1.0));
    }
    let a = tdev::tdev_terms_s(0.0, 0.0, 0.0, 1e-15, 10.0)[3];
    let b = tdev::tdev_terms_s(0.0, 0.0, 0.0, 1e-15, 100.0)[3];
    assert!((b / a - 100.0).abs() < 1e-9);
    assert!(r.mask_check.is_some());
}

#[test]
fn cost_report_is_unranked_and_marks_dominated_options() {
    let r = cost::run(&serde_json::from_str(&example("cost.json")).unwrap()).unwrap();
    let by = |id: &str| r.options.iter().find(|o| o.id == id).unwrap().clone();
    // A rubidium clock holds longer than an OCXO.
    assert!(by("gnss-rubidium").clock_only_holdover_h > by("gnss-ocxo").clock_only_holdover_h);
    // LEO aiding raises the probability of holding over the clock alone.
    assert!(by("leo-ocxo").mean_probability_holds > by("gnss-ocxo").mean_probability_holds);
    assert_eq!(by("leo-ocxo").leo_bound_holds, Some(true));
    // Order is the input order; at least one option is non-dominated.
    let ids: Vec<&str> = r.options.iter().map(|o| o.id.as_str()).collect();
    assert_eq!(ids, ["gnss-ocxo", "gnss-rubidium", "gnss-csac", "leo-ocxo"]);
    assert!(r.options.iter().any(|o| o.non_dominated));
    // A dearer option that holds less is dominated.
    for a in &r.options {
        for b in &r.options {
            if b.cost_of_ownership < a.cost_of_ownership
                && b.mean_probability_holds > a.mean_probability_holds
            {
                assert!(!a.non_dominated, "{} is dominated by {}", a.id, b.id);
            }
        }
    }
}

#[test]
fn indoor_margin_is_outdoor_minus_loss_minus_threshold() {
    let inp: indoor::IndoorInput = serde_json::from_str(&example("indoor.json")).unwrap();
    let r = indoor::run(&inp).unwrap();
    for row in &r.rows {
        let s = inp.signals.iter().find(|s| s.id == row.signal).unwrap();
        assert!(
            (row.margin_db - (s.outdoor_cn0_dbhz - row.loss_db - s.threshold_dbhz)).abs() < 1e-9
        );
    }
    // Thermally-efficient buildings lose more than traditional ones at the same probability.
    let loss = |class: &str| {
        r.rows
            .iter()
            .find(|x| x.class == class && x.signal == "gnss-l1")
            .unwrap()
            .loss_db
    };
    assert!(loss("thermally-efficient") > loss("traditional"));
    assert!(indoor::run(&indoor::IndoorInput {
        classes: vec!["glass".into()],
        ..inp
    })
    .is_err());
}

#[test]
fn rain_fade_inversion_reproduces_an_itu_validation_example() {
    // ITU-R SG3 validation example (tests/fixtures/leo_link/p618_14_rain_attenuation.csv): London,
    // 14.25 GHz, elevation 31.076991 deg, tau 0, A(0.1 %) = 2.185847 dB. A margin of that attenuation
    // must give an outage of 0.1 % of the year.
    let inp = rain::RainInput {
        lat_deg: 51.5,
        station_height_km: 0.031383,
        rain_height_km: 2.452733,
        r001_mm_h: 26.480520,
        polarisation_tilt_deg: 0.0,
        bands: vec![rain::RainBand {
            id: "ku".into(),
            f_ghz: 14.25,
            margin_db: 2.185847,
        }],
        elevations_deg: vec![31.076991],
        percentages: vec![0.1],
    };
    let r = rain::run(&inp).unwrap();
    let row = &r.rows[0];
    assert!((row.exceedance[0].a_db - 2.185847).abs() < 1e-4);
    assert_eq!(row.bound, "exact");
    assert!(
        (row.outage_percent - 0.1).abs() < 1e-4,
        "{}",
        row.outage_percent
    );
    // Higher frequency, lower availability at the same margin and elevation.
    let ex = rain::run(&serde_json::from_str(&example("rain-fade.json")).unwrap()).unwrap();
    let at = |band: &str| {
        ex.rows
            .iter()
            .find(|x| x.band == band && x.elevation_deg == 10.0)
            .unwrap()
            .exceedance[1]
            .a_db
    };
    assert!(at("l-band") < at("c-band") && at("c-band") < at("ku-band"));
}

#[test]
fn ambiguity_resolution_cascade_behaves() {
    let inp: rtk_ar::ArInput = serde_json::from_str(&example("rtk-ar.json")).unwrap();
    let r = rtk_ar::run(&inp).unwrap();
    let gps = &r.cases[0];
    assert!((gps.stages[0].wavelength_m - 5.861).abs() < 1e-3);
    assert!((gps.stages[1].wavelength_m - 0.8619).abs() < 1e-4);
    // The extra-wide lane against the code is free of first-order ionosphere.
    assert!(gps.stages[0].bias_cycles.abs() < 1e-12);
    // More epochs, more success; more ionosphere, less.
    let mut more = inp.clone();
    more.epochs = 10;
    assert!(rtk_ar::run(&more).unwrap().cases[0].success > gps.success);
    let mut iono = inp.clone();
    iono.dd_iono_m = 0.1;
    assert!(rtk_ar::run(&iono).unwrap().cases[0].success < gps.success);
    // Adding a stage can only multiply in a factor at most one.
    assert!(r.cases[1].success <= gps.success + 1e-12);
    let mut bad = inp.clone();
    bad.cases[0].stages[0] = vec!["L9".into()];
    assert!(rtk_ar::run(&bad).is_err());
}

#[test]
fn a_stated_power_advantage_shrinks_the_denial_radius_by_its_amplitude_ratio() {
    let r = jam_claim::run(&serde_json::from_str(&example("jam-claim.json")).unwrap()).unwrap();
    let leo = &r.signals[1];
    // 30 dB more received power with the same chip rate and threshold: 30 dB more jammer power
    // tolerated, a radius 10^(-30/20) of the reference's.
    assert!((leo.power_advantage_db - 30.0).abs() < 1e-9);
    assert!((leo.tolerance_advantage_db.unwrap() - 30.0).abs() < 0.2);
    assert!((leo.radius_ratio.unwrap() - 10f64.powf(-1.5)).abs() < 1e-3);
    // Ten dB more jammer EIRP, a radius 10^(1/2) larger.
    let g = &r.signals[0].radii;
    assert!((g[1].radius_m.unwrap() / g[0].radius_m.unwrap() - 10f64.sqrt()).abs() < 1e-6);
    assert_eq!(leo.model_reaches_stated, Some(false));
}

#[test]
fn doppler_integrity_bounds_the_arctic_fix_and_one_satellite_cannot_protect_itself() {
    let inp: doppler_integrity::DopplerIntegrityInput =
        serde_json::from_str(&example("doppler-integrity-arctic.json")).unwrap();
    let r = doppler_integrity::run(&inp).unwrap();
    assert!(r.windows.iter().all(|w| w.satellites >= 2));
    for w in &r.windows {
        let hpl = w.hpl_m.expect("bounded");
        let s = w.sigma_enu_m.unwrap();
        // The protection level is larger than the formal one-sigma.
        assert!(hpl > s[0].hypot(s[1]));
    }
    // A large fault is detected.
    let mut big = inp.clone();
    big.fault.as_mut().unwrap().bias_mps = 5.0;
    let rb = doppler_integrity::run(&big).unwrap();
    assert!(rb.windows.iter().all(|w| w
        .fault
        .as_ref()
        .is_some_and(|f| f.detected && f.stanford.is_none())));
    // A single satellite: its bias is absorbed by the clock drift, so no finite level.
    let mut one = inp.clone();
    one.shells = vec![doppler_integrity::ShellCfg {
        altitude_km: 550.0,
        inclination_deg: 90.0,
        planes: 1,
        sats_per_plane: 1,
        phasing: 0.0,
    }];
    one.site.lat_deg = 0.0;
    one.site.lon_deg = 0.0;
    one.starts_s = vec![0.0];
    one.window_s = 600.0;
    one.step_s = 5.0;
    one.mask_deg = 5.0;
    one.fault = None;
    let r1 = doppler_integrity::run(&one).unwrap();
    let w = &r1.windows[0];
    assert_eq!(w.satellites, 1);
    assert!(w.hpl_m.is_none() && !w.available);
}

#[test]
fn the_cli_prints_usage_on_a_bad_call() {
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["leo-verify", "nothing"])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&out.stderr).contains("leo-verify"));
    let ok = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args([
            "leo-verify",
            "rtk-ar",
            concat!(
                env!("CARGO_MANIFEST_DIR"),
                "/examples/leo-verify/rtk-ar.json"
            ),
        ])
        .output()
        .unwrap();
    assert!(ok.status.success());
}
