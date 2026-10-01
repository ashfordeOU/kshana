# The kshana.dev site

`web/` is the tree that GitHub Pages serves as <https://kshana.dev>: the pages
(`index.html`, `missions.html`, `capabilities.html`, `evidence.html`, `developers.html`,
`editions.html`), the documentation under `docs/`, and Kshana Studio under `studio/`
(served at <https://kshana.dev/studio/>),
the app that runs the engine in the browser as WebAssembly (WASM) with no server-side
computation and nothing uploaded. The Studio has two views of one engine: the Simple view
(`studio/index.html`, the answer first in plain words) and the Advanced view
(`studio/advanced/index.html`, the full dashboard), which shares the Simple view's
engine, worker, modules and data through `<base href="../">`.

## Where the files come from

Three kinds of file live here, and they are changed in three different ways.

1. **Ported files.** The pages, `docs/`, `css/`, `js/`, `assets/`, the site data in
   `data/` (`land.json`, `search.json`, `series.json`) and everything under `studio/`
   are written by `web/tools/port_site.py` from a site build and the Studio's source.
   `PORT-MANIFEST.json` lists every one with its SHA-256 (Secure Hash Algorithm, 256-bit)
   checksum. **Do not edit them here**: `site.test.mjs` fails on a hand edit. Change the
   source and rerun the port:

   ```sh
   python3 web/tools/port_site.py --site <built site folder> --studio <Studio folder>
   python3 web/tools/port_site.py --site <built site folder> --studio <Studio folder> --check
   ```

   The port is deterministic: a second run writes nothing, and `--check` exits 1 if `web/`
   is not what the port would write. It carries over the site build's crawl files
   unchanged (each page's canonical, social-card and schema.org tags, `robots.txt`,
   `sitemap.xml`, `llms.txt`, `llms-full.txt`), checks them, writes `legacy-redirects.js`,
   `404.html` and the forwarding page at the Studio's old address (`playground/index.html`,
   to `/studio/`), and points every page at the local fonts and script libraries (below).

2. **Files `web/` owns.** These are sources in their own right and the port never
   touches them:
   - `capabilities.json` is the structured source for the capability cards and the
     standards grid. **Edit that, not the HTML.**
   - `data/verification-matrix.json` is generated (`cargo run --bin
     gen_validation_artifacts`) and pinned by `tests/verification_artifacts_doc_sync.rs`;
     do not edit it by hand. `data/card-matrix-map.json`, `data/oracle-references.json`
     and `data/standards-matrix-map.json` are hand-maintained mappings that the same test
     checks against the generated matrix. The Studio's copies under `studio/data/`
     are these files, byte for byte.
   - `og-card.svg`, `og-card.png` and `og-card.rendered-from.json` are the social card
     (`python3 tools/gen_og_card.py`).
   - `CNAME`, `.well-known/security.txt`, `favicon.svg`.
   - `fonts/` and `vendor/`: the font files and the script library the pages use, fetched
     once by `tools/fetch_third_party.py` and committed (see "No third-party requests").
   - `build.sh`, `smoke.mjs`, `site.test.mjs`, `legacy-urls.test.mjs` and `tools/`.

3. **Build outputs**, git-ignored and produced by `build.sh`: `pkg/` (the `wasm-pack`
   package, which is also what the npm package is built from), `studio/pkg/` (the same
   package where the Studio imports it) and `scenarios/` (every reference scenario, at the
   address the earlier single-page site served them from).

## Build and serve locally

```sh
./web/build.sh                     # compiles the WASM module and stages it for the Studio
python3 -m http.server -d web 8000 # serve over HTTP (required for WASM)
# open http://localhost:8000/
```

Without the WASM toolchain, `KSHANA_WASM_PKG=<a built pkg folder> ./web/build.sh` stages
an existing package instead of compiling one. The Pages workflow never uses that.

## Tests

```sh
node web/smoke.mjs                 # the WASM bindings (needs web/pkg)
node web/site.test.mjs             # the ported tree: manifest, version, counts, links
node web/legacy-urls.test.mjs      # every old kshana.dev address still resolves
for f in web/studio/lib/*.test.mjs; do node "$f"; done   # the Studio's modules
```

Each module in `studio/lib/` is pure logic with a matching `*.test.mjs`; the Studio's
DOM (Document Object Model, the page's element tree) drivers are `studio/app.js` (the
Simple view) and `studio/advanced.js` (the Advanced view).
Continuous integration runs every one of these as its own step and fails if a test file
under `web/` has no step.

## No third-party requests

kshana.dev serves its own fonts, styles and scripts. A page makes no request to a font
host or a script host, so a visitor's address is not handed to one.

The site and the Studio are written against Google Fonts and a script host. The port
replaces each page's Google Fonts link with the matching stylesheet in `fonts/` (the same
`@font-face` rules and the same font files, every subset, so text renders as before) and
each script-host address with the file under `vendor/`. `fonts/FONTS.json` and
`vendor/VENDOR.json` record where each file came from and its checksum; the fonts are
under the SIL Open Font License (`fonts/OFL-*.txt`) and three.js under the MIT licence
(`vendor/three@…/LICENSE`).

`tools/fetch_third_party.py --from <site folder> --from <Studio folder>` is the only step
that uses the network. Run it again only when a page asks for a font set or a library
version that is not here: the port refuses and says so. `site.test.mjs` fails if any
ported page, stylesheet or script names a font host or loads anything from another host.

## The 404 page

GitHub Pages answers a missing address with `/404.html` and status 404. The port makes
that page from the home page's own shell (navigation, footer, search) around a short
message with links to Home, Docs and the Studio. Every address in it is written from the
site root, because it is served at any depth.

## Old addresses

Until v0.28.0 the site was a single page, and everything lived behind a fragment on `/`
(`/#playground`, `/#ledger`, share links as `/#s=…`, embeds as `/?embed=1&…`; an embed
link's old tab name, such as `tab=fom`, opens the Studio tab that replaced it).
`tools/legacy-urls.json` lists every such address that published material uses and where
it lands now; the home page loads `legacy-redirects.js`, generated from that list, to send
them there. Add a case to the list before retiring any address.

## Deployment

The `pages` GitHub Actions workflow deploys a release tag, not `main`: `release.yml`
dispatches it once a release is published, and a manual dispatch redeploys a named tag.
It runs `build.sh`, stages `web/` without the tests, the build script, `tools/`, the
manifest and this file, and publishes the result to GitHub Pages.
