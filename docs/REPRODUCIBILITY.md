<!-- SPDX-License-Identifier: Apache-2.0 -->
# Reproducibility & provenance

Kshana is built to be reproducible: the same inputs produce the same results,
and the build artifacts can be traced back to the source that produced them.
This document states exactly what is guaranteed, what is not, and how the
guarantees are enforced.

## Determinism guarantees

The engine has no wall-clock, no thread-of-execution dependence, and no
unseeded randomness. Every stochastic process is driven by a `ChaCha8Rng`
stream keyed by the scenario `seed`, drawn in a fixed order. Consequences:

| Property | Guaranteed | Enforced by |
|---|---|---|
| Same scenario, same machine → byte-identical `result.json` | **Yes** | `scripts/check-reproducible.sh` (runs the reference scenario twice, compares the SHA-256) |
| Same scenario → identical figures of merit field-by-field | **Yes, per platform** | `tests/golden.rs` pins every FoM for the four reference scenarios |
| Scenario input hash (`scenario_hash`) is platform-independent | **Yes** | content-addressed SHA-256 of the canonical scenario, pinned in `tests/golden.rs` |
| Input fingerprint + output **shape** identical across OS | **Yes** | `tests/cross_platform_golden.rs` pins an exact SHA-256 per scenario in `tests/golden/`, checked on the 3-OS CI matrix |
| Output **values** agree across OS (ubuntu/macOS/Windows) | **Yes, to 1e-6** | the `reproducibility-matrix` CI job runs `golden.rs` (1e-6), `sgp4_verification.rs` (2e-5 km), and `determinism.rs` on all three OS |
| Same toolchain everywhere | **Yes** | `rust-toolchain.toml` pins the channel; `scripts/check-toolchain.sh` fails the build on drift; CI and release pin the same version |
| Same dependency set | **Yes** | `Cargo.lock` is committed and `cargo metadata --locked` is used for the SBOM |

## The cross-platform caveat (and how goldens handle it)

The numerical results are **bit-identical on a given platform** but may differ
in the last few units in the last place (ULP) **between** platforms. The cause
is the platform math library: `sqrt`, `ln`, `exp` and friends are not required
by IEEE-754 to be correctly rounded, so Linux glibc, macOS, and Windows can
each return a different last bit. Over a long run these ~1e-16 differences
accumulate to perhaps ~1e-12 relative.

Because of this, the golden tests do **not** pin a single cross-platform hash of
the floating-point output — that would be fragile and would fail honestly-correct
builds on a different OS. Instead:

- **`tests/golden.rs`** pins each figure of merit with a relative tolerance of
  `1e-6` — four orders of magnitude tighter than any real regression (which
  moves a value by whole percent) yet far looser than cross-platform libm
  jitter. Grid-bounded fields (holdover seconds) and exact-zero fields are
  pinned exactly.
- **`scenario_hash`** — a content hash of the *inputs* — is platform-independent
  and pinned exactly.
- **`tests/cross_platform_golden.rs`** pins an exact SHA-256, committed per
  scenario in `tests/golden/`, over the projection that *is* identical across
  platforms: the input fingerprint plus the output **shape** (field names,
  nesting, leaf types, array lengths — fixed by deterministic grid arithmetic,
  never the float values). This catches structural regressions exactly while the
  tolerance pins above catch value regressions.
- **`scripts/check-reproducible.sh`** enforces byte-identical output across two
  runs *on the same machine* (the determinism guarantee).
- **The `reproducibility-matrix` CI job** runs the four tests above
  (`cross_platform_golden`, `golden`, `determinism`, `sgp4_verification`) on
  **ubuntu-latest, macos-latest, and windows-latest**, so cross-platform
  reproducibility is asserted on every push — the shape/input goldens exactly,
  the numerics to 1e-6, and the SGP4 states to 2e-5 km — rather than relying on a
  single OS.

If you need to regenerate the pinned numbers (e.g. after an intentional model
change), run each reference scenario and copy the printed FoM values into
`tests/golden.rs`, then note the change in `CHANGELOG.md`.

## Software bill of materials (SBOM)

`scripts/gen-sbom.sh` emits a CycloneDX 1.5 SBOM enumerating every crate in the
locked dependency graph with its exact version, source, and license. It prefers
`cargo cyclonedx` when installed and otherwise falls back to a dependency-free
generator built on `cargo metadata --locked` (so it always works with just the
toolchain). The output is deterministic — the same dependency set yields a
byte-identical document, including a serial number derived from the sorted
package list rather than a timestamp.

The release workflow generates the SBOM (`kshana-sbom.cdx.json`) and attaches it
to every tagged release.

## Build provenance

The release workflow produces a SLSA build-provenance attestation
(`actions/attest-build-provenance`) covering both the release binary and the
SBOM. A consumer can verify, with `gh attestation verify`, that the artifacts
were built by this repository's release workflow from this source — closing the
gap between "here is a binary" and "here is a binary I can trace to its source".
