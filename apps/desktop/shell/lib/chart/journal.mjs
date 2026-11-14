// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U13): a chart as a journal figure, in the IEEE, ION or AIAA
// manner, as SVG, PDF or PNG. Pure, no DOM (the PNG is painted by the caller from the same
// display list); tested in journal.test.mjs.
//
// The figure is drawn from the chart's own data and view: the normalised spec the chart draws
// (data.mjs normalise), the x and y windows on screen and the series the legend shows. Every
// point inside the window is drawn, with one point beyond each edge so a line reaches the
// frame, and the figure carries the visible data as CSV in its metadata (the rows the chart's
// CSV export gives), so what is exported is what is on screen. A series of more than
// DENSE points is reduced to the first, lowest, highest and last point of each column at
// four columns per output point (M4): the drawn extremes are the data's own.
//
// The presets set the figure width, the type face and sizes, the line weights and a
// grey-scale-safe set of line styles: IEEE's column widths (3.5 in single, 7.16 in double);
// for ION and AIAA 3.25 in and 6.75 in, a common two-column layout rather than a figure taken
// from their guides. A figure meant for submission should be checked against the current guide.
import { scale, niceTicks, logTicks, fmtTick, fmtClock } from "./scale.mjs";
import { m4, visibleRange } from "./decimate.mjs";
import { visibleRows } from "./data.mjs";
import { toCSV, svgOf } from "./export.mjs";

const BLACK = "rgb(0,0,0)", GREY = "rgb(110,110,110)", LIGHT = "rgb(200,200,200)", WHITE = "rgb(255,255,255)";
/** Line styles in order: grey-scale safe (weight, grey and dash differ), as a figure printed in black and white needs. */
const LINES = [
  { color: BLACK, dash: [] }, { color: BLACK, dash: [4, 2] }, { color: GREY, dash: [] }, { color: BLACK, dash: [1, 1.5] },
  { color: GREY, dash: [5, 2, 1, 2] }, { color: BLACK, dash: [6, 3] }, { color: GREY, dash: [1, 1.5] }, { color: GREY, dash: [4, 2] },
];
const SHAPES = ["circle", "square", "diamond"];

/** The presets. Sizes in points (1/72 in). */
export const JOURNAL_STYLES = Object.freeze({
  ieee: Object.freeze({ id: "ieee", label: "IEEE", width: { single: 252, double: 515.5 }, aspect: 0.72, font: "Times New Roman, Times, serif", pdfFont: "Times-Roman", size: 8, tick: 7, line: 1, frame: 0.5, axisLabel: (l, u) => (u ? `${l} (${u})` : l) }),
  ion: Object.freeze({ id: "ion", label: "ION", width: { single: 234, double: 486 }, aspect: 0.7, font: "Times New Roman, Times, serif", pdfFont: "Times-Roman", size: 8, tick: 7, line: 0.9, frame: 0.5, axisLabel: (l, u) => (u ? `${l} [${u}]` : l) }),
  aiaa: Object.freeze({ id: "aiaa", label: "AIAA", width: { single: 234, double: 486 }, aspect: 0.75, font: "Times New Roman, Times, serif", pdfFont: "Times-Roman", size: 9, tick: 8, line: 1, frame: 0.6, axisLabel: (l, u) => (u ? `${l}, ${u}` : l) }),
});
export const JOURNAL_FORMATS = ["svg", "pdf", "png"];
/** More points than this in the window and a series is drawn by its column extremes (M4). */
export const DENSE = 20000;

const inside = (v, [a, b]) => v >= Math.min(a, b) && v <= Math.max(a, b);
const textW = (s, size) => String(s).length * size * 0.5;

/**
 * The figure of a chart: { list (display list, points), w, h, csv, series: [{ id, label, drawn }] }.
 * `spec` is the normalised spec (chart.spec), `view` the chart's { x, y, y2 } windows
 * (chart.view), `hidden` the ids the legend hides (chart.hidden).
 */
