#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Build the joint_pvt_dual_freq_itrf_rtklib_oracle fixture: a dual-frequency GPS + Galileo slice
of the IGS station ABMF for 2018-05-13, and RTKLIB rnx2rtkp ionosphere-free single-point solutions
on that same slice.

Inputs (the same public files as ../joint_pvt_itrf_rtklib_oracle, from the BKG IGS archive,
https://igs.bkg.bund.de/root_ftp/IGS/; the SHA-256 values are checked before use):
  obs/2018/133/ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz
  BRDC/2018/133/BRDC00WRD_R_20181330000_01D_MN.rnx.gz
  obs/2018/133/ABMF00GLP_R_20181330000_01D_GN.rnx.gz   (GPSA/GPSB header lines only)

Usage (oracle toolchain: `source ~/Code/kshana-oracles/env.sh`):
  gzip -dc ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz > abmf.crx && crx2rnx abmf.crx   # -> abmf.rnx
  gzip -dc BRDC00WRD_R_20181330000_01D_MN.rnx.gz > brdm.rnx
  gzip -dc ABMF00GLP_R_20181330000_01D_GN.rnx.gz > abmf_gn.rnx
  python3 make_fixture.py <dir with the three .gz files and the three decompressed files> \
      "$RTKLIB/app/rnx2rtkp/gcc/rnx2rtkp" <work dir>

Outputs, written next to this script:
  abmf_2018133_300s_GE_dual.rnx  epochs every 300 s; GPS C1C C2W, Galileo C1C C5Q C7Q
  brdc_2018133_G_Efnav.rnx       GPS records and the Galileo F/NAV records (clock for E1/E5a)
                                 issued on the hour, 2018-05-12 20:00 to 2018-05-14 02:59, with the
                                 station's GPSA/GPSB header records
  rtklib_spp_if.conf             the rnx2rtkp configuration used
  rtklib_spp_if.csv              per epoch: GPS time of week, RTKLIB ECEF position (m), satellites,
                                 the GPS receiver clock and the Galileo-minus-GPS offset (ns)
"""
import hashlib
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OBS_OUT = "abmf_2018133_300s_GE_dual.rnx"
NAV_OUT = "brdc_2018133_G_Efnav.rnx"
DECIMATE_S = 300
KEEP = {"G": ["C1C", "C2W"], "E": ["C1C", "C5Q", "C7Q"]}
SHA256 = {
    "ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz": "caacbbcc892123e382f126c2279f3e5902dd0e7fd302eded8902c21e416c71b1",
    "BRDC00WRD_R_20181330000_01D_MN.rnx.gz": "83374f15e83bca3b6b79e211bc2846ac5fdf8517467c50ec3f8d0f6033a336f3",
    "ABMF00GLP_R_20181330000_01D_GN.rnx.gz": "a20785937dc5539460000ba77bf6a9de7eb8181f13142c7bf9703ff69b46eb64",
}

CONF = """pos1-posmode       =single
pos1-frequency     =l1+l2+l5
pos1-soltype       =forward
pos1-elmask        =10
pos1-snrmask_r     =off
pos1-dynamics      =off
pos1-tidecorr      =off
pos1-ionoopt       =dual-freq
pos1-tropopt       =saas
pos1-sateph        =brdc
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
"""


def check_hashes(d):
    for name, want in SHA256.items():
        with open(os.path.join(d, name), "rb") as f:
            got = hashlib.sha256(f.read()).hexdigest()
        assert got == want, (name, got)


def slice_obs(src, dst):
    with open(src) as f:
        lines = f.read().splitlines()
    out, types, i = [], {}, 0
    cur = None
    while True:
        line = lines[i]
        label = line[60:].strip()
        i += 1
        if label == "SYS / # / OBS TYPES":
            if line[0] != " ":
                cur = line[0]
                types[cur] = line[7:60].split()
            else:
                types[cur] += line[7:60].split()
            continue
        if label in ("SYS / PHASE SHIFT", "GLONASS SLOT / FRQ #", "GLONASS COD/PHS/BIS"):
            continue
        if label == "INTERVAL":
            out.append(f"{DECIMATE_S:10.3f}".ljust(60) + "INTERVAL")
            continue
        if label == "END OF HEADER":
            for s in "GE":
                codes = " ".join(KEEP[s])
                out.append(f"{s:<1}{len(KEEP[s]):>5} {codes}".ljust(60) + "SYS / # / OBS TYPES")
            out.append(line)
            break
        out.append(line)
    idx = {s: [types[s].index(c) for c in KEEP[s]] for s in "GE"}
    n_epochs = 0
    while i < len(lines):
        head = lines[i]
        assert head.startswith(">"), head
        flag, nsat = int(head[31]), int(head[32:35])
        body = lines[i + 1 : i + 1 + nsat]
        i += 1 + nsat
        if flag > 1:
            continue
        sod = int(head[13:15]) * 3600 + int(head[16:18]) * 60 + float(head[19:29])
        if abs(sod / DECIMATE_S - round(sod / DECIMATE_S)) > 1e-9:
            continue
        keep = []
        for b in body:
            if b[0] not in "GE":
                continue
            fields = [b[3 + 16 * k : 3 + 16 * (k + 1)].ljust(16) for k in idx[b[0]]]
            if not fields[0][:14].strip():
                continue
            keep.append((b[:3] + "".join(fields)).rstrip())
        if not keep:
            continue
        out.append(head[:32] + f"{len(keep):3d}" + head[35:])
        out.extend(keep)
        n_epochs += 1
    with open(dst, "w") as f:
        f.write("\n".join(out) + "\n")
    return n_epochs


def slice_nav(src, gn, dst):
    with open(gn) as f:
        iono = [l for l in f.read().splitlines() if l[60:].strip() == "IONOSPHERIC CORR"]
    assert len(iono) == 2, iono
    with open(src) as f:
        lines = f.read().splitlines()
    out, i = [], 0
    while True:
        line = lines[i]
        i += 1
        if line[60:].strip() == "END OF HEADER":
            out.append("GPSA/GPSB copied from ABMF00GLP_R_20181330000_01D_GN".ljust(60) + "COMMENT")
            out.extend(iono)
            out.append(line)
            break
        out.append(line)
    kept = {"G": 0, "E": 0}
    while i < len(lines):
        rec_head = lines[i]
        sys_ = rec_head[0]
        n_lines = {"G": 8, "E": 8, "C": 8, "J": 8, "R": 4, "S": 4, "I": 8}[sys_]
        rec = lines[i : i + n_lines]
        i += n_lines
        if sys_ not in "GE":
            continue
        date, hour, minute, sec = rec_head[4:14], int(rec_head[15:17]), rec_head[18:20], rec_head[21:23]
        in_window = (
            date == "2018 05 13"
            or (date == "2018 05 12" and hour >= 20)
            or (date == "2018 05 14" and hour <= 2)
        )
        if not in_window:
            continue
        if sys_ == "E":
            if (minute, sec) != ("00", "00"):
                continue  # records issued on the hour (fixture size)
            data_source = int(float(rec[5][23:42].replace("D", "E")))
            if not (data_source & 2 or data_source & 256):
                continue  # keep F/NAV (clock for E1/E5a) only
        kept[sys_] += 1
        out.extend(rec)
    with open(dst, "w") as f:
        f.write("\n".join(out) + "\n")
    return kept


def run_rtklib(rnx2rtkp, work):
    os.makedirs(work, exist_ok=True)
    conf = os.path.join(HERE, "rtklib_spp_if.conf")
    with open(conf, "w") as f:
        f.write(CONF)
    pos = os.path.join(work, "rtklib_spp_if.pos")
    subprocess.run(
        [rnx2rtkp, "-k", conf, "-o", pos, os.path.join(HERE, OBS_OUT), os.path.join(HERE, NAV_OUT)],
        check=True,
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
    with open(os.path.join(HERE, "rtklib_spp_if.csv"), "w") as f:
        f.write("# RTKLIB v2.4.2-p13 rnx2rtkp, rtklib_spp_if.conf, on the two committed RINEX slices\n")
        f.write("# gps_tow_s,x_m,y_m,z_m,n_sat,clk_gps_ns,clk_gal_minus_gps_ns\n")
        f.write("\n".join(rows) + "\n")
    return len(rows)


def main():
    d, rnx2rtkp, work = sys.argv[1:4]
    check_hashes(d)
    n = slice_obs(os.path.join(d, "abmf.rnx"), os.path.join(HERE, OBS_OUT))
    kept = slice_nav(os.path.join(d, "brdm.rnx"), os.path.join(d, "abmf_gn.rnx"), os.path.join(HERE, NAV_OUT))
    m = run_rtklib(rnx2rtkp, work)
    print(f"obs epochs {n}; nav records {kept}; RTKLIB solutions {m}")


if __name__ == "__main__":
    main()
