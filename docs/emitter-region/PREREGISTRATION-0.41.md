<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D3 (0.41): the emitter-region estimator re-run on a later campaign

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Advisory software. Public sources only. Numbers marked *proposed* are new; every other
number is a bar of [`PREREGISTRATION.md`](PREREGISTRATION.md) in this directory (signed off 27 October 2026) and is not
changed.

## Why this row

The signed-off test of `kshana interference-map locate` (ledger row `VM-bc70cb57`) against the Jammertest 2025
transmitter sites was **NOT ASSESSABLE** for both sources ([`RESULTS.md`](RESULTS.md)): ADS-B gave 2 scheduled sessions
against a minimum of 4, and AIS gave none. The data could not test the estimator. `RESULTS.md` named the next test: the
2026 campaign under its own pre-registration, not a re-scoring of 2025.

## Dependency on B3 and on the 2026 data

Roadmap item D3 depends on item B3 and on the Jammertest 2026 data:

- **B3 (gate 4, decided 3 November 2026):** the 2026 transmitter positions were published with the 2026 plan, so B3's
  point-location bar is registered against the 2027 campaign, and nobody on B3 opens the 2026 positions. This file does
  not change that.
- **Why D3 can still use 2026:** this test is **area level** against the surveyed sites published in the campaign
  catalogue, exactly as the 2025 test was. It never asked the estimator to find an unpublished position; the published
  site is the truth by design. Using the 2026 catalogue here does not open anything B3 is protecting, because B3's
  2027 registration does not depend on 2026 positions. **Owner decision 1** confirms this reading. If the owner decides
  instead that D3 waits for B3's 2027 campaign, every 2026 date below moves to the 2027 equivalents by the same rules,
  and nothing else changes.
- D3 also depends on the 2026 ADS-B and AIS data being available in public archives for the campaign days; if they are
  not, D3 is "not run".

## What stays (unchanged from the 2025 registration)

- The estimator method `kshana-interference-map/emitter-region/v1` with the **v1 parameters exactly as registered**
  (section 4 of the 2025 file). No parameter is changed after the 2025 result.
- Sessions, scheduled sessions, truth sets, success and centroid error (section 5).
- The bars (section 6): minimum `n >= 4`; **M1** `h >= k(n)` with the registered table; **M2** at most 0.5 unconstrained;
  **M3** median centroid error at most **45 km (ADS-B)** and **20 km (AIS)**.
- The outcome rule (section 7): MET, NOT MET or NOT ASSESSABLE per source; `VM-bc70cb57` becomes VALIDATED only if both
  sources are MET.
- The AIS timestamp reading: +2 h local as primary, as-documented as a sensitivity run without a bar (section 3).

## What changes: the data

| Item | Source (public) | Fixed now |
|---|---|---|
| Schedule and catalogue | NPRA `jammertest-plan` repository, <https://github.com/NPRA/jammertest-plan> (MIT), files `transmission-plan-2026-09-14` to `-18` and the 2026 catalogue | the commit is pinned at the first fetch after sign-off; the `test_contact` field is never read |
| Truth points | the 2026 catalogue's surveyed site table | the rule of the 2025 file: one point per fixed test area, the surveyed transmitter point of that area; moving or road-based areas excluded. The points and their coordinates are written into `RESULTS-0.41.md` before any session is compared |
| ADS-B | adsb.lol `globe_history_2026` daily readsb history (ODbL 1.0), release tags for the UTC days of the campaign week and the day before, <https://github.com/adsblol/globe_history_2026> | box 62 to 76 N, 0 to 32 E, as 2025; SHA-256 of each tar and each extracted CSV pinned at fetch |
| AIS | Kystverket open AIS through the Kystdatahuset API (NLOD 2.0), the endpoint of the 2025 file, box 14.0 to 18.0 E, 68.8 to 69.8 N | SHA-256 of each raw response and CSV pinned at fetch; a later mismatch makes AIS NOT ASSESSABLE (data changed) |

Scheduled-jamming windows are built from the 2026 plan by the 2025 rule (catalogue type 1 at the fixed areas, merged
when less than 30 minutes apart, local time converted to UTC with the offset the import uses) and committed before any
report is flagged.

**What may be looked at before the run** (as in 2025): counts of aircraft and vessels per hour and per window, the plan
and the catalogue. No degraded flag, session or region is compared with any slot before the scored run.

## Procedure

1. Sign-off and commit of this file.
2. The windows table, the truth points and the release tags and dates to fetch are committed. The fetch scripts
   `xval/emitter-region/extract_adsb.py` and `fetch_ais.py` are used unchanged (they take the year from the release
   tag and the date argument).
3. One run per source with the six day files concatenated, scored by `xval/emitter-region/score.py` unchanged.
4. `RESULTS-0.41.md` written once; nothing re-run or re-scored after the result.

## What a result would and would not mean

As section 10 of the 2025 file, for 2026. In addition: a second NOT ASSESSABLE would say that public ADS-B and AIS
coverage of this range does not support the test at the registered publication rule (5 distinct affected units). It
would not justify lowering that rule, which is a privacy rule as well as a statistical one.

## Owner decisions at sign-off

1. Confirm that the 2026 catalogue may be used for this area-level test (gate 4 reading above), or move D3 to 2027.
2. Confirm that the v1 parameters are frozen for this run.
