<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B8 (0.41): environmental baseline per site and time: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). The steps of its section 5 were committed in
order, each before the next began. Readings 1 to 9 and the commits are in `xval/env-baseline/README.md`.
- Step 2: the baseline and its cited constants, plus the independent ROTI script, tested on synthetic data only.
- Step 3: the event days.
- Step 4: the stations.
- Step 5: the ROTI labels and the SHA-256 of every file, committed in `3db9ac535`.
- Step 6: the baseline was run once, after that commit.

The bars were not changed.

Reproduce:
1. `bash xval/env-baseline/fetch_indices.sh <dir>`.
2. `python3 -I xval/env-baseline/label_all.py <dir>`, which needs `hatanaka` and fetches the observation files.
3. `score.py hours`, then `kshana env-baseline`, then `score.py score`.

The scored input and output are in `tests/fixtures/env_baseline/` and the scores in `xval/env-baseline/result.json`.

## Summary

| Bar | Result |
|---|---|
| N1 non-vacuity | **MET**: 1 295 station-hours labelled disturbed (ROTI_h ≥ 0.5 TECU/min) out of 8 686 scored, from all three bands (|Φ| ≥ 60°: 1 067; 35° to 55°: 38; ≤ 15°: 190). Bar: at least 200 from at least 2 bands. |
| V1 discrimination | **MET**: AUC 0.846 over all scored station-hours (bar ≥ 0.75). |
| V2 quiet mid-latitude | **MET**: 100 % of 1 422 quiet-day station-hours at 35° to 55° called `quiet` (bar ≥ 95 %). |
| V3 storm high-latitude | **MET**: 99.4 % of 621 disturbed storm-day station-hours at ≥ 60° called `elevated` or `disturbed` (bar ≥ 80 %). |
| V4 low latitude, no storm | **MET**: AUC 0.872 over 815 equinox-day station-hours at ≤ 15°, 84 of them disturbed (bar ≥ 0.70). |
| V5 determinism | **MET on Linux; the other platforms' CI runs are still to come**. The scored run's bytes are pinned (`tests/env_baseline.rs`). Python (`tests/python/test_bindings.py`) and WebAssembly (`web/smoke.mjs`) compare with the same file in CI, as do the macOS and Windows test legs; none of these has run yet. |

B8 is MET when V5 is confirmed on every platform and surface. Until then it is met on the bars scored here.

## The data

- **Days:** 9 storm days (daily maximum Kp ≥ 8−), 16 quiet days of the same months, and 10 equinox days of
  2024. The 5 days of 2015 have no RINEX 3 daily files at BKG and were dropped (reading 4).
- **Stations:** 4 per band of dipole latitude, drawn by hash from those with L1, L2 and `S1C` on at least 30 of
  the 33 days (readings 5 to 7):
  - ≥ 60°: EUR2, REYK, TRO1, YEL2;
  - 35° to 55°: CZTG, MATE, EBRE, M0SE;
  - ≤ 15°: CMUM, ASCG, CHPG, KIRI.
- **Navigation:** each day's BKG merged navigation file with more GPS records (reading 8).
- **Exclusions:** station-hours with fewer than 4 satellites above 30° for 30 minutes are excluded and counted
  in `labels.json`: 69 at high latitude, 117 at mid latitude and 536 at low latitude.

## What this means

The baseline, from Kp and F10.7 alone, tells disturbed hours from quiet ones on these public stations and days as
the bars require. That includes the low-latitude post-sunset regime on quiet equinox nights, where the baseline is
not just a Kp detector (V4).

It says nothing about:
- other stations, days or solar-cycle phases;
- scintillation on signals other than GPS L1/L2;
- whether an operator should suppress an alert because of it.

It is a climatological expectation (MODELLED inputs), checked against measured ROTI.
