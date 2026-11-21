# SPDX-License-Identifier: AGPL-3.0-only
"""Lab 3 solution (Python track): map a receiver log. python3 -I lab3.py <libkshana_capi>"""
import json

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # -I leaves the script's folder off the path
import kit  # noqa: E402

k = kit.engine()
sheet = kit.Sheet("docs/teaching/lab-3-connect-a-log.md")
out = k.connect_map(
    kit.text("examples/connect/timing-monitor.connect.toml").encode(),
    kit.text("examples/obs/station.toml").encode(),
    kit.text("examples/connect/timing-monitor.csv").encode(),
)
records = [json.loads(line) for line in out.decode("utf-8").splitlines() if line.strip()]
header, epochs = records[0], records[1:]

# 1. What came out.
sheet.answer("1a records", f"{len(records)} records", header["type"] == "header")
sheet.answer("1b epochs", f"{len(epochs)} epochs", all(e["type"] == "epoch" for e in epochs))
sheet.answer("1c skipped rows", f"skipped_records = {header['skipped_records']}", header["skipped_records"] == 0)

# 2. Time: GPS week 2443, 43218 s of week, labelled in UTC.
sheet.answer("2 first label", epochs[0]["time_label"], epochs[0]["time_label"] == "2026-11-01T12:00:00Z")

# 3. Units: the log gives height in feet.
sheet.answer("3 height", f"{epochs[0]['fix']['height_m']:.2f} m", abs(epochs[0]["fix"]["height_m"] - 98.4 * 0.3048) < 1e-9)

# 4. What changes over the five seconds.
sats = [sorted(c["sat"] for c in e["cn0"]) for e in epochs]
lost = [e["t_s"] for e, s in zip(epochs, sats) if "G25" not in s]
sheet.answer("4a G25 last seen", f"G25 is missing from t = {lost[0]:.0f} s", lost == [3.0, 4.0])
g05 = [next(c["cn0_dbhz"] for c in e["cn0"] if c["sat"] == "G05") for e in epochs]
sheet.answer("4b G05 drop", f"{g05[0] - g05[-1]:.1f} dB-Hz", abs(g05[0] - g05[-1] - 13.9) < 1e-9)
agc = [e["agc"] for e in epochs]
sheet.answer("4c AGC", f"{agc[0]:.0f} to {agc[-1]:.0f}", agc == sorted(agc, reverse=True))
spoof = [e["self_report"]["spoofing"] for e in epochs]
sheet.answer("4d self-report", f"spoofing {spoof[0]} to {spoof[-1]}", spoof == [1, 1, 1, 2, 2])
sheet.done()
