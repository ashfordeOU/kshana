// SPDX-License-Identifier: AGPL-3.0-only
//! `iq::labfit`: the lab fit recovers known parameters from synthetic runs, reports its
//! hold-out error honestly, labels predictions, is deterministic, and runs end to end
//! from a TOML scenario through the `receiver-trust` RINEX reader.
//!
//! References: synthetic runs from known parameters (the recovered values are compared
//! with the generating ones); the closed-form crossing time of a linear ramp; the
//! tracking-loop thresholds of `kshana::tracking_loop::LoopConfig::thresholds` (the loop
//! model must reuse them, not re-derive them). The JammerTest 2024 fixtures carry no
//! C/N0, so the end-to-end check on them is that the run is reported unusable with its
//! log's SHA-256, never fitted.

use kshana::iq::labfit::model::{lock_params, loop_config, simulate_sat, LockParams, ModelKind};
use kshana::iq::labfit::schema::{
    Conditions, FitCfg, Interp, LabFitScenario, LevelKind, LevelPoint, LoopFixedCfg, PredictCfg,
};
use kshana::iq::labfit::synth::{synthesize_timeline, SynthSpec};
use kshana::iq::labfit::{analyse, report, run_toml, LabFitReport, LabRun};
use sha2::{Digest, Sha256};

const NOMINALS: [f64; 6] = [38.0, 41.0, 43.0, 45.0, 47.0, 50.0];

fn sats() -> Vec<(String, f64)> {
    NOMINALS
        .iter()
        .enumerate()
        .map(|(i, &n)| (format!("G{:02}", i + 3), n))
        .collect()
}

/// A ramp up at `up` dB/s to `peak`, a hold, and a ramp down at `down` dB/s ending at
/// the offset (150 s); onset at 20 s.
fn ramp(peak: f64, up: f64, down: f64, doppler: f64) -> Conditions {
    let (onset, offset) = (20.0, 150.0);
    Conditions {
        onset_s: onset,
        offset_s: Some(offset),
        level_kind: LevelKind::Cn0Drop,
        levels: vec![
            LevelPoint {
                t_s: onset,
                level_db: 0.0,
            },
            LevelPoint {
                t_s: onset + peak / up,
                level_db: peak,
            },
            LevelPoint {
                t_s: offset - peak / down,
                level_db: peak,
            },
            LevelPoint {
                t_s: offset,
                level_db: 0.0,
            },
        ],
        interp: Interp::Linear,
        jammer_type: None,
        doppler_rate_hz_per_s: doppler,
        code_slew_chips_per_s: 0.0,
    }
}

fn spec(epoch_s: f64, noise: f64, jitter: f64, seed: u64) -> SynthSpec {
    SynthSpec {
        sats: sats(),
        epoch_s,
        run_end_s: 200.0,
        cn0_noise_db: noise,
        threshold_jitter_db: jitter,
        seed,
    }
}

fn make_runs(
    kind: ModelKind,
    theta: &[f64; 4],
    offset: f64,
    conds: &[Conditions],
    sp: &dyn Fn(u64) -> SynthSpec,
) -> Vec<LabRun> {
    conds
        .iter()
        .enumerate()
        .map(|(i, c)| {
            let tl = synthesize_timeline(
                kind,
                theta,
                &LoopFixedCfg::default(),
                offset,
                c,
                &sp(i as u64 + 1),
            );
            LabRun::from_timeline(&format!("run-{i}"), tl, c.clone())
        })
        .collect()
}

fn ramps(dopplers: &[f64]) -> Vec<Conditions> {
    let rates = [
        (0.5, 1.0),
        (1.0, 0.5),
        (2.0, 2.0),
        (4.0, 1.0),
        (1.5, 3.0),
        (3.0, 1.5),
    ];
    dopplers
        .iter()
        .enumerate()
        .map(|(i, &d)| {
            let (u, w) = rates[i % rates.len()];
            ramp(40.0, u, w, d)
        })
        .collect()
}

fn scenario(bootstrap: usize) -> LabFitScenario {
    LabFitScenario {
        fit: FitCfg {
            bootstrap,
            ..FitCfg::default()
        },
        ..LabFitScenario::default()
    }
}

fn param<'a>(
    r: &'a LabFitReport,
    kind: ModelKind,
    name: &str,
) -> &'a kshana::iq::labfit::fit::ParamEstimate {
    r.models
        .iter()
        .find(|m| m.model == kind)
        .unwrap()
        .params
        .iter()
        .find(|p| p.name == name)
        .unwrap()
}

