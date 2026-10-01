#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut the JammerTest 2024 fixture slices for the spoofing-detection and TPL oracle tests.

This script is a format converter, not an oracle: it copies real receiver pseudoranges from the
JammerTest 2024 dataset (GPL-3.0-or-later, see NOTICE.md) into small RINEX 3 observation files, and
the GPS records of the IGS merged broadcast navigation file into a RINEX 3 navigation slice. The
oracle is the published onset time of each attack (the JammerTest 2024 transmission plan), which is
written into `onsets.tsv` by hand from the plan and never computed.

Usage:
  generate_spoof_detection_jammertest_oracle.py <extracted dataset root> <BRDC00IGS_R_20242550000_01D_MN.rnx>

Selection (fixed in the promotion record before any monitor was run):
  * one epoch per integer GPS second (the first 5 Hz sample of each second);
  * GPS satellites carrying both pseudorange_L1 (written as C1C) and pseudorange_L2 (C2L);
  * per onset, from cal_start = max(recording start, previous slot end, onset - 240 s) to
    min(slot end, onset + 300 s).
"""
import csv
import math
import sys
from datetime import datetime, timedelta
from pathlib import Path

HERE = Path(__file__).resolve().parent

# (id, folder relative to the dataset root, onset GPS, slot end GPS, earliest window start GPS or None)
# Published local CEST slot times from the transmission plan, converted to GPS time: local - 2 h + 18 s.
ONSETS = [
    ("2.1.1", "Spoofing/stationary/Medium Power (_1W)/Bands_L1_L2_L5/2.1.1",
     "2024-09-11 07:00:18", "2024-09-11 07:40:18", None),
    ("2.1.2", "Spoofing/stationary/Medium Power (_1W)/Bands_E1_L1/2.1.3,2.1.2,2.1.4",
     "2024-09-11 08:20:18", "2024-09-11 08:35:18", "2024-09-11 08:15:18"),
    ("2.1.4", "Spoofing/stationary/Medium Power (_1W)/Bands_E1_L1/2.1.3,2.1.2,2.1.4",
     "2024-09-11 08:40:18", "2024-09-11 08:55:18", "2024-09-11 08:35:18"),
    ("2.3.5", "Spoofing/stationary/Medium Power (_1W)/Bands_E1_E5_L1_L2_L5/2.3.5,2.3.8",
     "2024-09-11 13:40:18", "2024-09-11 13:50:18", "2024-09-11 13:35:18"),
    ("2.3.10", "Spoofing/stationary/Medium Power (_1W)/Bands_E1_E5_L1_L2_L5/2.3.10,2.3.11",
     "2024-09-11 13:55:18", "2024-09-11 14:05:18", None),
    ("2.3.11", "Spoofing/stationary/Medium Power (_1W)/Bands_E1_E5_L1_L2_L5/2.3.10,2.3.11",
     "2024-09-11 14:10:18", "2024-09-11 14:25:18", "2024-09-11 14:05:18"),
    ("2.3.15", "Spoofing/stationary/Medium Power (_1W)/Bands_E1_E5_L1_L2_L5/2.3.15,2.3.12",
     "2024-09-11 14:55:18", "2024-09-11 15:05:18", None),
    ("2.3.12", "Spoofing/stationary/Medium Power (_1W)/Bands_E1_E5_L1_L2_L5/2.3.15,2.3.12",
     "2024-09-11 15:10:18", "2024-09-11 15:20:18", "2024-09-11 15:05:18"),
]
FMT = "%Y-%m-%d %H:%M:%S"


def ecef(lat_deg, lon_deg, h):
    a, f = 6378137.0, 1 / 298.257223563
    e2 = f * (2 - f)
    la, lo = math.radians(lat_deg), math.radians(lon_deg)
    n = a / math.sqrt(1 - e2 * math.sin(la) ** 2)
    return ((n + h) * math.cos(la) * math.cos(lo), (n + h) * math.cos(la) * math.sin(lo),
            (n * (1 - e2) + h) * math.sin(la))


def hdr(text, label):
    return f"{text:<60}{label}\n"


def first_fix(folder):
    with open(folder / "nav_pvt.csv", newline="") as fh:
        for row in csv.DictReader(fh):
            if row.get("fixType") == "3" and row.get("lat"):
                # The CSV stores lat/lon in degrees scaled by 1e-7 a second time.
                return ecef(float(row["lat"]) * 1e7, float(row["lon"]) * 1e7, float(row["height"]))
    raise SystemExit(f"no 3-D fix in {folder}/nav_pvt.csv")


def read_epochs(folder):
    """{integer GPS second: (time string, [(sat, c1, c2)])}, first 5 Hz sample of each second."""
    out, first = {}, None
    with open(folder / "rinex.csv", newline="") as fh:
        rd = csv.reader(fh)
        head = next(rd)
        ti, si = head.index("time"), head.index("satellite")
        p1, p2 = head.index("pseudorange_L1"), head.index("pseudorange_L2")
        chosen = {}
        for row in rd:
            if len(row) < len(head):
                continue
            t = row[ti]
            sec = t[:19]
            if first is None:
                first = datetime.strptime(sec, FMT)
            if sec not in chosen:
                chosen[sec] = t
            if chosen[sec] != t or not row[si].startswith("G"):
                continue
            try:
                c1, c2 = float(row[p1]), float(row[p2])
            except ValueError:
                continue
            # No plausibility filter: every parsed value is passed on, so a spoofed or corrupted
            # pseudorange reaches the monitors (the selection was fixed before the run).
            out.setdefault(sec, (t, []))[1].append((row[si], c1, c2))
    return out, first


def write_obs(path, xyz, epochs):
    keys = sorted(epochs)
    t0 = epochs[keys[0]][0]
    with open(path, "w") as fh:
        fh.write(hdr("     3.04           OBSERVATION DATA    G (GPS)", "RINEX VERSION / TYPE"))
        fh.write(hdr("JammerTest 2024 u-blox ZED-F9P slice (GPL-3.0-or-later)", "COMMENT"))
        fh.write(hdr("Zenodo 15911589, doi:10.5281/zenodo.15910563", "COMMENT"))
        fh.write(hdr(f"{xyz[0]:14.4f}{xyz[1]:14.4f}{xyz[2]:14.4f}", "APPROX POSITION XYZ"))
        fh.write(hdr("G    2 C1C C2L", "SYS / # / OBS TYPES"))
        fh.write(hdr(f"{1.0:10.3f}", "INTERVAL"))
        d = datetime.strptime(t0[:19], FMT)
        fh.write(hdr(f"{d.year:6d}{d.month:6d}{d.day:6d}{d.hour:6d}{d.minute:6d}"
                     f"{d.second + float('0' + t0[19:]):13.7f}     GPS", "TIME OF FIRST OBS"))
        fh.write(hdr("", "END OF HEADER"))
        for k in keys:
            t, sats = epochs[k]
            d = datetime.strptime(t[:19], FMT)
            s = d.second + float("0" + t[19:])
            fh.write(f"> {d.year:4d} {d.month:02d} {d.day:02d} {d.hour:02d} {d.minute:02d}"
                     f"{s:11.7f}  0{len(sats):3d}\n")
            for sat, c1, c2 in sorted(sats):
                fh.write(f"{sat}{c1:14.3f}  {c2:14.3f}  \n")


def write_nav(src, dst):
    lines = Path(src).read_text().splitlines()
    out, i = [], 0
    while i < len(lines):
        ln = lines[i]
        i += 1
        if "RINEX VERSION / TYPE" in ln or "IONOSPHERIC CORR" in ln and ln.startswith("GPS"):
            out.append(ln)
        if "END OF HEADER" in ln:
            out.append(ln)
            break
    while i < len(lines):
        ln = lines[i]
        if ln.startswith("G"):
            rec = lines[i:i + 8]
            hh = int(ln[15:17])
            day = int(ln[12:14])
            if day == 11 and 4 <= hh <= 18:
                out.extend(rec)
            i += 8
        else:
            i += 1
    Path(dst).write_text("\n".join(out) + "\n")


def main():
    root, brdc = Path(sys.argv[1]), sys.argv[2]
    rows = ["id\tfile\tonset_gps\tslot_end_gps\tcal_start_gps"]
    for sid, rel, onset, end, prev in ONSETS:
        folder = root / rel
        epochs, first = read_epochs(folder)
        on, en = datetime.strptime(onset, FMT), datetime.strptime(end, FMT)
        cands = [first.replace(microsecond=0) + timedelta(seconds=1), on - timedelta(seconds=240)]
        if prev:
            cands.append(datetime.strptime(prev, FMT))
        cal = max(cands)
        stop = min(en, on + timedelta(seconds=300))
        keep = {k: v for k, v in epochs.items()
                if cal <= datetime.strptime(k, FMT) <= stop}
        name = f"jt2024_{sid.replace('.', '_')}.obs"
        write_obs(HERE / name, first_fix(folder), keep)
        rows.append(f"{sid}\t{name}\t{onset}\t{end}\t{cal.strftime(FMT)}")
        print(sid, len(keep), "epochs", cal, "->", stop)
    (HERE / "onsets.tsv").write_text("\n".join(rows) + "\n")
    write_nav(brdc, HERE / "brdc_gps_20240911.rnx")


if __name__ == "__main__":
    main()
