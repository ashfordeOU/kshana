// SPDX-License-Identifier: AGPL-3.0-only
//! M010 round 3 oracle (matrix row "Clock-aided chi-square, RAIM, AGC, SQM fused per-epoch
//! security FoM", the spoofing-detection row): the round-2 monitors against the LOGGED
//! JammerTest 2024 onsets, with the clock monitor's noise levels taken from a measured
//! receiver-TCXO device card fitted on OTHER sessions of the same receiver instead of a 60 s
//! per-onset calibration raised to the TCXO class floor.
//!
//! PRE-REGISTRATION (written 2026-10-02, committed and pushed before the training sessions were
//! extracted or any card was fitted; engine commit 52a931b2).
//!
//! WHY. Round 2 (`tests/spoof_detection_jammertest_log_oracle.rs`, pre-registered 6a66994b)
//! disagreed at 6 of 10 logged onsets; its remaining clock false alarms (1 at 2.1.4, 85 at
//! 2.3.15) are attributed to the receiver TCXO's red noise, which a 60 s calibration cannot see
//! and the synthesised class floor does not represent. Disclosed: every round-1 and round-2
//! result was seen before this pre-registration; the scored slices are the round-2 slices.
//!
//! CHANGE (the only one). Noise levels `(r, q_wf, q_rw, q_drift)` of
//! `spoof_monitors::ClockAidedMonitor` = `clock_library::pooled_hadamard_noise` over ALL the
//! receiver training records (the C7 records of `tests/clock_library_device_cards_oracle.rs`:
//! every `Jamming/stationary/` and `Meaconing/stationary/` session of the dataset, epochs
//! within 60 s of any logged transmission on that date removed, split at gaps over 10 s,
//! records under 120 s dropped). No class floor, no per-onset noise fit. The 60 s calibration
//! samples still initialise the monitor's state through `calibrate`, as in round 2. Everything
//! else is the round-2 pipeline (`jammertest_spoof_oracle_support::run_onset` pass 1; the
//! non-latching three-state monitor; an epoch alarmed by RAIM or a solve failure does not update
//! the clock; k = `security::SPOOF_DETECT_K` = 5).
//!
//! ORACLE (Measured): the official JammerTest 2024 log onsets (`onsets_log.tsv` of the M010
//! fixture), unchanged.
//!
//! TOLERANCE (the round-1 plan's, unchanged): at every evaluable onset (as round 2: at least
//! 15 s of pre-onset window after the 60 s calibration, at least 10 calibration samples, a
//! card), the first alarm within 10 s after the logged onset and zero alarms in the pre-onset
//! window. PROMOTE only if all evaluable onsets agree and at least eight are evaluable. With
//! fewer than 3600 training epochs the comparison is BLOCKED and nothing is scored.
//!
//! VERDICT (2026-10-02, after pre-registration commit 2ec76864): BLOCKED, nothing scored, the
//! row stays MODELLED. The dataset's stationary sessions outside the scored ones are four attack
//! recordings of 3 to 17 minutes (1.6.4 on 2024-09-09; 3.1.1/3.1.2, 3.2.7, 3.2.8 on 2024-09-10);
//! removing every epoch within 60 s of a logged transmission keeps 364 epochs, and the
//! receiver-clock extraction leaves 167 in two records, against the 3600 minimum. Unblocking
//! needs a longer quiet-sky record of the same receiver (see the D9 rows file).

#[path = "jammertest_spoof_oracle_support/mod.rs"]
mod jt;

#[path = "clock_library_support/mod.rs"]
mod cl;

use kshana::clock_library::pooled_hadamard_noise;
use kshana::security::SPOOF_DETECT_K;
use kshana::spoof_monitors::{ClockAidedMonitor, ClockNoiseEstimate};

/// The receiver card's monitor noise, or `None` when BLOCKED.
fn card_noise() -> Option<ClockNoiseEstimate> {
    let recs = cl::tcxo_training()?;
    let n: usize = recs.iter().map(|r| r.valid()).sum();
    if n < cl::MIN_TRAIN_EPOCHS {
        println!("BLOCKED: {n} training epochs");
        return None;
    }
    let (noise, curve) = pooled_hadamard_noise(&recs)?;
    println!(
        "card noise from {} records, {n} epochs: {noise:?}",
        recs.len()
    );
    for (tau, hv, c) in curve {
        println!("    HDEV tau {tau:>6} s  {:.4e}  terms {c}", hv.sqrt());
    }
    Some(noise)
}

