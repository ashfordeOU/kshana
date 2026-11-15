# SPDX-License-Identifier: AGPL-3.0-only
"""SDK conformance for the native Python package (roadmap 0.42 I9).

The three conformance scenarios and the mapping case of capi/kshana-capi/sdk/conformance/cases.txt,
run through the wheel's own functions (`kshana.run`, `kshana.connect_map`), must give exactly the bytes
whose SHA-256 the C interface pins in expected.sha256; the C, C++, Python (ctypes), Go, Java and .NET
drivers are held to the same digests by capi/kshana-capi/tests/sdk_conformance.rs.
"""
import hashlib
from pathlib import Path

import kshana

REPO = Path(__file__).resolve().parents[2]
CONF = REPO / "capi" / "kshana-capi" / "sdk" / "conformance"


def cases():
    for line in (CONF / "cases.txt").read_text(encoding="utf-8").splitlines():
        if line.strip() and not line.startswith("#"):
            out, entry, *inputs = line.split()
            yield out, entry, [REPO / p for p in inputs]


def pinned():
    pins = {}
    for line in (CONF / "expected.sha256").read_text(encoding="utf-8").splitlines():
        digest, name = line.split("  ", 1)
        pins[name.strip()] = digest
    return pins


def produce(entry, inputs):
    texts = [p.read_text(encoding="utf-8") for p in inputs]
    if entry == "run":
        return kshana.run(texts[0])
    if entry == "map":
        return kshana.connect_map(*texts)
    raise AssertionError(f"unknown entry {entry}")


def test_the_wheel_gives_the_pinned_sdk_conformance_bytes():
    pins = pinned()
    seen = []
    for out, entry, inputs in cases():
        data = produce(entry, inputs).encode("utf-8")
        assert hashlib.sha256(data).hexdigest() == pins[out], f"{out} differs from the C interface's bytes"
        seen.append(out)
    assert sorted(seen) == sorted(pins), "cases.txt and expected.sha256 list different outputs"
    assert len(seen) == 4
