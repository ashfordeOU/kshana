# SDK conformance (roadmap 0.42 I9)

Every Kshana SDK runs the same cases and must give **the same bytes**: three scenarios run to their
result documents, and one Kshana Connect mapping (a CSV log to `kshana.obs/1` records). The cases are
in [`cases.txt`](cases.txt); the SHA-256 of each output is in [`expected.sha256`](expected.sha256).

| Output | Entry point | Inputs (from the repository root) |
|---|---|---|
| `run-1.json` | run a scenario | `scenarios/link-budget.toml` |
| `run-2.json` | run a scenario | `scenarios/attitude-budget.toml` |
| `run-3.json` | run a scenario | `scenarios/launch-window.toml` |
| `map.jsonl` | connect map | `examples/connect/timing-monitor.connect.toml`, `examples/obs/station.toml`, `examples/connect/timing-monitor.csv` |

The three scenarios were chosen because their result documents do not carry the engine version, so the
digests change only when the engine's output for them changes.

## Who checks what

- `capi/kshana-capi/tests/sdk_conformance.rs` (CI job `capi-check`): the Rust reference gives the
  pinned digests; then the C, C++, Python (ctypes), Go, Java (FFM), .NET (P/Invoke) and Julia drivers
  each write the four outputs, and every file must equal the reference byte for byte. A driver whose
  toolchain is missing is skipped locally; CI requires C, C++, Python, Go, Java and .NET
  (`KSHANA_REQUIRE_LANGS=1`, `KSHANA_REQUIRE_SDKS=java,dotnet`). Julia runs wherever `julia` is on the
  path; the runners do not install it yet.
- `tests/python/test_sdk_conformance.py` (the wheel tests): the native Python package gives the same
  digests.
- `web/sdk-conformance.test.mjs` (CI job for the WebAssembly package): the npm package gives the same
  digests in Node.js.
- MATLAB and LabVIEW are not run in CI (no licences on the runners); their drivers are written against
  the same header and can be checked by hand with `sha256sum -c expected.sha256` in the output folder.

## Running a driver by hand

```sh
cd capi/kshana-capi && cargo build --release
R=../..; OUT=$(mktemp -d)
IN="$R/scenarios/link-budget.toml $R/scenarios/attitude-budget.toml $R/scenarios/launch-window.toml \
    $R/examples/connect/timing-monitor.connect.toml $R/examples/obs/station.toml $R/examples/connect/timing-monitor.csv"
python3 -I sdk/python/conformance.py target/release/libkshana_capi.so "$OUT" $IN
(cd "$OUT" && sha256sum -c "$OLDPWD/sdk/conformance/expected.sha256")
```

After a reviewed change to one of these outputs, rewrite the digests with
`KSHANA_SDK_BLESS=1 cargo test --test sdk_conformance` and commit the diff with the change.
