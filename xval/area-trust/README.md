<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B5 area trust: readings and oracle

The pre-registration is `docs/design/evidence/b5-area-trust/PREREGISTRATION.md`, signed off on 3 November
2026. This directory holds the readings of it that are fixed here before any engine code, and the
independent oracle for the area rule (`oracle.py`, Python standard library only, sharing no code with
the engine). The oracle applies section 2 to per-station states; it checks the rule (bar T1), not the
per-station monitors.

## Readings fixed before the engine code

1. **Grid.** A station epoch with time tag `t` (s) belongs to grid second `g = floor(t)`. Grid seconds run
   from the first to the last second any station has an epoch in.
2. **Station state in a grid second.** The state of the station's last epoch in `[g, g+1)`. With no epoch
   in that second, the station keeps the state of its last epoch while `g − g_last < 5`; from `g − g_last ≥ 5`
   on (and before its first epoch) it is `Stale`.
3. **Order.** `Nominal < Degraded < Untrusted` for stations; `TRUSTED < DEGRADED < UNTRUSTED` for the area.
   `UNKNOWN` is outside the order.
4. **Raw area state** of a grid second, from the non-stale stations: `N` of them, `n_D` in `Degraded` or
   worse, `n_U` in `Untrusted`, `k = max(2, ceil(N/3))`. `UNKNOWN` if `N < 2`; else `UNTRUSTED` if
   `n_U ≥ k`; else `DEGRADED` if `n_D ≥ k` or `n_U ≥ 1`; else `TRUSTED`.
5. **Hysteresis (the published state).** At the first grid second, the published state is the raw state.
   Then, per grid second:
   - raw `UNKNOWN`, or published `UNKNOWN`: the published state becomes the raw state at once;
   - raw worse than published: the published state becomes the raw state at once;
   - raw equal: unchanged;
   - raw better than published: it changes only when the raw state has been better than the published
     state for each of the last 10 grid seconds (this one included); it then becomes the worst raw state
     of those 10 seconds.
6. **Alert.** A grid second whose published state is `DEGRADED` or `UNTRUSTED` and worse than the
   published state of the second before, or whose published state of the second before was `UNKNOWN`.
   The first grid second raises no alert.
7. **Stale count.** Each grid second also reports how many stations are `Stale`.

## Files

- `oracle.py`: reads a `kshana.area-stations/1` JSON document (`{"stations": [{"id": ..., "epochs":
  [[t_s, "nominal"|"degraded"|"untrusted"], ...]}]}`) and writes the timeline as JSON Lines
  (`{"g": ..., "state": ..., "alert": ..., "n": ..., "n_d": ..., "n_u": ..., "stale": ...}`).

## Readings for T4 (real data), fixed before the scored data are analysed

Written on 7 November 2026, after the station and day rule was applied and before any observation file was
processed.

8. **Days.** The GFZ Kp file (fetched 7 November 2026) gives 2025-01-06 to 2025-01-19 (day of year 006 to 019)
   as the first 14 consecutive days of 2025 on which the largest of the eight 3-hour Kp values is at most 4.0
   (`4.000` counts; `4.333`, Kp 4+, does not). Day 006 is every station's calibration day; days 007 to 019 are
   the 13 scored days.
9. **Coordinates.** The pre-registration names the IGS weekly SINEX at the BKG centre. BKG carries no weekly
   SINEX for these weeks (the listings of `products/2340`, `2348`, `2349` and `2360` hold none), and the IGN
   mirror did not answer. So:
   - the 100 km test uses the positions in the `SITE/ID` block of the IGS station SINEX
     (`https://files.igs.org/pub/station/general/igs.snx.gz`), on a sphere of radius 6371.0088 km;
   - each station's surveyed position `p_s` is the `APPROX POSITION XYZ` of its day-006 observation file header.

   A metre-level bias in `p_s` would only raise `H_s`, which is calibrated on the same station's errors.
