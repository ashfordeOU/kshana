#!/usr/bin/env python3 -I
# SPDX-License-Identifier: AGPL-3.0-only
"""Summarise campaign B of PREREGISTRATION-v2.md: for each ablation, the cells of the bars it is read on that were missed in
run 1 and are now within the original tolerance (and the cells that were met and now are not), and for every run-1 miss the
ablations that bring it within tolerance. No bar; a sensitivity table. Writes results-v2-summary.json.
usage: summarise_v2.py <dir with results-run1.json and results-v2-B1..B5.json>
"""
import json, sys
d = sys.argv[1]
ctl = json.load(open(f"{d}/results-v2-control.json"))
cells = {bar: {c["cell"]: c for c in v["cells"] if c.get("scored")} for bar, v in ctl["bars"].items()}
out = {"ablations": {}, "leftover_cells": {}}
fixers = {}
for i in range(1, 6):
    a = json.load(open(f"{d}/results-v2-B{i}.json"))
    row = {}
    for bar, v in a["bars"].items():
        now = {c["cell"]: c for c in v["cells"] if c.get("scored")}
        missed = [k for k, c in cells[bar].items() if not c["pass"]]
        fixed = [k for k in missed if now[k]["pass"]]
        broken = [k for k, c in cells[bar].items() if c["pass"] and not now[k]["pass"]]
        for k in fixed:
            fixers.setdefault(f"{bar} {k}", []).append(f"B{i}")
        row[bar] = {"scored_cells": len(now), "control_missed": len(missed), "missed_now": sum(1 for c in now.values() if not c["pass"]),
                    "missed_cells_now_within_tolerance": fixed, "met_cells_now_missed": broken}
    out["ablations"][f"B{i}"] = row
for bar, cs in cells.items():
    for k, c in cs.items():
        if not c["pass"]:
            out["leftover_cells"][f"{bar} {k}"] = fixers.get(f"{bar} {k}", [])
out["run1_missed_cells"] = len(out["leftover_cells"])
out["run1_missed_cells_fixed_by_any_ablation"] = sum(1 for v in out["leftover_cells"].values() if v)
json.dump(out, open(f"{d}/results-v2-summary.json", "w"), indent=1, sort_keys=True)
print(json.dumps({k: v for k, v in out.items() if k != "leftover_cells"}, indent=1)[:3000])
