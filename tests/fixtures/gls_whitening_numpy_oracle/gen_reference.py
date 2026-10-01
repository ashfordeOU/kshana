#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""P2 oracle fixture for the GLS common-mode whitening and the Mahalanobis identity.

numpy 2.3.5 (LAPACK) computes, by its own algorithms:

* the Cholesky factor L of Omega with `numpy.linalg.cholesky` (LAPACK potrf);
* the whitened residual z = L^-1 r with `numpy.linalg.solve(L, r)` (LAPACK gesv);
* the whitening operator L^-1 with `numpy.linalg.inv(L)`;
* the Mahalanobis square r^T Omega^-1 r with `numpy.linalg.solve(Omega, r)`,
  with no Cholesky at all, so the identity z^T z = r^T Omega^-1 r is checked
  against an independent route.

Tolerance, fixed before the first comparison: infinity-norm of the difference
<= 1e-12 times the infinity-norm of the numpy value for L, z and L^-1; relative
1e-12 for the Mahalanobis square.

Run (writes reference.json beside this file):
    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/gls_whitening_numpy_oracle/gen_reference.py
"""
import json
import pathlib

import numpy as np

SEED = 20260930
CASES = 200


def reference(omega, r):
    lo = np.linalg.cholesky(omega)
    z = np.linalg.solve(lo, r)
    linv = np.linalg.inv(lo)
    maha = float(r @ np.linalg.solve(omega, r))
    return {
        "omega": omega.tolist(),
        "residual": r.tolist(),
        "cond": float(np.linalg.cond(omega)),
        "l": lo.tolist(),
        "z": z.tolist(),
        "l_inv": linv.tolist(),
        "mahalanobis_sq": maha,
    }


def main():
    rng = np.random.default_rng(SEED)
    cases = []
    # The 3x3 case of tests/fixtures/gls/reference.json, recomputed here.
    omega0 = np.array([[4.0, 1.5, 0.8], [1.5, 3.0, 0.5], [0.8, 0.5, 2.5]])
    r0 = np.array([1.2, -0.7, 0.4])
    cases.append(reference(omega0, r0))
    for _ in range(CASES):
        n = int(rng.integers(2, 9))
        scale = float(10.0 ** rng.uniform(-2.0, 2.0))
        a = rng.standard_normal((n, n)) * scale
        omega = a @ a.T / n + np.diag(rng.uniform(0.1, 1.0, n) * scale**2)
        omega = 0.5 * (omega + omega.T)  # exactly symmetric in f64
        r = rng.standard_normal(n) * scale
        cases.append(reference(omega, r))
    out = {
        "generator": "tests/fixtures/gls_whitening_numpy_oracle/gen_reference.py",
        "numpy": np.__version__,
        "seed": SEED,
        "tolerance": {"inf_norm_relative": 1e-12, "mahalanobis_relative": 1e-12},
        "cases": cases,
    }
    path = pathlib.Path(__file__).resolve().parent / "reference.json"
    path.write_text(json.dumps(out, indent=1) + "\n")
    conds = [c["cond"] for c in cases]
    print(f"wrote {path}: {len(cases)} cases, cond max {max(conds):.3g}")


if __name__ == "__main__":
    main()
