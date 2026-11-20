#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write data/lunar/de440_moon_pa.bin from tests/fixtures/llr_geometry/de440_moon_pa.csv.

The binary is the embedded form of the DE440 Moon PA orientation series
(src/lunar_orientation.rs): the same 6 209 rows and 10 columns (t_tt_jc, r00..r22), each value
the IEEE-754 double the CSV text parses to (Python float() and Rust str::parse::<f64>() are both
correctly rounded). Layout, no header: the N = rows x 10 doubles in column-major order
(all t, then all r00, ..., then all r22), each written little-endian, then byte-planed: byte k
of value j is at offset k * N + j. Byte planes compress far better than interleaved doubles
(about 352 KB against 650 KB for the text in the published crate). It carries exactly the
CSV's numbers; it exists because the 19-digit text form took about 650 KB of the published
crate's 10 MiB limit. The CSV stays the source of record (its SHA-256 is pinned in NOTICE.md
and the generation script); tests/lunar_orientation_binary.rs checks the two agree bit for bit.

Usage: python3 scripts/gen_de440_moon_pa_bin.py [--check]
"""
import os
import struct
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CSV = os.path.join(ROOT, "tests", "fixtures", "llr_geometry", "de440_moon_pa.csv")
OUT = os.path.join(ROOT, "data", "lunar", "de440_moon_pa.bin")


def build() -> bytes:
    rows = []
    with open(CSV, encoding="ascii") as f:
        header = f.readline().strip()
        assert header == "t_tt_jc,r00,r01,r02,r10,r11,r12,r20,r21,r22", header
        for line in f:
            line = line.strip()
            if not line:
                continue
            cells = line.split(",")
            assert len(cells) == 10, line
            rows.append([float(c) for c in cells])
    vals = [row[c] for c in range(10) for row in rows]
    raw = struct.pack("<%dd" % len(vals), *vals)
    n = len(vals)
    return bytes(raw[j * 8 + k] for k in range(8) for j in range(n))


def main() -> int:
    data = build()
    if "--check" in sys.argv[1:]:
        with open(OUT, "rb") as f:
            same = f.read() == data
        print("de440_moon_pa.bin: " + ("matches the CSV" if same else "DIFFERS from the CSV"))
        return 0 if same else 1
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "wb") as f:
        f.write(data)
    print(f"wrote {OUT}: {len(data)} bytes, {len(data) // 80} rows")
    return 0


if __name__ == "__main__":
    sys.exit(main())
