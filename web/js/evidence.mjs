// Evidence page (R4, Observatory system).
// Draws the validated-results bento from js/evidence-data.mjs: every value there is the engine's
// own output against an external oracle (src/tools/gen_evidence_data.py). Also: the static
// figures marked data-ev are rewritten from the same data, the verification-matrix legend lights
// one label's cells, and a shared tip reads out any mark under the pointer or the keyboard.
// The ledger and standards filter through site.js ([data-flist]); copy buttons use [data-copy].
// Text is always set with textContent: a tip string marks bold with «…» and new lines with \n.
import D from "./evidence-data.mjs";

const $ = (s, r = document) => r.querySelector(s);
const $$ = (s, r = document) => [...r.querySelectorAll(s)];
const NS = "http://www.w3.org/2000/svg";

// ------------------------------------------------------------------ static figures from the generator
for (const n of $$("[data-ev]")) { const v = D.facts[n.dataset.ev]; if (v != null && v !== "") n.textContent = v; }

// ------------------------------------------------------------------ helpers
function svg(w, h, cls, label) {
  const s = document.createElementNS(NS, "svg");
  s.setAttribute("viewBox", `0 0 ${w} ${h}`); s.setAttribute("width", w); s.setAttribute("height", h);
  s.setAttribute("class", "ev-svg " + (cls || "")); s.setAttribute("role", "img"); s.setAttribute("aria-label", label);
  return s;
}
function el(tag, attrs, parent, text) {
  const e = document.createElementNS(NS, tag);
  for (const k in attrs) if (attrs[k] != null) e.setAttribute(k, attrs[k]);
  if (text != null) e.textContent = text;
  if (parent) parent.appendChild(e);
  return e;
}
function h(tag, cls, parent, text) {
  const e = document.createElement(tag);
  if (cls) e.className = cls;
  if (text != null) e.textContent = text;
  if (parent) parent.appendChild(e);
  return e;
}
function rich(parent, s) {                    // «bold» and \n, through text nodes only
  s.split("\n").forEach((line, i) => {
    if (i) parent.appendChild(document.createElement("br"));
    line.split(/(«[^»]*»)/).forEach((seg) => {
      if (!seg) return;
      if (seg.startsWith("«")) h("b", null, parent, seg.slice(1, -1));
      else parent.appendChild(document.createTextNode(seg));
    });
  });
}
const plain = (s) => s.replace(/[«»]/g, "").replace(/\n/g, ". ");
const L10 = Math.log10;
const logX = (lo, hi, a, b) => (v) => a + (L10(v) - L10(lo)) / (L10(hi) - L10(lo)) * (b - a);
const lin = (lo, hi, a, b) => (v) => a + (v - lo) / (hi - lo) * (b - a);
const clamp = (v, a, b) => Math.max(a, Math.min(b, v));
const mix = (p, hi = "--amber", lo = "--cyan") => `color-mix(in oklab,var(${hi}) ${Math.round(clamp(p, 0, 1) * 100)}%,var(${lo}))`;
function len(m) {                             // a length from metres, in the unit that reads best
  const a = Math.abs(m);
  if (a === 0) return "0 m";
  if (a < 1e-6) return `${+(m * 1e9).toPrecision(3)} nm`;
  if (a < 1e-3) return `${+(m * 1e6).toPrecision(3)} µm`;
  if (a < 0.01) return `${+(m * 1e3).toPrecision(3)} mm`;
  return `${+m.toPrecision(a < 1 ? 2 : 3)} m`;
}
const fmtInt = (n) => n.toLocaleString("en-GB");
const SUP = "⁰¹²³⁴⁵⁶⁷⁸⁹";
function sci(x) {
  if (x === 0) return "0";
  const e = Math.floor(L10(Math.abs(x))), m = +(x / 10 ** e).toFixed(2);
  if (e >= -2 && e <= 3) return String(+x.toPrecision(3));
  return `${m}×10${e < 0 ? "⁻" : ""}${String(Math.abs(e)).split("").map((c) => SUP[+c]).join("")}`;
}
function pathOf(pts) { return pts.map((p, i) => (i ? "L" : "M") + p[0].toFixed(1) + " " + p[1].toFixed(1)).join(""); }
function stats(host, items) {
  const p = h("p", "ev-stats", host);
  for (const [b, t] of items) { const s = h("span", null, p); h("b", null, s, b); s.appendChild(document.createTextNode(" " + t)); }
}
function legend(host, items) {
  const p = h("p", "ev-lgd", host);
  for (const [cls, t, shape] of items) { const s = h("span", null, p); h("i", cls + (shape ? " " + shape : ""), s); s.appendChild(document.createTextNode(t)); }
}

// ------------------------------------------------------------------ the shared tip (pointer, touch and keyboard)
const tip = $("#evTip"), live = $("#evLive");
let tipFor = null;
function showTip(mark, x, y) {
  tip.replaceChildren();
  rich(tip, mark.getAttribute("data-tip"));
  tip.classList.add("on");
  const r = tip.getBoundingClientRect();
  let left = x + 14, top = y + 16;
  if (left + r.width > innerWidth - 8) left = Math.max(8, x - r.width - 14);
  if (top + r.height > innerHeight - 8) top = Math.max(8, y - r.height - 14);
  tip.style.left = left + "px"; tip.style.top = top + "px";
}
function mark(m) { if (tipFor && tipFor !== m) tipFor.classList.remove("hl"); tipFor = m; if (m) m.classList.add("hl"); }
function hideTip() { tip.classList.remove("on"); mark(null); }
function wireMarks(host) {
  host.tabIndex = 0;
  host.setAttribute("aria-describedby", "evLive");
  let k = -1;
  const at = (e) => { const m = e.target.closest && e.target.closest("[data-tip]"); return m && host.contains(m) ? m : null; };
  host.addEventListener("pointermove", (e) => { const m = at(e); if (m) { mark(m); showTip(m, e.clientX, e.clientY); } else hideTip(); });
  host.addEventListener("pointerdown", (e) => { const m = at(e); if (m) { mark(m); showTip(m, e.clientX, e.clientY); } });
  host.addEventListener("pointerleave", hideTip);
  host.addEventListener("blur", hideTip);
  host.addEventListener("keydown", (e) => {
    const ms = $$("[data-tip]", host);
    if (!ms.length) return;
    if (e.key === "Escape") { hideTip(); return; }
    const step = { ArrowRight: 1, ArrowDown: 1, ArrowLeft: -1, ArrowUp: -1 }[e.key];
    if (step == null && e.key !== "Home" && e.key !== "End") return;
    e.preventDefault();
    k = e.key === "Home" ? 0 : e.key === "End" ? ms.length - 1 : (k + step + ms.length) % ms.length;
    const m = ms[k], b = m.getBoundingClientRect();
    mark(m);
    showTip(m, b.left + b.width / 2, b.top + b.height / 2);
    live.textContent = plain(m.getAttribute("data-tip"));
  });
}
addEventListener("scroll", () => { if (tip.classList.contains("on") && !(document.activeElement && document.activeElement.classList.contains("ev-vis"))) hideTip(); }, { passive: true });

