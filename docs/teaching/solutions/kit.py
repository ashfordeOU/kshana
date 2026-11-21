# SPDX-License-Identifier: AGPL-3.0-only
"""Shared helpers for the Python solutions of the teaching labs (docs/teaching/).

Each solution runs on the C library through the ctypes wrapper in
capi/kshana-capi/sdk/python/conformance.py: the same library the MATLAB and LabVIEW tracks
call, so the three tracks give the same numbers. Each solution asserts its worked answers
and checks that the lab sheet states them, so the sheet cannot drift from the engine.
"""
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.normpath(os.path.join(HERE, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, "capi", "kshana-capi", "sdk", "python"))

from conformance import Kshana  # noqa: E402  (path set just above)


def engine():
    """The library from argv[1] or the KSHANA_CAPI_LIB environment variable."""
    path = sys.argv[1] if len(sys.argv) > 1 else os.environ.get("KSHANA_CAPI_LIB", "")
    if not path:
        raise SystemExit("usage: python3 -I <solution.py> <path to libkshana_capi>")
    return Kshana(path)


def text(rel):
    with open(os.path.join(REPO, rel), encoding="utf-8") as f:
        return f.read()


def run(k, toml):
    return json.loads(k.run(toml.encode("utf-8")))


def set_value(toml, key, value):
    """Replace the line `key = ...` (the same edit the MATLAB solutions make with regexprep)."""
    new, n = re.subn(rf"(?m)^{re.escape(key)} = .*$", f"{key} = {value}", toml)
    if n != 1:
        raise SystemExit(f"{key}: expected one line to replace, found {n}")
    return new


class Sheet:
    """A lab sheet; every worked answer printed must also appear in it."""

    def __init__(self, rel):
        self.rel = rel
        self.body = text(rel)
        self.count = 0

    def answer(self, label, shown, ok=True):
        if not ok:
            raise SystemExit(f"FAIL {label}: the engine gives {shown}, outside the worked answer")
        if shown not in self.body:
            raise SystemExit(f"FAIL {label}: {self.rel} does not state {shown!r}")
        self.count += 1
        print(f"ok  {label}: {shown}")

    def done(self):
        print(f"{self.rel}: {self.count} worked answers match the engine")
