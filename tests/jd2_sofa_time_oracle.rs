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
//! VERDICT (2026-10-02, first run): AGREES at the pre-registered tolerance. Worst gap over the
//! 224 instants: dtf2d 9.6e-12 s, utctai 1.9e-11 s, taiutc 1.9e-11 s; internal round trip
//! 1.9e-11 s. Deliberate mutations turn this test red: every UTC day 86 400 s long (the
//! leap-second instants are rejected as invalid times, panic at the first one), and the
//! leap-day fraction left unscaled in `utc_to_tai` (243 failures, up to 1 s). Pre-registration
//! commit e947e69d. Fixture and provenance: `tests/fixtures/jd2_sofa_time_oracle/`.

use kshana::jd2::{tai_to_utc, utc_to_tai, Jd2};

const DIR: &str = "tests/fixtures/jd2_sofa_time_oracle";
const TOL_S: f64 = 1e-6;

fn rows(file: &str) -> Vec<Vec<String>> {
    std::fs::read_to_string(format!("{DIR}/{file}"))
        .unwrap_or_else(|e| panic!("{DIR}/{file}: {e} (run the generator)"))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

/// `(kshana - oracle)` in seconds, part by part.
fn gap(k: Jd2, d1: f64, d2: f64) -> f64 {
    ((k.day - d1) + (k.frac - d2)) * 86_400.0
}

/// Every instant through the three conversions; returns the failures and the worst gaps.
fn compare() -> (Vec<String>, [f64; 4]) {
    let instants = rows("instants.csv");
    let oracle = rows("erfa.csv");
    assert_eq!(instants.len(), oracle.len(), "one oracle row per instant");
    assert_eq!(
        instants.len(),
        27 * 6 + 2 + 60,
        "the pre-registered instant set"
    );
    let mut fails = Vec::new();
    let mut worst = [0.0_f64; 4];
    for (i, o) in instants.iter().zip(&oracle) {
        let n = |k: usize| i[k].parse::<u32>().unwrap();
        let sec: f64 = i[5].parse().unwrap();
        let e: Vec<f64> = o.iter().map(|x| x.parse().unwrap()).collect();
        let utc = Jd2::from_utc_calendar(i[0].parse().unwrap(), n(1), n(2), n(3), n(4), sec)
            .unwrap_or_else(|err| panic!("{i:?}: {err}"));
        let tai = utc_to_tai(utc);
        let back = tai_to_utc(Jd2::from_parts(e[2].floor(), (e[2] - e[2].floor()) + e[3]));
        let gaps = [
            gap(utc, e[0], e[1]),
            gap(tai, e[2], e[3]),
            gap(back, e[4], e[5]),
            tai_to_utc(tai).diff_seconds(utc),
        ];
        for (w, g) in worst.iter_mut().zip(gaps) {
            *w = w.max(g.abs());
        }
        for (name, g) in ["dtf2d", "utctai", "taiutc", "round trip"].iter().zip(gaps) {
            if g.abs() > TOL_S {
                fails.push(format!("{}: {name} off by {g:.3e} s", i[..6].join(" ")));
            }
        }
    }
    (fails, worst)
}

#[test]
fn jd2_calendar_and_leap_second_conversions_agree_with_erfa() {
    let (fails, worst) = compare();
    println!(
        "worst |gap| (s): dtf2d {:.3e}, utctai {:.3e}, taiutc {:.3e}, round trip {:.3e}",
        worst[0], worst[1], worst[2], worst[3]
    );
    assert!(
        fails.is_empty(),
        "{} failures:\n{}",
        fails.len(),
        fails.join("\n")
    );
}
