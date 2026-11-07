# SPDX-License-Identifier: AGPL-3.0-only
"""B8: the measured disturbance label, independent of the engine (pre-registration section 3). numpy and the
Python standard library only; shares no code with Kshana.

Per satellite, slant TEC from the geometry-free carrier-phase combination; ROT = its 30 s difference in
TECU/min; a jump over 1 TECU in 30 s (a cycle slip) or a data gap resets the arc; ROTI = the standard deviation
of ROT over each 5-minute window of the hour. The station-hour value ROTI_h is the 90th percentile over
satellites and windows, and the label y = 1 when ROTI_h >= 0.5 TECU/min.

RINEX 3 observation text gives the GPS phases (L1: L1C, else any L1; L2: L2W, else L2L, L2X, any L2); a
RINEX 3 navigation file gives the broadcast orbits for the elevation mask (30 degrees), computed here with the
IS-GPS-200 user algorithm. A station-hour needs at least 4 satellites above 30 degrees for 30 minutes,
otherwise it is excluded and counted.

    python3 -I xval/env-baseline/roti.py --self-test
    python3 -I xval/env-baseline/roti.py label <obs.rnx> <nav.rnx> <lat> <lon> <h> > labels.json
"""
import math
import sys

import numpy as np

F1, F2 = 1575.42e6, 1227.60e6
C = 299792458.0
K = 40.3082
SLIP_TECU = 1.0
STEP_S = 30.0
WINDOW_S = 300.0
MIN_ROT_PER_WINDOW = 5
LABEL_THRESHOLD = 0.5


def tec_from_phase(l1_cycles, l2_cycles):
    """Relative slant TEC (TECU) from L1 and L2 carrier phase in cycles (geometry-free combination)."""
    l1m = np.asarray(l1_cycles) * (C / F1)
    l2m = np.asarray(l2_cycles) * (C / F2)
    return (l1m - l2m) * (F1**2 * F2**2) / (K * (F1**2 - F2**2)) / 1e16


def rot_series(t_s, tec):
    """ROT (TECU/min) between consecutive 30 s epochs of one arc; a gap or a slip ends the arc. Returns
    (t_mid_s, rot) for the differences kept."""
    t = np.asarray(t_s, dtype=float)
    v = np.asarray(tec, dtype=float)
    out_t, out_r = [], []
    for i in range(1, len(t)):
        dt = t[i] - t[i - 1]
        dv = v[i] - v[i - 1]
        if abs(dt - STEP_S) > 1e-6 or abs(dv) > SLIP_TECU or not math.isfinite(dv):
            continue
        out_t.append(t[i])
        out_r.append(dv / (dt / 60.0))
    return np.array(out_t), np.array(out_r)


def roti_windows(t_rot, rot, hour_start_s):
    """ROTI (TECU/min) per 5-minute window of the hour starting at hour_start_s; windows with fewer than
    MIN_ROT_PER_WINDOW ROT values are left out."""
    out = []
    for w in range(int(3600 / WINDOW_S)):
        a = hour_start_s + w * WINDOW_S
        m = (t_rot > a) & (t_rot <= a + WINDOW_S)
        if m.sum() >= MIN_ROT_PER_WINDOW:
            out.append(float(np.std(rot[m])))
    return out


def roti_hour(per_sat_windows):
    """ROTI_h: the 90th percentile (linear interpolation) over all satellites' windows."""
    vals = [x for ws in per_sat_windows for x in ws]
    if not vals:
        return None
    return float(np.percentile(vals, 90))


def label(roti_h):
    return None if roti_h is None else int(roti_h >= LABEL_THRESHOLD)


# ----------------------------------------------------------------------------- RINEX and orbits

MU = 3.986005e14
OMEGA_E = 7.2921151467e-5
A_WGS, F_WGS = 6378137.0, 1.0 / 298.257223563


