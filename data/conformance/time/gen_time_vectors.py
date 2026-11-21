#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the kshana time-scale conformance vectors (format kshana.time-vectors/1).

    python3 data/conformance/time/gen_time_vectors.py          # rewrite the *.json next to this file
    python3 data/conformance/time/gen_time_vectors.py --check  # exit 1 if a file would change

This generator is the independent side of the check: it uses only the Python standard library
(`datetime` for the calendar) and its own transcription of the published definitions below. It
shares no code with the Rust implementation (src/gnss_time.rs, src/norad.rs), so
`kshana time-vectors` compares two implementations, not one with itself. Format:
docs/TIME-VECTORS.md.

Definitions used (all public):
  * Leap seconds: IERS Bulletin C, history of TAI-UTC since 1972-01-01 (37 s since 2017-01-01; no
    leap second announced through 2026-12-31).
  * GPS: IS-GPS-200, GPS week 0 = 1980-01-06T00:00:00 GPST, GPST = TAI - 19 s; LNAV week 10 bits,
    CNAV week 13 bits.
  * Galileo: OS SIS ICD, GST week 0 = 1999-08-22T00:00:00 GST, GST = GPST; WN 12 bits.
  * BeiDou: BDS-SIS-ICD, BDT week 0 = 2006-01-01T00:00:00 BDT, BDT = TAI - 33 s; WN 13 bits.
  * GLONASS: ICD L1/L2, GLONASST = UTC(SU) + 3 h; N4 = four-year interval from 1996, NT = day in it.
  * TT = TAI + 32.184 s (IAU 1991).
  * NTP: RFC 5905, seconds from 1900-01-01, 32-bit era; era 1 begins 2036-02-07T06:28:16Z.
  * Unix: seconds from 1970-01-01 without leap seconds; int32 overflows after 2038-01-19T03:14:07Z.
  * Two-digit years: RINEX 2.11 (80-99 -> 19xx, 00-79 -> 20xx); TLE (57-99 -> 19xx, 00-56 -> 20xx);
    NMEA 0183 ddmmyy has no century (the vectors use a sliding window, year in [ref-50, ref+49]).
  * NORAD catalogue: Alpha-5 (A=10 ... Z=33 without I and O; A0000 = 100000, Z9999 = 339999); OMM
    NORAD_CAT_ID is a plain integer (CCSDS 502.0-B-3).
"""
import datetime as dt
import json
import os
import sys

VERSION = "1.0.0"
HERE = os.path.dirname(os.path.abspath(__file__))
FORMAT = "kshana.time-vectors/1"

LEAPS = [  # (date the new TAI-UTC takes effect at 00:00 UTC, TAI-UTC)
    ("1972-01-01", 10), ("1972-07-01", 11), ("1973-01-01", 12), ("1974-01-01", 13),
    ("1975-01-01", 14), ("1976-01-01", 15), ("1977-01-01", 16), ("1978-01-01", 17),
    ("1979-01-01", 18), ("1980-01-01", 19), ("1981-07-01", 20), ("1982-07-01", 21),
    ("1983-07-01", 22), ("1985-07-01", 23), ("1988-01-01", 24), ("1990-01-01", 25),
    ("1991-01-01", 26), ("1992-07-01", 27), ("1993-07-01", 28), ("1994-07-01", 29),
    ("1996-01-01", 30), ("1997-07-01", 31), ("1999-01-01", 32), ("2006-01-01", 33),
    ("2009-01-01", 34), ("2012-07-01", 35), ("2015-07-01", 36), ("2017-01-01", 37),
]
LEAPS = [(dt.date.fromisoformat(d), n) for d, n in LEAPS]
EPOCH = dt.datetime(1970, 1, 1)
GPS0 = dt.datetime(1980, 1, 6)
GST0 = dt.datetime(1999, 8, 22)
BDT0 = dt.datetime(2006, 1, 1)
LETTERS = "ABCDEFGHJKLMNPQRSTUVWXYZ"


def dat(d):
    v = None
    for day, n in LEAPS:
        if day <= d:
            v = n
    return v


def fmt(t, leap=False, frac_ns=0):
    """ISO label; `leap` renders the second as :60 (t is then the 23:59:59 instant)."""
    s = t.strftime("%Y-%m-%dT%H:%M:%S")
    if leap:
        s = s[:-2] + "60"
    if frac_ns:
        s += "." + ("%09d" % frac_ns).rstrip("0")
    return s


def utc_to_tai(utc, leap=False):
    """TAI label (datetime) of a UTC label; `leap` = this is 23:59:60 of utc's day."""
    base = utc + dt.timedelta(seconds=dat(utc.date()))
    return base + dt.timedelta(seconds=1) if leap else base


