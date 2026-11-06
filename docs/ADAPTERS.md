# Adapters: new devices and formats without engine changes

An adapter teaches Kshana to read a device's or a logger's export, by configuration only. Each one is a
folder under [`adapters/`](../adapters/) that the registry checks on every change.

```sh
kshana connect adapters list adapters      # the adapters that pass
kshana connect adapters check adapters     # validate every manifest and run every vector; exit 1 on any failure
```

## What an adapter holds

```
adapters/<name>/
  adapter.toml        the manifest (below)
  <name>.connect.toml the kshana.connect/1 mapping file (docs/CONNECT.md)
  sample.csv          a sample log you may share: no customer data, no personal data
  vector.toml         a conformance vector: the sample, the mapping, a station, the expected output
  expected.obs.jsonl  the kshana.obs/1 records the mapping must give, byte for byte
```

The files may also live elsewhere in the repository; the manifest's paths are relative to it. The
bundled examples point at `examples/connect/` and `conformance/connect/`.

```toml
schema = "kshana.adapter/1"
name = "timing-monitor"                  # lower-case letters, digits and -; unique
title = "A timing receiver's monitoring export (...)"
kind = "mapping"                         # the only kind so far
mapping = "timing-monitor.connect.toml"
vector = "vector.toml"
maintainer = "Your name or organisation"
licence = "AGPL-3.0-only"                # SPDX id of the adapter's files
status = "community"                     # example | community | maintained
# reference = "https://..."              # the format's public documentation, if any
```

## What the check refuses

- A manifest that does not parse, has an unknown field, the wrong `schema`, a bad `name`, `kind` or
  `status`, or an empty `title`, `maintainer` or `licence`.
- A mapping file that does not load.
- A vector that does not run, that uses a mapping other than the adapter's own, or whose output differs
  from its expected file (the first differing line is named).
- Two adapters with the same name.

`tests/adapters.rs` runs the check on the registry and on deliberately broken adapters, one for each
refusal above.

## Writing one

1. Write the mapping for your export (`docs/CONNECT.md`), and try it:
   `kshana connect map sample.csv --mapping <name>.connect.toml --station station.toml`.
2. Write the vector and record its expected output:
   `kshana connect check vector.toml --bless`. Read the output before you commit it.
3. Write `adapter.toml`, then run `kshana connect adapters check adapters`.
4. Open a pull request with the folder, using the "Adapter submission" issue template if you want to
   discuss it first. Contributions are licensed as `CONTRIBUTING.md` describes, with signed-off
   commits.

## Planned

Runtime plug-ins (WebAssembly or Python) for formats a mapping cannot express, on the same manifest
with a new `kind`. Binary formats are read by built-in readers today (`kshana obs convert`).
