#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut the receiver-TCXO training sessions for the clock-library oracles.

A format converter: it copies real receiver pseudoranges from the JammerTest 2024 dataset
(GPL-3.0-or-later; see NOTICE.md) into RINEX 3 observation files with the round-1 M010
converter (one epoch per integer GPS second, GPS satellites with L1 C/A and L2C pseudoranges),
and the GPS records of the IGS merged broadcast navigation file of each recording date. It
computes no clock and no statistic.

Selection (fixed in the pre-registration of tests/clock_library_device_cards_oracle.rs and
tests/clock_library_tcxo_card_jammertest_oracle.rs before this script was first run):
  * every scenario folder holding a rinex.csv under Jamming/stationary/ or Meaconing/stationary/
    (the stationary sessions that hold none of the M010-scored spoofing onsets);
  * every epoch within 60 s of a transmission of ANY test in the official JammerTest 2024 log
    (any sheet, i.e. any site) on the recording's date is removed; a recording whose date the
    log does not cover is removed whole.

Usage (oracle virtual environment, needs openpyxl):
  generate.py <extracted dataset root> <Logg_Jammertest_2024_v1.xlsx> <BRDC directory>
where <BRDC directory> holds BRDC00IGS_R_2024<DOY>0000_01D_MN.rnx (uncompressed) for each
recording date.
"""
import sys
from datetime import datetime, timedelta
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "spoof_detection_jammertest_oracle"))

from generate_spoof_detection_jammertest_oracle import FMT, first_fix, read_epochs, write_obs  # noqa: E402
from generate_logged_onsets import log_rows  # noqa: E402

MARGIN = timedelta(seconds=60)
TOPS = ("Jamming/stationary", "Meaconing/stationary")


def write_nav_full_day(src, dst, day):
    lines = Path(src).read_text().splitlines()
    out, i = [], 0
    while i < len(lines):
        ln = lines[i]
        i += 1
        if "RINEX VERSION / TYPE" in ln or ("IONOSPHERIC CORR" in ln and ln.startswith("GPS")):
            out.append(ln)
        if "END OF HEADER" in ln:
            out.append(ln)
            break
    while i < len(lines):
        ln = lines[i]
        if ln.startswith("G"):
            if int(ln[12:14]) == day:
                out.extend(lines[i:i + 8])
            i += 8
        else:
            i += 1
    Path(dst).write_text("\n".join(out) + "\n")


def main():
    root, xlsx, brdc_dir = Path(sys.argv[1]), sys.argv[2], Path(sys.argv[3])
    log = log_rows(xlsx)
    intervals = {}
    for rows in log.values():
        for _sid, day, st, sp in rows:
            intervals.setdefault(day, []).append((st - MARGIN, sp + MARGIN))
    folders = sorted({p.parent for top in TOPS for p in (root / top).rglob("rinex.csv")})
    summary = []
    days = set()
    for k, folder in enumerate(folders):
        epochs, first = read_epochs(folder)
        day = first.strftime("%Y-%m-%d")
        rel = folder.relative_to(root)
        if day not in intervals:
            summary.append(f"{rel}\t{day}\t{len(epochs)}\t0\tdate not in the log: removed whole")
            continue
        keep = {}
        for key, v in epochs.items():
            t = datetime.strptime(key, FMT)
            if not any(a <= t <= b for a, b in intervals[day]):
                keep[key] = v
        name = f"train_{k:02d}.obs"
        if keep:
            write_obs(HERE / name, first_fix(folder), keep)
            days.add(first.date())
        summary.append(f"{rel}\t{day}\t{len(epochs)}\t{len(keep)}\t{name if keep else '-'}")
        print(rel, day, len(epochs), "epochs,", len(keep), "kept")
    for d in sorted(days):
        doy = d.timetuple().tm_yday
        src = brdc_dir / f"BRDC00IGS_R_{d.year}{doy:03d}0000_01D_MN.rnx"
        write_nav_full_day(src, HERE / f"brdc_gps_{d.strftime('%Y%m%d')}.rnx", d.day)
    (HERE / "sessions.tsv").write_text(
        "folder\tdate\tepochs\tkept\tfile\n" + "\n".join(summary) + "\n")


if __name__ == "__main__":
    main()
