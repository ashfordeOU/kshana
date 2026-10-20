#!/usr/bin/env python3
"""Independent oracle for the lunar-infrastructure studies (xval/lunar-infra/PREREGISTRATION.md).

Study 1, bar O1: the 6x6 state-transition matrix of the corrected NRHO after 3 days and after one
period, from scipy's DOP853 (rtol 1e-12, atol 1e-14) integration of the circular restricted
three-body equations with their variational equations. Reads tests/fixtures/lunar_infra/nrho_ic.json
(written by `cargo run --example gen_lunar_infra_inputs`), writes
tests/fixtures/lunar_infra/oracle_o1.json.
"""
import json
import numpy as np
from scipy.integrate import solve_ivp

fx = "tests/fixtures/lunar_infra/"
inp = json.load(open(fx + "nrho_ic.json"))
mu = inp["mu"]


def rhs(_t, y):
    x, yy, z, vx, vy, vz = y[:6]
    phi = y[6:].reshape(6, 6)
    r1 = np.sqrt((x + mu) ** 2 + yy**2 + z**2)
    r2 = np.sqrt((x - 1 + mu) ** 2 + yy**2 + z**2)
    ax = x + 2 * vy - (1 - mu) * (x + mu) / r1**3 - mu * (x - 1 + mu) / r2**3
    ay = yy - 2 * vx - (1 - mu) * yy / r1**3 - mu * yy / r2**3
    az = -(1 - mu) * z / r1**3 - mu * z / r2**3
    # Jacobian of the acceleration with respect to position (Uxx etc.).
    def u(p, q, d1, d2):
        return 0.0
    k1, k2 = (1 - mu) / r1**3, mu / r2**3
    a1, a2 = (1 - mu) * 3 / r1**5, mu * 3 / r2**5
    dx1, dx2 = x + mu, x - 1 + mu
    uxx = 1 - k1 - k2 + a1 * dx1**2 + a2 * dx2**2
    uyy = 1 - k1 - k2 + a1 * yy**2 + a2 * yy**2
    uzz = -k1 - k2 + a1 * z**2 + a2 * z**2
    uxy = a1 * dx1 * yy + a2 * dx2 * yy
    uxz = a1 * dx1 * z + a2 * dx2 * z
    uyz = a1 * yy * z + a2 * yy * z
    a = np.zeros((6, 6))
    a[0:3, 3:6] = np.eye(3)
    a[3:6, 0:3] = [[uxx, uxy, uxz], [uxy, uyy, uyz], [uxz, uyz, uzz]]
    a[3, 4], a[4, 3] = 2.0, -2.0
    dphi = a @ phi
    return np.concatenate([[vx, vy, vz, ax, ay, az], dphi.ravel()])


def propagate(t_nd):
    y0 = np.concatenate([inp["ic"], np.eye(6).ravel()])
    s = solve_ivp(rhs, [0.0, t_nd], y0, method="DOP853", rtol=1e-12, atol=1e-14)
    y = s.y[:, -1]
    return y[:6].tolist(), y[6:].reshape(6, 6).tolist()


tu = inp["t_unit_s"]
out = {}
for name, t_s in (("three_days", 3 * 86400.0), ("one_period", inp["period_s"])):
    x, phi = propagate(t_s / tu)
    out[name] = {"t_s": t_s, "x": x, "phi": phi}
out["source"] = "scipy.integrate.solve_ivp DOP853 rtol=1e-12 atol=1e-14, scipy " + __import__("scipy").__version__
json.dump(out, open(fx + "oracle_o1.json", "w"), indent=1)
print("wrote", fx + "oracle_o1.json")
