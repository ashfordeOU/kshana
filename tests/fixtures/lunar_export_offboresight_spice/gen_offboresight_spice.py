#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent oracle for the off-boresight antenna block of the lunar geometry export.
Pre-registered in ``tests/validate_lunar_export_offboresight_spice.rs`` (read it first).

Nothing here calls Kshana.

Part A (flown orbiters): satellite positions are the committed JPL Horizons states
(Moon-centred ICRF, TDB). The site is placed by SPICE ``latrec`` on the 1737.4 km sphere in
``IAU_MOON`` (``pck00011.tpc``, the IAU 2015 model) and rotated to J2000 with ``pxform`` at
``et = (epoch_jd_tdb - 2451545) * 86400 + t``. Angles by SPICE ``vsep``.

Part B (documented working point): the default eight-satellite illustrative element set,
propagated two-body by ANISE (``Orbit.from_keplerian_mean_anomaly`` then ``at_epoch``),
rotated to the engine's stated mean-rotation Moon-fixed frame (a rotation about z by
2 pi t / 27.321661 d, zero at t = 0), angles by SPICE ``vsep``.

Pattern (both parts): ``scipy.special.j1``; ``G0 = 10 log10(eta (pi D / lambda)^2)``,
``G = G0 + 10 log10((2 J1(x)/x)^2)``, ``x = (pi D / lambda) sin(theta)``; in beam (real)
when ``G >= G0 - 10 log10(2)``; in beam (symmetric) when
``theta_deg <= 0.5 * sqrt(31000 / G0_lin)``. First null at ``x = 3.8317`` (the first zero
of J1, from ``scipy.special.jn_zeros``).

Run: needs spiceypy and scipy (``$ORACLE_PY``) and ANISE (a venv with ``anise==0.10.6``).
Part B's propagation is run by the ANISE interpreter; set ``ANISE_PY`` to it::

    ANISE_PY=/tmp/anvenv/bin/python $ORACLE_PY gen_offboresight_spice.py
