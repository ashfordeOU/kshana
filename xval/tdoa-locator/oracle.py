# SPDX-License-Identifier: AGPL-3.0-only
"""B3b: independent recomputation of the TDOA locator (README readings T8 to T13, check T16). numpy and the
standard library only; shares no code with the engine. Committed before any B3b engine code.

    python3 -I oracle.py SESSION.json [SESSION.json ...] > oracle.json

Each SESSION.json is one session's input as the engine writes it:

    {"seed": 6001, "waveform": "cw", "fs": 4000000.0, "n": 40000, "sigma_c_s": 2e-08,
     "earth_radius_m": 6371000.0, "lat0_deg": 59.0, "lon0_deg": 11.0, "h_station_m": 10.0, "h_jammer_m": 2.0,
     "stations": [[e, n], ...], "truth": [e, n], "iq": "6001.iq"}

and `iq` names a file beside it holding, station after station, the N complex samples as little-endian float64
pairs (re, im). The output is one JSON object per session (a JSON list), with the reference, every k*, tau and
sigma, the solution, the final cost, the located flag, the region area, the coverage and the error.
"""
import json
import math
import os
import sys

import numpy as np

C = 299792458.0
CHI2_2_95 = 5.991464547107979
BUFFER_M = 10000.0
GRID_M = 250.0


# ------------------------------------------------------------------ geometry (T2, T4)

def ecef(doc, e, n, h):
    r = doc["earth_radius_m"]
    lat0 = math.radians(doc["lat0_deg"])
    lon0 = math.radians(doc["lon0_deg"])
    lat = lat0 + n / r
    lon = lon0 + e / (r * math.cos(lat0))
    return np.array([(r + h) * math.cos(lat) * math.cos(lon), (r + h) * math.cos(lat) * math.sin(lon),
                     (r + h) * math.sin(lat)])


def hull(points):
    pts = sorted(set(map(tuple, points)))
    if len(pts) < 3:
        return pts

    def cross(o, a, b):
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])

    lo, up = [], []
    for p in pts:
        while len(lo) >= 2 and cross(lo[-2], lo[-1], p) <= 0:
            lo.pop()
        lo.append(p)
    for p in reversed(pts):
        while len(up) >= 2 and cross(up[-2], up[-1], p) <= 0:
            up.pop()
        up.append(p)
    return lo[:-1] + up[:-1]


def dist_to_hull(h, p):
    inside = True
    for i in range(len(h)):
        a, b = h[i], h[(i + 1) % len(h)]
        if (b[0] - a[0]) * (p[1] - a[1]) - (b[1] - a[1]) * (p[0] - a[0]) < 0:
            inside = False
            break
    if inside:
        return 0.0
    best = math.inf
    for i in range(len(h)):
        a, b = h[i], h[(i + 1) % len(h)]
        dx, dy = b[0] - a[0], b[1] - a[1]
        t = ((p[0] - a[0]) * dx + (p[1] - a[1]) * dy) / (dx * dx + dy * dy)
        t = min(1.0, max(0.0, t))
        best = min(best, math.hypot(p[0] - (a[0] + t * dx), p[1] - (a[1] + t * dy)))
    return best


def domain(stations):
    h = hull(stations)
    area = 0.0
    per = 0.0
    for i in range(len(h)):
        a, b = h[i], h[(i + 1) % len(h)]
        area += a[0] * b[1] - b[0] * a[1]
        per += math.hypot(b[0] - a[0], b[1] - a[1])
    area = 0.5 * area + per * BUFFER_M + math.pi * BUFFER_M ** 2
    e_min = min(p[0] for p in h) - BUFFER_M
    e_max = max(p[0] for p in h) + BUFFER_M
    n_min = min(p[1] for p in h) - BUFFER_M
    n_max = max(p[1] for p in h) + BUFFER_M
    grid = []
    j = 0
    while n_min + GRID_M * j <= n_max:
        i = 0
        while e_min + GRID_M * i <= e_max:
            p = (e_min + GRID_M * i, n_min + GRID_M * j)
            if dist_to_hull(h, p) <= BUFFER_M:
                grid.append(p)
            i += 1
        j += 1
    return area, grid


# ------------------------------------------------------------------ chi-squared quantile

def gammainc_lower(s, x):
    """Regularised lower incomplete gamma P(s, x): series for x < s + 1, continued fraction otherwise."""
    if x <= 0:
        return 0.0
    if x < s + 1:
        term = 1.0 / s
        total = term
        k = 0
        while abs(term) > abs(total) * 1e-17 and k < 100000:
            k += 1
            term *= x / (s + k)
            total += term
        return total * math.exp(-x + s * math.log(x) - math.lgamma(s))
    tiny = 1e-300
    b = x + 1 - s
    cc = 1 / tiny
    d = 1 / b
    h = d
    for i in range(1, 100000):
        an = -i * (i - s)
        b += 2
        d = an * d + b
        d = tiny if abs(d) < tiny else d
        cc = b + an / cc
        cc = tiny if abs(cc) < tiny else cc
        d = 1 / d
        delta = d * cc
        h *= delta
        if abs(delta - 1) < 1e-17:
            break
    return 1 - h * math.exp(-x + s * math.log(x) - math.lgamma(s))


