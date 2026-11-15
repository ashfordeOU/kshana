// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the lab notebook (0.42 U23). A notebook is a list of Markdown and Python
// cells with the outputs of their last run; it is kept in the project folder as
// `notebooks/<name>.ipynb` (Jupyter's nbformat 4, so it opens in Jupyter as it is) and exports
// as a self-contained HTML page and as a PDF (text: the cells and their printed output; figures
// are named, and are in the HTML and Jupyter files). The cite button gives the reference of the
// engine version the notebook ran with. Pure, no DOM; tested in notebook.test.mjs.

/** The format of the notebook files. */
export const NBFORMAT = { nbformat: 4, nbformat_minor: 5 };
/** How Kshana is cited (CITATION.cff; notebook.test.mjs keeps the two in step). */
export const CITE = {
  title: "Kshana — a PNT-resilience simulator with quantum-sensor performance models",
  authors: [{ family: "Baweja", given: "Chakshu" }],
  doi: "10.5281/zenodo.20528627",
  url: "https://github.com/ashfordeOU/kshana",
  licence: "AGPL-3.0-only",
};

let cellSeq = 0;
/** A new cell id: a counter, unique in this window. */
export const cellId = () => `c${(++cellSeq).toString(36)}${Date.now().toString(36).slice(-4)}`;

/** A new notebook: a title cell and an empty code cell. */
export function newNotebook(name) {
  return {
    name: String(name || "Notebook"),
    cells: [
      { id: cellId(), type: "markdown", source: `# ${String(name || "Notebook")}\n\nNotes and Python cells, kept with the project.`, outputs: [], count: null },
      { id: cellId(), type: "code", source: "import kshana\n", outputs: [], count: null },
    ],
    engine: "",
  };
}

/** A notebook file name from its title: letters, digits, - and _, ending in .ipynb. */
export function notebookFile(name) {
  const base = String(name || "notebook").normalize("NFKD").replace(/[^\w-]+/g, "-").replace(/^-+|-+$/g, "").slice(0, 80) || "notebook";
  return `${base}.ipynb`;
}

/** The outputs of a cell from a session's answer (src-tauri/src/python.rs exec). */
export function outputsOf(answer) {
  const out = [];
  if (!answer) return out;
  if (answer.stdout) out.push({ type: "stream", name: "stdout", text: answer.stdout });
  if (answer.stderr) out.push({ type: "stream", name: "stderr", text: answer.stderr });
  for (const png of answer.images || []) if (typeof png === "string" && /^[A-Za-z0-9+/=]+$/.test(png)) out.push({ type: "image", png });
  if (answer.value !== null && answer.value !== undefined) out.push({ type: "value", text: String(answer.value) });
  if (answer.error) out.push({ type: "error", text: String(answer.error) });
  return out;
}

const lines = (text) => { const s = String(text ?? ""); if (!s) return []; const parts = s.split("\n"); return parts.map((l, i) => (i < parts.length - 1 ? `${l}\n` : l)).filter((l) => l !== ""); };

/** The notebook as an .ipynb document (JSON text). */
export function toIpynb(nb) {
  const cells = nb.cells.map((c) => {
    if (c.type === "markdown") return { cell_type: "markdown", id: c.id, metadata: {}, source: lines(c.source) };
    const outputs = (c.outputs || []).map((o) => {
      if (o.type === "stream") return { output_type: "stream", name: o.name === "stderr" ? "stderr" : "stdout", text: lines(o.text) };
      if (o.type === "image") return { output_type: "display_data", data: { "image/png": o.png, "text/plain": ["<Figure>"] }, metadata: {} };
      if (o.type === "value") return { output_type: "execute_result", execution_count: c.count ?? null, data: { "text/plain": lines(o.text) }, metadata: {} };
      const tb = String(o.text || "");
      const last = tb.trim().split("\n").pop() || "Error";
      const [ename, ...rest] = last.split(":");
      return { output_type: "error", ename: ename.trim() || "Error", evalue: rest.join(":").trim(), traceback: tb.split("\n") };
    });
    return { cell_type: "code", id: c.id, metadata: {}, execution_count: c.count ?? null, source: lines(c.source), outputs };
  });
  return JSON.stringify({
    ...NBFORMAT,
    metadata: { kernelspec: { name: "python3", display_name: "Python 3", language: "python" }, language_info: { name: "python" }, kshana: { name: nb.name, engine: nb.engine || "", made_by: "Kshana Desktop" } },
    cells,
  }, null, 1) + "\n";
}

const joinSrc = (s) => (Array.isArray(s) ? s.join("") : String(s ?? ""));

