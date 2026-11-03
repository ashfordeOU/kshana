<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D6 (0.41): lunar-infrastructure C3, Q3 and G3, re-run plan and the C3 sweep

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are new; every other number is an existing bar of
[`PREREGISTRATION.md`](PREREGISTRATION.md), [`PREREGISTRATION-amendment-1.md`](PREREGISTRATION-amendment-1.md) or
[`PREREGISTRATION-v2.md`](PREREGISTRATION-v2.md) and is not changed. Roadmap item D6 is a **gate** item: parts of it run
only when measured or partner data exist.

## Why this row

Three original bars are NOT MET and stay pinned ([`RESULTS-v2.md`](RESULTS-v2.md)):

| Bar | Recorded | What v2 found |
|---|---|---|
| C3: fraction of trials with q > 12.592 at least 0.5, at an injected 3e-10 m/s^2 | 0.0525 | the statistic behaves as theory says; it can see about 3e-9 m/s^2 with the study's onboard orbit knowledge (about 351 m), not 3e-10 |
| Q3: numpy recomputes the bootstrapped success rate to 1e-9 relative | 1.72e-6 | the cause is the shipped normal CDF; with an accurate CDF the difference is 9.8e-12 (Q3b) |
| G3: adding a family never raises the CRLB trace (all 15 subsets) | trace rose in 12 of 28 | every rise is a rank-raising addition, where the pseudo-inverse trace can rise by construction |

## Q3: re-run after the fix ships (original bar)

- **What changes:** 0.41 replaces the normal CDF inside the shipped `bootstrap_success_rate` with the accurate one that v2
  tested separately (Q3a: worst relative error 1.4e-13 against `scipy.special.ndtr`). Nothing else.
- **Procedure:** the original Q3 comparison, unchanged, on the pinned float design `phase_design.json` (SHA-256
  `401d9e5b...442e`) and its oracle `phase_oracle.json` (SHA-256 `59b2432d...6b8394`).
- **Bar:** Q3 unchanged: relative difference at most **1e-9**.
- **Disclosure:** Q3b already ran the same comparison with the same CDF and gave 9.8e-12, so the outcome is known in
  advance. The re-run checks that the shipped routine now behaves as the tested one did. If met, the ledger records "Q3
  met on re-run (0.41) after the CDF fix; originally NOT MET (1.72e-6)", with both numbers.
- Q1 and Q2 are re-evaluated on the stored Monte Carlo draws as in v2; their verdicts must not change.

## C3: gate (needs measured or partner orbit knowledge); bar unchanged

- C3's bar asks the statistic to see 3e-10 m/s^2. With the study's onboard covariance it cannot, by the theory C3a
  confirmed. C3 can be re-run only with onboard orbit knowledge good enough to make that acceleration visible, which
  needs measured or partner data (an onboard orbit solution with its covariance, or a partner's tracking geometry).
- **Rule:** when such data are provided and pinned (source, SHA-256, what they describe), C3 is re-run once with the
  original bar (fraction above 12.592 at least **0.5** at **3e-10 m/s^2**, the recorded seed 20261019 and trial count).
  Until then C3 stays NOT MET and is "not run" in 0.41.
- Scaling the recorded noncentrality (0.119 at 351 m) to the noncentrality that gives a power of 0.5 (about 7.3)
  suggests an onboard position sigma of roughly 45 m is needed. This is stated as a guide for what data would be useful, not as a bar.

## C3 sweep (descriptive; labelled post hoc)

The sweep named as not done in the lunar-infrastructure handover is registered here so it is not chosen after seeing
anything new. It is **post hoc** (it follows the C3 miss) and has no bar.

- Grid: onboard position sigma {351 (as recorded), 200, 100, 50, 25} m, by scaling the onboard covariance block
  uniformly; acceleration a in {3e-10, 1e-9, 3e-9, 1e-8} m/s^2.
- Output: analytic power `P(ncx2(6, lambda) > 12.592)` per cell, and Monte Carlo (N = 400, seed 20261019) at the 3e-10
  column only, as a calibration check against C3a's rule (within three binomial standard errors), reported.
- It changes no verdict and is published whatever it shows.

## G3: published prior widths (new bar G3m); G3 itself stays NOT MET

- G3 as written is false for rank-raising additions (the pseudo-inverse trace can rise), so **no re-run can meet it**;
  it stays NOT MET permanently and is not re-run.
- v2's G3' was EXPLORATORY because the h2, l2 and libration prior widths were illustrative. The new question: **with
  published measured uncertainties for every prior, does information still add?**
- **Source rule:** each prior width (k2, h2, l2, and the two libration angles) is taken from a published measurement
  with a stated one-sigma uncertainty, pinned at sign-off by DOI and the quoted value. k2 keeps the GRAIL value already
  cited (0.000108). If any one width has no published measured uncertainty that can be pinned, G3m is "not run".
- **Bar G3m (*proposed*, same statement as G3'):** for all 15 subsets and every single-family addition, the smallest
  eigenvalue never decreases and the trace of the inverse never increases, each within a relative 1e-12.
- **Meaning:** a pass tests the implementation with priors that describe what is measured about the Moon's response; it
  is a theorem for positive semidefinite additions, so a miss is an implementation fault. It does not close G3.

## Owner decisions at sign-off

1. Accept the Q3 re-run with its disclosed known outcome, and the ledger wording above.
2. Confirm C3 stays "not run" in 0.41 unless measured or partner data arrive.
3. Pin the G3m prior sources, or accept G3m "not run".
