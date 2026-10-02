// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Heterogeneous UTC(k) traceability-bias integrity overbound"
//! (M083), round 3, PROSPECTIVE: the pooled, hierarchical ageing bound of `utck_bound` against
//! Circular T issues not yet published when this was written.
//!
//! WHY. Round 2 (`tests/hetero_budget_utc_k_realised_overbound_oracle.rs`, pre-registered
//! ca0921a4) bounded each laboratory from its own history and found a pooled exceedance of
//! 0.0333 against 1e-2; 430 of the 694 exceedances were rows with no bound because the
//! laboratory's own history was too thin. A pooled prior gives every laboratory a bound and
//! shrinks short histories toward it. Every BIPM series up to 2026-09-30 has been seen, so the
//! test months are FUTURE issues.
//!
//! PRE-REGISTRATION (written 2026-10-02 and pushed before Circular T 465 is published; the last
//! issue seen is 464, dated 2026-09-09).
//!
//! INPUTS. (1) The BIPM per-laboratory `[UTC - UTC(k)]` files of round 1 and 2
//! (`$KSHANA_ORACLES/data/bipm/utclab/`, retrieved 2026-09-30, SHA-256 pins in
//! `tests/fixtures/hetero_budget_utc_k_oracle/utclab.sha256`), read with
//! `realdata::clk::parse_bipm_utclab`. (2) Circular T text issues 465, 466, ... from
//! https://webtai.bipm.org/ftp/pub/tai/Circular-T/cirt/ (BIPM, free use with citation), saved
//! as `$KSHANA_ORACLES/data/bipm/cirt/cirt.NNN`, read with
//! `realdata::clk::parse_circular_t_section1`, SHA-256 recorded when fetched.
//!
//! LABORATORY SPLIT (disjoint, fixed now). A laboratory acronym whose SHA-256 first byte is even
//! is a PRIOR laboratory; odd, a TEST laboratory. Prior months: MJD 57023-59944 (2015-2022);
//! test months: the issues from 465.
//!
//! MODEL (fixed now; engine `utck_bound`). `fit_prior(prior laboratories, (57023, 59944), lags
//! 5, 10, ..., 1825 days, min_pairs 20, z_p 1.645, nu0 20)`. For issue k and test laboratory L:
//! its history is its utclab series plus its values in issues 465 .. k-1, restricted to MJDs
//! before issue k's first MJD; `x_last` is the latest history value; for each value of L in issue
//! k, lag = MJD - last history MJD rounded to a multiple of 5 days, and the bound is
//! `prior.bound(history, (57023, last history MJD), x_last, lag, 1e-2)`. A test laboratory with
//! no history has no bound and every one of its values COUNTS AS AN EXCEEDANCE.
//!
//! QUANTITY AND TOLERANCE (round 1 and 2's bar, unchanged). Pooled fraction of test values with
//! |UTC - UTC(k)| above the bound, at the first issue K >= 465 by which at least 1000 test values
//! have accumulated (issues 465..K): PROMOTE if at most 1e-2. The Clopper-Pearson interval is
//! reported, not scored.
//!
//! VERDICT: not yet run (awaiting Circular T 465 and later).

use kshana::realdata::clk::{parse_bipm_utclab, parse_circular_t_section1};
use kshana::utck_bound::{fit_prior, LabSeries};
use std::path::PathBuf;

const PINS: &str = include_str!("fixtures/hetero_budget_utc_k_oracle/utclab.sha256");
const PRIOR_RANGE: (i64, i64) = (57_023, 59_944);
const TAIL: f64 = 1e-2;
const MIN_VALUES: usize = 1000;
const FIRST_ISSUE: u32 = 465;

fn oracles() -> PathBuf {
    std::env::var_os("KSHANA_ORACLES")
        .map(PathBuf::from)
        .unwrap_or_else(|| {
            PathBuf::from(std::env::var_os("HOME").unwrap_or_default()).join("Code/kshana-oracles")
        })
        .join("data/bipm")
}

