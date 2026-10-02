# SPDX-License-Identifier: AGPL-3.0-only
"""Extended-precision (mpmath, 50 digits) oracle for tests/lunar_frame_campaign_mpmath_oracle.rs.

Reads the engine's committed inputs (Jacobian, weights, station-column count, Helmert design),
never an engine output, and writes reference.json with, per scenario:

* the datum covariance quantities: the seven sigmas sqrt(C_kk) with C = H^-1, H = A^T S A,
  S the Schur complement of the station block of F = J^T W J; the condition number of H; the
  weakest direction (eigenvector of the smallest eigenvalue, largest-magnitude component made
  positive);
* the ingredients of the pre-registered bar (a_F, a_S, a_H, w_F, w_S, w_H, and the eigenvalue and
  eigengap sensitivities), all evaluated exactly;
* a self-check: the whole computation is repeated at 80 digits and every recorded quantity must
  agree to 1e-30 relative, else nothing is written;
* a diagnostic, not asserted by the test: the error of four NumPy double-precision routes against
  the 50-digit sigmas.

Tools: mpmath 1.3.0 and NumPy 2.3.5 (both BSD-3-Clause), in $ORACLE_PY of
~/Code/kshana-oracles/env.sh. Run as a separate program; nothing is linked into kshana.

    $ORACLE_PY gen_reference.py inputs.json > reference.json
"""

import json
import sys

import mpmath
import numpy as np
from mpmath import mp, mpf

DIGITS = 50
CHECK_DIGITS = 80
SELF_AGREEMENT = mpf("1e-30")


def mat(rows):
    return mp.matrix([[mpf(x) for x in r] for r in rows])


def sym_eig_sorted(m):
    """Eigenvalues ascending and unit eigenvectors (columns) of a symmetric matrix (Jacobi)."""
    e, q = mp.eigsy(m)
    order = sorted(range(len(e)), key=lambda i: e[i])
    vals = [e[i] for i in order]
    vecs = [[q[r, i] for r in range(m.rows)] for i in order]
    return vals, vecs


def norm2_sym(m):
    """Spectral norm of a symmetric matrix."""
    vals, _ = sym_eig_sorted(m)
    return max(abs(v) for v in vals)


def absm(m):
    out = mp.matrix(m.rows, m.cols)
    for i in range(m.rows):
        for j in range(m.cols):
            out[i, j] = abs(m[i, j])
    return out


def block(m, r0, c0, rows, cols):
    out = mp.matrix(rows, cols)
    for i in range(rows):
        for j in range(cols):
            out[i, j] = m[r0 + i, c0 + j]
    return out


def sq_norm(v):
    return mp.fsum(x * x for x in v)


def col(m, k):
    return [m[i, k] for i in range(m.rows)]


def matvec(m, v):
    return [mp.fsum(m[i, j] * v[j] for j in range(m.cols)) for i in range(m.rows)]


def solve_columns(a, b):
    """a^-1 b, one LU solve (mpmath.lu_solve) per column of b."""
    out = mp.matrix(b.rows, b.cols)
    for j in range(b.cols):
        x = mpmath.lu_solve(a, mp.matrix(col(b, j)))
        for i in range(b.rows):
            out[i, j] = x[i]
    return out


def compute(sc):
    """Every recorded quantity of one scenario, as mpf, at the current precision."""
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

    f_bb = block(f, s, s, nb, nb)
    if s > 0:
        f_ss = block(f, 0, 0, s, s)
        f_sb = block(f, 0, s, s, nb)
        x = solve_columns(f_ss, f_sb)  # F_ss^-1 F_sb
        schur = f_bb - f_sb.T * x
        mu, vs = sym_eig_sorted(f_ss)
        q = mp.matrix(s, s)
        for lam, v in zip(mu, vs):
            for i in range(s):
                for j in range(s):
                    q[i, j] += abs(v[i]) * abs(v[j]) / lam
        a_s = norm2_sym(absm(f_bb) + absm(f_sb).T * q * absm(f_sb))
        zt_top = -(x * a)
    else:
        schur = f_bb
        a_s = norm2_sym(absm(f_bb))
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
    a_f = norm2_sym(fabs)
    a_h = norm2_sym(absm(a).T * absm(schur) * absm(a))

    sigma, w_f, w_s, w_h = [], [], [], []
    for k in range(7):
        ck = col(c, k)
        ckk = c[k, k]
        sigma.append(mp.sqrt(ckk))
        w_f.append(sq_norm(matvec(zt, ck)) / ckk)
        w_s.append(sq_norm(matvec(a, ck)) / ckk)
        w_h.append(sq_norm(ck) / ckk)

    lam, vecs = sym_eig_sorted(h)
    weakest = list(vecs[0])
    pivot = max(range(7), key=lambda i: abs(weakest[i]))
    if weakest[pivot] < 0:
        weakest = [-v for v in weakest]

    def eig_entry(i):
        v = vecs[i]
        return {
            "lambda": lam[i],
            "zt_v_sq": sq_norm(matvec(zt, v)),
            "a_v_sq": sq_norm(matvec(a, v)),
        }

    return {
        "n": n,
        "m": m,
        "s": s,
        "sigma": sigma,
        "condition": lam[-1] / lam[0],
        "eigenvalues": lam,
        "weakest_direction": weakest,
        "a_F": a_f,
        "a_S": a_s,
        "a_H": a_h,
        "w_F": w_f,
        "w_S": w_s,
        "w_H": w_h,
        "lambda_min": eig_entry(0),
        "lambda_max": eig_entry(6),
        "eigengap_lambda2_minus_lambda1": lam[1] - lam[0],
        "zt_norm_sq": norm2_sym(zt.T * zt),
        "a_norm_sq": norm2_sym(a.T * a),
        "joint_condition": (lambda ev: max(ev) / min(ev))(sym_eig_sorted(f)[0]),
    }


