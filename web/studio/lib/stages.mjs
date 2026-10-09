// SPDX-License-Identifier: AGPL-3.0-only
// Stage drawings for the newer scenario kinds: the spectrum waterfall, the solar-system plan
// view, the constellation coverage map, the campaign mission timeline, the end-to-end chain,
// a Monte Carlo histogram and a map of a GeoJSON export. Pure: each builder takes the engine's
// result document (or a file the engine wrote) and returns SVG text or a plain model. Every
// number drawn is read from that document; the scale a drawing uses (square-root distance,
// colour ramp) is stated in its labels. Tested in stages.test.mjs against real engine output.
import { esc, fmt, niceTicks, heat, humanKey, SERIES_COLORS } from "./views.mjs";
import { own } from "./own.mjs";

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const AU_M = 149597870700; // the astronomical unit, exact by definition (IAU 2012 Resolution B2)

// ---------------------------------------------------------------- spectrum waterfall

// Perceptual ramp, monotonic in lightness, on the dark chart ground (the same ramp as the Home
// page's L-band console).
const RAMP = ["#151C48", "#3B2F7A", "#3B528B", "#21918C", "#5EC962", "#FDE725"].map((h) => [1, 3, 5].map((i) => parseInt(h.slice(i, i + 2), 16)));
export const WF_GAMMA = 0.35; // spreads jammers a few dB above the floor across the ramp
export function wfColor(t) {
  const x = Math.max(0, Math.min(1, t)) * (RAMP.length - 1);
  const i = Math.min(RAMP.length - 2, Math.floor(x)), f = x - i;
  const c = RAMP[i].map((v, k) => Math.round(v + (RAMP[i + 1][k] - v) * f));
  return `rgb(${c[0]},${c[1]},${c[2]})`;
}

// Every waterfall a spectrum result carries: the whole-band one and one per extra panel.
// [{ id, name, path, freq, t, psd, fMin, fMax, floor, peak, rowS }]
export function waterfallFrames(result) {
  const out = [];
  const floor0 = result && result.receiver && isNum(result.receiver.noise_density_dbw_per_hz) ? result.receiver.noise_density_dbw_per_hz : null;
  const add = (w, id, name, path) => {
    if (!w || !Array.isArray(w.psd_dbw_per_hz) || !w.psd_dbw_per_hz.length || !Array.isArray(w.freq_hz)) return;
    const flat = w.psd_dbw_per_hz.flat().filter(isNum);
    const floor = isNum(w.noise_floor_dbw_per_hz) ? w.noise_floor_dbw_per_hz : floor0 !== null ? floor0 : Math.min(...flat);
    out.push({ id, name, path, freq: w.freq_hz, t: w.t_s, psd: w.psd_dbw_per_hz, fMin: w.f_min_hz, fMax: w.f_max_hz, floor, peak: isNum(w.peak_dbw_per_hz) ? w.peak_dbw_per_hz : Math.max(...flat), rowS: w.row_duration_s });
  };
  if (!result) return out;
  add(result.waterfall, "band", "Whole band", "waterfall");
  (result.panels || []).forEach((p, i) => add(p, `panel-${i}`, p.name || `Panel ${i + 1}`, `panels[${i}]`));
  return out;
}

