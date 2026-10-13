#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Crop the IGS merged broadcast files of 2026-07-19 (day 200) to the committed slices.

Usage (python3 -I, stdlib only):
    python3 -I make_fixture.py <BRD400DLR_S_20262000000_01D_MN.rnx.gz> \
        <BRDM00DLR_S_20262000000_01D_MN.rnx.gz> <out_dir>

Both sources: https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2026/200/

Crop: the full header, then every record of systems G, E, C whose epoch (the
calendar epoch on the record's first data line, in the record's own time scale)
lies in [2026-07-19 00:00:00, 2026-07-19 02:00:00). Record text is copied byte
for byte (lines are re-joined with '\n'), except one redaction: a header
COMMENT line naming individual contacts after the agency ("DLR/GSOC: ...") is cut
to the agency name.
"""
import gzip
import re
import sys

SYSTEMS = set("GEC")
T0 = (2026, 7, 19, 0, 0)
T1 = (2026, 7, 19, 2, 0)
EPOCH = re.compile(r"(\d{4}) (\d\d) (\d\d) (\d\d) (\d\d) (\d\d)")


def read(path):
    with gzip.open(path, "rt", encoding="ascii", newline="") as f:
        return f.read().splitlines()


def in_window(line):
    m = EPOCH.search(line)
    if m is None:
        raise ValueError(f"no epoch in {line!r}")
    t = tuple(int(x) for x in m.groups()[:5])
    return T0 <= t < T1


def redact(line):
    if line[60:].startswith("COMMENT") and line.startswith("DLR/GSOC:"):
        return "DLR/GSOC".ljust(60) + line[60:]
    return line


def split_header(lines):
    for k, line in enumerate(lines):
        if "END OF HEADER" in line:
            return [redact(h) for h in lines[: k + 1]], lines[k + 1 :]
    raise ValueError("no END OF HEADER")


def crop_v4(lines):
    head, body = split_header(lines)
    out = list(head)
    k = 0
    while k < len(body):
        assert body[k].startswith(">"), body[k]
        j = k + 1
        while j < len(body) and not body[j].startswith(">"):
            j += 1
        rec = body[k:j]
        system = rec[0].split()[2][0]
        if system in SYSTEMS and in_window(rec[1]):
            out.extend(rec)
        k = j
    return out


def crop_v3(lines):
    head, body = split_header(lines)
    out = list(head)
    k = 0
    while k < len(body):
        system = body[k][0]
        n = 4 if system in "RS" else 8
        rec = body[k : k + n]
        if system in SYSTEMS and in_window(rec[0]):
            out.extend(rec)
        k += n
    return out


def main():
    v4_path, v3_path, out_dir = sys.argv[1:4]
    v4 = crop_v4(read(v4_path))
    v3 = crop_v3(read(v3_path))
    for name, lines in (
        ("BRD400DLR_S_20262000000_slice.rnx", v4),
        ("BRDM00DLR_S_20262000000_slice.rnx", v3),
    ):
        with open(f"{out_dir}/{name}", "w", encoding="ascii", newline="\n") as f:
            f.write("\n".join(lines) + "\n")
        print(name, len(lines), "lines")


if __name__ == "__main__":
    main()
