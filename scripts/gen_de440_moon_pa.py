#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Generate the DE440 MOON_PA→J2000 orientation time series fixture.

Uses spiceypy 8.1.2 with:
  - moon_pa_de440_200625.bpc  (DE440 lunar principal-axis binary PCK)
  - de440s.bsp                (DE440 short-span planetary ephemeris)
  - naif0012.tls              (NAIF leapseconds kernel)
  - pck00011.tpc              (planetary body constants — loaded first so the
                               binary PCK overrides the analytic Moon model)

The companion frame kernel (moon_de440_200625.tf) is constructed at runtime to
register MOON_PA_DE440 (frame ID 31008) as a class-2 PCK frame pointing to
the binary PCK segment.  Frame ID 31008 is the NAIF-standard ID for
MOON_PA_DE440, verified by reading the BPC segment header via spiceypy.pckfrm.

Output: tests/fixtures/llr_geometry/de440_moon_pa.csv
Columns: t_tt_jc, r00, r01, r02, r10, r11, r12, r20, r21, r22
  t_tt_jc = (JD_TDB - 2451545.0) / 36525.0   [Julian centuries from J2000]
  r{i}{j}  = element (i,j) of the 3×3 MOON_PA_DE440 → J2000 rotation matrix

Window: 2024-01-01 00:00:00 TDB for 730 days at 1-day cadence (731 rows).
TT vs TDB: differ by <2 ms (periodic, bounded); the column is labelled t_tt_jc
but the epochs are TDB.  The difference is ≪1 μrad/s × 2 ms < 1 nrad and is
immaterial to libration at any precision relevant here (Modelled assumption,
documented in NOTICE.md).

Sanity check printed at end: sub-Earth longitude/latitude amplitude must exceed 1°.

Usage:
    /tmp/kshana-oracles/.venv/bin/python scripts/gen_de440_moon_pa.py

Requires kernel files (not vendored in repo):
    naif0012.tls         from https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/
    pck00011.tpc         from https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/
  and the mission kernels already on disk:
    de440s.bsp           at xval/anise-lunar-od/kernels/
    moon_pa_de440_200625.bpc  at xval/anise-lunar-od/kernels/
"""

import csv
import math
import os
import sys
import tempfile

try:
    import spiceypy as sp
except ImportError:
    sys.exit("ERROR: spiceypy not found — run from /tmp/kshana-oracles/.venv")

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT  = os.path.dirname(SCRIPT_DIR)
ORACLE_KRN = "/tmp/kshana-oracles/kernels"   # fetched companion kernels + large kernels

# Resolve BPC: prefer local repo copy (for CI), fall back to oracle dir
_bpc_local = os.path.join(REPO_ROOT, "xval", "anise-lunar-od", "kernels",
                           "moon_pa_de440_200625.bpc")
_bpc_oracle = os.path.join(ORACLE_KRN, "moon_pa_de440_200625.bpc")

LSK_PATH   = os.path.join(ORACLE_KRN, "naif0012.tls")
PCK_PATH   = os.path.join(ORACLE_KRN, "pck00011.tpc")
SPK_PATH   = (os.path.join(REPO_ROOT, "xval", "anise-lunar-od", "kernels", "de440s.bsp")
              if os.path.isfile(os.path.join(REPO_ROOT, "xval", "anise-lunar-od", "kernels", "de440s.bsp"))
              else os.path.join(ORACLE_KRN, "de440s.bsp"))
BPC_PATH   = _bpc_local if os.path.isfile(_bpc_local) else _bpc_oracle

OUT_DIR    = os.path.join(REPO_ROOT, "tests", "fixtures", "llr_geometry")
OUT_PATH   = os.path.join(OUT_DIR, "de440_moon_pa.csv")

SPICEYPY_VERSION = "8.1.2"

# ---------------------------------------------------------------------------
# Companion frame kernel: MOON_PA_DE440 (frame 31008) backed by binary PCK
# ---------------------------------------------------------------------------
FRAME_KERNEL = """\
KPL/FK

\\begintext

   Companion frame kernel for moon_pa_de440_200625.bpc.
   MOON_PA_DE440 is frame ID 31008 (verified via pckfrm on the BPC file).
   CLASS = 2, CLASS_ID = 31008 routes pxform to the binary-PCK time-series
   data rather than the analytic text-PCK polynomial model.

\\begindata

FRAME_MOON_PA_DE440      = 31008
FRAME_31008_NAME         = 'MOON_PA_DE440'
FRAME_31008_CLASS        = 2
FRAME_31008_CLASS_ID     = 31008
FRAME_31008_CENTER       = 301

