# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external-oracle reference for kshana ground-station pass prediction.

ORACLE
------
  Orekit 12.2 (CS GROUP, Apache-2.0) + Hipparchus 3.1 (Apache-2.0), Java 21.
  org.orekit.propagation.events.ElevationDetector + EventsLogger, run over an
  org.orekit.propagation.analytical.Ephemeris, with the ground station built as a
  TopocentricFrame on a WGS-84 OneAxisEllipsoid (org.orekit.bodies). The Java
  driver is xval/orekit-passes/OrekitPasses.java.

WHAT THIS VALIDATES
-------------------
  kshana::passes::predict_passes computes the PASS GEOMETRY of a satellite over a
  ground station above an elevation mask: per-pass AOS / TCA / LOS times, the
  per-pass maximum (culmination) elevation, the per-pass duration, the pass COUNT,
  and the TOTAL ACCESS time over a window. This fixture pins Orekit's independent
  answer for each so the Rust test can assert kshana agrees.

  The geometry being compared is:
    * the geodetic ground-station position on the WGS-84 ellipsoid,
    * the topocentric elevation measured against the ellipsoid normal (ENU), and
    * the rise/set zero-crossing detection of the mask and the culmination search.
  Orekit does ALL of that with its own, independent code (ElevationDetector's
  Brent-style root-finder, TopocentricFrame.getElevation on its OneAxisEllipsoid).

HONEST SCOPE (what is matched, NOT validated)
--------------------------------------------
  The PROPAGATOR (circular two-body Kepler, mu = 3.986004418e14) and the
  TEME->ECEF rotation (IAU-1982 GMST only, no precession/nutation/polar motion)
  are kshana's own and are NOT the subject of this check. To isolate the pass
  GEOMETRY, the driver reproduces ONLY those two kshana steps to obtain the
  satellite's Earth-fixed (ITRF) position samples, then hands them to Orekit as an
  ITRF-frame Ephemeris. Because both the satellite samples and the station live in
  the SAME Earth-fixed frame, Orekit's elevation depends only on the supplied
  geometry, not on any Earth-rotation/EOP model -- so the only thing compared is
  the pass-geometry algorithm (Orekit vs kshana). A higher-fidelity propagator
  (SGP4 drag/J2) or a refraction/light-time model would be a separate validation.

SCENARIO GRID (>= 20 cases)
---------------------------
  LEO 400-1200 km; inclinations sun-sync (97.6 deg), polar (90 deg), 53 deg,
  and a few extras; stations equatorial / mid-latitude / high-latitude / polar;
  elevation masks 0 / 5 / 10 / 40 deg; 24 h window; epoch 2024-01-01.

REPRODUCE
---------
  source /tmp/kshana-oracles/orekit/cp.sh
  cd xval/orekit-passes && javac -cp "$OREKIT_CP" OrekitPasses.java
  cd <repo-root>
  /tmp/kshana-oracles/.venv/bin/python \
      tests/fixtures/ground_station_pass_prediction/generate_ground_station_pass_prediction_reference.py \
      > tests/fixtures/ground_station_pass_prediction/ground_station_pass_prediction_reference.txt

  The committed .txt IS the pinned oracle output; the Rust test reads it, so CI
  needs no Java. This generator imports NO kshana code.
