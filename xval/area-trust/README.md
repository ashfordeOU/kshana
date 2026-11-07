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
