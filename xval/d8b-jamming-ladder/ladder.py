#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""D8b row 7: the fresh jammer-power ladder for the jamming kind's hysteresis bars, from the
scenario file alone (no engine run, no engine code).

The closed-form effective C/N0 of the median link (README reading 2) is the engine's documented
link-budget chain (src/jamming.rs module docs; Kaplan & Hegarty 3rd ed. section 9.4):
J/S = P_j + G_j + G_rx(jammer) - FSPL(d, f) - (P_s + G_rx(sat)); C/N0 = P_s + G_rx(sat) - 10 log10(k T);
(C/N0)_eff = [1/(C/N0) + (J/S)/(Q Rc)]^-1, with the receive pattern G_rx(el) = -4 (1 - el/90 deg)
for el clamped to [0, 90] deg. The ladder is every integer dBW power whose median-link (C/N0)_eff
lies in [loss - 3, acquisition + 3], less the powers of supplement 1.

    python3 -I ladder.py ../../scenarios/jamming-demo.toml ladder.json
"""
import json
import math
import sys
import tomllib

C, BOLTZ = 299_792_458.0, 1.380649e-23
L1, RC = 1_575_420_000.0, 1_023_000.0
P_SIG, TEMP = -158.5, 290.0
ACQ, LOSS = 32.0, 25.0  # the registered H3 acquisition threshold; the scenario's loss threshold
MEDIAN_EL_DEG = 45.0  # reading 2
SUPPLEMENT_1 = {-40, -35, -30, -25}
Q = {"broadband": 2.0, "swept": 2.0}


def ecef(lat, lon, h):
    a, f = 6378137.0, 1 / 298.257223563
    e2 = f * (2 - f)
    la, lo = math.radians(lat), math.radians(lon)
    n = a / math.sqrt(1 - e2 * math.sin(la) ** 2)
    return [(n + h) * math.cos(la) * math.cos(lo), (n + h) * math.cos(la) * math.sin(lo),
            (n * (1 - e2) + h) * math.sin(la)]


def gain(el_deg):
    el = min(max(el_deg, 0.0), 90.0)
    return -4.0 * (1.0 - el / 90.0)


def main(scn_path, out_path):
    s = tomllib.load(open(scn_path, "rb"))
    assert s["tracking_threshold_dbhz"] == LOSS
    rx, jm = s["receiver"], s["jammer"]
    r = ecef(rx["lat_deg"], rx["lon_deg"], rx["alt_m"])
    j = jm["position_ecef_m"]
    d = [j[i] - r[i] for i in range(3)]
    dist = math.sqrt(sum(x * x for x in d))
    la, lo = math.radians(rx["lat_deg"]), math.radians(rx["lon_deg"])
    up = [math.cos(la) * math.cos(lo), math.cos(la) * math.sin(lo), math.sin(la)]
    el_j = math.degrees(math.asin(sum(d[i] * up[i] for i in range(3)) / dist))
    fspl = 20 * math.log10(dist) + 20 * math.log10(L1) + 20 * math.log10(4 * math.pi / C)
    g_sat, g_jam = gain(MEDIAN_EL_DEG), gain(el_j)
    q = Q.get(jm["jammer_type"], 1.0)
    cn0 = P_SIG + g_sat - 10 * math.log10(BOLTZ * TEMP)

    def eff(p):
        js = p + jm["gain_dbi"] + g_jam - fspl - (P_SIG + g_sat)
        return -10 * math.log10(10 ** (-cn0 / 10) + 10 ** (js / 10) / (q * RC))

    lo_c, hi_c = LOSS - 3.0, ACQ + 3.0
    ladder = [p for p in range(-80, 41) if lo_c <= eff(p) <= hi_c and p not in SUPPLEMENT_1]
    doc = {"scenario": "scenarios/jamming-demo.toml", "distance_m": dist, "jammer_elevation_deg": el_j,
           "median_link_elevation_deg": MEDIAN_EL_DEG, "q": q, "cn0_nominal_dbhz": cn0,
           "interval_dbhz": [lo_c, hi_c], "ladder_dbw": ladder,
           "median_link_cn0_eff_dbhz": {str(p): round(eff(p), 6) for p in ladder},
           "excluded_supplement_1_dbw": sorted(p for p in SUPPLEMENT_1 if lo_c <= eff(p) <= hi_c)}
    json.dump(doc, open(out_path, "w"), indent=1)
    print(json.dumps({k: doc[k] for k in ("distance_m", "jammer_elevation_deg", "ladder_dbw",
                                          "excluded_supplement_1_dbw")}))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
