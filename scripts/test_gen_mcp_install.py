#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Decode every generated one-click link and compare it with the server definition it came from.

    python3 scripts/test_gen_mcp_install.py

The links are what a reader clicks, so a link that decodes to something else than the definition we meant
is a defect no one would see until a click fails. Also checks that the generated files are current, that
each client snippet parses (JSON and TOML are parsed, YAML is checked structurally), and that no
snippet or link carries a path, secret or a form without the pinned version.
"""
from __future__ import annotations

import base64
import json
import sys
import tomllib
import unittest
import urllib.parse
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gen_mcp_install as g  # noqa: E402

VER = g.version()
S = g.servers(VER)


class Links(unittest.TestCase):
    def test_cursor_config_round_trips_and_has_no_name_key(self):
        for form, srv in S.items():
            for web in (True, False):
                url = g.cursor_link("kshana", srv, web=web)
                q = urllib.parse.parse_qs(urllib.parse.urlparse(url).query)
                self.assertEqual(q["name"], ["kshana"])
                self.assertEqual(json.loads(base64.b64decode(q["config"][0])), srv, f"{form} web={web}")
                self.assertNotIn("name", json.loads(base64.b64decode(q["config"][0])))
        self.assertTrue(g.cursor_link("kshana", S["npx"], web=False).startswith("cursor://anysphere.cursor-deeplink/mcp/install?"))

    def test_vscode_redirect_round_trips(self):
        for form, srv in S.items():
            for insiders in (False, True):
                url = g.vscode_link("kshana", srv, insiders=insiders)
                self.assertTrue(url.startswith("https://insiders.vscode.dev/redirect?url="))
                inner = urllib.parse.unquote(url.split("?url=", 1)[1])       # the vscode:mcp/install?... link
                scheme = "vscode-insiders" if insiders else "vscode"
                self.assertTrue(inner.startswith(f"{scheme}:mcp/install?"), inner[:40])
                payload = json.loads(urllib.parse.unquote(inner.split("?", 1)[1]))
                self.assertEqual(payload, {"name": "kshana", **srv}, f"{form} insiders={insiders}")

    def test_goose_link_has_one_arg_parameter_per_argument(self):
        url = g.goose_link("kshana", S["npx"], VER)
        q = urllib.parse.parse_qs(urllib.parse.urlparse(url).query)
        self.assertEqual(q["cmd"], ["npx"])
        self.assertEqual(q["arg"], S["npx"]["args"])
        self.assertEqual(q["id"], ["kshana"])

    def test_every_form_is_pinned_to_the_release(self):
        self.assertIn(f"kshana-mcp@{VER}", S["npx"]["args"])
        self.assertTrue(S["docker"]["args"][-1].endswith(f":{VER}"))
        for form in ("npx", "docker"):
            self.assertNotIn("latest", json.dumps(S[form]))


class Snippets(unittest.TestCase):
    def test_json_and_toml_snippets_parse_and_carry_the_definition(self):
        for sn in g.snippets(VER):
            for form, text in sn["forms"].items():
                srv = S[form]
                body = text.split("\n\n# or")[0]
                if body.lstrip().startswith("{"):
                    doc = json.loads(body)
                    inner = next(iter(next(iter(doc.values())).values()))
                    self.assertEqual(inner["command"], srv["command"], sn["client"])
                    self.assertEqual(inner["args"], srv["args"], sn["client"])
                if "[mcp_servers.kshana]" in text:
                    doc = tomllib.loads(text.split("# or in config.toml:\n", 1)[1])
                    self.assertEqual(doc["mcp_servers"]["kshana"], srv)
                if sn["client"] in ("Goose", "Continue"):
                    self.assertIn(srv["command"], text)
                    for a in srv["args"]:
                        self.assertIn(a, text)

    def test_no_path_or_secret_in_a_snippet(self):
        for sn in g.snippets(VER):
            for text in sn["forms"].values():
                for bad in ("/home/", "/Users/", "C:\\", "token", "sk-"):
                    self.assertNotIn(bad, text, sn["client"])

    def test_every_requested_client_has_a_snippet(self):
        have = {s["client"] for s in g.snippets(VER)}
        for want in ("Claude Code", "Claude Desktop", "Cursor", "VS Code", "Windsurf", "Zed", "Goose", "Codex CLI", "Gemini CLI", "Continue"):
            self.assertIn(want, have)


class Files(unittest.TestCase):
    def test_generated_files_are_current(self):
        for path, text in g.targets(VER).items():
            self.assertTrue(path.exists(), f"{path} missing; run scripts/gen_mcp_install.py")
            self.assertEqual(path.read_text(encoding="utf-8"), text, f"{path} is stale; run scripts/gen_mcp_install.py")

    def test_advisory_statement_and_no_banned_stems(self):
        doc = (g.ROOT / "docs" / "MCP-INSTALL.md").read_text(encoding="utf-8").lower()
        self.assertIn("not type-approved navigation equipment", doc)
        for stem in ("certif", "complies", "compliant", "conform"):
            self.assertNotIn(stem, doc)


if __name__ == "__main__":
    unittest.main()
