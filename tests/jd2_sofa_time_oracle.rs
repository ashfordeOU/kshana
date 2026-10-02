// SPDX-License-Identifier: AGPL-3.0-only
//! Two-part Julian dates on the Earth-orbit time path against SOFA (Standards of Fundamental
//! Astronomy) through ERFA (Essential Routines for Fundamental Astronomy). New row, package D8.
//!
//! QUANTITY: three conversions of `kshana::jd2`, each returning a two-part Julian date
//! (`Jd2 { day, frac }`) so that a microsecond survives at Julian dates near 2.46e6:
//! 1. `Jd2::from_utc_calendar(year, month, day, hour, minute, second)`: a UTC calendar date
//!    and time to a two-part UTC "quasi Julian date" with the SOFA `iauDtf2d` convention for
//!    leap-second days (that day is 86 401 s long, 23:59:60.x is a valid time, and the
//!    fraction of that day is counted in units of its own length);
//! 2. `jd2::utc_to_tai(Jd2)`: UTC quasi Julian date to TAI (International Atomic Time)
//!    Julian date, the SOFA `iauUtctai` convention;
//! 3. `jd2::tai_to_utc(Jd2)`: TAI Julian date back to the UTC quasi Julian date, the SOFA
//!    `iauTaiutc` convention.
//!
//! The compared figure for each output is `((day_k - d1_o) + (frac_k - d2_o)) * 86 400` s,
//! formed part by part so that the integer days cancel exactly; `_k` is Kshana and `_o` the
//! oracle's (d1, d2) pair. The round trip UTC calendar -> UTC -> TAI -> UTC is also checked
//! against the first leg (an internal identity, reported but not counted as the oracle).
//!
//! INPUTS (committed as `tests/fixtures/jd2_sofa_time_oracle/instants.csv`, written by the
//! generator script from fixed rules, before the oracle is run): every leap second inserted
//! from 1972-06-30 to 2016-12-31 (27), with the instants 23:59:59.000000, 23:59:59.999999,
//! 23:59:60.000000, 23:59:60.500000 and 23:59:60.999999 on the leap day and 00:00:00.000001
//! on the day after; 1972-01-01T00:00:00; 2026-10-02T12:34:56.789012; and 60 instants drawn
//! uniformly from 1972-01-01 to 2026-12-31 with a fixed seed (Python `random.Random(20261002)`),
//! seconds to the microsecond. Scope: UTC from 1972-01-01 onward. The pre-1972 UTC with its
//! drifting rate offsets is not modelled by `kshana::timescales` and is outside the claim.
//!
//! ORACLE (Reference: the SOFA algorithms, run as ERFA): pyerfa 2.0.1.5 (BSD-3-Clause; ERFA
//! is the BSD-licensed release of the SOFA routines) functions `erfa.dtf2d("UTC", ...)`,
//! `erfa.utctai` and `erfa.taiutc` on the committed instants; outputs committed as
//! `tests/fixtures/jd2_sofa_time_oracle/erfa.csv` with 17 significant digits per part.
//!
//! TOLERANCE (fixed before the first comparison, 2026-10-02, from the package D8 statement
//! "SOFA iauDtf2d and iauTaiutc round trips at 1 microsecond"): every instant and every one
//! of the three conversions within 1e-6 s; the internal round trip within 1e-6 s.
//!
//! VERDICT: not yet run.

#[test]
#[ignore = "pre-registered; not yet run"]
fn jd2_calendar_and_leap_second_conversions_agree_with_erfa() {
    panic!("pre-registered; the comparison is written after the pre-registration commit");
}
