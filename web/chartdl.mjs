// SPDX-License-Identifier: AGPL-3.0-only
// Chart-download helpers for the playground. The charts are self-describing SVGs
// (baked title, subtitle, legend and provenance), so the SVG export is the
// faithful, scalable original; the PNG export rasterises that same SVG for users
// who need a bitmap to drop into a slide or document.
//
// Pure logic (chartFilename, svgSize) is unit-tested in chartdl.test.mjs. The
// browser-only helpers (svgBlob, triggerDownload, svgToPngBlob) are exercised in
// the page and verified by rendering.

/// Build a descriptive, provenance-stamped, filesystem-safe download name, e.g.
/// `kshana-holdover-v0.12.0-820999dd0e8a.svg`. Version and hash are optional and
/// omitted cleanly when absent so the name never ends up with empty segments.
export function chartFilename(base, meta, ext) {
  const ver = meta && meta.ver ? `-v${meta.ver}` : "";
  const hash = meta && meta.hash ? `-${String(meta.hash).slice(0, 12)}` : "";
  return `kshana-${base}${ver}${hash}.${ext}`;
}

/// Read the *root* `<svg>` element's width/height (the first width/height pair in
/// the string), ignoring the width/height of any inner rect/line. Returns zeros
/// for a string with no dimensions so callers can guard before rasterising.
export function svgSize(svgText) {
  const w = svgText.match(/width="(\d+(?:\.\d+)?)"/);
  const h = svgText.match(/height="(\d+(?:\.\d+)?)"/);
  return { w: w ? parseFloat(w[1]) : 0, h: h ? parseFloat(h[1]) : 0 };
}

// --- Browser-only helpers (require DOM/Canvas) ----------------------------

/// Wrap SVG markup in a Blob suitable for download or for use as an <img> source.
export function svgBlob(svgText) {
  return new Blob([svgText], { type: "image/svg+xml;charset=utf-8" });
}

/// Trigger a browser download of `blob` as `filename` via a transient anchor.
export function triggerDownload(blob, filename) {
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  a.remove();
  // Revoke after the click has been dispatched so the download can start.
  setTimeout(() => URL.revokeObjectURL(url), 0);
}

/// Rasterise an SVG string to a PNG Blob at `scale`x its intrinsic size, so the
/// bitmap is crisp on high-DPI displays. Resolves with the PNG Blob; rejects if
/// the SVG fails to load or the canvas cannot encode.
export function svgToPngBlob(svgText, w, h, scale = 2) {
  return new Promise((resolve, reject) => {
    const url = URL.createObjectURL(svgBlob(svgText));
    const img = new Image();
    img.onload = () => {
      try {
        const canvas = document.createElement("canvas");
        canvas.width = Math.max(1, Math.round(w * scale));
        canvas.height = Math.max(1, Math.round(h * scale));
        const ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
        URL.revokeObjectURL(url);
        canvas.toBlob(
          (blob) => (blob ? resolve(blob) : reject(new Error("canvas could not encode PNG"))),
          "image/png",
        );
      } catch (e) {
        URL.revokeObjectURL(url);
        reject(e);
      }
    };
    img.onerror = () => {
      URL.revokeObjectURL(url);
      reject(new Error("could not load SVG for rasterisation"));
    };
    img.src = url;
  });
}
