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
  * every published site file except the site's own playground/ copy;
  * the Studio under playground/, with its module tests, without its dev files and without
    pkg/ (the WebAssembly package is built by web/build.sh from this checkout);
  * every scenario file (*.toml) the Studio carries, taken from THIS checkout's scenarios/
    under the same name, the scenarios/index.json bundle rebuilt from them, and
    playground/data/*.json from web/'s own generated copies, so the app cannot state
    older facts than the engine it runs;
  * canonical, Open Graph and social-card tags on every page, and the schema.org block on
    the home page, with the version from Cargo.toml and the counts from the ledger;
  * sitemap.xml and legacy-redirects.js (from web/tools/legacy-urls.json).

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
STUDIO_DIR = "playground"

# Files web/ owns: sources for generators, deploy plumbing, and old URLs that must stay.
OWNED = {
    "CNAME", "robots.txt", "README.md", "build.sh", "smoke.mjs", "capabilities.json", "favicon.svg",
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
    <div class="ctas"><a class="btn btn-ink" href="index.html">Home <svg aria-hidden="true"><use href="#i-arrow"/></svg></a><a class="btn btn-ghost" href="docs/index.html">Docs</a><a class="btn btn-ghost" href="playground/index.html">Launch {esc}</a></div>
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
    if rel == "index.html":
        return ORIGIN + "/"
    if rel.endswith("/index.html"):
        return f"{ORIGIN}/{rel[:-len('index.html')]}"
    return f"{ORIGIN}/{rel}"


def head_block(rel, text, version, summ):
    """Canonical + social tags for one page, from the page's own title and description."""
    title = re.search(r"<title>([^<]*)</title>", text)
    desc = re.search(r'<meta name="description" content="([^"]*)"', text)
    if not title or not desc:
        fail(f"{rel}: no <title> or meta description, so it cannot carry social tags")
        return ""
    t, d, url = title.group(1), desc.group(1), canonical(rel)
    alt = html.escape(f"Kshana, a PNT (positioning, navigation and timing) resilience simulator. "
                      f"{summ['validated']} of {summ['total']} capabilities validated against external oracles.", quote=True)
    lines = [
        f'<link rel="canonical" href="{url}">',
        '<meta property="og:type" content="website">',
        '<meta property="og:site_name" content="Kshana">',
        f'<meta property="og:url" content="{url}">',
        f'<meta property="og:title" content="{t}">',
        f'<meta property="og:description" content="{d}">',
        f'<meta property="og:image" content="{ORIGIN}/og-card.png">',
        '<meta property="og:image:width" content="1200">',
        '<meta property="og:image:height" content="630">',
        '<meta property="og:image:type" content="image/png">',
        f'<meta property="og:image:alt" content="{alt}">',
        '<meta name="twitter:card" content="summary_large_image">',
        f'<meta name="twitter:title" content="{t}">',
        f'<meta name="twitter:description" content="{d}">',
        f'<meta name="twitter:image" content="{ORIGIN}/og-card.png">',
        f'<meta name="twitter:image:alt" content="{alt}">',
    ]
    if rel == "index.html":
        ld = {
            "@context": "https://schema.org", "@type": "SoftwareApplication", "name": "Kshana",
            "description": html.unescape(d), "applicationCategory": "Science",
            "operatingSystem": "Any (WebAssembly in a modern browser)", "url": ORIGIN + "/",
            "license": "https://spdx.org/licenses/AGPL-3.0-only",
            "codeRepository": "https://github.com/ashfordeOU/kshana",
            "downloadUrl": "https://github.com/ashfordeOU/kshana", "softwareVersion": version,
            "keywords": ["PNT", "navigation", "quantum", "GNSS", "simulation"],
            "author": {"@type": "Organization", "name": "Ashforde OÜ", "email": "contact@ashforde.org"},
        }
        body = json.dumps(ld, ensure_ascii=False, indent=2).replace("</", "<\\/")
        lines.append(f'<script type="application/ld+json">\n{body}\n</script>')
    return "\n".join(lines) + "\n"


def page(rel, data, version, summ):
    text = localise(rel, data.decode("utf-8"))
    if 'rel="canonical"' in text or 'property="og:' in text:
        fail(f"{rel}: already carries canonical or Open Graph tags; the port adds them, so the source must not")
        return data
    if text.count("</head>") != 1:
        fail(f"{rel}: expected exactly one </head>")
        return data
    text = text.replace("</head>", head_block(rel, text, version, summ) + "</head>", 1)
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
// so the home page sends those old addresses to where the content lives now.
(function (g) {{
  var RULES = {rules};
  function legacyTarget(search, hash) {{
    var q = search || "";
    var h = (hash || "").replace(/^#/, "");
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
    var to = legacyTarget(g.location.search, g.location.hash);
    if (to) g.location.replace(to);
  }}
}})(typeof window !== "undefined" ? window : globalThis);
""".encode("utf-8")


def collect_site(site, version, summ, out, studio_name):
    index_src = None
    listing = os.path.join(site, "PUBLISH.txt")
    if not os.path.isfile(listing):
        sys.exit(f"{site}: no PUBLISH.txt. Build the site first (build.py writes it).")
    rels = [l.strip() for l in open(listing, encoding="utf-8") if l.strip()]
    n = 0
    for rel in rels:
        if rel.startswith(STUDIO_DIR + "/"):
            continue
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
    text = text.replace(f'href="{ORIGIN}/#ledger"', 'href="../evidence.html#ledger"')
    text = re.sub(r'(<p class="embed-only"><a href=")' + re.escape(ORIGIN) + r'(")', r"\1index.html\2", text)
    if ORIGIN in text:
        fail("Studio index.html still links to the old single-page kshana.dev after the known rewrites")
    return text


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
                data = page(dst, studio_index(open(src, encoding="utf-8").read(), studio_name).encode("utf-8"), version, summ)
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
    mine = studio_index(open(os.path.join(studio, "index.html"), encoding="utf-8").read(), studio_name)
    if not os.path.isfile(site_page) or mine != open(site_page, encoding="utf-8").read():
        note("the Studio page ported here is not the one in the site build's own playground/ copy. If --studio is the Studio the "
             "site was built with, build.py's Studio edits have changed: update studio_index() in this tool. If it is a newer "
             "Studio, this is expected; check that the site's links into the Studio still open (web/site.test.mjs does).")
    return n


def check_legacy(legacy, out):
    home_ids = ids_of(out["index.html"].decode("utf-8")) if "index.html" in out else set()
    red = legacy["redirects"]
    targets = [red["embed"]] + list(red["hashPrefix"].values()) + list(red["hash"].values())
    for t in targets:
        t = t.replace("{hash}", "")
        path, _, frag = t.partition("#")
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


def sitemap(out):
    pages = sorted(p for p in out if is_page(p) and p != "404.html")
    pages.sort(key=lambda p: (p != "index.html", p.count("/"), p))
    body = "".join(f"  <url><loc>{canonical(p)}</loc></url>\n" for p in pages)
    return ('<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n'
            + body + "</urlset>\n").encode("utf-8")


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
    out["sitemap.xml"] = sitemap(out)
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
    print(f"ported v{version}: {n_site} site files + {n_studio} Studio files + 2 generated, {total / 1e6:.1f} MB · "
          f"{len(changed)} written, {len(stale)} removed")


if __name__ == "__main__":
    main()
