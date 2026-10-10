#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Independent-oracle reference for the interference map: decoding semantics and geometry.

Oracle versions (pinned; install in a clean venv):

    pip install pyModeS==2.21 pyais==3.3.0 shapely==2.2.0 geographiclib==2.1 pyproj==3.8.0 numpy==2.5.3

pyModeS is GPL-3.0 and is used here in this offline script only: nothing of it is shipped, linked
or copied into Kshana, and CI needs no Python. Run from the repository root:

    python3 scripts/gen_interference_map_ref.py

Writes tests/fixtures/interference_map_ref/*.json. The Rust test tests/interference_map_reference.rs
compares Kshana's output with these files. Every input is synthetic (seeded); no real track, vessel
or aircraft is used and no identifier of one appears.

Tolerances are pre-registered in tests/fixtures/interference_map_ref/PREREGISTRATION.md, committed
before this script was first run. They live in the Rust test, not here: this script only records
what the oracles say.

What these fixtures can support: decoding semantics (how the accuracy and integrity codes and the
AIS field values read) and geometry (grid cell, route length per cell state, inland masking). They
say nothing about whether a cell flagged degraded or anomalous is interference.
"""
import json
import math
import os

import numpy as np
import pyproj
import shapely
from geographiclib.geodesic import Geodesic
from pyModeS.decoder import adsb
from pyais import decode as ais_decode
from shapely.geometry import LineString, MultiPolygon, Point, Polygon, box

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "..", "tests", "fixtures", "interference_map_ref")
RNG = np.random.default_rng(20261010)
WGS84 = Geodesic.WGS84


def dump(name, obj):
    with open(os.path.join(OUT, name), "w") as f:
        json.dump(obj, f, sort_keys=True, separators=(",", ":"))
        f.write("\n")


# ---------------------------------------------------------------------------------------------
# (a) ADS-B accuracy and integrity fields: pyModeS decoding of synthetic DF17 frames
# ---------------------------------------------------------------------------------------------
def crc24(value88):
    """Mode S CRC-24 (generator 0x1FFF409) of an 88-bit value."""
    reg = value88 << 24
    for i in range(87, -1, -1):
        if reg & (1 << (i + 24)):
            reg ^= 0x1FFF409 << i
    return reg & 0xFFFFFF


def df17(me56, icao=0xA00001):
    head = ((17 << 3) | 5) << 24 | icao
    pre = (head << 56) | me56
    return f"{(pre << 24) | crc24(pre):028X}"


def opstatus_frame(nacp, version=2, nica=0):
    # ME: TC=31 (bits 0-4), subtype 0 (5-7), version (40-42), NIC supplement A (43), NACp (44-47)
    return df17((31 << 51) | (version << 13) | (nica << 12) | (nacp << 8))


def position_frame(tc, nic_b=0):
    return df17((tc << 51) | (nic_b << 48))


def adsb_codes():
    nacp = []
    for code in range(0, 12):
        msg = opstatus_frame(code)
        got, epu, _vepu = adsb.nac_p(msg)
        assert got == code, (got, code)
        nacp.append({"code": code, "frame": msg, "epu_m": epu})
    nic = []
    skipped = 0
    no_row = 0
    for tc in list(range(5, 19)) + [20, 21, 22]:
        msg = position_frame(tc)
        for nics in (0, 1):
            try:
                n, rc, _vpl = adsb.nic_v1(msg, nics)
            except (KeyError, RuntimeError):
                skipped += 1
                continue
            if n != 0 and rc is None:
                no_row += 1  # the oracle table has no row for this NIC and supplement
                continue
            nic.append({"frame": msg, "version": 1, "tc": tc, "supplements": [nics], "nic": n, "rc_m": rc})
        for nica in (0, 1):
            for nicbc in (0, 1):
                try:
                    n, rc = adsb.nic_v2(msg, nica, nicbc)
                except (KeyError, RuntimeError):
                    skipped += 1
                    continue
                if n is None:
                    skipped += 1
                    continue
                if n != 0 and rc is None:
                    no_row += 1
                    continue
                nic.append(
                    {"frame": msg, "version": 2, "tc": tc, "supplements": [nica, nicbc], "nic": n, "rc_m": rc}
                )
    return {
        "oracle": "pyModeS 2.21 adsb.nac_p / adsb.nic_v1 / adsb.nic_v2 on synthetic DF17 frames",
        "nacp": nacp,
        "nic": nic,
        "nic_combinations_the_oracle_rejected": skipped,
        "nic_combinations_without_a_table_row": no_row,
    }


# ---------------------------------------------------------------------------------------------
# (b) AIS field values: pyais decoding of AIVDM type 1 sentences packed here from raw fields
# ---------------------------------------------------------------------------------------------
def pack(fields):
    v = 0
    n = 0
    for value, bits in fields:
        if value < 0:
            value += 1 << bits  # two's complement
        assert 0 <= value < (1 << bits), (value, bits)
        v = (v << bits) | value
        n += bits
    return v, n


def aivdm(lat_raw, lon_raw, speed_raw, mmsi):
    bits, n = pack(
        [
            (1, 6),  # message type 1
            (0, 2),  # repeat
            (mmsi, 30),
            (0, 4),  # navigation status
            (-128, 8),  # rate of turn: not available
            (speed_raw, 10),
            (1, 1),  # position accuracy
            (lon_raw, 28),
            (lat_raw, 27),
            (3600, 12),  # course: not available
            (511, 9),  # heading: not available
            (60, 6),  # time stamp: not available
            (0, 2),
            (0, 3),
            (0, 1),
            (0, 19),
        ]
    )
    assert n == 168
    chars = []
    for k in range(28):
        sixbit = (bits >> (168 - 6 * (k + 1))) & 0x3F
        chars.append(chr(sixbit + 48 if sixbit < 40 else sixbit + 56))
    body = "AIVDM,1,1,,A," + "".join(chars) + ",0"
    ck = 0
    for ch in body:
        ck ^= ord(ch)
    return f"!{body}*{ck:02X}"


def ais_fields():
    rows = []
    # Raw field encodings of ITU-R M.1371: position in 1/10000 minute, speed in 1/10 knot.
    LAT_NA, LON_NA, SPEED_NA = 91 * 600000, 181 * 600000, 1023
    cases = []
    for _ in range(80):  # ordinary values
        cases.append(
            (
                round(RNG.uniform(-90, 90) * 600000),
                round(RNG.uniform(-180, 180) * 600000),
                int(RNG.integers(0, 1023)),
            )
        )
    for lat in (90, -90):
        for lon in (180, -180):
            cases.append((lat * 600000, lon * 600000, 0))
    for sp in (0, 1, 700, 701, 1021, 1022, 1023):
        cases.append((round(59.5 * 600000), round(24.5 * 600000), sp))
    cases += [
        (LAT_NA, LON_NA, SPEED_NA),
        (LAT_NA, round(24.5 * 600000), 100),
        (round(59.5 * 600000), LON_NA, 100),
        (0, 0, 10),  # (0, 0): valid to the standard, refused by Kshana's own rule; excluded from the check
    ]
    for k, (la, lo, sp) in enumerate(cases):
        s = aivdm(la, lo, sp, 999000000 + k)
        d = ais_decode(s).asdict()
        lat, lon, speed = float(d["lat"]), float(d["lon"]), float(d["speed"])
        rows.append(
            {
                "sentence": s,
                "lat": round(lat, 9),
                "lon": round(lon, 9),
                "speed_kn": round(speed, 3),
                # What the decoded values mean, from the decoded values alone: a latitude over
                # 90 or a longitude over 180 is not a position.
                "position_available": not (lat > 90 or lon > 180),
                "speed_available": speed < 102.3,
                "null_island": la == 0 and lo == 0,
            }
        )
    # The oracle must read the raw not-available values as the standard says.
    na = rows[-4]
    assert (na["lat"], na["lon"], na["speed_kn"]) == (91.0, 181.0, 102.3), na
    return {"oracle": "pyais 3.3.0 decode of AIVDM type 1 sentences packed from raw fields", "frames": rows}


# ---------------------------------------------------------------------------------------------
# (c) Grid cell assignment: shapely `covers` on cell polygons
# ---------------------------------------------------------------------------------------------
def cell_box(deg, i, j):
    w, s = j * deg - 180.0, i * deg - 90.0
    return box(w, s, min(w + deg, 180.0), min(s + deg, 90.0))


def covering(deg, lat, lon):
    rows = math.ceil(180.0 / deg)
    cols = math.ceil(360.0 / deg)
    i0 = int(math.floor((lat + 90.0) / deg))
    j0 = int(math.floor((lon + 180.0) / deg))
    out = set()
    for i in range(max(i0 - 1, 0), min(i0 + 2, rows)):
        for j in range(j0 - 1, j0 + 2):
            jm = j % cols
            for shift in (0.0, 360.0, -360.0):  # the antimeridian: the same meridian twice
                if cell_box(deg, i, jm).covers(Point(lon + shift, lat)):
                    out.add((i, jm))
    return sorted(out)


def edge_distance(deg, lat, lon):
    i = int(math.floor((lat + 90.0) / deg))
    j = int(math.floor((lon + 180.0) / deg))
    b = cell_box(deg, i, j)
    return b.exterior.distance(Point(lon, lat))


def grid_points():
    pts = []
    for deg in (0.5, 0.25, 1.0, 0.07):
        rows = math.ceil(180.0 / deg)
        for _ in range(350):
            lat = round(float(RNG.uniform(-90, 90)), 9)
            lon = round(float(RNG.uniform(-180, 180)), 9)
            if edge_distance(deg, lat, lon) < 1e-7:
                continue
            c = covering(deg, lat, lon)
            assert len(c) == 1, (deg, lat, lon, c)
            pts.append({"deg": deg, "lat": lat, "lon": lon, "strict": True, "covering": [list(x) for x in c]})
        # near the edges, on both sides (still strictly inside one cell)
        for _ in range(80):
            i = int(RNG.integers(0, rows - 1))
            j = int(RNG.integers(0, math.ceil(360.0 / deg) - 1))
            lat = round(i * deg - 90.0 + float(RNG.choice([-1, 1])) * 1e-7 + deg * float(RNG.choice([0, 1])), 9)
            lon = round(j * deg - 180.0 + float(RNG.choice([-1, 1])) * 1e-7 + deg * float(RNG.choice([0, 1])), 9)
            if not (-90 < lat < 90 and -180 < lon < 180) or edge_distance(deg, lat, lon) < 1e-9:
                continue
            c = covering(deg, lat, lon)
            if len(c) == 1:
                pts.append({"deg": deg, "lat": lat, "lon": lon, "strict": True, "covering": [list(x) for x in c]})
        # exactly on an edge, the pole, the antimeridian: any covering cell is acceptable
        specials = [(90.0, 10.0), (-90.0, 10.0), (90.0, 180.0), (-90.0, -180.0), (0.0, 180.0), (0.0, -180.0),
                    (45.0, 180.0), (45.0, -180.0), (89.9999999, 179.9999999)]
        if deg != 0.07:  # edges are exact in binary only for sizes that divide into powers of two
            specials += [(10.5, 20.5), (0.0, 0.0), (-45.0, 90.0), (10.5, 20.25), (30.0, -100.0)]
        for lat, lon in specials:
            c = covering(deg, lat, lon)
            assert c, (deg, lat, lon)
            pts.append({"deg": deg, "lat": lat, "lon": lon, "strict": False, "covering": [list(x) for x in c]})
    return {"oracle": "shapely 2.2.0 covers() on cell boxes", "points": pts}


# ---------------------------------------------------------------------------------------------
# (d) Route exposure: shapely route/cell intersection, GeographicLib geodesic lengths
# ---------------------------------------------------------------------------------------------
def geod_len(coords):
    """Length in metres of a lon/lat polyline, each part densified to at most 5 km, WGS84 geodesic."""
    total = 0.0
    for (x0, y0), (x1, y1) in zip(coords[:-1], coords[1:]):
        d = WGS84.Inverse(y0, x0, y1, x1)["s12"]
        n = max(1, math.ceil(d / 5000.0))
        px, py = x0, y0
        for k in range(1, n + 1):
            qx, qy = x0 + (x1 - x0) * k / n, y0 + (y1 - y0) * k / n
            total += WGS84.Inverse(py, px, qy, qx)["s12"]
            px, py = qx, qy
    return total


def line_parts(g):
    if g.is_empty:
        return []
    if g.geom_type == "LineString":
        return [g]
    if hasattr(g, "geoms"):
        return [p for sub in g.geoms for p in line_parts(sub)]
    return []


ROUTES = [
    ("diagonal", 0.5, [(40.0, 0.0), (50.0, 10.0)]),
    ("meridional", 0.5, [(10.0, 30.1), (20.0, 30.1)]),
    ("high latitude zonal", 0.5, [(60.25, 10.0), (60.25, 30.0)]),
    ("antimeridian zonal", 0.5, [(10.25, 170.0), (10.25, -170.0)]),
    ("antimeridian diagonal", 0.25, [(-10.0, 175.0), (5.0, -175.0)]),
    ("zigzag", 0.5, [(45.0, 5.0), (47.5, 9.0), (44.0, 14.0), (46.0, 18.5)]),
    ("far north", 0.25, [(70.0, -20.0), (71.0, 20.0)]),
    ("southern", 0.5, [(-40.0, -60.0), (-45.0, -50.0)]),
]


def route_case(name, deg, route):
    cols = math.ceil(360.0 / deg)
    # unwrap longitudes so the path is continuous across the antimeridian
    lons = [route[0][1]]
    for (_, lo0), (_, lo1) in zip(route[:-1], route[1:]):
        d = (lo1 - lo0 + 180.0) % 360.0 - 180.0
        lons.append(lons[-1] + d)
    pts = [(lo, la) for (la, _), lo in zip(route, lons)]
    # cells over the route's bounding box, statuses drawn at random
    lo_min, lo_max = min(p[0] for p in pts), max(p[0] for p in pts)
    la_min, la_max = min(p[1] for p in pts), max(p[1] for p in pts)
    i_lo, i_hi = int(math.floor((la_min + 90) / deg)) - 1, int(math.floor((la_max + 90) / deg)) + 1
    j_lo, j_hi = int(math.floor((lo_min + 180) / deg)) - 1, int(math.floor((lo_max + 180) / deg)) + 1
    status = {}
    for i in range(i_lo, i_hi + 1):
        for j in range(j_lo, j_hi + 1):
            r = RNG.random()
            st = "degraded" if r < 0.2 else "not_degraded" if r < 0.6 else "insufficient_sample" if r < 0.75 else None
            if st:
                status[(i, j % cols)] = st
    klass = {"degraded": 0.0, "not_degraded": 0.0, "insufficient_sample": 0.0, "not_observed": 0.0}
    total, pieces = 0.0, 0
    for p0, p1 in zip(pts[:-1], pts[1:]):
        leg = LineString([p0, p1])
        for i in range(i_lo, i_hi + 1):
            for j in range(j_lo, j_hi + 1):
                for part in line_parts(leg.intersection(cell_box_unwrapped(deg, i, j))):
                    if part.length <= 0:
                        continue
                    n = geod_len(list(part.coords))
                    key = status.get((i, j % cols), "not_observed")
                    klass[key] += n
                    total += n
                    pieces += 1
    return {
        "name": name,
        "deg": deg,
        "route": [[round(la, 6), round(lo, 6)] for la, lo in route],
        "cells": [[i, j, st] for (i, j), st in sorted(status.items())],
        "oracle": {"route_m": total, "class_m": klass, "pieces": pieces},
    }


def cell_box_unwrapped(deg, i, j):
    w, s = j * deg - 180.0, i * deg - 90.0
    return box(w, s, w + deg, s + deg)


def route_exposure():
    return {
        "oracle": "shapely 2.2.0 intersection + GeographicLib 2.1 WGS84 geodesic lengths",
        "cases": [route_case(*r) for r in ROUTES],
    }


# ---------------------------------------------------------------------------------------------
# (e) Land masking: shapely contains + pyproj azimuthal-equidistant distance to the boundary
# ---------------------------------------------------------------------------------------------
BUFFER_M = 2000.0
LATTICE = 0.005
BAND_M = 20.0  # 1% of the buffer


def ragged(cx, cy, rx, ry, n, seed):
    rng = np.random.default_rng(seed)
    th = np.linspace(0, 2 * np.pi, n, endpoint=False)
    r = 1 + 0.25 * np.sin(5 * th + rng.uniform(0, 6)) + 0.08 * np.sin(23 * th + rng.uniform(0, 6))
    return [(round(cx + rx * rr * math.cos(t), 6), round(cy + ry * rr * math.sin(t), 6)) for rr, t in zip(r, th)]


def closed(ring):
    """A GeoJSON ring: the first vertex repeated at the end."""
    return [list(p) for p in ring] + [list(ring[0])]


def land_fixture():
    # (name, polygon exterior, holes)
    shapes = [
        ("island with a lake", ragged(10.0, 35.0, 0.5, 0.4, 300, 1), [ragged(10.05, 35.02, 0.12, 0.09, 60, 2)]),
        ("high latitude island A", ragged(20.0, 65.0, 1.2, 0.5, 300, 3), []),
        ("high latitude island B", ragged(23.5, 65.2, 0.7, 0.3, 200, 4), []),
        ("southern island", ragged(150.0, -35.0, 0.6, 0.45, 300, 5), []),
    ]
    polys = [Polygon(ext, holes) for _, ext, holes in shapes]
    assert all(p.is_valid for p in polys), [p.is_valid for p in polys]
    gj = {
        "type": "FeatureCollection",
        "features": [
            {
                "type": "Feature",
                "properties": {"name": nm},
                "geometry": {"type": "Polygon", "coordinates": [closed(ext)] + [closed(h) for h in holes]},
            }
            for nm, ext, holes in shapes
        ],
    }
    # lattice-centre points around each island
    pts = []
    excluded = 0
    for (nm, ext, holes), poly in zip(shapes, polys):
        minx, miny, maxx, maxy = poly.bounds
        seen = set()
        while len(seen) < 250:
            lat = RNG.uniform(miny - 0.12, maxy + 0.12)
            lon = RNG.uniform(minx - 0.2, maxx + 0.2)
            ky, kx = math.floor(lat / LATTICE), math.floor(lon / LATTICE)
            if (ky, kx) in seen:
                continue
            seen.add((ky, kx))
            lat_c, lon_c = round((ky + 0.5) * LATTICE, 6), round((kx + 0.5) * LATTICE, 6)
            inside = poly.contains(Point(lon_c, lat_c))
            dist = boundary_distance_m(poly, lat_c, lon_c)
            if abs(dist - BUFFER_M) < BAND_M:
                excluded += 1
                continue
            pts.append(
                {"polygon": nm, "lat": lat_c, "lon": lon_c, "inland": bool(inside and dist >= BUFFER_M),
                 "inside": bool(inside), "boundary_distance_m": round(dist, 3)}
            )
    return {
        "oracle": "shapely 2.2.0 contains(); pyproj 3.8.0 AEQD distance to the polygon boundary densified at 0.01 degree",
        "buffer_m": BUFFER_M,
        "ambiguity_band_m": BAND_M,
        "points_excluded_in_band": excluded,
        "polygons": gj,
        "points": pts,
    }


def boundary_distance_m(poly, lat, lon):
    proj = pyproj.Proj(proj="aeqd", lat_0=lat, lon_0=lon, datum="WGS84", units="m")
    dense = shapely.segmentize(poly.boundary, 0.01)
    lines = list(dense.geoms) if hasattr(dense, "geoms") else [dense]
    best = float("inf")
    for ln in lines:
        xs, ys = zip(*ln.coords)
        px, py = proj(list(xs), list(ys))
        best = min(best, LineString(list(zip(px, py))).distance(Point(0.0, 0.0)))
    return best


def main():
    os.makedirs(OUT, exist_ok=True)
    dump("adsb_codes.json", adsb_codes())
    dump("ais_fields.json", ais_fields())
    dump("grid_cells.json", grid_points())
    dump("route_exposure.json", route_exposure())
    dump("land_mask.json", land_fixture())
    print("wrote", OUT)


if __name__ == "__main__":
    main()