def week_tow(label, zero):
    s = int((label - zero).total_seconds())
    return s // 604800, s % 604800


V = {}


def add(set_name, vid, op, inp, exp, note=None):
    v = {"id": vid, "op": op, "input": inp, "expect": exp}
    if note:
        v["note"] = note
    V.setdefault(set_name, []).append(v)


# ---------------------------------------------------------------- leap seconds
for day, n in LEAPS[1:]:
    prev = day - dt.timedelta(days=1)
    p = dt.datetime.combine(prev, dt.time(23, 59, 59))
    d0 = dt.datetime.combine(day, dt.time(0, 0, 0))
    tag = day.isoformat()
    S = "leap-seconds"
    add(S, f"leap-{tag}-before", "tai_minus_utc", {"utc": fmt(p)}, {"seconds": n - 1})
    add(S, f"leap-{tag}-inserted-valid", "utc_valid", {"utc": fmt(p, leap=True)},
        {"valid": True, "utc": fmt(p, leap=True)})
    add(S, f"leap-{tag}-inserted-offset", "tai_minus_utc", {"utc": fmt(p, leap=True)}, {"seconds": n - 1},
        "TAI-UTC through 23:59:60 is the value of the day the second is added to")
    add(S, f"leap-{tag}-after", "tai_minus_utc", {"utc": fmt(d0)}, {"seconds": n})
    add(S, f"leap-{tag}-day-length", "utc_day_length", {"date": prev.isoformat()}, {"seconds": 86401})
    add(S, f"leap-{tag}-tai-59", "utc_to_scale", {"utc": fmt(p), "scale": "TAI"}, {"time": fmt(utc_to_tai(p))})
    add(S, f"leap-{tag}-tai-60", "utc_to_scale", {"utc": fmt(p, leap=True), "scale": "TAI"},
        {"time": fmt(utc_to_tai(p, leap=True))})
    add(S, f"leap-{tag}-tai-60.5", "utc_to_scale", {"utc": fmt(p, leap=True, frac_ns=500_000_000), "scale": "TAI"},
        {"time": fmt(utc_to_tai(p, leap=True), frac_ns=500_000_000)})
    add(S, f"leap-{tag}-tai-00", "utc_to_scale", {"utc": fmt(d0), "scale": "TAI"}, {"time": fmt(utc_to_tai(d0))})
    add(S, f"leap-{tag}-tai-back", "tai_to_utc", {"tai": fmt(utc_to_tai(p, leap=True))}, {"utc": fmt(p, leap=True)},
        "a TAI instant inside the inserted second maps back to 23:59:60")
    if day.year >= 1981:
        g = utc_to_tai(p, leap=True) - dt.timedelta(seconds=19)
        add(S, f"leap-{tag}-gpst-60", "utc_to_scale", {"utc": fmt(p, leap=True), "scale": "GPST"},
            {"time": fmt(g)}, "GPST has no leap second: the inserted UTC second is an ordinary GPS second")
    if day.year >= 1996:
        add(S, f"leap-{tag}-glonasst-60", "utc_to_scale", {"utc": fmt(p, leap=True), "scale": "GLONASST"},
            {"time": fmt(dt.datetime.combine(day, dt.time(2, 59, 59)), leap=True)},
            "GLONASST = UTC(SU) + 3 h, so the leap second reads 02:59:60 Moscow time")

S = "leap-seconds"
for bad, why in [
    ("2015-12-31T23:59:60", "no leap second at the end of 2015"),
    ("2016-06-30T23:59:60", "no leap second at the end of June 2016"),
    ("2026-06-30T23:59:60", "none announced for June 2026 (IERS Bulletin C)"),
    ("2026-12-31T23:59:60", "none announced for December 2026 (IERS Bulletin C)"),
    ("2016-12-31T23:58:60", "a leap second is only ever 23:59:60"),
    ("2016-12-31T24:00:00", "24:00 is not a UTC time"),
    ("1971-12-31T23:59:59", "before 1972 TAI-UTC was not an integer"),
    ("2026-02-29T00:00:00", "2026 is not a leap year"),
]:
    add(S, f"invalid-{bad}", "utc_valid", {"utc": bad}, {"error": True}, why)