10. **Stations.** A station is eligible when its daily 30 s file (`*_01D_30S_MO.crx.gz`) is listed at BKG on
    all 14 days and every one of those headers lists `S1C` among the GPS observation types. Clusters are formed
    in the order of the SHA-256 of the 9-character name (hex, ascending), as follows:
    - each eligible station not yet used starts a cluster;
    - the other unused eligible stations are then taken in the same order, and each is added when it lies within
      100 km of every member so far;
    - the cluster stops at 4 stations and is kept only when it reaches 4;
    - at most 3 clusters are kept.

    Applied on 7 November 2026, this gives **one cluster: MADR00ESP, CEBR00ESP, YEBE00ESP, VILL00ESP**. The
    other two places with four or more IGS stations within 100 km fail the `S1C` rule:
    - Ny-Ålesund: NYA200NOR has no GPS `S1C`;
    - Wettzell: WT2100DEU and WTZZ00DEU have none.

    T4 is therefore scored over 1 area × 13 days. The `UNTRUSTED` bar of 0.1 per area-day allows at most 1 such
    alert.
11. **Per-station evidence on the 30 s files.** GPS only.
    - **Position error.** The engine's single-point fix (`pvt::run_pvt`; ionosphere-free where both codes are
      there; broadcast navigation from the BKG daily merged file `BRDC00WRD_R_*_01D_MN.rnx.gz`). `H_s` is set
      from the day-006 horizontal errors.
    - **C/N0 template.** From day-006 `S1C`, in 5° elevation bins. Elevations come from the broadcast ephemeris
      at `p_s`. The statistic is the median `δ` over satellites above 15° that have a calibrated bin; it is
      undecided with no such satellite.
    - **Loss of lock.** The existing monitor's rule (`sats_lost` = 4): the count of GPS satellites with `S1C`
      at least 4 below the day-006 median count.
    - **Not available in these files, so not run.** AGC, jamming indicator, the clock monitor (which needs the
      engine's clock-aided bound) and OSNMA. None is ever read as "passed".
    - An epoch without a fix leaves the position monitor undecided for that epoch.
12. **Time.** A 30 s epoch at `t` stands for grid seconds `t` to `t + 29`: it is written as 30 one-second
    station epochs with the same state. Without this, the 5 s stale rule would make every station stale between
    its epochs. A missing epoch leaves a 30 s gap, which the stale rule handles. The fortnight is one timeline
    per cluster. An alert counts on the UTC day of its grid second, and only on scored days.

## Readings for T3 (end-to-end latency), fixed before the run

Written on 7 November 2026, before the harness was run.

13. **Reference box.** The pre-registration names A3a's reference box, which A3a never fixed. It is read as the
    machine the run is made on. Its CPU, core count and memory are recorded with the result, beside a
    `kshana bench-speed --quick` run on the same machine.
14. **Stations and background.** There are 100 stations at 1 Hz. Station `i` replays the real background of
    Madrid station `i mod 4`. Its start is offset into the 13 scored days by `11 h × ⌊i/4⌋` plus 2 h per
    run, wrapping at the end of day 019, so the replicas do not share their noise in time. The background
    comes from T4's per-epoch evidence (reading 11, with the navigation parser fix of 887997061):
    - the horizontal position error, as east and north components;
    - the C/N0 statistic;
    - the loss-of-lock outcome.

    Each 30 s epoch is held for its 30 seconds (reading 12).
15. **What goes over the live path.** Each station publishes one CSV row a second on its own MQTT topic,
    `kshana/area/s<i>`, through a loopback broker. The rows are read by `connect_mqtt::run_per_topic` with
    a `kshana.connect/1` mapping. The row carries:
    - a position fix: the station's surveyed position plus the error;
    - one C/N0 value: 45 dB-Hz plus the statistic;
    - the receiver's own jamming flag, set to "indicated" when a measurement-domain monitor alarms (loss of
      lock, AGC, jamming indicator);
    - the receiver's own spoofing flag, set to "indicated" when a fix-domain monitor other than position
      alarms (clock, OSNMA).

    The live side computes each station's state from the record with section 1's rule:
    - horizontal distance of the fix from the surveyed position against `H_s`;
    - C/N0 − 45 against −6 dB;
    - the jamming flag as a measurement-domain alarm;
    - the spoofing flag as a fix-domain alarm.

    It then runs the area rule live (`AreaLive`).