// Waterfall: frequency across, time down, colour for power above the noise floor.
// Returns { svg, geo } where geo = { W, H, ml, mt, pw, ph, nF, nT, cw, rh } lets the page map a
// pointer to a cell and move the replay curtain (rect.wf-curtain) and cursor (line.wf-cursor).
export function waterfallSvg(frame, opts = {}) {
  const W = opts.w || 760, ml = 56, mr = 16, mt = 30, mb = 42;
  const nT = frame.psd.length, nF = frame.freq.length;
  const rh = Math.max(3, Math.min(9, 300 / nT));
  const pw = W - ml - mr, ph = rh * nT, H = mt + ph + mb;
  const cw = pw / nF;
  const span = frame.peak - frame.floor || 1;
  const level = (v) => Math.round(Math.pow(Math.max(0, Math.min(1, (v - frame.floor) / span)), WF_GAMMA) * 63);
  let s = `<svg class="chart wf" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="Waterfall of power spectral density: frequency across, time down" xmlns="http://www.w3.org/2000/svg">`;
  s += `<rect class="c-bg" width="${W}" height="${H}"/><g class="wf-cells" shape-rendering="crispEdges">`;
  // Adjacent cells of one colour level are drawn as one rectangle.
  for (let r = 0; r < nT; r++) {
    const row = frame.psd[r];
    let c0 = 0, lv = level(row[0]);
    for (let c = 1; c <= nF; c++) {
      const l = c < nF ? level(row[c]) : -1;
      if (l === lv) continue;
      s += `<rect x="${(ml + c0 * cw).toFixed(2)}" y="${(mt + r * rh).toFixed(2)}" width="${((c - c0) * cw + 0.3).toFixed(2)}" height="${(rh + 0.3).toFixed(2)}" fill="${wfColor(lv / 63)}"/>`;
      c0 = c; lv = l;
    }
  }
  s += `</g>`;
  const fx = (f) => ml + ((f - frame.fMin) / (frame.fMax - frame.fMin || 1)) * pw;
  for (const v of niceTicks(frame.fMin / 1e6, frame.fMax / 1e6, 7)) {
    const x = fx(v * 1e6);
    if (x < ml - 0.5 || x > W - mr + 0.5) continue;
    s += `<line class="c-tickm" x1="${x.toFixed(1)}" y1="${mt + ph}" x2="${x.toFixed(1)}" y2="${mt + ph + 4}"/><text class="c-tick" x="${x.toFixed(1)}" y="${mt + ph + 17}" text-anchor="middle">${esc(fmt(v, 5))}</text>`;
  }
  s += `<text class="c-axis" x="${ml + pw / 2}" y="${H - 6}" text-anchor="middle">frequency (MHz)</text>`;
  const t0 = frame.t[0], t1 = frame.t[nT - 1] + (frame.rowS || 0);
  for (const v of niceTicks(t0, t1, 6)) {
    const y = mt + ((v - t0) / (t1 - t0 || 1)) * ph;
    if (y > mt + ph + 0.5) continue;
    s += `<text class="c-tick" x="${ml - 8}" y="${(y + 4).toFixed(1)}" text-anchor="end">${esc(fmt(v))}</text>`;
  }
  s += `<text class="c-axis" x="14" y="${mt + ph / 2}" text-anchor="middle" transform="rotate(-90 14 ${mt + ph / 2})">time (s)</text>`;
  // Carrier of each band inside this frame: a tick on the top edge, named where there is room.
  let lastX = -1e9;
  for (const b of (opts.bands || []).filter((b) => b.centre_hz >= frame.fMin && b.centre_hz <= frame.fMax).sort((a, b) => a.centre_hz - b.centre_hz)) {
    const x = fx(b.centre_hz);
    s += `<path class="wf-band" d="M${(x - 4).toFixed(1)} ${mt - 7}h8l-4 6z"><title>${esc(b.name)} carrier, ${esc(fmt(b.centre_hz / 1e6, 6))} MHz</title></path>`;
    const w = String(b.name).length * 6.1;
    if (x - w / 2 > lastX + 6 && x - w / 2 >= ml - 2 && x + w / 2 <= W - 2) { s += `<text class="c-note wf-name" x="${x.toFixed(1)}" y="${mt - 12}" text-anchor="middle">${esc(b.name)}</text>`; lastX = x + w / 2; }
  }
  s += `<rect class="wf-curtain" x="${ml}" y="${mt + ph}" width="${pw}" height="0"/><line class="wf-cursor" x1="${ml}" y1="${mt}" x2="${W - mr}" y2="${mt}" visibility="hidden"/></svg>`;
  return { svg: s, geo: { W, H, ml, mt, pw, ph, nF, nT, cw, rh } };
}

// The spectrum along one row of the waterfall, as a line-chart model (views.lineChartSvg).
export function spectrumSlice(frame, k) {
  const row = frame.psd[Math.max(0, Math.min(frame.psd.length - 1, k))];
  return {
    title: `Power spectral density at t = ${fmt(frame.t[k])} s`,
    series: [{ label: `spectrum at t = ${fmt(frame.t[k])} s`, color: "var(--s-nav)", points: frame.freq.map((f, i) => [f / 1e6, row[i]]) }],
    xLabel: "frequency (MHz)", yLabel: "power spectral density (dBW/Hz)", unit: "dBW/Hz", xName: "f", xUnit: "MHz",
    threshold: frame.floor, thresholdLabel: "noise floor", outages: [],
  };
}

