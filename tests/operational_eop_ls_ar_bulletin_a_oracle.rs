// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Operational-style Earth-orientation prediction error" (row
//! 135, M073), round 2: the least-squares plus autoregressive predictor with the zonal tides
//! removed analytically (`eop_ls_ar::ls_ar_predict`, IERS Conventions 2010 chapter 8 Table
//! 8.1), scored on the same 178 archived Bulletin A issues against the same bar as round 1.
//!
//! WHY A NEW PRE-REGISTRATION. Round 1 fitted a 15-day window of each issue's own rapid
//! rows (record M073: 19 of 21 conditions failed). An LS+AR predictor needs years of history,
//! so the INPUTS change: the comparison is new and is pre-registered here, before the
//! history fixture is built or the predictor is run on any 2023-2026 issue. The predictor's
//! configuration (five-year windows, AR order 20 for UT1 and pole, the term sets) was chosen
//! on the 2019 Bulletin A issues (development data, disclosed: on 2019 the UT1 ratio rose
//! from 1.11 at 1 d to about 1.8 at 10 d, the pole stayed at or below 1.14), never on the
//! 2023-2026 issues scored here.
//!
//! INPUTS. Per issue, the history a user had at MJD0: the issue's as-issued rapid rows for
//! MJD0-20..MJD0 (round-1 fixture `vintages.csv`), and for earlier dates the value printed in
//! the most recent Bulletin A combined table that tabulates the date (every such table was
//! issued before MJD0; the generator asserts it) or, for dates before the first archived
//! issue's coverage, the Bulletin B final of the frozen 2026-09-30 finals2000A.all (values
//! at least three weeks old at MJD0; the final-minus-rapid difference there is tens of
//! microseconds, disclosed as the only non-as-issued input). Fixture:
//! `tests/fixtures/operational_eop_ls_ar_oracle/history_base.csv` (generator beside it).
//! Truth and the Bulletin A predictions: the round-1 fixture
//! `tests/fixtures/eop_bulletin_a_vintages_oracle/` (178 issues, MJD0 59963-61209).
//!
//! UNDER TEST: `kshana::eop_ls_ar::ls_ar_predict` with `LsArConfig::default()`.
//!
//! ORACLE (Reference), unchanged from round 1: the archived Bulletin A predictions scored
//! against the same finals over the same issues, and the 2nd EOP PCC (Sliwinska-Bronowicz et
//! al., Earth Planets Space 2022, doi:10.1186/s40623-022-01753-9, CC BY 4.0) day-10 UT1-UTC
//! MAE range 0.36-3.13 ms.
//!
//! TOLERANCE, unchanged from round 1 (B3-PREREGISTRATION.md): mean absolute error over all
//! issues, for UT1-UTC and for the 2-D pole error, Kshana <= 1.5 x Bulletin A at every lead
//! 1..10 days (20 conditions), and Kshana's day-10 UT1-UTC MAE inside [0.36, 3.13] ms. PASS
//! only if all 21 hold.
//!
//! VERDICT (first and only run, 2026-10-02): DISAGREES, the row stays MODELLED; 12 of 21
//! conditions hold (round 1: 2). Kshana / Bulletin A MAE, UT1: 1.349, 1.735, 1.941, 2.017,
//! 2.056, 2.105, 2.092, 2.050, 1.973, 1.892 at 1..10 d (Kshana 0.089 ms at 1 d to 0.910 ms at
//! 10 d; Bulletin A 0.066 to 0.481 ms); pole: 0.903, 1.062, 1.132, 1.167, 1.192, 1.206,
//! 1.210, 1.227, 1.250, 1.273 (all inside 1.5). Day-10 UT1 MAE 0.910 ms, inside the PCC range
//! 0.36-3.13 ms. The UT1 gap at 2-10 days is the one Bulletin A closes with atmospheric
//! angular-momentum forecasts, which an LS+AR model of the series alone does not have.

#[path = "fixtures/eop_bulletin_a_vintages_oracle/vintages.rs"]
mod vintages;

use kshana::eop_ls_ar::{ls_ar_predict, EopSample, LsArConfig};
use std::collections::BTreeMap;

const FACTOR: f64 = 1.5;
const PCC_DAY10_UT1_MAE_MS: (f64, f64) = (0.36, 3.13);
const BASE: &str = include_str!("fixtures/operational_eop_ls_ar_oracle/history_base.csv");

fn base() -> BTreeMap<i64, (f64, f64, f64)> {
    BASE.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .skip(1)
        .map(|l| {
            let f: Vec<f64> = l.split(',').take(4).map(|v| v.parse().unwrap()).collect();
            (f[0] as i64, (f[1], f[2], f[3]))
        })
        .collect()
}

