// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Joint UT1 and polar-motion error" (row 86, M034), round 2:
//! Kshana's measured prediction error of archived IERS Bulletin A issues against the IERS
//! Rapid Service/Prediction Centre's OWN realised prediction-error statistics.
//!
//! WHY A NEW COMPARISON. Round 1 compared the measured error with the accuracy FORMULA each
//! Bulletin A prints (S_t, S_xy), which is a model of the error, not a measurement of it: the
//! pole agreed and UT1 did not (record M034). The round-2 plan named the realised
//! prediction-error statistics in the IERS Annual Reports 2023-2024. Those reports do not
//! exist: on 2026-10-02 the IERS publication list (https://www.iers.org, Publications,
//! Annual Reports) and the IERS data-centre DOI landing pages end at the Annual Report
//! 2019 (requests for ar2020..ar2024 return 404). The most recent published realised
//! statistics are therefore those of the IERS Annual Report 2019 (Rapid Service/Prediction
//! Centre report, section 3.5), and the comparison is moved to the year they describe,
//! 2019. This pre-registration is written before that report's tables are opened and
//! before the 2019 Bulletin A issues are fetched.
//!
//! QUANTITY. For every prediction horizon h the AR 2019 RS/PC realised-accuracy table lists
//! (up to 365 days, the Bulletin A prediction span) and for each quantity it lists (UT1-UTC;
//! polar motion), the realised error statistic of 2019 Bulletin A predictions.
//!
//! INPUTS. Every weekly IERS Bulletin A issue of Vol. XXXII (2019), from
//! https://datacenter.iers.org/data/6/ (IERS: free use with citation), plus the last two
//! issues of Vol. XXXI for the as-issued rapid window, turned into as-issued finals2000A
//! bodies exactly as round 1 does (`tests/fixtures/eop_bulletin_a_vintages_oracle/`); truth =
//! the Bulletin B block of the frozen 2026-09-30 finals2000A.all (SHA-256 cc80680e...).
//! Pipeline under test: `frame_eop::predicted_vs_final_ut1` (UT1) and
//! `frame_eop::archived_vintage_comparison` (`pm_archived`, the 2-D pole error).
//!
//! ORACLE (Measured/Reference): IERS Annual Report 2019, RS/PC section, the realised
//! prediction-error table, transcribed into
//! `tests/fixtures/joint_eop_error_iers_ar2019_oracle/ar2019_table.csv` with page numbers.
//!
//! MAPPING, fixed now. UT1: Kshana computes the statistic the table names (RMS or mean
//! absolute error) over the per-issue absolute residuals at h. Pole: compared only where the
//! table gives an RMS, as Kshana's RMS of the 2-D error against sqrt(RMS_x^2 + RMS_y^2) (or
//! against a combined RMS if the table gives one). A table statistic Kshana cannot form from
//! these residuals (for example a signed mean or a standard deviation about the mean, or a
//! per-coordinate mean absolute error) is recorded as not comparable. If the table's truth
//! series or prediction set differs (for example the daily rather than the weekly
//! predictions, or C04 rather than Bulletin B), the weekly issues and Bulletin B are kept and
//! the difference is recorded; the tolerance below is meant to absorb that sampling.
//!
//! TOLERANCE, fixed now: Kshana / IERS in [0.8, 1.25] for every comparable (quantity,
//! horizon) row. PASS only if every comparable row holds AND at least one UT1 row and one
//! pole row are comparable. Otherwise the row does not promote.