fn model(r: &LabFitReport, kind: ModelKind) -> &kshana::iq::labfit::fit::ModelFit {
    r.models.iter().find(|m| m.model == kind).unwrap()
}

#[test]
fn forward_model_matches_the_closed_form_crossing_of_a_linear_ramp() {
    // Ramp at 1 dB/s from onset 20 s: nominal 45, threshold 30, offset 2 => crossing when
    // level + 2 = 15, i.e. 13 s after onset; loss after a 1.5 s dwell at 34.5 s.
    let c = ramp(40.0, 1.0, 0.5, 0.0);
    let lp = LockParams {
        drop_cn0_dbhz: 30.0,
        relock_cn0_dbhz: 34.0,
        drop_dwell_s: 1.5,
        relock_dwell_s: 3.0,
    };
    let ev = simulate_sat(&c, 45.0, 2.0, &lp, 200.0);
    assert!((ev.loss_s.unwrap() - 34.5).abs() < 1e-12, "{ev:?}");
    // Down-ramp at 0.5 dB/s ends at 150 s from 40 dB (starts at 70 s). Re-lock when
    // level + 2 <= 45 - 34 = 11 => level 9, reached 18 s before 150 s, at 132 s; +3 s.
    assert!((ev.reacq_s.unwrap() - 135.0).abs() < 1e-12, "{ev:?}");
    // A dwell longer than the time below the threshold means no loss at all.
    let c2 = Conditions {
        levels: vec![LevelPoint {
            t_s: 20.0,
            level_db: 30.0,
        }],
        interp: Interp::Step,
        offset_s: Some(21.0),
        ..c.clone()
    };
    let ev2 = simulate_sat(&c2, 45.0, 0.0, &lp, 200.0);
    assert_eq!(ev2.loss_s, None);
}

#[test]
fn loop_model_reuses_the_tracking_loop_thresholds() {
    let fixed = LoopFixedCfg::default();
    let c = ramp(40.0, 1.0, 1.0, 10.0);
    let lp = lock_params(ModelKind::TrackingLoop, &[12.0, 2.5, 1.0, 2.0], &fixed, &c);
    let th = loop_config(&fixed, 12.0, 2.5).thresholds(10.0, 0.0);
    assert_eq!(lp.drop_cn0_dbhz, th.drop_cn0_dbhz.unwrap());
    assert_eq!(lp.relock_cn0_dbhz, th.relock_cn0_dbhz.unwrap());
    // Dynamics raise the threshold (the 15-degree rule with dynamic stress).
    let lp0 = lock_params(
        ModelKind::TrackingLoop,
        &[12.0, 2.5, 1.0, 2.0],
        &fixed,
        &ramp(40.0, 1.0, 1.0, 0.0),
    );
    assert!(
        lp.drop_cn0_dbhz > lp0.drop_cn0_dbhz + 0.5,
        "{lp:?} vs {lp0:?}"
    );
}

#[test]
fn noise_free_empirical_fit_recovers_its_parameters() {
    let truth = [28.0, 4.0, 1.5, 3.0];
    let runs = make_runs(ModelKind::Empirical, &truth, 2.0, &ramps(&[0.0; 4]), &|s| {
        spec(0.02, 0.0, 0.0, s)
    });
    let r = analyse(&runs, &scenario(0)).unwrap();
    // Noise-free C/N0: the offset is exact up to the optimiser tolerance.
    assert!(
        (r.level_offset.estimate.value - 2.0).abs() < 1e-6,
        "{:?}",
        r.level_offset
    );
    assert!(r.level_offset.rms_db.unwrap() < 1e-6);
    let e = ModelKind::Empirical;
    // Event times are known to within the 0.02 s epoch: thresholds to a few hundredths
    // of a dB, dwells to a few hundredths of a second.
    assert!((param(&r, e, "drop_cn0_dbhz").value - 28.0).abs() < 0.03);
    assert!((param(&r, e, "hysteresis_db").value - 4.0).abs() < 0.05);
    assert!((param(&r, e, "drop_dwell_s").value - 1.5).abs() < 0.03);
    assert!((param(&r, e, "relock_dwell_s").value - 3.0).abs() < 0.05);
    let m = model(&r, e);
    assert!(m.rms_s.unwrap() <= 0.01 + 1e-9, "rms {:?}", m.rms_s);
    assert_eq!(
        (m.loss_missed, m.loss_extra, m.reacq_missed, m.reacq_extra),
        (0, 0, 0, 0)
    );
}

