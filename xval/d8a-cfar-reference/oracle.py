#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""D8a row 3 oracle (numpy, no engine code): C4 on the five scored signals under the row
reference set, recomputed from the signal definition (README reading 6). Run only after the
engine's scored run (reading 7).

    python3 -I oracle.py          (prints one JSON line per signal)
"""
import json
import numpy as np
from dev_study import grid, exceed, refs_row, refs_local, RC, FS

SIGNALS = [(1, 1250.0, 300.25), (7, -2500.0, 17.5), (13, -750.0, 511.0), (22, 500.0, 800.75), (31, 3000.0, 1000.25)]

if __name__ == "__main__":
    for prn, f, p in SIGNALS:
        G = grid(prn, f, p)
        j, l0 = np.unravel_index(np.argmax(G), G.shape)
        dopp = -5000.0 + 500.0 * j
        d = (l0 * RC / FS - p) % 1023.0
        out = {"prn": prn}
        for name, rs in (("row", refs_row), ("registered", refs_local)):
            a, t, det, n = exceed(G, rs)
            out[name] = {"above": int(a), "tested": int(t), "detected": bool(det), "n_ref": n}
        out.update({"peak_doppler_hz": dopp, "code_phase_error_chips": min(d, 1023.0 - d)})
        print(json.dumps(out))
