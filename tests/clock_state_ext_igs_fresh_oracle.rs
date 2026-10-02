// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Onboard clock state estimation" (row 42, M002), round 2: the
//! extended clock filter `clock_state::ClockStateExt` (phase, frequency and drift; a
//! flicker frequency-modulation (flicker-FM) bank of Gauss-Markov states; once-, twice-,
//! three- and four-per-revolution periodic phase terms), tuned on the first half of a FRESH
//! window of real onboard atomic-clock records and scored for consistency on the held-out
//! second half.
//!
//! WHY A NEW COMPARISON. The round-1 comparison (`tests/clock_state_igs_holdout_oracle.rs`,
//! IGS clocks 2025-08-17 to 2025-08-30) found the three-state white-FM plus random-walk-FM
//! filter over-confident at one hour on 9 of 11 satellites. The August data were then used,
//! openly, to develop this model (on that window, with the tuning below, 9 of 11 satellites
//! met all three criteria; G06 and G30 did not), so August can no longer be a held-out test.
//! This pre-registration fixes the model, the tuning rule and the criteria before any data of
//! the new window are fetched.
//!
//! QUANTITY. Per satellite, the consistency of the filter's own uncertainty with its real
//! one-step and one-hour prediction errors.
//!
//! INPUTS. International GNSS Service (IGS) final 30 s combined satellite clocks,
//! IGS0OPSFIN_2025244..257 (2025-09-01 to 2025-09-14), fetched by
//! `tests/fixtures/clock_state_ext_igs_fresh_oracle/generate.py` from the BKG mirror
//! https://igs.bkg.bund.de/root_ftp/IGS/products/ (IGS products: open, with attribution);
//! GPS Block IIF PRNs G03 G06 G08 G09 G10 G24 G25 G26 G27 G30 G32 (SVN 62 and 64-73 for
//! the whole window per the IGS satellite metadata SINEX; the active frequency standard is
//! not given by the IGS files and is not claimed). Epochs at whole multiples of 300 s; gaps
//! are coasted.
//!
//! ORACLE (Measured): those real clock records; the held-out second half (days 7-14) is
//! never seen by the tuning. The tuning uses scipy 1.18.1 (`optimize.minimize`,
//! BSD-3-Clause) on the first half only.
//!
//! MODEL (fixed now). `ClockModelExt { q_wf, q_rw, q_drift: 0, flicker:
//! FlickerFmBank::log_spaced(h_-1, 1e2 s, 1e6 s, 2 per decade) (9 states), harmonics:
//! per_revolution(43 082.05 s, 4), q_harmonic: q_h }`. Initial state [first measurement, 0,
//! ...]; initial covariance (1e-6 s)^2, (1e-9)^2, (1e-16 /s)^2, the flicker states at their
//! stationary variance, (1e-8 s)^2 on every periodic component.
//!
//! TUNING (fixed now). theta = log10(R, q_wf, h_-1, q_rw, q_h) minimising the Gaussian
//! innovation negative log-likelihood over first-half epochs with t >= 1 day, Nelder-Mead
//! from (-24, -24, -29, -33, -26), xatol 0.02, fatol 0.05, at most 1500 evaluations (the
//! generator; its numpy copy of the filter only tunes, the scored run is Kshana's).
//!
//! CRITERIA AND TOLERANCE (unchanged from the round-1 pre-registration, B3 with its M002
//! amendment). Warm-up over days 0-7, scored on days 7-14. Per satellite: (a) one-step
//! nu^2/S <= 3.841 on >= 90 % of epochs; (b) the 1 h prediction error squared over
//! (H P H^T + R) <= 3.841 on >= 90 % of epochs whose target epoch exists; (c) the mean of
//! sums of three consecutive non-overlapping one-step normalised innovations in [2.4, 3.6].
//! PASS only if (a), (b) and (c) hold on every satellite. A PRN with no records in a half is
//! reported and counts as a failure.
//!
//! VERDICT (first and only run, 2026-10-02): DISAGREES, the row stays MODELLED. (a) one-step
//! 0.948 to 0.988 and (b) one hour 0.907 to 0.996 hold on all 11 satellites (round 1: (b)
//! failed on 9 of 11). (c) fails on two: G24 0.964 and G30 1.929, both UNDER-confident; the
//! others lie in 2.637 to 3.485. Both satellites' first halves carry bursts of large phase
//! second differences (G24 around day 1, G30 at the day-6 and day-7 file boundaries) that the
//! likelihood tuning absorbs as extra noise (G24 R = 10^-21.5 s^2). The strict test stays
//! ignored; `extended_filter_on_fresh_igs_clocks_finding` pins the outcome.

use kshana::clock_state::{ClockModelExt, ClockStateExt, FlickerFmBank};

const FIXTURE: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/clock_state_ext_igs_fresh_oracle/clocks.txt"
);
const STEP: f64 = 300.0;
const UNIT: f64 = 1e-13;
const HALF_S: f64 = 7.0 * 86_400.0;
const CHI2_1_95: f64 = 3.841;
const ONE_HOUR: f64 = 3_600.0;
const T_REV: f64 = 43_082.05;
const PRNS: [&str; 11] = [
    "G03", "G06", "G08", "G09", "G10", "G24", "G25", "G26", "G27", "G30", "G32",
];

struct Sat {
    prn: String,
    r: f64,
    model: ClockModelExt,
    obs: Vec<(f64, f64)>,
}

