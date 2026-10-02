// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for a NEW matrix row, "Measured device cards with held-out prediction" (package D9,
//! the measured clock library): a device card fitted to one third of a named measured clock
//! record predicts the Allan deviation of the other two thirds.
//!
//! PRE-REGISTRATION (written 2026-10-02 and committed and pushed before any record below was
//! fetched or any card was fitted to measured data; engine commit 52a931b2, which fixes the
//! conditioning detector, the card fit and the score).
//!
//! QUANTITY. Per card, at each averaging time tau the card was fitted at: the ratio of the
//! card's predicted overlapping Allan deviation (noise terms plus the fitted drift's
//! `D^2 tau^2 / 2`) to the gap-aware overlapping Allan deviation measured on the held-out
//! record.
//!
//! METHOD (fixed by engine commit 52a931b2, `kshana::clock_library`). Fit part and held-out
//! part are conditioned SEPARATELY by `clock_library::condition` (running-median residuals of
//! the first differences, half window 30 samples, 6 robust sigmas; single flagged difference =
//! phase step removed, cancelling pair = phase outlier removed, longer run = burst removed;
//! frequency steps, 10 standard errors over 60-difference windows, logged only). The card is
//! `DeviceCard::fit_phase` (or `fit_phase_records`): quadratic removed, octave averaging
//! factors with at least 8 terms, lag-1 autocorrelation noise identification per factor on the
//! longest gap-free run (random-walk FM when fewer than 30 decimated samples), the noise-type
//! edf, the points with edf >= 30 fitted by edf-weighted non-negative least squares in the white
//! phase, white, flicker and random-walk FM basis. The held-out score is `score_held_out`
//! (conditioned, not detrended) at the card's own fitted averaging times.
//!
//! SPLIT. A single record: the first third of its grid epochs fits, the other two thirds score
//! (`PhaseSeries::split_thirds`). Several receiver records (C7): in start order, records join
//! the fit set until it holds a third of the present epochs; the rest score.
//!
//! TOLERANCE (fixed now; the factor of the existing caesium holdover row, not moved). A card
//! PASSES when every ratio lies in [1/1.5, 1.5] and every fitted averaging time has a held-out
//! value (at least 8 terms).
//!
//! CARDS AND RECORDS.
//! * C1 caesium (NOT BLIND): the 5071A caesium-beam standard against a hydrogen maser, 556 990
//!   phase samples at 1 s (A. Wallin, distributed with allantools; `scripts/fetch_cs5071a.sh`,
//!   pinned commit and SHA-256). Opened before by `tests/cs5071a_reference.rs` and
//!   `tests/slot_timing_cs5071a_holdout.rs` (same thirds), so reported, never promotable.
//! * C2 OCXO, oven-controlled crystal oscillator (NOT BLIND): 19 982 one-second frequency
//!   readings against a hydrogen maser (A. Wallin 2015, allantools; `scripts/fetch_ocxo.sh`),
//!   integrated to phase. Opened before by `tests/slot_timing_ocxo_holdout.rs`, whose header
//!   records that its noise floor halved during the record; reported, never promotable.
//! * C3 GPS Block IIF onboard clocks (BLIND): International GNSS Service (IGS) final combined
//!   30 s clocks IGS0OPSFIN_2026060..073 (2026-03-01 to 2026-03-14, a window no Kshana test has
//!   opened), from https://igs.bkg.bund.de/root_ftp/IGS/products/ (IGS products, open with
//!   attribution), cut by `tests/fixtures/clock_library_device_cards_oracle/generate.py`. One
//!   card per PRN whose SVN is a GPS-IIF satellite for the whole window in the IGS satellite
//!   metadata SINEX (https://files.igs.org/pub/station/general/igs_satellite_metadata.snx, as
//!   retrieved). Each PRN's grid is the 40 320 epochs of the window; a PRN with fewer than 50 %
//!   of epochs present in either part is reported and counts as a failure. Whether a satellite
//!   runs its rubidium or caesium standard is not in these files and is not claimed.
//! * C4 Galileo passive hydrogen masers: BLOCKED, not run. No open (login-free) source of
//!   final Galileo clocks is reachable from the build environment (CDDIS needs an Earthdata
//!   login; the GFZ, Wuhan and IGN mirrors refused the connection on 2026-10-02).
//! * C5 Norcia strontium clock (NOT BLIND): the vendored measured Allan-deviation curve
//!   (`tests/fixtures/optical_clock_adev/stability_dat.csv`, Zenodo 10.5281/zenodo.3382347,
//!   CC BY 4.0). Fit on the first three (shortest) of the eight points, score the other five;
//!   edf per point `0.5 (sigma / e)^2`, `e` the mean of the two published standard errors; the
//!   ratio bar applies at scored points with edf >= 30, the others are reported. The author
//!   read the curve's values while writing this header (to learn its columns), and an earlier
//!   row fitted the whole curve: reported, never promotable.
//! * C6 Deep Space Atomic Clock: BLOCKED, not run. Burt et al., Nature 595, 43 (2021) is not
//!   open; its open abstract prints one in-space stability value (3e-15 at 23 days, no drift
//!   removal) and a drift (3.0(0.7)e-16 per day): too few numbers for a fit/score split.
//! * C7 receiver TCXO, temperature-compensated crystal oscillator (BLIND): the clock of the
//!   stationary u-blox ZED-F9P receiver of the JammerTest 2024 dataset (Sayyaf, Ortiz and
//!   Renaudin, Zenodo record 15911589, GPL-3.0-or-later), in the sessions that hold none of the
//!   M010-scored spoofing onsets, i.e. every scenario folder under `Jamming/stationary/` and
//!   `Meaconing/stationary/`; never used by any Kshana test. Converted as in M010 round 1 (one
//!   epoch per integer GPS second, GPS satellites with L1 C/A and L2C pseudoranges); every
//!   epoch within 60 s of a transmission in the official JammerTest 2024 log on that date (any
//!   site) removed by the generator (a date the log does not cover is removed whole); receiver
//!   clock by the M010 pass 1 (single-point solution, millisecond resets unwrapped, RAIM alarm
//!   or solve failure dropped); split into records at every gap longer than 10 s, records
//!   shorter than 120 s dropped (`tests/clock_library_support/mod.rs`). With fewer than 3600
//!   training epochs the card is BLOCKED.
//!
//! ORACLE (Measured): the held-out two thirds of each record (C1, C2, C3, C7) and the published
//! longer-tau points (C5).
//!
//! OUTCOME RULE (fixed now). The row is promoted for each BLIND class (C3, C7) all of whose
//! cards pass, and its text names only those classes; a blind class with a failing card is a
//! finding. NOT BLIND classes are reported and never carry a promotion. If no blind class
//! passes, the row stays MODELLED. Pre-registered mutation: replace `0.5 * self.h_0 / tau` by
//! `0.125 * self.h_0 / tau` in `DeviceCard::noise_allan_variance`; a passing strict test must
//! turn red.
//!
//! VERDICT (first and only run, 2026-10-02, after pre-registration commit 2ec76864): the row
//! stays MODELLED.
//! * C3 GPS Block IIF (blind), DISAGREES: 10 of 11 cards within the bar (worst factors G03
//!   1.110, G06 1.164, G08 1.339, G09 1.127, G10 1.065, G24 1.367, G25 1.144, G26 1.121, G30
//!   1.312, G32 1.149); G27 fails at 1.510, OPTIMISTIC at the hour scale (predicted / measured
//!   0.751 at 3840 s and 0.662 at 7680 s). The hour-scale error of an orbiting clock (periodic
//!   terms) is not in a power-law card. Every record was complete (no gaps); the detector
//!   removed 15 to 40 phase steps per fit third and 29 to 78 per held-out part, and 0 to 1
//!   phase outliers.
//! * C7 receiver TCXO (blind), BLOCKED: the generator keeps 364 epochs and the receiver-clock
//!   extraction leaves 167 in two records (the dataset holds only
//!   the attack sessions, 3 to 17 minutes long, nearly all within 60 s of a logged
//!   transmission; the 2024-09-09 jamming session and the 3.2.8 meaconing session lose every
//!   epoch), against the 3600 minimum. No card was fitted.
//! * Reported, not blind: C1 caesium within the bar (worst 1.070 at 4096 s); C2 OCXO outside
//!   it, conservative (2.348 at 128 s; the known floor change); C5 strontium within it at its
//!   two scored points (1.291, 1.405).
//! * Mutation (pre-registered, `0.125 * self.h_0 / tau`): the failing GPS set grows from G27 to
//!   G08, G09, G10, G26, G27, G32 (the strict test was already red); reverted.

