#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
External-oracle reference for the maritime trust arithmetic.

Oracle libraries (offline, dev-only, never shipped), versions pinned:
    pynmea2     == 1.19.0   (MIT)   NMEA 0183 decoding
    geographiclib == 2.1    (MIT)   WGS84 geodesic distance and azimuth
    numpy                   (BSD)   medians and standard deviations

Reads the synthetic NMEA inputs in ``tests/fixtures/maritime_trust/`` (written by
``examples/gen_maritime_trust_ref_inputs.rs``; text only, no measured data) and writes
``tests/fixtures/maritime_trust/reference.json``. ``tests/maritime_trust_reference.rs`` compares
this crate's output with it, to the tolerances in ``PREREGISTRATION.md``.

What the oracle provides independently:  the decoding of every field (pynmea2), the geodesic
distance and azimuth between fixes (geographiclib), medians and standard deviations (numpy), and a
score aggregation written clean-room from the documentation (``maritime_score_cleanroom.py``).
What it does not:  the monitors' window lengths, allowances and thresholds are this project's own
rules; the script reproduces them from the documented defaults (``docs/MARITIME-TRUST.md``,
``src/receiver_trust/maritime.rs`` field docs), so agreement corroborates the implementation of
the arithmetic, not the rules.

Usage::

    cargo run --release --example gen_maritime_trust_ref_inputs
    python3 scripts/gen_maritime_trust_ref.py
