// Capabilities on the Observatory system. Every visual is a real engine run:
//   the engine's recorded runs    assets/capabilities/capabilities.json (src/tools/gen_capabilities.py)
//   the Studio's recordings       read by the same generator, so those cards open in Kshana Studio
//   page data (#kpage)            the holdover reader and the constellation comparison (build.py)
// Nothing here synthesises a value: every line, cell, dot and figure is read from those files.
// Sections: shared helpers · L-band waterfall · six ways · integrity and coasting · constellation
// designer · campaigns · solar system · kept modules (holdover reader, one block, Studio loader).
import { fmt, nearestByX } from "../playground/lib/views.mjs";

const D = JSON.parse(document.getElementById("kpage").textContent);
const ROOT = (window.KSITE && window.KSITE.root) || "";
const STUDIO = (window.KSITE && window.KSITE.studio) || "Kshana Studio";
const RMQ = matchMedia("(prefers-reduced-motion: reduce)");
const RM = RMQ.matches;
const NS = "http://www.w3.org/2000/svg";
const $ = (s, r = document) => r.querySelector(s);
const $$ = (s, r = document) => [...r.querySelectorAll(s)];

// Engine labels use specification shorthand; spell each one out for the page (the meaning is unchanged).
function plainLabel(s) {
  return String(s || "")
    .replace(/^MODELLED\s*-\s*/, "Modelled: ").replace(/^VALIDATED\s*-\s*/, "Validated: ")
    .replace("optional secular J2", "optional secular J2, the oblateness term")
    .replace("Galileo OS SDD", "Galileo Open Service Service Definition Document (OS SDD)")
    .replace("GLONASS ICD", "GLONASS Interface Control Document (ICD)")
    .replace("GPS SPS Performance Standard", "GPS Standard Positioning Service (SPS) Performance Standard")
    .replace("SPS PS Appendix B", "Appendix B of that Performance Standard")
    .replace(/\s*\(see docs\/VERIFICATION-MATRIX\.md\)/, ", as listed in the engine's verification matrix");
}

// ================================================================== shared helpers
function el(tag, cls, text) { const e = document.createElement(tag); if (cls) e.className = cls; if (text != null) e.textContent = text; return e; }
function S(tag, attrs = {}, parent = null, text = null) {
  const e = document.createElementNS(NS, tag);
  for (const k in attrs) if (attrs[k] != null) e.setAttribute(k, attrs[k]);
  if (text != null) e.textContent = text;
  if (parent) parent.appendChild(e);
  return e;
}
function onNear(node, fn, margin = "300px") {
  if (!node) return;
  if (!("IntersectionObserver" in window)) { fn(); return; }
  const io = new IntersectionObserver((es) => { if (es.some((e) => e.isIntersecting)) { io.disconnect(); fn(); } }, { rootMargin: margin });
  io.observe(node);
}
function watchVisible(node, cb, margin = "0px") {
  if (!("IntersectionObserver" in window)) { cb(true); return; }
  new IntersectionObserver((es) => cb(es[es.length - 1].isIntersecting), { rootMargin: margin }).observe(node);
}
let dataP = null;
const data = () => (dataP ||= fetch(ROOT + "assets/capabilities/capabilities.json").then((r) => { if (!r.ok) throw new Error(`HTTP ${r.status}`); return r.json(); }));
const n = (v, d = 1) => (v == null || !Number.isFinite(v) ? "–" : Number(v).toLocaleString("en-GB", { minimumFractionDigits: d, maximumFractionDigits: d }));
const ni = (v) => (v == null ? "–" : Math.round(v).toLocaleString("en-GB"));
const clamp = (x, a, b) => Math.max(a, Math.min(b, x));
function hms(s) { s = Math.max(0, Math.round(s)); const h = Math.floor(s / 3600), m = Math.floor((s % 3600) / 60), x = s % 60; return `T+${String(h).padStart(2, "0")}:${String(m).padStart(2, "0")}:${String(x).padStart(2, "0")}`; }
function dur(s) { s = Math.abs(s); return s >= 86400 ? `${n(s / 86400, 2)} d` : s >= 3600 ? `${n(s / 3600, 1)} h` : s >= 60 ? `${n(s / 60, 1)} min` : `${n(s, 0)} s`; }
const kv = (label, value) => { const d = el("div"); d.append(el("dt", null, label)); const dd = el("dd"); dd.innerHTML = value; d.append(dd); return d; };
function pathOf(pts) { let d = ""; let pen = false; for (const p of pts) { if (!p || !Number.isFinite(p[0]) || !Number.isFinite(p[1])) { pen = false; continue; } d += (pen ? "L" : "M") + p[0].toFixed(1) + " " + p[1].toFixed(1); pen = true; } return d; }
function download(name, text, type = "text/plain") {
  const a = document.createElement("a");
  a.href = URL.createObjectURL(new Blob([text], { type }));
  a.download = name; document.body.appendChild(a); a.click();
  setTimeout(() => { URL.revokeObjectURL(a.href); a.remove(); }, 500);
  if (window.KStoast) window.KStoast(`Saved ${name}`);
}

// Provenance: engine version and build, scenario, seed, and every route to check or reproduce it.
// Runs the Studio has recorded link the Studio; the others name the engine build that ran them and
// link the engine's report where one is published, the scenario file and the command.
function prov(p, m, eng, { lead = null, studioTab = null } = {}) {
  if (!p || !m) return;
  p.replaceChildren();
  const src = el("span", "prov-src");
  const seed = m.seed == null ? "deterministic, no seed" : `seed ${m.seed}`;
  const build = studioTab ? "" : `, build <code>${eng.commit}</code>`;
  src.innerHTML = `${lead ? `<b>${lead}:</b> ` : ""}Engine v${m.engine_version}${build} · <code>${m.file}</code> · ${seed}`;
  p.append(src);
  const stem = m.file.replace(/\.toml$/, "");
  if (studioTab) {
    const a = el("a", "prov-open", `Open in ${STUDIO}`); a.href = `${ROOT}playground/index.html?scenario=${stem}&tab=${studioTab}`; p.append(a);
    const r = el("a", null, "Report and data"); r.href = `${ROOT}playground/index.html?scenario=${stem}&tab=exports`; p.append(r);
    return;
  }
  if (m.report) { const a = el("a", "prov-open", "Open the engine's report"); a.href = ROOT + m.report; p.append(a); }
  if (m.toml_url) { const a = el("a", null, "Scenario file"); a.href = ROOT + m.toml_url; p.append(a); }
  else if (m.toml) { const b = el("button", "cap-cmd", "Scenario file"); b.type = "button"; b.addEventListener("click", () => download(m.file, m.toml, "application/toml")); p.append(b); }
  if (m.result_url) { const a = el("a", null, "Result data"); a.href = ROOT + m.result_url; p.append(a); }
  const c = el("button", "cap-cmd"); c.type = "button"; c.dataset.copy = `kshana ${m.file}`; c.setAttribute("aria-label", `Copy the command that reproduces the run: kshana ${m.file}`);
  c.append(el("span", null, `$ kshana ${m.file}`), el("span", "cp", "Copy")); p.append(c);
}

// A marker that rides a real series while its card is on screen (still under reduced motion).
function rider(svgEl, pts, host, period = 6000) {
  if (!pts.length) return;
  const halo = S("circle", { r: 7, class: "halo" }, svgEl), dot = S("circle", { r: 3.6, class: "dot" }, svgEl);
  const put = (p) => { for (const c of [halo, dot]) { c.setAttribute("cx", p[0].toFixed(1)); c.setAttribute("cy", p[1].toFixed(1)); } };
  put(pts[pts.length - 1]);
  if (RM) return;
  let on = false, t0 = 0, raf = 0;
  const tick = (t) => { if (!on) return; const f = (((t - t0) % period + period) % period) / period; put(pts[Math.min(pts.length - 1, Math.floor(f * pts.length))]); raf = requestAnimationFrame(tick); };
  watchVisible(host, (v) => { on = v; if (v) { t0 = performance.now(); cancelAnimationFrame(raf); raf = requestAnimationFrame(tick); } });
}

// ================================================================== 01 L-band waterfall
// A perceptual ramp, monotonic in lightness (navy, indigo, blue, cyan, lime, amber, white-hot), so the
// order of powers reads under colour-vision deficiency too. The instrument stays dark in both themes.
const RAMP = [[6, 9, 22], [44, 66, 178], [40, 134, 222], [61, 214, 240], [168, 238, 94], [255, 206, 84], [255, 246, 226]];
function rampRGB(f) {
  f = clamp(f, 0, 1) * (RAMP.length - 1);
  const i = Math.min(RAMP.length - 2, Math.floor(f)), t = f - i, a = RAMP[i], b = RAMP[i + 1];
  return [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t, a[2] + (b[2] - a[2]) * t];
}
const cwRoot = document.getElementById("cwWin");
if (cwRoot) onNear(cwRoot, () => data().then((d) => initWaterfall(d)).catch((e) => { console.warn("waterfall:", e); const p = $(".cw-nojs"); if (p) p.textContent = "The recorded run could not be loaded here."; }), "600px");

