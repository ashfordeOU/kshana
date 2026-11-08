// SPDX-License-Identifier: AGPL-3.0-only
// IQ recordings in Kshana Desktop: the arithmetic of the recording view (iq/), with no DOM.
// The app reads the file from disk in pieces (read_range, iq_probe in apps/desktop); this
// module decodes those pieces and measures them. It only reads received samples: nothing
// here makes, changes or sends a signal.

/** The sample formats the app reads (the same as its iq_probe), with bytes per complex sample. */
export const FORMATS = { ci8: 2, cu8: 2, ci16: 4, cf32: 8 };

/** Bytes per complex sample of `format`, or 0 when the format is not one of FORMATS. */
export function bytesPerSample(format) {
  return FORMATS[format] || 0;
}

/** Our format for a SigMF `core:datatype`, or null (big-endian and real-valued data are not read). */
export function sigmfFormat(datatype) {
  return { ci8: "ci8", cu8: "cu8", ci16_le: "ci16", cf32_le: "cf32" }[String(datatype || "").toLowerCase()] || null;
}

/** The settings a SigMF metadata file gives: `{format, sampleRateHz, centreHz, datatype}`; throws on text that is not SigMF. */
export function parseSigmfMeta(text) {
  let m;
  try { m = JSON.parse(text); } catch (e) { throw new Error("not JSON"); }
  const g = m && m.global;
  if (!g || typeof g !== "object") throw new Error("no \"global\" object");
  const datatype = g["core:datatype"];
  const cap = Array.isArray(m.captures) && m.captures.length ? m.captures[0] : {};
  const num = (v) => (typeof v === "number" && Number.isFinite(v) ? v : null);
  return { datatype: datatype || null, format: sigmfFormat(datatype), sampleRateHz: num(g["core:sample_rate"]), centreHz: num(cap["core:frequency"]) };
}

/** The `.sigmf-meta` file beside a `.sigmf-data` (or the same path for a `.sigmf-meta`), else null. */
export function sigmfMetaPath(path) {
  const p = String(path || "");
  if (/\.sigmf-meta$/i.test(p)) return p;
  if (/\.sigmf-data$/i.test(p)) return p.replace(/\.sigmf-data$/i, ".sigmf-meta");
  return null;
}

/** Bytes from the app's base64 answer. */
export function fromBase64(b64) {
  const s = atob(b64 || "");
  const out = new Uint8Array(s.length);
  for (let i = 0; i < s.length; i++) out[i] = s.charCodeAt(i);
  return out;
}

/** Interleaved I, Q (full scale 1) from the raw bytes of `format`; a trailing partial sample is dropped. */
export function decode(bytes, format) {
  const bps = bytesPerSample(format);
  if (!bps) throw new Error(`unknown sample format ${format}`);
  const n = Math.floor(bytes.length / bps);
  const out = new Float32Array(2 * n);
  const dv = new DataView(bytes.buffer, bytes.byteOffset, n * bps);
  for (let k = 0; k < n; k++) {
    const o = k * bps;
    let i, q;
    if (format === "ci8") { i = dv.getInt8(o) / 128; q = dv.getInt8(o + 1) / 128; }
    else if (format === "cu8") { i = (dv.getUint8(o) - 127.5) / 128; q = (dv.getUint8(o + 1) - 127.5) / 128; }
    else if (format === "ci16") { i = dv.getInt16(o, true) / 32768; q = dv.getInt16(o + 2, true) / 32768; }
    else { i = dv.getFloat32(o, true); q = dv.getFloat32(o + 4, true); }
    out[2 * k] = i;
    out[2 * k + 1] = q;
  }
  return out;
}

/** Mean power of interleaved samples in dB full scale, or null for none (or all zero). */
export function meanPowerDb(iq) {
  const n = iq.length >> 1;
  if (!n) return null;
  let p = 0;
  for (let k = 0; k < iq.length; k++) p += iq[k] * iq[k];
  return p > 0 ? 10 * Math.log10(p / n) : null;
}

