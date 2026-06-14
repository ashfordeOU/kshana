// SPDX-License-Identifier: Apache-2.0
//! Integration tests for the [`kshana::ephem_provider`] seam: the kernel-free
//! [`BuiltinEphemeris`] must agree exactly with the underlying analytic Sun/Moon series and must
//! return `None` for the bodies it has no series for (Mars), which is the signal the deep-space
//! light-time (D0.7) and OD (D2/D3) consumers use to reach for the DE-grade out-of-crate provider.

use kshana::body::Body;
use kshana::ephem::{moon_position, sun_position};
use kshana::ephem_provider::{BuiltinEphemeris, EphemerisProvider};

/// A fixed probe epoch (Julian Date, TDB) inside the analytic series' good span: 2022-001.5.
const PROBE_JD: f64 = 2_459_580.5;

/// `t_tt_jc` at the probe epoch (TDB ≈ TT, the documented sub-ms approximation).
fn t_at(jd: f64) -> f64 {
    (jd - 2_451_545.0) / 36_525.0
}

#[test]
fn sun_relative_to_earth_equals_the_builtin_sun_position() {
    let p = BuiltinEphemeris;
    let got = p
        .relative_position(&Body::sun(), &Body::earth(), PROBE_JD)
        .expect("builtin supplies Sun relative to Earth");
    let want = sun_position(t_at(PROBE_JD));
    for k in 0..3 {
        assert!((got[k] - want[k]).abs() < 1e-9, "Sun/Earth component {k}");
    }
}

#[test]
fn moon_relative_to_earth_equals_the_builtin_moon_position() {
    let p = BuiltinEphemeris;
    let got = p
        .relative_position(&Body::moon(), &Body::earth(), PROBE_JD)
        .expect("builtin supplies Moon relative to Earth");
    let want = moon_position(t_at(PROBE_JD));
    for k in 0..3 {
        assert!((got[k] - want[k]).abs() < 1e-9, "Moon/Earth component {k}");
    }
}

#[test]
fn earth_relative_to_earth_is_the_origin() {
    let p = BuiltinEphemeris;
    let got = p
        .relative_position(&Body::earth(), &Body::earth(), PROBE_JD)
        .expect("a body relative to itself is defined");
    assert_eq!(got, [0.0, 0.0, 0.0]);
}

#[test]
fn earth_relative_to_sun_is_the_negated_sun_position() {
    let p = BuiltinEphemeris;
    let got = p
        .relative_position(&Body::earth(), &Body::sun(), PROBE_JD)
        .expect("builtin supplies Earth relative to Sun");
    let sun = sun_position(t_at(PROBE_JD));
    for k in 0..3 {
        assert!(
            (got[k] + sun[k]).abs() < 1e-9,
            "Earth/Sun component {k} must be the negated Sun/Earth"
        );
    }
}

#[test]
fn mars_relative_to_earth_is_none() {
    let p = BuiltinEphemeris;
    assert!(
        p.relative_position(&Body::mars(), &Body::earth(), PROBE_JD)
            .is_none(),
        "the kernel-free builtin has no Mars series"
    );
}
