<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B3a v2 (0.41.x): power-difference locator with session-level shadowing: synthetic gate results

Pre-registration: `PREREGISTRATION-v2.md` (signed off 9 November 2026). Readings: V1 to V15 in
`xval/locator-power-difference/README.md`. The v1 results (`RESULTS.md`, NOT MET) stay published.

| Step | Commit |
|---|---|
| Readings V1 to V15, before any v2 code or development data | `2a5a47c59` |
| Code, unit tests, `oracle.py` v2 mode and the development run (V13) | `a05a7e420` |
| The gate, run once on seeds 4001 to 5000 | this commit |

The bars were not changed, and nothing was selected on the development seeds. No reading was changed after any data
was seen.

## Summary

| Bar | Result |
|---|---|
| S1 coverage | **NOT MET**: the 95% region contains the truth in 0.890 of 1,000 sessions (bar ≥ 0.90). |
| S2 non-vacuity | **NOT MET**: the median 95% region is 26.1% of the search domain (bar ≤ 25%). |
| S3 centroid | **NOT MET**: the median centroid error is 1.45 × the median nearest-neighbour station spacing (bar ≤ 0.5 ×). |
| S4 determinism | **Platforms only, as read in V12.** The recorded rows of 12 gate seeds reproduce bit for bit in debug against the release build on Linux (`tests/locator_power_difference_v2.rs`). The same test runs on Linux, macOS and Windows in the `ci.yml` job `b3a-v2-determinism`, and that job's result is the cross-platform check. The CLI, Python and WebAssembly half is **not assessable** in 0.41: the locator has none of those surfaces. Not assessable is not a pass. |

**The v2 synthetic gate is NOT MET.** By section 2 of the v1 pre-registration (carried into v2), the row stops: the
real run on Jammertest 2027 is not made with this method. D3 stays open. The ledger row stays MODELLED.

Other figures from the gate (`gate-v2.json.gz`):
- **Not located (V7):** 34 of 1,000 sessions had fewer than 3 stations reporting in more than half the session. They
  are counted against the method, as V7 requires.
- **Redraws:** 379 draws had no epoch with 3 reporting stations and were redrawn.
- **Implementation check (V15):** `oracle.py` in its v2 mode recomputed gate-input seeds 4001 to 4020 after the gate
  run. It agrees on all 20: grids and region cells equal, centroids within 2.5e-10 m, and the 2 sessions that are
  not located are not located in both.

## Seen before the gate

The development run (V13, seeds 3001 to 3200, `dev-v2.json.gz`) was an implementation check, with nothing to select:
S1 0.905, S2 0.288, S3 1.50, with 8 sessions not located and 66 redraws. It was recorded in the code commit
(`a05a7e420`) before any gate seed was drawn, and it already showed S2 and S3 over their bars. The gate was run as
registered.

## Against v1 (descriptive)

| | v1 gate (τ = 1/60, 20 km) | v2 gate (τ = 1, 10 km) |
|---|---|---|
| S1 coverage | 0.976 | 0.890 |
| S2 median area share | 52.5% | 26.1% |
| S3 centroid ratio | 2.55 | 1.45 |

Session-level shadowing without tempering shrank the regions to half the size of v1's and brought the centroid
closer. Coverage fell just under the bar instead of being bought with tempering.

## Where it misses (descriptive, after the run)

These splits were computed after the gate and are not bars:

| Sessions | n | S1 | S2 | S3 |
|---|---|---|---|---|
| All | 1,000 | 0.890 | 0.261 | 1.45 |
| Located only (excluding V7) | 966 | 0.921 | 0.251 | 1.40 |
| Source inside the stations' hull | 161 | 0.925 | 0.208 | 1.05 |
| Source outside the hull (within 10 km) | 839 | 0.883 | 0.283 | 1.58 |

- **Coverage.** The 34 sessions that are not located account for the S1 shortfall: among located sessions,
  coverage is 0.921. They count against the method, as V7 requires.
- **Centroid.** The centroid error is about 1.4 × the station spacing even among located sessions. Inside the hull
  it is still 1.05 ×. With σ_sh = 6 dB and the reference power profiled out, power differences alone pin a source
  to a broad region, not to within half a station spacing.
- **The domain.** 839 of the 1,000 sources lie outside the hull. The 10 km buffer around 5 to 30 km layouts still
  leaves most of the domain outside the network, where the method does worst.

## What a successor needs (not done here)

Any successor needs a new pre-registration. The figures above suggest:
- **A centroid bar the observable can reach.** Even inside the hull the error is about 1 × the spacing. A bar of
  0.5 × the spacing appears out of reach for power differences with 6 dB shadowing. The v1 derivation of L3 assumed
  independent stations around the source.
- **More information per station:** calibrated AGC, or B3b (TDOA), which this row was always meant to precede.

None of these was tried on the gate seeds.

## What this does not show

- It does not show anything about real interference. These are synthetic networks, drawn from a model that differs
  from the locator's on purpose.
- It does not rate the C/N0 or AGC monitors.
