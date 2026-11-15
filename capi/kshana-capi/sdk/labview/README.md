# Kshana from LabVIEW (Call Library Function Node)

LabVIEW calls the Kshana C interface (`include/kshana.h`) directly with the **Call Library Function
Node**; no wrapper DLL is needed. This page gives the node configuration for each entry point. A VI is a
binary file, so the repository ships this configuration rather than a `.vi`; it is not run in CI (no
LabVIEW on the runners). The C, C++, Python, Go, Java and .NET drivers run there and must give the same
bytes as described in [`../conformance/README.md`](../conformance/README.md).

Library path: `kshana_capi.dll` (Windows), `libkshana_capi.so` (Linux) or `libkshana_capi.dylib` (macOS),
built with `cargo build --release` in `capi/kshana-capi`. Calling convention: **C**. Thread: **Run in any
thread** (the library is safe to call from several threads at once).

| Function | Return type | Parameters (in order) |
|---|---|---|
| `kshana_version` | String, C String Pointer | none |
| `kshana_run_scenario` | Numeric, Signed 32-bit Integer | `scenario_toml`: String, C String Pointer · `out_json`: Numeric, Pointer-sized Integer, Pointer to Value · `out_err`: Numeric, Pointer-sized Integer, Pointer to Value |
| `kshana_connect_map` | Numeric, Signed 32-bit Integer | `mapping_toml`, `station_toml`, `log_text`: String, C String Pointer · `out_jsonl`, `out_err`: Numeric, Pointer-sized Integer, Pointer to Value |
| `kshana_string_free` | Void | `s`: Numeric, Pointer-sized Integer, Value |

Reading a returned string: the out-parameters come back as addresses. Pass each non-zero address to
LabVIEW's `MoveBlock` (or `StrLen` then `MoveBlock`) from `LabVIEW` (the built-in library name) to copy
the bytes into a LabVIEW string, then call `kshana_string_free` with the same address, exactly once.
Never free them any other way.

Return codes: `0` OK, `1` the engine refused the input (the error string says why), `2` a bad argument
(null, not UTF-8, or over 64 MiB), `3` internal. The result is JSON (UTF-8): parse it with
**Unflatten From JSON**.

The three conformance scenarios and the mapping case are listed in
[`../conformance/cases.txt`](../conformance/cases.txt); a LabVIEW VI that writes the four outputs to a
folder can be checked with `sha256sum -c expected.sha256` in that folder.
