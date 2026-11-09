<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration M5 v2 (0.41.x): a started space solver and a ground layer with session evidence

**Status: SIGNED. Proposed 8 November 2026; signed off by the owner on 9 November 2026, as drafted. The v1 results stay published as NOT MET; no bar is loosened.**

## Why a v2

M5 v1 is NOT MET on B1 to B3 (`RESULTS.md`, `ac44ae420`).
- **The space layer:** 880 of 4 000 E30 draws gave no estimate, and about 600 converged to a far wrong point. These
  are solver starts from the area centroid, since the bounds show the information was there.
- **The ground layer:** B3a as shipped, with one report per draw and tempering set for 30-epoch sessions, never
  located a source to 5 km.
- **The hybrid:** with the space fix at tens of metres, it cannot add anything.

v1 stands as recorded, and its bars are not loosened.

## What changes

1. **Start of every Gauss–Newton** (space, hybrid): a coarse search first.
   - The search is over the M2 sea points (0.25° cells), scoring the time differences alone. The best 3 cells are
     each refined, and the lowest-residual result is kept.
   - This is still one estimator, with no access to the truth.
2. **Ground layer: 30 reports per site per draw** (one per second), with shadowing fixed over the 30 and
   independent measurement noise of 1 dB.
   - This matches the session B3a's tempering was set for. The ground model is otherwise unchanged.
3. **Placements and draws.** Seeds 4600 (placements) and 4601 (draws), unused by anyone.

## Bars

v1's B1 to B6, unchanged. It is stated now, from v1's numbers, that B1 to B3 may still miss:
- once the space layer converges, its success should approach 1;
- the hybrid can then exceed it by at most `1 − S_space`.

A miss would show that a space formation alone suffices for 1 W sources in this scenario. That is itself the
network-design answer the row asks for.

## Process

1. Sign-off.
2. Readings, then the code, then one run, recorded in `RESULTS-v2.md`.
