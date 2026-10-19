#!/usr/bin/env python3 -I
"""Extract the azimuth-averaged L1 panel patterns from the NAVCEN GPS Block IIR/IIR-M antenna panel pattern data.

Input: the zip fetched by fetch.sh (never vendored). Appendix B's pptx carries one embedded workbook per SV and band:
rows are the angle theta (-90 to 90 degrees, 2 degree steps) off the panel boresight, columns the azimuth phi
(0 to 350 degrees, 10 degree steps), cells the right-hand circular polarisation gain in dB. For each L1 workbook this writes
one CSV row per theta >= 0: the power average over azimuth, in dB. Output is a derived table of public data, written under
the output directory and not committed.

usage: extract_patterns.py <iir.zip> <outdir>
"""
import csv, io, math, re, sys, zipfile
import openpyxl

def main(zpath, outdir):
    out_rows = []
    with zipfile.ZipFile(zpath) as z:
        pptx = next(n for n in z.namelist() if "Appendix B" in n and n.endswith(".pptx"))
        with zipfile.ZipFile(io.BytesIO(z.read(pptx))) as p:
            for name in sorted(p.namelist()):
                if not (name.startswith("ppt/embeddings/") and name.endswith(".xlsx")):
                    continue
                wb = openpyxl.load_workbook(io.BytesIO(p.read(name)), data_only=True)
                for ws in wb:
                    m = re.match(r"(SVN\d+)\s+L1 RHCP", ws.title)
                    if not m:
                        continue
                    rows = list(ws.iter_rows(values_only=True))
                    for r in rows:
                        if isinstance(r[0], (int, float)) and r[0] >= 0:
                            vals = [v for v in r[1:37] if isinstance(v, (int, float))]
                            if len(vals) < 36:
                                continue
                            p_mean = sum(10 ** (v / 10) for v in vals) / len(vals)
                            out_rows.append((m.group(1), r[0], round(10 * math.log10(p_mean), 3)))
    with open(f"{outdir}/l1-azavg.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["svn", "theta_deg", "az_avg_db"])
        w.writerows(out_rows)
    print(len({r[0] for r in out_rows}), "L1 patterns,", len(out_rows), "rows")

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
