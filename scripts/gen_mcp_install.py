#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate every MCP install link and client config snippet for kshana-mcp, from one place.

    scripts/gen_mcp_install.py            # rewrite the generated files
    scripts/gen_mcp_install.py --check    # fail if any generated file is stale (CI)
    scripts/gen_mcp_install.py --json     # the channel list, as JSON, on stdout

Nothing here is written by hand into a README: the one-click links (Cursor, VS Code, Goose) are
encoded by this script, and scripts/test_gen_mcp_install.py decodes every one of them and compares it
with the server definition it was made from. The version is the engine's, read from Cargo.toml.

Writes:
  docs/MCP-INSTALL.md                       every channel, every client's config, the one-click links
  README.md, mcp/kshana-mcp/README.md       the table between the `mcp-install:begin/end` markers
"""
from __future__ import annotations

import base64
import json
import re
import sys
import urllib.parse
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
GHCR = "ghcr.io/ashfordeou/kshana-mcp"
REPO = "ashfordeOU/kshana"
ADVISORY = "Advisory, not type-approved navigation equipment: the operator remains responsible for navigation."
BEGIN, END = "<!-- mcp-install:begin -->", "<!-- mcp-install:end -->"


def version() -> str:
    m = re.search(r'^version\s*=\s*"([^"]+)"', (ROOT / "Cargo.toml").read_text(encoding="utf-8"), re.M)
    assert m, "no version in Cargo.toml"
    return m.group(1)


def servers(ver: str) -> dict[str, dict]:
    """The three ways to start the server: through npm (the launcher), in Docker, or from PATH."""
    return {
        "npx": {"command": "npx", "args": ["-y", f"kshana-mcp@{ver}"]},
        "docker": {"command": "docker", "args": ["run", "-i", "--rm", f"{GHCR}:{ver}"]},
        "binary": {"command": "kshana-mcp", "args": []},
    }


FORM_LABEL = {"npx": "npx (Node)", "docker": "Docker", "binary": "kshana-mcp on PATH"}
FORM_NEEDS = {"npx": "Node 18+", "docker": "Docker", "binary": "the binary (brew, scoop, winget, cargo or a release download)"}


# ---- one-click links -----------------------------------------------------------------------------
def cursor_link(name: str, srv: dict, web: bool = True) -> str:
    """Cursor: the server's config as base64 JSON (no name key), the name beside it."""
    cfg = base64.b64encode(json.dumps(srv, separators=(",", ":")).encode()).decode()
    if web:
        return f"https://cursor.com/en/install-mcp?name={urllib.parse.quote(name)}&config={urllib.parse.quote(cfg)}"
    return f"cursor://anysphere.cursor-deeplink/mcp/install?name={urllib.parse.quote(name)}&config={cfg}"


def vscode_link(name: str, srv: dict, insiders: bool = False) -> str:
    """VS Code: `vscode:mcp/install?<URL-encoded JSON with name>`, opened through the vscode.dev redirect."""
    payload = json.dumps({"name": name, **srv}, separators=(",", ":"))
    scheme = "vscode-insiders" if insiders else "vscode"
    inner = f"{scheme}:mcp/install?{urllib.parse.quote(payload, safe='')}"
    return "https://insiders.vscode.dev/redirect?url=" + urllib.parse.quote(inner, safe="")


def goose_link(name: str, srv: dict, ver: str) -> str:
    """Goose: one `arg` parameter per argument, every value URL-encoded."""
    q = [("cmd", srv["command"])] + [("arg", a) for a in srv["args"]] + [
        ("timeout", "300"), ("id", name), ("name", "Kshana"),
        ("description", "Kshana PNT-resilience simulator (advisory)"),
    ]
    return "goose://extension?" + "&".join(f"{k}={urllib.parse.quote(v, safe='')}" for k, v in q)