"""

import csv
import json
import math
import os
import subprocess
import sys

import numpy as np
import scipy
import spiceypy as sp
from scipy.special import j1, jn_zeros

HERE = os.path.dirname(os.path.abspath(__file__))
EPH = os.path.join(HERE, "..", "lunar_ephemeris", "horizons_lunar_orbiters_2023001_12h.csv")
NAIF = os.environ.get("KSHANA_NAIF_DIR",
                      os.path.join(os.path.expanduser("~"), "Code", "kshana-oracles", "data", "naif"))
R_MOON_KM = 1737.4
C = 299792458.0
MASK_DEG = 5.0
EDGE_DEG = 1.0e-3

# Pre-registered configuration.
SITES_A = [(-89.5, 0.0), (-60.0, 45.0), (-20.0, -100.0), (0.0, 0.0), (35.0, 160.0), (75.0, -30.0)]
APERTURES_A = [0.3, 1.0]
CARRIER_HZ = 2.4e9
EFF = 0.60
HORIZON_A_S = 11 * 3600.0
STEP_A_S = 300.0
SITE_B = (-89.9, 0.0)
APERTURE_B = 1.0
HORIZON_B_S = 12 * 3600.0
STEP_B_S = 3600.0
SIDEREAL_S = 27.321661 * 86400.0

FIRST_ZERO = float(jn_zeros(1, 1)[0])


def pattern(d_m, theta_rad):
    lam = C / CARRIER_HZ
    g0_lin = EFF * (math.pi * d_m / lam) ** 2
    g0 = 10.0 * math.log10(g0_lin)
    x = math.pi * d_m / lam * math.sin(theta_rad)
    f = 1.0 if abs(x) < 1e-12 else 2.0 * j1(x) / x
    lin = f * f
    g = g0 + 10.0 * math.log10(max(lin, 1e-30))
    sym_half_deg = 0.5 * math.sqrt(31000.0 / g0_lin)
    # Real half-power edge: the angle where (2 J1(x)/x)^2 = 1/2, found by SciPy.
    from scipy.optimize import brentq
    xh = brentq(lambda z: (2.0 * j1(z) / z) ** 2 - 0.5, 0.5, 3.0, xtol=1e-15)
    s = xh * lam / (math.pi * d_m)
    edge_pattern_deg = math.degrees(math.asin(s)) if s <= 1 else float("inf")
    s0 = FIRST_ZERO * lam / (math.pi * d_m)
    first_null_deg = math.degrees(math.asin(s0)) if s0 <= 1 else float("inf")
    return {
        "g0": g0, "gain": g, "lin": lin, "in_pattern": g >= g0 - 10.0 * math.log10(2.0),
        "in_symmetric": math.degrees(theta_rad) <= sym_half_deg,
        "edge_pattern_deg": edge_pattern_deg, "edge_symmetric_deg": sym_half_deg,
        "first_null_deg": first_null_deg,
    }


def off_boresight_rad(site, sat):
    site, sat = np.asarray(site), np.asarray(sat)
    return sp.vsep(list(-sat), list(site - sat))


def elevation_deg(site, sat):
    site, sat = np.asarray(site), np.asarray(sat)
    return 90.0 - math.degrees(sp.vsep(list(site), list(sat - site)))


def rows_for(case, positions_by_t, site_km, d_m):
    """positions_by_t: list of (t, [sat positions km]) in the frame site_km is in."""
    out = []
    n_eval = n_pat = n_sym = 0
    worst = 0
    edges = 0
    for t, sats in positions_by_t:
        ep_pat = ep_sym = 0
        for k, s in enumerate(sats):
            el = elevation_deg(site_km(t), s)
            th = off_boresight_rad(site_km(t), s)
            p = pattern(d_m, th)
            vis = el >= MASK_DEG
            th_deg = math.degrees(th)
            edge = (abs(el - MASK_DEG) <= EDGE_DEG
                    or abs(th_deg - p["edge_pattern_deg"]) <= EDGE_DEG
                    or abs(th_deg - p["edge_symmetric_deg"]) <= EDGE_DEG)
            edges += int(edge and vis)
            if vis:
                n_eval += 1
                if p["in_pattern"]:
                    n_pat += 1
                    ep_pat += 1
                if p["in_symmetric"]:
                    n_sym += 1
                    ep_sym += 1
            out.append([case, "%.6f" % t, k, "%.12f" % el, int(vis), "%.12f" % th_deg,
                        "%.12f" % p["gain"], "%.15e" % p["lin"], int(p["in_pattern"]),
                        int(p["in_symmetric"]), "%.12f" % p["first_null_deg"], int(edge)])
        worst = max(worst, abs(ep_pat - ep_sym))
    summary = {"case": case, "n_links_evaluated": n_eval, "in_beam_pattern_links": n_pat,
               "in_beam_symmetric_links": n_sym, "in_beam_correction_links": n_pat - n_sym,
               "max_abs_epoch_correction_sats": worst, "edge_band_links": edges}
    return out, summary


def part_a():
    sp.furnsh(os.path.join(NAIF, "naif0012.tls"))
    sp.furnsh(os.path.join(NAIF, "pck00011.tpc"))
    meta, data = {}, {}
    with open(EPH) as f:
        lines = f.read().splitlines()
    for l in lines:
        if l.startswith("# ") and ":" in l:
            k, v = l[2:].split(":", 1)
            meta[k.strip()] = v.strip()
    body = [l for l in lines if not l.startswith("#")]
    for r in csv.DictReader(body):
        data.setdefault(int(r["sat"]), []).append(
            (float(r["t_s"]), np.array([float(r["x_km"]), float(r["y_km"]), float(r["z_km"])])))
    epoch = float(meta["epoch_jd_tdb"])
    n_sat = len(data)
    grid = [k * STEP_A_S for k in range(int(round(HORIZON_A_S / STEP_A_S)))]
    positions = []
    for t in grid:
        sats = []
        for s in range(n_sat):
            # The table node nearest the grid epoch (nodes sit within 2e-5 s of k * 300 s).
            tn, rn = min(data[s], key=lambda q: abs(q[0] - t))
            assert abs(tn - t) < 1e-3
            sats.append(rn)
        positions.append((t, sats))

    def site_fn(lat, lon):
        body_km = sp.latrec(R_MOON_KM, math.radians(lon), math.radians(lat))

        def at(t):
            et = (epoch - 2451545.0) * 86400.0 + t
            m = np.array(sp.pxform("IAU_MOON", "J2000", et))
            return m @ np.array(body_km)
        return at

    rows, sums = [], []
    for si, (lat, lon) in enumerate(SITES_A):
        for d in APERTURES_A:
            case = "A%d_D%g" % (si, d)
            r, s = rows_for(case, positions, site_fn(lat, lon), d)
            s.update({"lat_deg": lat, "lon_deg": lon, "diameter_m": d})
            rows += r
            sums.append(s)
    return rows, sums, epoch


def part_b():
    anise_py = os.environ.get("ANISE_PY")
    code = r'''
import json, sys
from anise.astro import Frame, Orbit
from anise.time import Epoch, Unit
import anise
R = 1737.4
fr = Frame(301, 1, mu_km3_s2=4902.800118)
e0 = Epoch("2000-01-01T12:00:00 TDB")
out = {"anise": anise.__version__, "states": []}
ts = [k * 3600.0 for k in range(12)]
for t in ts:
    row = []
    for k in range(8):
        o = Orbit.from_keplerian_mean_anomaly(R + 8000.0, 0.6, 57.7, 360.0 * k / 8, 90.0,
                                              360.0 * k / 8, e0, fr)
        p = o.at_epoch(e0 + Unit.Second * t)
        row.append([p.x_km, p.y_km, p.z_km])
    out["states"].append([t, row])
print(json.dumps(out))
'''
    res = json.loads(subprocess.check_output([anise_py, "-c", code]))
    positions = []
    for t, row in res["states"]:
        th = 2.0 * math.pi / SIDEREAL_S * t
        c, s = math.cos(th), math.sin(th)
        positions.append((t, [np.array([c * x + s * y, -s * x + c * y, z]) for x, y, z in row]))
    lat, lon = SITE_B
    site = np.array([R_MOON_KM * math.cos(math.radians(lat)) * math.cos(math.radians(lon)),
                     R_MOON_KM * math.cos(math.radians(lat)) * math.sin(math.radians(lon)),
                     R_MOON_KM * math.sin(math.radians(lat))])
    rows, s = rows_for("B", positions, lambda t: site, APERTURE_B)
    return rows, s, res["anise"]


HEADER = ["case", "t_s", "sat", "el_deg", "visible", "off_boresight_deg", "gain_dbi",
          "gain_lin_rel", "in_beam_pattern", "in_beam_symmetric", "first_null_deg", "edge_band"]


def write(name, rows, summaries, notes):
    with open(os.path.join(HERE, name), "w") as f:
        for n in notes:
            f.write("# %s\n" % n)
        for s in summaries:
            f.write("# SUMMARY %s\n" % json.dumps(s, sort_keys=True))
        w = csv.writer(f, lineterminator="\n")
        w.writerow(HEADER)
        w.writerows(rows)


def main():
    rows_a, sums_a, epoch = part_a()
    notes = ["generator: gen_offboresight_spice.py",
             "spiceypy %s (%s), scipy %s, numpy %s" % (sp.__version__, sp.tkvrsn("TOOLKIT"),
                                                      scipy.__version__, np.__version__),
             "input: lunar_ephemeris/horizons_lunar_orbiters_2023001_12h.csv, epoch_jd_tdb %.9f" % epoch,
             "frame: IAU_MOON from pck00011.tpc; site on the 1737.4 km sphere"]
    write("flown_orbiters.csv", rows_a, sums_a, notes)
    rows_b, sum_b, anise_v = part_b()
    write("working_point.csv", rows_b, [sum_b],
          ["generator: gen_offboresight_spice.py",
           "anise %s (Keplerian two-body), spiceypy %s vsep, scipy %s j1" % (anise_v, sp.__version__, scipy.__version__),
           "engine mean-rotation frame convention: rotation about z by 2 pi t / 27.321661 d"])
    for s in sums_a + [sum_b]:
        print(json.dumps(s, sort_keys=True))


if __name__ == "__main__":
    sys.exit(main())
