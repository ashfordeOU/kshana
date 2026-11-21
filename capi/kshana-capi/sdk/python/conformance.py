# SPDX-License-Identifier: AGPL-3.0-only
"""Kshana SDK conformance driver for Python over the C interface (ctypes, standard library only).

    python3 -I sdk/python/conformance.py <libkshana_capi> <outdir> <s1> <s2> <s3> <mapping> <station> <log>

For Python projects the native route is the `kshana` wheel (`pip install kshana`); the same cases run
against it in tests/python/test_sdk_conformance.py. This shows the C interface from Python.
"""
import ctypes
import os
import sys

KSHANA_OK = 0


class Kshana:
    """A thin wrapper over libkshana_capi: strings in, strings out, errors as exceptions."""

    def __init__(self, path):
        lib = ctypes.CDLL(path)
        out = ctypes.POINTER(ctypes.c_void_p)
        lib.kshana_version.restype = ctypes.c_char_p
        lib.kshana_run_scenario.argtypes = [ctypes.c_char_p, out, out]
        lib.kshana_run_scenario.restype = ctypes.c_int
        lib.kshana_validate_scenario.argtypes = [ctypes.c_char_p, out, out]
        lib.kshana_validate_scenario.restype = ctypes.c_int
        lib.kshana_connect_map.argtypes = [ctypes.c_char_p] * 3 + [out, out]
        lib.kshana_connect_map.restype = ctypes.c_int
        lib.kshana_string_free.argtypes = [ctypes.c_void_p]
        lib.kshana_string_free.restype = None
        self._lib = lib

    def version(self):
        return self._lib.kshana_version().decode("utf-8")

    def _take(self, p):
        if not p.value:
            return None
        b = ctypes.string_at(p.value)
        self._lib.kshana_string_free(p)
        return b

    def _call(self, fn, *args):
        ok, err = ctypes.c_void_p(), ctypes.c_void_p()
        rc = fn(*args, ctypes.byref(ok), ctypes.byref(err))
        result, reason = self._take(ok), self._take(err)
        if rc != KSHANA_OK or result is None:
            raise RuntimeError(f"kshana error {rc}: {(reason or b'').decode('utf-8', 'replace')}")
        return result

    def run(self, toml: bytes) -> bytes:
        """Run a scenario; the result document as UTF-8 JSON bytes."""
        return self._call(self._lib.kshana_run_scenario, toml)

    def validate(self, toml: bytes) -> bytes:
        """Check a scenario without running it; a UTF-8 JSON array of problems (b"[]" when valid)."""
        return self._call(self._lib.kshana_validate_scenario, toml)

    def connect_map(self, mapping: bytes, station: bytes, log: bytes) -> bytes:
        """Map a log to kshana.obs/1 records; UTF-8 JSON-lines bytes."""
        return self._call(self._lib.kshana_connect_map, mapping, station, log)


def main(argv):
    if len(argv) != 9:
        print(f"usage: {argv[0]} <lib> <outdir> <s1> <s2> <s3> <mapping> <station> <log>", file=sys.stderr)
        return 2
    k = Kshana(argv[1])
    out = argv[2]

    def read(p):
        with open(p, "rb") as f:
            return f.read()

    def put(name, data):
        with open(os.path.join(out, name), "wb") as f:
            f.write(data)

    for i in range(3):
        put(f"run-{i + 1}.json", k.run(read(argv[3 + i])))
    put("map.jsonl", k.connect_map(read(argv[6]), read(argv[7]), read(argv[8])))
    print(f"kshana {k.version()} conformance: 4 outputs written")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
