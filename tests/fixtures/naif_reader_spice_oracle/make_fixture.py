#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the fixture of tests/naif_reader_spice_oracle.rs (the NAIF kernel reader row).

Run once, after the pre-registration commit was published, with that commit's full hash:

    source ~/Code/kshana-oracles/env.sh   # or set KSHANA_NAIF_DIR to the NAIF files
    $ORACLE_PY tests/fixtures/naif_reader_spice_oracle/make_fixture.py --seed-commit <sha>

It calls no Kshana code. In order, as the pre-registration states:

1. seed = int(first 16 hex digits of the pre-registration commit hash); random.Random(seed)
   draws 200 epochs uniform on the common coverage of both kernels (shrunk one day per end),
   then one ordered pair of distinct de440s bodies per epoch. The pairs (301, 399) and
   (10, 399) are added at every epoch.
2. Each epoch is snapped to ANISE's nanosecond epoch (Epoch.init_from_et_seconds, then
   to_et_seconds); that double is the comparison epoch.
3. Oracle 1, CSPICE N0067 (spiceypy 8.2.0): spkezr(target, et, 'J2000', 'NONE', observer) and
   pxform('J2000', 'MOON_PA_DE440', et) on the FULL NAIF files. The bar scales R, V (SPICE
   states relative to the lowest common ancestor in the centre tree), the relative speed, and
   W (sum of coefficient magnitudes of the covering MOON_PA_DE440 record, read with dafgda).
4. Oracle 2, ANISE 0.10.6: Almanac.translate(Frame(target, 1), Frame(observer, 1), epoch)
   and Almanac.rotate(Frame(301, 1), Frame(301, 31008), epoch) on the same full files.
5. The cut kernels: every type-2 record the engine needs (both centre chains up to the
   barycentre) copied bit for bit into one single-record segment each, written by the small
   DAF writer below; SPICE then reads the cut kernels alone and every comparison value must be
   bit-identical to the full-file value, or the script aborts before writing anything.