// Index of the entry of a sorted time list nearest to t.
export function nearestIndex(times, t) {
  let best = 0;
  for (let i = 1; i < times.length; i++) if (Math.abs(times[i] - t) < Math.abs(times[best] - t)) best = i;
  return best;
}

// ---------------------------------------------------------------- solar system plan view

// The views a solar-system result supports: the planets, the inner planets, and one per body
// that has moons. [{ id, label }]
export function orreryViews(result) {
  const bodies = (result && result.bodies) || [];
  const out = [{ id: "planets", label: "All planets" }];
  if (bodies.filter((b) => b.parent === "Sun" && b.heliocentric_distance_au <= 2).length > 1) out.push({ id: "inner", label: "Inner planets" });
  for (const b of bodies) if (bodies.some((m) => m.parent === b.name && b.name !== "Sun")) out.push({ id: `moons:${b.name}`, label: `${b.name} and its moons` });
  return out;
}

// Plan view in the frame's own x-y plane (the ICRF equator), seen from its north pole.
// "planets" uses a square-root distance scale (stated on the drawing) so Mercury and Pluto both
// fit; "inner" and the moon systems are linear. Returns { svg, shown:[{name, path}] }.
export function orrerySvg(result, opts = {}) {
  const bodies = (result && result.bodies) || [];
  const view = opts.view || "planets";
  const W = opts.w || 760, H = 560, cx = W / 2, cy = H / 2 + 6, R = Math.min(W, H) / 2 - 46;
  let items, scale, centreName, rings = [], scaleNote, unit;
  if (view.startsWith("moons:")) {
    centreName = view.slice(6);
    items = bodies.map((b, i) => ({ b, i })).filter((o) => o.b.parent === centreName).map((o) => ({ ...o, pos: o.b.parent_relative_position_m, track: o.b.track_frame === "parent-centred" ? o.b.track_m : null }));
    const max = Math.max(...items.flatMap((o) => [Math.hypot(o.pos[0], o.pos[1]), ...(o.track || []).map((p) => Math.hypot(p[0], p[1]))]));
    scale = (d) => (d / max) * R;
    const stepKm = niceTicks(0, max / 1e3, 3).filter((v) => v > 0);
    rings = stepKm.map((km) => ({ r: scale(km * 1e3), label: `${fmt(km, 6)} km` }));
    scaleNote = "linear scale"; unit = "km";
  } else {
    centreName = "Sun";
    const lim = view === "inner" ? 2 : Infinity;
    items = bodies.map((b, i) => ({ b, i })).filter((o) => o.b.parent === "Sun" && o.b.heliocentric_distance_au <= lim).map((o) => ({ ...o, pos: o.b.position_m, track: o.b.track_frame === "heliocentric" ? o.b.track_m : null }));
    const max = Math.max(...items.flatMap((o) => [Math.hypot(o.pos[0], o.pos[1]), ...(o.track || []).map((p) => Math.hypot(p[0], p[1]))])) / AU_M;
    if (view === "inner") { scale = (d) => (d / AU_M / max) * R; scaleNote = "linear scale"; rings = [0.5, 1, 1.5].filter((a) => a <= max).map((a) => ({ r: scale(a * AU_M), label: `${a} au` })); }
    else { scale = (d) => Math.sqrt(d / AU_M / max) * R; scaleNote = "square-root distance scale"; rings = [1, 5, 10, 20, 30].filter((a) => a <= max).map((a) => ({ r: scale(a * AU_M), label: `${a} au` })); }
    unit = "au";
  }
  const at = (p) => { const d = Math.hypot(p[0], p[1]); if (!d) return [cx, cy]; const r = scale(d); return [cx + (p[0] / d) * r, cy - (p[1] / d) * r]; };
  let s = `<svg class="chart orrery" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="Plan view of ${esc(centreName)} and the bodies around it, ${esc(scaleNote)}" xmlns="http://www.w3.org/2000/svg"><rect class="c-bg" width="${W}" height="${H}"/>`;
  // Text already placed, as boxes [x0, y0, x1, y1]: a later label moves or is left out rather than sit on one.
  const boxes = [[cx - 9, cy - 9, cx + 9, cy + 9], ...items.map((o) => { const [x, y] = at(o.pos); return [x - 6, y - 6, x + 6, y + 6]; })];
  const hit = (b) => boxes.some((a) => b[0] < a[2] && b[2] > a[0] && b[1] < a[3] && b[3] > a[1]);
  // The centre's name goes where no body sits on it.
  let centreLabel = "";
  { const w = centreName.length * 6.6 + 4;
    for (const [dx, dy, anchor] of [[11, 4, "start"], [-11, 4, "end"], [0, -13, "middle"], [0, 21, "middle"]]) {
      const x0 = anchor === "start" ? cx + dx : anchor === "end" ? cx + dx - w : cx - w / 2;
      const box = [x0 - 1, cy + dy - 11, x0 + w + 1, cy + dy + 4];
      if (hit(box)) continue;
      boxes.push(box);
      centreLabel = `<text class="or-name" x="${cx + dx}" y="${cy + dy}" text-anchor="${anchor}">${esc(centreName)}</text>`;
      break;
    } }
  for (const g of rings) {
    s += `<circle class="c-grid or-ring" cx="${cx}" cy="${cy}" r="${g.r.toFixed(1)}" fill="none"/>`;
    const x = cx + g.r * 0.7071 + 3, y = cy + g.r * 0.7071 + 10, box = [x - 1, y - 10, x + g.label.length * 6.4 + 2, y + 3];
    if (hit(box) || box[2] > W - 2 || box[3] > H - 22) continue;
    boxes.push(box);
    s += `<text class="c-tick" x="${x.toFixed(1)}" y="${y.toFixed(1)}">${esc(g.label)}</text>`;
  }
  items.forEach((o, k) => {
    if (o.track && o.track.length > 1) s += `<polyline class="or-track" style="stroke:${SERIES_COLORS[k % SERIES_COLORS.length]}" points="${o.track.map((p) => at(p).map((v) => v.toFixed(1)).join(",")).join(" ")}"/>`;
  });
  // Links between two bodies both on this drawing, with the engine's one-way light time.
  const posOf = new Map(items.map((o) => [o.b.name, at(o.pos)]));
  posOf.set(centreName, [cx, cy]);
  const shown = [];
  (result.links || []).forEach((l, i) => {
    const a = posOf.get(l.from), b = posOf.get(l.to);
    if (!a || !b) return;
    s += `<line class="or-link" x1="${a[0].toFixed(1)}" y1="${a[1].toFixed(1)}" x2="${b[0].toFixed(1)}" y2="${b[1].toFixed(1)}"><title>${esc(l.from)} to ${esc(l.to)}: one-way light time ${esc(fmt(l.one_way_light_time_s, 5))} s</title></line>`;
    shown.push({ name: `${l.from} to ${l.to}`, path: `links[${i}]` });
  });
  s += `<circle class="or-centre" cx="${cx}" cy="${cy}" r="${centreName === "Sun" ? 6 : 8}"/>${centreLabel}`;
  items.forEach((o, k) => {
    const [x, y] = at(o.pos);
    const c = SERIES_COLORS[k % SERIES_COLORS.length];
    const dist = unit === "au" ? `${fmt(o.b.heliocentric_distance_au, 4)} au from the Sun` : `${fmt(Math.hypot(...o.pos) / 1e3, 6)} km from ${centreName}`;
    s += `<circle class="or-body" cx="${x.toFixed(1)}" cy="${y.toFixed(1)}" r="4.5" style="fill:${c}"><title>${esc(o.b.name)}: ${esc(dist)}</title></circle>`;
    const w = o.b.name.length * 6.6 + 4;
    for (const [dx, dy, anchor] of [[8, 4, "start"], [-8, 4, "end"], [0, -9, "middle"], [0, 17, "middle"]]) {
      const x0 = anchor === "start" ? x + dx : anchor === "end" ? x + dx - w : x - w / 2;
      const box = [x0 - 1, y + dy - 11, x0 + w + 1, y + dy + 4];
      if (hit(box) || box[0] < 2 || box[2] > W - 2 || box[3] > H - 22) continue;
      boxes.push(box);
      s += `<text class="or-name" x="${(x + dx).toFixed(1)}" y="${(y + dy).toFixed(1)}" text-anchor="${anchor}">${esc(o.b.name)}</text>`;
      break;
    }
    shown.push({ name: o.b.name, path: `bodies[${o.i}]` });
  });
  s += `<text class="c-note" x="12" y="${H - 12}">${esc(scaleNote)} · frame x-y plane, seen from its north pole</text></svg>`;
  return { svg: s, shown };
}

