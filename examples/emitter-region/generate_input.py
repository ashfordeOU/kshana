#!/usr/bin/env python3
"""Synthetic ADS-B input for `kshana interference-map locate`: nothing here is real.

A made-up source at 40.00 N, 30.00 W (open mid-Atlantic) with a 20 m antenna and a 150 km effective range
degrades the NIC/NACp of the aircraft inside its reach for 50 minutes. 80 made-up aircraft cross the area on straight
tracks; each has a fixed susceptibility. No random numbers: a fixed integer hash, so the file is reproducible.
Run: python3 -I generate_input.py > input/adsb-synthetic.csv
"""
import math

LAT0, LON0, HE, RANGE_KM = 40.0, -30.0, 20.0, 150.0
T0 = 1_772_359_200  # 2026-03-01T10:00:00Z
P_DET = 0.6


def h(*k):
    x = 0x9E3779B97F4A7C15
    for v in k:
        x = ((x ^ (v + 0x7F4A7C15)) * 0xBF58476D1CE4E5B9) & 0xFFFFFFFFFFFFFFFF
        x ^= x >> 29
    return (x & 0xFFFFFF) / float(0x1000000)


def km_to_deg(dx, dy):
    return LAT0 + dy / 111.195, LON0 + dx / (111.195 * math.cos(math.radians(LAT0)))


print("timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp,source_type")
for a in range(80):
    ident = "SYN-%03d" % a
    x0, y0 = -330 + 660 * h(a, 1), -330 + 660 * h(a, 2)
    hdg = 2 * math.pi * h(a, 3)
    alt_ft = 30000 + 8000 * h(a, 4)
    susceptible = h(a, 5) < P_DET
    # good reports before the session, far to the north
    for k in range(6):
        t = T0 - 3600 + 60 * k
        lat, lon = km_to_deg(x0, 600)
        print("%d,%s,%.5f,%.5f,%d,10,11,adsb_icao" % (t, ident, lat, lon, alt_ft))
    for k in range(25):
        s = 120 * k
        x, y = x0 + 0.23 * s * math.sin(hdg), y0 + 0.23 * s * math.cos(hdg)
        reach = min(RANGE_KM, 4.1219 * (math.sqrt(alt_ft * 0.3048) + math.sqrt(HE)))
        hit = math.hypot(x, y) <= reach and susceptible
        lat, lon = km_to_deg(x, y)
        nic, nacp = (0, 0) if hit else (10, 11)
        print("%d,%s,%.5f,%.5f,%d,%d,%d,adsb_icao" % (T0 + s, ident, lat, lon, alt_ft, nic, nacp))
