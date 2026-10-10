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
import { lfsPointers } from "./tools/lfs-pointer.mjs";
import { inlineJsonProblems } from "./tools/inline-json.mjs";

const WEB = dirname(fileURLToPath(import.meta.url));
const REPO = dirname(WEB);
const bytes = (rel) => readFileSync(join(WEB, rel));
const text = (rel) => readFileSync(join(WEB, rel), "utf8");
const sha = (buf) => createHash("sha256").update(buf).digest("hex");

const manifest = JSON.parse(text("PORT-MANIFEST.json"));
const ported = Object.keys(manifest.files);
const isPage = (rel) => rel.endsWith(".html") && !rel.startsWith("assets/");
const NOT_FOUND = "404.html"; // served by GitHub Pages for a missing address; not a page of the site map
// The pages at addresses that moved (web/tools/legacy-urls.json "paths": the Studio's old
// /playground/) only forward; they are not pages of the site map.
const MOVED = Object.keys(JSON.parse(text("tools/legacy-urls.json")).redirects.paths || {}).map((p) => p.slice(1) + "index.html");
// The Studio's Advanced view (the full dashboard) is a second page of the Studio app: a view of
// /studio/, noindex, so it is not a page of the site map either. Its <base href="../"> makes its
// relative addresses resolve from the Studio's own folder.
const VIEWS = ["studio/advanced/index.html", "studio/trust/index.html", "studio/interference/index.html", "studio/training/index.html"];
const pages = ported.filter((rel) => isPage(rel) && rel !== NOT_FOUND && !MOVED.includes(rel) && !VIEWS.includes(rel));
const indexed = pages;
for (const rel of MOVED) {
  assert.ok(ported.includes(rel), `${rel}: the page at a moved address was not ported`);
  assert.ok(/<meta name="robots" content="noindex">/.test(text(rel)), `${rel} is noindex`);
}
for (const rel of VIEWS) {
  assert.ok(ported.includes(rel), `${rel}: the Studio's Advanced view was not ported`);
  assert.ok(/<meta name="robots" content="noindex">/.test(text(rel)), `${rel} is noindex`);
}
// The folder a page's relative addresses resolve from: its own, or the one its <base href> names.
const linkDir = (rel, html) => { const b = html.match(/<base\s+href="([^"]*)"/); return b ? posix.normalize(posix.join(posix.dirname(rel), b[1])) : posix.dirname(rel); };
assert.ok(ported.length > 100, `the manifest lists only ${ported.length} files`);
assert.ok(pages.length > 20, `only ${pages.length} pages in the manifest`);

// ---- 0. No Git LFS pointer anywhere under web/. A port from a site-source checkout that never
// ran `git lfs pull` copies ~130-byte pointer files in place of the Studio's WebAssembly
// package, its recordings and its images, and the manifest SHAs below would still match.
assert.deepEqual(lfsPointers(WEB), [], "Git LFS pointer files under web/ instead of the files they point to: run `git lfs pull` in the site source and port again");

// ---- 1. The tree is exactly what the port wrote, plus the files web/ owns.
for (const rel of ported) {
  assert.ok(existsSync(join(WEB, rel)), `${rel} is in the manifest but not on disk: rerun the port`);
  assert.equal(sha(bytes(rel)), manifest.files[rel], `${rel} was changed after the port wrote it: rerun the port instead of editing it`);
}
const OWNED = new Set(["CNAME", "README.md", "build.sh", "smoke.mjs", "capabilities.json", "favicon.svg",
  "og-card.png", "og-card.svg", "og-card.rendered-from.json", ".well-known/security.txt", "data/card-matrix-map.json",
  "data/oracle-references.json", "data/standards-matrix-map.json", "data/verification-matrix.json", "PORT-MANIFEST.json",
  "site.test.mjs", "legacy-urls.test.mjs"]);
