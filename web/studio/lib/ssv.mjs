// SPDX-License-Identifier: AGPL-3.0-only
// The "Space-user GNSS" page's reader and charts. It reads the engine's recorded result of a `gnss-ssv` scenario (the `json` field of
// recorded/<name>.json) in any of its four modes (shell, trajectory, navigation, formation) and draws what it holds as SVG markup. The
// result carries statistics per constellation and, for a trajectory, one decimated series of the combined count and the best C/N0: there
// is NO per-constellation time series and no ICG verdict in the result, so none is drawn; the comparison with the ICG booklet is the
// committed bar-level verdicts in ssv/icg-comparison.json (tools_ssv_icg.mjs), shown as "pre-registered comparison, run 1". Every number is
// copied from the result; the page only scales it. Pure; tested in ssv.test.mjs.

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const num = (x) => (isNum(x) ? x : null);
const arr = (x) => (Array.isArray(x) ? x : []);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
const f1 = (v) => (Math.round(v * 10) / 10).toString();
const f2 = (v) => (Math.round(v * 100) / 100).toString();
export const fmt = (v, d = 1) => (isNum(v) ? (Math.abs(v) >= 1e5 || (v !== 0 && Math.abs(v) < 1e-3) ? v.toExponential(2) : String(Math.round(v * 10 ** d) / 10 ** d)) : "n/a");

export const KIND = "gnss-ssv";
export const MODES = Object.freeze(["shell", "trajectory", "navigation", "formation"]);
export const SCENARIOS = Object.freeze([
  { id: "gnss-ssv-shell", title: "Shell at 36 000 km", blurb: "A spherical shell at geostationary height, sampled on a grid: how often does a spacecraft there hear at least one, and at least four, signals at 20 dB-Hz, on L1 and L5, for each constellation and all together?" },
  { id: "gnss-ssv-heo", title: "Highly elliptical orbit", blurb: "A highly elliptical orbit (apogee near 58 600 km) with a high-gain nadir and a zenith patch antenna and a parametric sidelobe model: signals in view, best C/N0, main lobe against sidelobe, dilution of precision and the signals that graze the atmosphere." },
  { id: "gnss-ssv-lunar-weak", title: "Lunar transfer, weak-signal receiver", blurb: "A lunar transfer trajectory with a receiver built to work at the weakest signals: what it needs to acquire and track, and how much of the trajectory it can use." },
  { id: "gnss-ssv-nav-lunar", title: "Onboard filter, lunar transfer", blurb: "An onboard navigation filter on a lunar transfer: its position error against the bound it states, below and above the GNSS satellites' own orbits." },
  { id: "gnss-ssv-formation-heo", title: "Formation, highly elliptical orbit", blurb: "A chief and a deputy a kilometre apart in a highly elliptical orbit: how well the filter knows their relative position, against what the two absolute fixes would give." },
]);

const stat = (s) => (s && typeof s === "object" ? { n: num(s.n), min: num(s.min), mean: num(s.mean), max: num(s.max) } : null);

