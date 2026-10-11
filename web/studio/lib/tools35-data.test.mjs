// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the 0.35 coverage data (tools35-data.mjs). Run with `node lib/tools35-data.test.mjs`.
import assert from "node:assert/strict";
import fs from "node:fs";
import { PAGES, FEATURES, CLI_CARDS, docsHref } from "./tools35-data.mjs";

const here = new URL("../", import.meta.url);
const exists = (rel) => fs.existsSync(new URL(rel, here));

// Every page the data names is a real Studio page; tool tabs are fragments of tools/.
for (const [id, p] of Object.entries(PAGES)) {
  const [path] = p.href.split("#");
  assert.ok(exists(path + "index.html"), `${id}: ${path}index.html exists`);
  assert.ok(p.label.length > 3, id);
}
// Every feature is either run in the browser (a page and what it does there) or says why not, with its command.
const ids = new Set();
for (const f of FEATURES) {
  assert.ok(!ids.has(f.id), `duplicate feature ${f.id}`); ids.add(f.id);
  assert.ok(f.name.length > 10 && f.cli.startsWith("kshana ") || f.cli.startsWith("cargo "), f.id);
  if (f.studio.length) for (const [pid, what] of f.studio) { assert.ok(PAGES[pid], `${f.id}: page ${pid}`); assert.ok(what.length > 10, `${f.id}: says what it does`); }
  else assert.ok(f.why && f.why.length > 40 && f.card, `${f.id}: a feature with no browser page gives its reason and a command-line card`);
  if (f.card) assert.ok(CLI_CARDS.some((c) => c.id === f.card), `${f.id}: card ${f.card} exists`);
}
// The coordinator's list of 0.35 features is covered.
for (const id of ["maritime-trust", "nmea-training", "interference-map", "telemetry", "evidence", "bench", "compliance", "iq", "marine", "osnma", "ai"]) assert.ok(ids.has(id), id);
// Command-line cards carry exact commands and a reason; a recorded sample, when named, is a file under tools/samples/.
for (const c of CLI_CARDS) {
  assert.ok(c.commands.length >= 1 && c.why.length > 20 && c.what.length > 20, c.id);
  assert.ok(c.commands.every((x) => /^(kshana|cargo|#)/.test(x)), `${c.id}: commands start with kshana`);
  for (const [label, file] of c.samples) { assert.ok(label && /^[a-z0-9-]+\.txt$/.test(file), `${c.id}: ${file}`); assert.ok(exists("tools/samples/" + file), `${c.id}: sample ${file} is recorded`); }
}
assert.equal(docsHref("evidence-packs"), "../docs/evidence-packs.html");
// A card's docs slug is a page of the site's docs build, when that build's source is beside this folder.
const bd = new URL("../../tools/build_docs.mjs", import.meta.url);
if (fs.existsSync(bd)) {
  const src = fs.readFileSync(bd, "utf8");
  for (const c of CLI_CARDS) assert.ok(src.includes(`"${c.docs}"`), `${c.id}: docs slug ${c.docs} is in the docs build`);
}
// No AI vendor or product, no person, no company in the text a visitor reads.
const text = JSON.stringify([FEATURES, CLI_CARDS]);
assert.ok(!/claude|anthropic|openai|aperio/i.test(text));
console.log("tools35-data.test.mjs: ok");
