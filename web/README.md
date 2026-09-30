# The kshana.dev site

`web/` is the tree that GitHub Pages serves as <https://kshana.dev>: the pages
(`index.html`, `missions.html`, `capabilities.html`, `evidence.html`, `developers.html`,
`editions.html`), the documentation under `docs/`, and Kshana Studio under `playground/`,
the app that runs the engine in the browser as WebAssembly (WASM) with no server-side
computation and nothing uploaded.

## Where the files come from

Three kinds of file live here, and they are changed in three different ways.

1. **Ported files.** The pages, `docs/`, `css/`, `js/`, `assets/`, the site data in
   `data/` (`land.json`, `search.json`, `series.json`) and everything under `playground/`
   are written by `web/tools/port_site.py` from a site build and the Studio's source.
   `PORT-MANIFEST.json` lists every one with its SHA-256 (Secure Hash Algorithm, 256-bit)
   checksum. **Do not edit them here**: `site.test.mjs` fails on a hand edit. Change the
   source and rerun the port:

   ```sh
   python3 web/tools/port_site.py --site <built site folder> --studio <Studio folder>
   python3 web/tools/port_site.py --site <built site folder> --studio <Studio folder> --check
   ```

   The port is deterministic: a second run writes nothing, and `--check` exits 1 if `web/`
   is not what the port would write. It also writes the canonical link and social-card
   tags of every page, `sitemap.xml`, and `legacy-redirects.js`.

2. **Files `web/` owns.** These are sources in their own right and the port never
   touches them:
   - `capabilities.json` is the structured source for the capability cards and the
     standards grid. **Edit that, not the HTML.**
   - `data/verification-matrix.json` is generated (`cargo run --bin
     gen_validation_artifacts`) and pinned by `tests/verification_artifacts_doc_sync.rs`;
     do not edit it by hand. `data/card-matrix-map.json`, `data/oracle-references.json`
     and `data/standards-matrix-map.json` are hand-maintained mappings that the same test
     checks against the generated matrix. The Studio's copies under `playground/data/`
     are these files, byte for byte.
   - `og-card.svg`, `og-card.png` and `og-card.rendered-from.json` are the social card
     (`python3 tools/gen_og_card.py`).
   - `CNAME`, `robots.txt`, `.well-known/security.txt`, `favicon.svg`.
   - `build.sh`, `smoke.mjs`, `site.test.mjs`, `legacy-urls.test.mjs` and `tools/`.

3. **Build outputs**, git-ignored and produced by `build.sh`: `pkg/` (the `wasm-pack`
   package, which is also what the npm package is built from), `playground/pkg/` (the same
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
for f in web/playground/lib/*.test.mjs; do node "$f"; done   # the Studio's modules
```

Each module in `playground/lib/` is pure logic with a matching `*.test.mjs`; the Studio's
DOM (Document Object Model, the page's element tree) driver is `playground/app.js`.
Continuous integration runs every one of these as its own step and fails if a test file
under `web/` has no step.

## Old addresses

Until v0.28.0 the site was a single page, and everything lived behind a fragment on `/`
(`/#playground`, `/#ledger`, share links as `/#s=…`, embeds as `/?embed=1&…`).
`tools/legacy-urls.json` lists every such address that published material uses and where
it lands now; the home page loads `legacy-redirects.js`, generated from that list, to send
them there. Add a case to the list before retiring any address.

## Deployment

The `pages` GitHub Actions workflow deploys a release tag, not `main`: `release.yml`
dispatches it once a release is published, and a manual dispatch redeploys a named tag.
It runs `build.sh`, stages `web/` without the tests, the build script, `tools/`, the
manifest and this file, and publishes the result to GitHub Pages.
