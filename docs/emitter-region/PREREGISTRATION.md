<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: the emitter-region estimator against the Jammertest 2025 transmitter sites

Status: **PROPOSED, not signed off.** This file is committed alone, before any scored run. No scored run
(no comparison of any flagged report, session or region with any scheduled transmission) has been made, and none will
be until the owner has signed this off. After sign-off the run is made once, the result is recorded as MET, NOT MET or
NOT ASSESSABLE exactly as defined here, and `docs/emitter-region/RESULTS.md` is written. A miss is recorded as a miss:
no bar, window, truth point, parameter or population below is changed after the run.

Public sources only. Nothing here uses non-public material.

**Data identity rule.** The run uses only data whose SHA-256 equals the pin in section 3. The ADS-B tars are immutable
releases. If a re-fetch of the AIS raw response no longer matches its pin (the API is a live service), the AIS run is
recorded as NOT ASSESSABLE (data changed) and is not run on different data.

## 1. The claim under test

`kshana interference-map locate` (method `kshana-interference-map/emitter-region/v1`, ledger row `VM-bc70cb57`,
MODELLED) returns, per session of degraded position reports, a region at stated confidence levels. The claim:

> For a session of degraded ADS-B (or AIS) reports that overlaps scheduled jamming at a fixed Jammertest 2025 site, the
> 95% region contains the scheduled transmitter site at about the stated rate, is not vacuous, and its centroid lies
> within a stated distance of the site.

The test is **area level**. The two fixed sites are 6.9 km apart, far below what a regional estimator can separate;
what is tested is whether the estimate of where the source can be includes, and is centred near, the site.

## 2. The oracle

**Schedule.** The NPRA `jammertest-plan` repository, MIT licence, commit `75c0b2ceea10e470c3799d14a8ef18842d8375a7`
(already pinned by `xval/jammertest-plan/MANIFEST.tsv`, fetched by `xval/jammertest-plan/fetch.sh`), files
`plan-monday-2025-09-15.json` to `plan-friday-2025-09-19.json` and `testcatalog2025.json`. Plan times are local
wall-clock; UTC is local minus 2 h (CEST), the offset `kshana jammertest import` already uses. The `test_contact`
field is never read.

**Positions.** The plan files carry **no coordinates**. The surveyed positions are in Appendix A, Table 1, of
`Testcatalog.pdf` at the same commit: SHA-256 `18546223e3212f144f47e360b38ac274c5ce4288047b3f98029d7594883a0a9c`
(91,824,469 bytes; it is not in `MANIFEST.tsv` and is pinned here; fetched from
`https://raw.githubusercontent.com/NPRA/jammertest-plan/75c0b2ce.../Testcatalog.pdf`). **Edition caveat:** the
tables of that PDF are headed "Jammertest 2026", while the schedule is the 2025 plan. The surveyed points are physical
sites; this registration assumes they are the sites used in 2025 and states that it is an assumption.

Truth points (EUREF89, taken as WGS84; the difference is below a metre at this precision and far below the bars):

| Area | Point (Appendix A) | Latitude N | Longitude E | Why this point |
|---|---|---|---|---|
| 1 (Bleik) | `SENDER`, "FFI Jammer" | 69.2788429 | 16.0060623 | the only surveyed jammer site of Area 1. Every other named Area 1 point lies within 2.0 km of it (cemetery 0.7 km, `RX-1` 0.2 km, `REFANT` 1.5 km, `AS` 2.0 km) |
| 2 (Bauktuva parking) | `ORIG`, origin of Site 2 | 69.2225166 | 15.9334241 | the jammer positions `A50` to `C150` are within 0.2 km of it |

"Ramnan", where the plan comments place the 50 W "Porcus Maior" jammer of Area 1, has **no coordinate in the text** of
the catalogue (it appears only in figures). Whether `SENDER` is Ramnan is not stated; the 2.0 km spread of the Area 1
points is reported beside every Area 1 distance and is not subtracted from any error. Test Area 3 is a motorcade on
roads, not a fixed point, and is excluded from the truth.