/** A notebook read from .ipynb text (nbformat 4); cells of other kinds become Markdown. Throws on text that is not a notebook. */
export function fromIpynb(text, fallbackName = "Notebook") {
  const d = JSON.parse(text);
  if (!d || d.nbformat !== 4 || !Array.isArray(d.cells)) throw new Error("not a Jupyter notebook (nbformat 4)");
  const meta = (d.metadata && d.metadata.kshana) || {};
  return {
    name: String(meta.name || fallbackName),
    engine: String(meta.engine || ""),
    cells: d.cells.map((c) => {
      const type = c.cell_type === "code" ? "code" : "markdown";
      const outputs = type === "code" ? (c.outputs || []).flatMap((o) => {
        if (o.output_type === "stream") return [{ type: "stream", name: o.name === "stderr" ? "stderr" : "stdout", text: joinSrc(o.text) }];
        if (o.output_type === "error") return [{ type: "error", text: (o.traceback || []).join("\n") || `${o.ename}: ${o.evalue}` }];
        const data = o.data || {};
        if (typeof data["image/png"] === "string") return [{ type: "image", png: data["image/png"].replace(/\s+/g, "") }];
        if (data["text/plain"] !== undefined) return [{ type: "value", text: joinSrc(data["text/plain"]) }];
        return [];
      }) : [];
      return { id: typeof c.id === "string" && /^[\w-]{1,64}$/.test(c.id) ? c.id : cellId(), type, source: joinSrc(c.source), outputs, count: type === "code" && Number.isInteger(c.execution_count) ? c.execution_count : null };
    }),
  };
}

const esc = (s) => String(s ?? "").replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");

/** A small, safe Markdown subset as HTML: headings, paragraphs, lists, code spans and blocks, bold and italics. Everything is escaped first. */
export function markdownHtml(md) {
  const out = [];
  const blocks = String(md || "").replace(/\r\n/g, "\n").split(/\n{2,}/);
  const inline = (s) => esc(s).replace(/`([^`]+)`/g, (m, a) => `<code>${a}</code>`).replace(/\*\*([^*]+)\*\*/g, (m, a) => `<strong>${a}</strong>`).replace(/(^|[^*])\*([^*]+)\*/g, (m, a, b) => `${a}<em>${b}</em>`);
  for (const b of blocks) {
    if (!b.trim()) continue;
    if (/^```/.test(b)) { out.push(`<pre><code>${esc(b.replace(/^```\w*\n?/, "").replace(/\n?```\s*$/, ""))}</code></pre>`); continue; }
    const hm = /^(#{1,6})\s+(.*)$/.exec(b);
    if (hm && !b.includes("\n")) { out.push(`<h${hm[1].length}>${inline(hm[2])}</h${hm[1].length}>`); continue; }
    const ls = b.split("\n");
    if (ls.every((l) => /^\s*[-*]\s+/.test(l))) { out.push(`<ul>${ls.map((l) => `<li>${inline(l.replace(/^\s*[-*]\s+/, ""))}</li>`).join("")}</ul>`); continue; }
    if (ls.every((l) => /^\s*\d+[.)]\s+/.test(l))) { out.push(`<ol>${ls.map((l) => `<li>${inline(l.replace(/^\s*\d+[.)]\s+/, ""))}</li>`).join("")}</ol>`); continue; }
    if (hm) { out.push(`<h${hm[1].length}>${inline(hm[2])}</h${hm[1].length}>`); out.push(`<p>${ls.slice(1).map(inline).join("<br>")}</p>`); continue; }
    out.push(`<p>${ls.map(inline).join("<br>")}</p>`);
  }
  return out.join("\n");
}

