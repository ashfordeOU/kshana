<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C2: the Artemis I cruise with impulsive steps modelled: readings and record

The pre-registration is `docs/mission-thread/PREREGISTRATION-C2.md`, signed off on 3 November 2026. This file records
the naming of W2 under its §2 rule, **before any code that implements C2 and before any data beyond the C1 files is
fetched**. MODELLED. The Horizons reconstruction is the reference, not truth.

## W2 is "not run" (§2), named from published burn times on 8 November 2026

§2 sets the rule: W2 is the first 72 h window that starts at least 24 h after the departure from the distant retrograde
orbit has been completed, and ends at least 24 h before the return powered flyby. It is named from published burn times,
not from data.

| Event | Published time | UTC | Source |
|---|---|---|---|
| DRO departure burn completed | 1 Dec 2022, 3:53 p.m. CST (main engine, 1 min 45 s) | 2022-12-01 21:53 | NASA Artemis blog, Flight Day 16: <https://www.nasa.gov/blogs/missions/2022/12/01/artemis-i-flight-day-16-orion-successfully-completes-distant-retrograde-departure-burn/> |
| Return powered flyby burn | 5 Dec 2022, 10:43 a.m. CST (3 min 27 s); the press kit lists 11:43 a.m. Eastern, the same instant | 2022-12-05 16:43 | NASA Artemis I mission timeline, <https://www.nasa.gov/reference/artemis-i-mission-timeline/>; Artemis I press kit, <https://www.nasa.gov/artemis-i-press-kit/> |

- The earliest start is 2022-12-02 21:53 UTC (24 h after the departure burn).
- The latest end is 2022-12-04 16:43 UTC (24 h before the flyby burn).
- That span is 42.8 h, shorter than the 72 h a window needs.
- Taking the later of the two flyby times would not change this: the span would be at most 43.8 h.

By §2, **W2 is "not run"** and C2 reports W1 only, saying so (§7). No Horizons state of the W2 period has been fetched
or read by anyone working on this row.

## Readings, fixed before any data beyond the C1 files is fetched

1. **Events and impulses.** §3's "adjacent event hours merge into one event" counts events. §4 gives **one impulse per
   event hour** (its velocity residual vector, at the hour's midpoint), so a run of two adjacent event hours yields
   two impulses (`src/mission_thread/impulses.rs`).
2. **Residual sign.** The residual is the next tabulated velocity minus the propagated one, so it is the step the
   propagation missed and is added as the impulse.
3. **Propagation.** The C1 code path: the `tli-and-cruise` phase with no TLI burn, the thread's Moon kernel cut, the
   analytic Sun, 1 h steps. The impulses are its new `impulses` list (`t_s` from the window start, `dv_mps` in GCRF).
   A step is shortened to land on an impulse time. Without impulses every output is unchanged.
4. **Scoring.** The H states are the half-hour offsets 18:30 on 16 Nov to 17:30 on 19 Nov (72 states; see the
   correction below; this reading first said 71, copying the pre-registration). C2a is the
   largest 3-D position difference over them; C2b is the velocity difference at the last one (17:30 on 19 Nov).

## Process (from the pre-registration), with commits as they land

1. Signed off (3 November 2026).
2. Impulse support, detector and propagation code, tested on synthetic data only (`tests/mission_thread_c2_impulses.rs`, the module tests of `src/mission_thread/impulses.rs`): this commit.
3. T (hourly, W1) fetched with C1's own script on 8 November 2026; events and impulses computed and committed before H
   is fetched: this commit (`impulses.json`, from `examples/mission_thread_c2.rs detect`).
   - **T's file hash differs from C1's recorded one** (876618b8… against 9494dc81…), because Horizons writes the
     retrieval date and EOP file into the response header. The state table is the same: C1's hourly diagnostic
     recomputed on this file equals `xval/mission-thread/results_diagnostic.json` exactly, on all 72 hours. The runner
     therefore pins the SHA-256 of the state table (`$$SOE` to `$$EOE`): 241d674c140f95d5781e4525ccf636546db8b5b05b1652869a8ef15768f23826.
   - **Five event hours**, at 1, 17, 23, 34 and 57 h after the start (the five C1's diagnostic named), each its own
     event. Impulses of 0.091, 0.221, 0.160, 0.094 and 0.150 m/s at the hours' midpoints. The largest quiet-hour
     residual is 0.00025 m/s against the 0.01 m/s threshold.
4. H (half-hour offsets, W1) fetched; the comparison runs once; verdict committed and pinned: *pending*.

## Correction after H was fetched, before any comparison (disclosed)

- **What was seen.** H was fetched on 8 November 2026 with `fetch_h.sh`. Before this correction, only its row count and
  its first and last epochs were read: 72 rows, 2022-11-16 18:30 to 2022-11-19 17:30 TDB, one hour apart. No state value
  was read and no propagation was compared with it.
- **The error.** §1 and §5 of the pre-registration say the H states are "30 minutes after each hour but the last", "71
  of them per window". The window is 72 h: 18:00 on 16 Nov to 18:00 on 19 Nov holds 72 hour intervals (73 hour marks),
  and the :30 point of each interval lies inside the window. "Each hour but the last" (the last hour mark, 18:00 on
  19 Nov, has no :30 inside the window) therefore gives **72** states, not 71. This is the same kind of count slip as
  A2's Amendment 6 (2161 written for a span holding 2137).
- **The correction.** The runner expects 72 H states. The span, the states, the bars and every definition are
  unchanged: C2b is taken at the last H state, 17:30 on 19 Nov, as before. If H had held any other count, the row
  would have been "not run".
