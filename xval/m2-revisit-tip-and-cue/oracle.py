# SPDX-License-Identifier: AGPL-3.0-only
"""M2-B0 oracle: access intervals of the 16-satellite RF layer at the ten M1 points, first 24 h.

Written from the readings in README.md (1 to 5 and 11) alone; numpy only; shares no code with the
engine. Prints JSON: per point, each satellite's intervals and the merged intervals, [start_s, end_s].
"""
import json
import numpy as np

MU = 3.986004418e14
R = 6378137.0
J2 = 1.08262668e-3
WE = 7.2921151467e-5
A = 6928137.0
INC = np.radians(97.59)
POINTS = [(54.60, 14.00), (55.50, 15.80), (55.00, 19.00), (57.00, 19.50), (56.50, 20.20),
          (58.50, 20.50), (59.80, 24.50), (61.50, 19.80), (64.00, 22.00), (57.70, 23.30)]


def layer(total, planes, phasing, node_offset=0.0):
    sats = []
    for k in range(planes):
        node = np.radians((k + node_offset) * 180.0 / planes)
        for j in range(total // planes):
            u0 = np.radians(j * 360.0 * planes / total + k * 360.0 * phasing / total)
            sats.append((node, u0))
    return sats


def positions(sats, t):
    n = np.sqrt(MU / A**3)
    f = n * J2 * (R / A) ** 2
    node_dot = -1.5 * f * np.cos(INC)
    argp_dot = 0.75 * f * (5.0 * np.cos(INC) ** 2 - 1.0)
    out = np.empty((len(sats), t.size, 3))
    for s, (node0, u0) in enumerate(sats):
        u = u0 + (n + argp_dot) * t
        x, y, z = A * np.cos(u), A * np.sin(u) * np.cos(INC), A * np.sin(u) * np.sin(INC)
        om = node0 + node_dot * t - WE * t
        out[s, :, 0] = x * np.cos(om) - y * np.sin(om)
        out[s, :, 1] = x * np.sin(om) + y * np.cos(om)
        out[s, :, 2] = z
    return out


def runs(mask, t):
    idx = np.flatnonzero(mask)
    if idx.size == 0:
        return []
    breaks = np.flatnonzero(np.diff(idx) > 1)
    starts = np.concatenate(([idx[0]], idx[breaks + 1]))
    ends = np.concatenate((idx[breaks], [idx[-1]]))
    return [[float(t[a]), float(t[b])] for a, b in zip(starts, ends)]


def main():
    t = np.arange(0, 86400 + 1, 10, dtype=float)
    sats = layer(16, 8, 1)
    pos = positions(sats, t)
    sin_mask = np.sin(np.radians(10.0))
    result = []
    for lat, lon in POINTS:
        phi, lam = np.radians(lat), np.radians(lon)
        up = np.array([np.cos(phi) * np.cos(lam), np.cos(phi) * np.sin(lam), np.sin(phi)])
        p = R * up
        d = pos - p
        sin_el = (d @ up) / np.linalg.norm(d, axis=2)
        inside = sin_el >= sin_mask
        result.append({
            "lat": lat, "lon": lon,
            "per_satellite": [runs(inside[s], t) for s in range(len(sats))],
            "merged": runs(inside.any(axis=0), t),
        })
    print(json.dumps({"layer": "rf-16", "step_s": 10, "span_s": 86400, "points": result}, indent=1))


if __name__ == "__main__":
    main()
