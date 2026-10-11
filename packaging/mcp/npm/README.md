# kshana-mcp (launcher)

Runs the [Kshana](https://kshana.dev) MCP server without installing it first:

```sh
npx -y kshana-mcp@0.35.0
```

This package holds no server code. On first run it downloads the prebuilt `kshana-mcp` binary of the **same
version** from the project's GitHub release, checks it against the release's `SHA256SUMS` (a mismatch is a refusal,
not a warning), caches it under `~/.cache/kshana-mcp/<version>/` and runs it, passing its standard input and output
straight through. Supported: Linux x86-64 and Arm64, macOS (Apple silicon and Intel), Windows x86-64. Elsewhere use
the Docker image or `cargo install kshana-mcp`.

* The checksum protects the download. For the build provenance of the same file, run
  `gh attestation verify <file> --repo ashfordeOU/kshana`.
* `KSHANA_MCP_CACHE_DIR` moves the cache; `KSHANA_MCP_RELEASE_BASE` points at a mirror of the release assets.
* Every other install option: https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md

Advisory, not type-approved navigation equipment: the operator remains responsible for navigation.
Licence: AGPL-3.0-only (a commercial licence is available from Ashforde OÜ).
