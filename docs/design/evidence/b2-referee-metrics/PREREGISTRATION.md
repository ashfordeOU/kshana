<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B2 (0.41): location metrics in the referee

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are for the owner to fix at sign-off. After sign-off the bars may
be tightened after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that
asserts the miss. Public sources only. Advisory software, not certified navigation equipment.

## Why this row

The referee (`src/jammertest/score.rs`, `kshana jammertest score`, `kshana partner check`) scores *when* a receiver or
network alarmed against a schedule: detection latency, missed tests, false-alarm runs, time to recover. It does not
score *where*: a monitoring network that reports an emitter position, a confidence region or a timeline of estimates has
no Kshana metric for any of them. B2 adds those metrics. Every later row of workstream B that reports a location (B1a
planner, B3a/B3b locators, a partner's scorecard) is scored with them, so they are checked first, on a synthetic truth set
whose correct values are known before the code exists.

This row checks arithmetic and definitions only. It says nothing about any locator's accuracy.

## What is fixed now

### 1. Inputs

- **Truth:** per interference event `j`: an identifier, an onset `t_on,j` and an end `t_off,j` (UTC), and a truth
  position `T_j` (WGS 84 latitude, longitude, optional ellipsoidal height). A moving source is a time-tagged track; the
  truth at time `t` is linear interpolation in ECEF between the bracketing track points (no extrapolation: outside the
  track the truth is undefined and the estimate is not scored).
- **Report:** a time-ordered list of reports `r_k` at times `t_k`, each with an optional event identifier, an optional
  point estimate `X_k`, and an optional region at one or more stated levels `p`. A region is one of: an ellipse
  (centre, 2x2 covariance `Σ` in the local east-north plane at the centre, in m²); a polygon (WGS 84 vertices, simple,
  not self-intersecting); or a set of grid cells (the emitter-region grid of `src/interference_map/`).
- **Alarms:** the existing alarm timeline (unchanged definitions from `xval/jammertest-score/PREREGISTRATION.md`).

### 2. Metric definitions (formulas)

1. **Location error** `e_k = g(X_k, T(t_k))`, the WGS 84 geodesic distance (horizontal), in metres. Heights, when both
   are present, give a separate vertical error `v_k = h_X − h_T`. The geodesic is computed to the accuracy of the
   GeographicLib algorithm (MIT licence, https://geographiclib.sourceforge.io), which the oracle script uses directly;
   the engine has its own implementation and does not link it.
2. **Region contains truth** `c_k(p)`:
   - ellipse: project `T` to the local east-north plane at the ellipse centre (`d = [e, n]`, from ECEF via the standard
     ENU rotation); `c = 1` iff `dᵀ Σ⁻¹ d ≤ χ²₂(p) = −2 ln(1 − p)`. The boundary is inside (`≤`). A `Σ` that is not
     symmetric positive definite is an input error, not a miss.
   - polygon: even-odd rule in the same local plane at the polygon's vertex mean; a truth on an edge is inside.
   - grid: `c = 1` iff the cell containing `T` (half-open cells, lower and left edges inclusive) is in the set.
3. **Region size** `A_k(p)`: ellipse `π·sqrt(det Σ)·χ²₂(p)` m²; polygon, planar shoelace area in the local plane; grid,
   the sum of cell areas on the ellipsoid.
4. **Coverage rate** at level `p` over a population of `n` scored reports: `h/n` with `h = Σ c_k(p)`, and the binomial
   check `h ≥ k(n, p)`, where `k(n, p)` is the largest `k` with `P(Bin(n, p) ≥ k) ≥ 0.95` (the rule already used in
   `docs/emitter-region/PREREGISTRATION.md`).
5. **Time to first location** `TTFL_j = t_k* − t_on,j`, `k*` the first report attributed to event `j` with a point
   estimate and `t_on,j ≤ t_k ≤ t_off,j`. None: "not located".
6. **Time to locate** `TTL_j(r)`: the first `t_k ≥ t_on,j` from which, for at least `hold_s` of report time, every
   report of event `j` has `e_k ≤ r` **and** its 95% region contains the truth; `TTL = t_k − t_on,j`. Reported for
   `r` ∈ {100 m, 500 m, 1 km, 5 km} and `hold_s` = 30 s (*proposed*). An event whose condition never holds is
   "not located at r".
7. **Attribution:** a report with an event identifier belongs to that event. A report without one belongs to the event
   whose `[t_on − guard, t_off + guard]` contains `t_k` and whose truth is nearest to `X_k`; `guard` = 60 s, the
   existing referee guard. A report attributed to no event is a **false location**, counted per hour of clean time with
   the existing clean-time definition.
8. **Aggregates** per event and pooled: median and 90th percentile of `e_k` (linear interpolation between order
   statistics, the definition of numpy `percentile` method `linear`), coverage rate per level, median region size,
   median `TTFL`, median `TTL(r)`, number not located.

### 3. The synthetic truth set (written before the code)

A committed file `tests/fixtures/referee_location/truth_v1.json` plus `reports_v1.json`, written by hand and by a numpy
script that shares no code with the engine (`xval/referee-location/oracle.py`, using GeographicLib's Python package and
numpy only), **committed before the engine implementation**. It contains at least 40 cases (*proposed*), including:

- **Hand-worked anchors** (values written into this file now, so neither script can drift):
  - truth (0°, 0°), estimate (0°, 0.01°E): `e` = 6 378 137 × 0.01·π/180 = **1113.194908 m** (equator arc);
  - ellipse `Σ = diag(100², 50²)` m², truth offset (east 100 m, north 50 m): `dᵀΣ⁻¹d` = 2.0 ≤ 5.991465 → contained
    at 95%; at 50% (`χ²₂` = 1.386294) → not contained;
  - the same ellipse's 95% area = π·100·50·5.991465 = **94 113.705 m²**;
  - two truths on the east axis of that ellipse at `dᵀΣ⁻¹d = χ²₂(0.95)·(1 ∓ 1e-6)`: the first contained, the second
    not (floating-point rounding at the exact boundary is not tested; the inclusive rule is stated in the definition).
- edge cases: an event crossing the antimeridian; a truth at latitude 89.9°; a polygon with a truth on a vertex; an
  empty grid region; an event with no reports; a report before onset (not scored for that event); two overlapping events
  with an unattributed report; a moving-source track with a report outside the track times; a degenerate `Σ` (must be
  rejected with an error).
- a **calibrated-ellipse population**: 10 000 reports drawn with a fixed seed from a 2-D normal distribution around fixed truths
  with a stated `Σ` and reported with that same `Σ`.

### 4. Bars (*proposed*)

| Id | Bar |
|---|---|
| R1 exactness | On every case: `e_k` within **1e-6 m** of the oracle; `c_k(p)` identical; `A_k(p)` within **1e-6** relative; `TTFL`, `TTL(r)` identical to the report-time resolution (exact equality of the chosen report); attribution, counts, false locations identical. The hand-worked anchors equal the values above to the digits printed. |
| R2 boundary rules | Every edge case gives the outcome stated for it in the truth file (inside on boundary, error on degenerate `Σ`, "not located", not scored outside the track), with no panic. |
| R3 calibration of the metric | On the calibrated-ellipse population the 95% coverage rate lies in **[0.9444, 0.9556]** (the two-sided 99% binomial interval for `n` = 10 000, `p` = 0.95); same construction at 50% and 90%. This checks the metric, not any estimator. |
| R4 surfaces | The same truth and reports give byte-identical metric JSON through the CLI, Python and WebAssembly (the MCP server where it exposes the referee). |
| R5 additivity | Every existing referee output (`kshana jammertest score`, `kshana partner check`) without location input is byte-identical before and after this change; existing referee tests pass unchanged. |

## What a MET and a NOT MET mean

- **MET** means the location metrics compute what this file defines, on cases whose answers were fixed in advance, on
  every surface. The metrics can then be used to score B1a, B3a, B3b and partner submissions. The ledger row for the
  metrics becomes VALIDATED against the independent oracle (an arithmetic check, labelled as such).
- **MET does not mean** any locator, network or partner system is accurate; that is decided by those rows' own
  pre-registrations.
- **NOT MET** on any bar blocks every row that would be scored with these metrics until a fix passes a new run of this
  same truth set; the miss is published.

## Out of scope

- Any real data. Any locator's accuracy. Three-dimensional region containment (heights are reported, not used for
  containment). Regions that are not ellipses, simple polygons or grid sets. Estimating on-air times (the schedule
  remains scheduled truth, as in the existing referee).

## Process

1. Owner signs off this file; it is committed alone.
2. The truth set and the oracle script are committed (no engine code yet).
3. The engine metrics are written and the comparison runs once; `RESULTS.md` records it, a miss included.
