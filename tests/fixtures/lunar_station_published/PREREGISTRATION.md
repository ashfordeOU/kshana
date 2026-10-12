# Lunar reference station: pre-registration of the comparison against published claims

Registration: this file was committed alone, before `lunar-station-coverage` existed on this branch and
before any comparison run. The commit that registered it is recorded in the next line by a later commit
that changes only that line.
Revision 2 (this text) was committed alone, before any run, after a review of revision 1. It adds S5 to the
provenance, the R600-orbit100 sensitivity case and three disclosures. No bar, case or scored input changed.
Revision 1 (commit 4c340bd6df46efbb862d7ae43c160943c3819f4e, file SHA-256
b25e334eb84c7e78d047c81b8f9e20706d34e212e0e79adbb2bd62f0c54f0c15) is superseded. No comparison was run under it.
Registered at commit: (revision 2; recorded by the following commit)

These bars, cases and inputs are not changed after the results are seen. A failure is reported with its
numbers, not tuned away. Workstream B of the 0.36 lunar reference-station plan.

Wording. "NovaMoon" and "Moonlight" appear here only in citations of the sources (S1 to S5 in
`tests/fixtures/lunar_station/SOURCES.md`). The project's term is "lunar reference station". The
comparison asks whether this project's MODELLED differential-PNT model, run under the public assumptions
the sources state, reproduces the claims those sources make. It is not a statement about the performance
of any real system, and no agency endorsed it.

## What is compared, against what

The claims are listed, quoted and classified in `CLAIMS.md`. Only the claims classified there as
comparable or partly comparable are scored. Each scored claim is a one-sided bound ("sub-metre",
"decimetre level"), so each bar is one-sided. The bars apply the plan's suggested factor of 1.5 to the
claimed bound. No source states a coverage percentage, so the plan's "coverage within 5 percentage
points" bar has no claim to apply to. "Covers the whole south pole" is scored as the plan says:
coverage_fraction ≥ 0.95 over the source's region at the source's threshold.

| # | claims (CLAIMS.md) | quantity (ours) | case | pre-registered bar (pass if) |
|---|---|---|---|---|
| K1 | C2, C3, C5, C6, C7, C8: one station gives sub-metre accuracy over the whole south pole, 300 km circle (lat ≤ −80°) | region `coverage_fraction` at `accuracy_threshold_m` = 1.0 and `percentile` = 95 | R300 | ≥ 0.95 |
| K2 | C6, C8: the same, 600 km circle (lat ≤ −70°) | region `coverage_fraction`, same threshold and percentile | R600 | ≥ 0.95 |
| K3 | C1, C2, C4, C12, C18: sub-metre accuracy with code differential corrections | region corrected p95 3-D error (`corrected_p95_3d_m`, area-weighted as the kind reports it) | R300 | ≤ 1.5 m |
| K4 | C9, C10: "decimeter level navigation accuracies" from pseudorange corrections | region corrected p95 3-D error | R300 | ≤ 0.15 m |
| K5 | C13: sub-metre maintained with 600 s correction latency | region corrected p95 3-D error | LAT600 | ≤ 1.5 m |
| K6 | C14: "maintains the same accuracy performances" from 10 km to 500 km baseline | ratio of per-point corrected p95 3-D error (`corrected_p_3d_m`) at the grid point whose `distance_km` is nearest 500 km to that at the point nearest 10 km | R600 | ratio ≤ 1.5 |

Rules applied to every K:

- 3-D is used where a source speaks of horizontal (East/North) error (C12, C13). 3-D is never smaller
  than horizontal, so this is stricter than the claim, which the plan allows. The horizontal region
  figure is reported next to it, not scored.
- K6 point selection: nearest by |distance_km − target|. Ties go to the point listed first in the
  kind's `points` order. The selected points' coordinates and distances are reported.
- If a scored value is absent from the report (for example, a point with no available epoch), that K
  is recorded as "not evaluable" and counts as not passing.