#[test]
fn noise_free_loop_fit_recovers_its_parameters() {
    let truth = [12.0, 2.5, 1.5, 3.0];
    let runs = make_runs(
        ModelKind::TrackingLoop,
        &truth,
        2.0,
        &ramps(&[0.0, 5.0, 10.0, 15.0]),
        &|s| spec(0.02, 0.0, 0.0, s),
    );
    let r = analyse(&runs, &scenario(0)).unwrap();
    let k = ModelKind::TrackingLoop;
    let bw = param(&r, k, "pll_bandwidth_hz").value;
    assert!((bw - 12.0).abs() < 0.1, "bw {bw}");
    assert!((param(&r, k, "pullin_ratio").value - 2.5).abs() < 0.05);
    assert!((param(&r, k, "drop_dwell_s").value - 1.5).abs() < 0.03);
    assert!((param(&r, k, "relock_dwell_s").value - 3.0).abs() < 0.05);
    assert!(model(&r, k).rms_s.unwrap() <= 0.01 + 1e-9);
}

#[test]
fn noisy_runs_recover_parameters_within_the_bootstrap_spread() {
    let truth = [28.0, 4.0, 1.5, 3.0];
    let runs = make_runs(ModelKind::Empirical, &truth, 2.0, &ramps(&[0.0; 6]), &|s| {
        spec(0.1, 0.5, 0.3, s)
    });
    let r = analyse(&runs, &scenario(30)).unwrap();
    let off = &r.level_offset.estimate;
    assert!((off.value - 2.0).abs() < 0.05, "{off:?}");
    let e = ModelKind::Empirical;
    for (name, t, tol) in [
        ("drop_cn0_dbhz", 28.0, 0.4),
        ("hysteresis_db", 4.0, 0.5),
        ("drop_dwell_s", 1.5, 0.5),
        ("relock_dwell_s", 3.0, 0.8),
    ] {
        let p = param(&r, e, name);
        let b = p.bootstrap.expect("bootstrap");
        assert_eq!(b.n, 30);
        assert!(b.sd > 0.0, "{name}: {b:?}");
        assert!((p.value - t).abs() < tol, "{name}: {} vs {t}", p.value);
        assert!(
            (p.value - t).abs() < 4.0 * b.sd + 0.05,
            "{name}: {} vs {t}, {b:?}",
            p.value
        );
        assert!(!p.at_bound, "{name}");
    }
    // Threshold jitter makes the residual non-zero, and it is reported.
    let m = model(&r, e);
    assert!(m.rms_s.unwrap() > 0.05);
    for row in &m.residuals {
        let run = runs.iter().find(|x| x.label == row.run).unwrap();
        assert_eq!(row.sha256, run.sha256);
    }
}

/// Runs generated by the tracking-loop model at Doppler rates 0-15 Hz/s plus one at
/// 40 Hz/s. Leave-one-run-out: the dynamics-blind empirical baseline is good where the
/// held-out run is inside the tested range and poor on the 40 Hz/s run, which the report
/// classes as extrapolation; the loop model carries the dynamics and stays good.
#[test]
fn holdout_error_is_small_in_distribution_and_larger_on_extrapolation() {
    let truth = [12.0, 2.5, 1.5, 3.0];
    let runs = make_runs(
        ModelKind::TrackingLoop,
        &truth,
        0.0,
        &ramps(&[0.0, 0.0, 5.0, 10.0, 15.0, 15.0, 40.0]),
        &|s| spec(0.1, 0.0, 0.0, s),
    );
    let r = analyse(&runs, &scenario(0)).unwrap();
    let emp = model(&r, ModelKind::Empirical).cv.as_ref().unwrap();
    assert_eq!(emp.scheme, "leave-one-run-out");
    assert_eq!(emp.folds, 7);
    let last = emp.holdout.iter().find(|h| h.run == "run-6").unwrap();
    assert_eq!(last.class, "extrapolation");
    assert!((last.extrapolation_distance - 25.0).abs() < 1e-9);
    assert_eq!(last.nearest_training_run, "run-4");
    for h in emp.holdout.iter().filter(|h| h.run != "run-6") {
        assert_eq!(h.class, "interpolation", "{h:?}");
    }
    let (ei, ee) = (
        emp.rms_interpolation_s.unwrap(),
        emp.rms_extrapolation_s.unwrap(),
    );
    // Interpolation folds still train on the 40 Hz/s run, which drags the
    // dynamics-blind thresholds, so its interpolation error is not tiny either.
    assert!(
        ee > 5.0 && ee > 2.5 * ei,
        "empirical interp {ei} extrap {ee}"
    );
    let lp = model(&r, ModelKind::TrackingLoop).cv.as_ref().unwrap();
    let (li, le) = (
        lp.rms_interpolation_s.unwrap(),
        lp.rms_extrapolation_s.unwrap(),
    );
    assert!(li < 0.1 && le < 0.5, "loop interp {li} extrap {le}");
    assert!(le < ee / 4.0 && li < ei / 4.0);
    // The markdown states both numbers.
    let md = report::to_markdown(&r);
    assert!(md.contains("extrapolation"));
}

