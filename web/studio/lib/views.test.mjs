// SPDX-License-Identifier: AGPL-3.0-only
// Checked against REAL recorded engine outputs (recorded/*.json, made by the engine version in pkg/; selfcheck.mjs fails if they differ).
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { seriesModel, holdoverModel, signalModel, masksModel, adevCurves, groundTrack, orbitTrackKm, keyFigures,
  lineChartSvg, signalHeatmapSvg, groundTrackSvg, timeToThreshold, outageWindows, niceTicks, esc, fmt, resultLabel, heat } from "./views.mjs";

const rec = (f) => { const r = JSON.parse(readFileSync(new URL(`../recorded/${f}.json`, import.meta.url), "utf8")); return { toml: r.toml, result: JSON.parse(r.json) }; };

// A label made from a result key keeps an acronym's capitals ("Leo pass duration" and "Crc24q" were
// on screen), and writes out the ones a reader is least likely to know.
{
  const { humanKey } = await import("./views.mjs");
  assert.equal(humanKey("leo_pass_duration_s"), "LEO pass duration (s)");
  assert.equal(humanKey("crc24q"), "CRC-24Q");
  assert.equal(humanKey("enbw_hz"), "Equivalent noise bandwidth (Hz)");
  assert.equal(humanKey("nfft"), "FFT length");
  assert.equal(humanKey("tx_bandwidth_hz"), "Transmit bandwidth (Hz)");
  assert.equal(humanKey("ttff_s"), "Time to first fix (s)");
  assert.equal(humanKey("utc_offset_ns"), "UTC offset (ns)");
  assert.equal(humanKey("sisre_orb_rms_m"), "SISRE orb RMS (m)");
  assert.equal(humanKey("result_sha256"), "Result SHA-256");
  // The older keys read as before.
  assert.equal(humanKey("gnss_max_cn0_dbhz"), "GNSS max C/N0 (dB-Hz)");
  assert.equal(humanKey("holdover_s"), "Holdover (s)");
  // No label made from a real result of the newer kinds shows a mis-cased acronym.
  const bad = /\b(Leo|Uhf|Utc|Sisre|Rinex|Crc24q|Enbw|Nfft|Ttff|Aos|Tca|Itrf|Ilrs|Csv|Iod|Lsb)\b/;
  for (const f of ["leo-pass-vs-gnss-cn0", "leo-navmsg-encode-decode", "l-band-waterfall-jamming", "leo-band-trade", "lunar-llr-datum", "leo-pnt-end-to-end", "leo-timing-utc"]) {
    const seen = new Set();
    const walk = (o) => { if (!o || typeof o !== "object") return; if (Array.isArray(o)) return o.slice(0, 3).forEach(walk); for (const [k, v] of Object.entries(o)) { seen.add(k); walk(v); } };
    walk(rec(f).result);
    for (const k of seen) assert.ok(!bad.test(humanKey(k)), `${f}: key ${k} reads "${humanKey(k)}"`);
  }
}

