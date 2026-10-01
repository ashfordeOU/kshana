// Capabilities hero (R5, 2026-09-29): the solar system from the engine's solar-system run.
// Data: assets/capabilities/capabilities.json → "solar" (src/tools/gen_capabilities.py runs the
// engine on scenarios/solar-system-tour.toml; the build never does) and "imagery" (the body atlas).
// Every body moves along the engine's own orbit track for it: one revolution from the epoch, sampled
// uniformly in time (every other of the scenario's 180 track points is kept, so 90 steps a
// revolution). Nothing is propagated here; positions between two samples are interpolated.
// Distances are compressed on a log scale (directions are true), body sizes are enlarged and the
// spin is a display rate; the page says so. Reduced motion: the complete frame at the epoch.
import { studioHref } from "./studio-links.mjs";
const ROOT = (window.KSITE && window.KSITE.root) || "";
const STUDIO = (window.KSITE && window.KSITE.studio) || "Kshana Studio";
const RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
const $ = (s) => document.querySelector(s);
const win = $("#chWin");
const DAYS_PER_S = 24;                  // display rate: 24 days of the run per second
const ORDER = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto"];
const n = (v, d = 1) => (v == null || !Number.isFinite(v) ? "–" : Number(v).toLocaleString("en-GB", { minimumFractionDigits: d, maximumFractionDigits: d }));
const el = (tag, cls, text) => { const e = document.createElement(tag); if (cls) e.className = cls; if (text != null) e.textContent = text; return e; };

if (win) fetch(ROOT + "assets/capabilities/capabilities.json").then((r) => { if (!r.ok) throw new Error(`HTTP ${r.status}`); return r.json(); })
  .then(init).catch((e) => console.warn("capabilities hero:", e));

