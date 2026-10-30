import test from "node:test";
import assert from "node:assert/strict";
import { createL10n, negotiate, chooseLang, dirOf, renderRich, LANGS, STORAGE_KEY } from "./l10n.mjs";

const EN_UI = `
studio-title = Kshana Studio
studio-search = Search
studio-ledger-rows =
    { $n ->
        [one] { $n } ledger row
       *[other] { $n } ledger rows
    }
studio-count-x = { NUMBER($n, maximumFractionDigits: 1) } items
-tier-validated = VALIDATED
studio-badge = Tier { -tier-validated }
`;
const PL_UI = `
studio-title = Kshana Studio (pl)
studio-ledger-rows =
    { $n ->
        [one] { $n } wiersz rejestru
        [few] { $n } wiersze rejestru
        [many] { $n } wierszy rejestru
       *[other] { $n } wiersza rejestru
    }
`;
const files = { "en/ui.ftl": EN_UI, "en/glossary.ftl": "-tier-modelled = MODELLED\n    .gloss = computed from a model", "pl/ui.ftl": PL_UI, "pl/glossary.ftl": "", "pl/engine.ftl": "engine-x = x" };
const fetchText = async (u) => { const k = u.replace("mem://", ""); if (k in files) return files[k]; throw new Error("404"); };
const mk = (extra = {}) => createL10n({ base: "mem://", fetchText, ...extra });

// a document with just enough DOM
class El { constructor(attrs, text = "") { this.attrs = { ...attrs }; this.textContent = text; } getAttribute(k) { return k in this.attrs ? this.attrs[k] : null; } setAttribute(k, v) { this.attrs[k] = v; } }
const docWith = (els) => ({ documentElement: new El({}), querySelectorAll: (sel) => els.filter((e) => (sel === "[data-l10n]" ? "data-l10n" in e.attrs : "data-l10n-attr" in e.attrs)) });

test("negotiation: the browser's languages in order, the site's rules", () => {
  assert.equal(negotiate(["de-AT"]), "de");
  assert.equal(negotiate(["en-US", "de"]), "en");
  assert.equal(negotiate(["xx", "fr"]), "fr");
  assert.equal(negotiate(["pt"]), "pt-BR");
  assert.equal(negotiate(["pt-PT"]), "pt-PT");
  assert.equal(negotiate(["pt-AO"]), "pt-PT");
  assert.equal(negotiate(["no"]), "nb");
  assert.equal(negotiate(["nn-NO"]), "nb");
  assert.equal(negotiate(["zh-CN"]), "zh-Hans");
  assert.equal(negotiate(["zh-Hans-SG"]), "zh-Hans");
  assert.equal(negotiate(["zh-TW"]), "en");
  assert.equal(negotiate(["zh-HK"]), "en");
  assert.equal(negotiate([]), "en");
  assert.equal(negotiate(["ja"]), "ja");
  assert.equal(LANGS.length, 17);
});

test("chooseLang: ?lang= wins and is stored; then the stored choice; then negotiation", () => {
  const store = new Map();
  const storage = { getItem: (k) => store.get(k) ?? null, setItem: (k, v) => store.set(k, v) };
  assert.equal(chooseLang({ search: "?lang=fi", storage, languages: ["de"] }), "fi");
  assert.equal(store.get(STORAGE_KEY), "fi");
  assert.equal(chooseLang({ search: "", storage, languages: ["de"] }), "fi");
  store.set(STORAGE_KEY, "en");
  assert.equal(chooseLang({ search: "", storage, languages: ["de"] }), "en", "an explicit English choice wins");
  store.clear();
  assert.equal(chooseLang({ search: "", storage, languages: ["de"] }), "de");
  assert.equal(chooseLang({ search: "?lang=xx", storage, languages: ["fr"] }), "fr", "an unknown ?lang= is ignored");
  const broken = { getItem() { throw new Error("blocked"); }, setItem() { throw new Error("blocked"); } };
  assert.equal(chooseLang({ search: "?lang=sv", storage: broken, languages: [] }), "sv", "blocked storage does not throw");
});

