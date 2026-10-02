#!/usr/bin/env python3
"""Oracle side of tests/coverage_dop_full_oracle.rs.

For every design of designs.json:
1. builds the element sets itself (Walker definition, published preset values, explicit
   satellites) and writes elements_<design>.txt;
2. runs java/CoverageOracle.java (Orekit 12.2) for the body-fixed positions, the ground tracks
   and the elevation and azimuth of every satellite at or above the mask at every grid-cell
   centre and epoch (streamed, not stored);
3. computes the per-cell and global maps: DOP from gnss_lib_py 1.0.4 get_dop with a common
   clock, or from a numpy inverse with one clock per constellation; writes maps_<design>.txt.

bodies.txt (the engine's published body constants, an input) is written first by
    KSHANA_WRITE_COVERAGE_INPUTS=1 cargo test --test coverage_dop_full_oracle write_body
Usage:
    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/coverage_dop_full_oracle/make_fixture.py [design ...]
"""
import json
import math
import os
import struct
import subprocess
import sys
import tempfile

import numpy as np
import gnss_lib_py
from gnss_lib_py.navdata.navdata import NavData
from gnss_lib_py.utils.dop import get_dop

HERE = os.path.dirname(os.path.abspath(__file__))
MASK_DEG = 5.0
PDOP_MAX = 6.0
TRACK_POINTS = 24
MAX_TRACKS = 120
TAU = 2.0 * math.pi
D = math.pi / 180.0

# GPS SPS Performance Standard 5th ed. (2020) Table 3.2-1 (slot, RAAN deg, argument of
# latitude deg), as transcribed in the engine's GPS_BASELINE_SLOTS (an input, not re-derived),
# a = 26 559 800 m (Table 3.2-3), i = 55 deg, Greenwich hour angle 100.765 deg.
GPS = [("A1", 288.85, 239.54), ("A2", 288.85, 133.20), ("A3", 288.85, 343.09), ("A4", 288.85, 13.22),
       ("B1", 348.85, 52.37), ("B2", 348.85, 144.75), ("B3", 348.85, 281.39), ("B4", 348.85, 175.79),
       ("C1", 48.85, 83.29), ("C2", 48.85, 343.21), ("C3", 48.85, 311.08), ("C4", 48.85, 212.97),
       ("D1", 108.85, 106.64), ("D2", 108.85, 236.86), ("D3", 108.85, 6.57), ("D4", 108.85, 138.77),
       ("E1", 168.85, 168.46), ("E2", 168.85, 274.01), ("E3", 168.85, 37.48), ("E4", 168.85, 305.10),
       ("F1", 228.85, 210.30), ("F2", 228.85, 316.64), ("F3", 228.85, 76.62), ("F4", 228.85, 106.76)]


