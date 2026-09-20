#!/usr/bin/env bash
# Re-render one docs/assets/diagrams PNG from its SVG using a WEB ENGINE, and update the
# render record. Companion to tools/render-diagram.sh, which uses librsvg.
#
# WHY A SECOND RENDERER EXISTS
#   Mermaid emits node labels one of two ways. Native SVG <text> renders fine through
#   librsvg, which is what tools/render-diagram.sh uses. But when htmlLabels is on, the
#   label is an HTML <div><span><p> inside a <foreignObject>, and librsvg implements no
#   HTML layout: it renders those as NOTHING, silently, exit 0. The PNG comes out as a
#   wireframe with every label gone.
#
#   That is not hypothetical. validation-provenance.png was re-rendered through the librsvg
#   script to correct a stale count and lost all 38 of its labels. The hash record in
#   rendered-from.json still validated, because it binds the PNG to the SVG it came from and
#   cannot tell the render came out blank. Only a human looking at the image caught it.
#   tools/render-diagram.sh now refuses foreignObject diagrams and points here.
#
#   Two of the five diagrams need this path: module-map and validation-provenance.
#
# WHY qlmanage AND NOT HEADLESS CHROME
#   Chrome renders these correctly, and on a loaded machine it is unusable: every attempt
#   here was killed by the OS out-of-memory reaper part-way through, repeatedly. qlmanage
#   drives WebKit through Quick Look, starts in seconds, costs a fraction of the memory, and
#   ships with macOS. Its output was checked against the mermaid-cli original: same layout,
#   same theme, every label present, RMSE 0.014 with only the edited numbers differing.
#   (--single-process Chrome looks like the obvious fix for the memory problem and instead
#   segfaults headless Chrome on macOS immediately. Do not reach for it.)
#
# THE GEOMETRY
#   qlmanage renders into a SQUARE canvas of side -s, scaling the drawing to the width and
#   centring it vertically. So the content occupies a band of height width/aspect at
#   y = (side - height)/2, where aspect comes from the SVG's own viewBox. That crop is
#   computed exactly below rather than guessed with -trim, which eats the diagram's intended
#   margin and leaves the aspect wrong.
#
# USAGE
#   tools/render-diagram-browser.sh validation-provenance          # keep current PNG size
#   tools/render-diagram-browser.sh validation-provenance 5974 1202
#
# Requires qlmanage (macOS) and ImageMagick.

set -euo pipefail

NAME="${1:?usage: tools/render-diagram-browser.sh <diagram-name> [width-px height-px]}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIR="$ROOT/docs/assets/diagrams"
SVG="$DIR/$NAME.svg"
PNG="$DIR/$NAME.png"
REC="$DIR/rendered-from.json"

[ -f "$SVG" ] || { echo "no such diagram SVG: $SVG" >&2; exit 1; }
command -v qlmanage >/dev/null || { echo "qlmanage not found (macOS only)" >&2; exit 1; }
command -v magick   >/dev/null || { echo "ImageMagick 'magick' not found (brew install imagemagick)" >&2; exit 1; }

if [ "$#" -ge 3 ]; then
  W="$2"; H="$3"
elif [ -f "$PNG" ]; then
  W="$(magick identify -format '%w' "$PNG")"
  H="$(magick identify -format '%h' "$PNG")"
else
  echo "no existing PNG to take dimensions from; pass width and height" >&2; exit 1
fi
echo "rendering $NAME at ${W}x${H} via qlmanage (WebKit)"

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

qlmanage -t -s "$W" -o "$WORK" "$SVG" >/dev/null 2>&1 || true
RAW="$WORK/$(basename "$SVG").png"
[ -s "$RAW" ] || { echo "qlmanage produced no thumbnail for $SVG" >&2; exit 1; }

# Crop the content band out of the square canvas, using the SVG's own viewBox aspect.
# The helper goes to a file rather than inline: a heredoc nested inside $( ) trips bash
# quote matching, which is how this script first failed to parse at all.
cat > "$WORK/crop.py" <<'PYEOF'
import re, sys
svg, w, h = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
m = re.search(r'viewBox="([\d.\-]+)\s+([\d.\-]+)\s+([\d.]+)\s+([\d.]+)"', open(svg).read())
if not m:
    # No viewBox: assume the caller's own aspect, which puts the band where it expects.
    print(int(round((w - h) / 2)))
else:
    vw, vh = float(m.group(3)), float(m.group(4))
    band = w * vh / vw
    print(int(round((w - band) / 2)))
PYEOF
CROP_Y="$(python3 "$WORK/crop.py" "$SVG" "$W" "$H")"
echo "  content band starts at y=$CROP_Y in the ${W}x${W} canvas"
magick "$RAW" -crop "${W}x${H}+0+${CROP_Y}" +repage "$WORK/out.png"

# A foreignObject render that came out blank is the exact failure this script exists to
# prevent, so refuse to install one. A wireframe with no text compresses far smaller than
# the same drawing with labels; the committed PNG is the reference for "has text".
NEW_BYTES="$(stat -f%z "$WORK/out.png" 2>/dev/null || stat -c%s "$WORK/out.png")"
if [ -f "$PNG" ]; then
  OLD_BYTES="$(stat -f%z "$PNG" 2>/dev/null || stat -c%s "$PNG")"
  if [ "$NEW_BYTES" -lt "$((OLD_BYTES / 2))" ]; then
    echo "refusing: the render is ${NEW_BYTES} bytes against ${OLD_BYTES} committed." >&2
    echo "A drop that large means the labels did not render. Not installing it." >&2
    exit 1
  fi
fi

cp "$WORK/out.png" "$PNG"
echo "  wrote $PNG (${NEW_BYTES} bytes, $(magick identify -format '%wx%h' "$PNG"))"

python3 - "$SVG" "$PNG" "$REC" <<'PY'
import hashlib, json, os, sys
svg, png, rec = sys.argv[1], sys.argv[2], sys.argv[3]
sha = hashlib.sha256(open(svg, 'rb').read()).hexdigest()
d = json.load(open(rec))
d['rendered'][os.path.basename(png)] = {'svg': os.path.basename(svg), 'svg_sha256': sha}
with open(rec, 'w') as f:
    json.dump(d, f, indent=2)
    f.write('\n')
print(f"  record updated: {os.path.basename(png)} <- {os.path.basename(svg)} @ {sha[:12]}...")
PY