test("t(): the language, then English per id, then the id; terms and variables", async () => {
  const l = mk();
  await l.setLang("pl");
  assert.equal(l.t("studio-title"), "Kshana Studio (pl)");
  assert.equal(l.t("studio-search"), "Search", "an id missing in Polish falls back to English");
  assert.equal(l.t("no-such-id"), "no-such-id");
  assert.equal(l.t("studio-badge"), "Tier VALIDATED");
});

test("plural categories: Polish has one, few, many, other", async () => {
  const l = mk();
  await l.setLang("pl");
  assert.equal(l.t("studio-ledger-rows", { n: 1 }), "1 wiersz rejestru");
  assert.equal(l.t("studio-ledger-rows", { n: 3 }), "3 wiersze rejestru");
  assert.equal(l.t("studio-ledger-rows", { n: 5 }), "5 wierszy rejestru");
  assert.equal(l.t("studio-ledger-rows", { n: 1.5 }), "1,5 wiersza rejestru", "Polish decimal comma");
  await l.setLang("en");
  assert.equal(l.t("studio-ledger-rows", { n: 1 }), "1 ledger row");
  assert.equal(l.t("studio-ledger-rows", { n: 2 }), "2 ledger rows");
});

test("a language that cannot be loaded leaves English and does not throw", async () => {
  const l = mk();
  assert.equal(await l.setLang("de"), "en");
  assert.equal(l.lang, "en");
  assert.equal(l.t("studio-title"), "Kshana Studio");
});

test("setLang updates [data-l10n] and attributes, sets lang and dir, runs the change hooks", async () => {
  const a = new El({ "data-l10n": "studio-title" }, "Kshana Studio");
  const b = new El({ "data-l10n-attr": "aria-label:studio-search;title:studio-title", "aria-label": "Search" });
  const c = new El({ "data-l10n": "studio-ledger-rows", "data-l10n-args": '{"n":5}' }, "5 ledger rows");
  const doc = docWith([a, b, c]);
  const l = mk({ doc });
  const seen = [];
  l.onChange((x) => seen.push(x));
  await l.setLang("pl");
  assert.equal(a.textContent, "Kshana Studio (pl)");
  assert.equal(b.attrs.title, "Kshana Studio (pl)");
  assert.equal(b.attrs["aria-label"], "Search");
  assert.equal(c.textContent, "5 wierszy rejestru");
  assert.equal(doc.documentElement.attrs.lang, "pl");
  assert.equal(doc.documentElement.attrs.dir, "ltr");
  assert.deepEqual(seen, ["pl"]);
  await l.setLang("en");
  assert.equal(a.textContent, "Kshana Studio", "back to English without a reload");
  assert.equal(c.textContent, "5 ledger rows");
  assert.equal(dirOf("ar"), "rtl");
});

test("remember stores the choice; the engine catalogue is registered per language, with an English fallback flag", async () => {
  const store = new Map();
  const storage = { getItem: (k) => store.get(k) ?? null, setItem: (k, v) => store.set(k, v) };
  const calls = [];
  const l = mk({ storage });
  await l.attachEngine(async (tag, text) => { calls.push([tag, text]); });
  await l.setLang("pl", { remember: true });
  assert.equal(store.get(STORAGE_KEY), "pl");
  assert.deepEqual(calls.at(-1), ["pl", "engine-x = x"]);
  assert.equal(l.engineFallback, false);
  const l2 = mk();
  await l2.attachEngine(async () => { throw new Error("engine"); });
  await l2.setLang("pl");
  assert.equal(l2.engineFallback, true, "a failed registration shows English engine text and says so");
  const l3 = mk();
  await l3.attachEngine(async () => {});
  files["de/ui.ftl"] = "studio-title = Kshana Studio (de)"; // a language with no engine.ftl
  await l3.setLang("de");
  assert.equal(l3.engineFallback, true, "a missing engine catalogue falls back to English and says so");
  delete files["de/ui.ftl"];
});

test("glossary terms: the language's rendering, English next, then the caller's fallback", async () => {
  const l = mk();
  await l.setLang("pl");
  assert.equal(l.term("-tier-modelled"), "MODELLED");
  assert.equal(l.term("tier-modelled"), "MODELLED");
  assert.equal(l.term("-tier-nope", "x"), "x");
});

test("Intl: numbers and dates follow the language", async () => {
  const l = mk();
  await l.setLang("pl");
  assert.equal(l.number(1234.5), new Intl.NumberFormat("pl").format(1234.5));
  assert.equal(l.t("studio-count-x", { n: 1.25 }), "1.3 items", "falls back to English text with English number formatting in the fallback bundle");
});

