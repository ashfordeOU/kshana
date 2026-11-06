# SPDX-License-Identifier: AGPL-3.0-only
"""Example: the Kshana C interface from Python with ctypes (standard library only).

    python3 examples/python/run_and_map.py target/release/libkshana_capi.so \
        scenario.toml mapping.toml station.toml log.csv

(For Python projects, the `kshana` wheel is the native route; this shows the C interface.)
"""
import ctypes
import sys

KSHANA_OK, KSHANA_BAD_ARGUMENT = 0, 2


def load(path):
    lib = ctypes.CDLL(path)
    lib.kshana_version.restype = ctypes.c_char_p
    lib.kshana_run_scenario.argtypes = [ctypes.c_char_p, ctypes.POINTER(ctypes.c_void_p), ctypes.POINTER(ctypes.c_void_p)]
    lib.kshana_run_scenario.restype = ctypes.c_int
    lib.kshana_connect_map.argtypes = [ctypes.c_char_p] * 3 + [ctypes.POINTER(ctypes.c_void_p)] * 2
    lib.kshana_connect_map.restype = ctypes.c_int
    lib.kshana_string_free.argtypes = [ctypes.c_void_p]
    lib.kshana_string_free.restype = None
    return lib


def take(lib, p):
    """Copy a returned string into Python and free it."""
    if not p.value:
        return None
    s = ctypes.string_at(p.value).decode("utf-8")
    lib.kshana_string_free(p)
    return s


def main(argv):
    if len(argv) != 6:
        print(f"usage: {argv[0]} <libkshana_capi> <scenario.toml> <mapping.toml> <station.toml> <log>", file=sys.stderr)
        return 2
    lib = load(argv[1])
    print("kshana", lib.kshana_version().decode())
    read = lambda p: open(p, "rb").read()

    ok, err = ctypes.c_void_p(), ctypes.c_void_p()
    rc = lib.kshana_run_scenario(read(argv[2]), ctypes.byref(ok), ctypes.byref(err))
    result, reason = take(lib, ok), take(lib, err)
    if rc != KSHANA_OK:
        print(f"run failed ({rc}): {reason}", file=sys.stderr)
        return 1
    print("result:", result[:60] + "...")

    rc = lib.kshana_connect_map(read(argv[3]), read(argv[4]), read(argv[5]), ctypes.byref(ok), ctypes.byref(err))
    jsonl, reason = take(lib, ok), take(lib, err)
    if rc != KSHANA_OK:
        print(f"map failed ({rc}): {reason}", file=sys.stderr)
        return 1
    print("records:", jsonl.count("\n"))

    rc = lib.kshana_run_scenario(None, ctypes.byref(ok), ctypes.byref(err))
    take(lib, ok)
    reason = take(lib, err)
    print(f"null scenario: {rc} ({'with reason' if reason else 'no reason'})")
    return 0 if rc == KSHANA_BAD_ARGUMENT else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv))
