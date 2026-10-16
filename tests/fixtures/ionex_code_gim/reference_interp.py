#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Formula reference for tests/ionex_code_gim_oracle.rs (Python standard library only).

Usage: python3 -I reference_interp.py codg1330_crop.18i reference_vtec.csv.gz

An independent re-implementation, from the IONEX 1.0 format description (Schaer, Gurtner and
Feltens, 1998, "IONEX: The IONosphere Map EXchange Format Version 1", section "Interpolation"),
of the vertical-TEC interpolation a reader of the file is expected to do. Written without
reading Kshana's source. Its own IONEX reader uses the format's fixed columns (16 I5 values per
record). It evaluates the query design of PREREGISTRATION.md:

  spatial  4-point bilinear formula at each map epoch:
           E(lon0 + p dlon, lat0 + q dlat) = (1-p)(1-q) E00 + p(1-q) E10 + q(1-p) E01 + pq E11
  eq2      linear in time between consecutive maps T_i <= t <= T_i+1 (format eq. 2)
  eq3      the same with each map rotated by the Earth's rotation: map i is read at
           lon'_i = lon + 360 deg (t - T_i) / 86400 s (format eq. 3), wrapped to [-180, 180)
  eq3flip  eq3 with the rotation sign reversed (a discrimination control, not a reference)

and, on the eq3 samples, the slant TEC with the thin-shell obliquity 1/cos(asin(R/(R+H) sin z))
(R = 6371 km, H = HGT1 from the header) and the first-order L1 delay 40.3e16 STEC / f^2.

Output (gzip, mtime 0, so the bytes are reproducible): CSV rows
  S,t_s,lat,lon,vtec                                            (spatial, map epochs)
  T,t_s,lat,lon,z_deg,vtec_eq2,vtec_eq3,vtec_eq3flip,stec_eq3,delay_l1_eq3_m
and one row per TEC map:
  N,map_index,t_s,sum_of_printed_integers,count_of_nodes