// ---------------------------------------------------------------- constellation coverage map

const LOWER_BETTER = /dop/;
// The gridded fields a constellation-design result carries: [{ key, label, lowerBetter }].
export function coverageFields(result) {
  const g = (result && result.grid) || {};
  const order = ["mean_pdop", "availability_pct", "mean_visible", "min_visible", "max_pdop", "fix_pct", "mean_gdop", "mean_hdop", "mean_vdop", "max_visible"];
  return Object.keys(g).filter((k) => Array.isArray(g[k]) && Array.isArray(g[k][0])).sort((a, b) => (order.indexOf(a) + 99) % 99 - (order.indexOf(b) + 99) % 99)
    .map((k) => ({ key: k, label: humanKey(k).replace(/\s*\([^)]*\)$/, "").replace(/ pct$/i, ""), unit: /pct$/.test(k) ? "%" : "", lowerBetter: LOWER_BETTER.test(k) }));
}

// Equirectangular map of one gridded field over the central body, with the satellites at
// track step k and the trail they flew to get there. opts.land draws coastlines (Earth only).
// Returns { svg, range:[lo,hi], shownSats }.
export function coverageSvg(result, opts = {}) {
  const g = result.grid, fields = coverageFields(result);
  const f = fields.find((x) => x.key === opts.field) || fields[0];
  const lat = g.lat_deg, lon = g.lon_deg, cells = g[f.key];
  const W = opts.w || 760, ml = 44, mr = 14, mt = 14, mb = 40, pw = W - ml - mr, ph = pw / 2, H = mt + ph + mb;
  const dLon = lon.length > 1 ? Math.abs(lon[1] - lon[0]) : 360, dLat = lat.length > 1 ? Math.abs(lat[1] - lat[0]) : 180;
  const px = (l) => ml + ((l + 180) / 360) * pw, py = (l) => mt + ((90 - l) / 180) * ph;
  const vals = cells.flat().filter(isNum);
  const lo = Math.min(...vals), hi = Math.max(...vals);
  let s = `<svg class="chart cov" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="${esc(f.label)} over ${esc((result.body && result.body.name) || "the body")}, by latitude and longitude" xmlns="http://www.w3.org/2000/svg"><rect class="c-bg" width="${W}" height="${H}"/><g shape-rendering="crispEdges">`;
  lat.forEach((la, i) => lon.forEach((lo_, j) => {
    const v = cells[i][j];
    if (!isNum(v)) return;
    const t = hi > lo ? (v - lo) / (hi - lo) : 1;
    s += `<rect x="${px(lo_ - dLon / 2).toFixed(1)}" y="${py(la + dLat / 2).toFixed(1)}" width="${((dLon / 360) * pw + 0.4).toFixed(1)}" height="${((dLat / 180) * ph + 0.4).toFixed(1)}" style="fill:${heat(f.lowerBetter ? 1 - t : t)}" fill-opacity=".78"><title>lat ${esc(fmt(la))}°, lon ${esc(fmt(lo_))}° · ${esc(f.label)} ${esc(fmt(v, 4))}${esc(f.unit)}</title></rect>`;
  }));
  s += `</g>`;
  for (const ring of opts.land || []) s += `<polyline class="c-land cov-land" points="${ring.map(([a, b]) => `${px(a).toFixed(1)},${py(b).toFixed(1)}`).join(" ")}"/>`;
  for (let l = -180; l <= 180; l += 60) s += `<line class="c-grid" x1="${px(l).toFixed(1)}" y1="${mt}" x2="${px(l).toFixed(1)}" y2="${mt + ph}"/><text class="c-tick" x="${px(l).toFixed(1)}" y="${mt + ph + 15}" text-anchor="middle">${l}°</text>`;
  for (let l = -90; l <= 90; l += 30) s += `<line class="c-grid" x1="${ml}" y1="${py(l).toFixed(1)}" x2="${ml + pw}" y2="${py(l).toFixed(1)}"/>${Math.abs(l) < 90 ? `<text class="c-tick" x="${ml - 6}" y="${(py(l) + 4).toFixed(1)}" text-anchor="end">${l}°</text>` : ""}`;
  s += `<text class="c-axis" x="${ml + pw / 2}" y="${H - 6}" text-anchor="middle">longitude · latitude up the side</text>`;
  const tr = result.tracks;
  let shownSats = 0;
  if (tr && Array.isArray(tr.satellites) && tr.satellites.length) {
    const n = tr.times_s.length, k = Math.max(0, Math.min(n - 1, opts.k ?? n - 1));
    const names = [...new Set(tr.satellites.map((x) => x.constellation))];
    const tail = 3;
    for (const sat of tr.satellites) {
      const c = SERIES_COLORS[names.indexOf(sat.constellation) % SERIES_COLORS.length];
      let seg = [];
      const flush = () => { if (seg.length > 1) s += `<polyline class="cov-trail" style="stroke:${c}" points="${seg.join(" ")}"/>`; seg = []; };
      for (let i = Math.max(0, k - tail); i <= k; i++) {
        if (i > Math.max(0, k - tail) && Math.abs(sat.lon_deg[i] - sat.lon_deg[i - 1]) > 180) flush();
        seg.push(`${px(sat.lon_deg[i]).toFixed(1)},${py(sat.lat_deg[i]).toFixed(1)}`);
      }
      flush();
      s += `<circle class="cov-sat" cx="${px(sat.lon_deg[k]).toFixed(1)}" cy="${py(sat.lat_deg[k]).toFixed(1)}" r="2.6" style="fill:${c}"><title>${esc(sat.constellation)} ${esc(sat.id)} · lat ${esc(fmt(sat.lat_deg[k]))}°, lon ${esc(fmt(sat.lon_deg[k]))}°</title></circle>`;
      shownSats++;
    }
  }
  s += `</svg>`;
  return { svg: s, range: [lo, hi], field: f, shownSats };
}

