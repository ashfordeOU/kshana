// Home on the Observatory system. Every moving part replays a real engine run:
//  - D.camp: the chained campaign (campaign-jam-spoof-holdover-integrity.toml, seed in D.camp.seed)
//    on its 10 s mission grid: the console bar, the three telemetry cards, the event log, the
//    mission timeline and the scroll story;
//  - D.orb: the constellation run's satellites (constellation-multi-gnss-coverage.toml) as
//    circular orbits recovered from the engine's ground tracks, on the three globes;
//  - D.mcp: a real recorded kshana-mcp session (tools/record_mcp_session.py), as a stepped player.
// Both runs are recorded from the site's one engine checkout (src/tools/record_runs.py).
import { fmt } from "../studio/lib/views.mjs";
import { mountPlayer } from "./mcp-player.mjs";

const D = JSON.parse(document.getElementById("kpage").textContent);
const RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
const SVGNS = "http://www.w3.org/2000/svg";
const $ = (s, r = document) => r.querySelector(s);
const $$ = (s, r = document) => Array.from(r.querySelectorAll(s));
const clamp = (x, a = 0, b = 1) => Math.max(a, Math.min(b, x));
const ss = (a, b, x) => { const t = clamp((x - a) / (b - a)); return t * t * (3 - 2 * t); };
const el = (tag, cls, text) => { const e = document.createElement(tag); if (cls) e.className = cls; if (text != null) e.textContent = text; return e; };
const hms = (s) => { s = Math.max(0, Math.round(s)); return `T+${String(Math.floor(s / 3600)).padStart(2, "0")}:${String(Math.floor((s % 3600) / 60)).padStart(2, "0")}:${String(s % 60).padStart(2, "0")}`; };

// ---------------------------------------------------------------- failure tiles: chart height from the box width
// WebKit keeps a grid row's height when a viewBox SVG inside it grows with the window (height:auto from
// the aspect ratio): the tile then clips its own chart until the next full layout. Deriving the height
// from container units makes the row re-measure on every resize; without container units it stays auto.
for (const s of $$("#fails .vis svg[viewBox]")) {
  const v = s.viewBox.baseVal, box = s.parentElement;
  if (!v || !v.width || !box || Math.abs(s.getBoundingClientRect().width - box.clientWidth) > 2) continue;
  box.style.containerType = "inline-size";
  s.style.height = `calc(100cqw * ${(v.height / v.width).toFixed(5)})`;
}

// ---------------------------------------------------------------- the campaign, sampled
const C = D.camp, CH = C.ch, TT = C.t, DUR = C.duration_s, STEP = C.step_s;
const PN = D.phaseNames, PC = D.phaseColors, F = D.facts || {};
const idxAt = (t) => clamp(Math.floor(t / STEP), 0, TT.length - 1); // zero-order hold, as the engine aligns it
const phaseAt = (t) => { const i = C.phases.findIndex((p) => t >= p.t0 && t < p.t1); return i < 0 ? C.phases.length - 1 : i; };
const jamOf = (p) => { const r = p.runs.find((x) => x.kind === "jamming"); return r ? r.jammer_dbw : null; };
const maskOf = (p) => { const r = p.runs.find((x) => x.kind === "jamming"); return r ? r.mask_deg : null; };
const maxTrk = Math.max(...CH.tracking.filter((v) => v != null));
function state(t) {
  const i = idxAt(t), pi = phaseAt(t), p = C.phases[pi], j = jamOf(p);
  return {
    t, i, pi, p, name: p.name,
    te: CH.time_error_ns[i], guard: CH.guard_ns[i], cn: CH.cn0_dbhz[i], floor: CH.cn0_floor_dbhz[i],
    pl: CH.protection_level_m[i], al: CH.alert_limit_m[i] ?? CH.alert_limit_m.find((v) => v != null),
    trk: CH.tracking[i], alarm: CH.alarm[i], pos: CH.position_error_m[i],
    // globe drivers: jammer power (off / -30 dBW / 10 dBW) to 0..1, spoofing phase, loss of all satellites
    jam: j == null ? 0 : clamp((j + 50) / 60), spoof: p.name === "spoofing" ? 1 : 0, hold: CH.tracking[i] === 0 ? 1 : 0,
    mask: maskOf(p),
  };
}
const TEmax = Math.max(...CH.time_error_ns.filter((v) => v != null), CH.guard_ns[0]) * 1.18;
const PLmax = Math.max(...CH.protection_level_m.filter((v) => v != null), CH.alert_limit_m.find((v) => v != null)) * 1.1;
const CNmin = Math.floor(Math.min(...CH.cn0_dbhz) / 5) * 5 - 3, CNmax = Math.ceil(Math.max(...CH.cn0_dbhz) / 5) * 5 + 4;
const CFG = {
  te: { key: "time_error_ns", thrKey: "guard_ns", min: 0, max: TEmax, thrLabel: "guard", above: true, unit: "ns", d: 1 },
  cn: { key: "cn0_dbhz", thrKey: "cn0_floor_dbhz", min: CNmin, max: CNmax, thrLabel: "floor", below: true, unit: "dB-Hz", d: 1 },
  pl: { key: "protection_level_m", thrKey: "alert_limit_m", min: 0, max: PLmax, thrLabel: "AL", above: true, unit: "m", d: 1 },
};
const thrOf = (cfg) => CH[cfg.thrKey].find((v) => v != null);

