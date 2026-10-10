// Missions page. Every picture here is drawn from real engine output:
//   - the six failure cards are the site's pre-rendered charts (recorded runs), replayed on scroll;
//   - the sector grade charts, the spoof replay and the clock-class chart read the recorded runs
//     in studio/recorded/ (the npm kshana package the Studio runs);
//   - the inertial cone reads data/series.json (the points the site's coasting chart plots);
//   - the jamming footprint is FOOTPRINT below: one run of scenarios/maritime-strait-jamming.toml
//     per grid cell with only [receiver] lat_deg / lon_deg changed, by the Studio's npm kshana
//     package (its pkg/) in Node, written by src/tools/gen_footprint.mjs (--check: fails if stale).
//     The unmodified scenario reproduces the recording exactly (mean J/S 47.996 dB). Each cell's
//     TOML is rebuilt here with the Studio's own patch helper and the same three-decimal
//     coordinates, so "open this run" hands the Studio the exact scenario that produced the cell.
//   - the hero's threat matrix counts the scenario cards of the sector console (the page itself);
//   - the engine-run cards (dashed edge), the LEO-PNT card, the ship-and-car campaign and the orbit
//     console read ./missions-runs.mjs, written by src/tools/gen_missions_runs.py from runs of the
//     engine binary (engine version, build, scenario SHA-256 and seed are in it).
// Sector tabs and #hash deep links are site.js.
// SVG is built as markup from engine numbers (escaped) and parsed with DOMParser.
import RUNS from "./missions-runs.mjs";
import { studioHref, studioHas } from "./studio-links.mjs";

const ROOT = "";
const RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
const STUDIO = (window.KSITE && window.KSITE.studio) || "Kshana Studio";
const NS = "http://www.w3.org/2000/svg";
const $ = (s, r = document) => r.querySelector(s);
const $$ = (s, r = document) => Array.from(r.querySelectorAll(s));
const esc = (s) => String(s).replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
const fmt = (v, d = 3) => {
  if (!Number.isFinite(v)) return "–";
  const a = Math.abs(v);
  if (a !== 0 && (a >= 1e5 || a < 1e-2)) { const [m, e] = v.toExponential(1).split("e"); return `${m}e${+e}`; }
  return a >= 100 ? v.toFixed(0) : Number(v.toPrecision(d)).toString();
};

// ------------------------------------------------------------------ data
const STUDIO_DATA = import("../studio/lib/packs.mjs").then((m) => m.createPackReader());
const recs = new Map();
function rec(file) {
  if (!recs.has(file)) {
    // The Studio's own reader: one file per scenario, or a pack of several, whichever it is served as.
    recs.set(file, STUDIO_DATA.then((d) => d.run(`${ROOT}studio/recorded/`, file)).then((a) => { if (!a) throw new Error(file); return a; })
      .then((a) => ({ a, r: typeof a.json === "string" ? JSON.parse(a.json) : a.json })));
  }
  return recs.get(file);
}
let seriesP = null;
const series = () => (seriesP ||= fetch(`${ROOT}data/series.json`).then((r) => r.json()));

