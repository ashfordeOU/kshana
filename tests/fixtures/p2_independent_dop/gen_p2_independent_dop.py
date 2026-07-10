#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent DOP oracle for the three P2 (surface-beacon-DOP) paper claims.

The P2 paper reports three aggregate products over an *illustrative, public-source*
lunar navigation constellation:

  1. a satellite-count sweep N = 4..24 (median GDOP / time-below-GDOP-6),
  2. a spatial GDOP + availability map over a selenographic grid, and
  3. a beacon before/after GDOP table for a -80 deg south-polar user.

Those aggregates rest on a *specific GDOP number per configuration*. This generator
recomputes each of those GDOP numbers FROM SCRATCH, in numpy, as an INDEPENDENT
oracle — a genuinely different code path from Kshana's Rust ``orbit::dop`` /
``pvt::gdop``. The technique is identical to ``tests/dop_reference.rs`` (which cross-
checks the DOP kernel against gnss_lib_py): a fully-specified line-of-sight geometry
is fed into an independent DOP implementation and Kshana must reproduce the number.

Non-circular boundary
---------------------
* The *geometry* (per-source line-of-sight unit vectors, and the user's East-North-Up
  basis) is taken from Kshana's own public API (dumped by the companion Rust example
  ``examples/gen_p2_independent_dop_geometry.rs``). This is legitimate and exactly
  what ``dop_reference.rs`` does: the geometry/propagation is a SEPARATE, already-
  Validated claim; here we validate the DOP *number* for that geometry.
* The *DOP arithmetic* is recomputed here in numpy, independent of Kshana:
  each source contributes a design-matrix row ``[-e_x, -e_y, -e_z, 1]`` (unit LOS
  plus clock term); the cofactor matrix is ``Q = (HᵀH)⁻¹``; and
  ``GDOP = sqrt(tr Q)``, ``PDOP = sqrt(Q00+Q11+Q22)``, ``TDOP = sqrt(Q33)``.
  HDOP/VDOP are the horizontal/vertical split of the 3x3 position block projected
  onto the user's ENU basis: ``HDOP = sqrt(eᵀ Qp e + nᵀ Qp n)``, ``VDOP = sqrt(uᵀ Qp u)``.
  This numpy ``np.linalg.inv`` path is independent of Kshana's hand-rolled 4x4
  Gauss-Jordan inversion, so agreement is a real cross-check.

Reproduce (offline; needs only numpy — no Kshana at runtime for the Rust tests):

    cargo run --example gen_p2_independent_dop_geometry     # dump geometry from Kshana
    python3 tests/fixtures/p2_independent_dop/gen_p2_independent_dop.py