// The recorded document -> { model } or { error }. A result of another kind or mode is refused.
export function readSsv(doc) {
  let j;
  try { j = typeof doc.json === "string" ? JSON.parse(doc.json) : doc.json; } catch (e) { return { error: `the result is not JSON (${e.message})` }; }
  if (!j || j.kind !== KIND) return { error: "this is not a gnss-ssv result" };
  if (!MODES.includes(j.mode)) return { error: `this gnss-ssv result has the mode "${esc(String(j.mode).slice(0, 30))}", which this page does not read` };
  const m = {
    mode: j.mode, name: String(j.name || ""), label: String(j.label || ""), advisory: String(j.advisory || ""), pattern: String(j.transmit_pattern || ""), cn0MinDbhz: num(j.cn0_min_dbhz),
    summary: String(doc.summary || ""), engine: String(doc.engine_version || ""), file: String(doc.file || ""),
    weak: j.weak_signal_receiver ? { tCohS: num(j.weak_signal_receiver.effective_t_coh_s), cells: num(j.weak_signal_receiver.cells), pfa: num(j.weak_signal_receiver.pfa_per_cell), threshold: num(j.weak_signal_receiver.detection_threshold),
      acquisitionDbhz: num(j.weak_signal_receiver.acquisition_dbhz), carrierDbhz: num(j.weak_signal_receiver.carrier_tracking_dbhz), codeDbhz: num(j.weak_signal_receiver.code_tracking_dbhz), trackingDbhz: num(j.weak_signal_receiver.tracking_dbhz), searchS: num(j.weak_signal_receiver.search_time_s) } : null,
    orbit: j.orbit ? { aKm: num(j.orbit.a_km), e: num(j.orbit.e), iDeg: num(j.orbit.i_deg), raanDeg: num(j.orbit.raan_deg), argpDeg: num(j.orbit.argp_deg), nuDeg: num(j.orbit.true_anomaly_deg) } : null,
    shell: j.shell ? { altitudeKm: num(j.shell.altitude_km), antenna: String(j.shell.antenna || ""), gridPoints: num(j.shell.grid_points), durationMin: num(j.shell.duration_min), stepMin: num(j.shell.step_min) } : null,
    bands: [], phases: [], series: [], nav: null, formation: null, atmosphere: j.atmosphere_model && typeof j.atmosphere_model === "object" ? Object.entries(j.atmosphere_model).filter(([, v]) => isNum(v)) : [],
  };
  const r = j.result && typeof j.result === "object" ? j.result : {};
  if (j.mode === "shell") {
    m.bands = arr(j.bands).map((b) => ({ band: String(b.band), groups: arr(b.groups).map((g) => ({ name: String(g.name), at1: num(g.at_least_1_pct), at4: num(g.at_least_4_pct), out1: num(g.max_outage_1_min), out4: num(g.max_outage_4_min), never1: g.never_available_1 === true, never4: g.never_available_4 === true })) }));
  } else if (j.mode === "trajectory") {
    m.traj = { periodMin: num(r.period_min), perigeeKm: num(r.perigee_alt_km), apogeeKm: num(r.apogee_alt_km), epochs: num(r.epochs) };
    m.bands = arr(r.bands).map((b) => ({
      band: String(b.band),
      groups: arr(b.groups).map((g) => ({ name: String(g.name), at1: num(g.availability && g.availability.at_least_1_pct), at4: num(g.availability && g.availability.at_least_4_pct), out1: num(g.availability && g.availability.max_outage_1_min), out4: num(g.availability && g.availability.max_outage_4_min),
        inView: stat(g.signals_in_view), cn0: stat(g.best_cn0_dbhz), mainLobe: num(g.main_lobe_links), sidelobe: num(g.sidelobe_links) })),
      pdop: { median: num(b.pdop_median), p95: num(b.pdop_p95), worst: num(b.pdop_worst) },
      limb: b.limb && typeof b.limb === "object" ? { links: num(b.limb.links), grazing: num(b.limb.grazing_below_100_km), lost: num(b.limb.lost_to_atmosphere), lossDb: stat(b.limb.loss_db), stec: stat(b.limb.stec_tecu), plasma: stat(b.limb.plasmaspheric_tecu), delayM: stat(b.limb.delay_m), tangentKm: stat(b.limb.tangent_alt_km) } : null,
      series: arr(b.series).map((s) => ({ t: num(s.t_min), alt: num(s.altitude_km), combined: num(s.combined), cn0: num(s.best_cn0_dbhz) })).filter((s) => s.t != null),
    }));
  }
  if (j.mode === "navigation" || j.mode === "formation") {
    m.nav = { epochs: num(r.epochs), gapMin: num(r.longest_gap_min), used: num(r.measurements_used), gated: num(r.measurements_gated), finalErrM: num(r.final_pos_err_m), srpEst: num(r.srp_estimate_ms2), srpTruth: num(r.srp_truth_ms2) };
    m.phases = arr(r.phases).map((p) => ({ phase: String(p.phase), epochs: num(p.epochs), with4: num(p.epochs_with_4), posRms: num(p.pos_rms_m), velRms: num(p.vel_rms_ms), posP95: num(p.pos_p95_m), nees: num(p.pos_nees_mean) }));
    m.series = arr(r.series).map((s) => ({ t: num(s.t_min), alt: num(s.altitude_km), n: num(s.n_meas), err: num(s.pos_err_m), sigma: num(s.pos_sigma_m) })).filter((s) => s.t != null);
  }
  if (j.mode === "formation" && j.formation) {
    const f = j.formation;
    m.formation = { epochs: num(f.epochs), chiefAbsRms: num(f.chief_abs_rms_m), deputies: arr(f.deputies).map((d) => ({ offsetDeg: num(d.offset_deg), baselineKm: num(d.baseline_km), common4: num(d.epochs_common_4), commonSignals: num(d.common_signals_mean),
      relFromAbs: num(d.rel_rms_from_absolute_m), relFilter: num(d.rel_rms_filter_m), relVel: num(d.rel_vel_rms_filter_ms), relFromAbsAbove: num(d.rel_rms_from_absolute_above_gnss_m), relFilterAbove: num(d.rel_rms_filter_above_gnss_m), absRms: num(d.abs_rms_m) })) };
  }
  return { model: m };
}

