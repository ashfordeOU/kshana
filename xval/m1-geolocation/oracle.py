#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""M1 oracle (numpy only; no engine code), from the pre-registration and README readings.

    python3 -I oracle.py b1 oracle_b1.json    B1: S1, F2, F3 x P1-P10 x {AIS, 30 dBm jammer}, one pass each
    python3 -I oracle.py b2 oracle_b2.json    B2: Cao et al. 2015, Eq. (7), the 25 points (run only AFTER the
                                              engine's B2 run, reading 13)
"""
import json
import math
import sys

import numpy as np

MU, RE, J2, WE, C, KB = 3.986004418e14, 6378137.0, 1.08262668e-3, 7.2921151467e-5, 299792458.0, 1.380649e-23
FL = 1.0 / 298.257223563
B_AX = RE * (1.0 - FL)
E2 = FL * (2.0 - FL)
T_SYS = 500.0
D_FORM = 50e3
POINTS = [(54.60, 14.00), (55.50, 15.80), (55.00, 19.00), (57.00, 19.50), (56.50, 20.20),
          (58.50, 20.50), (59.80, 24.50), (61.50, 19.80), (64.00, 22.00), (57.70, 23.30)]
CLASSES = {"ais": dict(f0=161.975e6, eirp_dbm=41.0, b=25e3, t=26.7e-3),
           "jammer30": dict(f0=1575.42e6, eirp_dbm=30.0, b=2e6, t=1.0)}


# ---- orbit (readings 2-5) ----
A_ORB = RE + 550e3
N_MM = math.sqrt(MU / A_ORB ** 3)
OMEGA_SS = 2.0 * math.pi / (365.2422 * 86400.0)
INC = math.acos(-OMEGA_SS / (1.5 * N_MM * J2 * (RE / A_ORB) ** 2))
F_J2 = N_MM * J2 * (RE / A_ORB) ** 2
RAAN_DOT = -1.5 * F_J2 * math.cos(INC)
ARGP_DOT = 0.75 * F_J2 * (5.0 * math.cos(INC) ** 2 - 1.0)


def sat_state(t, u0):
    """Earth-fixed position and velocity (m, m/s) at t of a satellite with argument of latitude u0 at t = 0."""
    u = u0 + (N_MM + ARGP_DOT) * t
    ud = N_MM + ARGP_DOT
    th = RAAN_DOT * t - WE * t
    thd = RAAN_DOT - WE
    ci, si = math.cos(INC), math.sin(INC)
    ro = A_ORB * np.array([math.cos(u), math.sin(u) * ci, math.sin(u) * si])
    dro = A_ORB * ud * np.array([-math.sin(u), math.cos(u) * ci, math.cos(u) * si])
    c, s = math.cos(th), math.sin(th)
    rz = np.array([[c, -s, 0.0], [s, c, 0.0], [0.0, 0.0, 1.0]])
    drz = thd * np.array([[-s, -c, 0.0], [c, -s, 0.0], [0.0, 0.0, 0.0]])
    return rz @ ro, rz @ dro + drz @ ro


def geodetic(lat, lon):
    la, lo = math.radians(lat), math.radians(lon)
    n = RE / math.sqrt(1.0 - E2 * math.sin(la) ** 2)
    p = np.array([n * math.cos(la) * math.cos(lo), n * math.cos(la) * math.sin(lo), n * (1.0 - E2) * math.sin(la)])
    e = np.array([-math.sin(lo), math.cos(lo), 0.0])
    nn = np.array([-math.sin(la) * math.cos(lo), -math.sin(la) * math.sin(lo), math.cos(la)])
    up = np.array([math.cos(la) * math.cos(lo), math.cos(la) * math.sin(lo), math.sin(la)])
    return p, e, nn, up


def elevation(s, p, up):
    d = s - p
    return math.asin(float(d @ up) / float(np.linalg.norm(d)))


def passes(p, up, u0s):
    """Maximal runs of 10 s grid epochs with every satellite at >= 10 deg (reading 6)."""
    out, cur = [], []
    for k in range(8640):
        t = 10.0 * k
        els = [elevation(sat_state(t, u0)[0], p, up) for u0 in u0s]
        if min(els) >= math.radians(10.0):
            cur.append((t, els[0]))
        elif cur:
            out.append(cur)
            cur = []
    if cur:
        out.append(cur)
    return out


def snr(r, cls):
    fspl = 20.0 * math.log10(4.0 * math.pi * r * cls["f0"] / C)
    db = (cls["eirp_dbm"] - 30.0) - fspl - 10.0 * math.log10(KB * T_SYS * cls["b"])
    return 10.0 ** (db / 10.0)


def sigmas(g, cls):
    beta = 2.0 * math.pi * cls["b"] / math.sqrt(12.0)
    tau = 2.0 * math.pi * cls["t"] / math.sqrt(12.0)
    btg = cls["b"] * cls["t"] * g
    return 1.0 / (beta * math.sqrt(btg)), 1.0 / (tau * math.sqrt(btg))


def geom(s, v, p):
    d = s - p
    r = float(np.linalg.norm(d))
    l = d / r
    rd = float(v @ d) / r
    return r, rd, -l, -(v - rd * l) / r      # R, Rdot, dR/dp, dRdot/dp


def constrained(jm, fgrad):
    ji = np.linalg.inv(jm)
    f = fgrad.reshape(-1, 1)
    return ji - ji @ f @ np.linalg.inv(f.T @ ji @ f) @ f.T @ ji


def fisher(method, p, ts, cls):
    u0s = [0.0, -D_FORM / A_ORB, -2.0 * D_FORM / A_ORB][: {"S1": 1, "F2": 2, "F3": 3}[method]]
    f0 = cls["f0"]
    nunk = 4 if method == "S1" else 3
    jm = np.zeros((nunk, nunk))
    for t in ts:
        st = [geom(*sat_state(t, u0), p) for u0 in u0s]
        g = [snr(x[0], cls) for x in st]
        if method == "S1":
            r, rd, dr, drd = st[0]
            _, sf = sigmas(g[0], cls)
            h = np.concatenate([-(f0 / C) * drd, [1.0 - rd / C]])
            jm += np.outer(h, h) / sf ** 2
        else:
            ra, rda, dra, drda = st[0]
            for i in range(1, len(st)):
                ri, rdi, dri, drdi = st[i]
                ge = g[0] * g[i] / (1.0 + g[0] + g[i])
                st_, sf_ = sigmas(ge, cls)
                h1 = dri - dra
                h2 = drdi - drda
                jm += np.outer(h1, h1) / (C * st_) ** 2 + np.outer(h2, h2) / (C * sf_ / f0) ** 2
    return jm


def metrics(cpos, e, n):
    rot = np.vstack([e, n])
    cc = rot @ cpos @ rot.T
    w, vec = np.linalg.eigh(cc)
    a, b = math.sqrt(w[1]), math.sqrt(max(w[0], 0.0))
    ve, vn = vec[0, 1], vec[1, 1]
    ori = math.atan2(ve, vn) % math.pi
    return a, b, math.sqrt(float(np.trace(cc))), ori


def b1():
    out = []
    for pi, (lat, lon) in enumerate(POINTS, 1):
        p, e, n, up = geodetic(lat, lon)
        grad = np.array([2 * p[0] / RE ** 2, 2 * p[1] / RE ** 2, 2 * p[2] / B_AX ** 2])
        for method, k in (("S1", 1), ("F2", 2), ("F3", 3)):
            u0s = [0.0, -D_FORM / A_ORB, -2.0 * D_FORM / A_ORB][:k]
            ps = passes(p, up, u0s)
            for cname, cls in CLASSES.items():
                row = {"point": f"P{pi}", "method": method, "class": cname}
                if not ps:
                    row["no_pass"] = True
                else:
                    best = max(ps, key=lambda q: max(x[1] for x in q))
                    ts = [x[0] for x in best]
                    jm = fisher(method, p, ts, cls)
                    fg = np.concatenate([grad, [0.0]]) if method == "S1" else grad
                    cr = constrained(jm, fg)[:3, :3]
                    a, b, drms, ori = metrics(cr, e, n)
                    row.update(pass_start_s=ts[0], epochs=len(ts), a_m=a, b_m=b, drms_m=drms, orient_rad=ori)
                out.append(row)
    return {"inclination_deg": math.degrees(INC), "cases": out}


# ---- B2: Cao et al. 2015, Eq. (7) (reading 12) ----
def b2():
    c, f = 3e8, 14e9
    rs, R = 42164e3, 6367.287e3
    sph = lambda r, lon, lat: r * np.array([math.cos(math.radians(lat)) * math.cos(math.radians(lon)),
                                            math.cos(math.radians(lat)) * math.sin(math.radians(lon)),
                                            math.sin(math.radians(lat))])
    s = [sph(rs, -50.0, 2.0), sph(rs, -47.0, 0.0), sph(rs, -53.0, 0.0), sph(rs, -51.5, 3.0)]
    v = [np.array(x) / 3.6 for x in ([-15.48, -13.0, -772.04], [-30.78, -28.70, 972.72],
                                     [-0.054, -0.041, -38.60], [-119.62, -95.15, 1920.34])]
    u = sph(R, -75.9, 45.35)
    m = 4
    r = [float(np.linalg.norm(u - si)) for si in s]
    rd = [float(-vi @ (u - si)) / ri for si, vi, ri in zip(s, v, r)]
    dr_du = [(u - si) / ri for si, ri in zip(s, r)]
    drd_du = [-vi / ri - rdi * (u - si) / ri ** 2 for si, vi, ri, rdi in zip(s, v, r, rd)]
    dr_ds = [-(u - si) / ri for si, ri in zip(s, r)]
    drd_ds = [vi / ri + rdi * (u - si) / ri ** 2 for si, vi, ri, rdi in zip(s, v, r, rd)]
    drd_dv = [-(u - si) / ri for si, ri in zip(s, r)]
    hu = np.zeros((2 * (m - 1), 3))
    hb = np.zeros((2 * (m - 1), 6 * m))
    for i in range(1, m):
        hu[i - 1] = dr_du[i] - dr_du[0]
        hu[m - 1 + i - 1] = drd_du[i] - drd_du[0]
        hb[i - 1, 3 * i:3 * i + 3] = dr_ds[i]
        hb[i - 1, 0:3] = -dr_ds[0]
        hb[m - 1 + i - 1, 3 * i:3 * i + 3] = drd_ds[i]
        hb[m - 1 + i - 1, 0:3] = -drd_ds[0]
        hb[m - 1 + i - 1, 3 * m + 3 * i:3 * m + 3 * i + 3] = drd_dv[i]
        hb[m - 1 + i - 1, 3 * m:3 * m + 3] = -drd_dv[0]
    q = np.full((m - 1, m - 1), 0.5) + 0.5 * np.eye(m - 1)

    def s_km(dt, df, ds, dsd):
        qm = np.block([[(c * dt) ** 2 * q, np.zeros((m - 1, m - 1))], [np.zeros((m - 1, m - 1)), (c * df / f) ** 2 * q]])
        qmi = np.linalg.inv(qm)
        qb = np.diag([ds ** 2] * (3 * m) + [dsd ** 2] * (3 * m))
        x = hu.T @ qmi @ hu
        y = hu.T @ qmi @ hb
        z = np.linalg.inv(qb) + hb.T @ qmi @ hb
        jm = x - y @ np.linalg.inv(z) @ y.T
        cr = constrained(jm, u / np.linalg.norm(u))
        return math.sqrt(float(np.trace(cr))) / 1e3

    pts = []
    for k in range(10):
        dt = 0.1 * (k + 1)
        pts.append(("a", dt, s_km(dt * 1e-6, 20.0, 1e3, 0.05)))
    for df in (10, 15, 20, 25, 30, 35, 40):
        pts.append(("b", df, s_km(0.1e-6, float(df), 1e3, 0.05)))
    for k in range(8):
        ds = 0.25 * (k + 1)
        pts.append(("c", ds, s_km(0.1e-6, 20.0, ds * 1e3, 0.05)))
    return {"points": [{"panel": p, "x": x, "s_km": sv} for p, x, sv in pts]}


if __name__ == "__main__":
    which, path = sys.argv[1], sys.argv[2]
    res = b1() if which == "b1" else b2()
    json.dump(res, open(path, "w"), indent=1)
    print(f"{which}: written {path}")
