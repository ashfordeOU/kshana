#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Fetch, once, the third-party files the site would otherwise load from other hosts.

    python3 web/tools/fetch_third_party.py --from <site folder> --from <Studio folder> [...]

kshana.dev makes no request to a third-party host for fonts, styles or scripts: a visitor's
address is not handed to a font or script host. The site and the Studio are authored against
Google Fonts and a script host (their preview host allows nothing else), so this tool
downloads what they ask for and web/tools/port_site.py points the ported pages at the local
copies. This is the ONLY step that needs the network. Its output is committed, and the port
is offline and deterministic after it. Rerun it only when a page asks for a font set or a
library version that is not here yet (the port refuses and says so).

Writes, under web/:
  fonts/<families>.css     the @font-face rules Google Fonts serves for one stylesheet URL,
                           with every file address made local
  fonts/files/*.woff2      the font files those rules name (every subset, so text renders
                           exactly as it did)
  fonts/OFL-<family>.txt   each family's SIL Open Font License text, from the font project
  fonts/FONTS.json         which stylesheet URL each .css stands in for, and each file's SHA-256
  vendor/<name>@<ver>/...  each script library file, at its path inside the npm package,
                           with its licence
  vendor/VENDOR.json       the address each was fetched from and its SHA-256
"""
import argparse
import hashlib
import html
import json
import os
import re
import sys
import urllib.request

TOOLS = os.path.dirname(os.path.abspath(__file__))
WEB = os.path.dirname(TOOLS)
# A current browser's user agent: Google Fonts then answers with WOFF2 and unicode-range subsets.
UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
FONT_LINK = re.compile(r'https://fonts\.googleapis\.com/css2\?[^"\'\s>]+')
CDN = "https://cdn.jsdelivr.net/npm/"
CDN_REF = re.compile(re.escape(CDN) + r"((?:@[a-z0-9._-]+/)?[a-z0-9._-]+@[0-9][0-9a-zA-Z.-]*)/([A-Za-z0-9_./-]*)")
# The font projects' licence texts (SIL Open Font License 1.1), by CSS family name.
OFL = {
    "Geist": "https://raw.githubusercontent.com/google/fonts/main/ofl/geist/OFL.txt",
    "Geist Mono": "https://raw.githubusercontent.com/google/fonts/main/ofl/geistmono/OFL.txt",
    "Unbounded": "https://raw.githubusercontent.com/google/fonts/main/ofl/unbounded/OFL.txt",
    "Bricolage Grotesque": "https://raw.githubusercontent.com/google/fonts/main/ofl/bricolagegrotesque/OFL.txt",
}


def get(url):
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(req, timeout=60) as r:
        return r.read()


def sha(data):
    return hashlib.sha256(data).hexdigest()


def put(rel, data):
    dst = os.path.join(WEB, rel)
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    with open(dst, "wb") as f:
        f.write(data)


def slug(s):
    return re.sub(r"[^a-z0-9]+", "-", s.lower()).strip("-")


def scan(folders):
    fonts, libs, addons = set(), {}, set()
    for folder in folders:
        for root, dirs, files in os.walk(folder):
            dirs[:] = [d for d in dirs if d not in ("pkg", "node_modules", ".build", "src", "recorded", "native", "assets")]
            for fn in files:
                if not fn.endswith((".html", ".js", ".mjs", ".css")) or fn.endswith(".test.mjs"):
                    continue
                text = open(os.path.join(root, fn), encoding="utf-8", errors="replace").read()
                for m in FONT_LINK.finditer(text):
                    fonts.add(html.unescape(m.group(0)))
                for m in CDN_REF.finditer(text):
                    libs.setdefault(m.group(1), set()).add(m.group(2))
                for m in re.finditer(r'["\']three/addons/([A-Za-z0-9_./-]+\.js)["\']', text):
                    addons.add(m.group(1))
    return fonts, libs, addons


def fetch_fonts(urls):
    reg = {"note": "Written by web/tools/fetch_third_party.py. Each stylesheet stands in for the Google Fonts "
                   "address beside it; web/tools/port_site.py rewrites the pages to load it.",
           "stylesheets": {}, "files": {}, "licences": {}}
    families_all = set()
    for url in sorted(urls):
        css = get(url).decode("utf-8")
        families = sorted(set(re.findall(r"font-family:\s*'([^']+)'", css)))
        if not families:
            sys.exit(f"{url}: no @font-face rules in the answer")
        families_all.update(families)

        def local(m):
            src = m.group(1)
            fam = re.search(r"/s/([a-z0-9]+)/", src)
            name = f"{fam.group(1) if fam else 'font'}-{os.path.basename(src)}"
            if name not in reg["files"]:
                data = get(src)
                put(f"fonts/files/{name}", data)
                reg["files"][name] = {"sha256": sha(data), "bytes": len(data), "from": src}
            return f"url(files/{name})"

        css = re.sub(r"url\((https://fonts\.gstatic\.com/[^)]+)\)", local, css)
        if "http" in css:
            sys.exit(f"{url}: the stylesheet still names a remote address after localising")
        name = "-".join(slug(f) for f in families) + ".css"
        head = ("/* Local copy of the @font-face rules Google Fonts serves for one stylesheet address (see FONTS.json).\n"
                "   Fetched by web/tools/fetch_third_party.py; the fonts are under the SIL Open Font License (OFL-*.txt). */\n")
        put(f"fonts/{name}", (head + css).encode("utf-8"))
        reg["stylesheets"][url] = {"css": name, "families": families}
        print(f"fonts: {name}  <- {url}")
    for fam in sorted(families_all):
        if fam not in OFL:
            sys.exit(f"no licence address known for the family {fam!r}: add it to OFL in this tool")
        text = get(OFL[fam])
        if b"SIL OPEN FONT LICENSE" not in text.upper():
            sys.exit(f"{OFL[fam]}: not an Open Font License text")
        name = f"OFL-{slug(fam)}.txt"
        put(f"fonts/{name}", text)
        reg["licences"][fam] = {"file": name, "from": OFL[fam], "sha256": sha(text)}
    reg["files"] = dict(sorted(reg["files"].items()))
    put("fonts/FONTS.json", (json.dumps(reg, indent=1, ensure_ascii=False) + "\n").encode("utf-8"))
    print(f"fonts: {len(reg['files'])} files, {sum(f['bytes'] for f in reg['files'].values()) / 1e3:.0f} kB, "
          f"{len(reg['licences'])} licence texts")


