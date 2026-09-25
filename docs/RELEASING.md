# Releasing Kshana

A release is one tag push. Everything after that is automatic, and it happens in one
fixed order:

```
tag  ->  verify  ->  publish  ->  parity  ->  site
```

Nothing is published until the tagged commit has passed the full test suite, and the
release is not called done until every registry has been asked whether it really serves
the new version.

## Before you tag

1. In [`CHANGELOG.md`](../CHANGELOG.md), rename `[Unreleased]` to `[X.Y.Z] - YYYY-MM-DD`
   and start a fresh `[Unreleased]` section.
2. Bump `version` in `Cargo.toml`, and every surface `scripts/check-version-sync.sh`
   lists (the MCP server crate, the JetBrains plugin, the README status line and the
   registry front pages). Run the script; it must say OK.
3. Merge to `main` and wait for continuous integration (CI, `ci.yml`) to pass on that
   commit. Tag only a commit that is already green on `main`.
4. Push the tag: `git tag vX.Y.Z <commit> && git push origin vX.Y.Z`.

## What happens after the tag

All of it runs inside one run of the Release workflow (`.github/workflows/release.yml`).

| Stage | Where | What it does | If it fails |
| --- | --- | --- | --- |
| verify | `release.yml` job `verify` | Formatting, lint (clippy), the full `cargo test --all` suite (golden pins and verification-matrix guards included), the reproducibility guard and the script guards, on the tagged commit | Nothing is published. Fix, re-tag. |
| release | `release.yml` jobs `binaries`, `release`, `verify-release*` | Builds the command-line binary for Linux x86-64, macOS (Apple silicon and Intel) and Windows x86-64, the MCP server binary, the software bill of materials (SBOM) and the validation summary; writes `SHA256SUMS`; attests every file with SLSA (Supply-chain Levels for Software Artifacts) build provenance; attaches them to the GitHub Release; then downloads them again and checks each one, running the macOS and Windows binaries on their own systems | The GitHub Release is incomplete; the registries are unaffected |
| publish | `publish.yml`, then `mcp-publish.yml` and `jetbrains-plugin.yml`, all called from `release.yml` | Builds every artifact first (the six Python wheels and the source distribution through `wheels.yml`, the npm package), then publishes crates.io, then the Python Package Index (PyPI), npm and `kshana-mcp` on crates.io, then the ghcr.io container image and the Model Context Protocol (MCP) registry, and the JetBrains Marketplace | See "Retrying" below |
| parity | `release.yml` job `parity` | Polls crates.io (`kshana`, `kshana-mcp`), npm, PyPI (the source distribution and one wheel for each of the six platforms) and ghcr.io until each serves the version, for up to 45 minutes. docs.rs and the MCP registry are reported but never fatal | The run is red and names the channel that is missing |
| site | `release.yml` job `site` | Dispatches `pages.yml`, which rebuilds kshana.dev from the tag | The site still shows the previous release |

### Why this order

Before this pipeline, the registry publishes were separate workflows that started on the
same tag push as the verification, and so did not wait for it. On v0.27.2 crates.io,
npm and PyPI had all finished within five minutes of the tag, while the verification
took until 84 minutes after it: the crate was public, and could not be taken back, for
83 minutes before anything said the tests passed. On v0.27.0 npm and PyPI published
while the crates.io job failed, leaving a half-released version.

Publishing is irreversible (crates.io yanks a version but never deletes it, and PyPI
refuses a second upload of the same file name), so the only safe place for the verdict is
in front of the first upload. GitHub's `needs:` edge is what enforces that, and it only
works between jobs of the same workflow run, which is why the publishing workflows are
now called from `release.yml` rather than triggered by the tag.

Inside the publish stage, every artifact is built and checked before the first upload,
and crates.io goes first because its packaging step has failed mid-release before.

### Why the parity check

A publish job that reports success is not the same as a registry that serves the
version. Asking the registries today, with `scripts/check_channel_parity.py`:

| Version | Missing from |
| --- | --- |
| 0.22.0 | npm, PyPI |
| 0.23.0 | PyPI |
| 0.27.0 | crates.io (`kshana` and `kshana-mcp`) |
| 0.27.1, 0.27.2 | nothing |

Part of the cause was that a missing registry token used to skip the upload and report
success. It now fails the job. You can run the check yourself for any version; it only
reads public registry pages:

```bash
python3 scripts/check_channel_parity.py 0.27.2
```

## Retrying

Every publish is idempotent: a version that is already on a registry counts as success,
so a retry never double-publishes.

- **A publish job failed** (a network error, an expired token): open the Release run and
  use **Re-run failed jobs**. The verification already passed in that run, so only the
  failed jobs run again.
- **The Release run is gone or unusable:** dispatch `publish` (or `publish MCP server`,
  or `JetBrains plugin`) from the Actions tab **on the tag**, not on a branch. Before it
  publishes, `scripts/check-release-verdict.sh` asks the GitHub Actions interface (API)
  for a green `verify` job from the tag-push run of `release.yml` on exactly that
  commit, and refuses if there is none, if it is red or still running, or if the API
  cannot be read. Dispatched on a branch, these workflows publish nothing.
- **Re-running `release.yml` by hand** (its `tag` input) rebuilds and re-attaches the
  GitHub Release assets. It does not publish to any registry and does not redeploy the
  site.
- **The site:** dispatch `pages` on `main`. Leave `tag` blank to deploy the latest
  published release, or name a tag to deploy that release (this is also how to roll
  back).

## Pinned tools

The tools that produce shipped bytes are pinned, so a release can be rebuilt with the
same tools:

- **Rust 1.93.0**, from `rust-toolchain.toml`. Every workflow asks
  `dtolnay/rust-toolchain` for that exact version (the `msrv` job alone asks for the
  minimum supported version), and `scripts/check-toolchain.sh` fails if any workflow asks
  for anything else, or pipes a downloaded install script into a shell. To move to a new
  compiler, change `rust-toolchain.toml` and every workflow reference together. If the
  new compiler moves a golden value, the build fails, and that is the intended outcome:
  a published number is never re-baselined to make a red go away (see
  [`docs/revisions/`](revisions/)).
- **wasm-pack 0.13.1**, the version that built the v0.27.2 npm package (its publish log
  says so), installed as a prebuilt binary whose checksum the install action verifies.
- **mcp-publisher 1.8.1**, downloaded by exact version and checked against the SHA-256
  (Secure Hash Algorithm) checksum its project publishes.
- The Python wheels are built by `maturin-action`, which reads `rust-toolchain.toml`
  itself, including inside the manylinux container.

## What the pipeline needs from the repository settings

- Secrets: `CARGO_REGISTRY_TOKEN`, `PYPI_API_TOKEN`, `NPM_TOKEN`,
  `JETBRAINS_MARKETPLACE_TOKEN`. A release tag fails if one is missing.
- Variable: `MCP_REGISTRY_PUBLISH=true` turns on the MCP registry step.
- The `github-pages` environment allows deployments from `main` only. That is why the
  `site` job dispatches `pages.yml` on `main` with the tag as an input, instead of
  deploying from the tag itself; the content is still the tag's.
