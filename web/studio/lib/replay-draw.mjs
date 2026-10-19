// SPDX-License-Identifier: AGPL-3.0-only
// The Bridge replay's drawing, as SVG markup (strings), so the page and the exported frames are the same drawing
// of the same rows. A panel is drawn in two layers: the static one (coast, tracks, the score over the whole run),
// drawn once, and the dynamic one (the vessel, the error ring, the trail, the cursor), redrawn at each tick.
// Colours are CSS variables named --rp-*: the page maps them to the Studio tokens, an exported file carries its own
// (THEME_CSS). Every number drawn is a logged or engine value from lib/replay.mjs; the screen positions are the
// view's. Pure; tested in replay-draw.test.mjs.
import { vesselPath, rayEnd, ringPx, stateAt, fmtT, bandLabel, quietSpans } from "./replay.mjs";
import { SKY_CSS, skyMarkup, skyDescribe } from "./skydraw.mjs";
import { skyCounts } from "./gsv.mjs";

export const TRACK = 600;            // the track square, px
export const STRIP_H = 84;           // the score strip, px
const BAND_W = { calibrating: 2, nominal: 2.6, degraded: 3.4, untrusted: 4.4 };  // line weight is a second cue
const TRAIL_S = 90;                   // the bold trail behind the vessel, mission seconds

const f1 = (v) => (Math.round(v * 10) / 10).toString();
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);

// The rules the markup uses. The page and an exported file both carry them.
export const SVG_CSS = `
.rp-sea{fill:var(--rp-sea)}
.rp-land{fill:var(--rp-land);stroke:var(--rp-landline);stroke-width:1;fill-rule:evenodd}
.rp-quiet{fill:none;stroke:var(--rp-un);stroke-width:11;stroke-linecap:round;stroke-linejoin:round;opacity:.22}
.rp-quiet-l{font:600 10.5px var(--rp-mono);fill:var(--rp-un);paint-order:stroke;stroke:var(--rp-sea);stroke-width:3px}
.rp-truth{fill:none;stroke:var(--rp-truth);stroke-width:1.4}
.rp-nofix{fill:none;stroke:var(--rp-lost);stroke-width:5;stroke-dasharray:2 5;stroke-linecap:round;opacity:.9}
.rp-rep{fill:none;stroke-linecap:round;stroke-linejoin:round}
.rp-fade{opacity:.32}
.rp-b-calibrating{stroke:var(--rp-cal)}.rp-b-nominal{stroke:var(--rp-nom)}.rp-b-degraded{stroke:var(--rp-deg)}.rp-b-untrusted{stroke:var(--rp-unt)}
.rp-f-calibrating{fill:var(--rp-cal)}.rp-f-nominal{fill:var(--rp-nom)}.rp-f-degraded{fill:var(--rp-deg)}.rp-f-untrusted{fill:var(--rp-unt)}
.rp-t{font:500 11px var(--rp-mono);fill:var(--rp-ink2)}
.rp-tb{font:600 11px var(--rp-mono);fill:var(--rp-ink)}
.rp-big{font:700 22px var(--rp-mono);fill:var(--rp-ink)}
.rp-ill{font:500 10px var(--rp-mono);fill:var(--rp-ink3)}
.rp-ax{fill:none;stroke:var(--rp-ink);stroke-width:1.3}
.rp-ring{fill:var(--rp-ringfill);stroke:var(--rp-ink);stroke-width:1.4;stroke-dasharray:4 3}
.rp-link{stroke:var(--rp-ink);stroke-width:1.2;stroke-dasharray:3 2}
.rp-gt{fill:var(--rp-ink);stroke:var(--rp-bg);stroke-width:1.2}
.rp-gr{fill:var(--rp-bg);fill-opacity:.55;stroke-width:2;stroke-dasharray:3 2}
.rp-hdt{stroke:var(--rp-ink);stroke-width:1.6}
.rp-cog{stroke-width:1.6;stroke-dasharray:4 2}
.rp-line{fill:none;stroke:var(--rp-ink);stroke-width:1.6}
.rp-edge{stroke:var(--rp-line2);stroke-width:1;stroke-dasharray:3 3}
.rp-ev{fill:var(--rp-spf);fill-opacity:.16}
.rp-cur{stroke:var(--rp-ink);stroke-width:1.4}
.rp-dot{fill:var(--rp-bg);stroke:var(--rp-ink);stroke-width:2}
.rp-card{fill:var(--rp-bg)}
` + SKY_CSS;

