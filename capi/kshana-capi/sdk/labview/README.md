# Kshana from LabVIEW (Call Library Function Node)

LabVIEW calls the Kshana C interface (`include/kshana.h`) directly with the **Call Library Function
Node**; no wrapper DLL is needed. This page gives the node configuration for each entry point, and
[`VI-LIBRARY.md`](VI-LIBRARY.md) describes, in text, a small VI library (`Kshana.lvlib`) to build from
these nodes. A VI is a binary file, so the repository ships the configuration rather than a `.vi`.

**Not run on the target tool.** No LabVIEW is installed on the CI runners and this page has not been
run in LabVIEW. What is tested: the same C calls, with the same argument shapes (pointer-sized
integers passed by reference, `StrLen` then `MoveBlock`, the address freed by value), are replayed with
Python `ctypes` by [`../python/wrapper_patterns.py`](../python/wrapper_patterns.py), run by
`tests/sdk_wrappers.rs` in the `capi-check` CI job. The C, C++, Python, Go, Java and .NET drivers also
run there and must give the same bytes ([`../conformance/README.md`](../conformance/README.md)).

Library path: `kshana_capi.dll` (Windows), `libkshana_capi.so` (Linux) or `libkshana_capi.dylib` (macOS),
built with `cargo build --release` in `capi/kshana-capi`. Use a 64-bit LabVIEW with a 64-bit library.
Calling convention: **C**. Thread: **Run in any thread** (the library is safe to call from several
threads at once).

| Function | Return type | Parameters (in order) |
|---|---|---|
| `kshana_version` | String, C String Pointer | none |
| `kshana_run_scenario` | Numeric, Signed 32-bit Integer | `scenario_toml`: String, C String Pointer · `out_json`: Numeric, Pointer-sized Integer, Pointer to Value · `out_err`: Numeric, Pointer-sized Integer, Pointer to Value |
| `kshana_validate_scenario` | Numeric, Signed 32-bit Integer | `scenario_toml`: String, C String Pointer · `out_json`: Numeric, Pointer-sized Integer, Pointer to Value · `out_err`: Numeric, Pointer-sized Integer, Pointer to Value |
| `kshana_connect_map` | Numeric, Signed 32-bit Integer | `mapping_toml`, `station_toml`, `log_text`: String, C String Pointer · `out_jsonl`, `out_err`: Numeric, Pointer-sized Integer, Pointer to Value |
| `kshana_string_free` | Void | `s`: Numeric, Pointer-sized Integer, Value |

`kshana_version` returns a static string: do not free it.

## Reading a returned string

The out-parameters come back as addresses (0 when there is nothing). For each non-zero address, call
two functions of the built-in library named `LabVIEW` (type `LabVIEW` as the library name), then free:

| Step | Library, function | Return | Parameters |
|---|---|---|---|
| 1. length | `LabVIEW`, `StrLen` | Numeric, Signed 32-bit Integer | `cstr`: Numeric, Pointer-sized Integer, Value |
| 2. copy | `LabVIEW`, `MoveBlock` | Void | `src`: Numeric, Pointer-sized Integer, Value · `dst`: Array, Unsigned 8-bit Integer, Array Data Pointer · `size`: Numeric, Unsigned Pointer-sized Integer, Value |
| 3. free | your library, `kshana_string_free` | Void | `s`: Numeric, Pointer-sized Integer, Value |

For step 2, allocate the destination first with **Initialize Array** (U8, length from step 1), then
convert the filled array with **Byte Array To String**. Call `kshana_string_free` with the same address
exactly once, and never free it any other way. Steps 1 to 3 together are the `Kshana Take String.vi`
subVI of [`VI-LIBRARY.md`](VI-LIBRARY.md).

Inputs: LabVIEW strings are byte strings. Scenario files are UTF-8; read them with **Read from Text
File** (no conversion) so the bytes pass through unchanged. A string wired to a *C String Pointer*
parameter is passed NUL-terminated by LabVIEW.

## Return codes

`0` OK, `1` the engine refused the input (the error string says why), `2` a bad argument (null, not
UTF-8, or over 64 MiB), `3` internal. On `1` there is no result (the address is 0) and the error string
holds the reason: map it to a LabVIEW error cluster (the VI library uses code 5001 + the return code).
The result is JSON (UTF-8): parse it with **Unflatten From JSON**, or read single fields with a JSON
toolkit of your choice.

## Conformance

The three conformance scenarios and the mapping case are listed in
[`../conformance/cases.txt`](../conformance/cases.txt); a LabVIEW VI that writes the four outputs to a
folder can be checked with `sha256sum -c expected.sha256` in that folder.

The teaching labs in [`docs/teaching/`](../../../../docs/teaching/README.md) give LabVIEW steps for each
exercise next to the MATLAB and Python ones.