// ---- drawing: its own classes (ssk-*) so the page needs no other page's styles
const W = 560;
const BAND = { l1: "L1", l5: "L5" };
const bandName = (b) => BAND[b] || String(b).toUpperCase();
const GROUP = { combined: "all together" };
const groupName = (g) => GROUP[g] || (g.length <= 4 ? g.toUpperCase() : g[0].toUpperCase() + g.slice(1));

// Bars: rows [{ label, values: [{ name, value }] }], 0 to `max`; each value is labelled with its number, and the series differ by pattern as well as shade.
export function groupedBarsSvg(rows, { max = 100, unit = "%", label = "bars", w = W, log = false, dec = 1 } = {}) {
  const series = [...new Set(rows.flatMap((r) => r.values.map((v) => v.name)))];
  const L = 112, R = w - 56, rowH = 12 * series.length + 14, h = 26 + rows.length * rowH + 6;
  const pos = rows.flatMap((r) => r.values.map((v) => v.value)).filter((v) => isNum(v) && v > 0);
  const lo = log && pos.length ? Math.floor(Math.log10(Math.min(...pos))) : 0, hi = log && pos.length ? Math.ceil(Math.log10(Math.max(...pos))) : 0;
  const X = log ? (v) => L + ((Math.log10(Math.max(v, 10 ** lo)) - lo) / Math.max(1e-9, hi - lo)) * (R - L) : (v) => L + (Math.max(0, Math.min(v, max)) / max) * (R - L);
  const o = [`<svg class="ssk-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(label)}">`];
  series.forEach((s, i) => o.push(`<rect class="ssk-key ssk-p${i}" x="${L + i * 130}" y="6" width="12" height="9"/><text class="ssk-t" x="${L + i * 130 + 17}" y="14">${esc(s)}</text>`));
  rows.forEach((r, k) => {
    const y0 = 26 + k * rowH;
    o.push(`<text class="ssk-t ssk-lab" x="${L - 8}" y="${y0 + 11}" text-anchor="end">${esc(r.label)}</text>`);
    r.values.forEach((v, i) => {
      const y = y0 + i * 12;
      o.push(`<rect class="ssk-track" x="${L}" y="${y}" width="${R - L}" height="9"/>`);
      if (isNum(v.value)) o.push(`<rect class="ssk-bar ssk-p${series.indexOf(v.name)}" x="${L}" y="${y}" width="${f1(X(v.value) - L)}" height="9"><title>${esc(`${r.label}, ${v.name}: ${fmt(v.value, dec)}${unit}`)}</title></rect><text class="ssk-v" x="${f1(X(v.value) + 4)}" y="${y + 8}">${esc(fmt(v.value, dec))}${esc(unit)}</text>`);
      else o.push(`<text class="ssk-v" x="${L + 4}" y="${y + 8}">n/a</text>`);
    });
  });
  return o.join("") + "</svg>";
}

