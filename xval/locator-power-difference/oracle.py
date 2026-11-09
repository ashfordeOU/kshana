# SPDX-License-Identifier: AGPL-3.0-only
"""Independent recomputation of the B3a posterior (README reading 15). numpy and the standard
library only; shares no code with the engine.

    python3 -I oracle.py INPUT.json ANSWER.json

INPUT is `locate_pd_gate json SEED`, ANSWER is `locate_pd_gate answer SEED`. Prints whether the
grid, the 50/90/95 % region cells and the centroid (within 1 m) agree.

Version 2 (readings V2 to V7, V15): when the input's parameters carry `session_shadowing`, give it
`json2 SEED` and `answer2 SEED`. It recomputes the per-station session means, the more-than-half
rule, sigma_tot, the weighted P0 and the not-located case on its own.
"""
import json
import math
import sys

import numpy as np

HORIZON = 4.1219


def hull(pts):
    pts = sorted(set(pts))
    if len(pts) < 3:
        return pts

    def cr(o, a, b):
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])

    lo, up = [], []
    for p in pts:
        while len(lo) >= 2 and cr(lo[-2], lo[-1], p) <= 0:
            lo.pop()
        lo.append(p)
    for p in reversed(pts):
        while len(up) >= 2 and cr(up[-2], up[-1], p) <= 0:
            up.pop()
        up.append(p)
    return lo[:-1] + up[:-1]


def hull_dist(h, p):
    def seg(p, a, b):
        dx, dy = b[0] - a[0], b[1] - a[1]
        l2 = dx * dx + dy * dy
        t = min(1.0, max(0.0, ((p[0] - a[0]) * dx + (p[1] - a[1]) * dy) / l2)) if l2 > 0 else 0.0
        return math.hypot(a[0] + t * dx - p[0], a[1] + t * dy - p[1])

    n = len(h)
    if all((h[(k + 1) % n][0] - h[k][0]) * (p[1] - h[k][1]) - (h[(k + 1) % n][1] - h[k][1]) * (p[0] - h[k][0]) >= 0
           for k in range(n)):
        return 0.0
    return min(seg(p, h[k], h[(k + 1) % n]) for k in range(n))


def norm_logcdf(z):
    c = 0.5 * math.erfc(-z / math.sqrt(2.0))
    if c > 1e-300:
        return math.log(c)
    return -0.5 * z * z - 0.5 * math.log(2 * math.pi) - math.log(-z)


def epoch_powers(P, st, e, j_drop, wc, wa):
    """One epoch's power estimate per station (readings 2 to 4); None where it does not report."""
    js = []
    for i, s in enumerate(st):
        dr, ag = e["drop_db"][i], e["dagc"][i]
        if dr is None or dr < P["gate_db"]:
            js.append(None)
            continue
        jc = j_drop(s["c_nom_dbhz"], dr)
        if s["kappa_db"] is not None and ag is not None and ag * s["kappa_db"] > 0:
            ja = s["noise_dbw"] + 10 * math.log10(max(10 ** (ag * s["kappa_db"] / 10) - 1, 1e-300))
            jc = (jc * wc + ja * wa) / (wc + wa)
        js.append(jc)
    return js


def v2_loglik(P, st, epochs, geo, gain, jmin, j_drop, wc, wa):
    """Version 2's session log-likelihood per (h, n) hypothesis and cell (V2 to V7), or None when
    fewer than min_reporting stations report in more than half of the session."""
    per = [epoch_powers(P, st, e, j_drop, wc, wa) for e in epochs]
    E = len(per)
    jbar, sig = [], []
    for i in range(len(st)):
        vals = [row[i] for row in per if row[i] is not None]
        reporting = len(vals) > P["report_share"] * E
        n = len(vals) if reporting else max(E, 1)
        sig.append(math.sqrt(P["sigma_sh_db"] ** 2 + P["sigma_meas_db"] ** 2 / n))
        jbar.append(sum(vals) / len(vals) if reporting else None)
    rep = np.array([x is not None for x in jbar])
    if rep.sum() < P["min_reporting"]:
        return None
    jv = np.array([x if x is not None else 0.0 for x in jbar])
    sg = np.array(sig)
    w = np.where(rep, 1 / sg ** 2, 0.0)
    terms = []
    for logd, loss in geo:
        for n in P["n_set"]:
            r = jv[None, :] + 10 * n * logd - gain[None, :] + loss
            p0 = (r * w[None, :]).sum(axis=1) / w.sum()
            pred = p0[:, None] - 10 * n * logd + gain[None, :] - loss
            z = (jv[None, :] - pred) / sg[None, :]
            ll = np.where(rep[None, :], -0.5 * z * z, 0.0).sum(axis=1)
            zc = (jmin[None, :] - pred) / sg[None, :]
            ll += np.where(rep[None, :], 0.0, np.vectorize(norm_logcdf)(zc)).sum(axis=1)
            terms.append(ll)
    return np.array(terms)