export function journalFigure(spec, view, hidden = [], styleId = "ieee", { columns = "single", title = false } = {}) {
  const st = JOURNAL_STYLES[styleId] || JOURNAL_STYLES.ieee;
  const hid = new Set(hidden);
  const w = st.width[columns] || st.width.single;
  if (spec.type === "polar") return polarFigure(spec, view, hid, st, w, title);
  if (spec.type !== "xy") throw new Error("a journal figure is made of a line, scatter or sky chart");
  const shown = spec.series.filter((r) => !hid.has(r.id) && r.x && r.n);
  const legendRows = Math.ceil(shown.length / 2);
  const h = Math.round(w * st.aspect + (shown.length > 1 ? legendRows * (st.tick + 3) : 0));
  const L = [];
  L.push({ k: "rect", x: 0, y: 0, w, h, fill: WHITE });
  const P = { l: st.size * 4.6, r: w - 6, t: (title && spec.title ? st.size * 1.8 : 6), b: h - st.size * 3.2 - (shown.length > 1 ? legendRows * (st.tick + 3) : 0) };
  const [x0, x1] = view.x, [y0, y1] = view.y;
  const sx = scale(spec.x.kind, x0, x1, P.l, P.r), sy = scale(spec.y.kind, y0, y1, P.b, P.t);
  // ticks and grid
  const xt = spec.x.kind === "log" ? logTicks(Math.min(x0, x1), Math.max(x0, x1)) : niceTicks(Math.min(x0, x1), Math.max(x0, x1), Math.max(3, Math.round((P.r - P.l) / 60)));
  const yt = spec.y.kind === "log" ? logTicks(Math.min(y0, y1), Math.max(y0, y1)) : niceTicks(Math.min(y0, y1), Math.max(y0, y1), Math.max(3, Math.round((P.b - P.t) / 36)));
  for (const v of yt.ticks) {
    const y = sy.map(v);
    if (y < P.t - 0.5 || y > P.b + 0.5) continue;
    L.push({ k: "path", pts: [P.l, y, P.r, y], stroke: LIGHT, width: 0.3 });
    L.push({ k: "path", pts: [P.l, y, P.l + 3, y], stroke: BLACK, width: st.frame });
    L.push({ k: "text", x: P.l - 3, y, text: fmtTick(v, yt.step || 0, spec.y.kind), color: BLACK, size: st.tick, align: "right", base: "middle", font: st.font });
  }
  for (const v of xt.ticks) {
    const x = sx.map(v);
    if (x < P.l - 0.5 || x > P.r + 0.5) continue;
    L.push({ k: "path", pts: [x, P.t, x, P.b], stroke: LIGHT, width: 0.3 });
    L.push({ k: "path", pts: [x, P.b, x, P.b - 3], stroke: BLACK, width: st.frame });
    L.push({ k: "text", x, y: P.b + 2.5, text: spec.x.time ? fmtClock(v) : fmtTick(v, xt.step || 0, spec.x.kind), color: BLACK, size: st.tick, align: "center", base: "top", font: st.font });
  }
  // series, clipped to the frame
  L.push({ k: "clip", x: P.l, y: P.t, w: P.r - P.l, h: P.b - P.t });
  const drawn = [];
  shown.forEach((r, k) => {
    const ls = LINES[k % LINES.length];
    const xa = Math.min(x0, x1), xb = Math.max(x0, x1);
    let [i0, i1] = r.sorted ? visibleRange(r.x, xa, xb) : [0, r.n];
    if (r.sorted) { i0 = Math.max(0, i0 - 1); i1 = Math.min(r.n, i1 + 1); }
    const idx = [];
    if (r.kind !== "scatter" && r.sorted && i1 - i0 > DENSE) {
      const cols = (P.r - P.l) * 4;
      const ix = m4(r.x, r.y, i0, i1, (x) => ((sx.map(x) - P.l) / (P.r - P.l)) * cols);
      for (const i of ix) idx.push(i);
    } else for (let i = i0; i < i1; i++) idx.push(i);
    const pts = [];
    for (const i of idx) {
      if (i < 0 || r.y[i] !== r.y[i]) { pts.push(NaN, NaN); continue; }
      if (r.kind === "scatter" && !(inside(r.x[i], view.x) && inside(r.y[i], view.y))) continue;
      pts.push(sx.map(r.x[i]), sy.map(r.y[i]));
    }
    if (r.kind === "scatter") L.push({ k: "points", pts, color: ls.color, size: 2.6, shape: SHAPES[k % SHAPES.length], stroke: k % 2 === 1 });
    else L.push({ k: "path", pts, stroke: ls.color, width: st.line, dash: ls.dash });
    drawn.push({ id: r.id, label: r.label, points: pts.length / 2, style: ls });
  });
  for (const o of spec.overlays || []) {
    if (o.kind === "hline" && Number.isFinite(o.y) && inside(o.y, view.y)) L.push({ k: "path", pts: [P.l, sy.map(o.y), P.r, sy.map(o.y)], stroke: GREY, width: 0.6, dash: [3, 2] });
    if (o.kind === "vline" && Number.isFinite(o.x) && inside(o.x, view.x)) L.push({ k: "path", pts: [sx.map(o.x), P.t, sx.map(o.x), P.b], stroke: GREY, width: 0.6, dash: [3, 2] });
  }
  L.push({ k: "unclip" });
  // frame and labels
  L.push({ k: "rect", x: P.l, y: P.t, w: P.r - P.l, h: P.b - P.t, stroke: BLACK, width: st.frame });
  const xl = st.axisLabel(spec.x.label || "x", spec.x.time ? "h:mm:ss" : spec.x.unit);
  const yl = st.axisLabel(spec.y.label || "y", spec.y.unit || (shown[0] && shown[0].unit) || "");
  L.push({ k: "text", x: (P.l + P.r) / 2, y: P.b + st.tick + 5, text: xl, color: BLACK, size: st.size, align: "center", base: "top", font: st.font });
  L.push({ k: "text", x: st.size * 0.9, y: (P.t + P.b) / 2, text: yl, color: BLACK, size: st.size, align: "center", base: "middle", font: st.font, rotate: -Math.PI / 2 });
  if (title && spec.title) L.push({ k: "text", x: (P.l + P.r) / 2, y: 2, text: spec.title, color: BLACK, size: st.size, align: "center", base: "top", font: st.font });
  if (shown.length > 1) {
    const top = P.b + st.tick + st.size + 9;
    drawn.forEach((d, k) => {
      const cx = k % 2 ? w / 2 + 4 : P.l, cy = top + Math.floor(k / 2) * (st.tick + 3) + st.tick / 2;
      if (shown[k].kind === "scatter") L.push({ k: "points", pts: [cx + 7, cy], color: d.style.color, size: 2.6, shape: SHAPES[k % SHAPES.length], stroke: k % 2 === 1 });
      else L.push({ k: "path", pts: [cx, cy, cx + 14, cy], stroke: d.style.color, width: st.line, dash: d.style.dash });
      L.push({ k: "text", x: cx + 18, y: cy, text: d.label, color: BLACK, size: st.tick, base: "middle", font: st.font });
    });
  }
  const { header, rows } = visibleRows(spec, view, hid);
  return { list: L, w, h, csv: toCSV(header, rows), series: drawn, frame: P, scales: { x: sx, y: sy }, style: st.id };
}