// Variable values for a file that is not the page: light, then dark under the system preference.
export const THEME_CSS = `
:root{--rp-bg:#F5F7FB;--rp-ink:#182033;--rp-ink2:#3A455E;--rp-ink3:#4E5971;--rp-line:rgba(28,44,84,.14);--rp-line2:rgba(28,44,84,.3);--rp-mono:"Geist Mono",ui-monospace,Menlo,monospace;
--rp-sea:#DCE6F2;--rp-sky:#EEF2F8;--rp-land:#CBD3C4;--rp-landline:#8E9A86;--rp-truth:#4E5971;--rp-lost:#6236E0;--rp-ringfill:rgba(28,79,224,.08);
--rp-cal:#8A93A8;--rp-nom:#0F8A47;--rp-deg:#C97A00;--rp-unt:#D12F32;--rp-un:#B8262B;--rp-tim:#1C4FE0;--rp-nav:#9A5C00;--rp-spf:#6236E0;--rp-orb:#006C7D}
@media (prefers-color-scheme:dark){:root{--rp-bg:#0D1528;--rp-ink:#EAF0FF;--rp-ink2:#A7B4D2;--rp-ink3:#8190B0;--rp-line:rgba(150,175,230,.14);--rp-line2:rgba(150,175,230,.3);
--rp-sea:#0A1630;--rp-sky:#0E1A36;--rp-land:#26324A;--rp-landline:#4A5A7C;--rp-truth:#8190B0;--rp-lost:#B7A2FF;--rp-ringfill:rgba(106,152,255,.12);
--rp-cal:#8A93A8;--rp-nom:#33CC78;--rp-deg:#FFB547;--rp-unt:#FF6A5C;--rp-un:#FF6A5C;--rp-tim:#6A98FF;--rp-nav:#FFB547;--rp-spf:#F45CCB;--rp-orb:#3DDCF7}}
`;

// ---------- the track ----------

const bandClass = (b) => `rp-b-${["calibrating", "nominal", "degraded", "untrusted"].includes(b) ? b : "calibrating"}`;
const pathOf = (pts) => pts.map((p, j) => `${j ? "L" : "M"}${f1(p[0])} ${f1(p[1])}`).join("");

// Runs of rows with one band, broken where the receiver reported no fix. [{band, idx}]
export function bandRuns(panel) {
  const runs = [];
  let run = null;
  panel.rows.forEach((r, i) => {
    if (!r.rep) { run = null; return; }
    const b = r.band || "calibrating";
    if (run && run.band === b) run.idx.push(i); else { run = { band: b, idx: run ? [run.idx[run.idx.length - 1], i] : [i] }; runs.push(run); }
  });
  return runs;
}