// Lines against one x axis: series [{ name, points: [[x, y]], dash }]; every line is named at its end, and the dashed one is the engine's stated bound.
export function linesSvg(series, { xLabel = "", yLabel = "", yMin = null, yMax = null, logY = false, logX = false, w = W, h = 230, label = "chart" } = {}) {
  const pts = series.map((s) => ({ ...s, points: s.points.filter((p) => isNum(p[0]) && isNum(p[1]) && (!logY || p[1] > 0) && (!logX || p[0] > 0)) }));
  const all = pts.flatMap((s) => s.points);
  if (!all.length) return `<svg class="ssk-chart" viewBox="0 0 ${w} 40" role="img" aria-label="${esc(label)}"><text class="ssk-t" x="8" y="24">The result carries no series for this chart.</text></svg>`;
  const L = 54, R = w - 112, T = 24, B = h - 38;
  const ty = (v) => (logY ? Math.log10(v) : v);
  const tx = (v) => (logX ? Math.log10(v) : v);
  const x0 = Math.min(...all.map((p) => tx(p[0]))), x1 = Math.max(...all.map((p) => tx(p[0])));
  const ys = all.map((p) => ty(p[1])), y0 = yMin != null ? ty(yMin) : Math.min(...ys, logY ? Infinity : 0), y1 = yMax != null ? ty(yMax) : Math.max(...ys);
  const X = (v) => L + ((tx(v) - x0) / Math.max(1e-12, x1 - x0)) * (R - L), Y = (v) => B - ((ty(v) - y0) / Math.max(1e-12, y1 - y0)) * (B - T);
  const o = [`<svg class="ssk-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(label)}">`, `<path class="ssk-ax" d="M${L} ${T}V${B}H${R}"/>`];
  for (let i = 0; i <= 4; i++) { const yv = y0 + ((y1 - y0) * i) / 4, v = logY ? 10 ** yv : yv; o.push(`<line class="ssk-gl" x1="${L}" x2="${R}" y1="${f1(Y(v))}" y2="${f1(Y(v))}"/><text class="ssk-t" x="${L - 6}" y="${f1(Y(v) + 4)}" text-anchor="end">${esc(fmt(v, v < 0.1 ? 4 : v < 10 ? 2 : 0))}</text>`); }
  for (let i = 0; i <= 4; i++) { const xr = x0 + ((x1 - x0) * i) / 4, xv = logX ? 10 ** xr : xr; o.push(`<text class="ssk-t" x="${f1(X(xv))}" y="${B + 15}" text-anchor="middle">${esc(fmt(xv, xv < 10 ? 3 : 0))}</text>`); }
  o.push(`<text class="ssk-t" x="${(L + R) / 2}" y="${h - 6}" text-anchor="middle">${esc(xLabel)}</text><text class="ssk-t" x="8" y="12">${esc(yLabel)}</text>`);
  const ends = [];
  pts.forEach((s, i) => {
    if (!s.points.length) return;
    o.push(`<path class="ssk-line ssk-s${i % 3}${s.dash ? " ssk-dash" : ""}" d="${s.points.map((p, k) => `${k ? "L" : "M"}${f1(X(p[0]))} ${f1(Y(p[1]))}`).join("")}"><title>${esc(s.name)}</title></path>`);
    for (const p of s.points) o.push(`<circle class="ssk-pt ssk-s${i % 3}" cx="${f1(X(p[0]))}" cy="${f1(Y(p[1]))}" r="3"><title>${esc(`${s.name}: ${xLabel} ${fmt(p[0])}, ${yLabel} ${fmt(p[1])}`)}</title></circle>`);
    const last = s.points[s.points.length - 1];
    ends.push({ i, name: s.name, x: X(last[0]) + 7, y: Y(last[1]) + 4 });
  });
  ends.sort((a, b) => a.y - b.y);
  for (let k = 1; k < ends.length; k++) if (ends[k].y - ends[k - 1].y < 12) ends[k].y = ends[k - 1].y + 12;
  for (const e of ends) o.push(`<text class="ssk-t ssk-end ssk-s${e.i % 3}" x="${f1(e.x)}" y="${f1(e.y)}">${esc(e.name)}</text>`);
  return o.join("") + "</svg>";
}

