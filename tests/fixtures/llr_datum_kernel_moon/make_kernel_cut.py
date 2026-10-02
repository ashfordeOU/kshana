#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut NAIF's de440s.bsp down to the LLR datum window, 2015-04-06 to 2015-06-30 UTC.

For tests/validate_llr_datum_kernel_moon.rs. Copies, record for record and bit for bit, the
type-2 Chebyshev records of segments 3 (Earth-Moon barycentre wrt the solar-system
barycentre), 301 (Moon wrt 3) and 399 (Earth wrt 3) that cover the window into
`de440s_2015-04-06_2015-06-30.bsp` beside this script, then with SPICE (CSPICE N0067 through
spiceypy 8.2.0):

1. checks that the cut file reproduces the full file's Moon-relative-to-Earth and
   Earth-relative-to-barycentre states bit for bit at 30-minute steps over the window;
2. checks that de440s.bsp and de440.bsp (the file the SPICE oracle of the LLR datum
   comparison read) give the same Moon-relative-to-Earth state at the same steps, and prints
   the largest difference (both are the DE440 integration).

Calls no Kshana code. Run with the NAIF files in $KSHANA_NAIF_DIR (or
$KSHANA_ORACLES/data/naif):

    $ORACLE_PY tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py
"""

import hashlib
import math
import os
import pathlib
import struct

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
NAIF = pathlib.Path(os.environ.get("KSHANA_NAIF_DIR")
                    or pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif")
LSK = NAIF / "naif0012.tls"
SPK = NAIF / "de440s.bsp"
DE440 = NAIF / "de440.bsp"
OUT = HERE / "de440s_2015-04-06_2015-06-30.bsp"
KEEP = [(3, 0), (301, 3), (399, 3)]
FTPSTR = b"FTPSTR:\r:\n:\r\n:\r\x00:\x81:\x10\xce:ENDFTP"


def sha(p):
    return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()


def cut(h, dc, ic, w0, w1):
    first, last = ic[-2], ic[-1]
    init, intlen, rsize, n = sp.dafgda(h, last - 3, last)
    rsize, n = int(rsize), int(n)
    i0 = max(0, int(math.floor((w0 - init) / intlen)))
    i1 = min(n - 1, int(math.floor((w1 - init) / intlen)))
    data = list(sp.dafgda(h, first + i0 * rsize, first + (i1 + 1) * rsize - 1))
    kept = i1 - i0 + 1
    start = max(dc[0], data[0] - data[1])
    end = min(dc[1], data[(kept - 1) * rsize] + data[(kept - 1) * rsize + 1])
    return [start, end], data + [init + i0 * intlen, intlen, float(rsize), float(kept)]


def daf_bytes(segs):
    nd, ni = 2, 6
    ss = nd + (ni + 1) // 2
    addr = 3 * 128 + 1
    summaries, names, data = b"", b"", []
    for dc, ic, name, d in segs:
        ic = list(ic)
        ic[-2], ic[-1] = addr, addr + len(d) - 1
        addr += len(d)
        packed = struct.pack("<2d", *dc) + struct.pack("<6i", *ic)
        summaries += packed + b"\0" * (ss * 8 - len(packed))
        names += name.encode().ljust(ss * 8, b" ")
        data.extend(d)
    head = b"DAF/SPK " + struct.pack("<ii", nd, ni) + "LLR datum 2015 subset".ljust(60).encode()
    head += struct.pack("<iii", 2, 2, addr) + b"LTL-IEEE"
    head = head.ljust(699, b"\0") + FTPSTR
    head = head.ljust(1024, b"\0")
    srec = (struct.pack("<3d", 0.0, 0.0, float(len(segs))) + summaries).ljust(1024, b"\0")
    body = struct.pack("<%dd" % len(data), *data)
    body = body.ljust(-(-len(body) // 1024) * 1024, b"\0")
    return head + srec + names.ljust(1024, b" ") + body


def states(epochs):
    return [(list(sp.spkgeo(301, et, "J2000", 399)[0]), list(sp.spkgeo(399, et, "J2000", 0)[0]))
            for et in epochs]


def main():
    sp.furnsh(str(LSK))
    w0 = sp.str2et("2015-04-06 00:00:00 UTC")
    w1 = sp.str2et("2015-06-30 00:00:00 UTC")
    h = sp.dafopr(str(SPK))
    sp.dafbfs(h)
    segs = []
    while sp.daffna():
        dc, ic = sp.dafus(sp.dafgs(), 2, 6)
        ic = [int(x) for x in ic]
        if (ic[0], ic[1]) in KEEP and dc[0] <= w1 and dc[1] >= w0:
            dcs, d = cut(h, list(dc), ic, w0, w1)
            segs.append((dcs, ic, sp.dafgn(), d))
    sp.dafcls(h)
    assert len(segs) == 3
    OUT.write_bytes(daf_bytes(segs))

    grid = [w0 + 1800.0 * k for k in range(1, int((w1 - w0) / 1800.0))]
    sp.furnsh(str(SPK))
    full = states(grid)
    sp.unload(str(SPK))
    sp.furnsh(str(OUT))
    sub = states(grid)
    sp.unload(str(OUT))
    if full != sub:
        OUT.unlink()
        raise SystemExit("the cut kernel does not reproduce de440s.bsp bit for bit")
    sp.furnsh(str(DE440))
    big = [list(sp.spkgeo(301, et, "J2000", 399)[0]) for et in grid]
    sp.unload(str(DE440))
    worst = max(abs(a - b) for (m, _), q in zip(full, big) for a, b in zip(m[:3], q[:3]))
    print(f"cut reproduces de440s.bsp bit for bit at {len(grid)} epochs")
    print(f"largest de440s - de440 Moon-wrt-Earth position difference: {worst * 1e3:.3e} m")
    print("de440s.bsp", sha(SPK))
    print("de440.bsp ", sha(DE440))
    print("cut       ", OUT.name, sha(OUT), OUT.stat().st_size, "bytes")


if __name__ == "__main__":
    main()
