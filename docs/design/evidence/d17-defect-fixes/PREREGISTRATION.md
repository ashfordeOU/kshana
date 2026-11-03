<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D17 (0.41): defect D11c (fusion flicker bound) and closing defect D12: no new pre-registered bar needed

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.**

## Why no new bar

Both parts of roadmap item D17 are defect work, not evidence questions:

- **D11c** finishes a fix whose pattern and acceptance criteria were already set and met for the parent defect D11 (the
  clock-ensemble Kalman 3-sigma bound did not cover flicker FM). D11c applies the same pattern to the `fusion-pnt` kind.
  It is judged by the same criteria, fixed below before any code.
- **D12** (default hand-off acquisition on 100 ms tiered codes needed gigabytes of memory) is already fixed in the
  engine by grid-free acquisition, under its own registration
  ([`../acq-gridfree/PREREGISTRATION.md`](../acq-gridfree/PREREGISTRATION.md), results in
  [`../acq-gridfree/RESULTS.md`](../acq-gridfree/RESULTS.md)). Only its defect record still says "open". Closing it is a
  documentation change.

## D11c: what was found

With the `clock-ensemble` flicker floors added (1e-16 quantum, 2e-11 classical) to the shipped `fusion-pnt` scenario,
one trajectory at seed 42, the classical clock's 3-sigma integrity fraction dropped from 0.9728 to 0.7973. The bound is
the two-state filter's, which has no flicker term. (`hybrid-pnt` stayed at or above 0.99 because it re-syncs every 60 s.)

## D11c: the change

As for D11: the bound becomes the two-state variance plus the exact variance of the phase that the truth flicker bank
accumulates over the steps since the last sync (zero without a floor). The truth is not touched. Floor-0 paths are not
touched.

## D11c: acceptance test (the D11 criteria applied to `fusion-pnt`)

On `fusion-pnt` with the `clock-ensemble` floors, 200 runs, seed 42, and again at seed 7:

1. integrity mean at least **0.99** for both clocks and p05 at least **0.9** (D11's B1);
2. floor-0 control: the shipped `fusion-pnt` scenario (no floor) gives byte-identical figures to before (D11's B2);
3. the pooled RMS of (error / one-sigma bound) over all outage samples and runs lies in **[0.8, 1.2]** for each clock
   (D11's B4');
4. truth untouched: the timing and holdover figures are unchanged (D11's B5); no pinned golden or registry value moves
   except those reported in the commit (D11's B6).

**Not part of D11c:** the classical clock's 0.9728 **without** a floor. Changing it would change floor-0 outputs, which
criterion 2 forbids. If it is to be addressed, it is a separate defect with its own pre-registration (owner decision 1).

## D12: acceptance

The defect record is updated to "fixed", citing the grid-free acquisition registration, its results and the test that
pins them, and the memory figures before and after. No code changes.

## Owner decisions at sign-off

1. Whether the no-floor 0.9728 shortfall of `fusion-pnt` is opened as its own defect.

## Sign-off (3 November 2026)

No new bar; D11c reuses D11's acceptance criteria and closing D12 is a documentation change.