const BUILT = ["pkg/", "scenarios/", "studio/pkg/"];
const walk = (dir, base = "") => readdirSync(join(WEB, dir), { withFileTypes: true }).flatMap((e) => {
  const rel = base ? `${base}/${e.name}` : e.name;
  return e.isDirectory() ? walk(join(dir, e.name), rel) : [rel];
});
const OWNED_DIRS = ["tools/", "fonts/", "vendor/"];
const strays = walk(".").filter((rel) => !(rel in manifest.files) && !OWNED.has(rel) && !OWNED_DIRS.some((d) => rel.startsWith(d))
  && !BUILT.some((b) => rel.startsWith(b)) && !rel.endsWith(".DS_Store") && !rel.includes("__pycache__/"));
assert.deepEqual(strays, [], "files under web/ that neither the port nor web/ itself accounts for");

// ---- 2. One version: Cargo.toml, the manifest, the home page, the Studio's install panel.
const cargo = readFileSync(join(REPO, "Cargo.toml"), "utf8");
const version = cargo.split("[package]")[1].match(/^version\s*=\s*"([^"]+)"/m)[1];
assert.equal(manifest.version, version, "the port manifest's version is not Cargo.toml's");
assert.equal(JSON.parse(text("studio/channels.json")).version, version, "studio/channels.json version");
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
for (const [copy, source] of [["studio/data/capabilities.json", "capabilities.json"],
  ["studio/data/card-matrix-map.json", "data/card-matrix-map.json"],
  ["studio/data/oracle-references.json", "data/oracle-references.json"],
  ["studio/data/standards-matrix-map.json", "data/standards-matrix-map.json"],
  ["studio/data/verification-matrix.json", "data/verification-matrix.json"]]) {
  assert.ok(bytes(copy).equals(bytes(source)), `${copy} is not web/${source}: rerun the port`);
}
const studioTomls = readdirSync(join(WEB, "studio/scenarios")).filter((f) => f.endsWith(".toml")).sort();
assert.ok(studioTomls.length > 40, `the Studio bundles only ${studioTomls.length} scenarios`);
// Every scenario file anywhere in the Studio is this checkout's scenario of the same name.
const allStudioTomls = ported.filter((rel) => rel.startsWith("studio/") && rel.endsWith(".toml"));
for (const rel of allStudioTomls) {
  const f = rel.split("/").pop();
  const repoCopy = join(REPO, "scenarios", f);
  assert.ok(existsSync(repoCopy), `${rel} is not in scenarios/`);
  assert.ok(bytes(rel).equals(readFileSync(repoCopy)), `${rel} differs from scenarios/${f}: rerun the port`);
}
const studioScenarioNames = new Set(allStudioTomls.map((rel) => rel.split("/").pop()));
const bundle = JSON.parse(text("studio/scenarios/index.json"));
assert.deepEqual(Object.keys(bundle).sort(), studioTomls, "studio/scenarios/index.json bundles exactly the scenario files beside it");
for (const f of studioTomls) assert.equal(bundle[f], text(`studio/scenarios/${f}`), `index.json's ${f} is the file's text`);

// ---- 4b. The data each page carries inline parses, and none of it shows the signature of an
// unescaped version-bump regex (the 0.32.0 home page shipped a corrupt `kpage` block that way:
// see web/tools/inline-json.mjs).
const inlineProblems = ported.filter((rel) => rel.endsWith(".html") && !rel.startsWith("assets/")).flatMap((rel) => inlineJsonProblems(text(rel), rel));
assert.deepEqual(inlineProblems, [], `inline JSON is corrupt:\n${inlineProblems.join("\n")}`);

