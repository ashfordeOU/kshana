#!/usr/bin/env bash
# Re-render one docs/assets/diagrams PNG from its SVG, and update the render record.
#
# WHY THIS EXISTS
#   The README's hero diagram carried the scenario-kind count as text inside the image.
#   It read 44 while the engine dispatched 59, its own alt-text read 50, and the three
#   guarded text sites all read 59 and stayed green for two months: a number inside a
#   rendered image is invisible to every doc-sync test. The defence is now three-layered —
#   the .mmd source and the SVG's text are pinned by tests/scenario_count_doc_sync.rs, and
#   this script keeps the PNG bound to the SVG so the picture cannot fall behind the page.
#
# THE WHITESPACE FIX
#   Mermaid emits one <tspan> per word with the separating space *inside* the tspan
#   (" front"). Without xml:space="preserve" an XML renderer is entitled to strip that
#   leading space, and librsvg does: the words run together ("Fivefrontdoors"). Chrome,
#   which rendered the originals via mermaid-cli, keeps them. Adding xml:space="preserve"
#   to every <text> makes the render faithful in both, which is what turns this into a
#   repeatable local step rather than a one-off browser screenshot. It is applied
#   idempotently, and only where no newline sits inside a <text> (where preserving
#   whitespace would inject stray spaces).
#
# USAGE
#   tools/render-diagram.sh system-overview        # keep the current PNG width
#   tools/render-diagram.sh system-overview 3200   # render at a new width
#
# Requires rsvg-convert (brew install librsvg).

set -euo pipefail

NAME="${1:?usage: tools/render-diagram.sh <diagram-name> [width-px]}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIR="$ROOT/docs/assets/diagrams"
SVG="$DIR/$NAME.svg"
PNG="$DIR/$NAME.png"
REC="$DIR/rendered-from.json"

[ -f "$SVG" ] || { echo "no such diagram SVG: $SVG" >&2; exit 1; }
command -v rsvg-convert >/dev/null || { echo "rsvg-convert not found (brew install librsvg)" >&2; exit 1; }

# REFUSE a diagram whose text lives in <foreignObject>.
#
# Mermaid emits node labels one of two ways: as native SVG <text>, or — when htmlLabels
# is on — as an HTML <div><span><p> inside a <foreignObject>. librsvg implements no HTML
# layout, so it renders a foreignObject as NOTHING: every box comes out empty and the
# PNG is a wireframe with all its labels silently gone. It does not warn and it exits 0.
#
# This is not hypothetical. validation-provenance.png was re-rendered through this script
# to correct a stale count, and the result lost every label in the diagram. The hash
# record in rendered-from.json still validated, because it binds the PNG to the SVG it
# came from and cannot tell that the render came out blank — so the only thing that
# caught it was a human looking at the image.
#
# Two of this repo's five diagrams (module-map, validation-provenance) are foreignObject
# diagrams. Render those with a browser engine, which is what mermaid-cli used to produce
# them in the first place:
#
#   Wrap the SVG in a minimal HTML page that sets
#     svg{max-width:none!important;width:<W>px!important;height:<H>px!important}
#   (the !important is load-bearing: mermaid writes an inline max-width that otherwise
#   pins the drawing to its authored size and leaves the rest of the canvas empty), then
#     "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless \
#       --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
#       --window-size=<W>,<H> --screenshot=out.png file://wrap.html
#   and update this directory's rendered-from.json entry with the new SVG sha256.
if grep -q '<foreignObject' "$SVG"; then
  echo "refusing: $NAME.svg puts its labels in <foreignObject>, which rsvg-convert drops" >&2
  echo "silently — the PNG would come out with every label blank. Render it with a" >&2
  echo "browser engine instead:  tools/render-diagram-browser.sh $NAME" >&2
  exit 1
fi

python3 - "$SVG" <<'PY'
import re, sys
p = sys.argv[1]
s = open(p).read()
n = 0
def add(m):
    global n
    n += 1
    return m.group(0)[:-1] + ' xml:space="preserve">'
out = re.sub(r'<text(?![^>]*xml:space)[^>]*>', add, s)
bad = [t for t in re.findall(r'<text.*?</text>', out, re.S) if '\n' in t]
if bad:
    sys.exit(f'{p}: {len(bad)} <text> elements span lines; xml:space would inject stray '
             'spaces. Render this one in a browser instead.')
if n:
    open(p, 'w').write(out)
print(f'  xml:space="preserve" added to {n} <text> elements' if n
      else '  xml:space already present')
PY

WIDTH="${2:-}"
if [ -z "$WIDTH" ] && [ -f "$PNG" ]; then
  WIDTH=$(python3 -c "import struct,sys;print(struct.unpack('>II',open(sys.argv[1],'rb').read(33)[16:24])[0])" "$PNG")
fi
WIDTH="${WIDTH:-2400}"

rsvg-convert -w "$WIDTH" "$SVG" -o "$PNG"
echo "  rendered $NAME.png at ${WIDTH}px wide"

python3 - "$DIR" "$NAME" <<'PY'
import hashlib, json, os, sys
d, name = sys.argv[1], sys.argv[2]
rec = json.load(open(f'{d}/rendered-from.json'))
sha = hashlib.sha256(open(f'{d}/{name}.svg', 'rb').read()).hexdigest()
rec['rendered'][f'{name}.png'] = {'svg': f'{name}.svg', 'svg_sha256': sha}
rec['rendered'] = dict(sorted(rec['rendered'].items()))
open(f'{d}/rendered-from.json', 'w').write(json.dumps(rec, indent=2) + '\n')
print(f'  record updated: {name}.png <- {name}.svg @ {sha[:12]}…')
PY