/** The notebook as one self-contained HTML page (no script, no request; figures as data URIs). */
export function toHtml(nb, { made = "" } = {}) {
  const cells = nb.cells.map((c) => {
    if (c.type === "markdown") return `<section class="md">${markdownHtml(c.source)}</section>`;
    const outs = (c.outputs || []).map((o) => {
      if (o.type === "image") return `<img alt="Figure" src="data:image/png;base64,${o.png.replace(/[^A-Za-z0-9+/=]/g, "")}">`;
      return `<pre class="out ${o.type === "error" ? "err" : o.name === "stderr" ? "warn" : ""}">${esc(o.text)}</pre>`;
    }).join("\n");
    return `<section class="code"><div class="in"><span class="n">[${c.count ?? " "}]</span><pre>${esc(c.source)}</pre></div>${outs}</section>`;
  }).join("\n");
  return `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>${esc(nb.name)}</title>
<style>
:root{color-scheme:light dark;--bg:\x23fff;--ink:\x231b1d24;--mute:\x235b6070;--code:\x23f4f5f8;--err:\x23a1262b}
@media (prefers-color-scheme:dark){:root{--bg:\x23111318;--ink:\x23e7e9ee;--mute:\x239aa0ad;--code:\x231b1e26;--err:\x23ff8a8f}}
body{background:var(--bg);color:var(--ink);font:15px/1.55 system-ui,sans-serif;max-width:860px;margin:32px auto;padding:0 16px}
pre{background:var(--code);padding:10px 12px;border-radius:6px;overflow:auto;font:13px/1.45 ui-monospace,monospace;white-space:pre-wrap}
.in{display:flex;gap:8px}.in pre{flex:1;margin:0}.n{color:var(--mute);font:12px ui-monospace,monospace;padding-top:12px;min-width:3em}
.out{background:none;border-left:3px solid var(--code);margin:6px 0 6px 3.5em}.err{color:var(--err)}.warn{color:var(--mute)}
img{max-width:100%;margin:6px 0 6px 3.5em;background:\x23fff}section{margin:14px 0}footer{color:var(--mute);font-size:12px;margin-top:32px}
</style></head><body>
${cells}
<footer>Exported from Kshana Desktop${nb.engine ? ` · engine ${esc(nb.engine)}` : ""}${made ? ` · ${esc(made)}` : ""}. The outputs are those of each cell's last run on the author's computer.</footer>
</body></html>
`;
}

/** The reference of Kshana at an engine version: { text, bibtex, markdown }. */
export function citation(version, { year = new Date().getUTCFullYear() } = {}) {
  const v = String(version || "").replace(/^v/, "") || "unknown version";
  const a = CITE.authors.map((x) => `${x.family}, ${x.given}`).join(" and ");
  const short = CITE.authors.map((x) => `${x.family}, ${x.given[0]}.`).join(", ");
  const text = `${short} (${year}). ${CITE.title} (version ${v}) [Computer software]. https://doi.org/${CITE.doi}`;
  const bibtex = `@software{kshana_${v.replace(/[^\w]/g, "_")},\n  author  = {${a}},\n  title   = {${CITE.title}},\n  version = {${v}},\n  year    = {${year}},\n  doi     = {${CITE.doi}},\n  url     = {${CITE.url}},\n  license = {${CITE.licence}}\n}`;
  return { text, bibtex, markdown: `> ${text}\n\n\`\`\`bibtex\n${bibtex}\n\`\`\`` };
}

// ---------------------------------------------------------------- PDF (text)
const A4 = [595.28, 841.89], MARGIN = 50;
const winAnsi = (s) => String(s).replace(/[‘’]/g, "'").replace(/[“”]/g, '"').replace(/[–—]/g, "-").replace(/…/g, "...").replace(/[^\x09\x0a\x20-\x7e\xa0-\xff]/g, "?");
const pdfStr = (s) => `(${winAnsi(s).replace(/\\/g, "\\\\").replace(/\(/g, "\\(").replace(/\)/g, "\\)").replace(/\t/g, "    ")})`;
/** Wrap `text` at `width` characters (hard-breaking long words). */
export function wrap(text, width) {
  const out = [];
  for (const raw of String(text ?? "").replace(/\r\n/g, "\n").split("\n")) {
    let line = raw.replace(/\t/g, "    ");
    if (!line.length) { out.push(""); continue; }
    while (line.length > width) {
      let cut = line.lastIndexOf(" ", width);
      if (cut < width * 0.5) cut = width;
      out.push(line.slice(0, cut).replace(/\s+$/, ""));
      line = line.slice(cut).replace(/^ /, "");
    }
    out.push(line);
  }
  return out;
}

/**
 * The notebook as a PDF (bytes): A4 pages of text, Markdown in Helvetica, code and output in
 * Courier; a figure is named where it was ("[figure n: see the HTML or Jupyter export]").
 */
