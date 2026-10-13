# CAP-32 campaign optimiser: round 2 pre-registration

Written and committed after Round 1 (`RESULTS.md`) and **before** Round 2 ran. Round 1's P2 is
NOT MET and stays NOT MET. The round-1 boxes did not contain the 3 dB solution, so P2 and P3
could not test an interior solve. Round 2 adds two new bars on boxes that do contain it.
Nothing in Round 1 is changed, re-scored or replaced. The optimiser code is unchanged between
the rounds.

The inputs are the same as Round 1 (`scenarios/link-budget.toml`). The margin at 2000 km and
1 Mbit/s is m0 ≈ 92.1 dB, so the 3 dB range at 1 Mbit/s is about 5.7 × 10⁷ km.

## Bars (decided now, not to be relaxed)

1. **P2′ (analytic 1-D target, interior).** `range_km` is log over [1e5, 1e9] km, with goal
   `target` = 3 dB, start at the box midpoint (log), `max_evals` 300, `ftol` 1e−14 and
   `xtol` 1e−12. The closed form is the one from Round 1, r* = r0 · 10^((m(r0) − 3)/20) with
   r0 = 2000 km.
   Bar: |r − r*| / r* ≤ 1e−6, within 300 evaluations.
2. **P3′ (brute force, 2-D target, contour crosses the box).** `range_km` is log over
   [1e6, 1e9] km and `data_rate_bps` is log over [1e3, 1e8], with goal `target` = 3 dB. The
   margin runs from about +68 dB to about −42 dB over this box, so the 3 dB contour crosses
   its interior. The brute force is the same independent 41 × 41 loop over `run_toml`, giving
   s_grid.
   Bars:
   * (a) `method = "grid"` with 41 steps gives a best score bit-equal to s_grid, at the same
     node;
   * (b) Nelder–Mead (box centre, `max_evals` 400) gives a best score ≤ s_grid, and ≤ 1e−6 dB.

A miss is recorded as NOT MET with its numbers.
