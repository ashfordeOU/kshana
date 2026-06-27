#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Build the browser playground: compile the WebAssembly module and stage the
# static assets and reference scenarios next to index.html. Then serve it, e.g.:
#   ./web/build.sh && python3 -m http.server -d web 8000
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$here"

if ! command -v wasm-pack >/dev/null 2>&1; then
  echo "wasm-pack not found. Install it: https://rustwasm.github.io/wasm-pack/installer/" >&2
  exit 1
fi

echo "Building WebAssembly module…"
wasm-pack build --target web --out-dir web/pkg --release -- --features wasm

# wasm-pack copies the crate's `readme` (README.crates.md) into the npm package.
# Override it with the npm-specific surface README (JS/WASM usage, absolute image URLs).
echo "Staging npm package README…"
cp README.npm.md web/pkg/README.md

echo "Staging scenarios and assets…"
mkdir -p web/scenarios web/assets web/assets/fonts
cp scenarios/*.toml web/scenarios/
cp docs/assets/kshana-banner.svg web/assets/
cp docs/assets/fonts/* web/assets/fonts/

echo "Done. Serve the site with:  python3 -m http.server -d web 8000"
