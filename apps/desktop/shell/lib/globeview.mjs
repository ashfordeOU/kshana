// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the globe view of a run (0.42 U24), on the chart library's WebGL2
// renderer (lib/chart/chart3d.mjs: a solid globe layer, line segments, trajectories, points; no
// globe library). It draws the WGS-84 globe with the Natural Earth coastlines (bundled, public
// domain) or a region pack where one covers the view, the graticule, the scenario's sites and
// moving objects as the engine exports them (Earth-fixed positions with heights), the run's own
// track, ships and aircraft, and at the time cursor the coverage circle of each satellite (the
// ground that sees it above the elevation mask). Follow mode turns the globe so the followed
// object stays under the camera. Imagery is off unless the person turns it on (lib/globe.mjs
// IMAGERY_SOURCES; tiles are kept on this computer once fetched).
import { h } from "./dom.mjs";
import { ecefKm, landRings, segmentsOf, graticuleLines, coverageAngleDeg, circleLonLat, followCamera, WGS84_A_KM, WGS84_F, IMAGERY_SOURCES, tilesOf, tileKey } from "./globe.mjs";

const num = (x) => typeof x === "number" && Number.isFinite(x);
const isoMs = (s) => { const v = Date.parse(s); return Number.isFinite(v) ? v : NaN; };

/**
 * What the globe draws from the scenario's GeoJSON export (with heights, which the 2D map does
 * not need): { sites: [{ id, role, lat, lon, h }], movers: [{ id, role, t, lat, lon, h }] }. Times
 * are seconds after the export's first time, as on the run's clock.
 */
export function globeScene(fc) {
  const out = { sites: [], movers: [] };
  if (!fc || !Array.isArray(fc.features)) return out;
  let t0 = NaN;
  for (const f of fc.features) { const p = (f && f.properties) || {}; if (Array.isArray(p.times_utc) && p.times_utc.length) { const ms = isoMs(p.times_utc[0]); if (num(ms) && !(ms >= t0)) t0 = ms; } }
  for (const f of fc.features) {
    const p = (f && f.properties) || {}, g = f && f.geometry;
    if (!g) continue;
    const role = String(p.role || "");
    if (g.type === "Point" && Array.isArray(g.coordinates) && num(g.coordinates[0]) && num(g.coordinates[1])) {
      out.sites.push({ id: String(p.name || role || "site"), role, lon: g.coordinates[0], lat: g.coordinates[1], h: num(g.coordinates[2]) ? g.coordinates[2] : 0 });
    } else if ((g.type === "LineString" || g.type === "MultiLineString") && Array.isArray(p.times_utc) && num(t0)) {
      const parts = g.type === "LineString" ? [g.coordinates] : g.coordinates;
      let pts = parts.flat().filter((q) => Array.isArray(q) && num(q[0]) && num(q[1]));
      const times = p.times_utc.map(isoMs);
      if (pts.length > times.length) {
        const cut = new Set();
        let at = 0;
        for (const part of parts) { if (at > 0) { cut.add(at - 1); cut.add(at); } at += part.length; }
        pts = pts.filter((q, i) => !(cut.has(i) && Math.abs(q[0]) === 180));
      }
      if (pts.length !== times.length || !times.every(num)) continue;
      out.movers.push({ id: String(p.name || role), role, t: times.map((ms) => (ms - t0) / 1000), lon: pts.map((q) => q[0]), lat: pts.map((q) => q[1]), h: pts.map((q) => (num(q[2]) ? q[2] : 0)) });
    }
  }
  return out;
}

/** The index of the last time at or before `t` (0 before the first). */
function idxAt(ts, t) { let lo = 0, hi = ts.length - 1; if (!(t >= ts[0])) return 0; while (lo < hi) { const m = (lo + hi + 1) >> 1; if (ts[m] <= t) lo = m; else hi = m - 1; } return lo; }

