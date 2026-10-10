# Getting kshana-mcp listed and published: founder steps

Everything here needs an account or a form that only the founder can use. Nothing in the repository
submits, publishes or pays for anything by itself. Every automated step below **skips with a notice**
when its secret is missing; it never fails the release for that.

Advisory wording for every listing: "Advisory, not type-approved navigation equipment: the operator
remains responsible for navigation. The server runs on your computer; nothing is sent to Ashforde OÜ."

## A. Accounts, repositories and secrets to create (once)

| What | Exact name | Used by | Notes |
|---|---|---|---|
| GitHub repository | `ashfordeOU/homebrew-tap` (public, default branch `main`, an initial commit so it exists) | `mcp-distribution.yml` homebrew job | Homebrew resolves `brew install ashfordeOU/tap/kshana-mcp` to this repo (the `homebrew-` prefix is required). |
| GitHub repository | `ashfordeOU/scoop-bucket` (public, branch `main`, one initial commit) | scoop job | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket`. |
| Secret `HOMEBREW_TAP_TOKEN` | fine-grained PAT, repository `ashfordeOU/homebrew-tap` only, permission Contents: read and write | homebrew job | Repository secret on `ashfordeOU/kshana`. |
| Secret `SCOOP_BUCKET_TOKEN` | fine-grained PAT, repository `ashfordeOU/scoop-bucket` only, Contents: read and write | scoop job | Repository secret. |
| Secret `WINGET_TOKEN` | classic PAT with `public_repo` scope (a fork of `microsoft/winget-pkgs` under the token owner's account must be pushable; fine-grained tokens cannot open a pull request to another organisation's repository) | winget job | Repository secret. The first run forks `microsoft/winget-pkgs` and opens a "New package" pull request; Microsoft reviews it (days). |
| Secret `NPM_TOKEN` | already exists for `kshana`; see B | `mcp-launchers.yml` npm job | |
| Secret `PYPI_API_TOKEN` | see B | `mcp-launchers.yml` pypi job | |
| Repository variable `MCP_REGISTRY_PUBLISH` | `true` | `mcp-publish.yml` registry job | Already the switch for the official MCP registry. Publishing there is by GitHub OIDC; no extra secret. |

## B. First publish of the two new package names (read before tagging)

`kshana-mcp` is a **new** package name on npm and on PyPI. Both names looked free when this was written
(a registry lookup returned 404; recheck on the day).

* **npm.** Can the existing `NPM_TOKEN` publish a new name? Only if it is a *classic Automation token*, or a
  *granular token whose permission is read-and-write on all packages* (or on a scope that covers the new
  name). A granular token limited to the package `kshana` cannot create `kshana-mcp`. If the token is limited,
  create a new automation token in the npm account that owns `kshana` and replace `NPM_TOKEN` in the `npm`
  environment. After the first publish, switch the package to *trusted publishing* (npm package settings →
  Trusted Publisher → GitHub Actions, repository `ashfordeOU/kshana`, workflow `mcp-launchers.yml`,
  environment `npm`) and the token can go.
* **PyPI.** A token scoped to the project `kshana` cannot create `kshana-mcp`. Either:
  1. create an **account-scoped** API token (pypi.org → Account settings → API tokens → scope "Entire
     account") and store it as `PYPI_API_TOKEN` in the `pypi` environment, then replace it with a
     project-scoped token after the first release; or
  2. add a **pending trusted publisher** (pypi.org → Your projects → Publishing → "Add a new pending
     publisher"): project name `kshana-mcp`, owner `ashfordeOU`, repository `kshana`, workflow
     `mcp-launchers.yml`, environment `pypi`. Then no token is needed, but the workflow must be switched
     from token to OIDC (delete the `password:` line and grant `id-token: write` to the job; the token
     path is what ships today).
* The job fails with a clear message (not a skip) if the token is absent: a release whose launcher cannot
  publish is not a complete release, and the channel parity check waits for both packages.
* Neither package is published by anything but a `v*` tag.

## C. Official MCP registry (done by the workflow once A is set)

`mcp/kshana-mcp/server.json` lists three packages: the OCI image, the npm package (`mcpName` is set in
`packaging/mcp/npm/package.json`) and the PyPI package (the README carries the `mcp-name:` marker the
registry checks). `mcp-publish.yml` stamps the version and publishes **after** the launchers are live,
because the registry verifies each package when it accepts the entry. Nothing to do by hand.

The GitHub MCP Registry and the VS Code MCP gallery read the official registry; they pick the entry up
without a submission.

## D. Directories that need a form or a click

### Smithery (smithery.ai)

1. Sign in at https://smithery.ai with the GitHub account that owns `ashfordeOU`.
2. "New" → "Server" → pick the repository `ashfordeOU/kshana`. Smithery reads `smithery.yaml` at the
   repository root (already committed: container runtime, `mcp/kshana-mcp/Dockerfile`, build context `.`).
3. Deploy. Check the tools list shows 38 tools. Add the advisory sentence above to the description.

### Glama (glama.ai)

1. The listing exists (`glama.ai/mcp/servers/ashfordeOU/kshana`). `glama.json` at the repository root
   names the maintainer `ashfordeOU`.
2. Sign in to Glama with GitHub as `ashfordeOU`, open the server page and use "Claim" so the maintainer
   can edit it. Glama then reads `glama.json` and rescans.
3. If the score card asks for a Dockerfile or a tool-schema scan, point it at `mcp/kshana-mcp/Dockerfile`.

### Anthropic Claude Code plugin directory

The plugin is `.claude-plugin/marketplace.json` (marketplace `ashforde`, plugin `kshana`). Anyone can use
it today with `/plugin marketplace add ashfordeOU/kshana`. To be listed in Anthropic's own directory:

1. Run `claude plugin validate .` in the repository root and fix anything it reports.
2. Submit the plugin through Anthropic's plugin directory submission form (linked from the Claude Code
   plugin documentation, "Submit your plugin"), with the repository URL, the plugin name `kshana`, the
   licence (AGPL-3.0-only, commercial licence available) and the advisory sentence.
3. The submission needs the founder's Anthropic account. Keep the plugin version equal to the release tag.

### Cursor

Cursor has no submission-free directory of its own: its one-click links
(`cursor://anysphere.cursor-deeplink/mcp/install?...`) work with no listing, and are on the README and
the site. For the community directory (cursor.directory), sign in with GitHub, choose "Add MCP server",
and paste the repository URL and the `npx -y kshana-mcp@0.35.0` command from `docs/MCP-INSTALL.md`.

### VS Code

The one-click links work with no listing (`https://insiders.vscode.dev/redirect?url=vscode:mcp/install?...`).
The in-product MCP gallery is the GitHub MCP Registry, fed from the official registry (section C), so no
form is needed once `server.json` is published.

### Others worth a form (optional)

Windsurf, Zed, Goose, Codex CLI, Gemini CLI and Continue need no listing; their snippets are in
`docs/MCP-INSTALL.md`. Docker's MCP catalogue and mcp.so accept a pull request or a form with the
repository URL; reuse the one-line description from `server.json`.

## E. After the first release

1. Check the channel parity job: npm and PyPI `kshana-mcp`, and every `kshana-mcp-*` release asset.
2. `brew install ashfordeOU/tap/kshana-mcp`, `scoop install kshana-mcp`, then, once Microsoft merges the
   pull request, `winget install AshfordeOU.KshanaMcp`.
3. Claude Desktop: download `kshana-mcp-<target>.mcpb` from the release and double-click it.
