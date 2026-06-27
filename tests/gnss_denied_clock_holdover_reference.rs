// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the **GNSS-denied clock-holdover kernel** (`src/holdover.rs`)
//! against an **independent third-party authority**: scipy 1.18.0 (Virtanen et al.,
//! *Nature Methods* 17, 2020; BSD-3-Clause).
//!
//! When GNSS is jammed, spoofed or unavailable the onboard clock free-runs (coasts)
//! from its last known state. The operational question a resilience trade asks is
//! "how long can it coast before its timing error exceeds the budget?" — answered by
//! [`holdover::coast_phase_variance`] (the accumulated phase variance) and
//! [`holdover::holdover_seconds`] (its monotone inversion to a threshold).
//!
//! Two genuinely independent oracle routes are used, each numerically distinct from
//! kshana's implementation:
//!
//!   * COAST — the coast phase variance `coast_phase_variance(q_wf,q_rw,q_drift,t)`
//!     is the `[0][0]` element of the EXACT discrete process-noise covariance Q of
//!     the continuous clock LTI model, computed by the **Van Loan (1978)** block-
//!     matrix-exponential algorithm via `scipy.linalg.expm`. Kshana computes the
//!     same quantity from a hand-derived closed-form polynomial (`q_wf·t +
//!     q_rw·t³/3 + q_drift·t⁵/20`). A wrong coefficient in either route diverges
//!     here — expm never sees the polynomial.
//!   * HOLDOVER — the holdover duration is the root of `Q00(t) − threshold² = 0`
//!     found by `scipy.optimize.brentq` (Brent's method). Kshana finds it by its
//!     own bisection. Different algorithm, same root.
//!   * TIE / RANGE — the deterministic time-interval error `y₀·t + ½·D·t²` and the
//!     timing→range map `c·Δt` are checked against their closed forms.
//!
//! HONEST SCOPE. This validates the holdover/coast KERNEL — the polynomial coast-
//! variance growth and its monotone inversion — against an independent Van-Loan-via-
//! expm computation and an independent Brent root find. It does NOT validate the
//! per-CLASS holdover figures ([`holdover::QuantumClockClass`],
//! [`clock_state::ClockClass`]): those rest on a *synthesised* long-tau red-noise
//! floor (a representative modelling assumption, not a measured value) and stay
//! MODELLED. The kernel is exact mathematics; the floor that feeds a class is not.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/gnss_denied_clock_holdover/`.

use kshana::holdover::{
    coast_phase_variance, deterministic_tie, holdover_seconds, phase_to_range_m, C_LIGHT_M_PER_S,
};

const REF: &str =
    include_str!("fixtures/gnss_denied_clock_holdover/gnss_denied_clock_holdover_reference.txt");

/// `got` within tolerance of `want`: relative bound plus a tiny absolute floor so a
/// quantity an oracle reports as a numerical zero matches kshana's exact 0.0.
fn approx(got: f64, want: f64, rel_tol: f64, abs_tol: f64) -> bool {
    (got - want).abs() <= rel_tol * want.abs() + abs_tol
}

/// COAST: `coast_phase_variance` vs the Van-Loan Q[0][0] from scipy.linalg.expm.
/// The expm route reassociates differently from the polynomial, so the residual is
/// pure float reassociation (~1e-15); the 1e-9 relative bound is a comfortable
/// ceiling and a coefficient error would blow straight through it.
#[test]
fn coast_variance_matches_scipy_van_loan_expm() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("COAST ") {
            continue;
        }
        // COAST name q_wf q_rw q_drift t | var
        let parts: Vec<&str> = line.splitn(2, '|').collect();
        assert_eq!(parts.len(), 2, "COAST row needs a |: {line}");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        assert_eq!(head.len(), 6, "COAST head: COAST name q_wf q_rw q_drift t");
        let name = head[1];
        let q_wf: f64 = head[2].parse().unwrap();
        let q_rw: f64 = head[3].parse().unwrap();
        let q_drift: f64 = head[4].parse().unwrap();
        let t: f64 = head[5].parse().unwrap();
        let want: f64 = parts[1].trim().parse().unwrap();

        let got = coast_phase_variance(q_wf, q_rw, q_drift, t);
        let abs_tol = 1e-300; // variance is strictly positive in all cases here
        worst = worst.max((got - want).abs() / want.abs());
        assert!(
            approx(got, want, 1e-9, abs_tol),
            "COAST {name} (t={t}): kshana {got:.12e} vs scipy expm Q00 {want:.12e} \
             (rel={:.2e})",
            (got - want).abs() / want.abs()
        );
        n += 1;
    }
    assert!(n >= 12, "expected >= 12 COAST cases, got {n}");
    eprintln!("coast_variance vs scipy expm Van-Loan Q00: {n} cases, worst rel = {worst:.3e}");
}

