#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent oracle for the real-campaign lunar laser ranging datum covariance.

Pre-registered in ``tests/validate_llr_datum_spice_oracle.rs`` (read its header first).

What this script does, without calling anything in Kshana
---------------------------------------------------------
1. Reads the fifteen committed ILRS CRD normal-point files itself (records h2, h3, h4
   and 11): epoch, station, target, two-way time of flight, bin RMS and raw-range count.
2. Reads the committed ITRF2020 station catalogue and the DE430 Table 7 mean-Earth
   reflector catalogue (both are published inputs).
3. Makes each station an SPK ephemeris object: a type-13 (Hermite) segment sampled every
   60 s, position = ITRF2020 position advanced by its ITRF2020 velocity, rotated from
   ITRF93 to J2000 by ``earth_latest_high_prec.bpc`` (state transformation ``sxform``).
4. Computes the two-way light time of every normal point with SPICE's own converged
   light-time solvers: up-leg ``spkcpt`` (reflector as a constant point in ``MOON_ME``,
   station as observer, transmission correction ``XCN`` at the transmit epoch), down-leg
   ``spkcpo`` (reflector as a constant observer at the bounce epoch, station as target,
   ``XCN``). The Moon is DE440 and the lunar orientation is the DE440 principal-axis
   kernel through the ``MOON_ME`` frame of ``moon_de440_250416.tf``.
5. Differentiates that light time with respect to each reflector coordinate by a central
   finite difference (step 100 m).
6. Builds the 15 x 15 information matrix, the Helmert design and the 7 x 7 Helmert matrix
   with numpy and inverts it with ``numpy.linalg.inv`` (LAPACK).

Run (kernels from ``source ~/Code/kshana-oracles/env.sh``):

    $ORACLE_PY tests/fixtures/llr_datum_spice/gen_llr_datum_spice.py

