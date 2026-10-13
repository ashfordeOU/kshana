#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle driver for tests/space_packet_ext_oracle.rs (see PREREGISTRATION.md beside this file).

ccsdspy 2.0.1 decodes the Kshana-written packet streams and validates their sequence counts;
CPython binascii.crc_hqx recomputes every CRC; spacepackets-py 0.32.0 packs and unpacks the
CDS-short stamps and writes the PUS-C TM packets of bar 5. No Kshana code.

Usage: oracle.py <fixture dir>. Writes <dir>/outputs/python.json and
<dir>/outputs/pus_tm_spacepackets.bin.
"""

import binascii
import csv
import json
import sys
from pathlib import Path

import ccsdspy
from ccsdspy import FixedLength, PacketArray, PacketField, VariableLength
from ccsdspy.utils import split_packet_bytes, validate
from spacepackets.ccsds.time import CdsShortTimestamp
from spacepackets.ecss.tm import PusTm

U8 = dict(data_type="uint", bit_length=8)


def arr(name, shape):
    return PacketArray(name=name, array_shape=shape, **U8)


def field(name, bits):
    return PacketField(name=name, data_type="uint", bit_length=bits)


DEFS = {
    "apid100": FixedLength([field("PFIELD", 8), field("COARSE", 32), field("FINE", 16),
                            arr("ANCILLARY", 4), arr("USER", 16), field("PEC", 16)]),
    "apid101": FixedLength([field("DAYS", 16), field("MS_OF_DAY", 32), field("SUBMS", 16),
                            arr("USER", 10), field("PEC", 16)]),
    "apid102": FixedLength([arr("ANCILLARY", 3), arr("USER", 5)]),
    "apid103": VariableLength([field("COARSE", 32), arr("USER", "expand"), field("PEC", 16)]),
    "apid104": VariableLength([field("COARSE", 32), arr("USER", "expand"), field("PEC", 16)]),
}
PEC_STREAMS = ["apid100", "apid101", "apid103", "apid104", "apid104_a", "apid104_b",
               "apid104_c"]

# Bar 5 cases: (service, subservice, days, ms, source octets); source octet j of case i is
# (0x10 * i + j) & 0xFF, as in the Rust test.
PUS = [(17, 2, 0, 0, 0), (3, 25, 23000, 43200123, 4), (1, 1, 65535, 86399999, 9),
       (5, 1, 21500, 1, 32)]


def as_json(v):
    if hasattr(v, "dtype") and v.ndim > 0:
        return bytes(int(x) for x in v).hex()
    return int(v)


def main(root: Path) -> None:
    k = root / "kshana"
    out = {"ccsdspy": ccsdspy.__version__, "crc": {}, "pec": {}, "streams": {},
           "validate": {}, "cds_short": {}, "pus": [], "pus_pec": []}

    for r in csv.DictReader(open(root / "inputs" / "crc_messages.csv")):
        out["crc"][r["id"]] = binascii.crc_hqx(bytes.fromhex(r["hex"] or ""), 0xFFFF)

    for name in PEC_STREAMS:
        out["pec"][name] = [
            {"stored": int.from_bytes(p[-2:], "big"), "crc_hqx": binascii.crc_hqx(p[:-2], 0xFFFF)}
            for p in split_packet_bytes(str(k / f"{name}.bin"))]

    for name, pkt in DEFS.items():
        d = pkt.load(str(k / f"{name}.bin"), include_primary_header=True)
        npk = len(d["CCSDS_APID"])
        out["streams"][name] = [{f: as_json(d[f][i]) for f in d} for i in range(npk)]

    for name in ["apid104", "apid104_a", "apid104_b"]:
        out["validate"][name] = [r.getMessage() for r in validate(str(k / f"{name}.bin"))]

    ks = {r["id"]: r["explicit_hex"] for r in csv.DictReader(open(k / "time_codes.csv"))}
    for r in csv.DictReader(open(root / "inputs" / "time_codes.csv")):
        if r["code"] == "cds" and r["epoch"] == "1958" and r["a"] == "16" and r["b"] == "none":
            ts = CdsShortTimestamp(int(r["v1"]), int(r["v2"]), init_dt_unix_stamp=False)
            back = CdsShortTimestamp.unpack(bytes.fromhex(ks[r["id"]]))
            out["cds_short"][r["id"]] = {"pack": ts.pack().hex(), "days": back.ccsds_days,
                                         "ms": back.ms_of_day}

    stream = b""
    for i, (svc, sub, days, ms, n) in enumerate(PUS):
        stamp = CdsShortTimestamp(days, ms, init_dt_unix_stamp=False).pack()
        src = bytes((0x10 * i + j) & 0xFF for j in range(n))
        p = PusTm(service=svc, message_subtype=sub, timestamp=stamp, source_data=src, apid=0x0EF,
                  seq_count=i, message_counter=i, destination_id=0).pack()
        out["pus"].append({"sec_header": p[6:20].hex(), "hex": p.hex()})
        out["pus_pec"].append({"stored": int.from_bytes(p[-2:], "big"),
                               "crc_hqx": binascii.crc_hqx(p[:-2], 0xFFFF)})
        stream += p
    (root / "outputs").mkdir(exist_ok=True)
    (root / "outputs" / "pus_tm_spacepackets.bin").write_bytes(stream)
    (root / "outputs" / "python.json").write_text(json.dumps(out, indent=1, sort_keys=True) + "\n")


if __name__ == "__main__":
    main(Path(sys.argv[1]))
