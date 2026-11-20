#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write the inputs of the E17 receiver-format test vectors, independently of the Rust code.

    python3 conformance/tools/gen_receiver_format_vectors.py   # rewrites the inputs; then bless and review:
    kshana connect check conformance/connect --bless            # reader vectors (kshana.obs/1 outputs)
    KSHANA_BLESS=1 cargo test --test connect_042_i2_i3          # timing vectors (JSON outputs)

* connect/reader-unicore-ascii: the example output lines of Unicore's Reference Commands Manual for
  N4 High Precision Products V2 R1.13, sections 7.5.36 (FREQJAMSTATUS), 7.5.49 (JAMSTATUS) and 7.5.7
  (AGC), copied byte for byte with their CRCs (DOCUMENT vector). The script checks each CRC.
* connect/reader-unicore-interference: the same three logs in binary (Table 7-48 header, Tables
  7-55, 7-91, 7-106), with OBSVM and BESTNAV, invented values (SELF-DERIVED vector).
* timing/rtcm3-decode-msm: MSM1, MSM2, MSM3, MSM5 and MSM6 frames, field widths from the open decoders
  RTKLIB rtcm3.c and pyrtcm, invented values (SELF-DERIVED vector).
"""
import os
import struct

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def out(path, data):
    p = os.path.join(ROOT, path)
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, "wb") as f:
        f.write(data if isinstance(data, bytes) else data.encode())


def crc32_unicore(data):
    """The 32-bit CRC of the N4 manual (Table 7-46), the reflected 0xEDB88320 polynomial, initial 0."""
    crc = 0
    for b in data:
        crc ^= b
        for _ in range(8):
            crc = (crc >> 1) ^ 0xEDB88320 if crc & 1 else crc >> 1
    return crc


# ----------------------------------------------------------------------------- Unicore, the manual's lines

MANUAL_LINES = [
    "#FREQJAMSTATUSA,97,GPS,FINE,2164,559464000,0,0,18,8;SINGLE,255,2,0,0,0,0,0,0*b0cdc7de",
    "#JAMSTATUSA,97,GPS,FINE,2190,365412000,0,0,18,14;SINGLE,0,0,0,0*e31418ea",
    "#AGCA,65,GPS,FINE,2190,375570000,0,0,18,37;44,46,63,-1,-1,41,1,0,-1,-1*634f1e4b",
]


def unicore_ascii():
    for line in MANUAL_LINES:
        body, crc = line[1:].split("*")
        assert "%08x" % crc32_unicore(body.encode()) == crc, line
    return "".join(l + "\r\n" for l in MANUAL_LINES)


# ----------------------------------------------------------------------------- Unicore, binary

def unicore(mid, week, ms, data):
    h = bytes([0xAA, 0x44, 0xB5, 90]) + struct.pack("<HHBBHIIBBH", mid, len(data), 0, 180, week, ms, 0, 0, 18, 0)
    m = h + data
    return m + struct.pack("<I", crc32_unicore(m))


def unicore_binary():
    s = b""
    for k, ms in enumerate((300000, 301000, 302000)):
        # OBSVM: one GPS L1 satellite whose C/N0 falls as the CW flag rises
        obs = struct.pack("<HHddHHfHHfI", 0, 7, 2.2e7, -1.1e8, 10, 20, -500.0, 4400 - 900 * k, 0, 40.0, 0)
        s += unicore(12, 2350, ms, struct.pack("<I", 1) + obs)
        # AGC (220): master antenna L1, L2, L5, two reserved, slave antenna (invalid here), two reserved
        agc = (60 - 15 * k, 58 - 15 * k, -1, -1, -1, -1, -1, -1, -1, -1)
        s += unicore(220, 2350, ms, struct.pack("<10h", *agc))
        # JAMSTATUS (511): position type, CWRatio, CWFlag, two reserved
        s += unicore(511, 2350, ms, struct.pack("<IBBBB", 16, 40 * k, k, 0, 0))
    # FREQJAMSTATUS (519) at the last epoch: L1 strong CW jam, L2 none, L5 CW jam
    s += unicore(519, 2350, 302000, struct.pack("<IBBBBBBBB", 16, 200, 2, 0, 0, 90, 1, 0, 0))
    return s


# ----------------------------------------------------------------------------- RTCM 3 MSM1-3, 5, 6

def crc24q(data):
    crc = 0
    for b in data:
        crc ^= b << 16
        for _ in range(8):
            crc <<= 1
            if crc & 0x1000000:
                crc ^= 0x1864CFB
    return crc & 0xFFFFFF


class Bits:
    def __init__(self):
        self.v, self.n = 0, 0

    def put(self, val, bits):
        self.v = (self.v << bits) | (val & ((1 << bits) - 1))
        self.n += bits

    def bytes(self):
        pad = (-self.n) % 8
        return (self.v << pad).to_bytes((self.n + pad) // 8, "big")


def rtcm(payload):
    f = bytes([0xD3, len(payload) >> 8, len(payload) & 0xFF]) + payload
    return f + crc24q(f).to_bytes(3, "big")


def msm(kind, system_base, epoch, sats, sigs, cells, sat_fields, cell_fields):
    """One MSM frame. `cells` is the cell mask in satellite-major order; `sat_fields` and `cell_fields`
    are lists of (bits, [values]) written field by field, as the message type carries them."""
    b = Bits()
    b.put(system_base + kind, 12); b.put(4001, 12); b.put(epoch, 30)
    b.put(0, 1); b.put(0, 3); b.put(0, 7 + 2 + 2 + 1 + 3)
    mask = 0
    for s in sats:
        mask |= 1 << (64 - s)
    b.put(mask, 64)
    smask = 0
    for g in sigs:
        smask |= 1 << (32 - g)
    b.put(smask, 32)
    for bit in cells:
        b.put(bit, 1)
    for bits, vals in sat_fields:
        for v in vals:
            b.put(v, bits)
    for bits, vals in cell_fields:
        for v in vals:
            b.put(v, bits)
    return rtcm(b.bytes())


def rtcm_msm_stream():
    s = b""
    # GPS (1070 + k): satellites 5 and 12, signals 2 (1C) and 15 (2S); cells 5/1C, 5/2S, 12/1C
    sats, sigs, cells = (5, 12), (2, 15), (1, 1, 1, 0)
    rough_mod = (10, [512, 256])  # rough range modulo 1 ms, 2^-10 ms
    # MSM1: fine pseudorange only
    s += msm(1, 1070, 100000, sats, sigs, cells, [rough_mod], [(15, [1000, -2000, -16384])])
    # MSM2: fine phase range, lock time, half cycle
    s += msm(2, 1070, 100000, sats, sigs, cells, [rough_mod],
             [(22, [3000, -4000, 5]), (4, [7, 8, 9]), (1, [0, 1, 0])])
    # MSM3: both
    s += msm(3, 1070, 100000, sats, sigs, cells, [rough_mod],
             [(15, [1000, -2000, 0]), (22, [3000, -4000, -2097152]), (4, [7, 8, 9]), (1, [0, 1, 0])])
    # MSM5 (BeiDou 1120 + 5): satellite 11, signal 2 (2I); whole ms, extended info, rough range, rough rate
    s += msm(5, 1120, 200000, (11,), (2,), (1,),
             [(8, [80]), (4, [0]), (10, [100]), (14, [-250])],
             [(15, [500]), (22, [-600]), (4, [10]), (1, [0]), (6, [41]), (15, [1234])])
    # MSM6 (Galileo 1090 + 6): satellite 4, signal 2 (1C); whole ms and rough range, high-resolution cells
    s += msm(6, 1090, 200000, (4,), (2,), (1,),
             [(8, [85]), (10, [300])],
             [(20, [70000]), (24, [-80000]), (10, [600]), (1, [1]), (10, [42 * 16 + 12])])
    return s


def main():
    out("connect/reader-unicore-ascii/input.unc", unicore_ascii())
    out("connect/reader-unicore-interference/input.unc", unicore_binary())
    out("timing/rtcm3-decode-msm/input.rtcm3", rtcm_msm_stream())


if __name__ == "__main__":
    main()
