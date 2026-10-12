#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the package manifests from a made-up SHA256SUMS and check every URL and checksum in them."""
import json
import re
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gen_pkg_manifests as g  # noqa: E402

VER = "9.8.7"
ASSETS = sorted(set(g.BREW.values()) | {g.WIN})
SUMS = {a: f"{i:02x}" * 32 for i, a in enumerate(ASSETS, start=1)}


class Manifests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.dir = Path(tempfile.mkdtemp())
        (cls.dir / "SHA256SUMS").write_text("".join(f"{h}  {a}\n" for a, h in SUMS.items()) + f"{'f' * 64}  kshana\n")
        rc = g.main(["gen", VER, str(cls.dir / "SHA256SUMS"), str(cls.dir / "out")])
        assert rc == 0

    @classmethod
    def tearDownClass(cls):
        shutil.rmtree(cls.dir, ignore_errors=True)

    def test_formula_has_every_platform_url_and_checksum(self):
        text = (self.dir / "out/homebrew/Formula/kshana-mcp.rb").read_text()
        for (os_name, arch), asset in g.BREW.items():
            self.assertIn(f'url "https://github.com/ashfordeOU/kshana/releases/download/v{VER}/{asset}"', text)
            self.assertIn(f'sha256 "{SUMS[asset]}"', text)
        self.assertIn(f'version "{VER}"', text)
        self.assertIn("AGPL-3.0-only", text)
        if shutil.which("ruby"):
            subprocess.run(["ruby", "-c", str(self.dir / "out/homebrew/Formula/kshana-mcp.rb")], check=True, capture_output=True)

    def test_scoop_manifest_parses_and_matches(self):
        doc = json.loads((self.dir / "out/scoop/bucket/kshana-mcp.json").read_text())
        arch = doc["architecture"]["64bit"]
        self.assertEqual(doc["version"], VER)
        self.assertEqual(arch["hash"], SUMS[g.WIN])
        self.assertEqual(arch["url"], f"https://github.com/ashfordeOU/kshana/releases/download/v{VER}/{g.WIN}#/kshana-mcp.exe")
        self.assertEqual(doc["bin"], "kshana-mcp.exe")
        self.assertIn("v$version", doc["autoupdate"]["architecture"]["64bit"]["url"])

    def test_winget_manifests_agree_with_the_sums(self):
        d = self.dir / f"out/winget/manifests/a/AshfordeOU/KshanaMcp/{VER}"
        files = sorted(p.name for p in d.iterdir())
        self.assertEqual(files, ["AshfordeOU.KshanaMcp.installer.yaml", "AshfordeOU.KshanaMcp.locale.en-US.yaml", "AshfordeOU.KshanaMcp.yaml"])
        inst = (d / "AshfordeOU.KshanaMcp.installer.yaml").read_text()
        self.assertIn(f"InstallerSha256: {SUMS[g.WIN].upper()}", inst)
        self.assertIn(f"/download/v{VER}/{g.WIN}", inst)
        for p in d.iterdir():
            text = p.read_text()
            self.assertIn(f"PackageVersion: {VER}", text)
            self.assertIn("ManifestVersion: 1.6.0", text)
            if shutil.which("ruby"):
                subprocess.run(["ruby", "-ryaml", "-e", "YAML.safe_load(File.read(ARGV[0]))", str(p)], check=True, capture_output=True)

    def test_a_missing_asset_fails_clearly(self):
        bad = self.dir / "short"
        bad.write_text(f"{'a' * 64}  kshana\n")
        self.assertEqual(g.main(["gen", VER, str(bad), str(self.dir / "o2")]), 1)

    def test_no_banned_stems_or_hand_typed_hashes(self):
        for p in (self.dir / "out").rglob("*"):
            if p.is_file():
                t = p.read_text().lower()
                for stem in ("certif", "complies", "compliant", "conform"):
                    self.assertNotIn(stem, t)


if __name__ == "__main__":
    unittest.main()
