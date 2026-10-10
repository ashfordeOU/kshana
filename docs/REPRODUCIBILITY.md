<!-- SPDX-License-Identifier: AGPL-3.0-only -->
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
| Same scenario, same machine → byte-identical `result.json` | **Yes** | `scripts/check-reproducible.sh` (runs the reference scenario twice, compares the SHA-256 (SHA: Secure Hash Algorithm)) |
| Same scenario → identical figures of merit field-by-field | **Yes, per platform** | `tests/golden.rs` pins every figure of merit (FoM) for the four reference scenarios |
| Scenario input hash (`scenario_hash`) is platform-independent | **Yes** | content-addressed SHA-256 of the canonical scenario, pinned in `tests/golden.rs` |
| Input fingerprint + output **shape** identical across OS (operating system) | **Yes** | `tests/cross_platform_golden.rs` pins an exact SHA-256 per scenario (ten scenarios, one `.sha256` file each in `tests/golden/`), checked on the 3-OS CI (continuous integration) matrix |
| Output **values** agree across OS (ubuntu/macOS/Windows) | **Yes, to 1e-6** | the `reproducibility-matrix` CI job runs `golden.rs` (1e-6), `sgp4_verification.rs` (2e-5 km), and `determinism.rs` on all three OS |
| A low Earth orbit (LEO) navigation-message frame is the same bytes on every platform and in every build profile, the WebAssembly (WASM) build included | **Yes** | `src/portable_math.rs` (every transcendental and every normal deviate of the `leo-navmsg` kind goes through the pure-Rust `libm` crate); `leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform` pins a whole frame with no platform gate |
| Seeded index draws (bootstrap resampling, shuffles) are the same on 32-bit and 64-bit targets | **Yes** | `portable_math::uniform_index` always samples as `u64`; pinned in `portable_math::tests` |
| Same toolchain everywhere | **Yes** | `rust-toolchain.toml` pins the channel; `scripts/check-toolchain.sh` fails the build on drift; CI and release pin the same version |
| Same dependency set | **Yes** | `Cargo.lock` is committed and `cargo metadata --locked` is used for the SBOM (software bill of materials) |

Every command-line run also writes a reproducibility record into its report
(`<scenario>.report.json` and `.report.html`): the engine version, the SHA-256 of the
scenario file and of the result document, the seed, the platform and the exact command,
which `tests/advanced_report_cli.rs` re-runs to a byte-identical result. The report is
itself a pure function of the run: two runs of `scenarios/clock-holdover.toml` write the
same `report.json` byte for byte. See
[REPORTS.md](REPORTS.md).

## The cross-platform caveat (and how goldens handle it)

The numerical results are **bit-identical on a given platform** but may differ
in the last few units in the last place (ULP) **between** platforms. The cause
is the platform math library: `sqrt`, `ln`, `exp` and friends are not required
by IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) to be correctly rounded, so Linux (glibc, the GNU C library), macOS, and Windows can
each return a different last bit. Over a long run these ~1e-16 differences
accumulate to perhaps ~1e-12 relative.

Two things make that last-place difference larger than it starts, and both are
measured rather than assumed. An **adaptive integrator** chooses its next step from the
error estimate through a fifth root, so one unit in the last place changes the step
sequence and the two platforms then agree only to the integration tolerance. An
**iterative estimator** (a least-squares fit, an orbit-determination filter) can take a
different path to convergence. Kinds built on either can differ between platforms by
more than 1e-6 in individual fields; `src/test_support.rs` records the same regime for
the unit tests.

The **build profile** matters in the same way, on one machine. An optimised build on
macOS merges a sine and a cosine of one argument into a single call to the system's
combined routine, whose sine differs from the lone `sin` in the last bit for 379 of
200 000 arguments; an unoptimised build makes the two calls. Measured on aarch64 macOS
over the 138 scenario files, a debug and a release build of one source give
byte-identical result documents for 102. The other 36 differ in the last places: 28
within 1e-6, one (`leo-ppp-convergence`) by 2.8e-6, and seven campaigns only in the
digests of their member runs; none differs in a label, a count or a verdict. The
byte-identity guarantee above is therefore for one build: the same binary twice.

The seeded **normal draws** are a third, much rarer source: the sampler calls the host
exponential and logarithm in its rare branches, and about one draw in a million differs
in the last bit between the native and the WASM build.

Where an output is **discrete**, a last-place difference is not acceptable at all, and
the kind is computed with `src/portable_math.rs` instead of the host library. The
`leo-navmsg` kind is the first: its binary frame is transmitted integers, and the same
scenario once encoded to three different frames: in a release build, in a debug build
of the same source, and in the browser. It is now the same bytes in all three.

Because of this, the golden tests do **not** pin a single cross-platform hash of
the floating-point output — that would be fragile and would fail honestly-correct
builds on a different OS. Instead:

- **`tests/golden.rs`** pins each figure of merit with a relative tolerance of
  `1e-6` — four orders of magnitude tighter than any real regression (which
  moves a value by whole percent) yet far looser than cross-platform math-library
  (libm) jitter. Grid-bounded fields (holdover seconds) and exact-zero fields are
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
  the numerics to 1e-6, and the SGP4 (Simplified General Perturbations 4) states to 2e-5 km — rather than relying on a
  single OS.

If you need to regenerate the pinned numbers (e.g. after an intentional model
change), run each reference scenario and copy the printed FoM values into
`tests/golden.rs`, then note the change in `CHANGELOG.md`.

## Software bill of materials (SBOM)

`scripts/gen-sbom.sh` emits a CycloneDX 1.5 SBOM listing every crate that ships
in a kshana artifact, with its exact version, source, and license. It is a
dependency-free generator built on `cargo metadata --locked` (so it works with
just the toolchain), and it walks the resolve graph from the kshana package
through normal and build dependencies only. Dev-dependencies (test-only crates
such as `sgp4`) are excluded because no artifact contains them.

The graph is the union of the feature sets the shipped artifacts are built with:
the default build (library and CLI (command-line interface)), `--features python` (the PyPI (Python Package Index) wheel, whose
`pyo3` chain is its foreign-function boundary) and `--features wasm` (the npm
package, which carries this same SBOM inside its tarball). Platform-conditional
dependencies for every target are included, since the wheels ship for several
operating systems and the npm package targets WebAssembly. One document covers
all three artifacts, so for any single one it is a superset. It currently lists
86 components; the count is pinned in
`tests/fixtures/reproducibility_software_assurance/`. The standalone
`kshana-mcp` server has its own manifest and is not described by this SBOM.

The output is deterministic — the same dependency set yields a byte-identical
document, including a serial number derived from the sorted package list rather
than a timestamp.

The release workflow generates the SBOM (`kshana-sbom.cdx.json`) and attaches it
to every tagged release; the publish workflow also ships it beside the PyPI
wheels and inside the npm package.

## Build provenance

The release workflow produces a SLSA (Supply-chain Levels for Software Artifacts) build-provenance attestation
(`actions/attest-build-provenance`) covering every file it attaches to the GitHub
Release: the command-line binaries for each platform, the `kshana-mcp` server binary,
the SBOM, the validation summary and `SHA256SUMS`. A consumer can verify, with `gh attestation verify`, that the artifacts
were built by this repository's release workflow from this source — closing the
gap between "here is a binary" and "here is a binary I can trace to its source". For
example, for the SBOM of v0.28.0:

```bash
curl -sLO https://github.com/AshfordeOU/kshana/releases/download/v0.28.0/kshana-sbom.cdx.json
gh attestation verify kshana-sbom.cdx.json --repo AshfordeOU/kshana
```
