<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D1 (0.41): the Artemis I and CAPSTONE gaps, and where their re-runs are registered

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.**

## Why this file exists

Roadmap item D1 tracks two open external comparisons of the flight-dynamics propagator:

| Gap | Original record | Result |
|---|---|---|
| Artemis I cruise (row C1) | [`xval/mission-thread/PREREGISTRATION.md`](../../../../xval/mission-thread/PREREGISTRATION.md) | NOT MET: 45 km and 0.25 m/s over 72 h against 5 km and 0.05 m/s |
| CAPSTONE NRHO (row A2) | [`xval/mission-thread-lunar/PREREGISTRATION.md`](../../../../xval/mission-thread-lunar/PREREGISTRATION.md), Amendment 1 | NOT MET: 136.8 km and 28.4 km against 25 km and 10 km |

D1 has no bar of its own and adds none. It closes only through the runs registered under item C3, and it depends on
gate 7 and on C3:

- **Artemis I:** [`docs/mission-thread/PREREGISTRATION-C2.md`](../../../mission-thread/PREREGISTRATION-C2.md), signed off
  on 3 November 2026 (gate 7). C2 is a new question (impulses modelled), not a re-score of C1: C1 stays NOT MET whatever
  C2 gives, as C2 itself says.
- **CAPSTONE:** [`../c3-capstone-nrho-force-model/PREREGISTRATION.md`](../c3-capstone-nrho-force-model/PREREGISTRATION.md),
  proposed with this file. It is a re-run of A2 under A2's unchanged bars, plus held-out windows and one new, separately
  named question.

## What decides D1

D1 is done when both registered runs have been made once and recorded, whatever their verdicts. A run that misses is
published as a miss and D1 is still done: D1 is about running the registered comparisons, not about passing them. If a
run is "not run" under its own rules (for example the Horizons span is not covered), D1 records that and stays open.

## What D1 would and would not mean

Completing D1 means both gaps have had a pre-registered second attempt. It does not mean either original row is met:
C1 cannot be (C2 is a different question), and A2 is met on re-run only under the rule stated in the C3 file.

## Owner decisions at sign-off

None beyond those in the C3 CAPSTONE file.

## Sign-off (3 November 2026)

No bar of its own; closes through PREREGISTRATION-C2.md and the C3 file.
