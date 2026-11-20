// SPDX-License-Identifier: AGPL-3.0-only
//! Orbit-data validators, converters and quality monitors for space-situational-awareness data.
//!
//! * [`cdm`]: the CCSDS Conjunction Data Message (CCSDS 508.0-B-1, June 2013, with Technical
//!   Corrigendum 2 of October 2021) read in KVN or XML, checked keyword by keyword against the
//!   standard, with consistency checks between the relative data and the two objects' states,
//!   keyword aliases for non-standard field names, and a standard KVN writer.
//! * [`ephem`]: checks of the CCSDS Orbit Ephemeris Message (OEM) and Orbit Comprehensive Message
//!   (OCM) of CCSDS 502.0-B-3 (April 2023) beyond their syntax: time ordering, useable spans,
//!   interpolation support, covariance positive definiteness, and an optional usable-span profile.
//! * [`convert`]: OEM to OCM and OCM to OEM, keeping the numbers as written and the provenance
//!   (originator, message id, comments) of the source.
//! * [`covariance`]: positive-definiteness checks, frame rotation, propagation to any epoch through
//!   the two-body + J2 state-transition matrix, a Monte Carlo cross-check, synthetic covariance from
//!   stated sigmas, and covariance-realism statistics against reference states.
//! * [`gp_quality`]: quality monitors for general-perturbations element sets (TLE): a comparison of
//!   two sources for the same objects (for example GP and supplemental GP) and an audit of one
//!   source (checksums, physical ranges, SGP4 health, staleness, consecutive-set consistency).
//!
//! A validator reports `valid` or `invalid against` the named standard and section; nothing here is
//! endorsed by CCSDS or any data provider. Numbers computed from models (propagation, comparisons,
//! realism statistics) are labelled MODELLED.

// Small dense matrices (3x3 to 9x9) read most clearly with the index notation of the formulas.
#![allow(clippy::needless_range_loop)]

pub mod cdm;
pub mod cli;
pub mod convert;
pub mod covariance;
pub mod ephem;
pub mod gp_quality;

use serde::Serialize;

/// How serious a finding is.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum Severity {
    /// A rule of the standard is broken: the message is invalid against it.
    Error,
    /// The message is valid, but something is inconsistent or a profile limit is not met.
    Warning,
}

/// One result of a check.
#[derive(Clone, Debug, Serialize)]
pub struct Finding {
    /// Error or warning.
    pub severity: Severity,
    /// A stable machine code for the kind of finding.
    pub code: &'static str,
    /// The rule: standard and section (or `profile` for a limit the caller asked for).
    pub rule: String,
    /// The 1-based line of the message, when the finding belongs to one line.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub line: Option<usize>,
    /// The keyword the finding is about.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub keyword: Option<String>,
    /// What is wrong, for a person.
    pub message: String,
}

/// The result of checking one message.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// `CDM`, `OEM` or `OCM`.
    pub message_type: String,
    /// The standard checked against (document, issue and date).
    pub standard: String,
    /// True when no finding is an error.
    pub valid: bool,
    /// Every finding, in the order found.
    pub findings: Vec<Finding>,
    /// Parts of the message the checker did not examine.
    pub not_checked: Vec<String>,
}

impl Report {
    /// A report for `message_type` against `standard`, valid until an error is added.
    pub fn new(message_type: &str, standard: &str) -> Self {
        Report {
            message_type: message_type.to_string(),
            standard: standard.to_string(),
            valid: true,
            findings: Vec::new(),
            not_checked: Vec::new(),
        }
    }

    /// Add a finding.
    pub fn push(
        &mut self,
        severity: Severity,
        code: &'static str,
        rule: impl Into<String>,
        line: Option<usize>,
        keyword: Option<&str>,
        message: String,
    ) {
        if severity == Severity::Error {
            self.valid = false;
        }
        self.findings.push(Finding {
            severity,
            code,
            rule: rule.into(),
            line,
            keyword: keyword.map(str::to_string),
            message,
        });
    }

    /// Number of findings of `s`.
    pub fn count(&self, s: Severity) -> usize {
        self.findings.iter().filter(|f| f.severity == s).count()
    }

    /// The report as text: a verdict line, then one line per finding.
    pub fn to_text(&self) -> String {
        let mut s = if self.valid && self.findings.is_empty() {
            crate::t!("orbit-data-valid", standard = self.standard)
        } else if self.valid {
            crate::t!(
                "orbit-data-valid-with-warnings",
                standard = self.standard,
                warnings = self.count(Severity::Warning)
            )
        } else {
            crate::t!(
                "orbit-data-invalid",
                standard = self.standard,
                errors = self.count(Severity::Error),
                warnings = self.count(Severity::Warning)
            )
        };
        s.push('\n');
        for f in &self.findings {
            let sev = match f.severity {
                Severity::Error => crate::t!("orbit-data-error"),
                Severity::Warning => crate::t!("orbit-data-warning"),
            };
            let line = f.line.map(|l| format!(":{l}")).unwrap_or_default();
            s.push_str(&format!("  {sev}{line}  [{}]  {}\n", f.rule, f.message));
        }
        for n in &self.not_checked {
            s.push_str(&format!(
                "  {}\n",
                crate::t!("orbit-data-not-checked", what = n)
            ));
        }
        s
    }
}