// ------------------------------------------------------------------ 1 · SGP4: one square per compared vector
function drawSgp4(host, W, E = 0) {
  const S = D.sgp4, lo = 1e-7, tol = S.tol_m;          // the test's position tolerance, metres
  let cols = Math.max(24, Math.min(60, Math.floor(W / (W < 520 ? 11 : 15))));
  if (E > 0) {                                          // spare height in the row: larger cells, fewer columns
    const want = (W / cols) * Math.ceil(S.n / cols) + E;
    for (let c = cols; c >= 20; c--) { if ((W / c) * Math.ceil(S.n / c) > want || W / c > 26) break; cols = c; }
  }
  const cell = W / cols, rows = Math.ceil(S.n / cols), pos = [];
  const c = logX(lo, tol, 0, 1);
  const s = svg(W, rows * cell, "sg", `${S.n} of ${S.n} AIAA vectors reproduced; worst ${len(S.worst_m)}, median ${len(S.median_m)}, all inside the ${len(tol)} tolerance`);
  let i = 0;
  for (const [sat, deep, errs] of S.cells) errs.forEach((e, j) => {
    const x = (i % cols) * cell, y = Math.floor(i / cols) * cell, g = cell - 2;
    pos.push([x, y, sat, deep, e, j + 1, errs.length]);
    el("rect", { x: (x + 1).toFixed(1), y: (y + 1).toFixed(1), width: g.toFixed(1), height: g.toFixed(1), rx: deep ? (g / 2).toFixed(1) : 1.6,
      class: "ev-c", style: `fill:${mix(c(Math.max(e, lo)))};--d:${Math.round(i * 1.4)}ms`,
      "data-tip": `«Satellite ${sat}» · ${deep ? "deep space (SDP4)" : "near Earth (SGP4)"}\nvector ${j + 1} of ${errs.length} · position error «${len(e)}»` }, s);
    i++;
  });
  const cur = el("rect", { width: cell + 1, height: cell + 1, rx: 3, class: "ev-focus-box", "aria-hidden": "true" }, s);
  host.appendChild(s);
  const sc = svg(W, 38, "ev-scale", "Colour scale from 0.1 micrometre to the tolerance, logarithmic");
  const gr = el("linearGradient", { id: "sgGrad" }, el("defs", {}, sc));
  el("stop", { offset: "0", style: `stop-color:${mix(0)}` }, gr); el("stop", { offset: "1", style: `stop-color:${mix(1)}` }, gr);
  el("rect", { x: 0, y: 8, width: W, height: 8, rx: 4, fill: "url(#sgGrad)" }, sc);
  const X = logX(lo, tol, 0, W), ticks = [[1e-6, "1 µm"], [1e-5, "10 µm"], [1e-4, "0.1 mm"], [1e-3, "1 mm"], [tol, `tolerance ${len(tol)}`]];
  // labels right to left from the tolerance, each kept only if it clears the one after it
  let limit = W + 1;
  ticks.slice().reverse().forEach(([v, t], r) => {
    const x = X(v), last = r === 0, w = t.length * 6.3, x0 = last ? x - w : x - w / 2, x1 = last ? x : x + w / 2;
    el("line", { x1: x, x2: x, y1: 6, y2: 18, class: "ev-tick" }, sc);
    if ((last ? x1 <= limit : x1 + 8 <= limit) && x0 >= 0) { el("text", { x, y: 32, "text-anchor": last ? "end" : "middle" }, sc, t); limit = x0; }
  });
  for (const v of [S.median_m, S.worst_m]) { const x = X(v); el("path", { d: `M${x - 4} 0L${x + 4} 0L${x} 7Z`, class: "ev-mk" }, sc); }
  host.appendChild(sc);
  legend(host, [["sq", "near-Earth vector (SGP4)"], ["ci", "deep-space vector (SDP4)"], ["tri", "median and worst on the scale"]]);
  stats(host, [[fmtInt(S.sats), "test satellites"], [fmtInt(S.deep_rows), "deep-space vectors"], [len(S.median_m), "median"], [len(S.worst_m), "worst"]]);
  return { dur: 14000, at(t) {
    const [x, y, sat, deep, e, j, nj] = pos[Math.min(pos.length - 1, Math.floor(t * pos.length))];
    cur.setAttribute("x", (x + 0.5).toFixed(1)); cur.setAttribute("y", (y + 0.5).toFixed(1));
    return `vector ${Math.min(pos.length, Math.floor(t * pos.length) + 1)} of ${S.n} · satellite ${sat}${deep ? ", deep space" : ""} · error ${len(e)}`;
  } };
}

