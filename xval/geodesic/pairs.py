# SPDX-License-Identifier: AGPL-3.0-only
"""Reference geodesic distances for src/geodesic.rs, from GeographicLib (the Python package).

Writes tests/fixtures/geodesic/pairs_v1.json: random pairs, short and long, antipodal and nearly
antipodal pairs, meridians, the equator and the poles. Run from the repository root:
python3 -I xval/geodesic/pairs.py
"""
import json
import random

from geographiclib.geodesic import Geodesic

G = Geodesic.WGS84
rng = random.Random(20261107)
pairs = []


def add(a, b, c, d):
    pairs.append([a, b, c, d, G.Inverse(a, b, c, d)["s12"]])


for _ in range(2000):
    add(rng.uniform(-90, 90), rng.uniform(-180, 180), rng.uniform(-90, 90), rng.uniform(-180, 180))
for _ in range(1000):
    la, lo = rng.uniform(-89.9, 89.9), rng.uniform(-180, 180)
    add(la, lo, la + rng.uniform(-0.05, 0.05), lo + rng.uniform(-0.05, 0.05))
for _ in range(500):
    la, lo = rng.uniform(-89, 89), rng.uniform(-180, 180)
    add(la, lo, -la + rng.uniform(-0.5, 0.5), lo + 180 + rng.uniform(-0.5, 0.5))
for la in (-90, -89.9, -45, 0, 45, 89.9, 90):
    for lo in (0, 0.0001, 1, 90, 179.5, 179.999, 180):
        add(la, 0, -la, lo)
        add(la, 0, la, lo)
for lo in (0.001, 1, 10, 90, 170, 179.4, 179.6, 180):
    add(0, 0, 0, lo)
    add(0, -lo / 2, 0, lo / 2)
add(10, 179.999, 10, -179.999)
add(89.9, 45, 89.9, 90)
with open("tests/fixtures/geodesic/pairs_v1.json", "w") as f:
    json.dump({"source": "GeographicLib 2.0 (Python), Geodesic.WGS84.Inverse s12", "pairs": pairs}, f, separators=(",", ":"))
    f.write("\n")
print(len(pairs), "pairs")
