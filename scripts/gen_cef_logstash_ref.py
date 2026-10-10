#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Second independent-parser oracle for the CEF events of ``kshana::telemetry::syslog::cef``:
the Logstash CEF codec (``logstash-codec-cef`` 6.2.7, Apache-2.0, Elastic), run inside
Logstash 8.15.3.

Feeds every CEF line of ``tests/fixtures/cef/corpus.json`` to the codec (ECS compatibility
disabled, one event per line, one worker so the output order is the input order) and writes
``tests/fixtures/cef/reference_logstash.json`` in the same normalised form as
``reference.json`` so ``tests/cef_reference.rs`` can compare both with one routine.

WHAT THE CODEC DOES (read in its source before this script was registered): it unescapes the
extension values by the CEF specification's rules (backslash-backslash, backslash-equals,
backslash-n, backslash-r) and the header fields (backslash-backslash, backslash-pipe), so unlike
``pycef`` it can also read escaped header fields; it keeps every value as a string; and it renames
the standard CEF keys to their long names (``dvchost`` is ``deviceHostName``, ``cat`` is
``deviceEventCategory``, ``csN`` is ``deviceCustomStringN`` with ``csNLabel`` as
``deviceCustomStringNLabel``, ``cnN`` likewise ``deviceCustomNumberN``). This script translates
those long names back and applies the custom-field label substitution (the label's text becomes
the key), as ``pycef`` does, so that both references have the same shape.

PINNED ORACLE
-------------
Logstash 8.15.3 linux-x86_64 (https://artifacts.elastic.co/downloads/logstash/), tarball SHA-512
536c980b68633c30200bd5039b38714e3b48770c94afd18f96d806e12b53a1c1b0887d23ee82349face1024c778f487f
c6ab45064dd7b7775a3973bc99126327, with its bundled JDK; codec ``logstash-codec-cef`` 6.2.7-java.
Logstash is a dev-only tool here: it is not shipped, linked or needed by CI.

Usage::

    python3 scripts/gen_cef_logstash_ref.py /path/to/logstash-8.15.3
"""
import json
import os
import re
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
FIX = os.path.join(HERE, "..", "tests", "fixtures", "cef")

HEADER_MAP = {
    "cefVersion": "CEFVersion",
    "deviceVendor": "DeviceVendor",
    "deviceProduct": "DeviceProduct",
    "deviceVersion": "DeviceVersion",
    "deviceEventClassId": "DeviceEventClassID",
    "name": "Name",
    "severity": "Severity",
}
LONG_TO_SHORT = {"deviceHostName": "dvchost", "deviceEventCategory": "cat"}
CUSTOM = re.compile(r"^deviceCustom(String|Number|FloatingPoint)(\d+)(Label)?$")
PREFIX = {"String": "cs", "Number": "cn", "FloatingPoint": "cfp"}
KNOWN_EVENT_FIELDS = {"@timestamp", "@version", "event", "host", "message", "tags", "log"}

CONFIG = r'''
input { stdin { codec => cef { ecs_compatibility => disabled delimiter => "\\n" } } }
output { file { path => "%s" codec => json_lines } }
'''


def run_logstash(home, lines, workdir):
    out = os.path.join(workdir, "events.jsonl")
    conf = os.path.join(workdir, "pipeline.conf")
    with open(conf, "w") as f:
        f.write(CONFIG % out)
    data = ("\n".join(lines) + "\n").encode("utf-8")
    p = subprocess.run(
        [os.path.join(home, "bin", "logstash"), "-w", "1", "--pipeline.ordered", "true",
         "--pipeline.batch.size", "1", "--path.data", os.path.join(workdir, "data"),
         "--log.level", "error", "-f", conf],
        input=data, capture_output=True, timeout=900,
    )
    if p.returncode != 0:
        sys.stderr.write(p.stderr.decode("utf-8", "replace")[-2000:])
        raise SystemExit(f"logstash exited with {p.returncode}")
    return [json.loads(l) for l in open(out, encoding="utf-8").read().splitlines() if l.strip()]


def normalise(ev):
    if "_cefparsefailure" in (ev.get("tags") or []):
        return {"parsed": False, "tags": ev["tags"]}
    header = {HEADER_MAP[k]: ev[k] for k in HEADER_MAP if k in ev}
    ext, labels = {}, {}
    for k, v in ev.items():
        if k in HEADER_MAP or k in KNOWN_EVENT_FIELDS:
            continue
        m = CUSTOM.match(k)
        if m:
            short = f"{PREFIX[m.group(1)]}{m.group(2)}"
            (labels if m.group(3) else ext)[short] = v
        else:
            ext[LONG_TO_SHORT.get(k, k)] = v
    # custom-field label substitution: the label's text becomes the key
    for short, label in labels.items():
        if short in ext:
            ext[label] = ext.pop(short)
    return {"parsed": True, "header": header, "extension": {k: str(v) for k, v in ext.items()}}


def main():
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    home = sys.argv[1]
    corpus = json.load(open(os.path.join(FIX, "corpus.json"), encoding="utf-8"))
    with tempfile.TemporaryDirectory() as work:
        events = run_logstash(home, [c["line"] for c in corpus], work)
    if len(events) != len(corpus):
        raise SystemExit(f"{len(events)} events for {len(corpus)} lines")
    out = {c["id"]: normalise(e) for c, e in zip(corpus, events)}
    doc = {"oracle": "Logstash 8.15.3, logstash-codec-cef 6.2.7-java, ecs_compatibility disabled; long field names translated back and labels substituted by this script", "cases": out}
    with open(os.path.join(FIX, "reference_logstash.json"), "w", encoding="utf-8") as f:
        json.dump(doc, f, indent=1, sort_keys=True, ensure_ascii=False)
        f.write("\n")
    print(f"wrote reference_logstash.json: {len(out)} lines, {sum(1 for v in out.values() if v['parsed'])} parsed")


if __name__ == "__main__":
    sys.exit(main())