fn truth() -> BTreeMap<i64, (f64, f64, f64)> {
    // The round-1 later-truth body carries the Bulletin B values in its A columns.
    vintages::later_finals_body()
        .lines()
        .map(|l| {
            let m: f64 = l[7..15].trim().parse().unwrap();
            let x: f64 = l[18..27].trim().parse().unwrap();
            let y: f64 = l[37..46].trim().parse().unwrap();
            let u: f64 = l[58..68].trim().parse().unwrap();
            (m as i64, (x, y, u))
        })
        .collect()
}

/// Per lead 1..10: (n, Kshana UT1 MAE s, Bulletin A UT1 MAE s, Kshana pole MAE arcsec,
/// Bulletin A pole MAE arcsec).
fn measure() -> Vec<(usize, f64, f64, f64, f64)> {
    let base = base();
    let truth = truth();
    let cfg = LsArConfig::default();
    let mut acc = vec![(0usize, 0.0, 0.0, 0.0, 0.0); 10];
    for iss in vintages::issues() {
        let m0 = iss.mjd0;
        let mut hist: BTreeMap<i64, EopSample> = base
            .range(..(m0 as i64 - 20))
            .map(|(&m, &(x, y, u))| (m, (m as f64, x, y, u)))
            .collect();
        for &(m, x, y, u) in &iss.rapid {
            hist.insert(m as i64, (m, x, y, u));
        }
        let h: Vec<EopSample> = hist.into_values().collect();
        let pred =
            ls_ar_predict(&h, m0, 10, &cfg).unwrap_or_else(|e| panic!("issue {}: {e:?}", iss.id));
        for (k, &(m, x, y, u)) in pred.iter().enumerate() {
            let (tx, ty, tu) = truth[&(m as i64)];
            let a = iss
                .preds
                .iter()
                .find(|p| (p.0 - m).abs() < 1e-6)
                .unwrap_or_else(|| panic!("issue {} has no Bulletin A row at {m}", iss.id));
            let e = &mut acc[k];
            e.0 += 1;
            e.1 += (u - tu).abs();
            e.2 += (a.3 - tu).abs();
            e.3 += (x - tx).hypot(y - ty);
            e.4 += (a.1 - tx).hypot(a.2 - ty);
        }
    }
    acc.into_iter()
        .map(|(n, a, b, c, d)| {
            let f = n as f64;
            (n, a / f, b / f, c / f, d / f)
        })
        .collect()
}

/// Every failed condition of the 21.
fn failures() -> Vec<String> {
    let rows = measure();
    let mut out = Vec::new();
    for (k, &(n, ku, au, kp, ap)) in rows.iter().enumerate() {
        let lead = k + 1;
        println!(
            "lead {lead:>2} d n={n}: UT1 MAE {:.4} ms vs Bulletin A {:.4} ms ratio {:.3}; \
             pole {:.3} mas vs {:.3} mas ratio {:.3}",
            ku * 1e3,
            au * 1e3,
            ku / au,
            kp * 1e3,
            ap * 1e3,
            kp / ap
        );
        if ku > FACTOR * au {
            out.push(format!("UT1 {lead} d {:.2}", ku / au));
        }
        if kp > FACTOR * ap {
            out.push(format!("pole {lead} d {:.2}", kp / ap));
        }
    }
    let d10 = rows[9].1 * 1e3;
    if !(PCC_DAY10_UT1_MAE_MS.0..=PCC_DAY10_UT1_MAE_MS.1).contains(&d10) {
        out.push(format!("day-10 UT1 MAE {d10:.3} ms outside the PCC range"));
    }
    assert_eq!(rows[0].0, 178, "all 178 issues scored");
    out
}

#[test]
#[ignore = "pre-registered bar not met (2026-10-02): 12 of 21 conditions hold; UT1 MAE is 1.73 to \
            2.11 x Bulletin A at 2-10 d (bar 1.5); pole <= 1.27 x at every lead, UT1 1.35 x at 1 d \
            and day-10 UT1 MAE 0.910 ms inside the PCC range"]
fn ls_ar_predictor_meets_the_round_one_bar() {
    let f = failures();
    assert!(f.is_empty(), "failed conditions: {f:?}");
}

/// Pins the recorded outcome (first and only run, 2026-10-02): the nine UT1 conditions at
/// 2..10 days fail; the pole at every lead, UT1 at 1 day and the PCC range hold.
#[test]
fn ls_ar_predictor_against_bulletin_a_finding() {
    let f = failures();
    let expect: Vec<String> = [
        "UT1 2 d 1.73",
        "UT1 3 d 1.94",
        "UT1 4 d 2.02",
        "UT1 5 d 2.06",
        "UT1 6 d 2.11",
        "UT1 7 d 2.09",
        "UT1 8 d 2.05",
        "UT1 9 d 1.97",
        "UT1 10 d 1.89",
    ]
    .iter()
    .map(|s| s.to_string())
    .collect();
    assert_eq!(f, expect, "recorded finding changed");
}