add(S, "ordinary-day-length", "utc_day_length", {"date": "2016-12-30"}, {"seconds": 86400})
add(S, "current-offset", "tai_minus_utc", {"utc": "2026-11-14T12:00:00"}, {"seconds": 37})
add(S, "first-integer-offset", "tai_minus_utc", {"utc": "1972-01-01T00:00:00"}, {"seconds": 10})

# ---------------------------------------------------------------- GNSS weeks
S = "gnss-weeks"
for w in [0, 1, 1023, 1024, 1356, 2047, 2048, 3071, 3072, 4095, 4096, 6144, 8191, 8192]:
    add(S, f"gps-week-{w}-start", "gps_week_start", {"week": w}, {"gpst": fmt(GPS0 + dt.timedelta(weeks=w))})


def gps_utc(week, tow):
    """UTC label of a GPS week/tow, stepping back through the leap table (23:59:60 in a leap second)."""
    tai = GPS0 + dt.timedelta(weeks=week, seconds=tow + 19)
    for day, n in reversed(LEAPS):
        d0 = dt.datetime.combine(day, dt.time())
        if tai >= d0 + dt.timedelta(seconds=n):
            return fmt(tai - dt.timedelta(seconds=n))
        if tai >= d0 + dt.timedelta(seconds=n - 1):
            return fmt(d0 - dt.timedelta(seconds=1), leap=True)
    raise ValueError


for utc, leap, note in [
    ("1980-01-06T00:00:00", False, "GPS week 0 begins; GPST = UTC then (TAI-UTC = 19 s)"),
    ("1999-08-21T23:59:46", False, "last second of GPS week 1023 (the first 10-bit rollover)"),
    ("1999-08-21T23:59:47", False, "GPS week 1024 begins: the 10-bit week reads 0"),
    ("2019-04-06T23:59:41", False, "last second of GPS week 2047"),
    ("2019-04-06T23:59:42", False, "GPS week 2048 begins: the second 10-bit rollover"),
    ("2016-12-31T23:59:59", False, None),
    ("2016-12-31T23:59:59", True, "the leap second is GPS second 17 of week 1930"),
    ("2017-01-01T00:00:00", False, None),
    ("2026-11-14T12:00:00", False, None),
    ("2026-11-15T00:00:00", False, None),
]:
    t = dt.datetime.fromisoformat(utc)
    tai = utc_to_tai(t, leap)
    w, tow = week_tow(tai - dt.timedelta(seconds=19), GPS0)
    label = fmt(t, leap=leap)
    add(S, f"gps-{label}", "gnss_week_tow", {"utc": label, "system": "GPST"},
        {"week": w, "tow": tow, "week10": w % 1024, "week13": w % 8192}, note)
    add(S, f"gps-back-{label}", "gps_to_utc", {"week": w, "tow": tow}, {"utc": gps_utc(w, tow)})
add(S, "gps-3072-utc", "gps_to_utc", {"week": 3072, "tow": 0}, {"utc": gps_utc(3072, 0)},
    "the next 10-bit rollover (2038), in UTC assuming no leap second after 2017-01-01")

for trunc, bits, ref, note in [
    (0, 10, 2047, "a receiver one week before the 2019 rollover"),
    (0, 10, 2048, None),
    (1023, 10, 2048, "a week just before the reference"),
    (0, 10, 3071, "the 2038 rollover"),
    (1023, 10, 3072, None),
    (2400 % 1024, 10, 2400, None),
    (600, 10, 2100, "nearest of 1624 and 2648"),
    (0, 10, 0, None),
    (512, 10, 1536, "a tie half a cycle away goes to the later week"),
    (0, 13, 8191, "the GPS CNAV / BeiDou 13-bit rollover"),
    (8191, 13, 8192, None),
    (2400, 13, 2400, None),
    (0, 12, 4095, "the Galileo 12-bit rollover (GST week 4096, 2078)"),
    (1360, 12, 1360, None),
]:
    cycle = 1 << bits
    base = ref - ref % cycle + trunc
    cands = [c for c in (base - cycle, base, base + cycle) if c >= 0]
    best = min(cands, key=lambda c: (abs(c - ref), -c))
    add(S, f"resolve-{bits}bit-{trunc}-near-{ref}", "week_resolve",
        {"truncated": trunc, "bits": bits, "reference_week": ref}, {"week": best}, note)
