# Kshana SDKs over the C interface

Each SDK here is a thin wrapper over the five functions of [`include/kshana.h`](../include/kshana.h):
strings in, strings out, every returned string freed with `kshana_string_free`, errors raised in the
language's own way. No simulation logic lives in any wrapper. Every one of them is also a
**conformance driver**: it runs the three conformance scenarios and the mapping case in
[`conformance/cases.txt`](conformance/cases.txt) and writes the four outputs, which must equal the Rust
reference byte for byte ([`conformance/README.md`](conformance/README.md)).

Build the library first: `cd capi/kshana-capi && cargo build --release` gives
`target/release/libkshana_capi.a` and the shared library (`.so`, `.dylib` or `.dll`).

| Language | Wrapper and driver | How it calls the library | Run in CI |
|---|---|---|---|
| C | [`c/conformance.c`](c/conformance.c) | the header, static or shared library | yes |
| C++ | [`cpp/conformance.cpp`](cpp/conformance.cpp) (`kshana::Engine`, RAII) | the header | yes |
| Python (ctypes) | [`python/conformance.py`](python/conformance.py) (`Kshana`) | `ctypes.CDLL`, standard library only | yes |
| Go | [`go/main.go`](go/main.go) (`Run`, `ConnectMap`) | cgo | yes |
| Java | [`java/KshanaConformance.java`](java/KshanaConformance.java) (`Kshana`) | Foreign Function and Memory API (Java 22+, or 21 with `--enable-preview`); no JNI code | yes |
| .NET (C#) | [`csharp/Kshana.cs`](csharp/Kshana.cs) (`Kshana.Engine`) | P/Invoke (`DllImport`), .NET 8 | yes |
| Julia | [`julia/conformance.jl`](julia/conformance.jl) (`Kshana`) | `ccall`, standard library only | runs when `julia` is installed; not installed on the runners yet |
| MATLAB | [`matlab/`](matlab/README.md): the `+kshana` package (`kshana.run`, `kshana.validate`, `kshana.connectMap`) and [`kshana_conformance.m`](matlab/kshana_conformance.m) | `loadlibrary` and `calllib` | not on MATLAB (no licence on the runners); its C call sequence is replayed with ctypes ([`python/wrapper_patterns.py`](python/wrapper_patterns.py)) |
| LabVIEW | [`labview/README.md`](labview/README.md) (node settings) and [`VI-LIBRARY.md`](labview/VI-LIBRARY.md) (six VIs described in text) | Call Library Function Node | not in LabVIEW (no VI; no licence on the runners); its C call sequence is replayed with ctypes ([`python/wrapper_patterns.py`](python/wrapper_patterns.py)) |

`tests/sdk_wrappers.rs` checks the MATLAB and LabVIEW material without those tools: the C names the
`.m` files call are all in the header, the LabVIEW guide configures every function, the replay of both
call sequences runs on the built library, and the teaching labs' Python solutions
([`docs/teaching/`](../../../docs/teaching/README.md)) reproduce the answers their sheets state.

Two more SDKs are native rather than over the C interface, and run the same cases with the same
digests: the **Python package** (`pip install kshana`; `kshana.run`, `kshana.connect_map`;
`tests/python/test_sdk_conformance.py`) and the **JavaScript/WebAssembly package** (`npm install
kshana`; `run`, `connect_map`; `web/sdk-conformance.test.mjs`). The guide to all SDKs is
[`docs/SDK.md`](../../../docs/SDK.md).

## Quick use

```sh
R=../..; OUT=$(mktemp -d); LIB=target/release/libkshana_capi.so
IN="$R/scenarios/link-budget.toml $R/scenarios/attitude-budget.toml $R/scenarios/launch-window.toml \
    $R/examples/connect/timing-monitor.connect.toml $R/examples/obs/station.toml $R/examples/connect/timing-monitor.csv"
python3 -I sdk/python/conformance.py "$LIB" "$OUT" $IN
java --enable-native-access=ALL-UNNAMED sdk/java/KshanaConformance.java "$LIB" "$OUT" $IN
cp sdk/csharp/* /tmp/kshana-cs/ && dotnet run --project /tmp/kshana-cs -- "$LIB" "$OUT" $IN
julia sdk/julia/conformance.jl "$LIB" "$OUT" $IN
(cd "$OUT" && sha256sum -c "$OLDPWD/sdk/conformance/expected.sha256")
```

Licence: AGPL-3.0-only, or a commercial licence from Ashforde OÜ (see the repository's `LICENSING.md`).
