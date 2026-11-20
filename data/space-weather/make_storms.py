#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Build data/space-weather/storms.json (the storm library of `kshana space-weather`) from the
GFZ Kp/ap/Ap/SN/F10.7 file.

Usage:
    curl -O https://kp.gfz.de/app/files/Kp_ap_Ap_SN_F107_since_1932.txt
    python3 -I data/space-weather/make_storms.py Kp_ap_Ap_SN_F107_since_1932.txt > data/space-weather/storms.json

Source: GFZ German Research Centre for Geosciences, Kp_ap_Ap_SN_F107_since_1932.txt
(https://kp.gfz.de/), licence CC BY 4.0; Matzka, J., Stolle, C., Yamazaki, Y., Bronkalla, O. and
Morschhauser, A. (2021), The geomagnetic Kp index and derived indices of geomagnetic activity,
Space Weather 19, e2020SW002641, doi:10.1029/2020SW002641. The F10.7 columns in that file come
from the Dominion Radio Astrophysical Observatory (NRC Canada) flux series.

Only the days of the windows below are written: the three-hourly Kp and ap, the daily Ap, the
observed F10.7 and its centred 81-day mean (computed here from the observed series, missing days
skipped). The synthetic stress case is written by this script, not taken from the file.
"""
import hashlib
import json
import sys
from datetime import date, timedelta

# (id, first day, last day, name, context). The context is a short factual note with its source;
# the numbers in the record are the GFZ file's.
STORMS = [
    ("2003-10-halloween", "2003-10-28", "2003-11-01", "Halloween storms, October 2003",
     "Two extreme (Kp 9) storms after X-class flares; the FAA reported WAAS vertical guidance "
     "unavailable for many hours on 29 and 30 October (FAA WAAS performance analysis report)."),
    ("2008-06-quiet", "2008-06-10", "2008-06-12", "Quiet days at the 2008 solar minimum",
     "A reference without a storm: Kp below 2 and F10.7 near 66 sfu in the deepest solar "
     "minimum of the space age (Emmert et al. 2010, Geophys. Res. Lett. 37, L12102)."),
    ("2015-03-st-patricks", "2015-03-16", "2015-03-19", "St Patrick's Day storm, March 2015",
     "The strongest storm of solar cycle 24 by Dst; Kp reached 8- (NOAA G4) on 17 March."),
    ("2017-09-08", "2017-09-06", "2017-09-09", "Storm of 7-8 September 2017",
     "Kp 8+ after the X9.3 flare of 6 September 2017."),
    ("2022-02-starlink", "2022-02-01", "2022-02-06", "Minor storms of 3-4 February 2022",
     "Kp 5 (NOAA G1) storms; SpaceX reported that up to 40 of the 49 Starlink satellites "
     "launched on 3 February 2022 would re-enter after the storm raised the drag at their "
     "deployment altitude (SpaceX update, 8 February 2022)."),
    ("2024-05-gannon", "2024-05-09", "2024-05-13", "Gannon storm, May 2024",
     "The first Kp 9 (NOAA G5) storm since 2003; disruptions of GNSS-guided farm machinery "
     "were widely reported in North America."),
    ("2024-10-10", "2024-10-09", "2024-10-12", "Storm of 10-11 October 2024",
     "Kp 8+ to 9- (NOAA G4) after the X1.8 flare of 9 October 2024."),
    ("2025-11-12", "2025-11-10", "2025-11-14", "Geomagnetic superstorm, November 2025",
     "Kp 9- (NOAA G4) from 00 to 06 UT on 12 November 2025 (the evening of 11 November in North "
     "America); RNTF (10 Sep 2026) reported GPS errors of about 30 ft affecting farming."),
]

SYNTHETIC = {
    "id": "synthetic-extreme",
    "name": "Synthetic extreme storm (stress case)",
    "context": "SYNTHETIC, not an observed storm: 24 hours at the top of the Kp scale (9o) "
               "with an active Sun (F10.7 250 sfu), framed by a day of Kp 6 either side, as a "
               "stress case for extreme-space-weather tests. Kp saturates at 9, so a "
               "Carrington-class event cannot be told apart from it in Kp alone.",
    "synthetic": True,
}

AP = [0, 2, 3, 4, 5, 6, 7, 9, 12, 15, 18, 22, 27, 32, 39, 48, 56, 67, 80, 94, 111, 132,
      154, 179, 207, 236, 300, 400]


def main(path):
    raw = open(path, "rb").read()
    rows = {}
    f107 = []
    for line in raw.decode("ascii").splitlines():
        if line.startswith("#") or not line.strip():
            continue
        p = line.split()
        d = date(int(p[0]), int(p[1]), int(p[2]))
        kp = [float(x) for x in p[7:15]]
        ap = [int(x) for x in p[15:23]]
        rows[d] = {"kp": kp, "ap": ap, "Ap": int(p[23]), "f107": float(p[25]), "D": int(p[27])}
        f107.append((d, float(p[25])))
    idx = {d: i for i, (d, _) in enumerate(f107)}

    def f107a(d):
        i = idx[d]
        w = [v for _, v in f107[max(0, i - 40):i + 41] if v > 0]
        return round(sum(w) / len(w), 2)

    out = []
    for sid, a, b, name, ctx in STORMS:
        d, end = date.fromisoformat(a), date.fromisoformat(b)
        days = []
        while d <= end:
            r = rows[d]
            days.append({"date": d.isoformat(), "kp": r["kp"], "ap": r["ap"], "ap_daily": r["Ap"],
                         "f107": r["f107"], "f107a": f107a(d), "definitive": r["D"] >= 1})
            d += timedelta(days=1)
        out.append({"id": sid, "name": name, "context": ctx, "synthetic": False, "days": days})
    syn = dict(SYNTHETIC)
    kps = [[6.0] * 8, [9.0] * 8, [6.0] * 8]
    syn["days"] = [{"date": f"2000-01-0{i + 1}", "kp": k, "ap": [AP[round(x * 3)] for x in k],
                    "ap_daily": round(sum(AP[round(x * 3)] for x in k) / 8),
                    "f107": 250.0, "f107a": 250.0, "definitive": False}
                   for i, k in enumerate(kps)]
    out.append(syn)
    doc = {
        "format": "kshana.storms/1",
        "source": "GFZ German Research Centre for Geosciences, Kp_ap_Ap_SN_F107_since_1932.txt "
                  "(https://kp.gfz.de/), CC BY 4.0; Matzka et al. (2021), Space Weather 19, "
                  "e2020SW002641, doi:10.1029/2020SW002641",
        "source_sha256": hashlib.sha256(raw).hexdigest(),
        "storms": out,
    }
    # One day per line: small, and a diff shows which day changed.
    lines = ["{", f' "format": {json.dumps(doc["format"])},', f' "source": {json.dumps(doc["source"])},',
             f' "source_sha256": {json.dumps(doc["source_sha256"])},', ' "storms": [']
    for i, s in enumerate(out):
        head = {k: v for k, v in s.items() if k != "days"}
        lines.append("  {" + json.dumps(head)[1:-1] + ', "days": [')
        for j, d in enumerate(s["days"]):
            lines.append("   " + json.dumps(d) + ("," if j + 1 < len(s["days"]) else ""))
        lines.append("  ]}" + ("," if i + 1 < len(out) else ""))
    lines += [" ]", "}"]
    sys.stdout.write("\n".join(lines) + "\n")


if __name__ == "__main__":
    main(sys.argv[1])