def parse_obs(text):
    """GPS L1 and L2 phase per satellite: {sat: [(t_sod, l1, l2)]}, t in seconds of the file's first day."""
    lines = text.splitlines()
    codes, i = [], 0
    while i < len(lines):
        l = lines[i]
        lab = l[60:].strip()
        if lab == "SYS / # / OBS TYPES" and l[0] == "G":
            n = int(l[3:6])
            codes = l[7:60].split()
            while len(codes) < n:
                i += 1
                codes += lines[i][7:60].split()
        if lab == "END OF HEADER":
            i += 1
            break
        i += 1
    def pick(prefs, prefix):
        for c in prefs:
            if c in codes:
                return codes.index(c)
        for k, c in enumerate(codes):
            if c.startswith(prefix):
                return k
        return None
    k1 = pick(["L1C"], "L1")
    k2 = pick(["L2W", "L2L", "L2X"], "L2")
    out = {}
    day0 = None
    while i < len(lines):
        l = lines[i]
        if not l.startswith(">"):
            i += 1
            continue
        # The epoch record by its fixed columns (RINEX 3.0x): an event record (flag 2 to 6) may leave the
        # date blank and is followed by n header or event lines, which are skipped.
        flag = int(l[31]) if len(l) > 31 and l[31].isdigit() else 0
        n = int(l[32:35]) if l[32:35].strip() else 0
        if flag > 1:
            i += 1 + n
            continue
        f = l[1:].split()
        y, mo, d, hh, mm = (int(x) for x in f[:5])
        ss = float(f[5])
        if day0 is None:
            day0 = (y, mo, d)
        t = (0 if (y, mo, d) == day0 else 86400) + hh * 3600 + mm * 60 + ss
        for j in range(n):
            row = lines[i + 1 + j]
            sat = row[:3]
            if flag != 0 or sat[0] != "G" or k1 is None or k2 is None:
                continue
            def val(k):
                a = 3 + 16 * k
                s_ = row[a:a + 14].strip()
                return float(s_) if s_ else None
            v1, v2 = val(k1), val(k2)
            if v1 is not None and v2 is not None:
                out.setdefault(sat, []).append((t, v1, v2))
        i += 1 + n
    return out


def parse_nav(text):
    """GPS broadcast records: {sat: [dict]}."""
    lines = text.splitlines()
    i = next(k for k, l in enumerate(lines) if "END OF HEADER" in l) + 1
    out = {}
    num = lambda s: float(s.replace("D", "E")) if s.strip() else 0.0
    while i < len(lines):
        l = lines[i]
        if not l or l[0] == " ":
            i += 1
            continue
        sys_ = l[0]
        n = {"R": 4, "S": 4}.get(sys_, 8)
        # The record runs to the next line that starts with a system letter (RINEX 3.05 GLONASS has 5).
        j = i + 1
        while j < len(lines) and lines[j].startswith(" "):
            j += 1
        if sys_ == "G" and j - i >= 8:
            rec = [l[23:42], l[42:61], l[61:80]]
            for r in lines[i + 1:i + 8]:
                rec += [r[4:23], r[23:42], r[42:61], r[61:80]]
            v = [num(x) for x in rec]
            out.setdefault(l[:3], []).append({
                "crs": v[4], "dn": v[5], "m0": v[6], "cuc": v[7], "e": v[8], "cus": v[9], "sqa": v[10],
                "toe": v[11], "cic": v[12], "om0": v[13], "cis": v[14], "i0": v[15], "crc": v[16],
                "w": v[17], "omd": v[18], "idot": v[19]})
        i = j
    return out


def sat_ecef(eph, tow):
    a = eph["sqa"] ** 2
    tk = tow - eph["toe"]
    if tk > 302400:
        tk -= 604800
    elif tk < -302400:
        tk += 604800
    n = math.sqrt(MU / a**3) + eph["dn"]
    m = eph["m0"] + n * tk
    e_ = m
    for _ in range(20):
        e_ = m + eph["e"] * math.sin(e_)
    nu = math.atan2(math.sqrt(1 - eph["e"] ** 2) * math.sin(e_), math.cos(e_) - eph["e"])
    phi = nu + eph["w"]
    du = eph["cus"] * math.sin(2 * phi) + eph["cuc"] * math.cos(2 * phi)
    dr = eph["crs"] * math.sin(2 * phi) + eph["crc"] * math.cos(2 * phi)
    di = eph["cis"] * math.sin(2 * phi) + eph["cic"] * math.cos(2 * phi)
    u, r = phi + du, a * (1 - eph["e"] * math.cos(e_)) + dr
    inc = eph["i0"] + di + eph["idot"] * tk
    om = eph["om0"] + (eph["omd"] - OMEGA_E) * tk - OMEGA_E * eph["toe"]
    xp, yp = r * math.cos(u), r * math.sin(u)
    return np.array([xp * math.cos(om) - yp * math.cos(inc) * math.sin(om),
                     xp * math.sin(om) + yp * math.cos(inc) * math.cos(om),
                     yp * math.sin(inc)])


def site_ecef(lat, lon, h):
    la, lo = math.radians(lat), math.radians(lon)
    e2 = F_WGS * (2 - F_WGS)
    n = A_WGS / math.sqrt(1 - e2 * math.sin(la) ** 2)
    return np.array([(n + h) * math.cos(la) * math.cos(lo), (n + h) * math.cos(la) * math.sin(lo),
                     (n * (1 - e2) + h) * math.sin(la)])