Writes ``reference.txt`` and ``points.csv`` next to this file.
"""

import glob
import hashlib
import math
import os
import sys
import tempfile

import numpy as np
import spiceypy as sp

HERE = os.path.dirname(os.path.abspath(__file__))
LLR = os.path.join(HERE, "..", "lunar_llr")
NAIF = os.environ.get("KSHANA_NAIF_DIR",
                      os.path.join(os.path.expanduser("~"), "Code", "kshana-oracles", "data", "naif"))
KERNELS = ["naif0012.tls", "de440.bsp", "earth_latest_high_prec.bpc",
           "moon_pa_de440_200625.bpc", "moon_de440_250416.tf"]

C = 299792458.0
FD_STEP_M = 100.0
REL_TOL = 1.0e-9
URAD = 1.0e-6
PPM = 1.0e-6
SPK_STEP_S = 60.0


def sha256(path):
    with open(path, "rb") as f:
        return hashlib.sha256(f.read()).hexdigest()


# ---------------------------------------------------------------------------
# Catalogues (published inputs).
# ---------------------------------------------------------------------------

def data_lines(path):
    for line in open(path):
        t = line.strip()
        if t and not t.startswith("#"):
            yield t


def read_reflectors():
    out = []
    rows = list(data_lines(os.path.join(LLR, "de430_retroreflectors_mer.csv")))
    assert rows[0].startswith("array,")
    for t in rows[1:]:
        f = t.split(",")
        out.append({"array": f[0], "target": f[1],
                    "mer_m": np.array([float(f[2]), float(f[3]), float(f[4])])})
    return out


def read_stations():
    epoch = None
    out = []
    rows = list(data_lines(os.path.join(LLR, "itrf2020_llr_stations.csv")))
    for t in rows:
        if t.startswith("position_epoch_year,"):
            epoch = float(t.split(",")[1])
            continue
        if t.startswith("crd_name,"):
            continue
        f = t.split(",")
        out.append({"name": f[0], "id": int(f[1]),
                    "pos_m": np.array([float(f[4]), float(f[5]), float(f[6])]),
                    "vel_m_yr": np.array([float(f[10]), float(f[11]), float(f[12])]),
                    "epoch_year": epoch})
    return out


# ---------------------------------------------------------------------------
# CRD normal points, read here rather than through any Kshana parser.
# ---------------------------------------------------------------------------

def read_points():
    pts = []
    files = sorted(glob.glob(os.path.join(LLR, "normal_points", "*.npt")))
    for path in files:
        name = os.path.basename(path)
        station_id = None
        target = None
        start = None
        start_sod = None
        for raw in open(path):
            f = raw.split()
            if not f:
                continue
            key = f[0].lower()
            if key == "h2":
                station_id = int(f[2])
                assert int(f[5]) in (3, 4, 7), "epoch time scale is a UTC realisation"
            elif key == "h3":
                target = f[1]
            elif key == "h4":
                start = (int(f[2]), int(f[3]), int(f[4]))
                start_sod = int(f[5]) * 3600 + int(f[6]) * 60 + float(f[7])
            elif key == "11":
                sod = float(f[1])
                # A pass that crosses midnight restarts the seconds of day while h4 keeps
                # the start date. Take the day offset (0 or +1) that puts the record nearest
                # the session start. (The first version of this script added a day to any
                # record earlier than the session start; its own pre-stated O-C self-check
                # caught one record 467 s before the start of a session that is listed out
                # of order, which that rule moved by a whole day.)
                day_offset = min((0, 1), key=lambda k: abs(sod + 86400.0 * k - start_sod))
                pts.append({
                    "file": name, "station_id": station_id, "target": target,
                    "date": start, "day_offset": day_offset, "sod": sod,
                    "tof_s": float(f[2]), "epoch_event": int(f[4]),
                    "n_raw": int(f[6]), "bin_rms_ps": float(f[7]),
                })
    return files, pts


def utc_et(p):
    y, m, d = p["date"]
    et0 = sp.str2et("%04d-%02d-%02d 00:00:00 UTC" % (y, m, d))
    # Midnight UTC plus elapsed SI seconds; no leap second falls inside this span.
    return et0 + p["day_offset"] * 86400.0 + p["sod"]


def jd_utc(p):
    y, m, d = p["date"]
    a = (14 - m) // 12
    yy = y + 4800 - a
    mm = m + 12 * a - 3
    jdn = d + (153 * mm + 2) // 5 + 365 * yy + yy // 4 - yy // 100 + yy // 400 - 32045
    return jdn - 0.5 + p["day_offset"] + p["sod"] / 86400.0


# ---------------------------------------------------------------------------
# Station ephemeris objects.
# ---------------------------------------------------------------------------

def station_naif_id(st):
    return 399000 + st["id"] % 1000


def write_station_spk(stations, et0, et1, path):
    handle = sp.spkopn(path, "STATIONS", 0)
    for st in stations:
        n = int(math.ceil((et1 - et0) / SPK_STEP_S)) + 1
        epochs = [et0 + k * SPK_STEP_S for k in range(n)]
        states = []
        for et in epochs:
            # Decimal year of this epoch for the ITRF2020 linear velocity.
            years = 2000.0 + et / (365.25 * 86400.0) - st["epoch_year"]
            pos_km = (st["pos_m"] + st["vel_m_yr"] * years) / 1000.0
            xf = np.array(sp.sxform("ITRF93", "J2000", et))
            s = xf @ np.concatenate([pos_km, np.zeros(3)])
            states.append(list(s))
        sp.spkw13(handle, station_naif_id(st), 399, "J2000", epochs[0], epochs[-1],
                  "ST%d" % st["id"], 7, n, states, epochs)
    sp.spkcls(handle)


# ---------------------------------------------------------------------------
# Light time.
# ---------------------------------------------------------------------------

def two_way(st, refl_m, et_tx):
    sid = str(station_naif_id(st))
    refl_km = list(np.asarray(refl_m) / 1000.0)
    _, lt_up = sp.spkcpt(refl_km, "MOON", "MOON_ME", et_tx, "J2000", "OBSERVER", "XCN", sid)
    et_b = et_tx + lt_up
    _, lt_dn = sp.spkcpo(sid, et_b, "J2000", "OBSERVER", "XCN", refl_km, "MOON", "MOON_ME")
    return lt_up + lt_dn, et_b


def station_direction_me(st, et_tx, et_b):
    sid = str(station_naif_id(st))
    r_sta, _ = sp.spkpos(sid, et_tx, "J2000", "NONE", "EARTH")
    r_moon, _ = sp.spkpos("MOON", et_b, "J2000", "NONE", "EARTH")
    v = np.array(r_sta) - np.array(r_moon)
    m = np.array(sp.pxform("J2000", "MOON_ME", et_b))
    d = m @ v
    return d / np.linalg.norm(d)


# ---------------------------------------------------------------------------
# Linear algebra (P2).
# ---------------------------------------------------------------------------

def helmert_design(points_m):
    a = np.zeros((3 * len(points_m), 7))
    for i, p in enumerate(points_m):
        r = 3 * i
        a[r:r + 3, 0:3] = np.eye(3)
        # d(theta x p)/d(theta) = -[p]x  (sign convention is immaterial to the sigmas).
        px = np.array([[0.0, -p[2], p[1]], [p[2], 0.0, -p[0]], [-p[1], p[0], 0.0]])
        a[r:r + 3, 3:6] = -px * URAD
        a[r:r + 3, 6] = p * PPM
    return a


def rank_and_condition(mat):
    ev = np.linalg.eigvalsh(mat)
    lmax = ev.max()
    obs = ev[ev > REL_TOL * lmax]
    return len(obs), lmax / obs.min(), ev


def main():
    for k in KERNELS:
        sp.furnsh(os.path.join(NAIF, k))
    reflectors = read_reflectors()
    stations = read_stations()
    files, pts = read_points()

    n_parsed = len(pts)
    used, skipped_station, skipped_target, skipped_event, skipped_prec = [], 0, 0, 0, 0
    for p in pts:
        st = next((s for s in stations if s["id"] == p["station_id"]), None)
        if st is None:
            skipped_station += 1
            continue
        ri = next((i for i, r in enumerate(reflectors) if r["target"] == p["target"]), None)
        if ri is None:
            skipped_target += 1
            continue
        if p["epoch_event"] != 2:
            skipped_event += 1
            continue
        if not (p["bin_rms_ps"] > 0 and p["n_raw"] > 0):
            skipped_prec += 1
            continue
        used.append((p, st, ri))

    ets = [utc_et(p) for p, _, _ in used]
    tmp = tempfile.mkdtemp()
    spk = os.path.join(tmp, "stations.bsp")
    write_station_spk(stations, min(ets) - 3600.0, max(ets) + 3600.0, spk)
    sp.furnsh(spk)

    dim = 3 * len(reflectors)
    info = np.zeros((dim, dim))
    rows = []
    dirs = [[] for _ in reflectors]
    for (p, st, ri), et in zip(used, ets):
        p0 = reflectors[ri]["mer_m"]
        tof, et_b = two_way(st, p0, et)
        g = np.zeros(3)
        for k in range(3):
            e = np.zeros(3)
            e[k] = FD_STEP_M
            tp, _ = two_way(st, p0 + e, et)
            tm, _ = two_way(st, p0 - e, et)
            g[k] = (tp - tm) / (2.0 * FD_STEP_M)
        sigma = p["bin_rms_ps"] * 1.0e-12 / math.sqrt(p["n_raw"])
        w = 1.0 / (sigma * sigma)
        j = np.zeros(dim)
        j[3 * ri:3 * ri + 3] = g
        info += w * np.outer(j, j)
        dirs[ri].append((w, station_direction_me(st, et, et_b)))
        rows.append((p, st, ri, tof, g, sigma))

    # Reflector information.
    rank_b, cond_b, _ = rank_and_condition(info)
    offblock = 0.0
    for i in range(dim):
        for k in range(dim):
            if i // 3 != k // 3:
                offblock = max(offblock, abs(info[i, k]))
    cov_b = np.linalg.inv(info)

    # Helmert datum.
    a = helmert_design([r["mer_m"] for r in reflectors])
    h = a.T @ info @ a
    rank_h, cond_h, ev_h = rank_and_condition(h)
    cov_h = np.linalg.inv(h)
    sig = np.sqrt(np.diag(cov_h))
    t_norm = math.sqrt(sig[0] ** 2 + sig[1] ** 2 + sig[2] ** 2)
    r_norm = math.sqrt(sig[3] ** 2 + sig[4] ** 2 + sig[5] ** 2) * URAD
    s_ppb = sig[6] * 1.0e3

    # Per-array along/across.
    per = []
    for i, r in enumerate(reflectors):
        d = sum(v for _, v in dirs[i])
        d = d / np.linalg.norm(d)
        blk = cov_b[3 * i:3 * i + 3, 3 * i:3 * i + 3]
        along = math.sqrt(max(d @ blk @ d, 0.0))
        across = math.sqrt(max((np.trace(blk) - along ** 2) / 2.0, 0.0))
        per.append((r["target"], len(dirs[i]), along, across, across / along))

    # Oracle self-check: its own observed-minus-computed.
    oc = np.array([0.5 * C * (p["tof_s"] - tof) for p, _, _, tof, _, _ in rows])
    oc_rms = float(np.sqrt(np.mean(oc ** 2)))

    out = os.path.join(HERE, "reference.txt")
    with open(out, "w") as f:
        f.write("# Independent oracle for tests/validate_llr_datum_spice_oracle.rs\n")
        f.write("# generator: gen_llr_datum_spice.py\n")
        f.write("# spiceypy %s, CSPICE %s, numpy %s\n" % (sp.__version__, sp.tkvrsn("TOOLKIT"), np.__version__))
        for k in KERNELS:
            f.write("# kernel %s sha256 %s\n" % (k, sha256(os.path.join(NAIF, k))))
        f.write("# fd_step_m %g; rel_tol %g\n" % (FD_STEP_M, REL_TOL))
        f.write("parsed %d\nused %d\nskipped_station %d\nskipped_target %d\n"
                "skipped_epoch_event %d\nskipped_precision %d\n"
                % (n_parsed, len(rows), skipped_station, skipped_target, skipped_event, skipped_prec))
        f.write("reflector_rank %d\nreflector_dim %d\nreflector_offblock_max %.17e\n"
                % (rank_b, dim, offblock))
        f.write("helmert_rank %d\nhelmert_condition %.17e\n" % (rank_h, cond_h))
        for k, name in enumerate(["tx", "ty", "tz", "theta_x", "theta_y", "theta_z", "scale"]):
            f.write("sigma %s %.17e\n" % (name, sig[k]))
        f.write("translation_sigma_norm_m %.17e\n" % t_norm)
        f.write("rotation_sigma_norm_rad %.17e\n" % r_norm)
        f.write("scale_sigma_ppb %.17e\n" % s_ppb)
        for t, n, along, across, ratio in per:
            f.write("array %s %d %.17e %.17e %.17e\n" % (t, n, along, across, ratio))
        f.write("oracle_oc_rms_m %.17e\n" % oc_rms)
        f.write("oracle_oc_mean_m %.17e\n" % float(np.mean(oc)))
    with open(os.path.join(HERE, "points.csv"), "w") as f:
        f.write("# per used normal point: oracle-parsed epoch and time of flight, SPICE two-way "
                "light time and its finite-difference partial (s/m, MOON_ME axes)\n")
        f.write("file,station_id,target,jd_utc,tof_observed_s,tof_spice_s,sigma_two_way_s,"
                "d_x,d_y,d_z\n")
        for p, st, ri, tof, g, sigma in rows:
            f.write("%s,%d,%s,%.12f,%.15e,%.15e,%.10e,%.15e,%.15e,%.15e\n"
                    % (p["file"], p["station_id"], p["target"], jd_utc(p), p["tof_s"], tof,
                       sigma, g[0], g[1], g[2]))
    print("used %d, oracle O-C rms %.3f m, translation sigma %.6e m, cond %.4e"
          % (len(rows), oc_rms, t_norm, cond_h))


if __name__ == "__main__":
    sys.exit(main())
