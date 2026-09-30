// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the site as it sits in web/: the pages, the docs and the Studio that
// web/tools/port_site.py ports in from a site build. They pin the ported tree to the
// things it must agree with: its own manifest (no hand edits, no strays), the engine
// version, the generated ledger and the READMEs (one set of counts), this checkout's
// scenarios (the Studio runs the files the engine ships), and its own links.
// A failure here almost always means: rebuild the site from this checkout and rerun the
// port. Run with `node web/site.test.mjs`.
import { readFileSync, readdirSync, existsSync, statSync } from "node:fs";
import { createHash } from "node:crypto";
import { fileURLToPath } from "node:url";
import { join, dirname, posix } from "node:path";
import assert from "node:assert/strict";

const WEB = dirname(fileURLToPath(import.meta.url));
const REPO = dirname(WEB);
const bytes = (rel) => readFileSync(join(WEB, rel));
const text = (rel) => readFileSync(join(WEB, rel), "utf8");
const sha = (buf) => createHash("sha256").update(buf).digest("hex");

const manifest = JSON.parse(text("PORT-MANIFEST.json"));
const ported = Object.keys(manifest.files);
const isPage = (rel) => rel.endsWith(".html") && !rel.startsWith("assets/");
const pages = ported.filter(isPage);
assert.ok(ported.length > 100, `the manifest lists only ${ported.length} files`);
assert.ok(pages.length > 20, `only ${pages.length} pages in the manifest`);

// ---- 1. The tree is exactly what the port wrote, plus the files web/ owns.
for (const rel of ported) {
  assert.ok(existsSync(join(WEB, rel)), `${rel} is in the manifest but not on disk: rerun the port`);
  assert.equal(sha(bytes(rel)), manifest.files[rel], `${rel} was changed after the port wrote it: rerun the port instead of editing it`);
}
const OWNED = new Set(["CNAME", "robots.txt", "README.md", "build.sh", "smoke.mjs", "capabilities.json", "favicon.svg",
  "og-card.png", "og-card.svg", "og-card.rendered-from.json", ".well-known/security.txt", "data/card-matrix-map.json",
  "data/oracle-references.json", "data/standards-matrix-map.json", "data/verification-matrix.json", "PORT-MANIFEST.json",
  "site.test.mjs", "legacy-urls.test.mjs"]);
const BUILT = ["pkg/", "scenarios/", "playground/pkg/"];
const walk = (dir, base = "") => readdirSync(join(WEB, dir), { withFileTypes: true }).flatMap((e) => {
  const rel = base ? `${base}/${e.name}` : e.name;
  return e.isDirectory() ? walk(join(dir, e.name), rel) : [rel];
});
const strays = walk(".").filter((rel) => !(rel in manifest.files) && !OWNED.has(rel) && !rel.startsWith("tools/")
  && !BUILT.some((b) => rel.startsWith(b)) && !rel.endsWith(".DS_Store") && !rel.includes("__pycache__/"));
assert.deepEqual(strays, [], "files under web/ that neither the port nor web/ itself accounts for");

// ---- 2. One version: Cargo.toml, the manifest, the home page, the Studio's install panel.
const cargo = readFileSync(join(REPO, "Cargo.toml"), "utf8");
const version = cargo.split("[package]")[1].match(/^version\s*=\s*"([^"]+)"/m)[1];
assert.equal(manifest.version, version, "the port manifest's version is not Cargo.toml's");
assert.equal(JSON.parse(text("playground/channels.json")).version, version, "playground/channels.json version");
const home = text("index.html");
assert.ok(home.includes(`"softwareVersion": "${version}"`), "index.html JSON-LD softwareVersion");
assert.ok(home.includes(`>v${version}<`), "index.html version chip");

