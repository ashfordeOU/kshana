#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Generate the external DOP reference vectors in ``dop_reference.csv``.

The oracle is **gnss_lib_py** (Stanford NAV Lab), an independent, peer-reviewed
(JOSS 2023) open-source GNSS library — used here exactly as ERFA is used for the
reference-frame validation: an authoritative third-party implementation whose
numeric output Kshana's own ``orbit::dop`` is checked against. This makes the DOP
row a genuine *external* validation, not a self-consistency check.

The DOP factors are a deterministic function of the line-of-sight geometry only:
each visible satellite contributes a row ``[e_E, e_N, e_U, 1]`` (its ENU unit
line-of-sight plus the clock term) to the design matrix ``G``; the cofactor
matrix is ``Q = (Gᵀ G)⁻¹`` and the DOPs are
``GDOP=√tr Q``, ``PDOP=√(Q_EE+Q_NN+Q_UU)``, ``HDOP=√(Q_EE+Q_NN)``,
``VDOP=√Q_UU``, ``TDOP=√Q_tt``. The ENU unit vector for (elevation, azimuth) is
``[cos el·sin az, cos el·cos az, sin el]`` — the same convention Kshana's
``orbit::enu_basis`` / ``orbit::dop`` use, so the geometries are identical by
construction and all five DOPs match to machine precision.

Reproduce (offline, no Kshana code involved):

    python3.11 -m venv /tmp/dopvenv
    /tmp/dopvenv/bin/pip install gnss_lib_py        # pulls 1.0.4 (needs py<3.13)
    /tmp/dopvenv/bin/python generate_dop_reference.py > dop_reference.csv

Generated with gnss_lib_py 1.0.4 + numpy. Verified row-for-row against an
independent numpy ``(GᵀG)⁻¹`` computation (max relative difference < 1e-9).
"""

import numpy as np
from gnss_lib_py.utils import dop as D

# (label, elevations[deg], azimuths[deg]) — good through pathological geometry.
CASES = [
    ("4sat-spread",        [20, 45, 70, 15],                 [10, 110, 220, 300]),
    ("5sat-spread",        [10, 30, 55, 75, 40],             [25, 100, 190, 280, 340]),
    ("6sat-good",          [20, 45, 70, 15, 30, 60],         [10, 110, 220, 300, 160, 40]),
    ("8sat-good",          [12, 28, 42, 58, 71, 35, 50, 22], [5, 48, 95, 140, 200, 255, 300, 345]),
    ("zenith+ring4",       [89, 15, 15, 15, 15],             [0, 0, 90, 180, 270]),
    ("4sat-clustered-bad", [20, 25, 30, 22],                 [10, 30, 50, 20]),
    ("all-high",           [78, 80, 82, 79, 81],             [0, 72, 144, 216, 288]),
    ("10sat-mixed",        [8, 18, 27, 36, 44, 53, 62, 70, 15, 40],
                           [0, 36, 72, 108, 144, 180, 216, 252, 300, 330]),
]


def dop_of(el, az):
    el = np.asarray(el, float)
    az = np.asarray(az, float)
    uv = np.asarray(D.el_az_to_enu_unit_vector(el, az))      # (n,3) ENU LOS
    g = np.hstack([uv, np.ones((uv.shape[0], 1))])           # [E,N,U,1]
    q = np.linalg.inv(g.T @ g)
    p = D.parse_dop(q)
    return [float(p["GDOP"]), float(p["PDOP"]), float(p["HDOP"]),
            float(p["VDOP"]), float(p["TDOP"])]


def main():
    print("# DOP reference vectors — oracle: gnss_lib_py 1.0.4 (Stanford NAV Lab).")
    print("# See NOTICE and generate_dop_reference.py. Consumed by tests/dop_reference.rs.")
    print("# label;n;el_deg(|-sep);az_deg(|-sep);GDOP;PDOP;HDOP;VDOP;TDOP")
    for label, el, az in CASES:
        vals = dop_of(el, az)
        print(f"{label};{len(el)};{'|'.join(map(str, el))};{'|'.join(map(str, az))};"
              + ";".join(f"{v:.9f}" for v in vals))


if __name__ == "__main__":
    main()
