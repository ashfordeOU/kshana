#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
pynmea2 oracle for the NMEA training-stream Validated anchor.

Oracle: pynmea2 1.19.0 (independent NMEA 0183 parser; different authors and code from
``kshana::nmea_synth``).  Pin: ``pip install pynmea2==1.19.0``.

Builds the example ``gen_nmea_training_inputs`` (8 streams: 4 library scenarios x seeds 1
and 7), parses EVERY sentence of every stream with ``pynmea2.parse(line, check=True)`` (so a
bad checksum raises), and writes ``tests/fixtures/nmea_training_ref/reference.json``:

* per stream: the SHA-256 of the exact bytes parsed, the number of sentences, per
  (talker, type) counts, the number of parse and checksum failures (must be 0), and
* the decoded values of every 10th epoch (position, speed, course, heading, UTC), which
  ``tests/nmea_training_reference.rs`` compares with the generator's truth track.

The generator writes one RMC per epoch, first among the epoch's sentences; each RMC
starts a new epoch here (the proprietary ``$PKSHT`` marker is only every 10 s).

Usage::

    python3 scripts/gen_nmea_training_ref.py
"""
import collections
import datetime
import hashlib
import json
import os
import subprocess
import sys
import tempfile

import pynmea2

assert pynmea2.__version__ == "1.19.0", pynmea2.__version__

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "tests", "fixtures", "nmea_training_ref", "reference.json")
EVERY = 10  # decode every 10th epoch (the generator's default log interval)


def decode_epoch(msgs):
    d = {}
    for m in msgs:
        t = m.sentence_type
        if t == "RMC":
            d["rmc_valid"] = m.status == "A"
            d["rmc_time"] = m.timestamp.isoformat()
            d["rmc_date"] = m.datestamp.isoformat()
            if m.status == "A":
                d["rmc_lat"], d["rmc_lon"] = float(m.latitude), float(m.longitude)
                d["rmc_sog_kn"], d["rmc_cog"] = float(m.spd_over_grnd), float(m.true_course)
        elif t == "GGA":
            d["gga_qual"] = int(m.gps_qual)
            d["gga_time"] = m.timestamp.isoformat()
            d["gga_nsat"] = int(m.num_sats)
            if int(m.gps_qual) > 0:
                d["gga_lat"], d["gga_lon"] = float(m.latitude), float(m.longitude)
        elif t == "GNS":
            d["gns_time"] = m.timestamp.isoformat()
            if m.lat != "":
                d["gns_lat"], d["gns_lon"] = float(m.latitude), float(m.longitude)
        elif t == "VTG":
            if m.spd_over_grnd_kts is not None:
                d["vtg_cog"] = float(m.true_track)
                d["vtg_sog_kn"] = float(m.spd_over_grnd_kts)
                d["vtg_sog_kmh"] = float(m.spd_over_grnd_kmph)
        elif t == "ZDA":
            d["zda_time"] = m.timestamp.isoformat()
            d["zda_date"] = datetime.date(
                int(m.year), int(m.month), int(m.day)
            ).isoformat()
        elif t == "HDT":
            d["hdt_heading"] = float(m.heading)
    return d


def parse_stream(path):
    raw = open(path, "rb").read()
    text = raw.decode("ascii")
    lines = text.split("\r\n")
    assert lines[-1] == "", "stream must end with CRLF"
    lines = lines[:-1]
    counts = collections.Counter()
    bad = 0
    epochs, cur = [], []
    for ln in lines:
        try:
            m = pynmea2.parse(ln, check=True)
        except pynmea2.ParseError:
            bad += 1
            continue
        if isinstance(m, pynmea2.ProprietarySentence) or ln.startswith("$P"):
            counts["P/" + ln[1:6]] += 1
            continue
        counts[m.talker + "/" + m.sentence_type] += 1
        if m.sentence_type == "RMC":
            cur = []
            epochs.append(cur)
        cur.append(m)
    rows = []
    for k, msgs in enumerate(epochs):
        if k % EVERY == 0:
            r = decode_epoch(msgs)
            r["epoch"] = k
            rows.append(r)
    return {
        "sha256": hashlib.sha256(raw).hexdigest(),
        "sentences": len(lines),
        "failures": bad,
        "epochs": len(epochs),
        "counts": dict(sorted(counts.items())),
        "rows": rows,
    }


def main():
    with tempfile.TemporaryDirectory() as tmp:
        subprocess.run(
            ["cargo", "run", "-q", "--example", "gen_nmea_training_inputs", "--", tmp],
            cwd=ROOT,
            check=True,
        )
        out = {"oracle": "pynmea2 " + pynmea2.__version__, "streams": {}}
        for name in sorted(os.listdir(tmp)):
            out["streams"][name[:-5]] = parse_stream(os.path.join(tmp, name))
    with open(OUT, "w") as f:
        json.dump(out, f, indent=0, separators=(",", ":"))
        f.write("\n")
    for k, v in out["streams"].items():
        print(k, v["sentences"], "sentences", v["failures"], "failures", v["epochs"], "epochs")
    return 0 if all(v["failures"] == 0 for v in out["streams"].values()) else 1


if __name__ == "__main__":
    sys.exit(main())
