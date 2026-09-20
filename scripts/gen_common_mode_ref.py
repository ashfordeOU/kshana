#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Generate the Modelled real-data anchor for the P3 common-mode integrity module
(`src/lunar_common_mode.rs`).

WHAT IS CHECKED (and what is not claimed)
-----------------------------------
The *geometry* used here is a **Modelled** lunar constellation (a documented,
deterministic set of satellite positions + a user on the lunar surface, below).
It is NOT an external oracle and carries no Validated claim.

The thing CHECKED is the engine's parity-projection / least-squares linear
algebra: `common_mode_split` must reproduce, to a tight tolerance, this
INDEPENDENT numpy computation of the same split — evaluated on a *real*
inter-ephemeris disagreement.

THE REAL DATA
-------------
Two authoritative lunar ephemerides disagree on the geocentric Moon position by
    Delta_s(t) = pos_A(t) - pos_B(t)
This Delta_s is read straight from the real sampled Moon states in
`tests/fixtures/inter_ephemeris/moon_geo.csv` (DE440 / INPOP21a / EPM2021; see that
directory's NOTICE.md for full provenance). We use the two DE440-anchored pairs:
    DE440-INPOP21a  and  DE440-EPM2021.

THE SCIENCE
-----------
A lunar constellation referenced to the Moon ephemeris is displaced by Delta_s(t)
between the two providers' realizations. A user mixing the two providers therefore
sees a *common-mode* measurement error on satellite i:
    dy_i = e_i . Delta_s(t)            (LOS projection of the shared shift)
with e_i = unit(sat_i - user) the line-of-sight unit vector (identical to
`kshana::orbit::los_unit`). Because the shift is common to every satellite it lies
EXACTLY in range(G) for the RAIM geometry rows g_i = [-e_i, 1]:
    dy = G . [ -Delta_s ; 0 ]
so the parity residual is ~zero (ARAIM-invisible) and the user silently absorbs
~Delta_s as a position error. This anchors, on REAL data, that the inter-ephemeris
floor is exactly the error class snapshot RAIM/ARAIM cannot see.

BYTE-CONSISTENCY (required)
---------------------------
Every position (user, each satellite, and each Delta_s) is rounded to 6 decimals
(1 micrometre) BEFORE it is both (a) written to the fixture and (b) used to compute
the reference split. The derived per-satellite dy vector is likewise stored in the
fixture and consumed verbatim by both this oracle and the Rust test, so the only
difference between the two sides is the 4x4 linear solver (Rust Gauss-Jordan
`invert4` vs numpy `solve`), which agrees far inside the 1e-3 tolerance. (P2 had a
bug where the fixture was rounded but the oracle used full precision; rounding
before BOTH sides is what fixes it.)

Usage:  .venv/bin/python scripts/gen_common_mode_ref.py
"""
import os
import csv
import json
import numpy as np

HERE = os.path.dirname(__file__)
IN_CSV = os.path.join(HERE, "..", "tests", "fixtures", "inter_ephemeris", "moon_geo.csv")
OUT = os.path.join(HERE, "..", "tests", "fixtures", "common_mode")

# 6-decimal rounding = the exact CSV/JSON write precision. Rounding here, before both
# the write and the compute, makes reference.json a pure function of the vendored data.
DP = 6

# Provider pairs (A - B); A is DE440 in both, mirroring gen_interop_ref.py's convention.
PAIRS = [("DE440", "INPOP21a"), ("DE440", "EPM2021")]

# ── Modelled lunar constellation (deterministic; Moon-centred frame, metres) ──────────
#
# NOT an oracle: a documented Modelled geometry so the linear algebra has real inputs.
# User: a fixed point on the mean lunar surface (radius R_moon along +x of the
# Moon-centred frame). Satellites: 8 LCNS-like nodes at a 5000 km slant range from the
# user, spread across the visible hemisphere in azimuth/elevation (local ENU at the
# user, with Up = +x, East = +y, North = +z). Eight well-spread lines of sight give a
# full-rank RAIM geometry (dof = 8 - 4 = 4). The exact positions are cosmetic to the
# result: a common-mode shift projects to range(G) for ANY full-rank geometry — that is
# the point — so blind_fraction ~ 1 regardless of these values.
R_MOON = 1_737_400.0            # m, mean lunar radius (IAU)
SLANT_M = 5.0e6                 # m, satellite slant range from the user (5000 km)
USER = np.round(np.array([R_MOON, 0.0, 0.0]), DP)

# (azimuth_deg, elevation_deg) of each satellite LOS in the user's local ENU frame.
AZ_EL_DEG = [
    (0.0, 80.0),
    (60.0, 45.0),
    (120.0, 30.0),
    (180.0, 55.0),
    (240.0, 25.0),
    (300.0, 50.0),
    (30.0, 15.0),
    (210.0, 70.0),
]

# Local ENU basis at USER = [R_moon,0,0]: Up=+x, East=+y, North=+z.
UP = np.array([1.0, 0.0, 0.0])
EAST = np.array([0.0, 1.0, 0.0])
NORTH = np.array([0.0, 0.0, 1.0])


def sat_position(az_deg, el_deg):
    az, el = np.radians(az_deg), np.radians(el_deg)
    # LOS unit vector in ENU, then mapped into the Moon-centred frame.
    e_enu = np.array(
        [np.cos(el) * np.sin(az), np.cos(el) * np.cos(az), np.sin(el)]
    )
    e_moon = e_enu[0] * EAST + e_enu[1] * NORTH + e_enu[2] * UP
    return USER + SLANT_M * e_moon


SATS = np.round(np.array([sat_position(az, el) for az, el in AZ_EL_DEG]), DP)
M = SATS.shape[0]


# ── engine-mirroring linear algebra (independent numpy implementation) ────────────────
def los_unit(user, sat):
    d = sat - user
    return d / np.linalg.norm(d)


def geometry(user, sats):
    """RAIM geometry rows g_i = [-e_i, 1]; e_i = unit(sat_i - user)."""
    return np.array([np.append(-los_unit(user, s), 1.0) for s in sats])


def common_mode_split(g, dy):
    """Independent reproduction of kshana::lunar_common_mode::common_mode_split."""
    gtg = g.T @ g
    s = np.linalg.solve(gtg, g.T)          # S = (G^T G)^-1 G^T  (4 x M)
    blind_dx = s @ dy                       # state error the user absorbs
    pred = g @ blind_dx                     # range(G) part of dy
    residual = dy - pred                    # parity residual (what RAIM sees)
    dy_norm = float(np.linalg.norm(dy))
    blind_norm = float(np.linalg.norm(pred))
    detectable_norm = float(np.linalg.norm(residual))
    return blind_dx, blind_norm, detectable_norm, blind_norm / dy_norm


# ── read the real inter-ephemeris Moon states ─────────────────────────────────────────
def read_moon_geo(path):
    """day -> provider -> [x,y,z] (already 6-dp in the CSV; re-round to be explicit)."""
    series = {}
    days = []
    with open(path, newline="") as f:
        r = csv.DictReader(f)
        for row in r:
            day = float(row["day"])
            prov = row["provider"]
            vec = np.round(
                np.array([float(row["x_m"]), float(row["y_m"]), float(row["z_m"])]), DP
            )
            series.setdefault(prov, {})[day] = vec
            if prov == "DE440":
                days.append(day)
    return series, days


series, days = read_moon_geo(IN_CSV)

# Precompute the (fixed) geometry and per-satellite LOS unit vectors.
G = geometry(USER, SATS)
E = np.array([los_unit(USER, s) for s in SATS])  # M x 3 LOS unit vectors

# ── build reference records ───────────────────────────────────────────────────────────
records = []
summary = {}
for a, b in PAIRS:
    key = f"{a}-{b}"
    bfs, pos_errs, det_norms = [], [], []
    for day in days:
        delta_s = np.round(series[a][day] - series[b][day], DP)  # real A - B, 6-dp
        dy = E @ delta_s                                          # dy_i = e_i . Delta_s
        blind_dx, blind_norm, detectable_norm, blind_fraction = common_mode_split(G, dy)
        records.append(
            {
                "pair": key,
                "day": day,
                "delta_s": [float(x) for x in delta_s],
                "delta_y": [float(x) for x in dy],
                "blind_dx": [float(x) for x in blind_dx],
                "blind_fraction": float(blind_fraction),
                "detectable_norm": float(detectable_norm),
                "blind_norm": float(blind_norm),
            }
        )
        bfs.append(blind_fraction)
        pos_errs.append(float(np.linalg.norm(blind_dx[:3])))
        det_norms.append(detectable_norm)
    summary[key] = {
        "median_blind_fraction": float(np.median(bfs)),
        "median_blind_pos_err_m": float(np.median(pos_errs)),
        "median_detectable_norm": float(np.median(det_norms)),
    }

reference = {
    "description": (
        "Modelled real-data anchor for src/lunar_common_mode.rs. The Modelled lunar "
        "constellation (user + sats) is fixed; Delta_s is the REAL DE440-vs-INPOP21a / "
        "DE440-vs-EPM2021 geocentric Moon disagreement from ../inter_ephemeris/moon_geo.csv. "
        "Only the parity-projection linear algebra (common_mode_split reproducing this "
        "numpy computation) is checked against an independent numpy implementation; the "
        "row stays Modelled because that oracle is a sibling computation of the same "
        "formula, not an external dataset, and the geometry is Modelled."
    ),
    "source_moon_states": "tests/fixtures/inter_ephemeris/moon_geo.csv (see its NOTICE.md)",
    "pairs": [f"{a}-{b}" for a, b in PAIRS],
    "epochs_per_pair": len(days),
    "round_decimals": DP,
    "constellation": {
        "frame": "Moon-centred, metres; Up=+x, East=+y, North=+z at the user",
        "r_moon_m": R_MOON,
        "slant_range_m": SLANT_M,
        "az_el_deg": AZ_EL_DEG,
        "user": [float(x) for x in USER],
        "sats": [[float(x) for x in s] for s in SATS],
    },
    "records": records,
}

os.makedirs(OUT, exist_ok=True)
with open(os.path.join(OUT, "reference.json"), "w") as f:
    json.dump(reference, f, indent=1)

# ── NOTICE.md ─────────────────────────────────────────────────────────────────────────
notice = f"""# Common-Mode Integrity Anchor — Provenance Notice

This fixture is the evidence behind the **Modelled** verification-matrix row for the
P3 common-mode integrity module
(`src/lunar_common_mode.rs`), reproduced by
`tests/lunar_common_mode_integrity_reference.rs`.

## What is and is not claimed (read carefully)

The check here is that the engine's parity-projection / least-squares
linear algebra (`kshana::lunar_common_mode::common_mode_split`, built on
`geometry_from_los`) reproduces an **independent numpy computation** of the same
common-mode split, to relative error < 1e-3 **and** absolute error < 1e-3 (metres /
dimensionless), on inputs derived from **real** inter-ephemeris data.

The lunar **constellation geometry is Modelled**, not an external oracle:

- **User:** a fixed point on the mean lunar surface, `[{R_MOON:.1f}, 0, 0]` m in a
  Moon-centred frame (Up = +x, East = +y, North = +z at the user).
- **Satellites:** {M} LCNS-like nodes at a {SLANT_M/1e3:.0f} km slant range from the user,
  spread across the visible hemisphere at these (azimuth°, elevation°) in the user's
  local ENU frame: {AZ_EL_DEG}.
- Eight well-spread lines of sight give a full-rank RAIM geometry (dof = {M} − 4 = {M-4}).
  The exact positions are cosmetic: a common-mode translation projects into range(G) for
  **any** full-rank geometry, so `blind_fraction ≈ 1` regardless of these values — that is
  precisely the invariance being demonstrated.

## Real data reused (the only external ingredient)

`Delta_s(t) = pos_A(t) − pos_B(t)` is the **real** geocentric-Moon disagreement between two
independent authoritative ephemerides, read directly from the sampled Moon states in
`../inter_ephemeris/moon_geo.csv`. See that directory's **`NOTICE.md`** for full provenance
(DE440 / JPL, INPOP21a / IMCCE, EPM2021 / IAA RAS; 2024–2025, 2-day cadence, {len(days)}
epochs). This fixture cites and reuses those states; it vendors no new ephemeris data.

Pairs used: `DE440-INPOP21a` and `DE440-EPM2021` (A − B, A = DE440).

## The measurement model

A user mixing the two providers sees a common-mode measurement error on satellite *i*
    `dy_i = e_i · Delta_s(t)`,   `e_i = unit(sat_i − user)`  (`kshana::orbit::los_unit`).
With RAIM rows `g_i = [−e_i, 1]`, a common shift satisfies `dy = G · [−Delta_s ; 0]`
exactly, so it lies in `range(G)`: the parity residual is ~zero and the user absorbs
≈`Delta_s` as a position error.

## Honest headline

The real, ~metre-level inter-ephemeris Moon-position disagreement is absorbed almost
entirely as **user position error** (median blind position error per pair below) with a
**near-zero parity residual** — i.e. it is **invisible to snapshot RAIM/ARAIM**. This is
the correct, known blindness of all snapshot RAIM to `range(G)` errors; the contribution
here is quantifying it on a real inter-ephemeris floor.

| pair | median blind_fraction | median blind position error | median detectable (parity) norm |
|------|----------------------:|----------------------------:|--------------------------------:|
"""
for a, b in PAIRS:
    s = summary[f"{a}-{b}"]
    notice += (
        f"| {a}-{b} | {s['median_blind_fraction']:.6f} | "
        f"{s['median_blind_pos_err_m']:.4f} m | "
        f"{s['median_detectable_norm']:.3e} m |\n"
    )

notice += """
## Byte-consistency

Every position (user, satellites, and each `Delta_s`) is rounded to 6 decimals (1 µm)
**before** being both written to `reference.json` and fed to the numpy oracle; the derived
per-satellite `delta_y` is stored and consumed verbatim by both sides. The Rust test reads
the identical `user`, `sats`, and `delta_y` from `reference.json`, so the only difference
between engine and oracle is the 4×4 linear solver, which agrees far inside 1e-3.

## Regenerate

`.venv/bin/python scripts/gen_common_mode_ref.py` (needs only numpy; reuses the vendored
`../inter_ephemeris/moon_geo.csv`, no kernels or network).

## License note

Published scientific ephemeris positions are factual constants and are not copyrightable;
the reused Moon states are attributed to JPL, IMCCE, and IAA RAS via the inter_ephemeris
NOTICE.md. The Modelled constellation is an original deterministic construction.
"""

with open(os.path.join(OUT, "NOTICE.md"), "w") as f:
    f.write(notice)

# ── console summary ───────────────────────────────────────────────────────────────────
print(f"Modelled constellation: {M} sats @ {SLANT_M/1e3:.0f} km slant, user on surface "
      f"(R_moon={R_MOON:.1f} m).  dof = {M-4}.")
print(f"Real Delta_s from moon_geo.csv, {len(days)} epochs/pair, pairs = "
      f"{[f'{a}-{b}' for a,b in PAIRS]}.\n")
print(f"{'pair':<18}{'median blind_frac':>20}{'median |dx_pos| (m)':>22}{'median detect_norm (m)':>26}")
print("-" * 86)
for a, b in PAIRS:
    s = summary[f"{a}-{b}"]
    print(f"{a+'-'+b:<18}{s['median_blind_fraction']:>20.9f}"
          f"{s['median_blind_pos_err_m']:>22.4f}{s['median_detectable_norm']:>26.3e}")
print(f"\nwrote: {os.path.join(OUT, 'reference.json')}  ({len(records)} records)")
print(f"wrote: {os.path.join(OUT, 'NOTICE.md')}")
