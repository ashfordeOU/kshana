#!/usr/bin/env bash
# Stage the Studio as Kshana Desktop's frontend (apps/desktop/dist).
#
# The window opens the Desktop's own shell (apps/desktop/shell: sidebar, document tabs,
# inspector, command palette), staged as studio/desktop/ so it imports the Studio's modules
# from web/studio unchanged; the Studio's pages are staged as they are, for the tool pages.
# Inside the app, lib/desktop.mjs routes the runs to the native engine. The WebAssembly package for the
# tool pages is taken from web/studio/pkg when it has been built (web/build.sh or
# wasm-pack); without it every run still works natively and the tool pages say which
# engine function they lack.
set -euo pipefail
cd "$(dirname "$0")/../.."
out=apps/desktop/dist
rm -rf "$out"
mkdir -p "$out"
# Everything the Studio serves, except its tests.
(cd web && tar --exclude='*.test.mjs' -cf - studio) | (cd "$out" && tar -xf -)
# The Desktop's shell (its tests stay behind), and the local fonts it and the Studio name.
mkdir -p "$out/studio/desktop"
(cd apps/desktop/shell && tar --exclude='*.test.mjs' -cf - .) | (cd "$out/studio/desktop" && tar -xf -)
(cd web && tar -cf - fonts) | (cd "$out" && tar -xf -)
# The Desktop opens its shell as its first page.
cat > "$out/index.html" <<'HTML'
<!doctype html><meta charset="utf-8"><meta http-equiv="refresh" content="0; url=studio/desktop/index.html"><title>Kshana Desktop</title>
HTML
if [ -f web/studio/pkg/kshana_bg.wasm ]; then
  echo "frontend staged with the WebAssembly package for the tool pages"
else
  echo "frontend staged without the WebAssembly package: runs are native; the tool pages need web/build.sh first"
fi
