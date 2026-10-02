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
//! VERDICT (first and only run of this pipeline, 2026-10-02, after pre-registration fb475550):
//! DISAGREES, the class fails. 11 of 12 stations (BX03-BX10, BX12, BX13, BX22) fail the 50 %
//! presence rule (10 to 19 % of epochs present); BX14 (73 %) fails the bar at 23 541, its
//! held-out Allan deviation at 240 and 480 s (1.6e-6) poisoned by a receiver millisecond reset
//! inside a data gap, which the detector cannot see across a gap. Diagnosis (after the run, one
//! file, no card fitted): the daily files are themselves intermittent (BX03 day 064: 1551 of 2880
//! epochs) and the RAIM test, with the 3 m sigma of the JammerTest pipeline, rejects most of the
//! rest (229 of 1551) because the ionosphere-free combination amplifies code noise about three
//! times. The broadcast navigation came from BRDC00WRD_R (BRDC00IGS_R does not exist for 2021;
//! commit 52178918). A corrected pipeline is a new, disclosed comparison
//! (`f9p_cards_corrected_pipeline`, below).

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
#[ignore = "pre-registered; run 2026-10-02: DISAGREES, 11 of 12 stations fail the 50 % presence rule (RAIM rejects most epochs) and BX14 fails the bar at 23 541 (a millisecond reset inside a gap)"]
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

/// The first run (2026-10-02), pinned: every station fails; BX14 is the only one fitted.
/// Data-gated.
#[test]
fn f9p_first_pipeline_reproduces_the_recorded_finding() {
    let Some(scores) = f9p_scores() else {
        assert!(
            !require_realdata(),
            "Wroclaw data absent with KSHANA_REQUIRE_REALDATA=1"
        );
        println!("[f9p] Wroclaw ZED-F9P data absent (generate.py); skipped");
        return;
    };
    assert_eq!(scores.len(), 12);
    for (st, sc) in &scores {
        match st.as_str() {
            "BX14" => {
                let sc = sc.as_ref().expect("BX14 fitted");
                assert!(!sc.pass && (sc.worst_factor - 23_541.65).abs() < 1.0);
            }
            _ => assert!(sc.is_none(), "{st} unexpectedly passed the presence rule"),
        }
    }
}

// ── Corrected pipeline (a disclosed re-run) ──────────────────────────────────────────────────
//
// PRE-REGISTRATION (written 2026-10-02 after the first run above was seen, committed and pushed
// before the corrected pipeline was run on any station). A RE-RUN AFTER A SEEN FAILURE,
// disclosed as such. What was seen: per-station presence under the first pipeline, BX14's card
// and score, and one diagnostic file (BX03 day 064: epochs present, solved and RAIM-passed).
// No other station's clock record, card or Allan deviation was computed.
//
// CHANGES (each fixed by the diagnosis, none by a card result):
// 1. RAIM pseudorange sigma 8.94 m (`F9P_RAIM_SIGMA_M`): the registered 3 m code sigma scaled
//    by the ionosphere-free L1/L2 noise factor sqrt(2.546^2 + 1.546^2) = 2.98, since the solve
//    uses that combination.
// 2. Each station's days are split into separate records at every missing epoch (records under
//    5 epochs dropped), so no Allan or Hadamard difference spans a gap and a millisecond reset
//    inside a gap cannot reach the statistics (`f9p_station_records`).
// 3. Fit and score over records (`fit_phase_records`, `score_held_out_records`), the fit set
//    being the earliest records holding a third of the station's present epochs
//    (`split_records_by_third`), as for the JammerTest receiver class.
// 4. Evaluability replaces the 50 % grid rule (the source files are themselves intermittent):
//    at least 2000 present epochs in the fit set and a fitted card; otherwise the station fails.
//
// UNCHANGED: the method, the bar [1/1.5, 1.5] at every fitted averaging time, the data.
// BLIND: the 11 stations other than BX14. The class PROMOTES only if all 11 pass; BX14 is
// reported only. Mutation as above.
//
// VERDICT (first and only run of the corrected pipeline, 2026-10-02, after c9cc0d49):
// DISAGREES, the class fails. All 12 stations evaluable (10 185 to 12 983 fit epochs, 246 to
// 1421 records). 1 of 11 blind stations within the bar (BX12, 1.412); BX07 1.532 and BX13
// 1.542 just outside; BX08 1.979, BX03 6.665, BX10 7.268, BX22 54.4, BX05 734, BX09 1650, BX04
// 6960, BX06 13 029; BX14 (not blind) 8325. The robust frequency scatter of the extracted clocks
// (1.6e-9 to 2.4e-7 at 30 s) and the phase steps the detector removes (88 to 211 per held-out
// part) show that single-point receiver clocks from these intermittent 30 s files are not a clean
// oscillator record: the comparison measures the extraction as much as the crystal. No further
// re-run on this record is planned; a clean ZED-F9P record (1 s, continuous, the receiver's own
// clock bias output) is the way forward.

