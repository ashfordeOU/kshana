#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Every distribution channel, from one table: packaging/channels.json and the README table.

    scripts/gen_channels.py            write packaging/channels.json and the README install table
    scripts/gen_channels.py --check    fail when either is stale, or a channel is not wired
                                       into scripts/check_channel_parity.py

packaging/channels.json is the schema the site build reads to write web/channels.json (do not
edit web/ by hand). Fields per channel: id, group, name, audience, requires, command, pinned,
verify, registry, registry_label, docs, docs_label, note, links (extra buttons, each
{label, url}), registry_name, parity (the probe in check_channel_parity.py that proves the
channel serves the version, or null) and optional (true: a missing credential skips it).
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gen_mcp_install as M  # noqa: E402

ROOT = M.ROOT
REPO = M.REPO
BLOB = f"https://github.com/{REPO}/blob/main/"
BEGIN, END = "<!-- channels:begin -->", "<!-- channels:end -->"
FIELDS = ["id", "group", "name", "audience", "requires", "command", "pinned", "verify", "registry",
          "registry_label", "docs", "docs_label", "note", "links", "registry_name", "parity", "optional"]


def ch(**kw):
    c = {k: None for k in FIELDS}
    c.update(links=[], optional=False)
    c.update(kw)
    return c


def channels(ver: str) -> list[dict]:
    S = M.servers(ver)
    rel = f"https://github.com/{REPO}/releases/download/v{ver}"
    cur = [{"label": "Add to Cursor (npx)", "url": M.cursor_link("kshana", S["npx"])},
           {"label": "Add to Cursor (Docker)", "url": M.cursor_link("kshana", S["docker"])}]
    vsc = [{"label": "Install in VS Code (npx)", "url": M.vscode_link("kshana", S["npx"])},
           {"label": "Install in VS Code (Docker)", "url": M.vscode_link("kshana", S["docker"])},
           {"label": "Install in VS Code Insiders (npx)", "url": M.vscode_link("kshana", S["npx"], insiders=True)}]
    mcpb = [{"label": t, "url": f"{rel}/kshana-mcp-{tg}.mcpb"} for t, tg in [
        ("macOS (Apple silicon)", "aarch64-apple-darwin"), ("macOS (Intel)", "x86_64-apple-darwin"),
        ("Windows", "x86_64-pc-windows-msvc"), ("Linux (x86-64)", "x86_64-unknown-linux-gnu"),
        ("Linux (Arm)", "aarch64-unknown-linux-gnu")]]
    mcpdoc = dict(docs=BLOB + "docs/MCP-INSTALL.md", docs_label="Every MCP install snippet")
    return [
        ch(id="browser", group="engine", name="Try in the browser", audience="anyone, nothing to install",
           requires="none", docs="docs/studio.html", docs_label="Studio guide", registry="https://kshana.dev",
           registry_label="Open Kshana Studio", note="The engine runs locally as WebAssembly; nothing is uploaded."),
        ch(id="cli", group="engine", name="Command line (Rust)", audience="engineers who want the kshana command",
           requires="Rust", command="cargo install kshana", pinned=f"cargo install kshana --version {ver}",
           verify="kshana --version", registry="https://crates.io/crates/kshana", registry_label="crates.io: kshana",
           docs="docs/rust.html#usage--cli", docs_label="Command-line usage", parity="crates.io kshana"),
        ch(id="rust", group="engine", name="Rust library", audience="Rust developers embedding the engine",
           requires="Rust", command="cargo add kshana", pinned=f"cargo add kshana@{ver}",
           verify="cargo tree --depth 1 | grep kshana", registry="https://crates.io/crates/kshana",
           registry_label="crates.io: kshana", docs="https://docs.rs/kshana", docs_label="API reference on docs.rs",
           parity="crates.io kshana"),
        ch(id="python", group="engine", name="Python", audience="analysts and notebooks", requires="Python",
           command="pip install kshana", pinned=f"pip install kshana=={ver}",
           verify='python -c "import kshana; print(kshana.version())"', registry="https://pypi.org/project/kshana/",
           registry_label="PyPI: kshana", docs="docs/python-api.html", docs_label="Python API guide",
           parity="PyPI kshana"),
        ch(id="npm", group="engine", name="JavaScript and WebAssembly", audience="web and Node.js developers",
           requires="Node", command="npm install kshana", pinned=f"npm install kshana@{ver}", verify="npm ls kshana",
           registry="https://www.npmjs.com/package/kshana", registry_label="npm: kshana", docs="docs/npm.html",
           docs_label="npm and WebAssembly guide", parity="npm kshana"),
        ch(id="mcp", group="mcp", name="AI assistant (MCP server, cargo)", audience="anyone using an MCP-capable assistant",
           requires="Rust 1.88+", command="cargo install kshana-mcp", pinned=f"cargo install kshana-mcp --version {ver}",
           verify="cargo install --list | grep kshana-mcp", registry="https://crates.io/crates/kshana-mcp",
           registry_label="crates.io: kshana-mcp", registry_name="io.github.ashfordeOU/kshana-mcp",
           docs="docs/mcp.html", docs_label="MCP server guide", parity="crates.io kshana-mcp"),
        ch(id="docker", group="mcp", name="Docker image", audience="no Rust toolchain; the MCP server in a container",
           requires="Docker", command="docker run --rm -i ghcr.io/ashfordeou/kshana-mcp",
           pinned=f"docker run --rm -i {M.GHCR}:{ver}", verify=f"docker image inspect {M.GHCR}:{ver} --format '{{{{.Id}}}}'",
           registry=f"https://github.com/{REPO}/pkgs/container/kshana-mcp", registry_label="GitHub container registry",
           docs="docs/mcp.html#install", docs_label="MCP server guide: Docker", parity="ghcr.io kshana-mcp"),
        ch(id="mcp-desktop", group="mcp", name="Claude Desktop extension", audience="Claude Desktop users, no terminal",
           requires="none", command="double-click kshana-mcp-<target>.mcpb", pinned=f"kshana-mcp-<target>.mcpb of v{ver}",
           registry=f"https://github.com/{REPO}/releases/tag/v{ver}", registry_label="GitHub release", links=mcpb,
           parity="GitHub release assets", **mcpdoc),
        ch(id="mcp-cursor", group="mcp", name="Cursor (one click)", audience="Cursor users", requires="Node, or Docker",
           command=f"npx -y kshana-mcp@{ver}", pinned=f"kshana-mcp@{ver} / {M.GHCR}:{ver}", links=cur,
           parity="npm kshana-mcp", **mcpdoc),
        ch(id="mcp-vscode", group="mcp", name="VS Code (one click)", audience="VS Code and Insiders users",
           requires="Node, or Docker", command=f"npx -y kshana-mcp@{ver}", pinned=f"kshana-mcp@{ver} / {M.GHCR}:{ver}",
           links=vsc, parity="npm kshana-mcp", **mcpdoc),
        ch(id="mcp-claude-code", group="mcp", name="Claude Code", audience="Claude Code users", requires="Node (or Docker)",
           command=f"claude mcp add kshana -- npx -y kshana-mcp@{ver}", pinned=f"kshana-mcp@{ver}",
           note="Or the plugin: /plugin marketplace add ashfordeOU/kshana, then /plugin install kshana@ashforde.",
           parity="npm kshana-mcp", **mcpdoc),
        ch(id="mcp-npx", group="mcp", name="npx", audience="Node users, any MCP client", requires="Node 18+",
           command=f"npx -y kshana-mcp@{ver}", pinned=f"kshana-mcp@{ver}", verify=f"npx -y kshana-mcp@{ver} --version",
           registry="https://www.npmjs.com/package/kshana-mcp", registry_label="npm: kshana-mcp",
           note="A launcher: it downloads the release binary, verifies SHA256SUMS and runs it.",
           parity="npm kshana-mcp", **mcpdoc),
        ch(id="mcp-uvx", group="mcp", name="uvx / pipx", audience="Python users, any MCP client",
           requires="Python 3.9+ with uv or pipx", command=f"uvx kshana-mcp=={ver}", pinned=f"kshana-mcp=={ver}",
           verify=f"uvx kshana-mcp=={ver} --version", registry="https://pypi.org/project/kshana-mcp/",
           registry_label="PyPI: kshana-mcp", parity="PyPI kshana-mcp", **mcpdoc),
        ch(id="mcp-brew", group="mcp", name="Homebrew", audience="macOS and Linux", requires="brew",
           command="brew install ashfordeOU/tap/kshana-mcp", pinned=f"formula for v{ver}", verify="kshana-mcp --version",
           registry="https://github.com/ashfordeOU/homebrew-tap", registry_label="Homebrew tap",
           parity="Homebrew tap kshana-mcp", optional=True, **mcpdoc),
        ch(id="mcp-scoop", group="mcp", name="Scoop", audience="Windows", requires="Scoop",
           command="scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp",
           pinned=f"manifest for v{ver}", verify="kshana-mcp --version",
           registry="https://github.com/ashfordeOU/scoop-bucket", registry_label="Scoop bucket",
           parity="Scoop bucket kshana-mcp", optional=True, **mcpdoc),
        ch(id="mcp-winget", group="mcp", name="winget", audience="Windows", requires="winget",
           command="winget install AshfordeOU.KshanaMcp", pinned=f"winget install AshfordeOU.KshanaMcp --version {ver}",
           verify="kshana-mcp --version", registry="https://github.com/microsoft/winget-pkgs",
           registry_label="winget-pkgs", note="Appears once Microsoft merges the submission.",
           parity="winget AshfordeOU.KshanaMcp", optional=True, **mcpdoc),
        ch(id="mcp-binary", group="mcp", name="Prebuilt binary", audience="no package manager", requires="none",
           command=f"download kshana-mcp-<target> from the release and check it against SHA256SUMS",
           pinned=f"v{ver}", verify="gh attestation verify <file> --repo " + REPO,
           registry=f"https://github.com/{REPO}/releases/tag/v{ver}", registry_label="GitHub release",
           parity="GitHub release assets", **mcpdoc),
        ch(id="mcp-registry", group="mcp", name="Official MCP registry", audience="registry-aware MCP clients",
           requires="a registry-aware client", command="search io.github.ashfordeOU/kshana-mcp", pinned=ver,
           registry="https://registry.modelcontextprotocol.io/v0/servers?search=io.github.ashfordeOU/kshana-mcp",
           registry_label="MCP registry", registry_name="io.github.ashfordeOU/kshana-mcp",
           parity="MCP registry kshana-mcp", optional=True, **mcpdoc),
        ch(id="mcp-http", group="mcp", name="Remote (streamable HTTP), self-hosted", audience="clients that take a URL",
           requires="your own host", command="kshana-mcp --http 127.0.0.1:8080", pinned=f"v{ver}",
           note="Loopback by default; a non-loopback bind needs --allow-remote and a bearer token. Kshana hosts no endpoint.",
           docs=BLOB + "docs/deploy/mcp-http.md", docs_label="Self-hosting guide"),
        ch(id="claude-plugin", group="integrations", name="Claude Code plugin marketplace",
           audience="Claude Code users who want slash commands over the tools", requires="Claude Code",
           command="/plugin marketplace add ashfordeOU/kshana", pinned="/plugin install kshana@ashforde",
           registry=f"https://github.com/{REPO}", registry_label="Marketplace: ashfordeOU/kshana",
           docs=BLOB + "docs/AGENTS.md", docs_label="Using Kshana from an agent"),
        ch(id="jetbrains", group="integrations", name="JetBrains IDE plugin", audience="IntelliJ, PyCharm and CLion users",
           requires="a JetBrains IDE", registry="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator",
           registry_label="JetBrains Marketplace", docs="docs/jetbrains.html", docs_label="Plugin guide",
           note='Settings → Plugins → Marketplace → search "Kshana" (plugin ID dev.kshana.ide). Right-click a scenario .toml and choose Run Kshana Scenario.'),
        ch(id="signalk", group="integrations", name="Signal K plugin", audience="boat owners running a Signal K server",
           requires="Node, a Signal K server", command="npm install signalk-kshana-trust",
           pinned=f"npm install signalk-kshana-trust@{ver}", verify="npm ls signalk-kshana-trust",
           registry="https://www.npmjs.com/package/signalk-kshana-trust", registry_label="npm: signalk-kshana-trust",
           docs=BLOB + "integrations/signalk/README.md", docs_label="Signal K plugin guide",
           parity="npm signalk-kshana-trust", optional=True),
        ch(id="opencpn", group="integrations", name="OpenCPN plugin", audience="OpenCPN chartplotter users",
           requires="OpenCPN 5.8+", command="download the plugin tarball from the release",
           pinned=f"kshana_pi-{ver}-1_ubuntu-wx32-24.04-x86_64.tar.gz of v{ver}",
           registry=f"https://github.com/{REPO}/releases/tag/v{ver}", registry_label="GitHub release",
           docs=BLOB + "packaging/opencpn/SUBMITTING.md", docs_label="OpenCPN catalogue submission",
           note="The release carries the tarball and its catalogue metadata XML; listing in OpenCPN's catalogue is a pull request opened by hand.",
           parity="GitHub release assets"),
        ch(id="grafana", group="integrations", name="Grafana dashboard", audience="operators running Grafana",
           requires="Grafana", command="import kshana-grafana-*.json from the release",
           pinned=f"kshana-grafana-{ver}.json of v{ver}", registry=f"https://github.com/{REPO}/releases/tag/v{ver}",
           registry_label="GitHub release",
           docs=BLOB + "deploy/grafana/kshana-gnss-trust.json", docs_label="Dashboard source",
           parity="GitHub release assets"),
        ch(id="reference-image", group="integrations", name="Reference-build image", audience="gate and bench deployments",
           requires="Docker", command="docker pull ghcr.io/ashfordeou/kshana-reference-build",
           pinned=f"docker pull ghcr.io/ashfordeou/kshana-reference-build:{ver}",
           registry=f"https://github.com/{REPO}/pkgs/container/kshana-reference-build",
           registry_label="GitHub container registry", docs=BLOB + "docs/MARINE-INTEGRATIONS.md",
           docs_label="Marine integrations", parity="ghcr.io kshana-reference-build"),
    ]