function initWaterfall(d) {
  const s = d.spectrum, eng = d.engine;
  const scope = document.getElementById("cwScope"), over = document.getElementById("cwOver");
  const F = s.freq_hz, NT = s.rows.length, NF = F.length, peak = s.peak_db, SC = s.rows_scale || 10;
  prov($('[data-cprov="spectrum"]'), s, eng);
  $("#cwLabel").textContent = s.label;
  const ul = $("#cwNot"); for (const t of s.not_modelled) ul.append(el("li", null, t));
  const iqNote = el("p", "cap-note");
  iqNote.textContent = `At T+${s.iq.t_s} s the engine also draws the model as ${ni(s.iq.n)} IQ (in-phase and quadrature) samples around ${n(s.iq.centre_hz / 1e6, 2)} MHz and checks a Welch estimate (${s.iq.segments} segments of ${s.iq.nfft}) against it: integrated power ratio ${n(s.iq.power_ratio, 5)}.`;
  ul.after(iqNote);

  // Band groups: bands sharing a carrier share a zoom window; one half-width for all, so the scale matches.
  const groups = [];
  for (const b of s.bands) { let g = groups.find((x) => Math.abs(x.fc - b.centre_hz) < 1e6); if (!g) groups.push(g = { fc: b.centre_hz, bands: [] }); g.bands.push(b); }
  groups.sort((a, b) => a.fc - b.fc);
  let hw = 0;
  for (const g of groups) {
    for (const b of g.bands) hw = Math.max(hw, b.rx_bw_hz / 2);
    for (const j of s.jammers) if (Math.abs(j.centre_hz - g.fc) < 1e6) hw = Math.max(hw, j.bw_hz / 2);
  }
  hw += 2 * s.bin_hz;
  for (const g of groups) {
    g.i0 = F.findIndex((f) => f >= g.fc - hw); g.i1 = F.length - 1 - [...F].reverse().findIndex((f) => f <= g.fc + hw);
    g.n = g.i1 - g.i0 + 1; g.name = g.bands.map((b) => b.name).join(" · ");
  }
  // offscreen images: one per zoom window and the whole grid, NF x NT cells, redrawn as rows arrive
  const mk = (w) => { const c = document.createElement("canvas"); c.width = w; c.height = NT; return c; };
  const offAll = mk(NF), offG = groups.map((g) => { const c = mk(g.n); c.height = NT * 4; return c; });
  // Colour is a log scale of the dB above the floor, from V0 up to the peak: the satellite signals add
  // 0.02-0.07 dB to a 3 MHz cell and glow faintly, a 4 dB noise jammer reads mid-ramp and the 41 dB chirp
  // is white-hot. Cells under VMIN (the grid's own 0.01 dB rounding) are the floor.
  const V0 = 0.005, VMIN = 0.012, LOGP = Math.log1p(peak / V0);
  const lev = (v) => (v < VMIN ? 0 : Math.log1p(v / V0) / LOGP);
  const cellRGB = (raw) => rampRGB(lev(raw / SC));
  const ROWPX = 4; // offscreen rows repeated so row edges stay crisp while frequency is interpolated
  function paint(k) {
    // rows 0..k are known; the newest (k) sits at the top, older rows below it
    const ctxA = offAll.getContext("2d"), ia = ctxA.createImageData(NF, NT);
    for (let y = 0; y < NT; y++) {
      const r = k - y;
      for (let x = 0; x < NF; x++) {
        const o = (y * NF + x) * 4;
        // rows before the replay began are the previous pass's end rows (the cyan line marks the restart)
        const c = cellRGB(s.rows[r < 0 ? r + NT : r][x]); ia.data[o] = c[0]; ia.data[o + 1] = c[1]; ia.data[o + 2] = c[2]; ia.data[o + 3] = 255;
      }
    }
    ctxA.putImageData(ia, 0, 0);
    groups.forEach((g, gi) => { const cx = offG[gi].getContext("2d"); cx.imageSmoothingEnabled = false; cx.clearRect(0, 0, g.n, NT * ROWPX); cx.drawImage(offAll, g.i0, 0, g.n, NT, 0, 0, g.n, NT * ROWPX); });
  }
  // visible canvases
  const cv = document.createElement("canvas"); cv.setAttribute("aria-hidden", "true"); scope.prepend(cv);
  const ov = S("svg", { class: "cw-ov", "aria-hidden": "true" }); scope.append(ov);
  const oc = document.createElement("canvas"); oc.setAttribute("aria-hidden", "true"); over.append(oc);
  const osv = S("svg", { "aria-hidden": "true" }); over.append(osv);
  cwRoot.classList.add("cw-ready");
  const GAP = 10, GL = 44, GT = 30, GB = 24;
  let W = 0, H = 0, panes = [];
  function layout() {
    const r = (document.fullscreenElement === cv ? cv : scope).getBoundingClientRect(); W = Math.max(200, r.width); H = Math.max(160, r.height);
    const dpr = Math.min(2, window.devicePixelRatio || 1);
    cv.width = Math.round(W * dpr); cv.height = Math.round(H * dpr);
    panes = panesFor(W, H);
    const ro = (document.fullscreenElement === oc ? oc : over).getBoundingClientRect(); oc.width = Math.round(ro.width * dpr); oc.height = Math.round(ro.height * dpr); over._w = ro.width; over._h = ro.height;
    drawOverlay(); draw();
  }
  function panesFor(w, h) { const pw = (w - GL - GAP * (groups.length - 1) - 8) / groups.length; return groups.map((g, i) => ({ g, x: GL + i * (pw + GAP), w: pw, y: GT, h: h - GT - GB })); }
  const fx = (p, f) => p.x + ((f - F[p.g.i0] + s.bin_hz / 2) / (p.g.n * s.bin_hz)) * p.w;
  function drawOverlay() {
    ov.replaceChildren(); ov.setAttribute("viewBox", `0 0 ${W} ${H}`);
    for (const p of panes) {
      S("rect", { x: p.x, y: p.y, width: p.w, height: p.h, fill: "none", stroke: "rgba(255,255,255,.12)" }, ov);
      const narrow = p.w < 230;
      S("text", { x: p.x + 2, y: 12, fill: "#c9d4ef", "font-size": 10.5, "font-family": "var(--mono)" }, ov, narrow ? `${n(p.g.fc / 1e6, 0)}` : `${n(p.g.fc / 1e6, 2)} MHz`);
      if (narrow) S("text", { x: p.x + p.w - 2, y: 12, "text-anchor": "end", fill: "#3ddcf7", "font-size": 9.5, "font-family": "var(--mono)" }, ov, p.g.bands.map((b) => b.name.split(" ").pop()).join("·"));
      let row = 0;
      for (const b of p.g.bands) {
        const x = fx(p, b.centre_hz), bw = (b.rx_bw_hz / (p.g.n * s.bin_hz)) * p.w;
        S("rect", { x: x - bw / 2, y: p.y, width: bw, height: 3, fill: "#3ddcf7", opacity: .7 }, ov);
        if (!narrow && row === 0) S("text", { x: p.x + p.w - 2, y: 12, "text-anchor": "end", fill: "#3ddcf7", "font-size": 10, "font-family": "var(--mono)" }, ov, p.g.name);
        row++;
      }
      S("line", { x1: fx(p, p.g.fc), x2: fx(p, p.g.fc), y1: p.y, y2: p.y + p.h, stroke: "#3ddcf7", "stroke-opacity": .35, "stroke-dasharray": "3 5" }, ov);
      // frequency ticks under the window, every 5 MHz (10 where it is narrow)
      const f0 = F[p.g.i0] - s.bin_hz / 2, f1 = F[p.g.i1] + s.bin_hz / 2, stepM = p.w < 200 ? 10 : 5;
      for (let m = Math.ceil(f0 / 1e6 / stepM) * stepM; m * 1e6 <= f1; m += stepM) {
        const x = fx(p, m * 1e6); if (x < p.x + 10 || x > p.x + p.w - 10) continue;
        S("line", { x1: x, x2: x, y1: p.y + p.h, y2: p.y + p.h + 4, stroke: "#8190b0" }, ov);
        S("text", { x, y: p.y + p.h + 15, "text-anchor": "middle", fill: "#8190b0", "font-size": 9.5, "font-family": "var(--mono)" }, ov, `${m}`);
      }
      // where the satellites themselves are: the band centre cell before any jammer, in hundredths of a dB
      const ci = F.reduce((a, f, i) => (Math.abs(f - p.g.fc) < Math.abs(F[a] - p.g.fc) ? i : a), p.g.i0);
      const sig = Math.max(...s.rows[0].slice(Math.max(p.g.i0, ci - 1), Math.min(p.g.i1, ci + 1) + 1)) / SC;
      if (sig >= VMIN && p.w >= 150) {
        const lx = fx(p, p.g.fc) + 6, t = `signal +${n(sig, 2)} dB`;
        const g2 = S("g", { class: "cw-sig" }, ov);
        S("rect", { x: lx, y: p.y + p.h - 22, width: t.length * 6.1 + 10, height: 16, rx: 4, fill: "rgba(5,6,12,.78)", stroke: "rgba(61,220,247,.35)" }, g2);
        S("text", { x: lx + 5, y: p.y + p.h - 11, fill: "#9fe9fa", "font-size": 9.5, "font-family": "var(--mono)" }, g2, t);
      }
    }
    S("text", { x: GL - 6, y: H - 9, "text-anchor": "end", fill: "#8190b0", "font-size": 9.5, "font-family": "var(--mono)" }, ov, "MHz");
    // time axis: every 10 rows, counted back from the row on show
    for (let r = 0; r < NT; r += 10) {
      const y = GT + ((r + 0.5) / NT) * (H - GT - GB);
      S("text", { x: GL - 6, y: y + 3, "text-anchor": "end", fill: "#8190b0", "font-size": 10, "font-family": "var(--mono)" }, ov, r === 0 ? "now" : `−${r * s.row_s} s`);
    }
    ov.append(curG);
    // overview: the whole grid, brackets and leaders down to each zoom window
    osv.replaceChildren();
    const ro = over.getBoundingClientRect(), ow = ro.width, oh = ro.height, ox0 = GL, ox1 = ow - 8;
    osv.setAttribute("viewBox", `0 0 ${ow} ${oh}`);
    const ofx = (f) => ox0 + ((f - F[0] + s.bin_hz / 2) / (NF * s.bin_hz)) * (ox1 - ox0);
    S("text", { x: 6, y: 11, fill: "#8190b0", "font-size": 9.5, "font-family": "var(--mono)" }, osv, "grid");
    S("text", { x: ox0, y: 11, fill: "#8190b0", "font-size": 9.5, "font-family": "var(--mono)" }, osv, `${n(F[0] / 1e6, 0)} MHz`);
    S("text", { x: ox1, y: 11, "text-anchor": "end", fill: "#8190b0", "font-size": 9.5, "font-family": "var(--mono)" }, osv, `${n(F[NF - 1] / 1e6, 0)} MHz`);
    const pr = scope.getBoundingClientRect(), orr = over.getBoundingClientRect(), dx = pr.left - orr.left;
    for (const p of panes) {
      const a = ofx(F[p.g.i0] - s.bin_hz / 2), b = ofx(F[p.g.i1] + s.bin_hz / 2);
      S("rect", { x: a, y: 16, width: Math.max(2, b - a), height: oh - 30, fill: "none", stroke: "#3ddcf7", "stroke-width": 1.2 }, osv);
      S("path", { d: `M${a} ${oh - 14} L${p.x + dx} ${oh}M${b} ${oh - 14} L${p.x + p.w + dx} ${oh}`, stroke: "#3ddcf7", "stroke-opacity": .5, fill: "none" }, osv);
    }
    over._fx = { ox0, ox1, oh };
  }
  const JNAME = { chirp: "chirp", cw: "CW tone", tone: "CW tone", narrowband: "noise", "narrowband-noise": "noise", noise: "noise", "bandlimited-noise": "noise" };
  let k = NT - 1, cur = null;
  const curG = S("g");
  function draw() {
    paintMain(cv.getContext("2d"), cv.width / W);
    const o = oc.getContext("2d"), ow = over._w || over.clientWidth, oh2 = over._h || over.clientHeight, od = oc.width / Math.max(1, ow), of = over._fx;
    if (document.fullscreenElement === oc) {
      // the overview in full screen shows the whole instrument, not a stretched strip
      const sv = [W, H, panes]; W = ow; H = oh2; panes = panesFor(W, H); paintMain(o, od); [W, H, panes] = sv;
    } else if (of) { o.setTransform(od, 0, 0, od, 0, 0); o.fillStyle = "#05060c"; o.fillRect(0, 0, ow, oh2); o.imageSmoothingEnabled = false; o.drawImage(offAll, 0, 0, NF, NT, of.ox0, 16, of.ox1 - of.ox0, of.oh - 30); }
    drawCursor(); readout();
  }
  function paintMain(c, dpr) {
    c.setTransform(dpr, 0, 0, dpr, 0, 0); c.fillStyle = "#05060c"; c.fillRect(0, 0, W, H);
    // frequency is interpolated between the 3 MHz cells (the rows stay crisp: they were repeated offscreen)
    c.imageSmoothingEnabled = true; c.imageSmoothingQuality = "high";
    panes.forEach((p, i) => c.drawImage(offG[i], 0, 0, p.g.n, NT * ROWPX, p.x, p.y, p.w, p.h));
    // the newest row: a bright edge
    { const gr = c.createLinearGradient(0, GT, 0, GT + 10); gr.addColorStop(0, "rgba(61,220,247,.55)"); gr.addColorStop(1, "rgba(61,220,247,0)"); c.fillStyle = gr; for (const p of panes) c.fillRect(p.x, p.y, p.w, 10); }
    if (k < NT - 1) {
      const yR = GT + ((k + 1) / NT) * (H - GT - GB); c.strokeStyle = "rgba(61,220,247,.85)"; c.lineWidth = 1; c.beginPath(); for (const p of panes) { c.moveTo(p.x, yR); c.lineTo(p.x + p.w, yR); } c.stroke();
      if (yR < H - GB - 20) { c.font = "500 10px " + (getComputedStyle(scope).getPropertyValue("--mono").trim() || "monospace"); const p0 = panes[0], lab = p0.w < 240 ? "replay start" : "replay start · previous pass below", tw = c.measureText(lab).width + 10; c.fillStyle = "rgba(5,6,12,.86)"; c.fillRect(p0.x + 4, yR + 3, tw, 14); c.fillStyle = "#9fe9fa"; c.fillText(lab, p0.x + 9, yR + 13.5); }
    }
    // each jammer switching on or off, where its row sits now, in the windows it lands in
    c.font = "500 10px " + (getComputedStyle(scope).getPropertyValue("--mono").trim() || "monospace");
    const rowH = (H - GT - GB) / NT;
    for (const j of s.jammers) for (const [te, verb] of [[j.on_s, "on"], [j.off_s, "off"]]) {
      if (te == null || te > s.t[k]) continue;
      const y = GT + (k - Math.round(te / s.row_s) + 1) * rowH; if (y <= GT + 2 || y >= H - GB - 2) continue;
      for (const p of panes) if (j.centre_hz >= F[p.g.i0] - s.bin_hz && j.centre_hz <= F[p.g.i1] + s.bin_hz) {
        c.strokeStyle = "rgba(255,255,255,.7)"; c.setLineDash([4, 3]); c.beginPath(); c.moveTo(p.x, y); c.lineTo(p.x + p.w, y); c.stroke(); c.setLineDash([]);
        const lab = `${JNAME[j.waveform] || j.waveform} ${verb}`, tw = c.measureText(lab).width + 10;
        const ly = y - 16 < GT + 12 ? y + 2 : y - 16; c.fillStyle = "rgba(5,6,12,.86)"; c.fillRect(p.x + 4, ly, tw, 14); c.fillStyle = "#eaf0ff"; c.fillText(lab, p.x + 9, ly + 10.5);
      }
    }

    // jammer markers at the top of their window while they are on
    const t = s.t[k];
    for (const j of s.jammers) {
      const on = t >= j.on_s && (j.off_s == null || t < j.off_s);
      for (const p of panes) if (Math.abs(j.centre_hz - p.g.fc) < 1e6 || (j.centre_hz >= F[p.g.i0] && j.centre_hz <= F[p.g.i1])) {
        const x = fx(p, j.centre_hz); c.fillStyle = on ? "#ff6a5c" : "rgba(255,255,255,.25)";
        c.beginPath(); c.moveTo(x - 5, p.y - 12); c.lineTo(x + 5, p.y - 12); c.lineTo(x, p.y - 4); c.closePath(); c.fill();
      }
    }
    // in full screen the SVG labels are not shown, so the canvas carries its own
    if (document.fullscreenElement === c.canvas) {
      c.fillStyle = "#c9d4ef"; c.font = "500 12px " + (getComputedStyle(scope).getPropertyValue("--mono").trim() || "monospace");
      for (const p of panes) c.fillText(`${n(p.g.fc / 1e6, 2)} MHz · ${p.g.name}`, p.x + 4, GT - 16);
      c.fillStyle = "#8190b0"; c.textAlign = "right";
      for (let r = 0; r < NT; r += 10) c.fillText(r === 0 ? "now" : `−${r * s.row_s} s`, GL - 6, GT + ((r + 0.5) / NT) * (H - GT - GB) + 4);
      c.textAlign = "left";
    }
  }
  function drawCursor() {
    curG.replaceChildren();
    if (!cur) return;
    const p = panes[cur.p]; if (!p) return;
    const x = p.x + ((cur.x + 0.5) / p.g.n) * p.w, y = p.y + ((cur.y + 0.5) / NT) * p.h;
    S("line", { x1: x, x2: x, y1: p.y, y2: p.y + p.h, stroke: "#fff", "stroke-opacity": .55 }, curG);
    S("line", { x1: p.x, x2: p.x + p.w, y1: y, y2: y, stroke: "#fff", "stroke-opacity": .55 }, curG);
  }
  // side panel
  const sel = { band: s.bands.reduce((a, b) => (b.min_cn0 < a.min_cn0 ? b : a)) };
  const bs = $("#cwBandSel");
  for (const b of s.bands) {
    const bt = el("button", null, b.name); bt.type = "button"; bt.setAttribute("role", "radio"); bt.setAttribute("aria-checked", b === sel.band);
    bt.addEventListener("click", () => { sel.band = b; for (const x of bs.children) x.setAttribute("aria-checked", x === bt); sparkBase(); readout(); });
    bs.append(bt);
  }
  const bars = $("#cwBars"), maxCn0 = Math.max(...s.bands.map((b) => b.nominal_cn0)) + 2;
  const barEls = s.bands.map((b) => {
    const li = el("li"); li.append(el("span", null, b.name));
    const tr = el("span", "tr"); const i = el("i"); const em = el("em"); em.style.left = `${(s.threshold / maxCn0) * 100}%`; tr.append(i, em);
    const v = el("span", "v"); li.append(tr, v); bars.append(li); return { li, i, v, b };
  });
  const jamUl = $("#cwJam");
  const jamEls = s.jammers.map((j) => { const li = el("li"); li.append(el("i")); li.append(el("span", null, `${j.name} · ${n(j.centre_hz / 1e6, 2)} MHz · ${j.off_s == null ? `from ${j.on_s} s to the end` : `${j.on_s}–${j.off_s}\u00a0s`}`)); jamUl.append(li); return { li, j }; });
  const spark = $("#cwSpark");
  let sparkCur = null;
  function sparkBase() {
    spark.replaceChildren();
    const b = sel.band, X = (i) => (i / (NT - 1)) * 260, Y = (v) => 60 - (clamp(v, 0, maxCn0) / maxCn0) * 56;
    b.lost.forEach((l, i) => { if (l) S("rect", { x: X(i) - 130 / NT, y: 0, width: 260 / NT, height: 64, class: "s-lost" }, spark); });
    S("line", { x1: 0, x2: 260, y1: Y(s.threshold), y2: Y(s.threshold), class: "s-thr" }, spark);
    S("path", { d: pathOf(b.cn0.map((v, i) => [X(i), Y(v)])), class: "s-line" }, spark);
    sparkCur = S("line", { y1: 0, y2: 64, class: "s-cur" }, spark);
    $("#cwBandName").textContent = b.name;
  }
  sparkBase();
  const live = $("#cwLive");
  let lastSay = "";
  function readout() {
    const t = s.t[k], b = sel.band, v = b.cn0[k], lost = b.lost[k], js = b.js[k];
    $("#cwCn0").textContent = n(v, 1); $("#cwRowT").textContent = `T+${n(t, 0)} s`;
    const st = lost ? "lost" : v < s.threshold + s.degraded_margin ? "deg" : "ok";
    const sEl = $("#cwStatus"); sEl.dataset.s = st; sEl.lastElementChild.textContent = st === "lost" ? "Lost lock" : st === "deg" ? "Degraded" : "Tracking";
    $("#cwJs").textContent = js == null ? "no jammer" : `${n(js, 1)} dB`;
    if (sparkCur) { const x = (k / (NT - 1)) * 260; sparkCur.setAttribute("x1", x); sparkCur.setAttribute("x2", x); }
    for (const e of barEls) { const c = e.b.cn0[k]; e.i.style.width = `${(clamp(c, 0, maxCn0) / maxCn0) * 100}%`; e.i.style.setProperty("--c", e.b.lost[k] ? "var(--coral)" : c < s.threshold + s.degraded_margin ? "var(--amber)" : "var(--lime)"); e.v.textContent = n(c, 1); e.li.classList.toggle("lost", !!e.b.lost[k]); }
    for (const e of jamEls) e.li.classList.toggle("on", t >= e.j.on_s && (e.j.off_s == null || t < e.j.off_s));
    analyser();
    scrubSet();
    const say = `T+${n(t, 0)} s, ${b.name} ${n(v, 1)} dB-Hz, ${st === "lost" ? "lost lock" : st === "deg" ? "degraded" : "tracking"}`;
    if (!playing && say !== lastSay) { live.textContent = say; lastSay = say; }
  }
  // analyser: the row on show, one trace under each zoom window on the same frequency axis, and on
  // the same log scale as the colours, so a 0.04 dB signal and a 41 dB chirp both show
  const an = $("#cwAn");
  function analyser() {
    an.replaceChildren();
    const ar = an.getBoundingClientRect(), AW = Math.max(200, ar.width || W), AH = Math.max(60, ar.height || 96);
    an.setAttribute("viewBox", `0 0 ${AW} ${AH}`);
    const kx = AW / W, top = 20, bot = AH - 4, Y = (v) => bot - lev(v / SC) * (bot - top);
    for (const f of [0.1, 1, 10]) { const y = bot - lev(f) * (bot - top); S("line", { x1: GL * kx - 4, x2: AW, y1: y, y2: y, class: "a-grid" }, an); S("text", { x: GL * kx - 7, y: y + 3, "text-anchor": "end" }, an, `${f} dB`); }
    S("line", { x1: GL * kx, x2: AW, y1: bot, y2: bot, class: "a-floor" }, an);
    const row = s.rows[k];
    for (const p of panes) {
      const g = p.g, X = (i) => (fx(p, F[i]) ) * kx;
      const pts = []; for (let i = g.i0; i <= g.i1; i++) pts.push([X(i), Y(row[i])]);
      S("rect", { x: p.x * kx, y: top - 2, width: p.w * kx, height: bot - top + 2, class: "a-band" }, an);
      for (const b of g.bands) { const x = fx(p, b.centre_hz) * kx; S("line", { x1: x, x2: x, y1: top, y2: bot, class: "a-bl" }, an); }
      S("path", { d: pathOf(pts) + `L${X(g.i1)} ${bot}L${X(g.i0)} ${bot}Z`, class: "a-area" }, an);
      S("path", { d: pathOf(pts), class: "a-line" }, an);
      const pk = Math.max(...row.slice(g.i0, g.i1 + 1)) / SC;
      S("text", { x: (p.x + p.w) * kx - 2, y: top - 6, "text-anchor": "end", class: "a-pk" }, an, `peak ${n(pk, pk < 1 ? 2 : 1)} dB`);
    }
    $("#cwAnCap").textContent = `row T+${n(s.t[k], 0)} s · dB above the floor, log scale · whole-grid peak ${n(Math.max(...row) / SC, 1)} dB`;
  }
  // legend
  const rampEl = $("#cwRamp"); rampEl.style.background = `linear-gradient(90deg,${[0, .17, .33, .5, .67, .83, 1].map((f) => `rgb(${rampRGB(f).map(Math.round).join(",")})`).join(",")})`;
  $("#cwMax").textContent = `${n(peak, 0)} dB above it · log scale from ${V0} dB`;
  // summary for screen readers
  const worst = sel.band;
  $("#cwSummary").textContent = `Recorded run of ${s.file}: ${s.bands.length} bands, ${s.jammers.length} jammers over ${n(s.t[NT - 1] + s.row_s, 0)} seconds. The worst band, ${worst.name}, falls to ${n(worst.min_cn0, 1)} dB-Hz at ${worst.min_t} s; tracking floor ${s.threshold} dB-Hz.`;
  // scrubber
  const scrub = $("#cwScrub"), fill = $("#cwFill"), handle = $("#cwHandle"), sl = $("#cwScrubL");
  scrub.setAttribute("aria-valuemax", NT - 1);
  for (let r = 0; r < NT; r += 10) { const sp = el("span", r % 20 ? "odd" : null, `${n(s.t[r], 0)} s`); sp.style.left = `${(r / (NT - 1)) * 100}%`; sl.append(sp); }
  function scrubFit() { sl.classList.remove("sparse"); const sp = [...sl.children].filter((e) => e.offsetParent); for (let i = 1; i < sp.length; i++) if (sp[i].getBoundingClientRect().left < sp[i - 1].getBoundingClientRect().right + 4) { sl.classList.add("sparse"); break; } }
  new ResizeObserver(scrubFit).observe(sl); if (document.fonts) document.fonts.ready.then(scrubFit);
  function scrubSet() { const f = k / (NT - 1); fill.style.width = `${f * 100}%`; handle.style.left = `${f * 100}%`; scrub.setAttribute("aria-valuenow", k); scrub.setAttribute("aria-valuetext", `T+${n(s.t[k], 0)} s`); }
  const setRow = (r) => { k = clamp(Math.round(r), 0, NT - 1); paint(k); draw(); };
  const fromX = (e) => { const r = scrub.getBoundingClientRect(); return ((e.clientX - r.left) / r.width) * (NT - 1); };
  scrub.addEventListener("pointerdown", (e) => { pause(); scrub.setPointerCapture(e.pointerId); setRow(fromX(e)); const mv = (ev) => setRow(fromX(ev)); scrub.addEventListener("pointermove", mv); scrub.addEventListener("pointerup", () => scrub.removeEventListener("pointermove", mv), { once: true }); });
  scrub.addEventListener("keydown", (e) => { const m = { ArrowLeft: -1, ArrowRight: 1, ArrowDown: -1, ArrowUp: 1, PageDown: -10, PageUp: 10 }[e.key]; if (m != null) { e.preventDefault(); pause(); setRow(k + m); } else if (e.key === "Home") { pause(); setRow(0); } else if (e.key === "End") { pause(); setRow(NT - 1); } });
  // hover / keyboard cursor on the scope
  const tip = $("#cwTip");
  function cellAt(px, py) { for (let i = 0; i < panes.length; i++) { const p = panes[i]; if (px >= p.x && px <= p.x + p.w && py >= p.y && py <= p.y + p.h) return { p: i, x: clamp(Math.floor(((px - p.x) / p.w) * p.g.n), 0, p.g.n - 1), y: clamp(Math.floor(((py - p.y) / p.h) * NT), 0, NT - 1) }; } return null; }
  function showTip(c, px, py) {
    if (!c) { tip.classList.remove("on"); cur = null; drawCursor(); return; }
    cur = c; drawCursor();
    const p = panes[c.p], fi = p.g.i0 + c.x, r0 = k - c.y, r = r0 < 0 ? r0 + NT : r0;
    const v = s.rows[r][fi] / SC;
    const near = s.bands.filter((b) => Math.abs(b.centre_hz - F[fi]) <= b.rx_bw_hz / 2 + s.bin_hz / 2).map((b) => b.name).join(", ");
    tip.innerHTML = `<b>${n(F[fi] / 1e6, 1)} MHz</b> · T+${n(s.t[r], 0)} s<br>${n(v, 1)} dB above the noise floor${near ? `<br>in ${near}` : ""}`;
    tip.classList.add("on");
    const tx = px ?? p.x + ((c.x + 0.5) / p.g.n) * p.w, ty = py ?? p.y + ((c.y + 0.5) / NT) * p.h;
    tip.style.left = `${Math.min(tx, W - 210)}px`; tip.style.top = `${Math.min(ty, H - 70)}px`;
  }
  scope.addEventListener("pointermove", (e) => { const r = scope.getBoundingClientRect(); const px = e.clientX - r.left, py = e.clientY - r.top; showTip(cellAt(px, py), px, py); });
  scope.addEventListener("pointerleave", () => showTip(null));
  scope.addEventListener("keydown", (e) => {
    if (e.key === "Escape") { showTip(null); return; }
    const m = { ArrowLeft: [-1, 0], ArrowRight: [1, 0], ArrowUp: [0, -1], ArrowDown: [0, 1] }[e.key]; if (!m) return;
    e.preventDefault(); pause();
    let c = cur ? { ...cur } : { p: panes.length - 1, x: Math.floor(panes[panes.length - 1].g.n / 2), y: 0 };
    c.x += m[0]; c.y = clamp(c.y + m[1], 0, NT - 1);
    if (c.x < 0) { if (c.p > 0) { c.p--; c.x = panes[c.p].g.n - 1; } else c.x = 0; }
    if (c.x >= panes[c.p].g.n) { if (c.p < panes.length - 1) { c.p++; c.x = 0; } else c.x = panes[c.p].g.n - 1; }
    showTip(c); live.textContent = tip.textContent;
  });
  // playback: four one-second rows per second, a hold on the full frame, then again
  const play = $("#cwPlay");
  let playing = !RM, raf = 0, last = 0, acc = 0, hold = 0, visible = false;
  function setPlayUI() { play.setAttribute("aria-pressed", playing); play.setAttribute("aria-label", playing ? "Pause the waterfall" : "Play the waterfall"); }
  function pause() { playing = false; setPlayUI(); }
  play.addEventListener("click", () => { playing = !playing; if (playing && k >= NT - 1) { k = 0; } setPlayUI(); loop(); });
  function step(ts) {
    if (!playing || !visible) { raf = 0; return; }
    const dt = Math.min(0.1, (ts - (last || ts)) / 1000); last = ts;
    if (k >= NT - 1) { hold += dt; if (hold > 3) { hold = 0; setRow(0); } }
    else { acc += dt * 4; if (acc >= 1) { const m = Math.floor(acc); acc -= m; setRow(k + m); } }
    raf = requestAnimationFrame(step);
  }
  function loop() { if (!raf && playing && visible) { last = 0; raf = requestAnimationFrame(step); } }
  setPlayUI();
  hold = 0; // open on the full frame, hold, then replay
  paint(k); layout();
  watchVisible(cwRoot, (v) => { visible = v; loop(); });
  const ro2 = new ResizeObserver(() => layout()); ro2.observe(scope); ro2.observe(cv); ro2.observe(oc);
  document.addEventListener("fullscreenchange", () => requestAnimationFrame(layout));
}

