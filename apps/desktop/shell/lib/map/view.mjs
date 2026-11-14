// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop map (0.42 U15): a 2D map on the time cursor, drawn with the Canvas 2D API
// from Natural Earth land (public domain, bundled, so it opens with no network) in Web
// Mercator. Layers: graticule, land and coastline, jammer areas with their uncertainty band
// labelled with the engine's evidence class, routes, the run's track coloured by trust (or
// station visibility), sites (receivers, stations, jammers), satellites and the position at
// the cursor. The scale bar, the projection's name and the data source are always shown.
// Two canvases: the base (land, areas, the whole track) is drawn when the view, data, range
// or style change; the top layer (trail to the cursor, position, markers, satellites) on
// every clock change. Drag pans, the wheel zooms, a click on a track point drops a timed
// marker there, hovering shows the latitude and longitude.
import {
  toWorld, project, unproject, zoomAbout, panBy, fitBounds, boundsOf, metresPerPixel, scaleBar, graticuleStep,
  decodeLand, boxInView, worldCopies, worldToScreen, scaleOf, circleRing, nearestPoint, latLonText, PROJECTION_NAME, MAX_LAT,
} from "./proj.mjs";
import { trackColor } from "./style.mjs";
import { positionAt } from "../timemodel.mjs";
import { indexAtOrBefore, clockText } from "../clock.mjs";

// The land layers, loaded once per window: 110m for the world, 50m from zoom 3.5.
const LAND = { "110m": null, "50m": null };
const LAND_ZOOM_50M = 3.5;
function land(scale, load, onReady) {
  const L = LAND[scale];
  if (L && L.rings) return L.rings;
  if (!L) {
    LAND[scale] = { rings: null, waiting: new Set([onReady]) };
    Promise.resolve(load(scale)).then((packed) => {
      const e = LAND[scale];
      e.rings = decodeLand(packed);
      for (const fn of e.waiting) fn();
      e.waiting.clear();
    }).catch((err) => { console.error("Kshana Desktop map: land layer", scale, err); LAND[scale] = { rings: [], waiting: new Set() }; });
  } else L.waiting.add(onReady);
  return null;
}

const el = (tag, cls, text) => { const n = document.createElement(tag); if (cls) n.className = cls; if (text !== undefined) n.textContent = text; return n; };

/**
 * A map view. `loadLand(scale)` returns (a promise of) the packed layer for "110m" or "50m";
 * `style()` the colours (lib/map/style.mjs mapStyle). Returns { el, setModel(model),
 * setClock(snapshot), restyle(), resize(), fit(), destroy(), onMark, onStyle, view }.
 */
