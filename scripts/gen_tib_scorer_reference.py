#!/usr/bin/env python3
"""Independent numpy oracle for the TIB scorer machinery (InternalConsistency).

Builds a fixed synthetic (true_error, pl) sample set, classifies each epoch by
the Stanford integrity-diagram four-region rule, counts the regions, and emits
tests/fixtures/tib/reference.json. This checks the Rust scorer's *counting*, not
any accuracy claim: the benchmark is honesty-immune and makes no accuracy claim.
Run: python3 scripts/gen_tib_scorer_reference.py
"""
import json
import pathlib
import numpy as np

AL = 10.0
STATED_IR = 1e-2

rng = np.random.default_rng(20260708)
# A deterministic spread across all four regions.
true_errors = np.concatenate([
    rng.uniform(0.0, 3.0, 40),     # mostly Nominal against a ~5 PL
    rng.uniform(6.0, 9.0, 20),     # MI region against a ~5 PL, still < AL
    rng.uniform(11.0, 20.0, 10),   # HMI region: > AL
    rng.uniform(0.0, 2.0, 10),     # Unavailable epochs (PL > AL below)
])
pls = np.concatenate([
    np.full(40, 5.0),
    np.full(20, 5.0),
    np.full(10, 5.0),
    np.full(10, 12.0),             # PL > AL => Unavailable
])

def classify(e, pl, al):
    e = abs(e)
    if pl > al:
        return "unavailable"
    if e <= pl:
        return "nominal"
    if e <= al:
        return "mi"
    return "hmi"

counts = {"nominal": 0, "unavailable": 0, "mi": 0, "hmi": 0}
for e, pl in zip(true_errors, pls):
    counts[classify(e, pl, AL)] += 1

n = int(len(true_errors))
hmi_rate = counts["hmi"] / n
mi_rate = counts["mi"] / n
availability = counts["nominal"] / n
coverage_ok = bool(hmi_rate <= STATED_IR)

out = {
    "al": AL,
    "stated_ir": STATED_IR,
    "true_errors": [float(x) for x in true_errors],
    "pls": [float(x) for x in pls],
    "n": n,
    "n_nominal": counts["nominal"],
    "n_unavailable": counts["unavailable"],
    "n_mi": counts["mi"],
    "n_hmi": counts["hmi"],
    "hmi_rate": hmi_rate,
    "mi_rate": mi_rate,
    "availability": availability,
    "coverage_ok": coverage_ok,
}
path = pathlib.Path(__file__).resolve().parents[1] / "tests" / "fixtures" / "tib" / "reference.json"
path.parent.mkdir(parents=True, exist_ok=True)
path.write_text(json.dumps(out, indent=2) + "\n")
print(f"wrote {path}: n={n} nominal={counts['nominal']} mi={counts['mi']} "
      f"hmi={counts['hmi']} unavailable={counts['unavailable']}")
