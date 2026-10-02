#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""P2 oracle fixture for the GLS (generalised least squares) common-mode consistency statistic.

numpy (LAPACK, the Linear Algebra PACKage) computes, by its own algorithm,
    s = (1^T Omega^-1 r)^2 / (1^T Omega^-1 1)
with `numpy.linalg.solve` (LAPACK gesv: LU with partial pivoting, no Cholesky).
Per case it also records cond_2(Omega) (`numpy.linalg.cond`) and the whitened cosine
cos_w = (1^T Omega^-1 r) / sqrt((1^T Omega^-1 1)(r^T Omega^-1 r)).

Tiers (see tests/gls_common_mode_statistic_numpy_oracle.rs for the pre-registered rules):
  0  the 3x3 case of tests/fixtures/gls/reference.json
  A  200 well-conditioned SPD cases (cond <= 100), |cos_w| >= 0.1
  C  20 common-mode shifts r' = r + sign(a) 3 / sqrt(c) 1 of the first 20 Tier-A cases
  B  40 ill-conditioned SPD cases (30 Q diag Q^T with cond in [1e3, 1e8], 10 shared-reference
     diag(s^2) + rho s s^T with rho in [0.999, 0.9999999]), |cos_w| >= 0.1

Run (writes reference.json beside this file):
    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/gls_common_mode_statistic_numpy_oracle/gen_reference.py
"""
import json
import pathlib

import numpy as np

SEED = 20261001
COS_MIN = 0.1


def oracle(omega, r):
    ones = np.ones(len(r))
    x1 = np.linalg.solve(omega, ones)
    xr = np.linalg.solve(omega, r)
    a = float(ones @ xr)
    c = float(ones @ x1)
    q = float(r @ xr)
    return a, c, q


def case(tier, omega, r, **extra):
    a, c, q = oracle(omega, r)
    out = {
        "tier": tier,
        "omega": omega.tolist(),
        "residual": r.tolist(),
        "cond": float(np.linalg.cond(omega)),
        "cos_w": a / np.sqrt(c * q),
        "statistic": a * a / c,
    }
    out.update(extra)
    return out


def symmetric(m):
    return 0.5 * (m + m.T)  # exactly symmetric in f64


def well_conditioned(rng):
    while True:
        n = int(rng.integers(2, 9))
        scale = float(10.0 ** rng.uniform(-2.0, 2.0))
        a = rng.standard_normal((n, n)) * scale
        omega = symmetric(a @ a.T / n + np.diag(rng.uniform(0.1, 1.0, n) * scale**2))
        if np.linalg.cond(omega) <= 100.0:
            return omega, scale


def residual(rng, omega, scale):
    n = omega.shape[0]
    while True:
        r = rng.standard_normal(n) * scale
        a, c, q = oracle(omega, r)
        if abs(a / np.sqrt(c * q)) >= COS_MIN:
            return r


def ill_conditioned(rng, k):
    n = int(rng.integers(2, 9))
    scale = float(10.0 ** rng.uniform(-2.0, 2.0))
    if k < 30:
        q, _ = np.linalg.qr(rng.standard_normal((n, n)))
        target = 10.0 ** rng.uniform(3.0, 8.0)
        lam = np.logspace(0.0, -np.log10(target), n) * scale**2
        rng.shuffle(lam)
        omega = symmetric(q @ np.diag(lam) @ q.T)
    else:
        s = rng.uniform(0.5, 2.0, n) * scale
        rho = 1.0 - 10.0 ** rng.uniform(-7.0, -3.0)
        omega = symmetric(np.diag(s**2) * (1.0 - rho) + rho * np.outer(s, s))
    np.linalg.cholesky(omega)  # must be SPD
    return omega, scale


def main():
    rng = np.random.default_rng(SEED)
    cases = []
    omega0 = np.array([[4.0, 1.5, 0.8], [1.5, 3.0, 0.5], [0.8, 0.5, 2.5]])
    r0 = np.array([1.2, -0.7, 0.4])
    cases.append(case("0", omega0, r0))
    tier_a = []
    for _ in range(200):
        omega, scale = well_conditioned(rng)
        r = residual(rng, omega, scale)
        tier_a.append(len(cases))
        cases.append(case("A", omega, r))
    for idx in tier_a[:20]:
        omega = np.array(cases[idx]["omega"])
        r = np.array(cases[idx]["residual"])
        a, c, _ = oracle(omega, r)
        mu = np.sign(a) * 3.0 / np.sqrt(c)
        shifted = r + mu
        cc = case("C", omega, shifted, shift_of=idx, mu=float(mu))
        assert abs(cc["cos_w"]) >= COS_MIN and cc["statistic"] >= 9.0 * (1 - 1e-12)
        cases.append(cc)
    for k in range(40):
        omega, scale = ill_conditioned(rng, k)
        r = residual(rng, omega, scale)
        cases.append(case("B", omega, r))
    out = {
        "generator": "tests/fixtures/gls_common_mode_statistic_numpy_oracle/gen_reference.py",
        "numpy": np.__version__,
        "seed": SEED,
        "oracle": "numpy.linalg.solve (LAPACK gesv)",
        "cases": cases,
    }
    path = pathlib.Path(__file__).resolve().parent / "reference.json"
    path.write_text(json.dumps(out, indent=1) + "\n")
    conds_a = [c["cond"] for c in cases if c["tier"] in "0AC"]
    conds_b = [c["cond"] for c in cases if c["tier"] == "B"]
    print(
        f"wrote {path}: {len(cases)} cases; cond max (0/A/C) {max(conds_a):.3g}; "
        f"tier B cond {min(conds_b):.3g}..{max(conds_b):.3g}"
    )


if __name__ == "__main__":
    main()
