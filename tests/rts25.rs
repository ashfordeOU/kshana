// SPDX-License-Identifier: AGPL-3.0-only
//! Business-clock divergence against the RTS 25 limits: the limits as written in the Annex of
//! Delegated Regulation (EU) 2017/574, and the arithmetic on synthetic offset series.

use kshana::rts25::{assess, Activity, ACTIVITY_NAMES};

#[test]
fn limits_are_the_annex_values() {
    // (maximum divergence from UTC, timestamp granularity), Annex Tables 1 and 2.
    let want = [
        ("venue-latency-above-1ms", 1e-3, 1e-3),
        ("venue-latency-at-most-1ms", 100e-6, 1e-6),
        ("high-frequency", 100e-6, 1e-6),
        ("voice", 1.0, 1.0),
        ("request-for-quote-human", 1.0, 1.0),
        ("negotiated-transactions", 1.0, 1.0),
        ("other-trading", 1e-3, 1e-3),
    ];
    assert_eq!(want.len(), ACTIVITY_NAMES.len());
    for (name, d, g) in want {
        assert_eq!(
            Activity::from_name(name).unwrap().limits_s(),
            (d, g),
            "{name}"
        );
    }
    assert!(Activity::from_name("hft").is_none());
}

#[test]
fn excursions_gaps_and_outcomes() {
    let t: Vec<f64> = (0..100).map(f64::from).collect();
    let mut x = vec![20e-6; 100];
    let r = assess(Activity::HighFrequency, &t, &x, 2.0);
    assert_eq!(
        (r.outcome, r.samples_beyond, r.excursions.len()),
        ("within limit", 0, 0)
    );
    x[10] = 150e-6;
    x[11] = -180e-6;
    x[50] = 101e-6;
    let r = assess(Activity::HighFrequency, &t, &x, 2.0);
    assert_eq!((r.outcome, r.samples_beyond), ("beyond limit", 3));
    assert_eq!(r.excursions.len(), 2);
    assert_eq!(
        (
            r.excursions[0].from_s,
            r.excursions[0].to_s,
            r.excursions[0].peak_s
        ),
        (10.0, 11.0, -180e-6)
    );
    assert_eq!(r.max_abs_divergence_s, 180e-6);
    // The same record is within the 1 ms limit of other trading.
    assert_eq!(
        assess(Activity::OtherTrading, &t, &x, 2.0).outcome,
        "within limit"
    );
    // A gap longer than the stated maximum makes a clean record not assessable.
    let mut t2 = t.clone();
    for v in t2.iter_mut().skip(60) {
        *v += 30.0;
    }
    let r = assess(Activity::OtherTrading, &t2, &x, 2.0);
    assert_eq!(r.outcome, "not assessable");
    assert_eq!(r.gaps, vec![(59.0, 31.0)]);
    assert_eq!(
        assess(Activity::Voice, &[], &[], 1.0).outcome,
        "not assessable"
    );
}