"""
import json
import math
import os
import random
import sys

import numpy as np
import pynmea2
from geographiclib.geodesic import Geodesic

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import maritime_score_cleanroom as cleanroom  # noqa: E402

DIR = os.path.join(HERE, "..", "tests", "fixtures", "maritime_trust")
KN = 1852.0 / 3600.0

# The documented defaults the monitors use (docs/MARITIME-TRUST.md, [maritime]).
CAL_S = 60
KIN_WINDOW = 30
KIN_TOL_M = 12.0
MIN_SPEED_KN = 3.0
SMOOTH_S = 10
ANTENNA_H = 18.0
CN0_MIN_SATS = 6
CN0_RISE_MIN = 5

WGS84 = Geodesic.WGS84

FILES_DECODE = [
    "voyage.nmea",
    "lat_s45.nmea",
    "lat_0.nmea",
    "lat_30.nmea",
    "lat_70.nmea",
    "antimeridian.nmea",
    "variant_vtg_only.nmea",
    "variant_vbw.nmea",
]
LETTER = {"GP": "G", "GA": "E"}  # NMEA talker -> constellation letter (NMEA 0183 talker ids)


def tod_s(t):
    return t.hour * 3600 + t.minute * 60 + t.second + t.microsecond / 1e6


def parse_epochs(path):
    """Group the sentences of a log by the time of its timed sentences (GGA, RMC, ZDA)."""
    epochs = {}
    cur = None
    with open(path, newline="") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            m = pynmea2.parse(line)  # verifies the checksum
            kind = type(m).__name__
            if kind in ("GGA", "RMC", "ZDA"):
                key = round(tod_s(m.timestamp) * 1000)
                cur = epochs.setdefault(key, {"tod_ms": key})
            if cur is None:
                continue
            if kind == "GGA":
                cur["lat"], cur["lon"] = m.latitude, m.longitude
                cur["quality"] = int(m.gps_qual)
                cur["n_used"] = int(m.num_sats)
                cur["hdop"] = float(m.horizontal_dil)
                cur["alt"] = float(m.altitude)
                cur["geo_sep"] = float(m.geo_sep)
            elif kind == "RMC":
                cur["rmc_status"] = m.status
                cur["rmc_mode"] = m.mode_indicator
                cur["rmc_sog"] = float(m.spd_over_grnd)
                cur["rmc_cog"] = float(m.true_course)
                cur["date"] = m.datestamp.isoformat()
            elif kind == "VTG":
                cur["vtg_sog"] = float(m.spd_over_grnd_kts)
                cur["vtg_cog"] = float(m.true_track)
                cur["vtg_mode"] = m.faa_mode
            elif kind == "HDT":
                cur["hdt"] = float(m.heading)
            elif kind == "VHW":
                cur["vhw_stw"] = float(m.water_speed_knots)
                cur["vhw_heading"] = float(m.heading_true)
            elif kind == "VBW":
                cur["vbw_stw"] = float(m.lon_water_spd)
                cur["vbw_valid"] = m.data_validity_water_spd
            elif kind == "ZDA":
                cur["zda_date"] = "%04d-%02d-%02d" % (m.year, m.month, m.day)
            elif kind == "GSV":
                sats = cur.setdefault("gsv", [])
                for i in range(1, 5):
                    prn = getattr(m, "sv_prn_num_%d" % i, None)
                    snr = getattr(m, "snr_%d" % i, None)
                    if prn not in (None, "") and snr not in (None, ""):
                        sats.append([LETTER[m.talker], int(prn), float(snr)])
    return [epochs[k] for k in sorted(epochs)]


def valid_fix(e):
    """A satellite fix: GGA quality 1-5, RMC status A and mode not E/M/S/N (docs: what it reads)."""
    q_ok = 1 <= e.get("quality", 0) <= 5
    rmc_ok = "rmc_status" not in e or (
        e["rmc_status"] == "A" and e.get("rmc_mode") not in ("N", "E", "M", "S")
    )
    return q_ok and rmc_ok


def sog_cog(e):
    if "rmc_sog" in e and e.get("rmc_status") == "A" and e.get("rmc_mode") not in ("N", "E", "M", "S"):
        return e["rmc_sog"], e["rmc_cog"]
    if "vtg_sog" in e and e.get("vtg_mode") != "N":
        return e["vtg_sog"], e["vtg_cog"]
    return None, None


def heading(e):
    return e.get("hdt", e.get("vhw_heading"))


def stw(e):
    if "vhw_stw" in e:
        return e["vhw_stw"]
    if "vbw_stw" in e and e.get("vbw_valid") == "A":
        return e["vbw_stw"]
    return None


def decode_record(e, t0):
    sog, cog = sog_cog(e)
    iso = None
    if "date" in e:
        ms = e["tod_ms"]
        iso = "%sT%02d:%02d:%02d.%03dZ" % (
            e["date"], ms // 3600000, ms // 60000 % 60, ms // 1000 % 60, ms % 1000)
    return {
        "t_s": (e["tod_ms"] - t0) / 1000.0,
        "tod_ms": e["tod_ms"],
        "iso": iso,
        "lat": e["lat"],
        "lon": e["lon"],
        "n_used": e["n_used"],
        "hdop": e["hdop"],
        "alt": e["alt"],
        "geo_sep": e["geo_sep"],
        "fix_valid": valid_fix(e),
        "sog": sog,
        "cog": cog,
        "heading": heading(e),
        "stw": stw(e),
        "gsv": sorted(e.get("gsv", [])),
    }


def geod(p, q):
    g = WGS84.Inverse(p["lat"], p["lon"], q["lat"], q["lon"])
    return g["s12"], g["azi1"] % 360.0


def wrap180(d):
    return (d + 540.0) % 360.0 - 180.0


def median(v):
    return float(np.median(np.array(v)))


def stats_series(ep):
    """The monitors' input statistics at each scored epoch of the main voyage."""
    n = len(ep)
    out = []
    # Baseline per satellite: median over the calibration epochs (t < CAL_S).
    cal = {}
    for i in range(n):
        if i < CAL_S:
            for letter, prn, snr in ep[i].get("gsv", []):
                cal.setdefault((letter, prn), []).append(snr)
    base = {k: median(v) for k, v in cal.items()}
    for i in range(CAL_S, n):
        e = ep[i]
        rec = {"t_s": float(i)}
        p30, p60 = ep[i - KIN_WINDOW], ep[i - 2 * KIN_WINDOW]
        dt2 = (e["tod_ms"] - p30["tod_ms"]) / 1000.0
        dt1 = (p30["tod_ms"] - p60["tod_ms"]) / 1000.0
        s2, a2 = geod(p30, e)
        s1, a1 = geod(p60, p30)
        rec["kin_speed_mps"] = s2 / dt2
        # dead reckoning over i-30..i from the reported speed and course
        pe = pn = 0.0
        for j in range(i - KIN_WINDOW, i):
            v0 = sog_cog(ep[j])
            v1 = sog_cog(ep[j + 1])
            h = (ep[j + 1]["tod_ms"] - ep[j]["tod_ms"]) / 1000.0
            e0, n0 = v0[0] * KN * math.sin(math.radians(v0[1])), v0[0] * KN * math.cos(math.radians(v0[1]))
            e1, n1 = v1[0] * KN * math.sin(math.radians(v1[1])), v1[0] * KN * math.cos(math.radians(v1[1]))
            pe += 0.5 * (e0 + e1) * h
            pn += 0.5 * (n0 + n1) * h
        de, dn = s2 * math.sin(math.radians(a2)), s2 * math.cos(math.radians(a2))
        rec["kin_resid_m"] = math.hypot(de - pe, dn - pn)
        # acceleration and turn rate from the velocities of two consecutive windows
        e2, n2 = s2 * math.sin(math.radians(a2)) / dt2, s2 * math.cos(math.radians(a2)) / dt2
        e1_, n1_ = s1 * math.sin(math.radians(a1)) / dt1, s1 * math.cos(math.radians(a1)) / dt1
        unc = KIN_TOL_M / dt2 + KIN_TOL_M / dt1
        dv = math.hypot(e2 - e1_, n2 - n1_)
        span = 0.5 * (dt1 + dt2)
        rec["kin_accel_mps2"] = max(0.0, dv - unc) / span
        v1m, v2m = s1 / dt1, s2 / dt2
        if v1m >= MIN_SPEED_KN * KN and v2m >= MIN_SPEED_KN * KN:
            unc_deg = math.degrees(math.atan(KIN_TOL_M / dt1 / v1m + KIN_TOL_M / dt2 / v2m))
            rec["kin_turn_dps"] = max(0.0, abs(wrap180(a2 - a1)) - unc_deg) / span
        else:
            rec["kin_turn_dps"] = None
        # medians over the smoothing window (samples within SMOOTH_S seconds, current included)
        win = [ep[j] for j in range(max(0, i - SMOOTH_S), i + 1)]
        hd = []
        for w in win:
            sg, cg = sog_cog(w)
            h = heading(w)
            if sg is not None and sg >= MIN_SPEED_KN and h is not None:
                hd.append(abs(wrap180(h - cg)))
        rec["hdg_cog_deg"] = median(hd) if hd else None
        st = []
        for w in win:
            sg, _ = sog_cog(w)
            s = stw(w)
            if sg is not None and s is not None:
                st.append(abs(sg - s))
        rec["stw_sog_kn"] = median(st) if st else None
        rec["sea_level_m"] = median([abs(w["alt"] - ANTENNA_H) for w in win])
        gsv = e.get("gsv")
        if gsv and len(gsv) >= CN0_MIN_SATS:
            snr = np.array([s for _, _, s in gsv])
            rec["cn0_spread_db"] = float(np.std(snr))  # population standard deviation
        else:
            rec["cn0_spread_db"] = None
        if gsv:
            rises = [s - base[(l, p)] for l, p, s in gsv if (l, p) in base]
            rec["cn0_rise_db"] = float(np.mean(rises)) if len(rises) >= CN0_RISE_MIN else None
        else:
            rec["cn0_rise_db"] = None
        out.append(rec)
    return out