#[test]
fn predictions_are_labelled_with_the_nearest_tested_condition_and_distance() {
    let truth = [12.0, 2.5, 1.5, 3.0];
    let conds = ramps(&[0.0, 5.0, 10.0, 15.0]);
    let runs = make_runs(ModelKind::TrackingLoop, &truth, 0.0, &conds, &|s| {
        spec(0.05, 0.0, 0.0, s)
    });
    let mut sc = scenario(10);
    let q = |label: &str, peak: f64, doppler: f64| PredictCfg {
        label: label.into(),
        nominal_cn0_dbhz: Some(45.0),
        conditions: ramp(peak, 1.0, 1.0, doppler),
        run_end_s: 200.0,
    };
    sc.predict = vec![
        q("between", 40.0, 6.0),
        q("faster", 40.0, 30.0),
        q("stronger", 50.0, 0.0),
    ];
    let r = analyse(&runs, &sc).unwrap();
    assert_eq!(r.predictions.len(), 6);
    for p in &r.predictions {
        assert_eq!(p.label, "PREDICTION");
        assert!(p.boot_loss_fraction.is_some());
    }
    let get = |q: &str, k: ModelKind| {
        r.predictions
            .iter()
            .find(|p| p.query == q && p.model == k)
            .unwrap()
    };
    let b = get("between", ModelKind::TrackingLoop);
    assert!(b.within_tested_range);
    assert_eq!(b.extrapolation_distance, Some(0.0));
    assert_eq!(b.nearest_tested_run.as_deref(), Some("run-1"));
    assert!((b.nearest_tested_distance.unwrap() - 1.0).abs() < 1e-12);
    let f = get("faster", ModelKind::TrackingLoop);
    assert!(!f.within_tested_range);
    assert!((f.extrapolation_distance.unwrap() - 15.0).abs() < 1e-12);
    assert_eq!(f.nearest_tested_run.as_deref(), Some("run-3"));
    let s = get("stronger", ModelKind::Empirical);
    assert!((s.extrapolation_distance.unwrap() - 10.0).abs() < 1e-12);
    // The in-range loop prediction agrees with the generating model.
    let lpt = lock_params(
        ModelKind::TrackingLoop,
        &truth,
        &LoopFixedCfg::default(),
        &ramp(40.0, 1.0, 1.0, 6.0),
    );
    let ev = simulate_sat(&ramp(40.0, 1.0, 1.0, 6.0), 45.0, 0.0, &lpt, 200.0);
    assert!(
        (b.loss_s.unwrap() - ev.loss_s.unwrap()).abs() < 0.05,
        "{b:?} vs {ev:?}"
    );
    let csv = report::predictions_csv(&r);
    assert_eq!(csv.lines().count(), 7);
    assert!(csv.lines().skip(1).all(|l| l.starts_with("PREDICTION,")));
}