function init(d) {
  const sol = d.solar, img = d.imagery, eng = d.engine;
  const B = Object.fromEntries(sol.bodies.map((b) => [b.name, b]));
  const bodies = ORDER.filter((k) => B[k] && B[k].track_au && B[k].track_au.length > 3).map((k) => B[k]);
  win.classList.add("ready");
  // ---- the ecliptic, from the Earth's own track (its orbit normal), so no obliquity is typed
  const tr = B.Earth.track_au; let nz = [0, 0, 0];
  for (let i = 0; i < tr.length - 1; i++) { const a = tr[i], b = tr[i + 1]; nz = [nz[0] + a[1] * b[2] - a[2] * b[1], nz[1] + a[2] * b[0] - a[0] * b[2], nz[2] + a[0] * b[1] - a[1] * b[0]]; }
  const nl = Math.hypot(...nz); nz = nz.map((x) => x / nl);
  let ex = [1 - nz[0] * nz[0], -nz[0] * nz[1], -nz[0] * nz[2]]; const exl = Math.hypot(...ex); ex = ex.map((x) => x / exl);
  const ey = [nz[1] * ex[2] - nz[2] * ex[1], nz[2] * ex[0] - nz[0] * ex[2], nz[0] * ex[1] - nz[1] * ex[0]];
  const dot = (a, b) => a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
  const ecl = (v) => [dot(v, ex), dot(v, ey), dot(v, nz)];
  // ---- each body's track: samples 0..89 are uniform in time over one revolution
  for (const b of bodies) { b._trk = b.track_au.slice(0, 90).map(ecl); b._N = b._trk.length; }
  const rc = (r) => Math.log(1 + r / 0.35);
  const Rmax = Math.max(...bodies.map((b) => Math.max(...b._trk.map((p) => rc(Math.hypot(...p))))));
  const at = (b, days) => {                       // ecliptic position (au) at `days` after the epoch
    const f = ((((days / b.period_d) % 1) + 1) % 1) * b._N, i = Math.floor(f), w = f - i;
    const p = b._trk[i], q = b._trk[(i + 1) % b._N];
    return [p[0] + (q[0] - p[0]) * w, p[1] + (q[1] - p[1]) * w, p[2] + (q[2] - p[2]) * w];
  };
  // ---- text: epoch, rate, list for screen readers, provenance and credits
  const ep = new Date(sol.epoch.input + "Z");
  const fmtDate = (dt) => dt.toISOString().slice(0, 10);
  $("#chEpoch").textContent = fmtDate(ep);
  $("#chFile").textContent = sol.file;
  $("#chRate").textContent = RM ? "The frame at the run's epoch" : `${DAYS_PER_S} days of the run per second`;
  const lab = (b) => (b.label === "VALIDATED" ? "Validated" : "Modelled");
  const lt = (s) => (s == null ? null : s >= 120 ? `${n(s / 60, 1)} min` : `${n(s, 1)} s`);
  const per = (b) => (b.period_d > 1000 ? n(b.period_d / 365.25, 1) + " years" : n(b.period_d, 1) + " days");
  const list = $("#chList");
  for (const b of bodies) list.append(el("li", null, `${b.name}: ${lab(b)}, ${n(b.dist_au, 2)} au from the Sun at the epoch, orbital period ${per(b)}${b.light_s != null ? `, light time from ${sol.observer} ${lt(b.light_s)}` : ""}.`));
  win.setAttribute("aria-label", `The solar system from the engine's solar-system run at ${fmtDate(ep)}: the Sun and ${bodies.length} bodies moving along their engine orbit tracks; ${bodies.filter((b) => b.label === "VALIDATED").length} of the orbits are validated against JPL Horizons.`);
  const pv = $("#chProv");
  const src = el("span", "prov-src");
  const code = (t) => el("code", null, t);
  src.append(`Engine v${sol.engine_version}, build `, code(eng.commit), " · ", code(sol.file), ` · ${sol.seed == null ? "deterministic, no seed" : "seed " + sol.seed} · ${sol.table}`);
  const more = el("a", "prov-open", "Explore every body"); more.href = "#journey";
  const tools = el("span", "prov-tools");
  const fileB = el("button", "prov-x", "TOML"); fileB.type = "button"; fileB.title = "The scenario file that ran";
  fileB.addEventListener("click", () => { const a = document.createElement("a"); a.href = URL.createObjectURL(new Blob([sol.toml], { type: "application/toml" })); a.download = sol.file; document.body.append(a); a.click(); setTimeout(() => { URL.revokeObjectURL(a.href); a.remove(); }, 500); });
  const cmd = el("button", "prov-x", "Copy command"); cmd.type = "button"; cmd.dataset.copy = `kshana ${sol.file}`; cmd.title = "Copy the command that reproduces it";
  // The Studio view that reproduces this run (js/studio-links.mjs, from the Studio's own link list).
  const view = studioHref(ROOT, sol.file);
  const open = view ? el("a", "prov-open", `Open in ${STUDIO}`) : null;
  if (open) open.href = view;
  tools.append(fileB, cmd); pv.append(...[src, open, more, tools].filter(Boolean));
  const cred = {};
  for (const b of [B.Sun, ...bodies]) { const c = img.bodies[b.name]; if (c) (cred[`${c.credit} (${c.licence})`] ||= []).push(b.name); }
  const det = el("details", "hx-note"); det.append(el("summary", null, "Scale and imagery credits"));
  pv.after(det);
  det.append(el("p", null, "Distances compressed on a log scale, directions true; bodies enlarged, spin at a display rate. Imagery: " + Object.entries(cred).map(([k, v]) => `${v.join(", ")}: ${k}`).join(" · ") + `; Saturn's rings: ${img.ring.credit} (${img.ring.licence}).`));

  // ---- canvas
  const stage = $("#chStage"), cv = document.createElement("canvas"); cv.setAttribute("aria-hidden", "true"); stage.prepend(cv);
  const g = cv.getContext("2d");
  const atlas = new Image(); let atlasOK = false;
  atlas.onload = () => { atlasOK = true; draw(); }; atlas.src = ROOT + "assets/capabilities/bodies.jpg";
  const ringCol = img.ring.rgba;
  let W = 0, H = 0, dpr = 1, S = 1, cx = 0, cy = 0, K = 1;
  const ELEV = 34 * Math.PI / 180, se = Math.sin(ELEV), ce = Math.cos(ELEV);
  // the drawing's extent at unit scale, from every track sample, so the fit uses the real orbits
  const unit = (p) => { const r = Math.hypot(...p), k = r > 0 ? rc(r) / r : 0; return [p[0] * k, -(p[1] * k * se + p[2] * k * ce)]; };
  const ext = bodies.flatMap((b) => b._trk.map(unit));
  const X0 = Math.min(...ext.map((e) => e[0])), X1 = Math.max(...ext.map((e) => e[0])), Y0 = Math.min(...ext.map((e) => e[1])), Y1 = Math.max(...ext.map((e) => e[1]));
  function size() {
    const r = (document.fullscreenElement === cv ? cv : stage).getBoundingClientRect(); dpr = Math.min(2, window.devicePixelRatio || 1);
    W = Math.max(1, r.width); H = Math.max(1, r.height);
    cv.width = Math.round(W * dpr); cv.height = Math.round(H * dpr);
    const padX = 44, padT = 34, padB = 80;               // room for names, the HUD and the readout
    S = Math.min((W - 2 * padX) / (X1 - X0), (H - padT - padB) / (Y1 - Y0));
    cx = W / 2 - ((X0 + X1) / 2) * S; cy = padT + (H - padT - padB) / 2 - ((Y0 + Y1) / 2) * S;
    K = Math.max(0.8, Math.min(1.3, W / 560));
  }
  const proj = (p) => { const r = Math.hypot(...p), k = r > 0 ? rc(r) / r : 0, x = p[0] * k, y = p[1] * k, z = p[2] * k; return [cx + x * S, cy - (y * se + z * ce) * S, y * ce - z * se]; };
  const discR = (b) => (3 + 3.9 * Math.log10(b.r_km / 1000 + 1)) * K;
  const spinOf = (b) => (b.rot_h ? Math.sign(b.rot_h) / (8 * Math.max(0.5, Math.min(30, Math.abs(b.rot_h) / 24))) : 0); // turns per second, display rate
  function tile(nm, x, y, r, phase) {
    const c = img.bodies[nm]; if (!c || !atlasOK) return false;
    const [tw, th] = img.tile, sx0 = (c.i % img.cols) * tw, sy0 = Math.floor(c.i / img.cols) * th;
    const u = (((phase % 1) + 1) % 1) * tw, half = tw / 2;
    g.save(); g.beginPath(); g.arc(x, y, r, 0, 2 * Math.PI); g.clip();
    const w1 = Math.min(half, tw - u);
    g.drawImage(atlas, sx0 + u, sy0, w1, th, x - r, y - r, 2 * r * (w1 / half), 2 * r);
    if (w1 < half) g.drawImage(atlas, sx0, sy0, half - w1, th, x - r + 2 * r * (w1 / half), y - r, 2 * r * ((half - w1) / half), 2 * r);
    g.restore(); return true;
  }
  function shade(x, y, r) {                       // lit toward the Sun
    const dx = cx - x, dy = cy - y, l = Math.hypot(dx, dy) || 1, ux = dx / l, uy = dy / l;
    const gr = g.createRadialGradient(x + ux * r * 0.55, y + uy * r * 0.55, r * 0.15, x, y, r * 1.08);
    gr.addColorStop(0, "rgba(0,0,0,0)"); gr.addColorStop(0.55, "rgba(0,0,0,.18)"); gr.addColorStop(1, "rgba(0,0,0,.8)");
    g.fillStyle = gr; g.beginPath(); g.arc(x, y, r, 0, 2 * Math.PI); g.fill();
  }
  function rings(x, y, r, front) {
    const rx0 = r * 1.3, rx1 = r * 2.3, k = 0.32, steps = 14;
    for (let i = 0; i < steps; i++) {
      const f = i / (steps - 1), c = ringCol[Math.min(ringCol.length - 1, Math.floor(f * ringCol.length))], rr = rx0 + (rx1 - rx0) * f;
      g.strokeStyle = `rgba(${c[0]},${c[1]},${c[2]},${((c[3] ?? 255) / 255) * 0.9})`; g.lineWidth = (rx1 - rx0) / steps + 0.4;
      g.beginPath(); g.ellipse(x, y, rr, rr * k, -0.35, front ? 0 : Math.PI, front ? Math.PI : 2 * Math.PI); g.stroke();
    }
  }
  let days = 0, hi = 3, hiT = 0, playing = !RM, visible = true, last = 0, spinT = 0, shown = null;
  const read = $("#chRead");
  function readout(b, p) {
    const key = b.name + Math.round(Math.hypot(...p) * 100);
    if (key === shown) return; shown = key;
    read.replaceChildren();
    const bits = [`${n(Math.hypot(...p), 2)} au from the Sun`, `orbit ${per(b)}`];
    if (b.light_s != null) bits.push(`light time from ${sol.observer} at the epoch ${lt(b.light_s)}`);
    read.append(el("b", null, b.name), el("span", `ch-lab ${b.label === "VALIDATED" ? "v" : "m"}`, lab(b)), el("span", null, bits.join(" · ")));
  }
  function draw() {
    if (!W) return;
    g.setTransform(dpr, 0, 0, dpr, 0, 0); g.clearRect(0, 0, W, H);
    // orbits: solid when the body is validated against JPL Horizons, dashed when modelled
    for (const b of bodies) {
      g.beginPath(); b._trk.forEach((p, i) => { const q = proj(p); if (i) g.lineTo(q[0], q[1]); else g.moveTo(q[0], q[1]); }); g.closePath();
      const v = b.label === "VALIDATED", on = b === bodies[hi];
      g.setLineDash(v ? [] : [4, 4]); g.lineWidth = on ? 1.6 : 1;
      g.strokeStyle = on ? "rgba(61,220,247,.95)" : v ? "rgba(126,160,236,.74)" : "rgba(170,178,204,.64)"; g.stroke();
    }
    g.setLineDash([]);
    // the Sun, with a glow
    const sr = 12 * K;
    const glow = g.createRadialGradient(cx, cy, sr * 0.6, cx, cy, sr * 4); glow.addColorStop(0, "rgba(255,196,96,.5)"); glow.addColorStop(1, "rgba(255,160,60,0)");
    g.fillStyle = glow; g.beginPath(); g.arc(cx, cy, sr * 4, 0, 2 * Math.PI); g.fill();
    if (!tile("Sun", cx, cy, sr, spinT * 0.02)) { g.fillStyle = "#FFC060"; g.beginPath(); g.arc(cx, cy, sr, 0, 2 * Math.PI); g.fill(); }
    // bodies, far to near
    const pts = bodies.map((b) => { const p = at(b, days); return { b, p, q: proj(p) }; }).sort((a, c) => c.q[2] - a.q[2]);
    g.font = "500 11px 'Geist Mono', ui-monospace, monospace"; g.textBaseline = "middle";
    const placed = [], names = [];
    for (const { b, p, q } of pts) {
      const r = discR(b), [x, y] = q, on = b === bodies[hi];
      if (b.name === "Saturn") rings(x, y, r, false);
      if (!tile(b.name, x, y, r, spinT * spinOf(b))) { g.fillStyle = "#8a93ad"; g.beginPath(); g.arc(x, y, r, 0, 2 * Math.PI); g.fill(); }
      shade(x, y, r);
      if (b.name === "Saturn") rings(x, y, r, true);
      if (on) { g.strokeStyle = "rgba(61,220,247,.95)"; g.lineWidth = 1.4; g.beginPath(); g.arc(x, y, r + 5, 0, 2 * Math.PI); g.stroke(); }
      // the name sits on the side away from the Sun
      const dx = x - cx, dy = y - cy, l = Math.hypot(dx, dy) || 1, right = dx >= 0;
      names.push({ b, on, right, x, lx: x + (dx / l) * (r + 7) + (right ? 2 : -2), ly: y + (dy / l) * (r + 7) });
      if (on) readout(b, p);
    }
    // names last, the highlighted one first; a name that would touch one already placed is left out
    names.sort((a, c) => c.on - a.on);
    for (const nm of names) {
      const w = g.measureText(nm.b.name).width, y = Math.max(10, Math.min(H - 10, nm.ly));
      if (nm.right && nm.lx + w > W - 4) { nm.right = false; nm.lx -= 2 * (nm.lx - nm.x) ; }   // no room on the right: the other side
      if (!nm.right && nm.lx - w < 4) { nm.right = true; nm.lx += 2 * (nm.x - nm.lx); }
      const x = Math.max(4, Math.min(W - 4, nm.lx));
      const box = [nm.right ? x : x - w, y - 7, w, 14];
      if (placed.some((o) => box[0] < o[0] + o[2] + 3 && o[0] < box[0] + box[2] + 3 && box[1] < o[1] + o[3] && o[1] < box[1] + box[3])) continue;
      placed.push(box);
      g.textAlign = nm.right ? "left" : "right"; g.fillStyle = nm.on ? "#EEF0FA" : "#A3AAC2";
      g.fillText(nm.b.name, x, y);
    }
    const dt = new Date(ep.getTime() + days * 86400000);
    $("#chClock").textContent = `+${Math.round(days).toLocaleString("en-GB")} days · ${fmtDate(dt)}`;
  }
  // one Jupiter year of the run, then back to the epoch
  const LOOP = B.Jupiter ? B.Jupiter.period_d : 4332;
  function frame(ts) {
    requestAnimationFrame(frame);
    const dt = Math.min(0.1, (ts - (last || ts)) / 1000); last = ts;
    if (!visible || !playing) return;
    days = (days + dt * DAYS_PER_S) % LOOP; spinT += dt;
    hiT += dt; if (hiT > 2.6) { hiT = 0; hi = (hi + 1) % bodies.length; }
    draw();
  }
  size(); draw();
  new ResizeObserver(() => { size(); draw(); }).observe(stage);
  document.addEventListener("fullscreenchange", () => requestAnimationFrame(() => { size(); draw(); }));
  if ("IntersectionObserver" in window) new IntersectionObserver((es) => { visible = es[es.length - 1].isIntersecting && !document.hidden; }).observe(stage);
  document.addEventListener("visibilitychange", () => { visible = !document.hidden; });
  const btn = $("#chPlay");
  const setBtn = () => { btn.setAttribute("aria-pressed", String(playing)); btn.setAttribute("aria-label", playing ? "Pause the orbits" : "Play the orbits"); };
  btn.addEventListener("click", () => { playing = !playing; setBtn(); if (playing) $("#chRate").textContent = `${DAYS_PER_S} days of the run per second`; draw(); });
  setBtn();
  requestAnimationFrame(frame);
}