#[path = "clock_library_support/mod.rs"]
mod support;

use kshana::clock_library::{
    score_curve, score_held_out, score_held_out_records, DeviceCard, HeldOutScore,
};
use support::*;

fn report(s: &HeldOutScore) {
    println!(
        "{:<22} pass={} worst factor {:.3}  [{}]",
        s.card,
        s.pass,
        s.worst_factor,
        s.conditioning.summary()
    );
    for p in &s.points {
        println!(
            "    tau {:>9.1} s  predicted {:.4e}  measured {:.4e}  ratio {:.3}  terms {}",
            p.tau_s, p.predicted, p.measured, p.ratio, p.terms
        );
    }
}

/// C3: one card per GPS Block IIF PRN; `None` for a PRN under the 50 % presence rule.
fn gps_iif_scores() -> Vec<(String, Option<HeldOutScore>)> {
    igs_iif()
        .into_iter()
        .map(|(prn, s)| {
            let (fit, held) = s.split_thirds();
            let ok = |p: &kshana::clock_library::PhaseSeries| 2 * p.valid() >= p.len();
            if !(ok(&fit) && ok(&held)) {
                println!(
                    "{prn}: fewer than 50 % of epochs present in a part (counts as a failure)"
                );
                return (prn, None);
            }
            let card = DeviceCard::fit_phase(&format!("GPS IIF {prn}"), &fit).expect("card");
            println!(
                "{prn}: h0 {:.3e} h-1 {:.3e} h-2 {:.3e} wpm {:.3e} drift {:.3e}/s; fit [{}]",
                card.h_0,
                card.h_m1,
                card.h_m2,
                card.white_pm_var,
                card.drift_per_s,
                card.conditioning.summary()
            );
            let sc = score_held_out(&card, &held, BAR);
            report(&sc);
            (prn, Some(sc))
        })
        .collect()
}

