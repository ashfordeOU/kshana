#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Port the built kshana.dev site and the Studio into web/, the tree pages.yml deploys.

    python3 web/tools/port_site.py --site <built site folder> --studio <Studio folder>
    python3 web/tools/port_site.py --site ... --studio ... --check   # report drift, write nothing

The site folder is a finished build: its PUBLISH.txt lists the files to publish. The Studio
folder is the app's source (index.html, app.js, lib/, recorded/, scenarios/ ...). Neither is
modified. The port is a pure function of those two folders and this checkout, so running it
twice changes nothing, and `--check` exits 1 when web/ is not what the port would write.

What it writes (and records, with a SHA-256 each, in web/PORT-MANIFEST.json):
  * every published site file except the site's own studio/ copy and its preview of the
    Studio's old address (playground/);
  * the Studio under studio/ (served at /studio/), with its module tests, without its dev files and without
    pkg/ (the WebAssembly package is built by web/build.sh from this checkout);
  * every scenario file (*.toml) the Studio carries, taken from THIS checkout's scenarios/
    under the same name, the scenarios/index.json bundle rebuilt from them, and
    studio/data/*.json from web/'s own generated copies, so the app cannot state
    older facts than the engine it runs;
  * the site build's own crawl files and tags, as they are: canonical, Open Graph, social-card
    and schema.org tags on every page, robots.txt, sitemap.xml, llms.txt, llms-full.txt and the
    IndexNow key file. The port checks them (every page carries its canonical address and is in
    the sitemap) and refuses a site built without them; it no longer writes its own;
  * legacy-redirects.js and the pages at the Studio's old addresses (playground/index.html),
    both from web/tools/legacy-urls.json.

  * no third-party requests: each page's Google Fonts stylesheet link becomes a link to
    the local copy under fonts/, and script-host addresses become paths under vendor/
    (both fetched once by web/tools/fetch_third_party.py and committed); a font set or a
    library that is not there refuses the port, as does any other third-party script,
    style or font address;
  * 404.html, the page GitHub Pages serves for an address that does not exist, made from
    the home page's own shell.

What it never touches: the files web/ owns (OWNED below), anything under web/tools/,
web/fonts/ and web/vendor/, the repository's own *.test.mjs files at web/'s top level, and
build outputs (pkg/, scenarios/). A file the previous port wrote and this one does not is
removed. The port needs no network.
"""
import argparse
import hashlib
import html
import json
import os
import re
import sys

TOOLS = os.path.dirname(os.path.abspath(__file__))
WEB = os.path.dirname(TOOLS)
REPO = os.path.dirname(WEB)
ORIGIN = "https://kshana.dev"
MANIFEST = "PORT-MANIFEST.json"
STUDIO_DIR = "studio"
# Addresses that moved: the Studio was under /playground/ until 0.29.1. The pages written
# there (from legacy-urls.json "paths") forward to the new address.
OLD_DIRS = ("playground/",)

# Files web/ owns: sources for generators, deploy plumbing, and old URLs that must stay.
OWNED = {
    "CNAME", "README.md", "build.sh", "smoke.mjs", "capabilities.json", "favicon.svg",
    "og-card.png", "og-card.svg", "og-card.rendered-from.json", ".well-known/security.txt",
    "data/card-matrix-map.json", "data/oracle-references.json", "data/standards-matrix-map.json",
    "data/verification-matrix.json", MANIFEST,
}
# Folders web/ owns outright: the tools, and the third-party files fetched once and committed.
OWNED_DIRS = ("tools/", "fonts/", "vendor/")
# Build outputs of web/build.sh; never written here, never removed here.
BUILT_DIRS = ("pkg/", "scenarios/", STUDIO_DIR + "/pkg/")
# The single-page front end this port replaces. Removed on the first port.
RETIRED = ["app.js", "style.css"] + [
    f"{m}{s}" for m in ("chartdl", "compare", "counts", "embed", "engine", "guided", "hover", "orbit3d", "overlay",
                        "report", "share", "sweep", "tabs", "tour") for s in (".mjs", ".test.mjs")
] + ["engine-worker.mjs"]
# The Studio's canonical data lives in web/ (generated from the engine and pinned by tests).
STUDIO_DATA = {
    "data/capabilities.json": "capabilities.json",
    "data/card-matrix-map.json": "data/card-matrix-map.json",
    "data/oracle-references.json": "data/oracle-references.json",
    "data/standards-matrix-map.json": "data/standards-matrix-map.json",
    "data/verification-matrix.json": "data/verification-matrix.json",
}
STUDIO_SKIP_NAMES = {"selfcheck.mjs", "PARITY.md"}
STUDIO_SKIP_RE = re.compile(r"^(tools_.*\.mjs|.*\.d\.ts|\..*)$")

TEXT_EXT = (".html", ".css", ".js", ".mjs", ".json", ".txt", ".xml", ".svg", ".toml", ".md")
# A path on the machine that built the inputs. "/Users/you/" is the docs' own placeholder.
DEV_PATH = re.compile(r"/Users/(?!you/)[A-Za-z0-9._-]+/|/home/[a-z][a-z0-9._-]*/(?:Code|code|src|work)/|~/Code/|kshana-wt-[a-z0-9-]+|kshana-site-next")
# An engine report prints the command it was run with, scenario path included. A recorder
# that ran the engine on a temporary copy leaves that machine's path in the report.
REPORT_CMD = re.compile(r"(kshana )(?:/[^\s<>\"'&]+)*/([a-z0-9][a-z0-9-]*\.toml)")