def doc(ver: str) -> dict:
    return {"version": ver, "generated_from": "scripts/gen_channels.py (one table), checked against the README "
            "install table and scripts/check_channel_parity.py", "fields": FIELDS, "channels": channels(ver)}


def readme_table(ver: str) -> str:
    rows = ["| Channel | Install | Guide |", "|---|---|---|"]
    for c in channels(ver):
        how = f"`{c['command']}`" if c["command"] and not c["command"].startswith(("download", "double-click", "import", "search")) \
            else (c["note"].split(". ")[0] if c["id"] == "jetbrains" else (c["command"] or "open " + (c["registry"] or "")))
        if c["links"] and c["id"] in ("mcp-cursor", "mcp-vscode"):
            how = " · ".join(f"[{l['label']}]({l['url']})" for l in c["links"][:2]) + f" · `{c['command']}`"
        if c["id"] == "mcp-desktop":
            how = "double-click the `.mcpb` for your system: " + " · ".join(f"[{l['label']}]({l['url']})" for l in c["links"])
        guide = f"[{c['docs_label']}]({c['docs']})" if c["docs"] else ""
        rows.append(f"| {c['name']} | {how} | {guide} |")
    return "\n".join(rows)


def targets(ver: str) -> dict[Path, str]:
    out = {ROOT / "packaging" / "channels.json": json.dumps(doc(ver), indent=2, ensure_ascii=False) + "\n"}
    p = ROOT / "README.md"
    text = p.read_text(encoding="utf-8")
    if BEGIN in text:
        head, rest = text.split(BEGIN, 1)
        _, tail = rest.split(END, 1)
        out[p] = head + BEGIN + "\n" + readme_table(ver) + "\n" + END + tail
    return out


