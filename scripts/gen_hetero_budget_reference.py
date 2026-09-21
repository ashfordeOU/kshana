#!/usr/bin/env python3
"""Independent reference for the R2 heterogeneous-budget algebra
(InternalConsistency). Reproduces the per-source integrity-bias overbound, the
correlated cross-covariance, and the correlated-vs-independent fused bias on a
fixed synthetic source set. This checks the Rust algebra, NOT any accuracy
claim: P2 makes no new accuracy claim (honesty-immune; see NOTICE.md).

Dependency-light on purpose: numpy for the linear algebra, and the stdlib
`statistics.NormalDist` for Phi^-1 (NO scipy). Note that this Phi^-1 and the
Rust `raim::normal_quantile` are DIFFERENT implementations, so the Rust test
compares the *overbound* only to a Phi^-1-realistic tolerance and validates the
cross-covariance / fused-bias *algebra* on the fixture's overbound values.
Run: python3 scripts/gen_hetero_budget_reference.py
"""
import json
import pathlib
from statistics import NormalDist
import numpy as np

_ND = NormalDist()

# Fixed synthetic sources: (U, k_cov, ageing, realizer). Sources 0,1 share
# realizer 1 (e.g. two links both traceable to UTC(USNO)); 2,3 distinct.
sources = [
    (4.0e-9, 2.0, 1.0e-9, 1),
    (3.0e-9, 2.0, 0.5e-9, 1),
    (6.0e-9, 2.0, 0.0, 2),
    (8.0e-9, 2.0, 2.0e-9, 3),
]
TARGET_TAIL = 2.0e-7
RHO = 0.6

def overbound(u, k, age, tail):
    return (u / k) * _ND.inv_cdf(1.0 - tail / 2.0) + age

ob = [overbound(u, k, age, TARGET_TAIL) for (u, k, age, _r) in sources]
realizers = [r for (*_x, r) in sources]
n = len(sources)

sigma = np.zeros((n, n))
for i in range(n):
    for j in range(n):
        if i == j:
            sigma[i, j] = ob[i] ** 2
        elif realizers[i] == realizers[j]:
            sigma[i, j] = RHO * ob[i] * ob[j]

# Inverse-variance-flavoured weights (arbitrary positive, sum to 1).
sig_noise = np.array([2e-9, 3e-9, 5e-9, 8e-9])
w = (1.0 / sig_noise ** 2)
w = w / w.sum()

corr_fused = float(np.sqrt(w @ sigma @ w))
indep_fused = float(np.sqrt(np.sum(w ** 2 * np.diag(sigma))))

out = {
    "target_tail_ir": TARGET_TAIL,
    "rho_common": RHO,
    "sources": [
        {"u": u, "k": k, "age": age, "realizer": r} for (u, k, age, r) in sources
    ],
    "sigma_noise": sig_noise.tolist(),
    "weights": w.tolist(),
    "overbounds": ob,
    "sigma_b": sigma.tolist(),
    "correlated_fused_bias": corr_fused,
    "independent_fused_bias": indep_fused,
}
path = pathlib.Path(__file__).resolve().parents[1] / "tests" / "fixtures" / "hetero_budget" / "reference.json"
path.parent.mkdir(parents=True, exist_ok=True)
path.write_text(json.dumps(out, indent=2) + "\n")
print(f"wrote {path}: corr={corr_fused:.4e} indep={indep_fused:.4e}")