notes = []
errors = []


def note(msg):
    notes.append(msg)


def fail(msg):
    errors.append(msg)


def rb(path):
    with open(path, "rb") as f:
        return f.read()


def sha(data):
    return hashlib.sha256(data).hexdigest()


def ids_of(text):
    return set(re.findall(r'\sid="([^"]+)"', text))


def cargo_version():
    text = open(os.path.join(REPO, "Cargo.toml"), encoding="utf-8").read()
    pkg = text.split("[package]", 1)[1]
    return re.search(r'^version\s*=\s*"([^"]+)"', pkg, re.M).group(1)


def scrub(out):
    """Take the building machine's paths out of what is published, then refuse what is left.

    Two known cases are rewritten, each to what the text should have said, and each is
    reported so its source can be fixed (the rewrite is a stopgap, not the fix):
      * an engine report under assets/ whose "command to reproduce" names the recorder's
        temporary copy of a scenario: the path becomes scenarios/<file>.toml, the file's
        place in the repository, provided the file exists there;
      * a source comment that names the developer's checkout (~/Code/kshana...).
    Anything else that still names a developer's machine fails the port.
    """
    fixed_reports, fixed_comments = [], []
    for rel in sorted(out):
        if not rel.endswith(TEXT_EXT) or len(out[rel]) > 8_000_000:
            continue
        text = out[rel].decode("utf-8")
        if not DEV_PATH.search(text):
            continue
        new = text
        if rel.startswith("assets/") and rel.endswith(".html"):
            def repo_path(m):
                if os.path.isfile(os.path.join(REPO, "scenarios", m.group(2))):
                    return f"{m.group(1)}scenarios/{m.group(2)}"
                return m.group(0)
            new = REPORT_CMD.sub(repo_path, new)
            if new != text:
                fixed_reports.append(rel)
        else:
            new = new.replace("~/Code/kshana/web", "web/ in the kshana repository").replace("~/Code/kshana", "the kshana repository")
            if new != text:
                fixed_comments.append(rel)
        left = DEV_PATH.search(new)
        if left:
            fail(f"{rel}: names a developer's machine ({left.group(0)}...); fix it in the source, the port will not publish it")
        out[rel] = new.encode("utf-8")
    if fixed_reports:
        note(f"{len(fixed_reports)} engine report(s) named the recorder's temporary scenario path; rewritten to scenarios/<file>.toml. "
             f"Fix the recorder (run the engine on scenarios/<file>.toml from a repository layout): {', '.join(fixed_reports)}")
    if fixed_comments:
        note(f"source comments named a developer checkout (~/Code/kshana); reworded. Fix the source: {', '.join(fixed_comments)}")


FONT_HREF = re.compile(r'href="(https://fonts\.googleapis\.com/css2\?[^"]+)"')
FONT_PRECONNECT = re.compile(r'<link\b[^>]*href="https://fonts\.(?:googleapis|gstatic)\.com/?"[^>]*>\n?')
_third = {}


def third_party():
    """The registries fetch_third_party.py wrote, checked against the files beside them."""
    if _third:
        return _third
    for key, rel in (("fonts", "fonts/FONTS.json"), ("vendor", "vendor/VENDOR.json")):
        path = os.path.join(WEB, rel)
        if not os.path.isfile(path):
            sys.exit(f"web/{rel} is missing: run web/tools/fetch_third_party.py once (it needs the network; the port does not)")
        _third[key] = json.load(open(path, encoding="utf-8"))
    for name, meta in _third["fonts"]["files"].items():
        f = os.path.join(WEB, "fonts", "files", name)
        if not os.path.isfile(f) or sha(rb(f)) != meta["sha256"]:
            fail(f"web/fonts/files/{name} is missing or is not the file FONTS.json records")
    for pkg, files in _third["vendor"]["packages"].items():
        for path_in, meta in files.items():
            f = os.path.join(WEB, "vendor", pkg, path_in)
            if not os.path.isfile(f) or sha(rb(f)) != meta["sha256"]:
                fail(f"web/vendor/{pkg}/{path_in} is missing or is not the file VENDOR.json records")
    return _third


