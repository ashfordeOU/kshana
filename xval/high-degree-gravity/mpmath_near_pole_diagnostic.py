# SPDX-License-Identifier: AGPL-3.0-only
"""Diagnostic (no bar): 50-digit evaluation of the degree-70 non-central EGM2008 acceleration
at the near-pole points P2 and P9, to attribute the pyshtools near-pole differences recorded
in RESULTS.md. The gradient is a 50-digit central difference (h = 1e-6 m) of a 50-digit
direct sum of the potential (plain normalized forward-column recursion in mpmath).

Usage: python -I mpmath_near_pole_diagnostic.py
(reads tools/egm2008_to70.gfc and the committed fixtures; prints the differences of
Orekit, pyshtools and, if given as argv[1], a kshana table "id ax ay az" from this value)
"""
import os
import sys

import mpmath as mp

mp.mp.dps = 50
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
FIX = os.path.join(ROOT, "tests", "fixtures", "high_degree_gravity")
N = 70


def read_gfc(path):
    gm = re = None
    c, s = {}, {}
    body = False
    for line in open(path):
        p = line.split()
        if not p:
            continue
        if not body:
            if p[0] == "earth_gravity_constant":
                gm = mp.mpf(p[1])
            elif p[0] == "radius":
                re = mp.mpf(p[1])
            elif p[0] == "end_of_head":
                body = True
            continue
        if p[0] == "gfc":
            n, m = int(p[1]), int(p[2])
            f = lambda t: mp.mpf(t.replace("d", "e").replace("D", "e"))
            c[(n, m)], s[(n, m)] = f(p[3]), f(p[4])
    return gm, re, c, s


GM, RE, C, S = read_gfc(os.path.join(ROOT, "tools", "egm2008_to70.gfc"))


def potential(x, y, z):
    r = mp.sqrt(x * x + y * y + z * z)
    t = z / r
    u = mp.sqrt(x * x + y * y) / r
    lam = mp.atan2(y, x)
    p = [[mp.mpf(0)] * (N + 1) for _ in range(N + 1)]
    p[0][0] = mp.mpf(1)
    for m in range(1, N + 1):
        d = mp.sqrt(2) if m == 1 else 1
        p[m][m] = u * d * mp.sqrt(mp.mpf(2 * m + 1) / (2 * m)) * p[m - 1][m - 1]
    for m in range(0, N):
        p[m + 1][m] = t * mp.sqrt(2 * m + 3) * p[m][m]
    for m in range(0, N + 1):
        for n in range(m + 2, N + 1):
            a = mp.sqrt(mp.mpf((2 * n - 1) * (2 * n + 1)) / ((n - m) * (n + m)))
            b = mp.sqrt(mp.mpf((2 * n + 1) * (n - 1 - m) * (n - 1 + m)) / ((2 * n - 3) * (n - m) * (n + m)))
            p[n][m] = a * t * p[n - 1][m] - b * p[n - 2][m]
    tot = mp.mpf(0)
    q = RE / r
    for n in range(2, N + 1):
        acc = mp.mpf(0)
        for m in range(0, n + 1):
            acc += p[n][m] * (C.get((n, m), 0) * mp.cos(m * lam) + S.get((n, m), 0) * mp.sin(m * lam))
        tot += q**n * acc
    return GM / r * tot


def grad(x, y, z, h=mp.mpf("1e-6")):
    g = []
    for k in range(3):
        a = [x, y, z]
        b = [x, y, z]
        a[k] += h
        b[k] -= h
        g.append((potential(*a) - potential(*b)) / (2 * h))
    return g


def table(path, n):
    out = {}
    for line in open(path):
        p = line.split()
        if not p or p[0].startswith("#") or int(p[0]) != n:
            continue
        out[p[1]] = [float(v) for v in p[2:5]]
    return out


pts = {}
for line in open(os.path.join(FIX, "points.txt")):
    p = line.split()
    if p and not p[0].startswith("#"):
        pts[p[0]] = [mp.mpf(v) for v in p[4:7]]
ore = table(os.path.join(FIX, "orekit_egm2008.txt"), N)
pys = table(os.path.join(FIX, "pyshtools_egm2008.txt"), N)
ksh = {}
if len(sys.argv) > 1:
    for line in open(sys.argv[1]):
        p = line.split()
        if p and not p[0].startswith("#"):
            ksh[p[0]] = [float(v) for v in p[1:4]]
for pid in ["P1", "P2", "P9"]:
    ref = grad(*pts[pid])
    def d(v):
        return float(mp.sqrt(sum((mp.mpf(v[i]) - ref[i]) ** 2 for i in range(3))))
    line = f"{pid}: |a_ref| {float(mp.sqrt(sum(g * g for g in ref))):.4e}  orekit {d(ore[pid]):.3e}  pyshtools {d(pys[pid]):.3e}"
    if pid in ksh:
        line += f"  kshana {d(ksh[pid]):.3e}"
    print(line)