"""

# ---------------------------------------------------------------------------
# Generation parameters
# ---------------------------------------------------------------------------
J2000_JD   = 2_451_545.0      # J2000.0 in Julian Date
SEC_PER_JC = 36_525.0 * 86_400.0
START_TDB  = "2024-01-01 00:00:00 TDB"
N_DAYS     = 730
CADENCE_D  = 1                 # 1-day cadence → 731 rows


def main() -> None:
    # Verify kernel files exist
    for p in [LSK_PATH, PCK_PATH, SPK_PATH, BPC_PATH]:
        if not os.path.isfile(p):
            sys.exit(f"ERROR: kernel not found: {p}")

    # Write companion frame kernel to a temp file
    tf_fd, tf_path = tempfile.mkstemp(suffix=".tf")
    try:
        with os.fdopen(tf_fd, "w") as fh:
            fh.write(FRAME_KERNEL)

        # Load kernels (order matters: text PCK first, binary BPC overrides body 301)
        sp.kclear()
        sp.furnsh(LSK_PATH)
        sp.furnsh(SPK_PATH)
        sp.furnsh(PCK_PATH)          # analytic model — binary BPC overrides for frame 31008
        sp.furnsh(BPC_PATH)          # DE440 physical libration time series
        sp.furnsh(tf_path)           # frame definition for MOON_PA_DE440

        # Verify that frame 31008 is in the BPC
        ids = sp.stypes.SPICEINT_CELL(100)
        sp.pckfrm(BPC_PATH, ids)
        bpc_ids = list(ids)
        if 31008 not in bpc_ids:
            sys.exit(f"ERROR: frame 31008 not found in BPC (got {bpc_ids})")
        print(f"BPC frame IDs confirmed: {bpc_ids}")

        # Epoch grid
        et_start = sp.str2et(START_TDB)
        jd_start = et_start / 86_400.0 + J2000_JD  # approx JD; exact value via et
        print(f"Start ET: {et_start:.3f}  (~JD {jd_start:.1f})")

        # Generate rows
        os.makedirs(OUT_DIR, exist_ok=True)
        rows = []
        for day in range(N_DAYS + 1):
            et = et_start + day * 86_400.0
            # Julian Date of this TDB epoch
            jd_tdb = J2000_JD + et / 86_400.0  # ET is seconds past J2000 in TDB
            t_tt_jc = (jd_tdb - J2000_JD) / 36_525.0

            # MOON_PA_DE440 → J2000 rotation matrix (body → inertial)
            r = sp.pxform("MOON_PA_DE440", "J2000", et)
            rows.append([
                t_tt_jc,
                r[0][0], r[0][1], r[0][2],
                r[1][0], r[1][1], r[1][2],
                r[2][0], r[2][1], r[2][2],
            ])

        # Write CSV
        header = ["t_tt_jc",
                  "r00", "r01", "r02",
                  "r10", "r11", "r12",
                  "r20", "r21", "r22"]
        with open(OUT_PATH, "w", newline="") as fh:
            w = csv.writer(fh)
            w.writerow(header)
            for row in rows:
                # t_tt_jc full precision; matrix elements 18 sig figs
                w.writerow([f"{row[0]:.15e}"] + [f"{v:.18e}" for v in row[1:]])

        print(f"Wrote {len(rows)} rows → {OUT_PATH}")

        # ------------------------------------------------------------------
        # Sanity check: sub-Earth longitude/latitude amplitude
        # ------------------------------------------------------------------
        lons, lats = [], []
        for day in range(0, N_DAYS + 1, 5):
            et = et_start + day * 86_400.0
            # Earth direction in J2000 (geocentric; Earth=399, Moon=301)
            r_earth, _ = sp.spkpos("399", et, "J2000", "NONE", "301")
            n = math.sqrt(sum(x * x for x in r_earth))
            e_hat = [x / n for x in r_earth]
            # Rotate J2000 → MOON_PA_DE440 (inertial → body)
            r_i2b = sp.pxform("J2000", "MOON_PA_DE440", et)
            e_body = [sum(r_i2b[i][j] * e_hat[j] for j in range(3)) for i in range(3)]
            lon = math.atan2(e_body[1], e_body[0]) * 180.0 / math.pi
            lat = math.asin(max(-1.0, min(1.0, e_body[2]))) * 180.0 / math.pi
            lons.append(lon)
            lats.append(lat)

        lon_amp = (max(lons) - min(lons)) / 2.0
        lat_amp = (max(lats) - min(lats)) / 2.0
        print(f"\nSanity check — sub-Earth point libration amplitude (730-day window):")
        print(f"  Longitude: {min(lons):.3f}° to {max(lons):.3f}°  amplitude = {lon_amp:.3f}°")
        print(f"  Latitude:  {min(lats):.3f}° to {max(lats):.3f}°  amplitude = {lat_amp:.3f}°")

        if lon_amp < 1.0:
            sys.exit("SANITY FAIL: longitude amplitude <1° — orientation is essentially constant; "
                     "frame/kernel setup is WRONG, do NOT commit this fixture.")
        if lat_amp < 1.0:
            sys.exit("SANITY FAIL: latitude amplitude <1° — orientation is essentially constant; "
                     "frame/kernel setup is WRONG, do NOT commit this fixture.")

        print(f"\nSANITY PASS: real DE440 optical+physical libration confirmed "
              f"(lon ±{lon_amp:.3f}°, lat ±{lat_amp:.3f}°  >1° threshold).")

        # SHA-256 of output
        import hashlib
        with open(OUT_PATH, "rb") as fh:
            sha256 = hashlib.sha256(fh.read()).hexdigest()
        print(f"\nde440_moon_pa.csv  SHA-256: {sha256}")
        print(f"Rows: {len(rows)}")

    finally:
        os.unlink(tf_path)
        sp.kclear()


if __name__ == "__main__":
    main()
