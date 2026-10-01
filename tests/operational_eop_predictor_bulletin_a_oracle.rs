// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Operational-style Earth-orientation prediction error,
//! measured predicted-versus-final" (row 135): the operational-style predictor, fitted on
//! the as-issued rapid values of each archived IERS Bulletin A issue, scored against the
//! later Bulletin B finals beside Bulletin A's own archived prediction for the same dates.
//!
//! ORACLE (Reference): (1) the archived IERS Bulletin A predictions themselves, scored
//! against the same finals over the same issues (https://datacenter.iers.org/, product 6);
//! (2) the 2nd Earth Orientation Parameters Prediction Comparison Campaign, Sliwinska-
//! Bronowicz et al., Earth Planets Space (2022), doi:10.1186/s40623-022-01753-9 (CC BY 4.0):
//! day-10 UT1-UTC mean absolute error 0.36 to 3.13 ms across 56 methods. Data: 178 issues,
//! MJD0 59963-61209 (2023-01-19 to 2026-06-17), finals from the Bulletin B block of the
//! frozen 2026-09-30 `finals2000A.all`. Fixture: `tests/fixtures/eop_bulletin_a_vintages_oracle/`.
//!
//! UNDER TEST: `frame_eop::archived_vintage_comparison` with the crate default
//! `OperationalPredictorConfig` (15-day window): `ut1_operational` and `pm_operational`
//! against `ut1_archived` and `pm_archived`. The fit sees only the as-issued rapid rows at
//! or before each issue's MJD0.
//!
//! TOLERANCE, fixed before the first comparison (record B3-PREREGISTRATION.md): mean
//! absolute error over all issues, for UT1 and for the pole magnitude, operational
//! <= 1.5 x Bulletin A at every lead 1..10 days (20 conditions), and the operational day-10
//! UT1-UTC MAE inside [0.36, 3.13] ms. PASS only if all 21 hold.
//!
//! VERDICT (first and only run, 2026-10-01): DISAGREES, the row stays MODELLED. 19 of the
//! 21 conditions fail. Operational / Bulletin A MAE ratio, UT1: 2.42 at 1 d, 4.66 at 2 d,
//! 6.93 at 3 d, rising to 12.6 at 7 d and 11.05 at 10 d; pole: 1.85, 1.80, 1.66, 1.57,
//! 1.51, 1.49, 1.50, 1.53, 1.56, 1.60 (inside 1.5 only at 6 and 7 d). Day-10 UT1-UTC MAE
//! 5.32 ms, outside the 2nd EOP PCC range 0.36 to 3.13 ms (Bulletin A itself: 0.48 ms).
//! The test pins this finding so a change is noticed; it does not promote.

#[path = "fixtures/eop_bulletin_a_vintages_oracle/vintages.rs"]
mod vintages;

use kshana::frame_eop::{archived_vintage_comparison, Horizon, OperationalPredictorConfig};

const FACTOR: f64 = 1.5;
const PCC_DAY10_UT1_MAE_MS: (f64, f64) = (0.36, 3.13);

struct LeadMae {
    lead: u32,
    n: usize,
    ut1_op_s: f64,
    ut1_ba_s: f64,
    pm_op_as: f64,
    pm_ba_as: f64,
}

fn measure() -> Vec<LeadMae> {
    let issues = vintages::issues();
    let later = vintages::later_finals_body();
    let leads: Vec<u32> = (1..=10).collect();
    let hs: Vec<Horizon> = leads.iter().map(|&d| Horizon::Days(d)).collect();
    let cfg = OperationalPredictorConfig::default();
    let mut out: Vec<LeadMae> = leads
        .iter()
        .map(|&lead| LeadMae {
            lead,
            n: 0,
            ut1_op_s: 0.0,
            ut1_ba_s: 0.0,
            pm_op_as: 0.0,
            pm_ba_as: 0.0,
        })
        .collect();
    for iss in &issues {
        let rows = archived_vintage_comparison(&iss.as_issued_body(), &later, &hs, &cfg);
        for m in out.iter_mut() {
            let r = rows
                .iter()
                .find(|r| r.horizon == Horizon::Days(m.lead))
                .unwrap_or_else(|| panic!("issue {} has no row at {} d", iss.id, m.lead));
            // n = 1 on every column: a missing operational fit would leave it at 0.
            for (what, n) in [
                ("ut1_operational", r.ut1_operational.n),
                ("ut1_archived", r.ut1_archived.n),
                ("pm_operational", r.pm_operational.n),
                ("pm_archived", r.pm_archived.n),
            ] {
                assert_eq!(n, 1, "issue {} {what} at {} d", iss.id, m.lead);
            }
            m.n += 1;
            m.ut1_op_s += r.ut1_operational.rms_native;
            m.ut1_ba_s += r.ut1_archived.rms_native;
            m.pm_op_as += r.pm_operational.rms_native;
            m.pm_ba_as += r.pm_archived.rms_native;
        }
    }
    for m in out.iter_mut() {
        let n = m.n as f64;
        m.ut1_op_s /= n;
        m.ut1_ba_s /= n;
        m.pm_op_as /= n;
        m.pm_ba_as /= n;
    }
    out
}

/// The pre-registered conditions that fail, in lead order.
fn failures(rows: &[LeadMae]) -> Vec<String> {
    let mut f = Vec::new();
    for m in rows {
        let ru = m.ut1_op_s / m.ut1_ba_s;
        let rp = m.pm_op_as / m.pm_ba_as;
        println!(
            "lead {:>2} d n={} UT1 MAE op {:.3} ms / Bulletin A {:.3} ms = {ru:.2}; \
             pole MAE op {:.2} mas / Bulletin A {:.2} mas = {rp:.2}",
            m.lead,
            m.n,
            m.ut1_op_s * 1e3,
            m.ut1_ba_s * 1e3,
            m.pm_op_as * 1e3,
            m.pm_ba_as * 1e3
        );
        if ru > FACTOR {
            f.push(format!("UT1 {} d {ru:.2}", m.lead));
        }
        if rp > FACTOR {
            f.push(format!("pole {} d {rp:.2}", m.lead));
        }
    }
    let d10 = rows.iter().find(|m| m.lead == 10).unwrap().ut1_op_s * 1e3;
    println!(
        "day-10 operational UT1 MAE {d10:.3} ms against the PCC range {PCC_DAY10_UT1_MAE_MS:?}"
    );
    if !(PCC_DAY10_UT1_MAE_MS.0..=PCC_DAY10_UT1_MAE_MS.1).contains(&d10) {
        f.push(format!("PCC day-10 {d10:.3} ms"));
    }
    f
}

#[test]
fn predictor_mae_against_bulletin_a_and_the_pcc_range_finding() {
    let rows = measure();
    assert_eq!(rows[0].n, vintages::issues().len());
    let f = failures(&rows);
    // Pre-registered verdict: PASS only if `f` is empty. Recorded finding: every UT1 lead,
    // the pole at all leads but 6 and 7 days, and the PCC day-10 range fail.
    let ut1 = f.iter().filter(|s| s.starts_with("UT1 ")).count();
    let pole: Vec<&String> = f.iter().filter(|s| s.starts_with("pole ")).collect();
    assert_eq!(ut1, 10, "recorded finding changed: {f:?}");
    assert_eq!(pole.len(), 8, "recorded finding changed: {f:?}");
    assert!(pole
        .iter()
        .all(|s| !s.starts_with("pole 6 d") && !s.starts_with("pole 7 d")));
    assert!(
        f.iter().any(|s| s.starts_with("PCC day-10")),
        "recorded finding changed"
    );
}
