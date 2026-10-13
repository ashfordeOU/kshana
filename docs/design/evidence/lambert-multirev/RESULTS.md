# Multi-revolution Lambert against pykep: results

Pre-registration: `PREREGISTRATION.md` (committed alone at `a75de851`). Reference:
`tests/fixtures/lambert_multirev/reference.csv`, pykep 3.0.1, regenerated independently on
2026-10-13 and byte-identical to the committed file. Run: 2026-10-13,
`cargo test --release --test lambert_multirev_oracle -- --nocapture`.

## Against the bars

| Bar | Result |
|---|---|
| Solution count equal to pykep's in every case | **PASS**: 382 cases, 1058 solutions, every count and branch order equal |
| Velocities within 1e-8 relative (away from the minimum time) | **PASS**: worst 1.60e-13 (B07, M = 0) |
| Velocities within 1e-6 relative within 1 % of the minimum time | **PASS**: worst 7.54e-15 |

The multi-revolution Lambert row is VALIDATED against pykep for this case set.

## Internal consistency guard (not evidence): one finding

The test also propagates each multi-revolution `v1` two-body with `maneuver::kepler_universal`
over `tof` and checks it lands on `r2`. All solutions land within 4.2e-12 of `|r2|`, except
one: **A208, M = 1, right branch** (a = 1.406, e = 0.994, perigee radius 0.008, 1.18 periods),
where the propagated position misses `r2` by 2.0e4 `|r2|`. On the same solution the Lambert
velocities agree with pykep to the 1e-13 level, so the miss lies in `kepler_universal` on this
near-parabolic, close-perigee arc (its universal-variable iteration does not reach the root),
not in the Lambert solver. A check on a moderate ellipse (e = 0.1) over 0.3 to 3.4 periods
showed no such miss. The test pins this one case by name, so any further miss turns it red; a
robust `kepler_universal` for e → 1 arcs is a follow-on.
