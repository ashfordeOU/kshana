#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Extract FCC 26-26 Appendix B (GSO reference links) to CSV.

Source: FCC 26-26, Report and Order, SB Docket No. 25-157 (adopted 30 April 2026, released
1 May 2026), Appendix B "GSO Reference Links". The table is the spreadsheet embedded in the Word
version of the order, https://docs.fcc.gov/public/attachments/FCC-26-26A1.docx (fetched
2026-11-28), at word/embeddings/ooxmlPackage1.xlsx, sheet "links" (328 rows) with its column
legend in sheet "legend". The PDF (FCC-26-26A1.pdf) prints the same table on pages 46-47.

Usage: extract_appendix_b.py FCC-26-26A1.docx > fcc-26-26-appendix-b.csv
Values are written as stored in the spreadsheet (Python repr of each float); empty cells stay
empty. Needs openpyxl.
"""
import csv
import io
import sys
import zipfile

import openpyxl


def main(path):
    with zipfile.ZipFile(path) as z:
        data = z.read("word/embeddings/ooxmlPackage1.xlsx")
    wb = openpyxl.load_workbook(io.BytesIO(data), data_only=True)
    rows = list(wb["links"].iter_rows(values_only=True))
    w = csv.writer(sys.stdout, lineterminator="\n")
    for r in rows:
        if all(c is None for c in r):
            continue
        out = []
        for c in r:
            if c is None:
                out.append("")
            elif isinstance(c, bool):
                out.append("TRUE" if c else "FALSE")
            elif isinstance(c, float):
                out.append(repr(c))
            else:
                out.append(str(c))
        w.writerow(out)


if __name__ == "__main__":
    main(sys.argv[1])
