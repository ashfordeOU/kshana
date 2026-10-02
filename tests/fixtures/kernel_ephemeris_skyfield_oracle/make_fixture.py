#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the fixture of tests/kernel_ephemeris_skyfield_oracle.rs.

Run once, after the pre-registration commit was published, with that commit's hash:

    $ORACLE_PY tests/fixtures/kernel_ephemeris_skyfield_oracle/make_fixture.py --seed-commit <sha>

Oracle: Skyfield 1.54 (MIT) with its own de440s.bsp reader (jplephem) and its own time scales.
The cut kernel for the engine reuses, unchanged, the record copier and DAF writer of
../naif_reader_spice_oracle/make_fixture.py, and SPICE (CSPICE N0067, spiceypy 8.2.0) checks the
cut evaluates bit for bit like the full file. Calls no Kshana code.
"""
import argparse
import hashlib
import math
import pathlib
import random
import sys

import spiceypy as sp
from skyfield import __version__ as skyfield_version
from skyfield.api import load

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "naif_reader_spice_oracle"))
import make_fixture as reader  # noqa: E402

NAMES = {"Sun": 10, "Mercury": 199, "Venus": 299, "Earth": 399, "Moon": 301}
N = 200
FIRST = (1973, 1, 1)
LAST = (2026, 9, 30)


def sha(p):
    return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--seed-commit", required=True)
    commit = ap.parse_args().seed_commit.strip().lower()
    assert len(commit) == 40
    seed = int(commit[:16], 16)
    rng = random.Random(seed)

    ts = load.timescale(builtin=True)
    eph = load(str(reader.SPK))
    d0 = ts.utc(*FIRST)
    d1 = ts.utc(*LAST)
    n_days = int(round((d1.tt - d0.tt))) + 1
    # 1. The draw, in the pre-registered order: day, then second of day, for 200 epochs; then pairs.
    epochs = []
    for _ in range(N):
        day = rng.randrange(n_days)
        sec = rng.randrange(86399)
        epochs.append((day, sec))
    names = list(NAMES)
    pairs = []
    for _ in range(N):
        t = rng.choice(names)
        c = rng.choice([x for x in names if x != t])
        pairs.append((t, c))

    for k in (reader.LSK, reader.SPK):
        sp.furnsh(str(k))
    hs, spk_segs = reader.segments(reader.SPK, 2, 6)

    rows, cut, seen = [], [], set()
    for i, ((day, sec), pair) in enumerate(zip(epochs, pairs)):
        y, m, d = FIRST
        t_day = ts.utc(y, m, d + day)
        cal = t_day.utc  # normalised calendar date of that day
        yy, mm, dd = int(cal[0]), int(cal[1]), int(cal[2])
        t = ts.utc(yy, mm, dd, 0, 0, sec)
        # UTC day start as a Julian date (x.5), from the calendar, independent of any time scale.
        a = (14 - mm) // 12
        yv, mv = yy + 4800 - a, mm + 12 * a - 3
        jdn = dd + (153 * mv + 2) // 5 + 365 * yv + yv // 4 - yv // 100 + yv // 400 - 32045
        jd_day = jdn - 0.5
        et = (t.tdb - 2451545.0) * 86400.0
        for tn, cn in (pair, ("Moon", "Earth"), ("Sun", "Earth")):
            p = (eph[NAMES[tn]] - eph[NAMES[cn]]).at(t)
            pos = p.position.m
            rel_speed = math.sqrt(sum(v * v for v in p.velocity.m_per_s))
            r_scale = max(math.sqrt(sum(x * x for x in eph[NAMES[b]].at(t).position.m)) for b in (tn, cn))
            rows.append([i, jd_day, sec, tn, cn, r_scale, rel_speed, *pos])
            for b in set(reader.chain(NAMES[tn]) + reader.chain(NAMES[cn])) - {0}:
                for e in (et - 1.0, et, et + 1.0):
                    cands = [s for s in spk_segs if s[1][0] == b and s[0][0] <= e <= s[0][1]]
                    seg = cands[-1]
                    k = reader.covering(seg, e)
                    key = (spk_segs.index(seg), k)
                    if key not in seen:
                        seen.add(key)
                        cut.append(reader.one_record_segment(seg, reader.record(hs, seg, k), f"r{k}"))
    sp.dafcls(hs)

    out = HERE / "grid_de440s.bsp"
    tmp = HERE / "grid_de440s.bsp.tmp"
    tmp.write_bytes(reader.daf_bytes("DAF/SPK", 2, 6, "kernel ephemeris skyfield grid", cut))
    # SPICE: the cut reproduces the full file bit for bit at every comparison epoch.
    checks = []
    for r in rows:
        et = (ts.utc(*[int(x) for x in ts.tt_jd(r[1] + 0.5).utc[:3]], 0, 0, r[2]).tdb - 2451545.0) * 86400.0
        checks.append((NAMES[r[3]], NAMES[r[4]], et))
    full = [list(sp.spkgeo(a, e, "J2000", b)[0]) for a, b, e in checks]
    sp.kclear()
    sp.furnsh(str(reader.LSK))
    sp.furnsh(str(tmp))
    sub = [list(sp.spkgeo(a, e, "J2000", b)[0]) for a, b, e in checks]
    sp.kclear()
    if full != sub:
        tmp.unlink()
        raise SystemExit("cut kernel differs from de440s.bsp")
    tmp.rename(out)

    with open(HERE / "positions.csv", "w") as f:
        f.write(f"# make_fixture.py --seed-commit {commit} (seed {seed}); Skyfield {skyfield_version}, "
                f"builtin leap seconds; de440s.bsp {sha(reader.SPK)}\n")
        f.write("# epoch_index,utc_day_start_jd,utc_seconds_of_day,target,center,R_m,rel_speed_m_s,x_m,y_m,z_m\n")
        for r in rows:
            f.write(",".join(repr(float(x)) if isinstance(x, float) else str(x) for x in r) + "\n")
    with open(HERE / "SHA256SUMS", "w") as f:
        for p in ("grid_de440s.bsp", "positions.csv"):
            f.write(f"{sha(HERE / p)}  {p}\n")
    print(f"seed {seed}: {len(rows)} positions, {len(cut)} records")


if __name__ == "__main__":
    main()
