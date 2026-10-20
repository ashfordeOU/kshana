#!/usr/bin/env python3
"""Independent numpy oracles for studies 3 to 5 of the lunar-infrastructure kind
(xval/lunar-infra/PREREGISTRATION.md): bars F2 (datum partials by finite difference of the
forward model), T3 (space-tie information) and G2 (geodesy information), written with their own
code from the geometry kshana exports.

  cargo run --release --example gen_lunar_infra_oracles
  python3 scripts/gen_lunar_infra_oracles.py
"""
import json
import numpy as np

D = "tests/fixtures/lunar_infra/"
LD = np.longdouble


def rodrigues(th, p):
    a = np.sqrt(np.sum(th * th))
    if a < 1e-30:
        return p
    k = th / a
    return p * np.cos(a) + np.cross(k, p) * np.sin(a) + k * np.dot(k, p) * (1 - np.cos(a))


# ---------------------------------------------------------------- F2: datum partials
def frame():
    cases = json.load(open(D + "frame_partials.json"))["cases"]
    out = []
    steps = np.array([1, 1, 1, 1e-8, 1e-8, 1e-8, 1e-8], dtype=LD)
    for c in cases:
        x = np.array(c["observer"], dtype=LD)
        p = np.array(c["point"], dtype=LD)

        def rho(par):
            q = (1 + par[3]) * rodrigues(par[4:7], p) + par[0:3]
            return np.sqrt(np.sum((q - x) ** 2))

        row = []
        for i in range(7):
            e = np.zeros(7, dtype=LD)
            e[i] = steps[i]
            row.append(float((rho(e) - rho(-e)) / (2 * steps[i])))
        out.append(row)
    json.dump({"rows": out}, open(D + "frame_oracle.json", "w"))


# ---------------------------------------------------------------- T3: space-tie information
def tie():
    g = json.load(open(D + "tie_geometry.json"))
    pos = np.array(g["positions"])
    sig = np.array(g["sigma_m"])
    rm = g["r_moon_m"]
    n = len(pos)
    NP = 23
    # Unknowns: 23 parameters and the spacecraft position x_t (3 per epoch); full stacked system.
    nx = 3 * n
    Nthth = np.zeros((NP, NP))
    Nthx = np.zeros((NP, nx))
    Nxx = np.zeros((n, 3, 3))
    for i, x in enumerate(pos):
        J = np.array([[1, 0, 0, x[0], 0, x[2], -x[1]],
                      [0, 1, 0, x[1], -x[2], 0, x[0]],
                      [0, 0, 1, x[2], x[1], -x[0], 0]])
        J[:, 3:] /= rm
        for k in range(3):
            A = np.zeros((3, NP))
            if k == 0:
                A[:, 14:17] = np.eye(3)
            else:
                A[:, (k - 1) * 7:(k - 1) * 7 + 7] = J
                A[:, 14 + 3 * k:17 + 3 * k] = np.eye(3)
            w = 1.0 / sig[k] ** 2
            Nthth += w * A.T @ A
            Nthx[:, 3 * i:3 * i + 3] += w * A.T  # d(p_k)/dx = I
            Nxx[i] += w * np.eye(3)
    corr = np.zeros((NP, NP))
    for i in range(n):
        B = Nthx[:, 3 * i:3 * i + 3]
        corr += B @ np.linalg.inv(Nxx[i]) @ B.T
    json.dump({"information": (Nthth - corr).tolist()}, open(D + "tie_oracle.json", "w"))