//! RESULT (first run, 2026-10-02): AGREES. The report has four realised-error tables (3a-3d,
//! one per daily update time); Table 3a, the 17:00 UTC solution the weekly Bulletin A is
//! issued from, was transcribed. 52 issues (MJD0 58486 to 58843). Kshana / IERS:
//!
//! | h (d) | UT1 RMS ratio | pole RMS ratio |
//! |---|---|---|
//! | 1 | 1.040 | 1.067 |
//! | 5 | 1.058 | 1.071 |
//! | 10 | 1.100 | 1.010 |
//! | 20 | 1.042 | 1.014 |
//! | 40 | 1.006 | 1.014 |
//! | 90 | 1.001 | 1.005 |
//!
//! Day 0 (the table's first row) is not comparable: it is the issue's own cutoff, a rapid
//! value, and the pipeline scores predictions past the cutoff (recorded, not hidden). The
//! table's truth is 14 C04 and its predictions the daily solutions; here the truth is the
//! Bulletin B block and the predictions the weekly issues, as fixed above. After the first
//! run one assertion was added that makes the test stricter (all six scorable horizons must
//! be compared). Mutations that turn this test red: scoring against the final one day early
//! (horizons drop out), and scaling the UT1 residual by 1.3 (ratios 1.35-1.43).
//!
//! CORRECTIONS (2026-10-02, after an adversarial review), so the record above is exact:
//! * Timing. The sentence "written before ... the 2019 Bulletin A issues are fetched" is not
//!   exact: one input issue, Vol. XXXII No. 001 (3 January 2019), was fetched to a scratch
//!   file at 02:55:29 UTC to check its layout, 68 s before the pre-registration commit
//!   df52afa0 (02:56:37). The report's PDF (02:56:44) and the bulk fetch (02:57:08-02:57:58)
//!   followed the commit. One issue's prediction table does not reveal any ratio.
//! * Post-pre-registration change to the comparison mechanics. As committed in df52afa0,
//!   `generate.py` took every table horizon including day 0 as a prediction lead and writes
//!   an issue only when it has a prediction at every lead; no issue has a prediction row at
//!   lead 0, so no issue could be written. `residuals()` unwrapped the pipeline's row, which
//!   would panic at a horizon the pipeline does not form. After the table was transcribed
//!   (02:57:07) and the issues fetched, `generate.py` was edited (02:58:23) to drop day 0
//!   from the leads, and `residuals()` was changed to return `None` for a horizon the
//!   pipeline does not form (both in commit 0c216754). No Kshana ratio could have been formed
//!   before that edit (no issue written; the test needs at least 50). The table's values, the
//!   oracle, had been seen.
//! * Scope. This file checks `predicted_vs_final_ut1` and the `pm_archived` output of
//!   `archived_vintage_comparison` only. The joint persistence table (G14), its identical
//!   epoch sets, the combination at the Moon and the stated status of the predicted-versus-
//!   final tables are checked against astropy and ERFA in
//!   `tests/joint_eop_table_astropy_erfa_oracle.rs`, which also checks `pm_archived` exactly
//!   (dropping the pole's y component there turns that test red with 24 failures; here it
//!   fails only at 1 and 90 days, 0.754 and 0.690, as the review found).
//! * The as-issued bodies now carry the IERS I/P flags (`vintages.rs`), as the round-1 reader
//!   does on feat/r2-ephem; on this branch every ratio is unchanged to the printed digit.

#[path = "fixtures/joint_eop_error_iers_ar2019_oracle/vintages.rs"]
mod vintages;

use kshana::frame_eop::{
    archived_vintage_comparison, predicted_vs_final_ut1, Horizon, OperationalPredictorConfig,
};

const LOW: f64 = 0.8;
const HIGH: f64 = 1.25;
const TABLE: &str = include_str!("fixtures/joint_eop_error_iers_ar2019_oracle/ar2019_table.csv");

/// One transcribed table row: quantity (`ut1`, `pole`, `pole_x`, `pole_y`), statistic
/// (`rms`, `mae`, or anything else = not comparable), horizon in days, value (ms or mas).
struct Row {
    quantity: String,
    statistic: String,
    horizon: u32,
    value: f64,
}

fn table() -> Vec<Row> {
    TABLE
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .skip(1)
        .map(|l| {
            let f: Vec<&str> = l.split(',').map(str::trim).collect();
            Row {
                quantity: f[0].to_string(),
                statistic: f[1].to_string(),
                horizon: f[2].parse().unwrap(),
                value: f[3].parse().unwrap(),
            }
        })
        .collect()
}

