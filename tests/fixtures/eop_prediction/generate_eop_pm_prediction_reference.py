#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external EOP polar-motion-prediction reference.

The oracle is an **independent NumPy re-implementation** of the persistence
polar-motion prediction-error statistics, run over the SAME verbatim IERS
``finals2000A`` rows that Kshana's ``frame_eop::pm_prediction_error_vs_horizon``
reads. It re-parses the fixed-width Bulletin A / Bulletin B polar-motion columns
with Python string slicing and recomputes RMS / nearest-rank percentiles with
NumPy along a different code path, in a different language. If the Rust parser
sliced the wrong pole columns, mis-paired the day-apart samples, dropped the
square in the RMS, or used a different percentile rule, the two would disagree.

The reference DATA is real: the input rows are lifted byte-for-byte from the
official IERS product (see the fixture header for provenance), so the recovered
pole final floor and multi-day growth are measured quantities. The CHOICE of
persistence as the predictor is the honestly-Modelled part.

Definitions (identical to src/frame_eop.rs pm_prediction_error_vs_horizon):
  * truth pole of a day = final Bulletin B pole if present, else rapid Bulletin A.
  * horizon "final"     = |rapid A pole - final B pole| magnitude over paired rows.
  * horizon "d<h>"      = |truth(t) - truth(t+h)| pole-displacement magnitude,
                          sqrt(dx^2+dy^2), over the real daily series.
  * rms_as  = sqrt(mean(resid^2))  [arc seconds]
  * p50_as  = nearest-rank 50th pct of |resid| (rank = ceil(0.50*n), 1-indexed)
  * p95_as  = nearest-rank 95th pct of |resid| (rank = ceil(0.95*n), 1-indexed)
  * max_as  = max(|resid|)

Column map (0-indexed slices, per IERS readme.finals2000A and src/eop.rs):
  MJD [7..15], rapid PM-x [18..27], rapid PM-y [37..46],
  final Bulletin B PM-x [134..144], final Bulletin B PM-y [144..154].

Reproduce (offline, no Kshana code involved):

    python3 generate_eop_pm_prediction_reference.py \
        ../agency/eop/finals2000A_2026.txt > eop_pm_prediction_reference.csv

Generated with Python 3 + NumPy.
"""

import math
import sys

import numpy as np


def parse_pm(body):
    """(mjd, rapid_x, rapid_y, (final_x, final_y)|None) per row."""
    out = []
    for line in body.splitlines():
        if len(line) < 68 or line.lstrip().startswith("#"):
            continue
        try:
            mjd = float(line[7:15].strip())
            xa = float(line[18:27].strip())
            ya = float(line[37:46].strip())
        except ValueError:
            continue
        xb = line[134:144].strip() if len(line) >= 144 else ""
        yb = line[144:154].strip() if len(line) >= 154 else ""
        try:
            fb = (float(xb), float(yb)) if xb != "" and yb != "" else None
        except ValueError:
            fb = None
        out.append((mjd, xa, ya, fb))
    out.sort(key=lambda r: r[0])
    return out


def truth(rec):
    _, xa, ya, fb = rec
    return fb if fb is not None else (xa, ya)


def nearest_rank(sorted_abs, p):
    n = len(sorted_abs)
    if n == 0:
        return 0.0
    rank = max(1, min(int(np.ceil(p * n)), n))
    return float(sorted_abs[rank - 1])


def stats(label, resid):
    resid = np.abs(np.asarray(resid, dtype=np.float64))
    n = resid.size
    if n == 0:
        return None
    rms = float(np.sqrt(np.mean(resid**2)))
    s = np.sort(resid)
    return (label, n, rms, nearest_rank(s, 0.50), nearest_rank(s, 0.95), float(s[-1]))


def final_floor(daily):
    resid = [
        math.hypot(xa - fb[0], ya - fb[1]) for (_, xa, ya, fb) in daily if fb is not None
    ]
    return stats("final", resid)


def days_horizon(daily, h):
    by_mjd = {rec[0]: rec for rec in daily}
    resid = []
    for rec in daily:
        tgt = by_mjd.get(rec[0] + h)
        if tgt is not None:
            (bx, by) = truth(rec)
            (tx, ty) = truth(tgt)
            resid.append(math.hypot(bx - tx, by - ty))
    return stats("d%d" % h, resid)


def main():
    path = sys.argv[1] if len(sys.argv) > 1 else "../agency/eop/finals2000A_2026.txt"
    with open(path, "r") as f:
        daily = parse_pm(f.read())

    rows = []
    ff = final_floor(daily)
    if ff:
        rows.append(ff)
    for h in (1, 2, 3, 5, 10):
        r = days_horizon(daily, h)
        if r:
            rows.append(r)

    print("# EOP persistence POLAR-MOTION-prediction-error reference (independent NumPy oracle).")
    print("# Input rows: verbatim IERS finals2000A 2026 slice (see fixture header for provenance).")
    print("# horizon=final -> |rapid A pole - final B pole| magnitude; horizon=d<h> ->")
    print("# persistence pole-displacement magnitude sqrt(dx^2+dy^2) over the real daily series.")
    print("# All *_as columns are in ARC SECONDS. Definitions match src/frame_eop.rs pm_prediction_error_vs_horizon.")
    print("horizon;n;rms_as;p50_as;p95_as;max_as")
    for label, n, rms, p50, p95, mx in rows:
        print("%s;%d;%.17g;%.17g;%.17g;%.17g" % (label, n, rms, p50, p95, mx))


if __name__ == "__main__":
    main()
