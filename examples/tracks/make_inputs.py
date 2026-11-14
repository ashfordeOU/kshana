#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Writes the sample inputs of examples/tracks/ (roadmap 0.42 I1, I6) with encoders that share no code
with src/interconnect/, and checks each with an independent open-source decoder where one exists.

    python3 -m venv /tmp/v && /tmp/v/bin/pip install pyais==3.3.1 pyModeS==3.7.0 pymavlink pyulog asterix_decoder
    /tmp/v/bin/python examples/tracks/make_inputs.py examples/tracks

Every value is synthetic or a published worked example; see NOTICE.md for the source of each file.
"""
import json
import struct
import sys
from pathlib import Path

OUT = Path(sys.argv[1] if len(sys.argv) > 1 else ".")


# --- AIS: encoded by pyais (MIT), the TAG blocks and one damaged sentence added here -----------------
def ais():
    from pyais.encode import encode_dict
    from pyais import decode as pdecode

    def tag(t, s):
        body = f"c:{t}"
        ck = 0
        for ch in body:
            ck ^= ord(ch)
        return f"\\{body}*{ck:02X}\\{s}"

    msgs = [
        (1700000000, {"type": 1, "mmsi": 244123456, "status": 0, "speed": 12.3, "accuracy": 1,
                      "lon": 4.4721, "lat": 51.9071, "course": 123.4, "heading": 121, "second": 0, "raim": 1}),
        (1700000010, {"type": 1, "mmsi": 244123456, "status": 0, "speed": 12.4, "accuracy": 1,
                      "lon": 4.4760, "lat": 51.9060, "course": 123.0, "heading": 121, "second": 10, "raim": 1}),
        (1700000005, {"type": 5, "mmsi": 244123456, "ais_version": 0, "imo": 9134270, "callsign": "PBXY",
                      "shipname": "ROTTERDAM TRADER", "ship_type": 70, "to_bow": 120, "to_stern": 30,
                      "to_port": 10, "to_starboard": 12, "epfd": 1, "month": 11, "day": 15, "hour": 8,
                      "minute": 30, "draught": 8.2, "destination": "HAMBURG", "dte": 0}),
        (1700000020, {"type": 18, "mmsi": 211000001, "speed": 6.0, "accuracy": 0, "lon": 4.4500,
                      "lat": 51.9000, "course": 270.0, "heading": 511, "second": 20, "raim": 0, "cs": 1}),
        (1700000030, {"type": 19, "mmsi": 211000002, "speed": 3.1, "accuracy": 1, "lon": 4.4600,
                      "lat": 51.9100, "course": 90.0, "heading": 88, "second": 30, "shipname": "SAILOR",
                      "ship_type": 37, "to_bow": 8, "to_stern": 4, "to_port": 2, "to_starboard": 2,
                      "epfd": 1, "raim": 1}),
        (1700000040, {"type": 24, "mmsi": 211000001, "partno": 0, "shipname": "PLEASURE ONE"}),
        (1700000041, {"type": 24, "mmsi": 211000001, "partno": 1, "ship_type": 37, "vendorid": "ABC",
                      "callsign": "DA1234", "to_bow": 5, "to_stern": 3, "to_port": 1, "to_starboard": 1}),
    ]
    lines = []
    seq = 0
    for t, m in msgs:
        sentences = encode_dict(m, talker_id="AI", sentence_type="VDM", radio_channel="A", seq_id=seq % 10)
        seq += 1
        for s in sentences:
            lines.append(tag(t, s))
        # Independent check: pyais decodes what it encoded.
        d = pdecode(*sentences).asdict()
        assert d["mmsi"] == m["mmsi"], d
    # A sentence with a damaged checksum (the last two hex digits replaced), which must be dropped.
    good = encode_dict(msgs[0][1], talker_id="AI", sentence_type="VDM", radio_channel="B")[0]
    lines.append(good[:-2] + ("00" if good[-2:] != "00" else "11"))
    # An own-vessel report (VDO) without a TAG block: no time.
    lines.extend(encode_dict({**msgs[0][1], "mmsi": 244999999}, talker_id="AI", sentence_type="VDO"))
    (OUT / "ais.nmea").write_text("\n".join(lines) + "\n")


# --- ADS-B: The 1090 Megahertz Riddle examples, and messages built here, checked by pyModeS (GPL) ----
def crc(msg_hex):
    g = 0x1FFF409
    v = int(msg_hex, 16)
    n = len(msg_hex) * 4
    for i in range(n - 1, 23, -1):
        if v >> i & 1:
            v ^= g << (i - 24)
    return v & 0xFFFFFF


def with_crc(head_hex):
    """DF17 frame from its first 88 bits (hex)."""
    return head_hex + f"{crc(head_hex + '000000'):06X}"


def me_bits(fields):
    v = 0
    n = 0
    for val, w in fields:
        v = (v << w) | (val & ((1 << w) - 1))
        n += w
    assert n == 56
    return f"{v:014X}"


def adsb():
    import pyModeS
    from pyModeS.position import cprNL

    icao = "4CA7B4"
    # Operational status, airborne (TC 31, subtype 0), version 2, NIC-A 0, NACp 9.
    op = me_bits([(31, 5), (0, 3), (0, 16), (0, 16), (2, 3), (0, 1), (9, 4), (0, 2), (3, 2), (0, 1), (0, 1), (0, 1), (0, 1)])
    op_msg = with_crc("8D" + icao + op)
    od = pyModeS.decode(op_msg)
    assert od["crc_valid"], od

    def position(tc, lat_cpr, lon_cpr, odd, nicb=0, alt=38000):
        n = (alt + 1000) // 25
        alt12 = ((n & 0x7F0) << 1) | 0x10 | (n & 0xF)
        me = me_bits([(tc, 5), (0, 2), (nicb, 1), (alt12, 12), (0, 1), (odd, 1), (lat_cpr, 17), (lon_cpr, 17)])
        return with_crc("8D" + icao + me)

    def cpr(lat, lon, odd):
        import math
        nz = 15
        dlat = 360.0 / (4 * nz - odd)
        yz = math.floor(131072 * ((lat % dlat) / dlat) + 0.5)
        rlat = dlat * (yz / 131072 + math.floor(lat / dlat))
        nl = cprNL(rlat)
        dlon = 360.0 / max(nl - odd, 1)
        xz = math.floor(131072 * ((lon % dlon) / dlon) + 0.5)
        return yz % 131072, xz % 131072

    track = []
    for k, (lat, lon) in enumerate([(53.4200, -6.2500), (53.4210, -6.2480), (53.4220, -6.2460), (53.4230, -6.2440)]):
        odd = k % 2
        la, lo = cpr(lat, lon, odd)
        tc = 11 if k < 2 else 16
        track.append(position(tc, la, lo, odd))
    even, odd = track[0], track[1]
    dec = pyModeS.decode(track, timestamps=[0.5 * k for k in range(len(track))])
    p = (dec[1]["latitude"], dec[1]["longitude"])
    assert abs(p[0] - 53.421) < 1e-4 and abs(p[1] + 6.248) < 1e-4, dec
    with open(OUT / "adsb.oracle.json", "w") as fh:
        json.dump({"operational_status": od, "positions": dec}, fh, indent=1, default=str)
    # Counter: 12 MHz, half a second apart.
    rows = ["*8D4840D6202CC371C32CE0576098;"]
    msgs = [op_msg] + track
    for k, m in enumerate(msgs):
        rows.append(f"@{(1_000_000 + k * 6_000_000):012X}{m};")
    rows.append("@000003000000" + "8D40621D58C382D690C8AC2863A8" + ";")  # damaged CRC
    (OUT / "adsb.avr").write_text("\n".join(rows) + "\n")
    # The same messages in the Beast binary framing ('3', 6-octet counter, signal, 14 octets; 0x1A doubled).
    beast = bytearray()
    for k, m in enumerate(msgs):
        body = (1_000_000 + k * 6_000_000).to_bytes(6, "big") + bytes([0x80]) + bytes.fromhex(m)
        beast += b"\x1a3" + body.replace(b"\x1a", b"\x1a\x1a")
    (OUT / "adsb.beast").write_bytes(bytes(beast))


# --- ASTERIX CAT048, CAT010, CAT062: an encoder written here from the public specifications ----------
def fspec(frns):
    n = (max(frns) + 6) // 7
    octs = [0] * n
    for f in frns:
        i, b = divmod(f - 1, 7)
        octs[i] |= 0x80 >> b
    for i in range(n - 1):
        octs[i] |= 1
    return bytes(octs)


def block(cat, records):
    body = b"".join(records)
    return bytes([cat]) + struct.pack(">H", 3 + len(body)) + body


def asterix():
    import asterix as ast

    recs48 = []
    for k in range(3):
        items = {
            1: bytes([25, 7]),
            2: struct.pack(">I", int((36000 + k * 4.0) * 128))[1:],
            3: bytes([0b10100000]),  # TYP 5 (Mode S roll-call), SIM 0
            4: struct.pack(">HH", int(round((20.0 + k * 0.1) * 256)), int(round((45.0 + k) * 65536 / 360))),
            6: struct.pack(">h", 350 * 4),
            7: bytes([0b11000000, 40, 120]),  # I048/130 SRL, SRR
            8: bytes.fromhex("4CA7B4"),
            11: struct.pack(">H", 1000 + k),
            14: bytes([0x00]),  # I048/170: confirmed
            15: bytes([2, 3, 1, 4]),  # I048/210
        }
        frns = sorted(items)
        recs48.append(fspec(frns) + b"".join(items[f] for f in frns))
    recs10 = []
    for k in range(2):
        items = {
            1: bytes([25, 9]),
            2: bytes([1]),
            3: bytes([0b01000001, 0x00]),  # TYP 2 (ADS-B), then an extension octet with SIM 0
            4: struct.pack(">I", int((36010 + k) * 128))[1:],
            5: struct.pack(">ii", int(round(52.3086 * 2 ** 31 / 180)), int(round((4.7639 + k * 0.001) * 2 ** 31 / 180))),
            13: bytes.fromhex("484F21"),
            22: bytes([8, 6]) + struct.pack(">h", -4),
        }
        frns = sorted(items)
        recs10.append(fspec(frns) + b"".join(items[f] for f in frns))
    recs62 = []
    for k in range(2):
        adr = bytes([0b10000000]) + bytes.fromhex("4CA7B5")  # I062/380: ADR only
        acc = bytes([0b10100000]) + struct.pack(">HH", 30, 40) + struct.pack(">HH", 5, 6)  # APC, APW
        items = {
            1: bytes([25, 1]),
            4: struct.pack(">I", int((36020 + k * 5) * 128))[1:],
            5: struct.pack(">ii", int(round((53.0 + k * 0.01) * 2 ** 25 / 180)), int(round(-6.0 * 2 ** 25 / 180))),
            11: adr,
            12: struct.pack(">H", 4321),
            13: bytes([0b00000011, 0b00000001, 0b00000001, 0b10000000]),  # CNF 1, then SIM 0, ..., CST 1
            17: struct.pack(">h", 370 * 4),
            27: acc,
        }
        frns = sorted(items)
        recs62.append(fspec(frns) + b"".join(items[f] for f in frns))
    data = block(48, recs48) + block(10, recs10) + block(62, recs62) + block(34, [b"\x80\x19\x07"])
    (OUT / "asterix.bin").write_bytes(data)
    # Independent check: the CroatiaControl decoder reads every record, with the same values.
    parsed = ast.parse(data)
    cats = [p["category"] for p in parsed]
    assert cats.count(48) == 3 and cats.count(10) == 2 and cats.count(62) == 2, cats
    for p in parsed:
        if p["category"] == 48:
            assert p["I220"]["ACAddr"]["val"] == "4CA7B4", p["I220"]
        if p["category"] == 62:
            assert abs(p["I105"]["Lat"]["val"] - 53.0) < 0.02, p["I105"]


# --- MAVLink: frames written by pymavlink (LGPL), as a .tlog ------------------------------------------
def mavlink():
    from pymavlink.dialects.v20 import common as m

    class Buf:
        def __init__(self):
            self.b = b""

        def write(self, x):
            self.b += x

    out = bytearray()
    for v1 in (False,):
        buf = Buf()
        mav = m.MAVLink(buf, srcSystem=1, srcComponent=1)
        t0 = 1_700_000_000_000_000
        prns = [5, 12, 15, 24, 29, 66] + [0] * 14
        used = [1, 1, 1, 1, 0, 1] + [0] * 14
        elev = [45, 30, 60, 20, 8, 50] + [0] * 14
        azim = [10, 64, 128, 192, 250, 100] + [0] * 14
        snr = [44, 40, 46, 35, 0, 42] + [0] * 14
        for k in range(4):
            for msg in (
                m.MAVLink_heartbeat_message(2, 12, 0, 0, 4, 3),
                m.MAVLink_gps_status_message(6, prns, used, elev, azim, snr),
                m.MAVLink_gps_raw_int_message(
                    time_usec=t0 + k * 200_000, fix_type=3 if k < 3 else 2,
                    lat=473977420 + k * 10, lon=85455940 + k * 10, alt=488_000,
                    eph=90 if k < 3 else 450, epv=150, vel=500, cog=9000, satellites_visible=9,
                    alt_ellipsoid=0, h_acc=1200, v_acc=2000, vel_acc=300, hdg_acc=0, yaw=0),
                m.MAVLink_gps2_raw_message(
                    time_usec=t0 + k * 200_000, fix_type=3, lat=473977430 + k * 10,
                    lon=85455950 + k * 10, alt=488_100, eph=110, epv=160, vel=500, cog=9000,
                    satellites_visible=8, dgps_numch=0, dgps_age=0, yaw=0, alt_ellipsoid=0,
                    h_acc=1500, v_acc=2500, vel_acc=0, hdg_acc=0),
            ):
                buf.b = b""
                mav.send(msg)
                out += struct.pack(">Q", t0 + k * 200_000 + 1000) + buf.b
    (OUT / "flight.tlog").write_bytes(bytes(out))
    # Independent check: pymavlink reads the log back.
    from pymavlink import mavutil
    log = mavutil.mavlink_connection(str(OUT / "flight.tlog"))
    n = 0
    while True:
        r = log.recv_match(type="GPS_RAW_INT")
        if r is None:
            break
        n += 1
    assert n == 4, n


# --- PX4 ULog: written here from the format description, checked by pyulog (BSD) ----------------------
def ulog():
    def msg(ty, body):
        return struct.pack("<HB", len(body), ord(ty)) + body

    b = b"ULog\x01\x12\x35" + bytes([1]) + struct.pack("<Q", 0)
    b += msg("B", bytes(8) + bytes(8) + bytes(24))
    fmt = (b"sensor_gps:uint64_t timestamp;uint64_t time_utc_usec;double latitude_deg;double longitude_deg;"
           b"double altitude_msl_m;float eph;float epv;float hdop;float vdop;int32_t noise_per_ms;"
           b"int32_t jamming_indicator;uint8_t jamming_state;uint8_t spoofing_state;uint8_t fix_type;"
           b"uint8_t satellites_used;uint8_t[4] _padding0;")
    b += msg("F", fmt)
    b += msg("I", bytes([len(b"char[3] ver_hw")]) + b"char[3] ver_hw" + b"V5X")
    b += msg("A", bytes([0]) + struct.pack("<H", 3) + b"sensor_gps")
    rows = [
        (12_000_000, 1_700_000_100_000_000, 47.3977419, 8.5455938, 488.12, 0.8, 1.2, 0.9, 1.4, 90, 35, 1, 1, 3, 12),
        (12_200_000, 1_700_000_100_200_000, 47.3977425, 8.5455941, 488.10, 0.8, 1.2, 0.9, 1.4, 95, 41, 1, 1, 3, 12),
        (12_400_000, 1_700_000_100_400_000, 47.3977431, 8.5455944, 488.30, 2.5, 4.0, 1.9, 2.8, 160, 140, 2, 1, 3, 9),
        (12_600_000, 1_700_000_100_600_000, 47.3980000, 8.5460000, 492.00, 6.0, 9.0, 3.5, 4.2, 210, 220, 3, 2, 2, 6),
        (12_800_000, 0, 0.0, 0.0, 0.0, 99.0, 99.0, 99.0, 99.0, 250, 250, 3, 3, 0, 0),
    ]
    for r in rows:
        d = struct.pack("<QQdddffffiiBBBB", *r)
        b += msg("D", struct.pack("<H", 3) + d)
    (OUT / "flight.ulg").write_bytes(b)
    from pyulog import ULog
    u = ULog(str(OUT / "flight.ulg"))
    g = u.get_dataset("sensor_gps")
    assert list(g.data["jamming_state"]) == [1, 1, 2, 3, 3], g.data["jamming_state"]
    assert abs(g.data["latitude_deg"][0] - 47.3977419) < 1e-9


ais()
adsb()
asterix()
mavlink()
ulog()
print("written to", OUT)
