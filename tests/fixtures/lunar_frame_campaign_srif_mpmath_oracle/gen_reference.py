# SPDX-License-Identifier: AGPL-3.0-only
"""Extended-precision (mpmath, 50 digits) oracle for tests/lunar_frame_campaign_srif_mpmath_oracle.rs.

Reads the engine's committed inputs (never an engine output). Reuses, unchanged, the exact
datum computation of ../lunar_frame_campaign_mpmath_oracle/gen_reference.py (F, S by LU solve,
H, C = H^-1, Zt, eigen-decomposition by mpmath.eigsy) and adds the ingredients of the
square-root-form bar: trace F, trace H, ||Zt C e_k||, ||C e_k||, R_H as the Cholesky factor of the
exact H (mpmath.cholesky, transposed to upper), X = R_H^-1 and the row term
||row k of |X||R_H||X| || / ||row k of X||, ||Zt v|| for the extreme eigenvectors, and ||Zt||_2.
The whole computation is repeated at 80 digits; every recorded quantity must agree to 1e-30.

Tools: mpmath 1.3.0 (BSD-3-Clause), in $ORACLE_PY of ~/Code/kshana-oracles/env.sh.

    $ORACLE_PY gen_reference.py inputs.json > reference.json
"""

import json
import os
import sys

import mpmath
from mpmath import mp, mpf

sys.path.insert(
    0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "lunar_frame_campaign_mpmath_oracle")
)
from gen_reference import (  # noqa: E402
    absm,
    block,
    col,
    mat,
    matvec,
    norm2_sym,
    solve_columns,
    sq_norm,
    sym_eig_sorted,
)

DIGITS = 50
CHECK_DIGITS = 80
SELF_AGREEMENT = mpf("1e-30")


def compute(sc):
    jac = mat(sc["engine_jacobian"])
    w = [mpf(x) for x in sc["weights"]]
    a = mat(sc["helmert_design"])
    s = int(sc["n_station_columns"])
    m, n = jac.rows, jac.cols
    nb = n - s

    f = mp.matrix(n, n)
    for p in range(n):
        for q in range(n):
            f[p, q] = mp.fsum(w[i] * jac[i, p] * jac[i, q] for i in range(m))
    f_bb = block(f, s, s, nb, nb)
    if s > 0:
        f_ss = block(f, 0, 0, s, s)
        f_sb = block(f, 0, s, s, nb)
        x = solve_columns(f_ss, f_sb)
        schur = f_bb - f_sb.T * x
        zt_top = -(x * a)
    else:
        schur = f_bb
        zt_top = None
    zt = mp.matrix(n, 7)
    for i in range(s):
        for j in range(7):
            zt[i, j] = zt_top[i, j]
    for i in range(nb):
        for j in range(7):
            zt[s + i, j] = a[i, j]

    h = a.T * schur * a
    c = mp.inverse(h)
    lower = mp.cholesky(h)
    r_h = lower.T
    x_inv = mp.inverse(r_h)
    tri = absm(x_inv) * absm(r_h) * absm(x_inv)

    sigma, zt_ce, ce, tri_term = [], [], [], []
    for k in range(7):
        ck = col(c, k)
        sigma.append(mp.sqrt(c[k, k]))
        zt_ce.append(mp.sqrt(sq_norm(matvec(zt, ck))))
        ce.append(mp.sqrt(sq_norm(ck)))
        xrow = [x_inv[k, j] for j in range(7)]
        trow = [tri[k, j] for j in range(7)]
        tri_term.append(mp.sqrt(sq_norm(trow)) / mp.sqrt(sq_norm(xrow)))

    lam, vecs = sym_eig_sorted(h)
    weakest = list(vecs[0])
    pivot = max(range(7), key=lambda i: abs(weakest[i]))
    if weakest[pivot] < 0:
        weakest = [-v for v in weakest]

    def eig_entry(i):
        return {"lambda": lam[i], "zt_v_norm": mp.sqrt(sq_norm(matvec(zt, vecs[i])))}

    return {
        "n": n,
        "m": m,
        "sigma": sigma,
        "condition": lam[-1] / lam[0],
        "eigenvalues": lam,
        "weakest_direction": weakest,
        "trace_F": mp.fsum(f[i, i] for i in range(n)),
        "trace_H": mp.fsum(h[i, i] for i in range(7)),
        "zt_c_e_norm": zt_ce,
        "c_e_norm": ce,
        "triangular_inverse_term": tri_term,
        "lambda_min": eig_entry(0),
        "lambda_max": eig_entry(6),
        "eigengap_lambda2_minus_lambda1": lam[1] - lam[0],
        "zt_norm": mp.sqrt(norm2_sym(zt.T * zt)),
    }


def flatten(v, acc):
    if isinstance(v, dict):
        for k in sorted(v):
            flatten(v[k], acc)
    elif isinstance(v, list):
        for x in v:
            flatten(x, acc)
    elif isinstance(v, mpf):
        acc.append(v)


def to_json(v):
    if isinstance(v, dict):
        return {k: to_json(x) for k, x in v.items()}
    if isinstance(v, list):
        return [to_json(x) for x in v]
    if isinstance(v, mpf):
        return float(v)
    return v


def main():
    inputs = json.load(open(sys.argv[1]))
    out = []
    for sc in inputs["scenarios"]:
        mp.dps = DIGITS
        r50 = compute(sc)
        mp.dps = CHECK_DIGITS
        r80 = compute(sc)
        mp.dps = DIGITS
        # The weakest direction as a direction (chord between sign-pinned unit vectors), every
        # other quantity relatively.
        worst = mp.sqrt(
            mp.fsum((x - y) ** 2 for x, y in zip(r50["weakest_direction"], r80["weakest_direction"]))
        )
        a50, a80 = [], []
        flatten({k: v for k, v in r50.items() if k != "weakest_direction"}, a50)
        flatten({k: v for k, v in r80.items() if k != "weakest_direction"}, a80)
        assert len(a50) == len(a80)
        for x, y in zip(a50, a80):
            worst = max(worst, abs(x - y) / abs(y) if y != 0 else abs(x - y))
        if not worst <= SELF_AGREEMENT:
            sys.exit(f"{sc['name']}: 50 vs 80 digits disagree by {mpmath.nstr(worst, 5)}")
        entry = {"name": sc["name"]}
        entry.update(to_json(r50))
        entry["self_agreement_50_vs_80_digits"] = float(worst)
        out.append(entry)
    doc = {
        "generator": "tests/fixtures/lunar_frame_campaign_srif_mpmath_oracle/gen_reference.py",
        "oracle": f"mpmath {mpmath.__version__} at {DIGITS} digits (checked at {CHECK_DIGITS})",
        "scenarios": out,
    }
    print(json.dumps(doc, indent=1))


if __name__ == "__main__":
    main()
