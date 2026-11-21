# SPDX-License-Identifier: AGPL-3.0-only
"""Replay the MATLAB and LabVIEW call sequences against libkshana_capi with ctypes.

    python3 -I sdk/python/wrapper_patterns.py <libkshana_capi> <repo root>

MATLAB and LabVIEW cannot run on the CI runners, so this script makes the same C calls,
in the same order and with the same argument shapes, that the two wrappers make:

* MATLAB (sdk/matlab/+kshana/private/callEntry.m, takeString.m): inputs as NUL-terminated
  UTF-8 byte arrays; out-parameters as void**; a returned string's length found by
  reading one byte at a time from the returned pointer until the NUL; the bytes copied;
  the same pointer handed back to kshana_string_free once. Results are checked the way
  the wrapper decodes them (validate gives a JSON array, connectMap one JSON object per
  line).
* LabVIEW (sdk/labview/README.md): out-parameters as pointer-sized integers passed by
  reference; StrLen (C strlen) then MoveBlock (C memmove) to copy the bytes; the address,
  passed by value as a pointer-sized integer, freed with kshana_string_free once.

It also checks the three return codes both wrappers turn into errors. What it cannot
check is MATLAB's or LabVIEW's own marshalling: that part is "not run on the target
tool" (sdk/matlab/README.md, sdk/labview/README.md).
"""
import ctypes
import json
import os
import sys

OK, ERROR, BAD_ARGUMENT = 0, 1, 2


def load(path):
    lib = ctypes.CDLL(path)
    vpp = ctypes.POINTER(ctypes.c_void_p)
    lib.kshana_version.restype = ctypes.c_char_p
    lib.kshana_version.argtypes = []
    for fn, n_in in (
        ("kshana_run_scenario", 1),
        ("kshana_validate_scenario", 1),
        ("kshana_connect_map", 3),
    ):
        f = getattr(lib, fn)
        f.argtypes = [ctypes.c_void_p] * n_in + [vpp, vpp]
        f.restype = ctypes.c_int
    lib.kshana_string_free.argtypes = [ctypes.c_void_p]
    lib.kshana_string_free.restype = None
    return lib


def utf8z(text):
    """A NUL-terminated uint8 array, as callEntry.m builds with [unicode2native(v,'UTF-8'), uint8(0)]."""
    raw = text.encode("utf-8") + b"\0"
    return (ctypes.c_uint8 * len(raw)).from_buffer_copy(raw)


# ---- MATLAB --------------------------------------------------------------------------------


def matlab_take(lib, p):
    """takeString.m: scan byte by byte from the pointer, copy n bytes, free the same pointer."""
    if not p.value:
        return None
    base = ctypes.cast(p.value, ctypes.POINTER(ctypes.c_uint8))
    n = 0
    while base[n] != 0:
        n += 1
    b = bytes(base[:n])
    lib.kshana_string_free(p.value)
    return b


def matlab_call(lib, fn, *inputs):
    """callEntry.m: returns (rc, result bytes or None, reason bytes or None)."""
    args = [utf8z(t) for t in inputs]
    okp, errp = ctypes.c_void_p(), ctypes.c_void_p()
    rc = getattr(lib, fn)(*args, ctypes.byref(okp), ctypes.byref(errp))
    has_result = bool(okp.value)
    result = matlab_take(lib, okp)
    reason = matlab_take(lib, errp)
    assert has_result == (result is not None)
    return rc, result, reason


# ---- LabVIEW -------------------------------------------------------------------------------


def labview_take(lib, libc, addr):
    """StrLen then MoveBlock into a LabVIEW-owned buffer, then kshana_string_free(addr) by value."""
    if addr == 0:
        return None
    n = libc.strlen(ctypes.c_void_p(addr))
    buf = ctypes.create_string_buffer(n)
    ctypes.memmove(buf, addr, n)
    lib.kshana_string_free(ctypes.c_void_p(addr))
    return buf.raw[:n]


