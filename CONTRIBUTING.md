# Contributing to Kshana

Thanks for your interest. Kshana aims to be a **neutral, reproducible, honestly-
validated** reference for hybrid quantum/classical PNT. Contributions are held to that
bar: correctness, citations, and reproducibility over breadth.

## Development

```bash
cargo build
cargo test          # all tests must pass
cargo clippy        # keep it warning-clean
cargo fmt
```

## Before every commit, both guards must pass

```bash
./scripts/check-reproducible.sh     # reference scenario is byte-identical across runs
./scripts/check-no-attribution.sh   # repo hygiene (see below)
```

- **Reproducibility is a hard invariant.** A change that makes `(scenario, seed,
  version)` non-deterministic is a bug. Randomness must flow through the seeded RNG;
  quantum and classical runs use independent, deterministically-derived seeds.
- **Repository hygiene.** Commits and content must carry no automated-tool attribution
  trailers or footers, and must not name an AI assistant as an author anywhere in
  content, file names, or history. The guard enforces this.

## Adding or changing a sensor model

1. **Every numeric parameter needs provenance.** Put the citation in the model's
   `provenance` string and the scenario file. No anonymous constants.
2. **Validate against the standard relation,** not just internal consistency — e.g.
   Allan deviation for clocks, Groves' dead-reckoning error growth for inertial, the
   timing→ranging conversion for time transfer. Add a test that the simulated output
   reproduces the published/relation value within a stated tolerance.
3. **Be honest about maturity.** Update `docs/VALIDATION.md`: mark each term
   `validated` or `not modeled`, and label figures that are targets or ground-
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
- **Publishing to crates.io is a manual maintainer step.** It requires a registry
  token and is run by hand (`cargo publish`). The CI and Release pipelines never
  publish to external registries automatically; the tag-gated Release workflow only
  re-runs all checks and attaches a build artifact to a GitHub release.

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

By contributing you agree your contributions are licensed under Apache-2.0.

Sign off each commit to certify the [Developer Certificate of Origin](https://developercertificate.org/):
`git commit -s` (adds a `Signed-off-by` line). Inbound contributions are under the
same Apache-2.0 license as the project (inbound = outbound); there is no CLA.