fn sats(text: &str) -> Vec<Sat> {
    let mut out: Vec<Sat> = Vec::new();
    let mut acc: i64 = 0;
    for line in text.lines().filter(|l| !l.starts_with('#')) {
        if let Some(hdr) = line.strip_prefix('@') {
            let prn = hdr.split_whitespace().next().unwrap().to_string();
            let kv = |k: &str| -> f64 {
                hdr.split_whitespace()
                    .find_map(|f| f.strip_prefix(&format!("{k}=")))
                    .unwrap()
                    .parse()
                    .unwrap()
            };
            let model = ClockModelExt {
                q_wf: kv("q_wf"),
                q_rw: kv("q_rw"),
                q_drift: 0.0,
                flicker: Some(FlickerFmBank::log_spaced(kv("h_m1"), 1e2, 1e6, 2)),
                harmonics: ClockModelExt::per_revolution(T_REV, 4),
                q_harmonic: kv("q_h"),
            };
            out.push(Sat {
                prn,
                r: kv("R"),
                model,
                obs: Vec::new(),
            });
            acc = 0;
            continue;
        }
        let mut f = line.split_whitespace();
        let k: i64 = f.next().unwrap().parse().unwrap();
        let d: i64 = f.next().unwrap().parse().unwrap();
        acc += d;
        out.last_mut()
            .unwrap()
            .obs
            .push((k as f64 * STEP, acc as f64 * UNIT));
    }
    out
}

struct Score {
    one_step_frac: f64,
    one_hour_frac: f64,
    triple_nis_mean: f64,
    n_one_step: usize,
    n_one_hour: usize,
    first_half_nll: f64,
}

fn score(s: &Sat) -> Score {
    let mut f = ClockStateExt::new(s.model.clone()).with_initial_cov(1e-12, 1e-18, 1e-32, 1e-16);
    f.x[0] = s.obs[0].1;
    let at: std::collections::HashMap<i64, f64> = s
        .obs
        .iter()
        .map(|&(t, z)| ((t / STEP).round() as i64, z))
        .collect();
    let mut t_prev = s.obs[0].0;
    let (mut in1, mut n1, mut inh, mut nh) = (0usize, 0usize, 0usize, 0usize);
    let mut nis = Vec::new();
    let mut nll = 0.0;
    for &(t, z) in &s.obs[1..] {
        f.predict(t - t_prev);
        t_prev = t;
        let (nu, s_pred) = f.update_phase(z, s.r);
        let held_out = t >= HALF_S;
        if !held_out && t >= 86_400.0 {
            nll += s_pred.ln() + nu * nu / s_pred;
        }
        if held_out {
            let q = nu * nu / s_pred;
            n1 += 1;
            if q <= CHI2_1_95 {
                in1 += 1;
            }
            nis.push(q);
            let target = ((t + ONE_HOUR) / STEP).round() as i64;
            if let Some(&z_h) = at.get(&target) {
                let mut g = f.clone();
                g.predict(ONE_HOUR);
                let e = z_h - g.predicted_phase();
                nh += 1;
                if e * e / (g.predicted_phase_var() + s.r) <= CHI2_1_95 {
                    inh += 1;
                }
            }
        }
    }
    let triples: Vec<f64> = nis.chunks_exact(3).map(|c| c.iter().sum()).collect();
    Score {
        one_step_frac: in1 as f64 / n1.max(1) as f64,
        one_hour_frac: inh as f64 / nh.max(1) as f64,
        triple_nis_mean: triples.iter().sum::<f64>() / triples.len().max(1) as f64,
        n_one_step: n1,
        n_one_hour: nh,
        first_half_nll: nll,
    }
}

/// Every failed criterion, as "<prn> <criterion> <value>".
fn failures() -> Vec<String> {
    let text = std::fs::read_to_string(FIXTURE).expect("fixture clocks.txt (run generate.py)");
    let all = sats(&text);
    let mut out = Vec::new();
    for prn in PRNS {
        let Some(s) = all.iter().find(|s| s.prn == prn) else {
            out.push(format!("{prn} missing"));
            continue;
        };
        let sc = score(s);
        println!(
            "{}: one-step {:.3} (n {}), 1 h {:.3} (n {}), triple-NIS mean {:.3}, first-half NLL {:.4}",
            s.prn,
            sc.one_step_frac,
            sc.n_one_step,
            sc.one_hour_frac,
            sc.n_one_hour,
            sc.triple_nis_mean,
            sc.first_half_nll
        );
        if sc.n_one_step == 0 || sc.n_one_hour == 0 {
            out.push(format!("{prn} empty-second-half"));
        }
        if sc.one_step_frac < 0.90 {
            out.push(format!("{prn} one-step {:.3}", sc.one_step_frac));
        }
        if sc.one_hour_frac < 0.90 {
            out.push(format!("{prn} 1h {:.3}", sc.one_hour_frac));
        }
        if !(2.4..=3.6).contains(&sc.triple_nis_mean) {
            out.push(format!("{prn} NIS3 {:.3}", sc.triple_nis_mean));
        }
    }
    out
}

#[test]
#[ignore = "pre-registered criteria not met on the fresh window (2026-10-02): (a) and (b) hold on all 11 \
            satellites, (c) fails on G24 (triple-NIS mean 0.964) and G30 (1.929) against [2.4, 3.6]"]
fn extended_filter_is_consistent_on_fresh_held_out_igs_clocks() {
    let f = failures();
    assert!(f.is_empty(), "pre-registered criteria failed: {f:?}");
}

/// Pins the recorded outcome of the pre-registered comparison (first and only run on this
/// window, 2026-10-02): every satellite meets (a) and (b); (c) fails on G24 and G30, both
/// under-confident (the second half is quieter than the first half the tuning saw).
#[test]
fn extended_filter_on_fresh_igs_clocks_finding() {
    let f = failures();
    assert_eq!(
        f,
        vec!["G24 NIS3 0.964".to_string(), "G30 NIS3 1.929".to_string()],
        "recorded finding changed"
    );
}