def chi2_quantile(p, k):
    lo, hi = 0.0, k + 10 * math.sqrt(k) + 20
    while gammainc_lower(k / 2, hi / 2) < p:
        hi *= 2
    for _ in range(200):
        mid = 0.5 * (lo + hi)
        if gammainc_lower(k / 2, mid / 2) < p:
            lo = mid
        else:
            hi = mid
    return 0.5 * (lo + hi)


# ------------------------------------------------------------------ the locator (T8 to T13)

def run(path):
    doc = json.load(open(path))
    fs, n, sc = doc["fs"], doc["n"], doc["sigma_c_s"]
    st = doc["stations"]
    ns = len(st)
    raw = np.fromfile(os.path.join(os.path.dirname(path), doc["iq"]), dtype="<f8")
    x = (raw[0::2] + 1j * raw[1::2]).reshape(ns, n)
    s_hat = np.maximum(1e-6, np.mean(np.abs(x) ** 2, axis=1) - 1.0)
    ref = int(np.argmax(s_hat))  # first maximum on ties
    pos = [ecef(doc, e, nn, doc["h_station_m"]) for e, nn in st]

    # T11: beta^2 of the reference
    xr = np.fft.fft(x[ref])
    pk = np.maximum(0.0, np.abs(xr) ** 2 / n - 1.0)
    f = np.arange(n) * fs / n
    f[n // 2 + 1:] -= fs
    if pk.sum() > 0:
        fbar = (pk * f).sum() / pk.sum()
        beta2 = max((pk * (f - fbar) ** 2).sum() / pk.sum(), 1e6)
    else:
        beta2 = 1e6

    # T10: TDOA by cross-correlation
    m = 2 * n
    xref = np.fft.fft(x[ref], m)
    others = [i for i in range(ns) if i != ref]
    kstar, tau, sig = [], [], []
    for i in others:
        r = np.abs(np.fft.ifft(np.fft.fft(x[i], m) * np.conj(xref)))
        d = float(np.linalg.norm(pos[i] - pos[ref]))
        kw = math.ceil((d / C + 6 * math.sqrt(2) * sc) * fs) + 2
        best, bk = -1.0, None
        for k in range(-kw, kw + 1):
            v = r[k % m]
            if v > best:
                best, bk = v, k
        if -kw < bk < kw:
            a, b, c = r[(bk - 1) % m], r[bk % m], r[(bk + 1) % m]
            den = a - 2 * b + c
            delta = 0.5 * (a - c) / den if den != 0 else 0.0
        else:
            delta = 0.0
        kstar.append(bk)
        tau.append((bk + delta) / fs)
        snr = s_hat[i] * s_hat[ref] / (1 + s_hat[i] + s_hat[ref])
        crb = 1.0 / (8 * math.pi ** 2 * beta2 * n * snr)
        sig.append(math.sqrt(crb + 2 * sc ** 2))
    tau = np.array(tau)
    cov = np.full((ns - 1, ns - 1), sc ** 2)
    np.fill_diagonal(cov, np.array(sig) ** 2)
    ci = np.linalg.inv(cov)

    hj = doc["h_jammer_m"]

    def model(p):
        q = ecef(doc, p[0], p[1], hj)
        dr = np.linalg.norm(q - pos[ref])
        return np.array([(np.linalg.norm(q - pos[i]) - dr) / C for i in others])

    def cost(p):
        r = tau - model(p)
        return float(r @ ci @ r)

    # T12: grid start, then Gauss-Newton
    area_dom, grid = domain(st)
    best, p = math.inf, None
    for g in grid:
        v = cost(g)
        if v < best:
            best, p = v, np.array(g, dtype=float)

    def jac(p):
        jm = np.zeros((ns - 1, 2))
        for k in range(2):
            dp = np.zeros(2)
            dp[k] = 0.5
            jm[:, k] = (model(p + dp) - model(p - dp)) / 1.0
        return jm

    for _ in range(20):
        jm = jac(p)
        r = tau - model(p)
        nmat = jm.T @ ci @ jm
        step = np.linalg.solve(nmat, jm.T @ ci @ r)
        p = p + step
        if math.hypot(step[0], step[1]) < 1e-3:
            break
    jm = jac(p)
    pc = np.linalg.inv(jm.T @ ci @ jm)
    final = cost(p)
    located = final <= chi2_quantile(0.999, ns - 3)
    area = math.pi * CHI2_2_95 * math.sqrt(np.linalg.det(pc))
    truth = np.array(doc["truth"], dtype=float)
    dv = truth - p
    covered = bool(located and float(dv @ np.linalg.inv(pc) @ dv) <= CHI2_2_95)
    cen = np.mean(np.array(grid), axis=0)
    err = float(np.linalg.norm(dv)) if located else float(np.linalg.norm(truth - cen))
    return {
        "seed": doc["seed"], "waveform": doc["waveform"], "reference": ref, "k_star": kstar,
        "tau_s": [float(t) for t in tau], "sigma_s": [float(s) for s in sig], "beta2_hz2": float(beta2),
        "estimate": [float(p[0]), float(p[1])], "cost": final, "located": bool(located), "region_area_m2": area,
        "domain_area_m2": area_dom, "covered": covered, "error_m": err,
    }


if __name__ == "__main__":
    print(json.dumps([run(a) for a in sys.argv[1:]], indent=1))