"""
import datetime
import gzip
import io
import math
import sys

F_L1 = 1575.42e6
R_KM = 6371.0
LATS = [5.0, 6.3, 10.0, 12.85, 16.2621, 21.7, 27.5, 29.99, 30.0]
LONS = [-180.0, -179.2, -61.5281, -3.7, 0.0, 47.31, 122.9, 177.5, 180.0]
TIMES = [1020 * k for k in range(85)]
ZENITHS = [0.0, 30.0, 60.0, 80.0]


def read_ionex(path):
    lines = open(path, encoding="ascii").read().splitlines()
    hdr = {}
    k = 0
    while True:
        line = lines[k]
        k += 1
        label = line[60:80].strip()
        data = line[:60]
        if label == "END OF HEADER":
            break
        if label in ("LAT1 / LAT2 / DLAT", "LON1 / LON2 / DLON", "HGT1 / HGT2 / DHGT"):
            hdr[label] = [float(data[2 + 6 * j:8 + 6 * j]) for j in range(3)]
        elif label == "EXPONENT":
            hdr[label] = int(data[:6])
        elif label in ("EPOCH OF FIRST MAP", "EPOCH OF LAST MAP"):
            hdr[label] = [int(data[6 * j:6 * j + 6]) for j in range(6)]
        elif label in ("INTERVAL", "# OF MAPS IN FILE"):
            hdr[label] = int(data[:6])
    lat1, lat2, dlat = hdr["LAT1 / LAT2 / DLAT"]
    lon1, lon2, dlon = hdr["LON1 / LON2 / DLON"]
    nlat = int(round((lat2 - lat1) / dlat)) + 1
    nlon = int(round((lon2 - lon1) / dlon)) + 1
    nrec = (nlon + 15) // 16
    y, m, d = hdr["EPOCH OF FIRST MAP"][:3]
    day0 = datetime.date(y, m, d)
    maps = []
    while k < len(lines):
        label = lines[k][60:80].strip()
        if label == "START OF TEC MAP":
            exp = hdr["EXPONENT"]
            k += 1
            t = None
            rows = []
            ints = []
            while lines[k][60:80].strip() != "END OF TEC MAP":
                lab = lines[k][60:80].strip()
                if lab == "EPOCH OF CURRENT MAP":
                    e = [int(lines[k][6 * j:6 * j + 6]) for j in range(6)]
                    days = (datetime.date(e[0], e[1], e[2]) - day0).days
                    t = days * 86400 + e[3] * 3600 + e[4] * 60 + e[5]
                    k += 1
                elif lab == "EXPONENT":
                    exp = int(lines[k][:6])
                    k += 1
                elif lab == "LAT/LON1/LON2/DLON/H":
                    k += 1
                    row = []
                    for r in range(nrec):
                        rec = lines[k + r]
                        n = min(16, nlon - 16 * r)
                        row += [int(rec[5 * j:5 * j + 5]) for j in range(n)]
                    k += nrec
                    ints.extend(row)
                    rows.append([v * 10.0 ** exp for v in row])
                else:
                    k += 1
            # rows run from LAT1 in DLAT steps; store as E[lat_index][lon_index]
            maps.append({"t": t, "rows": rows, "sum": sum(ints), "n": len(ints)})
        k += 1
    grid = {"lat1": lat1, "dlat": dlat, "nlat": nlat, "lon1": lon1, "dlon": dlon, "nlon": nlon}
    return hdr, grid, maps


def bilinear(grid, rows, lat, lon):
    # Axis positions; latitude axis runs from LAT1 with step DLAT (negative here).
    q = (lat - grid["lat1"]) / grid["dlat"]
    p = (lon - grid["lon1"]) / grid["dlon"]
    i = min(max(int(math.floor(q)), 0), grid["nlat"] - 2)
    j = min(max(int(math.floor(p)), 0), grid["nlon"] - 2)
    q -= i
    p -= j
    e00 = rows[i][j]
    e10 = rows[i][j + 1]
    e01 = rows[i + 1][j]
    e11 = rows[i + 1][j + 1]
    return (1 - p) * (1 - q) * e00 + p * (1 - q) * e10 + q * (1 - p) * e01 + p * q * e11


def wrap(lon):
    x = math.fmod(lon + 180.0, 360.0)
    if x < 0:
        x += 360.0
    return x - 180.0


def interp(grid, maps, t, lat, lon, rotate):
    i = 0
    while i + 2 < len(maps) and maps[i + 1]["t"] <= t:
        i += 1
    ta, tb = maps[i]["t"], maps[i + 1]["t"]
    la = lon if rotate == 0 else wrap(lon + rotate * 360.0 * (t - ta) / 86400.0)
    lb = lon if rotate == 0 else wrap(lon + rotate * 360.0 * (t - tb) / 86400.0)
    ea = bilinear(grid, maps[i]["rows"], lat, la)
    eb = bilinear(grid, maps[i + 1]["rows"], lat, lb)
    return (tb - t) / (tb - ta) * ea + (t - ta) / (tb - ta) * eb


def main(src, dst):
    hdr, grid, maps = read_ionex(src)
    h_km = hdr["HGT1 / HGT2 / DHGT"][0]
    out = io.StringIO()
    for idx, mp in enumerate(maps):
        out.write(f"N,{idx + 1},{mp['t']},{mp['sum']},{mp['n']}\n")
    for mp in maps:
        for lat in LATS:
            for lon in LONS:
                out.write(f"S,{mp['t']},{lat!r},{lon!r},{bilinear(grid, mp['rows'], lat, lon):.12f}\n")
    k = 0
    for t in TIMES:
        for lat in LATS:
            for lon in LONS:
                z = ZENITHS[k % 4]
                k += 1
                e2 = interp(grid, maps, t, lat, lon, 0)
                e3 = interp(grid, maps, t, lat, lon, +1)
                e3f = interp(grid, maps, t, lat, lon, -1)
                sz = R_KM / (R_KM + h_km) * math.sin(math.radians(z))
                stec = e3 / math.cos(math.asin(sz))
                delay = 40.3 * stec * 1e16 / (F_L1 * F_L1)
                out.write(
                    f"T,{t},{lat!r},{lon!r},{z!r},{e2:.12f},{e3:.12f},{e3f:.12f},"
                    f"{stec:.12f},{delay:.13f}\n"
                )
    with open(dst, "wb") as fh:
        with gzip.GzipFile(filename="", mode="wb", fileobj=fh, mtime=0) as gz:
            gz.write(out.getvalue().encode("ascii"))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
