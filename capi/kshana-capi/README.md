# kshana-capi: C interface to the Kshana engine

Run Kshana scenarios and map receiver logs from C, or from anything that can call C: C++, Go (cgo),
Java (Panama or JNA), Python (ctypes), MATLAB (`loadlibrary`), LabVIEW (Call Library Function).

```sh
cd capi/kshana-capi
cargo build --release            # target/release/libkshana_capi.a and libkshana_capi.so / .dylib / .dll
cc -I include examples/c/run_and_map.c target/release/libkshana_capi.a -lpthread -ldl -lm -o run_and_map
./run_and_map ../../scenarios/link-budget.toml ../../examples/connect/timing-monitor.connect.toml \
  ../../examples/obs/station.toml ../../examples/connect/timing-monitor.csv
```

The interface is `include/kshana.h`: five functions.

| Function | Does |
|---|---|
| `kshana_version()` | the engine version (static string) |
| `kshana_run_scenario(toml, &json, &err)` | runs a scenario, giving its result document as JSON |
| `kshana_validate_scenario(toml, &json, &err)` | checks a scenario without running it, giving a JSON array of problems |
| `kshana_connect_map(mapping, station, log, &jsonl, &err)` | maps a log to `kshana.obs/1` records (JSON lines) |
| `kshana_string_free(s)` | frees a string the library returned |

Every function returns `KSHANA_OK`, `KSHANA_ERROR` (the engine refused the input and the error string
says why), `KSHANA_BAD_ARGUMENT` (a null pointer, non-UTF-8 text, or an input over 64 MiB) or
`KSHANA_INTERNAL`. Calls are safe from several threads at once. Free every returned string with
`kshana_string_free`, never `free`.

Why this is a separate crate, and how its unsafe code is kept sound: [SAFETY.md](SAFETY.md).
Licence: AGPL-3.0-only, or a commercial licence from Ashforde OÜ (see the repository's `LICENSING.md`).