// ---------------------------------------------------------------- SVG telemetry chart (real samples, stepped)
function drawChart(svg, cfg, t0, t1, tNow, opt = {}) {
  // drawn in CSS pixels, so the threshold label is never stretched
  const W = Math.max(60, Math.round(svg.clientWidth || 300)), H = Math.max(30, Math.round(svg.clientHeight || 74)), pad = 4;
  svg.setAttribute("viewBox", `0 0 ${W} ${H}`);
  const X = (t) => ((t - t0) / (t1 - t0)) * W;
  const Y = (v) => pad + (1 - clamp((v - cfg.min) / (cfg.max - cfg.min))) * (H - pad * 2);
  const thr = thrOf(cfg), ty = Y(thr);
  const vals = CH[cfg.key];
  // real samples in [a, b] as zero-order-hold steps, split where the run has no value
  const segs = (a, b) => {
    const out = []; let cur = null;
    const i0 = Math.max(0, Math.floor(a / STEP)), i1 = Math.min(vals.length - 1, Math.floor(b / STEP));
    for (let i = i0; i <= i1; i++) {
      const v = vals[i];
      if (v == null) { cur = null; continue; }
      const xs = X(Math.max(a, TT[i])), xe = X(Math.min(b, TT[i] + STEP)), y = Y(v);
      if (!cur) { cur = []; out.push(cur); }
      cur.push([xs, y], [xe, y]);
    }
    return out;
  };
  const dOf = (ss) => ss.map((s) => "M" + s.map((q) => `${q[0].toFixed(1)} ${q[1].toFixed(1)}`).join("L")).join("");
  const parts = [];
  for (const k of [1, 2, 3]) parts.push(`<line class="cp-grid" x1="0" x2="${W}" y1="${(H * k / 4).toFixed(1)}" y2="${(H * k / 4).toFixed(1)}"/>`);
  parts.push(`<line class="cp-thr" x1="0" x2="${W}" y1="${ty.toFixed(1)}" y2="${ty.toFixed(1)}"/>`);
  if (opt.ghost) parts.push(`<path class="cp-ghost" d="${dOf(segs(t0, t1))}"/>`);
  const s = segs(t0, tNow);
  if (s.length) {
    const d = dOf(s);
    const area = s.map((g) => `M${g[0][0].toFixed(1)} ${H}` + g.map((q) => `L${q[0].toFixed(1)} ${q[1].toFixed(1)}`).join("") + `L${g.at(-1)[0].toFixed(1)} ${H}Z`).join("");
    parts.push(`<path class="cp-area" d="${area}"/><path class="cp-line" d="${d}"/>`);
    parts.push(`<clipPath id="cl-${svg.dataset.cid}"><rect x="0" y="${cfg.above ? 0 : ty.toFixed(1)}" width="${W}" height="${(cfg.above ? ty : H - ty).toFixed(1)}"/></clipPath><path class="cp-over" clip-path="url(#cl-${svg.dataset.cid})" d="${d}"/>`);
  }
  if (opt.cursor) { const cx = X(tNow).toFixed(1); parts.push(`<line class="cp-cursor" x1="${cx}" x2="${cx}" y1="0" y2="${H}"/>`); }
  const v = vals[idxAt(tNow)];
  if (v != null) { const hx = Math.min(X(tNow), W - 3).toFixed(1), hy = Y(v).toFixed(1); parts.push(`<circle class="cp-halo" cx="${hx}" cy="${hy}" r="6"/><circle class="cp-dot" cx="${hx}" cy="${hy}" r="2.6"/>`); }
  parts.push(`<text class="cp-thr-t" x="${W - 2}" y="${(ty - 4).toFixed(1)}" text-anchor="end">${cfg.thrLabel} ${fmt(thr)}</text>`);
  svg.innerHTML = parts.join("");
}
let cid = 0;
$$(".cp-svg").forEach((s) => { s.dataset.cid = String(++cid); });

