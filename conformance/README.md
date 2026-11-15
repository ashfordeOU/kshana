# Kshana Connect conformance kit v2

Every connector of the open engine, the vectors that check it byte for byte, and a script that runs
them all **offline** (roadmap 0.42 I12). For a third party: clone the repository, build or install the
`kshana` command, and run

```sh
conformance/run-kit.sh             # kshana on PATH
conformance/run-kit.sh ./kshana    # or a given binary
```

It runs `kshana connect check` (readers, track decoders, exports and mapping files), `kshana connect
check-live` (the mapping vectors over MQTT, WebSocket and the directory watch, and the receiver readers
over the stream path; the servers are loopback servers inside the process) and `kshana connect timing
check` (the timing parsers). It reads only this folder, `examples/` and `tests/fixtures/`, and fetches
nothing. Exit status 0 means every vector passed on every path.

| File | What it is |
|---|---|
| [`kit.toml`](kit.toml) | the index: one `[[connector]]` per connector, with its kind, roadmap row, vector folders, live path, and, for connectors with no file vector, the test that checks them |
| [`connect/`](connect/README.md) | vectors whose output is a `kshana.obs/1` file, a `kshana.tracks/1` file or an export (GeoJSON, KML, CZML, CSV) |
| [`timing/`](timing/) | vectors of the timing parsers (JSON documents) |
| [`tools/`](tools/) | the generators of the synthetic inputs (`gen_042_vectors.py`, `gen_kit_v2_inputs.py`; the four binary receiver streams are written by `tests/obs_live.rs`) |
| [`run-kit.sh`](run-kit.sh) | the offline runner |

`tests/conformance_kit_v2.rs` holds `kit.toml` to the code: every receiver reader, track decoder,
export form, mapping source format and timing parser the code makes must be listed and must have a
vector that names it; every vector folder must be listed; every vector must pass; and `live = "stream"`
must be exactly where check-live's stream path runs.

## What the kit does not cover with file vectors

Network clients and outputs that need a server or a schema on the other side (SigMF, the ops outputs
such as OTLP, syslog, CEF, webhooks, CAP, STIX and TAXII, the Modbus, DNP3 and OPC UA clients, the CCSDS
packet, XTCE, COSMOS and Open MCT definitions, ADM and SP3 write, the NATS input) are listed in
`kit.toml` with `vectors = []` and the test that checks each against a reference implementation, a
schema or an in-process fake. They run with `cargo test` from a checkout, not with `run-kit.sh`.

The inputs are synthetic or public (each folder added in 0.42 has a `SOURCE.md`, or the generator says
where its input came from); none is customer data.
