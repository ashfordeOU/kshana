# awesome-mcp-servers — listing kit

A one-time PR to get **kshana-mcp** into the community "awesome" directories that AI-tool
users browse. These lists are curated (a human reviews the PR), so this is a founder
action; everything you need is below, ready to paste.

The official MCP registry already auto-lists kshana-mcp on every release
(`io.github.ashfordeOU/kshana-mcp`); this is the *human-browsable* discovery surface on
top of that.

## Where to submit

Primary (largest, ~60k★):

- **punkpeye/awesome-mcp-servers** — <https://github.com/punkpeye/awesome-mcp-servers>

Optional extras (same entry, plain format — drop the emoji):

- **wong2/awesome-mcp-servers** — <https://github.com/wong2/awesome-mcp-servers>
- **appcypher/awesome-mcp-servers** — <https://github.com/appcypher/awesome-mcp-servers>

## The entry (punkpeye format — emoji legend below)

**Status: PR #8190 is OPEN** (branch `add-kshana-aerospace`, under `### 🚀 Aerospace &
Astrodynamics`). The maintainer (punkpeye) merges once the Glama quality score is
evaluated and the Glama badge is in the entry — see "Glama requirements" below.

Live entry as submitted, **with the required Glama badge** inserted right after the repo
link and before the emojis (this is the exact line to land in `README.md`):

```markdown
- [AshfordeOU/kshana](https://github.com/AshfordeOU/kshana) [![kshana MCP server](https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg)](https://glama.ai/mcp/servers/ashfordeOU/kshana) 🦀 🏠 🍎 🪟 🐧 - Validated PNT-resilience simulator over MCP: SGP4/SDP4 orbits, IAU reference frames, GNSS availability/DOP, GNSS/INS fusion, ARAIM integrity, and Allan deviations — the engine computes the math instead of the model guessing it. `cargo install kshana-mcp`
```

Emoji legend used: `🦀` = Rust · `🏠` = runs locally (stdio) · `🍎`/`🪟`/`🐧` = mac/Win/Linux.
(Each list keeps its own legend at the top — match it; some use `📇`/`🐍` for the language
and `☁️` for hosted.)

## Glama requirements (PR #8190, required before merge)

punkpeye also owns Glama; merge is gated on the Glama listing passing its check and the
badge being present. Glama path: <https://glama.ai/mcp/servers/ashfordeOU/kshana>
(currently "Quality: not tested" — pending, no build error, because Glama has not been
given a Dockerfile to build yet).

1. **Add the Dockerfile to Glama** (founder action, authenticated, in the Glama
   dashboard for the listing). Paste the contents of `mcp/kshana-mcp/Dockerfile`.
   **Critical:** the build context MUST be the repository ROOT — the crate depends on the
   sibling `kshana` crate via `path = "../.."`, so the Dockerfile does `COPY . .` from
   root then `WORKDIR /src/mcp/kshana-mcp`. Glama clones the whole repo, so a pasted
   Dockerfile builds with root context. The `glama.json` schema only carries
   `maintainers`, so the Dockerfile cannot be declared in-repo — it must be added in the
   Glama UI.
2. Glama then builds the image and runs an MCP introspection probe. Once it passes, the
   score is set and the badge above renders a real number (it shows "not tested" until
   then, and auto-updates — so the badge can be added to the PR at any time).

**Verified locally (2026-06-22)** that Glama's check will pass once it has the Dockerfile:
- Native binary: `initialize` + `tools/list` over stdio returns all 5 tools.
- OCI image `docker build -f mcp/kshana-mcp/Dockerfile .` (repo-root context): builds
  clean (144 MB), and `docker run --rm -i` answers the same `initialize` + `tools/list`
  handshake — the Glama-equivalent check passes end-to-end.
- Round-trip integration test (`cargo test` in `mcp/kshana-mcp`): 4/4 green.

Plain version (for lists without the emoji convention):

```markdown
- [Kshana](https://github.com/AshfordeOU/kshana) - Validated PNT simulator over MCP (SGP4 orbits, IAU frames, GNSS availability, GNSS/INS fusion, ARAIM, Allan deviations); the engine does the math instead of the model hallucinating it.
```

## How to submit

1. Fork the target repo, edit its `README.md`, add the entry under the right category
   (keep alphabetical order; match the file's existing emoji/format exactly).
2. Open a PR. Title: `Add Kshana — validated PNT simulator (MCP server)`.
   Body: one or two sentences — what it is, that it's AGPL-3.0 and open source, link
   to <https://kshana.dev> and the MCP-registry entry `io.github.ashfordeOU/kshana-mcp`.
3. These lists have contribution rules (alphabetical, one line, working link, real
   description) — a clean entry is usually merged quickly.

## Notes

- Keep the description honest and specific — these reviewers reward precision and
  penalize hype.
- If a maintainer asks for a tool list: the server exposes `run_scenario`,
  `list_scenario_kinds`, `validate_scenario`, `export_sp3`, `export_omm`.
- This file is the canonical draft; update it if the entry text changes so re-submission
  is copy-paste.
