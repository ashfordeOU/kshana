<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B5 v2 (0.41.x): area trust with a two-station floor for small areas

**Status: SIGNED. Proposed 8 November 2026; signed off by the owner on 9 November 2026, as drafted. The v1 results stay published; no bar is loosened.**

## Why a v2

B5 v1 (`PREREGISTRATION.md`, signed 3 November 2026) is NOT MET on T4 (`RESULTS.md`). On the one area its station
rule produced (Madrid, 4 stations), the rule `DEGRADED if n_D ≥ k or n_U ≥ 1` turned every single station's
position outlier into an area alert. That gave 23 alerts in 13 quiet days against a bar of 13, and 26 after the
navigation parser fix. v1 stands as recorded; its bars are not loosened. v2 changes the rule and is scored on new data.

## What changes (everything else is v1 unchanged)

1. **Area rule.** With `N` live stations and `k = max(2, ⌈N/3⌉)`:
   - `UNKNOWN` if `N < 2`;
   - `UNTRUSTED` if `n_U ≥ k`;
   - `DEGRADED` if `n_D ≥ k`, or `n_U ≥ m`, with `m = 2` when `N ≤ 6` and `m = 1` when `N > 6`;
   - `TRUSTED` otherwise.

   With 6 or fewer stations, one station's fix-domain alarm alone no longer moves the area. It still shows
   in that station's own state, and two stations agreeing do move the area.
2. **T4 data.** A new scored stretch, disjoint from v1's: the first 14 consecutive days of 2025 after 19 January
   with daily maximum Kp ≤ 4, from the same GFZ file. The same station and calibration rules apply
   (readings 8 to 12 of `xval/area-trust/README.md`), including the navigation-file rule of the B8 readings (the
   BKG merged file with more GPS records).
3. **The oracle** (`xval/area-trust/oracle.py`) gains the `m` rule. Its v2 copy is committed before any v2 engine
   code.

## Bars (unchanged from v1)

T1 to T5 as in v1, re-run on v2:
- T1, T2 and T5: on the same synthetic replays, with the v2 oracle;
- T3: on the reference box, reusing the v1 harness;
- T4: on the new fortnight. DEGRADED or worse ≤ 1 per area-day; UNTRUSTED ≤ 0.1 per area-day.

T2 additionally checks:
- an event that puts exactly one station in `Untrusted` in an area of 6 or fewer raises no area alert;
- one that puts two stations there raises `DEGRADED`.

## What a MET and a NOT MET mean

As v1. In addition: MET on v2 does not undo v1's NOT MET. Both are published.