// value, colour and the one-line state under each card
function setPanel(panel, k, s) {
  const cfg = CFG[k], v = s[k === "te" ? "te" : k === "cn" ? "cn" : "pl"], thr = thrOf(cfg);
  const val = $("[data-v]", panel), st = $("[data-state]", panel);
  let breach = false, txt = "", bad = false;
  if (v == null) {
    val.innerHTML = `<span class="na">no PL</span>`;
  } else {
    breach = cfg.above ? v > thr : v < thr;
    val.innerHTML = `${v.toFixed(cfg.d).replace("-", "\u2212")}<small>${cfg.unit}</small>`;
  }
  if (k === "te") { txt = s.name === "holdover" || s.name === "integrity-alarm" ? (breach ? "holdover · outside the guard" : "holdover · free-running") : s.name === "spoofing" ? "spoofer pulling the clock" : "disciplined to GNSS"; bad = breach; }
  if (k === "cn") { txt = s.trk === 0 ? `0 of ${maxTrk} tracking · no lock` : `${s.trk} of ${maxTrk} tracking`; bad = s.trk === 0; }
  if (k === "pl") { txt = v == null ? (s.trk === 0 ? "no satellites, no PL" : s.name === "spoofing" ? "not computed in this phase" : "too few satellites") : breach ? "alarm · PL above AL" : `under the ${fmt(thr)} m AL`; bad = v == null ? s.name === "integrity-alarm" || s.trk === 0 : breach; }
  panel.classList.toggle("breach", breach);
  if (st) { st.textContent = txt; st.classList.toggle("bad", bad); }
}

