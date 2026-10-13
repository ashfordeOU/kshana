# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the DOP853 oracle fixture (reference.json) with SciPy's solve_ivp(method='DOP853').

Run with the oracle toolchain's Python (numpy 2.3.5, scipy 1.18.1, mpmath 1.3.0):

    /root/kshana-oracles/.venv/bin/python -I gen_reference.py > reference.json

Three test problems (right-hand sides written exactly as in tests/dop853_scipy_oracle.rs):
  * leo        two-body, SI units, mu = 3.986004418e14, circular 7000 km orbit inclined 45 deg,
               t_end = 58000 s (about 9.9 periods);
  * ecc07      two-body, canonical units mu = 1, a = 1, e = 0.7 from perigee, t_end = 10*pi
               (5 periods);
  * arenstorf  the restricted three-body Arenstorf orbit of Hairer, Norsett and Wanner
               (Solving ODEs I, sec. II.0), mu = 0.012277471, one period
               T = 17.0652165601579625588917206249.
For each: SciPy's automatic first step (select_initial_step), a full run at rtol = atol = 1e-12
with that first step given (final state, accepted steps, nfev), the same run with dense output
evaluated at 40 interior times, single-step records from identical (t, y, h), and for the
two-body problems the exact Kepler solution (mpmath, 40 digits) at the end and dense times.
"""
import json
import sys

import mpmath as mp
import numpy as np
import scipy
from scipy.integrate import solve_ivp
from scipy.integrate._ivp.common import select_initial_step
from scipy.integrate._ivp.rk import DOP853, rk_step

MU_EARTH = 3.986004418e14
ARENSTORF_MU = 0.012277471
ARENSTORF_T = 17.0652165601579625588917206249
RTOL = 1e-12
ATOL = 1e-12


def two_body(mu):
    def f(t, y):
        x, yy, z = y[0], y[1], y[2]
        r = np.sqrt(x * x + yy * yy + z * z)
        r3 = r * r * r
        return np.array([y[3], y[4], y[5], -mu * x / r3, -mu * yy / r3, -mu * z / r3])
    return f


def two_body_planar(t, y):
    x, yy = y[0], y[1]
    r = np.sqrt(x * x + yy * yy)
    r3 = r * r * r
    return np.array([y[2], y[3], -x / r3, -yy / r3])


def arenstorf(t, y):
    mu = ARENSTORF_MU
    mup = 1.0 - mu
    d1 = (y[0] + mu) ** 2 + y[1] ** 2
    d1 = d1 * np.sqrt(d1)
    d2 = (y[0] - mup) ** 2 + y[1] ** 2
    d2 = d2 * np.sqrt(d2)
    a0 = y[0] + 2.0 * y[3] - mup * (y[0] + mu) / d1 - mu * (y[0] - mup) / d2
    a1 = y[1] - 2.0 * y[2] - mup * y[1] / d1 - mu * y[1] / d2
    return np.array([y[2], y[3], a0, a1])


def leo_y0():
    a = 7.0e6
    v = np.sqrt(MU_EARTH / a)
    inc = np.radians(45.0)
    return np.array([a, 0.0, 0.0, 0.0, v * np.cos(inc), v * np.sin(inc)])


def ecc_y0():
    e = 0.7
    return np.array([1.0 - e, 0.0, 0.0, np.sqrt((1.0 + e) / (1.0 - e))])


def kepler_exact(y0, t, mu, dim):
    """Exact two-body state at t from the float64 y0 (mpmath, 40 digits): f and g series in the
    eccentric-anomaly change dE."""
    mp.mp.dps = 40
    r0v = [mp.mpf(float(c)) for c in y0[:dim]]
    v0v = [mp.mpf(float(c)) for c in y0[dim:]]
    mu = mp.mpf(mu)
    t = mp.mpf(t)
    r0 = mp.sqrt(sum(c * c for c in r0v))
    v2 = sum(c * c for c in v0v)
    a = 1 / (2 / r0 - v2 / mu)
    sig0 = sum(r0v[i] * v0v[i] for i in range(dim)) / mp.sqrt(mu)
    n = mp.sqrt(mu / a ** 3)
    dm = n * t

    def kep(de):
        return de + sig0 / mp.sqrt(a) * (1 - mp.cos(de)) - (1 - r0 / a) * mp.sin(de) - dm

    de = mp.findroot(kep, dm)
    r = a + (r0 - a) * mp.cos(de) + sig0 * mp.sqrt(a) * mp.sin(de)
    f = 1 - a / r0 * (1 - mp.cos(de))
    g = t + mp.sqrt(a ** 3 / mu) * (mp.sin(de) - de)
    fd = -mp.sqrt(mu * a) / (r * r0) * mp.sin(de)
    gd = 1 - a / r * (1 - mp.cos(de))
    rr = [f * r0v[i] + g * v0v[i] for i in range(dim)]
    vv = [fd * r0v[i] + gd * v0v[i] for i in range(dim)]
    return [float(c) for c in rr + vv]


def single_step(fun, t, y, h, rtol, atol):
    """One DOP853 step from (t, y, h) with SciPy's own routines, plus its dense output."""
    f0 = fun(t, y)
    K = np.empty((DOP853.n_stages + 1, len(y)))
    y_new, f_new = rk_step(fun, t, y, f0, h, DOP853.A, DOP853.B, DOP853.C, K)
    solver = DOP853(fun, t, y, t + 2.0 * h, rtol=rtol, atol=atol, first_step=h)
    scale = atol + np.maximum(np.abs(y), np.abs(y_new)) * rtol
    err = solver._estimate_error_norm(K, h, scale)
    out = {
        "t": t, "h": h, "rtol": rtol, "atol": atol, "y": list(map(float, y)),
        "y_new": list(map(float, y_new)), "f_new": list(map(float, f_new)),
        "error_norm": float(err),
    }
    # Dense output of the same step (SciPy's own `_dense_output_impl`, fed this step's stages
    # whether or not the controller would accept it).
    solver.K_extended[: DOP853.n_stages + 1] = K
    solver.t_old, solver.y_old, solver.h_previous = t, y, h
    solver.t, solver.y, solver.f = t + h, y_new, f_new
    d = solver._dense_output_impl()
    out["dense_x"] = [0.1, 0.25, 0.5, 0.75, 0.9]
    out["dense_y"] = [list(map(float, d(t + x * h))) for x in out["dense_x"]]
    return out


