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

/// Per-issue absolute UT1 residual (ms) and 2-D pole residual (mas) at horizon `d`.
fn residuals(d: u32) -> (Vec<f64>, Vec<f64>) {
    let later = vintages::later_finals_body();
    let hs = [Horizon::Days(d)];
    let cfg = OperationalPredictorConfig::default();
    let (mut u, mut p) = (Vec::new(), Vec::new());
    for iss in vintages::issues() {
        let body = iss.as_issued_body();
        let ut1 = predicted_vs_final_ut1(&body, &later, &hs);
        let arch = archived_vintage_comparison(&body, &later, &hs, &cfg);
        let e = ut1.iter().find(|e| e.horizon == Horizon::Days(d)).unwrap();
        let r = arch.iter().find(|r| r.horizon == Horizon::Days(d)).unwrap();
        assert_eq!(e.n, 1);
        u.push(e.rms_s * 1e3);
        p.push(r.pm_archived.rms_native * 1e3);
    }
    (u, p)
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
        let (u, p) = residuals(d);
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
#[ignore = "pre-registered; not yet run"]
fn bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics() {
    let issues = vintages::issues();
    assert!(issues.len() >= 50, "a full year of weekly issues");
    let (_, fails, nu, np) = compare();
    assert!(
        nu >= 1 && np >= 1,
        "need comparable UT1 and pole rows ({nu}, {np})"
    );
    assert!(fails.is_empty(), "outside [{LOW}, {HIGH}]: {fails:?}");
}