// ------------------------------------------------------------------ 2 · RAIM: one square per SciPy case, by kernel
const KERNEL = { chi2_cdf: "chi-squared distribution", chi2_quantile: "chi-squared quantile", normal_cdf: "normal distribution", normal_quantile: "normal quantile", noncentral_chi2_cdf: "non-central chi-squared", pbias: "detection bias" };
function drawRaim(host, W, E = 0) {
  const R = D.raim, groups = R.kernels.map((k) => [k, R.cells.filter((c) => c[0] === k)]);
  const cell = 13, gap = 2, head = 18, perRow = Math.max(8, Math.floor((W + gap) / (cell + gap)));
  let y = 0; const lanes = [];
  for (const [k, cs] of groups) { lanes.push([k, cs, y]); y += head + Math.ceil(cs.length / perRow) * (cell + gap) + 8; }
  const s = svg(W, y, "rm", `${R.pass} of ${R.n} SciPy cases inside their tolerance band, across ${groups.length} kernels`);
  const C = (f) => (f <= 0 ? 0 : clamp((L10(f) + 11) / 11, 0, 1));
  let i = 0; const pos = [];
  for (const [k, cs, y0] of lanes) {
    el("text", { x: 0, y: y0 + 11, class: "ev-lab" }, s, `${KERNEL[k]} · ${cs.length}`);
    cs.forEach(([, f], j) => {
      pos.push([(j % perRow) * (cell + gap), y0 + head + Math.floor(j / perRow) * (cell + gap), k, f]);
      el("rect", { x: (j % perRow) * (cell + gap), y: y0 + head + Math.floor(j / perRow) * (cell + gap), width: cell, height: cell, rx: 2, class: "ev-c",
        style: `fill:${mix(C(f), "--coral", "--magenta")};--d:${i++ * 5}ms`,
        "data-tip": `«${KERNEL[k]}» · case ${j + 1} of ${cs.length}\n${f === 0 ? "«exact match» with SciPy" : `uses «${sci(f * 100)} %» of its tolerance band`}` }, s);
    });
  }
  const cur = el("rect", { width: cell + 3, height: cell + 3, rx: 3, class: "ev-focus-box", "aria-hidden": "true" }, s);
  host.appendChild(s);
  const mx = Math.max(...R.cells.map((c) => c[1]));
  // the colour key is the same logarithmic ramp the squares use, from an exact match to the band's edge
  const sc = svg(W, 38, "ev-scale", "Colour scale: share of the tolerance band used, logarithmic from 10 to the minus 11 to the band's edge");
  const gr = el("linearGradient", { id: "rmGrad" }, el("defs", {}, sc));
  el("stop", { offset: "0", style: `stop-color:${mix(0, "--coral", "--magenta")}` }, gr); el("stop", { offset: "1", style: `stop-color:${mix(1, "--coral", "--magenta")}` }, gr);
  el("rect", { x: 0, y: 8, width: W, height: 8, rx: 4, fill: "url(#rmGrad)" }, sc);
  const XR = (f) => C(f) * W, rt = [[1e-11, "exact"], [1e-8, "10⁻⁶ %"], [1e-4, "0.01 %"], [1, "band edge"]];
  rt.forEach(([v, t], r) => { const x = XR(v), end = r === rt.length - 1, st = r === 0;
    el("line", { x1: x, x2: x, y1: 6, y2: 18, class: "ev-tick" }, sc);
    if (W >= 300 || st || end) el("text", { x, y: 32, "text-anchor": end ? "end" : st ? "start" : "middle" }, sc, t); });
  { const x = XR(mx); el("path", { d: `M${x - 4} 0L${x + 4} 0L${x} 7Z`, class: "ev-mk" }, sc); }
  host.appendChild(sc);
  legend(host, [["tri", "the most of a band any case uses"]]);
  stats(host, [[`${R.pass} of ${R.n}`, "inside the band"], [`${sci(mx * 100)} %`, "most of a band used"]]);
  return { dur: 9000, at(t) {
    const q = Math.min(pos.length - 1, Math.floor(t * pos.length)), [x, y, k, f] = pos[q];
    cur.setAttribute("x", x - 1.5); cur.setAttribute("y", y - 1.5);
    return `case ${q + 1} of ${R.n} · ${KERNEL[k]} · ${f === 0 ? "exact" : sci(f * 100) + " % of band"}`;
  } };
}

// ------------------------------------------------------------------ 3 · Cowell against Orekit: |Δr| against time, per force tier
function drawCowell(host, W, E = 0) {
  const C = D.cowell, H = Math.round(clamp(W * 0.62, 190, 250) + Math.min(E, 200)), m = { l: 44, r: 8, t: 10, b: 26 };
  const X = lin(0, 24, m.l, W - m.r), Y = logX(1e-4, 2e3, H - m.b, m.t);
  const s = svg(W, H, "cw", `Position difference against Orekit over 24 hours: force tiers 1 to 5 stay under ${len(C.worst_conservative_m)}; the drag tier reaches ${len(C.t6_worst_m)}, a characterisation band`);
  for (const [v, t] of [[1e-3, "1 mm"], [1e-1, "10 cm"], [10, "10 m"], [1e3, "1 km"]]) {
    el("line", { x1: m.l, x2: W - m.r, y1: Y(v), y2: Y(v), class: "ev-grid" }, s);
    el("text", { x: m.l - 6, y: Y(v) + 3, "text-anchor": "end" }, s, t);
  }
  for (const hr of [0, 6, 12, 18, 24]) el("text", { x: X(hr), y: H - 8, "text-anchor": "middle" }, s, hr + " h");
  const tl = C.tol_m.T1;
  el("line", { x1: m.l, x2: W - m.r, y1: Y(tl), y2: Y(tl), class: "ev-thr" }, s);
  el("text", { x: W - m.r, y: Y(tl) - 5, "text-anchor": "end", class: "ev-thr-t" }, s, `tolerance ${len(tl)}`);
  C.series.forEach((sr, k) => {
    const pts = sr.t_h.map((t, j) => [t, sr.err_m[j]]).filter((p) => p[1] > 0), drag = sr.tier === "T6";
    el("path", { d: pathOf(pts.map(([t, e]) => [X(t), Y(clamp(e, 1e-4, 2e3))])), class: "ev-line " + (drag ? "cw-drag" : "cw-con"), pathLength: 1, style: `--d:${k * 90}ms` }, s);
    const w = pts.reduce((a, b) => (b[1] > a[1] ? b : a));
    el("circle", { cx: X(w[0]), cy: Y(w[1]), r: 3.4, class: "ev-dot " + (drag ? "cw-drag-d" : "cw-con-d"), style: `--d:${k * 90}ms`,
      "data-tip": `«Tier ${sr.tier.slice(1)}: ${sr.label}» · ${sr.regime === "GTO" ? "geostationary transfer orbit" : "low Earth orbit"}\nworst difference «${len(w[1])}» at ${w[0]} h` }, s);
  });
  const cg = el("g", { class: "ev-cur", "aria-hidden": "true" }, s), cl = el("line", { y1: m.t, y2: H - m.b, class: "ev-focus-l" }, cg);
  const cdA = el("circle", { r: 4, class: "ev-focus-d cw-con-d" }, cg), cdB = el("circle", { r: 4, class: "ev-focus-d cw-drag-d" }, cg);
  const at = (sr, tt) => { let b = 0; sr.t_h.forEach((t, j) => { if (Math.abs(t - tt) < Math.abs(sr.t_h[b] - tt)) b = j; }); return sr.err_m[b]; };
  host.appendChild(s);
  legend(host, [["cw-con", "tiers 1 to 5, two-body up to solar radiation pressure, two orbits each"], ["cw-drag", "tier 6, drag: characterisation only (different density models)", "dash"]]);
  stats(host, [[fmtInt(C.epochs_conservative), "epochs in tiers 1 to 5"], [len(C.worst_conservative_m), "worst"], [len(C.t6_worst_m), "drag tier, worst"]]);
  return { dur: 10000, at(t) {
    const tt = t * 24, x = X(tt);
    const con = Math.max(...C.series.filter((r) => r.tier !== "T6").map((r) => at(r, tt))), dr = C.series.filter((r) => r.tier === "T6").map((r) => at(r, tt));
    const drag = dr.length ? Math.max(...dr) : 0;
    cl.setAttribute("x1", x); cl.setAttribute("x2", x);
    cdA.setAttribute("cx", x); cdA.setAttribute("cy", Y(clamp(con, 1e-4, 2e3)));
    cdB.setAttribute("cx", x); cdB.setAttribute("cy", Y(clamp(drag || 1e-4, 1e-4, 2e3))); cdB.style.display = drag ? "" : "none";
    return `${tt.toFixed(1)} h · tiers 1 to 5 worst ${len(con)} · drag ${len(drag)}`;
  } };
}

