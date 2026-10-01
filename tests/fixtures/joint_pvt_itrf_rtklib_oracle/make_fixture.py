#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Build the joint_pvt_itrf_rtklib_oracle fixture: a GPS + Galileo single-frequency slice of the
IGS station ABMF for 2018-05-13, and RTKLIB rnx2rtkp single-point solutions on that same slice.

Inputs (all public, from the BKG IGS archive, https://igs.bkg.bund.de/root_ftp/IGS/):
  obs/2018/133/ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz   (Hatanaka-compressed RINEX 3.02)
  BRDC/2018/133/BRDC00WRD_R_20181330000_01D_MN.rnx.gz      (combined multi-GNSS broadcast nav)
  obs/2018/133/ABMF00GLP_R_20181330000_01D_GN.rnx.gz       (station GPS nav: Klobuchar header)

Usage, with the oracle toolchain (`source ~/Code/kshana-oracles/env.sh`; `crx2rnx` is the Hatanaka
decompressor of the `hatanaka` Python package in that environment):
  gzip -dc ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz > abmf.crx && crx2rnx abmf.crx   # -> abmf.rnx
  gzip -dc BRDC00WRD_R_20181330000_01D_MN.rnx.gz > brdm.rnx
  gzip -dc ABMF00GLP_R_20181330000_01D_GN.rnx.gz > abmf_gn.rnx
  python3 make_fixture.py abmf.rnx brdm.rnx abmf_gn.rnx "$RTKLIB/app/rnx2rtkp/gcc/rnx2rtkp" <work dir>

Outputs, written next to this script:
  abmf_2018133_300s_GE_C1C.rnx   epochs every 300 s, GPS and Galileo, the C1C observable only
  brdc_2018133_G_Einav.rnx       GPS records and the Galileo I/NAV records issued on the hour,
                                 from 2018-05-12 20:00 to 2018-05-14 02:59, with the station's
                                 GPSA/GPSB Klobuchar header records
  rtklib_spp.conf                the rnx2rtkp configuration used
  rtklib_spp.csv                 per epoch: GPS time of week, RTKLIB ECEF position (m), the GPS
                                 receiver clock and the Galileo-minus-GPS offset (ns), from its
                                 solution and $CLK status records
"""
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OBS_OUT = "abmf_2018133_300s_GE_C1C.rnx"
NAV_OUT = "brdc_2018133_G_Einav.rnx"
DECIMATE_S = 300

CONF = """pos1-posmode       =single
pos1-frequency     =l1
pos1-soltype       =forward
pos1-elmask        =10
pos1-snrmask_r     =off
pos1-dynamics      =off
pos1-tidecorr      =off
pos1-ionoopt       =brdc
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


def slice_obs(src, dst):
    with open(src) as f:
        lines = f.read().splitlines()
    out = []
    i = 0
    while True:
        line = lines[i]
        label = line[60:].strip()
        i += 1
        if label == "SYS / # / OBS TYPES":
            if line[0] == "G":
                out.append(f"{'G':<1}{1:>5} {'C1C':<3}".ljust(60) + "SYS / # / OBS TYPES")
                out.append(f"{'E':<1}{1:>5} {'C1C':<3}".ljust(60) + "SYS / # / OBS TYPES")
            continue
        if label in ("SYS / PHASE SHIFT", "GLONASS SLOT / FRQ #", "GLONASS COD/PHS/BIS"):
            continue
        if label == "INTERVAL":
            out.append(f"{DECIMATE_S:10.3f}".ljust(60) + "INTERVAL")
            continue
        out.append(line)
        if label == "END OF HEADER":
            break
    # every header block of the source lists C1C first for both GPS and Galileo
    n_epochs = 0
    while i < len(lines):
        head = lines[i]
        assert head.startswith(">"), head
        flag = int(head[31])
        nsat = int(head[32:35])
        body = lines[i + 1 : i + 1 + nsat]
        i += 1 + nsat
        if flag > 1:
            continue
        sec = float(head[19:29])
        minute = int(head[16:18])
        hour = int(head[13:15])
        sod = hour * 3600 + minute * 60 + sec
        if abs(sod / DECIMATE_S - round(sod / DECIMATE_S)) > 1e-9:
            continue
        keep = []
        for b in body:
            if b[0] not in "GE":
                continue
            field = b[3:19]
            if not field[:14].strip():
                continue
            keep.append(b[:3] + field.rstrip())
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
    out = []
    i = 0
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
        if sys_ == "E" and (minute, sec) != ("00", "00"):
            continue  # Galileo: keep the records issued on the hour (fixture size)
        if sys_ == "E":
            data_source = int(float(rec[5][23:42].replace("D", "E")))
            if not (data_source & 1 or data_source & 512):
                continue  # F/NAV duplicate
        kept[sys_] += 1
        out.extend(rec)
    with open(dst, "w") as f:
        f.write("\n".join(out) + "\n")
    return kept


def run_rtklib(rnx2rtkp, work):
    os.makedirs(work, exist_ok=True)
    conf = os.path.join(HERE, "rtklib_spp.conf")
    with open(conf, "w") as f:
        f.write(CONF)
    pos = os.path.join(work, "rtklib_spp.pos")
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
            # week tow x y z Q ns ...
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
    with open(os.path.join(HERE, "rtklib_spp.csv"), "w") as f:
        f.write("# RTKLIB v2.4.2-p13 rnx2rtkp, rtklib_spp.conf, on the two committed RINEX slices\n")
        f.write("# gps_tow_s,x_m,y_m,z_m,n_sat,clk_gps_ns,clk_gal_minus_gps_ns\n")
        f.write("\n".join(rows) + "\n")
    return len(rows)


def main():
    obs, brdm, gn, rnx2rtkp, work = sys.argv[1:6]
    n = slice_obs(obs, os.path.join(HERE, OBS_OUT))
    kept = slice_nav(brdm, gn, os.path.join(HERE, NAV_OUT))
    m = run_rtklib(rnx2rtkp, work)
    print(f"obs epochs {n}; nav records {kept}; RTKLIB solutions {m}")


if __name__ == "__main__":
    main()
