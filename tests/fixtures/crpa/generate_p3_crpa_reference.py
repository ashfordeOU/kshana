#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external-oracle reference values for tests/crpa_reference.rs.

Oracle libraries (independent, authoritative, BSD-licensed, LAPACK-backed):
  numpy.linalg  — complex matrix inverse / solve  (numpy 1.26.4)
  scipy.linalg  — LAPACK zgesv complex linear solve (scipy 1.13.1)

These provide a *different codebase and algorithm* (LAPACK LU with partial
pivoting in optimised Fortran, operating on native complex128) from Kshana's
`crpa::solve` — a hand-rolled Gaussian-elimination kernel over its own scalar
`C` struct. We build the array geometry, steering vectors, interference-plus-
noise covariance R and the constraint matrix A entirely in numpy, then compute:

  * MVDR weights          w = R^-1 a_sv / (a_sv^H R^-1 a_sv)   (scipy.linalg.solve)
  * min-norm null-steer   w = A^H (A A^H)^-1 b                 (numpy.linalg.solve)
  * array-response gains  g(u) = w^H a(u)                      for SV + each jammer

and emit the FULL complex weight vectors and gains as committed fixtures. The
Rust test asserts Kshana's crpa weight vectors and gains reproduce these
element-by-element to ~1e-9. Because MVDR / min-norm-null weights are UNIQUELY
defined by their constraints (the minimiser is unique for a full-rank R / A),
this is a genuine independent numeric cross-check of the weight algebra, not a
re-run of Kshana's own kernel.

Conventions (match src/crpa.rs exactly):
  steering  a_n(u) = exp( j * (2*pi/lambda) * dot(p_n, u) )
  inner     x^H y  = sum_n conj(x_n) * y_n           (conj-linear in 1st arg)
  gain      g(u)   = w^H a(u) = inner(w, a(u))
  null A    rows are a(dir)^H  ->  A[i,n] = conj(a_i[n]);  b = [1, 0, ...]^T
  cov  R    = sigma2 * I + sum_k P_k * a_k a_k^H
            R[i,j] = sigma2*delta_ij + sum_k P_k * a_k[i] * conj(a_k[j])