def localise(rel, text):
    """Point a ported file at web/'s own copies of what it would load from another host."""
    tp = third_party()
    depth = rel.count("/")
    if rel.endswith((".html", ".css")):  # a stylesheet may quote the link in a comment
        def font(m):
            url = html.unescape(m.group(1))
            entry = tp["fonts"]["stylesheets"].get(url)
            if not entry:
                fail(f"{rel}: asks Google Fonts for a font set that is not under web/fonts/ ({url}); "
                     "run web/tools/fetch_third_party.py, commit what it writes, and port again")
                return m.group(0)
            return f'href="{"../" * depth}fonts/{entry["css"]}"'
        text = FONT_PRECONNECT.sub("", FONT_HREF.sub(font, text))
    cdn = tp["vendor"]["cdn"]
    if cdn in text:
        for pkg, files in tp["vendor"]["packages"].items():
            # "./" or "../": an import map and a module import both need an explicitly relative address
            text = text.replace(f"{cdn}{pkg}/", f'{"../" * depth or "./"}vendor/{pkg}/')
            for m in re.finditer(r"vendor/" + re.escape(pkg) + r"/([A-Za-z0-9_./-]+\.[a-z]+)", text):
                if m.group(1) not in files:
                    fail(f"{rel}: loads {pkg}/{m.group(1)}, which is not under web/vendor/; run web/tools/fetch_third_party.py")
    for m in re.finditer(r'["\']three/addons/([A-Za-z0-9_./-]+\.js)["\']', text):
        three = [files for pkg, files in tp["vendor"]["packages"].items() if pkg.startswith("three@")]
        if not three or f"examples/jsm/{m.group(1)}" not in three[0]:
            fail(f"{rel}: imports three/addons/{m.group(1)}, which is not under web/vendor/; run web/tools/fetch_third_party.py")
    return text


# What makes a browser fetch from another host: a resource tag, a stylesheet url() or @import,
# a module import, a fetch or a worker. A link a reader clicks (<a href>) is not one, and
# neither is the canonical link or a social-card address (metadata a crawler reads).
_TAG = re.compile(r"<(link|script|img|source|iframe|video|audio|embed|object|use|image|track|input)\b[^>]*>", re.I)
_ATTR = re.compile(r'\b(?:href|src|srcset|data|poster|xlink:href)\s*=\s*"((?:https?:)?//[^"]*)"', re.I)
_CSS = re.compile(r"url\(\s*['\"]?((?:https?:)?//[^)'\"]+)|@import\s+(?:url\()?['\"]?((?:https?:)?//[^'\");]+)", re.I)
_JS = re.compile(r"(?:\bfrom\s*|\bimport\s*\(\s*|\bfetch\s*\(\s*|\bWorker\s*\(\s*|\bimportScripts\s*\(\s*|\bEventSource\s*\(\s*|\bWebSocket\s*\(\s*)[\"'`]((?:https?:|wss?:)?//[^\"'`]+)", re.I)
_IMPORTMAP = re.compile(r'<script type="importmap">([\s\S]*?)</script>', re.I)


def third_party_requests(rel, text):
    """Addresses on another host that loading this file would make a browser request."""
    found = []
    if rel.endswith(".html"):
        for tag in _TAG.finditer(text):
            if re.search(r'\brel="canonical"', tag.group(0)):
                continue
            found += [m.group(1) for m in _ATTR.finditer(tag.group(0))]
        for im in _IMPORTMAP.finditer(text):
            found += re.findall(r'"((?:https?:)?//[^"]+)"', im.group(1))
        for style in re.findall(r"<style\b[^>]*>([\s\S]*?)</style>", text, re.I):
            found += [a or b for a, b in _CSS.findall(style)]
        for script in re.findall(r"<script\b(?![^>]*\bsrc=)(?![^>]*application/(?:ld\+)?json)[^>]*>([\s\S]*?)</script>", text, re.I):
            found += _JS.findall(script)
    elif rel.endswith(".css"):
        found += [a or b for a, b in _CSS.findall(text)]
    elif rel.endswith((".js", ".mjs")) and not rel.endswith(".test.mjs"):
        found += _JS.findall(text)
    return found


def not_found_page(index_text, studio_name):
    """404.html: the home page's shell (head, navigation, footer, search) around a short message.

    GitHub Pages serves /404.html, with status 404, for any address that does not exist, at
    any depth, so every relative address in it is written from the site root ("/site.css").
    A <base href="/"> would do the same for links but would also re-point the page's own
    fragment references (the skip link, every <use href="#icon">) at the home page.
    """
    text = index_text
    esc = html.escape(studio_name, quote=True)

    def one(pattern, repl, what, flags=0):
        nonlocal text
        text, n = re.subn(pattern, repl, text, count=1, flags=flags)
        if n != 1:
            fail(f"404.html: the home page has no {what}; its shell changed, update not_found_page()")

    # an error page claims no address of its own and no structured data: the home page's block goes
    one(SEO_HEAD.pattern, "", "<!-- seo:head --> block (the site build's canonical and social tags)", re.S)
    one(r'<meta charset="utf-8">', '<meta charset="utf-8">\n<meta name="robots" content="noindex">', "charset tag")
    one(r"<title>[^<]*</title>", "<title>Page not found · Kshana</title>", "<title>")
    one(r'(<meta name="description" content=")[^"]*(")',
        r"\g<1>There is no page at this address on kshana.dev. Start from the home page, the docs or the Studio.\g<2>", "meta description")
    one(r'<link rel="stylesheet" href="css/home\.css">\n?', "", "home stylesheet link")
    one(r'<body data-page="index">', '<body data-page="404">', "body tag")
    one(r'root:"",page:"index"', 'root:"/",page:"404"', "KSITE root and page name")
    main = f"""<main id="main">
<section class="page-hero nf">
  <div class="wrap">
    <span class="eyebrow" style="--c:var(--coral)"><i></i>Error 404 · page not found</span>
    <h1 class="h1">No page at this address. <span class="soft">The rest is where it was.</span></h1>
    <p class="lede">The address may be mistyped, or it may be from the earlier single-page site. Start from the home page, read the docs, or run a scenario in {esc}. Search finds every page, scenario and doc.</p>
    <div class="ctas"><a class="btn btn-ink" href="/">Home <svg aria-hidden="true"><use href="#i-arrow"/></svg></a><a class="btn btn-ghost" href="/docs/">Docs</a><a class="btn btn-ghost" href="/studio/">Launch {esc}</a></div>
  </div>
</section>
</main>"""
    one(r'<main id="main">[\s\S]*</main>', lambda m: main, "<main> element")
    one(r'(<script src="site\.js" defer></script>)[\s\S]*?(</body>)', r"\1\n\2", "site.js script tag")
    # Every relative address from the site root. Left alone: fragments, absolute and
    # scheme addresses (https:, mailto:, data:).
    text = re.sub(r'(\s(?:href|src)=")(?![#/]|[a-zA-Z][a-zA-Z0-9+.-]*:)([^"]+")', r"\1/\2", text)
    text = text.replace("</head>", "<style>.nf{min-height:62vh;display:flex;align-items:center}.nf .lede{margin-top:22px}.nf .ctas{margin-top:30px}</style>\n</head>", 1)
    return text


