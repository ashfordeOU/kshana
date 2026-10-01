// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Joint UT1 and polar-motion error over a common row set"
//! (row 86): the row's predicted-versus-final measurement, run on archived IERS Bulletin A
//! vintages, against the prediction accuracy IERS itself prints in every issue.
//!
//! ORACLE (Reference): the accuracy statement printed in each weekly IERS Bulletin A,
//! `S x,y = 0.00068 (MJD-MJD0)**0.80` arcsec and `S t = 0.00025 (MJD-MJD0)**0.75` s
//! (coefficients, exponents and MJD0 parsed from each issue), https://datacenter.iers.org/
//! (product 6, Bulletin A). Data: 178 issues, MJD0 59963-61209 (2023-01-19 to 2026-06-17),
//! scored against the Bulletin B block of the frozen 2026-09-30 `finals2000A.all`. Fixture
//! and provenance: `tests/fixtures/eop_bulletin_a_vintages_oracle/`.
//!
//! UNDER TEST: `frame_eop::predicted_vs_final_ut1` (UT1) and the `pm_archived` column of
//! `frame_eop::archived_vintage_comparison` (pole), each issue's residual reduced to an RMS
//! per horizon over all issues by this test.
//!
//! TOLERANCE, fixed before the first comparison (record B3-PREREGISTRATION.md): at 10, 20,
//! 30 and 40 days, UT1 RMS / S_t and pole RMS / (sqrt(2) S_xy) each in [1/1.5, 1.5] (the
//! pole residual is the 2-D magnitude, S_xy is per coordinate; equal independent x and y
//! errors assumed). PASS only if all eight ratios hold, over at least two years of issues.
//!
//! VERDICT (first and only run, 2026-10-01): DISAGREES, the row stays MODELLED. Measured
//! RMS / formula over 178 issues:
//!
//! | horizon | UT1 ratio | pole ratio |
//! |---|---|---|
//! | 10 d | 0.477 | 0.766 |
//! | 20 d | 0.951 | 0.797 |
//! | 30 d | 1.309 | 0.793 |
//! | 40 d | 1.585 | 0.767 |
//!
//! The pole agrees at every horizon. UT1 does not: Bulletin A's real 10-day UT1 error
//! (0.67 ms) is half the printed 1.41 ms and its 40-day error (6.30 ms) is 1.59 times the
//! printed 3.98 ms; the measured growth from 10 to 40 days is close to h^1.6, against the
//! formula's h^0.75. The test below pins this finding (pole inside the band, UT1 outside
//! it at 10 and 40 days) so that a change on either side is noticed; it does not promote.

#[path = "fixtures/eop_bulletin_a_vintages_oracle/vintages.rs"]
mod vintages;

use kshana::frame_eop::{
    archived_vintage_comparison, predicted_vs_final_ut1, Horizon, OperationalPredictorConfig,
};

const CLAIM_HORIZONS: [u32; 4] = [10, 20, 30, 40];
const FACTOR: f64 = 1.5;

/// Per horizon: (n issues, UT1 RMS s, S_t RMS s, pole RMS arcsec, sqrt(2) S_xy RMS arcsec).
fn measure(horizons: &[u32]) -> Vec<(u32, usize, f64, f64, f64, f64)> {
    let issues = vintages::issues();
    let later = vintages::later_finals_body();
    let hs: Vec<Horizon> = horizons.iter().map(|&d| Horizon::Days(d)).collect();
    let cfg = OperationalPredictorConfig::default();
    let mut acc: Vec<(usize, f64, f64, f64, f64)> = vec![(0, 0.0, 0.0, 0.0, 0.0); horizons.len()];
    for iss in &issues {
        let body = iss.as_issued_body();
        let ut1 = predicted_vs_final_ut1(&body, &later, &hs);
        let arch = archived_vintage_comparison(&body, &later, &hs, &cfg);
        for (k, &d) in horizons.iter().enumerate() {
            let u = ut1
                .iter()
                .find(|e| e.horizon == Horizon::Days(d))
                .unwrap_or_else(|| panic!("issue {} has no UT1 residual at {d} d", iss.id));
            let p = arch
                .iter()
                .find(|r| r.horizon == Horizon::Days(d))
                .unwrap_or_else(|| panic!("issue {} has no pole residual at {d} d", iss.id));
            assert_eq!(u.n, 1, "one prediction per issue per horizon");
            assert_eq!(p.pm_archived.n, 1);
            assert_eq!(p.issue_mjd, iss.mjd0, "cutoff must be the printed MJD0");
            let h = d as f64;
            let a = &mut acc[k];
            a.0 += 1;
            a.1 += u.rms_s * u.rms_s;
            a.2 += iss.s_t(h).powi(2);
            a.3 += p.pm_archived.rms_native.powi(2);
            a.4 += 2.0 * iss.s_xy(h).powi(2);
        }
    }
    horizons
        .iter()
        .zip(acc)
        .map(|(&d, (n, u2, st2, p2, sxy2))| {
            let nf = n as f64;
            (
                d,
                n,
                (u2 / nf).sqrt(),
                (st2 / nf).sqrt(),
                (p2 / nf).sqrt(),
                (sxy2 / nf).sqrt(),
            )
        })
        .collect()
}

#[test]
fn measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not() {
    let issues = vintages::issues();
    let span_days = issues.last().unwrap().mjd0 - issues.first().unwrap().mjd0;
    assert!(
        span_days >= 730.0,
        "at least two years of issues ({span_days} d)"
    );

    let rows = measure(&CLAIM_HORIZONS);
    let mut failures = Vec::new();
    for &(d, n, u, st, p, sxy) in &rows {
        let ru = u / st;
        let rp = p / sxy;
        println!(
            "h={d:>2} d n={n} UT1 RMS {:.4} ms vs S_t {:.4} ms ratio {ru:.3}; \
             pole RMS {:.3} mas vs sqrt2*S_xy {:.3} mas ratio {rp:.3}",
            u * 1e3,
            st * 1e3,
            p * 1e3,
            sxy * 1e3
        );
        for (what, r) in [("UT1", ru), ("pole", rp)] {
            if !(1.0 / FACTOR..=FACTOR).contains(&r) {
                failures.push(format!("{what} at {d} d: ratio {r:.3}"));
            }
        }
    }
    // Informational horizons, outside the claim.
    for &(d, n, u, st, p, sxy) in &measure(&[1, 2, 5]) {
        println!(
            "(info) h={d} d n={n} UT1 ratio {:.3}, pole ratio {:.3}",
            u / st,
            p / sxy
        );
    }
    // The pre-registered verdict: PASS only with no failure. Recorded finding: exactly the
    // UT1 ratios at 10 d (below 1/1.5) and 40 d (above 1.5) fall outside the band.
    assert_eq!(
        failures.len(),
        2,
        "the recorded finding has changed, re-examine the row: {failures:?}"
    );
    assert!(failures[0].starts_with("UT1 at 10 d") && failures[1].starts_with("UT1 at 40 d"));
}
