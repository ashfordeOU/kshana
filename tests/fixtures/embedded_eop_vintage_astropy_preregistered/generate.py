#!/usr/bin/env python3
"""Vintage census of the embedded IERS extract by astropy, plus the Bulletin A table it is
checked against (the pre-registered M035 round-2 comparison).

1. Reads `tools/finals2000A_20260930.txt` with astropy 8.0.1 `astropy.utils.iers.IERS_A.read`
   (BSD-3-Clause), which parses the fixed columns and the I/P flags itself. The `#` comment
   header is not part of the IERS format and is stripped; nothing else is changed.
2. Copies the prediction table (MJD, x, y, UT1-UTC) of IERS Bulletin A Vol. XXXIX No. 039 from
   the frozen copy at $KSHANA_ORACLES/data/iers/bulletinA/bulletina-xxxix-039.txt, verbatim
   numbers, so the test can check the extract's P rows against the bulletin that issued them.

Writes `census.json` beside this script. Run from the repository root:

    source ~/Code/kshana-oracles/env.sh
    "$ORACLE_PY" tests/fixtures/embedded_eop_vintage_astropy_preregistered/generate.py
"""

import hashlib
import json
import os
import re
import tempfile

import astropy
import numpy as np
from astropy.utils import iers

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", "..", ".."))
SRC = os.path.join(ROOT, "tools", "finals2000A_20260930.txt")
BULLETIN = os.path.join(os.environ["KSHANA_ORACLES"], "data", "iers", "bulletinA",
                        "bulletina-xxxix-039.txt")


def blank(col):
    vals = np.ma.asarray(getattr(col, "value", col), dtype=float)
    return np.ma.getmaskarray(vals) | np.isnan(np.ma.filled(vals, np.nan))


def group(mjd, idx):
    return {
        "n": len(idx),
        "first_mjd": float(min(mjd[i] for i in idx)) if idx else None,
        "last_mjd": float(max(mjd[i] for i in idx)) if idx else None,
        "mjds": [float(mjd[i]) for i in idx],
    }


def bulletin_predictions():
    raw = open(BULLETIN, "rb").read()
    text = raw.decode("ascii", "replace")
    part = text.split("PREDICTIONS:")[1]
    rows = []
    for line in part.splitlines():
        m = re.match(r"^\s+(\d{4})\s+(\d+)\s+(\d+)\s+(\d{5})\s+(-?\d+\.\d+)\s+(-?\d+\.\d+)\s+(-?\d+\.\d+)\s*$", line)
        if m:
            rows.append({"mjd": float(m.group(4)), "x_arcsec": float(m.group(5)),
                         "y_arcsec": float(m.group(6)), "ut1_utc_s": float(m.group(7))})
    return hashlib.sha256(raw).hexdigest(), rows


def main():
    raw = open(SRC, "rb").read()
    data_lines = [ln for ln in raw.decode("utf-8").splitlines() if not ln.startswith("#") and ln.strip()]
    with tempfile.TemporaryDirectory(dir=HERE) as td:
        path = os.path.join(td, "finals2000A.data")
        with open(path, "w") as f:
            f.write("\n".join(data_lines) + "\n")
        t = iers.IERS_A.read(path)

    mjd = np.asarray(getattr(t["MJD"], "value", t["MJD"]), dtype=float)
    b_blank = blank(t["UT1_UTC_B"])
    ut1_flag = [str(x) for x in t["UT1Flag_A"]]
    pm_flag = [str(x) for x in t["PolPMFlag_A"]]
    n = len(mjd)
    final_idx = [i for i in range(n) if not b_blank[i]]
    rapid_idx = [i for i in range(n) if b_blank[i] and ut1_flag[i] == "I" and pm_flag[i] == "I"]
    pred_idx = [i for i in range(n) if ut1_flag[i] == "P" or pm_flag[i] == "P"]
    b_sha, b_rows = bulletin_predictions()

    out = {
        "oracle": "astropy.utils.iers.IERS_A.read",
        "astropy_version": astropy.__version__,
        "source_file": "tools/finals2000A_20260930.txt",
        "source_sha256": hashlib.sha256(raw).hexdigest(),
        "rows": int(n),
        "first_mjd": float(mjd.min()),
        "last_mjd": float(mjd.max()),
        "final": group(mjd, final_idx),
        "rapid": group(mjd, rapid_idx),
        "predicted": group(mjd, pred_idx),
        "flags_by_mjd": {f"{mjd[i]:.0f}": [pm_flag[i], ut1_flag[i]] for i in range(n)},
        "ut1_flag_census": {f: ut1_flag.count(f) for f in sorted(set(ut1_flag))},
        "pm_flag_census": {f: pm_flag.count(f) for f in sorted(set(pm_flag))},
        "bulletin_a": {
            "file": "bulletina-xxxix-039.txt",
            "sha256": b_sha,
            "predictions": b_rows,
        },
    }
    with open(os.path.join(HERE, "census.json"), "w") as f:
        json.dump(out, f, indent=1, sort_keys=True)
        f.write("\n")
    print(json.dumps({k: v for k, v in out.items() if k not in ("flags_by_mjd", "bulletin_a")}, indent=1)[:3000])


if __name__ == "__main__":
    main()
