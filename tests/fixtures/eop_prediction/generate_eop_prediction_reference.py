#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external EOP-prediction reference in ``eop_prediction_reference.csv``.

The oracle is an **independent NumPy re-implementation** of the persistence UT1
prediction-error statistics, run over the SAME verbatim IERS ``finals2000A``
rows that Kshana's ``frame_eop::prediction_error_vs_horizon`` reads. It is a
genuine cross-check of the Rust column parsing and statistical reduction, not a
self-consistency check: this script re-parses the fixed-width columns with
Python string slicing and recomputes RMS / nearest-rank percentiles with NumPy
along a different code path, in a different language. If the Rust parser sliced
the wrong columns, mis-paired the day-apart samples, dropped the final square in
the RMS, or used a different percentile rule, the two would disagree.

The reference data itself is REAL: the input rows are lifted byte-for-byte from
the official IERS product (see the fixture header for provenance), so the
recovered final floor and multi-day growth are measured quantities, not model
outputs. The *choice* of persistence as the predictor is the honestly-Modelled
part (Kshana does not reproduce IERS's operational least-squares/AR Bulletin A
algorithm); its ERROR, however, is a real measured curve.

Definitions (identical to src/frame_eop.rs, re-implemented here):
  * truth UT1 of a day  = final Bulletin B value if present, else rapid Bulletin A.
  * Horizon "final"     = |rapid Bulletin A - final Bulletin B| over every paired row.
  * Horizon "d<h>"      = |truth(t) - truth(t+h)| over every pair of days exactly
                          h apart on the integer-MJD grid (persistence predictor
                          UT1(t+h)=UT1(t)).
  * rms_s   = sqrt(mean(resid^2))
  * p50_s   = nearest-rank 50th percentile of |resid| (rank = ceil(0.50*n), 1-indexed)
  * p95_s   = nearest-rank 95th percentile of |resid| (rank = ceil(0.95*n), 1-indexed)
  * max_s   = max(|resid|)

Column map (0-indexed slices, per IERS readme.finals2000A and src/eop.rs):
  MJD [7..15], rapid UT1-UTC [58..68], final Bulletin B UT1-UTC [154..165],
  rapid PM-x [18..27], rapid PM-y [37..46],
  final Bulletin B PM-x [134..144], final Bulletin B PM-y [144..154].

Polar-motion horizons (arc seconds), same construction as UT1:
  * pm-final = |rapid A pole - final B pole| magnitude sqrt(dx^2+dy^2) per row.
  * pm-d<h>  = persistence pole-displacement magnitude over h days.
These populate the eop_pm_prediction_reference.csv sibling.

Reproduce (offline, no Kshana code involved):

    python3 generate_eop_prediction_reference.py \
        ../agency/eop/finals2000A_2022001_longspan.txt > eop_prediction_reference.csv

Generated with Python 3 + NumPy (numpy 2.0.2 used for the committed CSV).
"""

import sys
import numpy as np


def parse_daily(body):
    """Re-parse the fixed-width finals2000A rows: (mjd, rapid_s, final_s|None)."""
    out = []
    for line in body.splitlines():
        if len(line) < 68 or line.lstrip().startswith("#"):
            continue
        try:
            mjd = float(line[7:15].strip())
            rapid = float(line[58:68].strip())
        except ValueError:
            continue
        final_str = line[154:165].strip() if len(line) >= 165 else ""
        try:
            final = float(final_str) if final_str != "" else None
        except ValueError:
            final = None
        out.append((mjd, rapid, final))
    out.sort(key=lambda r: r[0])
    return out


def truth(rec):
    _, rapid, final = rec
    return final if final is not None else rapid


def nearest_rank(sorted_abs, p):
    """Nearest-rank percentile of an ascending array. rank = ceil(p*n), 1-indexed."""
    n = len(sorted_abs)
    if n == 0:
        return 0.0
    rank = int(np.ceil(p * n))
    rank = max(1, min(rank, n))
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
    resid = [abs(rapid - final) for (_, rapid, final) in daily if final is not None]
    return stats("final", resid)


def days_horizon(daily, h):
    by_mjd = {rec[0]: rec for rec in daily}
    resid = []
    for rec in daily:
        base_mjd = rec[0]
        tgt = by_mjd.get(base_mjd + h)
        if tgt is not None:
            resid.append(abs(truth(rec) - truth(tgt)))
    return stats("d%d" % h, resid)


def main():
    path = sys.argv[1] if len(sys.argv) > 1 else (
        "../agency/eop/finals2000A_2022001_longspan.txt")
    with open(path, "r") as f:
        daily = parse_daily(f.read())

    rows = []
    ff = final_floor(daily)
    if ff:
        rows.append(ff)
    for h in (1, 2, 3, 5, 10):
        r = days_horizon(daily, h)
        if r:
            rows.append(r)

    print("# EOP persistence UT1-prediction-error reference (independent NumPy oracle).")
    print("# Input rows: verbatim IERS finals2000A (see fixture header for provenance).")
    print("# horizon=final -> |rapid Bulletin A - final Bulletin B|; horizon=d<h> ->")
    print("# persistence residual |truth(t)-truth(t+h)| over the real daily series.")
    print("# All *_s columns are in SECONDS. Definitions match src/frame_eop.rs.")
    print("horizon;n;rms_s;p50_s;p95_s;max_s")
    for label, n, rms, p50, p95, mx in rows:
        # 17 significant digits round-trips f64 exactly.
        print("%s;%d;%.17g;%.17g;%.17g;%.17g" % (label, n, rms, p50, p95, mx))


if __name__ == "__main__":
    main()