// ---- 3. One set of counts: the generated ledger, the READMEs, the pages.
const ledger = JSON.parse(text("data/verification-matrix.json"));
const s = ledger.summary;
assert.equal(s.total, ledger.rows.length, "the ledger's summary.total is its row count");
const pair = `${s.validated} of ${s.total}`;
// README.md's headline line and badge are pinned to src/verification.rs by
// tests/readme_validation_counts_doc_sync.rs; the ledger file is pinned to it by
// tests/verification_artifacts_doc_sync.rs. This closes the triangle on the site side.
const readme = readFileSync(join(REPO, "README.md"), "utf8");
assert.ok(readme.includes(`<strong>${pair}</strong> capabilities validated`), `README.md headline must state ${pair}`);
assert.ok(readme.includes(`${s.total} rows — ${s.validated} VALIDATED, ${s.modelled} MODELLED, ${s.partner_owned} PARTNER`),
  "README.md matrix line must state the same split");
const visible = (html) => html.replace(/<(script|style|svg)\b[\s\S]*?<\/\1>/g, " ").replace(/<[^>]+>/g, " ").replace(/\s+/g, " ");
const metas = (html) => [...html.matchAll(/content="([^"]*)"/g)].map((m) => m[1]).join(" . ");
for (const rel of pages) {
  const html = text(rel);
  const body = `${visible(html)} . ${metas(html)}`;
  // Every "N of M capabilities validated" anywhere on any page is the ledger's pair.
  for (const m of body.matchAll(/(\d+) of (\d+) capabilities validated/g)) {
    assert.equal(`${m[1]} of ${m[2]}`, pair, `${rel} states "${m[0]}"; the ledger is ${pair}`);
  }
  assert.ok(metas(html).includes(`${pair} capabilities validated against external oracles`), `${rel}: social-card alt text must state ${pair}`);
}
assert.ok(visible(home).includes(`${s.validated} /${s.total} validated against`), "index.html stat strip states the ledger pair");
assert.ok(visible(text("evidence.html")).includes(`All ${s.total} rows, one line each.`), "evidence.html ledger heading states the total");

// ---- 4. The Studio ships the engine's own facts, not a copy that can age.
for (const [copy, source] of [["playground/data/capabilities.json", "capabilities.json"],
  ["playground/data/card-matrix-map.json", "data/card-matrix-map.json"],
  ["playground/data/oracle-references.json", "data/oracle-references.json"],
  ["playground/data/standards-matrix-map.json", "data/standards-matrix-map.json"],
  ["playground/data/verification-matrix.json", "data/verification-matrix.json"]]) {
  assert.ok(bytes(copy).equals(bytes(source)), `${copy} is not web/${source}: rerun the port`);
}
const studioTomls = readdirSync(join(WEB, "playground/scenarios")).filter((f) => f.endsWith(".toml")).sort();
assert.ok(studioTomls.length > 40, `the Studio bundles only ${studioTomls.length} scenarios`);
// Every scenario file anywhere in the Studio is this checkout's scenario of the same name.
const allStudioTomls = ported.filter((rel) => rel.startsWith("playground/") && rel.endsWith(".toml"));
for (const rel of allStudioTomls) {
  const f = rel.split("/").pop();
  const repoCopy = join(REPO, "scenarios", f);
  assert.ok(existsSync(repoCopy), `${rel} is not in scenarios/`);
  assert.ok(bytes(rel).equals(readFileSync(repoCopy)), `${rel} differs from scenarios/${f}: rerun the port`);
}
const studioScenarioNames = new Set(allStudioTomls.map((rel) => rel.split("/").pop()));
const bundle = JSON.parse(text("playground/scenarios/index.json"));
assert.deepEqual(Object.keys(bundle).sort(), studioTomls, "playground/scenarios/index.json bundles exactly the scenario files beside it");
for (const f of studioTomls) assert.equal(bundle[f], text(`playground/scenarios/${f}`), `index.json's ${f} is the file's text`);

