#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Round 2: cut the JammerTest 2024 slices at the onsets of the official log.

The onset oracle is the official log of the test week, "Logg_Jammertest_2024_v1.xlsx"
(Jammertest consortium, https://www.jammertest.no/previous-jammertests/, retrieved 2026-10-02,
SHA-256 4ef5091a4ee6489e8700b3495c51b4e99e9c37c138617c7c9c7f83f2047e60e2). Its times are local
CEST at one-second resolution; GPS time = local - 2 h + 18 s. The rules below were fixed in the
pre-registration (tests/spoof_detection_jammertest_log_oracle.rs) before the log was fetched:

  * onset = the earliest logged start of a transmission of the test identifier on the
    recording's date (in the sheet of the site where the receiver stood) that falls inside the
    recording;
  * slot end = the stop of the chain of log rows of that identifier that follow on without a gap
    (a power change starts a new row at the previous row's stop);
  * cal_start = max(recording start, latest logged stop of any transmission in that sheet on that
    date at or before the onset, onset - 240 s);
  * the slice runs from cal_start to min(slot end, onset + 300 s).

Usage:
  generate_logged_onsets.py <extracted dataset root> <Logg_Jammertest_2024_v1.xlsx>
      <BRDC00IGS_R_20242550000_01D_MN.rnx> <BRDC00IGS_R_20242560000_01D_MN.rnx>
Needs openpyxl (the oracle virtual environment).
"""
import sys
from datetime import datetime, timedelta, time as dtime
from pathlib import Path

import openpyxl

from generate_spoof_detection_jammertest_oracle import FMT, HERE, first_fix, read_epochs, write_obs

S1 = "Site 1 - Bleik"
S3 = "Site 3 - Stave"
SPOOF = "Spoofing/stationary/Medium Power (_1W)"
JS = "Jamming+Spoofing/stationary/Low Power (_100mW)/Bands_L1"
# (id, folder, sheet, date)
CASES = [
    ("2.1.1", f"{SPOOF}/Bands_L1_L2_L5/2.1.1", S1, "2024-09-11"),
    ("2.1.2", f"{SPOOF}/Bands_E1_L1/2.1.3,2.1.2,2.1.4", S1, "2024-09-11"),
    ("2.1.4", f"{SPOOF}/Bands_E1_L1/2.1.3,2.1.2,2.1.4", S1, "2024-09-11"),
    ("2.3.5", f"{SPOOF}/Bands_E1_E5_L1_L2_L5/2.3.5,2.3.8", S1, "2024-09-11"),
    ("2.3.10", f"{SPOOF}/Bands_E1_E5_L1_L2_L5/2.3.10,2.3.11", S1, "2024-09-11"),
    ("2.3.11", f"{SPOOF}/Bands_E1_E5_L1_L2_L5/2.3.10,2.3.11", S1, "2024-09-11"),
    ("2.3.15", f"{SPOOF}/Bands_E1_E5_L1_L2_L5/2.3.15,2.3.12", S1, "2024-09-11"),
    ("2.3.12", f"{SPOOF}/Bands_E1_E5_L1_L2_L5/2.3.15,2.3.12", S1, "2024-09-11"),
    ("2.6.1", f"{JS}/2.6.1", S3, "2024-09-12"),
    ("2.6.3", f"{JS}/2.6.3", S3, "2024-09-12"),
]


def as_time(v):
    if isinstance(v, dtime):
        return v
    return datetime.strptime(str(v), "%H:%M:%S").time()


def log_rows(path):
    wb = openpyxl.load_workbook(path, data_only=True)
    out = {}
    for ws in wb.worksheets:
        rows = list(ws.iter_rows(values_only=True))[1:]
        lst = []
        for r in rows:
            if not r[2] or not r[4] or r[5] is None or r[6] is None:
                continue
            day = str(r[4])[:10]
            st = datetime.combine(datetime.strptime(day, "%Y-%m-%d").date(), as_time(r[5]))
            sp = datetime.combine(st.date(), as_time(r[6]))
            # local CEST -> GPS
            g = timedelta(hours=-2, seconds=18)
            lst.append((str(r[2]), day, st + g, sp + g))
        out[ws.title] = lst
    return out


def write_nav_day(src, dst, day):
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
            hh, d = int(ln[15:17]), int(ln[12:14])
            if d == day and 4 <= hh <= 18:
                out.extend(rec)
            i += 8
        else:
            i += 1
    Path(dst).write_text("\n".join(out) + "\n")


def main():
    root, xlsx, nav11, nav12 = Path(sys.argv[1]), sys.argv[2], sys.argv[3], sys.argv[4]
    log = log_rows(xlsx)
    rows = ["id\tfile\tonset_gps\tslot_end_gps\tcal_start_gps"]
    for sid, rel, sheet, day in CASES:
        folder = root / rel
        epochs, first = read_epochs(folder)
        keys = sorted(epochs)
        rec0 = first.replace(microsecond=0) + timedelta(seconds=1)
        rec1 = datetime.strptime(keys[-1], FMT)
        mine = sorted(r for r in log[sheet] if r[0] == sid and r[1] == day and rec0 <= r[2] <= rec1)
        if not mine:
            print(sid, "not in the log inside the recording")
            continue
        onset = mine[0][2]
        end = mine[0][3]
        for r in sorted(r for r in log[sheet] if r[0] == sid and r[1] == day):
            if r[2] == end:
                end = r[3]
        prev = [r[3] for r in log[sheet] if r[1] == day and r[3] <= onset]
        cands = [rec0, onset - timedelta(seconds=240)] + ([max(prev)] if prev else [])
        cal = max(cands)
        stop = min(end, onset + timedelta(seconds=300))
        keep = {k: v for k, v in epochs.items() if cal <= datetime.strptime(k, FMT) <= stop}
        name = f"jt2024_log_{sid.replace('.', '_')}.obs"
        write_obs(HERE / name, first_fix(folder), keep)
        rows.append(f"{sid}\t{name}\t{onset.strftime(FMT)}\t{end.strftime(FMT)}\t{cal.strftime(FMT)}")
        print(sid, "onset", onset, "end", end, "cal", cal, "rec", rec0, "->", rec1, len(keep), "epochs")
    (HERE / "onsets_log.tsv").write_text("\n".join(rows) + "\n")
    write_nav_day(nav11, HERE / "brdc_gps_20240911.rnx.check", 11)
    write_nav_day(nav12, HERE / "brdc_gps_20240912.rnx", 12)


if __name__ == "__main__":
    main()
