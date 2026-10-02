#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""SPICE-geometry and NumPy reference for tests/lunar_vlbi_campaign_spice_oracle.rs.

SPICE leg: for every scenario in inputs.json, rebuild the observing schedule and every Jacobian
row from SPICE geometry (DE440 Earth and Moon, ITRF93 Earth orientation, MOON_PA / MOON_ME lunar
orientation) by central differences of converged Newtonian light-time differences, then do the
linear algebra with NumPy/SciPy. P2 leg: the same linear algebra on the engine's committed
Jacobian. No partial-derivative formula of Kshana's is used.

Run: source ~/Code/kshana-oracles/env.sh; $ORACLE_PY gen_reference.py inputs.json > reference.json
"""
import hashlib
import json
import os
import sys

import numpy as np
import scipy
import scipy.linalg as sla
import spiceypy as sp

C = 299_792_458.0
R_MOON = 1_737_400.0  # the stated sphere the selenographic beacon coordinates live on
WGS84_A_KM, WGS84_F = 6378.137, 1.0 / 298.257223563
STEP_STATION = 3000.0  # m, central-difference step on each station ITRF93 coordinate
STEP_BEACON = 3000.0  # m, central-difference step on each beacon body-fixed coordinate
NAIF = os.path.join(os.environ["KSHANA_ORACLES"], "data", "naif")
KERNELS = [
    "naif0012.tls",
    "de440s.bsp",
    "earth_latest_high_prec.bpc",
    "moon_pa_de440_200625.bpc",
    "moon_de440_250416.tf",
]


def sha256(path):
    h = hashlib.sha256()
    with open(path, "rb") as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def unit(v):
    return v / np.linalg.norm(v)


def ang_deg(a, b):
    return float(np.degrees(np.arccos(np.clip(np.dot(unit(a), unit(b)), -1.0, 1.0))))


def station_itrf(lat, lon, h):
    return 1e3 * np.array(sp.georec(np.radians(lon), np.radians(lat), h / 1e3, WGS84_A_KM, WGS84_F))


def body_point(lat, lon, alt):
    r = R_MOON + alt
    la, lo = np.radians(lat), np.radians(lon)
    return np.array([r * np.cos(la) * np.cos(lo), r * np.cos(la) * np.sin(lo), r * np.sin(la)])


class Geometry:
    """SPICE geometry at one reception epoch `et` (TDB seconds)."""

    def __init__(self, et, frame):
        self.et = et
        self.frame = frame
        self.itrf_to_j2000 = np.array(sp.pxform("ITRF93", "J2000", et))
        st, _ = sp.spkezr("EARTH", et, "J2000", "NONE", "SSB")
        sp_, _ = sp.spkezr("EARTH", et + 1.0, "J2000", "NONE", "SSB")
        sm_, _ = sp.spkezr("EARTH", et - 1.0, "J2000", "NONE", "SSB")
        self.v_e = 1e3 * np.array(st[3:])
        self.a_e = 1e3 * 0.5 * (np.array(sp_[3:]) - np.array(sm_[3:]))
        self._emit = {}

    def emission(self, te_r):
        """Geocentric Moon state (m, m/s) and body->J2000 rotation at the representable epoch te_r."""
        if te_r not in self._emit:
            s, _ = sp.spkezr("MOON", te_r, "J2000", "NONE", "EARTH")
            rot = np.array(sp.pxform(self.frame, "J2000", te_r))
            self._emit[te_r] = (1e3 * np.array(s[:3]), 1e3 * np.array(s[3:]), rot)
        return self._emit[te_r]

    def light_time(self, s_itrf, b_body):
        """Converged Newtonian light time (s) from the beacon to a station received at et."""
        s_j = self.itrf_to_j2000 @ s_itrf
        lt = 1.28
        for _ in range(60):
            te_r = self.et - lt
            frac = (self.et - te_r) - lt  # te(true) = et - lt = te_r + frac
            m, vm, rot = self.emission(te_r)
            moon = m + vm * frac
            d_e = self.v_e * lt - 0.5 * self.a_e * lt * lt  # E(t) - E(t - lt)
            nxt = np.linalg.norm(d_e + s_j - moon - rot @ b_body) / C
            if abs(nxt - lt) <= 4e-16:
                return nxt
            lt = nxt
        raise RuntimeError("light time did not converge")

    # Instantaneous geometric quantities (no light time), for visibility and sweeps.
    def beacon_geocentric_j2000(self, b_body):
        m, _ = sp.spkpos("MOON", self.et, "J2000", "NONE", "EARTH")
        rot = np.array(sp.pxform(self.frame, "J2000", self.et))
        return 1e3 * np.array(m) + rot @ b_body

    def beacon_itrf(self, b_body):
        return self.itrf_to_j2000.T @ self.beacon_geocentric_j2000(b_body)

    def station_body(self, s_itrf):
        m, _ = sp.spkpos("MOON", self.et, "J2000", "NONE", "EARTH")
        rot = np.array(sp.pxform("J2000", self.frame, self.et))
        return rot @ (self.itrf_to_j2000 @ s_itrf - 1e3 * np.array(m))


def earth_elevation_deg(lat, lon, s_itrf, target_itrf):
    la, lo = np.radians(lat), np.radians(lon)
    n = np.array([np.cos(la) * np.cos(lo), np.cos(la) * np.sin(lo), np.sin(la)])
    return float(np.degrees(np.arcsin(np.dot(n, unit(target_itrf - s_itrf)))))


def lunar_elevation_deg(b_body, s_body):
    return float(np.degrees(np.arcsin(np.dot(unit(b_body), unit(s_body - b_body)))))


def delay_row(g, stations, b_body, i, j, station_cols, beacon_col, dim):
    """One Jacobian row by central differences of SPICE light-time differences."""
    row = np.zeros(dim)
    for s_idx, sign in ((i, -1.0), (j, +1.0)):
        o = station_cols.get(s_idx)
        if o is None:
            continue
        for k in range(3):
            e = np.zeros(3)
            e[k] = STEP_STATION
            hi = g.light_time(stations[s_idx] + e, b_body)
            lo = g.light_time(stations[s_idx] - e, b_body)
            row[o + k] = sign * (hi - lo) / (2 * STEP_STATION)
    if beacon_col is not None:
        for k in range(3):
            e = np.zeros(3)
            e[k] = STEP_BEACON
            hi = g.light_time(stations[j], b_body + e) - g.light_time(stations[i], b_body + e)
            lo = g.light_time(stations[j], b_body - e) - g.light_time(stations[i], b_body - e)
            row[beacon_col + k] = (hi - lo) / (2 * STEP_BEACON)
    return row


def analyse(info, rel_tol):
    """Rank, spectrum, condition, (pseudo-)covariance and null space of an information matrix."""
    info = 0.5 * (info + info.T)
    lam, vec = np.linalg.eigh(info)
    lmax = lam.max()
    thr = rel_tol * max(lmax, 0.0)
    keep = (lam > thr) & (lam > 0.0)
    rank = int(keep.sum())
    n = info.shape[0]
    if rank == n:
        cov = np.linalg.inv(info)
    else:
        cov = np.linalg.pinv(info, rcond=rel_tol, hermitian=True)
    null = sla.null_space(info, rcond=rel_tol)
    assert null.shape[1] == n - rank, (null.shape, rank)
    return {
        "rank": rank,
        "defect": n - rank,
        "eigenvalues": lam.tolist(),
        "condition": float(lmax / lam[keep].min()) if rank else float("inf"),
        "covariance": cov.tolist(),
        "sigma": np.sqrt(np.clip(np.diag(cov), 0.0, None)).tolist(),
        "null_space_columns": null.T.tolist(),
        "weakest_direction": vec[:, 0].tolist(),
        "trace": float(np.trace(info)),
    }


def vlbi_summary(jac, w, inp):
    m = jac.T @ (w[:, None] * jac)
    out = analyse(m, inp["rel_tol"])
    p = m.shape[0]
    n_obs = len(w)
    cov = np.array(out["covariance"])
    rms = float(np.sqrt(np.trace(cov) / p))
    eq = C * inp["delay_sigma_s"] * np.sqrt(3.0 / n_obs)
    tb = float(np.sqrt(p / np.trace(m)))
    out.update(
        {
            "rms_station_sigma_m": rms,
            "trace_bound_m": tb,
            "equipartition_m": float(eq),
            "ratio_computed_over_equipartition": rms / eq,
            "ratio_computed_over_trace_bound": rms / tb,
        }
    )
    return out


def vlbi(inp):
    et0 = sp.str2et(inp["epoch_utc"])  # ISO calendar string, read as UTC
    stations = [station_itrf(*s) for s in inp["stations"]]
    b_body = body_point(*inp["beacon_selenographic_deg_deg_m"])
    n_st = len(stations)
    held = set(inp["held_fixed"])
    cols, o = {}, 0
    for s in range(n_st):
        if s not in held:
            cols[s] = o
            o += 3
    dim = o
    geos = [Geometry(et0 + k * inp["step_min"] * 60.0, "MOON_PA") for k in range(inp["n_epochs"])]
    obs, rows = [], []
    for e, g in enumerate(geos):
        b_itrf = g.beacon_itrf(b_body)
        vis = [
            earth_elevation_deg(lat, lon, stations[s], b_itrf) >= inp["elevation_mask_deg"]
            for s, (lat, lon, _) in enumerate(inp["stations"])
        ]
        for i in range(n_st):
            for j in range(i + 1, n_st):
                if vis[i] and vis[j]:
                    obs.append([e, i, j])
                    rows.append(delay_row(g, stations, b_body, i, j, cols, None, dim))
    jac = np.array(rows)
    w = np.full(len(rows), 1.0 / inp["delay_sigma_s"] ** 2)
    spice = vlbi_summary(jac, w, inp)
    los = [unit(g.beacon_itrf(b_body)) for g in geos]
    spice.update(
        {
            "observations": obs,
            "los_itrs_sweep_deg": ang_deg(los[0], los[-1]),
            "los_itrs_max_sweep_deg": max(ang_deg(los[0], x) for x in los),
            "beacon_declination_deg": float(
                np.degrees(np.arcsin(unit(geos[0].beacon_geocentric_j2000(b_body))[2]))
            ),
            "jacobian": jac.tolist(),
        }
    )
    ej = np.array(inp["engine_jacobian"])
    ew = np.array(inp["weights"])
    p2 = vlbi_summary(ej, ew, inp)
    return {"name": inp["name"], "spice": spice, "p2": p2}


def helmert(points):
    rows = []
    for p in points:
        x, y, z = p * 1e-6
        rows += [
            [1, 0, 0, 0.0, -z, y, x],
            [0, 1, 0, z, 0.0, -x, y],
            [0, 0, 1, -y, x, 0.0, z],
        ]
    return np.array(rows, dtype=float)


def campaign_summary(jac, w, n_sc, n_b, a, rel_tol):
    joint = jac.T @ (w[:, None] * jac)
    nb = 3 * n_b
    m_bb = joint[n_sc:, n_sc:]
    if n_sc:
        m_ss = joint[:n_sc, :n_sc]
        m_sb = joint[:n_sc, n_sc:]
        info_b = m_bb - m_sb.T @ np.linalg.inv(m_ss) @ m_sb
    else:
        info_b = m_bb
    info_b = 0.5 * (info_b + info_b.T)
    diag = np.abs(np.diag(info_b)).max()
    off = max(
        (abs(info_b[i, j]) for i in range(nb) for j in range(nb) if i // 3 != j // 3), default=0.0
    )
    cov_b = np.linalg.inv(info_b) if np.linalg.matrix_rank(info_b) == nb else np.linalg.pinv(info_b, rcond=rel_tol, hermitian=True)
    corr = 0.0
    for i in range(nb if n_sc else 0):  # only reported when the stations are estimated
        for j in range(nb):
            if i // 3 != j // 3:
                corr = max(corr, abs(cov_b[i, j] / np.sqrt(cov_b[i, i] * cov_b[j, j])))
    h = a.T @ info_b @ a
    out = analyse(h, rel_tol)
    s = out["sigma"]
    out["translation_norm_m"] = float(np.sqrt(s[0] ** 2 + s[1] ** 2 + s[2] ** 2))
    out["offblock_fraction"] = float(off / diag)
    out["max_interbeacon_correlation"] = float(corr)
    if not n_sc:
        out["independence_discarded_translation_norm_m"] = out["translation_norm_m"]
        return out
    cov_ind = np.zeros_like(cov_b)
    for k in range(n_b):
        cov_ind[3 * k : 3 * k + 3, 3 * k : 3 * k + 3] = cov_b[3 * k : 3 * k + 3, 3 * k : 3 * k + 3]
    ind = analyse(a.T @ np.linalg.inv(cov_ind) @ a, rel_tol)
    si = ind["sigma"]
    out["independence_discarded_translation_norm_m"] = float(np.sqrt(si[0] ** 2 + si[1] ** 2 + si[2] ** 2))
    return out


def campaign(inp):
    et0 = sp.str2et(inp["epoch_utc"])  # ISO calendar string, read as UTC
    stations = [station_itrf(*s) for s in inp["stations"]]
    beacons = [body_point(*b) for b in inp["beacons_selenographic_deg_deg_m"]]
    for mine, theirs in zip(beacons, inp["beacon_points_body_m"]):
        assert np.allclose(mine, theirs, atol=1e-6, rtol=0), (mine, theirs)
    n_st, n_b = len(stations), len(beacons)
    n_sc = inp["n_station_columns"]
    cols = {s: 3 * (s - 1) for s in range(1, n_st)} if n_sc else {}
    dim = n_sc + 3 * n_b
    epochs = [et0 + k * inp["step_min"] * 60.0 for k in range(inp["n_epochs"])]
    obs, rows = [], []
    for b, b_body in enumerate(beacons):
        for e, et in enumerate(epochs):
            g = Geometry(et, "MOON_ME")
            b_itrf = g.beacon_itrf(b_body)
            vis = []
            for s, (lat, lon, _) in enumerate(inp["stations"]):
                ok = earth_elevation_deg(lat, lon, stations[s], b_itrf) >= inp["elevation_mask_deg"]
                ok = ok and lunar_elevation_deg(b_body, g.station_body(stations[s])) >= inp["earth_elevation_mask_deg"]
                vis.append(ok)
            for i in range(n_st):
                for j in range(i + 1, n_st):
                    if vis[i] and vis[j]:
                        obs.append([b, e, i, j])
                        rows.append(delay_row(g, stations, b_body, i, j, cols, n_sc + 3 * b, dim))
    jac = np.array(rows)
    w = np.full(len(rows), 1.0 / inp["delay_sigma_s"] ** 2)
    a = helmert(beacons)
    spice = campaign_summary(jac, w, n_sc, n_b, a, inp["rel_tol"])
    earth = [unit(1e3 * np.array(sp.spkpos("EARTH", et, "MOON_ME", "NONE", "MOON")[0])) for et in epochs]
    spice.update(
        {
            "observations": obs,
            "sub_earth_sweep_deg": max(ang_deg(earth[0], x) for x in earth),
        }
    )
    ea = np.array(inp["helmert_design"])
    p2 = campaign_summary(np.array(inp["engine_jacobian"]), np.array(inp["weights"]), n_sc, n_b, ea, inp["rel_tol"])
    return {"name": inp["name"], "spice": spice, "p2": p2}


def main():
    for k in KERNELS:
        sp.furnsh(os.path.join(NAIF, k))
    doc = json.load(open(sys.argv[1]))
    out = {
        "generator": "tests/fixtures/lunar_vlbi_campaign_spice_oracle/gen_reference.py",
        "spice_toolkit": sp.tkvrsn("TOOLKIT"),
        "spiceypy": sp.__version__,
        "numpy": np.__version__,
        "scipy": scipy.__version__,
        "kernels_sha256": {k: sha256(os.path.join(NAIF, k)) for k in KERNELS},
        "lunar_vlbi_fim": [vlbi(s) for s in doc["lunar_vlbi_fim"]],
        "lunar_frame_campaign": [campaign(s) for s in doc["lunar_frame_campaign"]],
    }
    print(json.dumps(out, indent=1))


if __name__ == "__main__":
    main()
