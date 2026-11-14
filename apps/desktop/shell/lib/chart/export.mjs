// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): CSV of the visible data and the chart as real vector SVG.
// Pure, no DOM; tested in chart.test.mjs. The chart draws from a display list of primitives
// (paint.mjs puts it on a canvas); svgOf() writes the same list as SVG elements, so the
// exported figure is what is on screen, as vectors: lines, points, rectangles and text. A
// raster primitive (the waterfall's image buffer) is written as an <image> with a PNG data URI
// when the caller can encode one, and as its outline otherwise.
//
// Display list primitives (coordinates in CSS pixels):
//   { k: "path", pts: [x0, y0, x1, y1, ...] (NaN breaks), stroke, width, dash, fill, close, alpha }
//   { k: "points", pts: [x, y, ...], color | colors[], size, shape: "circle"|"square"|"diamond", stroke }
//   { k: "rect", x, y, w, h, fill, stroke, width, alpha }
//   { k: "text", x, y, text, color, size, font, align: "left"|"center"|"right", base: "top"|"middle"|"bottom"|"alphabetic", rotate, weight }
//   { k: "image", x, y, w, h, png (data URI, optional), smooth }
//   { k: "clip", x, y, w, h } … { k: "unclip" }

/** One CSV field: quoted when it holds a comma, a quote or a line break; numbers written in full precision. */
export function csvField(v) {
  if (v === null || v === undefined || (typeof v === "number" && Number.isNaN(v))) return "";
  const s = typeof v === "number" ? String(v) : String(v);
  return /[",\r\n]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s;
}

/** CSV text from a header and rows (arrays). Lines end in \n; a leading "=", "+", "-" or "@" text field is kept as text with a quote prefix. */
export function toCSV(header, rows) {
  const guard = (v) => (typeof v === "string" && /^[=+\-@]/.test(v) && !/^-?\d/.test(v) ? `'${v}` : v);
  return [header, ...rows].map((r) => r.map((v) => csvField(guard(v))).join(",")).join("\n") + "\n";
}

/** A column name with its unit in brackets, as the CSV header writes it. */
export const colName = (name, unit) => (unit ? `${name} [${unit}]` : name);

const esc = (s) => String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
const n2 = (v) => (Math.round(v * 100) / 100).toString();
const attrs = (o) => Object.entries(o).filter(([, v]) => v !== undefined && v !== null && v !== "").map(([k, v]) => ` ${k}="${esc(v)}"`).join("");

function pathD(pts, close) {
  let d = "", pen = false;
  for (let i = 0; i + 1 < pts.length; i += 2) {
    const x = pts[i], y = pts[i + 1];
    if (x !== x || y !== y) { pen = false; continue; }
    d += `${pen ? "L" : "M"}${n2(x)} ${n2(y)}`;
    pen = true;
  }
  return close && d ? `${d}Z` : d;
}

/** SVG markup (a standalone document) for a display list of size w×h on background `bg`. */
export function svgOf(list, w, h, { bg = "", title = "", font = "Geist Mono, ui-monospace, monospace" } = {}) {
  const out = [`<svg xmlns="http://www.w3.org/2000/svg" width="${n2(w)}" height="${n2(h)}" viewBox="0 0 ${n2(w)} ${n2(h)}" font-family="${esc(font)}">`];
  if (title) out.push(`<title>${esc(title)}</title>`);
  if (bg) out.push(`<rect width="100%" height="100%" fill="${esc(bg)}"/>`);
  let clips = 0, open = 0;
  for (const p of list) {
    if (p.k === "clip") {
      clips++;
      out.push(`<clipPath id="c${clips}"><rect x="${n2(p.x)}" y="${n2(p.y)}" width="${n2(p.w)}" height="${n2(p.h)}"/></clipPath><g clip-path="url(#c${clips})">`);
      open++;
    } else if (p.k === "unclip") {
      if (open) { out.push("</g>"); open--; }
    } else if (p.k === "path") {
      const d = pathD(p.pts, p.close);
      if (!d) continue;
      out.push(`<path${attrs({ d, fill: p.fill || "none", stroke: p.stroke || "none", "stroke-width": p.stroke ? p.width ?? 1 : undefined, "stroke-dasharray": p.dash && p.dash.length ? p.dash.join(" ") : undefined, "stroke-linejoin": p.stroke ? "round" : undefined, "stroke-linecap": p.stroke ? "round" : undefined, opacity: p.alpha !== undefined && p.alpha !== 1 ? p.alpha : undefined })}/>`);
    } else if (p.k === "points") {
      const s = p.size ?? 3;
      const many = p.pts.length / 2 > 20000;
      for (let i = 0, j = 0; i + 1 < p.pts.length; i += 2, j++) {
        const x = p.pts[i], y = p.pts[i + 1];
        if (x !== x || y !== y) continue;
        const c = p.colors ? p.colors[j] : p.color;
        if (p.shape === "square" || many) out.push(`<rect x="${n2(x - s / 2)}" y="${n2(y - s / 2)}" width="${n2(s)}" height="${n2(s)}" fill="${esc(c)}"/>`);
        else if (p.shape === "diamond") out.push(`<path d="M${n2(x)} ${n2(y - s / 1.4)}L${n2(x + s / 1.4)} ${n2(y)}L${n2(x)} ${n2(y + s / 1.4)}L${n2(x - s / 1.4)} ${n2(y)}Z" fill="${esc(c)}"/>`);
        else out.push(`<circle cx="${n2(x)}" cy="${n2(y)}" r="${n2(s / 2)}"${p.stroke ? ` fill="none" stroke="${esc(c)}"` : ` fill="${esc(c)}"`}/>`);
      }
    } else if (p.k === "rect") {
      out.push(`<rect${attrs({ x: n2(p.x), y: n2(p.y), width: n2(Math.max(0, p.w)), height: n2(Math.max(0, p.h)), fill: p.fill || "none", stroke: p.stroke, "stroke-width": p.stroke ? p.width ?? 1 : undefined, opacity: p.alpha !== undefined && p.alpha !== 1 ? p.alpha : undefined })}/>`);
    } else if (p.k === "text") {
      const anchor = p.align === "center" ? "middle" : p.align === "right" ? "end" : "start";
      const base = p.base === "top" ? "hanging" : p.base === "middle" ? "central" : p.base === "bottom" ? "text-after-edge" : undefined;
      const rot = p.rotate ? ` transform="rotate(${n2((p.rotate * 180) / Math.PI)} ${n2(p.x)} ${n2(p.y)})"` : "";
      out.push(`<text${attrs({ x: n2(p.x), y: n2(p.y), fill: p.color, "font-size": p.size ?? 11, "font-weight": p.weight, "text-anchor": anchor, "dominant-baseline": base, "font-family": p.font })}${rot}>${esc(p.text)}</text>`);
    } else if (p.k === "image") {
      if (p.png) out.push(`<image x="${n2(p.x)}" y="${n2(p.y)}" width="${n2(p.w)}" height="${n2(p.h)}" preserveAspectRatio="none"${p.smooth ? "" : ' style="image-rendering:pixelated"'} href="${esc(p.png)}"/>`);
      else out.push(`<rect x="${n2(p.x)}" y="${n2(p.y)}" width="${n2(p.w)}" height="${n2(p.h)}" fill="none" stroke="#888"/>`);
    }
  }
  while (open--) out.push("</g>");
  out.push("</svg>");
  return out.join("\n");
}