const CSV = {};
function download(name, text) {
  const a = document.createElement("a");
  a.href = URL.createObjectURL(new Blob([text], { type: "text/csv" }));
  a.download = name;
  document.body.appendChild(a); a.click(); a.remove();
  setTimeout(() => URL.revokeObjectURL(a.href), 2000);
}
const cell = (v) => { v = v == null ? "" : String(v); return /[",\n#]/.test(v) ? `"${v.replace(/"/g, '""')}"` : v; };
document.addEventListener("click", (e) => {
  const b = e.target.closest("[data-mx-csv]");
  if (!b) return;
  const c = CSV[b.getAttribute("data-mx-csv")];
  if (c) download(`${b.getAttribute("data-mx-csv")}.csv`, c.head.map((h) => `# ${h}`).join("\n") + "\n" + c.rows.map((r) => r.map(cell).join(",")).join("\n") + "\n");
});

// ------------------------------------------------------------------ svg helpers
function svgEl(w, h, label) {
  return `<svg class="chart mx-chart" viewBox="0 0 ${w} ${h}" width="${w}" height="${h}" xmlns="${NS}" role="img" aria-label="${esc(label)}"><rect class="c-bg" width="${w}" height="${h}"/>`;
}
function mount(fig, svg) {
  const plot = $(".mx-plot", fig);
  const doc = new DOMParser().parseFromString(svg, "image/svg+xml");
  if (doc.querySelector("parsererror")) throw new Error("svg parse");
  const node = document.importNode(doc.documentElement, true);
  plot.replaceChildren(node);
  fig.classList.add("mx-ready");
  return node;
}
function fail(fig, msg) {
  const w = $(".mx-wait", fig);
  if (w) w.textContent = msg;
}
const logTicks = (a, b) => { const o = []; for (let e = Math.ceil(a); e <= Math.floor(b); e++) o.push(e); return o; };
const sup = (e) => `10<tspan dy="-5" font-size="8">${e}</tspan>`;

// In view: start once visible (and pause replays when off screen).
const seen = new WeakMap();
const io = "IntersectionObserver" in window ? new IntersectionObserver((es) => {
  for (const en of es) { const f = seen.get(en.target); if (f) f(en.isIntersecting); }
}, { rootMargin: "0px 0px -10% 0px" }) : null;
function onView(el, fn) {
  if (!io) { fn(true); return; }
  seen.set(el, fn); io.observe(el);
}

// A replay loop: progress 0..1 over `dur` ms, a hold at the end, then again; only while visible.
function replay(el, dur, draw) {
  if (RM) { draw(1); return; }
  let vis = false, t0 = null, raf = 0;
  const hold = 1800;
  const tick = (now) => {
    if (!vis) { raf = 0; return; }
    if (t0 === null) t0 = now;
    const e = (now - t0) % (dur + hold);
    draw(Math.min(1, e / dur));
    raf = requestAnimationFrame(tick);
  };
  draw(0);
  onView(el, (v) => { vis = v; if (v && !raf) { t0 = null; raf = requestAnimationFrame(tick); } });
}

// ------------------------------------------------------------------ six failure cards: replay
function failCards() {
  if (RM) return;
  $$("[data-mx-replay] figure.viz").forEach((fig) => {
    const svg = $(".viz-plot svg", fig);
    if (!svg) return;
    const lines = $$("polyline.c-line:not(.c-line-d), polyline.c-track, polyline.c-track-vis", svg); // dashed series fade in (a dash pattern cannot draw in)
    if (!lines.length) return;
    lines.forEach((l) => l.setAttribute("pathLength", "1"));
    fig.classList.add("mx-draw-ready");
    // A dot rides the longest real line, point by point.
    const main = lines.reduce((a, b) => (b.points.numberOfItems > a.points.numberOfItems ? b : a));
    const n = main.points.numberOfItems;
    const dot = document.createElementNS(NS, "circle");
    dot.setAttribute("r", "4.5"); dot.setAttribute("class", "mx-dot");
    dot.style.fill = `color-mix(in oklab, ${main.style.stroke || "var(--s-tim)"} 68%, #fff)`; // lifted so it reads on dark and on coloured ground
    svg.appendChild(dot);
    let drawn = false;
    replay(fig, 5200, (p) => {
      if (!drawn && p > 0) { fig.classList.add("mx-draw-in"); drawn = true; }
      if (n < 2) return;
      const pt = main.points.getItem(Math.min(n - 1, Math.round(p * (n - 1))));
      dot.setAttribute("cx", pt.x); dot.setAttribute("cy", pt.y);
    });
  });
}

// ------------------------------------------------------------------ sector charts: the recorded run replays
// Line charts draw in and a dot rides the longest real line; the jamming waterfall is revealed epoch by
// epoch behind a time cursor. Charts in hidden sector tabs start when their tab is shown.
function sectorCharts() {
  if (RM) return;
  const arm = (fig) => {
    if (fig.dataset.mxArmed) return true;
    const svg = $(".viz-plot svg", fig);
    if (!svg) return false;
    fig.dataset.mxArmed = "1";
    const lines = $$("polyline.c-line:not(.c-line-d)", svg); // dashed series fade in (a dash pattern cannot draw in)
    const lost = $$("rect.c-lost", svg);
    if (lines.length) {
      lines.forEach((l) => l.setAttribute("pathLength", "1"));
      fig.classList.add("mx-draw-ready");
      const main = lines.reduce((a, b) => (b.points.numberOfItems > a.points.numberOfItems ? b : a));
      const n = main.points.numberOfItems;
      const dot = document.createElementNS(NS, "circle");
      dot.setAttribute("r", "4.5"); dot.setAttribute("class", "mx-dot");
      dot.style.fill = `color-mix(in oklab, ${main.style.stroke || "var(--s-tim)"} 68%, #fff)`; // lifted so it reads on dark and on coloured ground
      svg.appendChild(dot);
      let drawn = false;
      replay(fig, 6000, (p) => {
        if (!drawn && p > 0) { fig.classList.add("mx-draw-in"); drawn = true; }
        if (n < 2) return;
        const pt = main.points.getItem(Math.min(n - 1, Math.round(p * (n - 1))));
        dot.setAttribute("cx", pt.x); dot.setAttribute("cy", pt.y);
      });
    } else if (lost.length) {
      let x0 = Infinity, x1 = -Infinity, y0 = Infinity, y1 = -Infinity;
      lost.forEach((r) => { const x = +r.getAttribute("x"), y = +r.getAttribute("y"), w = +r.getAttribute("width"), h = +r.getAttribute("height"); x0 = Math.min(x0, x); x1 = Math.max(x1, x + w); y0 = Math.min(y0, y); y1 = Math.max(y1, y + h); });
      if (!Number.isFinite(x0)) return true;
      const id = `mxclip${Math.random().toString(36).slice(2, 8)}`;
      const defs = document.createElementNS(NS, "defs"), cp = document.createElementNS(NS, "clipPath"), cr = document.createElementNS(NS, "rect");
      cp.setAttribute("id", id); cr.setAttribute("x", x0); cr.setAttribute("y", y0 - 2); cr.setAttribute("height", y1 - y0 + 4); cr.setAttribute("width", 0);
      cp.appendChild(cr); defs.appendChild(cp); svg.insertBefore(defs, svg.firstChild);
      lost.forEach((r) => r.setAttribute("clip-path", `url(#${id})`));
      const cur = document.createElementNS(NS, "line");
      cur.setAttribute("class", "mx-sweep"); cur.setAttribute("y1", y0 - 4); cur.setAttribute("y2", y1 + 4);
      svg.appendChild(cur);
      replay(fig, 6500, (p) => {
        const x = x0 + p * (x1 - x0);
        cr.setAttribute("width", Math.max(0, x - x0).toFixed(1));
        cur.setAttribute("x1", x.toFixed(1)); cur.setAttribute("x2", x.toFixed(1));
        cur.style.opacity = p >= 1 ? "0" : "";
      });
    }
    return true;
  };
  const figs = $$(".mission .sc-chart figure.viz");
  const tryAll = () => figs.filter((f) => !arm(f)).length;
  if (tryAll()) {
    // the site script draws the charts; arm any that were not drawn yet once they are
    const mo = new MutationObserver(() => { if (!tryAll()) mo.disconnect(); });
    figs.forEach((f) => mo.observe(f, { childList: true, subtree: true }));
  }
}

// ------------------------------------------------------------------ grade chart (ins-trn-coast kind)
async function grades(fig) {
  const file = fig.getAttribute("data-mx-file");
  const { a, r } = await rec(file);
  const rows = r.grade_table;
  const thr = rows[0].crossings.map((c) => c.threshold_m);
  const all = rows.flatMap((g) => g.crossings.map((c) => c.coast_s)).filter((v) => v > 0);
  const lo = Math.floor(Math.log10(Math.min(...all))), hi = Math.ceil(Math.log10(Math.max(...all)) + 0.35);
  const W = 560, ml = 96, mr = 18, mt = 40, rh = 42, H = mt + rows.length * rh + 44;
  const X = (v) => ml + ((Math.log10(v) - lo) / (hi - lo)) * (W - ml - mr);
  const cols = ["var(--s-tim)", "var(--s-int)"];
  let s = svgEl(W, H, `Free-inertial coast before ${thr.join(" m and ")} m, by IMU grade`);
  thr.forEach((t, i) => { s += `<g class="c-legend" transform="translate(${ml + i * 150},18)"><circle r="4" cx="4" cy="-3" style="fill:${cols[i]}"/><text x="14" y="0">error reaches ${t} m</text></g>`; });
  s += `<text class="c-note" x="${W - mr}" y="18" text-anchor="end">at ${fmt(r.motion.speed_m_s)} m/s</text>`;
  for (const e of logTicks(lo, hi)) {
    const x = X(10 ** e);
    s += `<line class="c-grid" x1="${x}" y1="${mt - 8}" x2="${x}" y2="${H - 38}"/><text class="c-tick" x="${x}" y="${H - 22}" text-anchor="middle">${sup(e)}</text>`;
  }
  s += `<text class="c-axis" x="${ml + (W - ml - mr) / 2}" y="${H - 6}" text-anchor="middle">seconds of coasting after GNSS is lost (log)</text>`;
  rows.forEach((g, i) => {
    const y = mt + i * rh + rh / 2 - 4, me = g.grade === r.imu.grade;
    const [c1, c2] = g.crossings;
    s += `<text class="c-axis${me ? " mx-me" : ""}" x="${ml - 10}" y="${y + 4}" text-anchor="end">${esc(g.grade)}</text>`;
    if (me) s += `<text class="mx-note" x="${ml - 10}" y="${y + 17}" text-anchor="end">this scenario</text>`;
    s += `<g class="mx-grow" style="--d:${i * 90}ms"><line class="mx-bar" x1="${X(c1.coast_s)}" y1="${y}" x2="${X(c2.coast_s)}" y2="${y}"/>`;
    [c1, c2].forEach((c, k) => { s += `<circle class="mx-pt" cx="${X(c.coast_s)}" cy="${y}" r="${me ? 6 : 5}" style="fill:${cols[k]}"><title>${esc(g.grade)}: ${fmt(c.coast_s)} s to ${c.threshold_m} m (${esc(c.dominant_contribution)})</title></circle>`; });
    const tx = X(c2.coast_s) + 10, right = tx > W - 120;
    s += `<text class="c-tick" x="${right ? X(c1.coast_s) - 10 : tx}" y="${y + 4}" text-anchor="${right ? "end" : "start"}">${fmt(c1.coast_s)} s · ${fmt(c2.coast_s)} s</text></g>`;
  });
  s += "</svg>";
  const el = mount(fig, s);
  CSV[fig.getAttribute("data-viz")] = { head: [`${file}.toml · engine v${a.engine_version} · free-inertial coast by IMU grade (grade_table)`], rows: [["grade", "threshold_m", "coast_s", "dominant_contribution"], ...rows.flatMap((g) => g.crossings.map((c) => [g.grade, c.threshold_m, c.coast_s, c.dominant_contribution]))] };
  onView(fig, (v) => { if (v) el.classList.add("mx-in"); });
}

// ------------------------------------------------------------------ spoof divergence (spoof-attack)
async function spoof(fig) {
  const { a, r } = await rec(fig.getAttribute("data-mx-file"));
  const q = r.quantum, c = r.classical, spec = r.threshold_ns;
  const pts = c.series.map((p) => [p.t, p.offset_ns]);
  const T = pts[pts.length - 1][0], Ym = Math.max(...pts.map((p) => p[1]), c.series[0].bound_ns, spec) * 1.1;
  const W = 400, H = 260, ml = 44, mr = 14, mt = 48, mb = 38;
  const X = (t) => ml + (t / T) * (W - ml - mr), Y = (v) => mt + (1 - v / Ym) * (H - mt - mb);
  let s = svgEl(W, H, "Spoof offset against time, with each monitor's detection bound and detection time");
  for (let v = 0; v <= Ym; v += 20) s += `<line class="c-grid" x1="${ml}" y1="${Y(v)}" x2="${W - mr}" y2="${Y(v)}"/><text class="c-tick" x="${ml - 6}" y="${Y(v) + 4}" text-anchor="end">${v}</text>`;
  for (let t = 0; t <= T; t += 200) s += `<text class="c-tick" x="${X(t)}" y="${H - mb + 15}" text-anchor="middle">${t}</text>`;
  s += `<text class="c-axis" x="${ml + (W - ml - mr) / 2}" y="${H - 6}" text-anchor="middle">time since the spoof began (s)</text>`;
  s += `<text class="c-axis" x="12" y="${mt + (H - mt - mb) / 2}" text-anchor="middle" transform="rotate(-90 12 ${mt + (H - mt - mb) / 2})">time offset (ns)</text>`;
  s += `<line class="c-thr" x1="${ml}" y1="${Y(spec)}" x2="${W - mr}" y2="${Y(spec)}"/><text class="c-thr-t" x="${W - mr - 4}" y="${Y(spec) + 14}" text-anchor="end">spec ${spec} ns</text>`;
  const bl = (ser, col) => `<polyline class="c-line mx-dash" style="stroke:${col}" points="${ser.series.map((p) => `${X(p.t).toFixed(1)},${Y(p.bound_ns).toFixed(1)}`).join(" ")}"/>`;
  s += bl(c, "var(--s-nav)") + bl(q, "var(--s-tim)");
  s += `<clipPath id="mxSpClip"><rect class="mx-clip" x="0" y="0" width="${W}" height="${H}"/></clipPath>`;
  s += `<polyline class="c-line" clip-path="url(#mxSpClip)" style="stroke:var(--s-spf);stroke-width:2.4" points="${pts.map((p) => `${X(p[0]).toFixed(1)},${Y(p[1]).toFixed(1)}`).join(" ")}"/>`;
  const at = (t) => { let k = 0; while (k < pts.length - 1 && pts[k + 1][0] <= t) k++; return pts[k][1]; };
  [[q, "var(--s-tim)"], [c, "var(--s-nav)"]].forEach(([m, col]) => {
    const x = X(m.detect_time_s), y = Y(at(m.detect_time_s));
    const end = x > W / 2;
    s += `<g class="mx-mk" data-t="${m.detect_time_s}"><circle class="c-mark" cx="${x}" cy="${y}" r="6" style="stroke:${col}"/><text class="c-mark-t" x="${end ? x - 10 : x + 10}" y="${end ? y - 12 : y - 16}" text-anchor="${end ? "end" : "start"}">${esc(m.id)} detects at ${fmt(m.detect_time_s)} s</text></g>`;
  });
  const leg = [["spoof offset", "var(--s-spf)"], [`${q.id} bound`, "var(--s-tim)"], [`${c.id} bound`, "var(--s-nav)"]];
  let lx = ml, ly = 16;
  leg.forEach(([l, col]) => { const w = 30 + l.length * 6.3; if (lx + w > W - mr) { lx = ml; ly += 15; } s += `<g class="c-legend" transform="translate(${lx},${ly})"><rect width="14" height="3" y="-4" style="fill:${col}"/><text x="20" y="0">${esc(l)}</text></g>`; lx += w; });
  s += `<line class="mx-head" x1="${ml}" y1="${mt}" x2="${ml}" y2="${H - mb}"/><text class="c-note mx-readout" x="${ml + 6}" y="${mt + 12}"></text></svg>`;
  const el = mount(fig, s);
  const rect = $(".mx-clip", el), head = $(".mx-head", el), read = $(".mx-readout", el), mks = $$(".mx-mk", el);
  let seenAll = false; // once each monitor has fired in a replay, its label stays up
  replay(fig, 7000, (p) => {
    const t = p * T, x = X(t), done = RM || p >= 1;
    if (done) seenAll = true;
    rect.setAttribute("width", done ? W : x);
    head.setAttribute("x1", x); head.setAttribute("x2", x);
    head.style.opacity = done ? 0 : 1;
    read.textContent = done ? "" : `t ${Math.round(t)} s · offset ${fmt(at(t))} ns`;
    mks.forEach((m) => m.classList.toggle("on", done || seenAll || t >= +m.getAttribute("data-t")));
  });
}

// ------------------------------------------------------------------ clock classes (lunar-time-budget)
async function clocks(fig) {
  const { r } = await rec(fig.getAttribute("data-mx-file"));
  const rows = r.clock_crossovers;
  const vals = rows.map((c) => c.x_one_day_s).concat([r.frame_term_s]);
  const lo = Math.floor(Math.log10(Math.min(...vals))), hi = Math.ceil(Math.log10(Math.max(...vals)));
  const W = 400, ml = 118, mr = 14, mt = 30, rh = 46, H = mt + rows.length * rh + 40;
  const X = (v) => ml + ((Math.log10(v) - lo) / (hi - lo)) * (W - ml - mr);
  const cols = ["var(--s-tim)", "var(--s-nav)", "var(--s-orb)", "var(--s-int)"]; // told apart under colour-vision deficiency, and labelled
  let s = svgEl(W, H, "Time error after one day of holdover, by clock class, log scale");
  s += `<text class="c-note" x="${ml}" y="16">time error after one day, seconds (log)</text>`;
  for (const e of logTicks(lo, hi)) { const x = X(10 ** e); s += `<line class="c-grid" x1="${x}" y1="${mt - 6}" x2="${x}" y2="${H - 34}"/><text class="c-tick" x="${x}" y="${H - 18}" text-anchor="middle">${sup(e)}</text>`; }
  rows.forEach((c, i) => {
    const y = mt + i * rh, w = X(c.x_one_day_s) - ml, inside = w > W - ml - mr - 70;
    s += `<text class="c-axis" x="${ml - 10}" y="${y + 17}" text-anchor="end">${esc(c.clock)}</text><text class="c-tick" x="${ml - 10}" y="${y + 31}" text-anchor="end">${esc(c.noise_type)}</text>`;
    s += `<rect class="mx-hbar" x="${ml}" y="${y + 5}" width="${w.toFixed(1)}" height="18" rx="4" style="fill:${cols[i % 4]};--d:${i * 120}ms"><title>${esc(c.clock)}: ${fmt(c.x_one_day_s * 1e9)} ns after one day, σy(1 s) ${fmt(c.sigma_y_one_s)}</title></rect>`;
    s += `<text class="c-tick${inside ? " on-bar" : ""}" x="${inside ? ml + w - 6 : ml + w + 6}" y="${y + 18}" text-anchor="${inside ? "end" : "start"}">${fmt(c.x_one_day_s * 1e9)} ns</text>`;
    s += `<text class="c-tick" x="${ml + 2}" y="${y + 37}">σy(1 s) ${fmt(c.sigma_y_one_s)}</text>`;
  });
  const fx = X(r.frame_term_s);
  s += `<line class="c-thr" x1="${fx}" y1="${mt - 6}" x2="${fx}" y2="${H - 34}"/><text class="c-thr-t" x="${fx + 4}" y="${H - 38}">frame floor ${fmt(r.frame_term_s * 1e9)} ns</text></svg>`;
  const el = mount(fig, s);
  onView(fig, (v) => { if (v) el.classList.add("mx-in"); });
}

// ------------------------------------------------------------------ inertial cone (series.json)
async function cone(fig) {
  const d = (await series())[fig.getAttribute("data-mx-series")];
  const budget = parseFloat(fig.getAttribute("data-budget")), hold = parseFloat(fig.getAttribute("data-hold"));
  const by = {};
  for (const [n, x, y] of d.rows.slice(1)) if (x >= 0 && Number.isFinite(y)) (by[n] ||= []).push([x, y]);
  const names = Object.keys(by).filter((n) => !/budget/.test(n));
  const T = Math.max(...names.map((n) => by[n][by[n].length - 1][0])), Ym = budget * 3;
  const W = 400, H = 280, ml = 46, mr = 14, mt = 48, mb = 38, cy = mt + (H - mt - mb) / 2;
  const X = (t) => ml + (t / T) * (W - ml - mr), Y = (v) => cy - (Math.min(v, Ym) / Ym) * ((H - mt - mb) / 2);
  const cols = { [names[0]]: "var(--s-itg)", [names[1]]: "var(--s-nav)" };
  let s = svgEl(W, H, "Position-error cone since GNSS was lost");
  for (const v of [-Ym, -budget, 0, budget, Ym]) s += `<text class="c-tick" x="${ml - 6}" y="${(v >= 0 ? Y(v) : 2 * cy - Y(-v)) + 4}" text-anchor="end">${v > 0 ? "+" : ""}${v}</text>`;
  for (let t = 0; t <= T; t += 20) s += `<line class="c-grid" x1="${X(t)}" y1="${mt}" x2="${X(t)}" y2="${H - mb}"/><text class="c-tick" x="${X(t)}" y="${H - mb + 15}" text-anchor="middle">${t}</text>`;
  s += `<text class="c-axis" x="${ml + (W - ml - mr) / 2}" y="${H - 6}" text-anchor="middle">time since GNSS was lost (s)</text>`;
  s += `<text class="c-axis" x="12" y="${cy}" text-anchor="middle" transform="rotate(-90 12 ${cy})">position error (m)</text>`;
  s += `<clipPath id="mxCoClip"><rect class="mx-clip" x="0" y="0" width="${W}" height="${H}"/></clipPath><g clip-path="url(#mxCoClip)">`;
  [...names].sort((a, b) => by[b][by[b].length - 1][1] - by[a][by[a].length - 1][1]).forEach((n) => {
    const p = by[n], up = p.map(([x, y]) => `${X(x).toFixed(1)},${Y(y).toFixed(1)}`), dn = p.slice().reverse().map(([x, y]) => `${X(x).toFixed(1)},${(2 * cy - Y(y)).toFixed(1)}`);
    s += `<polygon class="mx-cone" style="fill:${cols[n]};stroke:${cols[n]}" points="${up.concat(dn).join(" ")}"/>`;
  });
  s += `</g><line class="c-thr" x1="${ml}" y1="${Y(budget)}" x2="${W - mr}" y2="${Y(budget)}"/><line class="c-thr" x1="${ml}" y1="${2 * cy - Y(budget)}" x2="${W - mr}" y2="${2 * cy - Y(budget)}"/>`;
  s += `<text class="c-thr-t" x="${W - mr - 4}" y="${2 * cy - Y(budget) + 14}" text-anchor="end">±${budget} m budget</text>`;
  s += `<line class="mx-track" x1="${ml}" y1="${cy}" x2="${W - mr}" y2="${cy}"/>`;
  if (Number.isFinite(hold) && hold < T) s += `<g class="mx-mk" data-t="${hold}"><circle class="c-mark" cx="${X(hold)}" cy="${Y(budget)}" r="5" style="stroke:${cols[names[1]]}"/><text class="c-mark-t" x="${X(hold) - 8}" y="${Y(budget) - 8}" text-anchor="end">leaves at ${fmt(hold)} s</text></g>`;
  let lx = ml, ly = 16;
  names.forEach((n) => { const w = 36 + n.length * 6.3; if (lx + w > W - mr) { lx = ml; ly += 15; } s += `<g class="c-legend" transform="translate(${lx},${ly})"><rect width="14" height="8" y="-7" style="fill:${cols[n]};opacity:.6"/><text x="20" y="0">${esc(n)}</text></g>`; lx += w; });
  s += `<text class="c-note" x="${W - mr - 4}" y="${mt + 12}" text-anchor="end">clipped at ±${Ym} m</text>`;
  s += `<text class="c-note mx-readout" x="${ml + 6}" y="${H - mb - 6}"></text></svg>`;
  const el = mount(fig, s);
  const rect = $(".mx-clip", el), read = $(".mx-readout", el), mks = $$(".mx-mk", el);
  const at = (n, t) => { const p = by[n]; let k = 0; while (k < p.length - 1 && p[k + 1][0] <= t) k++; return p[k][1]; };
  replay(fig, 6000, (p) => {
    const t = p * T, done = RM || p >= 1;
    rect.setAttribute("width", done ? W : X(t));
    read.textContent = done ? "" : `t ${Math.round(t)} s · ` + names.map((n) => `±${fmt(at(n, t))} m`).join(" · ");
    mks.forEach((m) => m.classList.toggle("on", done || t >= +m.getAttribute("data-t")));
  });
}

// ------------------------------------------------------------------ jamming footprint
// Cell k runs j = -NY..NY (south to north) and, inside each, i = -NX..NX (west to east), STEP km
// apart and centred on the jammer; js10 = mean J/S in tenths of a dB, av = tracking availability x1000.
const FOOTPRINT = {
  engine: "0.34.0", file: "maritime-strait-jamming",
  jlat: 59.799999997308404, jlon: 25.435753282453177, // jammer, from the scenario's position_ecef_m (WGS84)
  ship: [59.8, 24.9], step: 15, nx: 17, ny: 12,
  js10: [275,279,282,286,290,293,297,301,304,308,311,314,317,320,322,323,324,324,324,323,322,320,317,314,311,308,304,301,297,294,290,286,283,279,276,278,281,285,289,293,297,301,305,309,313,317,320,324,326,329,331,332,332,332,331,329,326,324,320,317,313,309,305,301,297,293,289,285,282,278,280,284,288,292,296,301,305,309,314,318,322,326,330,334,336,339,340,340,340,339,336,334,330,327,322,318,314,309,305,301,296,292,288,284,280,282,286,291,295,299,304,309,314,319,323,328,333,337,341,345,347,349,349,349,347,345,341,337,333,328,324,319,314,309,304,300,295,291,287,283,284,289,293,298,303,307,313,318,323,329,334,340,345,350,354,357,359,360,359,357,354,350,345,340,334,329,323,318,313,308,303,298,293,289,285,286,291,295,300,305,311,316,322,328,334,341,347,353,359,364,368,370,371,370,368,364,359,353,347,341,334,328,322,317,311,306,301,296,291,287,288,293,298,303,308,314,320,326,333,340,347,354,361,368,375,380,383,385,383,380,375,368,361,354,347,340,333,326,320,314,308,303,298,293,288,290,295,300,305,311,317,323,330,337,345,353,361,370,379,387,394,399,401,399,394,387,379,370,361,353,345,337,330,323,317,311,305,300,295,290,291,296,301,307,313,319,326,333,341,349,358,368,378,389,400,410,417,420,417,410,400,389,379,368,358,349,341,333,326,319,313,307,302,296,291,292,297,303,308,315,321,328,336,344,353,363,374,387,400,414,429,440,445,440,429,414,400,387,374,363,353,344,336,328,321,315,309,303,298,293,293,298,304,310,316,323,330,338,347,357,367,380,394,410,429,450,470,480,470,450,429,410,394,380,367,357,347,338,330,323,316,310,304,299,294,294,299,305,311,317,324,331,340,349,359,370,383,398,417,440,470,510,540,510,470,440,417,399,383,370,359,349,340,332,324,317,311,305,299,294,294,299,305,311,317,324,332,340,349,360,371,385,400,420,445,480,540,1101,540,480,445,420,400,385,371,360,349,340,332,325,318,311,305,300,294,294,299,305,311,317,324,332,340,349,359,370,384,399,417,440,470,510,540,510,470,440,417,399,384,370,359,349,340,332,324,318,311,305,300,294,294,299,304,310,317,323,331,339,348,357,368,380,394,410,429,450,470,480,470,450,429,410,394,380,368,357,348,339,331,324,317,311,305,299,294,293,298,304,309,316,322,329,337,345,354,364,375,387,401,415,429,440,445,440,429,415,401,387,375,364,354,345,337,329,322,316,310,304,299,294,292,297,303,308,314,320,327,334,342,350,359,369,379,390,401,410,417,420,417,410,401,390,379,369,359,350,342,334,327,321,314,308,303,298,293,291,296,301,306,312,318,324,331,338,346,354,362,371,379,387,394,399,400,399,394,387,379,371,362,354,346,338,331,325,318,312,307,301,296,292,290,294,299,304,310,315,321,328,334,341,348,355,362,369,375,380,383,385,383,380,375,369,362,355,348,341,334,328,321,316,310,305,300,295,290,288,293,297,302,307,312,318,324,329,335,342,348,354,359,364,368,370,371,370,368,364,359,354,348,342,336,330,324,318,313,307,302,298,293,289,286,291,295,300,304,309,314,319,325,330,335,341,346,350,354,357,359,359,359,357,354,350,346,341,335,330,325,320,314,309,305,300,295,291,287,284,288,293,297,301,306,310,315,320,325,329,334,338,342,345,347,349,349,349,347,345,342,338,334,329,325,320,315,311,306,302,297,293,289,285,282,286,290,294,298,302,307,311,315,319,323,327,331,334,336,338,340,340,340,338,336,334,331,327,323,319,315,311,307,303,298,294,290,286,283,280,284,287,291,295,299,303,306,310,314,318,321,324,327,329,330,331,332,331,330,329,327,324,321,318,314,310,307,303,299,295,291,288,284,280,278,281,285,288,292,295,299,302,306,309,312,315,318,320,322,323,324,324,324,323,322,320,318,315,312,309,306,302,299,295,292,288,285,281,278],
  av: [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,836,656,869,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,443,0,0,0,0,0,0,0,590,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,607,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,836,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,770,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,623,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,869,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,689,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,967,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,213,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,574,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,475,0,0,0,0,0,0,0,590,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,951,820,967,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000],
};
function cellLatLon(i, j) {
  const F = FOOTPRINT, kmLat = 111.2, kmLon = 111.32 * Math.cos(F.jlat * Math.PI / 180);
  return [(F.jlat + j * F.step / kmLat).toFixed(3), (F.jlon + i * F.step / kmLon).toFixed(3)];
}
async function footprint(fig) {
  const F = FOOTPRINT, NX = 2 * F.nx + 1;
  const kmLon = 111.32 * Math.cos(F.jlat * Math.PI / 180), kmLat = 111.2;
  const W = 720, cellPx = W / NX, mapH = cellPx * (2 * F.ny + 1), H = Math.round(mapH + 60);
  const lon0 = F.jlon - (F.nx + 0.5) * F.step / kmLon, lat1 = F.jlat + (F.ny + 0.5) * F.step / kmLat;
  const px = (lon) => ((lon - lon0) * kmLon / F.step) * cellPx, py = (lat) => ((lat1 - lat) * kmLat / F.step) * cellPx;
  const cells = [];
  for (let j = -F.ny, k = 0; j <= F.ny; j++) for (let i = -F.nx; i <= F.nx; i++, k++) cells.push({ i, j, js: F.js10[k] / 10, av: F.av[k] / 1000 });
  const jsMin = Math.min(...cells.map((c) => c.js)), jsMax = 60;
  const shade = (c) => {
    const f = Math.max(0, Math.min(1, (c.js - jsMin) / (jsMax - jsMin)));
    const col = c.av <= 0 ? "var(--s-int)" : c.av < 1 ? "var(--s-nav)" : "var(--s-tim)";
    return `fill:${col};fill-opacity:${(0.1 + 0.6 * f).toFixed(2)}`;
  };
  let land = [];
  try { land = await (await fetch(`${ROOT}data/land.json`)).json(); } catch (e) { land = []; }
  let s = svgEl(W, H, "Jamming footprint around the jammer");
  s += `<clipPath id="mxFpClip"><rect width="${W}" height="${mapH.toFixed(1)}"/></clipPath><g clip-path="url(#mxFpClip)">`;
  const near = (ring) => ring.some(([lo, la]) => lo > lon0 - 4 && lo < lon0 + 14 && la > lat1 - 8 && la < lat1 + 3);
  for (const ring of land) if (near(ring)) s += `<polygon class="mx-land" points="${ring.map(([lo, la]) => `${px(lo).toFixed(1)},${py(la).toFixed(1)}`).join(" ")}"/>`;
  const dmax = Math.hypot(F.nx, F.ny);
  cells.forEach((c, k) => {
    const x = (c.i + F.nx) * cellPx, y = (F.ny - c.j) * cellPx;
    s += `<rect class="mx-cell${c.av <= 0 ? " den" : ""}" data-k="${k}" x="${x.toFixed(1)}" y="${y.toFixed(1)}" width="${(cellPx + 0.4).toFixed(1)}" height="${(cellPx + 0.4).toFixed(1)}" style="${shade(c)};--d:${Math.round((Math.hypot(c.i, c.j) / dmax) * 900)}ms"/>`;
  });
  s += `</g>`;
  const jx = px(F.jlon), jy = py(F.jlat), sx = px(F.ship[1]), sy = py(F.ship[0]);
  s += `<g class="mx-pin"><circle cx="${jx.toFixed(1)}" cy="${jy.toFixed(1)}" r="6" class="mx-jam"/><rect class="mx-lblbg" x="${(jx + 6).toFixed(1)}" y="${(jy - 22).toFixed(1)}" width="54" height="18" rx="4"/><text x="${(jx + 10).toFixed(1)}" y="${(jy - 9).toFixed(1)}" class="mx-lbl">jammer</text></g>`;
  s += `<g class="mx-pin"><path d="M${(sx - 6).toFixed(1)} ${(sy + 4).toFixed(1)} L${(sx + 6).toFixed(1)} ${(sy + 4).toFixed(1)} L${sx.toFixed(1)} ${(sy - 7).toFixed(1)} Z" class="mx-ship"/><text x="${(sx - 10).toFixed(1)}" y="${(sy + 20).toFixed(1)}" text-anchor="end" class="mx-lbl">the scenario's ship</text></g>`;
  s += `<rect class="mx-sel" width="${cellPx.toFixed(1)}" height="${cellPx.toFixed(1)}" x="-99" y="-99"/>`;
  const ly = mapH + 24;
  const leg = [["var(--s-int)", "every satellite lost"], ["var(--s-nav)", "some epochs lost"], ["var(--s-tim)", "tracking held"]];
  let lx = 10;
  leg.forEach(([c, t]) => { s += `<g class="c-legend" transform="translate(${lx},${ly})"><rect width="12" height="12" y="-10" style="fill:${c};opacity:.75"/><text x="18" y="0">${t}</text></g>`; lx += 34 + t.length * 6.4; });
  s += `<text class="c-legend mx-lgt" x="10" y="${ly + 24}">darker = higher mean J/S · ${F.step} km cells · ${cells.length} engine runs</text>`;
  const bar = (100 / F.step) * cellPx;
  s += `<line class="mx-scale" x1="${(W - 16 - bar).toFixed(1)}" y1="${ly - 4}" x2="${W - 16}" y2="${ly - 4}"/><text class="c-tick" x="${(W - 16 - bar / 2).toFixed(1)}" y="${ly + 12}" text-anchor="middle">100 km</text></svg>`;
  const el = mount(fig, s);
  el.setAttribute("tabindex", "0");
  el.setAttribute("aria-label", "Jamming footprint map. Arrow keys move between cells, Enter opens that run.");
  CSV[fig.getAttribute("data-viz")] = {
    head: [`${F.file}.toml · engine v${F.engine} · one run per cell with [receiver] lat_deg and lon_deg changed · jammer at ${F.jlat.toFixed(4)} N ${F.jlon.toFixed(4)} E`],
    rows: [["receiver_lat_deg", "receiver_lon_deg", "mean_js_db", "availability_under_jamming"], ...cells.map((c) => [...cellLatLon(c.i, c.j), c.js, c.av])],
  };
  // Selection by hover, tap or arrow keys; the readout links to that exact run in the Studio.
  const read = $("[data-mx-read]", fig), sel = $(".mx-sel", el);
  let cur = null, base = null, tools = null;
  const load = () => (base ||= Promise.all([rec(F.file), import(`../studio/lib/guided.mjs`), import(`../studio/lib/share.mjs`)])
    .then(([rr, g, sh]) => { tools = { g, sh }; return rr.a.toml; }));
  const href = (toml, c) => {
    const [la, lo] = cellLatLon(c.i, c.j);
    let t = tools.g.patchSectionScalar(toml, "receiver", "lat_deg", la);
    t = tools.g.patchSectionScalar(t, "receiver", "lon_deg", lo);
    return `/studio/${tools.sh.encodeFragment(t)}`;
  };
  const pick = (k) => {
    const c = cells[k]; if (!c || k === cur) return;
    cur = k;
    const r = $(`rect[data-k="${k}"]`, el);
    sel.setAttribute("x", r.getAttribute("x")); sel.setAttribute("y", r.getAttribute("y"));
    const [la, lo] = cellLatLon(c.i, c.j);
    const b = document.createElement("b");
    b.textContent = `${la}° N, ${lo}° E`;
    const a = document.createElement("a");
    a.className = "mx-open"; a.textContent = `Open this run in ${STUDIO}`; a.href = `/studio/?scenario=${F.file}&tab=signal`;
    read.replaceChildren(b, ` · about ${Math.round(Math.hypot(c.i, c.j) * F.step)} km from the jammer · mean J/S ${c.js.toFixed(1)} dB · tracking availability ${c.av.toFixed(2)} `, a);
    load().then((toml) => { if (cur === k) a.href = href(toml, c); }, () => {});
  };
  el.addEventListener("pointermove", (e) => { const r = e.target.closest("rect.mx-cell"); if (r) pick(+r.getAttribute("data-k")); });
  el.addEventListener("click", (e) => { const r = e.target.closest("rect.mx-cell"); if (r) pick(+r.getAttribute("data-k")); });
  el.addEventListener("keydown", (e) => {
    const mv = { ArrowRight: 1, ArrowLeft: -1, ArrowUp: NX, ArrowDown: -NX }[e.key];
    if (e.key === "Enter" && cur !== null) { e.preventDefault(); load().then((toml) => { location.href = href(toml, cells[cur]); }); return; }
    if (mv === undefined) return;
    e.preventDefault();
    const k = cur === null ? Math.floor(cells.length / 2) : cur;
    const i = k % NX, n = k + mv;
    if ((mv === 1 && i === NX - 1) || (mv === -1 && i === 0) || n < 0 || n >= cells.length) return;
    pick(n);
  });
  el.addEventListener("focus", () => { if (cur === null) pick(Math.floor(cells.length / 2)); });
  onView(fig, (v) => { if (v) el.classList.add("mx-in"); });
}

// ------------------------------------------------------------------ engine-run cards: shared bits
const ENG = RUNS.engine;
const fx = (v, d = 1) => (Number.isFinite(v) ? v.toLocaleString("en-GB", { maximumFractionDigits: d, minimumFractionDigits: 0 }) : "–");
function el(tag, attrs = {}, ...kids) {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs)) { if (v == null) continue; if (k === "text") n.textContent = v; else n.setAttribute(k, v); }
  for (const k of kids) if (k != null) n.append(k);
  return n;
}
// SVG markup built here from engine numbers (escaped where text), parsed, never assigned as HTML
function svgNode(markup) {
  const doc = new DOMParser().parseFromString(markup, "image/svg+xml");
  if (doc.querySelector("parsererror")) throw new Error("svg parse");
  return document.importNode(doc.documentElement, true);
}
function dlText(name, text, type = "text/plain") {
  const a = el("a", { href: URL.createObjectURL(new Blob([text], { type })), download: name });
  document.body.appendChild(a); a.click(); a.remove();
  setTimeout(() => URL.revokeObjectURL(a.href), 2000);
}
let bundleP = null;
const bundle = () => (bundleP ||= fetch(`${ROOT}assets/missions-runs/results.json`).then((r) => { if (!r.ok) throw new Error("results.json"); return r.json(); }));
document.addEventListener("click", (e) => {
  const t = e.target.closest("[data-dl-toml]");
  if (t) { const n = t.getAttribute("data-dl-toml"); dlText(`${n}.toml`, RUNS.toml[n], "application/toml"); return; }
  const j = e.target.closest("[data-dl-json]");
  if (j) { const n = j.getAttribute("data-dl-json"); bundle().then((b) => dlText(`${n}.result.json`, JSON.stringify(b[n], null, 1), "application/json"), () => { j.textContent = "JSON unavailable"; }); }
});
// The routes to check and reproduce a run: the engine's report, its result, the TOML, the command.
function tools(name) {
  const c = RUNS.cards[name], p = c.pub, out = [];
  // The Studio view that reproduces the run (js/studio-links.mjs, generated from the Studio's own link list).
  const view = studioHref(ROOT, name);
  if (view) out.push(el("a", { class: "prov-open", href: view, text: `Open in ${STUDIO}` }));
  else if (p) out.push(el("a", { class: "prov-open", href: ROOT + p.report, text: "Open the engine's report" }));
  const box = el("span", { class: "prov-tools" });
  if (view) box.append(el("a", { class: "prov-x", href: p ? ROOT + p.report : studioHref(ROOT, name, "report"), title: "The engine's own report of this run", text: "Report" }));
  if (p && !p.bundle) box.append(el("a", { class: "prov-x", href: ROOT + p.json, title: "The engine's result, unmodified", text: "JSON" }));
  else if (p) box.append(el("button", { class: "prov-x", type: "button", "data-dl-json": name, title: "The engine's result, unmodified", text: "JSON" }));
  box.append(p && p.toml ? el("a", { class: "prov-x", href: ROOT + p.toml, title: "The scenario file that ran", text: "TOML" })
    : el("button", { class: "prov-x", type: "button", "data-dl-toml": name, title: "Download the scenario file that ran", text: "TOML" }));
  box.append(el("button", { class: "prov-x", type: "button", "data-copy": `kshana ${c.file}`, title: "Copy the command that reproduces it", text: "Copy command" }));
  out.push(box);
  return out;
}
function provRun(node, name, lead) {
  const c = RUNS.cards[name];
  const src = el("span", { class: "prov-src" });
  if (lead) src.append(el("b", { text: `${lead}: ` }));
  src.append(`Engine v${ENG.version}, build `, el("code", { text: ENG.commit }), " · ", el("code", { text: c.file }), c.seed != null ? ` · seed ${c.seed}` : " · deterministic, no seed");
  node.replaceChildren(src, ...tools(name));
}

