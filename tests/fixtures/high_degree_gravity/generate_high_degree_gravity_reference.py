# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the oracle tables for kshana's high-degree spherical-harmonic gravity.

ORACLES (see xval/high-degree-gravity/PREREGISTRATION.md for the bars)
  O1  Orekit 12.2 (Apache-2.0) HolmesFeatherstoneAttractionModel.gradient / nonCentralPart,
      coefficients read by Orekit's ICGEMFormatReader from the same .gfc (java/HdGravDriver.java).
  O2  pyshtools 4.14.1 (SHTOOLS, BSD-3-Clause) gravmag.MakeGravGridPoint with C00 = 0,
      omega = 0; its (r, theta, phi) components are rotated to Cartesian here.

Both evaluate the NON-CENTRAL field (degrees 2..N) at the ten pre-registered points.
All degrees are read from the full ICGEM EGM2008.gfc (not committed;
scripts/fetch_egm2008.sh fetches and checks it); the script asserts that its degree-70
truncation equals the committed tools/egm2008_to70.gfc, which the always-on test reads.

OUTPUT (committed, small)
  points.txt                id lat_deg lon_deg r x y z
  orekit_egm2008.txt        N id ax ay az U
  pyshtools_egm2008.txt     N id ax ay az

REPRODUCE
  source /root/kshana-oracles/orekit/cp.sh        # OREKIT_CP, OREKIT_DATA
  python -I tests/fixtures/high_degree_gravity/generate_high_degree_gravity_reference.py \
      --full /path/to/EGM2008.gfc
  (python = a venv with numpy and pyshtools==4.14.1)