// Clock holdover: series, outage window, holdover read-off agrees with the engine figure.
{
  const { result, toml } = rec("clock-holdover");
  const sm = seriesModel(result, toml);
  assert.equal(sm.unit, "ns");
  assert.equal(sm.series.length, 2);
  assert.equal(sm.threshold, 20);
  assert.deepEqual(sm.outages[0][0], 600);
  const hm = holdoverModel(result);
  assert.equal(hm.loss, 600);
  const cls = hm.series[1];
  const tt = timeToThreshold(cls.points, 20, hm.loss);
  const eng = result.classical.fom.holdover_s;
  // The engine's holdover and the read-off from the plotted series agree to one step.
  assert.ok(Math.abs(tt.t - eng) <= 10 + 1e-9, `read-off ${tt.t} vs engine ${eng}`);
  const { svg, hover } = lineChartSvg(sm);
  assert.ok(svg.startsWith("<svg") && svg.includes("GNSS denied") && hover.samples.length > 10);
  assert.ok(hover.label(5).includes("t = "));
  assert.equal(adevCurves(result).length, 2);
}
// Slot timing: guard threshold and the engine's breach time.
{
  const { result } = rec("slot-timing-ocxo-leo");
  const hm = holdoverModel(result);
  assert.equal(hm.threshold, result.slot.guard_ns);
  assert.equal(hm.engineFigure[0].holdover_s, result.result.breach_after_sync_s);
}
// Jamming: signal model from per-satellite epochs, threshold from the TOML.
{
  const { result, toml } = rec("jamming-demo");
  const sig = signalModel(result, toml);
  assert.equal(sig.threshold, 25);
  assert.equal(sig.band.jammer_bandwidth_mhz, 20);
  assert.equal(sig.band.jammer_type, "broadband");
  assert.ok(sig.prns.length >= 4 && sig.times.length === result.epochs.length);
  const svg = signalHeatmapSvg(sig);
  assert.ok(svg.includes("below tracking threshold"));
  assert.equal(holdoverModel(result), null, "tracking counts are not a holdover record");
  assert.equal(seriesModel(result, toml).series[1].label, "tracking");
}
// Lunar jamming carries its own carrier frequency and threshold.
{
  const { result, toml } = rec("lunar-jamming");
  const sig = signalModel(result, toml);
  assert.equal(sig.band.carrier_hz, result.carrier_hz);
  assert.equal(sig.threshold, result.tracking_threshold_dbhz);
}
// Telecom masks.
{
  const { result } = rec("telecom-prtc-holdover-24h");
  const m = masksModel(result);
  assert.ok(m.mtie.length > 5 && m.tdev.length > 5 && m.masks.length >= 1);
  assert.ok(["PASS", "FAIL"].includes(m.masks[0].verdict));
  const { svg } = lineChartSvg({ series: [{ label: "MTIE", color: "red", points: m.mtie }], xLabel: "τ", yLabel: "ns" }, { logX: true, logY: true });
  assert.ok(svg.includes("<tspan"));
}
// Orbits: 3-D track and ground track.
{
  assert.ok(orbitTrackKm(rec("orbit-sgp4-gps").result).length > 10);
  const eph = rec("ephemeris").result;
  const gt = groundTrack(eph);
  assert.ok(gt.points.length > 10);
  assert.ok(orbitTrackKm(eph)[0].length === 3);
  assert.ok(groundTrackSvg(gt).includes("polyline"));
}
// Key figures carry the engine's own units.
{
  const kf = keyFigures(rec("jamming-demo").result);
  const js = kf.find((k) => k.path === "fom.mean_js_db");
  assert.equal(js.unit, "dB");
  assert.equal(js.provenance, "computed");
  assert.ok(keyFigures(rec("link-budget").result).length > 0);
}
assert.equal(resultLabel(rec("slot-timing-ocxo-leo").result).tier, "MODELLED");
assert.deepEqual(outageWindows([{ t: 0, gnss: "nominal" }, { t: 1, gnss: "denied" }, { t: 2, gnss: "nominal" }]), [[1, 2]]);
assert.deepEqual(niceTicks(0, 10, 5), [0, 2, 4, 6, 8, 10]);
assert.equal(esc(`<a "b">`), "&lt;a &quot;b&quot;&gt;");
assert.equal(fmt(1234.5678), "1235");
assert.ok(heat(0).startsWith("rgb(") && heat(1) !== heat(0));
console.log("views.test.mjs: all assertions passed");

// Result shapes added for the site's charts: each draws real engine fields.
{
  const { result } = rec("integrity-raim");
  const m = seriesModel(result);
  assert.equal(m.unit, "m");
  assert.equal(m.threshold, result.al_h_m);
  assert.deepEqual(m.series[0].points[0], [result.epochs[0].t_s, result.epochs[0].hpl_m]);
  assert.equal(holdoverModel(result), null); // protection levels are not a holdover record
}
{
  const { result } = rec("spoof-meaconing");
  const m = seriesModel(result);
  assert.equal(m.series.length, 4);
  assert.equal(m.series[0].points[5][1], Math.abs(result.classical.series[5].offset_ns));
  assert.equal(m.series[1].points[5][1], result.classical.series[5].bound_ns);
}
{
  const { result } = rec("sweep-clock-stability");
  const m = seriesModel(result);
  assert.equal(m.logX, result.scale === "log");
  assert.equal(m.series[0].points.length, result.points.length);
  assert.ok(lineChartSvg(m).svg.includes("<polyline"));
}
{
  const { result } = rec("clock-ensemble");
  const m = seriesModel(result);
  assert.ok(m.title.includes(String(result.runs)));
  assert.equal(m.series[0].points[10][1], result.classical.band[10].p95_ns);
}
{
  const { result } = rec("mars-pnt-lmo");
  const m = seriesModel(result);
  assert.equal(m.series[0].points[3][1], result.estimation[3].pos_error_3d_m);
}
{
  const { result } = rec("terrain-slam");
  const m = seriesModel(result);
  assert.equal(m.series[1].points[7][1], result.epochs[7].matched_m);
}
// The legend sits above the plot: its rows push the plot's top margin down.
{
  const { result } = rec("clock-ensemble");
  const svg = lineChartSvg(seriesModel(result), { w: 420, h: 240 }).svg;
  const firstGrid = +svg.match(/class="c-grid" x1="[\d.]+" y1="([\d.]+)"/)[1];
  const legendY = Math.max(...[...svg.matchAll(/class="c-legend" transform="translate\([\d.]+,([\d.]+)\)"/g)].map((x) => +x[1]));
  assert.ok(legendY < firstGrid, "legend row is above the plot area");
}
// Waterfall: nominal and jammed fields, and a partial replay.
{
  const { result, toml } = rec("jamming-demo");
  const s = signalModel(result, toml);
  assert.ok(s.hasNominal);
  const nom = signalHeatmapSvg(s, { field: "cn0_nominal_dbhz", titles: false });
  const part = signalHeatmapSvg(s, { upTo: 3, titles: false });
  assert.ok(!nom.includes("<title>"));
  assert.ok((part.match(/<rect x=/g) || []).length < (nom.match(/<rect x=/g) || []).length);
}
console.log("views: OK");
