# SPDX-License-Identifier: AGPL-3.0-only
"""Tier 3 — quantify & defend.

Three things a defensible result needs:
  1. a Monte-Carlo ensemble with a confidence band (not a single point),
  2. reproducibility (the SAME source -> an IDENTICAL scenario_hash on two runs),
  3. a stated, sourced figure (here, the [p05-p95] holdover band).

The clock pack runs a Monte-Carlo ensemble when `runs > 1`: each figure of merit is
reported as a mean with a 5th-95th-percentile spread. The spread itself is the
teaching point — the CSAC's stochastic holdover DISTRIBUTION, not one number
(scenarios/clock-ensemble.toml ships a ready-made ensemble).

Reproducibility is the repo's core guarantee: scenario + seed + engine version ->
bit-identical output (scripts/check-reproducible.sh). Two runs of one source give an
identical scenario_hash.

Build first:  maturin develop --features python
Then:        python docs/tutorials/exercises/tier3_montecarlo.py
"""
import json
import pathlib

import kshana

BASE = pathlib.Path("scenarios/clock-holdover.toml").read_text()


def main() -> None:
    # 1. Turn the single run into a 200-run Monte-Carlo ensemble.
    src = "runs = 200\n" + BASE
    result = json.loads(kshana.run(src))

    # The ensemble result reports each FoM as a mean with a [p05, p95] band.
    c = result["classical"]["holdover_s"]
    print(
        f"classical holdover: mean {c['mean']:.0f} s  band [p05 {c['p05']:.0f} - p95 {c['p95']:.0f}] s"
    )
    assert c["p05"] <= c["mean"] <= c["p95"], "mean must sit inside the [p05, p95] band"

    # 2. Reproducibility: the same source -> an identical scenario_hash twice.
    a = json.loads(kshana.run(src))["scenario_hash"]
    b = json.loads(kshana.run(src))["scenario_hash"]
    assert a == b, "deterministic engine: identical source -> identical scenario_hash"
    print(f"reproducible: scenario_hash {a[:12]} stable across two runs")

    # 3. Read a genuine protection-level / integrity result (real HPL/VPL, not the
    #    clock pack's self-consistency FoM).
    integ = json.loads(kshana.run(pathlib.Path("scenarios/integrity-raim.toml").read_text()))
    avail = integ["samples_available"] / integ["samples_total"]
    print(
        f"integrity: {integ['samples_available']}/{integ['samples_total']} epochs "
        f"available ({avail * 100:.1f}%), alert limits HAL {integ['al_h_m']:.0f} m / "
        f"VAL {integ['al_v_m']:.0f} m (APV-I, RTCA DO-229)"
    )
    print("OK: ensemble band + reproducible hash + a real protection-level read")


if __name__ == "__main__":
    main()
