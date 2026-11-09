<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C2 v2: the fresh window W3, named from published burn times: not run

The pre-registration is `docs/mission-thread/PREREGISTRATION-C2-v2.md`, signed off on 9 November 2026. Its reading 4 sets
the rule for W3:
- W3 is the first 72 h interval after W1's end (2022-11-19 18:00 TDB);
- it starts at least 24 h after the end of a published burn and ends at least 24 h before the next one;
- every engine firing in NASA's public Artemis I timeline counts, as does any lunar flyby;
- it is named before any Horizons state of it is fetched.

If no such window exists before entry interface, v2 is "not run". This file records the naming on 9 November 2026. **No
code for v2 was written and no Horizons state of any v2 period was fetched.**

## The published burns after W1

The source is NASA's Artemis I mission timeline, <https://www.nasa.gov/reference/artemis-i-mission-timeline/>, which
lists each burn by mission elapsed time (MET). The table converts MET to UTC from the liftoff, 1:47:44 a.m. EST on
16 November 2022 (06:47:44 UTC).

| Burn | MET | UTC (from MET) | Gap since the previous (h) |
|---|---|---|---|
| (W1 end) | | 2022-11-19 18:00 | |
| Outbound trajectory correction 3 | 004/06:40:14 | 2022-11-20 13:27 | 19.5 |
| Outbound trajectory correction 4 | 005/00:40:14 | 2022-11-21 07:27 | 18.0 |
| Outbound powered flyby | 005/06:40:14 | 2022-11-21 13:27 | 6.0 |
| Outbound trajectory correction 5 | 006/00:40:14 | 2022-11-22 07:27 | 18.0 |
| Outbound trajectory correction 6 | 008/15:48:27 | 2022-11-24 22:36 | 63.1 |
| Distant retrograde orbit insertion | 009/15:48:27 | 2022-11-25 22:36 | 24.0 |
| Orbital manoeuvre 1 | 010/15:48:27 | 2022-11-26 22:36 | 24.0 |
| Orbital manoeuvre 2 (listed; the page also says a planned Flight Day 13 maintenance burn was found unnecessary) | 012/15:48:27 | 2022-11-28 22:36 | 48.0 |
| Orbital manoeuvre 3 | 014/15:49:56 | 2022-11-30 22:37 | 48.0 |
| Distant retrograde orbit departure | 015/15:49:56 | 2022-12-01 22:37 | 24.0 |
| Return trajectory correction 1 | 015/21:49:56 | 2022-12-02 04:37 | 6.0 |
| Return trajectory correction 2 | 018/10:24:00 | 2022-12-04 17:11 | 60.6 |
| Return trajectory correction 3 | 019/04:24:00 | 2022-12-05 11:11 | 18.0 |
| Return powered flyby | 019/10:24:00 | 2022-12-05 17:11 | 6.0 |
| Return trajectory correction 4 | 020/04:24:00 | 2022-12-06 11:11 | 18.0 |
| Return trajectory correction 5 | 024/14:15:49 | 2022-12-10 21:03 | 105.9 |
| Return trajectory correction 6 | 025/06:15:49 | 2022-12-11 13:03 | 16.0 |

## Result of the rule

A 72 h window with 24 h of clearance on each side needs at least **120 h** between consecutive burns. The longest gap
after W1 is **105.9 h** (return trajectory corrections 4 to 5). Dropping orbital manoeuvre 2, which the page suggests may
not have been performed, gives at most 96 h. The published clock times differ from the MET-derived ones by under an hour
(the outbound flyby, the DRO burns, the return flyby), far less than the 14 h shortfall.

**By the rule, W3 does not exist, and C2 v2 is "not run".** v1 stands as recorded (NOT MET). No v2 comparison was made,
and W1 is not re-run under v2: the pre-registration's verdict needs W3, and its W1 run was to be reported only beside it.
