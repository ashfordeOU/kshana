// SPDX-License-Identifier: AGPL-3.0-only
//! A beacon no observation reaches (found by MR-05 on 2026-12-01: the south-pole beacon). The
//! report names it (`unobserved_beacons`, `warning`, both emitted only then) and the observed
//! beacons' sigmas come from their own information. The datum is unchanged, and a schedule that
//! observes every beacon emits neither field. Revision record:
//! `docs/revisions/BEACON-unobserved-cell-changes.md`.

use kshana::lunar_frame_campaign::LunarFrameCampaignScenario;
use serde_json::Value;

fn run(sc: LunarFrameCampaignScenario) -> Value {
    serde_json::from_str(&sc.run_json().expect("runs").0).expect("json")
}

fn fresh(datum: &str) -> LunarFrameCampaignScenario {
    LunarFrameCampaignScenario {
        epoch_year: Some(2026),
        epoch_month: Some(12),
        epoch_day: Some(1),
        station_datum: Some(datum.to_string()),
        ..Default::default()
    }
}

#[test]
fn a_fully_observed_schedule_emits_neither_field() {
    let v = run(LunarFrameCampaignScenario::default());
    assert!(v.get("unobserved_beacons").is_none() && v.get("warning").is_none());
}

#[test]
fn an_unobserved_beacon_is_named_and_the_others_keep_their_sigmas() {
    for (datum, translation, observed_sigma) in [
        ("fixed", 10.021467977424644, true),
        // 0.36 portable maths (docs/revisions/STUDIO15-batch4-rebaseline.md): was
        // 632.3769172997296 on host maths.
        ("estimated-anchor-first", 632.3772338224321, false),
    ] {
        let v = run(fresh(datum));
        assert_eq!(
            v["unobserved_beacons"],
            serde_json::json!(["Shackleton crater (south pole)"])
        );
        assert!(v["warning"].as_str().unwrap().contains("1 of 4 beacons"));
        // The datum is the one computed before this change, to the bit.
        assert_eq!(
            v["datum_accuracy"]["translation_sigma_norm_m"].as_f64(),
            Some(translation)
        );
        for b in v["campaign"]["beacons"].as_array().unwrap() {
            let s = b["sigma_3d_m"].as_f64();
            if b["observations"] == 0 {
                assert!(s.is_none(), "{datum}: the unobserved beacon has no sigma");
            } else if observed_sigma {
                // Stations fixed: the observed beacons' own 9 x 9 information is full rank.
                let s = s.expect("observed beacon sigma");
                assert!((s - 12.50).abs() < 0.01, "{datum}: {s}");
            } else {
                // Stations estimated: the observed beacons' block is itself rank-deficient (8 of
                // 9), so their sigmas stay null for that reason.
                assert!(s.is_none());
            }
        }
    }
}
