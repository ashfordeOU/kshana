<!-- SPDX-License-Identifier: Apache-2.0 -->
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
| `mcp-registry.md` | MCP registry + awesome-mcp-servers + Smithery/mcp.so/Glama/PulseMCP | crates.io token + GitHub account |

Related, landed in-repo (no submission needed):
- `paper/paper.md` + `paper/paper.bib` — JOSS submission (founder fills real ORCID, rasterises figure).
- `notebooks/quantum-vs-classical-gdop.ipynb` — Colab notebook (founder confirms PyPI wheel is live).
- `.github/FUNDING.yml` — Sponsor button (`custom:` immediate; `github:` needs Sponsors enabled).
- README "Cite this work" BibTeX block and playground CTA.

## Founder-only fields to supply before submitting

1. **ORCID** in `paper/paper.md` (the `0000-0000-0000-0000` placeholder FAILS JOSS validation).
2. **GitHub Sponsors toggle** before uncommenting the `github:` key in `.github/FUNDING.yml`.
3. **Account logins** for Navipedia, ESSR, ION, and IAF.
4. Confirm **the PyPI `kshana` wheel and https://kshana.dev are live** before publishing the
   Colab and playground links.
