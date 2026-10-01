// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Onboard clock state estimation" (row 42): the three-state
//! clock filter `clock_state::ClockState3`, tuned from the measured Allan deviation of the
//! first half of real onboard atomic-clock records, scored for consistency on the held-out
//! second half.
//!
//! ORACLE (Measured): IGS final 30 s combined satellite clocks, 2025-08-17 to 2025-08-30
//! (IGS0OPSFIN_2025229..242, https://igs.org/products/, open with attribution), GPS Block
//! IIF satellites G03 G06 G08 G09 G10 G24 G25 G26 G27 G30 G32 (clock type not given by the
//! IGS files, so not claimed). allantools 2024.6 computes the first-half ADEV. Fixture and
//! provenance: `tests/fixtures/clock_state_igs_holdout_oracle/`.
//!
//! PROTOCOL AND TOLERANCE, fixed before the first comparison (record
//! B3-PREREGISTRATION.md, with its M002 amendment): 300 s epochs; R, q_wf, q_rw from a
//! non-negative fit of sigma_y^2 = 3R/tau^2 + q_wf/tau + q_rw tau/3 to the first-half ADEV
//! (quadratic removed), q_drift = 0; x0 = [first measurement, 0, 0],
//! P0 = diag((1e-6 s)^2, (1e-9)^2, (1e-16 /s)^2); warm-up on days 0-7, scored on days 7-14.
//! Per satellite: (a) nu^2/S <= 3.841 on >= 90 % of one-step innovations; (b) the 1 h
//! prediction error squared over (P00 + R) <= 3.841 on >= 90 % of epochs; (c) the mean of
//! the sum of three consecutive non-overlapping normalised one-step innovations in
//! [2.4, 3.6] (the plan's NEES needs the true state, which real data does not give). PASS
//! only if (a), (b) and (c) hold on every satellite.
//!
//! VERDICT (first and only run, 2026-10-01): DISAGREES, the row stays MODELLED. (a) holds on
//! all 11 satellites (0.906 to 0.971). (b) fails on 9 of 11: the 1 h prediction error lies
//! inside the filter's own 95 % band on only 0.486 to 0.829 of epochs (G08 0.920 and G27
//! 0.915 pass), so the filter is over-confident at one hour. (c) fails on 5 of 11 (G03
//! 4.47, G06 4.70, G09 3.61, G24 3.81, G30 4.08; the others 2.54 to 3.49). The fitted
//! white-phase term R came out zero on every satellite. A noise model of white FM plus
//! random-walk FM fitted to the ADEV does not carry what dominates a one-hour prediction of
//! these clocks (periodic terms and flicker FM are not in the model). The test pins the
//! finding so a change is noticed; it does not promote.

use kshana::clock_state::ClockState3;

const CLOCKS: &str = include_str!("fixtures/clock_state_igs_holdout_oracle/clocks.txt");
const STEP: f64 = 300.0;
const UNIT: f64 = 1e-13;
const HALF_S: f64 = 7.0 * 86_400.0;
const CHI2_1_95: f64 = 3.841;
const ONE_HOUR: f64 = 3_600.0;

struct Sat {
    prn: String,
    r: f64,
    q_wf: f64,
    q_rw: f64,
    /// (t seconds, phase relative to the first record, seconds)
    obs: Vec<(f64, f64)>,
}

fn sats() -> Vec<Sat> {
    let mut out: Vec<Sat> = Vec::new();
    let mut acc: i64 = 0;
    for line in CLOCKS.lines().filter(|l| !l.starts_with('#')) {
        if let Some(hdr) = line.strip_prefix('@') {
            let mut it = hdr.split_whitespace();
            let prn = it.next().unwrap().to_string();
            let kv = |k: &str| -> f64 {
                hdr.split_whitespace()
                    .find_map(|f| f.strip_prefix(&format!("{k}=")))
                    .unwrap()
                    .parse()
                    .unwrap()
            };
            out.push(Sat {
                prn,
                r: kv("R"),
                q_wf: kv("q_wf"),
                q_rw: kv("q_rw"),
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
}

fn score(s: &Sat) -> Score {
    let mut f = ClockState3::new(s.q_wf, s.q_rw, 0.0).with_initial_cov(1e-12, 1e-18, 1e-32);
    f.x = [s.obs[0].1, 0.0, 0.0];
    let at: std::collections::HashMap<i64, f64> = s
        .obs
        .iter()
        .map(|&(t, z)| ((t / STEP).round() as i64, z))
        .collect();
    let mut t_prev = s.obs[0].0;
    let (mut in1, mut n1, mut inh, mut nh) = (0usize, 0usize, 0usize, 0usize);
    let mut nis = Vec::new();
    for &(t, z) in &s.obs[1..] {
        f.predict(t - t_prev);
        t_prev = t;
        let s_pred = f.p[0][0] + s.r;
        let nu = z - f.x[0];
        let held_out = t >= HALF_S;
        if held_out {
            let q = nu * nu / s_pred;
            n1 += 1;
            if q <= CHI2_1_95 {
                in1 += 1;
            }
            nis.push(q);
        }
        f.update_phase(z, s.r);
        if held_out {
            let target = ((t + ONE_HOUR) / STEP).round() as i64;
            if let Some(&z_h) = at.get(&target) {
                let mut g = f.clone();
                g.predict(ONE_HOUR);
                let e = z_h - g.x[0];
                nh += 1;
                if e * e / (g.p[0][0] + s.r) <= CHI2_1_95 {
                    inh += 1;
                }
            }
        }
    }
    let triples: Vec<f64> = nis.chunks_exact(3).map(|c| c.iter().sum()).collect();
    Score {
        one_step_frac: in1 as f64 / n1 as f64,
        one_hour_frac: inh as f64 / nh as f64,
        triple_nis_mean: triples.iter().sum::<f64>() / triples.len() as f64,
        n_one_step: n1,
        n_one_hour: nh,
    }
}

#[test]
fn three_state_filter_on_held_out_igs_clocks_finding() {
    let all = sats();
    assert_eq!(all.len(), 11);
    let mut failures = Vec::new();
    for s in &all {
        let sc = score(s);
        println!(
            "{}: one-step {:.3} (n {}), 1 h {:.3} (n {}), triple-NIS mean {:.3}",
            s.prn,
            sc.one_step_frac,
            sc.n_one_step,
            sc.one_hour_frac,
            sc.n_one_hour,
            sc.triple_nis_mean
        );
        if sc.one_step_frac < 0.90 {
            failures.push(format!("{} one-step {:.3}", s.prn, sc.one_step_frac));
        }
        if sc.one_hour_frac < 0.90 {
            failures.push(format!("{} 1 h {:.3}", s.prn, sc.one_hour_frac));
        }
        if !(2.4..=3.6).contains(&sc.triple_nis_mean) {
            failures.push(format!("{} NIS3 {:.3}", s.prn, sc.triple_nis_mean));
        }
    }
    // Pre-registered verdict: PASS only if `failures` is empty. Recorded finding:
    let n = |tag: &str| failures.iter().filter(|f| f.contains(tag)).count();
    assert_eq!(n(" one-step "), 0, "recorded finding changed: {failures:?}");
    assert_eq!(n(" 1 h "), 9, "recorded finding changed: {failures:?}");
    assert_eq!(n(" NIS3 "), 5, "recorded finding changed: {failures:?}");
}
