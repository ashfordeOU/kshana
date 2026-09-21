#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Generate the cross-provider inter-ephemeris interoperability fixtures and reference
decomposition for the P2 lunar-interop-budget module.

Samples the geocentric Moon and four SSB planet positions from three INDEPENDENT
authoritative lunar/planetary ephemerides — the only real "multiple providers" that
exist today — and writes:
  tests/fixtures/inter_ephemeris/moon_geo.csv    day,provider,x_m,y_m,z_m   (Moon wrt Earth, ICRF)
  tests/fixtures/inter_ephemeris/planet_ssb.csv  day,provider,body,x_m,y_m,z_m (body wrt SSB, ICRF)
  tests/fixtures/inter_ephemeris/reference.json  expected per-pair Helmert decomposition
  tests/fixtures/inter_ephemeris/NOTICE.md       provenance

Providers (independent families):
  DE440    JPL   (Park et al. 2021, AJ 161:105)          de440s.bsp
  INPOP21a IMCCE (Fienga et al. 2021, INPOP21a release)  inpop21a_TDB_m100_p100_littleendian.dat
  EPM2021  IAA RAS (Pitjeva et al., EPM2021)             epm2021.bsp

Kernels are NOT vendored (mirrors the de440_moon_pa.csv convention); only the sampled
derived positions and the reference numbers are. Public kernel sources:
  DE440s   https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp
  INPOP21a https://ftp.imcce.fr/pub/ephem/planets/inpop21a/inpop21a_TDB_m100_p100_littleendian.dat
  EPM2021  https://ftp.iaaras.ru/pub/epm/EPM2021/SPICE/epm2021.bsp

Decomposition conventions (the Rust lunar_interop_budget module must match these):
  * pairwise difference   d_i = r_b(t_i) - r_a(t_i)          (provider b relative to a)
  * datum point-Jacobian  J(p) = [ I3 | p | -[p]_x ]         (7-col: t, scale, rotation)
                          (identical to lunar_datum::datum7_point_jacobian_body)
  * Helmert fit           d = J(r_a) @ delta                 (delta = 7-param Helmert of b wrt a)
  * rotation-only fit     d = [ I3 | -[p]_x ] @ [t; theta]   (6-param, isolates orientation)
  * theta_moon            |theta| from the 6-param rotation-only fit of the Moon pair
  * theta_frametie        median over {Mercury,Venus,Mars,EMB} of the 6-param planet-pair
                          theta (the ICRF realization tie common to all bodies)
  * theta_excess          theta_moon_vec - theta_frametie_vec   (Moon-specific, orientation)
  * reducible_m           |theta_frametie| * LUNAR_DIST         (removed by common frame tie)
  * irreducible_m         |theta_excess|   * LUNAR_DIST         (Moon-orbit dynamics, convention-free)

Window: 2024-01-01 .. 2025-12-31 TDB, 2-day cadence (366 epochs).