/** In-place radix-2 FFT of `re`, `im` (length a power of two). */
export function fft(re, im) {
  const n = re.length;
  if (n & (n - 1)) throw new Error("the FFT length must be a power of two");
  for (let i = 1, j = 0; i < n; i++) {
    let bit = n >> 1;
    for (; j & bit; bit >>= 1) j ^= bit;
    j ^= bit;
    if (i < j) { [re[i], re[j]] = [re[j], re[i]]; [im[i], im[j]] = [im[j], im[i]]; }
  }
  for (let len = 2; len <= n; len <<= 1) {
    const ang = (-2 * Math.PI) / len;
    const wr = Math.cos(ang), wi = Math.sin(ang);
    for (let i = 0; i < n; i += len) {
      let cr = 1, ci = 0;
      for (let k = 0; k < len / 2; k++) {
        const a = i + k, b = a + len / 2;
        const tr = re[b] * cr - im[b] * ci, ti = re[b] * ci + im[b] * cr;
        re[b] = re[a] - tr; im[b] = im[a] - ti;
        re[a] += tr; im[a] += ti;
        const nr = cr * wr - ci * wi;
        ci = cr * wi + ci * wr;
        cr = nr;
      }
    }
  }
}

/**
 * Power spectrum of interleaved samples: Hann-windowed segments of `nfft` (a power of two),
 * not overlapping, averaged. Returns `{bins, segments}`: `bins` (length nfft, linear power,
 * zero frequency in the middle) sum to the mean power of the segments, so 10·log10 of a bin
 * is dB full scale in that bin. `segments` is 0 when there are fewer than nfft samples.
 */
export function welch(iq, nfft) {
  const n = iq.length >> 1;
  const segs = Math.floor(n / nfft);
  const acc = new Float64Array(nfft);
  if (!segs) return { bins: acc, segments: 0 };
  const w = new Float64Array(nfft);
  let w2 = 0;
  for (let k = 0; k < nfft; k++) { w[k] = 0.5 - 0.5 * Math.cos((2 * Math.PI * k) / nfft); w2 += w[k] * w[k]; }
  const re = new Float64Array(nfft), im = new Float64Array(nfft);
  for (let s = 0; s < segs; s++) {
    for (let k = 0; k < nfft; k++) { const o = 2 * (s * nfft + k); re[k] = iq[o] * w[k]; im[k] = iq[o + 1] * w[k]; }
    fft(re, im);
    for (let k = 0; k < nfft; k++) acc[(k + nfft / 2) % nfft] += re[k] * re[k] + im[k] * im[k];
  }
  const scale = 1 / (segs * nfft * w2);
  for (let k = 0; k < nfft; k++) acc[k] *= scale;
  return { bins: acc, segments: segs };
}

/** dB of linear power, floored at `floor` dB (no -Infinity in a drawing). */
export function db(p, floor = -160) {
  return p > 0 ? Math.max(floor, 10 * Math.log10(p)) : floor;
}

/** The frequency of each of `nfft` shifted bins, Hz (centre plus offset). */
export function binFrequencies(nfft, sampleRateHz, centreHz = 0) {
  const out = new Float64Array(nfft);
  for (let k = 0; k < nfft; k++) out[k] = centreHz + ((k - nfft / 2) * sampleRateHz) / nfft;
  return out;
}

/** `points` sample offsets spread evenly over a recording of `total` samples, each leaving room for `chunk` samples. */
export function overviewOffsets(total, points, chunk) {
  const last = Math.max(0, total - chunk);
  if (points <= 1 || last === 0) return [0];
  const out = [];
  for (let i = 0; i < points; i++) out.push(Math.round((i * last) / (points - 1)));
  return [...new Set(out)];
}

/** Seconds as h:mm:ss.s (or m:ss.s under an hour). */
export function clock(s) {
  if (!Number.isFinite(s) || s < 0) return "–";
  const h = Math.floor(s / 3600), m = Math.floor((s % 3600) / 60), sec = s % 60;
  const ss = sec.toFixed(1).padStart(4, "0");
  return h ? `${h}:${String(m).padStart(2, "0")}:${ss}` : `${m}:${ss}`;
}