# ---- per-client snippets --------------------------------------------------------------------------
def shell(parts: list[str]) -> str:
    return " ".join(p if re.fullmatch(r"[A-Za-z0-9_@%+=:,./-]+", p) else json.dumps(p) for p in parts)


def mcp_servers_json(srv: dict) -> str:
    return json.dumps({"mcpServers": {"kshana": srv}}, indent=2)


def snippets(ver: str) -> list[dict]:
    """Each client: where the config goes, and the text to paste, per form."""
    out = []
    S = servers(ver)

    def add(client, where, fn, note=""):
        out.append({"client": client, "where": where, "forms": {f: fn(S[f]) for f in S}, "note": note})

    add("Claude Code", "run in a terminal (add `--scope user` for every project)",
        lambda s: "claude mcp add kshana -- " + shell([s["command"], *s["args"]]), "or the plugin below")
    add("Claude Desktop", "`claude_desktop_config.json` (Settings, Developer, Edit Config)", mcp_servers_json,
        "or double-click the `.mcpb` extension from the release: no config file")
    add("Cursor", "`~/.cursor/mcp.json` (or `.cursor/mcp.json` in a project)", mcp_servers_json)
    add("VS Code", "`.vscode/mcp.json`",
        lambda s: json.dumps({"servers": {"kshana": {"type": "stdio", **s}}}, indent=2),
        "or `code --add-mcp` with the same object plus a `name`")
    add("Windsurf", "`mcp_config.json` (open it from Cascade's MCP settings)", mcp_servers_json)
    add("Zed", "`settings.json`",
        lambda s: json.dumps({"context_servers": {"kshana": s}}, indent=2))
    add("Goose", "`~/.config/goose/config.yaml`",
        lambda s: "extensions:\n  kshana:\n    name: Kshana\n    type: stdio\n    cmd: " + s["command"] +
        "\n    args: " + json.dumps(s["args"]) + "\n    enabled: true\n    timeout: 300")
    add("Codex CLI", "run in a terminal, or `~/.codex/config.toml`",
        lambda s: "codex mcp add kshana -- " + shell([s["command"], *s["args"]]) +
        "\n\n# or in config.toml:\n[mcp_servers.kshana]\ncommand = " + json.dumps(s["command"]) +
        "\nargs = " + json.dumps(s["args"]))
    add("Gemini CLI", "`~/.gemini/settings.json`, or `gemini mcp add`",
        lambda s: mcp_servers_json(s) + "\n\n# or:\ngemini mcp add kshana " + s["command"] +
        (" -- " + shell(s["args"]) if s["args"] else ""))
    add("Continue", "`.continue/mcpServers/kshana.yaml`",
        lambda s: "name: Kshana\nversion: 0.0.1\nschema: v1\nmcpServers:\n  - name: kshana\n    command: " +
        s["command"] + "\n    args:" + ("".join("\n      - " + json.dumps(a) for a in s["args"]) if s["args"] else " []"))
    return out


# ---- the channel table -----------------------------------------------------------------------------
def link(text: str, url: str) -> str:
    return f"[{text}]({url})"