## 3. Data, and how it is fetched

All fetched by committed scripts in `xval/emitter-region/` and never vendored. Identifiers (ICAO address, MMSI) are
hashed with a fixed, documented salt at extraction so the CSV is reproducible; they are hashed again with a random
salt inside Kshana and never written. Every output of the run is aggregate.

**ADS-B**, adsb.lol `globe_history_2025` daily readsb history, ODbL 1.0, release tags
`v2025.09.NN-planes-readsb-prod-0`, `NN` = 14 to 19 (UTC days). `extract_adsb.py` keeps airborne rows in the box
62 to 76 N, 0 to 32 E. Pinned: SHA-256 of the concatenated split tar, and of the extracted CSV.

| UTC day | Release tag | SHA-256 of the concatenated tar | Rows kept | Aircraft with rows in box | SHA-256 of the extracted CSV |
|---|---|---|---|---|---|
| 2025-09-14 | `v2025.09.14-planes-readsb-prod-0` | `8122031d3816991a083996ac015e3e5c15dc2e6bf8c5e3cc5f46a738533dd797` | 138098 | 277 | `72f3b0c7dd914e90a1a07e554242a5b0fad3b214d7b8e6333acfff3da85b2712` |
| 2025-09-15 | `v2025.09.15-planes-readsb-prod-0` | `cbf87c6eec02c5b93e4db38014ef1ae13942779d5eddae6801ee516e6dc3dbff` | 162021 | 272 | `c091d066bd00d64fbbc1ed8fdea9cd29f2766ec1ee6d2a1f6cfa4238f7d7b559` |
| 2025-09-16 | `v2025.09.16-planes-readsb-prod-0` | `3aaefb8fd7a8cf805675c92a325552dd644da3a007e5b5a1800b936f9ec8525a` | 153740 | 274 | `6ce243c24b1792ba748923262acf0bc4957afe88fdab78d43a1969761ae87c8e` |
| 2025-09-17 | `v2025.09.17-planes-readsb-prod-0` | `3d861efa1d61f45e4874e812fc203da0a4074a48a7f37150b5cdcad16266c2e2` | 153303 | 281 | `1bd8249c76f0614b912bad7d39391378137c0caf3e4206df5574afc7f1a54949` |
| 2025-09-18 | `v2025.09.18-planes-readsb-prod-0` | `a7c637a077655e04677a7b48729f934b26a99a8e9a24e7aa2932fc6ab0ae44cd` | 161947 | 283 | `5a0ce77886209a32af287a6150b56185ea55dde911c77893a98b76c8937bf1ac` |
| 2025-09-19 | `v2025.09.19-planes-readsb-prod-0` | `1eab92306ea14fad7de23c77e9a28ceb98923989d1f248ebe3924090e4762705` | 153540 | 280 | `dc7dcd4104a1667e61a32c036f91a3007d3ca371e21d5f07df9768caf101c99b` |

**AIS**, Kystverket open AIS through the Kystdatahuset API (NLOD 2.0),
`POST https://kystdatahuset.kystverket.no/ws/api/ais/positions/within-bbox-time`, box 14.0 to 18.0 E, 68.8 to 69.8 N
(Andoya and its approaches), UTC days 14 to 19 Sep 2025. `fetch_ais.py`. Pinned: SHA-256 of the raw response and of
the extracted CSV, as fetched on 2026-10-27.

