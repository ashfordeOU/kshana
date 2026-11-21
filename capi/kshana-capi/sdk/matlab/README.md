# Kshana from MATLAB

A small MATLAB package, `+kshana`, over the five functions of the C interface
([`../../include/kshana.h`](../../include/kshana.h)), loaded with MATLAB's `loadlibrary` and called with
`calllib`. No MEX gateway is needed. No simulation logic lives here: every number comes from the engine.

**Not run on the target tool.** No MATLAB licence is available on the CI runners and this package has
not been run in MATLAB. What is tested: the exact C call sequence the package makes (UTF-8 inputs with a
NUL, `void**` out-parameters, the byte-by-byte length scan, one `kshana_string_free` per returned
pointer, the three error codes) is replayed with Python `ctypes` by
[`../python/wrapper_patterns.py`](../python/wrapper_patterns.py), which `tests/sdk_wrappers.rs` runs in
the `capi-check` CI job; the same test checks that every `calllib` name in these files is declared in
the header. Please report what you find when you run it.

## Set up

```sh
cd capi/kshana-capi && cargo build --release
# target/release/libkshana_capi.so (Linux), libkshana_capi.dylib (macOS) or kshana_capi.dll (Windows)
```

```matlab
addpath('capi/kshana-capi/sdk/matlab')                % the folder that holds +kshana
kshana.loadLibrary('capi/kshana-capi/target/release/libkshana_capi.so')
r = kshana.run(fileread('scenarios/link-budget.toml'));
r.margin_db                                           % 92.12 (dB) for the shipped scenario
kshana.unloadLibrary()
```

`loadlibrary` parses the C header, and on 64-bit MATLAB that needs a supported C compiler (`mex -setup
C`; MinGW-w64 on Windows, the system compiler on Linux and macOS). The header is plain C99 with no
structs, so any supported compiler works. [`kshana_quickstart.m`](kshana_quickstart.m) runs every
function once on the repository's files.

## Functions

| Function | Returns | C function |
|---|---|---|
| `kshana.loadLibrary(lib[, header])` | nothing; loads under the alias `kshana_capi` | `loadlibrary` |
| `kshana.unloadLibrary()` | nothing | `unloadlibrary` |
| `kshana.version()` | the engine version (char) | `kshana_version` |
| `[result, json] = kshana.run(toml)` | the result document as a struct (`jsondecode`) and as JSON text | `kshana_run_scenario` |
| `problems = kshana.validate(toml)` | a cell array of problem strings, `{}` when valid | `kshana_validate_scenario` |
| `[records, jsonl] = kshana.connectMap(mapping, station, logText)` | a cell array of structs (header, then epochs) and the JSON-lines text | `kshana_connect_map` |

Inputs are text (`char` or `string`), passed as UTF-8. An input the engine refuses raises
`kshana:error` with the engine's reason, for example `kshana error 1 (KSHANA_ERROR): range_km must be
finite and positive`; catch it with `try ... catch err` and read `err.message`. Every string the
library returns is copied and freed with `kshana_string_free` before the function returns or raises.

Notes:

- `jsondecode` turns field names that are not valid MATLAB identifiers into valid ones (a dot becomes
  an underscore, for example). Use the `json` output with your own parser when you need the exact names.
- Long results are copied one byte at a time (the length is not known in advance): a large result
  takes noticeably longer than in C. For bulk work use the Python package (`pip install kshana`) or
  the command line.
- Inputs are encoded as UTF-8 from MATLAB text. Scenario files are UTF-8; when one holds non-ASCII
  characters and MATLAB's default character encoding is not UTF-8, read it with
  `fopen(path, 'r', 'n', 'UTF-8')` and `fread(fid, '*char')'` instead of `fileread`.
- GNU Octave has no `loadlibrary`, so this package does not run in Octave.

## Other files

- [`kshana_conformance.m`](kshana_conformance.m): the SDK conformance driver (writes the four outputs
  of [`../conformance/cases.txt`](../conformance/cases.txt) for `sha256sum -c`).
- [`docs/teaching/`](../../../../docs/teaching/README.md): three lab sheets with worked answers and a
  MATLAB solution script for each.

Licence: AGPL-3.0-only, or a commercial licence from Ashforde OÜ (see the repository's `LICENSING.md`).
