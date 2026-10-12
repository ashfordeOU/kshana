#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Independent-parser oracle for the CEF events of ``kshana::telemetry::syslog::cef``.

Reads ``tests/fixtures/cef/corpus.json`` (the CEF lines this crate wrote for the corpus
registered in ``tests/cef_reference.rs``), parses every line with ``pycef`` and writes
``tests/fixtures/cef/reference.json`` for that test.

WHAT IS EXTERNALLY CHECKED, narrowly: ``pycef`` (an independent open-source CEF parser)
splits our lines into header fields and extension key/value pairs, and the CEF specification's
unescape rules, applied here in Python, recover the original text. ``pycef`` itself does NOT
unescape; the unescape in this script is the CEF specification's (extension: ``\\\\`` ``\\=``
``\\n`` ``\\r``; header: ``\\\\`` ``\\|``), written independently of the Rust code.
``pycef``'s header pattern cannot match header fields containing a backslash, an equals sign or
an escaped pipe, so header escaping (the tier 2 cases) is recorded but not claimed.

PINNED ORACLE
-------------
Python 3.13, pycef==1.11 (PyPI, MIT). pycef is an oracle-script-only dependency: nothing in the
crate or CI needs it.

Usage::

    python3 scripts/gen_cef_ref.py
"""
import json
import os
import re
import sys

import pycef

HERE = os.path.dirname(os.path.abspath(__file__))
FIX = os.path.join(HERE, "..", "tests", "fixtures", "cef")

HEADER_KEYS = {"CEFVersion", "DeviceVendor", "DeviceProduct", "DeviceVersion",
               "DeviceEventClassID", "Name", "DeviceName", "Severity", "DeviceSeverity"}
SHOWN_HEADER = ["CEFVersion", "DeviceVendor", "DeviceProduct", "DeviceVersion",
                "DeviceEventClassID", "Name", "Severity"]

EXT_ESCAPES = {"\\": "\\", "=": "=", "n": "\n", "r": "\r"}


def unescape_extension(s):
    # CEF specification: in an extension value, backslash-backslash, backslash-equals,
    # backslash-n (line feed) and backslash-r (carriage return).
    return re.sub(r"\\([\\=nr])", lambda m: EXT_ESCAPES[m.group(1)], s)


def unescape_header(s):
    # CEF specification: in a header field, backslash-backslash and backslash-pipe.
    return re.sub(r"\\([\\|])", lambda m: m.group(1), s)


def main():
    corpus = json.load(open(os.path.join(FIX, "corpus.json"), encoding="utf-8"))
    out = {}
    for c in corpus:
        try:
            v = pycef.parse(c["line"])
        except Exception as e:  # a parser that raises on a line has not parsed it
            out[c["id"]] = {"parsed": False, "error": f"{type(e).__name__}: {e}"}
            continue
        if not v:
            out[c["id"]] = {"parsed": False}
            continue
        out[c["id"]] = {
            "parsed": True,
            "header": {k: unescape_header(v[k]) for k in SHOWN_HEADER if k in v},
            "extension": {k: unescape_extension(x) for k, x in v.items() if k not in HEADER_KEYS},
            "raw_extension": {k: x for k, x in v.items() if k not in HEADER_KEYS},
        }
    doc = {"oracle": "pycef==1.11 parse(); CEF-specification unescape applied by this script", "cases": out}
    with open(os.path.join(FIX, "reference.json"), "w", encoding="utf-8") as f:
        json.dump(doc, f, indent=1, sort_keys=True, ensure_ascii=False)
        f.write("\n")
    n = sum(1 for v in out.values() if v["parsed"])
    print(f"wrote reference.json: {len(out)} lines, {n} parsed by pycef")


if __name__ == "__main__":
    sys.exit(main())
