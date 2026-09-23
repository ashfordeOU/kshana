# Security policy

## Reporting a vulnerability
Email **contact@ashforde.org** with details and reproduction steps. Please do not open
a public issue for security-sensitive reports. We aim to acknowledge within a few
business days.

## Supported versions
Pre-1.0: only the latest tagged release is supported.

## Memory safety
The library crate declares `#![forbid(unsafe_code)]` at its crate root (`src/lib.rs`), so
an `unsafe` block, fn, impl or extern anywhere in the library is a compile error rather
than something a reviewer has to catch. The attribute is not behind a `cfg`, so it applies
to every configuration the library ships in, and all three compile clean under it: the
default Rust build, the Python extension module (`--features python`) and the WebAssembly
module (`--features wasm`).

Scope, stated precisely, because `forbid` is per-crate:

- It governs the library crate only. The CLI binary (`src/main.rs`), the helper binaries
  under `src/bin/`, the separately published `kshana-mcp` crate and the workspace-excluded
  `xval/` cross-validation crates are separate crate roots and are not covered by it. None
  of them contains `unsafe` today, but that is discipline, not a compiler-enforced property.
- It says nothing about dependencies. Those are gated separately by
  `cargo deny check advisories licenses bans sources` in CI.

## Export control / dual-use note
PNT resilience and quantum sensing can fall under dual-use export controls. This public
repository is limited to generic, published models and methods. Do not contribute
export-sensitive resilience or anti-spoofing detail here; it belongs in a private
overlay. If unsure, email first.
