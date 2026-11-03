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
