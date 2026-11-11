<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B5 v2 (0.41.x): area trust with a two-station floor for small areas: results

Pre-registration: `PREREGISTRATION-v2.md` (signed off 9 November 2026). The v2 readings (W1 to W11 in
`xval/area-trust/README.md`) and the v2 oracle (`xval/area-trust/oracle_v2.py`, Python standard library only)
were committed before any v2 engine code. The T4 selection was committed before any v2 observation file was
fetched. Every bar was scored once. The bars were not changed.

v1 stays published (`RESULTS.md`, B5 NOT MET on T4). This result does not change it.

Reproduce T1, T2 and T5 with `cargo test --test area_trust -- --nocapture`, `pytest tests/python -k area_trust` and
`node web/smoke.mjs`.

## Summary

| Bar | Result |
|---|---|
| T1 rule exactness | **MET**: the engine's v2 timeline equals `oracle_v2.py`'s in every one of 43 165 grid seconds: the seven seeded replays (4 to 50 stations, 520 events) and the two boundary documents, each with `"area_rule": "v2"`. The JSON Lines are the oracle's bytes. 357 lines differ from v1: 209 on seed 4101 (4 stations), 143 on seed 4102 (5 stations) and 5 on `boundary_hold`. Seeds 4103 to 4107 (7 or more stations) are identical to v1, as W2 says. |
| T2 detection | **MET**: 267 events put at least `k` stations in alarm (112 of them at least `k` Untrusted); every one raised its expected v2 alert. None of the 253 events with fewer raised `UNTRUSTED`. The W5 checks on the 4- and 5-station replays: 7 events with exactly one station Untrusted and one in alarm raised no area alert; 30 events with two stations Untrusted all raised an alert to `DEGRADED` or worse. |
| T3 end-to-end latency | **MET**: 220 injected events at 100 stations, 1 Hz, over the MQTT ingest, on the v2 rule. Webhook: 0 missed, median 1.003 s, 95th percentile 1.004 s, maximum 1.013 s. MQTT: 0 missed, median 1.003 s, 95th percentile 1.004 s, maximum 1.013 s. Bar: 95th percentile ≤ 5 s and maximum ≤ 10 s. |
| T4 false alerts | **NOT MET**: 16 alerts to `DEGRADED` or worse over 13 area-days (1.23 per area-day; bar ≤ 1), 9 of them to `UNTRUSTED` (0.69 per area-day; bar ≤ 0.1). One area (Goddard: GODS, GODE, GODN, USN7), 2025-07-25 to 08-06. |
| T5 determinism | **MET**: with `"area_rule": "v2"`, the command line (all nine documents), Python and WebAssembly (seed 4101) give `oracle_v2.py`'s bytes. Without the field, the engine and `oracle_v2.py` give the committed v1 bytes on all nine documents, and `"area_rule": "v1"` gives the same bytes. |

B5 v2 is MET only when T1 to T5 are all met. With T4 not met, **B5 v2 is NOT MET**.

## T1, T2 and T5

- **Documents:** the v2 documents are the committed v1 documents with `"area_rule":"v2"` as their first field.
  `tests/area_trust.rs` derives them; only `oracle_v2.py`'s timelines are stored
  (`tests/fixtures/area_trust/*.v2.expected.jsonl*`).
- **Order:** those timelines and the v2 tests were committed together, before any of the tests was run.
- **The live path:** `AreaLive` built with the v2 rule closes exactly the v2 batch timeline's seconds on every
  replay.
- **A first Python run that did not test v2:** the first `pytest` run failed the v2 check. The scratch virtual
  environment was from 8 November, and `pip` kept its installed 0.40.0 module because the version number had not
  changed, so Python ran an older build without the `area_rule` field. After a forced reinstall of the wheel built
  from this tree, both Python area checks pass. No engine code changed between the two runs.

## T3

T3 was re-run as written (W10), on the v2 rule, with v1's harness and readings 13 to 17 unchanged:
- **Runs:** four runs of 55 events, one after another on 9 November 2026, each 74 to 82 minutes. 100
  stations replayed Madrid's 2025-01-06 to 01-19 background at 1 Hz (the v1 files, checked against
  `MANIFEST.tsv`).
- **Deliveries:** every alert the area rule raised reached both receivers, 225 alerts for 220 events (56, 56, 56
  and 57), with no failures and no late epochs. As in v1, the run files hold counts, not a list of alerts, so the
  5 extra alerts are not attributed; they are delivered but not scored.
- **The rule at 100 stations:** with `N > 6` the v2 rule is v1's (W2), so this run checks the v2 code path, not a
  different rule.
- **Reference box:** Intel Xeon at 2.10 GHz, 4 logical CPUs, 15 GB, Linux. Live UBX decode ran at 7 373 epochs/s
  (`kshana bench-speed --quick`, run after the four runs). v1's box ran at 2.30 GHz and 8 409 epochs/s.

**What the runs were built from:**
- The script calls `cargo test` once per run, and cargo rebuilds the test binary when its source changes.
- Run 0 was built from commit `e89d49c22` exactly.
- Runs 1 to 3 were built from `e89d49c22` plus uncommitted additions to `tests/area_trust_igs.rs`: the T4 v2
  harness, one hunk of 236 added lines and none removed, between the v1 T4 test and the T3 section.
