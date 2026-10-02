#!/usr/bin/env python3
"""Extract the per-PRN tables of LSIS V1.0 (29 January 2025), Volume A, Appendices C, D, E.

Run by ``fetch_lsis.sh`` into the local LSIS cache (never into the repository: the standard
carries no reuse terms). Input: the text layer of the standard (``pdftotext -layout``,
poppler). Output, under OUTDIR:

* ``params.tsv``: the per-PRN parameters the tables print (G2 delay; Weil index and insertion
  index; tertiary Weil index), read only by the data-gated oracle test.
* ``printed_checks.tsv``: the values the standard prints for validation (G2 initialisation,
  first and last 24 chips of every code), which only the oracle test reads.
* ``legendre_10223.hex`` / ``legendre_1499.hex``: Tables D-1 and E-1 as printed.

Every table must yield PRNs 1..210 exactly once or the script stops. The PRN of each entry
is taken from its position in the table (Table D-2 prints PRN 38 as "3").

Usage: extract_lsis_tables.py LSIS.txt OUTDIR
"""
import re
import sys
from pathlib import Path

HEX = r"[0-9A-F]+"


def section(lines, start_pat, end_pat):
    s = next(i for i, l in enumerate(lines) if re.search(start_pat, l))
    e = next(i for i in range(s + 1, len(lines)) if re.search(end_pat, lines[i]))
    return lines[s:e]


def appendix_c(lines):
    out = {}
    body = section(lines, r"^APPENDIX C", r"^APPENDIX D")
    row = re.compile(
        rf"^\s*(\d+)\s+(\d+)\s+({HEX})\s+({HEX})\s+({HEX})\s+(\d+)\s+(\d+)\s+({HEX})\s+({HEX})\s+({HEX})\s*$"
    )
    for l in body:
        m = row.match(l)
        if not m:
            continue
        g = m.groups()
        for prn, d, init, first, last in (g[0:5], g[5:10]):
            out[int(prn)] = (int(d), init, first, last)
    return out


def appendix_d(lines):
    body = section(lines, r"^APPENDIX D", r"^APPENDIX E")
    row = re.compile(
        rf"^\s*(\d+)\s+(\d+)\s+(\d+)\s+({HEX})\s+({HEX})\s+(\d+)\s+(\d+)\s+(\d+)\s+({HEX})\s+({HEX})\s*$"
    )
    left, right = [], []
    tables = []
    for l in body:
        if re.search(r"Table D- ?[2-6]", l) and "Weil code index" in l:
            if left:
                tables.append((left, right))
            left, right = [], []
            continue
        m = row.match(l)
        if m:
            g = m.groups()
            left.append(g[0:5])
            right.append(g[5:10])
    tables.append((left, right))
    out = {}
    base = 1
    for left, right in tables:
        assert len(left) == 21 and len(right) == 21, (base, len(left), len(right))
        for i, e in enumerate(left + right):
            prn = base + i
            if int(e[0]) != prn:
                print(f"note: Table D row for PRN {prn} prints PRN {e[0]}", file=sys.stderr)
            out[prn] = (int(e[1]), int(e[2]), e[3], e[4])
        base += 42
    return out


def appendix_e(lines):
    body = section(lines, r"^APPENDIX E", r"^APPENDIX F")
    row = re.compile(rf"^\s*(\d+)\s+(\d+)\s+({HEX})\s+({HEX})\s+(\d+)\s+(\d+)\s+({HEX})\s+({HEX})\s*$")
    out = {}
    for l in body:
        m = row.match(l)
        if not m:
            continue
        g = m.groups()
        for prn, k, first, last in (g[0:4], g[4:8]):
            out[int(prn)] = (int(k), first, last)
    return out


def hex_block(lines, start_pat, stop_pat):
    # The caption also appears in the list of tables; the table itself is the last match.
    s = max(i for i, l in enumerate(lines) if re.search(start_pat, l))
    acc = []
    for l in lines[s + 1 :]:
        if re.search(stop_pat, l):
            break
        t = l.strip()
        if re.fullmatch(HEX, t):
            acc.append(t)
    return "".join(acc)


def main():
    txt, out = Path(sys.argv[1]), Path(sys.argv[2])
    lines = txt.read_text(encoding="utf-8").splitlines()
    c, d, e = appendix_c(lines), appendix_d(lines), appendix_e(lines)
    for name, t in (("C", c), ("D", d), ("E", e)):
        assert sorted(t) == list(range(1, 211)), (name, len(t))
    out.mkdir(parents=True, exist_ok=True)
    with open(out / "params.tsv", "w") as f:
        f.write("prn\tg2_delay\tweil_k\tinsertion_p\ttertiary_k\n")
        for prn in range(1, 211):
            f.write(f"{prn}\t{c[prn][0]}\t{d[prn][0]}\t{d[prn][1]}\t{e[prn][0]}\n")
    with open(out / "printed_checks.tsv", "w") as f:
        f.write("prn\ti_g2_init\ti_first24\ti_last24\tq_first24\tq_last24\tt_first24\tt_last24\n")
        for prn in range(1, 211):
            f.write(
                f"{prn}\t{c[prn][1]}\t{c[prn][2]}\t{c[prn][3]}\t{d[prn][2]}\t{d[prn][3]}\t{e[prn][1]}\t{e[prn][2]}\n"
            )
    l1 = hex_block(lines, r"Table D- 1- AFS-Q Primary Code", r"NOTE: The above sequence")
    l2 = hex_block(lines, r"Table E- 1: AFS-Q Tertiary Code", r"The binary")
    (out / "legendre_10223.hex").write_text(l1 + "\n")
    (out / "legendre_1499.hex").write_text(l2 + "\n")
    print(f"Table D-1: {len(l1)} hex digits; Table E-1: {len(l2)} hex digits")


if __name__ == "__main__":
    main()