export function toPdf(nb, { made = "" } = {}) {
  const items = [];
  const push = (font, size, text, gap = 0, indent = 0) => items.push({ font, size, text, gap, indent });
  push("F2", 16, nb.name, 0);
  push("F1", 8, `Kshana Desktop notebook${nb.engine ? ` · engine ${nb.engine}` : ""}${made ? ` · ${made}` : ""}`, 4);
  let fig = 0;
  for (const c of nb.cells) {
    if (c.type === "markdown") {
      for (const block of String(c.source || "").split(/\n{2,}/)) {
        const hm = /^(#{1,6})\s+(.*)$/.exec(block.split("\n")[0]);
        if (hm) push("F2", hm[1].length <= 1 ? 14 : 12, hm[2], 8);
        const body = hm ? block.split("\n").slice(1).join(" ") : block.replace(/\n/g, " ");
        if (body.trim()) for (const l of wrap(body.replace(/[`*]/g, ""), 92)) push("F1", 10, l, 0);
        push("F1", 6, "", 0);
      }
      continue;
    }
    push("F1", 8, `In [${c.count ?? " "}]`, 6);
    for (const l of wrap(c.source, 95)) push("F3", 8.5, l, 0, 10);
    for (const o of c.outputs || []) {
      if (o.type === "image") { push("F1", 9, `[figure ${++fig}: see the HTML or Jupyter export]`, 3, 10); continue; }
      const lines = wrap(o.text, 95);
      for (const l of lines.slice(0, 400)) push("F3", 8, l, 0, 18);
      if (lines.length > 400) push("F1", 8, `[${lines.length - 400} more lines in the HTML or Jupyter export]`, 0, 18);
    }
  }
  // lay out
  const pages = [];
  let y = A4[1] - MARGIN, ops = [];
  const flush = () => { pages.push(ops.join("\n")); ops = []; y = A4[1] - MARGIN; };
  for (const it of items) {
    const lh = it.size * 1.3;
    y -= it.gap;
    if (y - lh < MARGIN) flush();
    y -= lh;
    if (it.text) ops.push(`BT /${it.font} ${it.size} Tf ${(MARGIN + it.indent).toFixed(2)} ${y.toFixed(2)} Td ${pdfStr(it.text)} Tj ET`);
  }
  if (ops.length || !pages.length) flush();
  pages.forEach((p, i) => { pages[i] = `${p}\nBT /F1 7 Tf ${MARGIN} 24 Td ${pdfStr(`${nb.name} · page ${i + 1} of ${pages.length}`)} Tj ET`; });
  // objects: 1 catalog, 2 pages, 3-5 fonts, then per page: page, content
  const objs = [];
  const n0 = 6;
  objs[1] = "<< /Type /Catalog /Pages 2 0 R >>";
  objs[2] = `<< /Type /Pages /Kids [${pages.map((_, i) => `${n0 + 2 * i} 0 R`).join(" ")}] /Count ${pages.length} >>`;
  objs[3] = "<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica /Encoding /WinAnsiEncoding >>";
  objs[4] = "<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold /Encoding /WinAnsiEncoding >>";
  objs[5] = "<< /Type /Font /Subtype /Type1 /BaseFont /Courier /Encoding /WinAnsiEncoding >>";
  pages.forEach((content, i) => {
    const bytes = latin1(content);
    objs[n0 + 2 * i] = `<< /Type /Page /Parent 2 0 R /MediaBox [0 0 ${A4[0]} ${A4[1]}] /Resources << /Font << /F1 3 0 R /F2 4 0 R /F3 5 0 R >> >> /Contents ${n0 + 2 * i + 1} 0 R >>`;
    objs[n0 + 2 * i + 1] = `<< /Length ${bytes.length} >>\nstream\n${content}\nendstream`;
  });
  let pdf = "%PDF-1.4\n%\xe2\xe3\xcf\xd3\n";
  const offs = [];
  for (let k = 1; k < objs.length; k++) { offs[k] = latin1(pdf).length; pdf += `${k} 0 obj\n${objs[k]}\nendobj\n`; }
  const xref = latin1(pdf).length;
  pdf += `xref\n0 ${objs.length}\n0000000000 65535 f \n${offs.slice(1).map((o) => `${String(o).padStart(10, "0")} 00000 n \n`).join("")}trailer\n<< /Size ${objs.length} /Root 1 0 R /Info << /Producer (Kshana Desktop) /Title ${pdfStr(nb.name)} >> >>\nstartxref\n${xref}\n%%EOF\n`;
  return latin1(pdf);
}
function latin1(s) { const b = new Uint8Array(s.length); for (let i = 0; i < s.length; i++) b[i] = s.charCodeAt(i) & 0xff; return b; }

/** Code cells from the code mirror (lib/mirror.mjs entries): the header, then one cell per action with Python lines. */
export function mirrorCells(entries, header = []) {
  const cells = [];
  if (header.length) cells.push({ id: cellId(), type: "code", source: header.join("\n"), outputs: [], count: null });
  for (const e of entries || []) {
    if (!e || !Array.isArray(e.py) || !e.py.length) continue;
    cells.push({ id: cellId(), type: "code", source: [`# ${e.title || e.kind}`, ...e.py].join("\n"), outputs: [], count: null });
  }
  return cells;
}
