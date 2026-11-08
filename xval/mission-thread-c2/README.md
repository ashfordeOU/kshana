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
4. **Scoring.** The H states are the half-hour offsets 18:30 on 16 Nov to 17:30 on 19 Nov (71 states). C2a is the
   largest 3-D position difference over them; C2b is the velocity difference at the last one (17:30 on 19 Nov).

## Process (from the pre-registration), with commits as they land

1. Signed off (3 November 2026).
2. Impulse support, detector and propagation code, tested on synthetic data only (`tests/mission_thread_c2_impulses.rs`, the module tests of `src/mission_thread/impulses.rs`): this commit.
3. T (hourly, W1) fetched; events and impulses computed and committed before H is fetched: *pending*.
4. H (half-hour offsets, W1) fetched; the comparison runs once; verdict committed and pinned: *pending*.