// ---------------------------------------------------------------- globes (loaded lazily; the still Earth stays if WebGL fails)
const globes = [];
const orbT0 = performance.now();
function mountGlobes(getHero, getTl, getStory) {
  import("./obsglobe.mjs").then(({ Globe, webglOK }) => {
    if (!webglOK()) return;
    // under reduced motion nothing loops, so a globe asks for one more still frame when its
    // Earth textures arrive (otherwise the first frame, drawn before they load, stays black)
    let kickQ = 0;
    const onKick = () => { if (RM && !kickQ) kickQ = requestAnimationFrame(() => { kickQ = 0; for (const [g, get] of globes) { const s = get(); if (s.zoom) g.zoom = s.zoom; g.update(20, 1, s); } }); };
    const base = { orb: D.orb, rx: C.receiver, reduce: RM, onKick };
    const hs = $("#heroStage");
    if (hs) {
      const labels = {}; $$(".glabel", hs).forEach((l) => { labels[l.dataset.k] = l; });
      const g = new Globe($("#glHero"), { ...base, parallax: !RM, labels, labelMaxX: () => { const p = $(".hero-panels"); if (!p || innerWidth <= 900) return innerWidth - 8; return p.getBoundingClientRect().left - hs.getBoundingClientRect().left - 8; }, speed: 720, center: (w) => (w > 1180 ? 0.62 : w > 900 ? 0.66 : 0.5), fit: (w, h) => (w > 900 ? Math.min(0.86, Math.max(0.64, h / 1180)) * (w > 1180 ? 1 : 0.86) : 0.74), onReady: () => hs.classList.add("gl-ready") }); // 901-1180: a little right and smaller, so the copy column stays clear of it (home.css --g-left)
      globes.push([g, getHero, hs]);
    }
    const ws = $(".win-stage");
    if (ws) { const g = new Globe($("#glTl"), { ...base, speed: 720, fit: (w, h) => Math.max(0.6, Math.min(1.35, Math.min(w, h * 1.25) / 540)), onReady: () => ws.classList.add("gl-ready") }); globes.push([g, getTl, ws]); }
    const st = $("#stage");
    if (st) {
      const g = new Globe($("#glStory"), { ...base, colorBy: "system", sysColors: SYS, speed: 540, parallax: !RM, center: (w) => (w > 1180 ? 0.64 : w > 900 ? 0.72 : 0.5), fit: (w, h) => (w > 900 ? Math.min(1.05, Math.max(0.75, h / 900)) * (w > 1180 ? 1 : 0.8) : 0.8), onReady: () => st.classList.add("gl-ready") }); // 901-1180: right and smaller, so the beats stay clear of it (home.css)
      globes.push([g, getStory, st]);
    }
    let last = performance.now();
    const frame = (now) => {
      if (now - last < 30) { requestAnimationFrame(frame); return; } // about 30 frames a second is plenty for orbits
      const dt = Math.min(0.05, (now - last) / 1000); last = now;
      const T = (now - orbT0) / 1000;
      for (const [g, get] of globes) if (g.visible) { const s = get(); if (s.zoom) g.zoom += (s.zoom - g.zoom) * (RM ? 1 : 0.06); g.update(RM ? 20 : T, RM ? 1 : dt, s); }
      if (!RM) requestAnimationFrame(frame);
    };
    if (RM) { const still = () => { for (const [g, get] of globes) { const s = get(); if (s.zoom) g.zoom = s.zoom; g.update(20, 1, s); } }; still(); addEventListener("resize", () => setTimeout(still, 80)); addEventListener("scroll", () => requestAnimationFrame(still), { passive: true }); document.addEventListener("ks-theme", () => setTimeout(still, 30)); }
    else requestAnimationFrame(frame);
  }).catch((e) => console.warn("globe:", e));
}
// GPS, Galileo, BeiDou, GLONASS (the run's order). Blue rather than lime for Galileo: lime and amber
// fall together under deuteranopia (ΔE2000 6.0 light, 3.9 dark); this set stays ≥ 8.4 in both themes.
const SYS = ["--cyan", "--tim", "--amber", "--magenta"];

