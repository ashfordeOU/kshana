# SPDX-License-Identifier: AGPL-3.0-only
"""M2 area of interest: the Baltic sea points of reading 9 (README.md), from Natural Earth 1:10m.

    python3 -I area.py <ne_10m_land.zip> <ne_10m_lakes.zip> > baltic_sea_points.csv

Python standard library only: the shapefiles are read from the zips (polygon records, shape type 5),
and a point is inside a feature when a ray from it crosses the feature's rings an odd number of times
(holes included). Natural Earth is public domain.
"""
import hashlib
import io
import struct
import sys
import zipfile


def read_zip(path):
    data = open(path, "rb").read()
    z = zipfile.ZipFile(io.BytesIO(data))
    shp = next(n for n in z.namelist() if n.endswith(".shp"))
    version = next((z.read(n).decode().strip() for n in z.namelist() if n.endswith("VERSION.txt")), "?")
    return shp, version, hashlib.sha256(data).hexdigest(), z.read(shp)


def polygons(shp):
    """Each record as (bbox, rings), rings a list of [(x, y), ...]."""
    out, pos = [], 100
    while pos < len(shp):
        _, length = struct.unpack(">ii", shp[pos:pos + 8])
        rec = shp[pos + 8:pos + 8 + 2 * length]
        pos += 8 + 2 * length
        (stype,) = struct.unpack("<i", rec[:4])
        if stype == 0:
            continue
        if stype not in (5, 15, 25):
            raise SystemExit(f"shape type {stype} is not a polygon")
        bbox = struct.unpack("<4d", rec[4:36])
        nparts, npoints = struct.unpack("<2i", rec[36:44])
        parts = list(struct.unpack(f"<{nparts}i", rec[44:44 + 4 * nparts])) + [npoints]
        base = 44 + 4 * nparts
        pts = struct.unpack(f"<{2 * npoints}d", rec[base:base + 16 * npoints])
        rings = [[(pts[2 * i], pts[2 * i + 1]) for i in range(parts[r], parts[r + 1])]
                 for r in range(nparts)]
        out.append((bbox, rings))
    return out


def inside(x, y, feature):
    (xmin, ymin, xmax, ymax), rings = feature
    if not (xmin <= x <= xmax and ymin <= y <= ymax):
        return False
    crossings = 0
    for ring in rings:
        for (x1, y1), (x2, y2) in zip(ring, ring[1:] + ring[:1]):
            if (y1 > y) != (y2 > y) and x < x1 + (y - y1) * (x2 - x1) / (y2 - y1):
                crossings += 1
    return crossings % 2 == 1


def main():
    land_zip, lakes_zip = sys.argv[1], sys.argv[2]
    srcs = [read_zip(land_zip), read_zip(lakes_zip)]
    features = [f for _, _, _, shp in srcs for f in polygons(shp)]
    box = (9.5, 53.5, 30.5, 66.0)
    features = [f for f in features
                if not (f[0][2] < box[0] or f[0][0] > box[2] or f[0][3] < box[1] or f[0][1] > box[3])]
    print("# M2 area of interest (xval/m2-revisit-tip-and-cue/README.md, reading 9): sea cell centres of")
    print("# the 0.25 deg grid over 53.5-66.0 N, 9.5-30.5 E, outside Natural Earth 1:10m land and lakes,")
    print("# Kattegat and Skagerrak (lat > 55.65 and lon < 13.0) removed. Natural Earth is public domain.")
    for (name, version, sha, _), path in zip(srcs, (land_zip, lakes_zip)):
        print(f"# {path.rsplit('/', 1)[-1]}: {name}, version {version}, zip SHA-256 {sha}")
    print("lat_deg,lon_deg")
    n = 0
    lat = 53.625
    while lat < 66.0:
        lon = 9.625
        while lon < 30.5:
            keep = not (lat > 55.65 and lon < 13.0) and not any(inside(lon, lat, f) for f in features)
            if keep:
                print(f"{lat:.3f},{lon:.3f}")
                n += 1
            lon += 0.25
        lat += 0.25
    print(f"# {n} points", file=sys.stderr)


if __name__ == "__main__":
    main()
