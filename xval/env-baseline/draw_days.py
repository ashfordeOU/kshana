# SPDX-License-Identifier: AGPL-3.0-only
"""B8 step 3: draw the documented event days from the GFZ index files by the pre-registered rule (section 2).

    python3 -I xval/env-baseline/draw_days.py <dir with Kp_ap_Ap_SN_F107_since_1932.txt and QD_days<yyyy>.txt>
"""
import json
import os
import re
import sys

MONTHS = {m: i + 1 for i, m in enumerate("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split())}


def daily(d):
    out = {}
    for line in open(os.path.join(d, "Kp_ap_Ap_SN_F107_since_1932.txt")):
        if line.startswith("#"):
            continue
        f = line.split()
        y, m, day = int(f[0]), int(f[1]), int(f[2])
        kp = [float(x) for x in f[7:15]]
        out[(y, m, day)] = {"kp_max": max(kp), "ap": int(f[23]), "f107_obs": float(f[25])}
    return out


def qdays(d, years):
    out = {}
    for y in years:
        for line in open(os.path.join(d, f"QD_days{y}.txt")):
            m = re.match(r"\s*([A-Z][a-z]{2})\s+(\d{4})\s+(.*)$", line)
            if not m or m.group(1) not in MONTHS:
                continue
            nums = re.findall(r"\d+", m.group(3))
            out[(int(m.group(2)), MONTHS[m.group(1)])] = [int(x) for x in nums[:5]]  # Q1..Q5
    return out


def main():
    d = sys.argv[1]
    days = daily(d)
    q = qdays(d, range(2015, 2026))
    span = [k for k in days if (2015, 1, 1) <= k <= (2025, 12, 31)]
    # Storm days: daily max Kp >= 8- (7.667); more than 10: the 10 with the highest daily Ap.
    storms = [k for k in span if days[k]["kp_max"] >= 7.667 - 1e-9]
    storms = sorted(storms, key=lambda k: (-days[k]["ap"], k))[:10]
    storms.sort()
    # Quiet days: the international Q-days (Q1..Q5) of the storm days' months, at most 20, lowest Ap.
    months = sorted({(k[0], k[1]) for k in storms})
    quiet = [(y, m, dd) for (y, m) in months for dd in q[(y, m)]]
    quiet = sorted(quiet, key=lambda k: (days[k]["ap"], k))[:20]
    quiet.sort()
    # Equinox low-latitude days: Q-days of March and September-October 2024, at most 10, lowest Ap.
    eq = [(2024, m, dd) for m in (3, 9, 10) for dd in q[(2024, m)]]
    eq = sorted(eq, key=lambda k: (days[k]["ap"], k))[:10]
    eq.sort()
    fmt = lambda ks: [{"date": "%04d-%02d-%02d" % k, **days[k]} for k in ks]
    json.dump({"storm": fmt(storms), "quiet": fmt(quiet), "equinox": fmt(eq)}, sys.stdout, indent=1)
    sys.stdout.write("\n")


if __name__ == "__main__":
    main()
