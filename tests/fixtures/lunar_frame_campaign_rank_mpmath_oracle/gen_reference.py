# SPDX-License-Identifier: AGPL-3.0-only
"""Extended-precision (mpmath, 50 digits) oracle for tests/lunar_frame_campaign_rank_mpmath_oracle.rs.

Reads the engine's committed inputs (never an engine output) and writes, per day, the exact
eigenvalues of the station block F_ss and, when F_ss is not exactly singular, the exact
eigenpairs of the Helmert information matrix H with the ingredients of the pre-registered error
bounds. The rank decisions themselves are made in the Rust test. The matrix helpers and the
definitions of a_F, a_S, a_H and Zt are those of the companion oracle
../lunar_frame_campaign_mpmath_oracle/gen_reference.py, imported unchanged.

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
    fabs = mp.matrix(n, n)
    for p in range(n):
        for q in range(n):
            f[p, q] = mp.fsum(w[i] * jac[i, p] * jac[i, q] for i in range(m))
            fabs[p, q] = mp.fsum(w[i] * abs(jac[i, p]) * abs(jac[i, q]) for i in range(m))
    out = {"n": n, "m": m, "a_F": norm2_sym(fabs)}

    f_ss = block(f, 0, 0, s, s)
    f_sb = block(f, 0, s, s, nb)
    f_bb = block(f, s, s, nb, nb)
    mu, vs = sym_eig_sorted(f_ss)
    out["station_eigenvalues"] = mu
    if min(abs(x) for x in mu) <= mpf("1e-40") * max(abs(x) for x in mu):
        # Exactly singular station block (a station with no observation): no Schur complement.
        out["station_block_exactly_singular"] = True
        return out
    out["station_block_exactly_singular"] = False

    x = solve_columns(f_ss, f_sb)
    schur = f_bb - f_sb.T * x
    q = mp.matrix(s, s)
    for lam, v in zip(mu, vs):
        for i in range(s):
            for j in range(s):
                q[i, j] += abs(v[i]) * abs(v[j]) / lam
    out["a_S"] = norm2_sym(absm(f_bb) + absm(f_sb).T * q * absm(f_sb))
    zt_top = -(x * a)
    zt = mp.matrix(n, 7)
    for i in range(s):
        for j in range(7):
            zt[i, j] = zt_top[i, j]
    for i in range(nb):
        for j in range(7):
            zt[s + i, j] = a[i, j]
    h = a.T * schur * a
    out["a_H"] = norm2_sym(absm(a).T * absm(schur) * absm(a))
    lam, vecs = sym_eig_sorted(h)
    out["helmert_eigen"] = [
        {"lambda": l, "zt_v_sq": sq_norm(matvec(zt, v)), "a_v_sq": sq_norm(matvec(a, v))}
        for l, v in zip(lam, vecs)
    ]
    return out


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
    days = []
    for sc in inputs["scenarios"]:
        mp.dps = DIGITS
        r50 = compute(sc)
        mp.dps = CHECK_DIGITS
        r80 = compute(sc)
        mp.dps = DIGITS
        a50, a80 = [], []
        flatten(r50, a50)
        flatten(r80, a80)
        assert len(a50) == len(a80)
        # Eigenvalues of an exactly singular block are zero up to the working precision; they
        # are compared absolutely against the largest, every other quantity relatively.
        scale = max(abs(x) for x in a80)
        worst = mpf(0)
        for x, y in zip(a50, a80):
            d = abs(x - y) / abs(y) if abs(y) > mpf("1e-40") * scale else abs(x - y) / scale
            worst = max(worst, d)
        if not worst <= SELF_AGREEMENT:
            sys.exit(f"{sc['name']}: 50 vs 80 digits disagree by {mpmath.nstr(worst, 5)}")
        entry = {"name": sc["name"]}
        entry.update(to_json(r50))
        entry["self_agreement_50_vs_80_digits"] = float(worst)
        days.append(entry)
    doc = {
        "generator": "tests/fixtures/lunar_frame_campaign_rank_mpmath_oracle/gen_reference.py",
        "oracle": f"mpmath {mpmath.__version__} at {DIGITS} digits (checked at {CHECK_DIGITS})",
        "scenarios": days,
    }
    print(json.dumps(doc, indent=1))


if __name__ == "__main__":
    main()