// ---- 5. Every internal link on every page resolves: the file is there, and so is the anchor.
const idsOf = new Map();
const ids = (rel) => {
  if (!idsOf.has(rel)) idsOf.set(rel, new Set([...text(rel).matchAll(/\sid="([^"]+)"/g)].map((m) => m[1])));
  return idsOf.get(rel);
};
const onDisk = (rel) => rel in manifest.files || OWNED.has(rel);
const built = (rel) => BUILT.some((b) => rel.startsWith(b));
const broken = [];
let links = 0;
let studioLinks = 0;
for (const rel of pages) {
  const html = text(rel).replace(/<script\b[\s\S]*?<\/script>/g, " ");
  for (const m of html.matchAll(/\s(?:href|src)="([^"]*)"/g)) {
    const raw = m[1].replace(/&amp;/g, "&");
    if (/^([a-z][a-z0-9+.-]*:|\/\/)/i.test(raw) || raw === "") continue; // external, mailto:, data:
    links += 1;
    const [pathQuery, frag] = raw.split("#");
    const [path, query] = pathQuery.split("?");
    let target = path === "" ? rel : posix.normalize(posix.join(posix.dirname(rel), path));
    if (target.endsWith("/")) target += "index.html";
    if (target.startsWith("../")) { broken.push(`${rel}: ${raw} leaves the site`); continue; }
    if (built(target)) continue;
    if (!onDisk(target)) { broken.push(`${rel}: ${raw} -> ${target} does not exist`); continue; }
    if (frag && target.endsWith(".html") && !ids(target).has(decodeURIComponent(frag))) broken.push(`${rel}: ${raw} -> no id="${frag}" in ${target}`);
    if (target === "playground/index.html" && query) {
      const sc = new URLSearchParams(query).get("scenario");
      if (sc) {
        studioLinks += 1;
        const file = sc.endsWith(".toml") ? sc : `${sc}.toml`;
        if (!studioScenarioNames.has(file)) broken.push(`${rel}: ${raw} opens ${file}, which the Studio does not bundle`);
      }
    }
  }
}
assert.deepEqual(broken, [], "broken internal links");
assert.ok(links > 1000, `only ${links} internal links were checked: the link scan is broken`);
assert.ok(studioLinks > 20, `only ${studioLinks} links into the Studio name a scenario: the scan is broken`);

// ---- 6. Every page says where it lives, carries the social card, and is in the sitemap.
const sitemap = text("sitemap.xml");
for (const rel of pages) {
  const html = text(rel);
  const url = "https://kshana.dev/" + (rel === "index.html" ? "" : rel.endsWith("/index.html") ? rel.slice(0, -"index.html".length) : rel);
  assert.ok(html.includes(`<link rel="canonical" href="${url}">`), `${rel}: canonical link`);
  assert.ok(html.includes('<meta property="og:image" content="https://kshana.dev/og-card.png">'), `${rel}: og:image`);
  assert.ok(sitemap.includes(`<loc>${url}</loc>`), `${rel}: missing from sitemap.xml`);
}
assert.equal([...sitemap.matchAll(/<loc>/g)].length, pages.length, "sitemap.xml lists exactly the pages");
assert.ok(text("robots.txt").includes("Sitemap: https://kshana.dev/sitemap.xml"), "robots.txt names the sitemap");
assert.equal(text("CNAME").trim(), "kshana.dev", "CNAME");

// ---- 7. Nothing from the machine that built it: no home-directory or checkout paths
// ("/Users/you/" is the docs' own placeholder in an example configuration).
const TEXT_EXT = /\.(html|css|js|mjs|json|txt|xml|svg|toml|md)$/;
const leaks = [];
for (const rel of ported) {
  if (!TEXT_EXT.test(rel) || statSync(join(WEB, rel)).size > 8e6) continue;
  const m = text(rel).match(/\/Users\/(?!you\/)[A-Za-z0-9._-]+\/|\/home\/[a-z][a-z0-9._-]*\/(Code|code|src|work)\/|~\/Code\/|kshana-wt-[a-z0-9-]+|kshana-site-next/);
  if (m) leaks.push(`${rel}: ${m[0]}`);
}
assert.deepEqual(leaks, [], "ported files that name a developer's machine");

console.log(`site.test.mjs: all assertions passed (${ported.length} ported files, ${pages.length} pages, ${links} internal links, ${studioLinks} Studio deep links, ${studioTomls.length} Studio scenarios)`);
