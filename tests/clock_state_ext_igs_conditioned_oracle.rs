// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Onboard clock state estimation" (M002), round 3: the round-2
//! extended filter, tuning rule and criteria UNCHANGED, on a fresh window whose records are first
//! cleaned by the frozen conditioning detector of the measured clock library.
//!
//! WHY. Round 2 (`tests/clock_state_ext_igs_fresh_oracle.rs`, pre-registered 4b1a841e) met
//! criteria (a) and (b) on all 11 satellites and failed (c) on G24 and G30, whose first halves
//! carried bursts of large phase second differences that the likelihood tuning absorbed as extra
//! noise. A day-boundary repair was tried afterwards on both windows and failed; it is not
//! reused. The detector here (`clock_library::condition`, frozen at engine commit 52a931b2 and
//! pre-registered in 2ec76864) is a whole-record design that knows nothing of day or file
//! boundaries. Disclosed: on 2026-03-01 to 14 the detector removed 15 to 78 phase steps per
//! 30 s GPS IIF record segment; that window is not used here.
//!
//! PRE-REGISTRATION (written 2026-10-02, committed and pushed before the window was fetched).
//!
//! INPUTS. IGS final combined 30 s clocks IGS0OPSFIN_2026091..104 (2026-04-01 to 2026-04-14),
//! the fixture of `tests/clock_library_periodic_cards_oracle.rs` (PRNs held by a GPS-IIF SVN for
//! the whole window), decimated to every tenth epoch (whole multiples of 300 s).
//!
//! CONDITIONING (the only change). Each satellite's whole 14-day 300 s record is passed through
//! `clock_library::condition` once (`write_conditioned_300s`, below): phase outliers and bursts
//! become gaps (coasted, as round 2 coasts gaps) and phase steps are removed; frequency steps are
//! only logged. The whole record, not each half, is conditioned: the detector uses the record's
//! robust scale only and sees no model; disclosed.
//!
//! MODEL, TUNING, CRITERIA. Round 2 unchanged: `ClockModelExt` with the nine-state flicker bank
//! (1e2 to 1e6 s, two per decade) and four per-revolution periodic pairs (T = 43 082.05 s);
//! theta = log10(R, q_wf, h_-1, q_rw, q_h) by Nelder-Mead on the first-half negative
//! log-likelihood (t >= 1 day; start (-24, -24, -29, -33, -26), xatol 0.02, fatol 0.05, maxfev
//! 1500) by `tests/fixtures/clock_state_ext_igs_conditioned_oracle/tune.py`, which imports the
//! round-2 likelihood; scored on days 7-14 by Kshana's own filter: (a) one-step nu^2/S <= 3.841
//! on >= 90 % of epochs; (b) one-hour prediction error^2 / (HPH' + R) <= 3.841 on >= 90 % of
//! epochs with a target; (c) mean of non-overlapping triple sums of one-step NIS in [2.4, 3.6].
//! PASS only if (a), (b), (c) hold on every satellite.
//!
//! ORACLE (Measured): the held-out second half of the real records.
//!
//! MUTATION (pre-registered, if it passes): halve the tuned `R` in the scored run (a mistuned
//! measurement noise must break (c)).
//!
//! VERDICT (first and only run, 2026-10-02, after pre-registration commit fb475550): DISAGREES,
//! the row stays MODELLED, closer than round 2. (a) one-step holds on all 11 satellites (0.941 to
//! 0.968); (c) the triple-NIS mean, which failed on G24 and G30 in round 2, now holds on all 11
//! (2.641 to 3.549); (b) the one-hour criterion fails on two, G09 (0.894) and G26 (0.876), both
//! OVER-confident at one hour; the other nine lie in 0.916 to 0.994. The conditioning removed 2
//! to 41 phase steps per satellite and one burst (G25), and logged four frequency steps (G03).
//! The pre-registered R-halving mutation applies only to a pass and was not run.

#[path = "clock_library_support/mod.rs"]
mod support;

use kshana::clock_state::{ClockModelExt, ClockStateExt, FlickerFmBank};

const FIXTURE: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/clock_state_ext_igs_conditioned_oracle/clocks.txt"
);
const STEP: f64 = 300.0;
const UNIT: f64 = 1e-13;
const HALF_S: f64 = 7.0 * 86_400.0;
const CHI2_1_95: f64 = 3.841;
const ONE_HOUR: f64 = 3_600.0;
const T_REV: f64 = 43_082.05;

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
    let prns: Vec<String> = all.iter().map(|s| s.prn.clone()).collect();
    assert!(!prns.is_empty(), "no satellites in the fixture");
    for prn in &prns {
        let Some(s) = all.iter().find(|s| &s.prn == prn) else {
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
#[ignore = "pre-registered; run 2026-10-02: DISAGREES, (b) one-hour fails on G09 (0.894) and G26 (0.876) against 0.90; (a) and (c) hold on all 11"]
fn conditioned_extended_filter_is_consistent_on_fresh_held_out_igs_clocks() {
    let f = failures();
    assert!(f.is_empty(), "pre-registered criteria failed: {f:?}");
}

/// Pins the recorded outcome (first and only run, 2026-10-02).
#[test]
fn conditioned_extended_filter_finding() {
    assert_eq!(
        failures(),
        vec!["G09 1h 0.894".to_string(), "G26 1h 0.876".to_string()],
        "recorded finding changed"
    );
}

/// Pipeline step (run once, by hand, before `tune.py`): decimate the 30 s fixture to 300 s,
/// condition each satellite's whole record and write `conditioned.txt` (`@PRN
/// first_bias_s=B`, then `k d` lines: 300 s epoch index and increment in 1e-13 s).
#[test]
#[ignore = "pipeline step: writes conditioned.txt"]
fn write_conditioned_300s() {
    use kshana::clock_library::{condition, PhaseSeries};
    let src = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/clock_library_periodic_cards_oracle/igs_iif_30s.txt"
    );
    let mut out = String::from(
        "# IGS final clocks 2026-04-01..14, GPS IIF, 300 s, conditioned by clock_library::condition\n",
    );
    for (prn, s) in support::igs_iif_from(src) {
        let x: Vec<f64> = s.x.iter().step_by(10).copied().collect();
        let (c, log) = condition(&PhaseSeries {
            t0: 0.0,
            tau0: STEP,
            x,
        });
        println!("{prn}: {}", log.summary());
        let Some(base) = c.x.iter().copied().find(|v| v.is_finite()) else {
            continue;
        };
        out.push_str(&format!("@{prn} first_bias_s={base:?}\n"));
        let mut prev = 0i64;
        for (k, v) in c.x.iter().enumerate() {
            if v.is_finite() {
                let q = ((v - base) / UNIT).round() as i64;
                out.push_str(&format!("{k} {}\n", q - prev));
                prev = q;
            }
        }
    }
    std::fs::write(
        concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/tests/fixtures/clock_state_ext_igs_conditioned_oracle/conditioned.txt"
        ),
        out,
    )
    .expect("write conditioned.txt");
}