def parity_gaps(ver: str) -> list[str]:
    src = (ROOT / "scripts" / "check_channel_parity.py").read_text(encoding="utf-8")
    return [f"{c['id']}: no probe named {c['parity']!r} in check_channel_parity.py"
            for c in channels(ver) if c["parity"] and f'"{c["parity"]}"' not in src]


def main(argv: list[str]) -> int:
    ver = M.version()
    stale = []
    for path, text in targets(ver).items():
        if (path.read_text(encoding="utf-8") if path.exists() else None) != text:
            stale.append(path)
            if "--check" not in argv:
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(text, encoding="utf-8")
    gaps = parity_gaps(ver)
    ids = [c["id"] for c in channels(ver)]
    if len(ids) != len(set(ids)):
        gaps.append("duplicate channel ids")
    if "--check" in argv:
        for g in gaps:
            print("FAIL:", g, file=sys.stderr)
        if stale:
            print("FAIL: stale; run scripts/gen_channels.py: " + ", ".join(str(p.relative_to(ROOT)) for p in stale), file=sys.stderr)
        if stale or gaps:
            return 1
        print(f"OK: {len(ids)} channels, README table and packaging/channels.json current, every probe wired")
        return 0
    for g in gaps:
        print("WARN:", g, file=sys.stderr)
    print("wrote: " + (", ".join(str(p.relative_to(ROOT)) for p in stale) or "nothing (already current)"))
    return 1 if gaps else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