- B3 ledger status: VALIDATED only if K1 to K6 all pass. Otherwise MODELLED, with the per-K finding in
  the row's `oracle` text. Passing would show only that the model, under these inputs, does not
  contradict the sources' claims. It would not validate the claims, the model's error budget or any
  real system.

## Cases and inputs (fixed now)

Field names follow plan A3. If the merged kind names a field differently, the value is carried across
by meaning and the mapping is written in "First comparison run". No value changes. Every value carries
its source id from `CLAIMS.md` §3 or the label ILLUSTRATIVE.

Base inputs, used by every case unless the case row overrides them:

| input | value | source |
|---|---|---|
| `n_sats` | 4 | S2 p14; S4 p10, p12 |
| `sma_km` | 9737.4 | S4 p6 (24 h period); in-tree value |
| `eccentricity`, `inc_deg`, `argp_deg` | 0.6, 57.7, 90.0 | ILLUSTRATIVE (no public source); the in-tree defaults |
| `mask_deg` | the kind's default (`lunar_service`'s value) | ILLUSTRATIVE (no public source) |
| `station_lat_deg`, `station_lon_deg`, `station_height_m` | −89.4765, −138.135, 0.0 | S2 p19 (Shackleton–Henson Ridge example site); height ILLUSTRATIVE |
| `sise_sigma_m` | 5.102 (= 10 / 1.96) | S4 p8, S2 p21 (10 m, 95 %), read as a two-sided Gaussian (this project's reading) |
| orbit/clock variance split | the kind's default (50/50) | ILLUSTRATIVE (no public source) |
| `noise_m` | 0.30 | S2 p14 (high-quality code, at zenith) |
| `latency_s` | 1.0 | S2 p15 |
| `quantization_bits` | 8 | ILLUSTRATIVE (no public source) |
| `survey_sigma_m` | 0.10 | S1 p4 ("sub-decimetre") |
| `grid_lat_min_deg`, `grid_lat_max_deg`, `grid_lat_step_deg` | −90, −80, 1.0 | S2 p10 (300 km circle) |
| `t_start_s`, `t_span_s`, `t_step_s` | 0, 86400, 600 | plan defaults (one day; S4 p8 states its SISE "over any 24 hours") |
| `n_trials`, `seed` | 200, 42 | plan defaults |
| `accuracy_threshold_m`, `percentile` | 1.0, 95 | "sub-metre" (S2 p10 and others); percentile is this project's reading |
| `residual_sigma_m`, `p_hmi`, `alert_limit_m` | the kind's defaults | not scored; ILLUSTRATIVE |

| case | overrides | used by |
|---|---|---|
| R300 | none | K1, K3, K4 |
| R600 | `grid_lat_max_deg` = −70 (1306 grid points; 1306 × 144 × 200 = 3.76×10⁷ samples, under the plan's 5×10⁷ guard) | K2, K6 |
| LAT600 | `latency_s` = 600 | K5 |

Sensitivity cases, declared now, reported, and **not scored**:

| case | overrides | why |
|---|---|---|
| R300-lowq | `noise_m` = 1.0 | S2 p14's low-quality code |
| R300-survey030 | `survey_sigma_m` = 0.30 | the in-tree ILLUSTRATIVE default, for contrast with the sourced 0.10 |
| R600-orbit100 | the orbit/clock variance split = 100/0 (all SISE variance in the orbit error) | the worst case for spatial decorrelation. The split is ILLUSTRATIVE and drives K6 and the K3/K5 levels |

Reported with every case, not scored: the region `worst_point` (lat, lon, value) next to K3 and K5, the
region availability next to K1 and K2, the region horizontal p95 next to K3 and K5, and the region
uncorrected p95 3-D next to U1.

The cases are run by `tests/lunar_station_published_oracle.rs` (new) through the kind's public API,
at the first commit on `feat/lunar-claims-0.36` that contains both this file and the kind. The engine
version, the commit and the run date are recorded with the results.

## The circularity limit (plan B2), stated before the run

The uncorrected error is driven by the injected SISE, and the SISE is taken from the same sources (S4 p8,
S2 p21). Setting the SISE from a source and then "reproducing" that source's uncorrected accuracy (for
example "Surface Rover Real time < 10 m (95%)", S2 p3) would be close to circular. Uncorrected claims
(U1 to U3 in CLAIMS.md) are therefore not scored. The run reports the region uncorrected p95 3-D error
next to U1 for reference only. The informative comparisons are the corrected accuracy (K3 to K6) and the
coverage extent (K1, K2).

## What this comparison does NOT establish

- It does not establish anything about the performance of any real or planned station, constellation
  or receiver. The sources are concept studies and requirements. The model is this project's.
- The four satellites' eccentricity, inclination, argument of perilune, nodes and phasing are not public
  (S4 p6 says only that they are frozen elliptical orbits with a 24 h period). The in-tree ILLUSTRATIVE
  elements are used. Availability, and through it coverage (K1, K2), depends strongly on them. A K1 or K2
  failure that comes mainly from unavailable epochs is reported as a geometry finding about the
  ILLUSTRATIVE elements, not as a finding about the sources' claims. It still counts as a failure of the
  bar.
- The sources' simulations use a filter, a height constraint, DEM aiding and 15 h of 1 Hz data (S2 p14
  to p16). The kind is an unconstrained 3-D snapshot solution per epoch with no filter. Agreement or
  disagreement on K3, K5 and K6 is between different estimators under partly shared assumptions.