/// HOLDOVER: `holdover_seconds` vs a brentq root-find of `Q00(t) − threshold² = 0`.
/// Two different inversion algorithms (kshana bisection vs Brent) on the same
/// monotone curve; both converge to ~1e-12, so a 1e-6 relative bound is generous
/// while still catching any real disagreement.
#[test]
fn holdover_seconds_matches_scipy_brentq_inversion() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("HOLDOVER ") {
            continue;
        }
        // HOLDOVER name q_wf q_rw q_drift threshold | seconds
        let parts: Vec<&str> = line.splitn(2, '|').collect();
        assert_eq!(parts.len(), 2, "HOLDOVER row needs a |: {line}");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        assert_eq!(
            head.len(),
            6,
            "HOLDOVER head: HOLDOVER name q_wf q_rw q_drift threshold"
        );
        let name = head[1];
        let q_wf: f64 = head[2].parse().unwrap();
        let q_rw: f64 = head[3].parse().unwrap();
        let q_drift: f64 = head[4].parse().unwrap();
        let threshold: f64 = head[5].parse().unwrap();
        let want: f64 = parts[1].trim().parse().unwrap();

        let got = holdover_seconds(q_wf, q_rw, q_drift, threshold);
        worst = worst.max((got - want).abs() / want.abs());
        assert!(
            approx(got, want, 1e-6, 0.0),
            "HOLDOVER {name} (thr={threshold:.1e}): kshana {got:.9e} s vs scipy brentq \
             {want:.9e} s (rel={:.2e})",
            (got - want).abs() / want.abs()
        );
        n += 1;
    }
    assert!(n >= 6, "expected >= 6 HOLDOVER cases, got {n}");
    eprintln!("holdover_seconds vs scipy brentq inversion: {n} cases, worst rel = {worst:.3e}");
}

/// TIE / RANGE: the deterministic time-interval error and the timing→range map are
/// closed forms; checked against the values the generator computed in exact
/// arithmetic (the constant `c` is CODATA-exact and shared, so RANGE is an identity
/// modulo float rounding).
#[test]
fn deterministic_tie_and_range_match_closed_forms() {
    let mut n_tie = 0usize;
    let mut n_range = 0usize;
    assert_eq!(
        C_LIGHT_M_PER_S, 299_792_458.0,
        "kshana c must equal the CODATA c the generator used"
    );
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("TIE ") {
            // name freq_offset drift t | tie
            let parts: Vec<&str> = rest.splitn(2, '|').collect();
            assert_eq!(parts.len(), 2, "TIE row needs a |: {line}");
            let head: Vec<&str> = parts[0].split_whitespace().collect();
            assert_eq!(head.len(), 4, "TIE head: name freq_offset drift t");
            let name = head[0];
            let y0: f64 = head[1].parse().unwrap();
            let d: f64 = head[2].parse().unwrap();
            let t: f64 = head[3].parse().unwrap();
            let want: f64 = parts[1].trim().parse().unwrap();
            let got = deterministic_tie(y0, d, t);
            assert!(
                approx(got, want, 1e-12, 1e-300),
                "TIE {name}: kshana {got:.12e} vs closed form {want:.12e}"
            );
            n_tie += 1;
        } else if let Some(rest) = line.strip_prefix("RANGE ") {
            // dt | range
            let parts: Vec<&str> = rest.splitn(2, '|').collect();
            assert_eq!(parts.len(), 2, "RANGE row needs a |: {line}");
            let dt: f64 = parts[0].trim().parse().unwrap();
            let want: f64 = parts[1].trim().parse().unwrap();
            let got = phase_to_range_m(dt);
            assert!(
                approx(got, want, 1e-12, 1e-300),
                "RANGE dt={dt:.1e}: kshana {got:.12e} m vs c·dt {want:.12e} m"
            );
            n_range += 1;
        }
    }
    assert!(n_tie >= 4, "expected >= 4 TIE cases, got {n_tie}");
    assert!(n_range >= 4, "expected >= 4 RANGE cases, got {n_range}");
}