- Those additions do not touch `src/` or any code the T3 test runs.
- The diff is `xval/area-trust/t3v2/t3v2_runs1to3_testfile.diff`, SHA-256
  `60b398ba1eb10f319827a296c23749e5c197103b9e5361401c6d9c2a4948dfa6`.

The runs, the run log, their pooled result (`xval/area-trust/t3_pool.py`, unchanged) and the speed check are in
`xval/area-trust/t3v2/`. What the latency includes and excludes is as in v1 (`RESULTS.md`, T3).

## T4

The selection (`xval/area-trust/select_v2.py`, `selection_v2.json`) was committed before any v2 observation file was
fetched. The fetch (`fetch_v2.py`) refused nothing. The files' SHA-256 values are in `MANIFEST_v2.tsv`, and the
navigation file chosen per day is in `nav_choice_v2.tsv`. The scored run is `tests/area_trust_igs.rs`,
`t4v2_false_alerts_on_clean_igs_data` (ignored by default; it needs the fetched files). It wrote
`xval/area-trust/t4v2_result.json`, and `tests/area_trust.rs` pins the miss. After the scored run the harness was
reformatted and one type alias added for the linter, with no change in behaviour; run again, it wrote the committed
file byte for byte.

- **Days:** 2025-07-24 to 08-06, the first 14 consecutive days after 19 January 2025 on which every 3-hour Kp is at
  most 4.000 (the largest is 4.000, on 08-03). 07-24 calibrates; 13 days are scored.
- **Stations:** reading 10 kept one cluster, at Goddard: GODS00USA, GODE00USA and GODN00USA (65 to 141 m apart)
  and USN700USA (about 23.5 km from them). Madrid was not eligible: two of its stations were not listed on day 1.
- **Navigation:** `BRDC00WRD_R` on every day except 2025-08-04, which used `BRDC00IGS_R` (W8, B8 reading 8).
- **Fixes:** every station had a single-point fix at every epoch.

Alerts per scored day (to `DEGRADED` or worse / of them to `UNTRUSTED`): 07-25: 0/0, 07-26: 3/0, 07-27: 1/1,
07-28: 3/1, 07-29: 1/0, 07-30: 0/0, 07-31: 4/3, 08-01: 0/0, 08-02: 4/4, 08-03 to 08-06: 0/0.

| Station | `H_s` (m) | Tracked median | Scored epochs | No fix | Position alarms | C/N0 alarms | Loss-of-lock alarms | Degraded epochs | Untrusted epochs |
|---|---|---|---|---|---|---|---|---|---|
| GODS00USA | 11.8 | 10 | 37440 | 0 | 308 | 0 | 3 | 3 | 308 |
| GODE00USA | 10.4 | 10 | 37440 | 0 | 326 | 0 | 0 | 0 | 326 |
| GODN00USA | 16.5 | 10 | 37440 | 0 | 239 | 0 | 317 | 317 | 239 |
| USN700USA | 12.2 | 11 | 37440 | 0 | 263 | 0 | 43 | 43 | 263 |

Epochs are 30 s. AGC, the jamming indicator, the clock monitor and OSNMA are not in these files and did not run.

**Where the alerts come from** (times are GPS time of day; the alert list is in `t4v2_result.json`):
- **7 alerts to `DEGRADED`** with two stations `Degraded` and none `Untrusted`, between 19:15 and 19:33 on 07-26,
  07-28, 07-29 and 07-31. A station is `Degraded` here only on a loss-of-lock alarm, and GODN and USN7 have most
  of them.
- **9 alerts to `UNTRUSTED`:**
  - all four stations had a position alarm in the same epoch at 10:30:30 on 07-27, at 10:30:30 on 07-28 and at
    02:00:00 on 08-02;
  - two stations at once at 10:36 to 10:43 on 07-31 and at 03:00 to 03:03 on 08-02.
- **What v2 changed:** no alert came from one station alone. v2 removed that cause of v1's miss.
- **What remains:** alarms in the same epoch at stations a few hundred metres to 23 km apart. These stations share
  the broadcast orbits and clocks and most of the atmosphere, so an error in those is common to all of them. The
  cause of these epochs is not established here.
- **Position alarms:** the four stations had 239 to 326 position alarms each in 13 days. Madrid's four had 0 to 16
  in v1.

**What NOT MET means here:**
- On these quiet days, the v2 rule still raised more area alerts than the bar allows, and far more `UNTRUSTED` ones.
- The bars stay as signed; they are not loosened.
- Any further change to the rule or to the position monitor, for example screening satellites the broadcast data
  marks unhealthy or alarms common to every station of an area, would need a new pre-registration and a new
  fortnight.

## Note (10 November 2026): an engine finding after scoring

B5 v3's diagnosis found that the engine used broadcast records marked unhealthy: G11 on 07-27 and 07-28, and G14 on
07-31. These are among the T4 alerts above. The engine now skips such records
(`ENGINE-FINDING-HEALTH.md`). The T4 result above was scored before the fix and stays as recorded. It was not
re-scored.