// The static layer of a panel's track square: the sea, the coast, the whole true and reported tracks (faded), the
// no-fix spans, start and end, a scale bar and north. `uid` keeps the clip path's id unique within a document.
export function trackStatic(panel, view, { uid = "p", showTruth = true, showCoast = true } = {}) {
  const S = TRACK, px = view.px, rows = panel.rows;
  const out = [`<clipPath id="rp-clip-${uid}"><rect width="${S}" height="${S}" rx="14"/></clipPath>`, `<rect class="rp-sea" width="${S}" height="${S}" rx="14"/>`];
  out.push(`<g clip-path="url(#rp-clip-${uid})">`);
  if (showCoast && panel.region && panel.region.rings.length) {
    const d = panel.region.rings.map((ring) => ring.map(([lo, la], j) => { const [x, y] = px([la, lo]); return `${j ? "L" : "M"}${f1(x)} ${f1(y)}`; }).join("") + "Z").join("");
    out.push(`<path class="rp-land" d="${d}"><title>Land: ${esc(panel.region.source)}. Orientation only, not a chart.</title></path>`);
  }
  // where the log lists satellites and hears none in some direction: a halo along the track, named in words (from the log)
  const quiet = quietSpans(panel);
  for (const q of quiet) {
    const pts = rows.slice(q.i0, q.i1 + 1).map((r) => r.truth || r.rep).filter(Boolean).map((p) => px(p));
    if (pts.length > 1) out.push(`<path class="rp-quiet" d="${pathOf(pts)}"><title>From T+${fmtT(q.t0)} to T+${fmtT(q.t1)} the log lists satellites to the ${esc(q.words)} and hears none of them</title></path>`);
  }
  // The labels (two short lines each) sit in the first corner whose block is clear of the whole track, its start and end markers and the north arrow, so they never cover the vessel's path.
  const lines = quiet.slice(0, 3).flatMap((q) => [`no signal from ${q.words === "every direction" ? q.words : "the " + q.words}`, `T+${fmtT(q.t0)} to ${fmtT(q.t1)} (from the log)`]);
  if (lines.length) {
    const pts = rows.map((r) => r.truth || r.rep).filter(Boolean).map((p) => px(p)), w = Math.max(...lines.map((t) => t.length)) * 6.6 + 12, h = lines.length * 13 + 6;
    const slots = [{ x: 14, y: 22, anchor: "start" }, { x: 14, y: S - 46 - h, anchor: "start" }, { x: S - 60, y: 90, anchor: "end" }];
    const free = (c) => { const x0 = c.anchor === "end" ? c.x - w : c.x - 4; return pts.every(([x, y]) => x < x0 - 14 || x > x0 + w + 14 || y < c.y - 14 || y > c.y + h + 14); };
    const slot = slots.find(free) || slots[0];
    lines.forEach((t, k) => out.push(`<text class="rp-quiet-l" x="${slot.x}" y="${slot.y + 12 + k * 13}" text-anchor="${slot.anchor}">${esc(t)}</text>`));
  }
  if (showTruth && panel.hasTruth) out.push(`<path class="rp-truth" d="${pathOf(rows.filter((r) => r.truth).map((r) => px(r.truth)))}"/>`);
  for (const r of bandRuns(panel)) out.push(`<path class="rp-rep rp-fade ${bandClass(r.band)}" stroke-width="${BAND_W[r.band] || 2}" d="${pathOf(r.idx.map((i) => px(rows[i].rep)))}"/>`);
  // no-fix spans on the true track
  let a = null;
  const spans = [];
  rows.forEach((r, i) => { if (!r.fixValid && a == null) a = i; if (r.fixValid && a != null) { spans.push([a, i - 1]); a = null; } });
  if (a != null) spans.push([a, rows.length - 1]);
  for (const [i0, i1] of spans) { const pts = rows.slice(i0, i1 + 1).filter((r) => r.truth).map((r) => px(r.truth)); if (pts.length > 1) out.push(`<path class="rp-nofix" d="${pathOf(pts)}"/>`); }
  const first = rows.find((r) => r.truth || r.rep), last = [...rows].reverse().find((r) => r.truth || r.rep);
  if (first) { const [x, y] = px(first.truth || first.rep); out.push(`<circle cx="${f1(x)}" cy="${f1(y)}" r="5" class="rp-gt"/><text class="rp-t" x="${f1(x + 8)}" y="${f1(y + 4)}">start</text>`); }
  if (last) { const [x, y] = px(last.truth || last.rep); out.push(`<rect x="${f1(x - 4.5)}" y="${f1(y - 4.5)}" width="9" height="9" class="rp-gt"/><text class="rp-t" x="${f1(x + 8)}" y="${f1(y + 4)}">end</text>`); }
  out.push("</g>");
  // scale bar and north, outside the clip
  const nice = niceLen(view.spanM * 0.25), lenPx = nice * view.k;
  out.push(`<path class="rp-ax" d="M16 ${S - 16}h${f1(lenPx)}m0 -4v8m0 -4M16 ${S - 20}v8"/><text class="rp-t" x="16" y="${S - 26}">${nice >= 1000 ? `${nice / 1000} km` : `${nice} m`}</text>`);
  out.push(`<path class="rp-ax" d="M${S - 24} 52v-28m-5 8l5 -8l5 8"/><text class="rp-t" x="${S - 30}" y="66">N</text>`);
  if (panel.region && panel.region.hidden) out.push(`<text class="rp-ill" x="${S - 14}" y="${S - 14}" text-anchor="end">${esc(panel.region.hidden)}</text>`);
  if (panel.region && panel.region.rings.length) out.push(`<text class="rp-ill" x="${S - 14}" y="${S - 14}" text-anchor="end">Coast: ${esc(panel.region.scale)} Natural Earth, illustration only</text>`);
  return out.join("");
}

