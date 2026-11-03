# Stability, versioning and long-term support

What Kshana promises to keep working between releases, how it changes it when it must, and when it will call itself 1.0.

## What counts as the public surface

| Surface | Stable item |
| --- | --- |
| Command line | Subcommand names, flags and their meaning, exit codes |
| Scenario files | The TOML schema of every scenario kind, identified by its schema version |
| Results | The JSON result envelope (fields, units, evidence labels) and its schema version |
| Observations | `kshana.obs/1`, the observation schema for station and system data |
| Rust | Public items of the `kshana` crate, including the `api` traits third-party packs implement |
| Python, WebAssembly, MCP | Function and tool names, their arguments and their result shapes |
| Evidence | The meaning of VALIDATED, MODELLED and PARTNER, and that a published miss stays published |

Not covered: internal modules, the layout of HTML reports and of the website, log wording, performance, and anything marked experimental in its documentation.

## Versions

Kshana follows [Semantic Versioning](https://semver.org).

- **Before 1.0** (now): a minor release (0.x.0) may change the public surface, and every such change is listed under **Breaking** in the [changelog](../CHANGELOG.md) with what to do. A patch release (0.x.y) never changes it.
- **From 1.0:** a minor release adds; only a major release (2.0) removes or changes. Results may change in a minor release only to fix a defect, and every such change is listed under **Changed results** with the old and new numbers.

## Deprecation

A public item is deprecated before it is removed. A deprecated item keeps working and prints a warning naming its replacement, for at least two minor releases before 1.0 and until the next major release after it. Scenario files written for an older schema version are upgraded by `kshana scenario migrate`.

## When Kshana becomes 1.0

1.0 is released when all of these hold, and not before:

1. Every scenario file and every result carries a schema version, and `kshana scenario migrate` upgrades every earlier version still in use.
2. The observation schema `kshana.obs/1` is published with its conformance tests.
3. The surface-parity check is green: each capability reachable from a surface behaves the same there.
4. Two consecutive minor releases ship with no breaking change to the public surface.
5. The long-term-support process below has been rehearsed once on a release branch.

## Long-term support (from 1.0)

- Each major release starts with a **long-term-support release**, maintained on its own branch (`lts/1.x`) for **12 months** after the next major or long-term-support release is published.
- During that window it receives patch releases for security fixes, for wrong results (a number that disagrees with its stated method or reference) and for build breakage on supported platforms. It receives no new features.
- Patch releases on that branch go through the same verification, signing and attestation as any other release.

Before 1.0 only the latest release is supported (see [SECURITY.md](../SECURITY.md)).