| UTC day | Raw rows | Rows in the day (+2 h reading) | SHA-256 of the raw response | SHA-256 of the extracted CSV |
|---|---|---|---|---|
| 2025-09-14 | 254940 | 254940 | `08f40ca9654a178f3f97f18b1268e09b13b2909662ed2aeacad53e1c882e70c1` | `13f9ad4e8bb9cdee5b4dbf1e6b55e395ed2a8cf7723906c9b9d862f3d622f271` |
| 2025-09-15 | 371849 | 371849 | `06948b457a376c4d25034294b7ed236e835ed49be4d37e671c936e5d72a07ff8` | `d0ca4babada18547f1465398028668399a9830f32edecfed1ac65e2bda7c0200` |
| 2025-09-16 | 308143 | 308143 | `5e839980b382cac71e5dd800a2ce593aa410b9aa9e9ab4801a6c5252b30a80cd` | `77913a8261133edbb8a4b80d11c752dc93809f67f3045a625a3e5b919ae2f6d5` |
| 2025-09-17 | 323423 | 323423 | `fa0e08758d56ea24a8e2c3efa07b65e4a920f2a86b1e129134f06cadae588e92` | `1b73f8299264d3ed4790559abd55e4040aba6e51e8fe23ebc7e3291f8885a8d0` |
| 2025-09-18 | 348853 | 348853 | `9fc25dde9c60fb5c1f7cd9f889cdee1bc257a485f17b05b09d7f25112d12883b` | `fd576ce2fdc69b18e23ca474df1be3ed4a616bb951df65fa11a83b4cf4a2e39a` |
| 2025-09-19 | 357039 | 357039 | `798e58d0f2e68d7fa883723160a90fc3d5abf4d55be41a8b1ad84fc98c8b236e` | `e8fb97fd212ddf367a566c806d3717c0c9c9c73e1c2b49b78c94f5ec2113a132` |

**AIS timestamp finding (made before any scoring).** The schema labels the time "date time utc". A request with
`end` = D 00:00 returns stamps D-1 02:00:00 to D 01:59:59, and `start` is ignored. Read as **local time, UTC+2**, every
returned row falls inside exactly one UTC day (all rows of all six requests); read as UTC, the window is 02:00 to
02:00, which is not a day. The **primary** analysis therefore treats the stamps as UTC+2 (`fetch_ais.py`, default);
the as-documented reading (`--stamps utc`) is run as a descriptive sensitivity analysis and carries no bar.

**What was looked at before this registration** (so no reader supposes more was hidden): counts of distinct aircraft
and of rows per hour and per window inside the box, with and without a NIC or NACp field; the number of AIS rows and
vessels per day; the plan and catalogue. No degraded flag, session or region was compared with any slot.

## 4. Software and parameters