- The sources state no percentile for any accuracy claim. 95 % is this project's reading.
- The sources' error models (orbit projection, decorrelation, multipath, terrain) are not published.
  Terrain and horizon masking at the pole are out of scope for 0.36 and absent from the kind.
- "Sub-metre" and "decimetre level" are one-sided bounds. A model value far below the bound passes the
  bar. This shows only that the model does not contradict the claim.
- The S2 p21 range-domain claim (SISE 10 m → 0.5 m, 95 %) is not scored, because the kind reports
  position-domain figures only.
- K6, and the levels in K3 and K5, depend on the ILLUSTRATIVE 50/50 orbit/clock split of the SISE
  variance. Only the orbit part decorrelates with baseline: the clock part cancels exactly. R600-orbit100
  reports the worst case. It is not scored.
- `noise_m` = 0.30 m is the source's value at zenith (S2 p14). The kind applies it at every elevation,
  with no elevation weighting or low-elevation inflation, so the corrected errors are optimistic.
- The region `corrected_p95_3d_m` is an area-weighted mean of per-point p95 values, each over that
  point's available epochs only. That is weaker than "over the whole south pole": a mean can sit below
  the bar while some points do not, and unavailable epochs do not enter it. K1 and K2 (coverage, where
  unavailable epochs count against the point) and the reported `worst_point` carry that part.
- K4 (≤ 0.15 m) cannot pass with these inputs. Code noise of 0.30 m at both receivers alone gives a
  differenced range noise of about 0.42 m (1-σ) before DOP amplification, so the p95 3-D error is well
  above 0.15 m. A K4 failure therefore reflects the conflict between the sources ("decimeter level"
  from pseudorange corrections in S3 p22 and S5 p5, against code-only "sub-meter level" and code-and-phase
  "few-dm level" in S2 p13). It is not a weakness found in the model. It is still scored and still
  counts against VALIDATED.

## Oracle provenance

The oracle is the published claims: S1 (arXiv:2602.08432v3), S2 (IOAG Cislunar PNT Workshop 2025), S3
(UNOOSA ICG WG-B Lunar PNT, June 2024), S4 (IOAG Cislunar 2026, "Moonlight Programme Development Status")
and S5 (IOAG Cislunar 2026, "Lunar Reference Time: ESA's Views"; K4 scores C10 from S5 p5), each with its URL, retrieval date
(2026-10-12), SHA-256 and licence in `tests/fixtures/lunar_station/SOURCES.md`. They are independent of
this codebase. They are not independent of each other: S1 to S5 come from the same programme and
partly repeat one another, and CLAIMS.md marks the duplicates. No PDF is redistributed.

## First comparison run

(Not yet run. Filled in by the commit that records the first run, without editing anything above.)
