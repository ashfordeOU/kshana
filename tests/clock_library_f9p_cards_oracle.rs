// SPDX-License-Identifier: AGPL-3.0-only
//! Device-card row (b), a NEW blind class C8: the receiver TCXO (temperature-compensated crystal
//! oscillator) of the u-blox ZED-F9P, as a MODEL class, from static receivers in Wroclaw.
//!
//! WHY. The blind receiver class C7 (the JammerTest unit itself) was BLOCKED: the dataset holds
//! only short attack sessions (167 usable epochs). A long quiet-sky record of the same receiver
//! MODEL is public: the claim here is about the ZED-F9P class, not the JammerTest unit, and is
//! labelled so.
//!
//! PRE-REGISTRATION (written 2026-10-02, committed and pushed before any file of the record was
//! fetched; only the record's metadata and file list were read).
//!
//! INPUTS. Zenodo record 6488497 (doi:10.5281/zenodo.6488497, CC BY 4.0): daily 30 s RINEX of
//! static ZED-F9P receivers in Wroclaw, 2021-02-27 to 2021-03-28 (BX02 on a survey antenna, the
//! rest on u-blox patch antennas; the antenna does not change the oscillator). Every station with
//! at least 14 consecutive daily files, its earliest 14-day run
//! (`tests/fixtures/clock_library_f9p_cards_oracle/generate.py`), with the IGS merged broadcast
//! navigation of each day. Data-gated: the files live under `$KSHANA_ORACLES/data/wroclaw_f9p/`
//! (about 0.7 GB); the test says so when it skips.
//!
//! RECEIVER CLOCK. As M010 pass 1 (`clock_library_support::receiver_clock_with`), GPS satellites
//! only (a single clock without an inter-system bias): ionosphere-free L1/L2 single-point
//! solution, 10 degree mask, millisecond resets unwrapped within each daily file, an epoch with
//! no solution, a solve failure or a RAIM alarm missing. Each station is one 30 s record over its
//! 14 days (40 320 epochs).
//!
//! METHOD, SPLIT, TOLERANCE. The device-card row unchanged (`DeviceCard::fit_phase` on the first
//! third, `score_held_out` on the other two thirds, every ratio within [1/1.5, 1.5]); a station
//! with fewer than 50 % of epochs present in either part counts as a failure. The class PROMOTES
//! row (b) for "u-blox ZED-F9P receiver TCXO (model class)" only if every station's card passes.
//!
//! MUTATION (pre-registered, if it passes): `0.125 * self.h_0 / tau` in
//! `DeviceCard::noise_allan_variance`; the strict test must turn red.
//!
//! VERDICT: not yet run.

#[path = "clock_library_support/mod.rs"]
mod support;

use kshana::clock_library::{score_held_out, DeviceCard, HeldOutScore};
use support::*;

/// Per station: the card's held-out score (`None` under the 50 % rule); `None` overall when the
/// data are absent.
fn f9p_scores() -> Option<Vec<(String, Option<HeldOutScore>)>> {
    let stations = f9p_stations()?;
    Some(
        stations
            .into_iter()
            .map(|(st, s)| {
                let (fit, held) = s.split_thirds();
                let ok = |p: &kshana::clock_library::PhaseSeries| 2 * p.valid() >= p.len();
                println!(
                    "{st}: present {} of {} (fit {} / held {})",
                    s.valid(),
                    s.len(),
                    fit.valid(),
                    held.valid()
                );
                if !(ok(&fit) && ok(&held)) {
                    println!("{st}: fewer than 50 % of epochs present in a part (a failure)");
                    return (st, None);
                }
                let card = DeviceCard::fit_phase(&format!("ZED-F9P {st}"), &fit).expect("card");
                println!(
                    "{st}: h0 {:.3e} h-1 {:.3e} h-2 {:.3e} wpm {:.3e} drift {:.3e}/s [{}]",
                    card.h_0,
                    card.h_m1,
                    card.h_m2,
                    card.white_pm_var,
                    card.drift_per_s,
                    card.conditioning.summary()
                );
                let sc = score_held_out(&card, &held, BAR);
                println!(
                    "{:<16} pass={} worst factor {:.3} [{}]",
                    sc.card,
                    sc.pass,
                    sc.worst_factor,
                    sc.conditioning.summary()
                );
                for p in &sc.points {
                    println!(
                        "    tau {:>7.0} s  predicted {:.4e}  measured {:.4e}  ratio {:.3}",
                        p.tau_s, p.predicted, p.measured, p.ratio
                    );
                }
                (st, Some(sc))
            })
            .collect(),
    )
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn f9p_cards_predict_their_held_out_two_thirds() {
    let Some(scores) = f9p_scores() else {
        panic!("Wroclaw ZED-F9P data absent (run generate.py)");
    };
    assert!(!scores.is_empty());
    let failing: Vec<&String> = scores
        .iter()
        .filter(|(_, s)| !s.as_ref().is_some_and(|s| s.pass))
        .map(|(p, _)| p)
        .collect();
    assert!(failing.is_empty(), "cards outside the bar: {failing:?}");
}