add(S, "resolve-out-of-range", "week_resolve", {"truncated": 1024, "bits": 10, "reference_week": 2048},
    {"error": True}, "a 10-bit field cannot hold 1024")

# ---------------------------------------------------------------- GNSS systems
S = "gnss-systems"
for utc, sysname, zero, minus in [
    ("1999-08-21T23:59:47", "GST", GST0, 19),
    ("2019-04-06T23:59:42", "GST", GST0, 19),
    ("2026-11-14T12:00:00", "GST", GST0, 19),
    ("2006-01-01T00:00:00", "BDT", BDT0, 33),
    ("2017-01-01T00:00:00", "BDT", BDT0, 33),
    ("2026-11-14T12:00:00", "BDT", BDT0, 33),
]:
    t = dt.datetime.fromisoformat(utc)
    w, tow = week_tow(utc_to_tai(t) - dt.timedelta(seconds=minus), zero)
    add(S, f"{sysname.lower()}-week-{utc}", "gnss_week_tow", {"utc": utc, "system": sysname},
        {"week": w, "tow": tow, "week12": w % 4096, "week13": w % 8192})

for utc in ["1999-01-01T00:00:00", "2006-01-01T00:00:00", "2017-01-01T00:00:00", "2026-11-14T12:00:00"]:
    t = dt.datetime.fromisoformat(utc)
    n = dat(t.date())
    for frm, to, val in [
        ("UTC", "TAI", n), ("UTC", "GPST", n - 19), ("UTC", "GST", n - 19), ("UTC", "BDT", n - 33),
        ("TAI", "TT", 32.184), ("UTC", "TT", n + 32.184), ("BDT", "GPST", 14), ("UTC", "GLONASST", 10800),
        ("GLONASST", "GPST", n - 19 - 10800),
    ]:
        add(S, f"offset-{to}-{frm}-{utc[:10]}", "scale_offset", {"from": frm, "to": to, "utc": utc}, {"seconds": val})
    for scale, shift in [("TAI", n), ("GPST", n - 19), ("GST", n - 19), ("BDT", n - 33)]:
        add(S, f"scale-{scale}-{utc[:10]}", "utc_to_scale", {"utc": utc, "scale": scale},
            {"time": fmt(t + dt.timedelta(seconds=shift))})
    tt = t + dt.timedelta(seconds=n + 32, microseconds=184000)
    add(S, f"scale-TT-{utc[:10]}", "utc_to_scale", {"utc": utc, "scale": "TT"},
        {"time": fmt(tt.replace(microsecond=0), frac_ns=184_000_000)})
    add(S, f"scale-GLONASST-{utc[:10]}", "utc_to_scale", {"utc": utc, "scale": "GLONASST"},
        {"time": fmt(t + dt.timedelta(hours=3))})

for utc in ["1996-01-01T00:00:00", "2024-01-01T00:00:00", "2026-11-14T12:00:00", "2026-12-31T20:59:59",
            "2026-12-31T21:00:00", "2027-12-31T21:00:00", "2028-02-29T12:00:00"]:
    t = dt.datetime.fromisoformat(utc)
    m = t + dt.timedelta(hours=3)
    n4 = (m.year - 1996) // 4 + 1
    nt = (m.date() - dt.date(1996 + 4 * (n4 - 1), 1, 1)).days + 1
    add(S, f"glonass-{utc}", "glonass_day", {"utc": utc}, {"n4": n4, "nt": nt, "moscow": fmt(m)},
        "N4 and NT are counted on the Moscow date")