def elevation_deg(sat, site, lat, lon):
    d = sat - site
    la, lo = math.radians(lat), math.radians(lon)
    up = np.array([math.cos(la) * math.cos(lo), math.cos(la) * math.sin(lo), math.sin(la)])
    return math.degrees(math.asin(float(d @ up) / float(np.linalg.norm(d))))


def label_day(obs_text, nav_text, lat, lon, h, tow0):
    """Labels for the 24 hours of one daily file. `tow0` is the GPS time of week of the file's first midnight."""
    obs, nav = parse_obs(obs_text), parse_nav(nav_text)
    site = site_ecef(lat, lon, h)
    hours = []
    for hr in range(24):
        h0 = hr * 3600.0
        windows, above = [], {}
        for sat, rows in obs.items():
            ephs = nav.get(sat)
            if not ephs:
                continue
            arr = [r for r in rows if h0 - STEP_S < r[0] <= h0 + 3600]
            if len(arr) < 2:
                continue
            keep = []
            for (t, l1, l2) in arr:
                tow = tow0 + t
                eph = min(ephs, key=lambda e: abs(((tow - e["toe"] + 302400) % 604800) - 302400))
                if abs(((tow - eph["toe"] + 302400) % 604800) - 302400) > 7200:
                    continue
                if elevation_deg(sat_ecef(eph, tow), site, lat, lon) > 30.0:
                    keep.append((t, l1, l2))
                    if t > h0:
                        above.setdefault(sat, 0)
                        above[sat] += 1
            if len(keep) < 2:
                continue
            t_ = np.array([k[0] for k in keep])
            tec = tec_from_phase([k[1] for k in keep], [k[2] for k in keep])
            tr, r = rot_series(t_, tec)
            windows.append(roti_windows(tr, r, h0))
        # At least 4 satellites above 30 degrees for 30 minutes (60 epochs of 30 s).
        n_ok = sum(1 for c in above.values() if c >= 60)
        rh = roti_hour(windows) if n_ok >= 4 else None
        hours.append({"hour": hr, "sats_30min": n_ok, "roti_h": rh, "y": label(rh)})
    return hours


def self_test():
    rng = np.random.default_rng(0xB8)
    t = np.arange(0, 3600 + 1, STEP_S)
    # 1. A smooth TEC (a slow trend) has ROTI near zero: label 0.
    smooth = 20.0 + 0.002 * t
    tr, r = rot_series(t, smooth)
    w = roti_windows(tr, r, 0.0)
    assert len(w) == 12 and max(w) < 1e-9, w
    # 2. White ROT of known standard deviation: ROTI recovers it.
    sigma = 0.8
    rot_true = rng.normal(0.0, sigma, len(t) - 1)
    tec = np.concatenate([[30.0], 30.0 + np.cumsum(rot_true * (STEP_S / 60.0))])
    tr, r = rot_series(t, tec)
    kept = rot_true[np.abs(rot_true * (STEP_S / 60.0)) <= SLIP_TECU]
    assert np.allclose(r, kept), "ROT recovers the injected values (steps over 1 TECU are slips)"
    w = roti_windows(tr, r, 0.0)
    assert abs(np.mean(w) - sigma) < 0.12, np.mean(w)
    assert label(roti_hour([w])) == 1
    # 3. A slip (a jump of 5 TECU) is not counted as ROT.
    jumped = smooth.copy()
    jumped[60:] += 5.0
    tr, r = rot_series(t, jumped)
    assert len(r) == len(t) - 2 and np.max(np.abs(r - 0.12)) < 1e-9, "the slip is dropped; the trend (0.12 TECU/min) stays"
    # 4. Geometry-free TEC: phases built from a known TEC give it back.
    tec_true = 25.0
    i1 = K * tec_true * 1e16 / F1**2
    i2 = K * tec_true * 1e16 / F2**2
    rho = 2.2e7
    l1 = (rho - i1) / (C / F1)
    l2 = (rho - i2) / (C / F2)
    assert abs(float(tec_from_phase(l1, l2)) - tec_true) < 1e-6
    # 5. The station-hour is the 90th percentile.
    assert abs(roti_hour([[0.1, 0.2], [0.3, 1.0]]) - float(np.percentile([0.1, 0.2, 0.3, 1.0], 90))) < 1e-15
    print("roti.py self-test: ok")


if __name__ == "__main__":
    import json
    if sys.argv[1:] == ["--self-test"]:
        self_test()
    elif sys.argv[1:2] == ["label"]:
        _, _, o, n, la, lo, hh, tow0 = sys.argv
        json.dump(label_day(open(o).read(), open(n).read(), float(la), float(lo), float(hh), float(tow0)), sys.stdout)
    else:
        sys.exit(__doc__)
