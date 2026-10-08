// SPDX-License-Identifier: AGPL-3.0-only
// The guard for the data the pages carry inline: every `<script type="application/json">`
// and `<script type="application/ld+json">` block of a page must parse, and none may hold
// the signature of an unescaped-regex version bump.
//
// Why it exists: the 0.32.0 release replaced the version with `sed 's/0.31.0/0.32.0/g'`.
// The unescaped dots match any character, so `0,3100` (the end of one time sample and the
// start of the next in the home page's `kpage` data) became `0.32.0`, and the block no
// longer parsed: the hero panels, event log and charts of kshana.dev never rendered. A
// version bump that is a text substitution must escape the dots (`s/0\.31\.0/0.32.0/g`);
// this guard is what notices when one did not.
//
// Use: `import { inlineJsonProblems } from "./tools/inline-json.mjs"`, or from a shell
// `node web/tools/inline-json.mjs <page.html>...` (exit 1 and one line per problem).
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const BLOCK = /<script\b([^>]*)>([\s\S]*?)<\/script>/gi;
const DATA_TYPE = /\btype\s*=\s*["']application\/(?:ld\+)?json["']/i;
// The same dotted triple three times running ("3090" + ".0.32.0" x 3): what a version
// replacement leaves where it matched a run of data. Legitimate dotted numbers (a section
// number such as 20.3.3.3.3.2, a version, an address) never repeat a triple like that.
const SIGNATURE = /(\.\d+\.\d+\.\d+)\1{2,}/;

/** The inline data blocks of `html`: `{ type, body, line }`. */
export function dataBlocks(html) {
  const out = [];
  for (const m of html.matchAll(BLOCK)) {
    if (!DATA_TYPE.test(m[1])) continue;
    out.push({ attrs: m[1].trim(), body: m[2], line: html.slice(0, m.index).split("\n").length });
  }
  return out;
}

/** Problems with the inline data of one page, as readable strings (empty when clean). */
export function inlineJsonProblems(html, rel = "page") {
  const problems = [];
  for (const b of dataBlocks(html)) {
    const id = /\bid\s*=\s*["']([^"']+)["']/.exec(b.attrs)?.[1] ?? "(no id)";
    const where = `${rel}:${b.line} <script ${id}>`;
    try {
      JSON.parse(b.body);
    } catch (e) {
      const at = /position (\d+)/.exec(e.message)?.[1];
      const near = at ? ` near "${b.body.slice(Math.max(0, +at - 24), +at + 24).replace(/\s+/g, " ")}"` : "";
      problems.push(`${where}: does not parse (${e.message})${near}`);
    }
    const bad = SIGNATURE.exec(b.body);
    if (bad) {
      problems.push(`${where}: holds "${bad[0].slice(0, 40)}", the signature of an unescaped version-bump regex (escape the dots)`);
    }
  }
  return problems;
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  const files = process.argv.slice(2);
  if (!files.length) {
    console.error("usage: node web/tools/inline-json.mjs <page.html>...");
    process.exit(2);
  }
  const all = files.flatMap((f) => inlineJsonProblems(readFileSync(f, "utf8"), f));
  for (const p of all) console.error(p);
  if (all.length) process.exit(1);
  console.log(`inline-json: ${files.length} page(s), every inline data block parses and none carries the bump signature`);
}