// ================================================================== 02 six ways GNSS fails
const fx = document.getElementById("fails");
if (fx) {
  onNear(fx, () => data().then((d) => initSix(d)).catch((e) => console.warn("six ways:", e)), "900px");
  setupPin(fx);
}
function setupPin(sec) {
  const track = document.getElementById("fxTrack"), vp = document.getElementById("fxVp"), prog = $$("#fxProg span");
  let run = 0, top = 0, on = false;
  function measure() {
    // inside the R5 capability console the six cards scroll natively (a pinned track needs the page to itself)
    on = innerWidth >= 900 && !RMQ.matches && innerHeight >= 560 && !sec.closest(".cc-panel");
    sec.classList.toggle("pinned", on);
    track.style.transform = "";
    if (!on) return;
    // the pinned track scrolls its own box (scrollLeft follows the page), so nothing is clipped away
    run = Math.max(0, track.scrollWidth - vp.clientWidth);
    sec.style.setProperty("--fx-run", `${run}px`);
    top = sec.getBoundingClientRect().top + scrollY;
    tick();
  }
  function tick() {
    if (!on) return;
    const p = run ? clamp((scrollY - top) / run, 0, 1) : 0;
    vp.scrollLeft = p * run;
    prog.forEach((s, i) => { const f = clamp(p * prog.length - i, 0, 1); s.style.setProperty("--p", `${f * 100}%`); });
  }
  addEventListener("scroll", () => requestAnimationFrame(tick), { passive: true });
  addEventListener("resize", measure);
  if (document.fonts) document.fonts.ready.then(measure);
  measure();
  // the native-scroll fallback still fills the progress marks
  $("#fxVp").addEventListener("scroll", (e) => { if (on) return; const v = e.target, p = v.scrollWidth > v.clientWidth ? v.scrollLeft / (v.scrollWidth - v.clientWidth) : 0; prog.forEach((s, i) => s.style.setProperty("--p", `${clamp(p * prog.length - i, 0, 1) * 100}%`)); }, { passive: true });
}
function frame(svgEl, W, H, pad) {
  svgEl.replaceChildren();
  const P = { l: 34, r: 10, t: 14, b: 22, ...pad };
  return { P, w: W - P.l - P.r, h: H - P.t - P.b, W, H };
}
function axes(g, f, xt, yt) {
  for (const [v, lab] of yt) { S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: v, y2: v, class: "g" }, g); S("text", { x: f.P.l - 4, y: v + 3, "text-anchor": "end" }, g, lab); }
  xt.forEach(([v, lab], i) => S("text", { x: v, y: f.H - 6, "text-anchor": xt.length > 1 && i === xt.length - 1 && v > f.W - f.P.r - 30 ? "end" : i === 0 && v < f.P.l + 30 ? "start" : "middle" }, g, lab));
}
function logTicks(lo, hi) { const out = []; for (let e = Math.floor(Math.log10(lo)); e <= Math.ceil(Math.log10(hi)); e++) out.push(10 ** e); return out; }
const SUP = { "-": "⁻", 0: "⁰", 1: "¹", 2: "²", 3: "³", 4: "⁴", 5: "⁵", 6: "⁶", 7: "⁷", 8: "⁸", 9: "⁹" };
const fmtPow = (v) => { const e = Math.round(Math.log10(v)); return e >= 0 && e <= 3 ? ni(10 ** e) : e === -1 ? "0.1" : `10${String(e).split("").map((c) => SUP[c]).join("")}`; };

function initSix(d) {
  const eng = d.engine, S6 = d.six;
  const cards = $$(".fcard");
  cards.forEach((c, i) => { $(".fc-n", c).textContent = `${String(i + 1).padStart(2, "0")} / ${String(cards.length).padStart(2, "0")}`; });
  for (const card of cards) {
    const key = card.dataset.six, m = S6[key], svgEl = $(".fc-svg", card);
    prov($("[data-cprov]", card), m, eng, { studioTab: m.tab });
    const figEl = $("[data-fig]", card);
    const draw = SIX[key]; if (!draw) continue;
    const pts = draw(svgEl, m, figEl);
    rider(svgEl, pts || [], card);
  }
  const io = "IntersectionObserver" in window ? new IntersectionObserver((es) => es.forEach((e) => { if (e.isIntersecting) { e.target.classList.add("in"); io.unobserve(e.target); } }), { threshold: 0.35 }) : null;
  for (const c of cards) { if (io && !RM) io.observe(c); else c.classList.add("in"); }
}
const SIX = {
  jam(svgEl, m, fig) {
    // every satellite's effective C/N0 (solid) under its nominal, un-jammed value (dashed), against the tracking floor
    const f = frame(svgEl, 400, 190, { l: 40 }), T = m.t[m.t.length - 1];
    const all = m.eff.flat().concat(m.nom.flat()).filter((v) => v != null), lo = Math.min(...all) - 3, hi = Math.max(...all) + 3;
    const X = (t) => f.P.l + (t / T) * f.w, Y = (v) => f.P.t + f.h - ((v - lo) / (hi - lo)) * f.h;
    axes(svgEl, f, [[X(0), "0"], [X(T / 2), `${ni(T / 2)} s`], [X(T), `${ni(T)} s`]], [[Y(lo + 3), `${ni(lo + 3)}`], [Y(m.threshold), `${m.threshold}`], [Y(hi - 3), `${ni(hi - 3)} dB-Hz`]]);
    S("rect", { x: f.P.l, y: Y(m.threshold), width: f.w, height: Y(lo) - Y(m.threshold), class: "band" }, svgEl);
    S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: Y(m.threshold), y2: Y(m.threshold), class: "thr" }, svgEl);
    S("text", { x: f.W - f.P.r, y: Y(m.threshold) - 4, "text-anchor": "end", class: "thr-t" }, svgEl, "tracking floor");
    m.nom.forEach((row) => S("path", { d: pathOf(row.map((v, i) => (v == null ? null : [X(m.t[i]), Y(v)]))), class: "ln2 draw", pathLength: 1, "stroke-width": 1, opacity: .7 }, svgEl));
    let pts = [];
    m.eff.forEach((row, j) => { const p = row.map((v, i) => (v == null ? null : [X(m.t[i]), Y(v)])); S("path", { d: pathOf(p), class: "ln draw d2", pathLength: 1, "stroke-width": 1.4, opacity: .85 }, svgEl); if (p.filter(Boolean).length > pts.length) pts = p.filter(Boolean); });
    // labels in the clear space: under the lowest nominal line, above the highest effective one
    const nomLo = Math.min(...m.nom.flat().filter((v) => v != null)), effHi = Math.max(...m.eff.flat().filter((v) => v != null));
    S("text", { x: f.P.l + 4, y: Y(nomLo) + 12 }, svgEl, "nominal, no jammer (dashed)");
    S("text", { x: f.P.l + 4, y: Y(effHi) - 6 }, svgEl, `effective, ${m.prn.length} satellites`);
    fig.innerHTML = `Tracked <b>${Math.min(...m.tracking)}</b> of ${Math.max(...m.visible)} in view · availability under jamming <b>${n(m.fom.availability_under_jamming, 2)}</b> (nominal ${n(m.fom.availability_nominal, 2)}) · mean J/S <b>${n(m.fom.mean_js_db, 1)} dB</b>`;
    return pts;
  },
  spoof(svgEl, m, fig) {
    const f = frame(svgEl, 400, 190), c = m.clocks.reduce((a, b) => (b.t.length > a.t.length ? b : a));
    const T = c.t[c.t.length - 1], vmax = Math.max(...c.offset, ...m.clocks.map((x) => x.bound_ns)) * 1.1;
    const X = (t) => f.P.l + (t / T) * f.w, Y = (v) => f.P.t + f.h - (v / vmax) * f.h;
    axes(svgEl, f, [[X(0), "0"], [X(T), `${ni(T)} s`]], [[Y(0), "0 ns"], [Y(vmax / 1.1 / 2), `${ni(vmax / 2.2)} ns`], [Y(vmax / 1.1), `${ni(vmax / 1.1)} ns`]]);
    const pts = c.t.map((t, i) => [X(t), Y(c.offset[i])]);
    S("path", { d: pathOf(pts) + `L${X(T)} ${Y(0)}L${X(0)} ${Y(0)}Z`, class: "ar" }, svgEl);
    S("path", { d: pathOf(pts), class: "ln draw", pathLength: 1 }, svgEl);
    m.clocks.forEach((k, i) => {
      const y = Y(k.bound_ns); S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: y, y2: y, class: "thr", opacity: i ? 1 : .6 }, svgEl);
      if (k.detect_s != null) { S("line", { x1: X(k.detect_s), x2: X(k.detect_s), y1: f.P.t, y2: f.P.t + f.h, stroke: "var(--c)", "stroke-dasharray": "2 3" }, svgEl); S("text", { x: X(k.detect_s) + 3, y: f.P.t + 10 + i * 12 }, svgEl, `${k.id} detects`); }
    });
    fig.innerHTML = m.clocks.map((k) => `<b>${k.id}</b> detects at ${ni(k.detect_s)} s (bound ${n(k.bound_ns, 1)} ns)`).join(" · ");
    return pts;
  },
  clock(svgEl, m, fig) {
    const f = frame(svgEl, 400, 190, { l: 44 }), T = Math.max(...m.clocks.map((c) => c.t[c.t.length - 1]));
    const all = m.clocks.flatMap((c) => c.err).filter((v) => v > 0);
    const lo = Math.max(Math.min(...all), 1e-6), hi = Math.max(...all, m.threshold_ns) * 2;
    const X = (t) => f.P.l + (t / T) * f.w, Y = (v) => f.P.t + f.h - ((Math.log10(Math.max(v, lo)) - Math.log10(lo)) / (Math.log10(hi) - Math.log10(lo))) * f.h;
    const lt = logTicks(lo, hi).filter((v, i, a) => i % Math.ceil(a.length / 4) === 0);
    axes(svgEl, f, [[X(0), "0"], [X(T), dur(T)]], lt.map((v) => [Y(v), `${fmtPow(v)} ns`]));
    const lossI = m.clocks[0].gnss.findIndex((g) => g !== "nominal");
    if (lossI >= 0) S("rect", { x: X(m.clocks[0].t[lossI]), y: f.P.t, width: X(T) - X(m.clocks[0].t[lossI]), height: f.h, class: "band" }, svgEl);
    S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: Y(m.threshold_ns), y2: Y(m.threshold_ns), class: "thr" }, svgEl);
    S("text", { x: f.P.l + 4, y: Y(m.threshold_ns) - 4, class: "thr-t" }, svgEl, `${m.threshold_ns} ns guard`);
    let pts = [];
    m.clocks.forEach((c, i) => { const p = c.t.map((t, j) => [X(t), Y(c.err[j])]); S("path", { d: pathOf(p), class: (i ? "ln" : "ln2") + " draw" + (i ? " d2" : ""), pathLength: 1 }, svgEl); if (i) pts = p; });
    const [cq, cc] = m.clocks; S("text", { x: f.W - f.P.r - 2, y: Y(Math.max(...cq.err.slice(-20))) - 6, "text-anchor": "end" }, svgEl, cq.id);
    S("text", { x: f.W - f.P.r - 2, y: Math.min(f.P.t + f.h - 4, Y(Math.min(...cc.err.slice(-20))) + 14), "text-anchor": "end" }, svgEl, cc.id);
    fig.innerHTML = m.clocks.map((c) => `<b>${c.id}</b> holds the guard for ${dur(c.holdover_s)}`).join(" · ");
    return pts;
  },
  orbit(svgEl, m, fig) {
    svgEl.replaceChildren();
    svgEl.closest(".fc-map").style.backgroundImage = `url(${ROOT}assets/planets/earth-day-2048.jpg)`;
    const X = (lon) => ((lon + 180) / 360) * 400, Y = (lat) => ((90 - lat) / 180) * 190;
    for (const la of [-60, -30, 0, 30, 60]) S("line", { x1: 0, x2: 400, y1: Y(la), y2: Y(la), stroke: "rgba(255,255,255,.12)" }, svgEl);
    const pts = m.lon.map((lo, i) => [X(lo), Y(m.lat[i])]);
    const segs = []; let cur = [];
    pts.forEach((p, i) => { if (i && Math.abs(m.lon[i] - m.lon[i - 1]) > 180) { segs.push(cur); cur = []; } cur.push(p); }); segs.push(cur);
    for (const sg of segs) S("path", { d: pathOf(sg), class: "ln draw", pathLength: 1, stroke: "#3ddcf7" }, svgEl);
    S("text", { x: 6, y: 180 }, svgEl, `${String(m.source).replace(/^sgp4 \(TLE\)$/i, "SGP4 from a two-line element set")} · ${ni(m.n)} samples`);
    fig.innerHTML = `Altitude <b>${n(m.alt_km[0], 0)}–${n(m.alt_km[1], 0)} km</b> · ground track over ${dur(m.t[m.t.length - 1])}`;
    return pts;
  },
  integ(svgEl, m, fig) {
    // the axis stops at two and a half alert limits: the few unavailable epochs whose bound runs far above leave the top of the plot
    const f = frame(svgEl, 400, 190), T = m.t[m.t.length - 1], vmax = m.al_v * 2.5;
    const X = (t) => f.P.l + (t / T) * f.w, Y = (v) => f.P.t + f.h - (clamp(v, 0, vmax) / vmax) * f.h;
    m.avail.forEach((a, i) => { if (!a && i < m.t.length - 1) S("rect", { x: X(m.t[i]), y: f.P.t, width: Math.max(1, X(m.t[i + 1]) - X(m.t[i])), height: f.h, class: "band" }, svgEl); });
    axes(svgEl, f, [[X(0), "0"], [X(T), dur(T)]], [[Y(0), "0 m"], [Y(m.al_v), `${m.al_v} m`], [Y(m.al_v * 2), `${m.al_v * 2} m`]]);
    S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: Y(m.al_v), y2: Y(m.al_v), class: "thr" }, svgEl); S("text", { x: f.W - f.P.r, y: Y(m.al_v) - 4, "text-anchor": "end", class: "thr-t" }, svgEl, "vertical alert limit");
    S("path", { d: pathOf(m.t.map((t, i) => [X(t), Y(m.hpl[i])])), class: "ln2 draw", pathLength: 1 }, svgEl);
    const pts = m.t.map((t, i) => [X(t), Y(m.vpl[i])]);
    S("path", { d: pathOf(pts), class: "ln draw d2", pathLength: 1 }, svgEl);
    S("text", { x: f.P.l + 4, y: f.P.t + 10 }, svgEl, "vertical (solid) and horizontal (dashed) protection level");
    fig.innerHTML = `<b>${m.n_ok}</b> of ${m.n} epochs available · alert limits ${m.al_h} m horizontal, ${m.al_v} m vertical`;
    return pts;
  },
  coast(svgEl, m, fig) {
    const f = frame(svgEl, 400, 190, { l: 42 }), T = Math.max(...m.imus.map((c) => c.t[c.t.length - 1])), T0 = Math.min(...m.imus.map((c) => c.t[0]));
    const all = m.imus.flatMap((c) => c.err).filter((v) => v > 0), lo = Math.max(Math.min(...all), 0.05), hi = Math.max(...all) * 1.5;
    const X = (t) => f.P.l + ((t - T0) / (T - T0)) * f.w, Y = (v) => f.P.t + f.h - ((Math.log10(Math.max(v, lo)) - Math.log10(lo)) / (Math.log10(hi) - Math.log10(lo))) * f.h;
    const c0 = m.imus[0], dI = c0.denied.indexOf(1), dE = c0.denied.lastIndexOf(1);
    if (dI >= 0) S("rect", { x: X(c0.t[dI]), y: f.P.t, width: X(c0.t[dE]) - X(c0.t[dI]), height: f.h, class: "band" }, svgEl);
    axes(svgEl, f, [[X(T0), `${ni(T0)} s`], [X(T), `${ni(T)} s`]], logTicks(lo, hi).filter((v, i) => i % 2 === 0).map((v) => [Y(v), `${fmtPow(v)} m`]));
    S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: Y(m.threshold_m), y2: Y(m.threshold_m), class: "thr" }, svgEl); S("text", { x: f.P.l + 4, y: Y(m.threshold_m) - 4, class: "thr-t" }, svgEl, `${m.threshold_m} m budget`);
    if (dI >= 0) S("text", { x: X(c0.t[dI]) + 4, y: f.P.t + 10 }, svgEl, "GNSS denied");
    let pts = [];
    m.imus.forEach((c, i) => { const p = c.t.map((t, j) => [X(t), Y(c.err[j])]); S("path", { d: pathOf(p), class: (i ? "ln" : "ln2") + " draw" + (i ? " d2" : ""), pathLength: 1 }, svgEl); if (i) pts = p; });
    fig.innerHTML = m.imus.map((c) => `<b>${c.id}</b> inside the budget for ${n(c.holdover_s, 1)} s`).join(" · ");
    return pts;
  },
};

