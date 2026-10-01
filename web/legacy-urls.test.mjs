// SPDX-License-Identifier: AGPL-3.0-only
// Every address of the single-page kshana.dev that published material uses, or that the
// old page handed out, must still land somewhere real. The list is
// web/tools/legacy-urls.json; this test replays each case through the generated
// web/legacy-redirects.js (the script the home page loads) and checks that the file it
// lands on exists and carries the anchor. Run with `node web/legacy-urls.test.mjs`.
import { readFileSync, existsSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { join, dirname } from "node:path";
import vm from "node:vm";
import assert from "node:assert/strict";

const WEB = dirname(fileURLToPath(import.meta.url));
const REPO = dirname(WEB);
const text = (rel) => readFileSync(join(WEB, rel), "utf8");
const legacy = JSON.parse(text("tools/legacy-urls.json"));
const ids = (rel) => new Set([...text(rel).matchAll(/\sid="([^"]+)"/g)].map((m) => m[1]));
// A clean address ("/evidence", "/playground/") -> the file the host serves for it.
const fileOf = (pathname) => { const p = pathname.replace(/^\//, ""); return p === "" || p.endsWith("/") ? p + "index.html" : /\.[a-z0-9]+$/i.test(p) ? p : p + ".html"; };

// The generated script, loaded the way a browser's classic <script> would, without a page:
// it must define the mapping and not try to navigate.
const src = text("legacy-redirects.js");
const sandbox = {};
vm.runInNewContext(src, sandbox);
const target = sandbox.kshanaLegacyTarget;
assert.equal(typeof target, "function", "legacy-redirects.js defines kshanaLegacyTarget");
// The script's rules are the JSON's rules: a hand-edited script fails here.
const rules = JSON.parse(src.slice(src.indexOf("var RULES = ") + "var RULES = ".length, src.indexOf(";\n  function legacyTarget")));
assert.deepEqual(rules, legacy.redirects, "legacy-redirects.js was not generated from the current legacy-urls.json: rerun the port");
for (const [h, to] of Object.entries(legacy.redirects.hash)) assert.equal(target("", `#${h}`), to, `#${h}`);

// The home page actually loads it, before anything else can paint.
const home = text("index.html");
assert.ok(home.includes('<script src="legacy-redirects.js"></script>'), "index.html loads legacy-redirects.js");
assert.ok(home.indexOf("legacy-redirects.js") < home.indexOf('rel="stylesheet"'), "and loads it ahead of the stylesheets");

// In a page, the script navigates with location.replace (no extra history entry).
const navigate = (search, hash) => {
  let went = null;
  const win = { location: { search, hash, replace: (u) => { went = u; } }, document: {} };
  vm.runInNewContext(src, { window: win });
  return went;
};

const buildSh = readFileSync(join(REPO, "web/build.sh"), "utf8");
let redirected = 0;
let kept = 0;
for (const c of legacy.cases) {
  const u = new URL(c.url, legacy.origin);
  assert.equal(u.pathname === "/" || u.pathname === "/index.html" || c.to === null, true, `${c.url}: only the home page can redirect`);
  const got = u.pathname === "/" || u.pathname === "/index.html" ? target(u.search, u.hash) : null;
  assert.equal(got, c.to, `${c.url} should ${c.to ? "go to " + c.to : "stay where it is"}`);
  assert.ok(c.cited && c.cited.trim().length > 0, `${c.url}: say where this address is published`);
  if (c.to) {
    redirected += 1;
    assert.equal(navigate(u.search, u.hash), c.to, `${c.url}: the page navigates there`);
    const landed = new URL(c.to, legacy.origin + "/");
    assert.ok(!/\.html$/.test(landed.pathname), `${c.url} lands on ${c.to}: a redirect names the clean address, without .html`);
    const file = fileOf(landed.pathname);
    assert.ok(existsSync(join(WEB, file)), `${c.url} lands on ${file}, which does not exist`);
    const frag = landed.hash.slice(1);
    // A share link's fragment is the scenario itself, read by the Studio; any other fragment is an anchor.
    if (frag && !frag.startsWith("s=")) assert.ok(ids(file).has(frag), `${c.url} lands on ${c.to}, but ${file} has no id="${frag}"`);
  } else {
    kept += 1;
    assert.equal(navigate(u.search, u.hash), null, `${c.url}: the page stays put`);
    if (c.file) {
      assert.ok(existsSync(join(WEB, c.file)), `${c.url}: web/${c.file} is gone`);
      if (c.id) assert.ok(ids(c.file).has(c.id), `${c.url}: web/${c.file} has no id="${c.id}"`);
    } else {
      // A build output: web/build.sh must still put it there, and once built it must exist.
      assert.ok(c.built, `${c.url}: a kept address names either a file or a build output`);
      const dir = c.built.split("/")[0];
      assert.ok(buildSh.includes(`web/${dir}`), `${c.url}: web/build.sh no longer stages web/${dir}/`);
      if (existsSync(join(WEB, dir))) assert.ok(existsSync(join(WEB, c.built)), `${c.url}: web/${dir}/ is built but ${c.built} is not in it`);
    }
  }
}
// Share and embed links keep their payload: the Studio reads the same fragment and query.
assert.equal(target("", "#s=abc_DEF-123"), "/playground/#s=abc_DEF-123");
assert.equal(target("?embed=1&scenario=clock-holdover.toml", "#s=abc"), "/playground/?embed=1&scenario=clock-holdover.toml#s=abc");
assert.equal(target("?scenario=x&embed=1", ""), "/playground/?scenario=x&embed=1");
assert.equal(target("?embed=10", ""), null, "only embed=1 is an embed link");
// Old embed links name result tabs by the single-page site's ids (its tabs.mjs: fom,
// timeseries, stability, orbit3d, sweep). Each is either still a Studio tab or is mapped to
// the nearest one, so no old embed link falls back to a default view.
const tabDefs = text("playground/app.js").match(/const TAB_DEFS = \[([\s\S]*?)\n\];/);
assert.ok(tabDefs, "the Studio's tab list (const TAB_DEFS) was found");
const studioTabs = new Set([...tabDefs[1].matchAll(/\{ id: "([a-z0-9-]+)"/g)].map((m) => m[1]));
assert.ok(studioTabs.size >= 8, `only ${studioTabs.size} Studio tabs parsed`);
for (const old of ["fom", "timeseries", "stability", "orbit3d", "sweep"]) {
  const got = new URLSearchParams(target(`?embed=1&tab=${old}`, "").split("?")[1]).get("tab");
  assert.ok(studioTabs.has(got), `old embed tab ${old} opens ${got}, which is not a Studio tab`);
  if (studioTabs.has(old)) assert.equal(got, old, `tab ${old} still exists and must not be renamed`);
}
for (const [old, now] of Object.entries(legacy.redirects.embedTabs)) {
  assert.ok(!studioTabs.has(old), `${old} is a Studio tab again: remove its mapping`);
  assert.ok(studioTabs.has(now), `${old} maps to ${now}, which is not a Studio tab`);
}
assert.equal(target("?embed=1&scenario=integrity-raim.toml&seed=7&tab=fom", ""), "/playground/?embed=1&scenario=integrity-raim.toml&seed=7&tab=overview");
assert.equal(target("?embed=1&tab=orbit3d&seed=3", ""), "/playground/?embed=1&tab=orbit&seed=3");
assert.equal(target("?embed=1&tab=json", ""), "/playground/?embed=1&tab=json", "a current tab name passes through");
assert.equal(target("?embed=1&scenario=fom.toml", ""), "/playground/?embed=1&scenario=fom.toml", "only the tab parameter is rewritten");
// An address the new home page owns is never hijacked.
for (const id of ids("index.html")) assert.equal(target("", `#${id}`), null, `#${id} is a live anchor on the home page and must not redirect`);
for (const a of legacy.keptAnchors) assert.ok(ids("index.html").has(a), `kept anchor #${a} is on the home page`);
// The Studio reads share and embed links with the modules the old page used.
const studio = text("playground/app.js");
assert.ok(studio.includes("decodeFragment(location.hash)") && studio.includes("embedConfig(location.search)"), "the Studio reads share fragments and embed queries");
// Material in this repository that cites a fragment address cites one on the list.
const cited = ["docs/tutorials/README.md", "docs/tutorials/01-first-orbit.md", "README.md", "README.npm.md", "README.crates.md", "README.pypi.md"];
const known = new Set(legacy.cases.map((c) => c.url));
for (const f of cited) {
  for (const m of readFileSync(join(REPO, f), "utf8").matchAll(/https:\/\/kshana\.dev(\/[#?][^\s)"'<>`]*)/g)) {
    assert.ok(known.has(m[1].replace(/[.,;:]+$/, "")), `${f} cites kshana.dev${m[1]}, which is not in web/tools/legacy-urls.json`);
  }
}
assert.ok(redirected >= 10 && kept >= 10, `only ${redirected} redirects and ${kept} kept addresses were checked`);

console.log(`legacy-urls.test.mjs: all assertions passed (${legacy.cases.length} old addresses: ${redirected} redirected, ${kept} kept)`);
