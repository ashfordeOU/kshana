<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# BEACON (release 0.36): a lunar-frame-campaign beacon with no observation is reported, and every output it moved

**Programme rule R4:** a changed published number is a revision. This file lists each one
old -> new.

## 1. What changed in the engine

MR-05 (`docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md`) found that on 2026-12-01 the
south-pole beacon of the default network has no observation. The engine accepted that
silently: it published a full-rank datum, and every beacon sigma was null, including those of
the three observed beacons. The only hint was that beacon's `"observations": 0`. Now
(`lunar_frame_campaign`, decided by the coordinator, option A):

* when one or more beacons have no observation, the report gains `unobserved_beacons` (their
  names) and `warning` (a sentence), and is otherwise unchanged;
* in that case only, the observed beacons' sigmas are computed from the information restricted
  to their columns (exact, because the unobserved beacons' block is zero), and are reported
  when that block is full rank;
* the datum and every other field are unchanged.

## 2. Outputs that moved

Only reports in which some beacon has no observation. No default, bundled or published output
moves: `tests/registry_golden.rs`, the scenario doc syncs and every lunar-frame-campaign
oracle test pass unchanged. In the repository the affected runs are the two MR-05 fresh
scenarios (default network, 2026-12-01):

| Field | was | now |
|---|---|---|
| `unobserved_beacons` (both) | absent | `["Shackleton crater (south pole)"]` |
| `warning` (both) | absent | "1 of 4 beacons have no observation in this schedule (...)" |
| stations fixed: Apollo 11 / 15 / 16 `sigma_3d_m` | null / null / null | 12.503 / 12.502 / 12.501 m |
| stations estimated: Apollo 11 / 15 / 16 `sigma_3d_m` | null | null (their own block is rank 8 of 9) |
| `datum_accuracy` (both) | 632.377 m / 10.021 m translation norm | unchanged |

Pinned by `tests/lunar_frame_campaign_unobserved_beacon.rs`.
