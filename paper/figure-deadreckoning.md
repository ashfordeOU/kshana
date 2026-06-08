<!-- SPDX-License-Identifier: Apache-2.0 -->
# JOSS figure note (FOUNDER ACTION)

The JOSS paper references a raster figure `paper/figure-deadreckoning.png`. JOSS's LaTeX
compile is more reliable with PNG than with SVG, so the committed source SVG must be
rasterised before submission. Run **one** of:

```bash
# librsvg (recommended; preserves text/fonts)
rsvg-convert -w 1600 docs/assets/inertial-deadreckoning.svg -o paper/figure-deadreckoning.png

# or Inkscape
inkscape docs/assets/inertial-deadreckoning.svg --export-type=png \
  --export-filename=paper/figure-deadreckoning.png --export-width=1600
```

Then add the figure to `paper/paper.md` (in the *Validation* or *Software design* section):

```markdown
![Dead-reckoning position error during a GNSS outage: the cold-atom (quantum) accelerometer
holds near the spec line while the navigation-grade unit diverges to kilometres.](figure-deadreckoning.png)
```

The source SVG `docs/assets/inertial-deadreckoning.svg` is already in the repository and is
the same chart rendered in the README.
