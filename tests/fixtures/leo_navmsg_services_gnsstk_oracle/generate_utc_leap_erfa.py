#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""ERFA oracle for the leap-second cases of tests/leo_navmsg_services_gnsstk_oracle.rs (M125).

For each real leap second (2015-06-30, GPS WN_LSF 1851, DN 3, dtLS 16 -> 17; 2016-12-31,
WN_LSF 1929, DN 7, 17 -> 18) and every quarter second from 7 h before to 7 h after the event,
the GPS instant is turned into TAI (GPS + 19 s) and then into UTC by ERFA (pyerfa, BSD-3-Clause,
which carries the IERS leap-second table); erfa.d2dtf writes an inserted second as 23:59:60.
The UTC time of day (s, 86400 + fraction during the inserted second) goes to utc_leap.tsv.

Committed subset (amendment written before any Kshana value was compared): the full quarter-second
grid is 403 202 rows (17.5 MB), too large to commit, so the file keeps every quarter second within
120 s of each event, every whole second within 1 h, and every 15 s over the full 7 h either side.
"""
import erfa
import numpy as np

GPS0_JD = 2444244.5  # 1980-01-06 00:00 GPS
rows = ["dt_ls\tdt_lsf\twn_lsf\tdn\tweek\ttow\tutc_sod"]
for dt_ls, wn, dn in ((16, 1851, 3), (17, 1929, 7)):
    event = wn * 604800 + dn * 86400  # GPS seconds since the GPS epoch, end of day DN
    for k in range(-7 * 3600 * 4, 7 * 3600 * 4 + 1):
        q = abs(k)
        if not (q <= 120 * 4 or (q <= 3600 * 4 and k % 4 == 0) or k % 60 == 0):
            continue
        g = event + dt_ls + k / 4.0  # around UTC midnight (GPS - UTC = dt_ls before the event)
        week, tow = divmod(g, 604800)
        days, secs = divmod(g, 86400)
        # TAI = GPS + 19 s, as a two-part Julian date with an exact fraction.
        tai1, tai2 = GPS0_JD + days, (secs + 19.0) / 86400.0
        u1, u2 = erfa.taiutc(tai1, tai2)
        iy, im, idd, ihmsf = erfa.d2dtf("UTC", 9, u1, u2)
        h, m, s, f = (int(x) for x in ihmsf.tolist())
        sod = h * 3600 + m * 60 + s + f * 1e-9
        rows.append(f"{dt_ls}\t{dt_ls + 1}\t{wn}\t{dn}\t{int(week)}\t{tow:.2f}\t{sod:.9f}")
open("utc_leap.tsv", "w").write("\n".join(rows) + "\n")
print(len(rows) - 1, "rows; erfa", erfa.__version__)