// ================================================================== 03 integrity (Stanford diagram) and coasting (error budget)
const icSec = document.getElementById("integrity");
if (icSec) onNear(icSec, () => data().then((d) => initIC(d)).catch((e) => console.warn("integrity:", e)), "600px");
const PHASE_C = { nominal: "var(--lime)", jamming: "var(--amber)", spoofing: "var(--magenta)", holdover: "var(--cyan)", "integrity-alarm": "var(--coral)", recovery: "var(--lime)" };
const REGION_C = { Available: "var(--lime)", "Normal operation": "var(--lime)", "Misleading information": "var(--amber)", "Hazardously misleading information": "var(--coral)", Unavailable: "var(--ink-3)", SystemUnavailable: "var(--ink-3)", MisleadingInformation: "var(--amber)", HazardouslyMisleadingInformation: "var(--coral)" };
function initIC(d) {
  const eng = d.engine;
  for (const card of $$(".ic-card")) {
    const k = card.dataset.ic, m = d.ic[k], svgEl = $(".ic-svg", card), val = $("[data-v]", card);
    prov($("[data-cprov]", card), m, eng, { studioTab: m.tab });
    const pts = k === "integ" ? stanford(svgEl, m, $("[data-fig]", card), val) : budget(svgEl, m, $("[data-fig]", card), $("[data-grades]", card), val);
    if (!pts || !pts.length) continue;
    const halo = S("circle", { r: 8, fill: "var(--c)", opacity: .22 }, svgEl), dot = S("circle", { r: 4, class: "dot" }, svgEl);
    const put = (i) => { const p = pts[i]; for (const c of [halo, dot]) { c.setAttribute("cx", p[0].toFixed(1)); c.setAttribute("cy", p[1].toFixed(1)); } if (p[2]) val.textContent = p[2]; };
    put(pts.length - 1);
    if (!RM) {
      let on = false, t0 = 0, raf = 0; const period = 14000;
      const tick = (ts) => { if (!on) return; put(Math.min(pts.length - 1, Math.floor(((((ts - t0) % period) + period) % period) / period * pts.length))); raf = requestAnimationFrame(tick); };
      watchVisible(card, (v) => { on = v; if (v) { t0 = performance.now(); cancelAnimationFrame(raf); raf = requestAnimationFrame(tick); } });
    }
  }
}
function stanford(svgEl, m, fig, val) {
  // log-log: the protection level spans two decades, the error three
  const f = frame(svgEl, 600, 300, { l: 50, b: 30, t: 12 });
  const vals = m.err.concat(m.pl).filter((v) => v > 0), lo = 10 ** Math.floor(Math.log10(Math.min(...vals))), hi = 10 ** Math.ceil(Math.log10(Math.max(...vals, m.al)));
  const L = (v) => (Math.log10(clamp(v, lo, hi)) - Math.log10(lo)) / (Math.log10(hi) - Math.log10(lo));
  const X = (v) => f.P.l + L(v) * f.w, Y = (v) => f.P.t + f.h - L(v) * f.h;
  S("path", { d: `M${X(lo)} ${Y(lo)}L${X(hi)} ${Y(hi)}L${X(hi)} ${Y(lo)}Z`, fill: "var(--coral)", opacity: .08 }, svgEl);
  S("rect", { x: X(lo), y: Y(hi), width: f.w, height: Y(m.al) - Y(hi), fill: "var(--ink-3)", opacity: .1 }, svgEl);
  const tk = logTicks(lo, hi);
  axes(svgEl, f, tk.map((v) => [X(v), `${fmtPow(v)} m`]), tk.map((v) => [Y(v), `${fmtPow(v)} m`]));
  S("line", { x1: X(lo), y1: Y(lo), x2: X(hi), y2: Y(hi), stroke: "var(--ink-3)", "stroke-dasharray": "3 4" }, svgEl);
  S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: Y(m.al), y2: Y(m.al), class: "thr" }, svgEl);
  S("line", { x1: X(m.al), x2: X(m.al), y1: f.P.t, y2: f.P.t + f.h, class: "thr" }, svgEl);
  S("text", { x: X(m.al) + 5, y: f.P.t + 12, fill: "var(--coral)" }, svgEl, `alert limit ${m.al} m`);
  S("text", { x: f.W - f.P.r - 6, y: Y(lo) - 8, "text-anchor": "end" }, svgEl, "misleading: error above the bound");
  S("text", { x: X(lo) + 6, y: Y(hi) + 14 }, svgEl, "unavailable: bound above the limit");
  S("text", { x: X(lo) + 6, y: (Y(m.al) + Y(lo)) / 2 }, svgEl, "normal operation");
  const pts = m.err.map((e, i) => [X(e), Y(m.pl[i]), `${n(m.pl[i], 1)} m bound`]);
  pts.forEach((p, i) => S("circle", { cx: p[0].toFixed(1), cy: p[1].toFixed(1), r: 2.4, fill: REGION_C[m.region[i]] || "var(--cyan)", opacity: .75 }, svgEl));
  fig.innerHTML = Object.entries(m.regions).map(([r, c]) => `<b>${ni(c)}</b> ${r.replace(/([a-z])([A-Z])/g, "$1 $2").toLowerCase()}`).join(" · ") + ` · ${ni(m.err.length)} epochs, ${((k) => (k ? ni(k) : "none"))(m.err.filter((e, i) => e > m.pl[i]).length)} with the error above its bound. Across: the true position error; up: the protection level; both on log axes.`;
  return pts;
}
function budget(svgEl, m, fig, grades, val) {
  const f = frame(svgEl, 600, 300, { l: 50, b: 30, t: 12 }), T = m.t;
  const all = m.combined.concat(m.contrib.flatMap((c) => c.e)).filter((v) => v > 0);
  const lo = Math.max(1e-3, Math.min(...m.combined) / 10), hi = Math.max(...m.combined) * 2, t0 = T[0], t1 = T[T.length - 1];
  const X = (t) => f.P.l + ((Math.log10(t) - Math.log10(t0)) / (Math.log10(t1) - Math.log10(t0))) * f.w;
  const Y = (v) => f.P.t + f.h - ((Math.log10(clamp(v, lo, hi)) - Math.log10(lo)) / (Math.log10(hi) - Math.log10(lo))) * f.h;
  const yt = logTicks(lo, hi).filter((v, i, a) => i % Math.ceil(a.length / 6) === 0);
  axes(svgEl, f, logTicks(t0, t1).map((v) => [X(v), v >= 60 ? dur(v) : `${ni(v)} s`]), yt.map((v) => [Y(v), `${fmtPow(v)} m`]));
  const palette = ["var(--cyan)", "var(--magenta)", "var(--amber)", "var(--coral)", "var(--ink-3)", "var(--lime)"];
  m.contrib.forEach((c, i) => {
    S("path", { d: pathOf(T.map((t, j) => (c.e[j] > lo ? [X(t), Y(c.e[j])] : null))), fill: "none", stroke: palette[i % palette.length], "stroke-width": 1.1, "stroke-dasharray": c.class === "stochastic" ? "4 3" : null, opacity: .8 }, svgEl);
  });
  const leg = el("div", "cg-leg ic-leg"); leg.innerHTML = m.contrib.map((c, i) => `<span style="--c:${palette[i % palette.length]}"><i${c.class === "stochastic" ? ' class="dash"' : ""}></i>${c.name.replace(/_/g, " ")}</span>`).join("") + `<span><i></i><b>combined</b></span>`;
  grades.before(leg);
  for (const x of m.crossings) {
    S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: Y(x.thr), y2: Y(x.thr), class: "thr" }, svgEl);
    S("line", { x1: X(x.t), x2: X(x.t), y1: Y(x.thr), y2: f.P.t + f.h, stroke: "var(--coral)", "stroke-dasharray": "2 3" }, svgEl);
    S("text", { x: f.P.l + 4, y: Y(x.thr) - 4, fill: "var(--coral)" }, svgEl, `${x.thr} m at ${n(x.t, 0)} s`);
  }
  const pts = T.map((t, j) => [X(t), Y(m.combined[j]), `${n(m.combined[j], m.combined[j] < 10 ? 2 : 0)} m`]);
  S("path", { d: pathOf(pts), class: "ln", "stroke-width": 2.6 }, svgEl);
  grades.replaceChildren();
  const tmax = Math.max(...m.grades.flatMap((g) => g.x.map((x) => x.t)));
  for (const g of m.grades) {
    const row = el("div", "ic-gr"); row.append(el("span", null, g.grade));
    const tr = el("span", "tr");
    g.x.forEach((x, i) => { const b = el("i"); b.style.width = `${(Math.log10(1 + x.t) / Math.log10(1 + tmax)) * 100}%`; b.style.opacity = i ? .45 : 1; b.title = `${x.thr} m after ${n(x.t, 1)} s`; tr.append(b); });
    row.append(tr, el("b", null, g.x.map((x) => `${x.thr} m: ${n(x.t, 0)} s`).join(" · ")));
    grades.append(row);
  }
  fig.innerHTML = `Time since GNSS was lost on the log axis, a ${m.grade}-grade IMU at ${ni(m.speed)} m/s: ` + m.crossings.map((x) => `<b>${x.thr} m</b> after ${n(x.t, 0)} s, dominated by ${x.dom.replace(/_/g, " ")}`).join(" · ") + ". The bars: the same crossings for four IMU grades.";
  return pts;
}

// ================================================================== three.js helpers (constellation designer, solar system)
let threeP = null;
const three = () => (threeP ||= import("three"));
function webgl() { try { const c = document.createElement("canvas"); return !!(c.getContext("webgl2") || c.getContext("webgl")); } catch (e) { return false; } }
// body-fixed (lat, lon, r) to the display frame: lon 0 -> +X, north -> +Y, lon 90 E -> -Z (the UV sphere's own mapping)
function llr(THREE, lat, lon, r, out = new THREE.Vector3()) { const a = lat * Math.PI / 180, b = lon * Math.PI / 180; return out.set(r * Math.cos(a) * Math.cos(b), r * Math.sin(a), -r * Math.cos(a) * Math.sin(b)); }
function glowSprite(THREE) {
  const c = document.createElement("canvas"); c.width = c.height = 64; const g = c.getContext("2d");
  const gr = g.createRadialGradient(32, 32, 0, 32, 32, 32); gr.addColorStop(0, "rgba(255,255,255,1)"); gr.addColorStop(.35, "rgba(255,255,255,.85)"); gr.addColorStop(1, "rgba(255,255,255,0)");
  g.fillStyle = gr; g.fillRect(0, 0, 64, 64); const t = new THREE.CanvasTexture(c); return t;
}
// Drag to turn, wheel (once the canvas is selected) or pinch to zoom, arrow keys and + / - too.
function orbitControls(canvas, st, onChange) {
  let drag = null, pinch = null; const pts = new Map(); let armed = false;
  canvas.addEventListener("pointerdown", (e) => { armed = true; canvas.focus({ preventScroll: true }); pts.set(e.pointerId, [e.clientX, e.clientY]); canvas.setPointerCapture(e.pointerId); if (pts.size === 1) drag = [e.clientX, e.clientY]; else if (pts.size === 2) { const [a, b] = [...pts.values()]; pinch = Math.hypot(a[0] - b[0], a[1] - b[1]); drag = null; } canvas.style.cursor = "grabbing"; });
  canvas.addEventListener("pointermove", (e) => {
    if (!pts.has(e.pointerId)) return; pts.set(e.pointerId, [e.clientX, e.clientY]);
    if (pts.size === 2 && pinch) { const [a, b] = [...pts.values()]; const d = Math.hypot(a[0] - b[0], a[1] - b[1]); st.dist = clamp(st.dist * (pinch / d), st.min, st.max); pinch = d; onChange(); return; }
    if (!drag) return; const dx = e.clientX - drag[0], dy = e.clientY - drag[1]; drag = [e.clientX, e.clientY];
    st.theta -= dx * 0.006; st.phi = clamp(st.phi - dy * 0.006, 0.08, Math.PI - 0.08); st.user = true; onChange();
  });
  const up = (e) => { pts.delete(e.pointerId); if (pts.size < 2) pinch = null; if (!pts.size) { drag = null; canvas.style.cursor = ""; } };
  canvas.addEventListener("pointerup", up); canvas.addEventListener("pointercancel", up);
  canvas.addEventListener("wheel", (e) => { if (!armed && document.activeElement !== canvas) return; e.preventDefault(); st.dist = clamp(st.dist * Math.exp(e.deltaY * 0.0012), st.min, st.max); onChange(); }, { passive: false });
  canvas.addEventListener("blur", () => { armed = false; });
  canvas.addEventListener("keydown", (e) => {
    const m = { ArrowLeft: () => (st.theta += 0.12), ArrowRight: () => (st.theta -= 0.12), ArrowUp: () => (st.phi = clamp(st.phi - 0.1, 0.08, Math.PI - 0.08)), ArrowDown: () => (st.phi = clamp(st.phi + 0.1, 0.08, Math.PI - 0.08)), "+": () => (st.dist = clamp(st.dist / 1.2, st.min, st.max)), "=": () => (st.dist = clamp(st.dist / 1.2, st.min, st.max)), "-": () => (st.dist = clamp(st.dist * 1.2, st.min, st.max)) }[e.key];
    if (m) { e.preventDefault(); m(); st.user = true; onChange(); }
  });
}
function sizeRenderer(renderer, camera, host) {
  const r = (document.fullscreenElement === renderer.domElement ? renderer.domElement : host).getBoundingClientRect(), w = Math.max(50, r.width), h = Math.max(50, r.height);
  renderer.setPixelRatio(Math.min(2, window.devicePixelRatio || 1)); renderer.setSize(w, h, false); camera.aspect = w / h; camera.updateProjectionMatrix();
}