// Constellation names in the order the map colours them: [{ name, color }].
export function coverageLegend(result) {
  const sats = (result.tracks && result.tracks.satellites) || [];
  return [...new Set(sats.map((x) => x.constellation))].map((name, i) => ({ name, color: SERIES_COLORS[i % SERIES_COLORS.length] }));
}

// ---------------------------------------------------------------- campaign mission timeline

const LIMIT = /guard|floor|limit|threshold/;
const UNIT_ORDER = ["ns", "dB-Hz", "m", "count", "1"];
const UNIT_TITLE = { ns: "Time error", "dB-Hz": "Carrier-to-noise density", m: "Position and protection", count: "Satellites", 1: "Alarm" };
// One chart per unit of the campaign's channels, all on the mission time axis, with the phases
// as named bands and the events as rules. [{ unit, title, keys, model, opts }]
export function timelineCharts(result) {
  const tl = result && result.timeline;
  if (!tl || !tl.channels || !Array.isArray(tl.t_s)) return [];
  const byUnit = new Map();
  for (const [key, ch] of Object.entries(tl.channels)) {
    if (!Array.isArray(ch.values) || ch.values.filter(isNum).length < 1) continue;
    if (!byUnit.has(ch.unit)) byUnit.set(ch.unit, []);
    byUnit.get(ch.unit).push(key);
  }
  const bands = (tl.phases || []).map((p) => ({ x0: p.t0_s, x1: p.t1_s, label: p.name }));
  const vlines = (tl.events || []).map((e) => ({ x: e.t_s, label: e.label, alarm: !!e.alarm }));
  const units = [...byUnit.keys()].sort((a, b) => (UNIT_ORDER.indexOf(a) + 99) % 99 - (UNIT_ORDER.indexOf(b) + 99) % 99);
  return units.map((unit) => {
    const keys = byUnit.get(unit).sort((a, b) => LIMIT.test(a) - LIMIT.test(b));
    let n = 0;
    const series = keys.map((key) => {
      const lim = LIMIT.test(key);
      return { label: humanKey(key).replace(/\s*\([^)]*\)$/, ""), color: lim ? "var(--s-int)" : SERIES_COLORS[n++ % SERIES_COLORS.length], dash: lim, points: tl.t_s.map((t, i) => [t, tl.channels[key].values[i]]), key };
    });
    const u = unit === "1" || unit === "count" ? "" : unit;
    return { unit, title: UNIT_TITLE[unit] || unit, keys, model: { title: UNIT_TITLE[unit] || unit, series, xLabel: "mission time (s)", yLabel: u || (unit === "count" ? "satellites" : "flag"), unit: u, outages: [] }, opts: { bands, vlines, h: 230 } };
  });
}

