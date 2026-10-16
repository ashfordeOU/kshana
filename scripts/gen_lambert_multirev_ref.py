#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate tests/fixtures/lambert_multirev/reference.csv (multi-revolution Lambert oracle).

Implements the case set of docs/design/evidence/lambert-multirev/PREREGISTRATION.md exactly and
solves every case with pykep 3.0.1 (`lambert_problem`, the C++ kep3 core, MPL-2.0), run as a
separate program. Calls no Kshana code; no pykep code is copied into Kshana.

    python -I scripts/gen_lambert_multirev_ref.py

The pykep 3.0.1 wheel's package __init__ fails on a missing data file of an unrelated module
(trajopt.gym), so the compiled `pykep.core` extension is loaded directly under a stub package.
"""
import importlib.metadata
import math
import pathlib
import random
import sys
import types

import importlib.util

spec = importlib.util.find_spec("pykep")
if spec is None:
    raise SystemExit("pykep is not installed")
_pkg = types.ModuleType("pykep")
_pkg.__path__ = list(spec.submodule_search_locations)
sys.modules["pykep"] = _pkg
import pykep.core as core  # noqa: E402

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "tests" / "fixtures" / "lambert_multirev" / "reference.csv"
SEED = 20261012
MAX_REVS = 3
MU_SUN = 1.32712440018e20
AU = 1.495978707e11
DAY = 86400.0


def unit(v):
    n = math.sqrt(sum(x * x for x in v))
    return [x / n for x in v]


def angle(a, b):
    c = sum(x * y for x, y in zip(a, b)) / (
        math.sqrt(sum(x * x for x in a)) * math.sqrt(sum(x * x for x in b)))
    return math.degrees(math.acos(max(-1.0, min(1.0, c))))


def nmax(r1, r2, tof, mu, prograde, m):
    return core.lambert_problem(r0=r1, r1=r2, tof=tof, mu=mu, cw=not prograde, multi_revs=m).Nmax


def t_min(r1, r2, mu, prograde, m):
    """Smallest tof with an m-revolution solution: bisection on pykep's Nmax (relative 1e-13)."""
    lo, hi = 1e-6, 1.0
    while nmax(r1, r2, hi, mu, prograde, m) < m:
        hi *= 2.0
    # lo has fewer than m revolutions (tiny tof).
    while (hi - lo) > 1e-13 * hi:
        mid = 0.5 * (lo + hi)
        if nmax(r1, r2, mid, mu, prograde, m) >= m:
            hi = mid
        else:
            lo = mid
    return hi


def cases():
    rng = random.Random(SEED)
    out = []
    # A: random 3-D, canonical.
    for i in range(300):
        r1n = rng.uniform(0.5, 2.0)
        r2n = rng.uniform(0.5, 3.0)
        while True:
            u1 = unit([rng.gauss(0, 1) for _ in range(3)])
            u2 = unit([rng.gauss(0, 1) for _ in range(3)])
            if 1.0 <= angle(u1, u2) <= 179.0:
                break
        tof = math.exp(rng.uniform(math.log(0.5), math.log(60.0)))
        out.append(("A", f"A{i:03d}", 1.0, [r1n * x for x in u1], [r2n * x for x in u2], tof,
                    i % 2 == 0))
    # B: near 180 deg.
    k = 0
    tilt = math.radians(30.0)
    for t_deg in (179.0, 179.9, 179.99):
        t = math.radians(t_deg)
        for tof in (2.0, 10.0, 25.0):
            for prograde in (True, False):
                r2 = [1.5 * math.cos(t), 1.5 * math.sin(t) * math.cos(tilt),
                      1.5 * math.sin(t) * math.sin(tilt)]
                out.append(("B", f"B{k:02d}", 1.0, [1.0, 0.0, 0.0], r2, tof, prograde))
                k += 1
    # C: near the minimum tof of the top revolution count.
    k = 0
    for kk, t_deg in ((1.0, 60.0), (1.5, 120.0), (2.0, 200.0), (0.8, 300.0)):
        t = math.radians(t_deg)
        r1 = [1.0, 0.0, 0.0]
        r2 = [kk * math.cos(t), kk * math.sin(t), kk * 0.1]
        for m in (1, 2, 3):
            tm = t_min(r1, r2, 1.0, True, m)
            for d in (1e-2, 1e-3):
                out.append(("C", f"C{k:02d}", 1.0, r1, r2, tm * (1.0 + d), True))
                k += 1
    # D: heliocentric SI.
    for i in range(40):
        r1n = rng.uniform(0.7, 1.7) * AU
        r2n = rng.uniform(0.7, 1.7) * AU
        while True:
            l1 = rng.uniform(0.0, 2.0 * math.pi)
            u1 = unit([math.cos(l1), math.sin(l1), rng.uniform(-0.05, 0.05)])
            l2 = rng.uniform(0.0, 2.0 * math.pi)
            u2 = unit([math.cos(l2), math.sin(l2), rng.uniform(-0.05, 0.05)])
            if 1.0 <= angle(u1, u2) <= 179.0:
                break
        tof = rng.uniform(30.0, 1500.0) * DAY
        out.append(("D", f"D{i:02d}", MU_SUN, [r1n * x for x in u1], [r2n * x for x in u2], tof,
                    i % 2 == 0))
    return out


def main():
    rows = []
    for fam, name, mu, r1, r2, tof, prograde in cases():
        lp = core.lambert_problem(r0=r1, r1=r2, tof=tof, mu=mu, cw=not prograde,
                                  multi_revs=MAX_REVS)
        n = lp.Nmax
        tmins = {m: t_min(r1, r2, mu, prograde, m) for m in range(1, n + 1)}
        for j, (v1, v2) in enumerate(zip(lp.v0, lp.v1)):
            m = (j + 1) // 2
            branch = "none" if j == 0 else ("left" if j % 2 == 1 else "right")
            d_m = (tof / tmins[m] - 1.0) if m > 0 else float("inf")
            rows.append([fam, name, mu, *r1, *r2, tof, int(prograde), n, m, branch, d_m,
                         *v1, *v2])
    OUT.parent.mkdir(parents=True, exist_ok=True)
    ver = importlib.metadata.version("pykep")
    with open(OUT, "w") as f:
        f.write(f"# scripts/gen_lambert_multirev_ref.py; pykep {ver} lambert_problem; seed {SEED}; "
                f"max_revs {MAX_REVS}\n")
        f.write("# family,case,mu,r1x,r1y,r1z,r2x,r2y,r2z,tof,prograde,nmax,revs,branch,d_m,"
                "v1x,v1y,v1z,v2x,v2y,v2z\n")
        for r in rows:
            f.write(",".join(repr(float(x)) if isinstance(x, float) else str(x) for x in r)
                    + "\n")
    print(f"{len(rows)} solutions written to {OUT}")


if __name__ == "__main__":
    main()
