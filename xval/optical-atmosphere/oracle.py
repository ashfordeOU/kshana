#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent oracle for the optical-atmosphere bars A1-A3 (see PREREGISTRATION.md).

Shares no code with kshana. Evaluates the same published formulas with mpmath tanh-sinh
quadrature (30 digits) on the original height variable, split at the profile's length scales.
Usage: python3 oracle.py > ../../tests/fixtures/optical_atmosphere/reference.txt
"""
import mpmath as mp

mp.mp.dps = 30
ZEN_DEG = [0, 30, 60, 75]
LAM_NM = [850, 1064, 1550]
PROFILES = [(1.7e-14, 21.0), (5.0e-14, 21.0), (1.7e-14, 30.0)]
H0S = [0.0, 2400.0]
TOP = 30000.0


def cn2(h, A, v):
    h = mp.mpf(h)
    return (mp.mpf("0.00594") * (mp.mpf(v) / 27) ** 2 * (mp.mpf("1e-5") * h) ** 10 * mp.e ** (-h / 1000)
            + mp.mpf("2.7e-16") * mp.e ** (-h / 1500) + mp.mpf(A) * mp.e ** (-h / 100))


def rytov(lam_nm, zen_deg, h0, A, v, wave, direction):
    k = 2 * mp.pi / (mp.mpf(lam_nm) * mp.mpf("1e-9"))
    sec = 1 / mp.cos(mp.radians(zen_deg))
    H = mp.mpf(TOP)
    h0 = mp.mpf(h0)
    L = H - h0
    if wave == "plane" and direction == "down":
        w = lambda h: (h - h0) ** (mp.mpf(5) / 6)
    elif wave == "plane":
        w = lambda h: (H - h) ** (mp.mpf(5) / 6)
    else:
        w = lambda h: ((h - h0) * (H - h) / L) ** (mp.mpf(5) / 6)
    pts = [h0] + [h0 + d for d in (1, 10, 100, 1000, 5000, 15000) if h0 + d < H] + [H]
    I = mp.quad(lambda h: cn2(h, A, v) * w(h), pts)
    return mp.mpf("2.25") * k ** (mp.mpf(7) / 6) * sec ** (mp.mpf(11) / 6) * I


def scint(s, wave):
    s = mp.mpf(s)
    s125 = s ** (mp.mpf(12) / 5)
    cl = mp.mpf("1.11") if wave == "plane" else mp.mpf("0.56")
    lnx = mp.mpf("0.49") * s / (1 + cl * s125) ** (mp.mpf(7) / 6)
    lny = mp.mpf("0.51") * s / (1 + mp.mpf("0.69") * s125) ** (mp.mpf(5) / 6)
    return lnx, lny, mp.e ** (lnx + lny) - 1, 1 / (mp.e ** lnx - 1), 1 / (mp.e ** lny - 1)


def kim_q(V):
    if V > 50: return mp.mpf("1.6")
    if V > 6: return mp.mpf("1.3")
    if V > 1: return mp.mpf("0.16") * V + mp.mpf("0.34")
    if V > 0.5: return V - mp.mpf("0.5")
    return mp.mpf(0)


def clear(lam_nm, V, h0, ha):
    V = mp.mpf(V); r = mp.mpf(lam_nm) / 550
    a0 = mp.mpf("3.91") / V * r ** (-kim_q(V)) / 1000
    aer = mp.quad(lambda h: a0 * mp.e ** (-h / mp.mpf(ha)), [h0, TOP])
    ray = mp.quad(lambda h: mp.mpf("0.0116") * r ** -4 / 1000 * mp.e ** (-h / mp.mpf(8400)), [h0, TOP])
    return aer + ray


def gg_cdf(alpha, beta, t):
    a, b, t = mp.mpf(alpha), mp.mpf(beta), mp.mpf(t)
    c = 2 * (a * b) ** ((a + b) / 2) / (mp.gamma(a) * mp.gamma(b))
    pdf = lambda x: c * x ** ((a + b) / 2 - 1) * mp.besselk(a - b, 2 * mp.sqrt(a * b * x))
    return mp.quad(pdf, [0, t / 1000, t / 100, t / 10, t / 2, t])


def aperture_factor(lam_nm, D, L, wave):
    k = 2 * mp.pi / (mp.mpf(lam_nm) * mp.mpf("1e-9"))
    d2 = k * mp.mpf(D) ** 2 / (4 * mp.mpf(L))
    c = mp.mpf("1.07") if wave == "plane" else mp.mpf("0.214")
    return 1 / (1 + c * d2 ** (mp.mpf(7) / 6))


def p(x): return mp.nstr(x, 17)


print("# optical-atmosphere reference; oracle: mpmath", mp.__version__, "30 digits; see oracle.py")
print("# RYTOV lam_nm zen_deg h0_m top_m A v wave dir sigma2")
for A, v in PROFILES:
    for h0 in H0S:
        for lam in LAM_NM:
            for z in ZEN_DEG:
                for wave, d in (("plane", "down"), ("plane", "up"), ("spherical", "down")):
                    print("RYTOV", lam, z, h0, TOP, A, v, wave, d, p(rytov(lam, z, h0, A, v, wave, d)))
print("# SCINT wave sigma2 lnx lny SI alpha beta")
for wave in ("plane", "spherical"):
    for s in ("0.001", "0.01", "0.1", "0.5", "1", "3", "10", "100"):
        print("SCINT", wave, s, *[p(x) for x in scint(s, wave)])
print("# CLOUD lwp r_eff_um tau")
for L in ("0.01", "0.1", "0.5", "2"):
    for r in ("6", "10", "15"):
        print("CLOUD", L, r, p(3 * mp.mpf(L) / (2 * 1000 * mp.mpf(r) * mp.mpf("1e-6"))))
print("# CLEAR lam_nm V_km h0 top ha tau_zenith")
for lam in LAM_NM:
    for V in ("2", "5", "23", "80"):
        for h0 in H0S:
            print("CLEAR", lam, V, h0, TOP, 1200, p(clear(lam, V, h0, 1200)))
print("# APERTURE lam_nm D_m L_m wave A")
for lam in LAM_NM:
    for D in ("0.05", "0.2", "1"):
        for L in ("5000", "20000"):
            for wave in ("plane", "spherical"):
                print("APERTURE", lam, D, L, wave, p(aperture_factor(lam, D, L, wave)))
print("# FADE lam_nm zen_deg wave fade_db alpha beta prob   (A1 subset: h0=0, HV 5/7, downlink plane / spherical)")
for lam in LAM_NM:
    for z in ZEN_DEG:
        for wave in ("plane", "spherical"):
            s2 = rytov(lam, z, 0.0, 1.7e-14, 21.0, wave, "down")
            lnx, lny, si, al, be = scint(s2, wave)
            for fd in (1, 3, 6, 10):
                t = mp.mpf(10) ** (-mp.mpf(fd) / 10)
                print("FADE", lam, z, wave, fd, p(al), p(be), p(gg_cdf(al, be, t)))