// ================================================================== the tabbed consoles
{
// Capabilities console (R5, 2026-09-29): the long page folded into three tabbed blocks
// ([data-cc]: the capability console, Make it yours + the Studio, the reference). Every anchor other
// pages link to (#fails, #bands, #clocks, #timing, #runs, #journey, #atlas, #explorer ...) still
// exists inside its panel: opening one, by URL or by an in-page link, selects that panel's tab first
// and then scrolls to it. Tabs follow the ARIA tabs pattern (arrow keys, Home, End).
const $$ = (s, r = document) => [...r.querySelectorAll(s)];
const sets = $$("[data-cc] [role='tablist']").map((list) => {
  const tabs = $$("[role='tab']", list);
  const panel = (t) => document.getElementById(t.getAttribute("aria-controls"));
  function select(t, focus) {
    for (const x of tabs) {
      const on = x === t;
      x.setAttribute("aria-selected", String(on)); x.tabIndex = on ? 0 : -1;
      const p = panel(x); if (p) p.hidden = !on;
    }
    if (focus) t.focus();
    // canvases, globes and pinned tracks in the new panel measure themselves on resize
    requestAnimationFrame(() => window.dispatchEvent(new Event("resize")));
  }
  list.addEventListener("click", (e) => { const t = e.target.closest("[role='tab']"); if (t) select(t, false); });
  list.addEventListener("keydown", (e) => {
    const i = tabs.indexOf(document.activeElement); if (i < 0) return;
    const j = { ArrowRight: i + 1, ArrowLeft: i - 1, Home: 0, End: tabs.length - 1 }[e.key];
    if (j == null) return;
    e.preventDefault(); select(tabs[(j + tabs.length) % tabs.length], true);
  });
  return { tabs, panel, select };
});

// Open the panel that holds an anchor, then bring the anchor into view.
function reveal(id) {
  const target = id && document.getElementById(id); if (!target) return false;
  const p = target.closest(".cc-panel"); if (!p) return false;
  for (const s of sets) {
    const t = s.tabs.find((x) => s.panel(x) === p);
    if (t) { if (t.getAttribute("aria-selected") !== "true") s.select(t, false); break; }
  }
  // site.js KSkeep lands the anchor under the header and holds it there while the newly shown
  // panel's charts and canvases draw (a smooth scroll here chased a target that kept moving).
  if (window.KSkeep) window.KSkeep(target); else target.scrollIntoView({ block: "start" });
  return true;
}
const fromHash = () => { try { reveal(decodeURIComponent(location.hash.slice(1))); } catch (e) { /* malformed hash */ } };
fromHash();
addEventListener("hashchange", fromHash);
// A link to the hash already in the address bar fires no hashchange: handle the click too.
document.addEventListener("click", (e) => {
  const a = e.target.closest("a[href^='#']"); if (!a) return;
  const id = a.getAttribute("href").slice(1);
  if (id && "#" + id === location.hash && reveal(id)) e.preventDefault();
});
}