def problem(name, fun, y0, t_end, mu=None, dim=None, step_cases=()):
    f0 = fun(0.0, y0)
    h0 = float(select_initial_step(fun, 0.0, y0, t_end, np.inf, f0, 1, 7, RTOL, ATOL))
    run = solve_ivp(fun, (0.0, t_end), y0, method="DOP853", rtol=RTOL, atol=ATOL,
                    first_step=h0)
    assert run.success
    dense = solve_ivp(fun, (0.0, t_end), y0, method="DOP853", rtol=RTOL, atol=ATOL,
                      first_step=h0, dense_output=True)
    assert np.array_equal(dense.y[:, -1], run.y[:, -1])
    t_dense = [t_end * (k + 0.5) / 40.0 for k in range(40)]
    out = {
        "name": name,
        "t_end": t_end,
        "y0": list(map(float, y0)),
        "h0_auto": h0,
        "y_end": list(map(float, run.y[:, -1])),
        "accepted": int(len(run.t) - 1),
        "nfev": int(run.nfev),
        "nfev_dense": int(dense.nfev),
        "t_dense": t_dense,
        "y_dense": [list(map(float, dense.sol(t))) for t in t_dense],
        "steps": [single_step(fun, *c) for c in step_cases],
    }
    if mu is not None:
        out["exact_end"] = kepler_exact(y0, t_end, mu, dim)
        out["exact_dense"] = [kepler_exact(y0, t, mu, dim) for t in t_dense]
    return out


def main():
    leo = leo_y0()
    ecc = ecc_y0()
    are = np.array([0.994, 0.0, 0.0, -2.00158510637908252240537862224])
    t_ecc = 10.0 * np.pi
    problems = [
        problem("leo", two_body(MU_EARTH), leo, 58000.0, MU_EARTH, 3,
                [(0.0, leo, 300.0, 1e-12, 1e-12), (1234.5, leo, 60.0, 1e-9, 1e-9)]),
        problem("ecc07", two_body_planar, ecc, t_ecc, 1.0, 2,
                [(0.0, ecc, 0.05, 1e-12, 1e-12), (0.0, ecc, 0.02, 1e-10, 1e-10),
                 (2.0, ecc, 0.3, 1e-9, 1e-9)]),
        problem("arenstorf", arenstorf, are, ARENSTORF_T, None, None,
                [(0.0, are, 0.01, 1e-12, 1e-12), (0.0, are, 0.002, 1e-10, 1e-10),
                 (5.0, are, 0.05, 1e-7, 1e-7)]),
    ]
    doc = {
        "generator": "tests/fixtures/dop853_scipy_oracle/gen_reference.py",
        "scipy": scipy.__version__,
        "numpy": np.__version__,
        "mpmath": mp.__version__,
        "rtol": RTOL,
        "atol": ATOL,
        "problems": problems,
    }
    json.dump(doc, sys.stdout, indent=1)
    sys.stdout.write("\n")


if __name__ == "__main__":
    main()