def fetch_libs(libs, addons):
    reg = {"note": "Written by web/tools/fetch_third_party.py. Each file sits at its path inside the npm package; "
                   "web/tools/port_site.py rewrites the pages' script-host addresses to these copies.",
           "cdn": CDN, "packages": {}}
    for pkg in sorted(libs):
        paths = {p for p in libs[pkg] if p and not p.endswith("/")}
        if pkg.startswith("three@"):
            paths |= {f"examples/jsm/{a}" for a in addons}
        paths.add("LICENSE")
        files = {}
        for p in sorted(paths):
            data = get(f"{CDN}{pkg}/{p}")
            put(f"vendor/{pkg}/{p}", data)
            files[p] = {"sha256": sha(data), "bytes": len(data)}
            # a vendored module may itself import a sibling by relative path: those must come too
            if p.endswith(".js"):
                for m in re.finditer(r'from\s*["\'](\.\.?/[^"\']+)["\']', data.decode("utf-8", "replace")):
                    dep = os.path.normpath(os.path.join(os.path.dirname(p), m.group(1))).replace(os.sep, "/")
                    if dep not in paths and dep not in files:
                        sys.exit(f"{pkg}/{p} imports {dep}, which is not in the fetch list: add it")
        reg["packages"][pkg] = files
        print(f"vendor: {pkg}: {', '.join(sorted(files))}")
    put("vendor/VENDOR.json", (json.dumps(reg, indent=1) + "\n").encode("utf-8"))


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--from", dest="folders", action="append", required=True, metavar="FOLDER",
                    help="a built site folder or a Studio folder to read the requested fonts and libraries from (repeatable)")
    a = ap.parse_args()
    folders = [os.path.abspath(os.path.expanduser(f)) for f in a.folders]
    fonts, libs, addons = scan(folders)
    if not fonts:
        sys.exit("no Google Fonts stylesheet link found in the given folders")
    fetch_fonts(fonts)
    fetch_libs(libs, addons)


if __name__ == "__main__":
    main()
