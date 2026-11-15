# SPDX-License-Identifier: AGPL-3.0-only
"""B3c: independent recomputation of the TDOA locator's successor (README readings U3 to U9, check U12).
numpy and the standard library only; shares no code with the engine. It reuses the geometry, domain and chi-square
helpers of B3b's oracle (`../tdoa-locator/oracle.py`, itself independent of the engine). Written before any B3c
engine code.

    python3 -I oracle.py SESSION.json [SESSION.json ...] > oracle.json

Each SESSION.json and its .iq file are one session's input as the engine writes it (B3b's `oracle_input`).
"""
import importlib.util
import json
import math
import os
import sys

import numpy as np

_spec = importlib.util.spec_from_file_location(
    "b3b_oracle", os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tdoa-locator", "oracle.py"))
b3b = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(b3b)

C = b3b.C
CHI2_2_95 = b3b.CHI2_2_95
BUFFER_M = b3b.BUFFER_M
SIGMA_R = 2.5e-9
PHI = (math.sqrt(5.0) - 1.0) / 2.0


def signed_index(m):
    q = np.arange(m, dtype=float)
    q[m // 2 + 1:] -= m
    return q


def interp(g, q, m, t):
    """U5: |sum_q G_q exp(j 2 pi q' t / M)|^2."""
    v = np.sum(g * np.exp(1j * 2.0 * math.pi * q * t / m))
    return float(v.real * v.real + v.imag * v.imag)


def golden(g, q, m, k):
    """U5: golden-section search for the maximum of the interpolant on [k - 1, k + 1], to 1e-4 sample."""
    a, b = k - 1.0, k + 1.0
    c = b - PHI * (b - a)
    d = a + PHI * (b - a)
    fc, fd = interp(g, q, m, c), interp(g, q, m, d)
    while b - a > 1e-4:
        if fc > fd:
            b, d, fd = d, c, fc
            c = b - PHI * (b - a)
            fc = interp(g, q, m, c)
        else:
            a, c, fc = c, d, fd
            d = a + PHI * (b - a)
            fd = interp(g, q, m, d)
    return 0.5 * (a + b)


def run(path):
    doc = json.load(open(path))
    fs, n, sc = doc["fs"], doc["n"], doc["sigma_c_s"]
    st = doc["stations"]
    ns = len(st)
    raw = np.fromfile(os.path.join(os.path.dirname(path), doc["iq"]), dtype="<f8")
    x = (raw[0::2] + 1j * raw[1::2]).reshape(ns, n)
    s_hat = np.maximum(1e-6, np.mean(np.abs(x) ** 2, axis=1) - 1.0)
    ref = int(np.argmax(s_hat))
    pos = [b3b.ecef(doc, e, nn, doc["h_station_m"]) for e, nn in st]
    m = 2 * n
    q = signed_index(m)
    area_dom, grid = b3b.domain(st)
    cen = np.mean(np.array(grid), axis=0)
    truth = np.array(doc["truth"], dtype=float)
    out = {"seed": doc["seed"], "waveform": doc["waveform"], "reference": ref, "domain_area_m2": area_dom}

    # U4: bandwidth and period screen
    xref = np.fft.fft(x[ref], m)
    gref = np.abs(xref) ** 2
    acf = np.abs(np.fft.ifft(gref))
    rho = acf / (n * s_hat[ref])
    k0 = next((k for k in range(1, 17) if rho[k] < 0.5), None)
    if k0 is None:
        out.update({"class": "narrowband", "period_samples": None, "k_star": [], "tau_s": [], "sigma_s": [],
                    "estimate": [float(cen[0]), float(cen[1])], "cost": None, "located": False,
                    "region_area_m2": 0.0, "covered": False, "error_m": float(np.linalg.norm(truth - cen))})
        return out
    p_int = next((k for k in range(k0 + 1, 201)
                  if rho[k] >= 0.5 and rho[k] >= rho[k - 1] and rho[k] >= rho[k + 1]), None)
    period = golden(gref, q, m, float(p_int)) if p_int is not None else None

    # T11: beta^2 of the reference (unchanged)
    xr = np.fft.fft(x[ref])
    pk = np.maximum(0.0, np.abs(xr) ** 2 / n - 1.0)
    f = np.arange(n) * fs / n
    f[n // 2 + 1:] -= fs
    if pk.sum() > 0:
        fbar = (pk * f).sum() / pk.sum()
        beta2 = max((pk * (f - fbar) ** 2).sum() / pk.sum(), 1e6)
    else:
        beta2 = 1e6

    # U5, U6: delays and sigma
    others = [i for i in range(ns) if i != ref]
    kstar, tau, sig = [], [], []
    for i in others:
        g = np.fft.fft(x[i], m) * np.conj(xref)
        r = np.abs(np.fft.ifft(g))
        d = float(np.linalg.norm(pos[i] - pos[ref]))
        kw = math.ceil((d / C + 6 * math.sqrt(2) * sc) * fs) + 2
        best, bk = -1.0, None
        for k in range(-kw, kw + 1):
            v = r[k % m]
            if v > best:
                best, bk = v, k
        t = golden(g, q, m, float(bk)) if -kw < bk < kw else float(bk)
        kstar.append(bk)
        tau.append(t / fs)
        snr = s_hat[i] * s_hat[ref] / (1 + s_hat[i] + s_hat[ref])
        crb = 1.0 / (8 * math.pi ** 2 * beta2 * n * snr)
        sig.append(math.sqrt(crb + 2 * sc ** 2 + SIGMA_R ** 2))
    tau = np.array(tau)
    cov = np.full((ns - 1, ns - 1), sc ** 2)
    np.fill_diagonal(cov, np.array(sig) ** 2)
    ci = np.linalg.inv(cov)
    hj = doc["h_jammer_m"]
    per_s = period / fs if period is not None else None

    def model(p):
        qq = b3b.ecef(doc, p[0], p[1], hj)
        dr = np.linalg.norm(qq - pos[ref])
        return np.array([(np.linalg.norm(qq - pos[i]) - dr) / C for i in others])

    def resid(p):
        r = tau - model(p)
        if per_s is not None:
            r = r - per_s * np.floor(r / per_s + 0.5)
        return r

    def cost(p):
        r = resid(p)
        return float(r @ ci @ r)

    # U8: grid start, bounded Gauss-Newton
    best, p = math.inf, None
    for gp in grid:
        v = cost(gp)
        if v < best:
            best, p = v, np.array(gp, dtype=float)

    def jac(p):
        jm = np.zeros((ns - 1, 2))
        for k in range(2):
            dp = np.zeros(2)
            dp[k] = 0.5
            jm[:, k] = (model(p + dp) - model(p - dp)) / 1.0
        return jm

    cp = cost(p)
    for _ in range(50):
        jm = jac(p)
        nmat = jm.T @ ci @ jm
        s = np.linalg.solve(nmat, jm.T @ ci @ resid(p))
        ln = math.hypot(s[0], s[1])
        if ln > 1000.0:
            s = s * (1000.0 / ln)
        accepted = False
        for _h in range(11):
            cand = p + s
            cc = cost(cand)
            if cc < cp:
                accepted = True
                break
            s = s / 2.0
        if not accepted:
            break
        p, cp = cand, cc
        if math.hypot(s[0], s[1]) < 1e-3:
            break

    # U9
    jm = jac(p)
    pc = np.linalg.inv(jm.T @ ci @ jm)
    final = cost(p)
    in_domain = b3b.dist_to_hull(b3b.hull(st), (float(p[0]), float(p[1]))) <= BUFFER_M
    located = bool(in_domain and final <= b3b.chi2_quantile(0.999, ns - 3))
    area = math.pi * CHI2_2_95 * math.sqrt(np.linalg.det(pc))
    dv = truth - p
    covered = bool(located and float(dv @ np.linalg.inv(pc) @ dv) <= CHI2_2_95)
    err = float(np.linalg.norm(dv)) if located else float(np.linalg.norm(truth - cen))
    out.update({"class": "periodic" if period is not None else "aperiodic", "period_samples": period,
                "k_star": kstar, "tau_s": [float(t) for t in tau], "sigma_s": [float(s) for s in sig],
                "estimate": [float(p[0]), float(p[1])], "cost": final, "located": located,
                "region_area_m2": area, "covered": covered, "error_m": err})
    return out


if __name__ == "__main__":
    print(json.dumps([run(a) for a in sys.argv[1:]], indent=1))