def is_page(rel):
    """A site page, as opposed to an engine report shipped as an asset (those stay byte-for-byte)."""
    return rel.endswith(".html") and not rel.startswith("assets/")


def canonical(rel):
    """A page's address as the site links it: clean, with no ".html" ("/" for Home, /docs/ for the
    docs index, /evidence for evidence.html). The host serves both forms; this is the one it names."""
    if rel == "index.html":
        return ORIGIN + "/"
    if rel.endswith("/index.html"):
        return f"{ORIGIN}/{rel[:-len('index.html')]}"
    return f"{ORIGIN}/{rel[:-len('.html')] if rel.endswith('.html') else rel}"


def site_file(addr):
    """A clean site address ("/evidence", "/docs/", "/studio/") -> the file the host serves for it."""
    path = addr.split("#", 1)[0].split("?", 1)[0].lstrip("/")
    if path == "" or path.endswith("/"):
        return path + "index.html"
    return path if "." in path.rsplit("/", 1)[-1] else path + ".html"


SEO_HEAD = re.compile(r"<!-- seo:head -->.*?<!-- /seo:head -->\n?", re.S)
SEO_BODY = re.compile(r"<!-- seo:body -->.*?<!-- /seo:body -->\n?", re.S)


def seo_check(rel, text, version):
    """The site build writes every page's canonical, Open Graph, social-card and schema.org tags
    (between <!-- seo:head --> markers). The port carries them over and checks the parts it relies on."""
    if re.search(r'<meta name="robots" content="[^"]*noindex', text):
        return
    if len(SEO_HEAD.findall(text)) != 1 or text.count('rel="canonical"') != 1:
        fail(f"{rel}: no canonical or social tags; the site build writes them (rebuild the site with build.py from 0.29.2 on)")
        return
    if f'<link rel="canonical" href="{canonical(rel)}">' not in text:
        fail(f"{rel}: its canonical address is not {canonical(rel)}")
    if f'<meta property="og:image" content="{ORIGIN}/og-card.png">' not in text:
        fail(f"{rel}: its social card is not {ORIGIN}/og-card.png")
    if rel == "index.html" and f'"softwareVersion": "{version}"' not in text:
        fail(f"index.html: the schema.org block does not name version {version}")


def page(rel, data, version, summ):
    text = localise(rel, data.decode("utf-8"))
    if text.count("</head>") != 1:
        fail(f"{rel}: expected exactly one </head>")
        return data
    seo_check(rel, text, version)
    if rel == "index.html":
        hook = '<meta charset="utf-8">'
        if text.count(hook) != 1:
            fail("index.html: expected exactly one <meta charset=\"utf-8\"> to anchor the legacy redirect script")
            return data
        text = text.replace(hook, hook + '\n<script src="legacy-redirects.js"></script>', 1)
    return text.encode("utf-8")


