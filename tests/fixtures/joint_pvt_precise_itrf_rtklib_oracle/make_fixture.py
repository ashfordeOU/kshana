#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Build the joint_pvt_precise_itrf_rtklib_oracle fixture: GPS + Galileo cuts of the CODE MGEX
final orbit and clock products, the igs14 satellite antennas and the CODE P1-C1 code biases for
2018-05-13, and RTKLIB rnx2rtkp precise-product ionosphere-free single-point solutions on the
committed ABMF observation slice of ../joint_pvt_dual_freq_itrf_rtklib_oracle.

Inputs (SHA-256 values checked before use):
  https://igs.bkg.bund.de/root_ftp/IGS/products/mgex/2000/com20006.eph.Z, com20006.clk.Z
  https://igs.bkg.bund.de/root_ftp/IGS/products/mgex/2001/com20010.eph.Z, com20010.clk.Z,
                                                         com20011.eph.Z, com20011.clk.Z
  https://files.igs.org/pub/station/general/igs14.atx
  https://www.aiub.unibe.ch/download/CODE/2018/P1C11805.DCB.Z

Usage (oracle toolchain: `source ~/Code/kshana-oracles/env.sh`), with the files above in <dir>:
  python3 make_fixture.py <dir> "$RTKLIB/app/rnx2rtkp/gcc/rnx2rtkp" <work dir>

Outputs, written next to this script:
  com_2018133_GE.sp3          GPS and Galileo orbit records 2018-05-12 21:00 to 2018-05-14 03:00
  com_2018133_GE.clk          GPS and Galileo satellite clock records at, and 30 s before, each
                              300 s observation epoch of 2018-05-13
  igs14_2018133_GE_sat.atx    the GPS and Galileo satellite antennas valid on 2018-05-13 (offsets
                              and labels; the phase-centre variation rows dropped)
  P1C11805.DCB                the CODE P1-C1 code biases of May 2018 (decompressed, unchanged)
  rtklib_spp_precise.conf     the rnx2rtkp configuration
  rtklib_spp_precise.csv      per epoch: GPS time of week, RTKLIB ECEF position (m), satellites,
                              the GPS receiver clock and the Galileo-minus-GPS offset (ns)
