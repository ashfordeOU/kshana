# SPDX-License-Identifier: Apache-2.0
"""Tier 1 — run & read.

The simplest possible use: run a shipped scenario unchanged and read one figure of
merit. Mirrors tests/python/test_bindings.py (import kshana; json.loads(kshana.run)).

Build the extension first:  maturin develop --features python
Then:                       python docs/tutorials/exercises/tier1_run.py

Goal: read the quantum vs classical holdover from scenarios/clock-holdover.toml.
Expected ordering (Tutorial 2): the optical clock holds the full 6600 s outage; the
CSAC breaches the 20 ns spec near the NIST SP-1065 white-FM crossing (~2610 s on the
10 s grid). The optical clock must always hold at least as long as the CSAC.
"""
import json
import pathlib

import kshana

SCENARIO = pathlib.Path("scenarios/clock-holdover.toml")


def main() -> None:
    src = SCENARIO.read_text()
    result = json.loads(kshana.run(src))
    q = result["quantum"]["fom"]["holdover_s"]
    c = result["classical"]["fom"]["holdover_s"]
    print(f"quantum holdover : {q:.0f} s")
    print(f"classical holdover: {c:.0f} s")
    # The quieter optical clock holds over at least as long as the CSAC.
    assert q >= c, "optical clock must hold at least as long as the CSAC"
    print("OK: optical clock holds >= CSAC (NIST SP-1065 white-FM growth law)")


if __name__ == "__main__":
    main()
