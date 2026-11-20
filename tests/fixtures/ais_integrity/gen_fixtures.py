#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Writes the synthetic AIS fixtures of tests/ais_integrity.rs (docs/AIS-INTEGRITY.md).

Every track here is made up: positions, identifiers and times are synthetic. Two files are shaped
after patterns described in public reporting (many vessels in one area jumping at the same moment;
berthed vessels whose reported positions drift while they report no speed); they are not the
recorded data of any case. Standard library only; the output is the same bytes on every run.

    python3 tests/fixtures/ais_integrity/gen_fixtures.py [<out-dir>]
"""
import json, math, os, random, sys

HERE = sys.argv[1] if len(sys.argv) > 1 else os.path.dirname(os.path.abspath(__file__))
R = 6378137.0
KN = 1852.0 / 3600.0


def move(lat, lon, east_m, north_m):
    return (lat + math.degrees(north_m / R),
            lon + math.degrees(east_m / (R * math.cos(math.radians(lat)))))


def iso(t):
    import datetime
    return datetime.datetime.fromtimestamp(t, datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


class Csv:
    def __init__(self, cols):
        self.cols = cols
        self.rows = []

    def add(self, **kw):
        self.rows.append(kw)

    def write(self, name):
        self.rows.sort(key=lambda r: (r["t"], str(r["vessel_id"])))
        with open(os.path.join(HERE, name), "w", newline="\n") as f:
            f.write(",".join(self.cols) + "\n")
            for r in self.rows:
                out = []
                for c in self.cols:
                    v = r.get(c, "")
                    if c == "timestamp":
                        v = iso(r["t"])
                    elif isinstance(v, float):
                        v = f"{v:.6f}" if c in ("lat", "lon") else f"{v:.1f}"
                    out.append(str(v))
                f.write(",".join(out) + "\n")


def cruise(csv, rnd, vid, t0, n, dt, lat, lon, course_deg, kn, offset=None, onset=None, extra=None, noise=5.0):
    """A straight track; `offset` (east, north metres) is added to every report from `onset`."""
    e = math.sin(math.radians(course_deg)) * kn * KN
    nn = math.cos(math.radians(course_deg)) * kn * KN
    for k in range(n):
        t = t0 + k * dt
        la, lo = move(lat, lon, e * k * dt + rnd.gauss(0, noise), nn * k * dt + rnd.gauss(0, noise))
        if offset and t >= onset:
            la, lo = move(la, lo, offset[0], offset[1])
        row = dict(t=t, vessel_id=vid, lat=la, lon=lo, sog_kn=float(kn))
        if extra:
            row.update(extra(k, t))
        csv.add(**row)


def labels_write(name, labels):
    with open(os.path.join(HERE, name), "w", newline="\n") as f:
        f.write(json.dumps(labels, indent=1, sort_keys=True) + "\n")


def simultaneous_jump():
    rnd = random.Random(31)
    c = Csv(["timestamp", "vessel_id", "lat", "lon", "sog_kn"])
    t0 = 1735646400  # 2024-12-31T12:00:00Z
    flags = {}
    for i in range(8):
        vid = f"3660000{i + 1:02d}"
        cruise(c, rnd, vid, t0 + i * 7, 120, 60, 28.3 + 0.05 * i, -90.4 + 0.07 * i, 60 + 15 * i, 10 + i,
               offset=(-28000.0, 31000.0), onset=t0 + 3600)
        flags[vid] = ["position_jump"]
    for i in range(4):
        vid = f"3660001{i + 1:02d}"
        cruise(c, rnd, vid, t0 + i * 11, 120, 60, 24.6 + 0.1 * i, -84.2 + 0.1 * i, 200, 13)
        flags[vid] = []
    c.write("simultaneous_jump.csv")
    return {"flags": flags, "events": [sorted(v for v, f in flags.items() if f)]}


def berth_drift():
    rnd = random.Random(44)
    c = Csv(["timestamp", "vessel_id", "lat", "lon", "sog_kn", "nav_status"])
    t0 = 1717200000  # 2024-06-01T00:00:00Z
    flags = {}
    for i in range(3):
        vid = f"2440000{i + 1:02d}"
        lat, lon = 54.50 + 0.004 * i, 18.00 + 0.006 * i
        for k in range(180):
            t = t0 + k * 60
            drift = max(0, t - (t0 + 3600)) * 1.5 * KN
            la, lo = move(lat, lon, -drift * math.sin(math.radians(20)) + rnd.gauss(0, 4),
                          -drift * math.cos(math.radians(20)) + rnd.gauss(0, 4))
            c.add(t=t, vessel_id=vid, lat=la, lon=lo, sog_kn=0.0, nav_status=5)
        flags[vid] = ["drift_while_stationary"]
    for i in range(2):
        vid = f"2440001{i + 1:02d}"
        lat, lon = 54.40 + 0.01 * i, 18.10
        for k in range(180):
            t = t0 + k * 60
            th = 2 * math.pi * k / 90.0
            la, lo = move(lat, lon, 150 * math.cos(th) + rnd.gauss(0, 4), 150 * math.sin(th) + rnd.gauss(0, 4))
            c.add(t=t, vessel_id=vid, lat=la, lon=lo, sog_kn=0.2, nav_status=1)
        flags[vid] = []
    c.write("berth_drift.csv")
    return {"flags": flags, "events": [sorted(v for v, f in flags.items() if f)]}


def two_areas():
    rnd = random.Random(2)
    c = Csv(["timestamp", "vessel_id", "lat", "lon", "sog_kn"])
    t0 = 1740000000
    flags = {}
    events = []
    for g, (lat, lon, mid) in enumerate([(55.2, 15.4, "219"), (59.6, 24.0, "276")]):
        ev = []
        for i in range(5):
            vid = f"{mid}0000{g}{i}"
            cruise(c, rnd, vid, t0 + i * 5, 90, 60, lat + 0.04 * i, lon + 0.05 * i, 90 * i, 11,
                   offset=(15000.0, -12000.0), onset=t0 + 2400)
            flags[vid] = ["position_jump"]
            ev.append(vid)
        events.append(sorted(ev))
    c.write("two_areas.csv")
    return {"flags": flags, "events": events}


def imo_with_check(base6):
    d = [int(x) for x in f"{base6:06d}"]
    return base6 * 10 + sum(d[k] * (7 - k) for k in range(6)) % 10


def patterns():
    rnd = random.Random(7)
    c = Csv(["timestamp", "vessel_id", "lat", "lon", "sog_kn", "stw_kn", "imo"])
    flags = {}
    hour = 3600
    t = 1750000000
    # Circling at 2 km radius, 15 degrees a minute (about 17 knots).
    lat0, lon0 = 57.5, 19.0
    for k in range(50):
        th = k * math.radians(15)
        la, lo = move(lat0, lon0, 2000 * math.cos(th), 2000 * math.sin(th))
        c.add(t=t + k * 60, vessel_id="230000001", lat=la, lon=lo, sog_kn=17.0)
    flags["230000001"] = ["circle"]
    # Reported speed far above any ship's, positions at 12 knots.
    t += 3 * hour
    cruise(c, rnd, "230000002", t, 30, 60, 57.0, 21.0, 90, 12,
           extra=lambda k, tt: {"sog_kn": 95.0} if 10 <= k < 14 else {})
    flags["230000002"] = ["reported_speed", "speed_inconsistency"]
    # Speed through the water 12 knots, over ground 24 knots.
    t += 3 * hour
    cruise(c, rnd, "230000003", t, 20, 60, 56.8, 17.0, 0, 24,
           extra=lambda k, tt: {"stw_kn": 12.0} if 5 <= k < 10 else {})
    flags["230000003"] = ["speed_inconsistency"]
    # Cruising from the sea onto the land polygon (56.0-56.5 N, 12.0-13.0 E).
    t += 3 * hour
    cruise(c, rnd, "230000004", t, 30, 60, 55.95, 12.5, 0, 14)
    flags["230000004"] = ["on_land"]
    # Stationary at a listed place (an airfield in places.csv), outside the land polygon.
    t += 3 * hour
    cruise(c, rnd, "230000005", t, 6, 60, 54.2, 10.5, 0, 0)
    flags["230000005"] = ["at_listed_place"]
    # One identifier from two places 80 km apart, alternating every 30 s.
    t += 3 * hour
    for k in range(40):
        if k % 2 == 0:
            la, lo = move(56.0, 19.0, k * 30 * 10 * KN, 0)
        else:
            la, lo = move(56.7, 19.3, 0, k * 30 * 10 * KN)
        c.add(t=t + k * 30, vessel_id="230000006", lat=la, lon=lo, sog_kn=10.0)
    flags["230000006"] = ["identity_conflict"]
    # Two identifiers stating one IMO number at overlapping times; one identifier stating two.
    t += 3 * hour
    shared = imo_with_check(907472)
    cruise(c, rnd, "230000007", t, 10, 60, 58.0, 20.0, 45, 10, extra=lambda k, tt: {"imo": shared})
    cruise(c, rnd, "230000008", t + 120, 10, 60, 58.5, 21.0, 45, 10, extra=lambda k, tt: {"imo": shared})
    flags["230000007"] = ["shared_imo"]
    flags["230000008"] = ["shared_imo"]
    a, b = imo_with_check(917618), imo_with_check(930001)
    cruise(c, rnd, "230000009", t, 10, 60, 59.0, 22.0, 45, 10,
           extra=lambda k, tt: {"imo": a if k < 5 else b})
    flags["230000009"] = ["identity_change"]
    # An identifier that cannot be an MMSI, and a stated IMO number that fails its check digit.
    t += 3 * hour
    cruise(c, rnd, "123456789", t, 10, 60, 57.2, 18.0, 90, 10)
    flags["123456789"] = ["identity_format"]
    bad = imo_with_check(912345) + 1 if imo_with_check(912345) % 10 != 9 else imo_with_check(912345) - 1
    cruise(c, rnd, "230000010", t, 10, 60, 57.3, 18.5, 90, 10, extra=lambda k, tt: {"imo": bad})
    flags["230000010"] = ["identity_format"]
    # Six vessels at one position within one ten-minute window.
    t += 3 * hour
    t = (t // 600) * 600
    for i in range(6):
        vid = f"2300001{i + 1:02d}"
        for k in range(5):
            c.add(t=t + 20 + k * 60 + i, vessel_id=vid, lat=57.0, lon=20.0, sog_kn=0.0)
        flags[vid] = ["common_position"]
    common = sorted(f"2300001{i + 1:02d}" for i in range(6))
    # Ordinary traffic.
    t += 3 * hour
    for i in range(4):
        vid = f"2300002{i + 1:02d}"
        cruise(c, rnd, vid, t + i * 13, 60, 60, 55.5 + 0.1 * i, 16.0 + 0.2 * i, 30 * i, 8 + 3 * i)
        flags[vid] = []
    c.write("patterns.csv")
    with open(os.path.join(HERE, "places.csv"), "w", newline="\n") as f:
        f.write("name,lat,lon,radius_m\nExample airfield,54.2,10.5,3000\n")
    with open(os.path.join(HERE, "land.geojson"), "w", newline="\n") as f:
        f.write(json.dumps({"type": "Polygon",
                            "coordinates": [[[12.0, 56.0], [13.0, 56.0], [13.0, 56.5], [12.0, 56.5], [12.0, 56.0]]]})
                + "\n")
    return {"flags": flags, "events": [common]}


if __name__ == "__main__":
    labels = {
        "simultaneous_jump.csv": simultaneous_jump(),
        "berth_drift.csv": berth_drift(),
        "two_areas.csv": two_areas(),
        "patterns.csv": patterns(),
    }
    labels_write("labels.json", labels)
