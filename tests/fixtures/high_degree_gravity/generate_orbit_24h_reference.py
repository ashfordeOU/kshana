# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the Orekit 12.2 24 h LEO reference orbit in a 200x200 EGM2008 field
(java/Orbit24hDriver.java; dynamics, frames, epoch and initial state documented there).

The Kshana side (propagator::Geopotential, EarthFixedFrame::Era, ut1_minus_tt_s = 0, the same
field read by SphericalHarmonicField::from_gfc_file to degree 200) is compared by the
propagator's own test; this script only produces the oracle table.

REPRODUCE
  OREKIT_CP=<jars> OREKIT_DATA=<orekit-data> python -I \
      tests/fixtures/high_degree_gravity/generate_orbit_24h_reference.py \
      --full realdata-cache/egm2008/EGM2008.gfc [--degree 200]
Output: tests/fixtures/high_degree_gravity/orekit_orbit_24h_egm2008_200.txt
"""
import argparse
import os
import subprocess
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--full", required=True)
    ap.add_argument("--degree", type=int, default=200)
    a = ap.parse_args()
    cp = os.environ["OREKIT_CP"]
    data = os.environ["OREKIT_DATA"]
    with tempfile.TemporaryDirectory() as td:
        subprocess.run(["javac", "-cp", cp, "-d", td,
                        os.path.join(HERE, "java", "Orbit24hDriver.java")], check=True)
        out = subprocess.run(
            ["java", "-Xmx4g", "-cp", cp + ":" + td, "Orbit24hDriver", data,
             os.path.abspath(a.full), str(a.degree)],
            check=True, stdout=subprocess.PIPE, text=True).stdout
    path = os.path.join(HERE, f"orekit_orbit_24h_egm2008_{a.degree}.txt")
    with open(path, "w") as f:
        f.write(out)
    print(path)


if __name__ == "__main__":
    main()