// ------------------------------------------------------------------ hero: threat matrix, from the cards
const MODES = [["int", "Interference", "--amber"], ["spf", "Spoofing", "--magenta"], ["tim", "Timing", "--lime"], ["orb", "Geometry", "--cyan"], ["itg", "Integrity", "--coral"], ["nav", "Coasting", "--tim"]];
function matrix() {
  const box = $("[data-mm]"), read = $("[data-mm-read]");
  const tabs = $$(".sectors [role=tab]");
  if (!box || !tabs.length) return;
  const rows = tabs.map((t) => {
    const p = document.getElementById(t.getAttribute("aria-controls"));
    const cards = $$(".sc[data-mode]", p);
    return { t, name: t.textContent.trim(), c: t.style.getPropertyValue("--c"), cards, by: Object.fromEntries(MODES.map(([m]) => [m, cards.filter((x) => x.getAttribute("data-mode") === m)])) };
  });
  const files = new Set(rows.flatMap((r) => r.cards.map((c) => $(".sc-f", c).textContent)));
  const s1 = $("[data-mh-sectors]"), s2 = $("[data-mh-files]");
  if (s1) s1.textContent = rows.length;
  if (s2) s2.textContent = files.size;
  const max = Math.max(...rows.flatMap((r) => MODES.map(([m]) => r.by[m].length)));
  const tb = el("table", { class: "mm-t" });
  const cap = el("caption", { class: "vh", text: "Scenario files by sector (rows) and failure mode (columns). Select a count to open that sector." });
  const hr = el("tr", {}, el("th", { scope: "col" }, el("span", { class: "vh", text: "Sector" })));
  MODES.forEach(([, n, c]) => hr.append(el("th", { scope: "col", style: `--c:var(${c})` }, el("i"), n)));
  tb.append(cap, el("thead", {}, hr));
  const body = el("tbody");
  // open the sector and land its panel (id = the sector) just under the header
  const go = (r) => { r.t.click(); const p = document.getElementById(r.t.getAttribute("aria-controls")); if (window.KSkeep) window.KSkeep(p); else p.scrollIntoView({ block: "start" }); };
  rows.forEach((r, i) => {
    const b = el("button", { type: "button", style: `--c:${r.c}` }, el("i"), el("span", { text: r.name }));
    b.addEventListener("click", () => go(r));
    const tr = el("tr", {}, el("th", { scope: "row" }, b));
    MODES.forEach(([m, n, c], j) => {
      const k = r.by[m].length;
      const cell = el("button", { type: "button", class: `mm-c${k ? "" : " z"}`, style: `--c:var(${c});--k:${(k / max).toFixed(2)};--d:${(i * 40 + j * 25)}ms`,
        "aria-label": `${r.name}, ${n}: ${k} scenario file${k === 1 ? "" : "s"}`, text: k || "·" });
      if (!k) { cell.setAttribute("tabindex", "-1"); cell.setAttribute("aria-hidden", "true"); }
      const show = () => { if (!k) return; read.replaceChildren(el("b", { text: `${r.name} · ${n}` }), ` · ${k} file${k === 1 ? "" : "s"}: `, r.by[m].map((x) => $(".sc-f", x).textContent).join(", ")); };
      cell.addEventListener("pointerenter", show); cell.addEventListener("focus", show);
      if (k) cell.addEventListener("click", () => go(r));
      tr.append(el("td", {}, cell));
    });
    body.append(tr);
  });
  tb.append(body);
  box.replaceChildren(tb);
  requestAnimationFrame(() => requestAnimationFrame(() => box.classList.add("mm-on")));
  // a slow tour of the non-empty cells, each read out from the cards; stops for good once you point or tab in
  if (RM) return;
  const hot = $$(".mm-c:not(.z)", box);
  let k = -1, stop = false, on = false;
  const quit = () => { stop = true; hot.forEach((c) => c.classList.remove("mm-hot")); };
  box.addEventListener("pointerenter", quit, { once: true });
  box.addEventListener("focusin", quit, { once: true });
  onView(box, (v) => { on = v; });
  setTimeout(() => setInterval(() => {
    if (stop || !on || document.hidden || !hot.length) return;
    if (k >= 0) hot[k].classList.remove("mm-hot");
    k = (k + 1) % hot.length;
    hot[k].classList.add("mm-hot");
    hot[k].dispatchEvent(new Event("pointerenter"));
  }, 2200), 1800);
}