// ------------------------------------------------------------------ 4 · every orbit residual on one logarithmic scale
function drawLadder(host, W, E = 0) {
  const O = D.orbits, bar = O.bar_m, by = (set, f) => O.rows.find((r) => r.set === set && f(r.run));
  const g8a = by("Galileo E11", (r) => r.startsWith("CI") && r.includes("Tier 1")), g8b = by("Galileo E11", (r) => r.includes("Tier 2"));
  const g24 = by("Galileo E11", (r) => r.startsWith("Full-arc"));
  const swd = by("Swarm-A", (r) => r.includes("dynamic (")), swr = by("Swarm-A", (r) => r.includes("reduced-dynamic"));
  const lrd = by("LRO", (r) => r.includes("dynamic (")), lrr = by("LRO", (r) => r.includes("reduced-dynamic"));
  const rt = (r) => `${r.arc} arc · degree and order ${r.do} · ${r.n} observations\nradial ${r.rtn_m[0]} m · along-track ${r.rtn_m[1]} m · cross-track ${r.rtn_m[2]} m`;
  const lanes = [
    ["SGP4 against the AIAA vectors, worst", [[D.sgp4.worst_m, 1, `«SGP4 · worst of ${D.sgp4.n} vectors» · ${len(D.sgp4.worst_m)}`]]],
    ["Cowell against Orekit 12.2, worst", [[D.cowell.worst_conservative_m, 1, `«Cowell · worst of ${D.cowell.epochs_conservative} epochs» · ${len(D.cowell.worst_conservative_m)}`]]],
    ["Galileo E11, 8-hour fit", [[g8a.rms_m, 0, `«Galileo E11 · force model only» · ${g8a.rms_m} m\n${rt(g8a)}`], [g8b.rms_m, 1, `«Galileo E11 · with empirical accelerations» · ${g8b.rms_m} m\n${rt(g8b)}`]]],
    ["Galileo E11, 24-hour fit", [[g24.rms_m, 1, `«Galileo E11 · a full day» · ${g24.rms_m} m\n${rt(g24)}`]]],
    ["Swarm-A, 3-hour fit", [[swd.rms_m, 0, `«Swarm-A · dynamic» · ${swd.rms_m} m, almost all along-track (drag)\n${rt(swd)}`], [swr.rms_m, 1, `«Swarm-A · reduced-dynamic» · ${swr.rms_m} m\n${rt(swr)}`]]],
    ["Lunar Reconnaissance Orbiter, 4-hour fit", [[lrd.rms_m, 0, `«Lunar orbiter · dynamic» · ${lrd.rms_m} m\n${rt(lrd)}`], [lrr.rms_m, 1, `«Lunar orbiter · reduced-dynamic» · ${lrr.rms_m} m, above the ${bar} m bar and reported as it is\n${rt(lrr)}`]], 1],
  ];
  const wide = W >= 640, labW = wide ? Math.min(272, Math.round(W * 0.36)) : 0, laneH = (wide ? 32 : 54) + (wide ? Math.min(16, Math.floor(E / 6)) : 0), top = 8, axH = 26, right = W - 14;
  const H = top + lanes.length * laneH + axH;
  const X = logX(1e-3, 20, labW + 8, right);
  const s = svg(W, H, "ld", `Orbit residuals from ${len(D.sgp4.worst_m)} to ${lrr.rms_m} m on one logarithmic scale, with the ${bar} m agency bar`);
  const mk = el("marker", { id: "ldArr", viewBox: "0 0 8 8", refX: 7, refY: 4, markerWidth: 6, markerHeight: 6, orient: "auto" }, el("defs", {}, s));
  el("path", { d: "M0 0L8 4L0 8Z", class: "ld-arrh" }, mk);
  const yb = top + lanes.length * laneH;
  el("rect", { x: X(bar), y: top - 4, width: right - X(bar), height: yb - top + 4, class: "ld-over" }, s);
  for (const [v, t] of [[1e-3, "1 mm"], [1e-2, "1 cm"], [1e-1, "10 cm"], [1, "1 m"], [10, "10 m"]]) {
    el("line", { x1: X(v), x2: X(v), y1: top - 4, y2: yb, class: "ev-grid" }, s);
    el("text", { x: X(v), y: H - 8, "text-anchor": "middle" }, s, t);
  }
  el("line", { x1: X(bar), x2: X(bar), y1: top - 4, y2: yb, class: "ev-thr" }, s);
  if (wide) el("text", { x: X(bar) - 5, y: top + 6, "text-anchor": "end", class: "ev-thr-t" }, s, `agency bar ${bar} m`);
  lanes.forEach(([lab, pts, over], k) => {
    const y0 = top + k * laneH, cy = wide ? y0 + laneH / 2 : y0 + 30;
    el("text", { x: 0, y: wide ? cy + 3.5 : y0 + 13, class: "ev-lab" + (over ? " ev-lab-over" : "") }, s, lab);
    el("line", { x1: labW + 8, x2: right, y1: cy, y2: cy, class: "ld-track" }, s);
    if (pts.length > 1) { const a = X(pts[0][0]), b = X(pts[1][0]); el("path", { d: `M${a + (b < a ? -6 : 6)} ${cy}L${b + (b < a ? 7 : -7)} ${cy}`, class: "ld-arrow", "marker-end": "url(#ldArr)" }, s); }
    pts.forEach(([v, main, t], j) => {
      const x = X(v), g = el("g", { class: "ld-pt", style: `--d:${k * 110 + j * 60}ms`, "data-tip": t }, s);
      el("circle", { cx: x, cy, r: main ? 5.5 : 4.5, class: main ? (over ? "ld-dot over" : "ld-dot") : "ld-ring" }, g);
      if (main) { const end = x > right - 64; el("text", { x: wide ? x + (end ? -9 : 9) : x, y: wide ? cy - 8 : cy + 17, "text-anchor": wide ? (end ? "end" : "start") : "middle", class: "ld-val" }, g, len(v)); }
    });
  });
  const heads = lanes.map(([lab, pts]) => [lab, pts.find((p) => p[1])[0]]), lg = el("g", { class: "ev-cur", "aria-hidden": "true" }, s);
  // wide: one line across the plot; narrow: a short tick on each lane's track, clear of the lane labels above it
  if (wide) el("line", { x1: 0, x2: 0, y1: top - 4, y2: yb, class: "ev-focus-l" }, lg);
  else lanes.forEach((_, k) => { const cy = top + k * laneH + 30; el("line", { x1: 0, x2: 0, y1: cy - 9, y2: cy + 9, class: "ev-focus-l" }, lg); });
  s.insertBefore(lg, s.querySelector(".ev-lab"));      // the cursor passes under the labels, marks and values
  host.appendChild(s);
  legend(host, [["ld-dot", "headline residual"], ["ld-ring", "force model alone, before empirical accelerations", "ring"], ["ld-over", `beyond the ${bar} m agency bar`]]);
  return { dur: 9000, at(t) {
    const v = 10 ** (L10(1e-3) + t * (L10(20) - L10(1e-3))), x = X(v);
    lg.setAttribute("transform", `translate(${x.toFixed(1)} 0)`);
    let n = 0; heads.forEach(([, hv]) => { if (hv <= v) n++; });
    return `sweep at ${len(v)} · ${n} of ${heads.length} headline residuals at or under it`;
  } };
}