// Min-mean-max ranges, one row each: a bar from min to max with a tick at the mean.
export function rangesSvg(rows, { unit = "", label = "ranges", w = W } = {}) {
  const vals = rows.flatMap((r) => [r.min, r.max]).filter(isNum);
  if (!vals.length) return `<svg class="ssk-chart" viewBox="0 0 ${w} 40" role="img" aria-label="${esc(label)}"><text class="ssk-t" x="8" y="24">No range in this result.</text></svg>`;
  const lo = Math.min(0, ...vals), hi = Math.max(...vals, lo + 1e-9), L = 112, R = w - 96, rowH = 22, h = 24 + rows.length * rowH + 22;
  const X = (v) => L + ((v - lo) / (hi - lo)) * (R - L);
  const o = [`<svg class="ssk-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(label)}">`, `<path class="ssk-ax" d="M${L} 14V${h - 22}H${R}"/>`];
  for (let i = 0; i <= 4; i++) { const v = lo + ((hi - lo) * i) / 4; o.push(`<line class="ssk-gl" x1="${f1(X(v))}" x2="${f1(X(v))}" y1="14" y2="${h - 22}"/><text class="ssk-t" x="${f1(X(v))}" y="${h - 8}" text-anchor="middle">${esc(fmt(v, 0))}${i === 4 ? esc(" " + unit) : ""}</text>`); }
  rows.forEach((r, k) => {
    const y = 20 + k * rowH;
    o.push(`<text class="ssk-t ssk-lab" x="${L - 8}" y="${y + 9}" text-anchor="end">${esc(r.label)}</text>`);
    if (isNum(r.min) && isNum(r.max)) o.push(`<rect class="ssk-range" x="${f1(X(r.min))}" y="${y}" width="${f1(Math.max(2, X(r.max) - X(r.min)))}" height="11"><title>${esc(`${r.label}: min ${fmt(r.min)}, mean ${fmt(r.mean)}, max ${fmt(r.max)} ${unit}`)}</title></rect>`);
    if (isNum(r.mean)) o.push(`<line class="ssk-mean" x1="${f1(X(r.mean))}" x2="${f1(X(r.mean))}" y1="${y - 2}" y2="${y + 13}"/>`);
    o.push(`<text class="ssk-v" x="${R + 6}" y="${y + 9}">${esc(fmt(r.min))} to ${esc(fmt(r.max))}</text>`);
  });
  return o.join("") + `</svg>`;
}