// The phase a mission time falls in: index into timeline.phases, or -1.
export function phaseAt(result, t) {
  const ph = (result.timeline && result.timeline.phases) || [];
  for (let i = ph.length - 1; i >= 0; i--) if (t >= ph[i].t0_s) return i;
  return -1;
}

// ---------------------------------------------------------------- end-to-end chain

const CHAIN_ITEMS = {
  "leo-signal": ["signal.design", "signal.centre_hz", "signal.tx_bandwidth_hz", "signal.tracked_share"],
  "leo-pass": ["pass.peak_tracked_cn0_dbhz", "pass.max_elevation_deg", "pass.duration_above_mask_s", "pass.median_code_jitter_m"],
  "leo-navmsg": ["navmsg.model", "navmsg.sisre_rms_m", "navmsg.fit_interval_s"],
  "leo-pvt": ["fusion.gnss.rms_error_3d_m", "fusion.fused.rms_error_3d_m", "fusion.fraction_epochs_with_leo"],
  "leo-ppp": ["ppp.cases[0].median_convergence_min", "ppp.cases[-1].median_convergence_min"],
};
const CHAIN_NAME = { "leo-signal": "Signal design", "leo-pass": "Pass and link", "leo-navmsg": "Navigation message", "leo-pvt": "Fused positioning", "leo-ppp": "Precise point positioning" };
const get = (obj, path) => { let v = obj; for (const m of String(path).matchAll(/[^.[\]]+|\[(-?\d+)\]/g)) { if (v === null || v === undefined) return undefined; v = m[1] !== undefined ? v[Number(m[1]) < 0 ? v.length + Number(m[1]) : Number(m[1])] : v[m[0]]; } return v; };
// The chain's stages in hand-off order, each with the paths of its headline figures and the
// number of values it hands on: [{ kind, name, items:[path], out }]
export function chainModel(result) {
  const order = [];
  for (const h of (result && result.handoffs) || []) for (const k of [h.from, h.to]) if (!order.includes(k)) order.push(k);
  return order.map((kind) => ({
    kind, name: own(CHAIN_NAME, kind) || kind,
    items: (own(CHAIN_ITEMS, kind) || []).map((p) => {
      // A negative index is written out, so the page shows the path the value really has.
      const m = p.match(/^(.*)\[-1\](.*)$/);
      if (m) { const arr = get(result, m[1]); return Array.isArray(arr) && arr.length > 1 ? `${m[1]}[${arr.length - 1}]${m[2]}` : null; }
      return p;
    }).filter((p) => p && get(result, p) !== undefined && get(result, p) !== null),
    out: result.handoffs.filter((h) => h.from === kind).length,
  }));
}

