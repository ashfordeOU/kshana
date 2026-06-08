# SPDX-License-Identifier: Apache-2.0
"""Tier 2 — edit & sweep.

Change one parameter and observe a monotone effect. Here: tighten the timing spec
(threshold_ns) and watch the CSAC's holdover get SHORTER — a tighter spec is breached
sooner. The optical clock keeps holding the full outage regardless, because its
phase error stays far below even the tightest spec in the sweep.

Why monotone: holdover is the time the phase error crosses the spec. Lowering the
spec can only move that crossing earlier (or leave it unchanged on the grid), never
later — the white-FM phase error grows monotonically in T (NIST SP-1065).

Build first:  maturin develop --features python
Then:        python docs/tutorials/exercises/tier2_sweep.py
"""
import json
import pathlib

import kshana

BASE = pathlib.Path("scenarios/clock-holdover.toml").read_text()


def holdover_for_spec(threshold_ns: float) -> tuple[float, float]:
    """Run the clock scenario with threshold_ns overridden, return (quantum, classical) holdover."""
    # Replace the spec line; everything else (seed, windows, clocks) is unchanged,
    # so the comparison is apples-to-apples.
    src = BASE.replace("threshold_ns = 20.0", f"threshold_ns = {threshold_ns}")
    result = json.loads(kshana.run(src))
    return (
        result["quantum"]["fom"]["holdover_s"],
        result["classical"]["fom"]["holdover_s"],
    )


def main() -> None:
    specs = [20.0, 15.0, 10.0, 5.0]
    print(f"{'spec (ns)':>10} {'quantum (s)':>12} {'classical (s)':>14}")
    prev_classical = float("inf")
    for spec in specs:
        q, c = holdover_for_spec(spec)
        print(f"{spec:>10.1f} {q:>12.0f} {c:>14.0f}")
        # Tightening the spec must not LENGTHEN the classical holdover.
        assert c <= prev_classical + 1e-9, "classical holdover must be monotone in the spec"
        prev_classical = c
    print("OK: CSAC holdover is monotone (non-increasing) as the spec tightens")


if __name__ == "__main__":
    main()
