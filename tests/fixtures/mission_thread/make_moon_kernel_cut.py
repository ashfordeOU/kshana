#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut NAIF's de440s.bsp to the Moon-and-Earth segments over a window, for the mission thread.

Copies, record for record and bit for bit, the type-2 Chebyshev records of segments 3 (Earth-Moon
barycentre wrt the solar-system barycentre), 301 (Moon wrt 3) and 399 (Earth wrt 3) that cover the
window, with the cutting and DAF writing of tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py
(reused unchanged). With SPICE (CSPICE through spiceypy) it then checks that the cut file
reproduces the full file's Moon-relative-to-Earth and Earth-relative-to-barycentre states bit for
bit at 30-minute steps over the window. Calls no Kshana code. The NAIF files are fetched, never
vendored, into the directory named by $KSHANA_NAIF_DIR:

    https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp
        sha256 c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2
    https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0012.tls
        sha256 678e32bdb5a744117a467cd9601cd6b373f0e9bc9bbde1371d5eee39600a039b

Usage (UTC start and end of the window, then the output name):

    KSHANA_NAIF_DIR=/path python3 tests/fixtures/mission_thread/make_moon_kernel_cut.py \
        2028-01-01 2028-04-01 de440s_moon_2028-01-01_2028-04-01.bsp
"""
import hashlib
import os
import pathlib
import sys

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "llr_datum_kernel_moon"))
os.environ.setdefault("KSHANA_NAIF_DIR", "")
import make_kernel_cut as base  # noqa: E402

DE440S_SHA256 = "c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2"
LSK_SHA256 = "678e32bdb5a744117a467cd9601cd6b373f0e9bc9bbde1371d5eee39600a039b"


def sha(p):
    return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()


def main():
    if len(sys.argv) != 4:
        raise SystemExit(__doc__)
    start, end, name = sys.argv[1:4]
    naif = pathlib.Path(os.environ["KSHANA_NAIF_DIR"])
    spk, lsk = naif / "de440s.bsp", naif / "naif0012.tls"
    if sha(spk) != DE440S_SHA256 or sha(lsk) != LSK_SHA256:
        raise SystemExit("the NAIF files do not match the pinned digests")
    out = HERE / name
    sp.furnsh(str(lsk))
    w0 = sp.str2et(start + " 00:00:00 UTC")
    w1 = sp.str2et(end + " 00:00:00 UTC")
    h = sp.dafopr(str(spk))
    sp.dafbfs(h)
    segs = []
    while sp.daffna():
        dc, ic = sp.dafus(sp.dafgs(), 2, 6)
        ic = [int(x) for x in ic]
        if (ic[0], ic[1]) in base.KEEP and dc[0] <= w1 and dc[1] >= w0:
            dcs, d = base.cut(h, list(dc), ic, w0, w1)
            segs.append((dcs, ic, sp.dafgn(), d))
    sp.dafcls(h)
    assert len(segs) == 3, len(segs)
    out.write_bytes(base.daf_bytes(segs))
    grid = [w0 + 1800.0 * k for k in range(1, int((w1 - w0) / 1800.0))]
    sp.furnsh(str(spk))
    full = base.states(grid)
    sp.unload(str(spk))
    sp.furnsh(str(out))
    sub = base.states(grid)
    sp.unload(str(out))
    if full != sub:
        out.unlink()
        raise SystemExit("the cut kernel does not reproduce de440s.bsp bit for bit")
    print(f"cut reproduces de440s.bsp bit for bit at {len(grid)} epochs")
    print("de440s.bsp", sha(spk))
    print("cut       ", out.name, sha(out), out.stat().st_size, "bytes")


if __name__ == "__main__":
    main()