// ================================================================== 05 constellation designer
const cdWin = document.getElementById("cdWin");
if (cdWin) onNear(cdWin, () => data().then((d) => initCD(d)).catch((e) => console.warn("constellations:", e)), "700px");
const CONST_C = { GPS: "#3DDCF7", Galileo: "#F45CCB", BeiDou: "#FFB547", GLONASS: "#EAF0FF", "LEO-PNT": "#3DDCF7", "Lunar relay": "#FFB547" };
const SHELL_C = ["#3DDCF7", "#F45CCB", "#FFB547", "#EAF0FF"];
function initCD(d) {
  const eng = d.engine, designs = d.constellations;
  const TITLES = { "constellation-multi-gnss-coverage": "Four GNSS together", "leo-pnt-mega-shell": "Low-Earth-orbit mega-constellation", "lunar-relay-constellation": "Lunar relay set" };
  const list = $("#cdList"), seg = $("#cdSeg"), stats = $("#cdStats"), note = $("#cdNote"), work = $("#cdWork"), legend = $("#cdLegend"), hud = $("#cdHud");
  let cur = 0, metric = "availability", view = null;
  designs.forEach((c, i) => {
    const b = el("button"); b.type = "button"; b.setAttribute("role", "tab"); b.id = `cdt-${i}`; b.setAttribute("aria-selected", i === 0); b.tabIndex = i === 0 ? 0 : -1; b.setAttribute("aria-controls", "cdStage");
    b.append(el("b", null, TITLES[c.file.replace(".toml", "")] || c.file), el("small", null, `${ni(c.total)} satellites · ${c.body} · ${c.file}`));
    const ul = el("ul");
    for (const k of c.constellations) {
      if (k.shells.length) for (const s of k.shells) ul.append(el("li", null, `${k.name}: Walker ${s.pattern} ${ni(s.total)}/${s.planes}/${s.phasing} · ${n(s.altitude_km, 0)} km · ${n(s.inclination_deg, 1)}°`));
      else ul.append(el("li", null, `${k.name}: ${ni(k.satellites)} satellites, operator's slot table`));
    }
    b.append(ul);
    b.addEventListener("click", () => select(i));
    b.addEventListener("keydown", (e) => { const m = { ArrowDown: 1, ArrowRight: 1, ArrowUp: -1, ArrowLeft: -1 }[e.key]; if (m) { e.preventDefault(); const j = (cur + m + designs.length) % designs.length; select(j); list.children[j].focus(); } });
    list.append(b);
  });
  const METRICS = [["availability", "Availability"], ["pdop", "Mean PDOP"], ["visible", "In view"]];
  for (const [k, lab] of METRICS) { const b = el("button", null, lab); b.type = "button"; b.setAttribute("role", "radio"); b.setAttribute("aria-checked", k === metric); b.addEventListener("click", () => { metric = k; for (const x of seg.children) x.setAttribute("aria-checked", x === b); drawMap(); }); seg.append(b); }
  function select(i) {
    cur = i; [...list.children].forEach((b, j) => { b.setAttribute("aria-selected", j === i); b.tabIndex = j === i ? 0 : -1; });
    const c = designs[i];
    $("#cdFile").textContent = `· ${c.file}`;
    prov($('[data-cprov="constellation"]'), c, eng);
    const g = c.global, inp = c.inputs;
    stats.replaceChildren(
      kv("Satellites", ni(c.total)),
      kv(`PDOP ≤ ${n(inp.pdop_threshold, 0)}, whole ${c.body === "Earth" ? "Earth" : c.body}`, `${n(g.availability_pct, 2)}<small> %</small>`),
      kv("Worst site", `${n(g.worst_site_availability_pct, 1)}<small> %</small>`),
      kv("Median PDOP", n(g.pdop.median, 2)),
      kv("Mean in view", n(g.mean_visible, 1)),
      kv("Mask · run", `${n(inp.mask_deg, 0)}°<small> · ${dur(inp.duration_s)}</small>`));
    note.textContent = plainLabel(c.label);
    const w = c.work;
    work.innerHTML = w ? `<b>Visibility work</b><br>${ni(w.pair_tests_after_prefilter)} satellite-point tests of ${ni(w.pair_tests_brute_force)} a brute-force scan would make<div class="bar"><i style="width:${(w.prefilter_ratio * 100).toFixed(1)}%"></i></div>${n(w.prefilter_ratio * 100, 1)} % after the latitude prefilter · ${ni(w.dop_solutions)} DOP solutions` : "";
    legend.replaceChildren();
    const names = c.walker ? c.walker.map((s, j) => [`shell ${j + 1} · ${n(s.inc, 1)}°`, SHELL_C[j % 4]]) : c.constellations.map((k) => [k.name, CONST_C[k.name] || "#3DDCF7"]);
    for (const [nm, col] of names) { const s = el("span"); const i2 = el("i"); i2.style.setProperty("--c", col); s.append(i2, document.createTextNode(nm)); legend.append(s); }
    $("#cdSpan").textContent = `of ${dur(c.times[c.times.length - 1])}, looped`;
    $("#cdFootNote").textContent = c.walker
      ? `All ${ni(c.total)} satellites are placed from the shells' own Walker parameters (checked against the engine's ${c.shown} tracks: worst ${n(c.walker_residual_deg, 4)}°); trails are the engine's ${c.shown} tracks.`
      : `Each satellite follows the engine's own track${c.sats.some((s) => s.r_km) ? "; the frozen-orbit radius comes from the shell's elements" : ", at the radius its mean motion implies"}.`;
    drawMap();
    if (view) view.show(c);
  }
  function drawMap() {
    const c = designs[cur], box = $("#cdMap"), g = c.grid;
    let svg = $("svg", box); if (svg) svg.remove();
    svg = S("svg", { viewBox: "0 0 360 180", "aria-hidden": "true" }); box.prepend(svg);
    S("image", { href: `${ROOT}assets/planets/${c.body === "Moon" ? "moon-2048" : "earth-day-2048"}.jpg`, x: 0, y: 0, width: 360, height: 180, preserveAspectRatio: "none", opacity: .75 }, svg);
    const vals = g[metric].flat().filter((v) => v != null);
    const lo = metric === "availability" ? 0 : Math.min(...vals), hi = metric === "availability" ? 100 : metric === "pdop" ? Math.min(Math.max(...vals), c.inputs.pdop_threshold * 2) : Math.max(...vals);
    const col = (v) => { let f = hi > lo ? (v - lo) / (hi - lo) : 1; if (metric === "pdop") f = 1 - f; return `rgb(${rampRGB(0.25 + 0.7 * clamp(f, 0, 1)).map(Math.round).join(",")})`; };
    const dlat = 180 / g.lat.length, dlon = 360 / g.lon.length;
    g.lat.forEach((la, i) => g.lon.forEach((lo2, j) => { const v = g[metric][i][j]; if (v == null) return; const r = S("rect", { x: (lo2 + 180 - dlon / 2).toFixed(1), y: (90 - la - dlat / 2).toFixed(1), width: dlon, height: dlat, fill: col(v), opacity: .62 }, svg); S("title", {}, r, `${la}°, ${lo2}°: ${n(v, metric === "pdop" ? 2 : 1)}${metric === "availability" ? " %" : ""}`); }));
    const lab = { availability: `Share of the run with PDOP ≤ ${n(c.inputs.pdop_threshold, 0)} (0 to 100 %)`, pdop: `Mean PDOP per ${c.inputs.grid_step_deg}° cell (${n(lo, 2)} to ${n(hi, 2)}; brighter is better)`, visible: `Mean satellites in view (${n(lo, 1)} to ${n(hi, 1)})` }[metric];
    $("#cdMapCap").textContent = lab;
  }
  select(0);
  if (!webgl()) { $("#cdStage").append(el("p", "cd-note", "3-D view needs WebGL; the coverage map and figures are the same run.")); return; }
  three().then((THREE) => { view = makeCDView(THREE, designs, hud); view.show(designs[cur]); }).catch((e) => console.warn("three:", e));
  const play = $("#cdPlay");
  play.addEventListener("click", () => { const on = play.getAttribute("aria-pressed") !== "true"; play.setAttribute("aria-pressed", on); play.setAttribute("aria-label", on ? "Pause the orbits" : "Play the orbits"); if (view) view.setPlaying(on); });
  if (RM) { play.setAttribute("aria-pressed", "false"); play.setAttribute("aria-label", "Play the orbits"); }
}
function makeCDView(THREE, designs, hud) {
  const host = $("#cdStage");
  const canvas = document.createElement("canvas"); canvas.tabIndex = 0; canvas.setAttribute("aria-label", "Constellation around its body, real imagery: drag or arrow keys to turn, plus and minus to zoom"); host.prepend(canvas);
  const renderer = new THREE.WebGLRenderer({ canvas, antialias: true, alpha: true, powerPreference: "low-power" });
  renderer.outputColorSpace = THREE.SRGBColorSpace;
  const scene = new THREE.Scene(), camera = new THREE.PerspectiveCamera(35, 1, 0.01, 400);
  scene.add(new THREE.AmbientLight(0xffffff, 0.9));
  const sun = new THREE.DirectionalLight(0xffffff, 1.6); sun.position.set(5, 2, 4); scene.add(sun);
  const loader = new THREE.TextureLoader();
  const texCache = {};
  const tex = (name) => texCache[name] ||= (() => { const t = loader.load(`${ROOT}assets/planets/${name}`, () => { dirty = true; }); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; return t; })();
  const body = new THREE.Mesh(new THREE.SphereGeometry(1, 96, 64), new THREE.MeshLambertMaterial({ color: 0xffffff }));
  scene.add(body);
  const sprite = glowSprite(THREE);
  let pts = null, trails = null, c = null, st = { theta: 0.6, phi: 1.15, dist: 6, min: 1.3, max: 60 }, playing = !RM, t = 0, dirty = true, visible = false, lastTs = 0;
  const cache = {};
  orbitControls(canvas, st, () => { dirty = true; });
  function prep(cc) {
    if (cache[cc.file]) return cache[cc.file];
    const R = cc.radius_km, w = cc.rot_deg_s * Math.PI / 180, T = cc.times;
    const tracked = cc.sats.map((s) => ({
      col: new THREE.Color(cc.walker ? SHELL_C[(+(s.id.match(/^S(\d+)/) || [0, 1])[1] - 1) % 4] : CONST_C[s.c] || "#3DDCF7"),
      u: s.lat.map((la, k) => llr(THREE, la, s.lon[k] + (w * T[k]) * 180 / Math.PI, 1)),
      r: s.r_km ? s.r_km.map((x) => x / R) : null, a: s.a_km / R,
    }));
    let walker = null;
    if (cc.walker) {
      walker = [];
      cc.walker.forEach((sh, j) => {
        const per = sh.total / sh.planes, inc = sh.inc * Math.PI / 180, nrad = (2 * Math.PI) / (sh.period_min * 60), r = (R + sh.alt_km) / R, col = new THREE.Color(SHELL_C[j % 4]);
        for (let p = 0; p < sh.planes; p++) for (let k = 0; k < per; k++) walker.push({ O: (sh.raan0 + p * sh.raan_spacing) * Math.PI / 180, u0: (k * sh.in_plane + p * sh.phase_offset) * Math.PI / 180, inc, nrad, r, col });
      });
    }
    return (cache[cc.file] = { tracked, walker, R, w, T });
  }
  const tmp = new THREE.Vector3();
  function posTracked(s, T, time, out) {
    let k = 0; while (k < T.length - 2 && T[k + 1] <= time) k++;
    const f = clamp((time - T[k]) / (T[k + 1] - T[k]), 0, 1), a = s.u[k], b = s.u[k + 1];
    const om = Math.acos(clamp(a.dot(b), -1, 1));
    if (om < 1e-6) out.copy(a); else { const sa = Math.sin((1 - f) * om) / Math.sin(om), sb = Math.sin(f * om) / Math.sin(om); out.set(a.x * sa + b.x * sb, a.y * sa + b.y * sb, a.z * sa + b.z * sb); }
    const r = s.r ? s.r[k] + (s.r[k + 1] - s.r[k]) * f : s.a;
    return out.multiplyScalar(r);
  }
  function posWalker(s, time, out) {
    const u = s.u0 + s.nrad * time, cO = Math.cos(s.O), sO = Math.sin(s.O), cu = Math.cos(u), su = Math.sin(u), ci = Math.cos(s.inc), si = Math.sin(s.inc);
    const x = cO * cu - sO * su * ci, y = sO * cu + cO * su * ci, z = su * si; // engine frame: z north
    return out.set(x * s.r, z * s.r, -y * s.r);
  }
  function show(cc) {
    c = cc; const P = prep(cc);
    body.material.map = tex(cc.body === "Moon" ? "moon-2048.jpg" : "earth-day-2048.jpg"); body.material.needsUpdate = true;
    if (pts) { scene.remove(pts); pts.geometry.dispose(); }
    if (trails) { scene.remove(trails); trails.geometry.dispose(); }
    const list = P.walker || P.tracked, N = list.length;
    const g = new THREE.BufferGeometry(); g.setAttribute("position", new THREE.BufferAttribute(new Float32Array(N * 3), 3));
    const cols = new Float32Array(N * 3); list.forEach((s, i) => { cols[i * 3] = s.col.r; cols[i * 3 + 1] = s.col.g; cols[i * 3 + 2] = s.col.b; }); g.setAttribute("color", new THREE.BufferAttribute(cols, 3));
    pts = new THREE.Points(g, new THREE.PointsMaterial({ size: N > 1000 ? 0.035 : 0.3, map: sprite, vertexColors: true, transparent: true, depthWrite: false, blending: THREE.AdditiveBlending, sizeAttenuation: true }));
    scene.add(pts);
    // trails: the engine's own tracks in the inertial frame, subdivided along each great circle
    const seg = [], sc = [];
    for (const s of P.tracked) for (let k = 0; k < P.T.length - 1; k++) for (let q = 0; q < 6; q++) {
      const a = posTracked(s, P.T, P.T[k] + ((P.T[k + 1] - P.T[k]) * q) / 6, new THREE.Vector3()), b = posTracked(s, P.T, P.T[k] + ((P.T[k + 1] - P.T[k]) * (q + 1)) / 6, new THREE.Vector3());
      seg.push(a.x, a.y, a.z, b.x, b.y, b.z); sc.push(s.col.r, s.col.g, s.col.b, s.col.r, s.col.g, s.col.b);
    }
    const tg = new THREE.BufferGeometry(); tg.setAttribute("position", new THREE.Float32BufferAttribute(seg, 3)); tg.setAttribute("color", new THREE.Float32BufferAttribute(sc, 3));
    trails = new THREE.LineSegments(tg, new THREE.LineBasicMaterial({ vertexColors: true, transparent: true, opacity: P.walker ? 0.18 : 0.28, depthWrite: false }));
    scene.add(trails);
    const rmax = Math.max(...P.tracked.map((s) => (s.r ? Math.max(...s.r) : s.a)), ...(P.walker || []).map((s) => s.r));
    st.dist = st.user ? clamp(st.dist, 1.3, rmax * 5) : Math.max(3.9, rmax * 3.4); st.max = Math.max(8, rmax * 6); st.min = 1.25;
    t = 0; dirty = true; update();
  }
  function update() {
    if (!c) return; const P = prep(c), list = P.walker || P.tracked, arr = pts.geometry.attributes.position.array;
    list.forEach((s, i) => { (P.walker ? posWalker(s, t, tmp) : posTracked(s, P.T, t, tmp)); arr[i * 3] = tmp.x; arr[i * 3 + 1] = tmp.y; arr[i * 3 + 2] = tmp.z; });
    pts.geometry.attributes.position.needsUpdate = true;
    body.rotation.y = P.w * t;
    hud.innerHTML = `<span>${c.body} · <b>${ni(c.total)}</b> satellites</span><span>Mission <b>${hms(t).slice(2)}</b></span>`;
    $("#cdClock").textContent = hms(t).slice(2);
  }
  function render(ts) {
    requestAnimationFrame(render);
    if (!visible) { lastTs = ts; return; }
    const dt = Math.min(0.1, (ts - (lastTs || ts)) / 1000); lastTs = ts;
    if (playing && c) { const T = c.times[c.times.length - 1]; t = (t + dt * (T / 24)) % T; update(); dirty = true; }
    if (!dirty) return;
    camera.position.set(st.dist * Math.sin(st.phi) * Math.sin(st.theta), st.dist * Math.cos(st.phi), st.dist * Math.sin(st.phi) * Math.cos(st.theta)); camera.lookAt(0, 0, 0);
    renderer.render(scene, camera); dirty = false;
  }
  sizeRenderer(renderer, camera, host);
  { const ro = new ResizeObserver(() => { sizeRenderer(renderer, camera, host); dirty = true; }); ro.observe(host); ro.observe(renderer.domElement); document.addEventListener("fullscreenchange", () => requestAnimationFrame(() => { sizeRenderer(renderer, camera, host); dirty = true; })); }
  watchVisible(host, (v) => { visible = v; dirty = true; });
  requestAnimationFrame(render);
  return { show, setPlaying: (v) => { playing = v; } };
}

