#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""numpy oracle for tests/ntn_crlb_published_value_oracle.rs, Part B.

Reads geometry.txt (exported by the engine) and writes numpy_oracle.txt:
  TOA <signal index> <median over epochs of the 3-D position sigma (m)>
  DOP <east> <north> <up> sigma (m) of the single-satellite Doppler fix
Both from numpy.linalg.inv(H^T W H) built here at the true user position (see the test header).
Usage: make_fixture.py geometry.txt > numpy_oracle.txt
"""
import math
import sys

import numpy as np


def geodetic_lat_lon(x):
    a, f = 6378137.0, 1 / 298.257223563
    e2 = f * (2 - f)
    lon = math.atan2(x[1], x[0])
    p = math.hypot(x[0], x[1])
    lat = math.atan2(x[2], p * (1 - e2))
    for _ in range(20):
        n = a / math.sqrt(1 - e2 * math.sin(lat) ** 2)
        h = p / math.cos(lat) - n
        lat = math.atan2(x[2], p * (1 - e2 * n / (n + h)))
    return lat, lon


def main():
    user, signals, epochs, dop_sigma, dop = None, [], [], None, []
    for line in open(sys.argv[1]):
        f = line.split()
        if f[0] == "U":
            user = np.array([float(v) for v in f[1:4]])
        elif f[0] == "S":
            signals.append(f[1])
        elif f[0] == "E":
            epochs.append([])
        elif f[0] == "L":
            v = [float(x) for x in f[1:]]
            epochs[-1].append((np.array(v[0:3]), v[4:]))
        elif f[0] == "D":
            dop_sigma = float(f[1])
        elif f[0] == "P":
            v = [float(x) for x in f[1:]]
            dop.append((v[0], np.array(v[1:4]), np.array(v[4:7])))
    for i, _ in enumerate(signals):
        s3 = []
        for ep in epochs:
            if len(ep) < 4:
                continue
            h = np.array([np.append(-(sp - user) / np.linalg.norm(sp - user), 1.0) for sp, _ in ep])
            w = np.diag([1.0 / sd[i] ** 2 for _, sd in ep])
            q = np.linalg.inv(h.T @ w @ h)
            s3.append(math.sqrt(np.trace(q[:3, :3])))
        print(f"TOA {i} {np.median(np.array(s3)):.15e}")
    if dop:
        rows, wts = [], []
        for _, rs, vs in dop:
            d = rs - user
            rho = np.linalg.norm(d)
            u = d / rho
            rr = float(u @ vs)
            rows.append(np.append(-(vs - rr * u) / rho, 1.0))
            wts.append(1.0 / dop_sigma ** 2)
        lat, lon = geodetic_lat_lon(user)
        e = np.array([-math.sin(lon), math.cos(lon), 0.0])
        n = np.array([-math.sin(lat) * math.cos(lon), -math.sin(lat) * math.sin(lon), math.cos(lat)])
        up = np.array([math.cos(lat) * math.cos(lon), math.cos(lat) * math.sin(lon), math.sin(lat)])
        rows.append(np.append(up, 0.0))
        wts.append(1.0 / 10.0 ** 2)
        h = np.array(rows)
        q = np.linalg.inv(h.T @ np.diag(wts) @ h)[:3, :3]
        print("DOP " + " ".join(f"{math.sqrt(v @ q @ v):.15e}" for v in (e, n, up)))


if __name__ == "__main__":
    main()
