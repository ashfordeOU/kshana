# SPDX-License-Identifier: AGPL-3.0-only
"""Extract the flight receiver's GPS L1 C/A C/N0 near each non-surface L1 snapshot.

Reads the LuGRE TLM_RAW text telemetry (ICD NIL-TN-QAS-024 Table 3-2; signalId 0 is GPS L1
C/A) with its own parser, independent of Kshana, and writes every GPS L1 C/A C/N0 within
120 s of a non-surface L1 snapshot start to flight_cn0.csv (gps_seconds, prn, cn0_dbhz).

Usage: extract_flight_cn0.py <LuGRE dir> <output csv>
"""
import glob
import os
import struct
import sys

SURFACE_CUT_GPS_S = 1424937618.0


def snapshot_starts(lugre):
    starts = []
    for b in sorted(glob.glob(os.path.join(lugre, "L0", "IQS", "IQS_L1_*.bin"))):
        if "_S_OP" in os.path.basename(b):
            continue
        with open(b, "rb") as f:
            rx = struct.unpack("<d", f.read(18)[10:18])[0]
        if rx < SURFACE_CUT_GPS_S:
            starts.append(rx)
    return starts


def main():
    lugre, dst = sys.argv[1], sys.argv[2]
    starts = snapshot_starts(lugre)
    rows = []
    for path in sorted(glob.glob(os.path.join(lugre, "L0", "TLM", "TLM_RAW_*.txt"))):
        if "_S_OP" in os.path.basename(path):
            continue
        for line in open(path):
            tok = line.split()
            if "rxTime:" not in tok:
                continue
            t = float(tok[tok.index("rxTime:") + 1])
            if t >= SURFACE_CUT_GPS_S or not any(abs(t - s) <= 120.0 for s in starts):
                continue
            # Measurements: groups opened by 'svid:' inside the brackets.
            meas, cur = [], None
            for k in range(len(tok) - 1):
                if tok[k] == "svid:":
                    cur = {"svid": int(tok[k + 1])}
                    meas.append(cur)
                elif cur is not None and tok[k] in ("cn0:", "signalId:"):
                    cur[tok[k][:-1]] = tok[k + 1]
            for m in meas:
                if int(m["signalId"]) == 0:
                    rows.append((t, m["svid"], float(m["cn0"])))
    with open(dst, "w") as f:
        f.write("gps_seconds,prn,cn0_dbhz\n")
        for t, p, c in rows:
            f.write(f"{t:.5f},{p},{c:.4f}\n")
    print(f"{len(rows)} GPS L1 C/A C/N0 values near {len(starts)} snapshots")


if __name__ == "__main__":
    main()
