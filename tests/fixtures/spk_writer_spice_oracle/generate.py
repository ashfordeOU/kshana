#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generator for tests/spk_writer_spice_oracle.rs (xval/spk-writer-spice/PREREGISTRATION.md).

  generate.py inputs <dir>   draws the synthetic inputs from the pre-registered seed (no SPICE)
                             and writes <dir>/inputs.json and <dir>/oem_input.oem
  generate.py oracle <dir>   runs the NAIF SPICE Toolkit through spiceypy: writes SPICE's own
                             kernels (<dir>/spice/*.bsp), reads the Kshana-written kernels
                             (<dir>/kshana/*.bsp) and SPICE's, and writes <dir>/outputs/*.json.
                             Needs the leapseconds kernel naif0012.tls in <dir>/../naif or $NAIF_LSK.

No Kshana code is imported. Run with python3 -I.

Readings of the pre-registration that its table leaves open, fixed here before any comparison
was run (and stated in the results):
* every segment draws its own Kepler elements; a segment centred on Earth (399) or on the
  spacecraft -1001 uses the Earth row (mu 398600.4418, a 6800-7400 km), one centred on the Moon
  (301) the Moon row;
* F1 S3 starts at a drawn epoch in [S1 first + 100 s, S2 descriptor end - 101 x 90 s - 100 s];
* F3 segment k (0..26) is type 9 for even k and type 13 for odd k; with j = k // 2, a type-9
  segment has degree 2j + 1 for even j and 2j for odd j (1, 2, 5, 6, ..., 25, 26: odd and even
  degrees cycled), a type-13 segment degree 2j + 1 (1, 3, ..., 25);
* the OEM segment A epochs advance from 2016-12-31T23:40:00 by drawn steps (whole ms) and the
  line just before 23:59:60.500 is followed by a line at exactly 23:59:60.500 (elapsed 1200.5 s,
  the leap second counted), after which the drawn steps continue; segment B starts at
  2020-06-01T00:00:00 TDB.
"""

import json
import math
import random
import sys
from pathlib import Path

SEED = int("5059fd2a6439f72ce40d588693b27527b9f43646"[:16], 16)
EARTH = (398600.4418, 6800.0, 7400.0)
MOON = (4902.800066, 1800.0, 2500.0)
TYPE9_MIN = lambda deg: deg + 1          # noqa: E731  SPICE: N >= degree + 1
TYPE13_MIN = lambda deg: (deg + 1) // 2  # noqa: E731  SPICE: N >= (degree + 1) / 2


def elements(rng, body):
    mu, alo, ahi = body
    return dict(mu=mu, a=rng.uniform(alo, ahi), e=rng.uniform(0.0, 0.02),
                i=rng.uniform(0, 2 * math.pi), raan=rng.uniform(0, 2 * math.pi),
                argp=rng.uniform(0, 2 * math.pi), m0=rng.uniform(0, 2 * math.pi))


def kepler(el, dt):
    mu, a, e = el["mu"], el["a"], el["e"]
    n = math.sqrt(mu / a ** 3)
    m = el["m0"] + n * dt
    ea = m
    for _ in range(50):
        ea -= (ea - e * math.sin(ea) - m) / (1 - e * math.cos(ea))
    c, s = math.cos(ea), math.sin(ea)
    r = a * (1 - e * c)
    xp, yp = a * (c - e), a * math.sqrt(1 - e * e) * s
    vf = math.sqrt(mu * a) / r
    vxp, vyp = -vf * s, vf * math.sqrt(1 - e * e) * c
    cO, sO = math.cos(el["raan"]), math.sin(el["raan"])
    cw, sw = math.cos(el["argp"]), math.sin(el["argp"])
    ci, si = math.cos(el["i"]), math.sin(el["i"])
    rot = [[cO * cw - sO * sw * ci, -cO * sw - sO * cw * ci],
           [sO * cw + cO * sw * ci, -sO * sw + cO * cw * ci],
           [sw * si, cw * si]]
    pos = [rot[k][0] * xp + rot[k][1] * yp for k in range(3)]
    vel = [rot[k][0] * vxp + rot[k][1] * vyp for k in range(3)]
    return pos + vel


def series(rng, body, t0, n, step, noise=True):
    el = elements(rng, body)
    ts = [t0]
    for _ in range(n - 1):
        ts.append(ts[-1] + rng.uniform(*step))
    states = []
    for t in ts:
        s = kepler(el, t - t0)
        if noise:
            s = [s[k] + rng.gauss(0, 1e-3 if k < 3 else 1e-6) for k in range(6)]
        states.append(s)
    return ts, states


def seg(file, name, target, centre, frame, typ, degree, ts, states, start=None, end=None):
    return dict(file=file, name=name, target=target, centre=centre, frame=frame, type=typ,
                degree=degree, epochs=ts, states=states,
                start=ts[0] if start is None else start, end=ts[-1] if end is None else end)


def draw_inputs(rng):
    segs = []
    # F1
    t0 = rng.uniform(-3e8, 9e8)
    ts, st = series(rng, EARTH, t0, 257, (30, 90))
    segs.append(seg("F1", "F1 S1 -1001 type 13 deg 7", -1001, 399, "J2000", 13, 7, ts, st))
    s1 = ts
    ts, st = series(rng, EARTH, s1[200] + 7.5, 300, (30, 90))
    segs.append(seg("F1", "F1 S2 -1001 type 13 deg 9", -1001, 399, "J2000", 13, 9, ts, st,
                    ts[0] + 10.0, ts[-1] - 10.0))
    s2_end = ts[-1] - 10.0
    t3 = rng.uniform(s1[0] + 100.0, s2_end - 101 * 90.0 - 100.0)
    ts, st = series(rng, EARTH, t3, 101, (30, 90))
    segs.append(seg("F1", "F1 S3 -1003 wrt -1001 type 13 deg 15", -1003, -1001, "J2000", 13,
                    15, ts, st))
    # F2
    t0 = rng.uniform(-3e8, 9e8)
    ts, st = series(rng, MOON, t0, 250, (60, 240))
    segs.append(seg("F2", "F2 S1 -1002 type 9 deg 8", -1002, 301, "J2000", 9, 8, ts, st))
    ts, st = series(rng, MOON, ts[-1] + 86400.0, 100, (60, 240))
    segs.append(seg("F2", "F2 S2 -1002 type 9 deg 5", -1002, 301, "J2000", 9, 5, ts, st))
    t0 = rng.uniform(-3e8, 9e8)
    ts, st = series(rng, MOON, t0, 2, (60, 240))
    segs.append(seg("F2", "F2 S3 -1004 ECLIPJ2000 deg 1", -1004, 301, "ECLIPJ2000", 9, 1,
                    ts, st))
    # F3 (F4 is its first 25 segments)
    for k in range(27):
        j = k // 2
        if k % 2 == 0:
            typ, deg = 9, (2 * j + 1 if j % 2 == 0 else 2 * j)
            nmin = TYPE9_MIN(deg)
        else:
            typ, deg = 13, 2 * j + 1
            nmin = TYPE13_MIN(deg)
        n = max(nmin, 20 - (k % 5))
        t0 = rng.uniform(-3e8, 9e8)
        ts, st = series(rng, EARTH, t0, n, (30, 90))
        segs.append(seg("F3", f"F3 seg {k} type {typ} deg {deg}", -1100 - k, 399, "J2000", typ,
                        deg, ts, st))
    return segs


def iso(day0, elapsed, leap_at=None):
    """Label for 2016-12-31 + elapsed seconds from 23:40:00, the leap second counted."""
    # day0 is the 23:40:00 offset of 2016-12-31 (85200 s of day).
    sod = 85200.0 + elapsed
    if sod < 86400.0:
        h, rem = divmod(sod, 3600.0)
        mi, sec = divmod(rem, 60.0)
        return f"2016-12-31T{int(h):02d}:{int(mi):02d}:{sec:06.3f}"
    if sod < 86401.0:
        return f"2016-12-31T23:59:{sod - 86340.0:06.3f}"
    sod -= 86401.0
    h, rem = divmod(sod, 3600.0)
    mi, sec = divmod(rem, 60.0)
    return f"2017-01-01T{int(h):02d}:{int(mi):02d}:{sec:06.3f}"


def oem(rng):
    el = elements(rng, EARTH)
    el_b = elements(rng, MOON)
    a_lines, e = [], 0.0
    forced = False
    while len(a_lines) < 41:
        a_lines.append((iso(0, e), kepler(el, e)))
        step = round(rng.uniform(30, 90), 3)
        if not forced and e < 1200.5 <= e + step:
            e, forced = 1200.5, True
        else:
            e = round(e + step, 3)
    assert any(l[0] == "2016-12-31T23:59:60.500" for l in a_lines)
    b_lines, e = [], 0.0
    for _ in range(31):
        sod = e
        d, sod = divmod(sod, 86400.0)
        h, rem = divmod(sod, 3600.0)
        mi, sec = divmod(rem, 60.0)
        b_lines.append((f"2020-06-{1 + int(d):02d}T{int(h):02d}:{int(mi):02d}:{sec:06.3f}",
                        kepler(el_b, e)))
        e = round(e + rng.uniform(30, 90), 3)

    def block(name, oid, centre, ts, lines):
        out = ["META_START", f"OBJECT_NAME = {name}", f"OBJECT_ID = {oid}",
               f"CENTER_NAME = {centre}", "REF_FRAME = EME2000", f"TIME_SYSTEM = {ts}",
               f"START_TIME = {lines[0][0]}", f"STOP_TIME = {lines[-1][0]}", "META_STOP", ""]
        for ep, s in lines:
            out.append(ep + " " + " ".join(f"{v:.6f}" for v in s[:3]) + " "
                       + " ".join(f"{v:.9f}" for v in s[3:]))
        return out + [""]

    text = ["CCSDS_OEM_VERS = 2.0", "CREATION_DATE = 2026-10-13T00:00:00",
            "ORIGINATOR = KSHANA XVAL", ""]
    text += block("XVAL A", "XVAL-A", "EARTH", "UTC", a_lines)
    text += block("XVAL B", "XVAL-B", "MOON", "TDB", b_lines)
    return "\n".join(text)


def eval_epochs(rng, s):
    lo, hi = s["start"], s["end"]
    ts = s["epochs"]
    out = [t for t in ts if lo <= t <= hi]
    out += [(ts[i] + ts[i + 1]) / 2 for i in range(len(ts) - 1)
            if lo <= (ts[i] + ts[i + 1]) / 2 <= hi]
    out += [lo, hi]
    for k in range(1, (len(ts) - 1) // 100 + 1):
        t = ts[100 * k]
        for x in (t, math.nextafter(t, -math.inf), math.nextafter(t, math.inf)):
            if lo <= x <= hi:
                out.append(x)
    out += [rng.uniform(lo, hi) for _ in range(25)]
    return out


def inputs(root: Path) -> None:
    rng = random.Random(SEED)
    segs = draw_inputs(rng)
    oem_text = oem(rng)
    for s in segs:
        s["eval"] = eval_epochs(rng, s)
    files = {
        "F1": dict(ifname="KSHANA SPK XVAL F1", ncomch=0, comments=[]),
        "F2": dict(ifname="KSHANA SPK XVAL F2", ncomch=2400, comments=[
            "Kshana SPK writer cross-validation, file F2.",
            "".join(chr(33 + (i % 94)) for i in range(1100)),
            "a line with trailing blanks   "]),
        "F3": dict(ifname="KSHANA SPK XVAL F3", ncomch=0, comments=[]),
        "F4": dict(ifname="KSHANA SPK XVAL F4", ncomch=0, comments=[]),
    }
    root.mkdir(parents=True, exist_ok=True)
    (root / "inputs.json").write_text(json.dumps(
        dict(seed=SEED, files=files, segments=segs), indent=0) + "\n")
    (root / "oem_input.oem").write_text(oem_text)


FILES = ["F1", "F2", "F3", "F4"]


def file_segments(inp, f):
    if f == "F4":
        return [s for s in inp["segments"] if s["file"] == "F3"][:25]
    return [s for s in inp["segments"] if s["file"] == f]


def spice_write(sp, inp, f, path):
    meta = inp["files"][f]
    if path.exists():
        path.unlink()
    h = sp.spkopn(str(path), meta["ifname"], meta["ncomch"])
    if meta["comments"]:
        sp.dafac(h, meta["comments"])
    for s in file_segments(inp, f):
        n = len(s["epochs"])
        args = (h, s["target"], s["centre"], s["frame"], s["start"], s["end"], s["name"],
                s["degree"], n, s["states"], s["epochs"])
        (sp.spkw09 if s["type"] == 9 else sp.spkw13)(*args)
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
    """spkpvn on each segment and spkgeo body-level, at the pre-registered epochs."""
    import numpy as np
    inv = inventory(sp, path)
    sp.furnsh(str(path))
    hd = sp.dafopr(str(path))
    segs = file_segments(inp, f)
    res = []
    for k, s in enumerate(segs):
        descr = np.array(inv["segments"][k]["descr"])
        frame = sp.frmnam(s["frame"])
        rows = []
        for et in s["eval"]:
            _, pvn, _ = sp.spkpvn(hd, descr, et)
            geo, _ = sp.spkgeo(s["target"], et, frame, s["centre"])
            rows.append([et] + [float(x) for x in pvn] + [float(x) for x in geo])
        res.append(rows)
    chains = []
    if f == "F1":
        s3 = segs[2]
        for targ, obs in [(-1003, 399), (399, -1003), (-1001, -1003)]:
            rows = []
            for et in s3["eval"]:
                geo, _ = sp.spkgeo(targ, et, "J2000", obs)
                rows.append([et] + [float(x) for x in geo])
            chains.append(dict(target=targ, observer=obs, rows=rows))
    sp.dafcls(hd)
    sp.unload(str(path))
    return dict(inventory=inv, pvn_geo=res, chains=chains)


def sha256(path):
    import hashlib
    return hashlib.sha256(path.read_bytes()).hexdigest()


def oracle(root: Path) -> None:
    import os
    import spiceypy as sp
    inp = json.loads((root / "inputs.json").read_text())
    lsk = os.environ.get("NAIF_LSK", str(root / ".." / "naif" / "naif0012.tls"))
    sp.furnsh(lsk)
    (root / "spice").mkdir(exist_ok=True)
    (root / "outputs").mkdir(exist_ok=True)
    out = dict(toolkit=sp.tkvrsn("TOOLKIT"), spiceypy=sp.__version__,
               lsk_sha256=sha256(Path(lsk)), files={})
    for f in FILES:
        sp_path = root / "spice" / f"{f}.bsp"
        spice_write(sp, inp, f, sp_path)
        ks_path = root / "kshana" / f"{f}.bsp"
        out["files"][f] = dict(kshana_sha256=sha256(ks_path), spice_sha256=sha256(sp_path),
                               kshana=evaluate(sp, inp, f, ks_path),
                               spice=evaluate(sp, inp, f, sp_path))
    # OEM export: str2et of every line, and SPICE on the Kshana export at those ETs.
    ks_oem = root / "kshana" / "oem_export.bsp"
    lines, ts, oem = [], None, []
    for raw in (root / "oem_input.oem").read_text().splitlines():
        t = raw.strip()
        if t.startswith("TIME_SYSTEM"):
            ts = t.split("=")[1].strip()
        elif t.startswith("CENTER_NAME"):
            centre = {"EARTH": 399, "MOON": 301}[t.split("=")[1].strip()]
        elif t and t[0].isdigit() and "T" in t.split()[0] and len(t.split()) == 7:
            v = t.split()
            et = sp.str2et(f"{v[0]} {ts}")
            oem.append(dict(label=v[0], time_system=ts, et=et, centre=centre,
                            state=[float(x) for x in v[1:]]))
    sp.furnsh(str(ks_oem))
    for row in oem:
        target = -1201 if row["centre"] == 399 else -1202
        geo, _ = sp.spkgeo(target, row["et"], "J2000", row["centre"])
        row["spice_state"] = [float(x) for x in geo]
    sp.unload(str(ks_oem))
    out["oem"] = dict(kshana_sha256=sha256(ks_oem), inventory=inventory(sp, ks_oem), lines=oem)
    (root / "outputs" / "spice.json").write_text(json.dumps(out) + "\n")


if __name__ == "__main__":
    cmd, root = sys.argv[1], Path(sys.argv[2])
    {"inputs": inputs, "oracle": oracle}[cmd](root)