def geodesy_pairs(decoded):
    """Fix pairs at several baselines (up to about 2 km) with the oracle's distance and azimuth."""
    pairs = []
    for name, recs in decoded.items():
        if name.startswith("variant"):
            continue
        n = len(recs)
        for gap in (5, 30, 100, 200):
            for i in range(0, n - gap, 10):
                a, b = recs[i], recs[i + gap]
                p = [round(a["lat"], 9), round(a["lon"], 9), round(b["lat"], 9), round(b["lon"], 9)]
                g = WGS84.Inverse(*p)
                if g["s12"] > 2000.0:
                    continue
                # The direction of the chord between the fixes is the geodesic's MEAN azimuth, not the
                # forward azimuth at the first fix (see PREREGISTRATION.md, amendment 3).
                azi_mean = (g["azi1"] + wrap180(g["azi2"] - g["azi1"]) / 2.0) % 360.0
                pairs.append({"p": p, "s12": g["s12"], "azi1": g["azi1"] % 360.0,
                              "azi_mean": azi_mean, "file": name, "gap": gap})
    return pairs


def score_cases():
    """Ratios with the clean-room aggregation's result; inputs chosen away from rounding ties."""
    monitors = [
        "cn0-drop", "agc", "jam-ind", "loss-of-lock", "position-jump", "raim", "clock",
        "solve-failure", "kinematic", "heading-course", "speed-log", "sea-level", "cn0-spread",
        "cn0-rise", "time-consistency", "osnma",
    ]
    rng = random.Random(20261010)
    cases = []
    edge = [0.0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 2.0, 6.0]
    while len(cases) < 600:
        k = rng.randint(0, 6) if len(cases) >= 40 else 1
        names = rng.sample(monitors, k)
        if len(cases) % 3 == 0:
            ratios = {m: rng.choice(edge) for m in names}
        else:
            ratios = {m: round(rng.uniform(0.0, 3.0), 6) for m in names}
        r = cleanroom.score(ratios)
        total = sum(d["points"] for d in r["deductions"])
        raw = max(0.0, min(100.0, 100.0 - total)) * 10.0
        frac = raw - math.floor(raw)
        if abs(frac - 0.5) < 1e-6:  # a rounding tie: leave it out
            continue
        cases.append({"ratios": ratios, "score": r["score"], "band": r["band"],
                      "deductions": r["deductions"]})
    return cases


def main():
    decoded, raw_epochs = {}, {}
    for name in FILES_DECODE:
        ep = parse_epochs(os.path.join(DIR, name))
        raw_epochs[name] = ep
        t0 = ep[0]["tod_ms"]
        decoded[name] = [decode_record(e, t0) for e in ep]
    ref = {
        "oracle": {
            "pynmea2": pynmea2.__version__ if hasattr(pynmea2, "__version__") else "1.19.0",
            "geographiclib": "2.1",
            "numpy": np.__version__,
        },
        "decode": decoded,
        "geodesy": geodesy_pairs(decoded),
        "stats": stats_series(raw_epochs["voyage.nmea"]),
        "score": score_cases(),
    }
    out = os.path.join(DIR, "reference.json")
    with open(out, "w") as f:
        json.dump(ref, f, indent=0, separators=(",", ":"))
    print("wrote", out, "geodesy pairs:", len(ref["geodesy"]), "stats epochs:", len(ref["stats"]),
          "score cases:", len(ref["score"]))


if __name__ == "__main__":
    main()