// The page's sections for one result: [{ id, title, note, svg | html, wide }].
export function chartsOf(m, { wide = false } = {}) {
  const out = [];
  const w = wide ? 1100 : W;
  if (m.mode === "shell") {
    for (const b of m.bands) out.push({ id: `avail-${b.band}`, title: `Availability on the shell, ${bandName(b.band)}`, note: `Share of grid points and times with at least one and at least four signals above ${fmt(m.cn0MinDbhz)} dB-Hz.`,
      svg: groupedBarsSvg(b.groups.map((g) => ({ label: groupName(g.name), values: [{ name: "at least 1 signal", value: g.at1 }, { name: "at least 4 signals", value: g.at4 }] })), { label: `Availability, ${bandName(b.band)}`, w }), wide });
    out.push({ id: "outage", title: "Longest outages on the shell", note: "In minutes, over the run. \"Never\" marks a group that never had that many signals anywhere on the shell.", html: outageTable(m), wide: true });
  }
  if (m.mode === "trajectory") {
    for (const b of m.bands) {
      out.push({ id: `avail-${b.band}`, title: `Availability along the trajectory, ${bandName(b.band)}`, note: `Share of the epochs with at least one and at least four signals above ${fmt(m.cn0MinDbhz)} dB-Hz.`,
        svg: groupedBarsSvg(b.groups.map((g) => ({ label: groupName(g.name), values: [{ name: "at least 1 signal", value: g.at1 }, { name: "at least 4 signals", value: g.at4 }] })), { label: `Availability, ${bandName(b.band)}`, w }), wide });
      out.push({ id: `view-${b.band}`, title: `Signals in view, ${bandName(b.band)}`, note: "Smallest to largest number in view over the epochs, with the mean marked.", svg: rangesSvg(b.groups.map((g) => ({ label: groupName(g.name), ...(g.inView || {}) })), { unit: "signals", label: `Signals in view, ${bandName(b.band)}`, w }), wide });
      out.push({ id: `cn0-${b.band}`, title: `Best carrier-to-noise density, ${bandName(b.band)}`, note: "Of the signals in view, the strongest at each epoch: smallest to largest over the epochs, with the mean marked.", svg: rangesSvg(b.groups.map((g) => ({ label: groupName(g.name), ...(g.cn0 || {}) })), { unit: "dB-Hz", label: `Best C/N0, ${bandName(b.band)}`, w }), wide });
      out.push({ id: `lobe-${b.band}`, title: `Main lobe and sidelobe, ${bandName(b.band)}`, note: "How many of the usable links came through the main lobe and how many through a sidelobe, as counted by the engine.", html: lobeTable(b), wide });
      if (b.series.length) {
        out.push({ id: `series-${b.band}`, title: `Signals and best C/N0 along the orbit, ${bandName(b.band)}`, note: `One decimated series of the combined count over all constellations. The engine writes no per-constellation series, so none is drawn.`,
          svg: linesSvg([{ name: "signals in view", points: b.series.map((s) => [s.t, s.combined]) }], { xLabel: "minutes", yLabel: "signals in view, all constellations", label: `Signals in view against time, ${bandName(b.band)}`, w, yMin: 0 }) + linesSvg([{ name: "best C/N0", points: b.series.map((s) => [s.t, s.cn0]) }, { name: "altitude/1000", points: b.series.filter((s) => isNum(s.alt)).map((s) => [s.t, s.alt / 1000]), dash: true }], { xLabel: "minutes", yLabel: "dB-Hz; altitude in thousand km", label: `Best C/N0 and altitude against time, ${bandName(b.band)}`, w, yMin: 0 }), wide: true });
      }
      out.push({ id: `dop-${b.band}`, title: `Dilution of precision and the atmosphere, ${bandName(b.band)}`, note: "Median, 95th percentile and worst PDOP over the epochs that have a fix, and, where the scenario sets an atmosphere, the signals that graze it.", html: dopTable(b), wide });
    }
    if (m.weak) out.push({ id: "weak", title: "The weak-signal receiver", note: "What the receiver design needs, as the engine computes it from the stated integration.", html: weakTable(m.weak), wide: false });
  }
  if (m.mode === "navigation" || m.mode === "formation") {
    out.push({ id: "phases", title: "Position error by phase", note: "A statistic of the filter over the run and over the two parts of it. A mean position NEES near 3 means the filter's stated bound is consistent with its error.", html: phaseTable(m), wide: true });
    if (m.series.length) out.push({ id: "err", title: "Position error against the filter's own bound", note: "The dashed line is the one-sigma bound the filter states; the solid line is its error against the truth the scenario knows. Decimated by the engine.",
      svg: linesSvg([{ name: "error", points: m.series.map((s) => [s.t, s.err]) }, { name: "stated bound", points: m.series.map((s) => [s.t, s.sigma]), dash: true }], { xLabel: "minutes", yLabel: "position, metres (log)", logY: true, label: "Position error against the stated bound", w }) +
        linesSvg([{ name: "altitude", points: m.series.filter((s) => isNum(s.alt)).map((s) => [s.t, s.alt / 1000]) }, { name: "measurements", points: m.series.map((s) => [s.t, s.n]), dash: true }], { xLabel: "minutes", yLabel: "altitude, thousand km; measurements used", label: "Altitude and measurements used", w, yMin: 0 }), wide: true });
    out.push({ id: "nav", title: "The run in numbers", note: "Measurements used and gated, the longest gap with fewer than four signals, the final error and the solar radiation pressure estimate against the truth the scenario knows.", html: navTable(m), wide: false });
  }
  if (m.mode === "formation" && m.formation) {
    out.push({ id: "formation", title: "Relative position of the deputies", note: "RMS relative position error, from the filter and from differencing the two absolute fixes, over the whole run and above the GNSS orbits.", wide: true,
      svg: groupedBarsSvg(m.formation.deputies.map((d) => ({ label: `${fmt(d.baselineKm, 2)} km`, values: [{ name: "from two absolute fixes", value: d.relFromAbs }, { name: "filter", value: d.relFilter }] })), { max: Math.max(1, ...m.formation.deputies.flatMap((d) => [d.relFromAbs, d.relFilter]).filter(isNum)) * 1.15, unit: " m", label: "Relative position error", w }) });
    out.push({ id: "deputies", title: "Each deputy", note: "Chief absolute RMS " + fmt(m.formation.chiefAbsRms) + " m over " + fmt(m.formation.epochs, 0) + " epochs.", html: deputyTable(m.formation), wide: true });
  }
  return out;
}

