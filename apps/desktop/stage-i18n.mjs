#!/usr/bin/env node
// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop: the shell's catalogues (0.42 U18), staged next to the frontend as
// <out>/i18n/<lang>/ where the Studio's lib/l10n-boot.mjs looks for them. Per language:
//
//   desktop-js.ftl          the shell's own t() messages (i18n/<lang>/desktop-js.ftl; the English
//                           one is generated from apps/desktop/shell by `node tools/i18n.mjs jsx`)
//   desktop-studio-js.ftl   the Studio messages of the Studio modules the shell imports, taken
//                           from i18n/<lang>/studio-js.ftl (and only those: the Studio's tool pages,
//                           staged unchanged, keep their English text in the app)
//   glossary.ftl            the terms (tier and verdict words)
//
// The English of every Studio message is scanned with the Desktop's wording rules (wording.mjs
// BANNED): a message that says the engine runs in a browser is left out in every language, so
// the shell shows the call site's English, which wording.mjs has already rewritten for the app.
// Tested in apps/desktop/shell/i18n.test.mjs.
//
//   node apps/desktop/stage-i18n.mjs <out-dir>
import { readFileSync, writeFileSync, mkdirSync, existsSync, readdirSync } from "node:fs";
import { join, dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { BANNED } from "./wording.mjs";

const here = dirname(fileURLToPath(import.meta.url));
const root = resolve(here, "../..");

/** The Studio modules (web/studio/lib) the shell imports, with what they import in turn. */
export function studioModules() {
  const seen = new Set();
  const lib = join(root, "web/studio/lib");
  const queue = [];
  const shellDir = join(root, "apps/desktop/shell");
  const walk = (d) => { for (const e of readdirSync(d, { withFileTypes: true })) { const p = join(d, e.name); if (e.isDirectory()) walk(p); else if (/\.m?js$/.test(e.name) && !/\.test\.mjs$/.test(e.name)) for (const m of readFileSync(p, "utf8").matchAll(/(?:from|import)\s*["']((?:\.\.\/)+lib\/[\w.-]+\.mjs)["']/g)) { const f = m[1].split("/").pop(); if (existsSync(join(lib, f))) queue.push(f); } } };
  walk(shellDir);
  while (queue.length) {
    const f = queue.pop();
    if (seen.has(f)) continue;
    seen.add(f);
    const text = readFileSync(join(lib, f), "utf8");
    for (const m of text.matchAll(/(?:from|import)\s*["']\.\/([\w.-]+\.mjs)["']/g)) if (existsSync(join(lib, m[1]))) queue.push(m[1]);
  }
  return [...seen].sort();
}

/** The message ids those modules pass to t(). */
export function studioIds(mods = studioModules()) {
  const ids = new Set();
  for (const f of mods) for (const m of readFileSync(join(root, "web/studio/lib", f), "utf8").matchAll(/(?<![\w.$])t\(\s*["']([\w-]+)["']/g)) ids.add(m[1]);
  return ids;
}

/** The entries of a Fluent file: [{ id, text }] where text is the whole entry (its comment lines and its value lines). */
export function ftlEntries(text) {
  const out = [];
  let comment = [], cur = null;
  for (const line of String(text).split("\n")) {
    if (cur && /^\s+\S/.test(line)) { cur.text += `\n${line}`; continue; }
    if (cur) { out.push(cur); cur = null; }
    const m = /^([A-Za-z][\w-]*)\s*=/.exec(line);
    if (m) { cur = { id: m[1], text: [...comment, line].join("\n") }; comment = []; continue; }
    if (/^#/.test(line)) comment.push(line); else comment = [];
  }
  if (cur) out.push(cur);
  return out;
}

/** The Studio catalogue cut to `ids`. */
export function cutCatalogue(text, ids) {
  const keep = ftlEntries(text).filter((e) => ids.has(e.id));
  return `# Staged by apps/desktop/stage-i18n.mjs: the Studio messages of the Studio modules the Desktop shell imports.\n\n${keep.map((e) => e.text).join("\n\n")}\n`;
}

export function stage(out) {
  const ids = studioIds();
  const src = join(root, "i18n");
  const langs = readdirSync(src, { withFileTypes: true }).filter((d) => d.isDirectory() && /^[a-z]{2,3}(-[A-Za-z0-9]+)?$/.test(d.name) && d.name !== "en-XA").map((d) => d.name);
  const left = [];
  for (const e of ftlEntries(readFileSync(join(src, "en/studio-js.ftl"), "utf8"))) if (ids.has(e.id) && BANNED.some((b) => b.re.test(e.text.replace(/^#.*$/gm, "")))) { ids.delete(e.id); left.push(e.id); }
  const en = cutCatalogue(readFileSync(join(src, "en/studio-js.ftl"), "utf8"), ids);
  let n = 0;
  for (const l of langs) {
    const dir = join(out, "i18n", l);
    const have = (f) => existsSync(join(src, l, f));
    if (!have("desktop-js.ftl")) continue;
    mkdirSync(dir, { recursive: true });
    writeFileSync(join(dir, "desktop-js.ftl"), readFileSync(join(src, l, "desktop-js.ftl")));
    if (have("glossary.ftl")) writeFileSync(join(dir, "glossary.ftl"), readFileSync(join(src, l, "glossary.ftl")));
    if (have("studio-js.ftl")) writeFileSync(join(dir, "desktop-studio-js.ftl"), l === "en" ? en : cutCatalogue(readFileSync(join(src, l, "studio-js.ftl"), "utf8"), ids));
    n++;
  }
  return { langs: n, left };
}

if (process.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const out = process.argv[2];
  if (!out) { console.error("usage: node apps/desktop/stage-i18n.mjs <out-dir>"); process.exit(2); }
  try { const r = stage(out); console.log(`shell catalogues staged in ${r.langs} languages${r.left.length ? `; ${r.left.length} Studio messages left in English (browser wording): ${r.left.join(", ")}` : ""}`); }
  catch (e) { console.error(String(e.message || e)); process.exit(1); }
}
