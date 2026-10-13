#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut NAIF's de440s.bsp around the three epochs of tests/solar_system_kernel_oracle.rs.

Reuses, unchanged, the bit-for-bit cutting (`cut`) and DAF writing (`daf_bytes`) of
tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py, keeping segments 10, 1, 199, 2, 299,
3, 399 and 301 over +-2 days of each epoch, one file per epoch, and checks with SPICE that each
cut reproduces the full file's heliocentric Mercury, Venus, Earth and Moon bit for bit on a
1-hour grid. Calls no Kshana code.

    source "$KSHANA_ORACLES/env.sh"     # or KSHANA_NAIF_DIR=/path/to/naif
    $ORACLE_PY tests/fixtures/solar_system_kernel/make_kernel_cuts.py
"""
import pathlib
import sys

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "llr_datum_kernel_moon"))
import make_kernel_cut as base  # noqa: E402

KEEP = [(10, 0), (1, 0), (199, 1), (2, 0), (299, 2), (3, 0), (399, 3), (301, 3)]
EPOCHS_JD = [2461041.5, 2462668.0, 2466519.5]
BODIES = [199, 299, 399, 301]


def helio(epochs):
    return [[list(sp.spkgeo(b, et, "J2000", 10)[0]) for b in BODIES] for et in epochs]


def main():
    for jd in EPOCHS_JD:
        et = (jd - 2451545.0) * 86400.0
        w0, w1 = et - 2 * 86400.0, et + 2 * 86400.0
        out = HERE / ("de440s_cut_jd%.1f.bsp" % jd)
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
        assert len(segs) == len(KEEP), len(segs)
        out.write_bytes(base.daf_bytes(segs))
        grid = [w0 + 3600.0 * k for k in range(1, 96)]
        sp.furnsh(str(base.SPK))
        full = helio(grid)
        sp.unload(str(base.SPK))
        sp.furnsh(str(out))
        sub = helio(grid)
        sp.unload(str(out))
        if full != sub:
            out.unlink()
            raise SystemExit("cut %s does not reproduce de440s.bsp bit for bit" % out.name)
        print("cut", out.name, base.sha(out), out.stat().st_size, "bytes; bit for bit at", len(grid), "epochs")


if __name__ == "__main__":
    main()