// ================================================================== 06 campaigns
const cgWin = document.getElementById("cgWin");
if (cgWin) onNear(cgWin, () => data().then((d) => initCG(d)).catch((e) => console.warn("campaigns:", e)), "700px");
function initCG(d) {
  const eng = d.engine, C = d.campaigns;
  const tabs = $(".cg-tabs", cgWin);
  const provEl = $('[data-cprov="campaign"]');
  const built = {};
  const show = (key) => {
    const m = C[key]; $("#cgFile").textContent = `· ${m.file}`; prov(provEl, m, eng);
    if (!built[key]) { built[key] = true; ({ chain: cgChain, sweep: cgSweep, monte: cgMonte, compose: cgCompose })[key](m); }
  };
  if (window.KStabs) window.KStabs(tabs, { onSelect: (t) => show(t.dataset.cg) });
  else for (const b of $$('[role="tab"]', tabs)) b.addEventListener("click", () => { for (const x of $$('[role="tab"]', tabs)) { const on = x === b; x.setAttribute("aria-selected", on); x.tabIndex = on ? 0 : -1; document.getElementById(x.getAttribute("aria-controls")).hidden = !on; } show(b.dataset.cg); });
  show("chain");
}
function cgChain(c) {
  const T = c.duration_s, t = c.t;
  const ph = $("#cgPhases"); ph.replaceChildren();
  let nowCap = ph.nextElementSibling && ph.nextElementSibling.classList.contains("cg-now") ? ph.nextElementSibling : null;
  if (!nowCap) { nowCap = el("p", "cg-now"); ph.after(nowCap); }
  const liEls = c.phases.map((p) => { const li = el("li", null, p.name.replace("-", " ")); li.style.flex = `${p.t1 - p.t0} 1 0`; li.style.setProperty("--c", PHASE_C[p.name] || "var(--ink-3)"); li.title = `${p.name}: ${hms(p.t0)} to ${hms(p.t1)} · ended by ${p.ended_by} · member kinds ${p.kinds.join(", ")}`; ph.append(li); return li; });
  const defs = [
    ["cn0_dbhz", "cn0_floor_dbhz", "Carrier-to-noise density", "C/N0 against the tracking floor", "dB-Hz", "var(--cyan)", false],
    ["time_error_ns", "guard_ns", "Clock time error", "against its guard", "ns", "var(--lime)", false],
    ["protection_level_m", "alert_limit_m", "Protection level", "against the alert limit", "m", "var(--amber)", false],
    ["position_error_m", "position_threshold_m", "Inertial position error", "against its budget · log", "m", "var(--magenta)", true],
  ];
  const fit = () => liEls.forEach((li) => { li.classList.remove("bare"); li.classList.toggle("bare", li.scrollWidth > li.clientWidth + 1); });
  requestAnimationFrame(fit); new ResizeObserver(fit).observe(ph);
  const box = $("#cgCharts"); box.replaceChildren();
  const views = defs.map(([k, thrK, title, sub, unit, col, log]) => {
    const wrap = el("div", "cg-chart"); wrap.style.setProperty("--c", col);
    const h = el("div", "cg-ch"); const sp = el("span"); sp.innerHTML = `${title}<small>${sub}</small>`; const val = el("b", null, "–"); h.append(sp, val); wrap.append(h);
    const svgEl = S("svg", { class: "cg-svg", viewBox: "0 0 600 92", preserveAspectRatio: "none", "aria-hidden": "true" }, wrap);
    const v = c.ch[k].v, thr = c.ch[thrK].v, vals = v.filter((x) => x != null && (!log || x > 0));
    const lo = log ? Math.max(Math.min(...vals), 0.1) : Math.min(0, ...vals), hi = Math.max(...vals, ...thr.filter((x) => x != null)) * (log ? 2 : 1.1);
    const X = (x) => (x / T) * 600, Y = log ? (x) => 88 - ((Math.log10(Math.max(x, lo)) - Math.log10(lo)) / (Math.log10(hi) - Math.log10(lo))) * 84 : (x) => 88 - ((x - lo) / (hi - lo)) * 84;
    for (const p of c.phases.slice(1)) S("line", { x1: X(p.t0), x2: X(p.t0), y1: 0, y2: 92, class: "ph" }, svgEl);
    S("path", { d: pathOf(t.map((x, i) => (thr[i] == null ? null : [X(x), Y(thr[i])]))), class: "thr" }, svgEl);
    S("path", { d: pathOf(t.map((x, i) => (v[i] == null ? null : [X(x), Y(v[i])]))), class: "ln" }, svgEl);
    const cur = S("line", { y1: 0, y2: 92, class: "cur" }, svgEl);
    box.append(wrap);
    return { v, thr, val, cur, unit, X };
  });
  const log = $("#cgLog");
  let fitN = 0;
  const setI = (i) => {
    if (++fitN % 40 === 1) fit();
    const x = t[i];
    for (const w of views) { w.cur.setAttribute("x1", w.X(x)); w.cur.setAttribute("x2", w.X(x)); const v = w.v[i]; w.val.textContent = v == null ? "not in this phase" : `${n(v, v < 10 ? 2 : 1)} ${w.unit}`; w.val.classList.toggle("na", v == null); w.val.classList.toggle("bad", v != null && w.thr[i] != null && (w.unit === "dB-Hz" ? v < w.thr[i] : v > w.thr[i])); }
    liEls.forEach((li, j) => li.classList.toggle("on", x >= c.phases[j].t0 && x < c.phases[j].t1));
    const cp = c.phases.find((p) => x >= p.t0 && x < p.t1) || c.phases[c.phases.length - 1];
    nowCap.textContent = `Phase ${c.phases.indexOf(cp) + 1} of ${c.phases.length}: ${cp.name.replace("-", " ")} · ${hms(cp.t0)} to ${hms(cp.t1)}`;
    const lines = [[0, `campaign ${c.file} · ${c.phases.length} phases · ${c.runs_total} member runs`, false]];
    for (const p of c.phases) if (p.t0 <= x) lines.push([p.t0, `phase ${p.name} starts${Object.keys(p.carried || {}).length ? ` · carries ${Object.keys(p.carried).join(", ")}` : ""}`, false]);
    for (const e of c.events) if (e.t_s <= x) lines.push([e.t_s, e.label, e.alarm]);
    lines.sort((a, b) => a[0] - b[0]);
    log.replaceChildren(...lines.slice(-4).map(([tt, m, crit]) => { const r = el("div", crit ? "crit" : null); r.append(el("span", "t", hms(tt)), el("span", null, m)); return r; }));
  };
  setI(RM ? t.length - 1 : 0);
  if (!RM) {
    let on = false, t0 = 0, raf = 0; const period = 22000;
    const tick = (ts) => { if (!on || $("#cgp-chain").hidden) { raf = requestAnimationFrame(tick); return; } setI(Math.min(t.length - 1, Math.floor(((((ts - t0) % period + period) % period) / period) * t.length))); raf = requestAnimationFrame(tick); };
    watchVisible(cgWin, (v) => { on = v; if (v && !raf) { t0 = performance.now(); raf = requestAnimationFrame(tick); } });
  }
}
function revealIn(node) { if (RM || !("IntersectionObserver" in window)) { node.classList.add("in"); return; } requestAnimationFrame(() => requestAnimationFrame(() => node.classList.add("in"))); }
function cgSweep(m) {
  const box = $("#cgSweep"); box.replaceChildren();
  const svgEl = S("svg", { viewBox: "0 0 560 260", "aria-hidden": "true" }, box);
  const f = frame(svgEl, 560, 260, { l: 44, r: 48, t: 16, b: 34 }), xs = m.x, x0 = xs[0], x1 = xs[xs.length - 1];
  const X = (x) => f.P.l + ((x - x0) / (x1 - x0)) * f.w, Ya = (a) => f.P.t + f.h - a * f.h;
  const js = m.m.mean_js, jlo = Math.min(...js), jhi = Math.max(...js), Yj = (v) => f.P.t + f.h - ((v - jlo) / (jhi - jlo)) * f.h;
  axes(svgEl, f, xs.filter((_, i) => i % 3 === 0).map((x) => [X(x), `${x} ${m.unit}`]), [[Ya(0), "0 %"], [Ya(0.5), "50 %"], [Ya(1), "100 %"]]);
  for (const v of [jlo, (jlo + jhi) / 2, jhi]) S("text", { x: f.W - f.P.r + 4, y: Yj(v) + 3 }, svgEl, `${n(v, 0)} dB`);
  S("path", { d: pathOf(xs.map((x, i) => [X(x), Yj(js[i])])), class: "ln", stroke: "var(--amber)", "stroke-dasharray": "5 4" }, svgEl);
  S("path", { d: pathOf(xs.map((x, i) => [X(x), Ya(m.m.availability[i])])), class: "ln draw", stroke: "var(--cyan)", pathLength: 1 }, svgEl);
  xs.forEach((x, i) => S("circle", { cx: X(x), cy: Ya(m.m.availability[i]), r: 3.5, fill: "var(--cyan)" }, svgEl));
  S("text", { x: f.P.l + f.w / 2, y: f.H - 4, "text-anchor": "middle" }, svgEl, `jammer transmit power (${m.key})`);
  const drop = xs.findIndex((_, i) => m.m.availability[i] < 1), gone = xs.findIndex((_, i) => m.m.availability[i] === 0);
  const txt = el("div", "cg-txt");
  txt.innerHTML = `<h3>${m.title}</h3><p>One <code>${m.scenario_kind}</code> scenario, run once per node as the jammer's transmit power steps from ${x0} to ${x1} ${m.unit}. Availability under jamming (solid) and mean J/S (dashed) come from each member run's own figures of merit.</p><div class="cg-leg"><span style="--c:var(--cyan)"><i></i>availability</span><span style="--c:var(--amber)"><i class="dash"></i>mean J/S</span></div>`;
  const dl = el("dl", "cg-kv");
  dl.append(kv("Nodes", ni(xs.length)), kv("First loss", drop >= 0 ? `${xs[drop]} ${m.unit}` : "none"), kv("All lost from", gone >= 0 ? `${xs[gone]} ${m.unit}` : "never"), kv("J/S span", `${n(jlo, 0)}–${n(jhi, 0)} dB`));
  txt.append(dl); box.append(txt); revealIn(box);
}
function cgMonte(m) {
  const box = $("#cgMonte"); box.replaceChildren();
  const svgEl = S("svg", { viewBox: "0 0 560 260", "aria-hidden": "true" }, box);
  const f = frame(svgEl, 560, 260, { l: 40, r: 12, t: 16, b: 34 }), s = m.samples, lo = Math.min(...s), hi = Math.max(...s);
  const NB = 24, bw = (hi - lo) / NB, bins = new Array(NB).fill(0); for (const v of s) bins[Math.min(NB - 1, Math.floor((v - lo) / bw))]++;
  const cmax = Math.max(...bins), X = (v) => f.P.l + ((v - lo) / (hi - lo)) * f.w, Y = (c) => f.P.t + f.h - (c / cmax) * f.h;
  axes(svgEl, f, [[X(lo), `${n(lo, 0)} ${m.unit}`], [X(0), "0"], [X(hi), `${n(hi, 0)} ${m.unit}`]], [[Y(0), "0"], [Y(cmax), ni(cmax)]]);
  bins.forEach((c, i) => S("rect", { x: X(lo + i * bw) + 1, y: Y(c), width: Math.max(1, (f.w / NB) - 2), height: Y(0) - Y(c), fill: "var(--cyan)", opacity: .75, class: "bar" }, svgEl));
  for (const [k, lab] of [["p05", "5th"], ["p50", "median"], ["p95", "95th"]]) { const x = X(m.stats[k]); S("line", { x1: x, x2: x, y1: f.P.t, y2: f.P.t + f.h, stroke: "var(--amber)", "stroke-dasharray": "4 3" }, svgEl); S("text", { x: x + 3, y: f.P.t + 10 }, svgEl, lab); }
  S("text", { x: f.P.l + f.w / 2, y: f.H - 4, "text-anchor": "middle" }, svgEl, `final clock error over ${ni(m.runs)} seeds (${m.path})`);
  const txt = el("div", "cg-txt");
  txt.innerHTML = `<h3>${m.title}</h3><p>The same <code>${m.scenario_kind}</code> scenario run ${ni(m.runs)} times from base seed ${m.base_seed}, one seed each: the spread of the free-running clock's final error, with its 95 % confidence interval on the mean.</p>`;
  const dl = el("dl", "cg-kv");
  dl.append(kv("Mean", `${n(m.stats.mean, 2)} ${m.unit}`), kv("Standard deviation", `${n(m.stats.std, 2)} ${m.unit}`), kv("5th to 95th", `${n(m.stats.p05, 1)} to ${n(m.stats.p95, 1)}`), kv("Mean, 95 % interval", `${n(m.stats.ci95_low, 2)} to ${n(m.stats.ci95_high, 2)}`));
  txt.append(dl); box.append(txt); revealIn(box);
}
function cgCompose(m) {
  const box = $("#cgCompose"); box.replaceChildren();
  const svgEl = S("svg", { viewBox: "0 0 560 240", "aria-hidden": "true" }, box);
  const metrics = [["availability", "Availability", (v) => `${n(v * 100, 0)} %`, 1], ["mean_js", "Mean J/S", (v) => `${n(v, 1)} dB`, Math.max(...m.members.map((x) => x.metrics.mean_js)) * 1.1], ["min_tracking", "Fewest tracked", (v) => ni(v), Math.max(4, ...m.members.map((x) => x.metrics.min_tracking))]];
  const cols = ["var(--cyan)", "var(--magenta)"];
  metrics.forEach(([k, lab, fm, mx], r) => {
    const y0 = 20 + r * 74; S("text", { x: 0, y: y0 }, svgEl, lab);
    m.members.forEach((mem, j) => { const y = y0 + 10 + j * 24, w = (mem.metrics[k] / mx) * 330; S("text", { x: 0, y: y + 13 }, svgEl, mem.name); S("rect", { x: 150, y, width: Math.max(2, w), height: 16, rx: 4, fill: cols[j], opacity: .8, class: "bar" }, svgEl); S("text", { x: 150 + Math.max(2, w) + 6, y: y + 13 }, svgEl, fm(mem.metrics[k])); });
  });
  const sh = m.shared;
  const txt = el("div", "cg-txt");
  txt.innerHTML = `<h3>${m.title}</h3><p>One jammer, ${n(sh.jammer_power.value, 0)} ${sh.jammer_power.unit}, at one place, bound into ${m.members.length} member runs of the <code>${m.members[0].kind}</code> kind: a ship in a strait and a car on a coast road see the same cause and get different answers.</p>`;
  box.append(txt); revealIn(box);
}