// ---------------------------------------------------------------- hero: console, cards, event log (one replay clock)
// Replay pacing: each phase gets its own share of screen time, so the 30-minute holdover does not
// fill most of the loop. The mission clock always shows the run's real time; only the replay rate changes.
const PHASE_S = { nominal: 6, jamming: 7, spoofing: 7, holdover: 10, "integrity-alarm": 8, recovery: 5 };
const LOOP = C.phases.reduce((a, p) => a + (PHASE_S[p.name] || 6), 0);
const WIN = 1200; // card axis: at least 20 minutes of mission time
const missionAt = (u) => { // u: replay seconds in [0, LOOP) -> mission seconds
  let acc = 0;
  for (const p of C.phases) { const d = PHASE_S[p.name] || 6; if (u < acc + d) return p.t0 + ((u - acc) / d) * (p.t1 - p.t0); acc += d; }
  return DUR - 0.001;
};
const hero = $(".hero");
let heroS = state(0);
if (hero) {
  const panels = $$(".hero-panels .chart-panel");
  const hClock = $("#hClock"), hPhase = $("#hPhase"), hLog = $("#hLog"), rxLabel = $("#rxLabel");
  const LV = { ok: "OK", info: "INFO", warn: "WARN", spoof: "SPOOF", crit: "CRIT" };
  const pushLog = (lv, time, msg) => {
    const old = hLog.querySelector(".caret-line"); if (old) old.remove();
    const d = el("div", `log-line${lv === "crit" ? " crit" : ""}`);
    d.append(el("span", "t", time), el("span", `lv lv-${lv}`, LV[lv]), el("span", "m", msg));
    hLog.appendChild(d);
    const c = el("div", "log-line caret-line"); c.append(el("span", "t", " "), el("span", "log-caret")); hLog.appendChild(c);
    while (hLog.children.length > 8) hLog.removeChild(hLog.firstChild);
    fitLog();
  };
  // Keep only the lines that fit: wrapped events are taller, and a line pushed past the top edge
  // would be cut off rather than scrolled away.
  const fitLog = () => {
    const cs = getComputedStyle(hLog), room = hLog.clientHeight - parseFloat(cs.paddingTop) - parseFloat(cs.paddingBottom);
    let tot = 0;
    for (const k of hLog.children) tot += k.offsetHeight;
    while (tot > room + 1 && hLog.children.length > 2) { tot -= hLog.firstChild.offsetHeight; hLog.removeChild(hLog.firstChild); }
  };
  addEventListener("resize", fitLog);
  let evI = 0, lastT = -1, vis = true;
  new IntersectionObserver((es) => { vis = es[es.length - 1].isIntersecting; }).observe(hero);
  const setPhase = (s) => {
    if (hPhase.dataset.i === String(s.pi)) return;
    hPhase.dataset.i = String(s.pi); hPhase.textContent = PN[s.name]; hPhase.style.setProperty("--c", `var(${PC[s.name]})`);
  };
  const paint = (t, full) => {
    const s = (heroS = state(t));
    // mission so far: the first 20 minutes fill in from the left, then the axis compresses, so a
    // phase with no value (spoofing, holdover) still shows the run's earlier trace for context
    panels.forEach((p) => drawChart($("[data-plot]", p), CFG[p.dataset.k], 0, full ? DUR : Math.max(t, WIN), t));
    panels.forEach((p) => setPanel(p, p.dataset.k, s));
    hClock.textContent = hms(t);
    if (rxLabel) rxLabel.textContent = `Receiver · ${s.trk} tracking`;
    setPhase(s);
  };
  if (RM) {
    const t = C.events.find((e) => /INTEGRITY ALARM/.test(e[3]))?.[0] ?? DUR * 0.75;
    C.events.filter((e) => e[0] <= t).slice(-7).forEach((e) => pushLog(e[2], e[1], e[3]));
    panels.forEach((p) => { const f = $(".cp-foot span", p); if (f) f.textContent = "T+0"; const n = $(".cp-foot span:last-child", p); if (n) n.textContent = `T+${Math.round(DUR / 60)} min`; });
    paint(t, true);
  } else {
    const t0 = performance.now();
    const loop = (now) => {
      const t = missionAt(((now - t0) / 1000) % LOOP);
      if (t < lastT) { evI = 0; pushLog("info", hms(0), `Replay restarted · ${C.file}`); }
      while (evI < C.events.length && C.events[evI][0] <= t) { const e = C.events[evI++]; pushLog(e[2], e[1], e[3]); }
      lastT = t;
      if (vis) paint(t, false); else heroS = state(t);
      requestAnimationFrame(loop);
    };
    requestAnimationFrame(loop);
  }
  document.addEventListener("ks-theme", () => { $("#hPhase").dataset.i = ""; });
}