/// Round 2 with the card's noise levels (see the header).
fn run_onset_card(o: &jt::Onset, noise: ClockNoiseEstimate) -> jt::OnsetResult {
    let mut r = jt::run_onset(o);
    for e in r.epochs.iter_mut() {
        e.clock_innov_s = None;
        if e.alarm == Some(jt::AlarmKind::Clock) {
            e.alarm = None;
        }
    }
    let cal: Vec<(f64, f64)> = r
        .epochs
        .iter()
        .filter(|e| e.t >= r.cal_start && e.t < r.cal_end)
        .filter_map(|e| e.clock_s.map(|c| (e.t, c)))
        .collect();
    r.q_wf = noise.q_wf;
    r.q_rw = noise.q_rw;
    r.r = noise.r;
    r.bound_ns = f64::NAN;
    r.sigma_mon_s = f64::NAN;
    let mut m = ClockAidedMonitor::new(noise, SPOOF_DETECT_K);
    for (t, c) in &cal {
        m.calibrate(*t, *c);
    }
    for e in r.epochs.iter_mut() {
        if e.t < r.cal_end {
            continue;
        }
        match e.clock_s {
            Some(c) => {
                let st = m.step(e.t, c, e.alarm.is_some());
                if r.bound_ns.is_nan() {
                    r.sigma_mon_s = st.sigma_s;
                    r.bound_ns = SPOOF_DETECT_K * st.sigma_s * 1e9;
                }
                e.clock_innov_s = Some(st.innovation_s);
                if st.alarm && e.alarm.is_none() {
                    e.alarm = Some(jt::AlarmKind::Clock);
                }
            }
            None => m.coast(e.t),
        }
    }
    r.evaluable = (r.onset - r.cal_end) >= jt::MIN_PRE_S
        && cal.len() >= jt::PRED_MIN
        && r.bound_ns.is_finite();
    r.pre_onset_alarms = r
        .epochs
        .iter()
        .filter(|e| e.t >= r.cal_end && e.t < r.onset)
        .filter_map(|e| e.alarm.map(|k| (e.t, k)))
        .collect();
    r.detection = r
        .epochs
        .iter()
        .filter(|e| e.t >= r.onset && e.t <= r.horizon_end)
        .find_map(|e| e.alarm.map(|k| (e.t, k)));
    r
}

/// The comparison is BLOCKED by the training-epoch minimum (pinned 2026-10-02).
#[test]
fn round_3_is_blocked_by_the_training_minimum() {
    assert!(card_noise().is_none());
}

#[test]
#[ignore = "pre-registered; BLOCKED 2026-10-02: 167 receiver training epochs against the 3600 minimum, nothing scored"]
fn card_monitor_detects_the_logged_onsets_within_10_s_without_false_alarms() {
    let noise = card_noise().expect("receiver card BLOCKED");
    let mut evaluated = 0;
    let mut failures = Vec::new();
    for o in jt::onsets_from("onsets_log.tsv") {
        let r = run_onset_card(&o, noise);
        let lat = r.detection.map(|(t, _)| t - r.onset);
        println!(
            "{:<7} evaluable={} bound={:.1} ns pre_alarms={} first_pre={:?} detection={:?} latency={:?}",
            r.id,
            r.evaluable,
            r.bound_ns,
            r.pre_onset_alarms.len(),
            r.pre_onset_alarms.first().map(|(t, k)| (t - r.onset, *k)),
            r.detection.map(|(_, k)| k),
            lat
        );
        if !r.evaluable {
            continue;
        }
        evaluated += 1;
        if !(r.pre_onset_alarms.is_empty()
            && lat.is_some_and(|l| (0.0..=jt::DETECT_TOL_S).contains(&l)))
        {
            failures.push(r.id.clone());
        }
    }
    assert!(evaluated >= 8, "only {evaluated} evaluable onsets");
    assert!(
        failures.is_empty(),
        "onsets outside the tolerance: {failures:?}"
    );
}