// ------------------------------------------------------------------ 5 · Allan family on the NIST SP 1065 data set
const EST = [["oadev", "overlapping Allan deviation", "a1"], ["mdev", "modified Allan deviation", "a2"], ["tdev", "time deviation, in seconds", "a3"], ["ohdev", "overlapping Hadamard deviation", "a4"]];
function drawAllan(host, W, E = 0) {
  const A = D.allan, H = Math.round(clamp(W * 0.5, 200, 260) + Math.min(E, 200)), m = { l: 44, r: 10, t: 10, b: 26 };
  const all = Object.values(A.curves).flat().filter((v) => v > 0);
  const ylo = 10 ** Math.floor(L10(Math.min(...all))), yhi = 10 ** Math.ceil(L10(Math.max(...all)));
  const X = logX(1, 400, m.l, W - m.r), Y = logX(ylo, yhi, H - m.b, m.t);
  const s = svg(W, H, "al", `Four deviations of the NIST SP 1065 1000-point data set against averaging time; all ${D.facts.allan_n} published values reproduced, worst relative error ${sci(A.worst_rel)}`);
  for (let v = ylo; v <= yhi * 1.001; v *= 10) { el("line", { x1: m.l, x2: W - m.r, y1: Y(v), y2: Y(v), class: "ev-grid" }, s); el("text", { x: m.l - 6, y: Y(v) + 3, "text-anchor": "end" }, s, String(+v.toPrecision(1))); }
  for (const v of [1, 10, 100]) { el("line", { x1: X(v), x2: X(v), y1: m.t, y2: H - m.b, class: "ev-grid" }, s); el("text", { x: X(v), y: H - 8, "text-anchor": "middle" }, s, v + " s"); }
  EST.forEach(([k, , cls], i) => {
    const pts = A.m.map((mm, j) => [mm, A.curves[k][j]]).filter((p) => p[1] != null);
    el("path", { d: pathOf(pts.map(([x, y]) => [X(x), Y(y)])), class: "ev-line al-" + cls, pathLength: 1, style: `--d:${i * 150}ms` }, s);
  });
  EST.forEach(([k, name, cls], i) => A.ref[k].forEach(([mm, want, got]) => {
    el("circle", { cx: X(mm), cy: Y(want), r: 5.5, class: "al-ref al-r" + cls, style: `--d:${600 + i * 120}ms`,
      "data-tip": `«${name}» at ${mm} s\nSP 1065 Table 31: «${want}»\nengine: «${+got.toPrecision(9)}» · relative error ${sci(Math.abs(got - want) / want)}` }, s);
  }));
  const ag = el("g", { class: "ev-cur", "aria-hidden": "true" }, s), al = el("line", { y1: m.t, y2: H - m.b, class: "ev-focus-l" }, ag);
  const ad = EST.map(([, , cls]) => el("circle", { r: 3.6, class: "ev-focus-d al-d" + cls }, ag));
  const interp = (k, tau) => {                       // log-log between the two nearest averaging times
    const ms = A.m, c = A.curves[k]; let j = 0; while (j < ms.length - 2 && ms[j + 1] < tau) j++;
    if (c[j] == null || c[j + 1] == null) return null;
    const f = (L10(tau) - L10(ms[j])) / (L10(ms[j + 1]) - L10(ms[j]));
    return 10 ** (L10(c[j]) + clamp(f, 0, 1) * (L10(c[j + 1]) - L10(c[j])));
  };
  const tmax = A.m[A.m.length - 1];
  host.appendChild(s);
  legend(host, EST.map(([, n, c]) => ["al-" + c, n, "dash"]).concat([["al-rr", "published value, SP 1065 Table 31", "ring"]]));
  stats(host, [[`${D.facts.allan_n} of ${D.facts.allan_n}`, "published values reproduced"], [sci(A.worst_rel), "worst relative error"], [sci(A.tol), "the test's gate"]]);
  return { dur: 10000, at(t) {
    const tau = 10 ** (t * L10(tmax)), x = X(tau), v = {};
    al.setAttribute("x1", x); al.setAttribute("x2", x);
    EST.forEach(([k], i) => { v[k] = interp(k, tau); ad[i].setAttribute("cx", x); ad[i].setAttribute("cy", v[k] ? Y(v[k]) : -99); });
    const f = (x) => (x == null ? "n/a" : x.toPrecision(2));
    return `${tau < 10 ? tau.toFixed(1) : Math.round(tau)} s · Allan ${f(v.oadev)} · modified ${f(v.mdev)} · Hadamard ${f(v.ohdev)}`;
  } };
}