// ------------------------------------------------------------------ sector console: window title follows the tab
function sectorTitle() {
  const t = $("[data-mw-title]");
  const upd = () => { const s = $(".sectors [aria-selected=true]"); if (t && s) t.textContent = `· ${s.textContent.trim()}`; };
  $$(".sectors [role=tab]").forEach((b) => { b.addEventListener("click", upd); b.addEventListener("keydown", () => setTimeout(upd)); });
  addEventListener("hashchange", upd);
  upd();
}

// ------------------------------------------------------------------ engine-run cards, LEO-PNT card, ship and car
function figChips(name) {
  const d = RUNS.runs[name], c = RUNS.cards[name];
  if (d && d.kind === "constellation-design") return [[fx(d.total, 0), "satellites"], [`${fx(d.global.availability_pct, 2)} %`, `at PDOP ≤ ${d.pdop_threshold}`], [fx(d.global.pdop_median, 2), "median PDOP"]];
  if (d && d.kind === "body-pnt") return [[fx(d.relays.planes * d.relays.per_plane, 0), "relays"], [`${fx(d.fom.availability_with_earth * 100, 1)} %`, "fix, with Earth"], [`${fx(d.fom.rms_error_with_earth_m, 1)} m`, "RMS error"]];
  if (d && d.chips) return d.chips; // headline figures read from the run's result by src/tools/gen_missions_runs.py
  if (d && d.kind === "campaign") return d.members.map((m) => [`${fx(m.metrics.availability * 100, 0)} %`, `${m.label} tracking held`]);
  // the engine's own one-line summary, less its hash and kind tags
  const seg = c.summary.split(/\s\|\s/).map((x) => x.trim()).filter((x) => !/^campaign [0-9a-f]{8,}$/.test(x) && !/^scenario [\w-]+$/.test(x) && x !== RUNS.cards[name].title);
  return [["Engine:", seg.slice(0, 3).join(" · ")]];
}
function nextCards() {
  $$(".sc-next[data-run]").forEach((card) => {
    const n = card.getAttribute("data-run"), c = RUNS.cards[n];
    if (!c) return;
    const f = $(".sc-fig", card), a = $(".sc-acts", card);
    const chips = figChips(n);
    f.replaceChildren(...chips.map(([v, l]) => el("span", {}, el("b", { text: v }), ` ${l}`)));
    if (chips.length === 1 && chips[0][0] === "Engine:") f.classList.add("sum");
    const p = c.pub;
    // Every engine-run card opens in the Studio on the view that reproduces it; its report is the
    // engine's own, published here or shown by the Studio (recorded with the native engine).
    const view = studioHref(ROOT, n), rep = p ? ROOT + p.report : (studioHas(n, "report") ? studioHref(ROOT, n, "report") : null);
    if (view) a.append(el("a", { class: "prov-x sa-open", href: view, text: `Open in ${STUDIO}` }));
    if (rep) a.append(el("a", { class: "prov-x", href: rep, text: "Report" }));
    a.append(p && p.toml ? el("a", { class: "prov-x", href: ROOT + p.toml, text: "TOML" }) : el("button", { class: "prov-x", type: "button", "data-dl-toml": n, text: "TOML" }));
    a.append(el("button", { class: "prov-x", type: "button", "data-copy": `kshana ${c.file}`, text: "Copy command" }));
    a.append(el("span", { class: "sa-note", text: `Engine v${ENG.version}, build ${ENG.commit}${c.seed != null ? ` · seed ${c.seed}` : ""}` }));
  });
  $$("[data-leo]").forEach((box) => {
    const d = RUNS.runs["leo-pnt-mega-shell"];
    if (!d) return;
    const f = [[fx(d.total, 0), "satellites in four shells"], [fx(d.global.mean_visible, 1), "in view on average"], [`${fx(d.global.availability_pct, 2)} %`, `of the grid at PDOP ≤ ${d.pdop_threshold}`], [fx(d.global.pdop_median, 2), "median PDOP"]];
    box.replaceChildren(...f.map(([v, l]) => el("div", { class: "lf" }, el("b", { text: v }), el("span", { text: l }))));
    const p = el("p", { class: "prov" });
    box.after(p);
    provRun(p, "leo-pnt-mega-shell");
  });
  $$("[data-searoad]").forEach((card) => {
    const d = RUNS.runs["campaign-shared-jammer-sea-road"];
    if (!d) return;
    const bars = $("[data-sr-bars]", card);
    const jsMax = Math.max(...d.members.map((m) => m.metrics.mean_js)), trMax = Math.max(4, ...d.members.map((m) => m.metrics.min_tracking));
    bars.replaceChildren(...d.members.map((m, i) => {
      const who = /ship/.test(m.label) ? "Ship" : "Car";
      const row = el("div", { class: "sr-row", style: `--c:var(${i ? "--lime" : "--coral"})` }, el("b", {}, who, el("small", { text: `${m.receiver.lat_deg}° N, ${m.receiver.lon_deg}° E` })));
      const metric = (label, w, txt) => el("div", { class: "sr-m" }, el("span", { text: label }), el("span", { class: "sr-track" }, el("span", { class: "sr-fill", style: `--w:${Math.max(2, w * 100).toFixed(1)}%` })), el("output", { text: txt }));
      row.append(metric("tracking held", m.metrics.availability, `${fx(m.metrics.availability * 100, 0)} %`),
        metric("mean J/S", m.metrics.mean_js / jsMax, `${fx(m.metrics.mean_js, 1)} dB`),
        metric("fewest tracked", m.metrics.min_tracking / trMax, fx(m.metrics.min_tracking, 0)));
      return row;
    }));
    bars.setAttribute("aria-label", d.members.map((m) => `${m.label}: tracking held ${fx(m.metrics.availability * 100, 0)} %, mean jammer-to-signal ratio ${fx(m.metrics.mean_js, 1)} dB, fewest satellites tracked ${m.metrics.min_tracking}`).join("; ") + `; shared jammer ${d.shared.jammer_power} dBW`);
    onView(bars, (v) => { if (v) bars.classList.add("in"); });
    $$("[data-prov-run]", card).forEach((p) => provRun(p, p.getAttribute("data-prov-run")));
  });
}

// ------------------------------------------------------------------ orbit console
const OW_ORDER = ["constellation-multi-gnss-coverage", "leo-pnt-mega-shell", "lunar-relay-constellation", "mars-orbit-pnt"];
const SYS = ["--cyan", "--lime", "--amber", "--magenta"];
const latTxt = (l) => `${Math.abs(l)}° ${l >= 0 ? "N" : "S"}`;
const hmsT = (s) => { s = Math.round(s); const h = Math.floor(s / 3600), m = Math.floor((s % 3600) / 60); return `T+${String(h).padStart(2, "0")}:${String(m).padStart(2, "0")}`; };
const LOOP_S = 40; // one pass of the run's duration, in real seconds

// ------------------------------------------------------------------ orbit console: the receiver-response map
// A constellation run's coverage grid (the engine's cells, 10° by 10°) as a true 2:1 equirectangular field on a
// canvas, bilinear between cell centres (longitude wraps; a cell with no fix is drawn as "no fix", never
// interpolated into a number), with an SVG overlay for the graticule, coastlines, PDOP hatching, the receiver
// and the latitude profiles. The colour ramp is viridis: perceptually uniform, readable under colour-vision
// deficiency, brighter is better for every metric (PDOP is reversed so low PDOP is bright).
const VIR = ["#440154", "#482475", "#414487", "#355f8d", "#2a788e", "#21918c", "#22a884", "#44bf70", "#7ad151", "#bddf26", "#fde725"]
  .map((h) => [1, 3, 5].map((i) => parseInt(h.slice(i, i + 2), 16)));
const pageLight = () => { const t = document.documentElement.getAttribute("data-theme"); return t ? t === "light" : !matchMedia("(prefers-color-scheme: dark)").matches; };
// the dark panel lifts the darkest purple off the background; the light panel leaves out the palest yellow
function ramp(light) {
  const a = light ? 0 : 0.12, b = light ? 0.88 : 1;
  return (t) => {
    const x = (a + (b - a) * Math.max(0, Math.min(1, t))) * (VIR.length - 1), i = Math.min(VIR.length - 2, Math.floor(x)), f = x - i;
    return VIR[i].map((c, k) => Math.round(c + (VIR[i + 1][k] - c) * f));
  };
}
const rgbTxt = (c) => `rgb(${c[0]},${c[1]},${c[2]})`;
const lonTxt = (l) => (l === 0 || Math.abs(l) === 180 ? `${Math.abs(l)}°` : `${Math.abs(l)}° ${l < 0 ? "W" : "E"}`);
const gLat = (l) => (l === 0 ? "0°" : latTxt(l));
const MAP_KEYS = [["vis", "Satellites in view", "In view"], ["pdop", "PDOP", "PDOP"], ["avail", "Availability", "Availability"]];
// the metric a run opens on: availability when it varies over the grid, satellites in view when it is uniform
const mapDefault = (d) => { const a = d.avail_grid.flat(); return Math.max(...a) - Math.min(...a) >= 1 ? "avail" : "vis"; };
const pdopTxt = (p) => (p == null ? "no fix" : fx(p, p < 10 ? 2 : 0));

function mapMetric(d, m) {
  const C = d.cells, thr = d.pdop_threshold;
  if (m === "avail") {
    const a = d.avail_grid.flat();
    return { get: (i, j) => d.avail_grid[i][j], t: (v) => v / 100, dir: 1, lo: "0 %", hi: "100 %", uni: Math.min(...a) === Math.max(...a) ? `${Math.min(...a)} % in every cell` : null,
      title: `Availability: share of the run with PDOP ≤ ${fx(thr, 1)}` };
  }
  if (m === "vis") {
    const a = C.mean_visible.flat(), lo = Math.min(...a), hi = Math.max(...a);
    return { get: (i, j) => C.mean_visible[i][j], t: (v) => (hi > lo ? (v - lo) / (hi - lo) : 1), dir: 1, lo: fx(lo, 1), hi: fx(hi, 1), uni: hi === lo ? `${fx(lo, 1)} in every cell` : null,
      title: "Satellites in view, mean over the run" };
  }
  const a = C.mean_pdop.flat(), ok = a.filter((v) => v != null), lo = Math.min(...ok), top = Math.max(...ok), hi = Math.min(top, thr * 10), L = Math.log10;
  return { get: (i, j) => C.mean_pdop[i][j], t: (v) => 1 - (L(Math.min(hi, Math.max(lo, v))) - L(lo)) / (L(hi) - L(lo) || 1), dir: -1, lo: pdopTxt(lo), hi: `${top > hi ? "≥ " : ""}${pdopTxt(hi)}`,
    uni: null, nofix: ok.length < a.length, hatch: (v) => v == null || v > thr, title: "Mean PDOP (position dilution of precision), log scale, lower is better" };
}

// box: the canvas's CSS size when it is not the field's own 2:1 (full screen); the field is centred in it
function drawField(cv, w, h, d, M, light, box) {
  const dpr = Math.min(2, window.devicePixelRatio || 1), W = Math.max(1, Math.round(w * dpr)), H = Math.max(1, Math.round(h * dpr));
  if (box) { cv.width = Math.round(box[0] * dpr); cv.height = Math.round(box[1] * dpr); } else { cv.width = W; cv.height = H; cv.style.width = `${w}px`; cv.style.height = `${h}px`; }
  const lat = d.profile.lat, lon = d.cells.lon, nr = lat.length, nc = lon.length, dLat = lat[1] - lat[0], dLon = lon[1] - lon[0];
  const T = d.avail_grid.map((row, i) => row.map((_, j) => { const v = M.get(i, j); return v == null ? null : M.t(v); }));
  const col = ramp(light), LUT = Array.from({ length: 256 }, (_, k) => col(k / 255)), nofix = light ? [206, 211, 222] : [70, 78, 98];
  const ctx = cv.getContext("2d"), img = ctx.createImageData(W, H), px = img.data;
  for (let y = 0; y < H; y++) {
    const la = 90 - ((y + 0.5) / H) * 180, fi = Math.max(0, Math.min(nr - 1, (la - lat[0]) / dLat)), i0 = Math.min(nr - 2, Math.floor(fi)), u = fi - i0, i1 = i0 + 1;
    for (let x = 0; x < W; x++) {
      const fj = (-180 + ((x + 0.5) / W) * 360 - lon[0]) / dLon, j = Math.floor(fj), v = fj - j, ja = ((j % nc) + nc) % nc, jb = (ja + 1) % nc;
      let c = nofix;
      if (T[u < 0.5 ? i0 : i1][v < 0.5 ? ja : jb] != null) {
        let s = 0, w_ = 0;
        const add = (t, k) => { if (t != null) { s += t * k; w_ += k; } };
        add(T[i0][ja], (1 - u) * (1 - v)); add(T[i0][jb], (1 - u) * v); add(T[i1][ja], u * (1 - v)); add(T[i1][jb], u * v);
        c = LUT[Math.round((s / w_) * 255)];
      }
      const o = (y * W + x) * 4;
      px[o] = c[0]; px[o + 1] = c[1]; px[o + 2] = c[2]; px[o + 3] = 255;
    }
  }
  ctx.putImageData(img, box ? Math.round((cv.width - W) / 2) : 0, box ? Math.round((cv.height - H) / 2) : 0);
}

