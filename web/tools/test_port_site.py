#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Tests for the patterns and parsing in web/tools/port_site.py that read page markup and report text.

    python3 web/tools/test_port_site.py

The inline-block reader is a parser (a closing tag may be `</script >` or carry attributes), and the report
command pattern has one quantifier (a long path must not backtrack): both are checked, including inputs
built to make a nested-quantifier pattern run for minutes.
"""
import sys
import time
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import port_site as P  # noqa: E402


def swap(m):
    return f"{m.group(1)}scenarios/{m.group(2)}"


class ReportCommand(unittest.TestCase):
    def test_a_machine_path_is_reduced_to_the_scenario_name(self):
        self.assertEqual(P.REPORT_CMD.sub(swap, "run: kshana /tmp/x/y/clock-holdover.toml --json"),
                         "run: kshana scenarios/clock-holdover.toml --json")
        self.assertEqual(P.REPORT_CMD.sub(swap, "kshana /a.toml"), "kshana scenarios/a.toml")
        self.assertEqual(P.REPORT_CMD.sub(swap, "kshana /Users/x/work/kshana/scenarios/leo-pass.toml"),
                         "kshana scenarios/leo-pass.toml")

    def test_a_relative_path_markup_or_a_quote_is_left_alone(self):
        for t in ("kshana scenarios/a.toml", "kshana /a/<b>/c.toml", 'kshana /a/"b/c.toml', "kshana /a/b/c.txt"):
            self.assertEqual(P.REPORT_CMD.sub(swap, t), t)

    def test_a_pathological_path_finishes_quickly(self):
        # Nested quantifiers made this kind of input exponential; the single-quantifier pattern is linear.
        for evil in ("kshana " + "/a" * 80000 + "!", "kshana /" + "a/" * 80000 + "x.toml!", "kshana " + "/" * 200000):
            t = time.monotonic()
            P.REPORT_CMD.sub(swap, evil)
            self.assertLess(time.monotonic() - t, 2.0, "report-command pattern took too long")


class InlineBlocks(unittest.TestCase):
    def test_closing_tags_in_every_legal_form_end_the_block(self):
        for close in ("</script>", "</script >", "</SCRIPT>", "</script\n>", "</script foo=bar>"):
            page = f'<script>fetch("https://a.example/x"){close}<p>after</p>'
            self.assertEqual(P.third_party_requests("a.html", page), ["https://a.example/x"], repr(close))

    def test_script_kinds_are_told_apart(self):
        page = (
            '<script src="local.js">fetch("https://never.example/")</script>'
            '<script type="application/ld+json">{"u":"https://json.example/"}</script>'
            '<script type="importmap">{"imports":{"a":"https://map.example/a.js"}}</script>'
            "<style>@import url(https://css.example/a.css);</style>"
            "<script>import x from 'https://mod.example/m.js'</script>"
        )
        got = sorted(P.third_party_requests("a.html", page))
        self.assertEqual(got, ["https://css.example/a.css", "https://map.example/a.js", "https://mod.example/m.js"])

    def test_text_outside_blocks_is_not_read_as_script(self):
        self.assertEqual(P.third_party_requests("a.html", "<p>fetch('https://prose.example/')</p>"), [])

    def test_an_unterminated_block_is_still_read(self):
        self.assertEqual(P.third_party_requests("a.html", "<script>fetch('https://open.example/x')"), ["https://open.example/x"])

    def test_a_huge_hostile_page_is_read_in_linear_time(self):
        for evil in ("<script " * 60000, "<style>" + "<!--" * 60000, "<script>" + "</scrip" * 60000, "<" * 200000):
            t = time.monotonic()
            P.third_party_requests("a.html", evil)
            self.assertLess(time.monotonic() - t, 5.0, "page reader took too long")


if __name__ == "__main__":
    unittest.main()
