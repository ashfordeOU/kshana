#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Writes afs-q-vectors.json: open conformance vectors for the LunaNet AFS-Q primary codes and
secondary codes and for the CRC-24Q, computed by this independent generator (Python standard
library only), never by kshana itself.

The AFS-Q primary of LSIS V1.0 (LSIS-222) is the IS-GPS-800 L1C pilot construction: a Legendre
sequence L of prime length 10223 (L(t) = 1 for the non-zero quadratic residues), the Weil code
W(t; w) = L(t) xor L((t + w) mod 10223), and the seven-chip expansion 0110100 inserted before
chip p (1-based). The (w, p) pairs of PRNs 1-210 are read from src/lunar_afs/params.rs, which
carries IS-GPS-800J Tables 3.2-2 and 6.3-1. The secondary codes are LSIS-223 Table 10. The
CRC-24Q is the IS-GPS-200 / LSIS parity polynomial 0x1864CFB, initial value 0, no reflection.

Run from the repository root: python3 data/conformance/lunar-afs/gen_afs_vectors.py
"""
import hashlib
import json
import os
import re

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
N = 10223
EXPANSION = [0, 1, 1, 0, 1, 0, 0]
SECONDARY = [[1, 1, 1, 0], [0, 1, 1, 1], [1, 0, 1, 1], [1, 1, 0, 1]]


def table():
    text = open(os.path.join(ROOT, "src/lunar_afs/params.rs")).read()
    rows = re.findall(r"\((\d+), (\d+)\), // PRN (\d+)", text)
    out = {int(prn): (int(w), int(p)) for w, p, prn in rows}
    assert sorted(out) == list(range(1, 211)), "expected PRNs 1-210"
    return out


def legendre(n):
    l = [0] * n
    for x in range(1, n):
        l[(x * x) % n] = 1
    return l


def primary(l, w, p):
    weil = [l[t] ^ l[(t + w) % N] for t in range(N)]
    code = weil[: p - 1] + EXPANSION + weil[p - 1 :]
    assert len(code) == 10230
    return code


def octal(bits):
    v = 0
    for b in bits:
        v = (v << 1) | b
    return format(v, "08o")


def crc24q(data):
    crc = 0
    for byte in data:
        crc ^= byte << 16
        for _ in range(8):
            crc <<= 1
            if crc & 0x1000000:
                crc ^= 0x1864CFB
    return crc & 0xFFFFFF


def main():
    l = legendre(N)
    vectors = []
    for prn, (w, p) in sorted(table().items()):
        c = primary(l, w, p)
        vectors.append(
            {
                "op": "afs_q_primary",
                "input": {"prn": prn},
                "expected": {
                    "length": len(c),
                    "ones": sum(c),
                    "first_24_octal": octal(c[:24]),
                    "last_24_octal": octal(c[-24:]),
                    "sha256": hashlib.sha256(bytes(c)).hexdigest(),
                },
            }
        )
    for i, s in enumerate(SECONDARY):
        vectors.append({"op": "afs_q_secondary", "input": {"id": i}, "expected": {"chips": s}})
    for msg in [b"", b"\x00", b"123456789", bytes(range(256))]:
        vectors.append(
            {"op": "crc24q", "input": {"hex": msg.hex()}, "expected": {"crc": format(crc24q(msg), "06x")}}
        )
    # The one SB1 codeword the standard prints (LSIS V1.0 Figure 8): copied as printed, not
    # recomputed here (this generator has no BCH encoder).
    vectors.append(
        {
            "op": "sb1_encode",
            "input": {"fid": 0, "toi": 69},
            "expected": {"codeword_hex": "229F61DBB84A0"},
            "source": "LSIS V1.0 Figure 8 worked example (0x045 encodes to 0x229F61DBB84A0)",
        }
    )
    doc = {
        "format": "kshana.afs-vectors/1",
        "source": "independent generator gen_afs_vectors.py from the IS-GPS-800J (w, p) table and the LSIS V1.0 construction",
        "sha256_of": "the 10230 chips as bytes of value 0 or 1, first chip first",
        "vectors": vectors,
    }
    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "afs-q-vectors.json")
    with open(out, "w") as f:
        json.dump(doc, f, indent=1)
        f.write("\n")


if __name__ == "__main__":
    main()