"""
import datetime as dt
import gzip
import hashlib
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DUAL = os.path.join(os.path.dirname(HERE), "joint_pvt_dual_freq_itrf_rtklib_oracle")
OBS = os.path.join(DUAL, "abmf_2018133_300s_GE_dual.rnx")
# Broadcast navigation: RTKLIB's satposs needs a broadcast clock to form the transmit time even
# with precise products; the positions and clocks it then uses are the precise ones.
NAV = os.path.join(DUAL, "brdc_2018133_G_Efnav.rnx")
SHA256 = {
    "com20006.eph.Z": "d797a7f44d7a103dddc2e5a06bf991f8d163ecd80e46bd45ef7db8ea636f3693",
    "com20006.clk.Z": "7e053880d359cac60df803dec94839b364290770f89f49e1e8f92c26ed8ca847",
    "com20010.eph.Z": "2e92f400554484211c6007d315a108fa53fd853092604801bec5f0f80be91f9a",
    "com20010.clk.Z": "e20a4fb5c13cd3b3c3c2e37dc69859d8937af3971830a7a56fdeaf2d72889b83",
    "com20011.eph.Z": "db91b7021bc43afbbd6c82839bfdd5d1ebde63b4f7f7b70a19f0677ff5e5cc84",
    "com20011.clk.Z": "93c5bca34ef9034feb1eba7862ffd614f4718aa5b883ce534514d5340d5264db",
    "igs14.atx": "dace943a12ae87dc70c4e2a1811244bcc3054ce5f17504313309af923d023b5f",
    "P1C11805.DCB.Z": "7e12b6d574fe0e1475fa644a0c070445469664458e9b6f2de8ff4777b7ae38af",
}
DAYS = ["com20006", "com20010", "com20011"]
ORB_FROM = dt.datetime(2018, 5, 12, 21, 0)
ORB_TO = dt.datetime(2018, 5, 14, 3, 0)
DAY = dt.datetime(2018, 5, 13)

CONF = """pos1-posmode       =single
pos1-frequency     =l1+l2+l5
pos1-soltype       =forward
pos1-elmask        =10
pos1-snrmask_r     =off
pos1-dynamics      =off
pos1-tidecorr      =off
pos1-ionoopt       =dual-freq
pos1-tropopt       =saas
pos1-sateph        =precise
pos1-posopt5       =off
pos1-exclsats      =
pos1-navsys        =9
pos2-armode        =off
out-solformat      =xyz
out-outhead        =on
out-timesys        =gpst
out-timeform       =tow
out-timendec       =3
out-outstat        =state
misc-timeinterp    =off
file-satantfile    =%s
file-dcbfile       =%s
"""


def check_hashes(d):
    for name, want in SHA256.items():
        with open(os.path.join(d, name), "rb") as f:
            got = hashlib.sha256(f.read()).hexdigest()
        assert got == want, (name, got)


def unz(d, name):
    """Decompress a Unix-compress (.Z) file with the system gzip."""
    return subprocess.run(["gzip", "-dc", os.path.join(d, name)], check=True,
                          capture_output=True).stdout.decode("ascii")


def sp3_time(line):
    t = line[3:31].split()
    sec = float(t[5])
    return dt.datetime(int(t[0]), int(t[1]), int(t[2]), int(t[3]), int(t[4])) + dt.timedelta(seconds=sec)


def cut_sp3(d):
    texts = [unz(d, f + ".eph.Z").splitlines() for f in DAYS]
    head = texts[1][: next(i for i, l in enumerate(texts[1]) if l.startswith("*"))]
    epochs = {}
    for lines in texts:
        i = next(k for k, l in enumerate(lines) if l.startswith("*"))
        while i < len(lines) and not lines[i].startswith("EOF"):
            t = sp3_time(lines[i])
            j = i + 1
            recs = []
            while j < len(lines) and lines[j][0] in "PVEe" and not lines[j].startswith("EOF"):
                recs.append(lines[j])
                j += 1
            if ORB_FROM <= t <= ORB_TO and t not in epochs:
                epochs[t] = [r for r in recs if r[0] == "P" and r[1] in "GE"]
            i = j
    sats = sorted({r[1:4] for v in epochs.values() for r in v})
    times = sorted(epochs)
    # every kept epoch must carry every kept satellite (RTKLIB reads a fixed record count)
    for t in times:
        have = {r[1:4] for r in epochs[t]}
        for s in sats:
            if s not in have:
                epochs[t].append("P%s      0.000000      0.000000      0.000000 999999.999999" % s)
        epochs[t].sort(key=lambda r: sats.index(r[1:4]))
    t0 = times[0]
    out = []
    l1 = head[0]
    out.append(l1[:3] + "%4d %2d %2d %2d %2d %11.8f %7d" % (t0.year, t0.month, t0.day, t0.hour, t0.minute,
               t0.second, len(times)) + l1[39:])
    out.append(head[1])  # week and interval lines kept (informational)
    plus = [l for l in head if l.startswith("+ ")]
    pp = [l for l in head if l.startswith("++")]
    ids = sats + ["  0"] * (17 * len(plus) - len(sats))
    for k in range(len(plus)):
        lead = "+  %3d   " % len(sats) if k == 0 else "+        "
        out.append(lead + "".join(ids[17 * k: 17 * k + 17]))
    acc = ["  5" if s != "  0" else "  0" for s in ids]
    for k in range(len(pp)):
        out.append("++       " + "".join(acc[17 * k: 17 * k + 17]))
    out.extend(l for l in head[2:] if not l.startswith("+"))
    out.append("/* GPS and Galileo records of com20006/com20010/com20011,   ")
    out.append("/* 2018-05-12 21:00 to 2018-05-14 03:00, for a test fixture ")
    for t in times:
        out.append("*  %4d %2d %2d %2d %2d %11.8f" % (t.year, t.month, t.day, t.hour, t.minute, t.second))
        out.extend(epochs[t])
    out.append("EOF")
    with open(os.path.join(HERE, "com_2018133_GE.sp3"), "w") as f:
        f.write("\n".join(out) + "\n")
    return len(times), len(sats)


def cut_clk(d):
    want = set()
    for k in range(288):
        t = DAY + dt.timedelta(seconds=300 * k)
        want.add(t)
        want.add(t - dt.timedelta(seconds=30))
    head, recs = None, {}
    for f in DAYS:
        lines = unz(d, f + ".clk.Z").splitlines()
        h = next(i for i, l in enumerate(lines) if l[60:].startswith("END OF HEADER"))
        if f == "com20010":
            head = lines[: h + 1]
        for l in lines[h + 1:]:
            if not l.startswith("AS ") or l[3] not in "GE":
                continue
            t = l[8:34].split()
            tt = dt.datetime(int(t[0]), int(t[1]), int(t[2]), int(t[3]), int(t[4])) + dt.timedelta(
                seconds=float(t[5]))
            if tt in want:
                recs.setdefault((tt, l[3:6]), l.rstrip())
    out = [l for l in head if not l[60:].startswith(("# OF SOLN SATS", "PRN LIST"))]
    out.insert(len(out) - 1, "GPS and Galileo AS records at and 30 s before each 300 s".ljust(60) + "COMMENT")
    out.insert(len(out) - 1, "epoch of 2018-05-13, cut for a test fixture".ljust(60) + "COMMENT")
    out.extend(recs[k] for k in sorted(recs))
    with open(os.path.join(HERE, "com_2018133_GE.clk"), "w") as f:
        f.write("\n".join(out) + "\n")
    return len(recs)


def cut_atx(d):
    with open(os.path.join(d, "igs14.atx")) as f:
        lines = f.read().splitlines()
    h = next(i for i, l in enumerate(lines) if l[60:].startswith("END OF HEADER"))
    out = lines[: h + 1]
    i, n = h + 1, 0
    while i < len(lines):
        if lines[i][60:].startswith("START OF ANTENNA"):
            j = i
            while not lines[j][60:].startswith("END OF ANTENNA"):
                j += 1
            blk = lines[i: j + 1]
            ts = blk[1][20:23]
            ok = ts[0] in "GE" and ts[1:].isdigit()
            if ok:
                frm = [l for l in blk if l[60:].startswith("VALID FROM")]
                unt = [l for l in blk if l[60:].startswith("VALID UNTIL")]
                p = lambda l: dt.datetime(*[int(float(x)) for x in l[:43].split()[:5]])
                ok = (not frm or p(frm[0]) <= DAY) and (not unt or p(unt[0]) >= DAY + dt.timedelta(days=1))
            if ok:
                # phase-centre variation rows (NOAZI and azimuth rows) are dropped: the
                # offsets are what code positioning uses, and the cut stays small
                out.extend(l for l in blk if len(l.rstrip()) <= 80 and l[60:].strip())
                n += 1
            i = j + 1
        else:
            i += 1
    with open(os.path.join(HERE, "igs14_2018133_GE_sat.atx"), "w") as f:
        f.write("\n".join(out) + "\n")
    return n


def run_rtklib(rnx2rtkp, work):
    os.makedirs(work, exist_ok=True)
    conf = os.path.join(HERE, "rtklib_spp_precise.conf")
    with open(conf, "w") as f:
        f.write(CONF % ("igs14_2018133_GE_sat.atx", "P1C11805.DCB"))
    # rnx2rtkp resolves the file-* paths against the working directory
    pos = os.path.join(work, "rtklib_spp_precise.pos")
    subprocess.run(
        [rnx2rtkp, "-k", conf, "-o", pos, OBS, NAV, os.path.join(HERE, "com_2018133_GE.sp3"),
         os.path.join(HERE, "com_2018133_GE.clk")],
        check=True, cwd=HERE,
    )
    sols = {}
    with open(pos) as f:
        for line in f:
            if line.startswith("%") or not line.strip():
                continue
            t = line.split()
            sols[round(float(t[1]), 3)] = (float(t[2]), float(t[3]), float(t[4]), int(t[5]), int(t[6]))
    clks = {}
    with open(pos + ".stat") as f:
        for line in f:
            if line.startswith("$CLK"):
                t = line.strip().split(",")
                clks[round(float(t[2]), 3)] = (float(t[5]), float(t[7]))
    rows = []
    for tow in sorted(sols):
        if tow not in clks:
            continue
        x, y, z, q, ns = sols[tow]
        rows.append(f"{tow:.3f},{x:.4f},{y:.4f},{z:.4f},{ns},{clks[tow][0]:.3f},{clks[tow][1]:.3f}")
    with open(os.path.join(HERE, "rtklib_spp_precise.csv"), "w") as f:
        f.write("# RTKLIB v2.4.2-p13 rnx2rtkp, rtklib_spp_precise.conf, on the committed slices\n")
        f.write("# gps_tow_s,x_m,y_m,z_m,n_sat,clk_gps_ns,clk_gal_minus_gps_ns\n")
        f.write("\n".join(rows) + "\n")
    return len(rows)


def main():
    d, rnx2rtkp, work = sys.argv[1:4]
    check_hashes(d)
    ne, ns = cut_sp3(d)
    nc = cut_clk(d)
    na = cut_atx(d)
    with open(os.path.join(HERE, "P1C11805.DCB"), "w") as f:
        f.write(unz(d, "P1C11805.DCB.Z"))
    m = run_rtklib(rnx2rtkp, work)
    print(f"orbit epochs {ne}, satellites {ns}; clock records {nc}; antennas {na}; RTKLIB solutions {m}")


if __name__ == "__main__":
    main()
