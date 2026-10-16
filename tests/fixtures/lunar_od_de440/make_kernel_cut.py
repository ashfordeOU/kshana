#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut NAIF's de440s.bsp to 2021-12-31..2022-01-02 for the opt-in De440LunarEnvironment LRO test.

Reuses, unchanged, the bit-for-bit segment cutting (`cut`) and DAF writing (`daf_bytes`) of
tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py, and keeps segments 10 (Sun wrt SSB),
3 (EMB wrt SSB), 301 (Moon wrt EMB) and 399 (Earth wrt EMB), so the geocentric Sun and Moon can
be read. Checks with SPICE that the cut reproduces the full file's geocentric Sun and Moon bit
for bit on a 30-minute grid. Calls no Kshana code.

    source "$KSHANA_ORACLES/env.sh"     # or KSHANA_NAIF_DIR=/path/to/naif
    $ORACLE_PY tests/fixtures/lunar_od_de440/make_kernel_cut.py
"""
import pathlib
import sys

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "llr_datum_kernel_moon"))
import make_kernel_cut as base  # noqa: E402

OUT = HERE / "de440s_2021-12-31_2022-01-02.bsp"
KEEP = [(10, 0), (3, 0), (301, 3), (399, 3)]


def geo(epochs):
    return [(list(sp.spkgeo(10, et, "J2000", 399)[0]), list(sp.spkgeo(301, et, "J2000", 399)[0]))
            for et in epochs]


def main():
    sp.furnsh(str(base.LSK))
    w0 = sp.str2et("2021-12-31 00:00:00 UTC")
    w1 = sp.str2et("2022-01-02 00:00:00 UTC")
    h = sp.dafopr(str(base.SPK))
    sp.dafbfs(h)
    segs = []
    while sp.daffna():
        dc, ic = sp.dafus(sp.dafgs(), 2, 6)
        ic = [int(x) for x in ic]
        if (ic[0], ic[1]) in KEEP and dc[0] <= w1 and dc[1] >= w0:
            dcs, d = base.cut(h, list(dc), ic, w0, w1)
            segs.append((dcs, ic, sp.dafgn(), d))
    sp.dafcls(h)
    assert len(segs) == 4, len(segs)
    OUT.write_bytes(base.daf_bytes(segs))
    grid = [w0 + 1800.0 * k for k in range(1, int((w1 - w0) / 1800.0))]
    sp.furnsh(str(base.SPK))
    full = geo(grid)
    sp.unload(str(base.SPK))
    sp.furnsh(str(OUT))
    sub = geo(grid)
    sp.unload(str(OUT))
    if full != sub:
        OUT.unlink()
        raise SystemExit("the cut kernel does not reproduce de440s.bsp bit for bit")
    print(f"cut reproduces de440s.bsp geocentric Sun and Moon bit for bit at {len(grid)} epochs")
    print("de440s.bsp", base.sha(base.SPK))
    print("cut       ", OUT.name, base.sha(OUT), OUT.stat().st_size, "bytes")


if __name__ == "__main__":
    main()