/// C7: the receiver TCXO card; `None` when BLOCKED (too little training data).
fn receiver_tcxo_score() -> Option<HeldOutScore> {
    let recs = tcxo_training()?;
    let n: usize = recs.iter().map(|r| r.valid()).sum();
    println!("receiver training: {} records, {n} epochs", recs.len());
    if n < MIN_TRAIN_EPOCHS {
        println!("BLOCKED: fewer than {MIN_TRAIN_EPOCHS} training epochs");
        return None;
    }
    let (fit, held) = split_records_by_third(&recs);
    let card = DeviceCard::fit_phase_records("receiver TCXO (F9P)", &fit).ok()?;
    println!(
        "TCXO: h0 {:.3e} h-1 {:.3e} h-2 {:.3e} wpm {:.3e} drift {:.3e}/s",
        card.h_0, card.h_m1, card.h_m2, card.white_pm_var, card.drift_per_s
    );
    let sc = score_held_out_records(&card, &held, BAR);
    report(&sc);
    Some(sc)
}

#[test]
#[ignore = "pre-registered; run 2026-10-02: DISAGREES, G27 worst factor 1.510 against 1.5 (optimistic, 0.662 at 7680 s); the other 10 cards within the bar"]
fn gps_iif_cards_predict_their_held_out_two_thirds() {
    let scores = gps_iif_scores();
    assert!(!scores.is_empty(), "no GPS IIF satellite in the fixture");
    let failing: Vec<&String> = scores
        .iter()
        .filter(|(_, s)| !s.as_ref().is_some_and(|s| s.pass))
        .map(|(p, _)| p)
        .collect();
    assert!(failing.is_empty(), "cards outside the bar: {failing:?}");
}

#[test]
#[ignore = "pre-registered; BLOCKED 2026-10-02: the training selection keeps far fewer than the 3600 epochs required"]
fn receiver_tcxo_card_predicts_its_held_out_sessions() {
    let sc = receiver_tcxo_score().expect("receiver card BLOCKED");
    assert!(sc.pass, "worst factor {:.3}", sc.worst_factor);
}