/// Per-issue absolute UT1 residual (ms) and 2-D pole residual (mas) at horizon `d`, or
/// `None` when the pipeline forms no residual at that horizon.
fn residuals(d: u32) -> Option<(Vec<f64>, Vec<f64>)> {
    let later = vintages::later_finals_body();
    let hs = [Horizon::Days(d)];
    let cfg = OperationalPredictorConfig::default();
    let (mut u, mut p) = (Vec::new(), Vec::new());
    for iss in vintages::issues() {
        let body = iss.as_issued_body();
        let ut1 = predicted_vs_final_ut1(&body, &later, &hs);
        let arch = archived_vintage_comparison(&body, &later, &hs, &cfg);
        let e = ut1.iter().find(|e| e.horizon == Horizon::Days(d))?;
        let r = arch.iter().find(|r| r.horizon == Horizon::Days(d))?;
        assert_eq!(e.n, 1);
        u.push(e.rms_s * 1e3);
        p.push(r.pm_archived.rms_native * 1e3);
    }
    Some((u, p))
}

fn rms(v: &[f64]) -> f64 {
    (v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt()
}
fn mae(v: &[f64]) -> f64 {
    v.iter().sum::<f64>() / v.len() as f64
}

/// (comparable rows, failures, ut1 rows compared, pole rows compared).
fn compare() -> (Vec<String>, Vec<String>, usize, usize) {
    let rows = table();
    let mut horizons: Vec<u32> = rows.iter().map(|r| r.horizon).collect();
    horizons.sort_unstable();
    horizons.dedup();
    let (mut lines, mut fails, mut nu, mut np) = (Vec::new(), Vec::new(), 0, 0);
    for d in horizons {
        let Some((u, p)) = residuals(d) else {
            println!("h={d} d: not comparable (the pipeline forms no residual at this horizon)");
            continue;
        };
        let at = |q: &str, s: &str| {
            rows.iter()
                .find(|r| r.horizon == d && r.quantity == q && r.statistic == s)
                .map(|r| r.value)
        };
        let mut check = |what: &str, kshana: f64, iers: f64| {
            let ratio = kshana / iers;
            let line =
                format!("{what} h={d} d: Kshana {kshana:.4} IERS {iers:.4} ratio {ratio:.3}");
            println!("{line}");
            if !(LOW..=HIGH).contains(&ratio) {
                fails.push(line.clone());
            }
            lines.push(line);
        };
        if let Some(v) = at("ut1", "rms") {
            check("UT1 RMS (ms)", rms(&u), v);
            nu += 1;
        } else if let Some(v) = at("ut1", "mae") {
            check("UT1 MAE (ms)", mae(&u), v);
            nu += 1;
        }
        let pole = at("pole", "rms").or_else(|| {
            at("pole_x", "rms")
                .zip(at("pole_y", "rms"))
                .map(|(x, y)| x.hypot(y))
        });
        if let Some(v) = pole {
            check("pole RMS (mas)", rms(&p), v);
            np += 1;
        }
    }
    (lines, fails, nu, np)
}

#[test]
fn bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics() {
    let issues = vintages::issues();
    assert!(issues.len() >= 50, "a full year of weekly issues");
    let (_, fails, nu, np) = compare();
    assert!(
        nu >= 1 && np >= 1,
        "need comparable UT1 and pole rows ({nu}, {np})"
    );
    // Added after the first run (stricter, not looser): every table horizon the pipeline
    // can score (1, 5, 10, 20, 40 and 90 d; day 0 is the issue's own cutoff) must be
    // compared, so a horizon cannot drop out silently.
    assert_eq!((nu, np), (6, 6), "every scorable horizon compared");
    assert!(fails.is_empty(), "outside [{LOW}, {HIGH}]: {fails:?}");
}
