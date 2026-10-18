<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: EU-US WG-C ARAIM Milestone 3, maximum-URA reproduction (Tables 5, 6 and 7)

Committed before any scored run of `src/bin/gen_araim_m3_study.rs`. The bars are exact and are
not loosened after a run; a miss is pinned by a test that asserts it. This replaces the earlier
plan for "EU-ARAIM Table A-3", which has no public source (see `docs/INTEGRITY.md`).

## The source (an oracle fetched and cited, not vendored)

EU-U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup,
**Milestone 3 Report, Final Version, 25 February 2016** (a US Government publication; its cover
says it states no official position). Copy used: GPS.gov,
<https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf>, 6,124,972 bytes,
SHA-256 `156147e1e7aa9514cf7c9b7c7df9762daa7845981ec7037ad3e8aa5baeae13d8`, retrieved
2026-10-18. The European Commission's copy
(<https://ec.europa.eu/docsroom/documents/15641/attachments/1/translations/en/renditions/pdf>,
SHA-256 `1b16aec31d11992d766201d150599014618a6e79b187689be7a6bbe13a14c3c6`) has the same text.
The PDF is not in the repository. Section 5 and Annex A of the report describe the study; its
Tables 5 to 13 print, for each constellation configuration and each of RNP 0.1 and RNP 0.3, the
largest `sigma_URA` for which 90 % of users have 99.5 % availability.

## What is attempted, and what is not

Reproduced: **Tables 5, 6 and 7** (dual-frequency H-ARAIM: multi-constellation, Galileo alone,
GPS alone), the **Depleted** and **Baseline** rows, both RNP columns: 12 printed entries.

Not attempted, with the reason:

- **Tables 8 to 13** (single-frequency L1 and L5): their error model needs `sigma_UIRE`, which the
  report takes from RTCA DO-229 Appendix J (a paid standard) with the broadcast ionosphere
  parameters; the inputs are not public in the report.
- **The Optimistic rows** (GPS 24+3, Galileo 24+3): they need the report's almanac files
  (`almgps24+3.txt` and the Galileo 24+3 almanac, Table 26, "[RD-61]"), which were not obtained.

## Definitions fixed here (interpretations of the report)

1. Availability of a user: the share of time steps at which the horizontal protection level is at
   most the horizontal alert limit (HAL 185 m for RNP 0.1, 556 m for RNP 0.3; Table 28) and a
   solution exists (at least four satellites above a 5 degree mask and a non-singular geometry).
2. Coverage at a `sigma_URA`: the share of users, weighted by cos(latitude), between -70 and +70
   degrees latitude (Annex A.V.4), whose availability is at least 99.5 %.
3. A printed entry "N m" means: coverage >= 0.90 at `sigma_URA` = N m and < 0.90 at N+1 m. ">10 m"
   means coverage >= 0.90 at 10 m. "N/A" means coverage < 0.90 at 1 m. (Section 5.4: "the highest
   URA for which a 90 % coverage of 99.5 % availability ... is achieved".) Coverage is taken as
   non-increasing in `sigma_URA`, so these two inequalities settle the entry.

## The study

Annex A.V and A.VI.1 as printed: 5 degree elevation mask; `sigma_URE` = 2/3 `sigma_URA`;
`b_nom` = 0.75 m; `P_sat` = 1e-5; `P_const` = 1e-4 for Galileo and 0 for GPS in the dual
configuration, 0 for each single-constellation one (the report: "a Pconst equal to zero has been
used for the Galileo only cases"; GPS alone likewise); `sigma_tropo(theta)` and GPS `sigma_user`
from the printed formulae, Galileo `sigma_user` from Table 29 (linearly interpolated); the RNP
column of Table 25 (`P_HMI_VERT` = 0, `P_FA_HOR` = 3.99e-6, `P_THRES` = 4e-8, `P_EMT` = 1e-5).
Users on a latitude-longitude grid, 10 sidereal days (the Galileo repeat period).

### Deviations from the report's setup (they cannot be removed, and a miss may come from them)

- **D1, almanacs.** The report's almanac files were not obtained. The constellations are
  circular Keplerian Walker shells with the public parameters: GPS 24/6/1, 55 degrees, period half
  a sidereal day; Galileo 24/3/1, 56 degrees, period 10/17 of a sidereal day (the ground-track
  repeat). Not the real slots.
- **D2, depleted.** The report removes one unnamed slot from each constellation; here the first
  satellite of the first plane. Which satellite is removed changes the result.
- **D3, sampling.** A 10 degree by 10 degree grid (the report: 5 by 5) and a 1200 s step (the
  report: 600 s), for cost (about 85 minutes on four cores for the whole study).
- **D4, algorithm.** The engine's ADD v4.2 horizontal path (`add_v42_protection_levels_to_order`,
  subsets up to two events) with the RNP constants of Table 25, not the report's Annex A text
  verbatim. They differ in details (subset merging, which the engine's `fc_thres` = 0.01 follows
  MAAST for).
- **D5, only the needed values.** The study evaluates only the `sigma_URA` values the claims need
  (the printed N and N+1, or 10 m, or 1 m), not the whole 1 to 10 m sweep.

## The 12 claims (exact; a pair of inequalities where an integer is printed)

| ID | Table | Row | RNP | Printed | Bar (coverage of 99.5 % availability) |
|---|---|---|---|---|---|
| T5-B-01 | 5 | Baseline | 0.1 | >10 m | >= 0.90 at 10 m |
| T5-B-03 | 5 | Baseline | 0.3 | >10 m | >= 0.90 at 10 m |
| T5-D-01 | 5 | Depleted | 0.1 | 9 m | >= 0.90 at 9 m and < 0.90 at 10 m |
| T5-D-03 | 5 | Depleted | 0.3 | >10 m | >= 0.90 at 10 m |
| T6-B-01 | 6 | Baseline | 0.1 | >10 m | >= 0.90 at 10 m |
| T6-B-03 | 6 | Baseline | 0.3 | >10 m | >= 0.90 at 10 m |
| T6-D-01 | 6 | Depleted | 0.1 | N/A | < 0.90 at 1 m |
| T6-D-03 | 6 | Depleted | 0.3 | N/A | < 0.90 at 1 m |
| T7-D-01 | 7 | Depleted | 0.1 | N/A | < 0.90 at 1 m |
| T7-D-03 | 7 | Depleted | 0.3 | 4 m | >= 0.90 at 4 m and < 0.90 at 5 m |
| T7-B-01 | 7 | Baseline | 0.1 | 6 m | >= 0.90 at 6 m and < 0.90 at 7 m |
| T7-B-03 | 7 | Baseline | 0.3 | >10 m | >= 0.90 at 10 m |

Configurations and the `sigma_URA` values evaluated for each: dual-baseline {10}, dual-depleted
{9, 10}, galileo-baseline {10}, galileo-depleted {1}, gps-depleted {1, 4, 5}, gps-baseline
{6, 7, 10}.

## Status

Whatever the outcome, every result is **MODELLED**: the study runs under deviations D1 to D5,
which keep it from being the report's own experiment. A claim that matches is reproduced under
those deviations; a claim that misses is recorded with its measured coverage and pinned, and no
claim is made about which deviation caused it. The reproduction is not a certification and does
not bear on any airworthiness or approval question.
