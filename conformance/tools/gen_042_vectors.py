#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write the hand-built inputs of the 0.42 I2/I3 conformance vectors, from the public specifications,
independently of the Rust encoders (so a vector checks the decoder against a second reading of the
spec, not against itself).

    python3 conformance/tools/gen_042_vectors.py        # rewrites the inputs; then bless and review:
    kshana connect check conformance/connect --bless     # receivers (kshana.obs/1 outputs)
    KSHANA_BLESS=1 cargo test --test connect_timing      # timing vectors (JSON outputs)

Sources of each layout are in the vector folders' SOURCE.md files. Every value is invented for the
vector (no recorded receiver or device output is reproduced).
"""
import math
import os
import struct
import zlib  # noqa: F401  (CRC-32 below is NovAtel's variant, not zlib's)

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def out(path, data):
    p = os.path.join(ROOT, path)
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, "wb") as f:
        f.write(data if isinstance(data, bytes) else data.encode())


# ----------------------------------------------------------------------------- SBP (libsbp spec)

def crc16_ccitt(data):
    crc = 0
    for b in data:
        crc ^= b << 8
        for _ in range(8):
            crc = ((crc << 1) ^ 0x1021) & 0xFFFF if crc & 0x8000 else (crc << 1) & 0xFFFF
    return crc


def sbp(msg_type, payload, sender=0x1234):
    body = struct.pack("<HHB", msg_type, sender, len(payload)) + payload
    return b"\x55" + body + struct.pack("<H", crc16_ccitt(body))


def sbp_stream():
    s = b""
    wn = 2340
    for k, tow in enumerate((100000, 101000)):
        s += sbp(0x0102, struct.pack("<HIiB", wn, tow, 0, 1))  # MSG_GPS_TIME
        s += sbp(0x020A, struct.pack("<IdddHHBB", tow, 59.4372 + k * 1e-5, 24.7453, 52.5, 800, 1500, 12, 1))
        s += sbp(0x0208, struct.pack("<IHHHHHB", tow, 150, 120, 80, 90, 110, 1))  # DOPS
        obs = b""
        # PackedObsContent: P u32, L (i32,u8), D (i16,u8), cn0 u8, lock u8, flags u8, sid (sat u8, code u8)
        for sat, code, cn0q in ((5, 0, 177 - k), (11, 14, 160), (5, 1, 150)):
            obs += struct.pack("<IiBhBBBBBB", 1100000000, 0, 0, 0, 0, cn0q, 15, 0x0F, sat, code)
        s += sbp(0x004A, struct.pack("<IiHB", tow, 0, wn, 0x10) + obs)  # MSG_OBS, 1 of 1
        s += sbp(0x0061, bytes([7, 0, 154, 103, 3, 140]))  # MEASUREMENT_STATE: G07 L1; GLO FCN (skipped)
    bad = bytearray(sbp(0x020A, struct.pack("<IdddHHBB", 102000, 1.0, 2.0, 3.0, 1, 1, 5, 1)))
    bad[-1] ^= 0xFF
    s += bytes(bad)  # CRC broken: skipped and counted
    s += sbp(0xFFFF, b"\x00\x00\x00\x00")  # heartbeat: passed over
    return s


# ----------------------------------------------------------------------------- GREIS 4.3.00

def greis_cs(data):
    r = 0
    for b in data:
        r = ((r << 2) | (r >> 6)) & 0xFF
        r ^= b
    return ((r << 2) | (r >> 6)) & 0xFF


def greis(mid, body):
    m = mid.encode() + ("%03X" % (len(body) + 1)).encode() + body
    return m + bytes([greis_cs(m)]) + b"\r\n"


def greis_stream():
    s = greis("RD", struct.pack("<HBBB", 2026, 11, 14, 0))
    for k, tod in enumerate((43200000, 43201000)):
        s += greis("~~", struct.pack("<I", tod))
        s += greis("SX", bytes([1, 5, 2, 0xFD, 4, 11]))  # G05, GLONASS FCN -3, E11
        s += greis("NN", bytes([7]))  # the GLONASS satellite is slot 7
        s += greis("EC", bytes([44 - k, 41, 255]))  # CA/L1 C/N0; 255 = no data
        s += greis("2E", bytes([152, 0, 160]))  # P/L2 C/N0 x 4 (38.0, none, 40.0)
        s += greis("PG", struct.pack("<dddfB", math.radians(59.4372), math.radians(24.7453), 72.25, 1.5, 1))
        s += greis("DP", struct.pack("<fffBf", 0.9, 1.2, 0.8, 1, 0.5))
        s += greis("XY", b"\x01\x02\x03")  # a message this reader does not know: skipped by length
        s += greis("::", struct.pack("<I", tod))
    return s


# ----------------------------------------------------------------------------- Unicore N4

def novatel_crc32(data):
    crc = 0
    for b in data:
        t = (crc ^ b) & 0xFF
        for _ in range(8):
            t = (t >> 1) ^ 0xEDB88320 if t & 1 else t >> 1
        crc = ((crc >> 8) & 0x00FFFFFF) ^ t
    return crc


def unicore(mid, week, ms, data):
    h = bytes([0xAA, 0x44, 0xB5, 90]) + struct.pack("<HHBBHIIBBH", mid, len(data), 0, 180, week, ms, 0, 0, 18, 0)
    m = h + data
    return m + struct.pack("<I", novatel_crc32(m))


def unicore_stream():
    s = b""
    for k, ms in enumerate((200000, 201000)):
        best = struct.pack("<IIdddfIfff4sffBBBBBBBB", 0, 16, 59.4372, 24.7453 + k * 1e-5, 30.0, 18.5, 61,
                           1.0, 1.0, 2.0, b"0\0\0\0", 0.0, 0.0, 30, 21, 0, 0, 0, 0, 0, 0)
        best += b"\0" * 24  # velocity part, not read
        s += unicore(2118, 2340, ms, best)
        obs = b""
        # freq, prn, psr, adr, psr std, adr std, dopp, C/N0*100, reserved, locktime, ch-tr-status
        for freq, prn, cn0, st in ((0, 5, 4425 - k * 100, 0x00000000 | (0 << 16) | (0 << 21)),
                                   (0, 19, 3950, (4 << 16) | (12 << 21)),  # BDS B2a pilot
                                   (6, 44, 4100, (1 << 16) | (0 << 21))):  # GLONASS slot 7 L1
            obs += struct.pack("<HHddHHfHHfI", freq, prn, 2.2e7, -1.1e8, 10, 20, -1000.0, cn0, 0, 50.0, st)
        s += unicore(12, 2340, ms, struct.pack("<I", 3) + obs)
    s += unicore(9999, 2340, 202000, b"\x00" * 8)  # other message: passed over
    return s


# ----------------------------------------------------------------------------- RTCM 3 (1006, MSM7)

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


def rtcm_stream():
    b = Bits()
    b.put(1006, 12); b.put(2003, 12); b.put(0, 6); b.put(1, 1); b.put(1, 1); b.put(1, 1); b.put(0, 1)
    for i, c in enumerate((30987654321, 13456789012, -55555555555)):  # 0.1 mm units
        b.put(c, 38)
        if i < 2:
            b.put(0, 2)
    b.put(15000, 16)  # antenna height 1.5 m
    s = rtcm(b.bytes())
    # MSM7, GPS: satellites 5 and 12, signals 2 (1C) and 15 (2S); cells: 5/1C, 5/2S, 12/1C
    c_ms = 299792.458  # metres per ms
    b = Bits()
    b.put(1077, 12); b.put(2003, 12); b.put(100000, 30); b.put(0, 1); b.put(0, 3); b.put(0, 7 + 2 + 2 + 1 + 3)
    b.put((1 << (64 - 5)) | (1 << (64 - 12)), 64)
    b.put((1 << (32 - 2)) | (1 << (32 - 15)), 32)
    for bit in (1, 1, 1, 0):
        b.put(bit, 1)
    for v in (70, 75):
        b.put(v, 8)  # rough range, whole ms
    for v in (0, 0):
        b.put(v, 4)  # extended info
    for v in (512, 256):
        b.put(v, 10)  # rough range modulo 1 ms, 2^-10 ms
    for v in (-500, 300):
        b.put(v, 14)  # rough phase-range rate, m/s
    for v in (1000, -2000, 0):
        b.put(v, 20)  # fine pseudorange, 2^-29 ms
    for v in (-524288 * 4 + 7, 4000, -8388608):
        b.put(v, 24)  # fine phase range, 2^-31 ms; the last is the invalid marker
    for v in (700, 650, 0):
        b.put(v, 10)  # lock time indicator
    for v in (0, 1, 0):
        b.put(v, 1)  # half cycle
    for v in (45 * 16 + 4, 38 * 16, 40 * 16):
        b.put(v, 10)  # CNR, 2^-4 dB-Hz
    for v in (1234, -16384, -500):
        b.put(v, 15)  # fine phase-range rate, 0.0001 m/s; the second is invalid
    s += rtcm(b.bytes())
    _ = c_ms
    return s


# ----------------------------------------------------------------------------- PTP management

def ptp_parent_response():
    data = bytes.fromhex("001122fffe334455") + struct.pack(">H", 1)  # parentPortIdentity
    data += bytes([0, 0]) + struct.pack(">H", 0xFFFF) + struct.pack(">i", 0x7FFFFFFF)
    data += bytes([128, 6, 0x21]) + struct.pack(">H", 0x4E5D) + bytes([128])
    data += bytes.fromhex("001122fffe334455")
    tlv = struct.pack(">HHH", 0x0001, 2 + len(data), 0x2002) + data
    hdr = bytes([0x0D, 0x02]) + struct.pack(">H", 48 + len(tlv)) + bytes([0, 0, 0, 0]) + b"\0" * 8 + b"\0" * 4
    hdr += bytes.fromhex("a0b0c0fffed0e0f0") + struct.pack(">H", 1) + struct.pack(">H", 42) + bytes([4, 0x7F])
    body = b"\0" * 8 + struct.pack(">H", 0) + bytes([1, 0, 0x02, 0])  # target, hops, action RESPONSE
    return hdr + body + tlv


# ----------------------------------------------------------------------------- SNMP (BER)

def ber(tag, body):
    n = len(body)
    ln = bytes([n]) if n < 0x80 else bytes([0x81, n]) if n < 0x100 else bytes([0x82, n >> 8, n & 0xFF])
    return bytes([tag]) + ln + body


def ber_oid(dotted):
    p = [int(x) for x in dotted.split(".")]
    out = bytearray([p[0] * 40 + p[1]])
    for s in p[2:]:
        enc = [s & 0x7F]
        s >>= 7
        while s:
            enc.append(0x80 | (s & 0x7F))
            s >>= 7
        out += bytes(reversed(enc))
    return ber(0x06, bytes(out))


def snmp_response():
    vbs = ber(0x30, ber_oid("1.3.6.1.2.1.1.5.0") + ber(0x04, b"gm-lab-1"))
    vbs += ber(0x30, ber_oid("1.3.6.1.4.1.5597.30.0.2.1.0") + ber(0x02, b"\x02"))
    vbs += ber(0x30, ber_oid("1.3.6.1.2.1.1.3.0") + ber(0x43, b"\x00\x98\x96\x80"))  # 10,000,000 ticks
    vbs += ber(0x30, ber_oid("1.3.6.1.2.1.241.1.2.4.1.4.0.1.1") + ber(0x02, b"\x05"))
    vbs += ber(0x30, ber_oid("1.3.6.1.2.1.197.1.2.5.0") + ber(0x81, b""))  # noSuchInstance
    pdu = ber(0x02, b"\x2a") + ber(0x02, b"\x00") + ber(0x02, b"\x00") + ber(0x30, vbs)
    return ber(0x30, ber(0x02, b"\x01") + ber(0x04, b"public") + ber(0xA2, pdu))


# ----------------------------------------------------------------------------- NTP mode 6

def ntp_mode6_response():
    data = b'version="ntpd 4.2.8p15", leap=00, stratum=2, precision=-23, rootdelay=0.512, rootdisp=12.345, refid=192.0.2.1, offset=-0.034, sys_jitter=0.021'
    hdr = bytes([(2 << 3) | 6, 0x80 | 2]) + struct.pack(">HHHHH", 1, 0x0615, 0, 0, len(data))
    m = hdr + data
    return m + b"\0" * ((-len(m)) % 4)


def main():
    out("connect/reader-sbp/input.sbp", sbp_stream())
    out("connect/reader-greis/input.jps", greis_stream())
    out("connect/reader-unicore/input.unc", unicore_stream())
    out("timing/rtcm3-decode/input.rtcm3", rtcm_stream())
    out("timing/ptp-mgmt/input.bin", ptp_parent_response())
    out("timing/snmp-message/input.bin", snmp_response())
    out("timing/ntp-mode6/input.bin", ntp_mode6_response())


if __name__ == "__main__":
    main()