// ================================================================== 07 the solar system (solar-system and body-pnt kinds)
const ssSec = document.getElementById("journey");
if (ssSec && document.getElementById("ssGrid")) onNear(ssSec, () => data().then((d) => initSS(d)).catch((e) => console.warn("solar system:", e)), "700px");
const ORDER = ["Sun", "Mercury", "Venus", "Earth", "Moon", "Mars", "Phobos", "Deimos", "Jupiter", "Io", "Europa", "Ganymede", "Callisto", "Saturn", "Titan", "Uranus", "Neptune", "Pluto"];
function initSS(d) {
  const sol = d.solar, img = d.imagery, eng = d.engine;
  const B = Object.fromEntries(sol.bodies.map((b) => [b.name, b]));
  const names = ORDER.filter((x) => B[x]).concat(sol.bodies.map((b) => b.name).filter((x) => !ORDER.includes(x)));
  prov($('[data-cprov="solar"]'), sol, eng);
  // credits, grouped by source
  const groups = {};
  for (const nm of names) { const c = img.bodies[nm]; if (!c) continue; const k = `${c.credit} (${c.licence})`; (groups[k] ||= []).push(nm + (c.padded ? "*" : "")); }
  $("#ssCredit").textContent = "Imagery: " + Object.entries(groups).map(([k, v]) => `${v.join(", ")}: ${k}`).join(" · ") + ". * Map stops short of the poles; the gap takes the map's polar mean colour. Saturn's rings: " + img.ring.credit + ` (${img.ring.licence}).`;
  // picker thumbnails straight from the atlas (80 x 40 px per tile; the round window shows its middle)
  const picker = $("#ssPicker"), cols = img.cols, rows = img.rows;
  picker.replaceChildren(); // the build's plain list of body names gives way to the thumbnails
  const thumb = (nm) => { const i = img.bodies[nm].i, c = i % cols, r = Math.floor(i / cols); return `background-image:url(${ROOT}assets/capabilities/bodies.jpg);background-size:${cols * 80}px ${rows * 40}px;background-position:${-(c * 80 + 20)}px ${-(r * 40)}px`; };
  let selected = "Earth", view = null, globe = null;
  names.forEach((nm, i) => {
    const b = B[nm];
    if (i && b.class !== "moon" && B[names[i - 1]].class === "moon") picker.append(el("span", "sep"));
    const bt = el("button"); bt.type = "button"; bt.setAttribute("role", "option"); bt.setAttribute("aria-selected", nm === selected); bt.dataset.body = nm;
    const th = el("span", "th"); th.setAttribute("style", thumb(nm)); bt.append(th, el("span", null, nm));
    bt.addEventListener("click", () => select(nm));
    picker.append(bt);
  });
  picker.addEventListener("keydown", (e) => { const m = { ArrowRight: 1, ArrowLeft: -1 }[e.key]; if (!m) return; e.preventDefault(); const j = clamp(names.indexOf(selected) + m, 0, names.length - 1); select(names[j]); $(`button[data-body="${names[j]}"]`, picker).focus(); });
  function select(nm, fly = true) {
    selected = nm;
    for (const b of $$("button[data-body]", picker)) { const on = b.dataset.body === nm; b.setAttribute("aria-selected", on); b.tabIndex = on ? 0 : -1; }
    facts(B[nm]); pnt(nm);
    if (view) view.select(nm, fly); if (globe) globe.show(nm);
  }
  function facts(b) {
    const box = $("#ssFacts"); box.replaceChildren();
    const lab = b.label === "VALIDATED" ? ["v", "Validated"] : b.label === "MODELLED" ? ["m", "Modelled"] : ["o", "Frame origin"];
    const h = el("div", "ss-fh"); const h3 = el("h3", null, b.name); const sm = el("small", null, `${b.class.replace("-", " ")}${b.parent ? ` of ${b.parent}` : ""} · NAIF ${b.naif}`); const pill = el("span", `ss-lab ${lab[0]}`, lab[1]);
    h.append(h3, pill); box.append(h, sm);
    const dl = el("dl", "ss-dl");
    const rot = b.rot_h == null ? "–" : `${n(Math.abs(b.rot_h), Math.abs(b.rot_h) < 100 ? 2 : 1)} h${b.rot_h < 0 ? ", retrograde" : ""}`;
    dl.append(kv("Mean radius", `${ni(b.r_km)} km`), kv("GM", ((x) => { const [m0, e] = x.toExponential(4).split("e"); return `${m0} × 10${String(+e).split("").map((c) => SUP[c]).join("")} m³/s²`; })(b.gm)),
      kv("J2", b.j2 == null ? "none published" : b.j2.toExponential(3)), kv("Sidereal rotation", rot));
    if (b.class !== "star") dl.append(kv(b.parent === "Sun" ? "Orbital period" : `Period about ${b.parent}`, b.period_d == null ? "–" : b.period_d > 1000 ? `${n(b.period_d / 365.25, 2)} years` : `${n(b.period_d, 2)} days`),
      kv("From the Sun", `${n(b.dist_au, 3)} au`));
    if (b.light_s != null && b.name !== sol.observer) dl.append(kv(`Light time from ${sol.observer}`, b.light_s > 120 ? `${n(b.light_s / 60, 1)} min` : `${n(b.light_s, 2)} s`), kv("Angle from the Sun", `${n(b.sun_sep, 1)}°`));
    dl.append(kv("IAU pole (RA, Dec)", `${n(b.pole_ra, 2)}°, ${n(b.pole_dec, 2)}°`));
    box.append(dl);
    box.append(el("p", "ss-fnote ss-gloss", "NAIF: the body code of NASA's Navigation and Ancillary Information Facility. GM: gravitational parameter. J2: oblateness term. IAU pole: the International Astronomical Union rotation pole, as right ascension (RA) and declination (Dec)."));
    const links = sol.links.filter((l) => l.from === b.name || l.to === b.name);
    const lt = (x) => (x >= 120 ? `${n(x / 60, 1)} min` : `${n(x, 2)} s`);
    if (links.length) box.append(el("p", "ss-fnote", `Link${links.length > 1 ? "s" : ""} this run computes: ` + links.map((l) => `${l.from} to ${l.to}, one-way light time ${lt(l.light_s)}, round trip ${lt(l.two_way_s)}`).join(" · ")));
    const moons = sol.bodies.filter((m) => m.parent === b.name && m.class === "moon");
    if (moons.length) {
      const wrap = el("div", "ss-moons"); wrap.append(el("div", "wv-bh", `${moons.length === 1 ? "Its moon" : "Its moons"}, to scale, at the epoch`));
      const svgEl = S("svg", { viewBox: "-110 -60 220 120", "aria-hidden": "true" }, wrap);
      const rmax = Math.max(...moons.map((m) => Math.max(...m.track_km.map((p) => Math.hypot(...p))))), k = 55 / rmax;
      S("circle", { cx: 0, cy: 0, r: Math.max(1.5, b.r_km * k), fill: "#c9d4ef", opacity: .5 }, svgEl);
      const pr = (p) => { const v = toEcl(p); return [v[0] * k, -v[1] * k]; };
      for (const m of moons) {
        S("path", { d: pathOf(m.track_km.map(pr)) + "Z", fill: "none", stroke: "#56637f" }, svgEl);
        const q = pr(m.rel_km); S("circle", { cx: q[0], cy: q[1], r: 2.4, fill: "#3ddcf7" }, svgEl); S("text", { x: q[0] + 4, y: q[1] - 3 }, svgEl, m.name);
      }
      wrap.append(el("p", "ss-fnote", "Seen from the north of the ecliptic."));
      box.append(wrap);
    }
    box.append(el("p", "ss-fnote", `${b.method}${b.error ? ` · nominal error ${ni(b.error.distance_m / 1000)} km in distance` : ""}`));
  }
  // the ecliptic, recovered from the Earth's own track (its orbit normal), so no obliquity is typed
  const tr = B.Earth.track_au; let nz = [0, 0, 0];
  for (let i = 0; i < tr.length - 1; i++) { const a = tr[i], b = tr[i + 1]; nz = [nz[0] + a[1] * b[2] - a[2] * b[1], nz[1] + a[2] * b[0] - a[0] * b[2], nz[2] + a[0] * b[1] - a[1] * b[0]]; }
  const nl = Math.hypot(...nz); nz = nz.map((x) => x / nl);
  let ex = [1 - nz[0] * nz[0], -nz[0] * nz[1], -nz[0] * nz[2]]; const el2 = Math.hypot(...ex); ex = ex.map((x) => x / el2);
  const ey = [nz[1] * ex[2] - nz[2] * ex[1], nz[2] * ex[0] - nz[0] * ex[2], nz[0] * ex[1] - nz[1] * ex[0]];
  const dot = (a, b) => a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
  function toEcl(v) { return [dot(v, ex), dot(v, ey), dot(v, nz)]; }
  function pnt(nm) {
    const box = $("#ssPnt"), m = d.body_pnt[nm];
    if (!m) { box.hidden = true; return; }
    box.hidden = false; box.replaceChildren();
    const txt = el("div");
    const user = m.user.kind === "surface" ? `a lander at ${n(m.user.lat_deg, 0)}°, ${n(m.user.lon_deg, 0)}° on the surface` : `an orbiting user`;
    txt.append(el("div", "wv-bh", "Positioning at this body · body-pnt kind"), el("h4", null, `${m.relays} relays at ${ni(m.relay_alt_km)} km around ${m.body}`));
    txt.append(el("p", null, `${user[0].toUpperCase() + user.slice(1)} navigates on the relays, with a two-way range from Earth whenever Earth is above the horizon (one-way light time ${n(m.light_s / 60, 1)} min). Availability: ${n(m.fom.availability_relays * 100, 1)} % on the relays alone, ${n(m.fom.availability_with_earth * 100, 1)} % with the Earth link.`));
    const pv = el("p", "prov cap-prov"); txt.append(pv); prov(pv, m, eng);
    const svgEl = S("svg", { viewBox: "0 0 560 170", "aria-hidden": "true" });
    const f = frame(svgEl, 560, 170, { l: 36, t: 12, b: 22 }), T = m.t[m.t.length - 1], vmax = Math.max(...m.n_vis, 4) + 1;
    const X = (t) => f.P.l + (t / T) * f.w, Y = (v) => f.P.t + f.h - (v / vmax) * f.h;
    m.earth.forEach((e, i) => { if (e && i < m.t.length - 1) S("rect", { x: X(m.t[i]), y: f.P.t, width: X(m.t[i + 1]) - X(m.t[i]) + 0.4, height: f.h, fill: "#3ddcf7", opacity: .1 }, svgEl); });
    axes(svgEl, f, [[X(0), "0"], [X(T / 2), dur(T / 2)], [X(T), dur(T)]], [[Y(0), "0"], [Y(4), "4"], [Y(vmax - 1), ni(vmax - 1)]]);
    S("path", { d: pathOf(m.t.flatMap((t, i) => [[X(t), Y(m.n_vis[i])], [X(m.t[i + 1] ?? t), Y(m.n_vis[i])]])), fill: "none", stroke: "#ffb547", "stroke-width": 1.6 }, svgEl);
    S("line", { x1: f.P.l, x2: f.W - f.P.r, y1: Y(4), y2: Y(4), stroke: "#ff6a5c", "stroke-dasharray": "4 3" }, svgEl);
    S("text", { x: f.P.l + 4, y: f.P.t + 9 }, svgEl, "relays in view (line) · Earth above the horizon (shaded) · four needed for a fix");
    box.append(txt, svgEl);
  }
  select(selected);
  if (!webgl()) { const g = $("#ssGlobe"); const fl = el("div", "ss-flat"); fl.setAttribute("style", thumb(selected)); g.append(fl); return; }
  three().then((THREE) => {
    const atlas = new THREE.TextureLoader().load(`${ROOT}assets/capabilities/bodies.jpg`, () => { if (view) view.dirty(); if (globe) globe.dirty(); });
    atlas.colorSpace = THREE.SRGBColorSpace; atlas.generateMipmaps = false; atlas.minFilter = THREE.LinearFilter; atlas.wrapS = atlas.wrapT = THREE.ClampToEdgeWrapping;
    const ctx = { THREE, B, names, img, atlas, toEcl, sol };
    view = makeOrrery(ctx, (nm) => select(nm));
    globe = makeGlobe(ctx);
    select(selected, false);
  }).catch((e) => console.warn("three:", e));
}
function tileTex(ctx, nm) {
  const { THREE, img, atlas } = ctx, i = img.bodies[nm].i, c = i % img.cols, r = Math.floor(i / img.cols);
  const t = atlas.clone(); const ex = 1.5 / (img.cols * img.tile[0]), ey = 1.5 / (img.rows * img.tile[1]);
  t.repeat.set(1 / img.cols - 2 * ex, 1 / img.rows - 2 * ey); t.offset.set(c / img.cols + ex, 1 - (r + 1) / img.rows + ey); t.needsUpdate = true; return t;
}
function ringMesh(ctx, b, scale) {
  const { THREE, img } = ctx;
  const px = img.ring.rgba, data8 = new Uint8Array(px.length * 4); px.forEach((p, i) => data8.set(p, i * 4));
  const t = new THREE.DataTexture(data8, px.length, 1, THREE.RGBAFormat); t.colorSpace = THREE.SRGBColorSpace; t.needsUpdate = true; t.magFilter = THREE.LinearFilter;
  const r0 = 1.24 * scale, r1 = 2.27 * scale; // display radii of the main rings, in equatorial radii
  const g = new THREE.RingGeometry(r0, r1, 160, 1); const pos = g.attributes.position, uv = g.attributes.uv;
  for (let i = 0; i < pos.count; i++) { const r = Math.hypot(pos.getX(i), pos.getY(i)); uv.setXY(i, (r - r0) / (r1 - r0), 0.5); }
  const m = new THREE.Mesh(g, new THREE.MeshBasicMaterial({ map: t, transparent: true, side: THREE.DoubleSide, depthWrite: false }));
  m.rotation.x = -Math.PI / 2; return m;
}
// Orientation at the epoch from the IAU pole and prime meridian, in the display (ecliptic) frame.
function bodyQuat(ctx, b) {
  const { THREE, toEcl } = ctx, D2R = Math.PI / 180, ra = b.pole_ra * D2R, de = b.pole_dec * D2R, W = (b.pm_deg || 0) * D2R;
  const P = [Math.cos(de) * Math.cos(ra), Math.cos(de) * Math.sin(ra), Math.sin(de)], N = [-Math.sin(ra), Math.cos(ra), 0];
  const PxN = [P[1] * N[2] - P[2] * N[1], P[2] * N[0] - P[0] * N[2], P[0] * N[1] - P[1] * N[0]];
  const M = [0, 1, 2].map((i) => N[i] * Math.cos(W) + PxN[i] * Math.sin(W)), E2 = [P[1] * M[2] - P[2] * M[1], P[2] * M[0] - P[0] * M[2], P[0] * M[1] - P[1] * M[0]];
  const d3 = (v) => { const e = toEcl(v); return new THREE.Vector3(e[0], e[2], -e[1]); };
  const m4 = new THREE.Matrix4().makeBasis(d3(M), d3(P), d3(E2).negate());
  return new THREE.Quaternion().setFromRotationMatrix(m4);
}
const spinRate = (b) => (b.rot_h ? Math.sign(b.rot_h) * (2 * Math.PI) / (8 * clamp(Math.abs(b.rot_h) / 24, 0.5, 30)) : 0);
function bodyObject(ctx, b, R) {
  const { THREE } = ctx;
  const grp = new THREE.Group(); grp.quaternion.copy(bodyQuat(ctx, b));
  const mat = b.class === "star" ? new THREE.MeshBasicMaterial({ map: tileTex(ctx, b.name) }) : new THREE.MeshLambertMaterial({ map: tileTex(ctx, b.name) });
  const mesh = new THREE.Mesh(new THREE.SphereGeometry(R, 64, 40), mat); grp.add(mesh);
  if (b.name === "Saturn") grp.add(ringMesh(ctx, b, R * (b.r_eq_km / b.r_km)));
  grp.userData = { mesh, spin: spinRate(b) };
  return grp;
}
function makeOrrery(ctx, onPick) {
  const { THREE, B, names, toEcl, sol } = ctx;
  const host = $("#ssOrrery"), labels = $("#ssLabels");
  const canvas = document.createElement("canvas"); canvas.tabIndex = 0; canvas.setAttribute("aria-label", "The solar system at the run's epoch: drag or arrow keys to turn, plus and minus to zoom"); host.prepend(canvas);
  const renderer = new THREE.WebGLRenderer({ canvas, antialias: true, alpha: true, powerPreference: "low-power" }); renderer.outputColorSpace = THREE.SRGBColorSpace;
  const scene = new THREE.Scene(), camera = new THREE.PerspectiveCamera(40, 1, 0.01, 500);
  scene.add(new THREE.AmbientLight(0xffffff, 0.28)); const sunL = new THREE.PointLight(0xffffff, 2.4, 0, 0); scene.add(sunL);
  const K = 3, rc = (au) => K * Math.log(1 + au / 0.35);
  const disp = (au) => { const e = toEcl(au), r = Math.hypot(...e); const s = r > 0 ? rc(r) / r : 0; return new THREE.Vector3(e[0] * s, e[2] * s, -e[1] * s); };
  const size = (b) => (b.class === "star" ? 0.9 : b.class === "moon" ? 0.045 + 0.035 * Math.log10(b.r_km / 10 + 1) : 0.16 + 0.15 * Math.log10(Math.max(b.r_km, 1000) / 1000));
  const pos = {}, objs = {};
  for (const nm of names) { const b = B[nm]; if (b.class !== "moon") pos[nm] = disp(b.pos_au); }
  const moonDist = (m, dkm) => { const p = B[m.parent]; return size(p) * (1.7 + 1.3 * Math.log10(Math.max(dkm / p.r_km, 1.5))); };
  const moonPos = (m, km) => { const e = toEcl(km), r = Math.hypot(...e), s = moonDist(m, r) / r; return new THREE.Vector3(e[0] * s, e[2] * s, -e[1] * s).add(pos[m.parent]); };
  for (const nm of names) { const b = B[nm]; if (b.class === "moon") pos[nm] = moonPos(b, b.rel_km); }
  // orbits
  const lineMat = (c, o) => new THREE.LineBasicMaterial({ color: c, transparent: true, opacity: o, depthWrite: false });
  for (const nm of names) {
    const b = B[nm]; if (b.class === "star") continue;
    const ptsA = b.class === "moon" ? b.track_km.map((p) => moonPos(b, p)) : b.track_au.map(disp);
    const g = new THREE.BufferGeometry().setFromPoints(ptsA.concat([ptsA[0]]));
    scene.add(new THREE.Line(g, lineMat(b.class === "moon" ? 0x56637f : 0x5a7fd0, b.class === "moon" ? 0.55 : 0.45)));
  }
  for (const nm of names) { const b = B[nm], o = bodyObject(ctx, b, size(b)); o.position.copy(pos[nm]); scene.add(o); objs[nm] = o; }
  // links: straight lines between the linked bodies at the epoch
  for (const l of sol.links) {
    const g = new THREE.BufferGeometry().setFromPoints([pos[l.from], pos[l.to]]);
    const ln = new THREE.Line(g, new THREE.LineDashedMaterial({ color: 0xffb547, dashSize: 0.25, gapSize: 0.18, transparent: true, opacity: 0.8 })); ln.computeLineDistances(); scene.add(ln);
  }
  const lab = {};
  for (const nm of names) {
    const b = B[nm], bt = el("button", b.class === "moon" ? "moon" : null, nm); bt.type = "button"; bt.tabIndex = -1; bt.setAttribute("aria-pressed", "false");
    bt.addEventListener("click", () => onPick(nm)); labels.append(bt); lab[nm] = bt;
  }
  // the whole system framed in the window: the outermost orbit fits its narrower side
  const Rsys = Math.max(...names.filter((nm) => B[nm].class !== "moon" && B[nm].class !== "star").map((nm) => rc(Math.max(...B[nm].track_au.map((p) => Math.hypot(...p))))));
  const fitPhi = () => (host.clientWidth / Math.max(1, host.clientHeight) < 1.1 ? 0.62 : 0.9);
  const fitDist = () => { const a = host.clientWidth / Math.max(1, host.clientHeight), tv = Math.tan((camera.fov * Math.PI) / 360), th = tv * a; return clamp((Rsys * 1.08) / Math.min(tv / Math.max(0.35, Math.cos(fitPhi()) * 0.9 + 0.1), th), 8, 80); };
  const st = { theta: 0.5, phi: fitPhi(), dist: fitDist(), min: 0.6, max: 80 }, target = new THREE.Vector3(), goal = new THREE.Vector3();
  let sel = null, dirty = true, visible = false, last = 0, distGoal = null;
  orbitControls(canvas, st, () => { dirty = true; distGoal = null; });
  for (const b of $$("[data-ss]", host)) b.addEventListener("click", () => { const a = b.dataset.ss; if (a === "in") st.dist = clamp(st.dist / 1.4, st.min, st.max); if (a === "out") st.dist = clamp(st.dist * 1.4, st.min, st.max); if (a === "reset") { goal.set(0, 0, 0); distGoal = fitDist(); st.theta = 0.5; st.phi = fitPhi(); } dirty = true; });
  const hud = $("#ssHud");
  hud.innerHTML = `<span>Epoch <b>${sol.epoch.input.replace("T", " ")}</b> · TDB (Barycentric Dynamical Time), Julian date ${sol.epoch.jd_tdb.toFixed(3)}</span><span>${sol.bodies.length} bodies · observer <b>${sol.observer}</b></span>`;
  function select(nm, fly = true) {
    sel = nm; for (const k in lab) lab[k].setAttribute("aria-pressed", k === nm);
    if (!fly) { dirty = true; return; }
    const b = B[nm]; goal.copy(pos[nm]);
    const moons = names.filter((m) => B[m].parent === nm && B[m].class === "moon");
    const ext = moons.length ? Math.max(...moons.map((m) => pos[m].distanceTo(pos[nm]))) : size(b) * 3;
    distGoal = nm === "Sun" ? fitDist() : clamp(ext * 4.2, 1.2, 40); dirty = true;
  }
  const v3 = new THREE.Vector3();
  function render(ts) {
    requestAnimationFrame(render);
    if (!visible) { last = ts; return; }
    const dt = Math.min(0.1, (ts - (last || ts)) / 1000); last = ts;
    if (!RM) { for (const nm in objs) objs[nm].userData.mesh.rotation.y += objs[nm].userData.spin * dt; dirty = true; }
    if (target.distanceTo(goal) > 1e-3) { target.lerp(goal, RM ? 1 : 0.08); dirty = true; }
    if (distGoal != null) { st.dist += (distGoal - st.dist) * (RM ? 1 : 0.08); if (Math.abs(distGoal - st.dist) < 1e-3) distGoal = null; dirty = true; }
    if (!dirty) return;
    camera.position.set(target.x + st.dist * Math.sin(st.phi) * Math.sin(st.theta), target.y + st.dist * Math.cos(st.phi), target.z + st.dist * Math.sin(st.phi) * Math.cos(st.theta)); camera.lookAt(target);
    renderer.render(scene, camera); dirty = false;
    const w = host.clientWidth, h = host.clientHeight, selParent = sel && (B[sel].class === "moon" ? B[sel].parent : sel);
    for (const nm of names) {
      const b = B[nm]; v3.copy(pos[nm]).project(camera);
      const lx = ((v3.x + 1) / 2) * w, ly = ((1 - v3.y) / 2) * h;
      const hide = v3.z > 1 || (b.class === "moon" && b.parent !== selParent && st.dist > 6) || lx < 4 || lx > w - 4 || ly < 40 || ly > h - 70;
      const bt = lab[nm]; bt.classList.toggle("hide", hide); if (hide) continue;
      bt.classList.toggle("flip", lx > w - 90); // near the right edge the label sits on the body's left
      bt.style.left = `${lx}px`; bt.style.top = `${ly}px`;
    }
  }
  sizeRenderer(renderer, camera, host);
  { const ro = new ResizeObserver(() => { sizeRenderer(renderer, camera, host); dirty = true; }); ro.observe(host); ro.observe(renderer.domElement); document.addEventListener("fullscreenchange", () => requestAnimationFrame(() => { sizeRenderer(renderer, camera, host); dirty = true; })); }
  watchVisible(host, (v) => { visible = v; dirty = true; });
  requestAnimationFrame(render);
  return { select, dirty: () => { dirty = true; } };
}
function makeGlobe(ctx) {
  const { THREE, B } = ctx;
  const host = $("#ssGlobe");
  const canvas = document.createElement("canvas"); canvas.setAttribute("aria-hidden", "true"); host.prepend(canvas);
  const renderer = new THREE.WebGLRenderer({ canvas, antialias: true, alpha: true, powerPreference: "low-power" }); renderer.outputColorSpace = THREE.SRGBColorSpace;
  const scene = new THREE.Scene(), camera = new THREE.PerspectiveCamera(30, 1, 0.01, 100);
  scene.add(new THREE.AmbientLight(0xffffff, 0.22)); const sun = new THREE.DirectionalLight(0xffffff, 2.2); scene.add(sun);
  const st = { theta: 0, phi: 1.35, dist: 4.4, min: 1.6, max: 9 };
  let obj = null, cur = null, dirty = true, visible = false, last = 0;
  orbitControls(host, st, () => { dirty = true; });
  const cache = {};
  function show(nm) {
    cur = nm; const b = B[nm];
    if (obj) scene.remove(obj);
    obj = cache[nm] ||= bodyObject(ctx, b, 1);
    scene.add(obj);
    st.dist = b.name === "Saturn" ? 7.4 : 4.4; st.max = b.name === "Saturn" ? 12 : 9;
    // lit from the Sun's real direction at the epoch
    const e = ctx.toEcl(b.pos_au.map((x) => -x)); sun.position.set(e[0], e[2], -e[1]).normalize().multiplyScalar(10);
    if (b.class === "star") sun.position.set(0, 0, 10);
    // face the camera toward the lit hemisphere
    st.theta = Math.atan2(sun.position.x, sun.position.z) - 0.5; dirty = true;
    host.setAttribute("aria-label", `${nm} on its real imagery (${ctx.img.bodies[nm].credit}). Drag or use the arrow keys to turn it; plus and minus zoom.`);
  }
  function render(ts) {
    requestAnimationFrame(render);
    if (!visible) { last = ts; return; }
    const dt = Math.min(0.1, (ts - (last || ts)) / 1000); last = ts;
    if (obj && !RM) { obj.userData.mesh.rotation.y += obj.userData.spin * dt; dirty = true; }
    if (!dirty) return;
    camera.position.set(st.dist * Math.sin(st.phi) * Math.sin(st.theta), st.dist * Math.cos(st.phi), st.dist * Math.sin(st.phi) * Math.cos(st.theta)); camera.lookAt(0, 0, 0);
    renderer.render(scene, camera); dirty = false;
  }
  sizeRenderer(renderer, camera, host);
  { const ro = new ResizeObserver(() => { sizeRenderer(renderer, camera, host); dirty = true; }); ro.observe(host); ro.observe(renderer.domElement); document.addEventListener("fullscreenchange", () => requestAnimationFrame(() => { sizeRenderer(renderer, camera, host); dirty = true; })); }
  watchVisible(host, (v) => { visible = v; dirty = true; });
  requestAnimationFrame(render);
  return { show, dirty: () => { dirty = true; } };
}

