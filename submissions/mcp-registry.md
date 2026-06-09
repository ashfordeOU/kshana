# MCP server listings — publish + auto-update kit

How to make `kshana-mcp` publicly installable and discoverable, and keep every channel
**updated automatically on each release**. Most of it is already wired in CI; the
founder-only steps (accounts, one public toggle, one PR) are called out as **[FOUNDER]**.

There are three independent install channels plus the discovery lists:

| Channel | User installs with | Updated by |
|---|---|---|
| **crates.io** | `cargo install kshana-mcp` | `.github/workflows/publish.yml` (job `crates-mcp`) on every `vX.Y.Z` tag |
| **ghcr.io (OCI)** | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | `.github/workflows/mcp-publish.yml` (job `image`) on every tag |
| **Official MCP registry** | client auto-discovers; points at the OCI image | `mcp-publish.yml` (job `registry`, GitHub OIDC) on every tag |
| `awesome-mcp-servers` + aggregators | discovery only | one PR, then auto-indexed |

> Why OCI and not crates.io for the registry: the official MCP registry's `registryType`
> enum is `npm | pypi | oci | nuget | mcpb` — **it does not accept `cargo`**. So the
> registry entry (`mcp/kshana-mcp/server.json`) references the **OCI image**, whose
> `io.modelcontextprotocol.server.name` label proves ownership. `cargo install` stays a
> first-class channel; it just isn't the registry's package type.

---

## 1. crates.io — `cargo install kshana-mcp` [FOUNDER: one-time, then automatic]

The crate depends on the published `kshana` crate, so `kshana` must be on crates.io
first (it is — 0.14.1). Publish the server once:

```sh
cd mcp/kshana-mcp
cargo publish            # needs a crates.io token in the environment (cargo login)
```

After that it is automatic: the `crates-mcp` job in `publish.yml` publishes it on every
release tag (gated on the existing `CARGO_REGISTRY_TOKEN` secret, idempotent — re-runs
are a no-op). **crates.io publishes are permanent (yank-only)** — that's why the first one
is founder-gated. Bumping the crate's own `version` in `mcp/kshana-mcp/Cargo.toml` is what
makes each release publish a new version; if the engine moves to a new minor (e.g. 0.15),
also bump the `kshana = "0.14"` requirement or the job fails loudly.

## 2. ghcr.io OCI image — `docker run` [FOUNDER: make public once, then automatic]

The `image` job builds a multi-arch (amd64+arm64) image and pushes it to
`ghcr.io/ashfordeou/kshana-mcp:<version>` + `:latest` on every tag, using the built-in
`GITHUB_TOKEN` — **no maintainer secret**. To trigger the first build now without cutting
a release: Actions → **publish MCP server** → *Run workflow* → set `version` (e.g. `0.14.1`).

GitHub packages are **private by default**. After the first push, make it public once:
- ghcr package page → **Package settings** → *Change visibility* → **Public**, or
- `gh api -X PATCH /user/packages/container/kshana-mcp/visibility -f visibility=public`
  (for an org package: `/orgs/AshfordeOU/packages/container/kshana-mcp/visibility`).

Users then run, with no Rust toolchain:

```sh
docker run --rm -i ghcr.io/ashfordeou/kshana-mcp
```

## 3. Official MCP registry (registry.modelcontextprotocol.io) [auto via OIDC]

The `registry` job authenticates with **GitHub OIDC (zero secrets)** and publishes
`server.json`, stamping the version + image tag from the release. It is gated on a repo
**variable** so it stays inert until the image is public:

**[FOUNDER, one-time]** Settings → Secrets and variables → Actions → **Variables** →
add `MCP_REGISTRY_PUBLISH = true`.

Ownership is proven automatically: the registry reads the `io.modelcontextprotocol.server.name`
label baked into the image (`mcp/kshana-mcp/Dockerfile`), which equals the `name` in
`server.json` (`io.github.ashfordeOU/kshana-mcp`). The OIDC token's repo owner
(`ashfordeOU`) must match the `io.github.<owner>` namespace — it does.

Manual fallback (publish from a laptop instead of CI):

```sh
cd mcp/kshana-mcp
curl -L "https://github.com/modelcontextprotocol/registry/releases/latest/download/mcp-publisher_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/').tar.gz" | tar xz mcp-publisher
./mcp-publisher login github      # browser auth for the AshfordeOU namespace
./mcp-publisher publish           # validates + publishes ./server.json
```

## 4. `awesome-mcp-servers` (high-traffic discovery list) [FOUNDER: one PR]

Fork <https://github.com/punkpeye/awesome-mcp-servers>, add this under **🔬 Science &
Education** (or **📊 Data Platforms**), and open a PR titled
`Add kshana — PNT-resilience / GNSS simulator`:

```markdown
- [AshfordeOU/kshana](https://github.com/AshfordeOU/kshana) 🦀 🏠 - Run the validated **Kshana** positioning/navigation/timing (PNT) resilience simulator from an agent — SGP4/SDP4 orbits, IAU reference frames (cross-validated vs SPICE), Allan deviations, GNSS availability/DOP, ARAIM protection levels, GNSS/INS fusion, and quantum-sensor models. `cargo install kshana-mcp` or `docker run ghcr.io/ashfordeou/kshana-mcp`.
```

(Legend: 🦀 = Rust, 🏠 = local/stdio. Adjust the emoji to the list's current legend.)

## 5. Aggregators (mostly auto-index once #3 lands) [FOUNDER: optional]

- **Glama** (<https://glama.ai/mcp/servers>) — auto-indexes public GitHub MCP servers.
- **Smithery** (<https://smithery.ai>) — "Add server", point at the repo; reads `server.json`.
- **mcp.so** (<https://mcp.so/submit>) — submit the repo URL.
- **PulseMCP** (<https://www.pulsemcp.com>) — "Submit a server" with the repo URL.

---

## One-paragraph blurb (reuse anywhere)

> **kshana-mcp** exposes the open, reproducible **Kshana** PNT-resilience simulator to AI
> agents over MCP. Instead of guessing orbital, timing, or GNSS-integrity math, an agent
> runs the *validated* engine — SGP4/SDP4 (4.12 mm vs the AIAA reference), IAU 2006/2000A
> reference frames (cross-validated against ANISE/SPICE), Allan deviations (NIST SP1065),
> GNSS availability/DOP, ARAIM/DO-229E protection levels, GNSS/INS fusion, and
> quantum-sensor performance models — and gets figures of merit with provenance. Works in
> Cursor, JetBrains AI Assistant/Junie, and any MCP client. `cargo install kshana-mcp`
> or `docker run ghcr.io/ashfordeou/kshana-mcp`.
