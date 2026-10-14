#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent recomputation of the jamming kind's acquisition hysteresis (CAP-06 (c), bar H3).

Shares no code with the engine. Given only each run's per-epoch list of visible links with
their effective C/N0 (inputs.json, exported by tests/jamming_acq_agc.rs), the two thresholds,
the delay and the time step, it runs the registered state machine and writes every link's
acquired flag.

Usage: python3 -I hysteresis.py inputs.json expected.json
"""
import json
import sys

src = json.load(open(sys.argv[1]))
acq, trk, delay = src["acquisition_threshold_dbhz"], src["tracking_threshold_dbhz"], src["reacquisition_delay_s"]
out = {"runs": []}
for run in src["runs"]:
    state = {}  # prn -> [acquired, not_acquired_since]
    flags = []
    for ep in run["epochs"]:
        t = ep["t"]
        seen = set()
        for prn, cn0 in ep["links"]:
            seen.add(prn)
            s = state.setdefault(prn, [False, 0.0])
            if s[0]:
                if cn0 < trk:
                    s[0], s[1] = False, t
            elif cn0 >= acq and t - s[1] >= delay:
                s[0] = True
            flags.append([t, prn, s[0]])
        for prn, s in state.items():
            if prn not in seen and s[0]:
                s[0], s[1] = False, t
    out["runs"].append({"jammer_power_dbw": run["jammer_power_dbw"], "flags": flags})
json.dump(out, open(sys.argv[2], "w"))
for r in out["runs"]:
    print(r["jammer_power_dbw"], "dBW:", sum(f[2] for f in r["flags"]), "acquired of", len(r["flags"]))