/// The run of 2026-10-02, pinned: per GPS IIF PRN, the worst factor (to 1e-3) and whether the
/// card passed.
const RECORDED_IIF: [(&str, f64, bool); 11] = [
    ("G03", 1.110, true),
    ("G06", 1.164, true),
    ("G08", 1.339, true),
    ("G09", 1.127, true),
    ("G10", 1.065, true),
    ("G24", 1.367, true),
    ("G25", 1.144, true),
    ("G26", 1.121, true),
    ("G27", 1.510, false),
    ("G30", 1.312, true),
    ("G32", 1.149, true),
];

#[test]
fn gps_iif_cards_reproduce_the_recorded_finding() {
    let scores = gps_iif_scores();
    assert_eq!(scores.len(), RECORDED_IIF.len());
    for ((prn, sc), (rp, worst, pass)) in scores.iter().zip(RECORDED_IIF) {
        assert_eq!(prn, rp);
        let sc = sc.as_ref().expect("present");
        assert_eq!(sc.pass, pass, "{prn}");
        assert!(
            (sc.worst_factor - worst).abs() < 6e-4,
            "{prn}: worst factor {:.4} recorded {worst}",
            sc.worst_factor
        );
    }
}

/// The receiver card is BLOCKED: the pre-registered selection leaves fewer training epochs
/// than the minimum (pinned count after extraction).
#[test]
fn receiver_training_is_blocked_by_the_epoch_minimum() {
    let recs = tcxo_training().expect("training fixture");
    let n: usize = recs.iter().map(|r| r.valid()).sum();
    println!("receiver training: {} records, {n} epochs", recs.len());
    assert!(n < MIN_TRAIN_EPOCHS);
    assert_eq!(n, RECORDED_TRAIN_EPOCHS);
}

/// Training epochs after extraction on 2026-10-02.
const RECORDED_TRAIN_EPOCHS: usize = 167;

/// Reported, never promotable (NOT BLIND): C1 caesium, C2 OCXO (data-gated) and C5 strontium.
#[test]
fn non_blind_cards_are_reported() {
    // C5 Norcia strontium curve.
    let csv = std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/optical_clock_adev/stability_dat.csv"
    ))
    .expect("stability_dat.csv");
    let row = |name: &str| -> Vec<f64> {
        csv.lines()
            .find(|l| l.starts_with(name))
            .expect("row")
            .split(',')
            .skip(1)
            .map(|v| v.parse().expect("number"))
            .collect()
    };
    let (tau, adev) = (row("averaging time"), row("fractional Allan deviation"));
    let (lo, hi) = (row("standard error (lower)"), row("standard error (upper)"));
    let edf: Vec<f64> = (0..tau.len())
        .map(|i| 0.5 * (adev[i] / (0.5 * (lo[i] + hi[i]))).powi(2))
        .collect();
    let fit: Vec<(f64, f64, f64)> = (0..3).map(|i| (tau[i], adev[i], edf[i])).collect();
    let card = DeviceCard::fit_curve("Sr (Norcia 2019)", &fit).expect("Sr card");
    let scored: Vec<(f64, f64)> = (3..tau.len())
        .filter(|&i| edf[i] >= 30.0)
        .map(|i| (tau[i], adev[i]))
        .collect();
    report(&score_curve(&card, &scored, BAR));
    for i in 3..tau.len() {
        println!(
            "    Sr tau {:.2} s edf {:.1} predicted {:.4e} measured {:.4e}",
            tau[i],
            edf[i],
            card.adev(tau[i]),
            adev[i]
        );
    }
    // C1 and C2, data-gated.
    for (name, rec) in [("caesium 5071A", cs5071a()), ("OCXO", ocxo())] {
        match rec {
            Some(s) => {
                let (fit, held) = s.split_thirds();
                let card = DeviceCard::fit_phase(name, &fit).expect("card");
                report(&score_held_out(&card, &held, BAR));
            }
            None => {
                assert!(
                    !require_realdata(),
                    "{name} record absent with KSHANA_REQUIRE_REALDATA=1"
                );
                println!("[{name}] record absent (scripts/fetch_cs5071a.sh, scripts/fetch_ocxo.sh); skipped");
            }
        }
    }
}