def channels(ver: str) -> list[dict]:
    S = servers(ver)
    rel = f"https://github.com/{REPO}/releases/download/v{ver}"
    return [
        {"id": "mcpb", "name": "Claude Desktop extension", "action": "double-click the `.mcpb` for your system: " +
         " · ".join(link(t, f"{rel}/kshana-mcp-{tg}.mcpb") for t, tg in [
             ("macOS (Apple silicon)", "aarch64-apple-darwin"), ("macOS (Intel)", "x86_64-apple-darwin"),
             ("Windows", "x86_64-pc-windows-msvc")]), "requires": "none", "pinned": f"`kshana-mcp-<target>.mcpb` of v{ver}"},
        {"id": "cursor", "name": "Cursor (one click)", "action": " · ".join(
            link(FORM_LABEL[f], cursor_link("kshana", S[f])) for f in ("npx", "docker")),
         "requires": "Node, or Docker", "pinned": f"`kshana-mcp@{ver}` / `{GHCR}:{ver}`"},
        {"id": "vscode", "name": "VS Code (one click)", "action": " · ".join(
            link(FORM_LABEL[f], vscode_link("kshana", S[f])) for f in ("npx", "docker")) + " · " + link(
            "Insiders (npx)", vscode_link("kshana", S["npx"], insiders=True)),
         "requires": "Node, or Docker", "pinned": f"`kshana-mcp@{ver}` / `{GHCR}:{ver}`"},
        {"id": "claude-code", "name": "Claude Code", "action": f"`claude mcp add kshana -- npx -y kshana-mcp@{ver}` · plugin: "
         f"`/plugin marketplace add {REPO}` then `/plugin install kshana@ashforde`", "requires": "Node (or Docker)", "pinned": f"`kshana-mcp@{ver}`"},
        {"id": "npx", "name": "npx", "action": f"`npx -y kshana-mcp@{ver}`", "requires": "Node 18+", "pinned": f"`kshana-mcp@{ver}`"},
        {"id": "uvx", "name": "uvx / pipx", "action": f"`uvx kshana-mcp=={ver}` · `pipx run kshana-mcp=={ver}`", "requires": "Python 3.9+ with uv or pipx", "pinned": f"`kshana-mcp=={ver}`"},
        {"id": "docker", "name": "Docker", "action": f"`docker run -i --rm {GHCR}:{ver}`", "requires": "Docker", "pinned": f"`{GHCR}:{ver}`"},
        {"id": "brew", "name": "Homebrew", "action": "`brew install ashfordeOU/tap/kshana-mcp`", "requires": "brew", "pinned": f"formula for v{ver}"},
        {"id": "scoop", "name": "Scoop", "action": "`scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` then `scoop install kshana-mcp`", "requires": "Scoop (Windows)", "pinned": f"manifest for v{ver}"},
        {"id": "winget", "name": "winget", "action": "`winget install AshfordeOU.KshanaMcp`", "requires": "winget (Windows)", "pinned": f"`--version {ver}`"},
        {"id": "cargo", "name": "cargo", "action": f"`cargo install kshana-mcp --version {ver}`", "requires": "Rust 1.88+", "pinned": f"`kshana-mcp {ver}`"},
        {"id": "binary", "name": "Prebuilt binary", "action": link("the release page", f"https://github.com/{REPO}/releases/tag/v{ver}") +
         ": `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, checked by `SHA256SUMS` and `gh attestation verify`", "requires": "none", "pinned": f"v{ver}"},
        {"id": "registry", "name": "MCP registry", "action": "`io.github.ashfordeOU/kshana-mcp` (found by registry-aware clients)", "requires": "a registry-aware client", "pinned": f"`{ver}`"},
        {"id": "http", "name": "Remote (streamable HTTP)", "action": "`kshana-mcp --http 127.0.0.1:8080`, self-hosted: see [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md)", "requires": "your own host", "pinned": f"v{ver}"},
    ]


def table(ver: str, prefix: str = "") -> str:
    rows = ["| Channel | Command or button | Requires | Pinned form |", "|---|---|---|---|"]
    for c in channels(ver):
        action = c["action"].replace("docs/deploy/", prefix + "docs/deploy/")
        rows.append(f"| {c['name']} | {action} | {c['requires']} | {c['pinned']} |")
    return "\n".join(rows)