// A 1-2-5 length for the scale bar, metres.
export function niceLen(m) { if (!(m > 0)) return 1; const p = 10 ** Math.floor(Math.log10(m)); for (const k of [1, 2, 5, 10]) if (k * p >= m * 0.6) return k * p; return 10 * p; }

// The dynamic layer at state `st` (lib/replay.mjs stateAt): the bold trail of the last TRAIL_S seconds in band
// colours, the error ring and link, the true vessel along its heading and, where the receiver reported a fix, the
// reported vessel along its course. Nothing is drawn for a position the log does not have.
export function trackDynamic(panel, view, st, { showTruth = true } = {}) {
  const px = view.px, rows = panel.rows, r = st.row, out = [];
  const t = r.t;
  let j = st.i;
  while (j > 0 && rows[j - 1].t >= t - TRAIL_S) j--;
  const trail = rows.slice(j, st.i + 1);
  let seg = [], band = null;
  const flush = () => { if (seg.length > 1) out.push(`<path class="rp-rep ${bandClass(band)}" stroke-width="${(BAND_W[band] || 2) + 1.2}" d="${pathOf(seg)}"/>`); seg = []; };
  for (const q of trail) { if (!q.rep) { flush(); band = null; continue; } if (band != null && q.band !== band) { const keep = seg[seg.length - 1]; flush(); seg = [keep]; } band = q.band; seg.push(px(q.rep)); }
  flush();
  const tp = r.truth ? px(r.truth) : null, rp = r.rep ? px(r.rep) : null;
  if (tp && rp && showTruth) {
    if (r.errM != null) { const ring = ringPx(r.errM, view); if (!ring.tiny) out.push(`<circle class="rp-ring" cx="${f1(tp[0])}" cy="${f1(tp[1])}" r="${f1(ring.r)}"><title>Position error ${f1(r.errM)} m, drawn to scale</title></circle>`); }
    out.push(`<line class="rp-link" x1="${f1(tp[0])}" y1="${f1(tp[1])}" x2="${f1(rp[0])}" y2="${f1(rp[1])}"/>`);
  }
  if (rp) {
    out.push(`<path class="rp-gr ${bandClass(r.band)}" d="${vesselPath(rp[0], rp[1], r.cog ?? 0, 18)}"><title>Where the receiver puts the vessel${r.cog != null ? `, reported course ${f1(r.cog)} degrees` : ""}</title></path>`);
    if (r.cog != null) { const [x, y] = rayEnd(rp[0], rp[1], r.cog, 30); out.push(`<line class="rp-cog ${bandClass(r.band)}" x1="${f1(rp[0])}" y1="${f1(rp[1])}" x2="${f1(x)}" y2="${f1(y)}"/>`); }
  }
  if (tp && showTruth) {
    out.push(`<path class="rp-gt" d="${vesselPath(tp[0], tp[1], r.hdg ?? 0, 22)}"><title>The true position${r.hdg != null ? `, gyro heading ${f1(r.hdg)} degrees` : ""}</title></path>`);
    if (r.hdg != null) { const [x, y] = rayEnd(tp[0], tp[1], r.hdg, 36); out.push(`<line class="rp-hdt" x1="${f1(tp[0])}" y1="${f1(tp[1])}" x2="${f1(x)}" y2="${f1(y)}"/>`); }
  }
  return out.join("");
}

// ---------- the score strip ----------

