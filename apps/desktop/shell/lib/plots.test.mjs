// SPDX-License-Identifier: AGPL-3.0-only
// Tests of lib/plots.mjs and lib/iq.mjs (0.42 U25): the stability, Stanford and spectrum outputs
// are found in results shaped as the engine writes them, drawn as they are, and an IQ recording's
// spectrum puts a tone where it is.
// Run: node --test apps/desktop/shell/lib/plots.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { findPlots, plotCharts, plotLines, curveOf, labelOf } from "./plots.mjs";
import * as P from "./chart/presets.mjs";
import { samplesOf, fft, welch, waterfall, readPlan, formatOfDatatype, IQ_FORMATS } from "./iq.mjs";
import * as studioIq from "../../../../web/studio/lib/iqview.mjs";

const adev = (k) => [1, 2, 4, 8].map((tau, i) => ({ tau_s: tau, adev: k / Math.sqrt(tau), ci_lo: (k / Math.sqrt(tau)) * 0.8, ci_hi: (k / Math.sqrt(tau)) * 1.2, edf: 10 - i, n_samples: 100, noise: "white FM" }));
// The shapes of clock-holdover, clock-measured-log, telecom-prtc-holdover-24h, integrity-raim and l-band-waterfall-jamming results.
const RESULT = {
  quantum: { adev_curve: adev(1e-12) }, classical: { adev_curve: adev(1e-11) },
  measured: { adev: adev(3e-11), mtie: [{ tau_s: 1, mtie_s: 2e-9 }, { tau_s: 10, mtie_s: 5e-9 }], tdev: [{ tau_s: 1, tdev_s: 1e-9 }, { tau_s: 10, tdev_s: 2e-9 }] },
  mtie: [{ tau_s: 1, mtie_ns: 3 }, { tau_s: 10, mtie_ns: 9 }, { tau_s: 100, mtie_ns: 30 }], tdev: [{ tau_s: 1, tdev_ns: 1 }, { tau_s: 10, tdev_ns: 2 }],
  stanford: { alert_limit_m: 50, points: [{ error_m: 3, pl_m: 20, region: "nominal" }, { error_m: 60, pl_m: 40, region: "hmi" }] },
  waterfall: { freq_hz: [1.57e9, 1.58e9], t_s: [0, 1, 2], psd_dbw_per_hz: [[-200, -190], [-201, -150], [-199, -198]], noise_floor_dbw_per_hz: -201.5 },
  iq: { centre_hz: 1575.42e6, freq_offset_hz: [-2, -1, 0, 1], welch_dbw_per_hz: [-1, -2, -3, -4], model_dbw_per_hz: [-1, -2, -3, -5], label: "Synthetic" },
  unrelated: [{ tau_s: 1 }, { tau_s: 2 }], scalar: 3,
};

test("every stability, Stanford and spectrum output of a result is found by its shape", () => {
  const f = findPlots(RESULT);
  const by = (k) => f.filter((x) => x.kind === k).map((x) => x.path);
  assert.deepEqual(by("adev"), ["quantum.adev_curve", "classical.adev_curve", "measured.adev"]);
  assert.deepEqual(by("mtie"), ["measured.mtie", "mtie"]);
  assert.deepEqual(by("tdev"), ["measured.tdev", "tdev"]);
  assert.deepEqual(by("stanford"), ["stanford"]);
  assert.deepEqual(by("waterfall"), ["waterfall"]);
  assert.deepEqual(by("spectrum"), ["iq"]);
  assert.equal(f.length, 10, "nothing else (tau_s without a deviation is not a curve)");
  assert.deepEqual(findPlots({ a: 1 }), []);
  assert.deepEqual(findPlots(null), []);
});

test("values are drawn as the engine wrote them; seconds become nanoseconds for MTIE and TDEV", () => {
  const c = curveOf(RESULT.measured.mtie, "measured.mtie");
  assert.deepEqual(c.dev, [2, 5]);
  assert.equal(c.unit, "ns");
  const a = curveOf(RESULT.quantum.adev_curve, "quantum.adev_curve");
  assert.deepEqual(a.dev, RESULT.quantum.adev_curve.map((p) => p.adev));
  assert.deepEqual(a.lo, RESULT.quantum.adev_curve.map((p) => p.ci_lo));
  assert.equal(curveOf([{ tau_s: 1, adev: 1 }], "x"), null, "one point is not a curve");
  assert.equal(labelOf("quantum.adev_curve"), "quantum");
  assert.equal(labelOf("mtie", "MTIE"), "MTIE");
});