/// Shortest round-trip text of a number, for messages.
pub(crate) fn fmt_num(x: f64) -> String {
    if x == 0.0 || (1e-4..1e9).contains(&x.abs()) {
        let s = format!("{x:.6}");
        let s = s.trim_end_matches('0').trim_end_matches('.');
        s.to_string()
    } else {
        format!("{x:.6e}")
    }
}

/// True when `v` is a number in the KVN notation of CCSDS 508.0-B-1 §6.3.2.1 to §6.3.2.3 (and
/// CCSDS 502.0-B-3 §7.5): an integer, a fixed-point number with digits on both sides of the point
/// and at most 16 digits, or a floating-point number whose mantissa has its point in the second
/// position and at most 16 digits.
pub fn is_kvn_number(v: &str) -> bool {
    let b = v.strip_prefix(['+', '-']).unwrap_or(v);
    if b.is_empty() {
        return false;
    }
    let (mant, exp) = match b.find(['E', 'e']) {
        Some(i) => (&b[..i], Some(&b[i + 1..])),
        None => (b, None),
    };
    if let Some(e) = exp {
        let e = e.strip_prefix(['+', '-']).unwrap_or(e);
        if e.is_empty() || !e.bytes().all(|c| c.is_ascii_digit()) {
            return false;
        }
    }
    let digits = mant.bytes().filter(u8::is_ascii_digit).count();
    if digits == 0 || digits > 16 {
        return false;
    }
    match mant.split_once('.') {
        None => mant.bytes().all(|c| c.is_ascii_digit()) && exp.is_none(),
        Some((i, f)) => {
            let ok = !i.is_empty()
                && !f.is_empty()
                && i.bytes().all(|c| c.is_ascii_digit())
                && f.bytes().all(|c| c.is_ascii_digit());
            ok && (exp.is_none() || i.len() == 1)
        }
    }
}

/// True when `v` is an integer of CCSDS 508.0-B-1 §6.3.2.1 (optional sign, decimal digits, within
/// the signed 32-bit range).
pub fn is_kvn_integer(v: &str) -> bool {
    let b = v.strip_prefix(['+', '-']).unwrap_or(v);
    !b.is_empty() && b.bytes().all(|c| c.is_ascii_digit()) && v.parse::<i32>().is_ok()
}

/// Seconds between two CCSDS time tags (`b - a`), each `yyyy-mm-ddThh:mm:ss[.d]` or
/// `yyyy-dddThh:mm:ss[.d]`.
pub fn seconds_between(a: &str, b: &str) -> Option<f64> {
    let ta = crate::norad::epoch_days_1950(a).ok()?;
    let tb = crate::norad::epoch_days_1950(b).ok()?;
    Some((tb - ta) * 86_400.0)
}

/// Eigenvalues of a symmetric matrix by cyclic Jacobi rotations, in ascending order.
pub fn symmetric_eigenvalues(m: &[Vec<f64>]) -> Vec<f64> {
    let n = m.len();
    let mut a: Vec<Vec<f64>> = m.to_vec();
    for _sweep in 0..100 {
        let off: f64 = (0..n)
            .flat_map(|i| (0..n).filter(move |&j| j != i).map(move |j| (i, j)))
            .map(|(i, j)| a[i][j] * a[i][j])
            .sum();
        let scale: f64 = (0..n).map(|i| a[i][i] * a[i][i]).sum::<f64>().max(1e-300);
        if off <= 1e-30 * scale {
            break;
        }
        for p in 0..n {
            for q in p + 1..n {
                if a[p][q] == 0.0 {
                    continue;
                }
                let theta = (a[q][q] - a[p][p]) / (2.0 * a[p][q]);
                let t = theta.signum() / (theta.abs() + (theta * theta + 1.0).sqrt());
                let t = if theta == 0.0 { 1.0 } else { t };
                let c = 1.0 / (t * t + 1.0).sqrt();
                let s = t * c;
                for k in 0..n {
                    let akp = a[k][p];
                    let akq = a[k][q];
                    a[k][p] = c * akp - s * akq;
                    a[k][q] = s * akp + c * akq;
                }
                for k in 0..n {
                    let apk = a[p][k];
                    let aqk = a[q][k];
                    a[p][k] = c * apk - s * aqk;
                    a[q][k] = s * apk + c * aqk;
                }
            }
        }
    }
    let mut ev: Vec<f64> = (0..n).map(|i| a[i][i]).collect();
    ev.sort_by(f64::total_cmp);
    ev
}

/// Positive-definiteness of a covariance, judged on its eigenvalues after scaling to unit
/// diagonal (so that position and velocity terms of very different size are compared fairly).
#[derive(Clone, Debug, Serialize)]
pub struct PdCheck {
    /// Largest `|m[i][j] - m[j][i]|` relative to `sqrt(m[i][i] m[j][j])`.
    pub asymmetry: f64,
    /// Smallest eigenvalue of the correlation matrix (1 is uncorrelated; 0 or below is singular).
    pub min_corr_eigenvalue: f64,
    /// Smallest and largest eigenvalues of the matrix itself, in its own units.
    pub eigenvalues: Vec<f64>,
    /// True when every diagonal term is positive and the correlation matrix is positive definite.
    pub positive_definite: bool,
}

