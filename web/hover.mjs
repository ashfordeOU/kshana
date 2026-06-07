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

// --- Browser-only overlay --------------------------------------------------

/// Attach (or refresh) a hover overlay on the chart inside `containerId`. `model`
/// describes the current chart:
///   { wIntrinsic, ml, mr, fracs: number[] (0..1 plot x per sample),
///     label: (idx) => string }
/// Passing a model with no samples (or no image) hides the overlay. The pointer
/// listeners bind once per container; later calls just swap the live model.
export function attachChartHover(containerId, model) {
  const container = document.getElementById(containerId);
  if (!container) return;
  const img = container.querySelector("img");
  container._hoverModel = img && model && model.fracs && model.fracs.length ? model : null;

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
    const frac = cursorToPlotFraction(cssX, irect.width, m);
    if (frac === null) return hide();
    const idx = nearestIndexByValue(frac, m.fracs);
    if (idx < 0) return hide();

    // Snap the crosshair to the sample's plot-x, in container coordinates.
    const scale = irect.width / m.wIntrinsic;
    const plotLeft = m.ml * scale;
    const plotW = (m.wIntrinsic - m.ml - m.mr) * scale;
    const xInImg = plotLeft + m.fracs[idx] * plotW;
    const xInContainer = irect.left - crect.left + xInImg;

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
