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
      there; broadcast navigation from the BKG daily merged file `BRDC00WRD_S_*_01D_MN.rnx.gz`). `H_s` is set
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