test("renderRich keeps the page's own tags and refuses others", () => {
  const tags = { a1: { o: '<a href="x">', c: "</a>" }, c1: { h: "<code>kshana</code>" } };
  assert.equal(renderRich("Open <a1>the page</a1> or run <c1/> & go<br/>", tags), 'Open <a href="x">the page</a> or run <code>kshana</code> &amp; go<br>');
  assert.throws(() => renderRich("<a2>x</a2>", tags));
  assert.throws(() => renderRich("<a1>x", tags));
  assert.equal(renderRich("a < b", tags), "a &lt; b", "text is escaped, so a translation cannot add an element");
});

class Rich { constructor(attrs, html) { this.attrs = { ...attrs }; this.innerHTML = html; this.textContent = html; } getAttribute(k) { return k in this.attrs ? this.attrs[k] : null; } setAttribute(k, v) { this.attrs[k] = v; } }
test("data-l10n-rich sets the element's HTML from a message, and leaves a script-written element alone", async () => {
  files["en/studio-pages.ftl"] = "seg-aaa = Open <a1>the page</a1>";
  files["pl/studio-pages.ftl"] = "seg-aaa = Otwórz <a1>stronę</a1>";
  const tags = '{"a1":{"o":"<a href=\\"x\\">","c":"</a>"}}'.replace(/\\\\/g, "\\");
  const el = new Rich({ "data-l10n-rich": "seg-aaa", "data-l10n-tags": JSON.stringify({ a1: { o: '<a href="x">', c: "</a>" } }) }, 'Open <a href="x">the page</a>');
  const other = new Rich({ "data-l10n-rich": "seg-aaa", "data-l10n-tags": JSON.stringify({ a1: { o: "<b>", c: "</b>" } }) }, "x");
  const doc = { documentElement: new El({}), querySelectorAll: (sel) => (sel === "[data-l10n-rich]" ? [el, other] : []) };
  const l = createL10n({ base: "mem://", fetchText, doc, files: ["ui.ftl", "glossary.ftl", "studio-pages.ftl"] });
  await l.setLang("pl");
  assert.equal(el.innerHTML, 'Otwórz <a href="x">stronę</a>');
  other.innerHTML = "written by the page's script";
  await l.setLang("en");
  assert.equal(el.innerHTML, 'Open <a href="x">the page</a>');
  assert.equal(other.innerHTML, "written by the page's script");
  delete files["en/studio-pages.ftl"]; delete files["pl/studio-pages.ftl"];
});

test("every rich tag map in the Studio pages pairs an opening tag with its closing tag", async () => {
  // A map whose "o" held the whole element (<span data-studio-name>Kshana Studio</span>) and no "c" rendered the text
  // twice and then "undefined" ("Kshana Studio Studioundefined") on every page that loaded a catalogue, English included.
  const { readFileSync, readdirSync, statSync } = await import("node:fs");
  const { join, dirname } = await import("node:path");
  const { fileURLToPath } = await import("node:url");
  const root = join(dirname(fileURLToPath(import.meta.url)), "..");
  const pages = [];
  const walk = (d) => { for (const n of readdirSync(d)) { if (["recorded", "pkg", "data", "assets", "lib", "node_modules"].includes(n)) continue; const p = join(d, n); if (statSync(p).isDirectory()) walk(p); else if (n === "index.html") pages.push(p); } };
  walk(root);
  assert.ok(pages.length > 0);
  const unquote = (s) => s.replace(/&quot;/g, '"').replace(/&amp;/g, "&");
  let maps = 0;
  for (const p of pages) {
    for (const m of readFileSync(p, "utf8").matchAll(/data-l10n-tags="([^"]*)"/g)) {
      const tags = JSON.parse(unquote(m[1]));
      for (const [k, v] of Object.entries(tags)) {
        if (v.h !== undefined) continue;
        assert.equal(typeof v.c, "string", `${p}: tag ${k} has no closing tag (${v.o})`);
        assert.ok(!/<\//.test(v.o), `${p}: tag ${k} opens with a whole element (${v.o})`);
      }
      maps++;
    }
  }
  assert.ok(maps > 0);
});
