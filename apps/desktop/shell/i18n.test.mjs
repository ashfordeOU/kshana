// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell in the Studio's languages (0.42 U18): the same i18n checks as the Studio.
// Run: node --test apps/desktop/shell/i18n.test.mjs
//
//  - i18n/en/desktop-js.ftl is what `node tools/i18n.mjs jsx --src apps/desktop/shell` writes
//    (every t() call site of the shell, English at the call site);
//  - every language the Studio offers has i18n/<lang>/desktop-js.ftl with every message, and the
//    catalogue passes the Studio's checker (tools/i18n-lang.mjs checkLang: syntax, variables,
//    string literals, plural categories, markup, the tier and verdict words);
//  - the staging (apps/desktop/stage-i18n.mjs) writes each language's catalogues where the
//    Studio's l10n-boot looks, and leaves out the Studio messages with browser wording.
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, existsSync, mkdtempSync, rmSync, readdirSync } from "node:fs";
import { join, dirname } from "node:path";
import { tmpdir } from "node:os";
import { fileURLToPath } from "node:url";
import { execFileSync } from "node:child_process";
import { LANGS } from "../../../web/studio/lib/l10n.mjs";
import { checkLang } from "../../../tools/i18n-lang.mjs";
import { ftlEntries, stage, studioModules } from "../stage-i18n.mjs";

const here = dirname(fileURLToPath(import.meta.url));
const root = join(here, "../../..");
const vars = (text) => [...new Set([...String(text).matchAll(/\{ *\$([A-Za-z0-9_-]+)/g)].map((m) => m[1]))].sort().join(",");

test("the English catalogue is the shell's call sites, as tools/i18n.mjs jsx writes it", () => {
  execFileSync(process.execPath, ["tools/i18n.mjs", "jsx", "--src", "apps/desktop/shell", "--out", "i18n/en/desktop-js.ftl", "--check"], { cwd: root, stdio: "pipe" });
});

const en = ftlEntries(readFileSync(join(root, "i18n/en/desktop-js.ftl"), "utf8"));

test("every language of the Studio has every message of the shell, with the same variables", () => {
  assert.ok(en.length > 400, "the shell's messages were read");
  for (const lang of LANGS) {
    const f = join(root, "i18n", lang, "desktop-js.ftl");
    assert.ok(existsSync(f), `${lang}: i18n/${lang}/desktop-js.ftl`);
    const tr = new Map(ftlEntries(readFileSync(f, "utf8")).map((e) => [e.id, e]));
    const missing = en.filter((e) => !tr.has(e.id)).map((e) => e.id);
    assert.deepEqual(missing, [], `${lang}: messages missing`);
    for (const e of en) assert.equal(vars(tr.get(e.id).text.replace(/^#.*$/gm, "")), vars(e.text.replace(/^#.*$/gm, "")), `${lang}: ${e.id} variables`);
    const orphans = [...tr.keys()].filter((id) => !en.some((e) => e.id === id));
    assert.deepEqual(orphans, [], `${lang}: messages the shell no longer has`);
  }
});

test("each catalogue passes the Studio's checker", () => {
  for (const lang of LANGS) {
    const r = checkLang(join(root, "i18n"), lang);
    const mine = r.errors.filter((e) => e.includes("/desktop-js.ftl"));
    assert.deepEqual(mine, [], `${lang}`);
  }
});

test("a translation is a translation: most messages differ from the English", () => {
  const enMap = new Map(en.map((e) => [e.id, e.text.replace(/^#.*\n/gm, "")]));
  for (const lang of LANGS) {
    const tr = ftlEntries(readFileSync(join(root, "i18n", lang, "desktop-js.ftl"), "utf8"));
    const same = tr.filter((e) => e.text.replace(/^#.*\n/gm, "") === enMap.get(e.id)).length;
    assert.ok(same / tr.length < 0.25, `${lang}: ${same} of ${tr.length} messages are the English text`);
  }
});

test("the staging writes each language's catalogues where the Studio's l10n-boot looks", () => {
  const out = mkdtempSync(join(tmpdir(), "kshana-desk-i18n-"));
  try {
    const r = stage(out);
    assert.equal(r.langs, LANGS.length + 1, "English and every Studio language");
    for (const lang of ["en", ...LANGS]) for (const f of ["desktop-js.ftl", "desktop-studio-js.ftl", "glossary.ftl"]) assert.ok(existsSync(join(out, "i18n", lang, f)), `${lang}/${f}`);
    const staged = ftlEntries(readFileSync(join(out, "i18n/en/desktop-studio-js.ftl"), "utf8"));
    assert.ok(staged.length > 100);
    for (const id of r.left) assert.ok(!staged.some((e) => e.id === id), `${id} is left out`);
    assert.ok(!staged.some((e) => /^js-(adv|app|trust|tools)-/.test(e.id)), "only the messages of the modules the shell imports");
    assert.ok(!readdirSync(join(out, "i18n", "de")).includes("studio-js.ftl"), "the Studio's tool pages keep their English in the app");
  } finally { rmSync(out, { recursive: true, force: true }); }
  assert.ok(studioModules().includes("kpi.mjs"));
});

test("the shell loads its catalogues and redraws on a change of language", () => {
  const boot = readFileSync(join(here, "boot.js"), "utf8");
  assert.match(boot, /window\.kshanaL10nFiles = \["glossary\.ftl", "desktop-studio-js\.ftl", "desktop-js\.ftl"\]/);
  const shell = readFileSync(join(here, "shell.js"), "utf8");
  assert.match(shell, /import l10n from "\.\.\/lib\/l10n-boot\.mjs"/);
  assert.match(shell, /l10n\.setRerender\(/);
  assert.match(readFileSync(join(here, "index.html"), "utf8"), /class="bar-right"/);
  assert.match(readFileSync(join(root, "apps/desktop/build-frontend.sh"), "utf8"), /node apps\/desktop\/stage-i18n\.mjs "\$out"/);
});
