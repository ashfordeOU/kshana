# SPDX-License-Identifier: AGPL-3.0-only
"""B1a part 1: the independent oracle for the planner's maps (bar P1) and the exhaustive placement optimum
(bar P4), by the readings in README.md. numpy and the Python standard library only; shares no code with the
engine.

    python3 -I xval/planner/oracle.py map <layout.json>    > expected.json
    python3 -I xval/planner/oracle.py place <place.json>   > expected.json
"""
import itertools
import json
import math
import sys
from statistics import NormalDist

import numpy as np

A, F = 6378137.0, 1.0 / 298.257223563
E2 = F * (2.0 - F)
C = 299792458.0
K_B, T0 = 1.380649e-23, 290.0
CHI2_2_95 = -2.0 * math.log(0.05)
ND = NormalDist()


def ecef(lat_deg, lon_deg, h):
    la, lo = math.radians(lat_deg), math.radians(lon_deg)
    n = A / math.sqrt(1.0 - E2 * math.sin(la) ** 2)
    return np.array([(n + h) * math.cos(la) * math.cos(lo), (n + h) * math.cos(la) * math.sin(lo), (n * (1.0 - E2) + h) * math.sin(la)])


def phi(x):
    return 0.5 * math.erfc(-x / math.sqrt(2.0))


def at_least(ps, k):
    # Exact distribution of the number of detecting stations (independent, unequal probabilities).
    dist = [1.0]
    for p in ps:
        nxt = [0.0] * (len(dist) + 1)
        for j, q in enumerate(dist):
            nxt[j] += q * (1.0 - p)
            nxt[j + 1] += q * p
        dist = nxt
    return sum(dist[k:])


def cell(spec, stations, lat, lon):
    src, rx = spec["source"], spec["receiver"]
    x = ecef(lat, lon, src["height_m"])
    lam = C / src["freq_hz"]
    noise_w = K_B * T0 * 10 ** (rx["noise_figure_db"] / 10.0) * rx["bandwidth_hz"]
    sigma = 1.0 / math.sqrt(rx["bandwidth_hz"] * rx["integration_s"])
    gamma = sigma * ND.inv_cdf(1.0 - rx["p_fa"] / 2.0)
    pos = [ecef(s["lat_deg"], s["lon_deg"], s["height_m"]) for s in stations]
    pd = []
    for s, r in zip(stations, pos):
        d = float(np.linalg.norm(x - r))
        p_dbw = src["eirp_dbw"] - 20.0 * math.log10(4.0 * math.pi * d / lam) + s["gain_dbi"]
        mu = 10 ** (p_dbw / 10.0) / noise_w
        pd.append(1.0 - (phi((gamma - mu) / sigma) - phi((-gamma - mu) / sigma)))
    k = 3 if spec["mode"] == "surface" else 4
    p_any = 1.0 - math.prod(1.0 - p for p in pd)
    p_k = at_least(pd, k)
    gated = [r for r, p in zip(pos, pd) if p >= spec["gate_pd"]]
    out = {"lat_deg": lat, "lon_deg": lon, "p_d": pd, "p_any": p_any, "p_k": p_k, "drms_m": None, "ellipse_m": None}
    if len(gated) < k:
        return out
    u = [(x - r) / np.linalg.norm(x - r) for r in gated]
    H = np.array([u[i] - u[0] for i in range(1, len(gated))])
    q = (C * spec["sigma_tau_s"]) ** 2
    J = H.T @ H / q
    if spec["mode"] == "surface":
        n = x / np.linalg.norm(x)
        a = np.array([1.0, 0.0, 0.0]) if abs(n[0]) < 0.9 else np.array([0.0, 1.0, 0.0])
        e1 = np.cross(n, a)
        e1 /= np.linalg.norm(e1)
        e2 = np.cross(n, e1)
        U = np.column_stack([e1, e2])
        cov = U @ np.linalg.inv(U.T @ J @ U) @ U.T
    else:
        cov = np.linalg.inv(J)
    la, lo = math.radians(lat), math.radians(lon)
    east = np.array([-math.sin(lo), math.cos(lo), 0.0])
    north = np.array([-math.sin(la) * math.cos(lo), -math.sin(la) * math.sin(lo), math.cos(la)])
    E = np.column_stack([east, north])
    ch = E.T @ cov @ E
    ev = np.linalg.eigvalsh(ch)
    out["drms_m"] = math.sqrt(float(np.trace(ch)))
    out["ellipse_m"] = [math.sqrt(CHI2_2_95 * float(ev[1])), math.sqrt(CHI2_2_95 * float(ev[0]))]
    return out


def grid(spec):
    s = spec["site"]
    for j in range(s["n_lat"]):
        lat = s["lat_min"] + j * (s["lat_max"] - s["lat_min"]) / (s["n_lat"] - 1)
        for i in range(s["n_lon"]):
            yield lat, s["lon_min"] + i * (s["lon_max"] - s["lon_min"]) / (s["n_lon"] - 1)


def objective(spec, stations):
    cells = [cell(spec, stations, la, lo) for la, lo in grid(spec)]
    good = sum(1 for c in cells if c["p_k"] >= 0.9 and c["drms_m"] is not None and c["drms_m"] <= spec["d_req_m"])
    dr = sorted(c["drms_m"] if c["drms_m"] is not None else math.inf for c in cells)
    return good / len(cells), dr[(len(dr) - 1) // 2]


def main():
    mode, path = sys.argv[1], sys.argv[2]
    spec = json.load(open(path))
    if mode == "map":
        out = {"cells": [cell(spec, spec["stations"], la, lo) for la, lo in grid(spec)]}
    else:
        cands, m = spec["candidates"], spec["m"]
        best = None
        for sub in itertools.combinations(range(len(cands)), m):
            f, med = objective(spec, [cands[i] for i in sub])
            key = (-f, med, sub)
            if best is None or key < best[0]:
                best = (key, f, med, sub)
        out = {"subset": list(best[3]), "objective": best[1], "median_drms_m": None if math.isinf(best[2]) else best[2]}
    json.dump(out, sys.stdout, separators=(",", ":"))
    sys.stdout.write("\n")


if __name__ == "__main__":
    main()