#[test]
fn same_seed_is_bit_identical_and_a_new_seed_changes_only_the_bootstrap() {
    let truth = [28.0, 4.0, 1.5, 3.0];
    let runs = make_runs(ModelKind::Empirical, &truth, 2.0, &ramps(&[0.0; 4]), &|s| {
        spec(0.1, 0.5, 0.3, s)
    });
    let a = report::to_json(&analyse(&runs, &scenario(8)).unwrap());
    let b = report::to_json(&analyse(&runs, &scenario(8)).unwrap());
    assert_eq!(a, b);
    let mut sc = scenario(8);
    sc.fit.seed = 99;
    let c = analyse(&runs, &sc).unwrap();
    let a0 = analyse(&runs, &scenario(8)).unwrap();
    let e = ModelKind::Empirical;
    assert_eq!(
        param(&c, e, "drop_cn0_dbhz").value,
        param(&a0, e, "drop_cn0_dbhz").value
    );
    assert_ne!(
        param(&c, e, "drop_cn0_dbhz").bootstrap,
        param(&a0, e, "drop_cn0_dbhz").bootstrap
    );
    // Same synthesis seed gives the same timeline hash.
    let again = make_runs(ModelKind::Empirical, &truth, 2.0, &ramps(&[0.0; 4]), &|s| {
        spec(0.1, 0.5, 0.3, s)
    });
    assert_eq!(runs[0].sha256, again[0].sha256);
}

/// A stepped test pins a threshold only to the step it falls in: the fit is within one
/// step (2 dB) of the generating value.
#[test]
fn stepped_levels_pin_the_threshold_to_within_a_step() {
    let truth = [28.3, 3.0, 1.0, 2.0];
    let steps = |dt: f64| Conditions {
        onset_s: 20.0,
        offset_s: Some(170.0),
        level_kind: LevelKind::Cn0Drop,
        levels: (0..21)
            .map(|k| LevelPoint {
                t_s: 20.0 + k as f64 * dt,
                level_db: 2.0 * k as f64,
            })
            .collect(),
        interp: Interp::Step,
        jammer_type: None,
        doppler_rate_hz_per_s: 0.0,
        code_slew_chips_per_s: 0.0,
    };
    let runs = make_runs(
        ModelKind::Empirical,
        &truth,
        0.0,
        &[steps(5.0), steps(7.0)],
        &|s| spec(0.1, 0.0, 0.0, s),
    );
    let r = analyse(&runs, &scenario(0)).unwrap();
    let d = param(&r, ModelKind::Empirical, "drop_cn0_dbhz").value;
    assert!((d - 28.3).abs() <= 2.0, "drop {d}");
    assert!((param(&r, ModelKind::Empirical, "drop_dwell_s").value - 1.0).abs() < 0.1);
}

/// J/S levels: the calibration offset is recovered through the inverse of
/// `jamming::effective_cn0_dbhz` (noise-free, so to optimiser tolerance).
#[test]
fn j_over_s_levels_recover_offset_and_thresholds() {
    let truth = [28.0, 4.0, 1.5, 3.0];
    let conds: Vec<Conditions> = [(0.5, 1.0), (1.0, 0.5), (2.0, 2.0)]
        .iter()
        .map(|&(u, w)| Conditions {
            level_kind: LevelKind::JOverS,
            levels: ramp(40.0, u, w, 0.0)
                .levels
                .iter()
                .map(|p| LevelPoint {
                    t_s: p.t_s,
                    level_db: p.level_db + 25.0,
                })
                .collect(),
            ..ramp(40.0, u, w, 0.0)
        })
        .collect();
    let runs = make_runs(ModelKind::Empirical, &truth, -3.0, &conds, &|s| {
        spec(0.02, 0.0, 0.0, s)
    });
    let r = analyse(&runs, &scenario(0)).unwrap();
    assert!(
        (r.level_offset.estimate.value + 3.0).abs() < 1e-6,
        "{:?}",
        r.level_offset
    );
    assert!((param(&r, ModelKind::Empirical, "drop_cn0_dbhz").value - 28.0).abs() < 0.05);
}

// --- end to end: TOML, RINEX through the receiver-trust reader, JammerTest fixture ----

fn rinex_text(tl: &kshana::receiver_trust::Timeline) -> String {
    let mut s = String::new();
    let h = |s: &mut String, body: &str, label: &str| s.push_str(&format!("{body:<60}{label}\n"));
    h(
        &mut s,
        "     3.04           OBSERVATION DATA    G (GPS)",
        "RINEX VERSION / TYPE",
    );
    h(&mut s, "G    1 S1C", "SYS / # / OBS TYPES");
    h(&mut s, "     1.000", "INTERVAL");
    h(
        &mut s,
        "  2024     9    11     0     0    0.0000000     GPS",
        "TIME OF FIRST OBS",
    );
    h(&mut s, "", "END OF HEADER");
    for e in &tl.epochs {
        let (hh, mm, ss) = (
            (e.t_s / 3600.0).floor(),
            ((e.t_s % 3600.0) / 60.0).floor(),
            e.t_s % 60.0,
        );
        s.push_str(&format!(
            "> 2024 09 11 {:02} {:02} {:10.7}  0 {:2}\n",
            hh as u32,
            mm as u32,
            ss,
            e.cn0.len()
        ));
        for c in &e.cn0 {
            s.push_str(&format!("{}{:14.3}  \n", c.sat, c.cn0_dbhz));
        }
    }
    s
}

