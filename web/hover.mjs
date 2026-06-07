// SPDX-License-Identifier: Apache-2.0
// Interactive hover read-outs for the playground charts. The charts themselves
// stay as self-describing blob <img> SVGs (so download/compare/export are
// untouched); this adds a transparent overlay — a crosshair line and a value
// tooltip — positioned over the image. Coordinate math is pure and unit-tested
// (nearestIndexByValue, cursorToPlotFraction); the overlay DOM is verified in
// the browser.

/// Index of the value in `xs` (ascending) closest to `target`. Ties resolve to
/// the later index. Returns -1 for an empty array.
export function nearestIndexByValue(target, xs) {
  if (!xs.length) return -1;
  let best = 0;
  let bestD = Math.abs(xs[0] - target);
  for (let i = 1; i < xs.length; i++) {
    const d = Math.abs(xs[i] - target);
    if (d <= bestD) {
      bestD = d;
      best = i;
    }
  }
  return best;
}

/// Map a cursor x (CSS px, relative to the image's rendered left edge) to a 0..1
/// fraction across the plot area, given the rendered image width and the chart's
/// intrinsic width + left/right margins. Returns null when the cursor is outside
/// the plot area (over the margins).
export function cursorToPlotFraction(cssX, renderedWidth, geom) {
  const scale = renderedWidth / geom.wIntrinsic;
  const left = geom.ml * scale;
  const right = (geom.wIntrinsic - geom.mr) * scale;
  if (cssX < left || cssX > right || right <= left) return null;
  return (cssX - left) / (right - left);
}

/// The x-coordinates of the first `<polyline>`'s vertices in an SVG string. For
/// the Rust-generated charts each vertex is one data sample, so these intrinsic
/// x positions let the crosshair snap to real samples without knowing the chart's
/// margins. Returns [] when there is no (non-empty) polyline.
export function parsePolylineXs(svgText) {
  const m = svgText.match(/<polyline[^>]*\bpoints="([^"]*)"/);
  if (!m || !m[1].trim()) return [];
  return m[1]
    .trim()
    .split(/\s+/)
    .map((pt) => parseFloat(pt.split(",")[0]))
    .filter((x) => !Number.isNaN(x));
}

// --- Browser-only overlay --------------------------------------------------

/// Attach (or refresh) a hover overlay on the chart inside `containerId`. `model`
/// describes the current chart in one of two forms:
///   - log/linear plot with known margins (Allan):
///       { wIntrinsic, ml, mr, fracs: number[] (0..1 plot x per sample), label }
///   - intrinsic sample x positions parsed from the SVG (Rust charts):
///       { wIntrinsic, xs: number[] (intrinsic px per sample), label }
/// `label` is `(idx) => string`. Passing a model with no samples (or no image)
/// hides the overlay. Listeners bind once per container; later calls swap the
/// live model.
export function attachChartHover(containerId, model) {
  const container = document.getElementById(containerId);
  if (!container) return;
  const img = container.querySelector("img");
  const hasSamples = model && ((model.fracs && model.fracs.length) || (model.xs && model.xs.length));
  container._hoverModel = img && hasSamples ? model : null;

  let line = container.querySelector(".chart-hover-line");
  let tip = container.querySelector(".chart-hover-tip");
  if (!line) {
    container.style.position = "relative";
    line = document.createElement("div");
    line.className = "chart-hover-line";
    line.hidden = true;
    tip = document.createElement("div");
    tip.className = "chart-hover-tip";
    tip.hidden = true;
    container.append(line, tip);
  }

  if (container.dataset.hoverBound) return;
  container.dataset.hoverBound = "1";

  const hide = () => {
    line.hidden = true;
    tip.hidden = true;
  };

  container.addEventListener("pointermove", (e) => {
    const m = container._hoverModel;
    const image = container.querySelector("img");
    if (!m || !image) return hide();
    const irect = image.getBoundingClientRect();
    const crect = container.getBoundingClientRect();
    const cssX = e.clientX - irect.left;
    const scale = irect.width / m.wIntrinsic;

    // Resolve the nearest sample index and its intrinsic x, for either model form.
    let idx, xIntrinsic;
    if (m.xs) {
      const cursorIntrinsic = cssX / scale;
      // Ignore the area well outside the first/last sample (axis-label margins).
      if (cursorIntrinsic < m.xs[0] - 24 || cursorIntrinsic > m.xs[m.xs.length - 1] + 24) return hide();
      idx = nearestIndexByValue(cursorIntrinsic, m.xs);
      if (idx < 0) return hide();
      xIntrinsic = m.xs[idx];
    } else {
      const frac = cursorToPlotFraction(cssX, irect.width, m);
      if (frac === null) return hide();
      idx = nearestIndexByValue(frac, m.fracs);
      if (idx < 0) return hide();
      const plotLeft = m.ml * scale;
      const plotW = (m.wIntrinsic - m.ml - m.mr) * scale;
      xIntrinsic = (plotLeft + m.fracs[idx] * plotW) / scale;
    }
    const xInContainer = irect.left - crect.left + xIntrinsic * scale;

    line.style.left = `${xInContainer}px`;
    line.style.top = `${irect.top - crect.top}px`;
    line.style.height = `${irect.height}px`;
    line.hidden = false;

    tip.textContent = m.label(idx);
    tip.hidden = false;
    // Keep the tooltip inside the image box; flip left near the right edge and
    // follow the cursor vertically (clamped) so it never covers the title.
    const tipX = xInContainer + 12;
    const flip = tipX + tip.offsetWidth > irect.right - crect.left;
    tip.style.left = `${flip ? xInContainer - tip.offsetWidth - 12 : tipX}px`;
    const yInContainer = e.clientY - crect.top;
    const maxTop = irect.bottom - crect.top - tip.offsetHeight - 6;
    tip.style.top = `${Math.max(irect.top - crect.top + 6, Math.min(yInContainer + 12, maxTop))}px`;
  });
  container.addEventListener("pointerleave", hide);
}
