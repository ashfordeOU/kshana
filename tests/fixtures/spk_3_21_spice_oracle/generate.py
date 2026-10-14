#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generator for tests/spk_3_21_spice_oracle.rs (xval/spk-3-21-spice/PREREGISTRATION.md).

  generate.py inputs <dir>   draws the synthetic records from the pre-registered seed (no SPICE)
                             and writes <dir>/inputs.json
  generate.py oracle <dir>   runs the NAIF SPICE Toolkit through spiceypy: writes SPICE's own
                             kernels (<dir>/spice/*.bsp), reads the Kshana-written kernels
                             (<dir>/kshana/*.bsp) and SPICE's, and writes <dir>/outputs/spice.json

No Kshana code is imported. Run with python3 -I.

Readings of the pre-registration that its table leaves open, fixed here before any comparison:
* the type 3 segments start at a drawn INIT in [-3e8, 9e8] s; G1 S2 has interval 7200 s;
* a type 21 step-size entry beyond KQMAX1 - 2 is drawn U(30, 120) s like the others;
* G2 S3 (centre -2101): 100 line steps are drawn U(300, 900) s as stated and the resulting
  epochs mapped affinely onto [S1 start + 1000 s, S1 end - 1000 s], so that S3 lies inside S1
  (100 such steps would otherwise outlast S1's 50); its descriptor starts at S1 start + 1000 s; G2 S4 starts 600 s before its only line's end epoch;
* the G3 type 13 segment is a noise-free Kepler orbit about the Earth (a 6800-7400 km), its
  descriptor from the first to the last of its 30 epochs; G3 comment lines are two short
  ASCII lines, ncomch 200.

spkw21 has no spiceypy wrapper; it is called from the CSPICE library spiceypy loads
(`libcspice.so`, symbol `spkw21_`, f2c calling convention: 32-bit integers, string lengths
appended), and SPICE's error state is checked after the call.
"""

import ctypes
import json
import math
import random
import sys
from pathlib import Path

SEED = int("e1cf80d8e2a3e84b8e39fa35c5461a7af15e3f4d"[:16], 16)


def type3_records(rng, n, degree):
    recs = []
    for _ in range(n):
        r = []
        for comp in range(6):
            c0, scale = (8000.0, 4000.0) if comp < 3 else (8.0, 4.0)
            r.append(rng.uniform(-c0, c0))
            r += [rng.uniform(-1, 1) * scale / 2 ** k for k in range(1, degree + 1)]
        recs.append(r)
    return recs


def type21_lines(rng, maxdim, epochs):
    lines = []
    for tl in epochs:
        kqmax1 = rng.randint(3, maxdim + 1)
        kq = [rng.randint(1, kqmax1 - 1) for _ in range(3)]
        h = rng.uniform(30, 120)
        g = [j * h * (1 + rng.uniform(0, 0.1)) if j <= kqmax1 - 2 else rng.uniform(30, 120)
             for j in range(1, maxdim + 1)]
        ref = []
        for _ in range(3):
            ref += [rng.uniform(-8000, 8000), rng.uniform(-8, 8)]
        dt = [rng.uniform(-1, 1) * 1e-3 / 4 ** (j - 1)
              for _ in range(3) for j in range(1, maxdim + 1)]
        lines.append([tl] + g + ref + dt + [float(kqmax1)] + [float(k) for k in kq])
    return lines


def line_epochs(rng, t0, n):
    ts = [t0 + rng.uniform(300, 900)]
    for _ in range(n - 1):
        ts.append(ts[-1] + rng.uniform(300, 900))
    return ts


def kepler_states(rng, t0, n, step):
    mu = 398600.4418
    a, e = rng.uniform(6800, 7400), rng.uniform(0, 0.02)
    inc, raan, argp, m0 = (rng.uniform(0, 2 * math.pi) for _ in range(4))
    nn = math.sqrt(mu / a ** 3)
    ts, states = [], []
    for k in range(n):
        t = t0 + k * step
        m = m0 + nn * (t - t0)
        ea = m
        for _ in range(50):
            ea -= (ea - e * math.sin(ea) - m) / (1 - e * math.cos(ea))
        c, s = math.cos(ea), math.sin(ea)
        r = a * (1 - e * c)
        xp, yp = a * (c - e), a * math.sqrt(1 - e * e) * s
        vf = math.sqrt(mu * a) / r
        vxp, vyp = -vf * s, vf * math.sqrt(1 - e * e) * c
        cO, sO = math.cos(raan), math.sin(raan)
        cw, sw = math.cos(argp), math.sin(argp)
        ci, si = math.cos(inc), math.sin(inc)
        rot = [[cO * cw - sO * sw * ci, -cO * sw - sO * cw * ci],
               [sO * cw + cO * sw * ci, -sO * sw + cO * cw * ci],
               [sw * si, cw * si]]
        pos = [rot[i][0] * xp + rot[i][1] * yp for i in range(3)]
        vel = [rot[i][0] * vxp + rot[i][1] * vyp for i in range(3)]
        ts.append(t)
        states.append(pos + vel)
    return ts, states


def seg(file, name, target, centre, frame, typ, **kw):
    d = dict(file=file, name=name, target=target, centre=centre, frame=frame, type=typ,
             degree=0, init=0.0, intlen=0.0, records=[], epochs=[], states=[])
    d.update(kw)
    return d


def draw_inputs(rng):
    segs = []
    # G1: type 3.
    for name, target, centre, frame, n, degree, intlen, inside in [
            ("G1 S1 CHEB DEG 12", -2001, 399, "J2000", 40, 12, 3600.0, 0.0),
            ("G1 S2 CHEB DEG 0", -2002, 301, "ECLIPJ2000", 3, 0, 7200.0, 0.0),
            ("G1 S3 CHEB DEG 27", -2003, 399, "J2000", 150, 27, 1800.0, 100.0)]:
        init = rng.uniform(-3e8, 9e8)
        recs = type3_records(rng, n, degree)
        segs.append(seg("G1", name, target, centre, frame, 3, degree=degree, init=init,
                        intlen=intlen, records=recs, start=init + inside,
                        end=init + n * intlen - inside))
    # G2: type 21.
    t0 = rng.uniform(-3e8, 9e8)
    ep = line_epochs(rng, t0, 50)
    s1 = seg("G2", "G2 S1 MDA 15", -2101, 399, "J2000", 21, records=type21_lines(rng, 15, ep),
             epochs=ep, start=t0, end=ep[-1])
    t0 = rng.uniform(-3e8, 9e8)
    ep = line_epochs(rng, t0, 250)
    s2 = seg("G2", "G2 S2 MDA 25", -2102, 399, "J2000", 21, records=type21_lines(rng, 25, ep),
             epochs=ep, start=t0, end=ep[-1])
    # 100 lines of 300-900 s outlast S1's 50: draw them as stated, then map their epochs
    # affinely onto [S1 start + 1000 s, S1 end - 1000 s] so that S3 lies inside S1.
    raw = line_epochs(rng, 0.0, 100)
    t0 = s1["start"] + 1000.0
    span = s1["end"] - 1000.0 - t0
    ep = [t0 + x * span / raw[-1] for x in raw]
    s3 = seg("G2", "G2 S3 MDA 20 CHAIN", -2103, -2101, "J2000", 21,
             records=type21_lines(rng, 20, ep), epochs=ep, start=t0, end=ep[-1])
    t1 = rng.uniform(-3e8, 9e8)
    s4 = seg("G2", "G2 S4 MDA 15 ONE LINE", -2104, 301, "ECLIPJ2000", 21,
             records=type21_lines(rng, 15, [t1]), epochs=[t1], start=t1 - 600.0, end=t1)
    segs += [s1, s2, s3, s4]
    # G3: G1 S1, G2 S2, then a type 13 segment.
    t0 = rng.uniform(-3e8, 9e8)
    ts, states = kepler_states(rng, t0, 30, 60.0)
    s13 = seg("G3", "G3 TYPE 13", -2201, 399, "J2000", 13, degree=7, epochs=ts, states=states,
              start=ts[0], end=ts[-1])
    segs.append(s13)
    return segs


def eval_epochs(rng, s):
    lo, hi = s["start"], s["end"]
    out = []
    near = lambda t: [x for x in (t, math.nextafter(t, -math.inf), math.nextafter(t, math.inf))  # noqa: E731
                      if lo <= x <= hi]
    if s["type"] == 3:
        n = len(s["records"])
        for k in range(n + 1):
            out += near(s["init"] + k * s["intlen"])
        out += [m for m in (s["init"] + (k + 0.5) * s["intlen"] for k in range(n)) if lo <= m <= hi]
    elif s["type"] == 21:
        ep = s["epochs"]
        for t in ep:
            out += near(t)
        prev = [s["start"]] + ep[:-1]
        out += [m for m in ((a + b) / 2 for a, b in zip(prev, ep)) if lo <= m <= hi]
    else:
        ts = s["epochs"]
        out += ts + [(a + b) / 2 for a, b in zip(ts, ts[1:])]
    out += [lo, hi]
    out += [rng.uniform(lo, hi) for _ in range(25)]
    return out


FILES = {
    "G1": dict(ifname="KSHANA SPK 3/21 XVAL G1", ncomch=0, comments=[]),
    "G2": dict(ifname="KSHANA SPK 3/21 XVAL G2", ncomch=0, comments=[]),
    "G3": dict(ifname="KSHANA SPK 3/21 XVAL G3", ncomch=200, comments=[
        "Kshana SPK types 3 and 21 cross-validation, file G3.",
        "Type 3, type 21 and type 13 segments in one file."]),
}


def inputs(root: Path) -> None:
    rng = random.Random(SEED)
    segs = draw_inputs(rng)
    for s in segs:
        s["eval"] = eval_epochs(rng, s)
    root.mkdir(parents=True, exist_ok=True)
    (root / "inputs.json").write_text(json.dumps(
        dict(seed=SEED, files=FILES, segments=segs), indent=0) + "\n")


def file_segments(inp, f):
    if f == "G3":
        by = {s["name"]: s for s in inp["segments"]}
        return [by["G1 S1 CHEB DEG 12"], by["G2 S2 MDA 25"], by["G3 TYPE 13"]]
    return [s for s in inp["segments"] if s["file"] == f]


def spkw21(sp, h, s):
    lib = sp.utils.libspicehelper.libspice
    lib.spkw21_.restype = ctypes.c_int
    n = len(s["records"])
    dlsize = len(s["records"][0])
    flat = [x for line in s["records"] for x in line]
    dl = (ctypes.c_double * len(flat))(*flat)
    ep = (ctypes.c_double * n)(*s["epochs"])
    ci = lambda v: ctypes.byref(ctypes.c_int(v))  # noqa: E731
    cd = lambda v: ctypes.byref(ctypes.c_double(v))  # noqa: E731
    frame, segid = s["frame"].encode(), s["name"].encode()
    lib.spkw21_(ci(h), ci(s["target"]), ci(s["centre"]), ctypes.c_char_p(frame),
                cd(s["start"]), cd(s["end"]), ctypes.c_char_p(segid), ci(n), ci(dlsize),
                dl, ep, ctypes.c_int(len(frame)), ctypes.c_int(len(segid)))
    if sp.failed():
        msg = sp.getmsg("LONG", 1840)
        sp.reset()
        raise RuntimeError(f"spkw21: {msg}")


def spice_write(sp, inp, f, path):
    meta = inp["files"][f]
    if path.exists():
        path.unlink()
    h = sp.spkopn(str(path), meta["ifname"], meta["ncomch"])
    if meta["comments"]:
        sp.dafac(h, meta["comments"])
    for s in file_segments(inp, f):
        if s["type"] == 3:
            flat = [x for r in s["records"] for x in r]
            sp.spkw03(h, s["target"], s["centre"], s["frame"], s["start"], s["end"], s["name"],
                      s["intlen"], len(s["records"]), s["degree"], flat, s["init"])
        elif s["type"] == 21:
            spkw21(sp, h, s)
        else:
            sp.spkw13(h, s["target"], s["centre"], s["frame"], s["start"], s["end"], s["name"],
                      s["degree"], len(s["epochs"]), s["states"], s["epochs"])
    sp.spkcls(h)


def inventory(sp, path):
    h = sp.dafopr(str(path))
    sp.dafbfs(h)
    out = []
    while sp.daffna():
        summ = sp.dafgs(5)
        dc, ic = sp.dafus(summ, 2, 6)
        out.append(dict(doubles=[float(x) for x in dc], ints=[int(x) for x in ic],
                        name=sp.dafgn(), descr=[float(x) for x in summ]))
    sp.dafcls(h)
    bodies = sorted(int(b) for b in sp.spkobj(str(path)))
    cov = {}
    for b in bodies:
        c = sp.spkcov(str(path), b)
        cov[str(b)] = [float(c[i]) for i in range(sp.card(c))]
    return dict(segments=out, bodies=bodies, coverage=cov)


def evaluate(sp, inp, f, path):
    import numpy as np
    inv = inventory(sp, path)
    sp.furnsh(str(path))
    hd = sp.dafopr(str(path))
    segs = file_segments(inp, f)
    res = []
    for k, s in enumerate(segs):
        descr = np.array(inv["segments"][k]["descr"])
        rows = []
        for et in s["eval"]:
            _, pvn, _ = sp.spkpvn(hd, descr, et)
            geo, _ = sp.spkgeo(s["target"], et, s["frame"], s["centre"])
            rows.append([et] + [float(x) for x in pvn] + [float(x) for x in geo])
        res.append(rows)
    chains = []
    if f == "G2":
        s3 = segs[2]
        rows = []
        for et in s3["eval"]:
            geo, _ = sp.spkgeo(-2103, et, "J2000", 399)
            rows.append([et] + [float(x) for x in geo])
        chains.append(dict(target=-2103, observer=399, rows=rows))
    sp.dafcls(hd)
    sp.unload(str(path))
    for seg in inv["segments"]:
        del seg["descr"]
    return dict(inventory=inv, pvn_geo=res, chains=chains)


def sha256(path):
    import hashlib
    return hashlib.sha256(path.read_bytes()).hexdigest()


def oracle(root: Path) -> None:
    import spiceypy as sp
    inp = json.loads((root / "inputs.json").read_text())
    (root / "spice").mkdir(exist_ok=True)
    (root / "outputs").mkdir(exist_ok=True)
    out = dict(toolkit=sp.tkvrsn("TOOLKIT"), spiceypy=sp.__version__, files={})
    for f in FILES:
        sp_path = root / "spice" / f"{f}.bsp"
        spice_write(sp, inp, f, sp_path)
        ks_path = root / "kshana" / f"{f}.bsp"
        out["files"][f] = dict(kshana_sha256=sha256(ks_path), spice_sha256=sha256(sp_path),
                               kshana=evaluate(sp, inp, f, ks_path),
                               spice=evaluate(sp, inp, f, sp_path))
    (root / "outputs" / "spice.json").write_text(json.dumps(out) + "\n")


if __name__ == "__main__":
    cmd, root = sys.argv[1], Path(sys.argv[2])
    {"inputs": inputs, "oracle": oracle}[cmd](root)