def flatten(v, out):
    if isinstance(v, dict):
        for k in sorted(v):
            flatten(v[k], out)
    elif isinstance(v, list):
        for x in v:
            flatten(x, out)
    elif isinstance(v, mpf):
        out.append(v)


def to_json(v):
    if isinstance(v, dict):
        return {k: to_json(x) for k, x in v.items()}
    if isinstance(v, list):
        return [to_json(x) for x in v]
    if isinstance(v, mpf):
        return float(v)
    return v


def numpy_routes(sc, sigma_ref):
    """Diagnostic: the largest relative sigma error of four double-precision NumPy routes."""
    jac = np.array(sc["engine_jacobian"])
    w = np.array(sc["weights"])
    a = np.array(sc["helmert_design"])
    s = int(sc["n_station_columns"])
    f = jac.T @ (w[:, None] * jac)
    if s == 0:
        return None
    f_ss, f_sb, f_bb = f[:s, :s], f[:s, s:], f[s:, s:]
    routes = {}
    routes["inv"] = f_bb - f_sb.T @ np.linalg.inv(f_ss) @ f_sb
    l_ss = np.linalg.cholesky(f_ss)
    y = np.linalg.solve(l_ss, f_sb)
    routes["cholesky_solve"] = f_bb - y.T @ y
    mu, v = np.linalg.eigh(f_ss)
    routes["eigh"] = f_bb - f_sb.T @ (v @ np.diag(1.0 / mu) @ v.T) @ f_sb
    sw = np.sqrt(w)[:, None] * jac
    q_s, _ = np.linalg.qr(sw[:, :s])
    jb = sw[:, s:] - q_s @ (q_s.T @ sw[:, s:])
    routes["qr_projection"] = jb.T @ jb
    ref = np.array([float(x) for x in sigma_ref])
    out = {}
    for name, schur in routes.items():
        h = a.T @ schur @ a
        sig = np.sqrt(np.diag(np.linalg.inv(h)))
        out[name] = float(np.max(np.abs(sig - ref) / ref))
    return out


def main():
    inputs = json.load(open(sys.argv[1]))
    scenarios = []
    for sc in inputs["scenarios"]:
        mp.dps = DIGITS
        r50 = compute(sc)
        mp.dps = CHECK_DIGITS
        r80 = compute(sc)
        mp.dps = DIGITS
        # The weakest direction is compared as a direction: the norm of the difference of the two
        # runs' sign-pinned unit vectors (the chord, equal to the angle to first order; a
        # sqrt(1 - cos^2) form would cancel down to the 50-digit noise); every other quantity
        # entry by entry, relative.
        d50, d80 = r50["weakest_direction"], r80["weakest_direction"]
        worst = mp.sqrt(mp.fsum((x - y) ** 2 for x, y in zip(d50, d80)))
        a50, a80 = [], []
        flatten({k: v for k, v in r50.items() if k != "weakest_direction"}, a50)
        flatten({k: v for k, v in r80.items() if k != "weakest_direction"}, a80)
        assert len(a50) == len(a80)
        for x, y in zip(a50, a80):
            d = abs(x - y) / abs(y) if y != 0 else abs(x - y)
            worst = max(worst, d)
        if not worst <= SELF_AGREEMENT:
            sys.exit(f"{sc['name']}: 50 vs 80 digits disagree by {mpmath.nstr(worst, 5)}")
        entry = {"name": sc["name"]}
        entry.update(to_json(r50))
        entry["self_agreement_50_vs_80_digits"] = float(worst)
        entry["numpy_double_precision_sigma_error_diagnostic"] = numpy_routes(sc, r50["sigma"])
        scenarios.append(entry)
    doc = {
        "generator": "tests/fixtures/lunar_frame_campaign_mpmath_oracle/gen_reference.py",
        "oracle": f"mpmath {mpmath.__version__} at {DIGITS} digits (checked at {CHECK_DIGITS})",
        "diagnostic": f"numpy {np.__version__}",
        "scenarios": scenarios,
    }
    print(json.dumps(doc, indent=1))


if __name__ == "__main__":
    main()
