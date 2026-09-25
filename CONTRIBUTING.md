# Contributing to Kshana

Thanks for your interest. Kshana aims to be a **neutral, reproducible, honestly-
validated** reference for hybrid quantum/classical PNT. Contributions are held to that
bar: correctness, citations, and reproducibility over breadth.

How the project is governed — who decides, the technical bar, and the open/closed
boundary — is documented in [`GOVERNANCE.md`](GOVERNANCE.md).

## Development

```bash
cargo build
cargo test          # all tests must pass
cargo clippy        # keep it warning-clean
cargo fmt
```

The optional language bindings are feature-gated and off by default (so the build
above and the dependency-audit gate never touch them). To work on them:

```bash
maturin develop --features python                 # Python extension (needs maturin)
wasm-pack build --target web -- --features wasm    # WebAssembly module
cargo clippy --features python --features wasm     # lint the binding modules
```

## Before every commit — the fast loop

These take seconds. They are a subset of `ci.yml`'s `check` job, in the same order, so
a failure here is a failure there:

```bash
cargo fmt --all -- --check
cargo clippy --all-targets -- -D warnings
./scripts/check-reproducible.sh     # reference scenario is byte-identical across runs
./scripts/check-no-attribution.sh   # repo hygiene (see below)
./scripts/check-version-sync.sh     # every version surface agrees with Cargo.toml
./scripts/check-doc-coverage.sh     # missing-docs ratchet: the count may fall, never rise
```

- **Reproducibility is a hard invariant.** A change that makes `(scenario, seed,
  version)` non-deterministic is a bug. Randomness must flow through the seeded RNG;
  quantum and classical runs use independent, deterministically-derived seeds.
- **Repository hygiene.** Commits and content must carry no automated-tool attribution
  trailers or footers, and must not name an AI assistant as an author anywhere in
  content, file names, or history. The guard enforces this.

## Before you push — the full gate

`scripts/gate.sh` is the canonical gate: it runs `cargo test --all` unabridged, then
`scripts/check-repeatability.sh` to re-run the library suite a few more times, because a
thread-interleaving race is invisible to a single run. Only on success does it write
`.gate-receipt.json` (untracked — machine state about one run, not content).

```bash
scripts/gate.sh
REPEAT=0 scripts/gate.sh           # canonical suite only, no repeatability loop — a LOCAL
                                   # shortcut: the pre-push gate refuses its receipt unless
                                   # KSHANA_MIN_REPEAT_RUNS=0 is also set on the push
TEST_THREADS=6 scripts/gate.sh     # cap per-binary concurrency if the run is memory-starved
scripts/check-gate-receipt.sh      # is there a valid receipt for the commit being pushed?
scripts/install-gate-hook.sh --check   # is the pre-push hook installed on this clone?
```

It is slow on purpose — 62-79 minutes in the healthy steady state, per the header of
`scripts/gate.sh`, which carries the current figure — and there is no timeout, because
a timeout short enough to be useful would kill a healthy run. A subset run that came
back green is not a gate: both of the defects this mechanism exists for reached it
that way.

Contributors working from a fork do not need the receipt hook — it is a local
maintainer gate, and **CI is what actually gates a pull request**. Running `gate.sh`
before you open one simply means CI tells you nothing you did not already know.

## Adding or changing a sensor model

1. **Every numeric parameter needs provenance.** Put the citation in the model's
   `provenance` string and the scenario file. No anonymous constants.
2. **Validate against the standard relation,** not just internal consistency — e.g.
   Allan deviation for clocks, Groves' dead-reckoning error growth for inertial, the
   timing→ranging conversion for time transfer. Add a test that the simulated output
   reproduces the published/relation value within a stated tolerance.
3. **Be honest about maturity.** The status registry is
   `src/verification.rs::verification_matrix()` — add or amend the row there, name its
   external oracle (or say plainly that there is none, which makes it `Modelled`), then
   regenerate the published artifacts with `cargo run --bin gen_validation_artifacts`.
   `docs/VERIFICATION-MATRIX.md`, `docs/MODELLED-RATIONALE.md` and
   `web/data/verification-matrix.json` are all generated from that function and say
   "do not edit by hand" for a reason. Update the `docs/VALIDATION.md` narrative as
   well when the prose needs it, and label figures that are targets or ground-
   demonstrator results as such.

## Tests

- Test-driven: write the failing test first, with the expected value **derived by
  hand** from the physics/relation before implementing.
- Deterministic tests assert exact (hand-derived) values; statistical tests assert a
  stated tolerance and, ideally, average over seeds to control scatter.

## Commits and versioning

- **Conventional Commits** (`feat:`, `fix:`, `docs:`, `test:`, `chore:` …).
- **Semantic Versioning.** Pre-1.0, the scenario/result schema may change; call out
  breaking changes.
- **Releases are cut by pushing a `vX.Y.Z` tag, and publishing is automatic but
  ordered.** The Release workflow runs the full verification on the tagged commit, and
  only when it passes does it publish to crates.io, the Python Package Index (PyPI), npm,
  ghcr.io, the Model Context Protocol (MCP) registry and the JetBrains Marketplace; it
  then checks every channel serves the version and rebuilds kshana.dev from the tag. Nobody runs `cargo publish` by hand. The steps, and
  how to retry a failed publish, are in [`docs/RELEASING.md`](docs/RELEASING.md).

## Changelog maintenance (required)

Every user-visible change updates [`CHANGELOG.md`](CHANGELOG.md):

1. Add an entry under the **`[Unreleased]`** section, in the right group
   (`Added` / `Changed` / `Fixed` / `Removed` / `Documented` / `Planned`).
2. On release, rename `[Unreleased]` to the new `[x.y.z] - YYYY-MM-DD`, start a fresh
   `[Unreleased]`, bump the `version` in `Cargo.toml` (so `engine_version` in result
   JSON matches), update the compare links at the bottom, and tag `vx.y.z`.
3. Keep entries terse and user-facing; link issues/PRs where useful.

A pull request that changes behaviour without a changelog entry is incomplete.

## Export control

PNT resilience and quantum sensing can touch dual-use export controls. Keep the public
repository to generic, published models and methods. Anything resembling
export-sensitive resilience/anti-spoof depth belongs in the private overlay, not here.
If unsure, ask before contributing it.

## License

Kshana is dual-licensed (AGPL-3.0 **or** a commercial licence from Ashforde OÜ — see
[`LICENSING.md`](LICENSING.md)). For that to keep working, contributions must be
usable under **both** licences. So, by contributing, you agree that:

1. your contribution is licensed inbound under the **AGPL-3.0-only**; and
2. you **also grant Ashforde OÜ** a perpetual, worldwide, royalty-free, irrevocable
   licence to use, modify, and **relicense your contribution as part of Kshana's
   commercially-licensed edition** (i.e. to also distribute it under non-AGPL
   commercial terms). You retain copyright in your contribution.

This lightweight dual-licence grant — not a copyright assignment — is what lets the
project stay open *and* offer a commercial edition. If you cannot grant (2) (for
example, employer-owned code), say so in your pull request before contributing.

Sign off each commit to certify the [Developer Certificate of Origin](https://developercertificate.org/):
`git commit -s` (adds a `Signed-off-by` line).