/// Check a symmetric covariance for positive definiteness. A matrix with a zero or negative
/// diagonal term is not positive definite.
pub fn pd_check(m: &[Vec<f64>]) -> PdCheck {
    let n = m.len();
    let diag_ok = (0..n).all(|i| m[i][i].is_finite() && m[i][i] > 0.0);
    let mut asym: f64 = 0.0;
    let mut corr = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..n {
            let s = (m[i][i].abs() * m[j][j].abs()).sqrt().max(1e-300);
            asym = asym.max((m[i][j] - m[j][i]).abs() / s);
            corr[i][j] = 0.5 * (m[i][j] + m[j][i]) / s;
        }
    }
    let ce = symmetric_eigenvalues(&corr);
    let sym: Vec<Vec<f64>> = (0..n)
        .map(|i| (0..n).map(|j| 0.5 * (m[i][j] + m[j][i])).collect())
        .collect();
    let ev = symmetric_eigenvalues(&sym);
    let min_c = ce.first().copied().unwrap_or(f64::NAN);
    PdCheck {
        asymmetry: asym,
        min_corr_eigenvalue: min_c,
        eigenvalues: ev,
        positive_definite: diag_ok && min_c > 1e-12 && m.iter().flatten().all(|x| x.is_finite()),
    }
}

/// The symmetric `n x n` matrix from `vals` in an ordering of CCSDS 502.0-B-3 §6.2.7.12.3: `LTM`,
/// `UTM` or `FULL` (`n` follows from the count). `None` when the count fits no `n`.
pub fn matrix_from_ordering(vals: &[f64], ordering: &str) -> Option<Vec<Vec<f64>>> {
    let k = vals.len();
    match ordering {
        "FULL" => {
            let n = (k as f64).sqrt().round() as usize;
            if n * n != k || n == 0 {
                return None;
            }
            Some((0..n).map(|i| vals[i * n..(i + 1) * n].to_vec()).collect())
        }
        "LTM" | "UTM" => {
            let n = (((8 * k + 1) as f64).sqrt() as usize).saturating_sub(1) / 2;
            if n == 0 || n * (n + 1) / 2 != k {
                return None;
            }
            let mut m = vec![vec![0.0; n]; n];
            let mut it = vals.iter();
            for i in 0..n {
                let range: Vec<usize> = if ordering == "LTM" {
                    (0..=i).collect()
                } else {
                    (i..n).collect()
                };
                for j in range {
                    let v = *it.next()?;
                    m[i][j] = v;
                    m[j][i] = v;
                }
            }
            Some(m)
        }
        _ => None,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn kvn_numbers_follow_the_notation() {
        for ok in [
            "715",
            "-3.526774282",
            "4.142E+01",
            "+1.0e-3",
            "0.0",
            "7.5888E+02",
        ] {
            assert!(is_kvn_number(ok), "{ok}");
        }
        for bad in [
            "",
            ".5",
            "5.",
            "10.5E3",
            "1e",
            "1.0E+",
            "abc",
            "1,5",
            "12345678901234567.0",
        ] {
            assert!(!is_kvn_number(bad), "{bad}");
        }
        assert!(is_kvn_integer("-12"));
        assert!(!is_kvn_integer("1.0"));
        assert!(!is_kvn_integer("99999999999"));
    }

    #[test]
    fn eigenvalues_of_a_known_matrix() {
        let m = vec![
            vec![2.0, -1.0, 0.0],
            vec![-1.0, 2.0, -1.0],
            vec![0.0, -1.0, 2.0],
        ];
        let ev = symmetric_eigenvalues(&m);
        let r2 = 2f64.sqrt();
        for (a, b) in ev.iter().zip([2.0 - r2, 2.0, 2.0 + r2]) {
            assert!((a - b).abs() < 1e-12, "{a} {b}");
        }
        assert!(pd_check(&m).positive_definite);
        let not = vec![vec![1.0, 2.0], vec![2.0, 1.0]];
        assert!(!pd_check(&not).positive_definite);
    }

    #[test]
    fn orderings_build_the_same_matrix() {
        let ltm = [1.0, 0.1, 2.0, 0.2, 0.3, 3.0];
        let utm = [1.0, 0.1, 0.2, 2.0, 0.3, 3.0];
        let full = [1.0, 0.1, 0.2, 0.1, 2.0, 0.3, 0.2, 0.3, 3.0];
        let a = matrix_from_ordering(&ltm, "LTM").unwrap();
        assert_eq!(a, matrix_from_ordering(&utm, "UTM").unwrap());
        assert_eq!(a, matrix_from_ordering(&full, "FULL").unwrap());
        assert!(matrix_from_ordering(&[1.0, 2.0], "LTM").is_none());
    }
}
