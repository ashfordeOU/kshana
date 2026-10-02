#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Put the GRACE-FO 1 (GRACE-C) onboard clock of 2024-01-01 on the ITSG orbit's 10 s GPS grid.

Source: GRACE-FO Level-1B CLK1B, JPL release 04, file CLK1B_2024-01-01_C_04.txt inside
gracefo_1B_2024-01-01_RL04.ascii.noLRI.tgz (GFZ ISDC,
https://isdc-data.gfz.de/grace-fo/Level-1B/JPL/INSTRUMENT/RL04/2024/, NASA open data policy).
Columns: rcv_time (receiver seconds past 2000-01-01 12:00:00), id, clock_id, eps_time, ...;
"GPS Time = rcv_time + eps_time". The apparent clock offset a message would carry is receiver
time minus GPS time, x = -eps_time, at GPS instant rcv_time + eps_time. Duplicate rcv_time rows
(the first and last, with extrapolation flags) are dropped after the first. The values are put
on the grid 2024-01-01 00:00:00 GPS + 10 k s (k = 0..8640) by numpy.interp.

Usage: gen_clock.py CLK1B_2024-01-01_C_04.txt > grace_c_clock_2024-01-01.csv
"""
import sys
import numpy as np

rows, seen = [], set()
body = False
for ln in open(sys.argv[1]):
    if ln.startswith("# End of YAML header"):
        body = True
        continue
    if not body or not ln.strip():
        continue
    f = ln.split()
    t = int(f[0])
    if t in seen:
        continue
    seen.add(t)
    rows.append((t + float(f[3]), -float(f[3])))
rows.sort()
tg = np.array([r[0] for r in rows])
xs = np.array([r[1] for r in rows])
grid = 757339200.0 + 10.0 * np.arange(8641)  # 2024-01-01 00:00:00 GPS
assert tg[0] < grid[0] and tg[-1] > grid[-1]
gaps = np.diff(tg).max()
x = np.interp(grid, tg, xs)
print("# GRACE-FO 1 (GRACE-C) onboard clock 2024-01-01, CLK1B RL04, receiver time minus GPS time")
print(f"# gps_week 2295 tow0 86400.0 step_s 10 (largest CLK1B gap {gaps:.3f} s)")
print("# t_s,clock_s")
for k, v in enumerate(x):
    print(f"{10 * k},{v:.15e}")
