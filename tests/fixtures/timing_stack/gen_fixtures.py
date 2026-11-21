#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Writes the synthetic timing-stack fixtures (no host data). Deterministic. Faults:
* ts2phc_stale.log: 60 one-second readings, locked from the fifth, then silence (stops at 1000059);
* pps_kernel.txt: 120 pulses, host offset +2 us with a fixed +/-1 us ripple (kernel-PPS-like);
* pps_polled.txt: 120 pulses with a fixed +/-150 us ripple (DCD-polling-like);
* pps_stale.txt: pulses 0..29 then none (the capture ends 30 s later, --end);
* ntpshmmon_stopped.txt: NTP0 every second 0..19 s then stops, NTP1 continues to 40 s.
"""
import os
D = os.path.dirname(os.path.abspath(__file__))
def w(name, text):
    open(os.path.join(D, name), "w").write(text)
T0 = 1_700_000_000
lines = ["# synthetic (gen_fixtures.py): ts2phc locks then the PPS input stops at the 60th reading"]
for k in range(60):
    st = "s0" if k < 2 else ("s1" if k < 4 else "s2")
    off = [3, -1, 4, -2, 1][k % 5]
    lines.append("ts2phc[%d.000]: /dev/ptp0 offset %10d %s freq %10d" % (1_000_000 + k, off, st, -2))
w("ts2phc_stale.log", "\n".join(lines) + "\n")
def pps(name, n, ripple_ns, start=T0, comment=""):
    out = ["# synthetic (gen_fixtures.py): " + comment]
    for k in range(n):
        ns = 2_000 + ripple_ns * [1, -1, 0, 1, -1, 0, -1][k % 7]
        out.append("%d.%09d#%d" % (start + k, ns, 1000 + k))
    w(name, "\n".join(out) + "\n")
pps("pps_kernel.txt", 120, 1_000, comment="kernel-PPS-like jitter (+/-1 us)")
pps("pps_polled.txt", 120, 150_000, comment="DCD-polling-like jitter (+/-150 us)")
pps("pps_stale.txt", 30, 1_000, comment="pulses stop after 30; run with --end %d" % (T0 + 60))
out = ["ntpshmmon: version 3.25 (synthetic, gen_fixtures.py: NTP0 stops at 19 s, NTP1 continues)",
       "#      Name   Seen@                Clock                Real                 L Prec"]
for k in range(41):
    for unit in ("NTP0", "NTP1"):
        if unit == "NTP0" and k > 19:
            continue
        seen = T0 + k + 0.000123
        clock = T0 + k + (0.000050 if unit == "NTP0" else -0.000020)
        out.append("sample %s %.9f %.9f %.9f 0 -20" % (unit, seen, clock, T0 + k))
w("ntpshmmon_stopped.txt", "\n".join(out) + "\n")
