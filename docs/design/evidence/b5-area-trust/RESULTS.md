<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B5 (0.41): area trust from several reference stations: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). The readings and the independent oracle
(`xval/area-trust/README.md`, `oracle.py`, Python standard library only) were committed in `b9d2f4db9`, before
any engine code. The bars were not changed.

Reproduce with `cargo test --test area_trust -- --nocapture`.

## Summary

| Bar | Result |
|---|---|
| T1 rule exactness | **MET**: state agreement 1.0 with the oracle on 43 117 grid seconds of seven seeded replays (4, 5, 7, 10, 16, 25 and 50 stations; 520 events). Alert, live, degraded, untrusted and stale counts are equal too, and the engine's JSON Lines are the oracle's bytes. |
| T2 detection | **MET**: 267 events put at least `k` stations in alarm in one second (112 of them at least `k` untrusted); every one raised the expected area alert. None of the 253 events with fewer raised `UNTRUSTED`. |
| T3 end-to-end latency | **MET**: 220 injected events at 100 stations, 1 Hz, over the MQTT ingest. Webhook: 0 missed, median 1.003 s, 95th percentile 1.004 s, maximum 1.015 s. MQTT: 0 missed, median 1.003 s, 95th percentile 1.004 s, maximum 1.015 s. Bar: 95th percentile ≤ 5 s and maximum ≤ 10 s. |
| T4 false alerts | **NOT MET**: 23 alerts to `DEGRADED` over 13 area-days (1.77 per area-day; bar ≤ 1). No alert to `UNTRUSTED` (0; bar ≤ 0.1). One area (Madrid: MADR, CEBR, YEBE, VILL), 2025-01-07 to 01-19. |
| T5 determinism | **MET for the files and surfaces built**: the same seed gives the same stations document, byte for byte, equal to the committed fixture the oracle read; the command line, Python and WebAssembly give the oracle's bytes (`tests/area_trust.rs`, `tests/python/test_bindings.py`, `web/smoke.mjs`). T4's real-data timelines will be added when T4 runs. |

B5 is MET only when T1 to T5 are all met. T3 is met; with T4 not met, **B5 is NOT MET**. T3 not blocking K3b, the latency part of K3 is evidenced on the reference box.

## The replays

