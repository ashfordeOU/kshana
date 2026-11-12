<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B5 v3 (0.41): area trust with a common-mode satellite-fault rule: results

Pre-registration: `PREREGISTRATION-v3.md` (signed off 10 November 2026). Readings: X1 to X12 and X10a in
`xval/area-trust/README.md`. Every bar was scored once. The bars were not changed. v1 (`RESULTS.md`) and v2
(`RESULTS-v2.md`) stay published as NOT MET; this result does not change them.

| Step | Commit |
|---|---|
| Diagnosis of v2's common-epoch alarms and readings X1 to X11 | `1321d9601` |
| The independent oracle `oracle_v3.py` (Python standard library only) | `6873c6ce9` |
| Reading X12 (what T1 and T5 compare), before any v3 engine code | `4cf06e89c` |
| Engine finding: satellite health (X2), `ENGINE-FINDING-HEALTH.md` | `c05569188`, `8e812ca7f` |
| `select_v3.py` and `fetch_v3.py`, before the selection was run | `988b834f3` |
| The selection as run, and the disclosure X10a, before any observation file was fetched | `7cb943964` |
| Engine code, the replay generator, its four documents and the T1, T2, T5 tests, before the oracle was run on them | `55cc7bba8` |
| T1 and T2 scored (the oracle's outputs committed with the recorded verdicts) | `c1d6c8399` |
| T4 harness, before the T4 run | `449f2ccdd` |
| T3 harness (`KSHANA_B5_AREA_RULE=v3`) | `41a70b983` |
| T4 files' SHA-256 and navigation choice, before the T4 run | `081072844` |
| T4 scored | `001385997` |
| T3 scored | T3_COMMIT |

## Summary

| Bar | Result |
|---|---|
| T1 rule exactness | **MET**: on the four satellite-fault replays (4, 5, 7 and 10 stations; 520 epochs, 125 with a flagged satellite) the engine's JSON Lines (the flagged satellite, the station states, the loss-of-lock flags and the 520 seconds of area timeline) are `oracle_v3.py`'s bytes, through the library and the command line. The horizontal errors before and after the screen agree within 1 × 10⁻⁶ m, and no fix is missing in one only (X12). The seven v2 replays and the two boundary documents with `"area_rule": "v3"` give v2's bytes (X6). |
| T2 detection | **NOT MET**. Of 127 injected single-satellite faults that alarmed at least `k` stations, 123 were flagged with the injected satellite and cleared; **4 were not flagged** (seed 5103 at 16, 46 and 83 s; seed 5104 at 40 s). Of 67 epochs with two faulty satellites that alarmed at least `k` stations, 65 were not flagged; **2 were flagged** with one satellite (seed 5101 at 30 s, G02; seed 5102 at 84 s, G07). Errors at one station only: none of 83 flagged. Loss of lock alone: the station stayed nominal, with the alarm in its record, in all 40 epochs. A flagged fault left no station in alarm. |
| T3 end-to-end latency | T3_RESULT |
| T4 false alerts | **MET**: 1 alert to `DEGRADED` or worse and 1 to `UNTRUSTED` over 26 area-days (0.038 per area-day each; bars ≤ 1 and ≤ 0.1). Goddard (GODS, GODE, GODN, MRC1): 0. Wettzell (WTZR, WTZA, WT21, WTZZ): 1, on 30 May 2026. Days 18 to 30 May 2026 scored, 17 May calibrating (X10a). |
| T5 determinism | T5_RESULT |

B5 v3 is MET only when T1 to T5 are all met. With T2 not met, **B5 v3 is NOT MET**.

## T1, T2 and T5

- **Replays:** `area_trust::v3::fault_replay`, seeds 5101 to 5104, GPS satellites above 15° over an area about
  60 km across, 1 m range noise. Per epoch one injection: clean, a common range error at one satellite (20 m to
  2 000 km, log-uniform, either sign), an error at one station, two satellites' errors, loss of lock alone, or loss
  of lock with a C/N0 alarm. The X12 guard (no tied candidates, no error within 1 × 10⁻⁶ m of `H_s`) redrew 0 epochs.
- **Order:** the generator, its documents and the tests were committed (`55cc7bba8`) before `oracle_v3.py` was run
  on the documents. The oracle's outputs were then committed with the recorded verdicts (`c1d6c8399`).
- **The four missed faults (T2), described after the run.** Without the faulty satellite, one or two of the alarmed
  stations, left with 6 or 7 satellites in a weak geometry, still exceed their `H_s` (for example seed 5104 at 40 s:
  15.3 m against 10.4 m, and 15.7 m against 10.3 m). X4 asks that removing one satellite bring every alarmed station
  under its threshold, so no satellite explains these epochs, and the alarms stand.
- **The two flagged two-satellite epochs (T2), described after the run.** In both, one of the two errors is small
  (27.7 m with 680.8 m; 65.4 m with 129.4 m), and without the larger one no station is alarmed. Under X4's
  definition one satellite does explain these epochs; X8's statement that two faulty satellites are never explained
  by one does not hold for them.
- **T5:** the command line gives the oracle's bytes on all four documents (`tests/area_trust_v3.rs`). Python
  (`tests/python/test_bindings.py`) and WebAssembly (`web/smoke.mjs`) check the same four documents in continuous
  integration.

## T3

T3_SECTION

## T4

- **Data:** 17 to 30 May 2026 (X10a; the pre-registration's "of 2025" has no 14-day quiet run after 6 August 2025,
  and X10 governs, as disclosed before any fetch). 140 files fetched by `fetch_v3.py`, every SHA-256 in
  `xval/area-trust/MANIFEST_v3.tsv`; the navigation file per day in `nav_choice_v3.tsv` (BRDC00WRD_R every day).
- **Run:** once, 12 November 2026 00:06 to 00:13 UTC, `t4v3_false_alerts_on_clean_igs_data`, release test binary
  built from `41a70b983` (SHA-256 in `xval/area-trust/t4v3.log`); the result is `xval/area-trust/t4v3_result.json`,
  which the test now reproduces.
- **Per station** (H_s, scored epochs, position alarms after the screen): GODS 11.6 m, 37 440, 1; GODE 11.3 m,
  37 440, 2; GODN 18.9 m, 37 440, 67; MRC1 11.9 m, 37 440, 27; WTZR 14.7 m, 37 439, 0; WTZA 10.1 m, 37 434, 2;
  WT21 13.1 m, 37 440, 31; WTZZ 14.7 m, 37 435, 3.
- **The screen:** G13 was flagged in 141 scored epochs (10 at Goddard, 131 at Wettzell). Described after the run:
  the merged navigation files mark most G13 records of each day unhealthy (health 63, 15 to 20 a day); three a day
  are marked healthy, and the X2 health rule uses those. The screen removed G13 where it explained the alarms.
- **The alert:** Wettzell, 30 May 2026, two stations untrusted at once (`n_u` = 2 of 4).
- **Loss of lock (X5):** 11 scored station-epochs had a loss-of-lock alarm alone (Goddard 3, Wettzell 8); under v3
  they left the station nominal, and the alarms are in the station records.

## What is not checked

Real interference events; AGC, the jamming indicator, the clock monitor and OSNMA on the real-data days (not in the
files); Galileo and BeiDou health (X2); the satellite-fault screen on systems other than GPS.
