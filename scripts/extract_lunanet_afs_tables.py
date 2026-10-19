#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Extract the code tables of the LunaNet Signal-In-Space Recommended Standard, Augmented
Forward Signal, Volume A (LSIS-AFS V1.0, 29 January 2025; Applicable Document 1 of LNIS V5)
from `pdftotext -layout` output into CSV files under xval/lunanet-afs/oracle/.

The tables hold two kinds of column. The code PARAMETERS (G2 delay or initial state, Weil
index, insertion index) are what the generator in src/iq/signals/lunanet.rs is given. The
printed CHIPS (first and last 24 of each code, and the two Legendre sequences) are what it is
checked against, and the generator is never given them. The spec marks these tables {LSIS-TBC}:
the document itself says they exist to facilitate test and integration and may change, so the
files record the PDF's SHA-256 and a change in the document is a change in the pin.

Usage:  pdftotext -layout lsis_afs.pdf lsis_afs.txt
        python3 scripts/extract_lunanet_afs_tables.py lsis_afs.txt lsis_afs.pdf
"""
import hashlib
import re
import sys
import os

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
OUT = os.path.join(ROOT, "xval", "lunanet-afs", "oracle")


def blocks(lines, start_pat, stop_pat):
    """Lines between the first body match of start_pat and the next stop_pat (exclusive)."""
    out = []
    on = False
    for ln in lines:
        if "...." in ln:  # table-of-contents line
            continue
        if re.search(start_pat, ln):
            on = True
            continue
        if on and re.search(stop_pat, ln):
            break
        if on:
            out.append(ln)
    return out


HEX = re.compile(r"^[0-9A-Fa-f]+$")


def table_rows(block, width, first_prn, hexcols, notes):
    """Rows of a two-column table, by token. `width` tokens make one row; a line holds two
    rows (left and right column) or, at the end of a table, one. PRNs are assigned by the
    table's own order (left column then right column) because the PDF misprints a few PRN
    numbers (Table D-2 prints PRN 38 as 3; Table E-5 is correct but its hex cells lose a
    leading zero in three places). A hex cell that is short is left-padded with zeros to its
    column's width and the row is noted."""
    left, right = [], []
    for ln in block:
        tok = ln.split()
        if not tok or not tok[0].isdigit():
            continue
        if len(tok) == 2 * width:
            left.append(tok[:width])
            right.append(tok[width:])
        elif len(tok) == width:
            left.append(tok)
        else:
            notes.append(f"unparsed line: {ln.strip()}")
    rows = []
    for i, r in enumerate(left + right):
        r = list(r)
        r[0] = str(first_prn + i)
        for c, w in hexcols.items():
            if not HEX.match(r[c]) or len(r[c]) > w:
                notes.append(f"PRN {r[0]}: cell {r[c]!r} is not a {w}-digit hex value")
            elif len(r[c]) < w:
                notes.append(f"PRN {r[0]}: cell {r[c]} printed with {len(r[c])} digits; zero-padded")
                r[c] = r[c].zfill(w)
        rows.append(r)
    return rows


def main():
    txt, pdf = sys.argv[1], sys.argv[2]
    lines = open(txt, encoding="utf-8").read().split("\n")
    sha = hashlib.sha256(open(pdf, "rb").read()).hexdigest()
    os.makedirs(OUT, exist_ok=True)
    notes = []

    body = [(i, ln) for i, ln in enumerate(lines) if "...." not in ln]
    heads = [i for i, ln in body if re.search(r"Table [CDE]- \d|APPENDIX [A-Z]", ln)]

    def block_of(prefix, t):
        """The lines from the body header of table `t` to the next table or appendix header."""
        start = next(i for i, ln in body if re.search(rf"{prefix}{t}[:-]", ln))
        stop = next((h for h in heads if h > start), len(lines))
        return lines[start + 1 : stop]

    def collect(prefix, tables, width, hexcols, stop=None):
        rows = []
        for t in tables:
            rows += table_rows(block_of(prefix, t), width, len(rows) + 1, hexcols, notes)
        return rows

    # AFS-I Gold codes: Tables C-1 .. C-5 (PRN, G2 delay, G2 init, first 24, last 24)
    rows_i = collect(r"Table C- ", range(1, 6), 5, {2: 3, 3: 6, 4: 6},
                     r"Table C- \d: Gold|APPENDIX D|NAVSTAR GPS Space Segment")
    # AFS-Q primary Weil: Tables D-2 .. D-6 (PRN, k, p, first 24, last 24)
    rows_q = collect(r"Table D- ", range(2, 7), 5, {3: 6, 4: 6},
                     r"Table D- \d:|APPENDIX E")
    # AFS-Q tertiary Weil: Tables E-2 .. E-6 (PRN, k, first 24, last 24)
    rows_t = collect(r"Table E- ", range(2, 7), 4, {2: 6, 3: 6},
                     r"Table E- \d:|APPENDIX F")
    for name, header, rows in (
        ("afs_i_gold.csv", "prn,g2_delay_chips,g2_init_hex,first24_hex,last24_hex", rows_i),
        ("afs_q_primary_weil.csv", "prn,weil_index_k,insertion_index_p,first24_hex,last24_hex", rows_q),
        ("afs_q_tertiary_weil.csv", "prn,weil_index_k,first24_hex,last24_hex", rows_t),
    ):
        with open(os.path.join(OUT, name), "w") as f:
            f.write(f"# LSIS-AFS V1.0 (29 Jan 2025); source pdf sha256 {sha}\n")
            f.write(header + "\n")
            for r in rows:
                f.write(",".join(r) + "\n")

    # ---- Legendre sequences: Tables D-1 and E-1 -----------------------------------------
    def hex_block(start_pat, stop_pat):
        b = blocks(lines, start_pat, stop_pat)
        s = ""
        for ln in b:
            t = ln.strip()
            if re.fullmatch(r"[0-9A-F]{20,}", t):
                s += t
        return s

    d1 = hex_block(r"Table D- 1- AFS-Q Primary Code", r"NOTE: The above sequence")
    e1 = hex_block(r"Table E- 1: AFS-Q Tertiary", r"The binary")
    with open(os.path.join(OUT, "legendre_10223.hex"), "w") as f:
        f.write(f"# Table D-1, 10224 bits as printed (the leading 0 is ignored); sha256 {sha}\n{d1}\n")
    with open(os.path.join(OUT, "legendre_1499.hex"), "w") as f:
        f.write(f"# Table E-1, the first hex symbol is 3 bits; sha256 {sha}\n{e1}\n")
    with open(os.path.join(OUT, "EXTRACTION-NOTES.txt"), "w") as f:
        f.write("Defects in the PDF's text layer handled by the extractor (see the script):\n")
        f.write("\n".join(notes) + "\n")
    print("AFS-I", len(rows_i), "AFS-Q primary", len(rows_q), "tertiary", len(rows_t),
          "D-1 hex digits", len(d1), "E-1 hex digits", len(e1))


main()