def legacy_js(legacy):
    rules = json.dumps(legacy["redirects"], ensure_ascii=False, sort_keys=True, indent=2)
    return f"""// SPDX-License-Identifier: AGPL-3.0-only
// GENERATED by web/tools/port_site.py from web/tools/legacy-urls.json. Do not edit.
// The single-page kshana.dev put everything behind fragments on "/" (#playground, #ledger,
// share links as #s=<scenario>, embeds as ?embed=1). A fragment never reaches the server,
// so the home page sends those old addresses to where the content lives now. The pages at
// addresses that moved (the Studio's /playground/, now /studio/) load it too: a moved
// address keeps its query and its fragment.
(function (g) {{
  var RULES = {rules};
  function legacyTarget(search, hash, path) {{
    var q = search || "";
    var h = (hash || "").replace(/^#/, "");
    var p = path || "/";
    for (var from in RULES.paths) {{
      if (Object.prototype.hasOwnProperty.call(RULES.paths, from) && p.indexOf(from) === 0) {{
        return RULES.paths[from] + p.slice(from.length).replace(/(^|\\/)index\\.html$/, "$1") + q + (h ? "#" + h : "");
      }}
    }}
    if (/(^\\?|&)embed=1(&|$)/.test(q)) {{
      // A tab the single-page site had and the Studio renamed opens its nearest current tab.
      q = q.replace(/([?&]tab=)([^&]*)/, function (all, key, tab) {{
        return key + (Object.prototype.hasOwnProperty.call(RULES.embedTabs, tab) ? RULES.embedTabs[tab] : tab);
      }});
      return RULES.embed + q + (h ? "#" + h : "");
    }}
    if (!h) return null;
    for (var p in RULES.hashPrefix) {{
      if (Object.prototype.hasOwnProperty.call(RULES.hashPrefix, p) && h.indexOf(p) === 0) {{
        return RULES.hashPrefix[p].replace("{{hash}}", "#" + h);
      }}
    }}
    return Object.prototype.hasOwnProperty.call(RULES.hash, h) ? RULES.hash[h] : null;
  }}
  g.kshanaLegacyTarget = legacyTarget;
  if (g.location && g.document) {{
    var to = legacyTarget(g.location.search, g.location.hash, g.location.pathname);
    if (to) g.location.replace(to);
  }}
}})(typeof window !== "undefined" ? window : globalThis);
""".encode("utf-8")


def moved_pages(legacy, studio_name):
    """A page at each address that moved (legacy-urls.json "paths"): it loads legacy-redirects.js,
    which forwards with the query and fragment kept, and is never indexed."""
    pages = {}
    for frm, to in legacy["redirects"].get("paths", {}).items():
        if not (frm.startswith("/") and frm.endswith("/") and to.startswith("/") and to.endswith("/")):
            fail(f"legacy-urls.json paths: {frm} -> {to}: both must be folder addresses (/old/ -> /new/)")
            continue
        esc = html.escape(studio_name, quote=True)
        pages[frm.lstrip("/") + "index.html"] = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Moved to {to}</title>
