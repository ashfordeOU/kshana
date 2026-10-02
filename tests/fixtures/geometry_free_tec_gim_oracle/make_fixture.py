#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Builds los.csv for tests/geometry_free_tec_gim_oracle.rs (numpy only).

Usage: make_fixture.py ABMF.rnx BRDC_GPS.rnx CODG1330.18I P1C11805.DCB > los.csv

ABMF.rnx is ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz after crx2rnx; BRDC_GPS.rnx is
tests/fixtures/joint_pvt_itrf_rtklib_oracle/brdc_2018133_G_Einav.rnx. The GIM slant TEC is
evaluated as the IONEX header and the IONEX 1.0 format description define it (see the test
header). Kshana code is not used.
"""
import math
import sys

import numpy as np

C = 299792458.0
MU = 3.986005e14
OMEGA_E = 7.2921151467e-5
R_GIM = 6371.0e3
H_IPP = 450.0e3
H_MSLM = 506.7e3
ALPHA_MSLM = 0.9782


def fnum(s):
    return float(s.replace("D", "E"))


def read_nav(path):
    eph = {}
    lines = open(path).read().splitlines()
    i = next(k for k, l in enumerate(lines) if "END OF HEADER" in l) + 1
    while i < len(lines):
        l = lines[i]
        if not l.startswith("G"):
            i += 1
            continue
        prn = int(l[1:3])
        vals = [fnum(l[23 + 19 * k:23 + 19 * (k + 1)]) for k in range(3)]
        for j in range(1, 8):
            ll = lines[i + j]
            for k in range(4):
                fld = ll[4 + 19 * k:4 + 19 * (k + 1)].strip()
                vals.append(fnum(fld) if fld else 0.0)
        i += 8
        e = dict(zip(["af0", "af1", "af2", "iode", "crs", "dn", "m0", "cuc", "e", "cus", "sqa",
                      "toe", "cic", "om0", "cis", "i0", "crc", "w", "omd", "idot", "l2c",
                      "week", "l2p", "acc", "health", "tgd", "iodc", "tot", "fit"], vals))
        if e["health"] == 0:
            eph.setdefault(prn, []).append(e)
    return eph


def sat_pos(e, t):
    """ECEF position (m) at GPS seconds of week t, IS-GPS-200 table 20-IV."""
    a = e["sqa"] ** 2
    n = math.sqrt(MU / a ** 3) + e["dn"]
    tk = t - e["toe"]
    if tk > 302400:
        tk -= 604800
    if tk < -302400:
        tk += 604800
    m = e["m0"] + n * tk
    ek = m
    for _ in range(30):
        ek = m + e["e"] * math.sin(ek)
    v = math.atan2(math.sqrt(1 - e["e"] ** 2) * math.sin(ek), math.cos(ek) - e["e"])
    phi = v + e["w"]
    du = e["cus"] * math.sin(2 * phi) + e["cuc"] * math.cos(2 * phi)
    dr = e["crs"] * math.sin(2 * phi) + e["crc"] * math.cos(2 * phi)
    di = e["cis"] * math.sin(2 * phi) + e["cic"] * math.cos(2 * phi)
    u = phi + du
    r = a * (1 - e["e"] * math.cos(ek)) + dr
    i = e["i0"] + di + e["idot"] * tk
    x, y = r * math.cos(u), r * math.sin(u)
    om = e["om0"] + (e["omd"] - OMEGA_E) * tk - OMEGA_E * e["toe"]
    return np.array([x * math.cos(om) - y * math.cos(i) * math.sin(om),
                     x * math.sin(om) + y * math.cos(i) * math.cos(om),
                     y * math.sin(i)])


def geodetic(x):
    a, f = 6378137.0, 1 / 298.257223563
    e2 = f * (2 - f)
    lon = math.atan2(x[1], x[0])
    p = math.hypot(x[0], x[1])
    lat = math.atan2(x[2], p * (1 - e2))
    for _ in range(10):
        nn = a / math.sqrt(1 - e2 * math.sin(lat) ** 2)
        h = p / math.cos(lat) - nn
        lat = math.atan2(x[2], p * (1 - e2 * nn / (nn + h)))
    return lat, lon


def read_ionex(path):
    lines = open(path).read().splitlines()
    sat_bias, sta_bias, maps = {}, {}, []
    k = 0
    while "END OF HEADER" not in lines[k]:
        l = lines[k]
        if "PRN / BIAS / RMS" in l and l.strip().startswith("G"):
            sat_bias[int(l.split()[0][1:])] = float(l.split()[1])
        if "STATION / BIAS / RMS" in l:
            p = l.split()
            sta_bias[p[1]] = float(p[3])
        k += 1
    while k < len(lines):
        if "START OF TEC MAP" in lines[k]:
            ep = [int(x) for x in lines[k + 1].split()[:6]]
            t = ep[3] * 3600 + ep[4] * 60 + ep[5] + (86400 if ep[2] == 14 else 0)
            grid = np.zeros((71, 73))
            j = k + 2
            for row in range(71):
                vals = []
                j += 1
                while len(vals) < 73:
                    vals += [int(x) for x in lines[j].split()]
                    j += 1
                grid[row] = np.array(vals, dtype=float) * 0.1
            maps.append((t, grid))
            k = j
        elif "START OF RMS MAP" in lines[k]:
            break
        else:
            k += 1
    return sat_bias, sta_bias, maps


def grid_value(grid, lat_deg, lon_deg):
    lon_deg = (lon_deg + 180.0) % 360.0 - 180.0
    r = (87.5 - lat_deg) / 2.5
    c = (lon_deg + 180.0) / 5.0
    r0, c0 = int(math.floor(r)), int(math.floor(c))
    r0 = min(max(r0, 0), 69)
    c0 = min(max(c0, 0), 71)
    p, q = r - r0, c - c0
    return ((1 - p) * (1 - q) * grid[r0, c0] + p * (1 - q) * grid[r0 + 1, c0]
            + (1 - p) * q * grid[r0, c0 + 1] + p * q * grid[r0 + 1, c0 + 1])


def gim_vtec(maps, t, lat_deg, lon_deg):
    for i in range(len(maps) - 1):
        t0, g0 = maps[i]
        t1, g1 = maps[i + 1]
        if t0 <= t <= t1:
            w = (t - t0) / (t1 - t0)
            e0 = grid_value(g0, lat_deg, lon_deg + (t - t0) * 360.0 / 86400.0)
            e1 = grid_value(g1, lat_deg, lon_deg + (t - t1) * 360.0 / 86400.0)
            return (1 - w) * e0 + w * e1
    raise ValueError("epoch outside the maps")


def read_p1c1(path):
    out = {}
    for l in open(path):
        if l.startswith("G") and len(l.split()) >= 3:
            p = l.split()
            out[int(p[0][1:])] = float(p[1])
    return out


def main():
    obs_path, nav_path, ionex_path, p1c1_path = sys.argv[1:5]
    eph = read_nav(nav_path)
    sat_bias, sta_bias, maps = read_ionex(ionex_path)
    p1c1 = read_p1c1(p1c1_path)
    lines = open(obs_path).read().splitlines()
    rx = None
    types = None
    k = 0
    while "END OF HEADER" not in lines[k]:
        l = lines[k]
        if "APPROX POSITION XYZ" in l:
            rx = np.array([float(x) for x in l.split()[:3]])
        if l.startswith("G") and "SYS / # / OBS TYPES" in l:
            types = l[7:60].split()
        k += 1
    i1, i2 = types.index("C1C"), types.index("C2W")
    lat_g, lon_g = geodetic(rx)
    lat_c = math.atan2(rx[2], math.hypot(rx[0], rx[1]))
    up = np.array([math.cos(lat_g) * math.cos(lon_g), math.cos(lat_g) * math.sin(lon_g), math.sin(lat_g)])
    east = np.array([-math.sin(lon_g), math.cos(lon_g), 0.0])
    north = np.cross(up, east)
    sow0 = 0 * 86400.0  # 2018-05-13 is a Sunday: GPS seconds of week = seconds of day
    print("prn,sod,elev_deg,c1c_m,c2w_m,bias_c1c_c2w_ns,gim_stec_tecu")
    k += 1
    while k < len(lines):
        l = lines[k]
        if not l.startswith(">"):
            k += 1
            continue
        p = l[1:].split()
        hh, mm, ss = int(p[3]), int(p[4]), float(p[5])
        nsat = int(p[7])
        sod = hh * 3600 + mm * 60 + ss
        rows = lines[k + 1:k + 1 + nsat]
        k += 1 + nsat
        if abs(ss) > 1e-6:
            continue
        for r in rows:
            if not r.startswith("G"):
                continue
            prn = int(r[1:3])

            def field(idx):
                s = r[3 + 16 * idx:3 + 16 * idx + 14].strip()
                return float(s) if s else None
            c1, c2 = field(i1), field(i2)
            if c1 is None or c2 is None or prn not in eph or prn not in sat_bias or prn not in p1c1:
                continue
            t = sow0 + sod
            e = min(eph[prn], key=lambda e: abs(e["toe"] - t))
            tau = c1 / C
            xs = sat_pos(e, t - tau)
            th = OMEGA_E * tau
            xs = np.array([math.cos(th) * xs[0] + math.sin(th) * xs[1],
                           -math.sin(th) * xs[0] + math.cos(th) * xs[1], xs[2]])
            los = xs - rx
            los /= np.linalg.norm(los)
            el = math.asin(float(los @ up))
            az = math.atan2(float(los @ east), float(los @ north))
            if el < math.radians(10.0):
                continue
            z = math.pi / 2 - el
            zp = math.asin(R_GIM / (R_GIM + H_IPP) * math.sin(z))
            psi = z - zp
            lat_i = math.asin(math.sin(lat_c) * math.cos(psi) + math.cos(lat_c) * math.sin(psi) * math.cos(az))
            lon_i = lon_g + math.asin(math.sin(psi) * math.sin(az) / math.cos(lat_i))
            vtec = gim_vtec(maps, sod, math.degrees(lat_i), math.degrees(lon_i))
            fm = 1.0 / math.cos(math.asin(R_GIM / (R_GIM + H_MSLM) * math.sin(ALPHA_MSLM * z)))
            bias = sta_bias["ABMF"] + sat_bias[prn] - p1c1[prn]
            print(f"{prn},{sod:.0f},{math.degrees(el):.4f},{c1:.3f},{c2:.3f},{bias:.3f},{vtec * fm:.3f}")


if __name__ == "__main__":
    main()
