<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Results: the emitter-region estimator against the Jammertest 2025 transmitter sites

Run once, on 27 Oct 2026, exactly as `PREREGISTRATION.md` (signed off by the owner at commit `46d53701`) defines it: the
pinned data (every CSV hash re-checked against the pin before the run), the estimator at the registered parameters, the
six day files per source concatenated and passed once to `kshana interference-map locate`, scored by
`xval/emitter-region/score.py`. Nothing was changed, re-run or re-scored after seeing the result. The outputs are in
`docs/emitter-region/results/` (aggregate only).

## Verdict

| Source | Published sessions | Scheduled sessions `n` | Outcome |
|---|---|---|---|
| ADS-B | 14 | 2 | **NOT ASSESSABLE** (`n` = 2, fewer than the registered minimum of 4) |
| AIS | 0 | 0 | **NOT ASSESSABLE** (`n` = 0) |

**Overall: not validated.** The ledger row `VM-bc70cb57` becomes VALIDATED only if both sources are MET; neither was
assessable, so it **stays MODELLED**, and its oracle text records this result. This is not a pass and not a miss of a bar:
the data did not support the test. No bar was loosened, no window added.

## What happened

**ADS-B.** The estimator published 14 sessions of at least 5 distinct affected aircraft over 14 to 19 Sep 2025 (86
further candidate sessions were withheld below 5). Only 2 overlapped a scheduled jamming window by at least half their
duration, both on Thursday 18 Sep and both at Area 2 (07:59 to 10:11 UTC in W5 and 12:43 to 14:06 UTC in W6). Both are
flagged `unconstrained`: with 6 distinct affected aircraft each, the 95% region fills more than 80% of its search domain
(about 1.6 million km squared). For information only (the bars were not applied): the region of the first held both
Area 2 point at 95% and the second did not. Neither Monday's window nor any of Tuesday's produced a scheduled session.
The other 12 sessions are unscheduled: they cluster in the early morning (02:51 to 07:50 UTC on 15, 16, 17, 18 and 19 Sep)
and on 17 Sep, a day with no scheduled jamming at these sites, and are not evidence about the sites.

**AIS.** With the registered rules (speed over ground above 70 kn, or a jump implying more than 70 kn; on-land rule off),
only 20 of 259,944 vessel units over six days were affected, from 8 candidate sessions, none with 5 distinct vessels. No
session was published. The vessel traffic was ample (27 to 34 distinct vessels within 30 km of the site and 74 to 110
within 60 km in every window), so the absence is of degraded reports under these rules, not of data.

## Window coverage (descriptive, registered)

Distinct aircraft at or above 5000 ft in each window, within 100 / 200 / 300 km of 69.25 N 15.95 E: W1 9 / 18 / 26;
W2 9 / 19 / 24; W3 8 / 14 / 21; W4 10 / 13 / 17; W5 16 / 21 / 29; W6 9 / 16 / 22. Distinct vessels within 30 / 60 km:
W1 28 / 110; W2 34 / 106; W3 34 / 97; W4 29 / 74; W5 29 / 110; W6 27 / 92.

## What this says and does not say

It does not say the estimator fails or works against real transmitters; it says this data could not test it. In the
aircraft data the publication rule (5 distinct affected aircraft) was met outside the scheduled windows far more often
than inside them, so the degraded reports that exist in this data set are not, on this evidence, tied to the scheduled
jamming at these two sites. Possible reasons, none tested here: the transmitters may have been on air at power or
direction that did not degrade the few aircraft in view; adsb.lol coverage in the far north is thin (about 270 aircraft
per day in the whole box); only about a quarter of readsb trace points carry NIC and NACp; the schedule is not an
on-air record. The 2026 plan and catalogue are published in the same repository (`transmission-plan-2026-09-14` to `-18`,
same pinned commit) and adsb.lol 2026 releases for those days exist; a 2026 comparison with its own pre-registration is
the natural next test, as a new registration, not a re-scoring of this one.

The estimator stays MODELLED, calibrated on synthetic data only.
