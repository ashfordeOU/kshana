<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B2 (0.41): location metrics in the referee: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026, committed in `ca4242344` before any
code). The truth set and the independent oracle were committed in `23616ff42`, before any engine code;
the readings the pre-registration left open are written in `xval/referee-location/README.md` in that
same commit. The engine's geodesic distance (`src/geodesic.rs`, a port of GeographicLib's inverse
solution) was committed next, in `cb30132d1`, with its own check against GeographicLib. The bars were not
changed.

Reproduce with `cargo test --test referee_location -- --nocapture` (and `cargo test --test geodesic`).

## Summary

| Bar | Result |
|---|---|
| R1 exactness | **MET**: 0 misses over 10 054 reports, 13 events and the pooled set. Worst `|e − oracle|` 2.5e-9 m (bar 1e-6 m); worst region area 1.6e-15 relative (bar 1e-6); attribution, containment, counts, time to first location, time to locate and false locations identical. The anchors equal the printed values. |
| R2 boundary rules | **MET**: the degenerate covariance is refused with an error; the boundary pair splits as stated; the antimeridian, near-pole, polygon-vertex, empty-grid, no-report, before-onset, overlapping-event and outside-track cases give the oracle's outcomes. |
| R3 calibration of the metric | **MET**: coverage 0.9455 at 95 % (interval [0.9444, 0.9556]), 0.8963 at 90 % ([0.8923, 0.9077]), 0.4961 at 50 % ([0.4871, 0.5129]), n = 10 000. |
| R4 surfaces | **MET for the command line and MCP, pending for Python and WebAssembly** (see below). |
| R5 additivity | **MET**: `score.rs` is unchanged; `tests/jammertest_score.rs` and the referee's unit tests pass unchanged. |

## R1 and R2

`tests/referee_location.rs` compares every report, every event aggregate and the pooled aggregate with
`expected_v1.json.gz`, which the oracle (`xval/referee-location/oracle.py`, GeographicLib and numpy, no
shared code) computed before the engine code existed. Tolerances are the pre-registration's: distances to
1e-6 m, areas to 1e-6 relative, everything else exact. Statistics (median, 90th percentile, median area)
agree to 1e-9 relative.

## R3

The population is 10 000 reports around two fixed truths, each reported with the covariance it was drawn
from. The coverage rates are in their two-sided 99 % binomial intervals at all three levels. This checks the
metric, not any estimator.

## R4

- **Command line:** `kshana jammertest locate-score` writes the library's bytes (`score_json`); their
  SHA-256 is pinned in `tests/fixtures/referee_location/score_v1.sha256`.
- **MCP:** the `referee_location_score` tool returns the same values as the library on the 54 hand-placed
  reports (`mcp/kshana-mcp/tests/jammertest_round_trip.rs`). Its reply adds the advisory `notice`, as every
  MCP tool's does, so the comparison is value for value, not byte for byte. The calibrated population is
  over a tool call's 4 MiB input cap.
- **Python and WebAssembly:** `referee_location_score` returns the JSON text; `tests/python/test_bindings.py`
  and `web/smoke.mjs` check its SHA-256 against the same pinned digest. Those run in CI (the
  `test-python-bindings` and `test-wasm-bindings` jobs), not in this environment, which has neither maturin
  nor wasm-pack. R4 is recorded as MET for them once those jobs pass on the commit that adds them; until
  then it is pending.

## What this means

The metrics compute what the pre-registration defines, on cases fixed in advance. They can be used to score
B1a, B3a, B3b and partner submissions. This says nothing about any locator's accuracy. The verification
ledger row is added when R4 is met on every surface.
