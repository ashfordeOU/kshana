#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate data/conformance/lunar-time/lunar-time.json (format kshana.lunar-time-vectors/1).

Python standard library only, independent of the Rust code it checks. Every vector cites the
published text its expected value comes from, and carries a status:

* "defined": the value follows from a defining resolution (exact arithmetic on defining
  constants);
* "published-model": the value is a published numerical result of a model, not a definition;
* "provisional": the quantity has no published definition yet; the vector says why.

Sources (all fetched 2026-11-28):
  IAU 2024 Resolution II (LCRS and TCL), Resolution III (coordinated lunar time), listed at
  https://iau.org/Iau/Publications/List-of-Resolutions
  IAU 2000 Resolution B1.9 (TT, L_G) and IAU 2006 Resolution B3 (TDB, L_B, TDB0, T0), same list
  Lu, Yang & Xie, Lunar Time Ephemeris LTE440: User Manual, arXiv:2506.19213
  Ashby & Patla, A Relativistic Framework to Establish Coordinate Time on the Moon and Beyond,
  arXiv:2402.11150
  NASA, Lunar Time, https://www.nasa.gov/?p=1034651
  IERS Bulletin C 52 (leap second at the end of 2016)
"""
import json
import os
from fractions import Fraction as F

HERE = os.path.dirname(os.path.abspath(__file__))
FETCHED = "2026-11-28"

# Defining constants (exact decimals).
L_G = F("6.969290134e-10")      # IAU 2000 B1.9
L_B = F("1.550519768e-8")       # IAU 2006 B3
TDB0 = F("-6.55e-5")            # IAU 2006 B3, s
T0_JD0 = F("2443144.5")         # 1977-01-01T00:00:00 as a Julian day
T0_S = F("32.184")              # seconds into that day (T0 = JD 2443144.5003725)
LTE440_L = F("1.48253621667e-8")        # <dTCL/dTCB> = 1 - L
LTE440_TDB_RATE = F("6.798355238e-10")  # <dTCL/dTDB> = 1 + r

SRC = {
    "iau2024-2": {
        "title": "IAU 2024 Resolution II: to establish a standard Lunar Celestial Reference System (LCRS) and Lunar Coordinate Time (TCL)",
        "url": "https://drive.google.com/file/d/1-Ps-YyCjmjzg2NGi0A-VE0kWqr8w7LnE/view (linked from https://iau.org/Iau/Publications/List-of-Resolutions)",
        "fetched": FETCHED,
    },
    "iau2024-3": {
        "title": "IAU 2024 Resolution III: on the establishment of a coordinated lunar time standard by international agreement",
        "url": "https://drive.google.com/file/d/1G5WG8cu2tiTIsCUkiOcaxfL0Z0rs1alm/view (linked from https://iau.org/Iau/Publications/List-of-Resolutions)",
        "fetched": FETCHED,
    },
    "iau2000-b19": {
        "title": "IAU 2000 Resolution B1.9: Re-definition of Terrestrial Time TT (dTT/dTCG = 1 - L_G, L_G = 6.969290134e-10 a defining constant); the common reading 1977 January 1, 0h 0m 32.184s of TT, TCG and TCB is restated in the notes of IAU 2024 Resolution II",
        "url": "https://drive.google.com/file/d/1ZXjFjgcq5hdEpPk8PCEDBgf9dgGn1CB_/view (IAU 2000 resolutions, linked from https://iau.org/Iau/Publications/List-of-Resolutions)",
        "fetched": FETCHED,
    },
    "iau2006-b3": {
        "title": "IAU 2006 Resolution B3: Re-definition of Barycentric Dynamical Time TDB (L_B = 1.550519768e-8, TDB0 = -6.55e-5 s)",
        "url": "https://drive.google.com/file/d/16Jf6YgA7Nlf3ZSnKbWOhXcmU7M7TA6HH/view (linked from https://iau.org/Iau/Publications/List-of-Resolutions)",
        "fetched": FETCHED,
    },
    "lte440": {
        "title": "Lu, Yang and Xie, Lunar Time Ephemeris LTE440: User Manual (abstract: <dTCL/dTCB> = 1 - 1.48253621667e-8, <dTCL/dTDB> = 1 + 6.798355238e-10, annual term about 1651 us, monthly term 126 us)",
        "url": "https://arxiv.org/abs/2506.19213",
        "fetched": FETCHED,
    },
    "ashby-patla": {
        "title": "Ashby and Patla, A Relativistic Framework to Establish Coordinate Time on the Moon and Beyond (abstract: a clock near the Moon's equator accumulates an extra 56.02 us per day over a lunar orbit compared with a clock near the Earth's equator)",
        "url": "https://arxiv.org/abs/2402.11150",
        "fetched": FETCHED,
    },
    "nasa-ltc": {
        "title": "NASA, Lunar Time: Coordinated Lunar Time (LTC) will be determined by an ensemble of clocks at the Moon and remain traceable to UTC",
        "url": "https://www.nasa.gov/?p=1034651",
        "fetched": FETCHED,
    },
    "bulc52": {
        "title": "IERS Bulletin C 52: positive leap second at the end of 31 December 2016, UTC-TAI = -37 s from 1 January 2017; TT = TAI + 32.184 s (IAU 1991 Resolution A4)",
        "url": "https://hpiers.obspm.fr/iers/bul/bulc/bulletinc.52",
        "fetched": FETCHED,
    },
}

vectors = []


def add(vid, op, inp, exp, src, clause, status, tol, reason=None, note=None):
    v = {"id": vid, "op": op, "input": inp, "expect": exp,
         "source": dict(SRC[src], clause=clause), "status": status, "tolerance": tol}
    if reason:
        v["status_reason"] = reason
    if note:
        v["note"] = note
    vectors.append(v)


def since_t0(jd0, s):
    return (F(jd0) - T0_JD0) * 86400 + F(s) - T0_S


EPOCHS = [("j2000", "2451544.5", "43200"), ("2026-12-31", "2461405.5", "0"),
          ("2030-07-01", "2462683.5", "0"), ("1977-t0", "2443144.5", "32.184")]

# 1. TCG - TT from TT (B1.9 inverted exactly: TCG - TT = L_G / (1 - L_G) * (TT - T0)).
for name, jd0, s in EPOCHS:
    d = L_G / (1 - L_G) * since_t0(jd0, s)
    add(f"tcg-minus-tt-{name}", "tcg_minus_tt", {"jd0": float(F(jd0)), "s": float(F(s))},
        {"seconds": float(d)}, "iau2000-b19", "TT = TCG - L_G x (JD_TCG - T0) x 86400 s",
        "defined", 1e-9)

# 2. TCB - TDB from TCB (B3: TDB = TCB - L_B x (TCB - T0) + TDB0).
for name, jd0, s in EPOCHS:
    d = L_B * since_t0(jd0, s) - TDB0
    add(f"tcb-minus-tdb-{name}", "tcb_minus_tdb", {"jd0": float(F(jd0)), "s": float(F(s))},
        {"seconds": float(d)}, "iau2006-b3", "TDB = TCB - L_B x (JD_TCB - T0) x 86400 s + TDB0",
        "defined", 1e-8)

# 3. The TCL origin (Res II recommends 4).
add("tcl-origin", "tcb_minus_tcl", {"jd0": 2443144.5, "s": 32.184}, {"seconds": 0.0},
    "iau2024-2", "recommends 4: TCL reads 1977 January 1, 0h 0m 32.184s when TCB reads the same at the centre of the Moon",
    "defined", 1e-9)

# 4. TCB - TCL from the published LTE440 mean rate (secular part only).
for name, jd0, s in EPOCHS[:3]:
    d = LTE440_L * since_t0(jd0, s)
    add(f"tcb-minus-tcl-secular-{name}", "tcb_minus_tcl", {"jd0": float(F(jd0)), "s": float(F(s))},
        {"seconds": float(d)}, "lte440", "secular rate <dTCL/dTCB> = 1 - 1.48253621667e-8 from T0",
        "published-model", 3.3e-3,
        reason="a published ephemeris result, not a defining value; only its secular part is compared",
        note="tolerance 3.3 ms: the published annual (about 1651 us) and monthly (126 us) amplitudes plus the checked implementation's stated 2e-12 rate bound over the span")

# 5. The mean rates and their consistency with L_B.
add("tcl-mean-rate-tcb", "tcl_mean_rate", {"from_jd_tdb": 2433282.5, "to_jd_tdb": 2469807.5},
    {"l_tcb": float(LTE440_L), "dtcl_dtdb_minus_1": float((1 - LTE440_L) / (1 - L_B) - 1)},
    "lte440", "<dTCL/dTCB> = 1 - 1.48253621667e-8; <dTCL/dTDB> follows with L_B (IAU 2006 B3)",
    "published-model", 2e-12,
    reason="a published ephemeris mean, not a defining value; the averaging span of LTE440 is not stated in the abstract, 1950-2050 is used here",
    note="consistency: (1 - L)/(1 - L_B) - 1 = %.10e against the published 6.798355238e-10" % float((1 - LTE440_L) / (1 - L_B) - 1))

# 6. Leap-second handling on the way from UTC (the realisation LTC is to be traceable to).
for vid, utc, tt in [("utc-tt-2016-12-31-59", "2016-12-31T23:59:59", "2017-01-01T00:01:07.184"),
                     ("utc-tt-2016-12-31-60", "2016-12-31T23:59:60", "2017-01-01T00:01:08.184"),
                     ("utc-tt-2017-01-01-00", "2017-01-01T00:00:00", "2017-01-01T00:01:09.184")]:
    add(vid, "utc_to_scale", {"utc": utc, "scale": "TT"}, {"time": tt}, "bulc52",
        "UTC-TAI = -36 s before and -37 s after the leap second; TT = TAI + 32.184 s", "defined", 0.0)

# 7. Scale tags a mission file may carry.
for tag, defined, by, src, st, reason in [
    ("TT", True, "IAU 2000 Resolution B1.9", "iau2000-b19", "defined", None),
    ("TDB", True, "IAU 2006 Resolution B3", "iau2006-b3", "defined", None),
    ("TCL", True, "IAU 2024 Resolution II", "iau2024-2", "defined", None),
    ("LTC", False, "", "iau2024-3", "provisional",
     "no published definition of Coordinated Lunar Time as of 2026-11-28: IAU 2024 Resolution III leaves the relation between a lunar reference time scale and UTC to agreement among international organisations, and NASA describes LTC as an ensemble of lunar clocks traceable to UTC still to be established"),
]:
    add(f"tag-{tag.lower()}", "scale_tag", {"tag": tag}, {"defined": defined, "defined_by": by},
        src, "which published text defines the scale", st, 0.0, reason=reason)

# 8. LTC: what a lunar-surface clock does against TT, from a published relativistic model.
add("ltc-surface-rate-provisional", "lunar_surface_rate", {"t_tt_jc": 0.0}, {"us_per_day": 56.02},
    "ashby-patla", "a clock near the Moon's equator against a clock near the Earth's equator, averaged over a lunar orbit",
    "provisional", 1.5,
    reason="LTC has no published definition (see tag-ltc); this compares a lunar-surface clock model with one published relativistic result, not with LTC",
    note="tolerance 1.5 us/day is kshana's choice, not the source's: the published figure depends on the reference surfaces and averaging the model assumes")

doc = {
    "format": "kshana.lunar-time-vectors/1",
    "set": "lunar-time",
    "version": "1.0.0",
    "description": "Lunar time-scale vectors for mission software: TCL as defined by IAU 2024 Resolution II, the IAU 2000/2006 relations it rests on, published TCL ephemeris rates, leap-second handling from UTC, scale tags, and provisional LTC vectors where no definition is published.",
    "generator": "data/conformance/lunar-time/gen_lunar_time_vectors.py",
    "vectors": vectors,
}
with open(os.path.join(HERE, "lunar-time.json"), "w") as f:
    json.dump(doc, f, indent=1)
    f.write("\n")
print(len(vectors), "vectors")