`kshana::area_trust::synth::replay(seed, stations, events)` draws per-station evidence at 1 Hz (horizontal error
around the surveyed point, the C/N0 template statistic and the existing monitors' outcomes), calibrates each
station's `H_s` on its first 120 s, and injects events in sequence with quiet gaps of 25 to 60 s: C/N0 drops of
3 to 20 dB, AGC, jamming-indicator and loss-of-lock alarms, position offsets of 10 to 500 m, clock steps and
OSNMA failures, on one or two stations or on many. Each station's state follows from section 1's rule, so the
truth of each event (the most stations in alarm, and untrusted, in one second) is exact. Stations also drop
out for 2 to 12 s in quiet time, so the stale rule is exercised; no replay reached `N < 2`, so that case is
covered by the two hand-built documents below.

The stations documents and the oracle's timelines are in `tests/fixtures/area_trust/`. Two hand-built documents
(`boundary_stale`, `boundary_hold`) cover a second with two epochs, a station going stale, `UNKNOWN`, and
hysteresis from `UNTRUSTED` through `DEGRADED` to `TRUSTED`; the engine equals the oracle on both.

## T4

The readings for real data (8 to 12 in `xval/area-trust/README.md`) were committed in `81298b1ac`, after the
station and day rule was applied and before any observation file was processed. The files were fetched by
`xval/area-trust/fetch.sh`; their SHA-256 values are in `xval/area-trust/MANIFEST.tsv`. The scored run is
`tests/area_trust_igs.rs` (ignored by default; it needs the fetched files), and it reproduces
`xval/area-trust/t4_result.json` byte for byte. `tests/area_trust.rs` pins the miss.

- **Days:** 2025-01-06 to 01-19, the first fortnight of 2025 with daily maximum Kp ≤ 4. Day 006 calibrates; 13
  days are scored.
- **Stations:** the rule kept one cluster. Ny-Ålesund and Wettzell have four or more IGS stations within 100 km,
  but some of them do not record GPS `S1C`.
- **Coordinates:** the weekly SINEX the pre-registration names is not published at BKG for these weeks, so the
  station positions come from the IGS station SINEX and the observation file headers (reading 9).

Alerts per scored day (all to `DEGRADED`): 007: 3, 008: 4, 009: 1, 010: 3, 011: 2, 012: 3, 013: 2, 014: 2, 015: 1, 016: 0, 017: 1, 018: 1, 019: 0.

| Station | `H_s` (m) | Tracked median | Scored epochs | No fix | Position alarms | C/N0 alarms | Loss-of-lock alarms | Degraded epochs | Untrusted epochs |
|---|---|---|---|---|---|---|---|---|---|
| MADR00ESP | 17.8 | 9 | 37440 | 3832 | 4 | 0 | 0 | 0 | 4 |
| CEBR00ESP | 13.5 | 10 | 37440 | 3832 | 16 | 0 | 0 | 0 | 16 |
| YEBE00ESP | 12.8 | 10 | 37440 | 3832 | 0 | 0 | 47 | 47 | 0 |
| VILL00ESP | 13.3 | 10 | 37440 | 3832 | 4 | 0 | 0 | 0 | 4 |

Epochs are 30 s. AGC, the jamming indicator, the clock monitor and OSNMA are not in these files and did not run.

**Where the alerts come from:**
- Every alert is a single station's position alarm. `n_U ≥ 1` makes the area `DEGRADED` by the rule, so one
  station's position outlier is enough.
- Loss-of-lock alarms at YEBE never coincided with a second station's alarm, so they raised no alert.
- C/N0 never alarmed.
- Most alerts fall around 11:20 to 12:00 GPS time and come about 4 minutes earlier each day. That is the
  sidereal repeat of the GPS geometry, so they follow satellite geometry, not the stations.

**An engine finding, and the same run after its fix (supplementary, not the scored result):**
- In the scored run, all four stations had no single-point fix in the same 3 832 epochs (about 10 %).
- The cause was the RINEX navigation parser. It took a fixed number of lines per record, 4 for GLONASS. RINEX
  3.05 GLONASS records have 5 lines, and the BKG merged files of days 008, 014 and 015 contain such records.
  On those days the parser lost the record boundaries after the first one, and most GPS ephemerides were
  missing.
- The parser now takes each record's length from its continuation lines. A unit test covers a 5-line GLONASS
  record, and the ten integration tests that read navigation files pass unchanged.
- The same run with the fixed parser (`xval/area-trust/t4_result_after_nav_fix.json`) has a fix at every
  epoch. It gives 26 alerts to `DEGRADED` (2.0 per area-day) and none to `UNTRUSTED`, so the verdict is
  unchanged.
- The scored result stays as recorded.

**What NOT MET means here:**
- With 4 stations, the pre-registered rule turns any one station's position alarm into an area alert. On these
  quiet days, the single-point fixes against `H_s` produced 24 such alarm epochs (27 after the parser fix), which is more alerts than the bar
  allows.
- The bar stays as signed; it is not loosened.
- Any change to the rule (for example, requiring `n_U ≥ 2` for `DEGRADED` when `N ≤ 6`) or to the position
  monitor would need a new pre-registration and a new fortnight.

## T3

The readings for T3 (13 to 17 in `xval/area-trust/README.md`) were committed before the harness ran. The four
scored runs (`tests/area_trust_igs.rs`, `t3_end_to_end_latency_run`) were made one after another on 7 November
2026, 55 events each:
- each run took about 80 minutes;
- 100 stations replayed Madrid's real 2025 background at 1 Hz;
- the events were seeded position offsets, clock steps and OSNMA failures on at least 34 stations.

The runs, their pooled result (`xval/area-trust/t3_pool.py`) and the reference box's
`kshana bench-speed --quick` are in `xval/area-trust/t3/`.
- **Reference box:** Intel Xeon at 2.30 GHz, 4 logical CPUs, 15 GB, Linux. Live UBX decode ran at 8 409
  epochs/s.
- **Deliveries:** every alert the area rule raised reached both receivers, 225 alerts in all for 220 events,
  with no failures and no late epochs.
- **The 5 extra alerts:** the run files hold counts, not a list of alerts, so they are not attributed here.
  They are delivered but not scored.

What the latency includes: the data-time part, the MQTT framing, the ingest mapping, the area rule (a second
closes when every station has reported in it) and both deliveries. Both ends run on one host's loopback
interface, so it excludes any network between stations and the service. The data-time part dominates: the
onset epoch is sent at the start of its second and is decided when that second closes, about 1 s later. The
processing adds a few milliseconds. This says nothing about other hardware, about 1 000 stations (A3b), or about
a network path.

## A correction to the oracle

On the first comparison of `boundary_stale`, the engine and the oracle agreed on every state but not on the counts
in a second with one live station: the oracle printed `n_d` and `n_u` as 0 whenever `N < 2`, while reading 4
defines both over the live stations whatever `N` is. The oracle was corrected to follow its reading (the state it
computes is unchanged). No synthetic replay has a second with `N < 2`, and their oracle timelines are identical
before and after the correction.

## What this means

The area rule computes what the pre-registration defines and alerts on every synthetic event that should alert.
This says nothing about detection on real interference, about thresholds at a particular site, or about latency;
those are T3, T4 and out of scope as the pre-registration states.
