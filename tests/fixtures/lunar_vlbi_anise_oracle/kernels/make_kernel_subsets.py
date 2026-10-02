#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut the three NAIF kernels of the M038 comparison down to 2023-12-31..2024-01-02.

Copies, record for record and bit for bit, the type-2 Chebyshev records that cover the window
from the full NAIF kernels into three small kernels beside this script, so the engine's own
kernel reader can be tested without the 32 MB planetary ephemeris in the repository:

* `de440s_2024-01-01.bsp`   SPK segments 3 (Earth-Moon barycentre) wrt 0, 301 (Moon) wrt 3,
                            399 (Earth) wrt 3 from de440s.bsp;
* `earth_itrf93_2024-01-01.bpc`  the ITRF93 (3000) segment of earth_latest_high_prec.bpc;
* `moon_pa_de440_2024-01-01.bpc` the MOON_PA_DE440 (31008) segment of moon_pa_de440_200625.bpc.

The records are written raw by the small DAF writer below (file record, one summary record,
one name record, then the data; little-endian IEEE), each segment's trailer re-based (INIT
moved to the first kept record, N the kept count). SPICE then reads the cut kernels back. The script then
checks with SPICE that every state and rotation at 30-minute steps over the window is identical
bit for bit between the full and the cut kernels, and writes the SHA-256 of all six files.

It also writes `spice_reader_check.csv`: SPICE's own (spkgeo/sxform-free) values from the cut
kernels at the 25 comparison epochs, used by the engine's reader self-check (not the M038
oracle, which is ANISE): Moon wrt Earth and Earth wrt solar-system barycentre position and
velocity (km, km/s), and the J2000->ITRF93 and J2000->MOON_PA_DE440 matrices.

    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/lunar_vlbi_anise_oracle/kernels/make_kernel_subsets.py
"""

import hashlib
import math
import os
import pathlib

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
NAIF = pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif"
LSK = NAIF / "naif0012.tls"
SRC = {
    "spk": NAIF / "de440s.bsp",
    "earth": NAIF / "earth_latest_high_prec.bpc",
    "moon": NAIF / "moon_pa_de440_200625.bpc",
}
OUT = {
    "spk": HERE / "de440s_2024-01-01.bsp",
    "earth": HERE / "earth_itrf93_2024-01-01.bpc",
    "moon": HERE / "moon_pa_de440_2024-01-01.bpc",
}


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


def sample(epochs):
    rows = []
    for et in epochs:
        m, _ = sp.spkgeo(301, et, "J2000", 399)
        e, _ = sp.spkgeo(399, et, "J2000", 0)
        r_itrf = sp.pxform("J2000", "ITRF93", et)
        r_pa = sp.pxform("J2000", "MOON_PA_DE440", et)
        rows.append([*m, *e, *[r_itrf[i][j] for i in range(3) for j in range(3)],
                     *[r_pa[i][j] for i in range(3) for j in range(3)]])
    return rows


def main():
    sp.furnsh(str(LSK))
    sp.furnsh(str(NAIF / "moon_de440_250416.tf"))  # defines the MOON_PA_DE440 frame name
    w0 = sp.str2et("2023-12-31 00:00:00 UTC")
    w1 = sp.str2et("2024-01-02 00:00:00 UTC")
    write("spk", w0, w1, lambda ic: (ic[0], ic[1]) in [(3, 0), (301, 3), (399, 3)])
    write("earth", w0, w1, lambda ic: ic[0] == 3000)
    write("moon", w0, w1, lambda ic: ic[0] == 31008)

    grid = [w0 + 3600.0 + k * 1800.0 for k in range(90)]
    for k in SRC:
        sp.furnsh(str(SRC[k]))
    full = sample(grid)
    for k in SRC:
        sp.unload(str(SRC[k]))
    for k in OUT:
        sp.furnsh(str(OUT[k]))
    sub = sample(grid)
    assert full == sub, "the cut kernels do not reproduce the full kernels bit for bit"

    epochs = [sp.str2et("2024-01-01 %02d:00:00 UTC" % h) if h < 24 else sp.str2et("2024-01-02 00:00:00 UTC")
              for h in range(25)]
    lines = ["# SPICE (%s, spiceypy %s) values from the cut kernels at the 25 M038 epochs (reader self-check, not the M038 oracle)"
             % (sp.tkvrsn("TOOLKIT"), sp.__version__),
             "# hour,et_s,moon_wrt_earth x y z vx vy vz (km, km/s),earth_wrt_ssb x y z vx vy vz,"
             "j2000_to_itrf93 r00..r22,j2000_to_moon_pa r00..r22"]
    for h, (et, row) in enumerate(zip(epochs, sample(epochs))):
        lines.append("%d,%s,%s" % (h, repr(et), ",".join(repr(float(v)) for v in row)))
    (HERE / "spice_reader_check.csv").write_text("\n".join(lines) + "\n")

    print("cut kernels reproduce the full kernels bit for bit at", len(grid), "epochs")
    for k in SRC:
        print("source", SRC[k].name, sha(SRC[k]))
    for k in OUT:
        print("cut   ", OUT[k].name, sha(OUT[k]), OUT[k].stat().st_size, "bytes")
    print("lsk   ", LSK.name, sha(LSK))


if __name__ == "__main__":
    main()
