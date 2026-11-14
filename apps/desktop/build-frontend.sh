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
#
# The staged copy is then rewritten for the Desktop (apps/desktop/wording.mjs, 0.42 U4): the
# Studio's pages say the engine runs in the reader's browser, which is right on the website and
# wrong in the app. The build fails if such a phrase is left. web/ itself is never changed.
#
#   apps/desktop/build-frontend.sh [out-dir]     (default apps/desktop/dist)
set -euo pipefail
if [ -n "${1:-}" ]; then
  case "$1" in /|.|..) echo "build-frontend.sh: refusing to stage into '$1'" >&2; exit 2 ;; esac
  mkdir -p "$1"; out="$(cd "$1" && pwd)"
fi
cd "$(dirname "$0")/../.."
out="${out:-apps/desktop/dist}"
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
# The Desktop's own wording in the staged copy (never in web/).
node apps/desktop/wording.mjs "$out/studio"
if [ -f web/studio/pkg/kshana_bg.wasm ]; then
  echo "frontend staged with the WebAssembly package for the tool pages"
else
  echo "frontend staged without the WebAssembly package: runs are native; the tool pages need web/build.sh first"
fi