test("the charts group curves by kind, keep the confidence band and the Stanford alert limit", () => {
  const charts = plotCharts(findPlots(RESULT), P, { title: "run" });
  const ids = charts.map((c) => c.id);
  assert.deepEqual(ids, ["loglog-adev", "loglog-time", "stanford-0", "spectrum-0", "waterfall-0"]);
  const ad = charts[0].spec;
  assert.equal(ad.x.kind, "log");
  assert.equal(ad.y.kind, "log");
  assert.equal(ad.series.filter((s) => s.lo).length, 3, "every ADEV curve has its band");
  assert.deepEqual(ad.series[0].y, RESULT.quantum.adev_curve.map((p) => p.adev));
  const time = charts[1];
  assert.equal(time.spec.series.length, 4);
  assert.match(time.title, /MTIE/);
  const st = charts[2].spec;
  assert.ok(JSON.stringify(st).includes("50"), "the alert limit is drawn");
  assert.deepEqual(charts[4].spec.grid.z, RESULT.waterfall.psd_dbw_per_hz);
  assert.deepEqual(charts[3].spec.series[0].y, RESULT.iq.welch_dbw_per_hz);
  assert.ok(Math.abs(charts[3].spec.series[0].x[2] - 1575.42) < 1e-9, "frequencies in MHz about the centre");
  const py = plotLines(findPlots(RESULT));
  assert.ok(py.some((l) => l.includes('result["quantum"]["adev_curve"]')));
  assert.ok(py.some((l) => l.startsWith("stanford = ")));
});

test("IQ samples decode at full scale in every format", () => {
  assert.deepEqual(Array.from(samplesOf(Uint8Array.from([127, 0x80]), "ci8")), [127 / 128, -1]);
  assert.deepEqual(Array.from(samplesOf(Uint8Array.from([255, 0, 7]), "cu8")), [127.5 / 128, -127.5 / 128], "a trailing part sample is dropped");
  const b = new Uint8Array(4); new DataView(b.buffer).setInt16(0, -32768, true); new DataView(b.buffer).setInt16(2, 16384, true);
  assert.deepEqual(Array.from(samplesOf(b, "ci16")), [-1, 0.5]);
  const f = new Uint8Array(8); new DataView(f.buffer).setFloat32(0, 0.25, true); new DataView(f.buffer).setFloat32(4, -0.5, true);
  assert.deepEqual(Array.from(samplesOf(f, "cf32")), [0.25, -0.5]);
  assert.throws(() => samplesOf(f, "cs4"));
  assert.equal(formatOfDatatype("cf32_le"), "cf32");
  assert.equal(formatOfDatatype("ri16_le"), null);
  assert.equal(IQ_FORMATS.ci16, 4);
});

test("the FFT of a complex tone has one bin; Welch puts the tone at its frequency", () => {
  const n = 64, re = new Float64Array(n), im = new Float64Array(n);
  for (let i = 0; i < n; i++) { re[i] = Math.cos((2 * Math.PI * 5 * i) / n); im[i] = Math.sin((2 * Math.PI * 5 * i) / n); }
  fft(re, im);
  const mag = Array.from(re, (r, k) => Math.hypot(r, im[k]));
  assert.ok(Math.abs(mag[5] - n) < 1e-9);
  assert.ok(mag.every((m, k) => k === 5 || m < 1e-9));
  assert.throws(() => fft(new Float64Array(3), new Float64Array(3)));
  const rate = 1e6, f0 = 125e3, N = 16384, iq = new Float32Array(2 * N);
  for (let i = 0; i < N; i++) { iq[2 * i] = 0.5 * Math.cos((2 * Math.PI * f0 * i) / rate); iq[2 * i + 1] = 0.5 * Math.sin((2 * Math.PI * f0 * i) / rate); }
  const w = welch(iq, { nfft: 256, rate });
  const k = w.psd.indexOf(Math.max(...w.psd));
  assert.equal(w.f[k], f0);
  assert.equal(w.nfft, 256);
  assert.ok(w.segments > 100);
  // total power: the sum of the PSD over the bins is the mean power (0.25), to the window's leakage
  const total = w.psd.reduce((a, d) => a + 10 ** (d / 10), 0) * (rate / 256);
  assert.ok(Math.abs(total - 0.25) / 0.25 < 0.02, `${total}`);
  const wf = waterfall(iq, { nfft: 128, rate, rows: 8 });
  assert.equal(wf.z.length, 8);
  assert.equal(wf.z[0].length, 128);
  assert.ok(wf.t[1] > wf.t[0]);
  assert.deepEqual(readPlan(10, "ci16", { offset: 3, maxBytes: 7 }), { offset: 0, len: 4, samples: 1 });
});

test("the decoding and the FFT give the Studio's IQ page's answers (web/studio/lib/iqview.mjs)", () => {
  const bytes = Uint8Array.from({ length: 64 }, (_, i) => (i * 37 + 11) & 0xff);
  for (const f of Object.keys(studioIq.FORMATS)) {
    assert.deepEqual(Array.from(samplesOf(bytes, f)), Array.from(studioIq.decode(bytes, f)), f);
    assert.equal(IQ_FORMATS[f], studioIq.FORMATS[f]);
  }
  for (const dt of ["cf32_le", "ci16_le", "ci8", "cu8"]) assert.equal(formatOfDatatype(dt), studioIq.sigmfFormat(dt));
  const re = Float64Array.from({ length: 32 }, (_, i) => Math.sin(i * 0.7)), im = Float64Array.from({ length: 32 }, (_, i) => Math.cos(i * 1.3));
  const re2 = re.slice(), im2 = im.slice();
  fft(re, im); studioIq.fft(re2, im2);
  assert.deepEqual(Array.from(re), Array.from(re2));
  assert.deepEqual(Array.from(im), Array.from(im2));
});
