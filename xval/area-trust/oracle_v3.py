# SPDX-License-Identifier: AGPL-3.0-only
"""B5 area trust, version 3: the independent oracle for the satellite-fault screen and the v3 station state
(PREREGISTRATION-v3.md, readings X4 to X7 in README.md). Python standard library only; shares no code with the
engine. The area aggregation is a copy of oracle_v2.py's v2 rule (X6).

Input: a `kshana.area-measurements/1` document:

    {"schema": "kshana.area-measurements/1", "area_rule": "v3",
     "stations": [{"id": "s0", "p_s_ecef_m": [x, y, z], "h_s_m": 12.0}, ...],
     "epochs": [{"t": 17, "stations": [<report or null>, ...]}, ...]}

with one report per station, in the order of "stations" (null when the station sent nothing that epoch):

    {"cn0_alarm": false, "agc_alarm": false, "jam_alarm": false, "lock_alarm": false,
     "clock_alarm": false, "osnma_ok": null,
     "meas": [{"sat": "G05", "sat_ecef": [x, y, z], "pseudorange_m": p, "sat_clock_m": c,
               "iono_m": i, "tropo_m": tr, "weight": w}, ...]}

`t` is an integer second; epochs are in increasing `t`.

Output (JSON Lines): first one line per epoch,

    {"kind":"epoch","t":17,"satellite_fault":"G05","states":["nominal",...],"lock":[false,...]}

(`satellite_fault` null when nothing is flagged, a state null when the station sent nothing), then the area
timeline of the station states under the v2 aggregation, one line per grid second, as oracle_v2.py writes it with
"kind":"area" first. With `--detail` it writes instead, per epoch, each station's horizontal error before and after
the screen (null without a fix), for T1's tolerance comparison:

    python3 -I xval/area-trust/oracle_v3.py doc.json > out.jsonl
    python3 -I xval/area-trust/oracle_v3.py --detail doc.json > detail.jsonl
"""
import json
import math
import sys

# ------------------------------------------------------------------ single-point solve (own implementation)

MAX_ITERS = 15
CONVERGE_M = 1e-4
WGS84_A = 6378137.0
WGS84_F = 1.0 / 298.257223563


def _sub(a, b):
    return [a[0] - b[0], a[1] - b[1], a[2] - b[2]]


def _norm(a):
    return math.sqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2])


def _solve4(m, v):
    """Solve the 4x4 system m x = v by Gaussian elimination with partial pivoting; None when singular."""
    a = [row[:] + [v[i]] for i, row in enumerate(m)]
    for c in range(4):
        p = max(range(c, 4), key=lambda r: abs(a[r][c]))
        if abs(a[p][c]) < 1e-30:
            return None
        a[c], a[p] = a[p], a[c]
        for r in range(4):
            if r != c:
                f = a[r][c] / a[c][c]
                for j in range(c, 5):
                    a[r][j] -= f * a[c][j]
    return [a[i][4] / a[i][i] for i in range(4)]


def predicted(x, m):
    return _norm(_sub(m["sat_ecef"], x[:3])) + x[3] - m["sat_clock_m"] + m["iono_m"] + m["tropo_m"]


def solve(meas, apriori):
    """Weighted Gauss-Newton single-point solve from `apriori` with clock 0: [x, y, z, c*dt], or None with
    fewer than four measurements or a singular system."""
    if len(meas) < 4:
        return None
    x = [apriori[0], apriori[1], apriori[2], 0.0]
    for _ in range(MAX_ITERS):
        n = [[0.0] * 4 for _ in range(4)]
        y = [0.0] * 4
        for m in meas:
            d = _sub(m["sat_ecef"], x[:3])
            r = _norm(d)
            if r == 0.0:
                return None
            row = [-d[0] / r, -d[1] / r, -d[2] / r, 1.0]
            res = m["pseudorange_m"] - predicted(x, m)
            w = max(m["weight"], 1e-12)
            for i in range(4):
                y[i] += w * row[i] * res
                for j in range(4):
                    n[i][j] += w * row[i] * row[j]
        dx = _solve4(n, y)
        if dx is None:
            return None
        x = [x[i] + dx[i] for i in range(4)]
        if math.sqrt(dx[0] ** 2 + dx[1] ** 2 + dx[2] ** 2) < CONVERGE_M:
            break
    return x


