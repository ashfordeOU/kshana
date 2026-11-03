<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D14 (0.41), part 1: lunar frame datum from a campaign, re-run plan

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are new; every other number is a bar of
[`PREREGISTRATION.md`](PREREGISTRATION.md) in this directory and is not changed.

## Why this row

Ledger row `VM-55f1a043` (lunar frame datum from an observing campaign). The condition-scaled NumPy comparison is
**NOT MET** ([`RESULTS.md`](RESULTS.md)):

- **P2 on `stations_estimated`:** 8 checks fail, by about 10 times the heuristic bar `t = 10 kappa u` (datum sigmas 3.0e-6
  to 6.8e-6 relative against t = 5.9e-7). A 50-digit check had already found the engine to be the less accurate side,
  from cancellation in its Schur complement.
- **Step 0 on the fresh scenarios:** the fresh date (2026-12-01) left one beacon (the south-pole one) with no
  observation; its information columns were zero, the engine fell back to a pseudo-inverse without saying so, and the
  unchanged NumPy oracle raised `LinAlgError` on `stations_estimated_fresh`.

`RESULTS.md` names both remedies and says each needs its own registration. This is it.

## What stays

The bar exactly as registered: `u = 2^-53`, `S = 10`, `kappa = max(kappa(F), kappa(T^T F T))`, `t = max(1e-12, S kappa u)`,
and every check listed under "Bar (fixed now)": rank and defect equal; sigmas, translation norm and condition within `t`
relative; eigenvalues within `t lambda_max(H)`; weakest direction, null-space angle, correlation and
independence-discarded norm as written; off-block fraction exactly 0 when the stations are fixed. The SPICE leg on the
six original scenarios, unchanged. The outcome rule: all hold, the row becomes VALIDATED as a library check of the
computation only; any fails, a finding.

## What changes (two engine changes, fixed now)

1. **Solver.** The datum covariance is computed through the square-root information (`srif`) route the engine already
   has, instead of the normal-equation Schur complement. The 50-digit oracle is re-run on the new route, reported only.
2. **Unobserved beacons.** A beacon with no observation in the campaign is **refused** with an error that names it
   (*proposed*; the alternative, reporting it and continuing, is owner decision 1). The probe that picks a fresh date
   applies the same rule.

## Inputs

- The six original scenarios (seen).
- The two scenarios at the 2026-12-01 fresh date (seen). With change 2, `stations_estimated_fresh` and
  `stations_fixed_fresh` are expected to be refused; the refusal and its message are the result for them.
- **Two new fresh scenarios** (`stations_estimated_fresh2`, `stations_fixed_fresh2`) at a new date chosen by rule: the
  first day on or after **2027-03-01** that the probe accepts with every beacon observed at least 10 times, the Helmert
  defect 0 and the station block full rank. The date and the engine inputs are committed before the NumPy oracle is run
  on them.

## Verdict

The row is recorded as met on re-run, and promoted per the original outcome rule, only if step 0, the SPICE leg and every
P2 check hold on the six original scenarios and the two new fresh ones, and the 2026-12-01 scenarios are refused with
the named error. Any miss is a finding with its numbers; the bar is not moved.

## What a result would and would not mean

MET would say the engine's datum linear algebra agrees with NumPy within a condition-scaled bound after the solver
change, and that it no longer accepts an unobserved beacon silently. It would not say anything about a real campaign's
accuracy: the station network and delay sigma stay illustrative, and clocks, troposphere and Earth orientation stay fixed.

## Owner decisions at sign-off

1. Refuse an unobserved beacon (proposed) or report it and continue.
2. The new fresh-date rule (first accepted day on or after 2027-03-01, every beacon observed at least 10 times).
