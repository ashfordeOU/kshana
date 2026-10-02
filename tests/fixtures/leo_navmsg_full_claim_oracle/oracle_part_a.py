#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Internal cross-check for Part A of tests/leo_navmsg_full_claim_oracle.rs (M120 round 2).

Written in this repository; it re-evaluates Kshana's closed forms and is not an independent
oracle (see the amendment in the test file's header).

Written from the Galileo OS SIS ICD user algorithm (Keplerian position with the harmonic
corrections, the relativistic clock term F e sqrt(A) sin E, F = -4.442807309e-10 s/sqrt(m),
mu = 3.986004418e14, Earth rotation 7.2921151467e-5 rad/s) and the module's documented model
(correction polynomials along/cross/radial in tau = tk / tau_s in the Keplerian point's frame;
SISRE = sqrt(w_R^2 R^2 + w_AC^2 (A^2 + C^2)) and with clock sqrt((w_R R - c dt)^2 + ...), the
error projected on the truth's radial / orbit-normal / along frame built from the Earth-fixed
position and the inertial-sense velocity). It reads only Kshana's exported messages and the
truth files, and uses numpy (BSD-3-Clause) least squares for the refits.

Usage: oracle_part_a.py > oracle_part_a.json
"""
import json
import math
import sys
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
MU, OME, F, C = 3.986004418e14, 7.2921151467e-5, -4.442807309e-10, 299792458.0
WEEK0, TOW0 = 2295, 86400.0


def load_csv(path, ncol):
    rows = [ln.split(",") for ln in open(path) if ln[0] != "#" and ln.strip()]
    return np.array([[float(x) for x in r[:ncol]] for r in rows])


orb = load_csv(HERE.parent / "leo_navmsg_fit_real_orbit_oracle" / "grace_c_2024-01-01.csv", 7)
clk = load_csv(HERE / "grace_c_clock_2024-01-01.csv", 2)
doc = json.load(open(HERE / "kshana_messages.json"))


def idx(week, tow):
    """Grid index of a GPS instant (all instants used here lie on the 10 s grid)."""
    s = (week - WEEK0) * 604800.0 + tow - TOW0
    k = round(s / 10.0)
    assert abs(s - 10.0 * k) < 1e-6, s
    return k


def truth(k):
    r = orb[k, 1:4]
    v = orb[k, 4:7]
    vi = v + np.array([-OME * r[1], OME * r[0], 0.0])
    rad = r / np.linalg.norm(r)
    crs = np.cross(r, vi)
    crs /= np.linalg.norm(crs)
    alg = np.cross(crs, rad)
    return r, (alg, crs, rad)


def kepler(k, tk):
    a = k["sqrt_a"] ** 2
    n = math.sqrt(MU / a ** 3) + k["delta_n"]
    m = k["m0"] + n * tk
    e = k["e"]
    E = m
    for _ in range(50):
        E -= (E - e * math.sin(E) - m) / (1 - e * math.cos(E))
    nu = math.atan2(math.sqrt(1 - e * e) * math.sin(E), math.cos(E) - e)
    phi = nu + k["omega"]
    u = phi + k["cus"] * math.sin(2 * phi) + k["cuc"] * math.cos(2 * phi)
    r = a * (1 - e * math.cos(E)) + k["crs"] * math.sin(2 * phi) + k["crc"] * math.cos(2 * phi)
    i = k["i0"] + k["i_dot"] * tk + k["cis"] * math.sin(2 * phi) + k["cic"] * math.cos(2 * phi)
    om = k["omega0"] + (k["omega_dot"] - OME) * tk - OME * k["toe"]
    co, so, ci, si, cu, su = math.cos(om), math.sin(om), math.cos(i), math.sin(i), math.cos(u), math.sin(u)
    # Rotation from the orbital frame (x to the satellite, y along, z normal) to Earth-fixed.
    R = np.array([[co, -so * ci, so * si], [so, co * ci, -co * si], [0.0, si, ci]])
    p_orb = np.array([cu, su, 0.0])
    a_orb = np.array([-su, cu, 0.0])
    pos = r * (R @ p_orb)
    frame = (R @ a_orb, R @ np.array([0.0, 0.0, 1.0]), R @ p_orb)
    rel = F * e * k["sqrt_a"] * math.sin(E)
    return pos, frame, rel


def tk_of(week, tow, msg_week, toe):
    return (week - msg_week) * 604800.0 + tow - toe


def add(week, tow, ds):
    tow += ds
    while tow >= 604800.0:
        tow -= 604800.0
        week += 1
    while tow < 0:
        tow += 604800.0
        week -= 1
    return week, tow


def msg_state(m, week, tow):
    eph = m["ephemeris"]
    kp = eph["kepler"]
    tk = tk_of(week, tow, m["week"], kp["toe"])
    pos, fr, rel = kepler(kp, tk)
    if eph["model"] == "kepler-rac":
        rac = eph["rac"]
        tau = tk / rac["tau_s"]
        pv = lambda c: sum(cc * tau ** j for j, cc in enumerate(c))
        pos = pos + pv(rac["along"]) * fr[0] + pv(rac["cross"]) * fr[1] + pv(rac["radial"]) * fr[2]
    c = m["clock"]
    dt = tk_of(week, tow, m["week"], c["toc"])
    return pos, c["af0"] + c["af1"] * dt + c["af2"] * dt * dt + rel


w_r, w_ac2 = doc["w_r"], doc["w_ac2"]
out = {"runs": []}
for run in doc["runs"]:
    model, interval, period = run["label"].split()
    interval, period = float(interval), float(period)
    acc = dict(a2=0.0, c2=0.0, r2=0.0, k2=0.0, o2=0.0, s2=0.0, n=0)
    msgs_out = []
    for mi, m in enumerate(run["messages"]):
        use_w, use_t = add(WEEK0, TOW0, doc["start_s"] + mi * period)
        fit_w, fit_t = add(use_w, use_t, -(interval - period) / 2.0)
        ns = max(round(interval / doc["sample_s"]), 2)
        samples = [add(fit_w, fit_t, interval * j / ns) for j in range(ns + 1)]
        kp = m["ephemeris"]["kepler"]
        mo = {}
        if model == "kepler-rac":
            rac = m["ephemeris"]["rac"]
            taus, res = [], []
            for (wk, tw) in samples:
                tk = tk_of(wk, tw, m["week"], kp["toe"])
                pos, fr, _ = kepler(kp, tk)
                d = truth(idx(wk, tw))[0] - pos
                res.append([d @ fr[0], d @ fr[1], d @ fr[2]])
                taus.append(tk / rac["tau_s"])
            taus, res = np.array(taus), np.array(res)
            for ci, name in enumerate(("along", "cross", "radial")):
                deg = len(rac[name]) - 1
                A = np.vander(taus, deg + 1, increasing=True)
                mo[name] = np.linalg.lstsq(A, res[:, ci], rcond=None)[0].tolist()
        c = m["clock"]
        dts, ys = [], []
        for (wk, tw) in samples:
            tk = tk_of(wk, tw, m["week"], kp["toe"])
            _, _, rel = kepler(kp, tk)
            dts.append(tk_of(wk, tw, m["week"], c["toc"]))
            ys.append(clk[idx(wk, tw), 1] - rel)
        dts = np.array(dts)
        # Centre and scale for conditioning, then map back to powers of (t - toc).
        s = 1000.0
        A = np.vander(dts / s, 3, increasing=True)
        b = np.linalg.lstsq(A, np.array(ys), rcond=None)[0]
        mo["clock"] = [b[0], b[1] / s, b[2] / (s * s)]
        msgs_out.append(mo)
        nev = max(round(period / doc["eval_step_s"]), 1)
        for j in range(nev):
            wk, tw = add(use_w, use_t, period * j / nev)
            k = idx(wk, tw)
            r_true, fr = truth(k)
            pos, cm = msg_state(m, wk, tw)
            d = pos - r_true
            a, cc, rr = d @ fr[0], d @ fr[1], d @ fr[2]
            ck = (cm - clk[k, 1]) * C
            acc["a2"] += a * a
            acc["c2"] += cc * cc
            acc["r2"] += rr * rr
            acc["k2"] += ck * ck
            acc["o2"] += w_r * w_r * rr * rr + w_ac2 * (a * a + cc * cc)
            acc["s2"] += (w_r * rr - ck) ** 2 + w_ac2 * (a * a + cc * cc)
            acc["n"] += 1
    n = acc["n"]
    stats = {
        "along_rms_m": math.sqrt(acc["a2"] / n), "cross_rms_m": math.sqrt(acc["c2"] / n),
        "radial_rms_m": math.sqrt(acc["r2"] / n), "clock_rms_m": math.sqrt(acc["k2"] / n),
        "sisre_orb_rms_m": math.sqrt(acc["o2"] / n), "sisre_rms_m": math.sqrt(acc["s2"] / n), "n": n,
    }
    print(run["label"], stats, file=sys.stderr)
    out["runs"].append({"label": run["label"], "stats": stats, "messages": msgs_out})
json.dump(out, sys.stdout)
