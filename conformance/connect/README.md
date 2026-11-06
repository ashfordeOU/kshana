# Connect conformance vectors

Each folder holds a `vector.toml`: an input, how to read it (a `kshana.connect/1` mapping file or
a built-in reader), the station, and the `kshana.obs/1` file it must give, byte for byte.

```sh
kshana connect check conformance/connect          # every vector; exit 1 on any difference
kshana connect check conformance/connect --bless  # record the expected outputs (review the diff!)
```

`tests/connect_conformance.rs` runs the whole folder in CI. A new adapter (a reader or a mapping
file) comes with its vector here. The inputs are illustrative files from `examples/`, never
customer data.

## Live paths (A7b)

```sh
kshana connect check-live conformance/connect          # every vector with a mapping file; exit 1 on any failure
kshana connect check-live conformance/connect --json   # the same, as JSON
```

Each vector with a mapping file and a streamable format (`csv`, `tsv`, `jsonl`) is replayed one row per
message over three live paths: MQTT (a loopback broker that alternates QoS 0 and 1 and drops the line
half-way), WebSocket (a loopback server that closes at the end) and the directory watch. A path passes
when its epochs equal the expected file in content and order, exactly one epoch is released at the end,
MQTT reconnected exactly once, and the 99th-percentile latency from send to records is at most 250 ms.
Both ends run in one process, so the latency is the client's own cost. `tests/connect_live.rs` runs it
in CI, together with a vector whose expected file is wrong, which must fail at the epoch that differs.
