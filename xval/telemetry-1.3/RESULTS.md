# Results: telemetry schema 1.3 through four consumers

Pre-registration: `PREREGISTRATION.md` (fb226057), committed alone. The corpus, the crate's
outputs, the comparison tests and the run script were committed in d9872223 before any tool
read a schema-1.3 output. Judged by `tests/telemetry_formats_reference.rs`.

## Reproduce

```sh
KSHANA_XVAL_WRITE=1 cargo test --features otlp --test telemetry_formats_reference schema_13_stream
cargo run --example gen_telemetry_oracle_inputs --features otlp   # exposition.prom, otlp.json
bash xval/telemetry-1.3/run.sh                                    # data-gated: fetches the tools
cargo test --features otlp --test telemetry_formats_reference
```

## Outcome (first run, 2026-10-14)

| Bar | Result |
|---|---|
| O1 prometheus_client 0.26.0 | 24 families, 54 samples, all equal to the registry-implied set exactly, geometry families and `class` labels included |
| O2 opentelemetry-proto 1.45.1, strict | 12 metrics, 31 points, all equal exactly, geometry metrics included |
| O3 promtool 3.5.0 `check metrics` | exit 0, no output (no parse error, no lint problem) |
| O4 OpenTelemetry Collector contrib 0.135.0, OTLP/HTTP to file exporter | status 200, `{"partialSuccess":{}}`; the exported request equals O2's reading exactly |

**Verdict:** VALIDATED for these four consumers (syntax, names, types, help, labels and values
of the Prometheus exposition and the OTLP/HTTP JSON of a schema-1.3 stream; acceptance and
lossless pass-through by a real Collector). Not covered: delivery, retries and timeouts of the
live exporter; the Collector's `prometheus` receiver; dashboard fitness; CEF and LEEF.
Data-gated: the run needs the two release downloads (digests pinned in `run.sh`); CI compares
the committed outputs only.