/// Corrected pipeline: per station, its score (`None` when not evaluable).
fn f9p_corrected_scores() -> Option<Vec<(String, Option<HeldOutScore>)>> {
    use kshana::clock_library::score_held_out_records;
    let stations = f9p_station_records()?;
    Some(
        stations
            .into_iter()
            .map(|(st, recs)| {
                let (fit, held) = split_records_by_third(&recs);
                let nf: usize = fit.iter().map(|r| r.valid()).sum();
                let nh: usize = held.iter().map(|r| r.valid()).sum();
                println!("{st}: {} records, fit {nf} / held {nh} epochs", recs.len());
                if nf < 2000 {
                    println!("{st}: fewer than 2000 fit epochs (a failure)");
                    return (st, None);
                }
                let Ok(card) = DeviceCard::fit_phase_records(&format!("ZED-F9P {st}"), &fit)
                else {
                    println!("{st}: no card (a failure)");
                    return (st, None);
                };
                println!(
                    "{st}: h0 {:.3e} h-1 {:.3e} h-2 {:.3e} wpm {:.3e} drift {:.3e}/s",
                    card.h_0, card.h_m1, card.h_m2, card.white_pm_var, card.drift_per_s
                );
                let sc = score_held_out_records(&card, &held, BAR);
                println!(
                    "{:<16} pass={} worst factor {:.3} [{}]",
                    sc.card,
                    sc.pass,
                    sc.worst_factor,
                    sc.conditioning.summary()
                );
                for p in &sc.points {
                    println!(
                        "    tau {:>7.0} s  predicted {:.4e}  measured {:.4e}  ratio {:.3}  terms {}",
                        p.tau_s, p.predicted, p.measured, p.ratio, p.terms
                    );
                }
                (st, Some(sc))
            })
            .collect(),
    )
}

#[test]
#[ignore = "pre-registered (disclosed re-run); run 2026-10-02: DISAGREES, 1 of 11 blind stations within the bar (BX12); BX07 1.532, BX13 1.542, others 1.98 to 13 029"]
fn f9p_cards_corrected_pipeline() {
    let scores = f9p_corrected_scores().expect("Wroclaw ZED-F9P data absent");
    let failing: Vec<&String> = scores
        .iter()
        .filter(|(st, _)| st != "BX14")
        .filter(|(_, s)| !s.as_ref().is_some_and(|s| s.pass))
        .map(|(p, _)| p)
        .collect();
    assert_eq!(scores.len(), 12);
    assert!(
        failing.is_empty(),
        "blind cards outside the bar: {failing:?}"
    );
}

/// The corrected-pipeline run (2026-10-02), pinned: per station, worst factor (relative 1e-3)
/// and pass. Data-gated.
const RECORDED_CORRECTED: [(&str, f64, bool); 12] = [
    ("BX03", 6.665, false),
    ("BX04", 6960.323, false),
    ("BX05", 733.615, false),
    ("BX06", 13029.327, false),
    ("BX07", 1.532, false),
    ("BX08", 1.979, false),
    ("BX09", 1649.954, false),
    ("BX10", 7.268, false),
    ("BX12", 1.412, true),
    ("BX13", 1.542, false),
    ("BX14", 8324.727, false),
    ("BX22", 54.405, false),
];

#[test]
fn f9p_corrected_pipeline_reproduces_the_recorded_finding() {
    let Some(scores) = f9p_corrected_scores() else {
        assert!(
            !require_realdata(),
            "Wroclaw data absent with KSHANA_REQUIRE_REALDATA=1"
        );
        println!("[f9p] Wroclaw ZED-F9P data absent (generate.py); skipped");
        return;
    };
    assert_eq!(scores.len(), RECORDED_CORRECTED.len());
    for ((st, sc), (rs, worst, pass)) in scores.iter().zip(RECORDED_CORRECTED) {
        assert_eq!(st, rs);
        let sc = sc.as_ref().expect("evaluable");
        assert_eq!(sc.pass, pass, "{st}");
        assert!(
            (sc.worst_factor / worst - 1.0).abs() < 1e-3,
            "{st}: worst factor {:.4} recorded {worst}",
            sc.worst_factor
        );
    }
}