function polarFigure(spec, view, hid, st, w0, title) {
  const w = Math.min(w0, 252), h = Math.round(w + (title && spec.title ? st.size * 2 : 0));
  const L = [{ k: "rect", x: 0, y: 0, w, h, fill: WHITE }];
  const top = title && spec.title ? st.size * 2 : 0;
  const R = w / 2 - st.size * 2, cx = w / 2, cy = top + h / 2 - top / 2;
  const ring = (r) => { const p = []; for (let k = 0; k <= 96; k++) { const a = (k / 96) * Math.PI * 2; p.push(cx + r * Math.sin(a), cy - r * Math.cos(a)); } return p; };
  for (const el of spec.rings || [0, 30, 60]) {
    L.push({ k: "path", pts: ring(((90 - el) / 90) * R), stroke: el === 0 ? BLACK : LIGHT, width: el === 0 ? st.frame : 0.4 });
    if (el > 0) L.push({ k: "text", x: cx + 2, y: cy - ((90 - el) / 90) * R - 1, text: `${el}°`, color: GREY, size: st.tick - 1, base: "bottom", font: st.font });
  }
  if (spec.mask) L.push({ k: "path", pts: ring(((90 - spec.mask) / 90) * R), stroke: GREY, width: 0.6, dash: [3, 2] });
  [["N", 0, -1], ["E", 1, 0], ["S", 0, 1], ["W", -1, 0]].forEach(([t, dx, dy]) => L.push({ k: "text", x: cx + dx * (R + st.size * 0.9), y: cy + dy * (R + st.size * 0.9), text: t, color: BLACK, size: st.tick, align: "center", base: "middle", font: st.font }));
  const drawn = [];
  for (const tr of spec.tracks) {
    if (hid.has(tr.group || tr.id) || hid.has(tr.id)) continue;
    const pts = [];
    for (let i = 0; i < tr.n; i++) pts.push(tr.px[i] === tr.px[i] ? cx + tr.px[i] * R : NaN, tr.py[i] === tr.py[i] ? cy - tr.py[i] * R : NaN);
    L.push({ k: "path", pts, stroke: BLACK, width: st.line * 0.8 });
    let last = -1;
    for (let i = tr.n - 1; i >= 0; i--) if (tr.px[i] === tr.px[i]) { last = i; break; }
    if (last >= 0) {
      L.push({ k: "points", pts: [cx + tr.px[last] * R, cy - tr.py[last] * R], color: BLACK, size: 3 });
      L.push({ k: "text", x: cx + tr.px[last] * R + 3, y: cy - tr.py[last] * R - 2, text: tr.short || tr.label, color: BLACK, size: st.tick - 1.5, base: "bottom", font: st.font });
    }
    drawn.push({ id: tr.id, label: tr.label, points: pts.length / 2 });
  }
  if (title && spec.title) L.push({ k: "text", x: w / 2, y: 2, text: spec.title, color: BLACK, size: st.size, align: "center", base: "top", font: st.font });
  const { header, rows } = visibleRows(spec, { x: [-1.2, 1.2], y: [-1.2, 1.2] }, hid);
  return { list: L, w, h, csv: toCSV(header, rows), series: drawn, frame: { cx, cy, R }, style: st.id };
}

