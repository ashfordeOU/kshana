#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut de440s.bsp down to the M076 window, 2025-11-08..2025-11-25 UTC.

Copies, record for record and bit for bit, the type-2 Chebyshev records of the segments
3 (Earth-Moon barycentre) wrt 0, 301 (Moon) wrt 3, 399 (Earth) wrt 3 and 10 (Sun) wrt 0 that
cover the window into `de440s_2025-11-09_15d.bsp` beside this script (the same small DAF writer
as tests/fixtures/lunar_vlbi_anise_oracle/kernels/make_kernel_subsets.py), then checks with SPICE
that every state at 30-minute steps over the window is identical bit for bit between the full
and the cut kernel, and prints the SHA-256 of both.

    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/lunar_service_volume_orekit_oracle/make_kernel_subset.py
"""

import hashlib
import math
import os
import pathlib

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
NAIF = pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif"
LSK = NAIF / "naif0012.tls"
SRC = {"spk": NAIF / "de440s.bsp"}
OUT = {"spk": HERE / "de440s_2025-11-09_15d.bsp"}


def sha(p):
    return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()


def segments(path, nd, ni):
    h = sp.dafopr(str(path))
    sp.dafbfs(h)
    out = []
    while sp.daffna():
        dc, ic = sp.dafus(sp.dafgs(), nd, ni)
        out.append((list(dc), [int(x) for x in ic], sp.dafgn()))
    return h, out


def cut(h, dc, ic, w0, w1):
    first, last = ic[-2], ic[-1]
    init, intlen, rsize, n = sp.dafgda(h, last - 3, last)
    rsize, n = int(rsize), int(n)
    i0 = max(0, int(math.floor((w0 - init) / intlen)))
    i1 = min(n - 1, int(math.floor((w1 - init) / intlen)))
    data = list(sp.dafgda(h, first + i0 * rsize, first + (i1 + 1) * rsize - 1))
    new_init = init + i0 * intlen
    kept = i1 - i0 + 1
    start = max(dc[0], data[0] - data[1])
    end = min(dc[1], data[(kept - 1) * rsize] + data[(kept - 1) * rsize + 1])
    return [start, end], data + [new_init, intlen, float(rsize), float(kept)]


FTPSTR = b"FTPSTR:\r:\n:\r\n:\r\x00:\x81:\x10\xce:ENDFTP"


def daf_bytes(idword, nd, ni, ifname, segs):
    """A little-endian DAF holding `segs` = [(doubles, ints, name, data)] in one summary record."""
    import struct
    ss = nd + (ni + 1) // 2
    assert 3 + len(segs) * ss <= 128
    addr = 3 * 128 + 1
    summaries, names, data = b"", b"", []
    for dc, ic, name, d in segs:
        ic = list(ic)
        ic[-2], ic[-1] = addr, addr + len(d) - 1
        addr += len(d)
        packed = struct.pack("<%dd" % nd, *dc) + struct.pack("<%di" % ni, *ic)
        packed += b"\0" * (ss * 8 - len(packed))
        summaries += packed
        names += name.encode().ljust(ss * 8, b" ")
        data.extend(d)
    head = idword.ljust(8).encode() + struct.pack("<ii", nd, ni) + ifname.ljust(60).encode()
    head += struct.pack("<iii", 2, 2, addr) + b"LTL-IEEE"
    head = head.ljust(699, b"\0") + FTPSTR
    head = head.ljust(1024, b"\0")
    srec = (struct.pack("<3d", 0.0, 0.0, float(len(segs))) + summaries).ljust(1024, b"\0")
    nrec = names.ljust(1024, b" ")
    body = struct.pack("<%dd" % len(data), *data)
    body = body.ljust(-(-len(body) // 1024) * 1024, b"\0")  # whole records, as SPICE reads them
    return head + srec + nrec + body


def write(kind, w0, w1, keep):
    nd, ni = (2, 6) if kind == "spk" else (2, 5)
    h, segs = segments(SRC[kind], nd, ni)
    out = []
    for dc, ic, name in segs:
        if keep(ic) and dc[0] <= w1 and dc[1] >= w0:
            dcs, data = cut(h, dc, ic, w0, w1)
            out.append((dcs, ic, name, data))
    sp.dafcls(h)
    idword = "DAF/SPK" if kind == "spk" else "DAF/PCK"
    OUT[kind].write_bytes(daf_bytes(idword, nd, ni, "M038 2024-01-01 subset", out))


def sample(grid):
    rows = []
    for et in grid:
        for t, c in [(301, 399), (399, 0), (10, 301)]:
            s, _ = sp.spkgeo(t, et, "J2000", c)
            rows.append(list(s))
    return rows


def main():
    sp.furnsh(str(LSK))
    w0 = sp.str2et("2025-11-08 00:00:00 UTC")
    w1 = sp.str2et("2025-11-25 00:00:00 UTC")
    write("spk", w0, w1, lambda ic: (ic[0], ic[1]) in [(3, 0), (301, 3), (399, 3), (10, 0)])
    grid = [w0 + 3600.0 + k * 1800.0 for k in range(16 * 48)]
    sp.furnsh(str(SRC["spk"]))
    full = sample(grid)
    sp.unload(str(SRC["spk"]))
    sp.furnsh(str(OUT["spk"]))
    cut_rows = sample(grid)
    assert full == cut_rows, "the cut kernel does not reproduce the full kernel bit for bit"
    print("cut kernel reproduces the full kernel bit for bit at", len(grid), "epochs")
    print("source", SRC["spk"].name, sha(SRC["spk"]))
    print("cut   ", OUT["spk"].name, sha(OUT["spk"]), OUT["spk"].stat().st_size, "bytes")


if __name__ == "__main__":
    main()