const niceUp = (v) => { const e = 10 ** Math.floor(Math.log10(v)); return [1, 2, 2.5, 5, 10].map((k) => k * e).find((k) => k >= v - 1e-9); };

// o: { metric, sel, lon, land, pick(i, j, fromKeys), setMetric(m) } · returns { move(sel, lon), seg }
function owMap(host, d, o) {
  const light = pageLight(), P = d.profile, lat = P.lat, lon = d.cells.lon, nr = lat.length, nc = lon.length, thr = d.pdop_threshold, C = d.cells;
  const M = mapMetric(d, o.metric);
  const narrow = host.clientWidth < 460;
  const wrap = el("div", { class: `owm${narrow ? " narrow" : ""}` });
  const leg = el("div", { class: "owm-leg" }), body = el("div", { class: "owm-body" }), keys = el("div", { class: "owm-keys" });
  const live = el("div", { class: "owm-vh", "aria-live": "polite" });
  // legend: what the colour is, its range, and the marks that are not colour
  const g = Array.from({ length: 11 }, (_, k) => rgbTxt(ramp(light)(M.dir > 0 ? k / 10 : 1 - k / 10))).join(",");
  leg.append(el("span", { class: "owm-lt", text: M.title }), el("span", { class: "owm-cb" }, el("b", { text: M.lo }), el("i", { style: `background:linear-gradient(90deg,${g})`, "aria-hidden": "true" }), el("b", { text: M.hi })));
  if (M.uni) leg.append(el("span", { class: "owm-uni", text: M.uni }));
  if (M.hatch) {
    leg.append(el("span", { class: "owm-sw" }, el("i", { class: "h", "aria-hidden": "true" }), `hatched: above the PDOP limit of ${fx(thr, 1)}`));
    if (M.nofix) leg.append(el("span", { class: "owm-sw" }, el("i", { class: "n", "aria-hidden": "true" }), "grey: no fix"));
  }
  const key = (c, t, k) => el("span", {}, el("i", { class: k || "", style: `--c:var(${c})`, "aria-hidden": "true" }), t);
  keys.append(key("--cyan", "mean in view"), key("--amber", "fewest in view", "dash"), key("--magenta", "mean PDOP"), key("--ink", `PDOP limit ${fx(thr, 1)}`, "dash"));
  wrap.append(leg, body, keys, live);
  host.replaceChildren(wrap);

  // geometry: the map is 2:1; beside it (below it on narrow panels) the two latitude profiles
  const bw = Math.max(160, body.clientWidth);
  let mw, mh, my, S;
  if (!narrow) {
    // the map takes the panel's width; the panel's height follows it (the orbit view is centred beside it)
    const sw = Math.round(Math.max(120, Math.min(176, bw * 0.27)));
    my = 15; mw = Math.max(220, Math.floor(bw - sw - 14)); mh = Math.round(mw / 2);
    S = { x0: mw + 14, x1: Math.min(bw, mw + 14 + sw), y0: my, y1: my + mh, lab: false };
    body.style.flex = "none"; body.style.height = `${my + mh + 18}px`; // the keys follow the map, spare height stays below
  } else {
    my = 0; mw = bw; mh = Math.round(mw / 2);
    const y0 = my + mh + 38, sh = Math.round(Math.max(120, Math.min(170, mw * 0.46)));
    S = { x0: 34, x1: bw, y0, y1: y0 + sh, lab: true };
    body.style.height = `${S.y1 + 18}px`;
  }
  const bodyH = narrow ? S.y1 + 18 : my + mh + 18;
  const X = (l) => ((l + 180) / 360) * mw, Y = (l) => my + ((90 - l) / 180) * mh;
  const cx = (j) => X(lon[j]), cy = (i) => Y(lat[i]), cwid = mw / nc, chei = mh / nr;
  const cv = el("canvas", { class: "owm-cv", style: `left:0;top:${my}px`, "aria-hidden": "true" });
  body.append(cv);
  drawField(cv, mw, mh, d, M, light);
  // full screen: redraw the field at the screen's size (2:1, centred), and back at the panel's size after
  cv.addEventListener("fullscreenchange", () => {
    if (document.fullscreenElement === cv) { const bw_ = cv.clientWidth, bh_ = cv.clientHeight, fw = Math.min(bw_, bh_ * 2); drawField(cv, fw, fw / 2, d, M, light, [bw_, bh_]); }
    else drawField(cv, mw, mh, d, M, light);
  });

  let s = `<svg class="owm-svg" viewBox="0 0 ${bw} ${bodyH}" width="${bw}" height="${bodyH}" xmlns="${NS}" aria-hidden="true">`;
  s += `<defs><pattern id="owmHatch" patternUnits="userSpaceOnUse" width="6" height="6" patternTransform="rotate(45)"><line class="owm-h1" x1="1" y1="0" x2="1" y2="6"/><line class="owm-h2" x1="1" y1="0" x2="1" y2="6"/></pattern>`;
  s += `<clipPath id="owmClip"><rect x="0" y="${my}" width="${mw}" height="${mh}"/></clipPath></defs>`;
  if (M.hatch) {
    let r = "";
    for (let i = 0; i < nr; i++) for (let j = 0; j < nc; j++) {
      if (!M.hatch(C.mean_pdop[i][j])) continue;
      let k = j; while (k + 1 < nc && M.hatch(C.mean_pdop[i][k + 1])) k++;
      r += `<rect x="${(j * cwid).toFixed(2)}" y="${(my + (nr - 1 - i) * chei).toFixed(2)}" width="${((k - j + 1) * cwid).toFixed(2)}" height="${chei.toFixed(2)}"/>`;
      j = k;
    }
    s += `<g fill="url(#owmHatch)">${r}</g>`;
  }
  s += `<g class="owm-grat">`;
  for (let l = -150; l <= 150; l += 30) s += `<line x1="${X(l).toFixed(1)}" x2="${X(l).toFixed(1)}" y1="${my}" y2="${my + mh}"/>`;
  for (let l = -60; l <= 60; l += 30) s += `<line x1="0" x2="${mw}" y1="${Y(l).toFixed(1)}" y2="${Y(l).toFixed(1)}"/>`;
  s += `</g><g data-land="" clip-path="url(#owmClip)"></g><rect class="owm-frame" x="0.5" y="${my + 0.5}" width="${mw - 1}" height="${mh - 1}" rx="3"/>`;
  for (let l = -60; l <= 60; l += 30) s += `<text class="owm-in" x="5" y="${(Y(l) + 3.5).toFixed(1)}">${gLat(l)}</text>`;
  s += `<text class="owm-in" x="${mw - 6}" y="${my + 13}" text-anchor="end">${esc(d.body)}</text>`;
  const lstep = mw >= 460 ? 30 : 60;
  for (let l = -180 + lstep; l < 180; l += lstep) s += `<text x="${X(l).toFixed(1)}" y="${my + mh + 13}" text-anchor="middle">${lonTxt(l)}</text>`;
  s += `<rect class="owm-hov" x="0" y="0" width="${cwid.toFixed(2)}" height="${chei.toFixed(2)}" style="display:none"/>`;
  // latitude profiles, on the map's latitude axis (or their own, below the map)
  const PY = (l) => S.y0 + ((90 - l) / 180) * (S.y1 - S.y0), gap = 16, pw = (S.x1 - S.x0 - gap) / 2, ax0 = S.x0, ax1 = S.x0 + pw, bx0 = ax1 + gap, bx1 = S.x1;
  const vmax = niceUp(Math.max(...P.mean_visible)), XA = (v) => ax0 + (v / vmax) * (ax1 - ax0);
  const pd = P.mean_pdop.filter((v) => v != null), plo = Math.min(...pd) < 1 ? 0.5 : 1;
  const phi = [2, 4, 10, 20, 40, 100, 200, 400, 1000].find((k) => k >= Math.max(thr * 1.6, Math.min(Math.max(...pd), thr * 10))) || 1000, L = Math.log10;
  const XB = (v) => bx0 + ((L(Math.min(phi, Math.max(plo, v))) - L(plo)) / (L(phi) - L(plo))) * (bx1 - bx0);
  s += `<text x="${ax0}" y="${S.y0 - 5}">in view</text><text x="${bx0}" y="${S.y0 - 5}">PDOP</text>`;
  for (const l of [-60, -30, 0, 30, 60]) {
    s += `<line class="g" x1="${ax0}" x2="${ax1}" y1="${PY(l).toFixed(1)}" y2="${PY(l).toFixed(1)}"/><line class="g" x1="${bx0}" x2="${bx1}" y1="${PY(l).toFixed(1)}" y2="${PY(l).toFixed(1)}"/>`;
    if (S.lab) s += `<text x="${ax0 - 5}" y="${(PY(l) + 3.5).toFixed(1)}" text-anchor="end">${gLat(l)}</text>`;
  }
  const pts = lat.map((l, i) => `${XA(P.mean_visible[i]).toFixed(1)},${PY(l).toFixed(1)}`);
  s += `<path class="ar" style="--c:var(--cyan)" d="M${ax0},${PY(lat[0]).toFixed(1)} L${pts.join(" L")} L${ax0},${PY(lat[nr - 1]).toFixed(1)}Z"/>`;
  s += `<polyline class="ln" style="--c:var(--cyan)" points="${pts.join(" ")}"/>`;
  s += `<polyline class="ln2" style="--c:var(--amber)" points="${lat.map((l, i) => `${XA(P.min_visible[i]).toFixed(1)},${PY(l).toFixed(1)}`).join(" ")}"/>`;
  s += `<line class="ax" x1="${ax0}" x2="${ax0}" y1="${S.y0}" y2="${S.y1}"/><text x="${ax0}" y="${S.y1 + 13}">0</text><text x="${ax1}" y="${S.y1 + 13}" text-anchor="end">${vmax}</text>`;
  // log ticks: a label is dropped if it would touch a neighbour's or the limit's (about 6 px a character)
  const lab = (k, x) => { const w = String(k).length * 6.1, a = x - bx0 < 8 ? "start" : x > bx1 - 8 ? "end" : "middle"; return { a, c: a === "start" ? x + w / 2 : a === "end" ? x - w / 2 : x, w }; };
  const tL = lab(fx(thr, 1), XB(thr)), placed = [tL];
  for (const k of [0.5, 1, 2, 4, 10, 20, 40, 100, 200, 400, 1000].filter((v) => v >= plo && v <= phi)) {
    const x = XB(k), L_ = lab(k, x);
    if (placed.some((p) => Math.abs(p.c - L_.c) < (p.w + L_.w) / 2 + 4)) continue;
    placed.push(L_);
    s += `<line class="g" x1="${x.toFixed(1)}" x2="${x.toFixed(1)}" y1="${S.y0}" y2="${S.y1}"/><text x="${x.toFixed(1)}" y="${S.y1 + 13}" text-anchor="${L_.a}">${k}</text>`;
  }
  const segs = []; let cur = [];
  lat.forEach((l, i) => { const v = P.mean_pdop[i]; if (v == null) { if (cur.length) segs.push(cur); cur = []; } else cur.push(`${XB(v).toFixed(1)},${PY(l).toFixed(1)}`); });
  if (cur.length) segs.push(cur);
  segs.forEach((q) => { s += q.length > 1 ? `<polyline class="ln" style="--c:var(--magenta)" points="${q.join(" ")}"/>` : `<circle class="cd" style="--c:var(--magenta)" cx="${q[0].split(",")[0]}" cy="${q[0].split(",")[1]}" r="2"/>`; });
  const tx = XB(thr).toFixed(1);
  s += `<line class="thr" x1="${tx}" x2="${tx}" y1="${S.y0}" y2="${S.y1}"/><text class="thr-t" x="${tx}" y="${S.y1 + 13}" text-anchor="middle">${fx(thr, 1)}</text><line class="ax" x1="${bx0}" x2="${bx0}" y1="${S.y0}" y2="${S.y1}"/>`;
  // the receiver: a marker at its cell on the map, and its latitude on both profiles
  s += `<g data-rx=""><line class="owm-guide" x1="${ax0}" x2="${bx1}" y1="0" y2="0"/><circle class="cd" style="--c:var(--cyan)" r="3.5"/><circle class="cd" style="--c:var(--magenta)" r="3.5"/>`;
  s += `<g class="owm-rx"><circle class="h" r="7"/><circle class="r" r="7"/><circle class="c" r="1.8"/></g></g></svg>`;
  const svg = svgNode(s);
  body.append(svg);
  if (d.body === "Earth" && o.land) {
    const lg = svg.querySelector("[data-land]"), dd = o.land.filter((r) => r.length > 8).map((r) => `M${r.map(([a, b]) => `${X(a).toFixed(1)},${Y(b).toFixed(1)}`).join("L")}`).join("");
    for (const c of ["owm-landh", "owm-land"]) { const p = document.createElementNS(NS, "path"); p.setAttribute("class", c); p.setAttribute("d", dd); lg.appendChild(p); }
  }
  const hit = el("div", { class: "owm-hit", tabindex: "0", role: "group", "aria-roledescription": "map", style: `left:0;top:${my}px;width:${mw}px;height:${mh}px`,
    "aria-label": `${M.title} over ${d.body}, by 10 degree cell. Arrow keys move the receiver; its cell is read out below.`, "aria-keyshortcuts": "ArrowUp ArrowDown ArrowLeft ArrowRight" });
  const tip = el("div", { class: "owm-tip", hidden: "" });
  body.append(hit, tip);

  const rx = svg.querySelector("[data-rx]"), [guide, dA, dB] = rx.children, mark = rx.querySelector(".owm-rx"), hov = svg.querySelector(".owm-hov");
  const info = (i, j) => { const p = C.mean_pdop[i][j]; return [`${latTxt(lat[i])}, ${lonTxt(lon[j])}`, [["In view", `${fx(C.mean_visible[i][j], 1)} mean · ${C.min_visible[i][j]} fewest`], ["PDOP", `${pdopTxt(p)}${p != null && p > thr ? `, above ${fx(thr, 1)}` : ""}`], ["Availability", `${d.avail_grid[i][j]} %`]]]; };
  let rI = o.sel, rJ = o.lon, hovOn = false;
  const showTip = (i, j) => {
    const [h, rows] = info(i, j);
    tip.replaceChildren(el("b", { text: h }), ...rows.map(([a, b]) => el("span", {}, a, el("em", { text: b }))));
    tip.hidden = false;
    const x = cx(j), y = cy(i), tw = tip.offsetWidth, th = tip.offsetHeight;
    tip.style.left = `${Math.max(0, Math.min(bw - tw, x + 14 + tw > mw ? x - tw - 14 : x + 14))}px`;
    tip.style.top = `${Math.max(0, Math.min(bodyH - th, y - th / 2))}px`;
    hov.style.display = ""; hov.setAttribute("x", (j * cwid).toFixed(2)); hov.setAttribute("y", (my + (nr - 1 - i) * chei).toFixed(2));
  };
  const hideTip = () => { tip.hidden = true; hov.style.display = "none"; };
  const cellAt = (e) => { const b = hit.getBoundingClientRect(); return [Math.max(0, Math.min(nr - 1, nr - 1 - Math.floor(((e.clientY - b.top) / b.height) * nr))), Math.max(0, Math.min(nc - 1, Math.floor(((e.clientX - b.left) / b.width) * nc)))]; };
  hit.addEventListener("pointermove", (e) => { hovOn = true; const [i, j] = cellAt(e); showTip(i, j); });
  hit.addEventListener("pointerleave", () => { hovOn = false; if (document.activeElement === hit) showTip(rI, rJ); else hideTip(); });
  hit.addEventListener("click", (e) => { const [i, j] = cellAt(e); o.pick(i, j); showTip(i, j); });
  hit.addEventListener("focus", () => showTip(rI, rJ));
  hit.addEventListener("blur", () => { if (!hovOn) hideTip(); });
  hit.addEventListener("keydown", (e) => {
    const k = { ArrowUp: [1, 0], ArrowDown: [-1, 0], ArrowLeft: [0, -1], ArrowRight: [0, 1] }[e.key];
    if (e.key === "Escape") { hideTip(); return; }
    if (!k) return;
    e.preventDefault();
    const i = Math.max(0, Math.min(nr - 1, rI + k[0])), j = (rJ + k[1] + nc) % nc;
    o.pick(i, j); showTip(i, j);
    const [h, rows] = info(i, j); live.textContent = `${h}: ${rows.map(([a, b]) => `${a} ${b}`).join("; ")}`;
  });
  function move(i, j) {
    rI = i; rJ = j;
    const x = cx(j).toFixed(1), y = cy(i).toFixed(1), py = PY(lat[i]).toFixed(1);
    mark.style.transform = `translate(${x}px, ${y}px)`;
    guide.setAttribute("y1", py); guide.setAttribute("y2", py);
    dA.setAttribute("cx", XA(P.mean_visible[i]).toFixed(1)); dA.setAttribute("cy", py);
    const v = P.mean_pdop[i]; dB.style.display = v == null ? "none" : "";
    if (v != null) { dB.setAttribute("cx", XB(v).toFixed(1)); dB.setAttribute("cy", py); }
    if (!tip.hidden && !hovOn) showTip(i, j);
  }
  move(rI, rJ);
  // the metric control: three toggle buttons, one pressed
  const seg = el("span", { class: "owm-seg", role: "group", "aria-label": "Colour the map by" });
  for (const [k, full, short] of MAP_KEYS) {
    const b = el("button", { type: "button", "aria-pressed": k === o.metric ? "true" : "false", title: k === "pdop" ? "Mean PDOP (position dilution of precision)" : full }, el("span", { class: "owm-full", text: full }), el("span", { class: "owm-short", text: short }));
    b.addEventListener("click", () => o.setMetric(k));
    seg.append(b);
  }
  return { move, seg, focus: () => hit.focus() };
}