def install_doc(ver: str) -> str:
    S = servers(ver)
    parts = [
        "<!-- SPDX-License-Identifier: AGPL-3.0-only -->",
        "<!-- GENERATED by scripts/gen_mcp_install.py: do not edit by hand. -->",
        f"# Install the Kshana MCP server (v{ver})",
        "",
        f"> {ADVISORY} The server runs on your computer; nothing is sent to Ashforde OÜ.",
        "",
        "Every channel, with the pinned form for this release. The one-click links and every snippet below are",
        "generated by `scripts/gen_mcp_install.py` and decoded again by `scripts/test_gen_mcp_install.py`.",
        "",
        "## Every channel",
        "",
        table(ver, prefix="../"),
        "",
        "## Pick a way to start the server",
        "",
        "Each client below takes one of three server definitions. They start the same server:",
        "",
    ]
    for f, s in S.items():
        parts.append(f"* **{FORM_LABEL[f]}** (needs {FORM_NEEDS[f]}): `{shell([s['command'], *s['args']])}`")
    parts += ["", "## One-click links", ""]
    for f in ("npx", "docker", "binary"):
        parts.append(f"* Cursor, {FORM_LABEL[f]}: {link('web link', cursor_link('kshana', S[f]))} · `{cursor_link('kshana', S[f], web=False)}`")
    for f in ("npx", "docker", "binary"):
        parts.append(f"* VS Code, {FORM_LABEL[f]}: {link('open', vscode_link('kshana', S[f]))} · "
                     f"{link('Insiders', vscode_link('kshana', S[f], insiders=True))}")
    parts.append(f"* Goose, npx: `{goose_link('kshana', S['npx'], ver)}`")
    parts += ["", "## Claude Code plugin", "", f"```\n/plugin marketplace add {REPO}\n/plugin install kshana@ashforde\n```", ""]
    parts += ["## Each client's configuration", ""]
    for sn in snippets(ver):
        parts += [f"### {sn['client']}", "", f"Where: {sn['where']}." + (f" {sn['note'].capitalize()}." if sn["note"] else ""), ""]
        for f, text in sn["forms"].items():
            lang = "json" if text.lstrip().startswith("{") else ("yaml" if text.lstrip().startswith(("name:", "extensions:")) else "sh")
            parts += [f"{FORM_LABEL[f]}:", "", f"```{lang}", text, "```", ""]
    parts += ["## Remote use", "",
              "`kshana-mcp --http <addr>` serves the same tools over streamable HTTP for a client that cannot run a local",
              "process. It is for self-hosting; Ashforde OÜ does not run a public endpoint. See",
              "[deploy/mcp-http.md](deploy/mcp-http.md).", ""]
    return "\n".join(parts)


def splice(text: str, block: str) -> str:
    if BEGIN not in text or END not in text:
        raise SystemExit("FAIL: the mcp-install markers are missing")
    head, rest = text.split(BEGIN, 1)
    _, tail = rest.split(END, 1)
    return head + BEGIN + "\n" + block + "\n" + END + tail


def targets(ver: str) -> dict[Path, str]:
    out = {ROOT / "docs" / "MCP-INSTALL.md": install_doc(ver)}
    for rel, prefix in (("README.md", ""), ("mcp/kshana-mcp/README.md", f"https://github.com/{REPO}/blob/main/")):
        p = ROOT / rel
        if p.exists() and BEGIN in p.read_text(encoding="utf-8"):
            out[p] = splice(p.read_text(encoding="utf-8"), table(ver, prefix))
    return out


def main(argv: list[str]) -> int:
    ver = version()
    if "--json" in argv:
        print(json.dumps({"version": ver, "channels": channels(ver)}, indent=2))
        return 0
    stale = []
    for path, text in targets(ver).items():
        old = path.read_text(encoding="utf-8") if path.exists() else None
        if old != text:
            stale.append(path)
            if "--check" not in argv:
                path.write_text(text, encoding="utf-8")
    if "--check" in argv:
        if stale:
            print("FAIL: stale generated file(s); run scripts/gen_mcp_install.py: " +
                  ", ".join(str(p.relative_to(ROOT)) for p in stale), file=sys.stderr)
            return 1
        print("OK: the MCP install files are current")
    else:
        print("wrote: " + (", ".join(str(p.relative_to(ROOT)) for p in stale) or "nothing (already current)"))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