// ------------------------------------------------------------------ 6 · holdover: measured against predicted, and the ratio window
function drawHold(host, W, E = 0) {
  const Hd = D.holdover;
  if (!Hd) { h("p", "ev-nojs", host, "The measured record was not available when this page was generated."); return; }
  const H = Math.round(clamp(W * 0.46, 180, 240) + Math.min(E, 200)), m = { l: 38, r: 10, t: 10, b: 26 };
  const tmax = Hd.measured[Hd.measured.length - 1][0];
  const ymax = Math.ceil(Math.max(...Hd.measured.map((p) => p[1]), ...Hd.predicted.map((p) => p[1])));
  const X = lin(0, tmax / 3600, m.l, W - m.r), Y = lin(0, ymax, H - m.b, m.t);
  const s = svg(W, H, "ho", `Measured root-mean-square time error of the caesium clock against coast time, with the engine's prediction; predicted over measured breach from ${Hd.lo} to ${Hd.hi}`);
  for (let v = 0; v <= ymax; v++) { el("line", { x1: m.l, x2: W - m.r, y1: Y(v), y2: Y(v), class: "ev-grid" }, s); el("text", { x: m.l - 6, y: Y(v) + 3, "text-anchor": "end" }, s, v + " ns"); }
  for (let hr = 0; hr <= tmax / 3600; hr += 6) el("text", { x: X(hr), y: H - 8, "text-anchor": "middle" }, s, hr + " h");
  el("path", { d: pathOf(Hd.measured.map(([t, v]) => [X(t / 3600), Y(v)])), class: "ev-line ho-meas", pathLength: 1 }, s);
  el("path", { d: pathOf(Hd.predicted.map(([t, v]) => [X(t / 3600), Y(v)])), class: "ev-line ho-pred", pathLength: 1, style: "--d:200ms" }, s);
  Hd.rows.forEach((r, i) => {
    const y = Y(r.thr_ns), xp = X(r.predicted_s / 3600), xm = X(r.measured_s / 3600);
    const g = el("g", { class: "ho-row", style: `--d:${900 + i * 90}ms`, "data-tip": `«Time error ${r.thr_ns} ns»\npredicted breach ${fmtInt(Math.round(r.predicted_s))} s · measured ${fmtInt(Math.round(r.measured_s))} s\npredicted over measured «${r.ratio}»` }, s);
    el("line", { x1: Math.min(xp, xm), x2: Math.max(xp, xm), y1: y, y2: y, class: "ho-join" }, g);
    el("circle", { cx: xm, cy: y, r: 4, class: "ho-m" }, g);
    el("circle", { cx: xp, cy: y, r: 5.5, class: "ho-p" }, g);
  });
  const hg = el("g", { class: "ev-cur", "aria-hidden": "true" }, s), hl = el("line", { y1: m.t, y2: H - m.b, class: "ev-focus-l" }, hg);
  const hdM = el("circle", { r: 4, class: "ev-focus-d ho-m" }, hg), hdP = el("circle", { r: 4, class: "ev-focus-d ho-pd" }, hg);
  const near = (arr, t) => { let lo = 0, hi = arr.length - 1; while (hi - lo > 1) { const md = (lo + hi) >> 1; if (arr[md][0] < t) lo = md; else hi = md; } return arr[hi][1]; };
  host.appendChild(s);
  legend(host, [["ho-meas", "measured on the held-out record (dot: breach)"], ["ho-pred", "predicted from the first third (ring: breach)", "dash"]]);
  const bar = Hd.bar, x = logX(1 / 2, 2, 14, W - 14);
  const r = svg(W, 54, "hr", `Predicted over measured for ${Hd.rows.length} thresholds, all inside the accepted factor of ${bar}`);
  el("rect", { x: x(1 / bar), y: 15, width: x(bar) - x(1 / bar), height: 14, rx: 7, class: "hr-acc" }, r);
  el("line", { x1: 14, x2: W - 14, y1: 22, y2: 22, class: "ld-track" }, r);
  el("line", { x1: x(1), x2: x(1), y1: 13, y2: 35, class: "hr-one" }, r);
  el("text", { x: x(1 / bar) + 6, y: 10, class: "hr-accl" }, r, `accepted: within a factor of ${bar}`);
  Hd.rows.forEach((row, i) => el("circle", { cx: x(row.ratio), cy: 22, r: 5, class: "hr-d", style: `--d:${1200 + i * 80}ms`, "data-tip": `«${row.thr_ns} ns» · predicted over measured «${row.ratio}»` }, r));
  for (const [v, t] of [[1 / bar, "÷ " + bar], [1, "1 = perfect"], [bar, "× " + bar]]) el("text", { x: x(v), y: 48, "text-anchor": "middle" }, r, t);
  host.appendChild(r);
  const off = 1 / Hd.naive_ratio, p10 = 10 ** Math.floor(L10(off));
  const note = h("p", "ev-ctl", host);
  rich(note, `«Control:» the naive prediction (the one-second stability read as white frequency noise) gives a ratio of ${sci(Hd.naive_ratio)}, off by a factor of about ${fmtInt(Math.round(off / p10) * p10)}, and fails the same bar. The bar has teeth.`);
  stats(host, [[fmtInt(Hd.samples), "one-second samples"], [fmtInt(Hd.fit), "used for the fit"], [fmtInt(Hd.syncs), "held-out sync points"]]);
  return { dur: 11000, at(t) {
    const ts = Math.max(Hd.measured[0][0], Hd.predicted[0][0], t * tmax), x = X(ts / 3600), vm = near(Hd.measured, ts), vp = near(Hd.predicted, ts);
    hl.setAttribute("x1", x); hl.setAttribute("x2", x);
    hdM.setAttribute("cx", x); hdM.setAttribute("cy", Y(vm)); hdP.setAttribute("cx", x); hdP.setAttribute("cy", Y(vp));
    return `coast ${(ts / 3600).toFixed(1)} h · measured ${vm.toFixed(2)} ns · predicted ${vp.toFixed(2)} ns`;
  } };
}