6. states.csv, rotations.csv, the cut kernels and SHA256SUMS are written beside this script.
"""

import argparse
import hashlib
import math
import os
import pathlib
import random
import struct

import spiceypy as sp
from anise import Almanac
from anise.astro import Frame
from anise.time import Epoch

HERE = pathlib.Path(__file__).resolve().parent


def naif_dir():
    d = os.environ.get("KSHANA_NAIF_DIR")
    if d:
        return pathlib.Path(d)
    return pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif"


NAIF = naif_dir()
SPK = NAIF / "de440s.bsp"
PCK = NAIF / "moon_pa_de440_200625.bpc"
FK = NAIF / "moon_de440_250416.tf"
LSK = NAIF / "naif0012.tls"
OUT_SPK = HERE / "grid_de440s.bsp"
OUT_PCK = HERE / "grid_moon_pa_de440.bpc"

BODIES = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 199, 299, 301, 399]
PARENT = {b: 0 for b in range(1, 11)}
PARENT.update({199: 1, 299: 2, 301: 3, 399: 3})
N_EPOCHS = 200
MOON_PA = 31008


def sha(p):
    return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()


def chain(b):
    out = [b]
    while b != 0:
        b = PARENT[b]
        out.append(b)
    return out


def lca(a, b):
    cb = chain(b)
    return next(x for x in chain(a) if x in cb)


def segments(path, nd, ni):
    """[(dc, ic, name, init, intlen, rsize, n)] in file order, file left open (handle)."""
    h = sp.dafopr(str(path))
    sp.dafbfs(h)
    out = []
    while sp.daffna():
        dc, ic = sp.dafus(sp.dafgs(), nd, ni)
        ic = [int(x) for x in ic]
        last = ic[-1]
        init, intlen, rsize, n = sp.dafgda(h, last - 3, last)
        out.append((list(dc), ic, sp.dafgn(), init, intlen, int(rsize), int(n)))
    return h, out


def covering(seg, et):
    """Index of the record of a type-2 segment that SPICE evaluates at et."""
    dc, ic, name, init, intlen, rsize, n = seg
    i = int(math.floor((et - init) / intlen))
    return min(max(i, 0), n - 1)


def record(h, seg, i):
    dc, ic, name, init, intlen, rsize, n = seg
    first = ic[-2]
    return list(sp.dafgda(h, first + i * rsize, first + (i + 1) * rsize - 1))


FTPSTR = b"FTPSTR:\r:\n:\r\n:\r\x00:\x81:\x10\xce:ENDFTP"


def daf_bytes(idword, nd, ni, ifname, segs):
    """A little-endian DAF holding segs = [(doubles, ints, name, data)], 25 or fewer per
    summary record, the summary and name records first and the data after them."""
    ss = nd + (ni + 1) // 2
    per = (128 - 3) // ss
    blocks = [segs[i:i + per] for i in range(0, len(segs), per)]
    nblk = len(blocks)
    addr = (1 + 2 * nblk) * 128 + 1  # first data word, after the file record and all pairs
    out_records = []
    data = []
    for b, blk in enumerate(blocks):
        rec_no = 2 + 2 * b
        nxt = rec_no + 2 if b + 1 < nblk else 0
        prv = rec_no - 2 if b > 0 else 0
        summaries, names = b"", b""
        for dc, ic, name, d in blk:
            ic = list(ic)
            ic[-2], ic[-1] = addr, addr + len(d) - 1
            addr += len(d)
            packed = struct.pack("<%dd" % nd, *dc) + struct.pack("<%di" % ni, *ic)
            packed += b"\0" * (ss * 8 - len(packed))
            summaries += packed
            names += name.encode().ljust(ss * 8, b" ")
            data.extend(d)
        srec = struct.pack("<3d", float(nxt), float(prv), float(len(blk))) + summaries
        out_records.append(srec.ljust(1024, b"\0"))
        out_records.append(names.ljust(1024, b" "))
    last_summary = 2 + 2 * (nblk - 1)
    head = idword.ljust(8).encode() + struct.pack("<ii", nd, ni) + ifname.ljust(60).encode()
    head += struct.pack("<iii", 2, last_summary, addr) + b"LTL-IEEE"
    head = head.ljust(699, b"\0") + FTPSTR
    head = head.ljust(1024, b"\0")
    body = struct.pack("<%dd" % len(data), *data)
    body = body.ljust(-(-len(body) // 1024) * 1024, b"\0")
    return head + b"".join(out_records) + body


def one_record_segment(seg, rec, tag):
    """A single-record type-2 segment holding `rec` bit for bit."""
    dc, ic, name, init, intlen, rsize, n = seg
    mid, radius = rec[0], rec[1]
    return ([mid - radius, mid + radius], ic, f"{name.strip()} {tag}"[:40],
            rec + [mid - radius, 2.0 * radius, float(rsize), 1.0])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--seed-commit", required=True)
    args = ap.parse_args()
    commit = args.seed_commit.strip().lower()
    assert len(commit) == 40 and all(c in "0123456789abcdef" for c in commit), commit
    seed = int(commit[:16], 16)
    rng = random.Random(seed)

    for k in (LSK, FK, SPK, PCK):
        sp.furnsh(str(k))
    hs, spk_segs = segments(SPK, 2, 6)
    hp, pck_segs = segments(PCK, 2, 5)
    assert all(s[1][3] == 2 for s in spk_segs), "de440s holds only type 2"
    assert all(s[1][2] == 2 for s in pck_segs), "moon_pa holds only type 2"
    # Coverage of each (kernel, body) is the union of its segments (the lunar orientation kernel
    # is split in two at 2426); the grid interval is the intersection of those, shrunk one day.
    # (The first run took the intersection of the individual segments instead, which is empty
    # for the split kernel; it aborted on its first SPICE call before any value was produced.)
    spans = {}
    for kind, segs in (("spk", spk_segs), ("pck", pck_segs)):
        for s in segs:
            key = (kind, s[1][0])
            a, b = spans.get(key, (s[0][0], s[0][1]))
            spans[key] = (min(a, s[0][0]), max(b, s[0][1]))
    lo = max(a for a, _ in spans.values()) + 86400.0
    hi = min(b for _, b in spans.values()) - 86400.0
    assert lo < hi, (lo, hi)

    # 1. The draw, in the pre-registered order.
    epochs = [rng.uniform(lo, hi) for _ in range(N_EPOCHS)]
    pairs = []
    for _ in range(N_EPOCHS):
        t = rng.choice(BODIES)
        o = rng.choice([b for b in BODIES if b != t])
        pairs.append((t, o))

    alm = Almanac(str(SPK)).load(str(PCK))

    def spk_seg(body, et):
        """The segment SPICE uses for body at et (the last loaded one that covers it)."""
        cands = [s for s in spk_segs if s[1][0] == body and s[0][0] <= et <= s[0][1]]
        return cands[-1]

    def pck_seg(et):
        cands = [s for s in pck_segs if s[1][0] == MOON_PA and s[0][0] <= et <= s[0][1]]
        return cands[-1]

    state_rows, rot_rows = [], []
    cut_spk, cut_pck = [], []
    seen_spk, seen_pck = set(), set()
    for i, (et_draw, pair) in enumerate(zip(epochs, pairs)):
        # 2. ANISE's nanosecond epoch defines the comparison double.
        ep = Epoch.init_from_et_seconds(et_draw)
        et = ep.to_et_seconds()
        for t, o in (pair, (301, 399), (10, 399)):
            st, _ = sp.spkezr(str(t), et, "J2000", "NONE", str(o))
            c = lca(t, o)

            def rel_c(b):
                if b == c:
                    return [0.0] * 6
                s, _ = sp.spkezr(str(b), et, "J2000", "NONE", str(c))
                return list(s)

            rt, ro = rel_c(t), rel_c(o)
            r_scale = 1e3 * max(math.hypot(*rt[:3]), math.hypot(*ro[:3]))
            v_scale = 1e3 * max(math.hypot(*rt[3:]), math.hypot(*ro[3:]))
            rel_speed = 1e3 * math.hypot(*st[3:])
            an = alm.translate(Frame(t, 1), Frame(o, 1), ep, None)
            av = [an.x_km, an.y_km, an.z_km, an.vx_km_s, an.vy_km_s, an.vz_km_s]
            state_rows.append([i, et, t, o, r_scale, v_scale, rel_speed] + list(st) + av)
            for b in set(chain(t) + chain(o)) - {0}:
                seg = spk_seg(b, et)
                k = covering(seg, et)
                key = (spk_segs.index(seg), k)
                if key not in seen_spk:
                    seen_spk.add(key)
                    cut_spk.append(one_record_segment(seg, record(hs, seg, k), f"r{k}"))
        m = sp.pxform("J2000", "MOON_PA_DE440", et)
        seg = pck_seg(et)
        k = covering(seg, et)
        rec = record(hp, seg, k)
        w_scale = sum(abs(x) for x in rec[2:])
        dcm = alm.rotate(Frame(301, 1), Frame(301, MOON_PA), ep)
        am = [[float(x) for x in row] for row in dcm.rot_mat]
        rot_rows.append([i, et, w_scale] + [x for row in m for x in row] +
                        [x for row in am for x in row])
        key = (pck_segs.index(seg), k)
        if key not in seen_pck:
            seen_pck.add(key)
            cut_pck.append(one_record_segment(seg, rec, f"r{k}"))
    sp.dafcls(hs)
    sp.dafcls(hp)

    # 5. Cut kernels, then SPICE reads them alone and must reproduce every value bit for bit.
    spk_bytes = daf_bytes("DAF/SPK", 2, 6, "naif reader grid de440s", cut_spk)
    pck_bytes = daf_bytes("DAF/PCK", 2, 5, "naif reader grid moon_pa_de440", cut_pck)
    tmp_spk = HERE / "grid_de440s.bsp.tmp"
    tmp_pck = HERE / "grid_moon_pa_de440.bpc.tmp"
    tmp_spk.write_bytes(spk_bytes)
    tmp_pck.write_bytes(pck_bytes)
    sp.kclear()
    for k in (LSK, FK, tmp_spk, tmp_pck):
        sp.furnsh(str(k))
    for r in state_rows:
        st, _ = sp.spkezr(str(r[2]), r[1], "J2000", "NONE", str(r[3]))
        if list(st) != r[7:13]:
            tmp_spk.unlink()
            tmp_pck.unlink()
            raise SystemExit(f"cut SPK differs from the full file at row {r[:4]}")
    for r in rot_rows:
        m = sp.pxform("J2000", "MOON_PA_DE440", r[1])
        if [x for row in m for x in row] != r[3:12]:
            tmp_spk.unlink()
            tmp_pck.unlink()
            raise SystemExit(f"cut PCK differs from the full file at row {r[:2]}")
    sp.kclear()
    tmp_spk.rename(OUT_SPK)
    tmp_pck.rename(OUT_PCK)

    hdr = (f"# Generated by make_fixture.py --seed-commit {commit} (seed {seed}).\n"
           f"# CSPICE {sp.tkvrsn('TOOLKIT')} via spiceypy {sp.__version__}; ANISE 0.10.6 (Python).\n"
           f"# Full kernels: de440s.bsp {sha(SPK)}, moon_pa_de440_200625.bpc {sha(PCK)},\n"
           f"# moon_de440_250416.tf {sha(FK)}, naif0012.tls {sha(LSK)}.\n")
    with open(HERE / "states.csv", "w") as f:
        f.write(hdr)
        f.write("# epoch_index,et_s,target,observer,R_m,V_m_s,rel_speed_m_s,"
                "spice_x_km,y,z,vx_km_s,vy,vz,anise_x_km,y,z,vx_km_s,vy,vz\n")
        for r in state_rows:
            f.write(",".join(repr(float(x)) if isinstance(x, float) else str(x) for x in r) + "\n")
    with open(HERE / "rotations.csv", "w") as f:
        f.write(hdr)
        f.write("# epoch_index,et_s,W_rad,spice_m00..m22 (J2000 to MOON_PA_DE440, row-major),"
                "anise_m00..m22\n")
        for r in rot_rows:
            f.write(",".join(repr(float(x)) if isinstance(x, float) else str(x) for x in r) + "\n")
    with open(HERE / "SHA256SUMS", "w") as f:
        for p in ("grid_de440s.bsp", "grid_moon_pa_de440.bpc", "states.csv", "rotations.csv"):
            f.write(f"{sha(HERE / p)}  {p}\n")
    print(f"seed {seed}: {len(state_rows)} states, {len(rot_rows)} rotations, "
          f"{len(cut_spk)} SPK records, {len(cut_pck)} PCK records")


if __name__ == "__main__":
    main()
