// SPDX-License-Identifier: AGPL-3.0-only
// Download-as-HTML-report: assemble the current run into a single self-contained,
// offline, printable HTML file with the engine version, the scenario TOML, the
// one-line summary, a figure-of-merit table, and the rendered charts inlined as
// SVG. No external references — the file opens with nothing fetched, matching the
// "nothing uploaded / runs locally" guarantee.
//
// SECURITY: the scenario TOML and summary are attacker-controllable (a shared
// link carries the TOML), so every scenario-derived string is escaped with
// escapeHtml before it touches the document — the same "never trust scenario
// text" discipline app.js applies everywhere with textContent. Only OUR
// engine/renderer SVGs (the holdover/Allan/orbit/sweep charts WE generate) go in
// as raw markup, never anything from the TOML. Pure: returns a string.

/// Escape the five characters that matter in an HTML text/attribute context.
/// Standard HTML-escape. Applied to every scenario-derived string in the report.
export function escapeHtml(s) {
  return String(s)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

/// Build the report download filename, mirroring chartdl's chartFilename oracle:
/// `kshana-report-v0.12.0-820999dd0e8a.html`. Version and hash are optional and
/// omitted cleanly when absent.
export function reportFilename(meta) {
  const ver = meta && meta.ver ? `-v${meta.ver}` : "";
  const hash = meta && meta.hash ? `-${String(meta.hash).slice(0, 12)}` : "";
  return `kshana-report${ver}${hash}.html`;
}

// Compact, human number for the FoM table (plain mid-range, exponential extremes).
function fmtVal(x) {
  if (typeof x !== "number" || !isFinite(x)) return "—";
  if (x !== 0 && (Math.abs(x) >= 1e4 || Math.abs(x) < 1e-2)) return x.toExponential(2);
  return String(Math.round(x * 1000) / 1000);
}

/// Build a complete `<!doctype html>` report string from `payload`:
///   { engineVersion, scenarioHash, toml, summaryText, fomRows, svgs, generatedIso }
/// where fomRows = [{clockLabel, label, unit, value}] and svgs = [{title, svg}].
/// Every scenario-derived string (toml, summaryText, fomRows text) is escaped;
/// the svgs are inlined as raw markup (OUR renderers). Carries a print stylesheet
/// and a provenance line `Kshana v<ver> · scenario <hash> · generated <iso>`.
export function buildReportHtml(payload) {
  const ver = escapeHtml(payload.engineVersion || "");
  const hash12 = escapeHtml(String(payload.scenarioHash || "").slice(0, 12));
  const iso = escapeHtml(payload.generatedIso || "");
  const summary = escapeHtml(payload.summaryText || "");
  const toml = escapeHtml(payload.toml || "");

  const fomRows = Array.isArray(payload.fomRows) ? payload.fomRows : [];
  const rowsHtml = fomRows
    .map((r) => {
      const metric = r.unit ? `${escapeHtml(r.label)} (${escapeHtml(r.unit)})` : escapeHtml(r.label);
      return `<tr><td>${escapeHtml(r.clockLabel)}</td><td>${metric}</td><td class="num">${escapeHtml(fmtVal(r.value))}</td></tr>`;
    })
    .join("\n");

  const svgs = Array.isArray(payload.svgs) ? payload.svgs : [];
  // The SVG markup is OUR engine/renderer output — inlined raw on purpose; the
  // title is escaped because it is a label that could be derived from scenario data.
  const chartsHtml = svgs
    .map((c) => `<figure class="chart"><figcaption>${escapeHtml(c.title)}</figcaption>${c.svg}</figure>`)
    .join("\n");

  const fomBlock = rowsHtml
    ? `<h2>Figures of merit</h2>\n<table class="fom"><thead><tr><th>Clock</th><th>Metric</th><th class="num">Value</th></tr></thead><tbody>\n${rowsHtml}\n</tbody></table>`
    : "";
  const chartsBlock = chartsHtml ? `<h2>Charts</h2>\n${chartsHtml}` : "";

  return `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Kshana — scenario report</title>
<style>
:root{color-scheme:light dark}
body{font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif;line-height:1.55;max-width:900px;margin:0 auto;padding:2rem 1.25rem 3rem;color:#1c1812;background:#fbf8f2}
@media (prefers-color-scheme: dark){body{color:#e7e0d2;background:#0c0b08}}
.eyebrow{letter-spacing:.18em;text-transform:uppercase;font-size:.72rem;opacity:.6}
h1{font-size:2rem;margin:.1rem 0}
h2{font-size:1.15rem;margin:1.6rem 0 .6rem;border-bottom:1px solid #8884;padding-bottom:.2rem}
.summary{font-family:ui-monospace,Menlo,Consolas,monospace;font-size:.86rem;border-left:3px solid #cdb079;padding:.7rem .9rem;background:rgba(205,176,121,.12);border-radius:8px;overflow-x:auto;white-space:pre-wrap;word-break:break-word}
table.fom{border-collapse:collapse;width:100%;font-size:.9rem}
table.fom th,table.fom td{border:1px solid #8884;padding:.35rem .6rem;text-align:left}
table.fom .num{text-align:right;font-variant-numeric:tabular-nums}
.chart{margin:1rem 0;text-align:center}
.chart svg{max-width:100%;height:auto}
.chart figcaption{font-size:.85rem;opacity:.7;margin-bottom:.3rem}
pre{font-family:ui-monospace,Menlo,Consolas,monospace;font-size:.78rem;overflow:auto;border:1px solid #8884;border-radius:8px;padding:.7rem .9rem;white-space:pre-wrap;word-break:break-word}
footer{margin-top:2rem;padding-top:1rem;border-top:1px solid #8884;font-size:.82rem;opacity:.75}
@media print{body{max-width:none;background:#fff;color:#000}.chart{break-inside:avoid}h2{break-after:avoid}}
</style>
</head>
<body>
<p class="eyebrow">क्षण · the precise instant</p>
<h1>Kshana — scenario report</h1>
<p class="summary">${summary}</p>
${fomBlock}
${chartsBlock}
<h2>Scenario definition (TOML)</h2>
<pre>${toml}</pre>
<footer>Kshana v${ver} · scenario ${hash12} · generated ${iso}. Reproducible from scenario + seed + engine version. Runs locally; nothing uploaded.</footer>
</body>
</html>
`;
}