16. **Injected events.** These are fix-domain events on at least `k` = 34 stations, so each has one exact
    expected alert, to `UNTRUSTED`:
    - a position offset of 50 to 500 m, added east;
    - a clock step;
    - an OSNMA failure.

    Each event lasts 20 to 60 s, with 25 to 60 s of quiet between events. The events are seeded per run, and
    the runs are pooled until at least 200 events have run.
17. **Delivery and latency.** Every alert is POSTed to a loopback HTTP receiver (`telemetry::alerts::Webhook`)
    and published to a loopback MQTT receiver (`telemetry::mqtt::MqttSink`). Each receiver timestamps what it
    receives on the same host clock as the sender.
    - **An event's latency:** the receipt time of its first `UNTRUSTED` alert in `[onset, end)`, minus the
      earliest send time of the onset-second rows of its affected stations.
    - **A missing alert:** an event with no such alert on a path counts as a miss, with infinite latency.
    - **The bar:** p95 ≤ 5 s and maximum ≤ 10 s, on each path separately.
    - **Background alerts:** alerts from the real background are delivered too, but they are not events and
      are not scored.

## v2 readings (9 November 2026)

The v2 pre-registration is `docs/design/evidence/b5-area-trust/PREREGISTRATION-v2.md`, signed off on 9 November 2026.
These readings are written before any v2 engine code and before any v2 data is selected or fetched. Readings 1 to 17
above, the v1 oracle and the v1 results stay as they are. A v1 reading not changed below still holds for v2. The
coordinator answered three questions before these readings were written (W2, W5, W8).

W1. **The v2 rule.** With `N` live stations, `n_D` in `Degraded` or worse, `n_U` in `Untrusted` and
    `k = max(2, ⌈N/3⌉)`, in this order:
    - `UNKNOWN` if `N < 2`;
    - `UNTRUSTED` if `n_U ≥ k`;
    - `DEGRADED` if `n_D ≥ k` or `n_U ≥ m`, with `m = 2` for `N ≤ 6` and `m = 1` for `N > 6`;
    - `TRUSTED` otherwise.

    Readings 1 to 3 and 5 to 7 (grid, station state, order, hysteresis, alert, stale count) are unchanged.
