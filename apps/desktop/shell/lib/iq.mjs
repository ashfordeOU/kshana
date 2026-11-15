// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: spectrum and waterfall of an IQ recording (0.42 U25). The app's native
// side reads the recording in blocks (`read_range`, never the whole file); this module turns the
// samples into a Welch power spectrum and the rows of a waterfall. Pure, no DOM; tested in
// iq.test.mjs.
//
// The decoding and the FFT are the arithmetic of the Studio's IQ page (web/studio/lib/iqview.mjs),
// repeated here because the shell's modules are tested where they stand, without the staged
// Studio beside them; plots.test.mjs holds the two to the same answers. This module adds the
// half-overlapping Welch average with its density scaling, and the waterfall.
//
// The levels are relative: a raw recording carries no calibration, so power is in dB relative to
// a full-scale sample per hertz (dBFS/Hz), and the page says so. A SigMF recording gives its
// sample rate and centre frequency; a raw one is drawn against the rate the person gives.

/** Bytes per complex sample of the IQ sample formats the engine names. */
export const IQ_FORMATS = { ci8: 2, cu8: 2, ci16: 4, ci16_le: 4, cf32: 8, cf32_le: 8 };

/** The sample format of a SigMF `core:datatype` (cf32_le, ci16_le, ci8, cu8), or null. */
export function formatOfDatatype(dt) {
  const s = String(dt || "").toLowerCase();
  if (/^cf32(_le)?$/.test(s)) return "cf32";
  if (/^ci16(_le)?$/.test(s)) return "ci16";
  if (s === "ci8" || s === "ci8_le") return "ci8";
  if (s === "cu8" || s === "cu8_le") return "cu8";
  return null;
}

/** Interleaved I and Q (Float32Array, full scale 1) of `bytes` in `format`. A trailing part sample is dropped. */
export function samplesOf(bytes, format) {
  const bps = IQ_FORMATS[format];
  if (!bps) throw new Error(`${format}: not an IQ sample format (${Object.keys(IQ_FORMATS).join(", ")})`);
  const n = Math.floor(bytes.length / bps);
  const out = new Float32Array(2 * n);
  const dv = new DataView(bytes.buffer, bytes.byteOffset, n * bps);
  if (format === "ci8") for (let i = 0; i < 2 * n; i++) out[i] = dv.getInt8(i) / 128;
  else if (format === "cu8") for (let i = 0; i < 2 * n; i++) out[i] = (dv.getUint8(i) - 127.5) / 128;
  else if (format.startsWith("ci16")) for (let i = 0; i < 2 * n; i++) out[i] = dv.getInt16(2 * i, true) / 32768;
  else for (let i = 0; i < 2 * n; i++) out[i] = dv.getFloat32(4 * i, true);
  return out;
}

/** In-place radix-2 FFT of (re, im); the length is a power of two. */
export function fft(re, im) {
  const n = re.length;
  if (n & (n - 1)) throw new Error("the FFT length is a power of two");
  for (let i = 1, j = 0; i < n; i++) {
    let bit = n >> 1;
    for (; j & bit; bit >>= 1) j ^= bit;
    j ^= bit;
    if (i < j) { [re[i], re[j]] = [re[j], re[i]]; [im[i], im[j]] = [im[j], im[i]]; }
  }
  for (let len = 2; len <= n; len <<= 1) {
    const ang = (-2 * Math.PI) / len, wr = Math.cos(ang), wi = Math.sin(ang);
    for (let i = 0; i < n; i += len) {
      let cr = 1, ci = 0;
      for (let k = 0; k < len / 2; k++) {
        const a = i + k, b = a + len / 2;
        const tr = re[b] * cr - im[b] * ci, ti = re[b] * ci + im[b] * cr;
        re[b] = re[a] - tr; im[b] = im[a] - ti; re[a] += tr; im[a] += ti;
        const nr = cr * wr - ci * wi; ci = cr * wi + ci * wr; cr = nr;
      }
    }
  }
}

