#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Append WGS-84 geodesic distances (GeographicLib, Karney, MIT licence) to the Orekit output.

Reads the Orekit part of the fixture on stdin (EoCoverageOrekitDriver.java output) and writes the
complete fixture on stdout: every input line unchanged, plus one GEO line per WGS line with the
geodesic distance on the WGS-84 ellipsoid from the geocentric sub-satellite point to the limb point.

Reproduce:
    python3 -m venv venv && venv/bin/pip install geographiclib==2.1
    java -cp "scratch:$OREKIT_CP" EoCoverageOrekitDriver | venv/bin/python geodesic_wgs84.py \
        > eo_payload_coverage_orekit_oracle.txt
"""
import sys

import geographiclib
from geographiclib.geodesic import Geodesic

lines = sys.stdin.read().splitlines()
out = list(lines)
out.append(f"# GEO h_km | sub_lat_deg | side | geodesic_distance_m   (GeographicLib {geographiclib.__version__}, Geodesic.WGS84.Inverse)")
for line in lines:
    if not line.startswith("WGS "):
        continue
    f = [x.strip() for x in line[4:].split("|")]
    sub = [float(v) for v in f[4].split()]
    lim = [float(v) for v in f[5].split()]
    s12 = Geodesic.WGS84.Inverse(sub[0], sub[1], lim[0], lim[1])["s12"]
    out.append(f"GEO {f[0]} | {f[1]} | {f[2]} | {s12:.10f}")
print("\n".join(out))