// The score over the whole run against the shared mission time axis [0, tMax], with the band stripe, the stated
// events and the model's band edges. Empty when the run was not scored.
export function stripStatic(panel, w, tMax) {
  if (!panel.hasScore) return `<text class="rp-t" x="8" y="${STRIP_H / 2}">Not scored: no trust score for this run.</text>`;
  const L = 8, R = w - 8, top = 6, bot = STRIP_H - 26, x = (t) => L + (t / Math.max(1, tMax)) * (R - L), y = (s) => bot - (s / 100) * (bot - top);
  const rows = panel.rows, out = [];
  for (const e of panel.events) if (e.onset != null) out.push(`<rect class="rp-ev" x="${f1(x(e.onset))}" y="${top}" width="${f1(Math.max(2, x(e.end ?? panel.t1) - x(e.onset)))}" height="${bot - top}"><title>${esc(e.label)}</title></rect>`);
  const m = panel.run && panel.run.model;
  for (const edge of m ? [m.nominal_min, m.degraded_min] : []) if (Number.isFinite(edge)) out.push(`<line class="rp-edge" x1="${L}" x2="${R}" y1="${f1(y(edge))}" y2="${f1(y(edge))}"/>`);
  let d = "", pen = false;
  for (const r of rows) { if (r.score == null) { pen = false; continue; } d += `${pen ? "L" : "M"}${f1(x(r.t))} ${f1(y(r.score))}`; pen = true; }
  out.push(`<path class="rp-line" d="${d}"/>`);
  // band stripe
  let a = 0;
  for (let i = 1; i <= rows.length; i++) if (i === rows.length || rows[i].band !== rows[a].band) { const b = rows[a].band || "calibrating", x1 = i < rows.length ? x(rows[i].t) : x(panel.t1); out.push(`<rect class="rp-f-${["calibrating", "nominal", "degraded", "untrusted"].includes(b) ? b : "calibrating"}" x="${f1(x(rows[a].t))}" y="${bot + 6}" width="${f1(Math.max(1, x1 - x(rows[a].t)))}" height="9"><title>${esc(bandLabel(b))} from T+${fmtT(rows[a].t)}</title></rect>`); a = i; }
  out.push(`<line class="rp-edge" x1="${L}" x2="${R}" y1="${bot}" y2="${bot}"/><text class="rp-t" x="${L}" y="${STRIP_H - 2}">0</text><text class="rp-t" x="${R}" y="${STRIP_H - 2}" text-anchor="end">T+${fmtT(tMax)}</text><text class="rp-t" x="${L + 2}" y="${top + 9}">score 100</text>`);
  return out.join("");
}
export function stripDynamic(panel, w, tMax, st) {
  const L = 8, R = w - 8, top = 6, bot = STRIP_H - 26, x = L + (Math.min(st.row.t, tMax) / Math.max(1, tMax)) * (R - L);
  const out = [`<line class="rp-cur" x1="${f1(x)}" x2="${f1(x)}" y1="${top - 2}" y2="${bot + 16}"/>`];
  if (st.row.score != null) out.push(`<circle class="rp-dot" cx="${f1(x)}" cy="${f1(bot - (st.row.score / 100) * (bot - top))}" r="4.5"/>`);
  return out.join("");
}

// ---------- what to say at the cursor ----------

// The words and numbers of a panel at a state, shared by the page's readout and the exported frame.
export function readoutOf(panel, st) {
  const r = st.row;
  const c = st.sky ? skyCounts(st.sky) : null;
  return {
    t: fmtT(r.t), score: r.score == null ? null : Math.round(r.score), band: r.band ? bandLabel(r.band) : null,
    fix: r.fixValid ? "fix reported" : "no fix",
    errM: r.errM, err: r.errM == null ? "none" : `${r.errM < 10 ? r.errM.toFixed(1) : Math.round(r.errM).toLocaleString("en-GB")} m`,
    hdg: r.hdg == null ? "none" : `${f1(r.hdg)}°`, cog: r.cog == null ? "none" : `${f1(r.cog)}°`,
    sky: c ? `${c.heard} of ${c.listed} satellites heard` : "no sky in this log", skyText: skyDescribe(st.sky), ended: st.ended,
    line: `T+${fmtT(r.t)}${r.score != null ? `, score ${Math.round(r.score)} (${bandLabel(r.band)})` : ""}, ${r.fixValid ? "fix" : "no fix"}${r.errM != null ? `, ${r.errM < 10 ? r.errM.toFixed(1) : Math.round(r.errM)} m from true` : ""}`,
  };
}

// ---------- one frame of both panels, as a standalone SVG (the export and the animation) ----------

