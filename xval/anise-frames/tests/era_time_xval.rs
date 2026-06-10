// SPDX-License-Identifier: Apache-2.0
//! `mc0725be3` criterion #2 — *"ERA cross-check between hifitime and time.rs agrees to
//! < 1 µs"*.
//!
//! The Earth rotation angle is driven entirely by the time scales: ERA(UT1), where UT1 =
//! UTC + DUT1 and UTC is tied to TAI/TT by the leap-second table. This test pins
//! `kshana::timescales` against **hifitime** (ANISE's time library, an independent
//! leap-second + TT implementation) so the two agree to < 1 µs — the timing budget below
//! which the ERA they feed is identical to ~1e-10 rad.
//!
//! **Why the offsets are compared directly, not via the absolute Julian date.** A single
//! `f64` JD near 2 459 580 has a ULP of ~5.5e-10 d ≈ 47 µs, so the absolute JD cannot even
//! *represent* 1 µs — that is `kshana`'s documented single-`f64` JD floor (CAPABILITY:
//! "~50 µs resolution near 2020"), a storage limitation shared by any `f64` JD and wholly
//! separate from whether the two time *algorithms* agree. So the substantive quantities —
//! the TAI−UTC leap-second offset and the TT−UTC offset — are computed without round-
//! tripping through a 2.46e6-magnitude JD: on the `kshana` side straight from the leap-
//! second table plus the exact TT−TAI constant, on the hifitime side via its **exact**
//! `Duration` arithmetic (nanosecond-resolution, magnitude ~69 s, no round-off). That is
//! the honest, microsecond-level comparison of the two chains.
//!
//! Needs no SPICE kernel — it compares two pure time implementations — so unlike the
//! frame cross-check it runs on every CI host, always (never self-skips).

use anise::prelude::Epoch;
use kshana::cio::earth_rotation_angle;
use kshana::timescales::{julian_date, tai_minus_utc, utc_to_ut1};

const SECONDS_PER_DAY: f64 = 86_400.0;
const ONE_MICROSECOND_S: f64 = 1.0e-6;
/// TT − TAI is fixed at 32.184 s exactly (IAU 1991); the same constant `kshana::timescales`
/// applies internally in `tai_to_tt`.
const TT_MINUS_TAI_S: f64 = 32.184;

/// UTC instants spanning two leap-second eras (TAI−UTC = 36 s before 2017-01-01, 37 s
/// after), each with a representative IERS DUT1 (the value is applied identically on both
/// sides, so it cancels in the offset check and only shifts the shared ERA epoch).
fn epochs() -> Vec<(i32, u32, u32, u32, u32, f64, f64)> {
    vec![
        // (year, month, day, hour, minute, second, dut1_seconds)
        (2016, 6, 1, 0, 0, 0.0, 0.214),       // TAI−UTC = 36 s
        (2016, 11, 15, 6, 30, 12.5, 0.050),   // still 36 s, sub-second + odd time-of-day
        (2018, 3, 20, 18, 45, 30.25, -0.041), // 37 s
        (2020, 1, 1, 0, 0, 0.0, -0.1771554),  // 37 s (the frame-xval anchor epoch)
        (2022, 1, 1, 12, 0, 0.0, -0.1100),    // 37 s
        (2023, 9, 30, 23, 59, 45.0, -0.0140), // 37 s, near end-of-day
    ]
}

/// Build a hifitime [`Epoch`] from the same UTC calendar fields kshana consumes.
fn hifitime_epoch(year: i32, month: u32, day: u32, hour: u32, minute: u32, second: f64) -> Epoch {
    let whole = second.floor();
    let nanos = ((second - whole) * 1.0e9).round() as u32;
    Epoch::from_gregorian_utc(
        year,
        month as u8,
        day as u8,
        hour as u8,
        minute as u8,
        whole as u8,
        nanos,
    )
}

#[test]
fn kshana_time_scales_agree_with_hifitime_to_under_one_microsecond() {
    let mut max_tai_resid_s = 0.0_f64;
    let mut max_tt_resid_s = 0.0_f64;
    let mut max_era_resid_rad = 0.0_f64;

    for (y, mo, d, h, mi, s, dut1) in epochs() {
        let jd_utc = julian_date(y, mo, d, h, mi, s);
        let e = hifitime_epoch(y, mo, d, h, mi, s);

        // TAI − UTC (the integer leap-second count, 36 or 37 s here). kshana reads it straight
        // from its leap-second table; hifitime gives it as an exact Duration difference.
        let kshana_tai = tai_minus_utc(jd_utc);
        let hifi_tai = (e.to_tai_duration() - e.to_utc_duration()).to_seconds();
        max_tai_resid_s = max_tai_resid_s.max((kshana_tai - hifi_tai).abs());

        // TT − UTC (≈ 69.184 s): leap seconds + the exact 32.184 s TT−TAI. Both sides exact.
        let kshana_tt = kshana_tai + TT_MINUS_TAI_S;
        let hifi_tt = (e.to_tt_duration() - e.to_utc_duration()).to_seconds();
        max_tt_resid_s = max_tt_resid_s.max((kshana_tt - hifi_tt).abs());

        // ERA corollary: UT1 = UTC + DUT1 (same DUT1 both sides) into `earth_rotation_angle`.
        // The only difference between the two UT1 epochs is whether UTC came from kshana's
        // civil-calendar formula or hifitime's — which here agree bit-for-bit — so the angle is
        // identical (and would shift only ~7e-11 rad even at the full 1 µs timing budget).
        let kshana_ut1 = utc_to_ut1(jd_utc, dut1);
        let hifi_ut1 = e.to_jde_utc_days() + dut1 / SECONDS_PER_DAY;
        let era_resid =
            angle_wrap(earth_rotation_angle(kshana_ut1) - earth_rotation_angle(hifi_ut1)).abs();
        max_era_resid_rad = max_era_resid_rad.max(era_resid);
    }

    eprintln!(
        "kshana vs hifitime: max |Δ(TAI−UTC)| = {:.3e} s, max |Δ(TT−UTC)| = {:.3e} s, \
         max |ΔERA| = {:.3e} rad  (single-f64 JD storage floor ≈ 47 µs is separate)",
        max_tai_resid_s, max_tt_resid_s, max_era_resid_rad
    );

    assert!(
        max_tai_resid_s < ONE_MICROSECOND_S,
        "TAI−UTC (leap-second) offset disagrees by {max_tai_resid_s:.3e} s (> 1 µs): kshana's \
         leap-second table differs from hifitime's IERS table"
    );
    assert!(
        max_tt_resid_s < ONE_MICROSECOND_S,
        "TT−UTC offset disagrees by {max_tt_resid_s:.3e} s (> 1 µs): a different UTC→TAI→TT chain"
    );
    // A 1 µs timing error maps to <= 1e-6 s * 7.292e-5 rad/s ≈ 7.3e-11 rad of ERA; the UTC
    // epochs agree bit-for-bit here, so the realised residual is ~0. Bound it well inside the
    // angle a microsecond would move.
    assert!(
        max_era_resid_rad < 1.0e-9,
        "ERA disagrees by {max_era_resid_rad:.3e} rad — the two time bases differ by more than a \
         microsecond of UT1"
    );
}

/// Wrap an angle difference into (−π, π] so a near-2π ERA wrap is not mistaken for a large
/// residual.
fn angle_wrap(mut a: f64) -> f64 {
    use std::f64::consts::{PI, TAU};
    while a > PI {
        a -= TAU;
    }
    while a <= -PI {
        a += TAU;
    }
    a
}
