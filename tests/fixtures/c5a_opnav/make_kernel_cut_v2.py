#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""C5a v2: cut NAIF's de440s.bsp to 2025-01-01..2029-10-08, the v1 and fresh geometries of xval/c5a-opnav-v2/README.md
(reading 7); otherwise exactly v1's make_kernel_cut.py. Reuses, unchanged, the bit-for-bit segment cutting (`cut`) and DAF writing (`daf_bytes`) of
tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py, and keeps segments 10 (Sun wrt SSB), 3 (EMB wrt SSB),
301 (Moon wrt EMB), 399 (Earth wrt EMB) and 4 (Mars barycentre wrt SSB). Checks with SPICE that the cut gives the
full file's barycentric states of the Moon, the Earth and the Mars barycentre bit for bit at every C5a case epoch.
Calls no Kshana code.

    KSHANA_NAIF_DIR=/path/to/naif python3 tests/fixtures/c5a_opnav/make_kernel_cut_v2.py
"""
import pathlib
import sys

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "llr_datum_kernel_moon"))
import make_kernel_cut as base  # noqa: E402

OUT = HERE / "de440s_2025-01-01_2029-10-08.bsp"
KEEP = [(10, 0), (3, 0), (301, 3), (399, 3), (4, 0)]
EPOCHS = ["2025-01-01", "2026-07-01", "2028-01-01", "2029-07-01", "2026-11-01", "2027-02-01", "2028-12-01",
          "2029-03-01", "2025-06-01", "2026-06-01", "2027-06-01", "2028-06-01",
          "2025-04-08", "2026-10-06", "2028-04-07", "2029-10-06", "2027-02-06", "2027-05-09", "2029-03-08",
          "2029-06-06", "2025-09-06", "2026-09-06", "2027-09-06", "2028-09-06"]


def states(ets):
    return [[list(sp.spkgeo(b, et, "J2000", 0)[0]) for b in (301, 399, 4, 10)] for et in ets]


def main():
    sp.furnsh(str(base.LSK))
    w0 = sp.str2et("2025-01-01 00:00:00 TDB") - 86400.0
    w1 = sp.str2et("2029-10-08 00:00:00 TDB")
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
    assert len(segs) == 5, len(segs)
    OUT.write_bytes(base.daf_bytes(segs))
    ets = [sp.str2et(f"{e} 00:00:00 TDB") for e in EPOCHS]
    sp.furnsh(str(base.SPK))
    full = states(ets)
    sp.kclear()
    sp.furnsh(str(base.LSK))
    sp.furnsh(str(OUT))
    assert states(ets) == full, "the cut differs from the full kernel"
    print(f"{OUT.name}: {OUT.stat().st_size} bytes, sha256 {base.sha(OUT)}; bit for bit at {len(ets)} epochs")


if __name__ == "__main__":
    main()