// ================================================================== kept: the holdover reader (#holdover)
// Each bar reads a recorded run's time error at t seconds after GNSS was lost.
{
  const series = [];
  const cols = ["var(--cyan)", "var(--amber)", "var(--lime)", "var(--magenta)", "var(--coral)", "var(--ink-3)"];
  for (const c of Object.values(D.hold || {})) {
    const m = c.model;
    const loss = m.outages && m.outages.length ? m.outages[0][0] : 0;
    for (const s of m.series) {
      const pts = s.points.filter((p) => p[0] >= loss).map((p) => [p[0] - loss, Math.abs(p[1])]);
      if (pts.length > 1) series.push({ label: s.label, file: c.file, unit: m.unit, pts, end: pts[pts.length - 1][0], thr: m.threshold });
    }
  }
  const bars = document.getElementById("hoBars"), slider = document.getElementById("hoS"), tOut = document.getElementById("hoT");
  if (bars && slider && series.length) {
    const tMax = Math.max(...series.map((s) => s.end));
    const rows = series.map((s, i) => {
      const r = el("div", "ho-bar"); r.style.setProperty("--c", cols[i % cols.length]);
      const nm = el("div", "nm"); nm.append(el("b", null, s.label), el("small", null, `${s.file}.toml`));
      const tr = el("div", "track"); const fill = el("i"); tr.appendChild(fill);
      const val = el("div", "val"); r.append(nm, tr, val); bars.appendChild(r); return { fill, val };
    });
    const all = series.flatMap((s) => s.pts.map((p) => p[1])).filter((v) => v > 0);
    const lo = Math.log10(Math.max(1e-3, Math.min(...all))), hi = Math.log10(Math.max(...all));
    const fmtT = (t) => (t >= 3600 ? `${fmt(t / 3600)} h` : t >= 60 ? `${fmt(t / 60)} min` : `${fmt(t)} s`);
    const update = () => {
      const t = (Number(slider.value) / 1000) * tMax; tOut.textContent = fmtT(t);
      series.forEach((s, i) => {
        const r = rows[i];
        if (t > s.end) { r.fill.style.width = "0%"; r.val.textContent = `run ends at ${fmtT(s.end)}`; return; }
        const p = nearestByX(s.pts, t), v = p ? p[1] : 0, w = v > 0 ? Math.max(1, ((Math.log10(v) - lo) / (hi - lo)) * 100) : 0;
        r.fill.style.width = `${Math.min(100, w).toFixed(1)}%`;
        r.val.textContent = `${fmt(v)} ${s.unit}${Number.isFinite(s.thr) && v > s.thr ? " · past guard" : ""}`;
      });
    };
    slider.addEventListener("input", update); update();
    // Play the loss forward while the card is on screen; any touch of the slider hands control to the reader.
    if (!RM) {
      let on = false, user = false, raf = 0, last = 0;
      bars.setAttribute("aria-live", "off"); // no announcements while it plays itself
      const stop = () => { user = true; cancelAnimationFrame(raf); bars.setAttribute("aria-live", "polite"); };
      for (const ev of ["pointerdown", "keydown", "wheel"]) slider.addEventListener(ev, stop, { passive: true });
      const tick = (ts) => { if (!on || user) return; const dt = last ? Math.min(100, ts - last) : 0; last = ts;
        let v = Number(slider.value) + dt * 0.06; if (v > 1000) v = 0; slider.value = String(Math.round(v)); update(); raf = requestAnimationFrame(tick); };
      watchVisible(slider.closest(".holdover") || slider, (vis) => { on = vis; cancelAnimationFrame(raf); last = 0; if (on && !user) raf = requestAnimationFrame(tick); });
    }
  }
}

// ================================================================== kept: one block, a different answer (#customise)
const demo = document.getElementById("czDemo");
function tomlBlocks(toml) {
  const out = []; let on = false, first = true;
  for (const raw of toml.split("\n")) {
    const line = raw.replace(/\s+#.*$/, "").trimEnd();
    if (/^\s*\[/.test(line)) { on = /^\s*\[\[?constellations?\]\]?\s*$/.test(line); if (on) { out.push({ h: line, add: /^\s*\[\[/.test(line) && !first, rows: [] }); first = false; } continue; }
    if (on && line.trim() && !/^\s*#/.test(line)) out[out.length - 1].rows.push(line.trim());
  }
  return out;
}
function fmtN(v, dd = 2) { return Number(v).toLocaleString("en-GB", { maximumFractionDigits: dd, minimumFractionDigits: dd }); }
async function loadDemo() {
  const cols = [...demo.querySelectorAll(".cz-col")];
  let runs;
  try {
    runs = await Promise.all(cols.map((c) => (D.orbits && D.orbits[c.dataset.run]) ? Promise.resolve(D.orbits[c.dataset.run])
      : fetch(`${ROOT}playground/recorded/${c.dataset.run}.json`).then((r) => { if (!r.ok) throw new Error(r.status); return r.json(); })
        .then((r) => ({ toml: r.toml, geometry: (typeof r.json === "string" ? JSON.parse(r.json) : r.json).geometry }))));
  } catch (e) {
    for (const c of cols) c.querySelector('[data-cz="toml"]').textContent = "The recorded run could not be loaded here; open it in the Studio instead.";
    return;
  }
  const geo = runs.map((r) => r.geometry);
  const pdopMax = Math.max(...geo.map((g) => g.median_pdop || 0), ...geo.map((g) => g.best_pdop || 0));
  cols.forEach((c, i) => {
    const g = geo[i], code = c.querySelector('[data-cz="toml"]');
    code.replaceChildren();
    for (const b of tomlBlocks(runs[i].toml)) { const s = document.createElement("span"); s.className = b.add ? "cz-add" : "cz-keep"; s.textContent = [b.h, ...b.rows].join("\n") + "\n"; code.appendChild(s); }
    const dl = c.querySelector('[data-cz="m"]'); dl.replaceChildren();
    const frac = g.samples_total ? g.samples_with_fix / g.samples_total : 0;
    const rows = [
      ["Samples with a position fix", `${g.samples_with_fix.toLocaleString("en-GB")} of ${g.samples_total.toLocaleString("en-GB")} (${Math.round(frac * 100)}%)`, frac, "var(--lime)"],
      ["Best PDOP", fmtN(g.best_pdop), g.best_pdop / pdopMax, "var(--cyan)"],
      ["Median PDOP", fmtN(g.median_pdop), g.median_pdop / pdopMax, "var(--cyan)"],
    ];
    for (const [k, v, w, col] of rows) {
      const dt = document.createElement("dt"); dt.textContent = k;
      const dd = document.createElement("dd"); const b = document.createElement("b"); b.textContent = v;
      const tr = document.createElement("span"); tr.className = "cz-track"; tr.setAttribute("aria-hidden", "true");
      const f = document.createElement("i"); f.style.width = `${Math.max(1, Math.min(100, w * 100)).toFixed(1)}%`; f.style.background = col; tr.appendChild(f);
      dd.append(b, tr); dl.append(dt, dd);
    }
  });
}
if (demo) onNear(demo, loadDemo, "1200px");

// ================================================================== kept: the Studio, loaded in place (#studio)
const smap = document.getElementById("studioMap");
if (smap) {
  const btn = smap.querySelector("[data-studio-load]"), live = smap.querySelector(".sm-live"), body = smap.querySelector(".sm-body");
  if (btn && live) btn.addEventListener("click", () => {
    if (!live.hidden) { live.hidden = true; live.replaceChildren(); body.hidden = false; smap.classList.remove("live"); btn.textContent = `Load ${STUDIO} here`; return; }
    const f = document.createElement("iframe");
    f.src = ROOT + smap.dataset.embed.replace(/&amp;/g, "&"); f.title = `${STUDIO}, embedded: the orbit-multignss run`; f.loading = "eager";
    live.replaceChildren(f); live.hidden = false; body.hidden = true; smap.classList.add("live");
    btn.textContent = "Show the outline again";
  });
}

// ================================================================== kept: the runs behind each body (#journey)
for (const b of document.querySelectorAll(".jr-more")) {
  b.addEventListener("click", () => {
    const box = document.getElementById(b.getAttribute("aria-controls"));
    const open = b.getAttribute("aria-expanded") !== "true";
    b.setAttribute("aria-expanded", open); box.hidden = !open;
  });
}
