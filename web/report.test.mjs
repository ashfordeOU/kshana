// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the download-as-HTML-report builder. Every scenario-derived string
// must be HTML-escaped (the scenario TOML is attacker-controllable via shared
// links); only OUR engine/renderer SVGs go in as raw markup. Pure logic; the
// browser blob download is verified in the page. Run with `node web/report.test.mjs`.
import { buildReportHtml, escapeHtml, fomTier, reportFilename } from "./report.mjs";
import assert from "node:assert/strict";

// escapeHtml: the standard HTML-escape oracle for the five significant chars.
{
  assert.equal(escapeHtml('<b>&"x"'), "&lt;b&gt;&amp;&quot;x&quot;", "escapes < > & \"");
  assert.equal(escapeHtml("a'b"), "a&#39;b", "escapes single quote");
  assert.equal(escapeHtml("plain"), "plain", "leaves plain text alone");
  assert.equal(escapeHtml(""), "", "empty string");
}

// reportFilename: provenance-stamped, 12-char hash, mirrors chartdl's oracle.
{
  assert.equal(
    reportFilename({ ver: "0.12.0", hash: "820999dd0e8a1122" }),
    "kshana-report-v0.12.0-820999dd0e8a.html",
    "version + 12-char hash + .html",
  );
  assert.equal(reportFilename(null), "kshana-report.html", "no meta -> bare name");
  assert.equal(reportFilename({ ver: "1.2.3" }), "kshana-report-v1.2.3.html", "version only");
}

// buildReportHtml: a complete, self-contained document; version + escaped TOML +
// each SVG present; a malicious scenario TOML is escaped (XSS oracle).
{
  const payload = {
    engineVersion: "0.13.0",
    scenarioHash: "820999dd0e8a1122",
    toml: '# danger\nseed = 42\n[evil]\nx = "<script>alert(1)</script>"',
    summaryText: "scenario 820999dd0e8a | quantum holdover 120s",
    fomRows: [
      { clockLabel: "optical", metric: "holdover_s", label: "Holdover", unit: "s", value: 120 },
      { clockLabel: "csac", metric: "holdover_s", label: "Holdover", unit: "s", value: 12 },
    ],
    svgs: [
      { title: "Holdover", svg: '<svg id="holdover-svg"><rect/></svg>' },
      { title: "Stability", svg: '<svg id="allan-svg"><rect/></svg>' },
    ],
    generatedIso: "2026-06-08T00:00:00Z",
  };
  const html = buildReportHtml(payload);

  assert.ok(html.startsWith("<!doctype html>"), "starts with <!doctype html>");
  assert.ok(html.includes("0.13.0"), "contains the engine version");

  // The scenario TOML appears ESCAPED — no raw <script> from the malicious TOML.
  assert.ok(html.includes("&lt;script&gt;"), "scenario script tag is escaped");
  assert.ok(!html.includes("<script>alert(1)</script>"), "no raw injected script tag");
  // The summary (also scenario-derived) round-trips its visible text.
  assert.ok(html.includes("quantum holdover 120s"), "summary text present");

  // Each OUR-controlled SVG goes in as raw markup (the renderers, not the TOML).
  assert.ok(html.includes('<svg id="holdover-svg">'), "holdover SVG inlined raw");
  assert.ok(html.includes('<svg id="allan-svg">'), "stability SVG inlined raw");

  // The provenance line: Kshana v<ver> · scenario <hash> · generated <iso>.
  assert.ok(html.includes("820999dd0e8a"), "carries the 12-char scenario hash");
  assert.ok(html.includes("2026-06-08T00:00:00Z"), "carries the generated timestamp");

  // FoM table values present.
  assert.ok(html.includes("120") && html.includes("optical"), "FoM rows rendered");
  // The per-FoM validation tier label renders inline (holdover is MODELLED) and
  // the table carries a Validation column header — surfaced from the matrix.
  assert.ok(html.includes("MODELLED"), "per-FoM validation tier label rendered");
  assert.ok(html.includes("Validation"), "FoM table has a Validation column");
  // Self-contained + printable.
  assert.ok(html.includes("@media print"), "carries a print stylesheet");
  assert.ok(html.trim().endsWith("</html>"), "ends with </html>");
}

// buildReportHtml: tolerates a payload with no svgs / no fomRows (no throw).
{
  const html = buildReportHtml({
    engineVersion: "0.13.0",
    scenarioHash: "abc",
    toml: "seed = 1",
    summaryText: "ok",
    fomRows: [],
    svgs: [],
    generatedIso: "2026-06-08T00:00:00Z",
  });
  assert.ok(html.startsWith("<!doctype html>"), "minimal payload still valid");
}

// fomTier: mirrors src/fom_label.rs — every known FoM is MODELLED (none is
// VALIDATED in the matrix), and an unknown metric gets no validation halo.
{
  for (const k of [
    "timing_rms_ns",
    "timing_p95_ns",
    "holdover_s",
    "resilience_slope_ns_per_s",
    "availability",
    "integrity",
    "security",
  ]) {
    assert.equal(fomTier(k), "MODELLED", `${k} is MODELLED`);
  }
  assert.equal(fomTier("not_a_fom"), "", "unknown metric gets no tier");
}

console.log("report.test.mjs: all assertions passed");
