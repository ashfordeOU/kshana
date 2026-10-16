// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-1972 UTC (the "rubber-second" era, 1960-01-01 to 1971-12-31) on the two-part Julian-date
//! time path, against SOFA (Standards of Fundamental Astronomy) through ERFA. Package WP-03,
//! item CAP-02c.
//!
//! PRE-REGISTRATION (written 2026-10-12 and committed with the instants, before the engine
//! change and before the oracle was run).
//!
//! CHANGE UNDER TEST. Before 1972 UTC ran at an offset rate from TAI and stepped by fractions of
//! a second; TAI − UTC is the SOFA `iauDat` expression `ΔAT + (MJD − MJD_ref)·rate` for the
//! period. Today `kshana::jd2` clamps TAI − UTC to 10 s before 1972 (outside its stated scope).
//! The change makes `Jd2::from_utc_calendar`, `jd2::utc_to_tai`, `jd2::tai_to_utc` follow
//! `iauDtf2d`, `iauUtctai` and `iauTaiutc` from 1960-01-01: the drift table, the day length
//! `86 400 + dleap` with `dleap = ΔAT(next 0h) − (2·ΔAT(12h) − ΔAT(0h))`, and the scaling of the
//! fraction of a day from UTC to SI seconds by `(86 400 + dlod)/86 400`, `dlod = 2·(ΔAT(12h) −
//! ΔAT(0h))`. Before 1960 TAI − UTC is taken as 0, the SOFA value (status "pre-UTC"), and stays
//! outside the claim. The single-`f64` `timescales::tai_minus_utc` is NOT changed.
//!
//! EXPECTED EFFECT (fixed now). (E1) Every result for a UTC or TAI instant on or after
//! 1972-01-01 is bit-identical: pinned below by a checksum over the outputs of the 224 instants
//! of `tests/fixtures/jd2_sofa_time_oracle/`, captured on the unmodified code. (E2) Results
//! before 1972 change; no scenario, golden or registry output uses a pre-1972 epoch, so no
//! other output moves.
//!
//! INPUTS (`tests/fixtures/jd2_pre1972_sofa_oracle/instants.csv`, written by the generator from
//! fixed rules): for each of the 15 days that start a TAI − UTC expression from 1960-01-01 to
//! 1972-01-01, the instant 00:00:00.000001 on that day and, except for 1960-01-01, on the day
//! before it 12:00:00, 23:59:59.000000 and the last valid microsecond of that day's final minute
//! (below `60 + dleap` s, `dleap` from `erfa.dat`); and 60 instants drawn uniformly from
//! 1960-01-01 to 1971-12-31 with `random.Random(20261012)`. 117 instants.
//!
//! ORACLE: pyerfa 2.0.1.5 (BSD-3-Clause; liberfa 2.0.1), `erfa.dtf2d("UTC", ...)`,
//! `erfa.utctai`, `erfa.taiutc`, output committed as `erfa.csv` (17 significant digits).
//!
//! TOLERANCE (fixed now, the bar of the 1972+ row): every instant and every one of the three
//! conversions within 1e-6 s, and the internal round trip UTC → TAI → UTC within 1e-6 s.
//!
//! VERDICT (2026-10-12, first run): AGREES at the pre-registered tolerance. Worst gap over the
//! 117 instants: dtf2d 9.6e-12 s, utctai 2.9e-11 s, taiutc 2.9e-11 s, round trip 1.9e-11 s. E1
//! holds (the 1972+ checksum is unchanged). A deliberate mutation turns it red: dropping the
//! UTC-to-SI scaling of the day fraction (190 failures, up to 2.6e-3 s). Pre-registration
//! commit 23c40661.

use kshana::jd2::{tai_to_utc, utc_to_tai, Jd2};

const DIR: &str = "tests/fixtures/jd2_pre1972_sofa_oracle";
const POST1972: &str = "tests/fixtures/jd2_sofa_time_oracle";
const TOL_S: f64 = 1e-6;

// PIN-SCOPE:    FNV-1a over the f64 bit patterns of (day, frac) of from_utc_calendar, utc_to_tai
//               and tai_to_utc(utc_to_tai) for the 224 instants (1972-2026) of the existing
//               jd2_sofa_time_oracle fixture, captured on the code before the pre-1972 change
// PIN-EXCLUDES: every pre-1972 instant and every other function
const POST1972_CHECKSUM: u64 = 0x937095e64c389bb0;

fn rows(dir: &str, file: &str) -> Vec<Vec<String>> {
    std::fs::read_to_string(format!("{dir}/{file}"))
        .unwrap_or_else(|e| panic!("{dir}/{file}: {e} (run the generator)"))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

fn utc_of(i: &[String]) -> Jd2 {
    let n = |k: usize| i[k].parse::<u32>().unwrap();
    Jd2::from_utc_calendar(
        i[0].parse().unwrap(),
        n(1),
        n(2),
        n(3),
        n(4),
        i[5].parse().unwrap(),
    )
    .unwrap_or_else(|err| panic!("{i:?}: {err}"))
}

fn gap(k: Jd2, d1: f64, d2: f64) -> f64 {
    ((k.day - d1) + (k.frac - d2)) * 86_400.0
}

fn fnv(h: &mut u64, x: f64) {
    for b in x.to_bits().to_le_bytes() {
        *h ^= b as u64;
        *h = h.wrapping_mul(0x100_0000_01b3);
    }
}

/// E1: the 1972+ results are bit-identical to the code before the change.
#[test]
fn post_1972_results_are_bit_identical() {
    let mut h: u64 = 0xcbf2_9ce4_8422_2325;
    for i in rows(POST1972, "instants.csv") {
        let utc = utc_of(&i);
        let tai = utc_to_tai(utc);
        let back = tai_to_utc(tai);
        for x in [utc.day, utc.frac, tai.day, tai.frac, back.day, back.frac] {
            fnv(&mut h, x);
        }
    }
    println!("post-1972 checksum {h:#018x}");
    assert_eq!(h, POST1972_CHECKSUM, "E1: a 1972+ result moved");
}

#[test]
fn pre_1972_utc_conversions_agree_with_erfa() {
    let instants = rows(DIR, "instants.csv");
    let oracle = rows(DIR, "erfa.csv");
    assert_eq!(instants.len(), 117, "the pre-registered instant set");
    assert_eq!(instants.len(), oracle.len(), "one oracle row per instant");
    let mut fails = Vec::new();
    let mut worst = [0.0_f64; 4];
    for (i, o) in instants.iter().zip(&oracle) {
        let e: Vec<f64> = o.iter().map(|x| x.parse().unwrap()).collect();
        let utc = utc_of(i);
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