// body-pnt runs (Mars, Europa): the receiver response over the run, time across, as SVG
function owChart(d, sel, W = 560, H = 330) {
  W = Math.round(Math.max(300, W)); H = Math.round(Math.max(220, H));
  let s = `<svg viewBox="0 0 ${W} ${H}" xmlns="${NS}">`;
  // body-pnt: the receiver response over the run, time across
  const t = d.t, T = t[t.length - 1] / 3600, l = 40, r = W - 10, aT = 22, aB = Math.round(aT + (H - 52) * 0.39), bT = aB + 30, bB = H - 30;
  const X = (s_) => l + (s_ / 3600 / T) * (r - l);
  const nmax = Math.max(...d.n_vis) + 1, YA = (v) => aB - (v / nmax) * (aB - aT);
  const errs = d.err_relays.concat(d.err_earth).filter((v) => v != null && v > 0), elo = Math.floor(Math.log10(Math.min(...errs))), ehi = Math.ceil(Math.log10(Math.max(...errs)));
  const YB = (v) => bB - ((Math.log10(v) - elo) / (ehi - elo)) * (bB - bT);
  let run0 = null;
  d.earth_vis.forEach((v, i) => { if (v && run0 == null) run0 = i; if ((!v || i === t.length - 1) && run0 != null) { const i1 = v ? i : i - 1; s += `<rect class="band" x="${X(t[run0])}" y="${aT}" width="${Math.max(1, X(t[i1]) - X(t[run0]))}" height="${bB - aT}"/>`; run0 = null; } });
  for (let v = 0; v <= nmax; v += Math.max(1, Math.round(nmax / 4))) s += `<line class="g" x1="${l}" x2="${r}" y1="${YA(v)}" y2="${YA(v)}"/><text x="${l - 6}" y="${YA(v) + 3}" text-anchor="end">${v}</text>`;
  s += `<line class="thr" x1="${l}" x2="${r}" y1="${YA(4)}" y2="${YA(4)}"/><text class="thr-t" x="${r}" y="${YA(4) - 4}" text-anchor="end">${W < 400 ? "four for a fix" : "four needed for a fix"}</text>`;
  s += `<text x="${l}" y="12">relays in view · shaded: Earth above the horizon</text>`;
  s += `<path class="ar" style="--c:var(--cyan)" d="M${X(0)},${aB} ${t.map((s_, i) => `L${X(s_).toFixed(1)},${YA(d.n_vis[i]).toFixed(1)}`).join(" ")} L${X(t[t.length - 1])},${aB}Z"/>`;
  s += `<polyline class="ln" style="--c:var(--cyan)" points="${t.map((s_, i) => `${X(s_).toFixed(1)},${YA(d.n_vis[i]).toFixed(1)}`).join(" ")}"/>`;
  for (let e = elo; e <= ehi; e++) s += `<line class="g" x1="${l}" x2="${r}" y1="${YB(10 ** e)}" y2="${YB(10 ** e)}"/><text x="${l - 6}" y="${YB(10 ** e) + 3}" text-anchor="end">${e < 0 ? (10 ** e).toFixed(-e) : 10 ** e}</text>`;
  s += `<text x="${l}" y="${bT - 8}">position error (m, log)</text>`;
  const line = (arr, cls, c) => { const segs = []; let cur = []; arr.forEach((v, i) => { if (v == null || v <= 0) { if (cur.length) segs.push(cur); cur = []; } else cur.push(`${X(t[i]).toFixed(1)},${YB(v).toFixed(1)}`); }); if (cur.length) segs.push(cur); return segs.map((g) => `<polyline class="${cls}" style="--c:var(${c})" points="${g.join(" ")}"/>`).join(""); };
  s += line(d.err_relays, "ln", "--amber") + line(d.err_earth, "ln2", "--lime");
  for (let h = 0; h <= T; h += T > 30 ? 12 : W < 400 && T > 12 ? 12 : 6) s += `<text x="${X(h * 3600)}" y="${bB + 14}" text-anchor="middle">${h} h</text>`;
  s += `<g data-cur=""><line class="cur" x1="${X(t[sel])}" x2="${X(t[sel])}" y1="${aT}" y2="${bB}"/><circle class="cd" style="--c:var(--cyan)" cx="${X(t[sel])}" cy="${YA(d.n_vis[sel])}" r="4"/></g></svg>`;
  return { svg: s, keys: [["--cyan", "relays in view"], ["--amber", "error, relays only"], ["--lime", "error, relays and Earth range", "dash"], ["--cyan", "Earth visible", "box"]], X, YA, t };
}

const PLAY_SVG = '<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" aria-hidden="true"><path d="M2 1l9 5-9 5z" fill="currentColor"/></svg>';
const PAUSE_SVG = '<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" aria-hidden="true"><path d="M2 1h3v10H2zM7 1h3v10H7z" fill="currentColor"/></svg>';

async function orbitConsole() {
  const root = $("[data-ow]");
  if (!root) return;
  const tabs = $$("[data-ow-run]", root), slide = $("[data-ow-slide]", root), sout = $("[data-ow-sout]", root), slab = $("[data-ow-slabel]", root);
  const chart = $("[data-ow-chart]", root), keys = $("[data-ow-keys]", root), chips = $("[data-ow-chips]", root), ros = $$(".ro", root);
  const stage = $("[data-ow-stage]", root), canvas = $("#owGl"), hud = $("[data-ow-hud]", root), play = $("[data-ow-play]", root);
  const prov = $("[data-ow-prov]"), note = $("[data-ow-note]"), tOut = $("[data-ow-t]", root);
  let land = null;
  const landP = fetch(`${ROOT}data/land.json`).then((r) => r.json()).then((j) => (land = j), () => (land = []));
  let name = OW_ORDER[0], d = RUNS.runs[name], sel = 0, playing = !RM, tSim = 0, globe = null, vis = false, held = false, scanDir = 1;
  let selLon = 0, metricUser = null, landWait = false; // the receiver's longitude column; the map metric the visitor picked, if any

  // readouts update in place (the latitude scan rewrites them every step; nodes are kept, only text changes)
  const ro = (i, l, v, dot) => {
    const box = ros[i];
    let L = box.querySelector(".l"), V = box.querySelector(".v");
    if (!V || !V.querySelector(".vt")) { L = el("div", { class: "l" }); V = el("div", { class: "v" }, el("i", { class: "dot" }), el("span", { class: "vt" })); box.replaceChildren(L, V); }
    if (L.textContent !== l) { L.textContent = l; L.title = l; }
    const D = V.querySelector(".dot");
    D.hidden = dot == null; D.classList.toggle("bad", dot != null && !dot);
    const T = V.querySelector(".vt"), nv = el("span", {}, ...(Array.isArray(v) ? v : [v]));
    if (T.innerHTML !== nv.innerHTML) T.replaceChildren(...nv.childNodes);
  };
  const unit = (v, u) => [v, el("small", { text: u })];
  function readouts() {
    if (d.kind === "constellation-design") {
      const P = d.profile;
      ro(0, "Satellites", fx(d.total, 0));
      ro(1, `Availability, PDOP ≤ ${d.pdop_threshold}`, unit(fx(d.global.availability_pct, 2), "%"));
      const at = `At ${latTxt(P.lat[sel])}, ${lonTxt(d.cells.lon[selLon])}`, av = d.avail_grid[sel][selLon];
      ro(2, `${at}: in view, mean · fewest`, `${fx(d.cells.mean_visible[sel][selLon], 1)} · ${d.cells.min_visible[sel][selLon]}`);
      ro(3, `${at}: availability`, unit(fx(av, 0), "%"), av >= 99.5);
    } else {
      const n = d.n_vis[sel], er = d.err_relays[sel], ee = d.err_earth[sel];
      ro(0, "Relays in view", `${n} of ${d.relays.planes * d.relays.per_plane}`, n >= 4);
      ro(1, "Position error, relays only", er == null ? "no fix" : unit(fx(er, 2), "m"));
      ro(2, "With the Earth range", ee == null ? "no fix" : unit(fx(ee, 2), "m"));
      ro(3, `Earth · light time ${fx(d.light_time_s, 0)} s`, d.earth_vis[sel] ? "above horizon" : "occulted", !!d.earth_vis[sel]);
    }
  }
  let curG = null, cfg = null;
  const pickCell = (i, j) => {
    sel = i; selLon = j; held = true; slide.value = i; setSlider(); readouts();
    if (cfg && cfg.move) cfg.move(i, j);
    if (globe) globe.kick();
  };
  function drawChart() {
    if (d.kind === "constellation-design") {
      chart.setAttribute("role", "group");
      chart.setAttribute("aria-label", `Receiver response for ${name}: a map of the ${d.body} by 10 degree cell, with mean and fewest satellites in view and mean PDOP by latitude beside it`);
      cfg = owMap(chart, d, { metric: metricUser || mapDefault(d), sel, lon: selLon, land, pick: pickCell,
        setMetric: (k) => { metricUser = k; drawChart(); const b = keys.querySelector('[aria-pressed="true"]'); if (b) b.focus(); } });
      curG = null;
      keys.replaceChildren(cfg.seg);
      if (land == null && d.body === "Earth" && !landWait) { landWait = true; landP.then(() => { landWait = false; if (d.kind === "constellation-design" && d.body === "Earth") drawChart(); }); }
      return;
    }
    chart.setAttribute("role", "img");
    cfg = owChart(d, sel, chart.clientWidth || 560, chart.clientHeight || 330);
    const node = svgNode(cfg.svg);
    chart.replaceChildren(node);
    curG = $("[data-cur]", node);
    keys.replaceChildren(...cfg.keys.map(([c, l, k]) => el("span", {}, el("i", { class: k || "", style: `--c:var(${c})` }), l)));
    chart.setAttribute("aria-label", `Receiver response over the run for ${name}: relays in view, and position error with relays only and with the Earth range`);
    if (cfg.land) landP.then(() => {
      const g = $("[data-land]", chart); if (!g || !land) return;
      const { x0, x1, top, bot } = cfg.land, X = (lo) => x0 + ((lo + 180) / 360) * (x1 - x0), Y = (la) => top + ((90 - la) / 180) * (bot - top);
      for (const r of land) {
        if (r.length <= 8) continue;
        const p = document.createElementNS(NS, "polyline");
        p.setAttribute("class", "land");
        p.setAttribute("points", r.map(([lo, la]) => `${X(lo).toFixed(1)},${Y(la).toFixed(1)}`).join(" "));
        g.appendChild(p);
      }
    });
  }
  function moveCursor() {
    if (!cfg) return;
    if (d.kind === "constellation-design") { if (cfg.move) cfg.move(sel, selLon); else drawChart(); return; }
    const x = cfg.X(cfg.t[sel]).toFixed(1);
    const [ln, c] = curG.children;
    ln.setAttribute("x1", x); ln.setAttribute("x2", x); c.setAttribute("cx", x); c.setAttribute("cy", cfg.YA(d.n_vis[sel]).toFixed(1));
  }
  function setSlider() {
    const v = +slide.value, max = +slide.max;
    slide.style.setProperty("--v", `${(v / max) * 100}%`);
    if (d.kind === "constellation-design") { sout.textContent = latTxt(d.profile.lat[v]); slide.setAttribute("aria-valuetext", latTxt(d.profile.lat[v])); }
    else { sout.textContent = hmsT(d.t[v]); slide.setAttribute("aria-valuetext", `${hmsT(d.t[v])}, ${d.n_vis[v]} relays in view`); }
  }
  function select(n) {
    name = n; d = RUNS.runs[n];
    const c = RUNS.cards[n];
    tabs.forEach((b) => { const on = b.getAttribute("data-ow-run") === n; b.setAttribute("aria-selected", on ? "true" : "false"); b.tabIndex = on ? 0 : -1; });
    $("[data-ow-kind]", root).textContent = d.kind;
    root.classList.toggle("ow-map", d.kind === "constellation-design"); // the map sets the panel's height (missions.css)
    $("[data-ow-file]", root).textContent = c.file.replace(/\.toml$/, "");
    $("[data-ow-eng]", root).textContent = `engine v${ENG.version} · build ${ENG.commit}${c.seed != null ? ` · seed ${c.seed}` : " · deterministic"}`;
    $("[data-ow-about]", root).textContent = c.about;
    $("[data-ow-count]", root).textContent = d.kind === "constellation-design" ? `${fx(d.total, 0)} satellites · ${d.body}` : `${d.relays.planes * d.relays.per_plane} relays and an orbiter · ${d.body}`;
    if (d.kind === "constellation-design") {
      slab.textContent = "Receiver latitude"; slide.max = d.profile.lat.length - 1;
      sel = d.profile.lat.findIndex((l) => l >= (d.body === "Moon" ? -85 : 45)); if (sel < 0) sel = 0;
      selLon = Math.max(0, d.cells.lon.findIndex((l) => l > 0)); // the first cell east of the prime meridian
      chips.replaceChildren(...[["mask", `${d.mask_deg}°`], ["epochs", d.epochs], ["span", `${fx(d.duration_s / 3600, 1)} h`], ["J2", d.j2 ? "on" : "off"],
        ...d.constellations.map((k) => [k.name, k.satellites])].map(([a, b]) => el("span", {}, `${a} `, el("b", { text: String(b) }))));
    } else {
      slab.textContent = "Mission time"; slide.max = d.t.length - 1; sel = 0;
      chips.replaceChildren(...[["relays", `${d.relays.planes} × ${d.relays.per_plane} at ${fx(d.relays.altitude_km, 0)} km, ${d.relays.inclination_deg}°`], ["orbiter", `${d.user.altitude_km} km, ${d.user.inclination_deg}°`],
        ["epochs", d.t.length], ["range σ", `${d.relays.sigma_range_m} m`]].map(([a, b]) => el("span", {}, `${a} `, el("b", { text: String(b) }))));
    }
    slide.value = sel; tSim = 0; held = false;
    setSlider(); drawChart(); readouts();
    provRun(prov, n);
    const res = d.residual_deg != null ? `Orbits: the run's ${d.model === "walker" ? "Walker shells" : "satellites"} re-propagated here and checked against all ${fx(d.residual_samples, 0)} ground-track samples the engine wrote (worst ${d.residual_deg}°).`
      : `Orbits: the relays and the orbiter rebuilt from the scenario exactly as the engine builds them; the satellites-in-view count they give equals the engine's at all ${d.check.epochs} epochs.`;
    note.textContent = `${res} Orbit radii are scaled for display; planes, phasing and periods are the run's. ${d.body} imagery: NASA.${d.kind === "constellation-design" && d.tracks_shown < d.total ? ` The engine wrote ground tracks for ${d.tracks_shown} of the ${fx(d.total, 0)} satellites; all ${fx(d.total, 0)} are drawn from its shells.` : ""}`;
    canvas.setAttribute("data-planet", d.body.toLowerCase());
    const fb = $(".fallback", stage);
    if (fb) { const src = { earth: "earth-disc-640.webp", moon: "moon-disc-320.webp" }[d.body.toLowerCase()]; fb.hidden = !src; if (src) fb.src = `${ROOT}assets/planets/${src}`; }
    tOut.textContent = `t = ${hmsT(0)}`;
    if (globe) globe.set(d);
  }
  tabs.forEach((b, i) => {
    b.addEventListener("click", () => select(b.getAttribute("data-ow-run")));
    b.addEventListener("keydown", (e) => {
      const j = { ArrowDown: 1, ArrowRight: 1, ArrowUp: -1, ArrowLeft: -1 }[e.key];
      if (j == null) return;
      e.preventDefault(); const t = tabs[(i + j + tabs.length) % tabs.length]; t.focus(); t.click();
    });
  });
  const setPlay = (on) => {
    playing = on;
    play.setAttribute("aria-label", on ? "Pause the orbits" : "Play the orbits");
    play.replaceChildren(svgNode(on ? PAUSE_SVG : PLAY_SVG));
    if (on && globe) globe.kick();
  };
  slide.addEventListener("input", () => {
    sel = +slide.value; held = true; setSlider(); readouts(); moveCursor();
    if (d.kind === "body-pnt") { tSim = d.t[sel]; tOut.textContent = `t = ${hmsT(tSim)}`; if (playing) setPlay(false); }
    if (globe) globe.kick();
  });
  play.addEventListener("click", () => { held = false; setPlay(!playing); });
  setPlay(playing);
  select(name);
  // the chart is drawn at its box's own size, so its text stays 10 px at every width
  let rw = 0, rh = 0;
  // the map's colour ramp follows the theme (the site's toggle stamps data-theme; the OS setting otherwise)
  const reTheme = () => { if (d.kind === "constellation-design") drawChart(); };
  new MutationObserver(reTheme).observe(document.documentElement, { attributes: true, attributeFilter: ["data-theme"] });
  matchMedia("(prefers-color-scheme: dark)").addEventListener("change", reTheme);
  if ("ResizeObserver" in window) new ResizeObserver(() => { const w = chart.clientWidth, h = chart.clientHeight; if (Math.abs(w - rw) > 2 || Math.abs(h - rh) > 2) { rw = w; rh = h; drawChart(); } }).observe(chart);
  // constellation runs: while playing, the receiver scans the run's latitude rows, reading each row's real
  // figures (a body-pnt run instead follows mission time); dragging the slider holds the row you picked
  setInterval(() => {
    if (!playing || held || !vis || RM || document.hidden || d.kind !== "constellation-design") return;
    const max = +slide.max; let k = sel + scanDir;
    if (k > max || k < 0) { scanDir = -scanDir; k = sel + scanDir; }
    sel = Math.max(0, Math.min(max, k)); slide.value = sel; setSlider(); readouts(); moveCursor();
    if (globe) globe.kick();
  }, 1100);

  // the globe: three.js from the CDN the site already uses (the version Home loads), only when near
  let started = false;
  const start = async () => {
    if (started) return; started = true;
    let THREE;
    try { const c = document.createElement("canvas"); if (!(c.getContext("webgl2") || c.getContext("webgl"))) return; } catch (e) { return; }
    try { THREE = await import("../vendor/three@0.160.0/build/three.module.js"); } catch (e) { console.warn("missions: three.js unavailable", e); return; }
    const span = () => d.duration_s || d.t[d.t.length - 1];
    globe = makeGlobe(THREE, canvas, stage, hud, {
      onTick(dt) {
        if (!playing || !vis) return false;
        tSim = (tSim + (dt * span()) / LOOP_S) % span();
        if (d.kind === "body-pnt") {
          const k = Math.min(d.t.length - 1, Math.floor(tSim / d.step_s));
          if (k !== sel) { sel = k; slide.value = k; setSlider(); readouts(); moveCursor(); }
        }
        tOut.textContent = `t = ${hmsT(tSim)}`;
        return true;
      },
      time: () => tSim, sel: () => sel, visible: () => vis,
    });
    globe.set(d);
  };
  if ("IntersectionObserver" in window) new IntersectionObserver((es) => { vis = es[es.length - 1].isIntersecting; if (vis) { start(); if (globe) globe.kick(); } }, { rootMargin: "200px" }).observe(root);
  else { vis = true; start(); }
}