/** The figure as an SVG document, with the visible data as CSV in its metadata. */
export function journalSVG(fig, title = "") {
  const svg = svgOf(fig.list, fig.w, fig.h, { bg: "", title, font: JOURNAL_STYLES[fig.style].font });
  const meta = `<metadata id="kshana-data" data-format="text/csv"><![CDATA[\n${fig.csv.replace(/\]\]>/g, "]] >")}]]></metadata>`;
  return svg.replace(/<svg[^>]*>/, (open) => `${open}\n${meta}`).replace(/<svg([^>]*)width="([\d.]+)" height="([\d.]+)"/, (m, a, wv, hv) => `<svg${a}width="${wv}pt" height="${hv}pt"`);
}

// ---------------------------------------------------------------- PDF
const n2 = (v) => (Math.round(v * 100) / 100).toString();
const pdfColour = (c) => {
  const m = /rgba?\((\d+),\s*(\d+),\s*(\d+)/.exec(String(c || ""));
  return m ? [m[1], m[2], m[3]].map((v) => n2(+v / 255)).join(" ") : "0 0 0";
};
const pdfText = (s) => String(s).replace(/[()\\]/g, (m) => `\\${m}`).replace(/[^\x20-\x7e]/g, (ch) => ({ "°": "\\260", "−": "-", "Δ": "D", "µ": "\\265", "±": "\\261", "×": "\\327", "·": "\\267", "⁰": "0", "¹": "1", "²": "2", "³": "3", "⁻": "-" })[ch] || "?");

/**
 * The figure as a one-page PDF (vectors: paths, points, rectangles and text in the standard
 * Times face), as a Uint8Array. The page is the figure's size in points; y runs up in PDF, so
 * every y is flipped. The visible data rides along as an embedded CSV file.
 */
export function journalPDF(fig, title = "") {
  const H = fig.h;
  const Y = (y) => n2(H - y);
  const ops = [];
  let clipped = 0;
  for (const p of fig.list) {
    if (p.k === "clip") { ops.push("q", `${n2(p.x)} ${Y(p.y + p.h)} ${n2(p.w)} ${n2(p.h)} re W n`); clipped++; }
    else if (p.k === "unclip") { if (clipped) { ops.push("Q"); clipped--; } }
    else if (p.k === "rect") {
      const r = `${n2(p.x)} ${Y(p.y + p.h)} ${n2(p.w)} ${n2(p.h)} re`;
      if (p.fill) ops.push(`${pdfColour(p.fill)} rg`, `${r} f`);
      if (p.stroke) ops.push(`${pdfColour(p.stroke)} RG`, `${n2(p.width ?? 1)} w`, "[] 0 d", `${r} S`);
    } else if (p.k === "path") {
      const seg = [];
      let pen = false;
      for (let i = 0; i + 1 < p.pts.length; i += 2) {
        const x = p.pts[i], y = p.pts[i + 1];
        if (x !== x || y !== y) { pen = false; continue; }
        seg.push(`${n2(x)} ${Y(y)} ${pen ? "l" : "m"}`);
        pen = true;
      }
      if (!seg.length) continue;
      ops.push(`${pdfColour(p.stroke)} RG`, `${n2(p.width ?? 1)} w`, `[${(p.dash || []).map(n2).join(" ")}] 0 d`, "1 J 1 j", ...seg, p.fill ? "B" : "S");
    } else if (p.k === "points") {
      const s = (p.size ?? 3) / 2;
      ops.push(`${pdfColour(p.color)} rg`, `${pdfColour(p.color)} RG`, "0.5 w", "[] 0 d");
      for (let i = 0; i + 1 < p.pts.length; i += 2) {
        const x = p.pts[i], y = p.pts[i + 1];
        if (x !== x || y !== y) continue;
        const paint = p.stroke ? "S" : "f";
        if (p.shape === "square") ops.push(`${n2(x - s)} ${Y(y + s)} ${n2(2 * s)} ${n2(2 * s)} re ${paint}`);
        else if (p.shape === "diamond") ops.push(`${n2(x)} ${Y(y - s * 1.3)} m ${n2(x + s * 1.3)} ${Y(y)} l ${n2(x)} ${Y(y + s * 1.3)} l ${n2(x - s * 1.3)} ${Y(y)} l h ${paint}`);
        else { const k = s * 0.5523; ops.push(`${n2(x + s)} ${Y(y)} m ${n2(x + s)} ${Y(y - k)} ${n2(x + k)} ${Y(y - s)} ${n2(x)} ${Y(y - s)} c ${n2(x - k)} ${Y(y - s)} ${n2(x - s)} ${Y(y - k)} ${n2(x - s)} ${Y(y)} c ${n2(x - s)} ${Y(y + k)} ${n2(x - k)} ${Y(y + s)} ${n2(x)} ${Y(y + s)} c ${n2(x + k)} ${Y(y + s)} ${n2(x + s)} ${Y(y + k)} ${n2(x + s)} ${Y(y)} c ${paint}`); }
      }
    } else if (p.k === "text") {
      const size = p.size ?? 8, wv = textW(p.text, size);
      const dx = p.align === "center" ? -wv / 2 : p.align === "right" ? -wv : 0;
      const dy = p.base === "top" ? -size * 0.75 : p.base === "middle" ? -size * 0.33 : p.base === "bottom" ? size * 0.2 : 0;
      const a = p.rotate || 0, c = Math.cos(-a), s = Math.sin(-a);
      // the text's own origin, moved for its anchor along the (rotated) baseline
      const ox = p.x + dx * Math.cos(a) - dy * Math.sin(a), oy = p.y + dx * Math.sin(a) + dy * Math.cos(a);
      ops.push("BT", `${pdfColour(p.color)} rg`, `/F1 ${n2(size)} Tf`, `${n2(c)} ${n2(s)} ${n2(-s)} ${n2(c)} ${n2(ox)} ${Y(oy)} Tm`, `(${pdfText(p.text)}) Tj`, "ET");
    }
  }
  while (clipped--) ops.push("Q");
  const content = ops.join("\n");
  const csv = fig.csv;
  const objs = [
    "<< /Type /Catalog /Pages 2 0 R /Names << /EmbeddedFiles << /Names [(figure-data.csv) 7 0 R] >> >> >>",
    "<< /Type /Pages /Kids [3 0 R] /Count 1 >>",
    `<< /Type /Page /Parent 2 0 R /MediaBox [0 0 ${n2(fig.w)} ${n2(fig.h)}] /Resources << /Font << /F1 4 0 R >> >> /Contents 5 0 R >>`,
    `<< /Type /Font /Subtype /Type1 /BaseFont /${JOURNAL_STYLES[fig.style].pdfFont} /Encoding /WinAnsiEncoding >>`,
    `<< /Length ${byteLen(content)} >>\nstream\n${content}\nendstream`,
    `<< /Type /EmbeddedFile /Subtype /text#2Fcsv /Length ${byteLen(csv)} >>\nstream\n${csv}\nendstream`,
    `<< /Type /Filespec /F (figure-data.csv) /UF (figure-data.csv) /Desc (${pdfText(title || "the visible data of the figure")}) /EF << /F 6 0 R >> >>`,
  ];
  let out = "%PDF-1.4\n%\xe2\xe3\xcf\xd3\n";
  const offs = [];
  objs.forEach((o, i) => { offs.push(byteLen(out)); out += `${i + 1} 0 obj\n${o}\nendobj\n`; });
  const xref = byteLen(out);
  out += `xref\n0 ${objs.length + 1}\n0000000000 65535 f \n${offs.map((o) => `${String(o).padStart(10, "0")} 00000 n \n`).join("")}`;
  out += `trailer\n<< /Size ${objs.length + 1} /Root 1 0 R /Info << /Producer (Kshana Desktop) /Title (${pdfText(title)}) >> >>\nstartxref\n${xref}\n%%EOF\n`;
  return latin1(out);
}
const byteLen = (s) => latin1(s).length;
function latin1(s) {
  const b = new Uint8Array(s.length);
  for (let i = 0; i < s.length; i++) { const c = s.charCodeAt(i); b[i] = c < 256 ? c : 63; }
  return b;
}

/** The pixel size and scale of a PNG of the figure at `dpi` (300 by default; 600 for line art). */
export function pngSize(fig, dpi = 300) {
  const k = dpi / 72;
  return { width: Math.round(fig.w * k), height: Math.round(fig.h * k), scale: k };
}

/** The data a figure was drawn from, read back from its SVG (the metadata CSV). */
export function csvOfSVG(svg) {
  const m = /<metadata id="kshana-data"[^>]*><!\[CDATA\[\n([\s\S]*?)\]\]><\/metadata>/.exec(svg);
  return m ? m[1] : null;
}

/** A file name for a journal figure: <title>-<style>.<ext>. */
export const journalFilename = (title, styleId, ext) => `${String(title || "figure").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 60) || "figure"}-${styleId}.${ext}`;