const flatXyz = (lats, lons, hs) => { const o = []; for (let i = 0; i < lats.length; i++) o.push(...ecefKm(lats[i], lons[i], hs ? hs[i] : 0)); return o; };

/**
 * Mount the globe for a run. ctx: { t, createChart3D, clock (the chart clock interface: now,
 * subscribe), model (lib/timemodel.mjs, or null), scene (a promise of the GeoJSON export),
 * loadLand(scale), packs() (region packs), mask (degrees), imagery: { get(), set(id) },
 * cacheGet(key) / cachePut(key, base64) (the native tile cache, or null), bridge: { on(), toggle() } }.
 * Returns { el, chart (once drawn), destroy() }.
 */
export function mountGlobe(ctx) {
  const { t } = ctx;
  const el = h("div", { class: "globe-pane" });
  const bar = h("div", { class: "globe-bar", role: "toolbar", "aria-label": t("js-desk-gl-tools", "Globe") });
  const stage = h("div", { class: "globe-stage" });
  const note = h("p", { class: "sky-note" });
  el.append(bar, stage, note);
  const state = { follow: "", chart: null, land: null, packSeg: {}, scene: { sites: [], movers: [] }, texture: null, last: -1, destroyed: false };
  const model = ctx.model;
  const mask = num(ctx.mask) ? ctx.mask : 0;
  const objects = () => {
    const list = state.scene.movers.map((m) => ({ id: `m:${m.id}`, label: m.id, kind: m.role }));
    if (model && model.track) list.unshift({ id: "track", label: t("js-desk-gl-track", "the run's track"), kind: "track" });
    return list;
  };
  const posAt = (id, tt) => {
    if (id === "track" && model && model.track) { const tr = model.track, i = idxAt(tr.t, tt); return { lat: tr.lat[i], lon: tr.lon[i] }; }
    const m = state.scene.movers.find((x) => `m:${x.id}` === id);
    if (!m) return null;
    const i = idxAt(m.t, tt);
    return { lat: m.lat[i], lon: m.lon[i] };
  };

  function layers(tt) {
    const L = [];
    L.push({ kind: "globe", id: "earth", label: t("js-desk-gl-earth", "Earth (WGS-84)"), r: WGS84_A_KM, f: WGS84_F, color: "panel", texture: state.texture || undefined });
    if (state.land) L.push({ kind: "segments", id: "coast", label: t("js-desk-gl-coast", "coastlines (Natural Earth)"), pts: state.land, color: "ink2", alpha: 0.9 });
    for (const [k, pk] of (ctx.packs ? ctx.packs() : []).entries()) {
      try { L.push({ kind: "segments", id: `pack${k}`, label: t("js-desk-gl-pack", "region pack: { $name }", { name: pk.name }), pts: (state.packSeg[pk.name] ||= segmentsOf(landRings(pk.land), { hM: 9000, maxDeg: 1, box: pk.bbox })), color: "ink", alpha: 0.9 }); } catch { /* a bad pack draws nothing */ }
    }
    L.push({ kind: "segments", id: "grat", label: t("js-desk-gl-grat", "graticule 30°"), pts: segmentsOf(graticuleLines(30), { hM: 6000, closed: false }), color: "ink3", alpha: 0.35 });
    if (model && model.track) {
      const tr = model.track;
      L.push({ kind: "line", id: "track", label: t("js-desk-gl-track", "the run's track"), pts: flatXyz(tr.lat, tr.lon, null).map((v) => v * (1 + 2 / WGS84_A_KM)), color: "nav", t: Array.from(tr.t) });
    }
    state.scene.movers.forEach((m, k) => {
      L.push({ kind: "line", id: `m:${m.id}`, label: m.id, pts: flatXyz(m.lat, m.lon, m.h), color: ["orb", "gps", "gal", "leo", "pro"][k % 5], t: m.t, rows: (i) => [["lat", `${m.lat[i].toFixed(4)}°`], ["lon", `${m.lon[i].toFixed(4)}°`], ["height", `${(m.h[i] / 1000).toFixed(1)} km`]] });
    });
    if (state.scene.sites.length) {
      const S = state.scene.sites;
      L.push({ kind: "points", id: "sites", label: t("js-desk-gl-sites", "sites"), pts: S.flatMap((s) => ecefKm(s.lat, s.lon, s.h + 4000)), color: "tim", size: 7, rows: (i) => [["site", S[i].id], ["role", S[i].role], ["lat", `${S[i].lat.toFixed(5)}°`], ["lon", `${S[i].lon.toFixed(5)}°`]] });
    }
    if (model && model.traffic) {
      const objs = model.traffic.objects.slice(0, 300);
      const pts = [];
      for (const o of objs) { const i = idxAt(o.t, tt); if (num(o.lat[i])) pts.push(...ecefKm(o.lat[i], o.lon[i], num(o.alt && o.alt[i]) ? o.alt[i] : 0)); }
      if (pts.length) L.push({ kind: "points", id: "traffic", label: t("js-desk-gl-traffic", "ships and aircraft at the cursor"), pts, color: "nav", size: 5 });
    }
    // coverage at the cursor: each object high enough to be a satellite
    const cov = [];
    for (const m of state.scene.movers) {
      const i = idxAt(m.t, tt), hKm = m.h[i] / 1000;
      if (!(hKm > 150)) continue;
      cov.push(circleLonLat(m.lat[i], m.lon[i], coverageAngleDeg(hKm, mask)));
    }
    if (cov.length) L.push({ kind: "segments", id: "cover", label: t("js-desk-gl-cover", "coverage above { $mask }° at the cursor", { mask }), pts: segmentsOf(cov, { hM: 10000, maxDeg: 4 }), color: "itg", alpha: 0.95 });
    return L;
  }

  function draw() {
    if (state.destroyed) return;
    const tt = ctx.clock ? ctx.clock.now : 0;
    if (!state.chart) {
      stage.replaceChildren();
      state.chart = ctx.createChart3D(stage, { title: t("js-desk-gl-title", "Globe"), subtitle: t("js-desk-gl-sub", "Earth-fixed, WGS-84"), aspect: "equal", axes: false, height: 520, clock: ctx.clock || undefined,
        x: { label: "x", unit: "km" }, y: { label: "y", unit: "km" }, z: { label: "z", unit: "km" }, layers: layers(tt), camera: { yaw: 0.4, pitch: 0.5 } });
    } else state.chart.update({ layers: layers(tt) });
    follow(tt);
  }
  function follow(tt) {
    if (!state.follow || !state.chart) return;
    const p = posAt(state.follow, tt);
    if (p && num(p.lat)) state.chart.setCamera(followCamera(p.lat, p.lon));
  }
  // redraw the coverage at most ten times a second while the cursor moves
  let timer = 0;
  const unsub = ctx.clock && typeof ctx.clock.subscribe === "function" ? ctx.clock.subscribe(() => {
    follow(ctx.clock.now);
    if (timer) return;
    timer = setTimeout(() => { timer = 0; if (state.chart && (state.scene.movers.length || (model && model.traffic))) state.chart.update({ layers: layers(ctx.clock.now) }); }, 100);
  }) : null;

  function toolbar() {
    const sel = h("select", { class: "input", "aria-label": t("js-desk-gl-follow", "Follow") }, h("option", { value: "", text: t("js-desk-gl-follow-none", "Follow: nothing") }), ...objects().map((o) => h("option", { value: o.id, text: t("js-desk-gl-follow-x", "Follow: { $name }", { name: o.label }) })));
    sel.value = state.follow;
    sel.addEventListener("change", () => { state.follow = sel.value; follow(ctx.clock ? ctx.clock.now : 0); });
    const img = ctx.imagery ? ctx.imagery.get() : "";
    const imgSel = h("select", { class: "input", "aria-label": t("js-desk-gl-imagery", "Imagery") }, h("option", { value: "", text: t("js-desk-gl-imagery-off", "Imagery: off") }), ...IMAGERY_SOURCES.map((s) => h("option", { value: s.id, text: s.name })));
    imgSel.value = img;
    imgSel.addEventListener("change", () => { if (ctx.imagery) ctx.imagery.set(imgSel.value); loadImagery(); toolbar(); });
    const bridge = h("button", { type: "button", class: "btn", "aria-pressed": ctx.bridge && ctx.bridge.on() ? "true" : "false", onclick: () => { if (ctx.bridge) ctx.bridge.toggle(); state.chart && state.chart.update({}); toolbar(); } }, t("js-desk-gl-bridge", "Bridge (red)"));
    bar.replaceChildren(sel, imgSel, bridge);
  }

  function writeNote() {
    const src = IMAGERY_SOURCES.find((s) => s.id === (ctx.imagery && ctx.imagery.get()));
    const parts = [t("js-desk-gl-note", "Positions as the engine exports them (Earth-fixed, heights above WGS-84). Coverage: the ground that sees each satellite above the elevation mask, on a spherical Earth. Coastlines Natural Earth (public domain).")];
    if (src) parts.push(state.texture ? src.credit : t("js-desk-gl-imagery-wait", "Imagery: fetching the tiles once; they are then kept on this computer."));
    note.textContent = parts.join(" ");
  }

  async function loadImagery() {
    const id = ctx.imagery && ctx.imagery.get();
    const src = IMAGERY_SOURCES.find((s) => s.id === id);
    if (!src) { state.texture = null; writeNote(); if (state.chart) draw(); return; }
    writeNote();
    const level = 2, tiles = tilesOf(src, level), deg = tiles[0].deg;
    const W = 2048, H = 1024, c = document.createElement("canvas");
    c.width = W; c.height = H;
    const g = c.getContext("2d");
    g.fillStyle = "\x23000"; g.fillRect(0, 0, W, H);
    let got = 0;
    for (const tile of tiles) {
      if (tile.west >= 180 || tile.north <= -90) continue;
      try {
        const key = tileKey(src, tile);
        let b64 = ctx.cacheGet ? await ctx.cacheGet(key) : null;
        if (!b64) {
          const r = await fetch(tile.url);
          if (!r.ok) throw new Error(`HTTP ${r.status}`);
          const buf = new Uint8Array(await r.arrayBuffer());
          let s = ""; for (let i = 0; i < buf.length; i += 0x8000) s += String.fromCharCode(...buf.subarray(i, i + 0x8000));
          b64 = btoa(s);
          if (ctx.cachePut) await ctx.cachePut(key, b64).catch(() => {});
        }
        const im = new Image();
        im.src = `data:image/jpeg;base64,${b64}`;
        await im.decode();
        const x = ((tile.west + 180) / 360) * W, y = ((90 - tile.north) / 180) * H, w = (deg / 360) * W, hh = (deg / 180) * H;
        g.drawImage(im, x, y, w, hh);
        got++;
      } catch (e) { console.error("Kshana Desktop globe: imagery tile", e); }
      if (state.destroyed) return;
    }
    state.texture = got ? c : null;
    writeNote();
    if (state.chart) draw();
  }

  toolbar();
  writeNote();
  Promise.all([Promise.resolve(ctx.loadLand("110m")).catch(() => null), Promise.resolve(ctx.scene).catch(() => null)]).then(([land, fc]) => {
    if (state.destroyed) return;
    try { state.land = land ? segmentsOf(landRings(land), { hM: 8000, maxDeg: 3 }) : null; } catch { state.land = null; }
    state.scene = globeScene(fc);
    toolbar();
    draw();
    if (ctx.imagery && ctx.imagery.get()) loadImagery();
  });
  return {
    el,
    get chart() { return state.chart; },
    get scene() { return state.scene; },
    destroy() { state.destroyed = true; if (unsub) unsub(); clearTimeout(timer); if (state.chart) state.chart.destroy(); },
  };
}