// ---------------------------------------------------------------- mission timeline (scroll-pinned, scrubbable)
const tlSec = $("#timeline");
let tlS = state(0);
if (tlSec) {
  const pin = $("#tlPin");
  const noPin = () => RM || innerWidth <= 900 || innerHeight < 640;
  const panels = $$(".win-right .chart-panel");
  const title = $("#tlTitle"), cap = $("#tlCap"), pn = $("#tlPn"), clockEl = $("#tlClock"), alarm = $("#tlAlarm");
  const scrub = $("#scrub"), fill = $("#scrubFill"), handle = $("#scrubHandle"), labels = $$("#scrubLabels span"), side = $$("#tlSide .scn");
  const cap_ = (s) => {
    const n = s.name, p = s.p;
    if (n === "nominal") return `${s.trk} satellites tracked at a mean C/N0 of ${fmt(s.cn)} dB-Hz. The clock is disciplined to GNSS time and the protection level (${fmt(s.pl)} m) sits under the ${fmt(s.al)} m alert limit.`;
    if (n === "jamming") return `A broadband jammer ${F.S_JAMKM} km away at ${F.S_JAM1} dBW. C/N0 falls to ${fmt(s.cn)} dB-Hz, ${fmt(s.cn - s.floor)} dB above the ${fmt(s.floor)} dB-Hz tracking floor; all ${s.trk} satellites still track.`;
    if (n === "spoofing") return `A spoofer pushes the receiver clock at ${F.S_RATE} ns/s. The RF (radio-frequency) detector alarms at once; the clock-aided monitor fires after ${F.S_DET_S} s, ending the phase with ${F.S_OFF} ns pulled in.`;
    if (n === "holdover") return `The jammer goes to ${F.S_JAM2} dBW: ${s.trk} satellites tracking. The clock free-runs from the ${F.S_CARRY} ns the spoofer left and crosses its ${F.S_GUARD} ns guard at ${F.S_GUARD_T}; the INS coasts.`;
    if (n === "integrity-alarm") return `Satellites return, but only above a ${fmt(maskOf(p))}° mask: ${s.trk} tracking. The protection level exceeds the ${fmt(s.al)} m alert limit or cannot be formed, so the monitor alarms and the clock stays in holdover.`;
    return `GNSS re-synchronised: ${s.trk} satellites tracking, time error back to ${fmt(s.te)} ns, protection level ${fmt(s.pl)} m.`;
  };
  const banner = (s) => {
    if (s.name === "jamming") return ["Jamming · C/N0 near the floor", "--amber"];
    if (s.name === "spoofing") return ["Spoofing alarm · RF detector", "--magenta"];
    if (s.name === "holdover") return [s.te > s.guard ? "Holdover · clock outside the guard" : "GNSS lost · holdover", "--cyan"];
    if (s.name === "integrity-alarm") return [s.pl == null ? "Integrity alarm · no protection level" : s.pl > s.al ? "Integrity alarm · PL > AL" : "Integrity alarm · holdover continues", "--coral"];
    return null;
  };
  let curPi = -1, P = 0;
  const render = (p) => {
    P = p = clamp(p);
    const t = Math.min(DUR - 0.001, p * DUR), s = (tlS = state(t));
    panels.forEach((pl) => { drawChart($("[data-plot]", pl), CFG[pl.dataset.k], 0, DUR, t, { ghost: true, cursor: true }); setPanel(pl, pl.dataset.k, s); });
    clockEl.textContent = hms(t);
    fill.style.width = `${p * 100}%`; fill.style.backgroundSize = `${p > 0.001 ? 100 / p : 100}% 100%`;
    handle.style.left = `${p * 100}%`;
    scrub.setAttribute("aria-valuenow", String(Math.round(p * 100)));
    scrub.setAttribute("aria-valuetext", `${hms(t)} ${PN[s.name]}`);
    if (s.pi !== curPi) {
      curPi = s.pi;
      title.textContent = PN[s.name]; title.style.color = s.name === "integrity-alarm" ? "var(--coral)" : "";
      pn.textContent = `${s.pi + 1}/${C.phases.length}`;
      labels.forEach((l, i) => l.classList.toggle("on", i <= s.pi));
      side.forEach((li, i) => li.classList.toggle("on", i === s.pi));
    }
    cap.textContent = cap_(s);
    const b = banner(s);
    alarm.classList.toggle("on", !!b);
    if (b) { alarm.textContent = b[0]; alarm.style.setProperty("--c", `var(${b[1]})`); }
  };
  // Phase names above the scrubber, or their numbers when any name would not fit its phase
  // (narrow windows, enlarged text); the heading above always names the phase.
  const scrubBox = $("#scrubLabels");
  const fitLabels = () => {
    scrub.classList.remove("num");
    if (labels.some((l) => l.scrollWidth > l.clientWidth + 1)) scrub.classList.add("num");
  };
  fitLabels();
  if (window.ResizeObserver) new ResizeObserver(fitLabels).observe(scrubBox);
  if (document.fonts && document.fonts.ready) document.fonts.ready.then(fitLabels);
  const pinned = () => !tlSec.classList.contains("no-pin");
  // Pinned only while the pinned frame fits the window (enlarged text or spacing can outgrow it).
  const layout = () => {
    tlSec.classList.toggle("no-pin", noPin());
    if (!noPin() && pin.scrollHeight > pin.clientHeight + 2) tlSec.classList.add("no-pin");
  };
  layout();
  if (window.ResizeObserver) { let q = 0; new ResizeObserver(() => { if (!q) q = requestAnimationFrame(() => { q = 0; layout(); fromScroll(); }); }).observe(pin.querySelector(".tl-head")); }
  const fromScroll = () => {
    if (!pinned()) return;
    const r = tlSec.getBoundingClientRect(), span = r.height - innerHeight;
    render(span > 0 ? clamp(-r.top / span) : 0);
  };
  const goP = (p) => {
    p = clamp(p);
    if (pinned()) { const top = tlSec.getBoundingClientRect().top + scrollY; scrollTo({ top: top + p * (tlSec.offsetHeight - innerHeight), behavior: "auto" }); render(p); }
    else render(p);
  };
  let raf = 0, playing = 0;
  addEventListener("scroll", () => { if (!raf) raf = requestAnimationFrame(() => { raf = 0; fromScroll(); }); }, { passive: true });
  addEventListener("resize", () => { layout(); fromScroll(); render(P); });
  const at = (x) => { const r = scrub.getBoundingClientRect(); goP((x - r.left) / r.width); };
  scrub.addEventListener("pointerdown", (e) => {
    cancelAnimationFrame(playing); setPlayIcon(false); scrub.setPointerCapture(e.pointerId); at(e.clientX);
    const mv = (ev) => at(ev.clientX);
    const up = () => { scrub.removeEventListener("pointermove", mv); scrub.removeEventListener("pointerup", up); scrub.removeEventListener("pointercancel", up); };
    scrub.addEventListener("pointermove", mv); scrub.addEventListener("pointerup", up); scrub.addEventListener("pointercancel", up);
  });
  scrub.addEventListener("keydown", (e) => {
    const d = { ArrowRight: 0.02, ArrowUp: 0.02, ArrowLeft: -0.02, ArrowDown: -0.02, PageUp: 0.1, PageDown: -0.1 }[e.key];
    if (e.key === "Home") { e.preventDefault(); goP(0); return; }
    if (e.key === "End") { e.preventDefault(); goP(1); return; }
    if (d) { e.preventDefault(); goP(P + d); }
  });
  const playBtn = $("#tlPlay");
  const setPlayIcon = (on) => { $(".pl-ic", playBtn).setAttribute("d", on ? "M2 1h3v10H2zM7 1h3v10H7z" : "M2 1l9 5-9 5z"); playBtn.setAttribute("aria-label", on ? "Pause the mission" : "Play the mission"); };
  playBtn.addEventListener("click", () => {
    if (playing) { cancelAnimationFrame(playing); playing = 0; setPlayIcon(false); return; }
    if (RM) { goP(1); return; }
    const from = P >= 0.995 ? 0 : P, dur = 14000 * (1 - from), t1 = performance.now();
    setPlayIcon(true);
    const step = (now) => { const k = clamp((now - t1) / dur); goP(from + (1 - from) * k); playing = k < 1 ? requestAnimationFrame(step) : (setPlayIcon(false), 0); };
    playing = requestAnimationFrame(step);
  });
  addEventListener("wheel", () => { if (playing) { cancelAnimationFrame(playing); playing = 0; setPlayIcon(false); } }, { passive: true });
  render(RM || !pinned() ? 1 : 0);
  fromScroll();
  document.addEventListener("ks-theme", () => render(P));
}