"""

import json
import os
import subprocess
import sys

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
DRIVER_DIR = os.path.join(REPO, "xval", "orekit-passes")
OREKIT_HOME = "/tmp/kshana-oracles/orekit"
OREKIT_DATA = os.path.join(OREKIT_HOME, "orekit-data-main")
JARS = [
    "orekit-12.2.jar",
    "hipparchus-core-3.1.jar",
    "hipparchus-geometry-3.1.jar",
    "hipparchus-ode-3.1.jar",
    "hipparchus-optim-3.1.jar",
    "hipparchus-fitting-3.1.jar",
    "hipparchus-stat-3.1.jar",
    "hipparchus-filtering-3.1.jar",
]
OREKIT_CP = ":".join(os.path.join(OREKIT_HOME, j) for j in JARS)

# (name, altitude_km, inclination_deg, raan_deg, arg_lat_deg,
#  station_lat_deg, station_lon_deg, station_alt_m, mask_deg, duration_hours)
SCENARIOS = [
    # --- sun-synchronous (97.6 deg) over varied stations / masks ---
    ("sso550_midlat_mask10", 550, 97.6, 0, 0, 52.0, 0.0, 0.0, 10, 24),
    ("sso550_midlat_mask5", 550, 97.6, 0, 0, 52.0, 0.0, 0.0, 5, 24),
    ("sso550_midlat_mask0", 550, 97.6, 0, 0, 52.0, 0.0, 0.0, 0, 24),
    ("sso700_polar_station_mask10", 700, 97.6, 40, 30, 78.0, 15.0, 50.0, 10, 24),
    ("sso800_equatorial_mask5", 800, 98.6, 120, 200, 0.0, -78.0, 0.0, 5, 24),
    # --- polar (90 deg) ---
    ("polar550_midlat_mask10", 550, 90.0, 0, 0, 52.0, 0.0, 0.0, 10, 24),
    ("polar550_midlat_mask40", 550, 90.0, 0, 0, 52.0, 0.0, 0.0, 40, 24),
    ("polar400_highlat_mask5", 400, 90.0, 60, 90, 67.0, 26.0, 180.0, 5, 24),
    ("polar1200_polar_station_mask0", 1200, 90.0, 0, 45, 71.3, -156.8, 10.0, 0, 24),
    # --- 53 deg (Starlink-like) ---
    ("inc53_500_midlat_mask10", 500, 53.0, 0, 0, 45.0, -75.0, 80.0, 10, 24),
    ("inc53_550_equatorial_mask5", 550, 53.0, 200, 100, 1.3, 103.8, 15.0, 5, 24),
    ("inc53_550_midlat_mask40", 550, 53.0, 0, 0, 40.7, -74.0, 0.0, 40, 24),
    ("inc53_600_highlat_mask10", 600, 53.2, 90, 270, 59.4, 24.8, 35.0, 10, 24),
    # --- ISS-like 51.6 deg ---
    ("iss_408_midlat_mask5", 408, 51.6, 130, 210, 48.9, 2.35, 35.0, 5, 24),
    ("iss_408_equatorial_mask10", 408, 51.6, 0, 0, 0.0, 0.0, 0.0, 10, 24),
    # --- higher LEO altitudes ---
    ("leo1000_inc65_midlat_mask10", 1000, 65.0, 45, 120, 37.0, -122.0, 5.0, 10, 24),
    ("leo1200_inc82_highlat_mask5", 1200, 82.0, 250, 300, 64.8, -147.7, 130.0, 5, 24),
    ("leo900_inc70_midlat_mask0", 900, 70.0, 10, 20, -33.9, 151.2, 40.0, 0, 24),
    # --- equatorial-ish low inclination ---
    ("inc20_700_equatorial_mask5", 700, 20.0, 0, 0, 0.0, 30.0, 0.0, 5, 24),
    ("inc28_500_midlat_mask10", 500, 28.5, 80, 60, 28.5, -80.6, 3.0, 10, 24),
    # --- southern-hemisphere mid latitude, sun-sync ---
    ("sso650_southmidlat_mask10", 650, 98.0, 300, 150, -34.6, -58.4, 25.0, 10, 24),
    # --- retrograde-ish, high mask ---
    ("inc99_500_midlat_mask40", 500, 99.0, 15, 75, 50.1, 8.7, 110.0, 40, 24),
]

EPOCH = (2024, 1, 1, 0, 0, 0.0)


def run_orekit(s):
    name, alt, inc, raan, arglat, lat, lon, salt, mask, dur = s
    req = {
        "altitude_km": alt,
        "inclination_deg": inc,
        "raan_deg": raan,
        "arg_lat_deg": arglat,
        "station_lat_deg": lat,
        "station_lon_deg": lon,
        "station_alt_m": salt,
        "mask_deg": mask,
        "duration_hours": dur,
        "year": EPOCH[0],
        "month": EPOCH[1],
        "day": EPOCH[2],
        "hour": EPOCH[3],
        "minute": EPOCH[4],
        "second": EPOCH[5],
    }
    env = dict(os.environ)
    env["OREKIT_DATA"] = OREKIT_DATA
    cp = ".:" + OREKIT_CP
    proc = subprocess.run(
        ["java", "-cp", cp, "OrekitPasses"],
        input=json.dumps(req),
        capture_output=True,
        text=True,
        cwd=DRIVER_DIR,
        env=env,
    )
    if proc.returncode != 0:
        sys.stderr.write(f"[{name}] Orekit driver failed:\n{proc.stderr}\n")
        raise SystemExit(1)
    return proc.stdout


def parse(out):
    passes = []
    count = None
    total = None
    for line in out.splitlines():
        line = line.strip()
        if line.startswith("PASS"):
            kv = {}
            for part in line.split("|")[1:]:
                k, v = part.split("=")
                kv[k.strip()] = float(v.strip())
            passes.append(kv)
        elif line.startswith("SUMMARY"):
            for part in line.split("|")[1:]:
                k, v = part.split("=")
                if k.strip() == "pass_count":
                    count = int(float(v.strip()))
                elif k.strip() == "total_access_s":
                    total = float(v.strip())
    return passes, count, total


def main():
    # Verify the driver is compiled.
    if not os.path.exists(os.path.join(DRIVER_DIR, "OrekitPasses.class")):
        sys.stderr.write(
            "OrekitPasses.class not found; compile first:\n"
            "  source /tmp/kshana-oracles/orekit/cp.sh\n"
            f"  cd {DRIVER_DIR} && javac -cp \"$OREKIT_CP\" OrekitPasses.java\n"
        )
        raise SystemExit(1)

    print("# kshana ground-station pass-prediction reference vectors")
    print("# ORACLE: Orekit 12.2 (Apache-2.0) ElevationDetector+EventsLogger over an")
    print("#         ITRF Ephemeris; station = WGS-84 OneAxisEllipsoid TopocentricFrame.")
    print("#         Driver: xval/orekit-passes/OrekitPasses.java")
    print("# EPOCH:  2024-01-01T00:00:00 (UTC ~ UT1), 24 h window unless noted.")
    print("# Satellite samples come from kshana's circular Kepler orbit + IAU-1982 GMST")
    print("#   rotation (the propagator/frame are matched, NOT validated); Orekit does")
    print("#   the station ellipsoid geometry, ENU elevation and event root-finding.")
    print("#")
    print("# SCN  name | altitude_km | inclination_deg | raan_deg | arg_lat_deg |")
    print("#           station_lat_deg | station_lon_deg | station_alt_m | mask_deg |")
    print("#           duration_hours | epoch_y,m,d,h,mi,s")
    print("# PASS scn_name | index | aos_s | tca_s | los_s | max_el_deg | duration_s")
    print("# COUNT scn_name | pass_count | total_access_s")
    print("#")

    for s in SCENARIOS:
        name, alt, inc, raan, arglat, lat, lon, salt, mask, dur = s
        passes, count, total = parse(run_orekit(s))
        ep = ",".join(str(x) for x in EPOCH)
        print(
            f"SCN {name} | {alt} | {inc} | {raan} | {arglat} | "
            f"{lat} | {lon} | {salt} | {mask} | {dur} | {ep}"
        )
        for i, p in enumerate(passes):
            print(
                f"PASS {name} | {i} | {p['aos_s']:.6f} | {p['tca_s']:.6f} | "
                f"{p['los_s']:.6f} | {p['max_el_deg']:.9f} | {p['duration_s']:.6f}"
            )
        print(f"COUNT {name} | {count} | {total:.6f}")
        sys.stderr.write(f"[{name}] {count} pass(es), total access {total:.1f} s\n")


if __name__ == "__main__":
    main()
