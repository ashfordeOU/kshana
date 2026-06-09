<!-- SPDX-License-Identifier: Apache-2.0 -->
# JOSS figure note

✅ **Done.** `paper/figure-deadreckoning.png` (1640×840) is committed and referenced from
`paper/paper.md` as `\autoref{fig:deadreckoning}`. JOSS's LaTeX compile prefers PNG over
SVG, so the figure ships as a raster.

To **regenerate** it from the source SVG (the same chart rendered in the README):

```bash
# cairosvg (used here)
cairosvg docs/assets/inertial-deadreckoning.svg --output-width 1640 -o paper/figure-deadreckoning.png

# or librsvg
rsvg-convert -w 1640 docs/assets/inertial-deadreckoning.svg -o paper/figure-deadreckoning.png

# or Inkscape
inkscape docs/assets/inertial-deadreckoning.svg --export-type=png \
  --export-filename=paper/figure-deadreckoning.png --export-width=1640
```

The source SVG `docs/assets/inertial-deadreckoning.svg` is canonical; keep it and the PNG in
sync if the underlying scenario changes.