const table = (head, rows) => `<div class="ssk-tablewrap"><table class="tbl"><thead><tr>${head.map((h) => `<th scope="col">${esc(h)}</th>`).join("")}</tr></thead><tbody>${rows.map((r) => `<tr><th scope="row">${esc(r[0])}</th>${r.slice(1).map((c) => `<td>${esc(c)}</td>`).join("")}</tr>`).join("")}</tbody></table></div>`;
const mins = (v, never) => (never ? "never" : v == null ? "n/a" : `${fmt(v, 0)} min`);
function outageTable(m) {
  return table(["Band and group", "Longest without 1 signal", "Longest without 4 signals"], m.bands.flatMap((b) => b.groups.map((g) => [`${bandName(b.band)} ${groupName(g.name)}`, g.never1 ? "never had one" : mins(g.out1), g.never4 ? "never had four" : mins(g.out4)])));
}
function lobeTable(b) { return table(["Group", "Main-lobe links", "Sidelobe links", "Sidelobe share"], b.groups.map((g) => [groupName(g.name), fmt(g.mainLobe, 0), fmt(g.sidelobe, 0), isNum(g.mainLobe) && isNum(g.sidelobe) && g.mainLobe + g.sidelobe > 0 ? `${fmt((100 * g.sidelobe) / (g.mainLobe + g.sidelobe))} %` : "n/a"])); }
function dopTable(b) {
  const rows = [["PDOP, median", fmt(b.pdop.median)], ["PDOP, 95th percentile", fmt(b.pdop.p95)], ["PDOP, worst", fmt(b.pdop.worst)]];
  if (b.limb) rows.push(["Links through the limb", fmt(b.limb.links, 0)], ["Grazing below 100 km", fmt(b.limb.grazing, 0)], ["Lost to the atmosphere", fmt(b.limb.lost, 0)], ["Tangent height, min to max", `${fmt(b.limb.tangentKm && b.limb.tangentKm.min)} to ${fmt(b.limb.tangentKm && b.limb.tangentKm.max)} km`],
    ["Loss, mean", `${fmt(b.limb.lossDb && b.limb.lossDb.mean, 2)} dB`], ["Delay, mean", `${fmt(b.limb.delayM && b.limb.delayM.mean, 2)} m`], ["Slant TEC, mean", `${fmt(b.limb.stec && b.limb.stec.mean, 2)} TECU`], ["Plasmaspheric TEC, mean", `${fmt(b.limb.plasma && b.limb.plasma.mean, 2)} TECU`]);
  return table(["Quantity", "Value"], rows);
}
function weakTable(w) { return table(["Quantity", "Value"], [["Coherent integration", `${fmt(w.tCohS, 2)} s`], ["Search cells", fmt(w.cells, 0)], ["False-alarm probability per cell", fmt(w.pfa, 2)], ["Detection threshold", fmt(w.threshold, 1)], ["Acquires down to", `${fmt(w.acquisitionDbhz, 1)} dB-Hz`], ["Carrier tracking down to", `${fmt(w.carrierDbhz, 1)} dB-Hz`], ["Code tracking down to", `${fmt(w.codeDbhz, 1)} dB-Hz`], ["Tracking threshold used", `${fmt(w.trackingDbhz, 1)} dB-Hz`], ["Search time", `${fmt(w.searchS, 0)} s`]]); }
function phaseTable(m) { return table(["Phase", "Epochs", "With 4 or more signals", "Position RMS, m", "Position 95th percentile, m", "Velocity RMS, m/s", "Mean position NEES"], m.phases.map((p) => [p.phase, fmt(p.epochs, 0), fmt(p.with4, 0), fmt(p.posRms), fmt(p.posP95), fmt(p.velRms, 3), fmt(p.nees, 2)])); }
function navTable(m) { const n = m.nav; return table(["Quantity", "Value"], [["Epochs", fmt(n.epochs, 0)], ["Measurements used", fmt(n.used, 0)], ["Measurements gated out", fmt(n.gated, 0)], ["Longest gap", `${fmt(n.gapMin, 0)} min`], ["Final position error", `${fmt(n.finalErrM)} m`], ["Solar radiation pressure, estimated", `${fmt(n.srpEst, 3)} m/s²`], ["Solar radiation pressure, truth", `${fmt(n.srpTruth, 3)} m/s²`]]); }
function deputyTable(f) { return table(["Deputy", "Baseline, km", "Epochs with 4 common signals", "Mean common signals", "Relative RMS, filter, m", "Relative RMS, from absolute, m", "Above GNSS: filter, m", "Above GNSS: from absolute, m", "Relative velocity RMS, m/s"], f.deputies.map((d) => [`${fmt(d.offsetDeg, 2)}° offset`, fmt(d.baselineKm, 2), fmt(d.common4, 0), fmt(d.commonSignals, 1), fmt(d.relFilter), fmt(d.relFromAbs), fmt(d.relFilterAbove), fmt(d.relFromAbsAbove), fmt(d.relVel, 3)])); }