def labview_call(lib, libc, fn, *inputs):
    """Call Library Function Node: strings as C string pointers, outs as pointer-sized ints by reference."""
    outs = [ctypes.c_size_t(0), ctypes.c_size_t(0)]
    f = getattr(lib, fn)
    args = [ctypes.c_char_p(t.encode("utf-8")) for t in inputs]
    vpp = ctypes.POINTER(ctypes.c_void_p)
    refs = [ctypes.cast(ctypes.pointer(o), vpp) for o in outs]
    rc = f(*[ctypes.cast(a, ctypes.c_void_p) for a in args], *refs)
    return rc, labview_take(lib, libc, outs[0].value), labview_take(lib, libc, outs[1].value)


# ---- checks --------------------------------------------------------------------------------


def check(cond, what):
    if not cond:
        raise SystemExit(f"FAIL: {what}")
    print(f"ok  {what}")


def main(argv):
    if len(argv) != 3:
        print(f"usage: {argv[0]} <libkshana_capi> <repo root>", file=sys.stderr)
        return 2
    lib = load(argv[1])
    libc = ctypes.CDLL(None)
    libc.strlen.argtypes = [ctypes.c_void_p]
    libc.strlen.restype = ctypes.c_size_t
    root = argv[2]

    def read(rel):
        with open(os.path.join(root, rel), encoding="utf-8") as f:
            return f.read()

    scenario = read("scenarios/link-budget.toml")
    mapping = read("examples/connect/timing-monitor.connect.toml")
    station = read("examples/obs/station.toml")
    log = read("examples/connect/timing-monitor.csv")
    typo = scenario.replace('kind = "link-budget"', 'kind = "link-budgt"')
    refused = scenario.replace("range_km = 2000.0", "range_km = -5.0")

    for name, call in (
        ("matlab", lambda fn, *a: matlab_call(lib, fn, *a)),
        ("labview", lambda fn, *a: labview_call(lib, libc, fn, *a)),
    ):
        rc, out, err = call("kshana_run_scenario", scenario)
        doc = json.loads(out.decode("utf-8"))
        check(rc == OK and err is None and doc["kind"] == "link-budget", f"{name}: run gives a result document")
        rc, out, err = call("kshana_validate_scenario", scenario)
        check(rc == OK and json.loads(out) == [], f"{name}: validate of a valid scenario gives []")
        rc, out, err = call("kshana_validate_scenario", typo)
        problems = json.loads(out)
        check(
            rc == OK and len(problems) == 1 and 'did you mean "link-budget"' in problems[0],
            f"{name}: validate names the misspelt kind",
        )
        rc, out, err = call("kshana_run_scenario", refused)
        check(
            rc == ERROR and out is None and b"range_km must be finite and positive" in err,
            f"{name}: a refused input gives KSHANA_ERROR, no result and the reason",
        )
        rc, out, err = call("kshana_connect_map", mapping, station, log)
        lines = [json.loads(line) for line in out.decode("utf-8").splitlines() if line.strip()]
        check(
            rc == OK and lines[0]["type"] == "header" and [r["type"] for r in lines[1:]] == ["epoch"] * 5,
            f"{name}: connect map gives a header and five epochs",
        )
        # Non-ASCII text survives the UTF-8 round trip (the label carries U+2212 MINUS SIGN).
        rc, out, err = call("kshana_run_scenario", "# Søren’s copy\n" + scenario)
        check(rc == OK and "−" in json.loads(out)["label"], f"{name}: UTF-8 text in and out")

    # A NULL input is KSHANA_BAD_ARGUMENT, with the outs still written (NULL result).
    okp, errp = ctypes.c_void_p(), ctypes.c_void_p()
    rc = lib.kshana_run_scenario(None, ctypes.byref(okp), ctypes.byref(errp))
    matlab_take(lib, okp)
    matlab_take(lib, errp)
    check(rc == BAD_ARGUMENT and not okp.value, "a NULL input gives KSHANA_BAD_ARGUMENT")
    check(lib.kshana_version().decode() == argv_version(root), "kshana_version matches the crate version")
    print("wrapper call patterns: all checks passed")
    return 0


def argv_version(root):
    with open(os.path.join(root, "capi/kshana-capi/Cargo.toml"), encoding="utf-8") as f:
        for line in f:
            if line.startswith("version"):
                return line.split('"')[1]
    return "?"


if __name__ == "__main__":
    sys.exit(main(sys.argv))
