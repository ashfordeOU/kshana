#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut NAIF's de440s.bsp down to the propagator DE440-tier window, 2024-03-18 to 2024-03-23 UTC.

For tests/propagator_de440_orekit_oracle.rs. Copies, record for record and bit for bit, the
type-2 Chebyshev records of segments 3 (Earth-Moon barycentre wrt the solar-system
barycentre), 301 (Moon wrt 3), 399 (Earth wrt 3) and 10 (Sun wrt the solar-system barycentre)
that cover the window into `de440s_2024-03-18_2024-03-23.bsp` beside this script, then with
SPICE (CSPICE through spiceypy 8.2.0) checks that the cut reproduces the full file's
Moon-relative-to-Earth and Sun-relative-to-Earth states bit for bit at 10-minute steps.

Calls no Kshana code. Run with the NAIF files in $KSHANA_NAIF_DIR (or
$KSHANA_ORACLES/data/naif):

    $ORACLE_PY tests/fixtures/propagator_de440_orekit_oracle/make_kernel_cut.py
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
OUT = HERE / "de440s_2024-03-18_2024-03-23.bsp"
KEEP = [(3, 0), (301, 3), (399, 3), (10, 0)]
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
    head = b"DAF/SPK " + struct.pack("<ii", nd, ni) + "Propagator DE440 2024 subset".ljust(60).encode()
    head += struct.pack("<iii", 2, 2, addr) + b"LTL-IEEE"
    head = head.ljust(699, b"\0") + FTPSTR
    head = head.ljust(1024, b"\0")
    srec = (struct.pack("<3d", 0.0, 0.0, float(len(segs))) + summaries).ljust(1024, b"\0")
    body = struct.pack("<%dd" % len(data), *data)
    body = body.ljust(-(-len(body) // 1024) * 1024, b"\0")
    return head + srec + names.ljust(1024, b" ") + body


def states(epochs):
    return [(list(sp.spkgeo(301, et, "J2000", 399)[0]), list(sp.spkgeo(10, et, "J2000", 399)[0]))
            for et in epochs]


def main():
    sp.furnsh(str(LSK))
    w0 = sp.str2et("2024-03-18 00:00:00 UTC")
    w1 = sp.str2et("2024-03-23 00:00:00 UTC")
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
    assert len(segs) == 4
    OUT.write_bytes(daf_bytes(segs))

    grid = [w0 + 600.0 * k for k in range(1, int((w1 - w0) / 600.0))]
    sp.furnsh(str(SPK))
    full = states(grid)
    sp.unload(str(SPK))
    sp.furnsh(str(OUT))
    sub = states(grid)
    sp.unload(str(OUT))
    if full != sub:
        OUT.unlink()
        raise SystemExit("the cut kernel does not reproduce de440s.bsp bit for bit")
    print(f"cut reproduces de440s.bsp bit for bit at {len(grid)} epochs")
    print("de440s.bsp", sha(SPK))
    print("cut       ", OUT.name, sha(OUT), OUT.stat().st_size, "bytes")


if __name__ == "__main__":
    main()
