// SPDX-License-Identifier: AGPL-3.0-only
// Tests of lib/notebook.mjs (0.42 U23): notebooks round-trip through Jupyter's format, export as
// safe HTML and as a well-formed PDF, and the cite button follows CITATION.cff.
// Run: node --test apps/desktop/shell/lib/notebook.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { newNotebook, notebookFile, outputsOf, toIpynb, fromIpynb, toHtml, markdownHtml, citation, toPdf, wrap, mirrorCells, CITE } from "./notebook.mjs";

const root = join(dirname(fileURLToPath(import.meta.url)), "../../../..");
const PNG = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==";

function sample() {
  const nb = newNotebook("Holdover study");
  nb.engine = "0.42.0";
  nb.cells[1].source = "r = kshana.run(kshana.get_example('clock-holdover.toml'))\nprint('done')\nlen(r)";
  nb.cells[1].count = 1;
  nb.cells[1].outputs = outputsOf({ stdout: "done\n", stderr: "warn\n", value: "12", images: [PNG, "not base64!"], error: null });
  nb.cells.push({ id: "e1", type: "code", source: "1/0", count: 2, outputs: outputsOf({ error: "Traceback (most recent call last):\nZeroDivisionError: division by zero" }) });
  return nb;
}

test("a session's answer becomes the cell's outputs, in order; an image that is not base64 is dropped", () => {
  const o = sample().cells[1].outputs;
  assert.deepEqual(o.map((x) => x.type), ["stream", "stream", "image", "value"]);
  assert.equal(o[1].name, "stderr");
  assert.deepEqual(outputsOf(null), []);
});

test("a notebook round-trips through nbformat 4 as Jupyter reads it", () => {
  const nb = sample();
  const text = toIpynb(nb);
  const d = JSON.parse(text);
  assert.equal(d.nbformat, 4);
  assert.equal(d.metadata.kernelspec.name, "python3");
  assert.equal(d.cells[1].cell_type, "code");
  assert.deepEqual(d.cells[1].source, ["r = kshana.run(kshana.get_example('clock-holdover.toml'))\n", "print('done')\n", "len(r)"]);
  assert.deepEqual(d.cells[1].outputs.map((o) => o.output_type), ["stream", "stream", "display_data", "execute_result"]);
  assert.equal(d.cells[2].outputs[0].ename, "ZeroDivisionError");
  const back = fromIpynb(text);
  assert.equal(back.name, "Holdover study");
  assert.equal(back.engine, "0.42.0");
  assert.equal(back.cells[1].source, nb.cells[1].source);
  assert.deepEqual(back.cells[1].outputs, nb.cells[1].outputs);
  assert.equal(back.cells[2].outputs[0].type, "error");
  assert.throws(() => fromIpynb('{"nbformat":3,"cells":[]}'));
  assert.equal(notebookFile("Baltic / approach: v2"), "Baltic-approach-v2.ipynb");
  assert.equal(notebookFile(""), "notebook.ipynb");
});

test("the HTML export is self-contained and escapes every cell", () => {
  const nb = sample();
  nb.cells[0].source = "# Title <script>alert(1)</script>\n\n- **bold** and `code`\n- two";
  nb.cells[1].outputs.push({ type: "stream", name: "stdout", text: "<img src=x onerror=alert(1)>" });
  const html = toHtml(nb, { made: "2026-11-15" });
  assert.ok(!/<script/i.test(html));
  assert.ok(!html.includes("<img src=x"));
  assert.ok(html.includes("&lt;script&gt;"));
  assert.ok(html.includes(`data:image/png;base64,${PNG}`));
  assert.ok(!/https?:\/\/(?!doi)/.test(html.replace(/<footer>[\s\S]*<\/footer>/, "")), "no request");
  assert.ok(html.includes("<strong>bold</strong>") && html.includes("<code>code</code>"));
  assert.equal(markdownHtml("## Two\n\n1. a\n2. b"), "<h2>Two</h2>\n<ol><li>a</li><li>b</li></ol>");
});

test("the PDF export is a well-formed PDF with every cell's text and the figures named", () => {
  const nb = sample();
  for (let i = 0; i < 120; i++) nb.cells.push({ id: `x${i}`, type: "code", source: `print(${i})  # ünïcode → arrow`, count: i, outputs: [{ type: "stream", name: "stdout", text: `${i}\n` }] });
  const pdf = toPdf(nb);
  const s = Buffer.from(pdf).toString("latin1");
  assert.ok(s.startsWith("%PDF-1.4"));
  assert.ok(s.trimEnd().endsWith("%%EOF"));
  const pages = Number(/\/Count (\d+)/.exec(s)[1]);
  assert.ok(pages >= 3, `${pages} pages`);
  // the xref offsets point at the objects
  const xref = Number(/startxref\n(\d+)/.exec(s)[1]);
  assert.ok(s.slice(xref).startsWith("xref"));
  const offs = [...s.slice(xref).matchAll(/^(\d{10}) 00000 n $/gm)].map((m) => Number(m[1]));
  offs.forEach((o, k) => assert.ok(s.slice(o).startsWith(`${k + 1} 0 obj`), `object ${k + 1}`));
  assert.ok(s.includes("[figure 1: see the HTML or Jupyter export]"));
  assert.ok(s.includes("ZeroDivisionError"));
  assert.ok(s.includes("(print\\(5\\)  # \xfcn\xefcode ? arrow) Tj"), "WinAnsi text, parentheses escaped");
  assert.deepEqual(wrap("aaaa bbbb cccc", 9), ["aaaa bbbb", "cccc"]);
  assert.deepEqual(wrap("x".repeat(12), 5), ["xxxxx", "xxxxx", "xx"]);
});

test("the cite button gives the reference of CITATION.cff at the engine version", () => {
  const cff = readFileSync(join(root, "CITATION.cff"), "utf8");
  assert.ok(cff.includes(`doi: ${CITE.doi}`), "the DOI");
  assert.ok(cff.includes(`title: "${CITE.title}"`), "the title");
  for (const a of CITE.authors) assert.ok(cff.includes(`family-names: ${a.family}`) && cff.includes(`given-names: ${a.given}`));
  const c = citation("v0.42.0", { year: 2026 });
  assert.equal(c.text, `Baweja, C. (2026). ${CITE.title} (version 0.42.0) [Computer software]. https://doi.org/${CITE.doi}`);
  assert.match(c.bibtex, /^@software\{kshana_0_42_0,/);
  assert.match(c.bibtex, /version = \{0\.42\.0\}/);
  assert.ok(c.markdown.includes("```bibtex"));
});

test("the code mirror's actions become code cells", () => {
  const cells = mirrorCells([{ kind: "run", title: "Run clock-holdover", py: ["a = 1", "b = 2"] }, { kind: "drop", py: [] }], ["import kshana"]);
  assert.equal(cells.length, 2);
  assert.equal(cells[1].source, "# Run clock-holdover\na = 1\nb = 2");
  assert.notEqual(cells[0].id, cells[1].id);
});