# ---------------------------------------------------------------- G2: geodesy information
def geodesy():
    g = json.load(open(D + "geodesy_geometry.json"))
    k = g["constants"]
    mu_e, mu_m, rm, c2, arcsec = k["mu_earth"], k["mu_moon"], k["r_moon_m"], k["c2"], k["arcsec"]
    grav = mu_m / rm ** 2

    def A(d):
        return mu_e * rm ** 2 / d ** 3

    def P2(c):
        return 0.5 * (3 * c * c - 1)

    def unit(v):
        v = np.array(v, dtype=LD)
        return v / np.sqrt(np.sum(v * v))

    def fd(f, n=5):
        row = []
        for i in range(n):
            e = np.zeros(n, dtype=LD)
            e[i] = 1.0
            row.append(float((f(e) - f(-e)) / 2))
        return row

    # LLR rows
    rows_l = []
    for c in g["llr"]:
        e = np.array(c["e"], dtype=LD)
        u = np.array(c["u"], dtype=LD)
        p = np.array(c["p"], dtype=LD)
        r = unit(p)
        cp = np.dot(r, e)
        a = A(c["d"])

        def f(x):
            radial = x[0] * a * P2(cp) / grav
            hh = -3 * x[2] * a * cp / grav
            hv = cp * r - e
            th = np.array([0, x[4] * arcsec * c["cos_omd"], x[3] * 0], dtype=LD)  # latitude about y
            tl = np.array([0, 0, x[3] * arcsec * c["sin_om"]], dtype=LD)  # longitude about z
            dq = radial * r + hh * hv + np.cross(tl, p) + np.cross(th, p)
            return np.dot(u, dq)

        rows_l.append(fd(f))
    # Orbiter rows
    tt = np.array([c["t"] for c in g["orbiter"]])
    acc = np.zeros(3)
    vals = []
    prev = None
    for c in g["orbiter"]:
        r = np.array(c["r"])
        e = np.array(c["e"])
        d = c["d"]
        rn = np.linalg.norm(r)
        ru = r / rn
        cs = np.dot(ru, e)
        kk = mu_e * rm ** 5 / (2 * d ** 3 * rn ** 4)
        a = kk * ((3 - 15 * cs * cs) * ru + 6 * cs * e)
        if prev is not None:
            acc = acc + 0.5 * (c["t"] - prev[1]) * (prev[0] + a)
        prev = (a, c["t"])
        vals.append(np.dot(e, acc))
    vals = np.array(vals)
    M = np.vstack([np.ones_like(tt), tt]).T
    vals = vals - M @ np.linalg.lstsq(M, vals, rcond=None)[0]
    rows_o = [[0, v, 0, 0, 0] for v in vals]
    # Gravimeter rows (nm/s^2), mean removed per site
    rows_g = []
    for site in g["gravimeter"]["sites"]:
        rs = unit(site)
        block = []
        for ep in g["gravimeter"]["epochs"]:
            cs = np.dot(rs, np.array(ep["e"]))
            w2 = A(ep["d"]) * P2(cs)
            block.append(fd(lambda x: -2 * w2 / rm * (1 + x[0] - 1.5 * x[1]) * 1e9))
        block = np.array(block)
        block[:, :2] -= block[:, :2].mean(axis=0)
        rows_g.extend(block.tolist())
    # Clock rows, mean removed
    rs = unit(g["clock"]["site"])
    block = []
    for ep in g["clock"]["epochs"]:
        cs = np.dot(rs, np.array(ep["e"]))
        w2 = A(ep["d"]) * P2(cs)
        block.append(fd(lambda x: (1 + x[1] - x[0]) * w2 / c2))
    block = np.array(block)
    block[:, :2] -= block[:, :2].mean(axis=0)
    s = g["sigma"]
    info = np.zeros((5, 5))
    for rows, sg in ((rows_l, s["llr_m"]), (rows_o, s["orbiter_m_s"]),
                     (rows_g, s["gravimeter_nm_s2"]), (block.tolist(), s["clock"])):
        H = np.array(rows)
        info += H.T @ H / sg ** 2
    json.dump({"information": info.tolist(),
               "clock_amplitude": mu_e * rm ** 2 / (k["d_nominal_m"] ** 3 * c2)},
              open(D + "geodesy_oracle.json", "w"))


frame()
tie()
geodesy()
