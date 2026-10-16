#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Writes the pre-registered case set (PREREGISTRATION.md beside this file) as plain CSV.

No Kshana code and no oracle code: this only enumerates the fixed cases so that the Kshana test
and the oracle drivers read one list. Writes <dir>/inputs/time_codes.csv and crc_messages.csv.
"""

import sys
from pathlib import Path


def cuc_values(c, n):
    return [
        (0, 0),
        ((1 << (8 * c)) - 1, (1 << (8 * n)) - 1),
        (0x5A5A5A5A & ((1 << (8 * c)) - 1), 0xA5A5A5 & ((1 << (8 * n)) - 1)),
    ]


def cds_values(days_bits, sub):
    sub_max = {"none": 0, "us": 999, "ps": 999_999_999}[sub]
    sub_mid = {"none": 0, "us": 456, "ps": 456_789_012}[sub]
    return [
        (0, 0, 0),
        ((1 << days_bits) - 1, 86_399_999, sub_max),
        (23_000, 43_200_123, sub_mid),
    ]


def main(root: Path) -> None:
    rows = ["id,code,epoch,a,b,v1,v2,v3"]
    k = 0
    for c in range(1, 5):
        for n in range(0, 4):
            for v in cuc_values(c, n):
                rows.append(f"{k},cuc,1958,{c},{n},{v[0]},{v[1]},0")
                k += 1
    for c, n in [(4, 2), (2, 1)]:
        for v in cuc_values(c, n):
            rows.append(f"{k},cuc,agency,{c},{n},{v[0]},{v[1]},0")
            k += 1
    for days_bits in (16, 24):
        for sub in ("none", "us", "ps"):
            for v in cds_values(days_bits, sub):
                rows.append(f"{k},cds,1958,{days_bits},{sub},{v[0]},{v[1]},{v[2]}")
                k += 1
    v = cds_values(16, "us")[2]
    rows.append(f"{k},cds,agency,16,us,{v[0]},{v[1]},{v[2]}")
    (root / "inputs").mkdir(parents=True, exist_ok=True)
    (root / "inputs" / "time_codes.csv").write_text("\n".join(rows) + "\n")

    msgs = ["", b"123456789".hex(), "00", "ff", "0000", "ffff",
            bytes(range(1, 0x41)).hex(), bytes(range(256)).hex()]
    (root / "inputs" / "crc_messages.csv").write_text(
        "id,hex\n" + "".join(f"{i},{m}\n" for i, m in enumerate(msgs)))


if __name__ == "__main__":
    main(Path(sys.argv[1]))
