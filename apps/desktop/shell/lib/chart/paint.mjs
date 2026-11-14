// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): puts a display list (export.mjs) on a Canvas 2D context.
// The context is already scaled for the device pixel ratio, so coordinates are CSS pixels.

export function paint(ctx, list, { font = "Geist Mono, ui-monospace, monospace" } = {}) {
  for (const p of list) {
    switch (p.k) {
      case "clip":
        ctx.save(); ctx.beginPath(); ctx.rect(p.x, p.y, p.w, p.h); ctx.clip(); break;
      case "unclip":
        ctx.restore(); break;
      case "path": {
        const pts = p.pts;
        ctx.beginPath();
        let pen = false;
        for (let i = 0; i + 1 < pts.length; i += 2) {
          const x = pts[i], y = pts[i + 1];
          if (x !== x || y !== y) { pen = false; continue; }
          if (pen) ctx.lineTo(x, y); else { ctx.moveTo(x, y); pen = true; }
        }
        if (p.close) ctx.closePath();
        ctx.globalAlpha = p.alpha ?? 1;
        if (p.fill) { ctx.fillStyle = p.fill; ctx.fill(); }
        if (p.stroke) {
          // round joins cost a lot to rasterise on a dense path (thousands of short segments): bevel there, where they look the same
          const dense = pts.length > 3000;
          ctx.strokeStyle = p.stroke; ctx.lineWidth = p.width ?? 1; ctx.lineJoin = dense ? "bevel" : "round"; ctx.lineCap = dense ? "butt" : "round";
          ctx.setLineDash(p.dash || []); ctx.stroke(); ctx.setLineDash([]);
        }
        ctx.globalAlpha = 1;
        break;
      }
      case "points": {
        const s = p.size ?? 3, h = s / 2, pts = p.pts;
        if (pts.length > 10000 && !p.stroke && !p.colors && rasterPoints(ctx, pts, s, p.color)) break;
        // Points of one colour go into one path and one fill (or stroke): thousands of separate
        // fills cost far more to rasterise. Many points are drawn as squares, which read the same at 2–3 px.
        const square = p.shape === "square" || pts.length > 40000;
        const flush = (colour) => {
          if (p.stroke) { ctx.strokeStyle = colour; ctx.lineWidth = 1.4; ctx.stroke(); } else { ctx.fillStyle = colour; ctx.fill(); }
        };
        let colour = p.colors ? p.colors[0] : p.color;
        ctx.beginPath();
        for (let i = 0, j = 0; i + 1 < pts.length; i += 2, j++) {
          if (p.colors && p.colors[j] !== colour) { flush(colour); colour = p.colors[j]; ctx.beginPath(); }
          const x = pts[i], y = pts[i + 1];
          if (square) ctx.rect(x - h, y - h, s, s);
          else if (p.shape === "diamond") { const d = s / 1.4; ctx.moveTo(x, y - d); ctx.lineTo(x + d, y); ctx.lineTo(x, y + d); ctx.lineTo(x - d, y); ctx.closePath(); }
          else { ctx.moveTo(x + h, y); ctx.arc(x, y, h, 0, Math.PI * 2); }
        }
        flush(colour);
        break;
      }
      case "rect":
        ctx.globalAlpha = p.alpha ?? 1;
        if (p.fill) { ctx.fillStyle = p.fill; ctx.fillRect(p.x, p.y, p.w, p.h); }
        if (p.stroke) { ctx.strokeStyle = p.stroke; ctx.lineWidth = p.width ?? 1; ctx.strokeRect(p.x, p.y, p.w, p.h); }
        ctx.globalAlpha = 1;
        break;
      case "text":
        ctx.save();
        ctx.fillStyle = p.color;
        ctx.font = `${p.weight || 400} ${p.size ?? 11}px ${p.font || font}`;
        ctx.textAlign = p.align || "left";
        ctx.textBaseline = p.base || "alphabetic";
        if (p.rotate) { ctx.translate(p.x, p.y); ctx.rotate(p.rotate); ctx.fillText(p.text, 0, 0); }
        else ctx.fillText(p.text, p.x, p.y);
        ctx.restore();
        break;
      case "image":
        if (p.src) {
          ctx.imageSmoothingEnabled = !!p.smooth;
          ctx.drawImage(p.src, p.sx ?? 0, p.sy ?? 0, p.sw ?? p.src.width, p.sh ?? p.src.height, p.x, p.y, p.w, p.h);
          ctx.imageSmoothingEnabled = true;
        }
        break;
      default:
    }
  }
}

// Many points of one colour: squares written straight into an image buffer the size of their
// bounding box (device pixels), then composited with drawImage, which keeps the clip and blends
// with what is under them. Far cheaper to rasterise than tens of thousands of path squares.
const rgbaCache = new Map();
function rgbaOf(c) {
  if (rgbaCache.has(c)) return rgbaCache.get(c);
  let v = null;
  const m = /^#([0-9a-f]{6})$/i.exec(c) || /^#([0-9a-f]{3})$/i.exec(c);
  if (m) { const hx = m[1].length === 3 ? [...m[1]].map((x) => x + x).join("") : m[1]; v = [0, 2, 4].map((i) => parseInt(hx.slice(i, i + 2), 16)).concat(255); }
  const r = /^rgba?\(([^)]+)\)$/i.exec(c);
  if (r) { const q = r[1].split(/[\s,/]+/).filter(Boolean).map(Number); v = [q[0], q[1], q[2], Math.round((q[3] ?? 1) * 255)]; }
  rgbaCache.set(c, v);
  return v;
}
let scratch = null;
function rasterPoints(ctx, pts, size, colour) {
  const rgba = rgbaOf(colour);
  if (!rgba || typeof ctx.getTransform !== "function" || typeof document === "undefined") return false;
  const k = ctx.getTransform().a || 1;
  let x0 = Infinity, y0 = Infinity, x1 = -Infinity, y1 = -Infinity;
  for (let i = 0; i + 1 < pts.length; i += 2) { const x = pts[i], y = pts[i + 1]; if (x < x0) x0 = x; if (x > x1) x1 = x; if (y < y0) y0 = y; if (y > y1) y1 = y; }
  if (!(x1 >= x0)) return true;
  const sz = Math.max(1, Math.round(size * k)), hs = sz / 2;
  const ox = Math.floor(x0 * k - hs), oy = Math.floor(y0 * k - hs);
  const w = Math.ceil(x1 * k + hs) - ox + 1, h = Math.ceil(y1 * k + hs) - oy + 1;
  if (w * h > 16e6) return false;
  if (!scratch) scratch = document.createElement("canvas");
  if (scratch.width < w || scratch.height < h) { scratch.width = Math.max(scratch.width, w); scratch.height = Math.max(scratch.height, h); }
  const sc = scratch.getContext("2d");
  const img = sc.createImageData(w, h), d = new Uint32Array(img.data.buffer);
  const word = (rgba[3] << 24) | (rgba[2] << 16) | (rgba[1] << 8) | rgba[0]; // little-endian RGBA
  for (let i = 0; i + 1 < pts.length; i += 2) {
    const px = Math.round(pts[i] * k - hs) - ox, py = Math.round(pts[i + 1] * k - hs) - oy;
    for (let yy = 0; yy < sz; yy++) { const row = (py + yy) * w + px; for (let xx = 0; xx < sz; xx++) d[row + xx] = word; }
  }
  sc.putImageData(img, 0, 0);
  ctx.save();
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.drawImage(scratch, 0, 0, w, h, ox, oy, w, h);
  ctx.restore();
  return true;
}
