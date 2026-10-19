#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Relay GNSS-SDR monitor UDP streams to the JSON lines `kshana receiver-trust` reads
(`format = "gnss-sdr"`). Receive only: it binds a local UDP port and writes a file; it never
sends a datagram and never touches the receiver.

GNSS-SDR serialises its Monitor and PVT-monitor messages with Protocol Buffers. The message
classes come from your own GNSS-SDR install (run `protoc --python_out=. <file>.proto` on the
`.proto` files it ships); they are not bundled here. Name the generated module and class of
each stream you enabled:

    relay.py --out run.jsonl --seconds 600 \\
        --synchro 1234 gnss_synchro_pb2 Observables \\
        --pvt 1235 monitor_pvt_pb2 MonitorPvt

Needs `pip install protobuf`. A message with a repeated `observable` field (a batch of
channels) is unpacked into one line per channel; any other message is written as one line.
Not exercised against a live GNSS-SDR in this repository: the line format itself is tested
in the engine (`cargo test --lib gnss_sdr`).
"""
import argparse
import importlib
import json
import select
import socket
import sys
import time

from google.protobuf.json_format import MessageToDict


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--out", required=True)
    ap.add_argument("--seconds", type=float, default=0.0, help="stop after N seconds (0: until Ctrl-C)")
    ap.add_argument("--synchro", nargs=3, metavar=("PORT", "MODULE", "CLASS"))
    ap.add_argument("--pvt", nargs=3, metavar=("PORT", "MODULE", "CLASS"))
    a = ap.parse_args()
    streams = {}
    for kind, spec in (("synchro", a.synchro), ("pvt", a.pvt)):
        if not spec:
            continue
        port, mod, cls = spec
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.bind(("127.0.0.1", int(port)))
        streams[s] = (kind, getattr(importlib.import_module(mod), cls))
    if not streams:
        sys.exit("give --synchro and/or --pvt")
    end = time.time() + a.seconds if a.seconds > 0 else None
    with open(a.out, "w", encoding="utf-8") as out:
        while end is None or time.time() < end:
            ready, _, _ = select.select(list(streams), [], [], 0.5)
            for s in ready:
                kind, cls = streams[s]
                msg = cls()
                try:
                    msg.ParseFromString(s.recv(65535))
                except Exception:
                    continue
                items = list(getattr(msg, "observable", [])) or [msg]
                for it in items:
                    d = MessageToDict(it, preserving_proto_field_name=True)
                    d["msg"] = kind
                    out.write(json.dumps(d) + "\n")
            out.flush()


if __name__ == "__main__":
    main()