// ---------------------------------------------------------------- histogram (Monte Carlo)

// Histogram of a sample list with labelled marks (percentiles). The bin count follows the
// sample size (square-root rule, 8 to 40 bins); each bar's title gives its range and count.
export function histogramSvg(samples, opts = {}) {
  const v = (samples || []).filter(isNum);
  if (v.length < 2) return { svg: "", bins: [] };
  const W = opts.w || 760, H = opts.h || 260, ml = 56, mr = 18, mt = 24, mb = 44;
  const lo = Math.min(...v), hi = Math.max(...v);
  const n = Math.max(8, Math.min(40, Math.round(Math.sqrt(v.length))));
  const bw = (hi - lo || 1) / n;
  const bins = Array.from({ length: n }, (_, i) => ({ x0: lo + i * bw, x1: lo + (i + 1) * bw, count: 0 }));
  for (const x of v) bins[Math.min(n - 1, Math.floor((x - lo) / bw))].count++;
  const top = Math.max(...bins.map((b) => b.count));
  const px = (x) => ml + ((x - lo) / (hi - lo || 1)) * (W - ml - mr), py = (c) => mt + (1 - c / top) * (H - mt - mb);
  let s = `<svg class="chart hist" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="${esc(opts.title || "Histogram")}" xmlns="http://www.w3.org/2000/svg"><rect class="c-bg" width="${W}" height="${H}"/>`;
  for (const t of niceTicks(0, top, 4)) s += `<line class="c-grid" x1="${ml}" y1="${py(t).toFixed(1)}" x2="${W - mr}" y2="${py(t).toFixed(1)}"/><text class="c-tick" x="${ml - 8}" y="${(py(t) + 4).toFixed(1)}" text-anchor="end">${esc(fmt(t))}</text>`;
  for (const b of bins) s += `<rect class="h-bar" x="${(px(b.x0) + 0.5).toFixed(1)}" y="${py(b.count).toFixed(1)}" width="${Math.max(0.5, px(b.x1) - px(b.x0) - 1).toFixed(1)}" height="${(py(0) - py(b.count)).toFixed(1)}"><title>${esc(fmt(b.x0, 4))} to ${esc(fmt(b.x1, 4))}${opts.unit ? " " + esc(opts.unit) : ""}: ${b.count} runs</title></rect>`;
  for (const t of niceTicks(lo, hi, 6)) s += `<text class="c-tick" x="${px(t).toFixed(1)}" y="${H - mb + 16}" text-anchor="middle">${esc(fmt(t))}</text>`;
  let lastX = -1e9;
  for (const m of opts.marks || []) {
    if (!isNum(m.value) || m.value < lo || m.value > hi) continue;
    const x = px(m.value);
    s += `<line class="c-thr" x1="${x.toFixed(1)}" y1="${mt - 6}" x2="${x.toFixed(1)}" y2="${H - mb}"/>`;
    if (x - lastX > 40) { s += `<text class="c-thr-t" x="${x.toFixed(1)}" y="${mt - 10}" text-anchor="middle">${esc(m.label)}</text>`; lastX = x; }
  }
  s += `<text class="c-axis" x="${ml + (W - ml - mr) / 2}" y="${H - 8}" text-anchor="middle">${esc(opts.xLabel || "")}</text><text class="c-axis" x="14" y="${mt + (H - mt - mb) / 2}" text-anchor="middle" transform="rotate(-90 14 ${mt + (H - mt - mb) / 2})">runs</text></svg>`;
  return { svg: s, bins };
}

