<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B2 referee location metrics: truth set and oracle

The pre-registration is `docs/design/evidence/b2-referee-metrics/PREREGISTRATION.md`, signed off on
3 November 2026. This directory holds the independent oracle (`oracle.py`, GeographicLib's Python package
and numpy only, sharing no code with the engine) and writes the truth set into
`tests/fixtures/referee_location/`. Both are committed before any engine code (process step 2). The two large files are gzip-compressed (written with a zero time stamp, so they are
reproducible byte for byte).

## Files

- `truth_v1.json`: events (onset, end, a fixed position or a time-tagged track), the observation span,
  `guard_s` = 60, `hold_s` = 30, the radii {100, 500, 1000, 5000} m and the levels {0.5, 0.9, 0.95}.
- `reports_v1.json.gz`: the reports to score (54 hand-placed cases, then 10 000 calibrated-ellipse reports).
- `reports_degenerate_v1.json`: one report whose covariance is not positive definite; scoring must fail
  with an error.
- `expected_v1.json.gz`: what the oracle computes for every report, every event and the pooled set.

Times are Unix seconds (UTC). Positions are WGS 84 latitude, longitude and height (m above the
ellipsoid; 0 when absent).

## Readings of the pre-registration, fixed here before any engine code

1. **Scored report.** A report is scored for its event (it gets `e_k`, `v_k` and region containment)
   when it has a point estimate, its time lies in `[t_on, t_off]`, and the truth is defined at its time
   (a track does not extend past its first and last points). A report attributed to an event but outside
   that window (inside the guard band) is attributed but not scored. This is how "a report before onset
   (not scored for that event)" and "outside the track the truth is undefined and the estimate is not
   scored" are read. Region containment and size are computed for every region of a scored report.
2. **Attribution without an event identifier.** The candidates are the events whose
   `[t_on − guard, t_off + guard]` contains `t_k`. With a point estimate, the candidate whose truth is
   nearest (geodesic) wins; the truth of a track outside its time span is its point nearest in time, for
   this choice only. Without a point estimate, the candidate with the earliest onset wins (ties: the
   identifier, in byte order). No candidate: a false location.
3. **Time to locate.** Over the event's scored reports in time order, `TTL(r)` is `t_k − t_on` for the
   first `k` that starts a run of consecutive scored reports `k..m`, every one with `e ≤ r` and a 95 %
   region containing the truth, with `t_m − t_k ≥ hold_s`. A report without a 95 % region breaks a run.
4. **Ellipse plane.** `d` is the east and north components of the truth in the local frame at the
   ellipse centre (centre height as given, else 0; truth height as given, else 0); the up component is
   not used. `Σ` must be symmetric (to 1e-9 relative) with a positive determinant and positive diagonal.
5. **Polygon plane.** The tangent point has the arithmetic mean of the vertices' latitudes and of their
   longitudes (longitudes unwrapped to within 180° of the first vertex), height 0. The truth is inside
   when the even-odd rule says so, or when it lies within 1e-6 m of an edge (a vertex included).
6. **Grid.** A region `{cell_deg, cells: [[i, j], ...]}`: cell `(i, j)` covers latitudes
   `[i·c, (i+1)·c)` and longitudes `[j·c, (j+1)·c)`, longitude taken in `[−180, 180)`. A cell's area is
   the exact area between its parallels and meridians on the WGS 84 ellipsoid,
   `a²(1−e²)·Δλ·[q(φ₂) − q(φ₁)]/2` with `q(φ) = sinφ/(1−e² sin²φ) + ln((1+e sinφ)/(1−e sinφ))/(2e)`.
7. **Clean time.** The observation span minus the union of `[t_on − guard, t_off + guard]` over the
   events, clipped to the span. False locations per hour = count / (clean seconds / 3600).
8. **Medians and percentiles** are numpy `percentile` with the `linear` method; a median of nothing is
   `null`. Coverage at level `p` is over the scored reports with a region at that level.
9. **Track truth.** Linear interpolation in ECEF between the bracketing track points, converted back to
   geodetic latitude, longitude and height.
10. **Vertical error.** `v_k = h_X − h_T` when the report's point has a height and the truth states one
    (a fixed position with `h`, or a track whose every point has `h`); otherwise `null`.