"""
import argparse
import math
import os
import subprocess
import sys
import tempfile

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", "..", ".."))
TO70 = os.path.join(ROOT, "tools", "egm2008_to70.gfc")

R_LEO = 6778136.3
R_REF = 6378136.3
# id, latitude (deg, geocentric), longitude (deg), radius (m); None lat = exact pole.
POINTS = [
    ("P1", 37.5, 23.1, R_LEO),
    ("P2", 89.999, 45.0, R_LEO),
    ("P3", 90.0, 0.0, R_LEO),
    ("P4", -90.0, 0.0, R_REF),
    ("P5", 0.0, -71.3, R_LEO),
    ("P6", 0.05, 75.0, 42164000.0),
    ("P7", -33.9, 151.2, R_REF),
    ("P8", 80.0, -40.0, R_REF),
    ("P9", -89.9999, 10.0, R_REF),
    ("P10", 68.2, -40.0, R_REF),
]
EXACT_POLES = {"P3", "P4"}


def cart(pid, lat, lon, r):
    if pid in EXACT_POLES:
        return 0.0, 0.0, math.copysign(r, lat)
    p, l = math.radians(lat), math.radians(lon)
    return r * math.cos(p) * math.cos(l), r * math.cos(p) * math.sin(l), r * math.sin(p)


def read_gfc(path, nmax):
    gm = re = None
    cilm = np.zeros((2, nmax + 1, nmax + 1))
    body = False
    with open(path) as f:
        for line in f:
            p = line.split()
            if not p:
                continue
            if not body:
                if p[0] == "earth_gravity_constant":
                    gm = float(p[1].replace("d", "e").replace("D", "e"))
                elif p[0] == "radius":
                    re = float(p[1].replace("d", "e").replace("D", "e"))
                elif p[0] == "end_of_head":
                    body = True
                continue
            if p[0] != "gfc":
                continue
            n, m = int(p[1]), int(p[2])
            if n > nmax:
                continue
            cilm[0, n, m] = float(p[3].replace("d", "e").replace("D", "e"))
            cilm[1, n, m] = float(p[4].replace("d", "e").replace("D", "e"))
    return gm, re, cilm


def pysh_rows(gfc, degrees):
    import pyshtools

    rows = []
    gm, re, cilm_full = read_gfc(gfc, max(degrees))
    cilm_full[0, 0, 0] = 0.0  # non-central part
    for n in degrees:
        cilm = np.ascontiguousarray(cilm_full[:, : n + 1, : n + 1])
        for pid, lat, lon, r in POINTS:
            if pid in EXACT_POLES:
                continue  # theta/phi unit vectors undefined on the axis (pre-registered)
            g = pyshtools.gravmag.MakeGravGridPoint(cilm, gm, re, r, lat, lon, lmax=n, omega=0.0)
            gr, gt, gp = g
            th, ph = math.radians(90.0 - lat), math.radians(lon)
            st, ct, sp, cp = math.sin(th), math.cos(th), math.sin(ph), math.cos(ph)
            ax = gr * st * cp + gt * ct * cp - gp * sp
            ay = gr * st * sp + gt * ct * sp + gp * cp
            az = gr * ct - gt * st
            rows.append(f"{n} {pid} {ax:.17e} {ay:.17e} {az:.17e}")
    return rows, pyshtools.__version__


def orekit_rows(gfc, degrees, points_file, workdir):
    cp = os.environ["OREKIT_CP"]
    data = os.environ["OREKIT_DATA"]
    src = os.path.join(HERE, "java", "HdGravDriver.java")
    subprocess.run(["javac", "-cp", cp, "-d", workdir, src], check=True)
    out = subprocess.run(
        ["java", "-Xmx6g", "-cp", cp + ":" + workdir, "HdGravDriver", data, gfc, points_file]
        + [str(d) for d in degrees],
        check=True, stdout=subprocess.PIPE, text=True,
    ).stdout
    return [l for l in out.splitlines() if l.strip()]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--full", required=True, help="path to the full ICGEM EGM2008.gfc")
    a = ap.parse_args()
    # The committed degree-70 block must be the full model's degree-70 truncation, so that
    # the always-on Kshana test (which reads tools/egm2008_to70.gfc) and the Orekit run
    # (which reads the full file; Orekit's ICGEM reader rejects the block's '#' comments)
    # see identical coefficients.
    g1, r1, c70 = read_gfc(TO70, 70)
    g2, r2, cfull70 = read_gfc(a.full, 70)
    assert (g1, r1) == (g2, r2) and np.array_equal(c70, cfull70), "to70 block != full model"

    pts = os.path.join(HERE, "points.txt")
    with open(pts, "w") as f:
        f.write("# id lat_deg lon_deg r_m x_m y_m z_m  (Earth-fixed; P3/P4 exactly on the axis)\n")
        for pid, lat, lon, r in POINTS:
            x, y, z = cart(pid, lat, lon, r)
            f.write(f"{pid} {lat!r} {lon!r} {r!r} {x:.17e} {y:.17e} {z:.17e}\n")
    # Orekit reads "id x y z".
    with tempfile.TemporaryDirectory() as td:
        xyz = os.path.join(td, "xyz.txt")
        with open(xyz, "w") as f:
            for pid, lat, lon, r in POINTS:
                x, y, z = cart(pid, lat, lon, r)
                f.write(f"{pid} {x:.17e} {y:.17e} {z:.17e}\n")
        orows = orekit_rows(a.full, [70, 200, 360, 2190], xyz, td)
    prows, pver = pysh_rows(a.full, [70, 200, 360, 2190])

    with open(os.path.join(HERE, "orekit_egm2008.txt"), "w") as f:
        f.write("# Orekit 12.2 HolmesFeatherstoneAttractionModel, body frame, NON-CENTRAL part\n")
        f.write("# all N from ICGEM EGM2008.gfc (its N<=70 block equals tools/egm2008_to70.gfc)\n")
        f.write("# (SHA-256 ab5b524da073e63b5bdceb7ca47a0de07a26dd44a1c5798f39fc98dc80af70fd)\n")
        f.write("# columns: N id ax ay az (m/s^2) U (m^2/s^2)\n")
        f.write("\n".join(orows) + "\n")
    with open(os.path.join(HERE, "pyshtools_egm2008.txt"), "w") as f:
        f.write(f"# pyshtools {pver} gravmag.MakeGravGridPoint, C00=0, omega=0, rotated to Cartesian\n")
        f.write("# all N from ICGEM EGM2008.gfc (its N<=70 block equals tools/egm2008_to70.gfc)\n")
        f.write("# (SHA-256 ab5b524da073e63b5bdceb7ca47a0de07a26dd44a1c5798f39fc98dc80af70fd)\n")
        f.write("# P3/P4 (exactly on the polar axis) not evaluated. columns: N id ax ay az (m/s^2)\n")
        f.write("\n".join(prows) + "\n")


if __name__ == "__main__":
    sys.exit(main())