// ---------------------------------------------------------------- GeoJSON export on a map

// Draws the LineString, MultiLineString and Point features of a GeoJSON export the engine wrote.
// Returns { svg, features } (features = how many were drawn), or null when there is none.
export function geojsonSvg(text, opts = {}) {
  let gj;
  try { gj = typeof text === "string" ? JSON.parse(text) : text; } catch { return null; }
  const feats = gj && gj.type === "FeatureCollection" && Array.isArray(gj.features) ? gj.features : [];
  const W = opts.w || 760, H = W / 2;
  const px = (lon) => ((lon + 180) / 360) * W, py = (lat) => ((90 - lat) / 180) * H;
  let s = `<svg class="chart" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="The GeoJSON export drawn on a map" xmlns="http://www.w3.org/2000/svg"><rect class="c-bg" width="${W}" height="${H}"/>`;
  for (let lon = -180; lon <= 180; lon += 30) s += `<line class="c-grid" x1="${px(lon)}" y1="0" x2="${px(lon)}" y2="${H}"/>`;
  for (let lat = -90; lat <= 90; lat += 30) s += `<line class="c-grid" x1="0" y1="${py(lat)}" x2="${W}" y2="${py(lat)}"/>`;
  for (const ring of opts.land || []) s += `<polyline class="c-land" points="${ring.map(([a, b]) => `${px(a).toFixed(1)},${py(b).toFixed(1)}`).join(" ")}"/>`;
  let drawn = 0;
  const line = (coords, c, title) => {
    let seg = [], prev = null;
    const flush = () => { if (seg.length > 1) s += `<polyline class="gj-line" style="stroke:${c}" points="${seg.join(" ")}"><title>${esc(title)}</title></polyline>`; seg = []; };
    for (const p of coords) {
      if (!Array.isArray(p) || !isNum(p[0]) || !isNum(p[1])) continue;
      if (prev && Math.abs(p[0] - prev[0]) > 180) flush();
      seg.push(`${px(p[0]).toFixed(1)},${py(p[1]).toFixed(1)}`);
      prev = p;
    }
    flush();
  };
  feats.forEach((f, i) => {
    const g = f && f.geometry, name = (f.properties && (f.properties.name || f.properties.role)) || `feature ${i + 1}`;
    if (!g) return;
    const c = SERIES_COLORS[i % SERIES_COLORS.length];
    if (g.type === "LineString") { line(g.coordinates, c, name); drawn++; }
    else if (g.type === "MultiLineString") { for (const part of g.coordinates) line(part, c, name); drawn++; }
    else if (g.type === "Point" && isNum(g.coordinates[0])) { s += `<circle class="gj-pt" cx="${px(g.coordinates[0]).toFixed(1)}" cy="${py(g.coordinates[1]).toFixed(1)}" r="4"><title>${esc(name)}</title></circle>`; drawn++; }
  });
  s += `</svg>`;
  return drawn ? { svg: s, features: drawn, total: feats.length } : null;
}
