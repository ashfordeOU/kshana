<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D13 (0.41), part 2: campaign optimiser round 1 P2: re-run as a regression; no new bar

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.**

## Why this row

Ledger row `VM-5664a533` (bounded optimisation of one metric over campaign parameters). Round 1's **P2** (the analytic
1-D target) is **NOT MET** ([`RESULTS.md`](RESULTS.md)): the registered box [100, 100 000] km excluded the 3 dB solution
(5.718e7 km), so the optimiser correctly stopped at the bound. That is a protocol error, not an optimiser defect. Round 2
([`PREREGISTRATION-ROUND2.md`](PREREGISTRATION-ROUND2.md)) asked the corrected question on a box that contains the
solution, with the optimiser unchanged: **P2' MET** (relative error 6.1e-15).

## Why no new bar

There is no open evidence question. Round 1's P2 cannot be met by any optimiser, because the answer lies outside the box
the bar fixed; re-running it can only repeat the miss. The question it meant to ask has been answered by P2'. A new bar
would re-ask a settled question.

## The acceptance test for 0.41

On the 0.41 code, one run of both rounds:

1. Round 1 P2 reproduces the recorded outcome: the optimiser stops at the 100 000 km bound (pinned by
   `p2_round1_not_met_the_box_excludes_the_closed_form`).
2. Round 2 P2' and P3' hold as recorded (relative error at most 1e-12 for P2'; bit-equal grid for P3'a; P3'b as
   registered).

This is a regression check: it confirms the optimiser has not changed, not a new result.

## Owner decisions at sign-off

1. Whether the ledger wording should say "Round 1 P2 NOT MET (protocol error: the box excluded the solution); the
   corrected Round 2 P2' MET" (proposed), without changing either verdict.
