# CAP-32 campaign optimiser: pre-registration

Written and committed **before** the optimiser was implemented or run. It fixes the protocol and
the bars for the `[optimize]` campaign section. None of the comparisons below is external: the
oracles are a closed form and a brute-force grid, so whatever the outcome, the row stays
**MODELLED**. It is never VALIDATED.

## What is being built

An additive, optional `[optimize]` section of the `campaign` kind. It searches one to three
dotted scenario keys, each bounded to `[lo, hi]` on a `lin` or `log` scale, for the best value
of one metric read from the run result by path (the `[sweep]` path syntax). Goals:
* `minimize`;
* `maximize`;
* `target`, which minimises `|metric − target|`.

Two methods:
* `grid`: every node of a `steps`-per-axis grid. Its axis values are the generic sweep's, so a
  `grid` optimisation and a `[sweep]` over the same range run the same numbers.
* `nelder-mead`: a deterministic Nelder–Mead simplex. It runs in coordinates normalised to
  [0, 1] per axis (log10 for a log axis). Trial points are projected onto the box. The
  coefficients are the standard 1, 2, ½ and ½. It stops at `max_evals`, or when the simplex's
  objective spread is ≤ `ftol` and its normalised size is ≤ `xtol`.

A run whose metric is absent or non-finite scores +∞. That is recorded, not hidden. With
`runs > 1`, the metric is the mean over seeds `base … base + runs − 1`. These are the same seeds
at every evaluation (common random numbers). Every evaluation is in the document's `trace`.

The optimum is local to the box and the start. It is not a global guarantee, and the document
label says so.

## Pre-registered bars (decided now, not to be relaxed)

1. **P1 (core, Rosenbrock).** `f(x, y) = (1 − x)² + 100 (y − x²)²` on the box [−2, 2]², from
   (−1.2, 1), with initial normalised step 0.1, `max_evals` 2000, `ftol` 1e−14 and `xtol` 1e−10.
   Bar: f* ≤ 1e−8 and ‖x* − (1, 1)‖∞ ≤ 1e−3.
2. **P2 (analytic target, 1-D).** The inputs are those of `scenarios/link-budget.toml`.
   `range_km` is on a log axis over [100, 100000], with goal `target` = 3 dB margin, start at
   the midpoint and `max_evals` 300. The margin falls as −20 log10(range) exactly. So the closed
   form is r* = r0 · 10^((m(r0) − 3)/20), where m(r0) is the kind's own `margin_db` at
   r0 = 2000 km, read from a direct `run_toml`.
   Bar: |r − r*| / r* ≤ 1e−6, within 300 evaluations.
3. **P3 (brute force, 2-D target).** The inputs are the same. `range_km` is log over
   [500, 50000] and `data_rate_bps` is log over [1e3, 1e8], with goal `target` = 3 dB. The
   brute force is an independent loop in the test that calls `kshana::api::run_toml` on the
   41 × 41 log grid; s_grid = min |margin − 3|.
   Bars:
   * (a) the campaign's `method = "grid"` with 41 steps per axis reports a best score
     bit-equal to s_grid, at the same coordinates;
   * (b) `nelder-mead` (start at the box centre, `max_evals` 400, fewer than a quarter of the
     1681 grid runs) reports a best score ≤ s_grid.
4. **P4 (boundary optimum).** On the P3 box, maximise `margin_db`. The brute-force grid maximum
   lies at the corner (500 km, 1e3 bps), which is a grid node.
   Bar: the Nelder–Mead maximum ≥ the grid maximum − 1e−6 dB, within 400 evaluations.
5. **P5 (reproducibility).** The same optimisation campaign run twice gives byte-identical JSON.
   The `trace` length equals `evals`, which equals `reproducibility.runs_total` when `runs = 1`.

If a bar fails, the result is recorded as NOT MET with the numbers found. A defect in the
optimiser may be fixed and the whole protocol re-run unchanged; the bars are not moved.
