#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Build the site's one compiled part: the WebAssembly engine the Studio runs. Everything
# else under web/ is already there (the pages, the docs and the Studio are ported in by
# web/tools/port_site.py and committed). Then serve it, e.g.:
#   ./web/build.sh && python3 -m http.server -d web 8000
#
# Outputs, all git-ignored:
#   web/pkg/             the wasm-pack package (also the npm package's build directory)
#   web/studio/pkg/  the same package where the Studio imports it from (./pkg/kshana.js)
#   web/scenarios/       every reference scenario, at the address the single-page site
#                        served them from (kshana.dev/scenarios/<file>.toml)
#
# KSHANA_WASM_PKG=<dir> stages an already built wasm-pack package from <dir> instead of
# compiling one. It is for a local preview on a machine without the wasm toolchain; the
# Pages workflow never sets it, so the deployed engine is always built from the checkout.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$here"

if [ -n "${KSHANA_WASM_PKG:-}" ]; then
  for f in kshana.js kshana_bg.wasm package.json; do
    [ -f "$KSHANA_WASM_PKG/$f" ] || { echo "KSHANA_WASM_PKG=$KSHANA_WASM_PKG has no $f" >&2; exit 1; }
  done
  echo "Staging the prebuilt WebAssembly package from KSHANA_WASM_PKG (not compiling)…"
  rm -rf web/pkg
  mkdir -p web/pkg
  cp "$KSHANA_WASM_PKG"/kshana.js "$KSHANA_WASM_PKG"/kshana_bg.wasm "$KSHANA_WASM_PKG"/package.json web/pkg/
  for f in kshana.d.ts kshana_bg.wasm.d.ts LICENSE; do
    if [ -f "$KSHANA_WASM_PKG/$f" ]; then cp "$KSHANA_WASM_PKG/$f" web/pkg/; fi
  done
else
  if ! command -v wasm-pack >/dev/null 2>&1; then
    echo "wasm-pack not found. Install it: https://drager.github.io/wasm-pack/ (or: cargo install wasm-pack)" >&2
    exit 1
  fi
  echo "Building WebAssembly module…"
  wasm-pack build --target web --out-dir web/pkg --release -- --features wasm
fi

# wasm-pack copies the crate's `readme` (README.crates.md) into the npm package.
# Override it with the npm-specific surface README (JS/WASM usage, absolute image URLs).
echo "Staging npm package README…"
cp README.npm.md web/pkg/README.md

echo "Staging the package next to the Studio…"
[ -f web/studio/index.html ] || { echo "web/studio/ is missing: run web/tools/port_site.py first" >&2; exit 1; }
rm -rf web/studio/pkg
mkdir -p web/studio/pkg
for f in kshana.js kshana_bg.wasm package.json LICENSE; do
  if [ -f "web/pkg/$f" ]; then cp "web/pkg/$f" web/studio/pkg/; fi
done
[ -f web/studio/pkg/kshana.js ] && [ -f web/studio/pkg/kshana_bg.wasm ] \
  || { echo "the WebAssembly package was not staged next to the Studio" >&2; exit 1; }

echo "Staging scenarios…"
mkdir -p web/scenarios
cp scenarios/*.toml web/scenarios/

echo "Done. Serve the site with:  python3 -m http.server -d web 8000"