fn sha256_hex(b: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    Sha256::digest(b)
        .iter()
        .map(|x| format!("{x:02x}"))
        .collect()
}

fn is_prior_lab(code: &str) -> bool {
    use sha2::{Digest, Sha256};
    Sha256::digest(code.as_bytes())[0] % 2 == 0
}

/// Every pinned laboratory's series, or `None` when absent.
fn utclab() -> Option<Vec<(String, LabSeries)>> {
    let dir = oracles().join("utclab");
    if !dir.is_dir() {
        return None;
    }
    let mut out = Vec::new();
    for pin in PINS.lines().filter(|l| !l.trim().is_empty()) {
        let (hash, name) = pin.split_once("  ").expect("pin line");
        let bytes = std::fs::read(dir.join(name)).ok()?;
        assert_eq!(sha256_hex(&bytes), hash, "{name} differs from its pin");
        let code = name.trim_start_matches("utc-").to_uppercase();
        let s: LabSeries = parse_bipm_utclab(&String::from_utf8_lossy(&bytes))
            .into_iter()
            .collect();
        out.push((code, s));
    }
    Some(out)
}

#[test]
#[ignore = "pre-registered; not yet run (awaiting Circular T 465 and later)"]
fn pooled_ageing_bound_holds_on_prospective_circular_t_issues() {
    let labs = utclab().expect("BIPM utclab files absent");
    let prior_labs: Vec<&LabSeries> = labs
        .iter()
        .filter(|(c, _)| is_prior_lab(c))
        .map(|(_, s)| s)
        .collect();
    let lags: Vec<i64> = (1..=365).map(|k| 5 * k).collect();
    let prior = fit_prior(&prior_labs, PRIOR_RANGE, &lags, 20, 1.645, 20.0);
    println!(
        "prior from {} laboratories, {} lags",
        prior_labs.len(),
        prior.lags.len()
    );
    let mut history: std::collections::BTreeMap<String, LabSeries> = labs
        .iter()
        .filter(|(c, _)| !is_prior_lab(c))
        .map(|(c, s)| (c.clone(), s.clone()))
        .collect();
    let (mut n, mut exceed) = (0usize, 0usize);
    let mut issue = FIRST_ISSUE;
    while n < MIN_VALUES {
        let path = oracles().join("cirt").join(format!("cirt.{issue}"));
        let text = std::fs::read_to_string(&path)
            .unwrap_or_else(|_| panic!("{} not yet available ({n} values so far)", path.display()));
        let c = parse_circular_t_section1(&text).expect("Circular T section 1");
        let first = *c.mjds.first().expect("MJDs");
        for row in c.rows.iter().filter(|r| !is_prior_lab(&r.code)) {
            let h = history.entry(row.code.clone()).or_default();
            let past: LabSeries = h.range(..first).map(|(k, v)| (*k, *v)).collect();
            let last = past.iter().next_back().map(|(k, v)| (*k, *v));
            for (mjd, v) in c.mjds.iter().zip(&row.values) {
                let Some(v) = v else { continue };
                n += 1;
                let bound = last.and_then(|(lm, lx)| {
                    let lag = (((mjd - lm) as f64 / 5.0).round() as i64 * 5).max(5);
                    prior.bound(&past, (PRIOR_RANGE.0, lm), lx, lag, TAIL)
                });
                if bound.is_none_or(|b| v.abs() > b) {
                    exceed += 1;
                }
            }
            for (mjd, v) in c.mjds.iter().zip(&row.values) {
                if let Some(v) = v {
                    h.insert(*mjd, *v);
                }
            }
        }
        println!("issue {issue}: cumulative {exceed} of {n}");
        issue += 1;
    }
    let frac = exceed as f64 / n as f64;
    println!(
        "pooled exceedance {frac:.4} ({exceed} of {n}) through issue {}",
        issue - 1
    );
    assert!(frac <= TAIL, "pooled exceedance {frac:.4} above {TAIL}");
}
