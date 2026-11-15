#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Writes the text and stream inputs added to the connect conformance kit in v2 (roadmap 0.42 I12).
Standard library only; run from the repository root:

    python3 conformance/tools/gen_kit_v2_inputs.py

* reader-mavlink stream (decode-mavlink): examples/tracks/flight.tlog with the 8-byte timestamps of
  the .tlog container removed, i.e. the raw MAVLink 2 frames as they arrive on a serial or UDP link.
* reader-gnss-sdr: GNSS-SDR monitor messages as JSON lines (field names from the GNSS-SDR monitor
  documentation), invented values.
* reader-android: an Android GnssLogger export (`# Raw,...` and `# Fix,...` header lines, then rows),
  invented values.
* mapping-tsv, mapping-jsonl: the timing-monitor CSV as tab-separated text and the monitor-API JSON as
  JSON lines (one record per line), each with its mapping file, so every mapping source format
  (`csv`, `tsv`, `json`, `jsonl`) has a vector.
* reader-rtklib-pos: the header and the first 30 epochs of an RTKLIB single-point solution of the
  Wettzell 2025-02-24 observation file (tests/fixtures/gnss_wettzell_2025055/oracle/rtklib_spp.pos).

The binary receiver streams (UBX, SBF, NovAtel, RTCM 3 MSM4) are written by tests/obs_live.rs
(`KSHANA_KIT_WRITE=1 cargo test --test obs_live the_kit`).
"""
from pathlib import Path

C = Path("conformance/connect")


def mavlink_stream():
    tlog = Path("examples/tracks/flight.tlog").read_bytes()
    out, i = bytearray(), 0
    while i + 8 < len(tlog):
        i += 8  # the .tlog timestamp
        stx = tlog[i]
        if stx == 0xFD:  # MAVLink 2: 10-byte header, payload, 2-byte CRC, optional 13-byte signature
            n = 10 + tlog[i + 1] + 2 + (13 if tlog[i + 2] & 1 else 0)
        elif stx == 0xFE:  # MAVLink 1
            n = 6 + tlog[i + 1] + 2
        else:
            raise SystemExit(f"flight.tlog: no MAVLink frame at {i}")
        out += tlog[i:i + n]
        i += n
    return bytes(out)


GNSS_SDR = """\
{"msg":"synchro","System":"G","Signal":"1C","PRN":5,"CN0_dB_hz":44.5,"RX_time":100.02,"Flag_valid_pseudorange":true}
{"msg":"synchro","System":"G","Signal":"1C","PRN":12,"CN0_dB_hz":42.0,"RX_time":100.02,"Flag_valid_pseudorange":true}
{"msg":"synchro","System":"E","Signal":"1B","PRN":11,"CN0_dB_hz":40.0,"RX_time":100.06,"Flag_valid_pseudorange":true}
{"msg":"pvt","rx_time":100.0,"week":2300,"latitude":59.44,"longitude":24.75,"height":30.0,"valid_sats":7,"hdop":1.2,"utc_time":"2024-03-01T12:00:00.000Z","tracked_satellites":[{"prn":5,"system":"G","signal":"1C","azimuth_deg":120.0,"elevation_deg":35.0,"used":true},{"prn":12,"system":"G","signal":"1C","azimuth_deg":200.0,"elevation_deg":50.0,"used":true}]}
{"msg":"synchro","System":"G","Signal":"1C","PRN":5,"CN0_dB_hz":31.0,"RX_time":101.02,"Flag_valid_pseudorange":true}
{"msg":"synchro","System":"G","Signal":"1C","PRN":12,"CN0_dB_hz":29.5,"RX_time":101.02,"Flag_valid_pseudorange":true}
{"msg":"synchro","System":"E","Signal":"1B","PRN":11,"CN0_dB_hz":28.0,"RX_time":101.06,"Flag_valid_pseudorange":false}
{"msg":"pvt","rx_time":101.0,"week":2300,"latitude":59.44001,"longitude":24.75001,"height":30.5,"valid_sats":6,"hdop":1.6,"utc_time":"2024-03-01T12:00:01.000Z","tracked_satellites":[{"prn":5,"system":"G","signal":"1C","azimuth_deg":120.0,"elevation_deg":35.1,"used":true}]}
{"msg":"other"}
"""

ANDROID_HEAD = """\
# Illustrative values, not a recording.
# Raw,utcTimeMillis,TimeNanos,LeapSecond,TimeUncertaintyNanos,FullBiasNanos,BiasNanos,BiasUncertaintyNanos,DriftNanosPerSecond,DriftUncertaintyNanosPerSecond,HardwareClockDiscontinuityCount,Svid,TimeOffsetNanos,State,ReceivedSvTimeNanos,ReceivedSvTimeUncertaintyNanos,Cn0DbHz,PseudorangeRateMetersPerSecond,PseudorangeRateUncertaintyMetersPerSecond,AccumulatedDeltaRangeState,AccumulatedDeltaRangeMeters,AccumulatedDeltaRangeUncertaintyMeters,CarrierFrequencyHz,CarrierCycles,CarrierPhase,CarrierPhaseUncertainty,MultipathIndicator,SnrInDb,ConstellationType,AgcDb
# Fix,Provider,LatitudeDegrees,LongitudeDegrees,AltitudeMeters,SpeedMps,AccuracyMeters,BearingDegrees,UnixTimeMillis
"""


def android():
    rows = []
    for k in range(6):
        t = 1709294400000 + 1000 * k
        cn0 = 28.0 if 2 <= k <= 3 else 42.0
        for svid, ct, agc in ((5, 1, 1.5), (12, 1, 1.5), (11, 6, 2.0)):
            raw = ["Raw", str(t), str(1_000_000_000 * k), "", "", "-1234567890123456789", "0.5", "", "", "",
                   "0", str(svid), "0", "16431", "", "", f"{cn0 - (svid % 3):.1f}", "", "", "0", "", "",
                   "1575420030" if ct == 1 else "1575420030", "", "", "", "0", "", str(ct), f"{agc}"]
            rows.append(",".join(raw))
        rows.append(f"Fix,gps,59.44,{24.75 + k * 1e-5:.5f},30.0,0.0,5.0,0.0,{t}")
    return ANDROID_HEAD + "\n".join(rows) + "\n"


def rtklib():
    lines = Path("tests/fixtures/gnss_wettzell_2025055/oracle/rtklib_spp.pos").read_text().splitlines()
    head = [l for l in lines if l.startswith("%")]
    body = [l for l in lines if l and not l.startswith("%")][:30]
    return "\n".join(head + body) + "\n"


def write(rel, data):
    p = C / rel
    p.parent.mkdir(parents=True, exist_ok=True)
    (p.write_bytes if isinstance(data, bytes) else p.write_text)(data)


def mapping_tsv():
    src = Path("examples/connect/timing-monitor.csv").read_text()
    m = Path("examples/connect/timing-monitor.connect.toml").read_text()
    m = m.replace('format = "csv"\ndelimiter = ";"', 'format = "tsv"').replace("semicolon-separated", "tab-separated")
    assert 'format = "tsv"' in m
    return src.replace(";", "\t"), m


def mapping_jsonl():
    import json
    doc = json.loads(Path("examples/connect/monitor-api.json").read_text())
    rows = "".join(json.dumps(r, separators=(",", ":")) + "\n" for r in doc["data"]["epochs"])
    m = Path("examples/connect/monitor-api.connect.toml").read_text()
    m = m.replace('format = "json"\nrecords = "/data/epochs"', 'format = "jsonl"')
    m = m.replace("records under /data/epochs", "one record per line")
    assert 'format = "jsonl"' in m and "records =" not in m
    return rows, m


tsv, tsv_map = mapping_tsv()
write("mapping-tsv/input.tsv", tsv)
write("mapping-tsv/mapping.connect.toml", tsv_map)
rows, jsonl_map = mapping_jsonl()
write("mapping-jsonl/input.jsonl", rows)
write("mapping-jsonl/mapping.connect.toml", jsonl_map)
write("decode-mavlink/input.mavlink", mavlink_stream())
write("reader-gnss-sdr/input.jsonl", GNSS_SDR)
write("reader-android/input.txt", android())
write("reader-rtklib-pos/input.pos", rtklib())
