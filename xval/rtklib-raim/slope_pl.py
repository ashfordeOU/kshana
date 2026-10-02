#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Slope protection levels for tests/integrity_snapshot_raim_rtklib_oracle.rs (Kshana
cross-validation driver).

Reads the fault-free cases of rtklib_raim_cases.csv (slopes formed by the RTKLIB harness with
RTKLIB's matmul/matinv/xyz2enu) and evaluates HPL/VPL = max slope * sqrt(lambda) * sigma, with
lambda from SciPy: ncx2.cdf(chi2.ppf(1 - P_fa, n - 4), n - 4, lambda) = P_md, solved by brentq.
Also writes the exact chi-squared quantile chi2.ppf(1 - P_fa, dof) for every degree of freedom
that occurs, for the pre-registered ambiguity band.

Usage: $ORACLE_PY slope_pl.py <fixture dir>
"""
import csv
import math
import sys

import scipy
from scipy.optimize import brentq
from scipy.stats import chi2, ncx2

P_FA = 1e-3
P_MD = 1e-3
SIGMA2 = 35.09

d = sys.argv[1]
rows = list(csv.DictReader(open(f"{d}/rtklib_raim_cases.csv")))
lam_cache = {}


def lam(dof):
    if dof not in lam_cache:
        t = chi2.ppf(1.0 - P_FA, dof)
        lam_cache[dof] = brentq(lambda x: ncx2.cdf(t, dof, x) - P_MD, 1e-6, 1e4, xtol=1e-14, rtol=1e-15)
    return lam_cache[dof]


with open(f"{d}/scipy_slope_pl.csv", "w") as f:
    f.write("epoch,n,hpl_m,vpl_m\n")
    for r in rows:
        if r["case"] != "0":
            continue
        n = int(r["n"])
        k = math.sqrt(lam(n - 4)) * math.sqrt(SIGMA2)
        f.write(f"{r['epoch']},{n},{float(float(r['slope_h']) * k)!r},{float(float(r['slope_v']) * k)!r}\n")
with open(f"{d}/scipy_chi2_quantile.csv", "w") as f:
    f.write("dof,chi2_ppf\n")
    for dof in range(1, 31):
        f.write(f"{dof},{float(chi2.ppf(1.0 - P_FA, dof))!r}\n")
print("scipy", scipy.__version__, "dofs", sorted(lam_cache))
