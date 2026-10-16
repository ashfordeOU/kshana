#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Decode the first epochs of a Compact RINEX 3.0 (CRINEX) RINEX 4.00 observation
file into plain RINEX 4.00 text, with the Python standard library only.

Usage:
    python3 -I make_fixture.py <MAO000USA_R_20231980000_01D_30S_MO.crx.gz> <n_epochs> <out.rnx>

Source: https://igs.bkg.bund.de/root_ftp/MGEX/obs_v4/2023/198/

The decoder follows the Compact RINEX format description ("A Compression Format
and Tools for GNSS Observation Data", Bulletin of the Geographical Survey
Institute 55 (2008) 21-30, and the CRINEX 3.0 notes distributed with RNX2CRX
4.x). It is written here, not taken from RNX2CRX/CRX2RNX:
  * header lines after the two CRINEX lines are copied verbatim;
  * an epoch line starting with '>' is a full line; otherwise it is a character
    difference against the previous epoch line (' ' keep, '&' blank, else
    replace); columns 41+ carry the satellite list (3 characters each);
  * the next line is the receiver clock offset (blank here, so not decoded);
  * one data line per listed satellite: N space-separated fields (N = the
    system's observation count) then the LLI/SSI flag difference string.
    A field "k&v" starts an arc of difference order k with value v (integer
    units of 0.001); a plain integer is the k-th order difference, recovered by
    u[m] = d; u[j] += u[j+1] for j = m-1 .. 0 while the order m ramps up to k;
    an empty field is a missing observation and ends the arc.
Values are written as F14.3 with the LLI and SSI characters, and the epoch line
as the first 35 characters of the decoded epoch line (RINEX 4 epoch record),
the clock field left blank.

Redaction: the observer name in the OBSERVER / AGENCY record (columns 1-20) is
blanked; the agency field and every other header line are copied verbatim.
"""
import gzip
import sys


def fmt_value(units):
    sign = "-" if units < 0 else ""
    a = abs(units)
    return f"{sign}{a // 1000}.{a % 1000:03d}".rjust(14)


def apply_diff(old, diff):
    out = list(old.ljust(len(diff)))
    for k, c in enumerate(diff):
        if c == " ":
            continue
        out[k] = " " if c == "&" else c
    return "".join(out)


def main():
    src, n_epochs, dst = sys.argv[1], int(sys.argv[2]), sys.argv[3]
    with gzip.open(src, "rt", encoding="ascii", newline="") as f:
        lines = f.read().splitlines()
    assert lines[0].startswith("3.0") and "CRINEX VERS" in lines[0]
    k = 2
    header = []
    ntypes = {}
    cur = None
    while True:
        line = lines[k]
        k += 1
        if line[60:].startswith("OBSERVER / AGENCY"):
            line = " " * 20 + line[20:]
        header.append(line)
        if "SYS / # / OBS TYPES" in line[60:]:
            if line[0] != " ":
                cur = line[0]
                ntypes[cur] = int(line[3:6])
        if "END OF HEADER" in line[60:]:
            break
    assert header[0][60:].startswith("RINEX VERSION / TYPE") and header[0][:9].strip() == "4.00"

    out = list(header)
    epoch_line = ""
    arcs = {}  # sat -> list of [u list, order, max_order] or None per field
    flags = {}  # sat -> flag string
    for _ in range(n_epochs):
        line = lines[k]
        k += 1
        if line.startswith(">"):
            epoch_line = line
        else:
            epoch_line = apply_diff(epoch_line, line)
        k += 1  # receiver clock offset line
        assert epoch_line[31] == "0", "only epoch flag 0 is handled"
        nsat = int(epoch_line[32:35])
        sats = [epoch_line[41 + 3 * j : 44 + 3 * j] for j in range(nsat)]
        assert all(len(s) == 3 for s in sats)
        out.append(epoch_line[:35])
        for sat in sats:
            data = lines[k]
            k += 1
            n = ntypes[sat[0]]
            parts = data.split(" ", n)
            fields = parts[:n] + [""] * (n - len(parts[:n]))
            fdiff = parts[n] if len(parts) > n else ""
            st = arcs.setdefault(sat, [None] * n)
            values = []
            for j, fld in enumerate(fields):
                if fld == "":
                    st[j] = None
                    values.append(None)
                    continue
                if "&" in fld:
                    order, v = fld.split("&")
                    st[j] = [[int(v)], 0, int(order)]
                else:
                    assert st[j] is not None, f"difference without an arc: {sat} field {j}"
                    u, m, mx = st[j]
                    if m < mx:
                        m += 1
                        u.append(0)
                    u[m] = int(fld)
                    for q in range(m - 1, -1, -1):
                        u[q] += u[q + 1]
                    st[j] = [u, m, mx]
                values.append(st[j][0][0])
            flags[sat] = apply_diff(flags.get(sat, ""), fdiff)
            fl = flags[sat].ljust(2 * n)
            rec = sat
            for j, v in enumerate(values):
                if v is None:
                    rec += " " * 16
                else:
                    rec += fmt_value(v) + fl[2 * j] + fl[2 * j + 1]
            out.append(rec.rstrip())
    with open(dst, "w", encoding="ascii", newline="\n") as f:
        f.write("\n".join(out) + "\n")
    print(dst, len(out), "lines")


if __name__ == "__main__":
    main()