Run:  python3 generate_p3_crpa_reference.py   (rewrites crpa_reference.json)
Reproducible: fixed inputs, no randomness. Regenerable fully offline.
"""

import json
import os

import numpy as np
import scipy
import scipy.linalg as sla

TWO_PI = 2.0 * np.pi


def steering(pos, dir_unit, lam):
    """a_n = exp(j * k * p_n . u), k = 2*pi/lam.  Returns complex128 vector."""
    k = TWO_PI / lam
    phases = k * (np.asarray(pos, float) @ np.asarray(dir_unit, float))
    return np.exp(1j * phases)


def inner(x, y):
    """x^H y = sum conj(x_n) y_n."""
    return np.vdot(x, y)  # numpy vdot conjugates its FIRST argument


def gain(w, pos, dir_unit, lam):
    """Array complex gain g(u) = w^H a(u)."""
    return inner(w, steering(pos, dir_unit, lam))


def ula(n, lam):
    """Uniform linear array, half-wavelength spacing along x."""
    d = lam / 2.0
    return [[i * d, 0.0, 0.0] for i in range(n)]


def dir_az(theta):
    """Look direction at azimuth theta (rad) from boresight (+y), in xy-plane."""
    return [np.sin(theta), np.cos(theta), 0.0]


def upa(nx, ny, lam):
    """Uniform planar array in the xy-plane, half-wavelength spacing."""
    d = lam / 2.0
    return [[ix * d, iy * d, 0.0] for iy in range(ny) for ix in range(nx)]


def dir_azel(az, el):
    """Unit direction from azimuth (from +y, toward +x) and elevation."""
    ce = np.cos(el)
    return [ce * np.sin(az), ce * np.cos(az), np.sin(el)]


def cplx(z):
    return {"re": float(np.real(z)), "im": float(np.imag(z))}


def cvec(v):
    return [cplx(z) for z in np.asarray(v).ravel()]


# ---------------------------------------------------------------------------
# MVDR oracle:  w = R^-1 a_sv / (a_sv^H R^-1 a_sv), R built as sigma2 I + sum P a a^H
# ---------------------------------------------------------------------------
def mvdr_case(name, pos, lam, sv_dir, jammer_dirs, powers, sigma2):
    pos = np.asarray(pos, float)
    n = pos.shape[0]
    a_sv = steering(pos, sv_dir, lam)
    jam = [steering(pos, d, lam) for d in jammer_dirs]

    R = sigma2 * np.eye(n, dtype=complex)
    for P, a in zip(powers, jam):
        R = R + P * np.outer(a, np.conj(a))  # a a^H

    # Independent LAPACK solve (scipy zgesv): y = R^-1 a_sv
    y = sla.solve(R, a_sv, assume_a="her")  # Hermitian solver path
    denom = inner(a_sv, y)  # a_sv^H R^-1 a_sv (real, positive)
    w = y / denom

    g_sv = gain(w, pos, sv_dir, lam)
    g_jam = [gain(w, pos, d, lam) for d in jammer_dirs]
    resid = 1.0 / denom  # residual output power = 1 / (a^H R^-1 a)

    return {
        "name": name,
        "kind": "mvdr",
        "lambda": lam,
        "n": int(n),
        "pos": pos.tolist(),
        "sigma2": sigma2,
        "sv_dir": list(map(float, sv_dir)),
        "jammer_dirs": [list(map(float, d)) for d in jammer_dirs],
        "powers": list(map(float, powers)),
        "weights": cvec(w),
        "g_sv": cplx(g_sv),
        "g_jam": [cplx(g) for g in g_jam],
        "residual_power": float(np.real(resid)),
    }


# ---------------------------------------------------------------------------
# Min-norm null-steering oracle:  w = A^H (A A^H)^-1 b,  rows of A are a(dir)^H,
# b = [1, 0, ...]^T  (unit gain toward SV, exact null toward each jammer).
# ---------------------------------------------------------------------------
def null_case(name, pos, lam, sv_dir, jammer_dirs):
    pos = np.asarray(pos, float)
    n = pos.shape[0]
    dirs = [sv_dir] + list(jammer_dirs)
    m = len(dirs)
    # A[i, :] = a(dir_i)^H  (row is conjugate-transpose of the steering vector)
    A = np.array([np.conj(steering(pos, d, lam)) for d in dirs])  # m x n
    b = np.zeros(m, dtype=complex)
    b[0] = 1.0

    # min-norm solution of the under/exactly-determined A w = b:
    # w = A^H (A A^H)^-1 b, using an INDEPENDENT LAPACK solve for (A A^H)^-1 b.
    G = A @ A.conj().T  # A A^H  (m x m Gram matrix)
    lam_coeff = np.linalg.solve(G, b)  # (A A^H)^-1 b   (numpy LAPACK zgesv)
    w = A.conj().T @ lam_coeff  # A^H (...)

    g_sv = gain(w, pos, sv_dir, lam)
    g_jam = [gain(w, pos, d, lam) for d in jammer_dirs]

    return {
        "name": name,
        "kind": "null",
        "lambda": lam,
        "n": int(n),
        "pos": pos.tolist(),
        "sv_dir": list(map(float, sv_dir)),
        "jammer_dirs": [list(map(float, d)) for d in jammer_dirs],
        "weights": cvec(w),
        "g_sv": cplx(g_sv),
        "g_jam": [cplx(g) for g in g_jam],
    }


def main():
    lam = 0.1902936728  # GPS L1 wavelength (m), c / 1575.42 MHz
    cases = []

    # --- MVDR case 1: 4-element ULA, one strong jammer (60 dB over noise) ---
    pos = ula(4, lam)
    cases.append(
        mvdr_case(
            "mvdr_ula4_1jam_60db",
            pos,
            lam,
            dir_az(0.10),
            [dir_az(0.80)],
            [1.0e6],
            1.0,
        )
    )

    # --- MVDR case 2: 7-element ULA, three jammers of varied power ---
    pos = ula(7, lam)
    cases.append(
        mvdr_case(
            "mvdr_ula7_3jam",
            pos,
            lam,
            dir_az(-0.05),
            [dir_az(0.55), dir_az(-0.65), dir_az(1.10)],
            [1.0e3, 5.0e4, 2.0e2],
            0.5,
        )
    )

    # --- MVDR case 3: 3x3 planar array (9 elements), two spatial jammers ---
    pos = upa(3, 3, lam)
    cases.append(
        mvdr_case(
            "mvdr_upa9_2jam",
            pos,
            lam,
            dir_azel(0.30, 0.90),
            [dir_azel(1.20, 0.20), dir_azel(-0.90, 0.50)],
            [1.0e4, 1.0e5],
            2.0,
        )
    )

    # --- Null case 1: 4-element ULA, N-1 = 3 jammers (exactly determined) ---
    pos = ula(4, lam)
    cases.append(
        null_case(
            "null_ula4_3jam",
            pos,
            lam,
            dir_az(0.10),
            [dir_az(0.60), dir_az(-0.40), dir_az(1.00)],
        )
    )

    # --- Null case 2: 6-element ULA, 2 jammers (under-determined min-norm) ---
    pos = ula(6, lam)
    cases.append(
        null_case(
            "null_ula6_2jam",
            pos,
            lam,
            dir_az(0.20),
            [dir_az(0.70), dir_az(-0.50)],
        )
    )

    # --- Null case 3: 3x3 planar array, 3 spatial jammers ---
    pos = upa(3, 3, lam)
    cases.append(
        null_case(
            "null_upa9_3jam",
            pos,
            lam,
            dir_azel(0.10, 0.80),
            [dir_azel(1.00, 0.10), dir_azel(-0.80, 0.40), dir_azel(0.50, -0.30)],
        )
    )

    doc = {
        "_provenance": {
            "generator": "tests/fixtures/crpa/generate_p3_crpa_reference.py",
            "oracle_numpy": np.__version__,
            "oracle_scipy": scipy.__version__,
            "note": (
                "Independent LAPACK oracle (numpy.linalg + scipy.linalg zgesv) "
                "for CRPA MVDR / min-norm null-steering weights and array-response "
                "gains. Fixed inputs, no randomness. Regenerable fully offline via "
                "`python3 generate_p3_crpa_reference.py`."
            ),
        },
        "cases": cases,
    }

    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "crpa_reference.json")
    with open(out, "w") as f:
        json.dump(doc, f, indent=2)
        f.write("\n")

    # --- console sanity check (physically sensible?) ------------------------
    print(f"numpy {np.__version__}  scipy {scipy.__version__}")
    print(f"wrote {out} with {len(cases)} cases")
    for c in cases:
        g_sv = c["g_sv"]
        gj = c["g_jam"]
        gj_abs = [np.hypot(g["re"], g["im"]) for g in gj]
        print(
            f"  {c['name']:22s} kind={c['kind']:5s} n={c['n']} "
            f"g_sv=({g_sv['re']:+.6f},{g_sv['im']:+.6f})  "
            f"max|g_jam|={max(gj_abs):.3e}"
        )
        # SV gain must be distortionless (unit real).
        assert abs(g_sv["re"] - 1.0) < 1e-9 and abs(g_sv["im"]) < 1e-9, c["name"]
        if c["kind"] == "null":
            # exact nulls toward every jammer.
            assert max(gj_abs) < 1e-9, ("null not deep", c["name"])
        else:
            # MVDR: strong jammers should be heavily attenuated (not asserted
            # tightly here since weak jammers may pass, only reported).
            pass


if __name__ == "__main__":
    main()
