<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# External submission kit (founder-performed)

This directory stages every external listing/submission so the founder can copy-paste with
no further authoring. These are **docs only** — nothing here is compiled or published by CI.

| File | Destination | Gating |
|------|-------------|--------|
| `awesome-gnss-PR.md` | github.com/barbeau/awesome-gnss | GitHub account |
| `navipedia-edit.md` | gssc.esa.int/navipedia (MediaWiki) | registered editor account |
| `nasa-listing.md` | ASCL + Research Software Directory (NOT code.nasa.gov) | free submitter accounts |
| `abstracts.md` | ION GNSS+ 2026, IAC 2026 | ION/IAF accounts + deadlines |
| `essr-registration.md` | essr.esa.int | ESA-STAR / ESSR login (entity 83208) |
| `discussions-setup.md` | repo Settings + seed posts | repo admin toggle |
| `mcp-registry.md` | crates.io + ghcr.io (OCI) + MCP registry + aggregators | ✅ LIVE — auto-publishes per release (`io.github.ashfordeOU/kshana-mcp`) |
| `awesome-mcp-servers.md` | punkpeye / wong2 / appcypher awesome-mcp-servers lists | GitHub account (1 PR) |
| `jetbrains-marketplace.md` | JetBrains Marketplace (the IDE plugin) | ✅ LIVE — [plugin 32181](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator), auto-updates per release |

Related, landed in-repo (no submission needed):
- `notebooks/quantum-vs-classical-gdop.ipynb` — Colab notebook (founder confirms PyPI wheel is live).
- `.github/FUNDING.yml` — Sponsor button (`custom:` immediate; `github:` needs Sponsors enabled).
- README "Cite this work" BibTeX block and playground CTA.

## Founder-only fields to supply before submitting

1. **GitHub Sponsors toggle** before uncommenting the `github:` key in `.github/FUNDING.yml`.
2. **Account logins** for Navipedia, ESSR, ION, and IAF.
3. Confirm **the PyPI `kshana` wheel and https://kshana.dev are live** before publishing the
   Colab and playground links.
