#!/usr/bin/env bash
# Render one docs/diagrams/<name>.mmd to docs/assets/diagrams/<name>.svg and .png on Linux, and update the
# render record. The companion of tools/render-diagram.sh (librsvg) and tools/render-diagram-browser.sh
# (macOS Quick Look) for a machine with Chromium and mermaid-cli but neither of those.
#
# The SVG comes from mermaid-cli with the tracked, palette-generated config, on the palette's chart
# ground; the PNG is a Chromium screenshot of that SVG at the stated width (the same recipe
# tools/render-diagram.sh describes for foreignObject diagrams), and docs/assets/diagrams/rendered-from.json
# binds the PNG to the exact SVG bytes, as tests/scenario_count_doc_sync.rs checks.
#
# USAGE
#   MMDC=/path/to/mmdc CHROMIUM=/path/to/chrome tools/render-diagram-chromium.sh module-map [width-px]
#   (MMDC defaults to `mmdc` on PATH; CHROMIUM to the first chrome under $PLAYWRIGHT_BROWSERS_PATH or `chromium`)
#   Install the Geist fonts from tools/readme-fonts first so layout and raster use the same face.

set -euo pipefail

NAME="${1:?usage: tools/render-diagram-chromium.sh <diagram-name> [width-px]}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/docs/diagrams/$NAME.mmd"
DIR="$ROOT/docs/assets/diagrams"
SVG="$DIR/$NAME.svg"
PNG="$DIR/$NAME.png"
[ -f "$SRC" ] || { echo "no such diagram source: $SRC" >&2; exit 1; }

MMDC="${MMDC:-$(command -v mmdc || true)}"
[ -n "$MMDC" ] || { echo "mmdc (mermaid-cli) not found; set MMDC" >&2; exit 1; }
CHROMIUM="${CHROMIUM:-}"
if [ -z "$CHROMIUM" ]; then
  CHROMIUM="$(find "${PLAYWRIGHT_BROWSERS_PATH:-/opt/pw-browsers}" -maxdepth 3 -name chrome -type f 2>/dev/null | head -1 || true)"
  [ -n "$CHROMIUM" ] || CHROMIUM="$(command -v chromium || command -v chromium-browser || true)"
fi
[ -n "$CHROMIUM" ] || { echo "no Chromium found; set CHROMIUM" >&2; exit 1; }

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
printf '{"executablePath":"%s","args":["--no-sandbox","--disable-gpu"]}\n' "$CHROMIUM" > "$WORK/puppeteer.json"
GROUND="$(python3 -c 'import json,sys;print(json.load(open(sys.argv[1]))["dark"]["bg"])' "$ROOT/docs/assets/palette.json")"

"$MMDC" -p "$WORK/puppeteer.json" -c "$ROOT/docs/diagrams/mermaid-config.json" -b "$GROUND" -i "$SRC" -o "$SVG"

WIDTH="${2:-}"
if [ -z "$WIDTH" ] && [ -f "$PNG" ]; then
  WIDTH=$(python3 -c "import struct,sys;print(struct.unpack('>II',open(sys.argv[1],'rb').read(33)[16:24])[0])" "$PNG")
fi
WIDTH="${WIDTH:-4000}"

python3 - "$SVG" "$WORK" "$WIDTH" "$GROUND" <<'PY'
import re, sys
svg, work, width, ground = sys.argv[1], sys.argv[2], int(sys.argv[3]), sys.argv[4]
text = open(svg).read()
vb = [float(x) for x in re.search(r'viewBox="([^"]*)"', text).group(1).split()]
h = round(width * vb[3] / vb[2])
open(f"{work}/wrap.html", "w").write(
    f'<!doctype html><html><body style="margin:0;background:{ground}"><style>svg{{max-width:none!important;'
    f'width:{width}px!important;height:{h}px!important;display:block}}</style>{text}</body></html>')
open(f"{work}/dims", "w").write(f"{width},{h}")
PY
DIMS="$(cat "$WORK/dims")"
# headless Chromium paints less than the window it is given (the browser's own chrome takes the rest), so the
# window is made 400 px taller than the drawing and the screenshot is cropped back to the drawing's size.
W="${DIMS%,*}"; H="${DIMS#*,}"
"$CHROMIUM" --headless --no-sandbox --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
  --window-size="$W,$((H + 400))" --screenshot="$WORK/full.png" "file://$WORK/wrap.html" >/dev/null 2>&1
python3 - "$WORK/full.png" "$PNG" "$W" "$H" <<'PY'
import sys
from PIL import Image
src, dst, w, h = sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4])
im = Image.open(src)
if im.height < h:
    sys.exit(f"screenshot is {im.height} px tall, the drawing needs {h}")
im.crop((0, 0, w, h)).save(dst, optimize=True)
PY
echo "  rendered $NAME.png at ${W}x${H}"

python3 - "$DIR" "$NAME" <<'PY'
import hashlib, json, sys
d, name = sys.argv[1], sys.argv[2]
rec = json.load(open(f'{d}/rendered-from.json'))
sha = hashlib.sha256(open(f'{d}/{name}.svg', 'rb').read()).hexdigest()
rec['rendered'][f'{name}.png'] = {'svg': f'{name}.svg', 'svg_sha256': sha}
rec['rendered'] = dict(sorted(rec['rendered'].items()))
open(f'{d}/rendered-from.json', 'w').write(json.dumps(rec, indent=2) + '\n')
print(f'  record updated: {name}.png <- {name}.svg @ {sha[:12]}')
PY
