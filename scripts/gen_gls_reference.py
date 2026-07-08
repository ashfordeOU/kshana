#!/usr/bin/env python3
"""Independent numpy reference for the R3 GLS common-mode algebra
(InternalConsistency). Reproduces the whitened Mahalanobis square and the
common-mode consistency statistic on a fixed Ω/residual pair via numpy's own
Cholesky + solve (an independent implementation from the hand-rolled Rust one).
Checks the Rust algebra, NOT an accuracy claim (honesty-immune; see NOTICE.md).
numpy only, NO scipy. Run: python3 scripts/gen_gls_reference.py
"""
import json
import pathlib
import numpy as np

omega = np.array([
    [4.0, 1.5, 0.8],
    [1.5, 3.0, 0.5],
    [0.8, 0.5, 2.5],
])
r = np.array([1.2, -0.7, 0.4])

# numpy Cholesky (lower) + solve, independent of the Rust hand-rolled factor.
_L = np.linalg.cholesky(omega)
omega_inv_r = np.linalg.solve(omega, r)
mahalanobis_sq = float(r @ omega_inv_r)

ones = np.ones(omega.shape[0])
omega_inv_1 = np.linalg.solve(omega, ones)
s11 = float(ones @ omega_inv_1)
s1r = float(ones @ omega_inv_r)
cm_stat = float(s1r * s1r / s11)

out = {
    "omega": omega.tolist(),
    "residual": r.tolist(),
    "mahalanobis_sq": mahalanobis_sq,
    "one_omega_inv_one": s11,
    "one_omega_inv_r": s1r,
    "common_mode_statistic": cm_stat,
}
path = pathlib.Path(__file__).resolve().parents[1] / "tests" / "fixtures" / "gls" / "reference.json"
path.parent.mkdir(parents=True, exist_ok=True)
path.write_text(json.dumps(out, indent=2) + "\n")
print(f"wrote {path}: maha={mahalanobis_sq:.6f} cm={cm_stat:.6f}")
