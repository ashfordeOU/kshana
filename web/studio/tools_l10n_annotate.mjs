#!/usr/bin/env node
// Adds data-l10n / data-l10n-attr to the Studio's static HTML wherever a text or an attribute equals the English value of a
// studio-* message in i18n/en/ui.ftl (idempotent). Usage: node tools_l10n_annotate.mjs [--ui <ui.ftl>] [--check] <html file>...
//   --add     first append a studio-<page>-<slug> message to ui.ftl (append only, existing ids untouched) for every plain static string
//             that is not a message yet, then annotate
//   --no-html do not write the HTML files (only the catalogue)
//   --check   change nothing; exit 1 when the files would change (a gate), and print the coverage figure.
import { readFileSync, writeFileSync } from "node:fs";

const argv = process.argv.slice(2);
let ui = "/workspace/kshana/i18n/en/ui.ftl", check = false, add = false, noHtml = false;
const files = [];
for (let i = 0; i < argv.length; i++) { if (argv[i] === "--ui") ui = argv[++i]; else if (argv[i] === "--check") check = true; else if (argv[i] === "--add") add = true; else if (argv[i] === "--no-html") noHtml = true; else files.push(argv[i]); }

const byValue = new Map(); // English value -> id (a value shared by two ids is ambiguous and left alone)
for (const line of readFileSync(ui, "utf8").split("\n")) {
  const m = /^(studio-[\w-]+) = (.+)$/.exec(line);
  if (!m || /[{<]/.test(m[2])) continue;
  byValue.set(m[2], byValue.has(m[2]) ? null : m[1]);
}
const esc = (s) => s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#x27;");
const NAMED = { nbsp: "\u00a0", amp: "&", lt: "<", gt: ">", quot: '"', apos: "'", ldquo: "\u201c", rdquo: "\u201d", lsquo: "\u2018", rsquo: "\u2019", mdash: "\u2014", ndash: "\u2013", hellip: "\u2026", middot: "\u00b7", rarr: "\u2192", larr: "\u2190", uarr: "\u2191", darr: "\u2193", times: "\u00d7", minus: "\u2212", deg: "\u00b0", plusmn: "\u00b1", eacute: "\u00e9", laquo: "\u00ab", raquo: "\u00bb", copy: "\u00a9", reg: "\u00ae", trade: "\u2122", bull: "\u2022", thinsp: "\u2009", zwj: "\u200d" };
const unesc = (s) => s.replace(/&#x([0-9a-f]+);/gi, (_, h) => String.fromCodePoint(parseInt(h, 16))).replace(/&#(\d+);/g, (_, d) => String.fromCodePoint(+d)).replace(/&([a-z]+);/gi, (m, n) => (n in NAMED ? NAMED[n] : m));

const isProse = (t) => /[A-Za-z]{3,}/.test(t) && !/[{}<>]/.test(t) && t.length >= 4 && !/^[\w./:#?=&%@+-]+$/.test(t) && !/^\d/.test(t);
const slug = (t) => t.toLowerCase().replace(/[^a-z0-9]+/g, " ").trim().split(" ").slice(0, 5).join("-") || "text";
if (add) {
  const have = new Set([...readFileSync(ui, "utf8").matchAll(/^(studio-[\w-]+) =/gm)].map((m) => m[1]));
  const lines = [];
  const seen = new Map(byValue);
  const page = (f) => (f.replace(/\\/g, "/").split("/").filter((x) => x !== "index.html" && x !== ".").pop() || "main").replace(/\.html$/, "");
  for (const f of files) {
    const html = readFileSync(f, "utf8");
    const pg = page(f) === "studio-rebuild" || page(f) === "" ? "home" : page(f);
    const cand = [];
    for (const m of html.matchAll(/<([a-zA-Z][\w-]*)\b((?:"[^"]*"|'[^']*'|[^'">])*)>/g)) for (const a of ["aria-label", "title", "placeholder"]) { const mm = new RegExp(`\\s${a}="([^"]*)"`).exec(m[2]); if (mm) cand.push(unesc(mm[1])); }
    for (const m of html.matchAll(/<(h[1-6]|p|span|summary|button|a|label|li|th|td|small|strong|div)\b((?:"[^"]*"|'[^']*'|[^'">])*)>([^<>]+)<\/\1>/g)) if (!/\bdata-l10n=/.test(m[2]) && !/\bid="(engine-label|sc-title)"/.test(m[2])) cand.push(unesc(m[3].trim()));
    for (const v of cand) {
      if (!v || seen.has(v) || !isProse(v)) continue;
      let id = `studio-${pg}-${slug(v)}`, n = 2;
      while (have.has(id)) id = `studio-${pg}-${slug(v)}-${n++}`;
      have.add(id); seen.set(v, id); byValue.set(v, id);
      lines.push(`# ${pg}\n${id} = ${v}`);
    }
  }
  if (lines.length && !check) writeFileSync(ui, readFileSync(ui, "utf8").trimEnd() + "\n\n## Studio pages: static text (generated list, append only)\n" + lines.join("\n") + "\n");
  console.log(`l10n annotate: ${lines.length} new studio-* messages ${check ? "would be " : ""}appended to ${ui}`);
}
let changed = 0, total = 0, hit = 0;
for (const f of files) {
  const html = readFileSync(f, "utf8");
  let out = html;
  // attributes
  out = out.replace(/<([a-zA-Z][\w-]*)\b((?:"[^"]*"|'[^']*'|[^'">])*)>/g, (tag, name, attrs) => {
    if (/\bdata-l10n-attr=/.test(attrs)) return tag;
    const pairs = [];
    for (const a of ["aria-label", "title", "placeholder"]) {
      const m = new RegExp(`\\s${a}="([^"]*)"`).exec(attrs);
      if (!m) continue;
      total++;
      const id = byValue.get(unesc(m[1]));
      if (id) { pairs.push(`${a}:${id}`); hit++; }
    }
    return pairs.length ? tag.replace(/>$/, ` data-l10n-attr="${pairs.join(";")}">`) : tag;
  });
  // leaf elements whose whole content is one message
  out = out.replace(/<(h[1-6]|p|span|summary|button|a|label|li|th|td|small|strong|div)\b((?:"[^"]*"|'[^']*'|[^'">])*)>([^<>]+)<\/\1>/g, (all, name, attrs, text) => {
    if (/\bdata-l10n=/.test(attrs)) return all;
    const t = unesc(text.trim());
    if (!t) return all;
    total++;
    const id = byValue.get(t);
    if (!id) return all;
    hit++;
    return `<${name}${attrs} data-l10n="${id}">${text}</${name}>`;
  });
  if (!out.includes("kshanaL10nReady")) out = out.replace(/<head\b[^>]*>/i, (h) => `${h}\n<script>window.kshanaL10nReady=new Promise(function(r){window.kshanaL10nResolve=r})</script>`);
  if (!out.includes("l10n-boot.mjs")) out = out.replace("</body>", `<script type="module" src="lib/l10n-boot.mjs"></script>\n</body>`);
  if (out !== html) { changed++; if (!check && !noHtml) writeFileSync(f, out); }
}
console.log(`l10n annotate: ${hit} of ${total} candidate strings in ${files.length} file(s) are catalogue messages${check ? "" : "; " + changed + " file(s) updated"}`);
if (check && changed) process.exit(1);