The estimator is the code at the commit that is this file's parent (`5e8bb63113ff64265ee2b5338bf58466cc3ff238`). Parameters are the
pre-registered v1 constants written into every output (`emitter::EmitterParams::preregistered_v1`): bins of 120 s;
a unit is affected at 50% or more flagged reports; an aircraft or vessel needs 5 good reports in the input; ADS-B
altitude floor 5000 ft; emitter antenna 2 to 100 m (8 log-spaced values); effective ranges 12 km to 426 km in steps
of 1.25, and line of sight only; per-aircraft susceptibility 0.6, in-reach detection 0.9, background 0.03,
persistent-fault probability 0.03; soft reach edge 15% (at least 0.75 coarse cells); likelihood exponent
0.3 (a power posterior; section 8); sessions split by a 30-minute gap and by reach overlap; at least 5 distinct aircraft or vessels to publish;
levels 50%, 90%, 95%; at most 12,000 coarse cells, each refined 4 by 4 where the posterior has mass (at most 1,000 refined). For AIS a report is flagged when its speed over ground exceeds 70 kn or it arrives as a jump of at least 1,000 m within an hour implying more than 70 kn (the AIS map's own rules, the on-land rule off), and a vessel's antenna is taken at 15 m.

These were set from physics, from the privacy rule and from **synthetic data only** (section 8). **No parameter was set
from, or checked against, any real report.**

## 5. The population and the matching rule

**Scheduled-jamming windows.** From the plan: every slot of catalogue type 1 (jamming) at Test Area 1 or 2, merged
when less than 30 minutes apart, in UTC:

| # | Start (UTC) | End (UTC) | Slots | Areas |
|---|---|---|---|---|
| W1 | 2025-09-15 12:00 | 2025-09-15 15:56 | 22 | 1, 2 |
| W2 | 2025-09-16 07:00 | 2025-09-16 10:54 | 17 | 1, 2 |
| W3 | 2025-09-16 12:30 | 2025-09-16 15:58 | 16 | 1, 2 |
| W4 | 2025-09-16 17:00 | 2025-09-16 20:00 | 1 | 1 |
| W5 | 2025-09-18 07:00 | 2025-09-18 11:00 | 4 | 2 |
| W6 | 2025-09-18 13:00 | 2025-09-18 16:00 | 9 | 2 |

Wednesday and Friday have no type 1 slot at Areas 1 or 2 (their slots at those areas are spoofing or meaconing, which
this registration does not score). That is **six** windows, so at most six scheduled sessions can exist per source.

**One run per source**: the six day files concatenated into one input and passed once to `kshana interference-map
locate` (ADS-B: `--source adsb --dataset adsb-lol`; AIS: `--source ais --dataset kystverket`, no `--land`: the Natural
Earth coastline is accurate to about a kilometre, comparable with a vessel's distance from shore, so the on-land rule is
off). Defaults for every other option. ADS-B and AIS are separate runs, scored separately and never combined.

**Sessions.** A published session (at least 5 distinct aircraft or vessels) is **scheduled** if at least 50% of its
duration lies inside a window, and **unscheduled** otherwise. For a scheduled session the **truth set** is the point of
every Area that has a type 1 slot overlapping the session at all: Area 1, Area 2 or both.

**Success** of a scheduled session: its 95% region contains every point of its truth set (whether or not the session
is flagged `unconstrained`; M2 below counts those separately). **Centroid error**: the great-circle distance from the
session's centroid to the mean of its truth set, in km, for sessions that have a centroid (constrained sessions).

## 6. Metrics, bars and their derivation

Let `n` be the number of scheduled sessions of a source and `h` the number of successes.

| Id | Metric | Bar | Derivation |
|---|---|---|---|
| min | `n` | at least **4** | at most six windows exist; four is two thirds of them, and below it a single session decides the coverage bar |
| M1 | coverage: `h` of `n` | `h` at least `k(n)` of the table below | `k(n)` is the largest `k` with `P(Bin(n, 0.95) >= k) >= 0.95`: a calibrated 95% region passes with probability at least 0.95 |
| M2 | share of scheduled sessions that are `unconstrained` | at most 0.5 | a region that fills its search domain contains anything; this stops M1 being met by a region that says nothing |
| M3 | median centroid error over constrained scheduled sessions | at most `D` km: ADS-B 45, AIS 20 | the 75th percentile of the single-session centroid error of the synthetic derivation (section 8), rounded up to the next 5 km |

`k(n)`: n=4: 3; 5: 4; 6: 5; 7: 6; 8: 6; 9: 7; 10: 8; 11: 9; 12: 10.

Reported without a bar: coverage of the 50% and 90% regions; the 95% region area; the distance from the centroid to
each Area 1 and Area 2 point separately; the centroid error of the naive mean of the affected positions
(`affected_mean_position`); every unscheduled session (count per day and total); the distinct aircraft or vessels
observed in each window within 100, 200 and 300 km (ADS-B) or 30 and 60 km (AIS) of 69.25 N 15.95 E.

## 7. What each outcome means

* **MET** (per source): `n` at least 4 and M1, M2 and M3 all pass.
* **NOT MET**: `n` at least 4 and at least one of M1, M2, M3 fails. Recorded with the numbers.
* **NOT ASSESSABLE**: `n` below 4 (the data do not support the test). Recorded as such. It is **not** a pass and not a
  miss of a bar; nothing is loosened and no further window is added.

The ledger row `VM-bc70cb57` becomes **VALIDATED only if both sources are MET.** Any other outcome leaves it
MODELLED, and the row's oracle text is updated to record the outcome. Splitting the row by source is a separate owner
decision after the result.

**An expected outcome, stated now.** From the counts above, a window holds about 9 to 16 distinct aircraft within 100 km
and the publication rule needs 5 affected, so the ADS-B run may well produce fewer than 4 scheduled sessions and be
NOT ASSESSABLE. That is an acceptable, recorded result.

## 8. Calibration on synthetic data (the only tuning)

`emitter::tests::derive_centroid_error_bars` and `diag_calibration_ladder` (ignored tests; seed 20261027) generate
sessions from the estimator's own model with the reach edge uncertain by 15% per aircraft, an aircraft-level persistent
fault, unknown power and unknown antenna height, at an ADS-B geometry (aircraft 7 to 12 km high in a 760 km box) and an
AIS geometry (vessels at 15 m in a 140 km box). Results, which also fixed the likelihood exponent:

Single-session results at default parameters (release build, 240 sessions generated per geometry, of which those
publishable under the 5-distinct rule are scored; "constrained" is the status of the output):

| Geometry | Published | Unconstrained | 50% region holds the source | 90% | 95% | Centroid error p50 / p75 / p90 (km) | Naive mean of affected positions p50 / p75 / p90 (km) |
|---|---|---|---|---|---|---|---|
| ADS-B-like | 119 | 8 (7%) | 0.76 | 0.98 | 0.99 | 23.4 / 43.3 / 83.6 | 64.0 / 99.8 / 155.8 |
| AIS-like | 116 | 36 (31%) | 0.78 | 0.99 | 1.00 | 11.7 / 18.0 / 22.9 | 10.8 / 15.7 / 23.1 |

The stated levels are therefore **conservative** on synthetic data (the 95% region holds the source in 0.99 and 1.00 of
sessions, the 50% region in about 0.77), which is the intended direction after the exponent was lowered from 1.0:
in the full-nuisance rung of the calibration ladder (`diag_calibration_ladder`, 66 AIS-like and 42 ADS-B-like sessions)
the 95% coverage was 0.59 (AIS) and 0.71 (ADS-B) at exponent 1.0, 0.88 and 0.81 at 0.6, 0.97 and 0.90 at 0.4, and
1.00 and 1.00 at 0.25. 0.3 was chosen from these, before any real data was opened. Earlier defects found and fixed on the
way, all on synthetic data: a coarse grid that put the true source outside a thin region (fixed by refining 4 by 4),
hard reach edges (soft edges), a power ladder with gaps (ratio 1.25), a coarse antenna-height ladder (8 values), and
persistent per-aircraft faults dragging the posterior (an aircraft-level fault term). The M3 bar `D` is the 75th
percentile of the centroid error, rounded up to the next 5 km: 45 km for ADS-B and 20 km for AIS. The AIS centroid
is not better than the naive mean in this geometry; M3 is an absolute distance, not a comparison with it.

## 9. Reproduction

```
xval/jammertest-plan/fetch.sh <dir>                                   # plan and catalogue, pinned
python3 -I xval/emitter-region/extract_adsb.py v2025.09.NN-planes-readsb-prod-0 adsb-NN.csv 62 0 76 32   # NN = 14..19
python3 -I xval/emitter-region/fetch_ais.py 2025-09-NN ais-NN.csv 14.0 68.8 18.0 69.8                   # NN = 14..19
kshana interference-map locate adsb-all.csv --source adsb --dataset adsb-lol --out out-adsb/
kshana interference-map locate ais-all.csv  --source ais  --dataset kystverket --out out-ais/
```

The scoring script (`xval/emitter-region/score.py`, committed after sign-off and before the run) is a direct
implementation of sections 5 to 7 and prints the table of `RESULTS.md`.

## 10. What the result can and cannot say

A MET result says that, at these two sites on these days, with this data, the stated 95% region contained the
scheduled site at the stated rate and was centred within the bar. It does not say the estimator locates an emitter of
unknown position, that a region is a position fix, that the sites are in the 2025 positions (edition caveat), that the
transmitters were on air (the plan is a schedule, not an on-air record), or anything about other places, powers or
terrain. A NOT MET or NOT ASSESSABLE result says the same in the other direction and is equally a result.

Sign-off: ______________________  (owner)   Date: ____________
