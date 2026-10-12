#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle driver for tests/ellipse_numpy_oracle.rs (see PREREGISTRATION.md beside this file).

numpy inverts G^T G and eigen-decomposes the horizontal block for every visible set of the
committed skyline comparison, under one common clock and one clock per system. No Kshana code.
Writes <dir>/outputs/numpy_ellipse.csv.
"""

import csv
import math
import sys
from pathlib import Path

import numpy as np

MASK_DEG = 5.0
SIGMA = 1.5
CONF = 0.95


def main(root: Path) -> None:
    rows = list(csv.DictReader(open(root / "outputs" / "orekit.csv")))
    masks = [k[len("cut_"):] for k in rows[0] if k.startswith("cut_")]
    groups = {}
    for r in rows:
        for m in masks:
            if float(r["el_deg"]) >= max(MASK_DEG, float(r["cut_" + m])):
                groups.setdefault((r["site_id"], r["epoch_s"], m), []).append(
                    (r["sat_id"], float(r["el_deg"]), float(r["az_deg"])))
    k = math.sqrt(-2.0 * math.log(1.0 - CONF))
    out = root / "outputs" / "numpy_ellipse.csv"
    with open(out, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["site_id", "epoch_s", "mask_id", "clock", "n", "clocks", "pdop",
                    "semi_major_m", "semi_minor_m", "orientation_deg", "gap_rel", "q_upper",
                    "numpy"])
        for key in sorted(k2 for k2, v in groups.items() if len(v) >= 4):
            sats = groups[key]
            for model in ("common", "per-system"):
                labels = []
                idx = []
                for sid, _, _ in sats:
                    lab = "common" if model == "common" else sid.rsplit("-", 1)[0]
                    if lab not in labels:
                        labels.append(lab)
                    idx.append(labels.index(lab))
                nst = 3 + len(labels)
                if len(sats) < nst:
                    continue
                g = np.zeros((len(sats), nst))
                for i, (_, el, az) in enumerate(sats):
                    e, a = math.radians(el), math.radians(az)
                    g[i, :3] = [-math.cos(e) * math.sin(a), -math.cos(e) * math.cos(a), -math.sin(e)]
                    g[i, 3 + idx[i]] = 1.0
                q = np.linalg.inv(g.T @ g)
                lam, vec = np.linalg.eigh(q[:2, :2])
                l2, l1 = lam
                v = vec[:, 1]
                orient = math.degrees(math.atan2(v[0], v[1])) % 180.0
                pdop = math.sqrt(q[0, 0] + q[1, 1] + q[2, 2])
                upper = ";".join(repr(float(q[i, j])) for i in range(nst) for j in range(i, nst))
                w.writerow([*key, model, len(sats), "|".join(labels), repr(pdop),
                            repr(float(k * SIGMA * math.sqrt(l1))), repr(float(k * SIGMA * math.sqrt(max(l2, 0.0)))),
                            repr(float(orient)), repr(float((l1 - l2) / l1)), upper, np.__version__])


if __name__ == "__main__":
    main(Path(sys.argv[1]))