def lat_lon(p):
    """Geodetic latitude and longitude (rad) of an ECEF point on WGS 84, by fixed-point iteration."""
    e2 = WGS84_F * (2.0 - WGS84_F)
    lon = math.atan2(p[1], p[0])
    rho = math.hypot(p[0], p[1])
    lat = math.atan2(p[2], rho * (1.0 - e2))
    for _ in range(10):
        nrad = WGS84_A / math.sqrt(1.0 - e2 * math.sin(lat) ** 2)
        h = rho / math.cos(lat) - nrad
        lat = math.atan2(p[2], rho * (1.0 - e2 * nrad / (nrad + h)))
    return lat, lon


def horiz_err(p_s, x):
    """Horizontal distance of the fix from the surveyed point, in the surveyed point's local frame."""
    if x is None:
        return None
    lat, lon = lat_lon(p_s)
    d = _sub(x[:3], p_s)
    e = -math.sin(lon) * d[0] + math.cos(lon) * d[1]
    nn = -math.sin(lat) * math.cos(lon) * d[0] - math.sin(lat) * math.sin(lon) * d[1] + math.cos(lat) * d[2]
    return math.hypot(e, nn)


def median(v):
    s = sorted(v)
    n = len(s)
    return s[n // 2] if n % 2 else 0.5 * (s[n // 2 - 1] + s[n // 2])


def prn(sat):
    return int(sat[1:])


# ------------------------------------------------------------------ X4: the satellite-fault screen

def screen(stations, reports):
    """One epoch: (flagged satellite or None, full errors, screened errors), errors per station (None when the
    station sent nothing or has no fix)."""
    full_fix = []
    full_err = []
    for st, rep in zip(stations, reports):
        x = solve(rep["meas"], st["p_s_ecef_m"]) if rep is not None else None
        full_fix.append(x)
        full_err.append(horiz_err(st["p_s_ecef_m"], x))
    n_fix = sum(1 for e in full_err if e is not None)
    k = max(2, math.ceil(n_fix / 3))
    alarmed = [i for i, e in enumerate(full_err) if e is not None and e > stations[i]["h_s_m"]]
    flagged = None
    if len(alarmed) >= k:
        common = set(m["sat"] for m in reports[alarmed[0]]["meas"])
        for i in alarmed[1:]:
            common &= set(m["sat"] for m in reports[i]["meas"])
        explaining = []
        for sat in sorted(common):
            ok = True
            for i in alarmed:
                rest = [m for m in reports[i]["meas"] if m["sat"] != sat]
                e = horiz_err(stations[i]["p_s_ecef_m"], solve(rest, stations[i]["p_s_ecef_m"]))
                if e is None or e > stations[i]["h_s_m"]:
                    ok = False
                    break
            if ok:
                res = []
                for i in alarmed:
                    m = next(m for m in reports[i]["meas"] if m["sat"] == sat)
                    res.append(abs(m["pseudorange_m"] - predicted(full_fix[i], m)))
                explaining.append((-median(res), prn(sat), sat))
        if explaining:
            flagged = min(explaining)[2]
    screened = []
    for i, (st, rep) in enumerate(zip(stations, reports)):
        if flagged is not None and rep is not None and any(m["sat"] == flagged for m in rep["meas"]):
            rest = [m for m in rep["meas"] if m["sat"] != flagged]
            screened.append(horiz_err(st["p_s_ecef_m"], solve(rest, st["p_s_ecef_m"])))
        else:
            screened.append(full_err[i])
    return flagged, full_err, screened


# ------------------------------------------------------------------ X5: the v3 station state

def station_state(rep, err, h_s):
    fix = (err is not None and err > h_s) or rep["clock_alarm"] or rep["osnma_ok"] is False
    meas = rep["cn0_alarm"] or rep["agc_alarm"] or rep["jam_alarm"]  # loss of lock alone no longer counts
    if fix:
        return "untrusted"
    if meas:
        return "degraded"
    return "nominal"


# ------------------------------------------------------------------ X6: the area aggregation (v2's, copied)

RANK = {"nominal": 0, "degraded": 1, "untrusted": 2}
AREA = ["TRUSTED", "DEGRADED", "UNTRUSTED"]
STALE_AFTER = 5
HOLD = 10


def station_states(epochs, g0, g1):
    last_in = {}
    for t, s in epochs:
        last_in[math.floor(t)] = s
    out = []
    state, g_last = None, None
    for g in range(g0, g1 + 1):
        if g in last_in:
            state, g_last = last_in[g], g
        if g_last is None or g - g_last >= STALE_AFTER:
            out.append(None)
        else:
            out.append(state)
    return out


def raw(states):
    live = [s for s in states if s is not None]
    n = len(live)
    n_d = sum(1 for s in live if RANK[s] >= 1)
    n_u = sum(1 for s in live if RANK[s] == 2)
    if n < 2:
        return "UNKNOWN", n, n_d, n_u
    k = max(2, math.ceil(n / 3))
    m = 2 if n <= 6 else 1
    if n_u >= k:
        r = "UNTRUSTED"
    elif n_d >= k or n_u >= m:
        r = "DEGRADED"
    else:
        r = "TRUSTED"
    return r, n, n_d, n_u


def timeline(station_epochs):
    times = [t for eps in station_epochs for t, _ in eps]
    if not times:
        return []
    g0, g1 = math.floor(min(times)), math.floor(max(times))
    per = [station_states(eps, g0, g1) for eps in station_epochs]
    out = []
    pub = None
    raws = []
    for i, g in enumerate(range(g0, g1 + 1)):
        col = [p[i] for p in per]
        r, n, n_d, n_u = raw(col)
        raws.append(r)
        prev = pub
        if pub is None or r == "UNKNOWN" or pub == "UNKNOWN":
            pub = r
        elif AREA.index(r) > AREA.index(pub):
            pub = r
        elif AREA.index(r) < AREA.index(pub):
            last = raws[-HOLD:]
            if len(last) == HOLD and all(x != "UNKNOWN" and AREA.index(x) < AREA.index(pub) for x in last):
                pub = max(last, key=AREA.index)
        alert = (
            prev is not None
            and pub in ("DEGRADED", "UNTRUSTED")
            and (prev == "UNKNOWN" or AREA.index(pub) > AREA.index(prev))
        )
        stale = sum(1 for s in col if s is None)
        out.append({"kind": "area", "g": g, "state": pub, "alert": alert, "n": n, "n_d": n_d, "n_u": n_u,
                    "stale": stale})
    return out


# ------------------------------------------------------------------ the document

def run(doc, detail=False):
    if doc.get("schema") != "kshana.area-measurements/1":
        raise ValueError("not a kshana.area-measurements/1 document")
    if doc.get("area_rule") != "v3":
        raise ValueError("a measurements document needs \"area_rule\": \"v3\"")
    stations = doc["stations"]
    rows = []
    per_station = [[] for _ in stations]
    last_t = None
    for ep in doc["epochs"]:
        t = ep["t"]
        if not isinstance(t, int) or (last_t is not None and t <= last_t):
            raise ValueError("epochs need increasing integer seconds")
        last_t = t
        reports = ep["stations"]
        if len(reports) != len(stations):
            raise ValueError("one report (or null) per station")
        flagged, full_err, screened = screen(stations, reports)
        if detail:
            rows.append({"t": t, "satellite_fault": flagged, "err_h_m": full_err, "err_h_screened_m": screened})
            continue
        states, lock = [], []
        for i, rep in enumerate(reports):
            if rep is None:
                states.append(None)
                lock.append(False)
                continue
            s = station_state(rep, screened[i], stations[i]["h_s_m"])
            states.append(s)
            lock.append(bool(rep["lock_alarm"]))
            per_station[i].append((t, s))
        rows.append({"kind": "epoch", "t": t, "satellite_fault": flagged, "states": states, "lock": lock})
    if not detail:
        rows.extend(timeline(per_station))
    return rows


def main():
    args = sys.argv[1:]
    detail = "--detail" in args
    path = [a for a in args if a != "--detail"][0]
    with open(path) as f:
        doc = json.load(f)
    for row in run(doc, detail):
        sys.stdout.write(json.dumps(row, separators=(",", ":")) + "\n")


if __name__ == "__main__":
    main()
