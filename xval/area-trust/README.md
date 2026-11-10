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

## v3 readings (10 November 2026)

The v3 pre-registration is `docs/design/evidence/b5-area-trust/PREREGISTRATION-v3.md`, signed off on 10 November 2026.
These readings are written after its step 1 (the diagnosis on v2's already-scored data), before any v3 rule code,
any v3 oracle and any v3 data selection. A v1 or v2 reading not changed below still holds. The coordinator answered
three questions before they were written (X2, X3, X4).

X1. **Diagnosis (step 1).**
    - **Tool and output:** `tests/area_trust_igs.rs`, `b5v3_diagnosis_of_v2_common_epochs` (ignored; it reads the v2
      files with the v2 harness's own fix computation). Its output is `xval/area-trust/v3_diagnosis.json.gz` (uncompressed SHA-256
      `a7b4fac8cf3e9b07b4cf09ec3a5094363f6d8717ac00cc4ff86a32614ce4c38c`).
    - **The common epochs:** 314 scored epochs in which at least two stations had a position alarm, in 10 runs.
      In every one, leaving one satellite out of the fixes brings every alarmed station to a horizontal error at
      or under its `H_s`.
    - **G11, 07-27 and 07-28 from 10:30:30 (122 epochs, all four stations):** at 10:27 each day G11 broadcast a
      record marked unhealthy (health 63, Toc 11:00, IODE 72 and 98). The engine chose it as the record with the
      nearest Toe; a healthy 10:00 record was 60 s farther away. Residuals reached about 1 900 km.
    - **G14, 07-31 from 10:36 (66 epochs, two or three stations):** records marked unhealthy (health 63) from 10:44
      to 14:44 were used. Residuals were −16 to −100 m.
    - **G03, 08-02 from 02:00 (125 epochs, up to all four stations; one more epoch is explained by G03 or G14):**
      - The BKG merged file holds no G03 record between 22:00 on 08-01 and 04:00 on 08-02.
      - From 02:00 the engine used the 04:00 record (health 0, IODE 94) at |Toe − t| = 7 200 s, inside
        `MAX_EPH_AGE_S`.
      - Its transmission time is 03:08, after the epochs it was used for. Residuals were about 1 600 to 1 900 km.
    - **Unhealthy records in general:** each station's fix used a satellite whose record is marked unhealthy in 119
      to 264 scored epochs.
    - **The 7 loss-of-lock alerts (19:15 to 19:33):** at each of them every station tracked 6 to 8 GPS satellites,
      against medians of 10 and 11. Fewer satellites were in view at all four stations at once; no station lost lock
      on its own.
X2. **Engine finding: satellite health (coordinator's answer, 10 November).**
    - `pvt::select_ephemeris` ignored `sv_health`. That is a fault whatever the algorithm.
    - It now skips records with `sv_health ≠ 0`. A satellite with no healthy record within `MAX_EPH_AGE_S` is dropped
      for that epoch. This is on by default, with no option to turn it off.
    - Every pinned value the fix moves is listed, old and new, in
      `docs/design/evidence/b5-area-trust/ENGINE-FINDING-HEALTH.md`. Results already scored stay published as
      recorded, each with a dated note pointing to the finding.
X3. **Transmission time (coordinator's answer, 10 November).**
    - No engine change. The engine keeps the nearest Toe within `MAX_EPH_AGE_S`, as post-processing tools commonly do.
    - A transmission-time rule belongs with a real-time mode, which is a separate design.
    - G03 on 08-02 therefore stays a satellite fault common to every station: it is the case X4 has to catch.
X4. **The `SATELLITE_FAULT` rule (coordinator's answer, 10 November).** In each epoch:
    - `k` is the plan's: `k = max(2, ⌈N/3⌉)`, with `N` the stations with a fix in that epoch.
    - The alarmed set `A` is the stations whose fix-domain position alarm holds: horizontal error `> H_s`.
    - When `|A| ≥ k`, the candidates are the satellites used in the fix of every station in `A`.
    - A candidate explains the epoch when, for every station in `A`, the fix recomputed without it exists and has a
      horizontal error `≤ H_s`. "Under its threshold" is read as "not alarmed", the complement of the alarm.
    - If several candidates explain the epoch, the one with the largest median |post-fit residual| over the stations
      of `A` (from the full fixes) is chosen. Ties go to the lowest PRN.
    - The chosen satellite is flagged `SATELLITE_FAULT` for that epoch and the flag is shown in the output.
    - Every station whose fix used it, not only those in `A`, has its fix recomputed without it. The stations'
      position alarms, and so the area state, use the recomputed fixes.
    - At most one satellite is flagged per epoch. When none explains the epoch, nothing changes.
X5. **Loss of lock.**
    - In v3 a loss-of-lock alarm alone no longer makes a station `Degraded`. With a C/N0 template alarm or an AGC
      alarm the station is `Degraded` as before, by those alarms.
    - "It stays visible in the station's state": the station's per-epoch record keeps the loss-of-lock alarm as its
      own field, and T4 reports the lock-only epochs per station. The three station states and their order are
      unchanged.
X6. **The area rule.**
    - The aggregation of station states into the area state is v2's (W1, with the `m` clause).
    - v3 changes what feeds it: X4 on the fixes, then X5 on the station state.
    - A `kshana.area-stations/1` document with `"area_rule": "v3"` is aggregated as v2. A document without the field
      keeps v1's bytes, and one with `"v2"` keeps v2's.
X7. **The v3 oracle and the satellite-fault replays (T1, T5).**
    - **The oracle:** `oracle_v3.py`, Python standard library only and sharing no code with the engine. It implements
      X4 with its own weighted least-squares single-point solve from the same per-satellite inputs, then X5 and W1.
      It is committed before any v3 engine code.
    - **The replays:** seeded measurement-level documents. Each epoch gives each station's surveyed position, `H_s`,
      evidence flags and, per GPS satellite, the satellite position, pseudorange, satellite clock, ionosphere,
      troposphere and weight. They have 4, 5, 7 and 10 stations, at least 500 epochs in all, and inject:
      - one satellite's range error common to every station (20 m to 2 000 km);
      - a range error at one station only;
      - two satellites' errors at once;
      - loss-of-lock alarms alone and with a C/N0 alarm;
      - clean epochs.
    - **T1:** in every epoch the engine's flagged satellite, its recomputed horizontal errors, the station states
      and the area timeline equal the oracle's. The seven v2 replays and the two boundary documents with
      `"area_rule": "v3"` equal v2's bytes.
    - **T5:** the command line, Python and WebAssembly give the oracle's bytes on the satellite-fault replays.
X8. **T2 on v3.** As v2 (W5), and on the satellite-fault replays:
    - every injected single-satellite fault that alarms at least `k` stations is flagged with the injected
      satellite, and raises no area alert after the recomputation;
    - an error at one station only is not flagged;
    - an epoch with two faulty satellites is not explained by one, so no satellite is flagged and the alarms stand;
    - a loss-of-lock alarm alone leaves the station `Nominal`, with the alarm in its record.
X9. **T3.**
    - T3 is re-run as in W10: v1's harness, readings 13 to 17, four sequential runs of 55 events at 100 stations, with
      the v3 rule.
    - The harness streams per-station evidence, not per-satellite measurements, so X5 is in T3's path and X4 is not.
      The results say so.
X10. **T4: the fortnight and its stations.**
     - **Days:** the first 14 consecutive UTC days starting on or after 7 August 2025 on which all eight 3-hour Kp
       values are at most 4.000, from the GFZ file fetched on the day of selection.
     - **Calibration and scoring:** the first day calibrates; 13 are scored.
     - **Selection:** `select_v3.py` makes it and is committed, with the GFZ file's SHA-256, before any observation
       file is fetched.
     - **Stations, coordinates and navigation:** reading 10's rule applied anew on the v3 days; reading 9; B8 reading 8
       per day.
     - **Engine:** the X2 health fix applies.
     - **Fetch:** every file is fetched by script into a v3 manifest. If any file the rule needs cannot be fetched,
       the work stops and the coordinator is asked; nothing is substituted, and any refusal is recorded.
     - **Order per 30 s epoch:** X4 across the area's stations, then X5, then the area aggregation. The bars are W9's.
X11. **Scoring once.**
     - T1 to T5 are scored once, after the oracle, the engine code and the T4 selection are committed, and recorded in
       `RESULTS-v3.md` as MET or NOT MET.
     - A miss is pinned by a test. v1 and v2 stay published, and a v3 MET does not undo their NOT MET.