function makeGlobe(THREE, canvas, stage, hud, H) {
  const D2R = Math.PI / 180;
  const cssv = (v) => getComputedStyle(document.documentElement).getPropertyValue(v).trim();
  const isLight = () => { const t = document.documentElement.getAttribute("data-theme"); return t ? t === "light" : !matchMedia("(prefers-color-scheme: dark)").matches; };
  const T3 = (x, y, z) => new THREE.Vector3(x, z, -y); // body frame (x, y, z) to three (x, z, -y): the pole is +y, longitude 0 is +x
  const renderer = new THREE.WebGLRenderer({ canvas, antialias: true, alpha: true, powerPreference: "high-performance" });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, 2));
  renderer.setClearColor(0x000000, 0);
  renderer.outputColorSpace = THREE.SRGBColorSpace;
  const pr = renderer.getPixelRatio();
  const scene = new THREE.Scene(), camera = new THREE.PerspectiveCamera(30, 1, 0.05, 200);
  const root = new THREE.Group(); scene.add(root);
  const bodyG = new THREE.Group(); root.add(bodyG);   // body-fixed frame (turns with the body)
  const inert = new THREE.Group(); root.add(inert);   // the run's inertial frame (body-fixed at the epoch)
  const amb = new THREE.AmbientLight(0xffffff, 0.45); scene.add(amb);
  const sun = new THREE.DirectionalLight(0xffffff, 2.3); sun.position.set(-3, 1.6, 4); scene.add(sun);
  const loader = new THREE.TextureLoader();
  const TEX = { earth: ["earth-day-256.jpg", "earth-day-2048.jpg"], moon: ["moon-256.jpg", "moon-2048.jpg"], mars: ["mars-256.jpg", "mars-1440.jpg"] };
  const texCache = {};
  const tex = (b) => {
    if (texCache[b]) return texCache[b];
    const [lo, hi] = TEX[b];
    const m = new THREE.MeshStandardMaterial({ roughness: 1, metalness: 0 });
    m.map = loader.load(`${ROOT}assets/planets/${lo}`, () => { stage.classList.add("gl-ready"); kick(); loader.load(`${ROOT}assets/planets/${hi}`, (t) => { t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; m.map = t; m.needsUpdate = true; kick(); }); });
    m.map.colorSpace = THREE.SRGBColorSpace;
    return (texCache[b] = m);
  };
  const sphere = new THREE.Mesh(new THREE.SphereGeometry(1, 96, 64), tex("earth"));
  bodyG.add(sphere);
  const glowVS = `attribute vec3 aCol; attribute float aOp; varying vec3 vC; varying float vO; uniform float uSize, uPR; void main(){ vC = aCol; vO = aOp; vec4 mv = modelViewMatrix * vec4(position,1.0); gl_PointSize = uSize * uPR; gl_Position = projectionMatrix * mv; }`;
  const glowFS = `varying vec3 vC; varying float vO; uniform float uOp; void main(){ vec2 c = gl_PointCoord - 0.5; float r = length(c); if (r > 0.5) discard; float core = smoothstep(0.2, 0.07, r); float halo = smoothstep(0.5, 0.0, r) * 0.35; gl_FragColor = vec4(vC, (core + halo) * uOp * vO); }`;
  const lineVS = `attribute vec3 aCol; attribute float aA; varying vec3 vC; varying float vA; void main(){ vC = aCol; vA = aA; gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0); }`;
  const lineFS = `varying vec3 vC; varying float vA; uniform float uOp; void main(){ gl_FragColor = vec4(vC, vA * uOp); }`;
  const mat = (vs, fs, u) => new THREE.ShaderMaterial({ vertexShader: vs, fragmentShader: fs, uniforms: u, transparent: true, depthWrite: false });
  let objs = [], S = null, d = null;

  function kepler(M, e) { let E = e < 0.8 ? M : Math.PI; for (let i = 0; i < 20; i++) { const dE = (E - e * Math.sin(E) - M) / (1 - e * Math.cos(E)); E -= dE; if (Math.abs(dE) < 1e-10) break; } return E; }
  // the Walker shells as src/constellation.rs builds them (WalkerSpec::elements, Sat::new's secular J2 rates)
  function walkerSats(run) {
    const out = [], R = run.radius_km, mu = run.mu_km3_s2, j2 = run.j2c || 0;
    run.shells.forEach((s) => {
      const P = s.planes, Tt = s.total, dR = (s.pattern === "delta" ? 2 * Math.PI : Math.PI) / P, dM = (2 * Math.PI * P) / Tt, dF = (2 * Math.PI * s.phasing) / Tt;
      const a = s.a_km, n = Math.sqrt(mu / a ** 3), p = a * (1 - s.e * s.e), f = n * j2 * (R / p) ** 2, ci = Math.cos(s.i * D2R);
      for (let k = 0; k < P; k++) for (let j = 0; j < Tt / P; j++)
        out.push({ c: s.c, a: a / R, e: s.e, i: s.i * D2R, raan: s.raan0 * D2R + k * dR, argp: s.argp * D2R, m0: s.m0 * D2R + j * dM + k * dF, rd: -1.5 * f * ci, ad: 0.75 * f * (5 * ci * ci - 1), md: n, first: j === 0 });
    });
    return out;
  }
  // relays and orbiter as src/body_pnt.rs builds them (EqOrbit, with its J2 rates)
  function eqSats(run) {
    const mu = run.gm_m3_s2, R = run.radius_m, re = run.re_m, J2 = run.j2 || 0, P = run.relays.planes, Sp = run.relays.per_plane, F = run.relays.phasing_f, Tt = P * Sp;
    const mk = (a, e, inc, raan0, u0, c, first) => { const n = Math.sqrt(mu / a ** 3), p = a * (1 - e * e), k = J2 * (re / p) ** 2, ci = Math.cos(inc);
      return { c, a: a / R, e, i: inc, raan: raan0, argp: 0, m0: u0, rd: -1.5 * n * k * ci, ad: 0.75 * n * k * (5 * ci * ci - 1), md: n * (1 + 0.75 * k * Math.sqrt(1 - e * e) * (3 * ci * ci - 1)), first }; };
    const a = R + run.relays.altitude_km * 1e3, inc = run.relays.inclination_deg * D2R, out = [];
    for (let p = 0; p < P; p++) for (let s = 0; s < Sp; s++) out.push(mk(a, 0, inc, (2 * Math.PI * p) / P, 2 * Math.PI * (s / Sp + (F * p) / Tt), 0, s === 0));
    const u = run.user;
    const user = mk(R + (u.altitude_km ?? 400) * 1e3, u.eccentricity ?? 0, (u.inclination_deg ?? 75) * D2R, (u.raan_deg ?? 0) * D2R, (u.u0_deg ?? 0) * D2R, 1, true);
    return { sats: out, user };
  }
  // the GNSS presets: circular two-body orbits recovered from the engine's ground tracks (record_runs.py)
  function circSats(run) { return run.sats.map((s) => ({ c: Math.max(0, run.constellations.findIndex((k) => k.name === s.c)), circ: true, h: s.h, u0: s.u0, n: s.n, a: s.a_km / run.radius_km })); }
  const rod = (v, k, th, out) => { const c = Math.cos(th), s = Math.sin(th), d_ = k[0] * v[0] + k[1] * v[1] + k[2] * v[2]; out[0] = v[0] * c + (k[1] * v[2] - k[2] * v[1]) * s + k[0] * d_ * (1 - c); out[1] = v[1] * c + (k[2] * v[0] - k[0] * v[2]) * s + k[1] * d_ * (1 - c); out[2] = v[2] * c + (k[0] * v[1] - k[1] * v[0]) * s + k[2] * d_ * (1 - c); return out; };
  // inertial position at t, in units of the body radius
  function pos(s, t, o) {
    if (s.circ) { rod(s.u0, s.h, s.n * t, o); o[0] *= s.a; o[1] *= s.a; o[2] *= s.a; return o; }
    const E = kepler(s.m0 + s.md * t, s.e);
    const x = s.a * (Math.cos(E) - s.e), y = s.a * Math.sqrt(1 - s.e * s.e) * Math.sin(E);
    const w = s.argp + s.ad * t, O = s.raan + s.rd * t, cw = Math.cos(w), sw = Math.sin(w), co = Math.cos(O), so = Math.sin(O), ci = Math.cos(s.i), si = Math.sin(s.i);
    o[0] = (cw * co - sw * so * ci) * x + (-sw * co - cw * so * ci) * y; o[1] = (cw * so + sw * co * ci) * x + (-sw * so + cw * co * ci) * y; o[2] = sw * si * x + cw * si * y;
    return o;
  }
  const clear = () => { objs.forEach((o) => { o.parent.remove(o); o.geometry.dispose(); o.material.dispose(); }); objs = []; };
  const disp = (o, K) => { const r = Math.hypot(o[0], o[1], o[2]), sc = (1 + K * (r - 1)) / r; return T3(o[0] * sc, o[1] * sc, o[2] * sc); };
  function set(run) {
    d = run; clear();
    sphere.material = tex(run.body.toLowerCase());
    let sats, user = null;
    if (run.kind === "body-pnt") ({ sats, user } = eqSats(run));
    else sats = run.model === "walker" ? walkerSats(run) : circSats(run);
    const rmax = Math.max(...sats.map((s) => s.a * (1 + (s.e || 0))), user ? user.a : 1);
    const K = Math.min(3, 1.15 / Math.max(1e-3, rmax - 1)); // display radius = 1 + K (r - 1), in body radii
    const N = sats.length, tmp = [0, 0, 0];
    // orbit rings: one per plane at t = 0 (planes of the GNSS presets de-duplicated)
    const seen = new Set();
    const planeSats = sats.filter((s) => { if (s.circ) { const key = s.h.map((x) => Math.round(x * 30)).join(",") + "," + Math.round(s.a * 10); if (seen.has(key)) return false; seen.add(key); return true; } return s.first; });
    const M = 128, ringPos = new Float32Array(planeSats.length * M * 6), ringCol = new Float32Array(planeSats.length * M * 6), ringA = new Float32Array(planeSats.length * M * 2);
    planeSats.forEach((s, pi) => {
      for (let k = 0; k < M; k++) for (let e = 0; e < 2; e++) {
        const f = (k + e) / M;
        if (s.circ) { rod(s.u0, s.h, f * 2 * Math.PI, tmp); tmp[0] *= s.a; tmp[1] *= s.a; tmp[2] *= s.a; } else pos({ ...s, m0: f * 2 * Math.PI, md: 0, rd: 0, ad: 0 }, 0, tmp);
        const v3 = disp(tmp, K);
        ringPos.set([v3.x, v3.y, v3.z], (pi * M * 2 + k * 2 + e) * 3);
        ringA[pi * M * 2 + k * 2 + e] = N > 1000 ? 0.12 : 0.24;
      }
    });
    const rg = new THREE.BufferGeometry();
    rg.setAttribute("position", new THREE.BufferAttribute(ringPos, 3)); rg.setAttribute("aCol", new THREE.BufferAttribute(ringCol, 3)); rg.setAttribute("aA", new THREE.BufferAttribute(ringA, 1));
    const ringM = mat(lineVS, lineFS, { uOp: { value: 1 } });
    const rings = new THREE.LineSegments(rg, ringM); inert.add(rings); objs.push(rings);
    const satPos = new Float32Array(N * 3), satCol = new Float32Array(N * 3), satOp = new Float32Array(N).fill(1);
    const sg = new THREE.BufferGeometry();
    sg.setAttribute("position", new THREE.BufferAttribute(satPos, 3)); sg.setAttribute("aCol", new THREE.BufferAttribute(satCol, 3)); sg.setAttribute("aOp", new THREE.BufferAttribute(satOp, 1));
    const satM = mat(glowVS, glowFS, { uSize: { value: N > 1000 ? 6 : N > 60 ? 11 : 16 }, uPR: { value: pr }, uOp: { value: 1 } });
    const pts = new THREE.Points(sg, satM); inert.add(pts); objs.push(pts);
    const lp = new Float32Array(N * 6), lc = new Float32Array(N * 6), la = new Float32Array(N * 2);
    const lg = new THREE.BufferGeometry();
    lg.setAttribute("position", new THREE.BufferAttribute(lp, 3)); lg.setAttribute("aCol", new THREE.BufferAttribute(lc, 3)); lg.setAttribute("aA", new THREE.BufferAttribute(la, 1));
    const linkM = mat(lineVS, lineFS, { uOp: { value: 1 } });
    const links = new THREE.LineSegments(lg, linkM); inert.add(links); objs.push(links);
    const rg1 = new THREE.BufferGeometry().setFromPoints([new THREE.Vector3()]);
    rg1.setAttribute("aCol", new THREE.BufferAttribute(new Float32Array(3), 3)); rg1.setAttribute("aOp", new THREE.BufferAttribute(new Float32Array([1]), 1));
    const rx = new THREE.Points(rg1, mat(glowVS, glowFS, { uSize: { value: 26 }, uPR: { value: pr }, uOp: { value: 1 } })); inert.add(rx); objs.push(rx);
    let uRing = null;
    if (user) {
      const up = [];
      for (let k = 0; k <= 128; k++) { pos({ ...user, m0: (k / 128) * 2 * Math.PI, md: 0, rd: 0, ad: 0 }, 0, tmp); up.push(disp(tmp, K)); }
      uRing = new THREE.Line(new THREE.BufferGeometry().setFromPoints(up), new THREE.LineBasicMaterial({ transparent: true, opacity: 0.75, depthWrite: false }));
      inert.add(uRing); objs.push(uRing);
    }
    S = { sats, user, K, satPos, satCol, satOp, sg, rg, ringCol, lp, lc, la, lg, rx, uRing, ringM, satM, N, planeSats, M };
    camera.position.set(0, 0, 3.6 * (1 + K * (rmax - 1)) + 0.6);
    theme();
    const names = run.kind === "body-pnt" ? [["Relays", String(run.relays.planes * run.relays.per_plane), SYS[0]], ["Orbiter", `${run.user.altitude_km} km`, "--lime"]]
      : run.constellations.map((k, i) => [k.name, fx(k.satellites, 0), SYS[i % SYS.length]]).concat([["Receiver", "selected latitude", "--lime"]]);
    hud.replaceChildren(...names.map(([n, v, c]) => el("span", { style: `--c:var(${c})` }, el("i"), `${n} · ${v}`)));
    if (run.kind === "body-pnt") hud.append(el("span", { "data-earth": "", style: "--c:var(--cyan)" }, el("i"), el("span", { text: "Earth link" })));
    kick();
  }
  function theme() {
    if (!S) return;
    const L = isLight(), C = (v) => new THREE.Color(cssv(v));
    amb.intensity = L ? 0.95 : 0.45; // a light page needs the night side lifted, or the body reads as a black disc
    const cols = SYS.map(C);
    const blend = L ? THREE.NormalBlending : THREE.AdditiveBlending;
    S.sats.forEach((s, i) => { const c = cols[(s.c || 0) % cols.length]; S.satCol.set([c.r, c.g, c.b], i * 3); S.lc.set([c.r, c.g, c.b, c.r, c.g, c.b], i * 6); });
    S.planeSats.forEach((s, pi) => { const c = cols[(s.c || 0) % cols.length]; for (let k = 0; k < S.M * 2; k++) S.ringCol.set([c.r, c.g, c.b], (pi * S.M * 2 + k) * 3); });
    S.sg.attributes.aCol.needsUpdate = true; S.rg.attributes.aCol.needsUpdate = true; S.lg.attributes.aCol.needsUpdate = true;
    for (const m of [S.ringM, S.satM]) { m.blending = blend; m.needsUpdate = true; }
    S.ringM.uniforms.uOp.value = L ? 1.6 : 1;
    const lime = C("--lime"); S.rx.geometry.attributes.aCol.array.set([lime.r, lime.g, lime.b]); S.rx.geometry.attributes.aCol.needsUpdate = true;
    if (S.uRing) S.uRing.material.color = lime.clone();
    kick();
  }
  document.addEventListener("ks-theme", theme);
  matchMedia("(prefers-color-scheme: dark)").addEventListener("change", theme);
  function resize() {
    const w = canvas.clientWidth, h = canvas.clientHeight;
    if (!w || !h) return false;
    if (canvas.width !== Math.round(w * pr) || canvas.height !== Math.round(h * pr)) { renderer.setSize(w, h, false); camera.aspect = w / h; camera.updateProjectionMatrix(); }
    return true;
  }
  new ResizeObserver(() => kick()).observe(stage);
  // drag to turn the view (vertical scrolling still passes through: touch-action pan-y)
  let drag = null, yaw = 0, pitch = 0;
  stage.addEventListener("pointerdown", (e) => { drag = [e.clientX, e.clientY, yaw, pitch]; stage.setPointerCapture(e.pointerId); });
  stage.addEventListener("pointermove", (e) => { if (!drag) return; yaw = drag[2] + (e.clientX - drag[0]) * 0.008; pitch = Math.max(-1.1, Math.min(1.1, drag[3] + (e.clientY - drag[1]) * 0.006)); kick(); });
  const up = () => { drag = null; };
  stage.addEventListener("pointerup", up); stage.addEventListener("pointercancel", up);

  const o = [0, 0, 0], rxB = [0, 0, 0];
  function frame(t) {
    if (!S) return;
    const run = d, K = S.K;
    const w = run.kind === "body-pnt" ? (2 * Math.PI) / (run.rotation_period_h * 3600) : run.rotation_rate_deg_s * D2R;
    bodyG.rotation.y = w * t;
    root.rotation.set(0.32 + pitch, yaw, 0);
    let sinMask = 0;
    if (run.kind === "constellation-design") {
      // the receiver: a surface point on the selected latitude row, on the meridian that faced the viewer at t = 0
      const lat = run.profile.lat[H.sel()] * D2R, lon = -90 * D2R + w * t;
      rxB[0] = Math.cos(lat) * Math.cos(lon); rxB[1] = Math.cos(lat) * Math.sin(lon); rxB[2] = Math.sin(lat);
      sinMask = Math.sin(run.mask_deg * D2R);
    } else pos(S.user, t, rxB);
    const rxD = run.kind === "constellation-design" ? T3(rxB[0] * 1.012, rxB[1] * 1.012, rxB[2] * 1.012) : disp(rxB, K);
    S.rx.geometry.attributes.position.array.set([rxD.x, rxD.y, rxD.z]); S.rx.geometry.attributes.position.needsUpdate = true;
    for (let i = 0; i < S.N; i++) {
      pos(S.sats[i], t, o);
      const v = disp(o, K);
      S.satPos[i * 3] = v.x; S.satPos[i * 3 + 1] = v.y; S.satPos[i * 3 + 2] = v.z;
      // visibility with true radii: above the mask from a surface receiver, or a clear chord from the orbiter
      const dx = o[0] - rxB[0], dy = o[1] - rxB[1], dz = o[2] - rxB[2], dl = Math.hypot(dx, dy, dz);
      let sees;
      if (run.kind === "constellation-design") sees = (dx * rxB[0] + dy * rxB[1] + dz * rxB[2]) / dl > sinMask;
      else { const tt = Math.max(0, Math.min(1, -(rxB[0] * dx + rxB[1] * dy + rxB[2] * dz) / (dl * dl))); sees = Math.hypot(rxB[0] + tt * dx, rxB[1] + tt * dy, rxB[2] + tt * dz) > 1; }
      S.la[i * 2] = sees ? (S.N > 1000 ? 0.4 : 0.65) : 0; S.la[i * 2 + 1] = sees ? 0.1 : 0;
      S.lp.set([rxD.x, rxD.y, rxD.z, v.x, v.y, v.z], i * 6);
      S.satOp[i] = sees ? 1 : 0.5;
    }
    S.sg.attributes.position.needsUpdate = true; S.sg.attributes.aOp.needsUpdate = true; S.lg.attributes.position.needsUpdate = true; S.lg.attributes.aA.needsUpdate = true;
    const eh = $("[data-earth] span", hud);
    if (eh) eh.textContent = `Earth link · ${run.earth_vis[H.sel()] ? "above the horizon" : "occulted"}`;
    camera.lookAt(0, 0, 0);
    renderer.render(scene, camera);
  }
  let raf = 0, last = 0;
  function loop(now) {
    raf = 0;
    if (!resize()) return;
    const dt = last ? Math.min(0.1, (now - last) / 1000) : 0; last = now;
    const moving = H.onTick(dt);
    frame(H.time());
    if (moving && H.visible() && !document.hidden) raf = requestAnimationFrame(loop);
    else last = 0;
  }
  function kick() { if (!raf) raf = requestAnimationFrame(loop); }
  document.addEventListener("visibilitychange", () => { if (!document.hidden) kick(); });
  return { set, kick };
}

