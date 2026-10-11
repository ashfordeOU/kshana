#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Offline tests for the kshana-mcp additions to check_channel_parity.py."""
import importlib.util
import pathlib
import unittest

spec = importlib.util.spec_from_file_location(
    "parity", pathlib.Path(__file__).with_name("check_channel_parity.py"))
parity = importlib.util.module_from_spec(spec)
spec.loader.exec_module(parity)


class ParityTests(unittest.TestCase):
    def test_release_assets_reports_missing_names(self):
        have = [{"name": n} for n in parity.MCP_BINARIES[:-1]]
        parity.fetch_json = lambda url: (200, {"assets": have})
        ok, detail = parity.release_assets("0.35.0")
        self.assertFalse(ok)
        self.assertIn(parity.MCP_BINARIES[-1], detail)

    def test_release_assets_ok_when_all_present(self):
        have = [{"name": n} for n in parity.MCP_BINARIES] + [
            {"name": "kshana_pi-0.35.0-1_ubuntu-wx32-24.04-x86_64.tar.gz"},
            {"name": "kshana_pi-0.35.0-ubuntu-wx32-x86_64-24.04.xml"},
            {"name": "kshana-grafana-0.35.0.json"}, {"name": "signalk-kshana-trust-0.35.0.tgz"}]
        parity.fetch_json = lambda url: (200, {"assets": have})
        self.assertTrue(parity.release_assets("0.35.0")[0])

    def test_mcp_assets_match_the_release_asset_checker(self):
        text = (pathlib.Path(__file__).with_name("check-release-assets.sh")).read_text()
        for name in parity.MCP_BINARIES:
            self.assertIn(name, text, name)

    def test_npm_and_pypi_launcher_probes(self):
        parity.fetch_json = lambda url: (200, {"version": "0.35.0", "info": {"version": "0.35.0"}})
        self.assertTrue(parity.npm("0.35.0", "kshana-mcp")[0])
        self.assertTrue(parity.pypi_mcp("0.35.0")[0])
        parity.fetch_json = lambda url: (404, None)
        self.assertFalse(parity.pypi_mcp("0.35.0")[0])

    def test_package_manager_probes_look_for_the_version(self):
        parity.fetch = lambda url, headers=None: (200, b'{"version": "0.35.0"}')
        self.assertTrue(parity.scoop("0.35.0")[0])
        self.assertFalse(parity.scoop("0.36.0")[0])

    def test_every_channel_names_a_real_probe(self):
        import subprocess, sys
        r = subprocess.run([sys.executable, str(pathlib.Path(__file__).with_name("gen_channels.py")), "--check"],
                           capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stderr)


if __name__ == "__main__":
    unittest.main()
