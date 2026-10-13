# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the Kepler-equation oracle fixture (reference.json) with mpmath.

Run with the oracle toolchain's Python (mpmath 1.3.0):

    /root/kshana-oracles/.venv/bin/python -I gen_reference.py > reference.json

For every float64 pair (e, M) of the grid, the root E of E - e sin E = M is found by mpmath
at 50 significant digits from the *exact* binary values of e and M (mpf(float) is exact), and
stored as a double-double (hi = E rounded to float64, lo = float64(E - hi)), together with the
condition factor 1 - e cos E. The grid:
  e in {0, 1e-6, 0.1, 0.5, 0.9, 0.99, 0.999, 0.9999, 0.999999};
  M in {1e-12, 1e-9, 1e-6, 1e-3, 1e-2, 0.1}, k*pi/32 for k = 1..31, pi - 1e-3, pi - 1e-6,
       pi - 1e-9, the float64 nearest pi, and the negatives of 1e-12, 1e-6, 1.0, 3.0;
  plus winding cases M in {7.0, -50.0, 1000.0} for e in {0.1, 0.5, 0.9} (E then carries the
  same 2 pi winding as M).
"""
import json
import math
import sys

import mpmath as mp

mp.mp.dps = 50

ES = [0.0, 1e-6, 0.1, 0.5, 0.9, 0.99, 0.999, 0.9999, 0.999999]


def m_grid():
    g = [1e-12, 1e-9, 1e-6, 1e-3, 1e-2, 0.1]
    g += [k * math.pi / 32.0 for k in range(1, 32)]
    g += [math.pi - 1e-3, math.pi - 1e-6, math.pi - 1e-9, math.pi]
    g += [-1e-12, -1e-6, -1.0, -3.0]
    return g


def solve(m, e):
    M = mp.mpf(m)
    e_ = mp.mpf(e)
    if e == 0.0:
        return M
    # f(E) = E - e sin E - M is strictly increasing (f' >= 1 - e > 0) and changes sign on
    # [M - e, M + e]: bisect to the working precision, then two Newton polishes.
    f = lambda x: x - e_ * mp.sin(x) - M
    lo, hi = M - e_, M + e_
    for _ in range(200):
        mid = (lo + hi) / 2
        if f(mid) < 0:
            lo = mid
        else:
            hi = mid
    E = (lo + hi) / 2
    for _ in range(2):
        E = E - f(E) / (1 - e_ * mp.cos(E))
    assert abs(f(E)) < mp.mpf(10) ** -45 * max(1, abs(M)), (m, e, f(E))
    return E


def record(e, m):
    E = solve(m, e)
    hi = float(E)
    lo = float(E - mp.mpf(hi))
    return {
        "e": e,
        "m": m,
        "e_hi": hi,
        "e_lo": lo,
        "cond": float(1 - mp.mpf(e) * mp.cos(E)),
    }


def main():
    grid = [record(e, m) for e in ES for m in m_grid()]
    winding = [record(e, m) for e in (0.1, 0.5, 0.9) for m in (7.0, -50.0, 1000.0)]
    doc = {
        "generator": "tests/fixtures/kepler_mpmath_oracle/gen_reference.py",
        "mpmath": mp.__version__,
        "dps": mp.mp.dps,
        "grid": grid,
        "winding": winding,
    }
    # One record per line, compact.
    head = {k: v for k, v in doc.items() if k not in ("grid", "winding")}
    out = json.dumps(head)[:-1]
    for key in ("grid", "winding"):
        rows = ",\n".join(json.dumps(r, separators=(",", ":")) for r in doc[key])
        out += ', "%s": [\n%s\n]' % (key, rows)
    sys.stdout.write(out + "}\n")


if __name__ == "__main__":
    main()