Usage:  KERNELS=/path/to/kernels  .venv/bin/python scripts/gen_interop_ref.py
"""
import os, json, csv
import numpy as np
from calcephpy import CalcephBin, Constants

KDIR = os.environ.get("KERNELS", ".")
OUT  = os.path.join(os.path.dirname(__file__), "..", "tests", "fixtures", "inter_ephemeris")
UNIT = Constants.UNIT_KM + Constants.UNIT_SEC + Constants.USE_NAIFID
M = 1000.0
LUNAR_DIST = 3.84e8  # m, nominal Earth-Moon distance for nrad->m conversion
JD0 = 2460310.5      # 2024-01-01 00:00 TDB
DAYS = np.arange(0, 731, 2.0)   # 366 epochs
BODIES = {"mercury": 1, "venus": 2, "mars": 4, "emb": 3}

eph = {"DE440": CalcephBin.open(os.path.join(KDIR, "de440s.bsp")),
       "INPOP21a": CalcephBin.open(os.path.join(KDIR, "inpop21a.dat")),
       "EPM2021": CalcephBin.open(os.path.join(KDIR, "epm2021.bsp"))}

def pos(e, tgt, ctr, jd):
    return np.array(eph[e].compute_unit(jd, 0.0, tgt, ctr, UNIT)[:3]) * M

def ncx(r):
    x, y, z = r
    return np.array([[0, z, -y], [-z, 0, x], [y, -x, 0]])   # -[r]_x

def fit_rot(ra, rb):
    """6-param t+rotation fit of (rb-ra) = [I|-[ra]_x]@[t;theta]; returns theta, per-vec rms resid."""
    A = np.vstack([np.hstack([np.eye(3), ncx(r)]) for r in ra])
    y = (rb - ra).reshape(-1)
    b, *_ = np.linalg.lstsq(A, y, rcond=None)
    res = y - A @ b
    return b[3:6], float(np.sqrt((res ** 2).mean() * 3))

# ---- sample series ----
# Round to the exact CSV write precision (6 decimals, i.e. 1 micrometre) so that the
# vendored CSVs, the reference.json oracle, and the Rust reference test all operate on
# byte-identical inputs. Without this the near-cancelling INPOP21a-EPM2021 reducible/
# irreducible split (theta_moon ~= theta_frametie) is sensitive to the ~sub-mm gap
# between full-precision reference values and the truncated fixture. Rounding here makes
# reference.json a function of exactly the vendored data; the Rust vs SciPy agreement is
# then pure solver difference.
CSV_DP = 6
moon = {p: np.round(np.array([pos(p, 301, 399, JD0 + d) for d in DAYS]), CSV_DP) for p in eph}
planet = {p: {bn: np.round(np.array([pos(p, bid, 0, JD0 + d) for d in DAYS]), CSV_DP)
              for bn, bid in BODIES.items()} for p in eph}

# ---- write CSV fixtures ----
os.makedirs(OUT, exist_ok=True)
with open(os.path.join(OUT, "moon_geo.csv"), "w", newline="") as f:
    w = csv.writer(f); w.writerow(["day", "provider", "x_m", "y_m", "z_m"])
    for p in eph:
        for i, d in enumerate(DAYS):
            w.writerow([f"{d:.1f}", p, f"{moon[p][i][0]:.6f}", f"{moon[p][i][1]:.6f}", f"{moon[p][i][2]:.6f}"])
with open(os.path.join(OUT, "planet_ssb.csv"), "w", newline="") as f:
    w = csv.writer(f); w.writerow(["day", "provider", "body", "x_m", "y_m", "z_m"])
    for p in eph:
        for bn in BODIES:
            for i, d in enumerate(DAYS):
                r = planet[p][bn][i]
                w.writerow([f"{d:.1f}", p, bn, f"{r[0]:.6f}", f"{r[1]:.6f}", f"{r[2]:.6f}"])

# ---- reference decomposition (the SciPy oracle) ----
ref = {"window": "2024-01-01..2025-12-31 TDB", "epochs": len(DAYS), "cadence_days": 2,
       "epoch_jd_tdb": JD0, "lunar_dist_m": LUNAR_DIST, "providers": list(eph), "pairs": {}}
for a, b in [("DE440", "INPOP21a"), ("DE440", "EPM2021"), ("INPOP21a", "EPM2021")]:
    ra, rb = moon[a], moon[b]
    raw = float(np.sqrt((np.linalg.norm(rb - ra, axis=1) ** 2).mean()))
    th_moon, rot_res = fit_rot(ra, rb)
    thetas = [fit_rot(planet[a][bn], planet[b][bn])[0] for bn in BODIES]
    th_tie = np.median(np.array(thetas), axis=0)
    th_exc = th_moon - th_tie
    ref["pairs"][f"{a}-{b}"] = {
        "raw_rms_m": raw, "rot_residual_m": rot_res,
        "theta_moon_nrad": float(np.linalg.norm(th_moon) * 1e9),
        "theta_frametie_nrad": float(np.linalg.norm(th_tie) * 1e9),
        "theta_excess_nrad": float(np.linalg.norm(th_exc) * 1e9),
        "reducible_m": float(np.linalg.norm(th_tie) * LUNAR_DIST),
        "irreducible_m": float(np.linalg.norm(th_exc) * LUNAR_DIST),
        "theta_moon_vec_nrad": [float(x * 1e9) for x in th_moon],
        "theta_frametie_vec_nrad": [float(x * 1e9) for x in th_tie]}
with open(os.path.join(OUT, "reference.json"), "w") as f:
    json.dump(ref, f, indent=2)

print(json.dumps(ref["pairs"], indent=2))
print("\nwrote:", os.path.join(OUT, "moon_geo.csv"), "/ planet_ssb.csv / reference.json")