// ------------------------------------------------------------------ mount, redraw at the real width, fill the row
// Each visual is drawn at its natural height first; a tile shorter than its row neighbour then
// gets the spare height as a taller chart (larger SGP4 cells, wider ladder lanes), so no tile
// carries an empty band above its visual. Each draw returns a replay: a cursor that walks the
// real compared values while the tile is on screen (a still frame under reduced motion).
const DRAW = { sgp4: drawSgp4, raim: drawRaim, cowell: drawCowell, ladder: drawLadder, allan: drawAllan, hold: drawHold };
const RM = matchMedia("(prefers-reduced-motion: reduce)");
const vis = $$(".ev-vis[data-vis]");
function render(v, E) {
  const W = Math.floor(v.clientWidth);
  if (!W) return;
  v._e = E;
  v.replaceChildren();
  const ro = h("p", "ev-read"); ro.setAttribute("aria-hidden", "true"); h("i", null, ro); v._rt = h("span", null, ro);
  v.appendChild(ro);
  v._scan = DRAW[v.dataset.vis](v, W, E) || null;
  v._t = v._t || 0;
  tick1(v, RM.matches ? 0.5 : v._t);
}
function spare(v) {                                 // the empty band the auto margin opened above a visual
  const p = v.previousElementSibling;
  return p ? Math.max(0, Math.floor(v.getBoundingClientRect().top - p.getBoundingClientRect().bottom - 18)) : 0;
}
let bw = -1;
function layout(force) {
  const b = $("#evBento"), W = b ? Math.floor(b.clientWidth) : 0;
  if (!W || (!force && W === bw)) return;
  bw = W;
  vis.forEach((v) => render(v, 0));
  const extra = vis.map(spare);
  vis.forEach((v, i) => { if (extra[i] > 12) render(v, Math.min(extra[i], 320)); });
}
function tick1(v, t) { if (v._scan && v._rt) v._rt.textContent = v._scan.at(t); }
layout(true);
for (const v of vis) wireMarks(v);
if ("ResizeObserver" in window) {
  let raf = 0;
  new ResizeObserver(() => { cancelAnimationFrame(raf); raf = requestAnimationFrame(() => layout(false)); }).observe($("#evBento"));
}
if (document.fonts && document.fonts.ready) document.fonts.ready.then(() => layout(true));

// the replay loop: only tiles on screen and revealed, paused while a pointer or focus is on the visual
const onScreen = new Set();
if ("IntersectionObserver" in window) {
  const io = new IntersectionObserver((es) => es.forEach((e) => (e.isIntersecting ? onScreen.add(e.target) : onScreen.delete(e.target))), { rootMargin: "40px" });
  vis.forEach((v) => io.observe(v));
} else vis.forEach((v) => onScreen.add(v));
for (const v of vis) {
  v.addEventListener("pointerenter", () => (v._hold = true)); v.addEventListener("pointerleave", () => (v._hold = false));
  v.addEventListener("focus", () => (v._hold = true)); v.addEventListener("blur", () => (v._hold = false));
}
let last = 0;
function loop(now) {
  const dt = Math.min(100, now - (last || now)); last = now;
  if (!RM.matches) for (const v of onScreen) {
    if (v._hold || !v._scan || !v.closest(".ev-tile.in")) continue;
    v._t = (v._t + dt / v._scan.dur) % 1;
    tick1(v, v._t);
  }
  requestAnimationFrame(loop);
}
requestAnimationFrame(loop);
RM.addEventListener && RM.addEventListener("change", () => vis.forEach((v) => tick1(v, RM.matches ? 0.5 : v._t)));

// ------------------------------------------------------------------ verification matrix: tip and label filter
const cells = $("#evCells");
if (cells) {
  const all = $$("i", cells), N = all.length, LBL = { v: "Validated", m: "Modelled", p: "Partner-owned" };
  all.forEach((c, i) => {
    const t = c.getAttribute("title") || "", k = (c.className.match(/c-(\w)/) || [])[1];
    c.removeAttribute("title");
    c.style.setProperty("--d", `${(i % 29) * 16 + Math.floor(i / 29) * 40}ms`);
    c.setAttribute("data-tip", `Capability ${String(i + 1).padStart(3, "0")} of ${N} · «${LBL[k] || ""}»\n${t.replace(/ · \w+(-\w+)?$/, "")}`);
  });
  cells.addEventListener("pointermove", (e) => { const c = e.target.closest("i[data-tip]"); if (c) { mark(c); showTip(c, e.clientX, e.clientY); } else hideTip(); });
  cells.addEventListener("pointerleave", hideTip);
  const btns = $$(".ev-legend .lg");
  const set = (f) => { cells.classList.remove("dim-v", "dim-m", "dim-p"); if (f) cells.classList.add("dim-" + f); };
  const pressed = () => btns.find((x) => x.getAttribute("aria-pressed") === "true");
  btns.forEach((b) => {
    b.addEventListener("mouseenter", () => { if (!pressed()) set(b.dataset.f); });
    b.addEventListener("mouseleave", () => { const on = pressed(); set(on ? on.dataset.f : null); });
    b.addEventListener("click", () => { const on = b.getAttribute("aria-pressed") !== "true"; btns.forEach((x) => x.setAttribute("aria-pressed", "false")); b.setAttribute("aria-pressed", String(on)); set(on ? b.dataset.f : null); });
  });
}

