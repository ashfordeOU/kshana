# SPDX-License-Identifier: AGPL-3.0-only
"""Write a synthetic IONEX 1.0 file with the structure of the CODE GIM latitude crop the
pre-registered test was designed on (25 hourly TEC and RMS maps from 2018-05-13 00:00, latitudes
30.0 to 5.0 by -2.5, longitudes -180 to 180 by 5, exponent -1, shell height 450 km, mapping NONE)
and an invented vertical-TEC field: a diurnal bulge fixed in local solar time plus a latitude
gradient and a small longitude ripple. No third-party data. Deterministic (pure arithmetic).

Usage: python3 -I gen_synthetic.py synthetic/map.18i
Then:  python3 -I reference_interp.py synthetic/map.18i synthetic/reference_vtec.csv.gz
"""
import math
import sys


def rec(text, label):
    return text.ljust(60)[:60] + label.ljust(20)


def epoch(day, hour):
    # 2018-05-13 + hour hours; hour 24 is 2018-05-14 00:00.
    d, h = (13, hour) if hour < 24 else (14, 0)
    return "%6d%6d%6d%6d%6d%6d" % (2018, 5, d, h, 0, 0)


def tec(hour, lat, lon):
    local = (hour + lon / 15.0) % 24.0
    diurnal = 25.0 * max(0.0, math.cos(math.pi * (local - 14.0) / 12.0)) ** 2
    return 8.0 + diurnal * math.cos(math.radians(lat - 12.0)) + 0.1 * (30.0 - lat) + 1.5 * math.sin(math.radians(3.0 * lon))


def rms(hour, lat, lon):
    return 1.0 + 0.5 * math.cos(math.radians(lon + 15.0 * hour)) + 0.02 * lat


out = []
out.append(rec("     1.0            IONOSPHERE MAPS     GNSS", "IONEX VERSION / TYPE"))
out.append(rec("gen_synthetic.py    Kshana tests", "PGM / RUN BY / DATE"))
out.append(rec("SYNTHETIC TEC FIELD FOR A FORMULA CHECK; NOT A REAL MAP", "COMMENT"))
out.append(rec(epoch(13, 0), "EPOCH OF FIRST MAP"))
out.append(rec(epoch(13, 24), "EPOCH OF LAST MAP"))
out.append(rec("  3600", "INTERVAL"))
out.append(rec("    25", "# OF MAPS IN FILE"))
out.append(rec("  NONE", "MAPPING FUNCTION"))
out.append(rec("    10.0", "ELEVATION CUTOFF"))
out.append(rec("  6371.0", "BASE RADIUS"))
out.append(rec("     2", "MAP DIMENSION"))
out.append(rec("   450.0 450.0   0.0", "HGT1 / HGT2 / DHGT"))
out.append(rec("    30.0   5.0  -2.5", "LAT1 / LAT2 / DLAT"))
out.append(rec("  -180.0 180.0   5.0", "LON1 / LON2 / DLON"))
out.append(rec("    -1", "EXPONENT"))
out.append(rec("", "END OF HEADER"))
lats = [30.0 - 2.5 * i for i in range(11)]
lons = [-180.0 + 5.0 * j for j in range(73)]
for kind, start, end, field in (("TEC", "START OF TEC MAP", "END OF TEC MAP", tec),
                                ("RMS", "START OF RMS MAP", "END OF RMS MAP", rms)):
    for k in range(25):
        out.append(rec("%6d" % (k + 1), start))
        out.append(rec(epoch(13, k), "EPOCH OF CURRENT MAP"))
        for lat in lats:
            out.append(rec("  %6.1f%6.1f%6.1f%6.1f%6.1f" % (lat, -180.0, 180.0, 5.0, 450.0), "LAT/LON1/LON2/DLON/H"))
            vals = ["%5d" % round(10.0 * field(k, lat, lon)) for lon in lons]
            for i in range(0, 73, 16):
                out.append("".join(vals[i:i + 16]))
        out.append(rec("%6d" % (k + 1), end))
out.append(rec("", "END OF FILE"))
with open(sys.argv[1], "w") as f:
    f.write("\n".join(out) + "\n")
