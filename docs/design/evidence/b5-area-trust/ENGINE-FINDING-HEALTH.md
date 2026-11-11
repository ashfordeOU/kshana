<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Engine finding: broadcast records marked unhealthy were used (B5 v3, 10 November 2026)

## What was wrong

`pvt::select_ephemeris` chose, for each satellite, the broadcast record whose `Toe` is nearest the epoch, within
`MAX_EPH_AGE_S`, whatever its health field said. A record a satellite broadcast as unhealthy therefore entered
every single-point fix that saw the satellite.

B5 v3's diagnosis (`xval/area-trust/README.md`, reading X1; `xval/area-trust/v3_diagnosis.json.gz`) found it on v2's
scored T4 data:
- At 10:27 on 2025-07-27 and 07-28, G11 broadcast a record marked unhealthy (health 63). The engine chose it over a
  healthy record 60 s farther away, with residuals of up to about 1 900 km at all four stations.
- On 2025-07-31, G14's records were marked unhealthy (health 63) from 10:44 to 14:44 and were used.
- Each station's fix used a satellite whose record is marked unhealthy in 119 to 264 of its scored epochs.

## The fix

`select_ephemeris` now skips records that `record_unhealthy` marks, and a satellite with no healthy record within
`MAX_EPH_AGE_S` is left out of the epoch. The rule is on by default, with no option to turn it off. Per system:

| System | Unhealthy when | Source |
|---|---|---|
| GPS | health ≠ 0 | IS-GPS-200: 0 means all signals OK |
| QZSS | `(health & 0xFE) ≠ 0` | the least significant bit is the L1C/A-only flag; RTKLIB's `rinex.c` applies the same mask |
| Galileo, BeiDou | not read (unchanged) | their health bits are per signal, so the mask depends on the signals a solve combines; left to a separate change |

**The QZSS scope decision.** The first version of the fix read any non-zero health as unhealthy. That dropped QZSS
J01 (health 1, the L1C/A-only flag) from `BRDM00DLR_R_20130010000_01D_MN.rnx`. It was a scope error in the fix, not a
value to re-pin, and the QZSS rule above replaced it.

Unit tests: `pvt::tests::select_ephemeris_skips_unhealthy_records` and
`pvt::tests::qzss_health_lsb_alone_is_not_unhealthy`.

## What was run, and what moved

The coordinator ran the tests in release mode, built from `ws/b5-v3`:
- **Tests run:** the library's unit tests (3 871), plus the 83 test files that reach broadcast ephemerides. Those
  are the files that use `assemble_epoch`, `select_ephemeris`, RAIM, `receiver_trust`, `area_trust`, `parse_nav`,
  `pvt` or navigation fixtures.
- **Result:** 4 282 passed. One expectation moved, and it is a correct change.
- **Not run here:** the remaining test files (about 550) do not reach broadcast ephemerides. CI runs them on merge.

**The one moved expectation.** `orbit::tests::constellation_from_a_real_broadcast_file_has_one_propagator_per_satellite`
builds a constellation from `BRDC00WRD_R_20181330000_01D_GN.rnx`:

| | Satellites |
|---|---|
| Before | G01 to G32 (32) |
| After | G01 to G03 and G05 to G32 (31): G04 is left out |

The file's only G04 record (2018-05-13 00:00) has health 63. The test's invariant was "every satellite the parser
decodes is represented", which predates the health rule. It now reads "every satellite with at least one healthy
record in the file is represented". The test computes that set from the parsed records with the same per-system
rule, and asserts that G04 is absent from BRDC00WRD and that J01 is present in BRDM00DLR.

No other pinned value moved.

## Results already scored

Scored results stay published as recorded:
- **B5 v2 (`RESULTS-v2.md`):** its T4 was scored with the engine before this fix, and the diagnosis shows that
  records marked unhealthy entered it. `RESULTS-v2.md` carries a dated note pointing here.
- **B5 v1:** v1's T4 (Madrid) was not re-run under the fix.
- **B5 v3:** its T4 runs with the fix (reading X10).