// ------------------------------------------------------------------ boot
failCards();
const RUN = { grades, spoof, clocks, cone, footprint };
$$("figure.mx-fig[data-mx]").forEach((fig) => {
  const fn = RUN[fig.getAttribute("data-mx")];
  if (fn) fn(fig).catch((e) => { fail(fig, `The recorded run could not be loaded here; open it in ${STUDIO} from the link below.`); console.warn("missions:", e); });
});
// phones: each sector's cards sit in a swipeable rail; say how many there are
function railHints() {
  $$(".mission .m-grid").forEach((g) => {
    const n = $$(".sc-f", g).length;
    if (!n) return;
    const p = el("p", { class: "m-swipe", "aria-hidden": "true" }, `Swipe for all ${n} scenario file${n === 1 ? "" : "s"}`, el("span", { text: " →" }));
    g.before(p);
  });
}
// the card field has no holes: where a row ends short of the grid's right edge, its last card widens
// to the edge (dense packing cannot fill a gap when only wide cards are left)
function fillRows() {
  const run = (again) => {
    const g = $(".mission:not([hidden]) .m-grid");
    if (!g) return;
    const kids = [...g.children];
    if (!again) kids.forEach((k) => { if (k.dataset.fill) { k.style.gridColumn = ""; delete k.dataset.fill; } });
    const cs = getComputedStyle(g);
    if (cs.gridAutoFlow.startsWith("column")) return;
    const cols = cs.gridTemplateColumns.split(" ").length;
    if (cols < 2) return;
    const gr = g.getBoundingClientRect(), gap = parseFloat(cs.columnGap) || 0;
    const cw = (gr.width - gap * (cols - 1)) / cols;
    const R = kids.map((k) => ({ k, r: k.getBoundingClientRect() }));
    const tops = [...new Set(R.map((o) => Math.round(o.r.top)))].sort((a, b) => a - b);
    for (const t of tops) {
      // everything occupying this row, including a taller tile that started above it
      const inRow = R.filter((o) => Math.round(o.r.top) <= t && o.r.bottom > t + 2);
      const right = Math.max(...inRow.map((o) => o.r.right));
      const missing = Math.round((gr.right - right) / (cw + gap));
      if (missing < 1) continue;
      const last = inRow.filter((o) => Math.round(o.r.top) === t).sort((a, b) => b.r.right - a.r.right)[0];
      if (!last || last.r.right < right - 2) continue;
      const span = Math.round((last.r.width + gap) / (cw + gap)) + missing;
      last.k.style.gridColumn = `span ${span}`; last.k.dataset.fill = "1";
      // positions below this row may move once a card widens: start over from the new layout
      return run(true);
    }
  };
  let raf = 0;
  const later = () => { cancelAnimationFrame(raf); raf = requestAnimationFrame(() => run(false)); };
  $$(".sectors [role=tab]").forEach((b) => { b.addEventListener("click", later); b.addEventListener("keydown", () => setTimeout(later)); });
  addEventListener("hashchange", later);
  addEventListener("resize", later);
  if (document.fonts && document.fonts.ready) document.fonts.ready.then(later);
  // a chart tile that finishes loading changes its height, and the rows under it move
  if ("ResizeObserver" in window) { const ro = new ResizeObserver(later); $$(".mission .m-grid").forEach((g) => { ro.observe(g); [...g.children].forEach((k) => ro.observe(k)); }); }
  later();
}
for (const f of [matrix, sectorTitle, nextCards, orbitConsole, sectorCharts, railHints, fillRows]) {
  try { const p = f(); if (p && p.catch) p.catch((e) => console.warn("missions:", e)); } catch (e) { console.warn("missions:", e); }
}