// ---- 5. Every internal link on every page resolves: the file is there, and so is the anchor.
const idsOf = new Map();
const ids = (rel) => {
  if (!idsOf.has(rel)) idsOf.set(rel, new Set([...text(rel).matchAll(/\sid="([^"]+)"/g)].map((m) => m[1])));
  return idsOf.get(rel);
};
const onDisk = (rel) => rel in manifest.files || OWNED.has(rel) || (OWNED_DIRS.some((d) => rel.startsWith(d)) && existsSync(join(WEB, rel)));
const built = (rel) => BUILT.some((b) => rel.startsWith(b));
const broken = [];
const dirty = [];
let links = 0;
let studioLinks = 0;
for (const rel of [...pages, NOT_FOUND, ...MOVED, ...VIEWS]) {
  const dir = linkDir(rel, text(rel));
  const html = text(rel).replace(/<script\b[\s\S]*?<\/script>/g, " ");
  for (const m of html.matchAll(/\s(?:href|src)="([^"]*)"/g)) {
    const raw = m[1].replace(/&amp;/g, "&");
    if (/^([a-z][a-z0-9+.-]*:|\/\/)/i.test(raw) || raw === "") continue; // external, mailto:, data:
    links += 1;
    const [pathQuery, frag] = raw.split("#");
    const [path, query] = pathQuery.split("?");
    // a root-absolute address ("/site.css", used by 404.html) is a path from web/
    let target = path === "" ? rel : path.startsWith("/") ? posix.normalize(path.slice(1)) : posix.normalize(posix.join(dir, path));
    if (target === "./") target = "."; // the site root, linked from a folder its <base href> names
    if (target.endsWith("/") || target === ".") target = target === "." ? "index.html" : target + "index.html";
    if (target.startsWith("../")) { broken.push(`${rel}: ${raw} leaves the site`); continue; }
    // a clean address (/evidence, /docs/changelog) is the page the host serves for it
    if (!onDisk(target) && !built(target) && onDisk(target + ".html")) target += ".html";
    // every link to a page is its clean address: no ".html", no "index.html" (Home is "/")
    if (rel !== NOT_FOUND && isPage(rel) && /(^|\/)index\.html$|\.html$/.test(path) && !path.startsWith("assets/") && !/^(\.\.\/)*assets\//.test(path)) dirty.push(`${rel}: ${raw}`);
    if (built(target)) continue;
    if (!onDisk(target)) { broken.push(`${rel}: ${raw} -> ${target} does not exist`); continue; }
    if (frag && target.endsWith(".html") && !ids(target).has(decodeURIComponent(frag))) broken.push(`${rel}: ${raw} -> no id="${frag}" in ${target}`);
    if (rel !== "playground/index.html" && /(^|\/)playground\//.test(path)) broken.push(`${rel}: ${raw} links the Studio's old address (it is /studio/)`);
    if (target === "studio/index.html" && query) {
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
assert.deepEqual(dirty.slice(0, 20), [], "links that name a page by its .html file instead of its clean address");
assert.ok(links > 1000, `only ${links} internal links were checked: the link scan is broken`);
assert.ok(studioLinks > 20, `only ${studioLinks} links into the Studio name a scenario: the scan is broken`);

// ---- 6. Every page says where it lives, carries the social card, and is in the sitemap; the
// crawl files are there (the site build writes them: robots.txt, sitemap.xml, llms.txt).
const sitemap = text("sitemap.xml");
for (const rel of indexed) {
  const html = text(rel);
  const url = "https://kshana.dev/" + (rel === "index.html" ? "" : rel.endsWith("/index.html") ? rel.slice(0, -"index.html".length) : rel.replace(/\.html$/, ""));
  assert.ok(html.includes(`<link rel="canonical" href="${url}">`), `${rel}: canonical link`);
  assert.ok(html.includes('<meta property="og:image" content="https://kshana.dev/og-card.png">'), `${rel}: og:image`);
  assert.ok(sitemap.includes(`<loc>${url}</loc>`), `${rel}: missing from sitemap.xml`);
}
assert.equal([...sitemap.matchAll(/<loc>/g)].length, indexed.length, "sitemap.xml lists exactly the indexed pages");
assert.ok(text("robots.txt").includes("Sitemap: https://kshana.dev/sitemap.xml"), "robots.txt names the sitemap");
assert.ok(!/^Disallow:\s*\S/im.test(text("robots.txt")), "robots.txt shuts nothing out");
const llms = text("llms.txt");
assert.ok(/^# \S/.test(llms) && /^> \S/m.test(llms), "llms.txt: an H1 and a summary");
for (const rel of indexed) {
  const url = "https://kshana.dev/" + (rel === "index.html" ? "" : rel.endsWith("/index.html") ? rel.slice(0, -"index.html".length) : rel.replace(/\.html$/, ""));
  if (rel !== "docs/index.html") assert.ok(llms.includes(`(${url})`), `llms.txt links ${url}`);
}
assert.ok(text("llms-full.txt").length > 100000, "llms-full.txt carries the pages");
for (const rel of pages) {
  for (const m of text(rel).matchAll(/<script type="application\/ld\+json">([\s\S]*?)<\/script>/g)) assert.doesNotThrow(() => JSON.parse(m[1]), `${rel}: JSON-LD parses`);
}
assert.equal(text("CNAME").trim(), "kshana.dev", "CNAME");

// ---- 7. Nothing from the machine that built it: no home-directory or checkout path in any
// ported text file, whatever its size. ("/Users/you/" is the docs' own placeholder in an
// example configuration; any real account name fails.)
const TEXT_EXT = /\.(html|css|js|mjs|json|txt|xml|svg|toml|md)$/;
const leaks = [];
let scanned = 0;
for (const rel of ported) {
  if (!TEXT_EXT.test(rel)) continue;
  scanned += 1;
  const m = text(rel).match(/\/Users\/(?!you\/)[A-Za-z0-9._-]+\/|\/home\/[a-z][a-z0-9._-]*\/(Code|code|src|work)\/|~\/Code\b|~\/[A-Za-z]+\/kshana|kshana-wt-[a-z0-9-]+|kshana-site-next/);
  if (m) leaks.push(`${rel}: ${m[0]}`);
}
assert.deepEqual(leaks, [], "ported files that name a developer's machine");
assert.ok(scanned > 200, `only ${scanned} text files were scanned for machine paths`);

// ---- 8. kshana.dev serves its own fonts, styles and scripts: no page, stylesheet or
// script makes a browser fetch from another host. A link a reader clicks (<a href>), the
// canonical link and the social-card addresses are not fetches and are not checked here.
const FONT_HOSTS = /fonts\.googleapis\.com|fonts\.gstatic\.com/;
const TAG = /<(link|script|img|source|iframe|video|audio|embed|object|use|image|track|input)\b[^>]*>/gi;
const ATTR = /\b(?:href|src|srcset|data|poster|xlink:href)\s*=\s*"((?:https?:)?\/\/[^"]*)"/gi;
const CSS_REMOTE = /url\(\s*['"]?((?:https?:)?\/\/[^)'"]+)|@import\s+(?:url\()?['"]?((?:https?:)?\/\/[^'");]+)/gi;
const JS_REMOTE = /(?:\bfrom\s*|\bimport\s*\(\s*|\bfetch\s*\(\s*|\bWorker\s*\(\s*|\bimportScripts\s*\(\s*|\bEventSource\s*\(\s*|\bWebSocket\s*\(\s*)["'`]((?:https?:|wss?:)?\/\/[^"'`]+)/gi;
const remote = [];
let resourceTags = 0;
for (const rel of ported) {
  if (!/\.(html|css|js|mjs)$/.test(rel)) continue;
  const body = text(rel);
  // The font hosts must not be named at all, not even in a comment, in a page or a stylesheet.
  if (/\.(html|css)$/.test(rel) && FONT_HOSTS.test(body)) remote.push(`${rel}: names ${body.match(FONT_HOSTS)[0]}`);
  if (rel.endsWith(".html")) {
    for (const tag of body.matchAll(TAG)) {
      resourceTags += 1;
      if (/\brel="canonical"/.test(tag[0])) continue;
      for (const m of tag[0].matchAll(ATTR)) remote.push(`${rel}: <${tag[1]}> loads ${m[1].slice(0, 80)}`);
    }
    for (const im of body.matchAll(/<script type="importmap">([\s\S]*?)<\/script>/gi)) {
      for (const m of im[1].matchAll(/"((?:https?:)?\/\/[^"]+)"/g)) remote.push(`${rel}: import map names ${m[1].slice(0, 80)}`);
      for (const [name, addr] of Object.entries(JSON.parse(im[1]).imports)) {
        const target = posix.normalize(posix.join(linkDir(rel, body), addr)); // an import map resolves against <base href> too
        assert.ok(/^\.\.?\//.test(addr), `${rel}: import map address for ${name} must be relative (./ or ../): ${addr}`);
        assert.ok(existsSync(join(WEB, target)), `${rel}: import map sends ${name} to ${target}, which does not exist`);
      }
    }
    for (const st of body.matchAll(/<style\b[^>]*>([\s\S]*?)<\/style>/gi)) for (const m of st[1].matchAll(CSS_REMOTE)) remote.push(`${rel}: inline style loads ${(m[1] || m[2]).slice(0, 80)}`);
    for (const sc of body.matchAll(/<script\b(?![^>]*\bsrc=)(?![^>]*application\/(?:ld\+)?json)[^>]*>([\s\S]*?)<\/script>/gi)) for (const m of sc[1].matchAll(JS_REMOTE)) remote.push(`${rel}: inline script loads ${m[1].slice(0, 80)}`);
  } else if (rel.endsWith(".css")) {
    for (const m of body.matchAll(CSS_REMOTE)) remote.push(`${rel}: loads ${(m[1] || m[2]).slice(0, 80)}`);
  } else if (!rel.endsWith(".test.mjs")) {
    for (const m of body.matchAll(JS_REMOTE)) remote.push(`${rel}: loads ${m[1].slice(0, 80)}`);
  }
}
assert.deepEqual(remote, [], "ported files that make a browser fetch from a third-party host");
assert.ok(resourceTags > 500, `only ${resourceTags} resource tags were scanned: the third-party scan is broken`);

// The local fonts: every page loads exactly one main font set from fonts/, plus the
// Devanagari subset for the name line ("Kshana · क्षण · the precise instant") exactly where
// the page shows it. Each stylesheet stands in for a recorded Google Fonts address, and every
// file it names is there, intact, with its licence text beside it.
const fonts = JSON.parse(text("fonts/FONTS.json"));
const fontCss = new Set(Object.values(fonts.stylesheets).map((e) => e.css));
const NAME_CSS = "noto-sans-devanagari.css";
let nameLinePages = 0;
for (const rel of [...pages, NOT_FOUND, ...VIEWS]) {
  const page = text(rel);
  const links = [...page.matchAll(/<link href="([^"]*fonts\/[^"]+\.css)" rel="stylesheet">/g)].map((m) => m[1]);
  const sheets = links.map((l) => l.split("fonts/")[1]);
  const main = sheets.filter((c) => c !== NAME_CSS);
  assert.equal(main.length, 1, `${rel}: expected exactly one local main font stylesheet, found ${main.length}`);
  const showsName = /<span lang="sa" class="dev">क्षण<\/span>/.test(page);
  if (showsName) nameLinePages++;
  assert.equal(sheets.includes(NAME_CSS), showsName,
    showsName ? `${rel}: shows the name line in Devanagari but does not load fonts/${NAME_CSS}`
              : `${rel}: loads fonts/${NAME_CSS} but shows no Devanagari name line`);
  for (const [i, css] of sheets.entries()) {
    assert.ok(fontCss.has(css), `${rel}: loads fonts/${css}, which FONTS.json does not record`);
    const target = links[i].startsWith("/") ? links[i].slice(1) : posix.normalize(posix.join(linkDir(rel, page), links[i]));
    assert.equal(target, `fonts/${css}`, `${rel}: font stylesheet address resolves to ${target}`);
  }
}
assert.ok(nameLinePages >= 7, `only ${nameLinePages} pages show the name line: the footer lost it`);
let fontFaces = 0;
for (const css of fontCss) {
  const body = text(`fonts/${css}`);
  assert.ok(!/https?:\/\//.test(body.replace(/\/\*[\s\S]*?\*\//g, "")), `fonts/${css} names a remote address`);
  for (const m of body.matchAll(/url\(files\/([^)]+)\)/g)) {
    fontFaces += 1;
    assert.ok(m[1] in fonts.files, `fonts/${css} names files/${m[1]}, which FONTS.json does not record`);
  }
}
for (const [name, meta] of Object.entries(fonts.files)) assert.equal(sha(bytes(`fonts/files/${name}`)), meta.sha256, `fonts/files/${name} is not the fetched file`);
assert.ok(fontFaces >= 20, `only ${fontFaces} @font-face sources found`);
const families = new Set(Object.values(fonts.stylesheets).flatMap((e) => e.families));
for (const fam of families) {
  assert.ok(fonts.licences[fam], `no licence recorded for the font family ${fam}`);
  assert.ok(/SIL OPEN FONT LICENSE/i.test(text(`fonts/${fonts.licences[fam].file}`)), `fonts/${fonts.licences[fam].file} is not an Open Font License text`);
}
// The vendored script libraries: intact, each with its licence.
const vendor = JSON.parse(text("vendor/VENDOR.json"));
for (const [pkg, files] of Object.entries(vendor.packages)) {
  assert.ok("LICENSE" in files, `vendor/${pkg} has no LICENSE`);
  for (const [path, meta] of Object.entries(files)) assert.equal(sha(bytes(`vendor/${pkg}/${path}`)), meta.sha256, `vendor/${pkg}/${path} is not the fetched file`);
}

// ---- 9. 404.html, the page GitHub Pages serves (with status 404) for a missing address
// at any depth: every address in it is written from the site root, it is kept out of
// search results and the sitemap, and it offers the way back.
const nf = text(NOT_FOUND);
assert.ok(nf.includes('<meta name="robots" content="noindex">'), "404.html is noindex");
assert.ok(!nf.includes("<base "), "404.html uses root-absolute addresses, not <base> (which would re-point its fragment links)");
assert.ok(!sitemap.includes("404"), "404.html is not in the sitemap");
assert.ok(!nf.includes("legacy-redirects.js") && !nf.includes('rel="canonical"'), "404.html neither redirects nor claims a canonical address");
for (const m of nf.replace(/<script\b[\s\S]*?<\/script>/g, (sc) => (sc.includes(" src=") ? sc : " ")).matchAll(/\s(?:href|src)="([^"]*)"/g)) {
  assert.ok(/^(\/|#|[a-z][a-z0-9+.-]*:)/i.test(m[1]), `404.html: relative address ${m[1]} would break below the site root`);
}
for (const to of ["/", "/docs/", "/studio/"]) assert.ok(nf.includes(`href="${to}"`), `404.html links to ${to}`);
assert.ok(nf.includes('root:"/"'), "404.html tells site.js the site root, so search results open from any depth");
assert.ok(/<h1[^>]*>[^<]*No page at this address/.test(nf), "404.html says what happened");
assert.ok(nf.includes('<header class="nav"') && nf.includes('<footer class="foot">') && nf.includes('id="palette"'), "404.html carries the site's navigation, footer and search");
const pagesYml = readFileSync(join(REPO, ".github/workflows/pages.yml"), "utf8");
assert.ok(pagesYml.includes("404.html"), "pages.yml checks that 404.html is staged");

console.log(`site.test.mjs: all assertions passed (${ported.length} ported files, ${pages.length} pages, ${links} internal links, ${studioLinks} Studio deep links, ${studioTomls.length} Studio scenarios)`);