def main(inp, ans):
    d = json.load(open(inp))
    a = json.load(open(ans))
    P = d["params"]
    st = d["stations"]
    pts = [(s["east_km"], s["north_km"]) for s in st]
    h = hull(pts)
    b = P["buffer_km"]
    x0, y0 = min(p[0] for p in pts) - b, min(p[1] for p in pts) - b
    x1, y1 = max(p[0] for p in pts) + b, max(p[1] for p in pts) + b
    cell = P["cell_km"]
    while True:
        nx, ny = math.ceil((x1 - x0) / cell), math.ceil((y1 - y0) / cell)
        cen = [(x0 + (i + 0.5) * cell, y0 + (j + 0.5) * cell) for j in range(ny) for i in range(nx)]
        cen = [c for c in cen if hull_dist(h, c) <= b]
        if len(cen) <= P["max_cells"]:
            break
        cell *= 2
    C = np.array(cen)
    S = np.array(pts)
    ha = np.array([s["antenna_h_m"] for s in st])
    gain = np.array([s["gain_dbi"] for s in st])

    def j_drop(cnom, drop):
        js = P["q"] * P["chip_rate_hz"] * (1 / 10 ** ((cnom - drop) / 10) - 1 / 10 ** (cnom / 10))
        return P["signal_dbw"] + 10 * math.log10(max(js, 1e-300))

    jmin = np.array([j_drop(s["c_nom_dbhz"], P["gate_db"]) for s in st])
    wc, wa = 1 / P["sigma_cn0_db"] ** 2, 1 / P["sigma_agc_db"] ** 2
    lo, hi = a["session"]
    total = 0.0
    geo = []
    for hs in P["h_set_m"]:
        dx = (C[:, None, 0] - S[None, :, 0]) * 1000
        dy = (C[:, None, 1] - S[None, :, 1]) * 1000
        dz = hs - ha[None, :]
        horiz = np.hypot(dx, dy) / 1000
        dist = np.maximum(np.sqrt(dx * dx + dy * dy + dz * dz), 1.0)
        reach = HORIZON * (np.sqrt(ha) + math.sqrt(hs))
        loss = np.where(horiz > reach[None, :], P["nlos_db"], 0.0)
        geo.append((np.log10(dist), loss))
    s_sh = P["sigma_sh_db"]
    if P.get("session_shadowing"):
        total = v2_loglik(P, st, d["epochs"][lo:hi], geo, gain, jmin, j_drop, wc, wa)
        if total is None:
            agree = a.get("located") is False and len(cen) == a["n_cells"]
            print(json.dumps({"seed": d["seed"], "located": False, "agree": bool(agree)}))
            return
    for e in ([] if P.get("session_shadowing") else d["epochs"][lo:hi]):
        js = []
        for i, s in enumerate(st):
            dr, ag = e["drop_db"][i], e["dagc"][i]
            if dr is None or dr < P["gate_db"]:
                js.append(None)
                continue
            jc = j_drop(s["c_nom_dbhz"], dr)
            if s["kappa_db"] is not None and ag is not None and ag * s["kappa_db"] > 0:
                ja = s["noise_dbw"] + 10 * math.log10(max(10 ** (ag * s["kappa_db"] / 10) - 1, 1e-300))
                jc = (jc * wc + ja * wa) / (wc + wa)
            js.append(jc)
        rep = np.array([x is not None for x in js])
        jv = np.array([x if x is not None else 0.0 for x in js])
        terms = []
        for logd, loss in geo:
            for n in P["n_set"]:
                r = jv[None, :] + 10 * n * logd - gain[None, :] + loss
                p0 = (r * rep[None, :]).sum(axis=1) / rep.sum()
                pred = p0[:, None] - 10 * n * logd + gain[None, :] - loss
                z = (jv[None, :] - pred) / s_sh
                ll = np.where(rep[None, :], -0.5 * z * z - 0.5 * math.log(2 * math.pi), 0.0).sum(axis=1)
                zc = (jmin[None, :] - pred) / s_sh
                cens = np.vectorize(norm_logcdf)(zc)
                ll += np.where(rep[None, :], 0.0, cens).sum(axis=1)
                terms.append(ll)
        T = np.array(terms)
        total = T if isinstance(total, float) else total + T
    # Marginalise the (h, n) hypotheses over the session (reading 8, corrected).
    TT = P["temper"] * total
    m = TT.max(axis=0)
    lp = m + np.log(np.exp(TT - m).mean(axis=0))
    w = np.exp(lp - lp.max())
    w /= w.sum()
    order = sorted(range(len(w)), key=lambda k: (-w[k], k))
    regions = []
    for lvl in P["levels"]:
        acc, cells = 0.0, []
        for k in order:
            cells.append(k)
            acc += w[k]
            if acc >= lvl:
                break
        regions.append(sorted(cells))
    cx, cy = float((w * C[:, 0]).sum()), float((w * C[:, 1]).sum())
    ok_grid = len(cen) == a["n_cells"] and abs(cell - a["cell_km"]) < 1e-12
    ok_reg = regions == a["regions"]
    dcen = 1000 * math.hypot(cx - a["centroid"][0], cy - a["centroid"][1])
    print(json.dumps({"seed": d["seed"], "grid_equal": ok_grid, "regions_equal": ok_reg,
                      "region_sizes": [len(r) for r in regions], "centroid_diff_m": dcen,
                      "agree": bool(ok_grid and ok_reg and dcen <= 1.0)}))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
