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

Place under the best-fit category heading (suggested: **🗺️ Location Services**, or
**🔬 Research and Data** if Location Services is gone), keeping the list alphabetical:

```markdown
- [AshfordeOU/kshana](https://github.com/AshfordeOU/kshana) 🦀 🏠 - Validated positioning/navigation/timing (PNT) simulator over MCP: SGP4/SDP4 orbits, IAU reference frames, GNSS availability/DOP, GNSS/INS fusion, ARAIM integrity, and Allan deviations — the engine computes the math instead of the model guessing it.
```

Emoji legend used: `🦀` = Rust · `🏠` = runs locally (stdio). (Each list keeps its own
legend at the top — match it; some use `📇`/`🐍` for the language and `☁️` for hosted.)

Plain version (for lists without the emoji convention):

```markdown
- [Kshana](https://github.com/AshfordeOU/kshana) - Validated PNT simulator over MCP (SGP4 orbits, IAU frames, GNSS availability, GNSS/INS fusion, ARAIM, Allan deviations); the engine does the math instead of the model hallucinating it.
```

## How to submit

1. Fork the target repo, edit its `README.md`, add the entry under the right category
   (keep alphabetical order; match the file's existing emoji/format exactly).
2. Open a PR. Title: `Add Kshana — validated PNT simulator (MCP server)`.
   Body: one or two sentences — what it is, that it's Apache-2.0 and open source, link
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