// ================================================================== R5 hero instrument (was its own module; one file keeps the publish list under the host's limit)
{
// Evidence hero (R5, 2026-09-29): the verification matrix as a live instrument.
// Data: build.py page data "matrix" (#kpage): every row of the engine's web/data/verification-matrix.json
// (generated from src/verification.rs), in ledger order, with its status, capability, requirement,
// oracle and module; nothing is typed here. Shape carries the status as well as colour: a filled
// square is Validated, a hollow square Modelled, a diamond Partner-owned.
// Live: the counters count up once, the cells light in ledger order, then a sweep steps through the
// matrix reading out each capability and its oracle. Hover, focus or the pause button stop the sweep;
// arrow keys move a cursor. Reduced motion: every cell and count at once, no sweep.
const $ = (s, r = document) => r.querySelector(s);
const RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
const win = $("#ehWin");
let M = null;
try { M = JSON.parse($("#kpage").textContent).matrix; } catch (e) { M = null; }
if (win && M && M.rows && M.rows.length) init(M);

function init(M) {
  const rows = M.rows, grid = $("#ehGrid"), read = $("#ehRead"), live = $("#ehLive");
  const LAB = { v: "Validated", m: "Modelled", p: "Partner-owned" };
  const cells = rows.map((r, i) => {
    const c = document.createElement("span");
    c.className = `eh-c ${r.s}`; c.dataset.i = i;
    grid.append(c); return c;
  });
  win.classList.add("ready");
  // counters: count up once
  const counters = [...win.querySelectorAll("[data-to]")];
  if (!RM) {
    const t0 = performance.now(), D = 1300;
    counters.forEach((b) => { b.textContent = "0"; });
    const tick = (t) => {
      const f = Math.min(1, (t - t0) / D), e = 1 - Math.pow(1 - f, 3);
      counters.forEach((b) => { b.textContent = String(Math.round(+b.dataset.to * e)); });
      if (f < 1) requestAnimationFrame(tick);
    };
    requestAnimationFrame(tick);
    cells.forEach((c, i) => c.style.setProperty("--d", `${Math.round(i * 7)}ms`));
    requestAnimationFrame(() => requestAnimationFrame(() => grid.classList.add("in")));
  } else grid.classList.add("in");

  let cur = -1;
  function show(i, announce) {
    if (cur >= 0) cells[cur].classList.remove("on");
    cur = i; const r = rows[i]; cells[i].classList.add("on");
    read.replaceChildren();
    const h = document.createElement("div"); h.className = "eh-rh";
    const lab = document.createElement("span"); lab.className = `eh-lab ${r.s}`; lab.textContent = LAB[r.s];
    const idx = document.createElement("span"); idx.className = "eh-idx"; idx.textContent = `Row ${i + 1} of ${rows.length}`;
    h.append(lab, idx);
    if (r.m) { const m = document.createElement("code"); m.textContent = r.m; h.append(m); }
    const cap = document.createElement("p"); cap.className = "eh-cap"; cap.textContent = r.c;
    const or = document.createElement("p"); or.className = "eh-or";
    const ob = document.createElement("b"); ob.textContent = r.s === "p" ? "Owner " : "Oracle ";
    or.append(ob, r.s === "p" ? "A partner owns this; the engine claims none of it." : r.o || "No external oracle named.");
    read.append(h, cap, or);
    if (announce) live.textContent = `${LAB[r.s]}. ${r.c}. ${r.s === "v" ? "Oracle: " + r.o : ""}`;
  }
  // the sweep: one cell every 1.5 s, skipping ahead so every status comes round
  let playing = !RM, held = false, visible = true, timer = 0;
  const btn = $("#ehPlay");
  const setBtn = () => { btn.setAttribute("aria-pressed", String(playing)); btn.setAttribute("aria-label", playing ? "Pause the sweep" : "Play the sweep"); };
  function step() {
    if (!playing || held || !visible) return;
    show((cur + 7) % rows.length, false);
  }
  function loop() { clearInterval(timer); timer = setInterval(step, 1500); }
  btn.addEventListener("click", () => { playing = !playing; setBtn(); if (playing) step(); });
  setBtn();
  show(0, false);
  if (!RM) setTimeout(loop, 1400);
  if ("IntersectionObserver" in window) new IntersectionObserver((es) => { visible = es[es.length - 1].isIntersecting; }).observe(grid);
  document.addEventListener("visibilitychange", () => { visible = !document.hidden; });
  // pointer: read the cell under it; the sweep waits while the pointer is on the grid
  grid.addEventListener("pointerover", (e) => { const c = e.target.closest(".eh-c"); if (c) { held = true; show(+c.dataset.i, false); } });
  grid.addEventListener("pointerleave", () => { held = document.activeElement === grid; });
  // keyboard: a cursor over the cells, in reading order and by rows
  const cols = () => { const a = cells[0].getBoundingClientRect().top; let k = 0; while (k < cells.length && cells[k].getBoundingClientRect().top === a) k++; return Math.max(1, k); };
  grid.addEventListener("focus", () => { held = true; grid.classList.add("kb"); show(cur < 0 ? 0 : cur, true); });
  grid.addEventListener("blur", () => { held = false; grid.classList.remove("kb"); });
  grid.addEventListener("keydown", (e) => {
    const c = cols(), mv = { ArrowRight: 1, ArrowLeft: -1, ArrowDown: c, ArrowUp: -c, Home: -cur, End: rows.length - 1 - cur }[e.key];
    if (mv == null) return;
    e.preventDefault(); show(Math.max(0, Math.min(rows.length - 1, cur + mv)), true);
  });
}
}