W2. **What the rule changes (coordinator's answer, 9 November).**
    - For `N ≤ 6`, `k = 2 = m`. A second Untrusted station therefore meets the `UNTRUSTED` clause first, so the
      `n_U ≥ m` clause never decides a state when `N ≤ 6`.
    - For `N > 6`, `m = 1` is v1's rule exactly.
    - So v2 differs from v1 in one thing: with 6 or fewer stations, **one Untrusted station alone moves nothing**
      (unless another station is also in alarm, which makes `n_D ≥ 2`).
    - Two Untrusted stations move the area, to `UNTRUSTED`.
W3. **Selecting the rule (coordinator's answer to how v2 is made explicit).**
    - A `kshana.area-stations/1` document selects v2 with the field `"area_rule": "v2"`. Without the field it is v1,
      and a v1 document's output keeps its exact bytes.
    - The command line, Python and WebAssembly read the document, so the same field selects v2 on every surface.
    - The live path (`AreaLive`, T3) takes the rule as an explicit constructor argument.
W4. **The v2 oracle** is `oracle_v2.py`. It is a copy of `oracle.py` with W1's `m` clause, and it reads the
    `area_rule` field (v1 without it). It is committed with these readings, before any v2 engine code. `oracle.py`
    is not changed.
W5. **T2's added checks (coordinator's answer, 9 November).** The pre-registration says an event that puts two
    stations in `Untrusted` in an area of 6 or fewer "raises `DEGRADED`".
    - Its own rule order gives `UNTRUSTED` for that case (W2), so the literal word conflicts with the rule.
    - The check is read as "raises an area alert, to `DEGRADED` or worse". That keeps its stated intent: two stations
      agreeing do move the area.
    - This is a disclosed reading, not a rule change.

    Over the events of the replays with `N ≤ 6` (seeds 4101 and 4102):
    - an event whose peak has exactly one station `Untrusted` and one station in alarm in all
      (`peak_untrusted = 1`, `peak_in_alarm = 1`) raises no area alert between its onset and its end;
    - an event whose peak has two `Untrusted` stations (`peak_untrusted = 2`) raises an area alert, to `DEGRADED`
      or worse, in that window.

    The rest of T2 is v1's, with the expected state from W1:
    - every event with `peak_in_alarm ≥ k` raises its expected alert;
    - no event with fewer raises `UNTRUSTED`.
W6. **T1 and T5.** On the seven committed replays (seeds 4101 to 4107) and the two boundary documents, each with
    `"area_rule": "v2"` added:
    - **T1:** the engine's timeline equals `oracle_v2.py`'s, every grid second;
    - **T5:** the command line, Python and WebAssembly give those same bytes.

    The v1 timelines of the same documents (without the field) stay byte-identical to their committed v1
    expectations.
W7. **T4: the fortnight.**
    - **Days:** the first 14 consecutive UTC days starting on or after 20 January 2025 on which all eight 3-hour Kp
      values are at most 4.000, from the GFZ file fetched on the day of selection. `4.000` counts; `4.333` does not.
    - **Calibration and scoring:** the first day calibrates every station; the other 13 are scored.
    - **Selection by script:** the selection is made by a script and committed, with the GFZ file's SHA-256, before
      any observation file is fetched.
W8. **T4: stations, coordinates and navigation.**
    - **Stations:** reading 10's rule, applied anew on the v2 days. It may or may not give the Madrid cluster again.
    - **Coordinates:** reading 9.
    - **Navigation:** B8 reading 8, per day: whichever of BKG's `BRDC00IGS_R` and `BRDC00WRD_R` merged daily files
      has more GPS records.
    - **Per-station evidence and time:** readings 11 and 12.
    - Every file is fetched by script, with its SHA-256 in a v2 manifest.
    - **If any file the rule needs cannot be fetched**, the work stops and the coordinator is asked. Nothing is
      substituted. Any refusal is recorded.
W9. **T4 bars.** As v1:
    - `DEGRADED` or worse: at most 1 alert per area-day;
    - `UNTRUSTED`: at most 0.1 alerts per area-day;
    - area-days are clusters × 13 scored days.

    An alert counts on the UTC day of its grid second, on scored days only.
W10. **T3 (coordinator's answer, 9 November).**
     - T3 is re-run as written, on the v2 rule, with v1's harness and readings 13 to 17 unchanged.
     - v1's background is Madrid's 2025-01-06 to 01-19 data, as in reading 14.
     - There are 4 runs of 55 events at 100 stations, pooled to at least 200 events.
     - For `N = 100`, the v2 rule is v1's (W2).
     - The runs are made one after another, as in v1. Latency is wall-clock, so runs made in parallel would share the
       box and could not be byte-identical to a sequential run.
W11. **Scoring once.** T1, T2, T3, T4 and T5 are scored once, after the engine code and the T4 selection are
     committed, and recorded in `RESULTS-v2.md` as MET or NOT MET. A miss is pinned by a test. v1 stays published,
     and a v2 MET does not undo v1's NOT MET.