// The committed comparison with the ICG booklet (ssv/icg-comparison.json): bar-level verdicts only.
export function readIcg(j) {
  if (!j || typeof j !== "object" || !j.run1 || !Array.isArray(j.run1.bars)) return { error: "the ICG comparison file is not the one this page reads" };
  const bars = (b) => arr(b && b.bars).map((x) => ({ id: String(x.id), statement: String(x.statement), scored: num(x.scored), failed: num(x.failed), met: x.met === true }));
  return { icg: { note: String(j.note || ""), commit: String(j.engine_commit || "").slice(0, 8), run1: { label: String(j.run1.label), bars: bars(j.run1) }, variant: { label: String(j.variant && j.variant.label), bars: bars(j.variant) },
    s7: j.s7 ? { label: String(j.s7.label), statement: String(j.s7.statement), scored: num(j.s7.scored), failed: num(j.s7.failed), met: j.s7.met === true, tol: num(j.s7.tolerance_db), rms: j.s7.rms_db } : null } };
}
export function icgTable(icg) {
  const byId = new Map(icg.variant.bars.map((b) => [b.id, b]));
  const rows = icg.run1.bars.map((b) => { const v = byId.get(b.id); return [b.id, b.statement, `${b.scored - b.failed} of ${b.scored}`, b.met ? "MET" : "NOT MET", v ? `${v.scored - v.failed} of ${v.scored}, ${v.met ? "would be met" : "still not met"}` : "n/a"]; });
  if (icg.s7) rows.push(["S7", icg.s7.statement, `${icg.s7.scored - icg.s7.failed} of ${icg.s7.scored}`, icg.s7.met ? "MET" : "NOT MET", "not part of the variant"]);
  return table(["Bar", "What it compares", "Run 1: cells within tolerance", "Run 1 verdict", "Variant (diagnostic, GLONASS reference angles from table 4.2)"], rows);
}

export function factRows(m) {
  const rows = [["Mode", m.mode]];
  if (m.shell) rows.push(["Shell altitude", `${fmt(m.shell.altitudeKm, 0)} km`], ["Antenna", m.shell.antenna], ["Grid points", fmt(m.shell.gridPoints, 0)], ["Duration", `${fmt(m.shell.durationMin, 0)} min`], ["Step", `${fmt(m.shell.stepMin, 0)} min`]);
  if (m.orbit) rows.push(["Semi-major axis", `${fmt(m.orbit.aKm, 0)} km`], ["Eccentricity", fmt(m.orbit.e, 4)], ["Inclination", `${fmt(m.orbit.iDeg)}°`]);
  if (m.traj) rows.push(["Perigee altitude", `${fmt(m.traj.perigeeKm, 0)} km`], ["Apogee altitude", `${fmt(m.traj.apogeeKm, 0)} km`], ["Period", `${fmt(m.traj.periodMin, 0)} min`], ["Epochs", fmt(m.traj.epochs, 0)]);
  rows.push(["Carrier-to-noise density threshold", `${fmt(m.cn0MinDbhz)} dB-Hz`]);
  return rows;
}
export { esc, f2 };
