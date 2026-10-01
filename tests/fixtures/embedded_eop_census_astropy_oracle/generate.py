#!/usr/bin/env python3
"""Census of the embedded IERS finals2000A extract, read by astropy (the M035 oracle).

Reads `tools/finals2000A_2026.txt` with astropy's own finals2000A reader
(`astropy.utils.iers.IERS_A.read`, astropy 8.0.1, BSD-3-Clause), which parses the
fixed-column format and the I/P vintage flags independently of this crate. The `#`
comment header of the embedded file is not part of the IERS format; it is stripped
before astropy reads the file, and nothing else is changed.

Writes `census.json` beside this script. Run from the repository root:

    source ~/Code/kshana-oracles/env.sh
    "$ORACLE_PY" tests/fixtures/embedded_eop_census_astropy_oracle/generate.py
"""

import hashlib
import json
import os
import tempfile

import astropy
import numpy as np
from astropy.utils import iers

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", "..", ".."))
SRC = os.path.join(ROOT, "tools", "finals2000A_2026.txt")


def main():
    raw = open(SRC, "rb").read()
    data_lines = [ln for ln in raw.decode("utf-8").splitlines() if not ln.startswith("#") and ln.strip()]
    with tempfile.TemporaryDirectory(dir=HERE) as td:
        path = os.path.join(td, "finals2000A.data")
        with open(path, "w") as f:
            f.write("\n".join(data_lines) + "\n")
        # `IERS_A.read` parses with the CDS reader below and then combines the A and B
        # columns; the combining step indexes the first `P`-flagged row and raises
        # IndexError on a file that has none. The parse is the same call `IERS_A.read`
        # itself makes (its parent `IERS.read` with the bundled finals2000A ReadMe).
        try:
            t = iers.IERS_A.read(path)
            reader = "astropy.utils.iers.IERS_A.read"
        except IndexError:
            t = iers.IERS.read(path, format="cds", readme=iers.IERS_A_README)
            reader = "astropy.utils.iers.IERS.read(format='cds', readme=IERS_A_README)"

    mjd = np.asarray(t["MJD"].value if hasattr(t["MJD"], "value") else t["MJD"], dtype=float)
    # astropy's CDS reader turns a blank fixed-width field into NaN (QTable columns
    # are Quantities, not masked arrays); a field counts as blank if it is masked or NaN.
    def blank(col):
        vals = np.ma.asarray(getattr(col, "value", col), dtype=float)
        return np.ma.getmaskarray(vals) | np.isnan(np.ma.filled(vals, np.nan))

    b_masked = blank(t["UT1_UTC_B"])
    ut1_a_masked = blank(t["UT1_UTC_A"])
    ut1_flag = [str(x) for x in t["UT1Flag_A"]]
    pm_flag = [str(x) for x in t["PolPMFlag_A"]]

    final_idx = [i for i in range(len(mjd)) if not b_masked[i]]
    pred_idx = [i for i in range(len(mjd)) if b_masked[i] and not ut1_a_masked[i]]

    out = {
        "oracle": reader,
        "astropy_version": astropy.__version__,
        "source_file": "tools/finals2000A_2026.txt",
        "source_sha256": hashlib.sha256(raw).hexdigest(),
        "rows": int(len(mjd)),
        "first_mjd": float(mjd.min()),
        "last_mjd": float(mjd.max()),
        "final_rows": len(final_idx),
        "prediction_rows": len(pred_idx),
        "prediction_first_mjd": float(min(mjd[i] for i in pred_idx)) if pred_idx else None,
        "prediction_last_mjd": float(max(mjd[i] for i in pred_idx)) if pred_idx else None,
        "final_mjds": [float(mjd[i]) for i in final_idx],
        "prediction_mjds": [float(mjd[i]) for i in pred_idx],
        "ut1_flag_census": {f: ut1_flag.count(f) for f in sorted(set(ut1_flag))},
        "pm_flag_census": {f: pm_flag.count(f) for f in sorted(set(pm_flag))},
        "ut1_flag_of_final_rows": sorted({ut1_flag[i] for i in final_idx}),
        "pm_flag_of_final_rows": sorted({pm_flag[i] for i in final_idx}),
        "ut1_flag_of_prediction_rows": sorted({ut1_flag[i] for i in pred_idx}),
        "pm_flag_of_prediction_rows": sorted({pm_flag[i] for i in pred_idx}),
    }
    with open(os.path.join(HERE, "census.json"), "w") as f:
        json.dump(out, f, indent=2, sort_keys=True)
        f.write("\n")
    print(json.dumps(out, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