const JT_OBS: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/spoof_detection_jammertest_oracle/jt2024_2_1_1.obs"
);

#[test]
fn toml_scenario_runs_end_to_end_through_the_rinex_reader() {
    use kshana::iq::labfit::schema::RunCfg;
    use kshana::receiver_trust::scenario::{FileSource, LogCfg};
    use kshana::receiver_trust::LogFormat;
    let truth = [28.0, 4.0, 1.5, 3.0];
    let mut sc = scenario(5);
    sc.kind = Some("iq-labfit".into());
    sc.name = Some("synthetic RINEX bench".into());
    for (i, c) in ramps(&[0.0; 3]).into_iter().enumerate() {
        let tl = synthesize_timeline(
            ModelKind::Empirical,
            &truth,
            &LoopFixedCfg::default(),
            2.0,
            &c,
            &spec(1.0, 0.0, 0.0, i as u64),
        );
        sc.runs.push(RunCfg {
            label: format!("rinex-{i}"),
            log: LogCfg {
                format: LogFormat::Rinex,
                source: FileSource {
                    text: Some(rinex_text(&tl)),
                    ..FileSource::default()
                },
                nav: None,
            },
            conditions: c,
        });
    }
    // The real JammerTest log: pseudoranges only, so no C/N0 to fit.
    sc.runs.push(RunCfg {
        label: "jammertest-2.1.1".into(),
        log: LogCfg {
            format: LogFormat::Rinex,
            source: FileSource {
                path: Some(JT_OBS.into()),
                ..FileSource::default()
            },
            nav: None,
        },
        conditions: Conditions {
            onset_s: 176.0,
            ..ramp(40.0, 1.0, 1.0, 0.0)
        },
    });
    let src = toml::to_string(&sc).expect("serialise");
    let out = run_toml(&src).expect("run");
    let r = &out.report;
    assert_eq!(r.label, "MODELLED");
    assert_eq!(r.runs.len(), 4);
    for run in &r.runs[..3] {
        assert!(run.used_in_fit, "{run:?}");
        assert_eq!(run.source, "rinex log");
        assert_eq!(run.observation.sats.len(), 6);
        // The hash is of the log bytes exactly as given.
        let i: usize = run.label[6..].parse().unwrap();
        let text = sc.runs[i].log.source.text.as_ref().unwrap();
        assert_eq!(run.sha256, format!("{:x}", Sha256::digest(text.as_bytes())));
    }
    let jt = &r.runs[3];
    assert!(!jt.used_in_fit);
    assert!(
        jt.note
            .as_deref()
            .unwrap()
            .contains("no per-satellite C/N0"),
        "{:?}",
        jt.note
    );
    let bytes = std::fs::read(JT_OBS).unwrap();
    assert_eq!(jt.sha256, format!("{:x}", Sha256::digest(&bytes)));
    assert!(out.markdown.contains(&jt.sha256));
    // 1 s epochs: thresholds within a few tenths, offset close (C/N0 printed to 1e-3).
    assert!((r.level_offset.estimate.value - 2.0).abs() < 0.01);
    assert!((param(r, ModelKind::Empirical, "drop_cn0_dbhz").value - 28.0).abs() < 0.5);
    // Every residual row traces to a run hash; JSON parses.
    let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
    assert_eq!(v["kind"], "iq-labfit");
    let hashes: Vec<&str> = r.runs.iter().map(|x| x.sha256.as_str()).collect();
    for line in out.residuals_csv.lines().skip(1) {
        assert!(hashes.contains(&line.split(',').nth(2).unwrap()));
    }
    // A scenario of only the JammerTest run is refused with its hash, not fitted.
    let mut only = sc.clone();
    only.runs.drain(..3);
    let err = run_toml(&toml::to_string(&only).unwrap()).unwrap_err();
    assert!(
        err.contains(&jt.sha256) && err.contains("no per-satellite C/N0"),
        "{err}"
    );
}
