<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B5 v3 (0.41): area trust with a common-mode satellite-fault rule

**Status: SIGNED. Proposed 9 November 2026; signed off by the owner on 10 November 2026, as drafted. The v1 and v2 results stay published as NOT MET where they missed; no bar is loosened.**

## Why a v3

B5 v2 (`RESULTS-v2.md`, `a068a3eb9`) met T1, T2, T3 and T5. T4 was NOT MET on Goddard and Washington
(2025-07-25 to 08-06):
- 16 alerts to DEGRADED or worse (1.23 per area-day) and 9 to UNTRUSTED;
- the 9 UNTRUSTED alerts came from position alarms raised at several stations in the same epoch, all four at once
  three times;
- 7 DEGRADED alerts came from loss-of-lock alarms.

An alarm shared by every station of an area in the same epoch points to a common cause: a satellite or
navigation-message fault, not local interference. v1 and v2 stay published.

## Step 1: diagnosis (on v2's already-scored data, before any v3 rule is written)

For each common-epoch alarm of v2's T4, record:
- which satellites the stations' fixes used;
- the residual per satellite;
- the broadcast navigation record in use (IODE, health and age);
- whether excluding one satellite clears every station.

The finding is written into the readings, whatever it is, including "cause not found". If it is an engine fault
(as in v1, where the RINEX navigation parser lost records), the fault is fixed and the fix stated.

## What changes (written after step 1, before any v3 data)

1. **Common-mode rule.** An epoch where at least `k` stations raise a fix-domain alarm and one satellite explains
   them gives that satellite a `SATELLITE_FAULT` flag:
   - "Explains" means that removing that satellite brings every alarmed station's residual under its threshold.
   - The flag is shown, and the stations' fixes are recomputed without that satellite.
   - The area state uses the recomputed fixes.
   - The specific test is fixed in the readings after step 1.
2. **Loss of lock.** Loss-of-lock alone, without a C/N0 drop or an AGC change, no longer makes a station DEGRADED.
   It stays visible in the station's state.
3. **T4 data, new.**
   - The next 14 consecutive days of 2025 after 6 August with every 3-hour Kp ≤ 4.000.
   - R10's station rule applied anew, by the committed selection script, before any fetch.
   - B8's navigation-file rule per day.

## Bars (unchanged)

T1 to T5 as in v1 and v2. T4: DEGRADED or worse ≤ 1 per area-day; UNTRUSTED ≤ 0.1 per area-day.

## Process

1. Sign-off.
2. The diagnosis (step 1).
3. Readings, oracle, engine, data selection and fetch.
4. Score once. `RESULTS-v3.md` records it.