# ---------------------------------------------------------------- computer eras
S = "computer-eras"
NTP_OFF = 2208988800
for unix in [-NTP_OFF, 0, 2085978495, 2085978496, 2085978497, 4294967295 + 2085978496]:
    ntp = unix + NTP_OFF
    add(S, f"unix-to-ntp-{unix}", "unix_to_ntp", {"unix": unix}, {"era": ntp // 2**32, "seconds": ntp % 2**32})
for sec, pivot, note in [
    (0, 1794657600, "NTP seconds 0 read in 2026: the 2036 era-1 start, not 1900"),
    (4294967295, 2085978000, "the last second of era 0"),
    (0, 2085978000, "the first second of era 1 (2036-02-07T06:28:16Z)"),
    (3913056000, 1794657600, "an ordinary 2024 value"),
    (100, 2085979000, "just after the 2036 wrap"),
]:
    best = None
    pe = (pivot + NTP_OFF) // 2**32
    for era in (pe - 1, pe, pe + 1):
        u = era * 2**32 + sec - NTP_OFF
        key = (abs(u - pivot), -era)
        if best is None or key < best[0]:
            best = (key, u, era)
    _, u, era = best
    add(S, f"ntp-to-unix-{sec}-near-{pivot}", "ntp_to_unix", {"seconds": sec, "pivot_unix": pivot},
        {"unix": u, "era": era, "utc": fmt(EPOCH + dt.timedelta(seconds=u))}, note)
for unix in [0, -1, 2147483647, 2147483648, 4294967295, 1794657600]:
    w = (unix + 2**31) % 2**32 - 2**31
    add(S, f"unix-i32-{unix}", "unix_i32", {"unix": unix},
        {"fits": w == unix, "wrapped": w, "utc": fmt(EPOCH + dt.timedelta(seconds=unix)),
         "wrapped_utc": fmt(EPOCH + dt.timedelta(seconds=w))},
        "2038-01-19T03:14:07Z is the last second a signed 32-bit time_t holds" if unix == 2147483647 else None)
for raw, pivot, note in [
    (0, 4294967000, "an unsigned 32-bit counter wraps at 2106-02-07T06:28:16Z"),
    (4294967295, 4294967400, None),
    (2147483648, 2147483000, "a signed counter read as unsigned across 2038"),
    (1794657600, 1794657000, None),
]:
    best = min((pivot - pivot % 2**32 + raw + k * 2**32 for k in (-1, 0, 1)),
               key=lambda t: (abs(t - pivot), -t))
    add(S, f"unix-u32-{raw}-near-{pivot}", "unix_u32_resolve", {"raw": raw, "pivot_unix": pivot},
        {"unix": best, "utc": fmt(EPOCH + dt.timedelta(seconds=best))}, note)

# ---------------------------------------------------------------- two-digit years
S = "two-digit-years"
for yy in [0, 26, 79, 80, 99]:
    add(S, f"rinex2-{yy:02d}", "two_digit_year", {"yy": yy, "convention": "rinex2"},
        {"year": 1900 + yy if yy >= 80 else 2000 + yy})
for yy in [0, 26, 56, 57, 99]:
    add(S, f"tle-{yy:02d}", "two_digit_year", {"yy": yy, "convention": "tle"},
        {"year": 1900 + yy if yy >= 57 else 2000 + yy})
for yy, ref in [(26, 2026), (75, 2026), (76, 2026), (99, 2026), (0, 2026), (19, 2070), (20, 2070), (37, 2087), (38, 2087)]:
    lo = ref - 50
    y = lo - lo % 100 + yy
    if y < lo:
        y += 100
    add(S, f"nmea-{yy:02d}-ref-{ref}", "two_digit_year", {"yy": yy, "convention": "nmea", "reference_year": ref},
        {"year": y}, "NMEA ddmmyy carries no century: the year within -50/+49 of the reference")
add(S, "yy-out-of-range", "two_digit_year", {"yy": 100, "convention": "tle"}, {"error": True})

# ---------------------------------------------------------------- NORAD catalogue numbers
S = "norad-catalogue"


def alpha5(n):
    if n <= 99999:
        return "%05d" % n
    if n <= 339999:
        return LETTERS[n // 10000 - 10] + "%04d" % (n % 10000)
    return None


def tle_ck(line):
    return sum(int(c) if c.isdigit() else (1 if c == "-" else 0) for c in line[:68]) % 10


for n in [0, 5, 25544, 99999, 100000, 109999, 179999, 180000, 229999, 230000, 270001, 339999]:
    add(S, f"encode-{n}", "norad_encode", {"number": n}, {"field": alpha5(n)})
    add(S, f"decode-{alpha5(n)}", "norad_decode", {"field": alpha5(n)}, {"number": n})
for n in [340000, 999999]:
    add(S, f"encode-{n}", "norad_encode", {"number": n}, {"error": True}, "beyond Alpha-5: use OMM")
for f in ["I0000", "O1234", "a0000", "A000", "A00000", "-1234", "A12B4", ""]:
    add(S, f"decode-bad-{f or 'empty'}", "norad_decode", {"field": f}, {"error": True})

lines = [
    "1 25544U 98067A   08264.51782528 -.00002182  00000-0 -11606-4 0  2927",
    "2 25544  51.6416 247.4627 0006703 130.5360 325.0288 15.72125391563537",
    "1 T0002U 26900A   26318.50000000  .00001000  00000-0  10000-3 0  999",
    "2 T0002  97.4000  10.0000 0010000  90.0000 270.0000 15.20000000    1",
]
for i, l in enumerate(lines):
    add(S, f"tle-checksum-{i}", "tle_checksum", {"line": l}, {"checksum": tle_ck(l)},
        "letters count 0, '-' counts 1" if "T0002" in l else None)
l1 = lines[2] + str(tle_ck(lines[2]))
add(S, "tle-identity-alpha5", "tle_identity", {"line1": l1},
    {"number": 270002, "designator": "2026-900A", "epoch": "2026-318T12:00:00.000000"})
add(S, "tle-identity-5-digit", "tle_identity", {"line1": lines[0]}, {"number": 25544, "designator": "1998-067A"})


def omm(n):
    return ("CCSDS_OMM_VERS = 3.0\nCREATION_DATE = 2026-11-14T00:00:00\nORIGINATOR = TEST\n"
            "OBJECT_NAME = TEST OBJECT\nOBJECT_ID = 2026-900A\nCENTER_NAME = EARTH\nREF_FRAME = TEME\n"
            "TIME_SYSTEM = UTC\nMEAN_ELEMENT_THEORY = SGP4\nEPOCH = 2026-11-14T12:00:00.000\n"
            "MEAN_MOTION = 15.2\nECCENTRICITY = 0.001\nINCLINATION = 97.4\nRA_OF_ASC_NODE = 10.0\n"
            "ARG_OF_PERICENTER = 90.0\nMEAN_ANOMALY = 270.0\nEPHEMERIS_TYPE = 0\nCLASSIFICATION_TYPE = U\n"
            f"NORAD_CAT_ID = {n}\nELEMENT_SET_NO = 999\nREV_AT_EPOCH = 1\nBSTAR = 0.0001\n"
            "MEAN_MOTION_DOT = 0.0\nMEAN_MOTION_DDOT = 0.0\n")


epoch_days = (dt.datetime(2026, 11, 14, 12) - dt.datetime(1949, 12, 31)).total_seconds() / 86400
for n in [25544, 270002, 512345, 123456789]:
    add(S, f"omm-{n}", "omm_catalogue", {"omm": omm(n)},
        {"number": n, "epoch_days_1950": epoch_days, "alpha5": alpha5(n) or ""},
        "OMM carries the catalogue number as an integer: the path past Alpha-5")

DESCRIPTIONS = {
    "leap-seconds": "Every leap second since 1972: TAI-UTC before, during and after 23:59:60, the 86401 s day, "
                    "the mapping into TAI, GPST and GLONASST, and times that do not exist.",
    "gnss-weeks": "GPS weeks and times of week across the 1999 and 2019 10-bit rollovers and the 2038 one, the "
                  "leap second in GPS time, and resolving 10-, 12- and 13-bit broadcast weeks.",
    "gnss-systems": "Galileo and BeiDou weeks, the offsets between UTC, TAI, TT, GPST, GST, BDT and GLONASST, and "
                    "GLONASS N4/NT day numbers.",
    "computer-eras": "The NTP era rollover (2036), signed and unsigned 32-bit Unix time (2038, 2106).",
    "two-digit-years": "Two-digit years in RINEX 2, TLE and NMEA.",
    "norad-catalogue": "NORAD catalogue numbers above 99999: Alpha-5 encode and decode, the TLE checksum, and OMM.",
}


def main():
    check = "--check" in sys.argv
    changed = []
    for name, vectors in V.items():
        head = {
            "format": FORMAT,
            "set": name,
            "version": VERSION,
            "description": DESCRIPTIONS[name],
            "generator": "data/conformance/time/gen_time_vectors.py",
        }
        # One vector per line, so the files stay reviewable as diffs.
        body = ",\n".join("  " + json.dumps(v, ensure_ascii=True) for v in vectors)
        text = json.dumps(head, indent=1, ensure_ascii=True)[:-2] + ',\n "vectors": [\n' + body + "\n ]\n}\n"
        path = os.path.join(HERE, name + ".json")
        old = open(path).read() if os.path.exists(path) else None
        if old != text:
            changed.append(name)
            if not check:
                with open(path, "w") as f:
                    f.write(text)
    total = sum(len(v) for v in V.values())
    print(f"{total} vectors in {len(V)} files; changed: {changed or 'none'}")
    if check and changed:
        sys.exit(1)


if __name__ == "__main__":
    main()