const GAP = 24, HEAD = 78, SKY = 140, READ = 150;
export const FRAME_W = TRACK * 2 + GAP;
const panelH = (hasStrip) => TRACK + (hasStrip ? STRIP_H + 8 : 0) + READ;
export const FRAME_H = HEAD + panelH(true);

// The parts of the exported file that do not change from frame to frame, for each panel in turn.
export function frameStatic(panels, views, tMax, opts = {}) {
  return panels.map((p, k) => `<g transform="translate(${k * (TRACK + GAP)} ${HEAD})"><text class="rp-tb" x="0" y="-30">${esc(p.title)}</text><text class="rp-ill" x="0" y="-16">${esc(p.kind === "training" ? "Training scenario, synthetic" : "Maritime trust log, synthetic")} · ${esc(p.verdict.scored ? "scored by the engine's receiver-trust" : "not scored")}</text>${trackStatic(p, views[k], { uid: String(k), ...opts })}<g transform="translate(0 ${TRACK + 8})">${stripStatic(p, TRACK, tMax)}</g></g>`).join("");
}

// One frame's changing parts at mission time t: the clock, then each panel's vessel, strip cursor, sky and readout.
export function frameDynamic(panels, views, tMax, t, opts = {}) {
  const out = [`<text class="rp-big" x="${FRAME_W / 2}" y="24" text-anchor="middle">T+${fmtT(t)}</text><text class="rp-ill" x="${FRAME_W - 2}" y="12" text-anchor="end">one mission clock, both runs</text>`];
  panels.forEach((p, k) => {
    const st = stateAt(p, t), ro = readoutOf(p, st), y0 = TRACK + 8 + STRIP_H + 8;
    out.push(`<g transform="translate(${k * (TRACK + GAP)} ${HEAD})">${trackDynamic(p, views[k], st, opts)}<g transform="translate(0 ${TRACK + 8})">${stripDynamic(p, TRACK, tMax, st)}</g>`);
    out.push(`<g transform="translate(0 ${y0})"><text class="rp-big" x="0" y="26">${ro.score == null ? "–" : ro.score}</text><text class="rp-tb" x="64" y="12">${esc(ro.band || "not scored")}${ro.ended ? " · run ended" : ""}</text><text class="rp-t" x="64" y="28">${esc(ro.fix)} · error ${esc(ro.err)}</text>`);
    out.push(`<text class="rp-t" x="0" y="52">heading (gyro) ${esc(ro.hdg)} · reported course ${esc(ro.cog)}</text><text class="rp-t" x="0" y="68">${esc(ro.sky)}</text>`);
    if (st.sky) out.push(`<g transform="translate(${TRACK - SKY} ${-4}) scale(${SKY / 240})">${skyMarkup(st.sky, { size: 240, labels: false })}</g>`);
    out.push("</g></g>");
  });
  return out.join("");
}

// A standalone SVG of one frame (viewBox, theme variables, the rules, a title and a description).
export function frameSvg(panels, views, tMax, t, opts = {}) {
  return svgDoc(panels, `${frameStatic(panels, views, tMax, opts)}${frameDynamic(panels, views, tMax, t, opts)}`);
}
export function svgDoc(panels, body, extra = "") {
  const title = `Bridge replay: ${panels.map((p) => p.title).join(" and ")}`;
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${FRAME_W} ${FRAME_H}" width="${FRAME_W}" height="${FRAME_H}" role="img" aria-labelledby="rp-title rp-desc"><title id="rp-title">${esc(title)}</title><desc id="rp-desc">${esc(panels.map((p) => `${p.title}: ${p.verdict.text}`).join(" "))} Synthetic data, advisory only; the coast is illustration. Kshana is not type-approved navigation equipment.</desc><style>${THEME_CSS}${SVG_CSS}</style><rect class="rp-card" width="${FRAME_W}" height="${FRAME_H}"/>${body}<text class="rp-tb" x="0" y="14">Kshana Studio · Bridge replay</text><text class="rp-ill" x="0" y="${FRAME_H - 6}">Synthetic data. Advisory only: Kshana is not type-approved navigation equipment (IEC 61108, IEC 61162). The coast is illustration.</text>${extra}</svg>`;
}
