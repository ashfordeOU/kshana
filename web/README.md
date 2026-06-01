# Kshana browser playground

A static, single-page playground that runs the Kshana engine entirely in the
browser as WebAssembly — no server-side computation, nothing uploaded. Pick a
reference scenario or edit the TOML and run it; the page shows the one-line
summary, the SVG chart, and the full JSON result.

## Build and serve locally

```sh
./web/build.sh                     # compiles the WASM module + stages assets
python3 -m http.server -d web 8000 # serve over HTTP (required for WASM)
# open http://localhost:8000/
```

`build.sh` runs `wasm-pack` (target `web`) into `web/pkg/` and copies the
reference scenarios and the banner into `web/scenarios/` and `web/assets/`. Those
three directories are build outputs and are git-ignored; only `index.html`,
`app.js`, `style.css`, and `build.sh` are tracked.

## Deployment

The `pages` GitHub Actions workflow builds the site and publishes it to GitHub
Pages on every push to `main`. Enable Pages for the repository with the
"GitHub Actions" source for it to go live.