// ---------------------------------------------------------------- scroll story (Aurora, on the real Earth)
const story = $("#story");
let storyS = { ...state(300), zoom: 1 };
if (story) {
  const stage = $("#stage"), copy = $("#storyCopy"), beats = $$(".beat", story), rails = $$("#rail i"), hold = $("#hold");
  const holdNs = $("#holdNs"), holdFill = $("#holdFill"), holdT = $("#holdT"), holdGuard = $("#holdGuard");
  const leg = $("#storyLegend");
  leg.replaceChildren(...D.orb.constellations.map((c, i) => { const s = el("span", "it"); s.style.setProperty("--c", `var(${SYS[i % SYS.length]})`); s.append(el("i"), `${c.name} ${c.satellites}`); return s; }));
  const hp = C.phases.find((p) => p.name === "holdover");
  const hMax = Math.max(...CH.time_error_ns.filter((v, i) => TT[i] >= hp.t0 && TT[i] < hp.t1)) * 1.1, guard = CH.guard_ns[0];
  holdGuard.style.left = `${(guard / hMax) * 100}%`;
  const beatT = [C.phases[0].t0 + 300, C.phases[1].t0 + 300, C.phases[2].t0 + 200, hp.t0];
  const noPin = () => RM || innerWidth <= 900 || innerHeight < 600;
  // Pinned only while the stage's copy fits the window (enlarged text or spacing can outgrow it).
  const layout = () => {
    story.classList.toggle("no-pin", noPin());
    if (!noPin() && stage.scrollHeight > stage.clientHeight + 2) story.classList.add("no-pin");
  };
  layout();
  let lastB = -2, target = 0, p = 0;
  const holdAt = (h) => {
    const t = hp.t0 + h * (hp.t1 - hp.t0 - STEP), v = CH.time_error_ns[idxAt(t)];
    holdNs.textContent = v.toFixed(1); holdFill.style.width = `${clamp(v / hMax) * 100}%`; holdT.textContent = hms(t);
    hold.classList.toggle("breach", v > guard);
    return t;
  };
  const apply = () => {
    const pinned = !story.classList.contains("no-pin");
    if (!pinned) {
      copy.style.opacity = ""; copy.style.visibility = ""; copy.style.translate = "";
      beats.forEach((b) => { b.classList.add("on"); b.classList.remove("past"); }); hold.classList.add("on"); holdAt(1);
      stage.dataset.beat = "3";
      storyS = { ...state(beatT[0]), zoom: 1 };
      lastB = -2; // every beat is "on" now: the next pinned frame must reset them, even for the same beat
      return;
    }
    const out = ss(0.04, 0.75, p);
    // The copy is either fully there or gone: it fades out (the 0.5 s CSS transition) once it is half-way
    // off, so no scroll position leaves it resting half-transparent and hard to read.
    copy.style.opacity = out > 0.5 ? "0" : "1"; copy.style.visibility = out > 0.995 ? "hidden" : "visible";
    copy.style.translate = `0 ${(-out * 60).toFixed(1)}px`;
    const b = p < 0.95 ? -1 : Math.min(3, Math.floor(p - 1 + 0.05));
    if (b !== lastB) { beats.forEach((e, i) => { e.classList.toggle("on", i === b); e.classList.toggle("past", i < b); }); stage.dataset.beat = String(b); lastB = b; }
    rails.forEach((e, i) => { e.style.transform = `scaleX(${clamp(p - 1 - i).toFixed(3)})`; });
    hold.classList.toggle("on", p > 3.92);
    let t = beatT[Math.max(0, b)];
    if (b === 3) t = holdAt(ss(4.0, 4.92, p));
    storyS = { ...state(t), zoom: 1 + 0.35 * ss(0.6, 2.2, p) };
  };
  const track = $("#storyTrack");
  const read = () => { const r = track.getBoundingClientRect(), h = r.height - innerHeight; target = h > 0 ? clamp(-r.top / h) * 5 : 0; };
  addEventListener("scroll", read, { passive: true });
  addEventListener("resize", () => { layout(); read(); apply(); });
  if (window.ResizeObserver) { let q = 0; new ResizeObserver(() => { if (!q) q = requestAnimationFrame(() => { q = 0; const was = story.classList.contains("no-pin"); layout(); if (was !== story.classList.contains("no-pin")) { lastB = -2; read(); apply(); } }); }).observe(copy); }
  read(); p = target; apply();
  if (!RM) { let last = performance.now(); const f = (now) => { const dt = Math.min(0.05, (now - last) / 1000); last = now; p += (target - p) * (1 - Math.exp(-dt * 5.5)); if (Math.abs(target - p) < 1e-4) p = target; apply(); requestAnimationFrame(f); }; requestAnimationFrame(f); }
}

mountGlobes(() => heroS, () => tlS, () => storyS);

// ---------------------------------------------------------------- recorded kshana-mcp session (stepped player)
// Shared with Developers: js/mcp-player.mjs.
mountPlayer(D.mcp || null);

// Install panel in this section: the MCP channel is the one that matters next to the assistant.
// Pre-select it here without writing the viewer's remembered tab.
(() => {
  const box = $("#assistant [data-installer]");
  if (!box) return;
  const tabsI = $$('[role="tab"]', box), hit = tabsI.find((t) => t.getAttribute("data-ch") === "mcp");
  if (!hit) return;
  tabsI.forEach((t) => {
    const on = t === hit; t.setAttribute("aria-selected", on ? "true" : "false"); t.tabIndex = on ? 0 : -1;
    const p = document.getElementById(t.getAttribute("aria-controls")); if (p) p.hidden = !on;
  });
})();
