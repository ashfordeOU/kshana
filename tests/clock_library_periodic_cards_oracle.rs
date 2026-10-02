// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for a NEW matrix row, "GPS Block IIF device cards with per-revolution terms"
//! (`DeviceCard::fit_phase_periodic`): a card that carries the once- to four-per-revolution
//! phase terms with its power-law noise and drift, fitted on one third of a measured GPS Block
//! IIF clock record, predicts the Allan deviation of the other two thirds.
//!
//! WHY A NEW ROW. On 2026-03-01 to 14 (`tests/clock_library_device_cards_oracle.rs`) the
//! power-law cards passed on 10 of 11 satellites and G27 failed, optimistic at the two-hour
//! scale, the periodic error of an orbiting clock that a power-law card cannot carry. The
//! periodic card is a new method, so it is a new row on a new window; the March window and its
//! result were seen before this pre-registration and are not reused.
//!
//! PRE-REGISTRATION (written 2026-10-02, committed and pushed before the window below was
//! fetched; engine commit 2e0a2bc1).
//!
//! QUANTITY. As the device-card row: per card, at each averaging time it was fitted at, the
//! ratio of the predicted overlapping Allan deviation (power-law noise, the drift's
//! `D^2 tau^2 / 2`, and each periodic term's `4 A^2 sin^4(pi tau / P) / tau^2`) to the
//! gap-aware overlapping Allan deviation of the held-out record.
//!
//! INPUTS. IGS (International GNSS Service) final combined 30 s clocks IGS0OPSFIN_2026091..104
//! (2026-04-01 to 2026-04-14), BKG mirror https://igs.bkg.bund.de/root_ftp/IGS/products/,
//! IGS products open with attribution, cut by
//! `tests/fixtures/clock_library_periodic_cards_oracle/generate.py` (the March converter and
//! selection rule unchanged: every PRN held by a GPS-IIF SVN for the whole window in the IGS
//! satellite metadata SINEX).
//!
//! METHOD. `DeviceCard::fit_phase_periodic` on the first third (`split_thirds`) with periods
//! `T / k`, k = 1, 2, 3, 4, `T` = 43 082.05 s (half a sidereal day, the GPS orbital period, as
//! in the onboard-clock-state rows): conditioning, then the quadratic and the four sine-cosine
//! pairs removed jointly by least squares, the noise fitted on the residual as in the
//! device-card method (edf >= 30 points). Scored by `score_held_out` on the other two thirds.
//! A PRN with fewer than 50 % of epochs present in either part counts as a failure.
//!
//! ORACLE (Measured): the held-out two thirds of each satellite's record.
//!
//! TOLERANCE (fixed now, the device-card bar unchanged): every ratio within [1/1.5, 1.5] and a
//! held-out value at every fitted averaging time. The row is PROMOTED only if every card passes.
//! Reported, not scored: the power-law cards (`fit_phase`) on the same window.
//!
//! MUTATION (pre-registered): replace `4.0 * a * a` by `0.0 * a * a` in `DeviceCard::adev`
//! (drop the periodic terms from the prediction); a passing strict test must turn red.
//!
//! VERDICT: not yet run.

#[path = "clock_library_support/mod.rs"]
mod support;

use kshana::clock_library::{score_held_out, DeviceCard, HeldOutScore};
use support::*;

const FIXTURE: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/clock_library_periodic_cards_oracle/igs_iif_30s.txt"
);
const T_REV: f64 = 43_082.05;

fn periods() -> Vec<f64> {
    (1..=4).map(|k| T_REV / k as f64).collect()
}

fn report(s: &HeldOutScore) {
    println!(
        "{:<26} pass={} worst factor {:.3}  [{}]",
        s.card,
        s.pass,
        s.worst_factor,
        s.conditioning.summary()
    );
    for p in &s.points {
        println!(
            "    tau {:>8.0} s  predicted {:.4e}  measured {:.4e}  ratio {:.3}",
            p.tau_s, p.predicted, p.measured, p.ratio
        );
    }
}

/// Per PRN: the periodic card's score (`None` under the 50 % rule) and the power-law control.
fn scores() -> Vec<(String, Option<(HeldOutScore, HeldOutScore)>)> {
    igs_iif_from(FIXTURE)
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
            let card =
                DeviceCard::fit_phase_periodic(&format!("IIF {prn} periodic"), &fit, &periods())
                    .expect("periodic card");
            println!(
                "{prn}: amplitudes (ns) {:?} drift {:.3e}/s",
                card.periodic
                    .iter()
                    .map(|(_, a)| (a * 1e12).round() / 1e3)
                    .collect::<Vec<_>>(),
                card.drift_per_s
            );
            let sc = score_held_out(&card, &held, BAR);
            report(&sc);
            let plain = DeviceCard::fit_phase(&format!("IIF {prn} power-law"), &fit).expect("card");
            let pc = score_held_out(&plain, &held, BAR);
            println!(
                "    control (power-law card): pass={} worst {:.3}",
                pc.pass, pc.worst_factor
            );
            (prn, Some((sc, pc)))
        })
        .collect()
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn periodic_cards_predict_their_held_out_two_thirds() {
    let all = scores();
    assert!(!all.is_empty());
    let failing: Vec<&String> = all
        .iter()
        .filter(|(_, s)| !s.as_ref().is_some_and(|(p, _)| p.pass))
        .map(|(p, _)| p)
        .collect();
    assert!(failing.is_empty(), "cards outside the bar: {failing:?}");
}