const hann = (n) => Float64Array.from({ length: n }, (_, i) => 0.5 - 0.5 * Math.cos((2 * Math.PI * i) / n));

/** The power spectral density of one segment starting at sample `start` (linear, per hertz, fft-shifted). */
function segmentPsd(iq, start, nfft, w, wss, rate) {
  const re = new Float64Array(nfft), im = new Float64Array(nfft);
  for (let k = 0; k < nfft; k++) { re[k] = iq[2 * (start + k)] * w[k]; im[k] = iq[2 * (start + k) + 1] * w[k]; }
  fft(re, im);
  const out = new Float64Array(nfft), half = nfft / 2;
  for (let k = 0; k < nfft; k++) out[(k + half) % nfft] = (re[k] * re[k] + im[k] * im[k]) / (wss * rate);
  return out;
}

const db = (x) => 10 * Math.log10(Math.max(x, 1e-30));

/**
 * Welch's estimate of the spectrum of `iq` (interleaved I and Q): Hann windows of `nfft` samples,
 * half overlapping, averaged (at most `maxSegments`). Returns { f (offset from the centre, Hz),
 * psd (dBFS/Hz), segments, nfft, rbw (the equivalent noise bandwidth of a bin, Hz) }.
 */
export function welch(iq, { nfft = 1024, rate = 1, maxSegments = 256 } = {}) {
  const n = iq.length / 2;
  if (n < nfft) nfft = Math.max(16, 2 ** Math.floor(Math.log2(Math.max(16, n))));
  if (n < nfft) throw new Error("too few samples for a spectrum");
  const w = hann(nfft), wss = w.reduce((a, b) => a + b * b, 0);
  const hop = nfft / 2, total = Math.floor((n - nfft) / hop) + 1;
  const take = Math.min(total, maxSegments), stride = total / take;
  const acc = new Float64Array(nfft);
  for (let s = 0; s < take; s++) {
    const p = segmentPsd(iq, Math.floor(s * stride) * hop, nfft, w, wss, rate);
    for (let k = 0; k < nfft; k++) acc[k] += p[k];
  }
  const f = Array.from({ length: nfft }, (_, k) => ((k - nfft / 2) * rate) / nfft);
  return { f, psd: Array.from(acc, (v) => db(v / take)), segments: take, nfft, rbw: (rate * 1.5) / nfft };
}

/**
 * A waterfall of `iq`: `rows` rows spread over the samples, each a Welch average of the segments in
 * its stretch. Returns { f, t (s from the first sample), z (rows of dBFS/Hz) }.
 */
export function waterfall(iq, { nfft = 512, rate = 1, rows = 64 } = {}) {
  const n = iq.length / 2;
  if (n < nfft * 2) throw new Error("too few samples for a waterfall");
  const per = Math.floor(n / rows);
  const r = per >= nfft ? rows : Math.max(1, Math.floor(n / nfft));
  const len = Math.floor(n / r);
  const z = [], t = [];
  for (let j = 0; j < r; j++) {
    const part = iq.subarray(2 * j * len, 2 * (j + 1) * len);
    z.push(welch(part, { nfft, rate, maxSegments: 16 }).psd);
    t.push((j * len + len / 2) / rate);
  }
  return { f: Array.from({ length: nfft }, (_, k) => ((k - nfft / 2) * rate) / nfft), t, z };
}

/** The bytes to read for a spectrum: at most `maxBytes`, whole samples, from `offset`. */
export function readPlan(size, format, { offset = 0, maxBytes = 32 * 1024 * 1024 } = {}) {
  const bps = IQ_FORMATS[format] || 1;
  const start = Math.min(Math.max(0, offset - (offset % bps)), size);
  const len = Math.min(size - start, maxBytes - (maxBytes % bps));
  return { offset: start, len: len - (len % bps), samples: Math.floor(len / bps) };
}