<meta name="robots" content="noindex">
<link rel="canonical" href="{ORIGIN}{to}">
<script src="/legacy-redirects.js"></script>
<noscript><meta http-equiv="refresh" content="0; url={to}"></noscript>
</head>
<body>
<p>This address has moved to <a href="{to}">{to}</a>{f" ({esc})" if to == "/" + STUDIO_DIR + "/" else ""}.</p>
</body>
</html>
""".encode("utf-8")
    return pages


def collect_site(site, version, summ, out, studio_name):
    index_src = None
    listing = os.path.join(site, "PUBLISH.txt")
    if not os.path.isfile(listing):
        sys.exit(f"{site}: no PUBLISH.txt. Build the site first (build.py writes it).")
    rels = [l.strip() for l in open(listing, encoding="utf-8") if l.strip()]
    n = 0
    for rel in rels:
        if rel.startswith(STUDIO_DIR + "/") or rel.startswith(OLD_DIRS):
            continue  # the Studio comes from --studio; the old addresses from legacy-urls.json
        src = os.path.join(site, rel)
        if not os.path.isfile(src):
            fail(f"site: PUBLISH.txt lists {rel}, which is not on disk (rebuild the site)")
            continue
        if rel in OWNED or rel.startswith(OWNED_DIRS) or rel.startswith(BUILT_DIRS) or ("/" not in rel and rel.endswith(".test.mjs")):
            fail(f"site: {rel} collides with a file web/ owns")
            continue
        data = rb(src)
        if rel == "404.html":
            fail("site: 404.html is written by the port; the site must not publish its own")
            continue
        if rel == "index.html":
            index_src = data.decode("utf-8")
        if is_page(rel):
            data = page(rel, data, version, summ)
        elif rel.endswith((".js", ".mjs", ".css")):
            data = localise(rel, data.decode("utf-8")).encode("utf-8")
        out[rel] = data
        n += 1
    if index_src is None:
        fail("site: no index.html")
    else:
        out["404.html"] = not_found_page(localise("404.html", index_src), studio_name).encode("utf-8")
        n += 1
    return n


def studio_index(text, studio_name):
    """The same edits the site build makes to its own copy of the Studio page."""
    esc = html.escape(studio_name, quote=True)
    short = html.escape(re.sub(r"^Kshana\s+", "", studio_name), quote=True)
    text = re.sub(r"<title>[^<]*</title>", f"<title>{esc}</title>", text, count=1)
    text = re.sub(r"(data-studio-name>)[^<]*(<)", lambda m: m.group(1) + esc + m.group(2), text)
    text = re.sub(r"(data-studio-short>)[^<]*(<)", lambda m: m.group(1) + short + m.group(2), text)
    text = text.replace(f'href="{ORIGIN}/#ledger"', 'href="/evidence#ledger"')
    text = re.sub(r'(<p class="embed-only"><a href=")' + re.escape(ORIGIN) + r'(")', r"\1/studio/\2", text)
    if ORIGIN in text:
        fail("Studio index.html still links to the old single-page kshana.dev after the known rewrites")
    # Links to the site's pages by their clean address, as the site build writes them:
    # ../missions.html -> /missions, ../docs/index.html -> /docs/, ../index.html -> /
    def clean(m):
        path, rest = m.group(2), m.group(3) or ""
        path = path[: -len("index.html")] if path == "index.html" or path.endswith("/index.html") else path[: -len(".html")]
        return f'{m.group(1)}/{path}{rest}"'
    text = re.sub(r'(<a\b[^>]*?\shref=")\.\./([\w/-]+\.html)([#?][^"]*)?"', clean, text)
    return text


def site_seo(text, site_page):
    """The site build's crawl text on its own copy of the Studio page (its description, the head
    block and the <noscript> scenario list), put on the Studio page the port writes."""
    head, body = SEO_HEAD.search(site_page), SEO_BODY.search(site_page)
    desc = re.search(r'<meta name="description" content="[^"]*">', site_page)
    if not head or not body or not desc:
        fail(f"the site build's {STUDIO_DIR}/index.html has no crawl text (seo blocks or description); rebuild the site")
        return text
    text = re.sub(r'<meta name="description" content="[^"]*">', lambda m: desc.group(0), SEO_BODY.sub("", SEO_HEAD.sub("", text)), count=1)
    text = text.replace("</head>", head.group(0) + "</head>", 1)
    return re.sub(r"(<body\b[^>]*>\n?)", lambda m: m.group(1) + body.group(0), text, count=1)


def collect_studio(studio, site, version, summ, out, skip):
    if not os.path.isfile(os.path.join(studio, "index.html")) or not os.path.isfile(os.path.join(studio, "app.js")):
        sys.exit(f"{studio}: not a Studio folder (no index.html + app.js)")
    ch_path = os.path.join(site, STUDIO_DIR, "channels.json")
    if not os.path.isfile(ch_path):
        sys.exit(f"{site}: no {STUDIO_DIR}/channels.json. Build the site first.")
    channels = json.load(open(ch_path, encoding="utf-8"))
    if channels.get("version") != version:
        fail(f"the site was built for engine v{channels.get('version')}, this checkout is v{version}: rebuild the site from this checkout")
    studio_name = channels["studio"]

    # Everything in the Studio folder is ported except its dev files and pkg/ (built by
    # web/build.sh). A folder the app does not need can be left out with --studio-skip.
    tops = sorted(d for d in os.listdir(studio) if os.path.isdir(os.path.join(studio, d)) and d != "pkg" and d != "node_modules")
    for d in skip:
        if d not in tops:
            fail(f"--studio-skip {d}: the Studio has no such folder")
    used = [d for d in tops if d not in skip]

    n = 0
    sizes = {}
    stale_data, stale_toml, bundles = [], [], []
    for root, dirs, files in os.walk(studio):
        rel_dir = os.path.relpath(root, studio).replace(os.sep, "/")
        top = rel_dir.split("/")[0]
        if rel_dir == ".":
            dirs[:] = sorted(d for d in dirs if d in used)
        else:
            dirs[:] = sorted(d for d in dirs if d != "node_modules" and not d.startswith("."))
        for fn in sorted(files):
            if fn in STUDIO_SKIP_NAMES or STUDIO_SKIP_RE.match(fn):
                continue
            rel = fn if rel_dir == "." else f"{rel_dir}/{fn}"
            dst = f"{STUDIO_DIR}/{rel}"
            src = os.path.join(root, fn)
            if rel == "index.html":
                site_page = os.path.join(site, STUDIO_DIR, "index.html")
                site_text = open(site_page, encoding="utf-8").read() if os.path.isfile(site_page) else ""
                data = page(dst, site_seo(studio_index(open(src, encoding="utf-8").read(), studio_name), site_text).encode("utf-8"), version, summ)
            elif rel in ("channels.json", "tokens.css"):
                continue  # written below from the site build
            elif rel in STUDIO_DATA:
                data = rb(os.path.join(WEB, STUDIO_DATA[rel]))
                if data != rb(src):
                    stale_data.append(rel)
            elif fn.endswith(".toml"):
                # A scenario the Studio carries is the engine's scenario of the same name.
                repo_copy = os.path.join(REPO, "scenarios", fn)
                if not os.path.isfile(repo_copy):
                    fail(f"Studio scenario {rel} is not in this checkout's scenarios/")
                    continue
                data = rb(repo_copy)
                if data != rb(src):
                    stale_toml.append(rel)
            else:
                data = rb(src)
                if fn.endswith((".js", ".mjs", ".css")) and not fn.endswith(".test.mjs"):
                    data = localise(dst, data.decode("utf-8")).encode("utf-8")
                if fn == "index.json":
                    try:
                        doc = json.loads(data)
                    except ValueError:
                        doc = None
                    if isinstance(doc, dict) and doc and all(k.endswith(".toml") and isinstance(v, str) for k, v in doc.items()):
                        bundles.append(rel_dir)  # one JSON of the scenario files beside it: rebuilt below
                        continue
            out[dst] = data
            n += 1
            sizes[top if rel_dir != "." else "."] = sizes.get(top if rel_dir != "." else ".", 0) + len(data)
    out[f"{STUDIO_DIR}/channels.json"] = rb(ch_path)
    out[f"{STUDIO_DIR}/tokens.css"] = localise(f"{STUDIO_DIR}/tokens.css", rb(os.path.join(site, "tokens.css")).decode("utf-8")).encode("utf-8")
    n += 2
    for d in bundles:
        prefix = f"{STUDIO_DIR}/{d}/"
        bundle = {k[len(prefix):]: v.decode("utf-8") for k, v in sorted(out.items())
                  if k.startswith(prefix) and k.endswith(".toml") and "/" not in k[len(prefix):]}
        if not bundle:
            fail(f"Studio {d}/index.json bundles scenario files, but none are beside it")
        out[f"{prefix}index.json"] = json.dumps(bundle, ensure_ascii=False).encode("utf-8")
        n += 1
    if f"{STUDIO_DIR}/scenarios/index.json" not in out:
        fail("the Studio has no scenarios/index.json bundle")
    note("Studio folders ported: " + ", ".join(f"{d} {sizes.get(d, 0) / 1e6:.1f} MB" for d in used)
         + (f"; left out on request: {', '.join(skip)}" if skip else ""))
    if stale_data:
        note(f"Studio data files that differ from web/'s generated copies (web/'s were ported): {', '.join(stale_data)}")
    if stale_toml:
        note(f"{len(stale_toml)} Studio scenario file(s) differ from this checkout's scenarios/ (the checkout's were ported; "
             f"their recorded runs predate the change): {', '.join(stale_toml)}")

    # Drift detector: the page edits above are the ones the site build makes to its own
    # Studio copy. When --studio is the Studio the site was built with, the two pages are
    # byte-identical (before the head tags are added). When they are not, either --studio
    # is a different Studio (expected while a new Studio is swapped in) or build.py's
    # Studio edits changed and studio_index() must follow. The port cannot tell which, so
    # it says so rather than guessing.
    site_page = os.path.join(site, STUDIO_DIR, "index.html")
    site_text = open(site_page, encoding="utf-8").read() if os.path.isfile(site_page) else ""
    mine = site_seo(studio_index(open(os.path.join(studio, "index.html"), encoding="utf-8").read(), studio_name), site_text)
    if not site_text or mine != site_text:
        note(f"the Studio page ported here is not the one in the site build's own {STUDIO_DIR}/ copy. If --studio is the Studio the "
             "site was built with, build.py's Studio edits have changed: update studio_index() in this tool. If it is a newer "
             "Studio, this is expected; check that the site's links into the Studio still open (web/site.test.mjs does).")
    return n


def check_legacy(legacy, out):
    home_ids = ids_of(out["index.html"].decode("utf-8")) if "index.html" in out else set()
    red = legacy["redirects"]
    targets = [red["embed"]] + list(red["hashPrefix"].values()) + list(red["hash"].values()) + list(red.get("paths", {}).values())
    for t in targets:
        t = t.replace("{hash}", "")
        _, _, frag = t.partition("#")
        path = site_file(t)
        if path not in out:
            fail(f"legacy redirect target {path} is not in the ported site")
        elif frag and frag not in ids_of(out[path].decode("utf-8")):
            fail(f"legacy redirect target {t}: no element with id=\"{frag}\" on {path}")
    app = out.get(f"{STUDIO_DIR}/app.js", b"").decode("utf-8")
    defs = re.search(r"const TAB_DEFS = \[([\s\S]*?)\n\];", app)
    tabs = set(re.findall(r'\{ id: "([a-z0-9-]+)"', defs.group(1))) if defs else set()
    if not tabs:
        fail("the Studio's tab list (const TAB_DEFS in app.js) was not found, so old embed links' tab names cannot be checked")
    for old_tab, new_tab in red.get("embedTabs", {}).items():
        if new_tab not in tabs:
            fail(f"old embed tab {old_tab!r} maps to {new_tab!r}, which is not a Studio tab ({', '.join(sorted(tabs))})")
        if old_tab in tabs:
            fail(f"old embed tab {old_tab!r} is a Studio tab again; remove its mapping from legacy-urls.json")
    for h in red["hash"]:
        if h in home_ids:
            fail(f"legacy redirect for #{h} would hijack a live anchor on the new home page; move it to keptAnchors")
    for h in legacy.get("keptAnchors", []):
        if h not in home_ids:
            fail(f"kept anchor #{h} no longer exists on the home page; give it a redirect instead")
    for frm in red.get("paths", {}):
        if frm.lstrip("/") + "index.html" not in out:
            fail(f"moved address {frm} has no page")
        if site_file(frm) in out and frm.lstrip("/").startswith(STUDIO_DIR + "/"):
            fail(f"moved address {frm} is inside the Studio's own folder")


def check_sitemap(out):
    """The site build's sitemap.xml lists every indexable ported page by its canonical address, once."""
    sm = out.get("sitemap.xml", b"").decode("utf-8")
    if not sm:
        fail("site: no sitemap.xml; the site build writes it (rebuild the site with build.py from 0.29.2 on)")
        return
    listed = re.findall(r"<loc>([^<]+)</loc>", sm)
    want = sorted(canonical(p) for p in out if is_page(p) and p != "404.html"
                  and not re.search(r'<meta name="robots" content="[^"]*noindex', out[p].decode("utf-8")))
    if sorted(listed) != want:
        missing, extra = sorted(set(want) - set(listed)), sorted(set(listed) - set(want))
        fail(f"sitemap.xml does not list exactly the indexable pages: missing {missing[:5]}, extra {extra[:5]}")
    for f in ("robots.txt", "llms.txt", "llms-full.txt"):
        if f not in out:
            fail(f"site: no {f}; the site build writes it (rebuild the site with build.py from 0.29.2 on)")


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--site", required=True, help="the built site folder (contains PUBLISH.txt)")
    ap.add_argument("--studio", required=True, help="the Studio source folder (contains index.html, app.js, lib/)")
    ap.add_argument("--studio-skip", action="append", default=[], metavar="FOLDER",
                    help="a top-level Studio folder to leave out (repeatable); by default every folder but pkg/ is ported")
    ap.add_argument("--check", action="store_true", help="write nothing; exit 1 if web/ differs from what the port would write")
    a = ap.parse_args()
    site, studio = os.path.abspath(os.path.expanduser(a.site)), os.path.abspath(os.path.expanduser(a.studio))

    version = cargo_version()
    summ = json.load(open(os.path.join(WEB, "data", "verification-matrix.json"), encoding="utf-8"))["summary"]
    legacy = json.load(open(os.path.join(TOOLS, "legacy-urls.json"), encoding="utf-8"))

    out = {}
    ch = os.path.join(site, STUDIO_DIR, "channels.json")
    if not os.path.isfile(ch):
        sys.exit(f"{site}: no {STUDIO_DIR}/channels.json. Build the site first.")
    n_site = collect_site(site, version, summ, out, json.load(open(ch, encoding="utf-8"))["studio"])
    n_studio = collect_studio(studio, site, version, summ, out, a.studio_skip)
    scrub(out)
    for rel in sorted(out):
        if rel.endswith((".html", ".css", ".js", ".mjs")):
            for addr in third_party_requests(rel, out[rel].decode("utf-8")):
                fail(f"{rel}: would make a browser fetch from another host ({addr[:90]}); kshana.dev serves its own fonts, styles and scripts")
    out["legacy-redirects.js"] = legacy_js(legacy)
    out.update(moved_pages(legacy, json.load(open(ch, encoding="utf-8"))["studio"]))
    check_sitemap(out)
    check_legacy(legacy, out)
    for rel in out:
        if rel in OWNED or rel.startswith(BUILT_DIRS) or rel.startswith(OWNED_DIRS):
            fail(f"{rel}: the port would overwrite a file web/ owns")

    manifest = {
        "note": "Written by web/tools/port_site.py. Every file the port put in web/, with its SHA-256. "
                "web/site.test.mjs checks the tree against it; do not edit a listed file by hand, rerun the port.",
        "version": version,
        "studio": json.loads(out[f"{STUDIO_DIR}/channels.json"])["studio"] if f"{STUDIO_DIR}/channels.json" in out else None,
        "files": {rel: sha(out[rel]) for rel in sorted(out)},
    }
    out[MANIFEST] = (json.dumps(manifest, ensure_ascii=False, indent=1) + "\n").encode("utf-8")

    for m in notes:
        print(f"note: {m}")
    if errors:
        for m in errors:
            print(f"FAIL: {m}", file=sys.stderr)
        sys.exit(f"port refused: {len(errors)} problem(s); web/ was not changed")

    old = {}
    mpath = os.path.join(WEB, MANIFEST)
    if os.path.isfile(mpath):
        old = json.load(open(mpath, encoding="utf-8")).get("files", {})
    stale = sorted(r for r in set(old) | set(RETIRED) if r not in out and os.path.isfile(os.path.join(WEB, r)))
    changed = sorted(r for r in out if not os.path.isfile(os.path.join(WEB, r)) or rb(os.path.join(WEB, r)) != out[r])

    if a.check:
        for r in changed:
            print(f"differs: {r}")
        for r in stale:
            print(f"stale:   {r}")
        if changed or stale:
            sys.exit(f"web/ is not what the port writes: {len(changed)} to write, {len(stale)} to remove")
        print(f"OK: web/ matches the port ({len(out) - 1} files, v{version})")
        return

    for r in changed:
        dst = os.path.join(WEB, r)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        with open(dst, "wb") as f:
            f.write(out[r])
    for r in stale:
        os.remove(os.path.join(WEB, r))
        d = os.path.dirname(os.path.join(WEB, r))
        while d != WEB and not os.listdir(d):
            os.rmdir(d)
            d = os.path.dirname(d)
    total = sum(len(v) for v in out.values())
    print(f"ported v{version}: {n_site} site files + {n_studio} Studio files + {1 + len(legacy['redirects'].get('paths', {}))} generated, {total / 1e6:.1f} MB · "
          f"{len(changed)} written, {len(stale)} removed")


if __name__ == "__main__":
    main()
