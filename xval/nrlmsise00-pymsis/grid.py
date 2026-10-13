"""The NRLMSISE-00 comparison grid (shared by the pymsis and C-port oracle generators).

Every input is an integer, so it is exact in the single-precision Fortran that pymsis wraps,
and the local solar time `ut/3600 + lon/15` is exact too.
"""

ALTS_KM = [90, 100, 120, 150, 200, 300, 400, 500, 700, 1000]
LATS_DEG = [-70, -20, 25, 65]
# (UT seconds, east longitude deg): local solar time 23 h and 17 h.
UT_LON = [(10800, 300), (50400, 45)]
# Day of year in the non-leap year 2001.
DOYS = [1, 172, 280]
# (label, F10.7 81-day average, F10.7 previous day, daily Ap)
ACTIVITY = [("low", 70, 68, 4), ("moderate", 150, 160, 15), ("high", 230, 250, 80)]


def points():
    """Yield (doy, ut_s, alt_km, lat_deg, lon_deg, f107a, f107, ap, activity_label)."""
    for label, f107a, f107, ap in ACTIVITY:
        for doy in DOYS:
            for ut, lon in UT_LON:
                for lat in LATS_DEG:
                    for alt in ALTS_KM:
                        yield (doy, ut, alt, lat, lon, f107a, f107, ap, label)


if __name__ == "__main__":
    for p in points():
        print(*p[:8])