def walker(pattern, t, p, f, a, e, i, raan0, argp, m0):
    """Walker i:T/P/F, plane-major: node raan0 + k dOmega, mean anomaly m0 + j 2piP/T + k 2piF/T."""
    d_raan = (TAU if pattern == "delta" else math.pi) / p
    out = []
    for k in range(p):
        for j in range(t // p):
            out.append((a, e, i, (raan0 + k * d_raan) % TAU, argp,
                        (m0 + j * TAU * p / t + k * TAU * f / t) % TAU))
    return out


def preset(name):
    if name == "galileo":  # Galileo OS SDD issue 1.1 Tables 1 and 23
        return walker("delta", 24, 3, 1, 29599801.0, 0.0, 56.0 * D, 317.632 * D, 0.0, 180.153 * D)
    if name == "gps-baseline":
        return [(26559800.0, 0.0, 55.0 * D, ((r - 100.765) * D) % TAU, 0.0, u * D) for _, r, u in GPS]
    if name == "beidou":  # BDS-OS-PS-3.0 section 4.1 with the engine's modelled phase choices
        re = 6378137.0
        out = walker("delta", 24, 3, 1, re + 21528000.0, 0.0, 55.0 * D, 0.0, 0.0, 0.0)
        a = re + 35786000.0
        out += [(a, 0.0, 0.0, 0.0, 0.0, lon * D) for lon in (80.0, 110.5, 140.0)]
        out += [(a, 0.0, 55.0 * D, ((118.0 + 120.0 * k) * D) % TAU, 0.0, (-120.0 * k * D) % TAU)
                for k in range(3)]
        return out
    raise ValueError(name)


def elements(design, re):
    out = []
    for c, cons in enumerate(design["constellation"]):
        els = []
        if "preset" in cons:
            els += preset(cons["preset"])
        for s in cons.get("shell", []):
            a = re + 1000.0 * s["altitude_km"] if "altitude_km" in s else 1000.0 * s["semi_major_axis_km"]
            els += walker(s["pattern"], s["total"], s["planes"], s.get("phasing", 0), a,
                          s.get("eccentricity", 0.0), s["inclination_deg"] * D, s.get("raan0_deg", 0.0) * D,
                          s.get("argp_deg", 0.0) * D, s.get("mean_anomaly0_deg", 0.0) * D)
        for s in cons.get("satellite", []):
            a = re + 1000.0 * s["altitude_km"] if "altitude_km" in s else 1000.0 * s["semi_major_axis_km"]
            els.append((a, s.get("eccentricity", 0.0), s["inclination_deg"] * D, (s.get("raan_deg", 0.0) * D) % TAU,
                        s.get("argp_deg", 0.0) * D, (s.get("mean_anomaly_deg", 0.0) * D) % TAU))
        out += [(c,) + e for e in els]
    return out


def enu_rows(el, az):
    ce = np.cos(el)
    return np.stack([ce * np.sin(az), ce * np.cos(az), np.sin(el)], axis=1)


def read_exact(f, n):
    b = f.read(n)
    if len(b) != n:
        raise EOFError("oracle stream ended early")
    return b


def run(design, bodies, java_dir):
    name = design["name"]
    mu, re, omega = bodies[design["body"]]
    els = elements(design, re)
    cons = np.array([e[0] for e in els])
    ncons = len(design["constellation"])
    per_cons = design["clock"] == "per-constellation"
    with open(os.path.join(HERE, "elements_%s.txt" % name), "w") as fh:
        fh.write("# generator-built elements: cons sat a (m) e i raan argp m0 (rad)\n")
        for k, e in enumerate(els):
            fh.write("%d %d %s\n" % (e[0], k, " ".join("%.17e" % x for x in e[1:])))
    dur, step, gs = design["duration_s"], design["step_s"], design["grid_step_deg"]
    ne = int(math.floor(dur / step + 1e-9))
    epochs = [k * step for k in range(ne)]
    tt = [math.floor(dur * k / (TRACK_POINTS - 1) * 1000.0 + 0.5) / 1000.0 for k in range(TRACK_POINTS)]
    stride = max(-(-len(els) // MAX_TRACKS), 1)
    with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as fh:
        fh.write("%.17e %.17e %.17e %r %r\n" % (mu, re, omega, MASK_DEG, gs))
        fh.write(" ".join(repr(t) for t in epochs) + "\n")
        fh.write(" ".join(repr(t) for t in tt) + "\n")
        fh.write("%d\n" % stride)
        for e in els:
            fh.write("%d %s\n" % (e[0], " ".join("%.17e" % x for x in e[1:])))
        inp = fh.name
    proc = subprocess.Popen(
        ["java", "-Xmx2g", "-cp", java_dir + ":" + os.environ["OREKIT_CP"], "CoverageOracle", inp,
         os.path.join(HERE, "positions_%s.txt" % name), os.path.join(HERE, "tracks_%s.txt" % name)],
        stdout=subprocess.PIPE, bufsize=1 << 20)
    f = proc.stdout
    nla, nlo = int(round(180.0 / gs)), int(round(360.0 / gs))
    lats = [-90.0 + (k + 0.5) * gs for k in range(nla)]
    out = ["# %s on Orekit 12.2 elevation/azimuth; DOP from %s; ilat ilon fix_pct availability_pct "
           "mean_visible min_visible max_visible mean_pdop mean_hdop mean_vdop mean_gdop max_pdop"
           % (name, "numpy %s inverse, one clock per constellation" % np.__version__ if per_cons
              else "gnss_lib_py %s get_dop" % gnss_lib_py.__version__)]
    g_av = g_fix = g_vis = 0.0
    wsum = 0.0
    worst = float("inf")
    gmin = None
    by_cons = np.zeros(ncons)
    for a in range(nla):
        w = max(math.cos(lats[a] * D), 0.0)
        for o in range(nlo):
            wsum += w
            ti, si, el, az, nvis = [], [], [], [], np.zeros(ne, dtype=int)
            for n in range(ne):
                m = struct.unpack(">i", read_exact(f, 4))[0]
                if m:
                    buf = read_exact(f, 20 * m)
                    for j in range(m):
                        s_, e_, z_ = struct.unpack_from(">idd", buf, 20 * j)
                        ti.append(n); si.append(s_); el.append(e_); az.append(z_)
                nvis[n] = m
            ti, si, el, az = np.array(ti, dtype=int), np.array(si, dtype=int), np.array(el), np.array(az)
            for c in range(ncons):
                by_cons[c] += w * np.count_nonzero(cons[si] == c) if len(si) else 0.0
            # Fix decision and DOP per epoch.
            dops = np.full((ne, 4), np.nan)  # pdop hdop vdop gdop
            fix = np.zeros(ne, dtype=bool)
            starts = np.searchsorted(ti, np.arange(ne + 1))
            common_t = []
            for n in range(ne):
                lo, hi = starts[n], starts[n + 1]
                if hi == lo:
                    continue
                u = enu_rows(el[lo:hi], az[lo:hi])
                cs = cons[si[lo:hi]] if per_cons else np.zeros(hi - lo, dtype=int)
                inview = sorted(set(cs.tolist()))
                g = np.zeros((hi - lo, 3 + len(inview)))
                g[:, :3] = -u
                for col, c in enumerate(inview):
                    g[cs == c, 3 + col] = 1.0
                nu = 3 + len(inview)
                if hi - lo < nu or np.linalg.matrix_rank(g) < nu:
                    continue
                fix[n] = True
                if per_cons:
                    q = np.linalg.inv(g.T @ g)
                    pd = math.sqrt(q[0, 0] + q[1, 1] + q[2, 2])
                    td2 = q[3, 3]  # lowest-numbered constellation in view
                    dops[n] = [pd, math.sqrt(q[0, 0] + q[1, 1]), math.sqrt(q[2, 2]), math.sqrt(pd * pd + td2)]
                else:
                    common_t.append(n)
            if common_t:
                sel = np.isin(ti, common_t)
                nav = NavData()
                nav["gps_millis"] = ti[sel].astype(float)
                nav["el_sv_deg"] = np.degrees(el[sel])
                nav["az_sv_deg"] = np.degrees(az[sel])
                dop = get_dop(nav, GDOP=True, PDOP=True, HDOP=True, VDOP=True)
                idx = np.asarray(dop["gps_millis"], dtype=int)
                dops[idx, 0] = np.asarray(dop["PDOP"], dtype=float)
                dops[idx, 1] = np.asarray(dop["HDOP"], dtype=float)
                dops[idx, 2] = np.asarray(dop["VDOP"], dtype=float)
                dops[idx, 3] = np.asarray(dop["GDOP"], dtype=float)
            n_fix = int(fix.sum())
            n_av = int((fix & (dops[:, 0] <= PDOP_MAX)).sum())
            mv = nvis.sum() / ne
            if n_fix:
                means = [float(np.mean(dops[fix, k])) for k in range(4)]
                mx = float(np.max(dops[fix, 0]))
            else:
                means, mx = [float("nan")] * 4, float("nan")
            out.append("%d %d %.17g %.17g %.17g %d %d %s" % (
                a, o, 100.0 * n_fix / ne, 100.0 * n_av / ne, mv, nvis.min(), nvis.max(),
                " ".join("%.17g" % x for x in means + [mx])))
            g_av += w * n_av / ne
            g_fix += w * n_fix / ne
            g_vis += w * nvis.sum() / ne
            worst = min(worst, 100.0 * n_av / ne)
            gmin = int(nvis.min()) if gmin is None else min(gmin, int(nvis.min()))
        if a % 6 == 0:
            print(name, "lat row", a, file=sys.stderr, flush=True)
    if f.read(1):
        raise RuntimeError("oracle stream longer than expected")
    if proc.wait() != 0:
        raise RuntimeError("CoverageOracle failed")
    os.remove(inp)
    out.append("global %.17g %.17g %.17g %.17g %d" % (100.0 * g_av / wsum, 100.0 * g_fix / wsum, worst,
                                                       g_vis / wsum, gmin))
    out.append("bycons " + " ".join("%.17g" % (v / ne / wsum) for v in by_cons))
    with open(os.path.join(HERE, "maps_%s.txt" % name), "w") as fh:
        fh.write("\n".join(out) + "\n")


def main():
    bodies = {}
    with open(os.path.join(HERE, "bodies.txt")) as fh:
        for l in fh:
            if l.strip() and not l.startswith("#"):
                n, mu, re, om = l.split()
                bodies[n] = (float(mu), float(re), float(om))
    designs = json.load(open(os.path.join(HERE, "designs.json")))["designs"]
    only = sys.argv[1:]
    java_dir = tempfile.mkdtemp()
    subprocess.run(["javac", "-cp", os.environ["OREKIT_CP"], "-d", java_dir,
                    os.path.join(HERE, "java", "CoverageOracle.java")], check=True)
    for d in designs:
        if not only or d["name"] in only:
            run(d, bodies, java_dir)


if __name__ == "__main__":
    main()
