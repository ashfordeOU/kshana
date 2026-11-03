<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D12 (0.41), part 2: LEO Doppler positioning: parked, no pre-registered bar in 0.41

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.**

## Why this row

Ledger row `VM-c4520dfd` (positioning from LEO Doppler) was compared, as a proxy, with a published Starlink Doppler
positioning experiment (doi 10.33012/navi.685) under [`PREREGISTRATION.md`](PREREGISTRATION.md) in this directory. Both
bars are **NOT MET**, on the high side ([`RESULTS.md`](RESULTS.md)): P1 92.2 m against 1 to 4 m (20 s window); P2 870 m
against 5 to 20 m (8 s window). The results file states that a model of the experiment's real satellite turnover (its
TLEs and channel schedule) would be a new pre-registration, not a re-run.

## Why no bar now

LEO PNT is a **maintained** family (roadmap section 1c): bug fixes and ledger hygiene, no new scope unless a partner asks.
Roadmap item D12 parks this row in 0.41. A bar written now for a run nobody will make would only age. The original P1 and
P2 bars and their misses stay as recorded and pinned.

## What would unpark it, and what then

- A partner request, or new public measured data for the same experiment class (published TLEs and channel schedule for
  a capture window, or a public Doppler data set with truth).
- Then a new pre-registration is written and committed alone before any code: the turnover model, the data, and bars.
  The P1 and P2 bars above would apply unchanged to the same published figures; any new figure gets its own bar.

## Acceptance for 0.41

The row's oracle text and `docs/` say "parked (maintained family), P1 and P2 NOT MET", and the pinned tests still assert
the recorded misses. Nothing else.

## Owner decisions at sign-off

None (parking follows the roadmap's section 1c).
