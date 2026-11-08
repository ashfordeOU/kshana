// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the IQ recording view's arithmetic (iqview.mjs). Run with `node web/studio/lib/iqview.test.mjs`.
import assert from "node:assert/strict";
import {
  FORMATS, bytesPerSample, sigmfFormat, parseSigmfMeta, sigmfMetaPath, fromBase64, decode,
  meanPowerDb, fft, welch, db, binFrequencies, overviewOffsets, clock,
} from "./iqview.mjs";

const near = (a, b, tol, what) => assert.ok(Math.abs(a - b) <= tol, `${what}: ${a} vs ${b}`);

// Formats: the app's iq_probe set, and SigMF's names for them.
assert.deepEqual(FORMATS, { ci8: 2, cu8: 2, ci16: 4, cf32: 8 });
assert.equal(bytesPerSample("ci16"), 4);
assert.equal(bytesPerSample("ri16"), 0);
assert.equal(sigmfFormat("ci16_le"), "ci16");
assert.equal(sigmfFormat("cf32_le"), "cf32");
assert.equal(sigmfFormat("ci16_be"), null);
assert.equal(sigmfFormat("rf32_le"), null);

// SigMF metadata: datatype, rate and the first capture's frequency.
const meta = parseSigmfMeta(JSON.stringify({ global: { "core:datatype": "ci16_le", "core:sample_rate": 4e6 }, captures: [{ "core:sample_start": 0, "core:frequency": 1575.42e6 }], annotations: [] }));
assert.deepEqual(meta, { datatype: "ci16_le", format: "ci16", sampleRateHz: 4e6, centreHz: 1575.42e6 });
assert.equal(parseSigmfMeta('{"global":{}}').format, null);
assert.throws(() => parseSigmfMeta("x"), /not JSON/);
assert.throws(() => parseSigmfMeta("{}"), /global/);
assert.equal(sigmfMetaPath("/r/a.sigmf-data"), "/r/a.sigmf-meta");
assert.equal(sigmfMetaPath("C:\\r\\a.SIGMF-META"), "C:\\r\\a.SIGMF-META");
assert.equal(sigmfMetaPath("/r/a.ci16"), null);

// Decoding, as the app's iq_probe scales: ci16 0.5 FS is 16384.
const raw = new Uint8Array(8);
new DataView(raw.buffer).setInt16(0, 16384, true);
new DataView(raw.buffer).setInt16(2, -16384, true);
const d = decode(raw, "ci16");
assert.equal(d.length, 4);
assert.deepEqual([...d.slice(0, 2)], [0.5, -0.5]);
assert.deepEqual([...decode(new Uint8Array([128, 127, 0, 255]), "cu8")].map((x) => +x.toFixed(4)), [0.0039, -0.0039, -0.9961, 0.9961]);
assert.deepEqual([...decode(new Uint8Array([64, 192, 1]), "ci8")], [0.5, -0.5]); // trailing byte dropped
const f32 = new Uint8Array(8);
new DataView(f32.buffer).setFloat32(0, 0.25, true);
new DataView(f32.buffer).setFloat32(4, -1, true);
assert.deepEqual([...decode(f32, "cf32")], [0.25, -1]);
assert.throws(() => decode(raw, "xx"), /unknown sample format/);
assert.deepEqual([...fromBase64(Buffer.from([1, 2, 255]).toString("base64"))], [1, 2, 255]);

// Power: I = 0.5 FS, Q = 0 is -6.02 dBFS (the same figure the app's probe test checks).
near(meanPowerDb(new Float32Array([0.5, 0, 0.5, 0])), -6.0206, 1e-3, "power");
assert.equal(meanPowerDb(new Float32Array(4)), null);
assert.equal(meanPowerDb(new Float32Array(0)), null);

// FFT: a complex tone lands in its bin.
{
  const n = 16, re = new Float64Array(n), im = new Float64Array(n);
  for (let k = 0; k < n; k++) { re[k] = Math.cos((2 * Math.PI * 3 * k) / n); im[k] = Math.sin((2 * Math.PI * 3 * k) / n); }
  fft(re, im);
  near(re[3], n, 1e-9, "tone bin");
  for (let k = 0; k < n; k++) if (k !== 3) near(Math.hypot(re[k], im[k]), 0, 1e-9, `bin ${k}`);
  assert.throws(() => fft(new Float64Array(6), new Float64Array(6)), /power of two/);
}

// Welch: the bins sum to the mean power; a tone at +fs/8 peaks at its frequency.
{
  const nfft = 256, segs = 8, fs = 2.048e6, centre = 1575.42e6, amp = 0.25;
  const iq = new Float32Array(2 * nfft * segs);
  for (let k = 0; k < nfft * segs; k++) {
    const ph = (2 * Math.PI * (fs / 8) * k) / fs;
    iq[2 * k] = amp * Math.cos(ph);
    iq[2 * k + 1] = amp * Math.sin(ph);
  }
  const { bins, segments } = welch(iq, nfft);
  assert.equal(segments, segs);
  const total = bins.reduce((a, b) => a + b, 0);
  near(10 * Math.log10(total), 20 * Math.log10(amp), 1e-6, "Parseval");
  const peak = bins.indexOf(Math.max(...bins));
  const freqs = binFrequencies(nfft, fs, centre);
  near(freqs[peak], centre + fs / 8, fs / nfft / 2, "peak frequency");
  near(freqs[nfft / 2], centre, 1e-6, "centre bin");
  assert.equal(welch(new Float32Array(10), nfft).segments, 0);
}
assert.equal(db(0), -160);
near(db(0.01), -20, 1e-12, "db");

// Overview offsets: evenly spread, room for the last chunk, none repeated.
assert.deepEqual(overviewOffsets(1000, 5, 100), [0, 225, 450, 675, 900]);
assert.deepEqual(overviewOffsets(50, 5, 100), [0]);
assert.deepEqual(overviewOffsets(103, 5, 100), [0, 1, 2, 3]);
assert.equal(clock(3725.25), "1:02:05.3");
assert.equal(clock(65.04), "1:05.0");
assert.equal(clock(-1), "–");
console.log("iqview.mjs: OK");
