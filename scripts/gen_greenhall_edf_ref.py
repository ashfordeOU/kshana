#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write the Greenhall exact-edf fixture pre-registered in
xval/greenhall-edf/PREREGISTRATION.md.

    python3 -m venv /tmp/v && /tmp/v/bin/pip install allantools==2024.6 numpy
    /tmp/v/bin/python -I scripts/gen_greenhall_edf_ref.py tests/fixtures/greenhall_edf

For every grid point allantools.ci.edf_greenhall(alpha, d, m, N, overlapping, modified,
verbose=True) is called; its edf and the case label it prints are recorded,
"not_implemented" where it raises NotImplementedError, or "oracle_error: <exception>" where
it fails otherwise (no oracle value there). No allantools code is copied.
"""
import contextlib
import io
import json
import math
import os
import re
import sys

import allantools
from allantools import ci

ALPHAS = [2, 1, 0, -1, -2, -3, -4]
DS = [1, 2, 3]
NS = [16, 64, 257, 1000, 4096, 100000]
MS = [1, 2, 3, 4, 5, 8, 10, 16, 32, 33, 34, 50, 64, 100, 128, 256, 500, 1000, 2048,
      5000, 10000]


def main(outdir):
    os.makedirs(outdir, exist_ok=True)
    points = []
    for alpha in ALPHAS:
        for d in DS:
            if alpha + 2 * d <= 1:
                continue
            for overlapping in (True, False):
                for modified in (True, False):
                    for N in NS:
                        for m in MS:
                            Fv = 1 if modified else m
                            Sv = m if overlapping else 1
                            L = m / Fv + m * d
                            if L > N:
                                continue
                            M = 1 + math.floor(Sv * (N - L) / m)
                            if M < 1:
                                continue
                            buf = io.StringIO()
                            try:
                                with contextlib.redirect_stdout(buf):
                                    e = ci.edf_greenhall(alpha, d, m, N, overlapping=overlapping,
                                                         modified=modified, verbose=True)
                                label = re.findall(r"case\s+([0-9.]+[ab]?)", buf.getvalue())
                                points.append(dict(alpha=alpha, d=d, m=m, n=N,
                                                   overlapping=overlapping, modified=modified,
                                                   edf=float(e),
                                                   case=label[-1] if label else None))
                            except NotImplementedError:
                                points.append(dict(alpha=alpha, d=d, m=m, n=N,
                                                   overlapping=overlapping, modified=modified,
                                                   edf=None, case="not_implemented"))
                            except Exception as exc:  # an allantools failure: no oracle value
                                points.append(dict(alpha=alpha, d=d, m=m, n=N,
                                                   overlapping=overlapping, modified=modified,
                                                   edf=None,
                                                   case="oracle_error: " + type(exc).__name__))
    ref = {"generator": "scripts/gen_greenhall_edf_ref.py",
           "allantools": allantools.__version__, "points": points}
    with open(os.path.join(outdir, "reference.json"), "w") as f:
        json.dump(ref, f, indent=0)
        f.write("\n")
    labels = sorted({p["case"] for p in points if p["case"]})
    print(len(points), "points; labels:", labels)


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "tests/fixtures/greenhall_edf")
