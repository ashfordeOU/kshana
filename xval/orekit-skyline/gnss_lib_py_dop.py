#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle driver for tests/skyline_orekit_oracle.rs (see PREREGISTRATION.md beside this file).

Reads <dir>/outputs/orekit.csv (Orekit's azimuth, elevation and mask per satellite), forms the
visible set of every (site, epoch, mask) as el >= max(5 deg, mask) from Orekit's numbers, and
writes <dir>/outputs/gnss_lib_py_dop.csv: gnss_lib_py 1.0.4's get_dop (GDOP, PDOP, HDOP, VDOP,
TDOP and the splatted ENU-and-clock DOP matrix, one common clock) for every set of at least four
satellites. No Kshana code is involved.
"""

import csv
import sys
from pathlib import Path

import numpy as np
from gnss_lib_py.navdata.navdata import NavData
from gnss_lib_py.utils import dop as D

MASK_DEG = 5.0


def main(root: Path) -> None:
    rows = list(csv.DictReader(open(root / "outputs" / "orekit.csv")))
    masks = [k[len("cut_"):] for k in rows[0] if k.startswith("cut_")]
    groups = {}
    for r in rows:
        for m in masks:
            cut = max(MASK_DEG, float(r["cut_" + m]))
            if float(r["el_deg"]) >= cut:
                key = (r["site_id"], r["epoch_s"], m)
                groups.setdefault(key, []).append((float(r["el_deg"]), float(r["az_deg"])))
    keys = sorted(k for k, v in groups.items() if len(v) >= 4)
    millis, el, az = [], [], []
    for i, k in enumerate(keys):
        for e, a in groups[k]:
            millis.append(1000.0 * (i + 1))
            el.append(e)
            az.append(a)
    nav = NavData()
    nav["gps_millis"] = np.array(millis)
    nav["el_sv_deg"] = np.array(el)
    nav["az_sv_deg"] = np.array(az)
    dop = D.get_dop(nav, GDOP=True, HDOP=True, VDOP=True, PDOP=True, TDOP=True, dop_matrix=True)
    labels = D.get_enu_dop_labels()
    out = root / "outputs" / "gnss_lib_py_dop.csv"
    with open(out, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["site_id", "epoch_s", "mask_id", "n_visible", "gdop", "pdop", "hdop", "vdop", "tdop"]
                   + ["q_" + l for l in labels])
        for i, k in enumerate(keys):
            col = lambda name: float(np.asarray(dop[name])[i])
            w.writerow([k[0], k[1], k[2], len(groups[k])]
                       + [repr(col(n)) for n in ("GDOP", "PDOP", "HDOP", "VDOP", "TDOP")]
                       + [repr(col("dop_" + l)) for l in labels])


if __name__ == "__main__":
    main(Path(sys.argv[1]))
