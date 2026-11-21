#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write cdm_selfmade_leo.cdm: a SELF-MADE CCSDS 508.0-B-1 KVN CDM for placeholder objects 90001
and 90002 (no real object, catalogue or operator data), a near-head-on LEO crossing 30 m apart at
TCA with diagonal RTN covariances. Used by tests/orbit_data_pc.rs. Standard library only.

    python3 gen_selfmade_cdm.py
"""
import math
import pathlib

R = 7000.0  # km
V = 7.546  # km/s, near circular at 7000 km
I1, I2 = math.radians(51.6), math.radians(97.8)


def state(inc, miss_km=0.0):
    # Both objects at the ascending node direction x; their velocities in planes of different
    # inclination; object 2 offset along z (out of object 1's plane) by the miss.
    return [R, 0.0, miss_km, 0.0, V * math.cos(inc), V * math.sin(inc)]


def obj(n, name, x, cov):
    keys = ["X", "Y", "Z", "X_DOT", "Y_DOT", "Z_DOT"]
    units = ["km"] * 3 + ["km/s"] * 3
    lines = [
        ("OBJECT", f"OBJECT{n}", None),
        ("OBJECT_DESIGNATOR", str(90000 + n), None),
        ("CATALOG_NAME", "SATCAT", None),
        ("OBJECT_NAME", name, None),
        ("INTERNATIONAL_DESIGNATOR", f"2099-00{n}A", None),
        ("EPHEMERIS_NAME", "NONE", None),
        ("COVARIANCE_METHOD", "CALCULATED", None),
        ("MANEUVERABLE", "NO", None),
        ("REF_FRAME", "EME2000", None),
    ]
    lines += [(k, f"{v:.6f}" if u == "km" else f"{v:.9f}", u) for k, v, u in zip(keys, x, units)]
    lines += [(k, f"{v:.3E}", u) for k, v, u in cov]
    return lines


def cov(rr, tt, nn, vel):
    names = [("CR_R", rr, "m**2"), ("CT_R", 0.0, "m**2"), ("CT_T", tt, "m**2"), ("CN_R", 0.0, "m**2"),
             ("CN_T", 0.0, "m**2"), ("CN_N", nn, "m**2")]
    for i, a in enumerate(["CRDOT", "CTDOT", "CNDOT"]):
        for j, b in enumerate(["R", "T", "N"]):
            names.append((f"{a}_{b}", 0.0, "m**2/s"))
        for j, b in enumerate(["RDOT", "TDOT", "NDOT"][: i + 1]):
            names.append((f"{a}_{b}", vel if i == j else 0.0, "m**2/s**2"))
    return names


x1 = state(I1)
x2 = state(I2, 0.030)
miss = math.dist(x1[:3], x2[:3]) * 1000.0
head = [
    ("CCSDS_CDM_VERS", "1.0", None),
    ("CREATION_DATE", "2099-01-01T00:00:00.000", None),
    ("ORIGINATOR", "KSHANA-SELFMADE", None),
    ("MESSAGE_ID", "SELFMADE-0001", None),
    ("TCA", "2099-01-02T00:00:00.000", None),
    ("MISS_DISTANCE", f"{miss:.3f}", "m"),
]
text = ""
for k, v, u in head + obj(1, "PLACEHOLDER A", x1, cov(25.0, 400.0, 16.0, 1e-4)) + obj(2, "PLACEHOLDER B", x2, cov(100.0, 2500.0, 64.0, 1e-4)):
    text += f"{k:<32}= {v}" + (f"   [{u}]" if u else "") + "\n"
pathlib.Path(__file__).with_name("cdm_selfmade_leo.cdm").write_text(text)
