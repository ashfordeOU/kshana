# Kshana SDKs

Every SDK is a thin layer over the same engine: no simulation logic lives in any of them, and each one
runs the same three conformance scenarios and the same Kshana Connect mapping with **identical bytes**
(roadmap 0.42 I9; [`capi/kshana-capi/sdk/conformance/`](../capi/kshana-capi/sdk/conformance/README.md)).

| SDK | Install | Entry points used by the conformance cases | Conformance run |
|---|---|---|---|
| Rust | `cargo add kshana` | `kshana::api::run_toml`, `kshana::surface::connect_map` | the reference (`capi/kshana-capi/tests/sdk_conformance.rs`) |
| Python (native) | `pip install kshana` | `kshana.run`, `kshana.connect_map` | `tests/python/test_sdk_conformance.py` |
| JavaScript / WebAssembly | `npm install kshana` | `run`, `connect_map` | `web/sdk-conformance.test.mjs` |
| C, C++ | build `capi/kshana-capi` | `kshana_run_scenario`, `kshana_connect_map` | `capi-check` CI job |
| Python (ctypes), Go (cgo), Java (FFM), .NET (P/Invoke), Julia (ccall) | build `capi/kshana-capi` | the same C functions | `capi-check` (Julia when installed) |
| MATLAB, LabVIEW | build `capi/kshana-capi` | the same C functions | by hand (no licences on the runners) |

The wrappers over the C interface are in [`capi/kshana-capi/sdk/`](../capi/kshana-capi/sdk/README.md);
the interface itself is [`capi/kshana-capi/include/kshana.h`](../capi/kshana-capi/include/kshana.h).

## Python

```python
import json, kshana

result = json.loads(kshana.run(open("scenarios/link-budget.toml").read()))
records = kshana.connect_map(
    open("examples/connect/timing-monitor.connect.toml").read(),
    open("examples/obs/station.toml").read(),
    open("examples/connect/timing-monitor.csv").read(),
)
print(len(records.splitlines()), "kshana.obs/1 lines")
```

The full Python surface is in [`PYTHON_API.md`](PYTHON_API.md) and `kshana.pyi`.

## JavaScript and WebAssembly (Node.js or a browser)

```js
import { readFile } from "node:fs/promises";
import init, { run, connect_map } from "kshana";

// In a browser `await init()` is enough; in Node.js pass the module's bytes.
await init({ module_or_path: await readFile("node_modules/kshana/kshana_bg.wasm") });
const result = JSON.parse(run(await readFile("scenarios/link-budget.toml", "utf8")));
```

Nothing is uploaded: the engine runs inside the page or the Node.js process.

## C and languages that call C

```c
char *json = NULL, *err = NULL;
if (kshana_run_scenario(toml, &json, &err) == KSHANA_OK) { /* use json */ }
kshana_string_free(json);
kshana_string_free(err);
```

Each language wrapper (C++, Python ctypes, Go, Java, .NET, Julia, MATLAB) and the LabVIEW node
configuration is in [`capi/kshana-capi/sdk/`](../capi/kshana-capi/sdk/README.md), with the commands
that build and run it.

## Other interfaces

- The MCP server (`kshana-mcp`) for AI assistants: [`MCP-INSTALL.md`](MCP-INSTALL.md).
- The HTTP surfaces (Station status port, metrics endpoint, MCP over HTTP) are described in
  OpenAPI 3.1: [`api/openapi.json`](api/openapi.json) ([`api/README.md`](api/README.md)).

## Not yet

- Java through JNI, a published Maven package and a published NuGet package: the wrappers are source
  files to copy into a project.
- A MATLAB MEX gateway: `loadlibrary` is used instead.
- Julia and MATLAB are not run in CI.