export function createMapView({ t = (id, en) => en, loadLand, style, styleName = () => "night", setStyleName = null, readout = null, valueText = (v) => String(v) }) {
  const root = el("div", "lv-map");
  const base = el("canvas", "lv-base"), over = el("canvas", "lv-over");
  over.tabIndex = 0;
  over.setAttribute("role", "application");
  over.setAttribute("aria-roledescription", t("js-desk-map-role", "map"));
  over.setAttribute("aria-label", t("js-desk-map-label", "Map of the run. Drag to pan, the wheel or + and − to zoom, 0 to fit."));
  const hover = el("div", "lv-map-hover");
  hover.hidden = true;
  const scale = el("div", "lv-map-scale");
  const scaleBarEl = el("i"), scaleText = el("span");
  scale.append(scaleBarEl, scaleText);
  const attr = el("div", "lv-map-attr");
  const legend = el("div", "lv-map-legend");
  const tools = el("div", "lv-map-tools");
  const btn = (text, label, fn) => { const b = el("button", "lv-btn", text); b.type = "button"; b.title = label; b.setAttribute("aria-label", label); b.addEventListener("click", fn); return b; };
  const styleSeg = el("div", "lv-seg");
  styleSeg.setAttribute("role", "group");
  styleSeg.setAttribute("aria-label", t("js-desk-map-style", "Map style"));
  const styleBtns = [["night", t("js-desk-map-night", "Night ops")], ["chart", t("js-desk-map-chart", "Chart")]].map(([id, label]) => {
    const b = btn(label, label, () => { if (setStyleName) setStyleName(id); });
    b.dataset.style = id;
    return b;
  });
  styleSeg.append(...styleBtns);
  tools.append(styleSeg,
    btn("+", t("js-desk-map-zoom-in", "Zoom in"), () => zoomBy(2)),
    btn("−", t("js-desk-map-zoom-out", "Zoom out"), () => zoomBy(0.5)),
    btn("⤢", t("js-desk-map-fit", "Fit the run"), () => ctl.fit()));
  // The values at the cursor (time, position, trust or fix, the plotted series), on the map itself.
  const now = el("dl", "lv-map-now");
  now.setAttribute("aria-label", t("js-desk-at-cursor", "At the cursor"));
  root.append(base, over, tools, now, hover, legend, scale, attr);

  const ctl = { el: root, onMark: null };
  let M = null, C = null, W = 0, H = 0, dpr = 1, st = style();
  let V = { cx: 0.5, cy: 0.5, zoom: 1 };
  let fitted = false;
  // Screen positions of the track, made with the base layer (for the trail, hits and hover).
  let TX = new Float32Array(0), TY = new Float32Array(0), TC = [], halfWorld = Infinity;

  function size() {
    const r = root.getBoundingClientRect();
    dpr = globalThis.devicePixelRatio || 1;
    W = Math.max(10, Math.round(r.width)); H = Math.max(10, Math.round(r.height));
    // Setting a canvas's size clears it: only when the size changed.
    for (const c of [base, over]) if (c.width !== W * dpr || c.height !== H * dpr) { c.width = W * dpr; c.height = H * dpr; c.style.width = `${W}px`; c.style.height = `${H}px`; }
  }

  function bounds() {
    if (!M) return null;
    const lons = [], lats = [];
    const add = (lon, lat) => { if (Number.isFinite(lon) && Number.isFinite(lat)) { lons.push(lon); lats.push(lat); } };
    if (M.track) for (let i = 0; i < M.track.t.length; i++) add(M.track.lon[i], M.track.lat[i]);
    for (const s of M.sites) add(s.lon, s.lat);
    for (const a of M.areas) for (const p of a.outerRing || a.innerRing || []) add(p[0], p[1]);
    for (const r of M.routes) for (let i = 0; i < r.lon.length; i++) add(r.lon[i], r.lat[i]);
    return lons.length ? boundsOf(lons, lats) : null;
  }
  ctl.fit = () => {
    const b = bounds();
    // A track around the whole world (a satellite) shows the whole world.
    if (!b || b.east - b.west > 300 || (b.east < b.west && b.east + 360 - b.west > 300)) V = fitBounds({ west: -180, south: -75, east: 180, north: 80 }, W, H, { pad: 8 });
    else V = fitBounds(b, W, H, { pad: 36, maxZoom: 13 });
    drawAll();
  };
  function zoomBy(f, px = W / 2, py = H / 2) { V = zoomAbout(V, W, H, f, px, py); drawAll(); }

  // ---------- base layer
  function ringPath(g, pts, k) {
    // pts: array of [lon, lat]; drawn on world copy k.
    let first = true;
    for (const [lon, lat] of pts) {
      const [x, y] = toWorld(lon, lat);
      const [sx, sy] = worldToScreen(V, W, H, x + k, y);
      if (first) { g.moveTo(sx, sy); first = false; } else g.lineTo(sx, sy);
    }
    g.closePath();
  }
  function drawLand(g) {
    const want50 = V.zoom >= LAND_ZOOM_50M;
    const redraw = () => drawAll();
    let rings = want50 ? land("50m", loadLand, redraw) : null;
    if (!rings) rings = land("110m", loadLand, redraw);
    if (!rings) return "";
    const k0 = scaleOf(V.zoom), ox = W / 2 - V.cx * k0, oy = H / 2 - V.cy * k0;
    const fill = new Path2D(), edge = new Path2D();
    for (const k of worldCopies(V, W)) {
      for (const r of rings) {
        if (!boxInView(V, W, H, r.bbox, k)) continue;
        const xy = r.xy, n = xy.length >> 1;
        let pw = 0, ph = 0;
        for (let i = 0; i < n; i++) {
          const wx = xy[2 * i], wy = xy[2 * i + 1];
          const sx = (wx + k) * k0 + ox, sy = wy * k0 + oy;
          if (i === 0) { fill.moveTo(sx, sy); edge.moveTo(sx, sy); }
          else {
            fill.lineTo(sx, sy);
            // No coastline along the antimeridian cut or the Mercator edge.
            const cut = (wx === pw && (wx <= 0 || wx >= 1)) || (wy === ph && (wy <= 0.0005 || wy >= 0.9995));
            if (cut) edge.moveTo(sx, sy); else edge.lineTo(sx, sy);
          }
          pw = wx; ph = wy;
        }
        fill.closePath();
      }
    }
    g.fillStyle = st.land; g.fill(fill, "evenodd");
    g.strokeStyle = st.coast; g.lineWidth = 0.8; g.lineJoin = "round"; g.stroke(edge);
    return want50 && LAND["50m"] && LAND["50m"].rings ? "50m" : "110m";
  }
  function drawGraticule(g) {
    const [lonL] = unproject(V, W, H, 0, H / 2);
    const wide = Math.min(360, (W / scaleOf(V.zoom)) * 360);
    const step = graticuleStep(wide);
    const [, latT] = unproject(V, W, H, W / 2, 0), [, latB] = unproject(V, W, H, W / 2, H);
    g.strokeStyle = st.grid; g.lineWidth = 1;
    g.fillStyle = st.gridText; g.font = `10px ${st.mono}`;
    g.beginPath();
    const lon0 = Math.floor((wide >= 359 ? -180 : lonL) / step) * step;
    const lonEnd = wide >= 359 ? 180 : lonL + wide;
    const labels = [];
    let lastX = -Infinity;
    for (let lon = lon0; lon <= lonEnd + 1e-9; lon += step) {
      const [x] = project(V, W, H, lon, 0);
      if (x < -1 || x > W + 1) continue;
      g.moveTo(Math.round(x) + 0.5, 0); g.lineTo(Math.round(x) + 0.5, H);
      const L = ((lon + 540) % 360) - 180;
      if (x - lastX >= 46) { labels.push([`${+Math.abs(L).toFixed(3)}°${L > 0 ? "E" : L < 0 ? "W" : ""}`, x + 3, H - 30]); lastX = x; }
    }
    for (let lat = Math.floor(Math.max(-MAX_LAT, latB) / step) * step; lat <= Math.min(MAX_LAT, latT) + 1e-9; lat += step) {
      const [, y] = project(V, W, H, V.cx * 360 - 180, lat);
      if (y < -1 || y > H + 1) continue;
      g.moveTo(0, Math.round(y) + 0.5); g.lineTo(W, Math.round(y) + 0.5);
      labels.push([`${+Math.abs(lat).toFixed(3)}°${lat > 0 ? "N" : lat < 0 ? "S" : ""}`, 4, y - 3]);
    }
    g.stroke();
    g.textBaseline = "alphabetic";
    for (const [s, x, y] of labels) g.fillText(s, x, y);
  }
  function drawAreas(g) {
    for (const a of M.areas) {
      const outer = a.outerRing || (a.outer ? circleRing(a.lat, a.lon, a.outer) : null);
      const inner = a.innerRing || (a.inner ? circleRing(a.lat, a.lon, a.inner) : null);
      for (const k of worldCopies(V, W)) {
        if (outer) {
          g.beginPath(); ringPath(g, outer, k);
          if (inner) ringPath(g, inner, k);
          g.fillStyle = st.areaBand; g.fill("evenodd");
          g.beginPath(); ringPath(g, outer, k);
          g.setLineDash([6, 5]); g.strokeStyle = st.area; g.lineWidth = 1.2; g.globalAlpha = 0.8; g.stroke(); g.setLineDash([]); g.globalAlpha = 1;
        }
        if (inner) {
          g.beginPath(); ringPath(g, inner, k);
          g.fillStyle = st.areaFill; g.fill();
          g.strokeStyle = st.area; g.lineWidth = 1.4; g.stroke();
        }
      }
      // The label sits at the top of the outer ring.
      const top = (outer || inner || []).reduce((b, p) => (p[1] > b[1] ? p : b), [a.lon, a.lat]);
      const [x, y] = project(V, W, H, a.lon, top[1]);
      const ev = a.evidence === "estimated" ? t("js-desk-map-estimated", "estimated") : t("js-desk-map-modelled", "modelled");
      label(g, t("js-desk-map-area", "interference area ({ $ev })", { ev }), x, y - 6, st.area, "center");
    }
  }
  function label(g, s, x, y, color, align = "left") {
    g.font = `11px ${st.font}`; g.textAlign = align; g.textBaseline = "alphabetic";
    g.lineWidth = 3; g.strokeStyle = st.halo; g.strokeText(s, x, y);
    g.fillStyle = color; g.fillText(s, x, y);
    g.textAlign = "left";
  }
  function drawRoutes(g) {
    g.save(); g.setLineDash([4, 4]); g.strokeStyle = st.text2; g.lineWidth = 1.2;
    for (const r of M.routes) {
      g.beginPath();
      for (let i = 0; i < r.lon.length; i++) { const [x, y] = project(V, W, H, r.lon[i], r.lat[i]); if (i) g.lineTo(x, y); else g.moveTo(x, y); }
      g.stroke();
    }
    g.restore();
  }
  function projectTrack() {
    const tr = M.track;
    const n = tr ? tr.t.length : 0;
    TX = new Float32Array(n); TY = new Float32Array(n); TC = new Array(n);
    if (!n) return;
    const k0 = scaleOf(V.zoom);
    halfWorld = k0 / 2;
    // Each point on the copy of the world nearest the view's centre; the line breaks where
    // the track crosses to another copy (strokeTrack).
    for (let i = 0; i < n; i++) {
      let [x, y] = toWorld(tr.lon[i], tr.lat[i]);
      x += Math.round(V.cx - x);
      TX[i] = (x - V.cx) * k0 + W / 2; TY[i] = (y - V.cy) * k0 + H / 2;
      TC[i] = trackColor(st, tr.kind, tr.q[i]);
    }
  }
  // Draw track points [i0, i1] as runs of one colour, skipping points under half a pixel apart.
  function strokeTrack(g, i0, i1, width, colorOf) {
    if (i1 <= i0) return;
    g.lineWidth = width; g.lineJoin = "round"; g.lineCap = "round";
    let c = colorOf(i0), lx = TX[i0], ly = TY[i0];
    g.beginPath(); g.moveTo(lx, ly);
    for (let i = i0 + 1; i <= i1; i++) {
      const x = TX[i], y = TY[i];
      const jump = Math.abs(x - lx) > halfWorld; // crossed to another copy of the world
      const ci = colorOf(i);
      if (jump) { g.strokeStyle = c; g.stroke(); g.beginPath(); g.moveTo(x, y); lx = x; ly = y; c = ci; continue; }
      if (ci !== c) { g.lineTo(x, y); g.strokeStyle = c; g.stroke(); g.beginPath(); g.moveTo(x, y); c = ci; lx = x; ly = y; continue; }
      if (i !== i1 && Math.abs(x - lx) < 0.5 && Math.abs(y - ly) < 0.5) continue;
      g.lineTo(x, y); lx = x; ly = y;
    }
    g.strokeStyle = c; g.stroke();
  }
  function rangeIdx() {
    const tr = M.track;
    const r = C && C.range;
    const a = r ? r[0] : M.span[0], b = r ? r[1] : M.span[1];
    const i0 = Math.max(0, indexAtOrBefore(tr.t, a)), i1 = indexAtOrBefore(tr.t, b);
    return [tr.t[i0] < a && i0 < i1 ? i0 + 1 : i0, i1];
  }
  function drawTrack(g) {
    if (!M.track || !TX.length) return;
    const n = TX.length;
    strokeTrack(g, 0, n - 1, 1.5, () => st.trackDim);
    const [i0, i1] = rangeIdx();
    g.globalAlpha = 0.55;
    strokeTrack(g, i0, i1, 2, (i) => TC[i]);
    g.globalAlpha = 1;
  }
  function drawSites(g) {
    for (const s of M.sites) {
      const [x, y] = project(V, W, H, s.lon, s.lat);
      if (x < -20 || x > W + 20 || y < -20 || y > H + 20) continue;
      symbol(g, s.role, x, y);
      label(g, siteName(s), x + 9, y - 7, s.role === "jammer" ? st.jammer : st.text);
    }
  }
  const siteName = (s) => ({ receiver: t("js-desk-map-receiver", "receiver"), station: t("js-desk-map-station", "ground station"), jammer: t("js-desk-map-jammer", "jammer (modelled)"), origin: t("js-desk-map-origin", "frame origin") })[s.role] || s.id;
  function symbol(g, role, x, y, color) {
    g.lineWidth = 1.6; g.strokeStyle = st.halo;
    g.beginPath();
    if (role === "station") { g.moveTo(x, y - 6); g.lineTo(x + 5.5, y + 4); g.lineTo(x - 5.5, y + 4); g.closePath(); }
    else if (role === "jammer") { g.moveTo(x, y - 6); g.lineTo(x + 6, y); g.lineTo(x, y + 6); g.lineTo(x - 6, y); g.closePath(); }
    else if (role === "origin") { g.rect(x - 4, y - 4, 8, 8); }
    else { g.arc(x, y, 5, 0, Math.PI * 2); }
    g.fillStyle = color || (role === "station" ? st.station : role === "jammer" ? st.jammer : st.sea);
    g.fill();
    g.strokeStyle = role === "receiver" || role === "origin" ? (color ? st.halo : st.site) : st.halo;
    g.lineWidth = role === "receiver" || role === "origin" ? 2 : 1.4;
    g.stroke();
    if (role === "receiver" && !color) { g.fillStyle = st.site; g.beginPath(); g.arc(x, y, 1.6, 0, Math.PI * 2); g.fill(); }
  }
  let landScale = "110m";
  function drawBase() {
    const g = base.getContext("2d");
    g.setTransform(dpr, 0, 0, dpr, 0, 0);
    g.fillStyle = st.sea; g.fillRect(0, 0, W, H);
    drawGraticule(g);
    landScale = drawLand(g) || landScale;
    if (!M) return;
    drawAreas(g);
    drawRoutes(g);
    projectTrack();
    drawTrack(g);
    drawSites(g);
    // scale bar at the view's centre latitude, the projection and the source
    const [, lat] = unproject(V, W, H, W / 2, H / 2);
    const sb = scaleBar(metresPerPixel(lat, V.zoom), 120);
    scaleBarEl.style.width = `${Math.max(1, Math.round(sb.px))}px`;
    scaleText.textContent = sb.text;
    attr.textContent = t("js-desk-map-attr", "{ $proj } · coastlines Natural Earth { $scale }", { proj: PROJECTION_NAME, scale: landScale });
  }
  // ---------- top layer
  let nowKey = "";
  function drawNow() {
    if (!readout || !M || !C) { now.hidden = true; return; }
    const rows = [{ k: t("js-desk-map-time", "time"), v: clockText(C.t, { epochMs: M.epochMs }) }, ...readout(C.t).slice(0, 5)];
    const key = rows.map((r) => r.k).join("|");
    if (key !== nowKey) {
      nowKey = key;
      now.replaceChildren(...rows.flatMap((r) => [el("dt", "", r.k), el("dd")]));
    }
    const dds = now.querySelectorAll("dd");
    rows.forEach((r, i) => {
      const v = typeof r.v === "number" ? `${valueText(r.v)}${r.unit ? ` ${r.unit}` : ""}` : String(r.v);
      if (dds[i].textContent !== v) dds[i].textContent = v;
      const cls = r.state ? `state-${r.state}` : "";
      if (dds[i].className !== cls) dds[i].className = cls;
    });
    now.hidden = false;
  }
  function drawOver() {
    drawNow();
    const g = over.getContext("2d");
    g.setTransform(dpr, 0, 0, dpr, 0, 0);
    g.clearRect(0, 0, W, H);
    if (!M || !C) return;
    const tr = M.track;
    if (tr && TX.length) {
      const [i0, i1] = rangeIdx();
      const ic = Math.min(i1, indexAtOrBefore(tr.t, C.t));
      if (ic > i0) strokeTrack(g, i0, ic, 3.2, (i) => TC[i]);
      for (const m of C.marks) {
        const p = positionAt(tr, m.t);
        if (!p) continue;
        const [x, y] = project(V, W, H, p.lon, p.lat);
        g.fillStyle = st.mark; g.strokeStyle = st.halo; g.lineWidth = 1.5;
        g.beginPath(); g.moveTo(x, y); g.lineTo(x, y - 14); g.lineTo(x + 8, y - 11); g.lineTo(x, y - 8); g.stroke(); g.fill();
        g.beginPath(); g.moveTo(x, y); g.lineTo(x, y - 14); g.strokeStyle = st.mark; g.stroke();
      }
      const p = positionAt(tr, C.t);
      if (p) {
        const [x, y] = project(V, W, H, p.lon, p.lat);
        const q = tr.q[indexAtOrBefore(tr.t, C.t)];
        g.fillStyle = trackColor(st, tr.kind, q); g.strokeStyle = st.cursor; g.lineWidth = 2;
        g.beginPath(); g.arc(x, y, 6.5, 0, Math.PI * 2); g.fill(); g.stroke();
        g.strokeStyle = st.halo; g.lineWidth = 1; g.beginPath(); g.arc(x, y, 8.5, 0, Math.PI * 2); g.stroke();
      }
    }
    // A fixed receiver of a run with epochs shows whether a fix is held at the cursor.
    if (!tr && M.epochs && typeof M.epochs[0].tracking === "number") {
      const e = M.epochs[indexAtOrBefore(M.epochTimes, C.t)];
      for (const s of M.sites) if (s.role === "receiver" && e) {
        const [x, y] = project(V, W, H, s.lon, s.lat);
        const ok = e.tracking >= 4;
        g.beginPath(); g.arc(x, y, 9, 0, Math.PI * 2);
        g.strokeStyle = ok ? st.trusted : st.untrusted; g.lineWidth = 2.5; g.stroke();
        label(g, ok ? t("js-desk-map-fix", "fix held · { $n } tracking", { n: e.tracking }) : t("js-desk-map-nofix", "fix lost · { $n } tracking", { n: e.tracking }), x + 12, y + 16, ok ? st.trusted : st.untrusted);
      }
    }
    // Satellites (sub-satellite points) at the cursor.
    const sats = M.movers.filter((m) => m.role === "satellite" && !(tr && m.id === "satellite" && M.movers.length === 1));
    for (const m of sats) {
      const p = positionAt(m, C.t);
      if (!p) continue;
      const [x, y] = project(V, W, H, p.lon, p.lat);
      if (x < -10 || x > W + 10 || y < -10 || y > H + 10) continue;
      g.fillStyle = st.satellite; g.strokeStyle = st.halo; g.lineWidth = 1.2;
      g.beginPath(); g.rect(x - 3, y - 3, 6, 6); g.fill(); g.stroke();
      if (sats.length <= 30) { g.font = `10px ${st.mono}`; g.fillStyle = st.satellite; g.fillText(m.id, x + 5, y - 4); }
    }
  }
  function drawLegend() {
    const items = [];
    const sw = (c, dash) => { const i = el("i"); i.style.background = c; if (dash) i.className = "dash"; return i; };
    const row = (c, text, dash) => { const s = el("span"); s.append(sw(c, dash), document.createTextNode(text)); items.push(s); };
    if (M && M.track) {
      if (M.track.kind === "trust") { row(st.trusted, t("js-desk-map-trusted", "trusted")); row(st.degraded, t("js-desk-map-degraded", "degraded")); row(st.untrusted, t("js-desk-map-untrusted", "not trusted")); }
      else if (M.track.kind === "visible") { row(st.visible, t("js-desk-map-in-view", "in view of the station")); row(st.hidden, t("js-desk-map-out-view", "not in view")); }
      else row(st.track, t("js-desk-map-track", "track"));
    }
    if (M && M.areas.length) {
      row(st.areaFill, t("js-desk-map-area-inner", "every satellite lost"));
      row(st.areaBand, t("js-desk-map-area-outer", "tracking starts to fail (uncertainty band)"), true);
    }
    if (M && M.movers.some((m) => m.role === "satellite") && !(M.track && M.movers.length === 1)) row(st.satellite, t("js-desk-map-sats", "satellites (sub-satellite points)"));
    legend.replaceChildren(...items);
    legend.hidden = !items.length;
  }
  function drawAll() { drawBase(); drawOver(); }

  // ---------- interaction
  let drag = null;
  const pos = (e) => { const r = over.getBoundingClientRect(); return [e.clientX - r.left, e.clientY - r.top]; };
  over.addEventListener("pointerdown", (e) => {
    if (e.button !== 0) return;
    try { over.setPointerCapture(e.pointerId); } catch { /* a synthetic pointer */ }
    const [x, y] = pos(e);
    drag = { x, y, x0: x, y0: y, moved: false };
  });
  over.addEventListener("pointermove", (e) => {
    const [x, y] = pos(e);
    if (drag) {
      if (!drag.moved && Math.hypot(x - drag.x0, y - drag.y0) > 3) drag.moved = true;
      if (drag.moved) { V = panBy(V, x - drag.x, y - drag.y); drag.x = x; drag.y = y; drawAll(); }
    }
    showHover(x, y);
  });
  over.addEventListener("pointerup", (e) => {
    if (!drag) return;
    const d = drag; drag = null;
    if (d.moved) return;
    const [x, y] = pos(e);
    const i = M && M.track ? nearestPoint(TX, TY, x, y, 8) : -1;
    if (i >= 0 && ctl.onMark) ctl.onMark(M.track.t[i]);
  });
  over.addEventListener("pointerleave", () => { hover.hidden = true; });
  over.addEventListener("wheel", (e) => {
    e.preventDefault();
    const [x, y] = pos(e);
    zoomBy(Math.exp(-e.deltaY * (e.deltaMode === 1 ? 0.05 : 0.0018)), x, y);
  }, { passive: false });
  over.addEventListener("dblclick", (e) => { const [x, y] = pos(e); zoomBy(2, x, y); });
  over.addEventListener("keydown", (e) => {
    if (e.ctrlKey || e.metaKey || e.altKey) return;
    if (e.key === "+" || e.key === "=") { e.preventDefault(); zoomBy(2); }
    else if (e.key === "-" || e.key === "_") { e.preventDefault(); zoomBy(0.5); }
    else if (e.key === "0") { e.preventDefault(); ctl.fit(); }
  });
  function showHover(x, y) {
    const [lon, lat] = unproject(V, W, H, x, y);
    let s = latLonText(lat, lon);
    const i = M && M.track ? nearestPoint(TX, TY, x, y, 8) : -1;
    if (i >= 0) s += ` · ${clockText(M.track.t[i], { epochMs: M.epochMs })} · ${t("js-desk-map-click-mark", "click to mark")}`;
    hover.textContent = s;
    hover.hidden = false;
    over.style.cursor = i >= 0 ? "pointer" : drag && drag.moved ? "grabbing" : "grab";
  }

  const ro = typeof ResizeObserver === "function" ? new ResizeObserver(() => { size(); if (!fitted && W > 20 && H > 20) { fitted = true; ctl.fit(); return; } drawAll(); }) : null;
  if (ro) ro.observe(root);
  let rangeKey = "";
  ctl.setModel = (m) => { M = m; size(); fitted = W > 20 && H > 20; if (fitted) ctl.fit(); else drawAll(); drawLegend(); syncStyle(); };
  ctl.setClock = (snap) => {
    C = snap;
    const k = snap.range ? `${snap.range[0]},${snap.range[1]}` : "";
    if (k !== rangeKey) { rangeKey = k; drawBase(); }
    drawOver();
  };
  function syncStyle() { for (const b of styleBtns) b.setAttribute("aria-pressed", b.dataset.style === styleName() ? "true" : "false"); }
  ctl.restyle = () => { st = style(); syncStyle(); drawAll(); drawLegend(); };
  ctl.resize = () => { size(); drawAll(); };
  ctl.destroy = () => { if (ro) ro.disconnect(); };
  Object.defineProperty(ctl, "view", { get: () => ({ ...V }) });
  return ctl;
}