Generated with numpy (np.linalg). See NOTICE for provenance.
"""

import os
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
GDOP6 = 6.0  # usable-geometry threshold


def parse_los(field):
    """Parse 'x:y:z|x:y:z|...' into an (n,3) float array of LOS unit vectors."""
    rows = []
    for tok in field.split("|"):
        x, y, z = (float(v) for v in tok.split(":"))
        rows.append((x, y, z))
    return np.asarray(rows, dtype=float)


def parse_enu(field):
    """Parse 'ex:ey:ez:nx:ny:nz:ux:uy:uz' into (east, north, up) unit vectors."""
    vals = [float(v) for v in field.split(":")]
    e = np.asarray(vals[0:3], dtype=float)
    n = np.asarray(vals[3:6], dtype=float)
    u = np.asarray(vals[6:9], dtype=float)
    return e, n, u


def dop_from_los(los, east, north, up):
    """Independent GDOP/PDOP/HDOP/VDOP/TDOP from LOS unit vectors + ENU basis.

    Mirrors Kshana's convention exactly (row [-e, 1]; Q=(HᵀH)⁻¹; ENU split of the
    position block) but via a numpy code path (np.linalg.inv), so the number is an
    independent cross-check of Kshana's Rust kernel — NOT a re-use of it.
    """
    n = los.shape[0]
    h = np.empty((n, 4), dtype=float)
    h[:, 0:3] = -los            # [-e_x, -e_y, -e_z]
    h[:, 3] = 1.0               # clock term
    q = np.linalg.inv(h.T @ h)  # cofactor matrix (HᵀH)⁻¹
    qp = q[0:3, 0:3]            # position block
    pdop = np.sqrt(qp.trace())
    tdop = np.sqrt(q[3, 3])
    gdop = np.sqrt(q.trace())
    # Variance along a unit direction v in the position block: vᵀ Qp v.
    var_e = float(east @ qp @ east)
    var_n = float(north @ qp @ north)
    var_u = float(up @ qp @ up)
    hdop = np.sqrt(max(var_e, 0.0) + max(var_n, 0.0))
    vdop = np.sqrt(max(var_u, 0.0))
    return float(gdop), float(pdop), float(hdop), float(vdop), float(tdop)


# ---------------------------------------------------------------------------
# Config 1 — satellite-count sweep (median GDOP / time-below-6).
# ---------------------------------------------------------------------------
def gen_nsweep():
    src = os.path.join(HERE, "nsweep_geometry.txt")
    # Per N: list of per-sample GDOP (independent) + Kshana's aggregate row.
    per_n_samples = {}   # N -> list of (cell,epoch,gdop_indep,pdop_indep,gdop_kshana)
    per_n_agg = {}       # N -> (gdop_median_kshana, frac_below6_kshana, cov_kshana, n_total)
    with open(src) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            c = line.split(";")
            if c[0] == "SAMPLE":
                n = int(c[1])
                ci, ti = int(c[2]), int(c[3])
                g_k = float(c[5])
                los = parse_los(c[9])
                e, nn, u = parse_enu(c[10])
                g_i, p_i, _, _, _ = dop_from_los(los, e, nn, u)
                per_n_samples.setdefault(n, []).append((ci, ti, g_i, p_i, g_k))
            elif c[0] == "AGG":
                n = int(c[1])
                gm = float(c[2]) if c[2] else None
                per_n_agg[n] = (gm, float(c[3]), float(c[4]), int(c[5]))

    # Write per-sample reference CSV: one row per (N,cell,epoch) sample with the
    # committed LOS, ENU, and the numpy reference GDOP/PDOP/HDOP/VDOP.
    # (Re-read the file to keep the full LOS/ENU strings verbatim for the fixture.)
    sample_rows = []
    agg_rows = []
    with open(src) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            c = line.split(";")
            if c[0] != "SAMPLE":
                continue
            n = int(c[1])
            ci, ti = int(c[2]), int(c[3])
            n_vis = int(c[4])
            los = parse_los(c[9])
            e, nn, u = parse_enu(c[10])
            g_i, p_i, h_i, v_i, t_i = dop_from_los(los, e, nn, u)
            sample_rows.append(
                f"{n},{ci},{ti},{n_vis},{g_i:.17e},{p_i:.17e},{h_i:.17e},{v_i:.17e},{c[9]},{c[10]}"
            )

    # Independent aggregate order statistics per N.
    for n in sorted(per_n_agg):
        gm_k, fb_k, cov_k, n_total = per_n_agg[n]
        samples = per_n_samples[n]
        gdops = sorted(g for (_, _, g, _, _) in samples)
        pdops = [p for (_, _, _, p, _) in samples]
        # median over defined-DOP samples (matches Kshana: mean of the two middle
        # values for an even count, exact order stat otherwise).
        m = len(gdops)
        if m == 0:
            med = ""
        elif m % 2 == 0:
            med = f"{0.5 * (gdops[m // 2 - 1] + gdops[m // 2]):.17e}"
        else:
            med = f"{gdops[m // 2]:.17e}"
        # frac below 6: count of defined-DOP samples with GDOP < 6, over ALL samples.
        n_below = sum(1 for g in gdops if g < GDOP6)
        frac_below = n_below / n_total
        # coverage: count of samples with PDOP < 6 (>=4 vis already), over ALL samples.
        n_cov = sum(1 for p in pdops if p < GDOP6)
        cov = n_cov / n_total
        agg_rows.append(f"{n},{med},{frac_below:.17e},{cov:.17e},{n_total},{len(samples)}")

    with open(os.path.join(HERE, "nsweep_samples_reference.csv"), "w") as f:
        f.write("# P2 satellite-count-sweep — INDEPENDENT numpy per-sample DOP reference.\n")
        f.write("# Oracle: numpy np.linalg.inv (HᵀH)⁻¹ — independent of Kshana's Rust kernel.\n")
        f.write("# N,cell_idx,epoch_idx,n_vis,ref_gdop,ref_pdop,ref_hdop,ref_vdop,los(x:y:z|...),enu(ex:..:uz)\n")
        f.write("\n".join(sample_rows) + "\n")
    with open(os.path.join(HERE, "nsweep_aggregate_reference.csv"), "w") as f:
        f.write("# P2 satellite-count-sweep — INDEPENDENT numpy aggregate order statistics.\n")
        f.write("# median GDOP + time-below-GDOP-6 + coverage(PDOP<6), computed over the numpy per-sample series.\n")
        f.write("# N,ref_gdop_median,ref_frac_below_gdop6,ref_coverage_fraction,n_samples_total,n_defined_dop\n")
        f.write("\n".join(agg_rows) + "\n")

    return len(sample_rows), len(agg_rows)


# ---------------------------------------------------------------------------
# Config 2 — spatial GDOP map (6-sat).
# ---------------------------------------------------------------------------
def gen_spatial_map():
    src = os.path.join(HERE, "spatial_map_geometry.txt")
    rows = []
    with open(src) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            c = line.split(";")
            if c[0] != "CELL":
                continue
            lat, lon = c[1], c[2]
            ti = int(c[3])
            n_vis = int(c[4])
            los = parse_los(c[8])
            e, nn, u = parse_enu(c[9])
            g_i, p_i, h_i, v_i, t_i = dop_from_los(los, e, nn, u)
            rows.append(
                f"{lat},{lon},{ti},{n_vis},{g_i:.17e},{h_i:.17e},{v_i:.17e},{c[8]},{c[9]}"
            )
    with open(os.path.join(HERE, "spatial_map_reference.csv"), "w") as f:
        f.write("# P2 spatial GDOP map (6-sat) — INDEPENDENT numpy per-cell/per-epoch DOP reference.\n")
        f.write("# Oracle: numpy np.linalg.inv (HᵀH)⁻¹ — independent of Kshana's Rust kernel.\n")
        f.write("# lat_deg,lon_deg,epoch_idx,n_vis,ref_gdop,ref_hdop,ref_vdop,los(x:y:z|...),enu(ex:..:uz)\n")
        f.write("\n".join(rows) + "\n")
    return len(rows)


# ---------------------------------------------------------------------------
# Config 3 — beacon before/after (-80 deg user).
# ---------------------------------------------------------------------------
def gen_beacon():
    src = os.path.join(HERE, "beacon_before_after_geometry.txt")
    rows = []
    vals = {}
    with open(src) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            c = line.split(";")
            if c[0] != "CONFIG":
                continue
            label = c[1]
            n_src = int(c[2])
            los = parse_los(c[6])
            e, nn, u = parse_enu(c[7])
            g_i, p_i, h_i, v_i, t_i = dop_from_los(los, e, nn, u)
            vals[label] = g_i
            rows.append(
                f"{label},{n_src},{g_i:.17e},{h_i:.17e},{v_i:.17e},{c[6]},{c[7]}"
            )
    # Independent before/after ratio.
    ratio = vals["sats_only"] / vals["sats_plus_beacons"]
    with open(os.path.join(HERE, "beacon_before_after_reference.csv"), "w") as f:
        f.write("# P2 beacon before/after (-80 deg user) — INDEPENDENT numpy DOP reference.\n")
        f.write("# Oracle: numpy np.linalg.inv (HᵀH)⁻¹ — independent of Kshana's Rust kernel.\n")
        f.write(f"# independent GDOP improvement ratio (sats_only / sats_plus_beacons) = {ratio:.9f}\n")
        f.write("# label,n_src,ref_gdop,ref_hdop,ref_vdop,los(x:y:z|...),enu(ex:..:uz)\n")
        f.write("\n".join(rows) + "\n")
    return len(rows), ratio


def main():
    ns, na = gen_nsweep()
    nc = gen_spatial_map()
    nb, ratio = gen_beacon()
    print(f"nsweep: {ns} per-sample rows, {na} aggregate rows")
    print(f"spatial_map: {nc} per-cell/epoch rows")
    print(f"beacon: {nb} rows; independent before/after ratio = {ratio:.6f}")


if __name__ == "__main__":
    main()
