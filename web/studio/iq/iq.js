// SPDX-License-Identifier: AGPL-3.0-only
// IQ recording view (Kshana Desktop only): the DOM layer. The app reads the recording from disk
// in pieces through its read-only commands (file_info, read_range, iq_probe); lib/iqview.mjs
// decodes and measures them. Read only: this page has no control that writes a file, sends
// anything to a radio, or makes a signal. Outside the Desktop it says what it needs.
import { t, ready } from "../lib/t.mjs";
import { desktopInvoke } from "../lib/desktop.mjs";
import {
  FORMATS, bytesPerSample, parseSigmfMeta, sigmfMetaPath, fromBase64, decode, meanPowerDb,
  welch, db, binFrequencies, overviewOffsets, clock,
} from "../lib/iqview.mjs";
await ready();

const $ = (id) => document.getElementById(id);
const NS = "http://www.w3.org/2000/svg";
function el(tag, attrs, ...kids) {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs || {})) { if (v != null) n.setAttribute(k, v); }
  for (const k of kids.flat()) if (k != null) n.append(k.nodeType ? k : document.createTextNode(String(k)));
  return n;
}
function sv(tag, attrs) {
  const n = document.createElementNS(NS, tag);
  for (const [k, v] of Object.entries(attrs || {})) n.setAttribute(k, v);
  return n;
}
const fmtNum = (x, d = 0) => (x == null || !Number.isFinite(x) ? "–" : x.toLocaleString(undefined, { maximumFractionDigits: d, minimumFractionDigits: d }));
const fmtBytes = (b) => (b >= 2 ** 30 ? `${fmtNum(b / 2 ** 30, 2)} GiB` : b >= 2 ** 20 ? `${fmtNum(b / 2 ** 20, 1)} MiB` : `${fmtNum(b)} B`);
const fmtHz = (f) => (f == null ? "–" : Math.abs(f) >= 1e6 ? `${fmtNum(f / 1e6, 4)} MHz` : `${fmtNum(f / 1e3, 3)} kHz`);

// The overview: POINTS places spread over the file, CHUNK samples read at each (power and a waterfall row).
const POINTS = 240, CHUNK = 8192, ROW_NFFT = 256, SPEC_NFFT = 1024, SPEC_SEGS = 64;
const S = { invoke: null, path: "", format: "ci16", fs: 0, centre: 0, total: 0, rows: [], power: [], offsets: [], cursor: 0, playing: false, timer: 0, gen: 0 };

document.title = `${t("js-iq-title", "IQ recording")} · Kshana Studio`;
$("iq-crumb").textContent = t("js-iq-title", "IQ recording");
$("btn-theme").addEventListener("click", () => {
  const root = document.documentElement;
  const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
  root.dataset.theme = dark ? "light" : "dark";
  try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
});

const root = $("iq-root");
root.append(
  el("p", { class: "kicker" }, el("i", { style: "--c:var(--nav)" }), t("js-iq-kicker", "Kshana Desktop")),
  el("h1", {}, t("js-iq-h1", "Look through an IQ recording")),
  el("p", { class: "lede" }, t("js-iq-lede", "Open a recording of received GNSS samples of any size from disk: its power over the whole file, a waterfall, and the spectrum at any moment, which you can play through. The file is read in pieces and never changed. This page only reads recordings: it sends nothing to any radio and makes no signal.")),
);

S.invoke = desktopInvoke();
if (!S.invoke) {
  root.append(el("section", { class: "card iq-card" },
    el("p", {}, t("js-iq-needs-desktop", "This page reads recordings from disk, so it opens in Kshana Desktop, the Studio as a native application. In a browser, the command line reads recordings: kshana iq --help."))));
} else {
  buildDesktop();
}

function status(msg, err) { const s = $("iq-status"); s.textContent = msg; s.classList.toggle("err", !!err); }

function buildDesktop() {
  const fmt = el("select", { id: "iq-format", class: "iq-in" }, Object.keys(FORMATS).map((f) => el("option", { value: f }, f)));
  fmt.value = S.format;
  root.append(
    el("section", { class: "card iq-card", "aria-labelledby": "iq-open-h" },
      el("h2", { id: "iq-open-h", class: "h3" }, t("js-iq-open-h", "Recording")),
      el("div", { class: "iq-form" },
        el("label", { class: "iq-wide" }, el("span", {}, t("js-iq-path", "File path (a .sigmf-data, or raw samples)")),
          el("input", { id: "iq-path", class: "iq-in", type: "text", spellcheck: "false", placeholder: "/data/capture.sigmf-data" })),
        el("label", {}, el("span", {}, t("js-iq-format", "Sample format")), fmt),
        el("label", {}, el("span", {}, t("js-iq-rate", "Sample rate (Hz)")), el("input", { id: "iq-rate", class: "iq-in", type: "number", min: "1", step: "any", value: "4000000" })),
        el("label", {}, el("span", {}, t("js-iq-centre", "Centre frequency (Hz)")), el("input", { id: "iq-centre", class: "iq-in", type: "number", step: "any", value: "1575420000" })),
        el("button", { id: "iq-open", type: "button", class: "btn-primary iq-open" }, t("js-iq-open", "Open"))),
      el("p", { class: "iq-note" }, t("js-iq-sigmf-note", "A SigMF recording fills the format, rate and frequency from its .sigmf-meta file. Raw samples need them typed in.")),
      el("p", { id: "iq-status", class: "iq-status", role: "status", "aria-live": "polite" }),
      el("dl", { id: "iq-facts", class: "iq-facts", hidden: "" })),
    el("section", { class: "card iq-card", id: "iq-view", "aria-labelledby": "iq-over-h", hidden: "" },
      el("h2", { id: "iq-over-h", class: "h3" }, t("js-iq-over-h", "The whole recording")),
      el("p", { class: "iq-note" }, t("js-iq-over-note", "Power (dB full scale) and a waterfall from samples read at evenly spaced places through the file. Click or use the arrow keys to move the cursor.")),
      el("div", { id: "iq-over", class: "iq-over", tabindex: "0", role: "slider", "aria-label": t("js-iq-cursor", "Time in the recording"), "aria-valuemin": "0" }),
      el("div", { class: "iq-transport" },
        el("button", { id: "iq-play", type: "button", class: "iq-btn" }, t("js-iq-play", "Play through")),
        el("span", { id: "iq-time", class: "iq-time" })),
      el("h2", { class: "h3" }, t("js-iq-spec-h", "Spectrum at the cursor")),
      el("div", { id: "iq-spec", class: "iq-spec" }),
      el("p", { id: "iq-spec-note", class: "iq-note" })),
  );
  fmt.addEventListener("change", () => { S.format = fmt.value; });
  $("iq-open").addEventListener("click", open);
  $("iq-path").addEventListener("keydown", (e) => { if (e.key === "Enter") open(); });
  $("iq-play").addEventListener("click", () => (S.playing ? stop() : play()));
  const over = $("iq-over");
  over.addEventListener("click", (e) => {
    const r = over.getBoundingClientRect();
    setCursor(Math.round(((e.clientX - r.left) / r.width) * (S.offsets.length - 1)));
  });
  over.addEventListener("keydown", (e) => {
    const step = { ArrowRight: 1, ArrowLeft: -1, PageUp: 10, PageDown: -10 }[e.key];
    if (step) { e.preventDefault(); setCursor(S.cursor + step); }
    else if (e.key === "Home") setCursor(0);
    else if (e.key === "End") setCursor(S.offsets.length - 1);
  });
}

async function readSamples(offsetSamples, n) {
  const bps = bytesPerSample(S.format);
  const r = await S.invoke("read_range", { path: S.path, offset: offsetSamples * bps, len: n * bps });
  return decode(fromBase64(r.base64), S.format);
}

async function open() {
  stop();
  const gen = ++S.gen;
  const path = $("iq-path").value.trim();
  if (!path) { status(t("js-iq-err-no-path", "Type the path of a recording."), true); return; }
  try {
    status(t("js-iq-opening", "Opening…"));
    const metaPath = sigmfMetaPath(path);
    let dataPath = path;
    if (metaPath) {
      dataPath = metaPath.replace(/\.sigmf-meta$/i, ".sigmf-data");
      const m = await S.invoke("read_range", { path: metaPath, offset: 0, len: 1 << 20 });
      const meta = parseSigmfMeta(new TextDecoder().decode(fromBase64(m.base64)));
      if (!meta.format) throw new Error(t("js-iq-err-datatype", "the recording's datatype { $datatype } is not one this page reads (ci8, cu8, ci16_le, cf32_le)", { datatype: String(meta.datatype) }));
      $("iq-format").value = meta.format;
      if (meta.sampleRateHz) $("iq-rate").value = String(meta.sampleRateHz);
      if (meta.centreHz != null) $("iq-centre").value = String(meta.centreHz);
    }
    S.path = dataPath;
    S.format = $("iq-format").value;
    S.fs = Number($("iq-rate").value);
    S.centre = Number($("iq-centre").value) || 0;
    if (!(S.fs > 0)) throw new Error(t("js-iq-err-rate", "the sample rate must be a positive number of hertz"));
    const probe = await S.invoke("iq_probe", { path: S.path, format: S.format, probe: 1 << 20 });
    if (gen !== S.gen) return;
    S.total = probe.samples;
    showFacts(probe);
    if (S.total < ROW_NFFT) throw new Error(t("js-iq-err-short", "the recording holds fewer than { $n } samples", { n: ROW_NFFT }));
    await overview(gen);
  } catch (e) {
    if (gen === S.gen) status(t("js-iq-err-open", "{ $path }: could not be read ({ $reason }).", { path, reason: e && e.message ? e.message : String(e) }), true);
  }
}

function showFacts(p) {
  const dl = $("iq-facts");
  const row = (k, v) => [el("dt", {}, k), el("dd", {}, v)];
  dl.replaceChildren(
    ...row(t("js-iq-fact-file", "File"), S.path),
    ...row(t("js-iq-fact-size", "Size"), fmtBytes(p.bytes)),
    ...row(t("js-iq-fact-samples", "Samples"), `${fmtNum(p.samples)} (${S.format})`),
    ...row(t("js-iq-fact-duration", "Duration"), clock(p.samples / S.fs)),
    ...row(t("js-iq-fact-centre", "Centre, span"), `${fmtHz(S.centre)}, ${fmtHz(S.fs)}`),
    ...row(t("js-iq-fact-power", "Power of the first { $n } samples", { n: fmtNum(p.probed_samples) }), p.mean_power_dbfs == null ? "–" : `${fmtNum(p.mean_power_dbfs, 1)} dBFS`),
    ...row(t("js-iq-fact-peak", "Peak magnitude there"), `${fmtNum(p.peak_magnitude, 3)} FS`),
  );
  dl.hidden = false;
}

async function overview(gen) {
  S.offsets = overviewOffsets(S.total, POINTS, Math.min(CHUNK, S.total));
  S.rows = [];
  S.power = [];
  $("iq-view").hidden = false;
  for (let i = 0; i < S.offsets.length; i++) {
    if (gen !== S.gen) return;
    const iq = await readSamples(S.offsets[i], Math.min(CHUNK, S.total));
    S.power.push(meanPowerDb(iq));
    S.rows.push(welch(iq, ROW_NFFT).bins);
    if (i % 24 === 0 || i === S.offsets.length - 1) {
      status(t("js-iq-reading", "Reading the recording: { $done } of { $all } places.", { done: i + 1, all: S.offsets.length }));
      drawOverview();
    }
  }
  status(t("js-iq-read", "Read { $n } places through { $duration } of recording, { $chunk } samples at each.", { n: S.offsets.length, duration: clock(S.total / S.fs), chunk: fmtNum(Math.min(CHUNK, S.total)) }));
  $("iq-over").setAttribute("aria-valuemax", String(S.offsets.length - 1));
  await setCursor(0);
}

function drawOverview() {
  const box = $("iq-over");
  const W = 960, PH = 90, WH = 160, n = Math.max(S.offsets.length, 2);
  const svg = sv("svg", { viewBox: `0 0 ${W} ${PH + WH}`, class: "iq-svg", "aria-hidden": "true", preserveAspectRatio: "none" });
  const ps = S.power.filter((p) => p != null);
  const lo = ps.length ? Math.min(...ps) - 1 : -60, hi = ps.length ? Math.max(...ps) + 1 : 0;
  const x = (i) => (i / (n - 1)) * W, y = (p) => PH - 6 - ((p - lo) / Math.max(1e-9, hi - lo)) * (PH - 16);
  svg.append(sv("polyline", { class: "iq-pow", points: S.power.map((p, i) => (p == null ? "" : `${x(i).toFixed(1)},${y(p).toFixed(1)}`)).join(" ") }));
  const lab = sv("text", { x: "4", y: "12", class: "iq-axis" });
  lab.textContent = `${fmtNum(hi, 0)} dBFS`;
  const lab2 = sv("text", { x: "4", y: String(PH - 8), class: "iq-axis" });
  lab2.textContent = `${fmtNum(lo, 0)} dBFS`;
  svg.append(lab, lab2);
  // Waterfall: one column per place, frequency upwards, drawn into a canvas image.
  if (S.rows.length) {
    const c = document.createElement("canvas");
    c.width = S.offsets.length;
    c.height = ROW_NFFT;
    const g = c.getContext("2d"), img = g.createImageData(c.width, c.height);
    const all = S.rows.flatMap((r) => Array.from(r, (v) => db(v)));
    const sorted = all.slice().sort((a, b) => a - b);
    const flo = sorted[Math.floor(sorted.length * 0.05)], fhi = sorted[sorted.length - 1];
    S.rows.forEach((r, col) => {
      for (let k = 0; k < ROW_NFFT; k++) {
        const v = Math.min(1, Math.max(0, (db(r[k]) - flo) / Math.max(1e-9, fhi - flo)));
        const o = 4 * ((ROW_NFFT - 1 - k) * c.width + col);
        img.data[o] = Math.round(20 + 235 * v * v); img.data[o + 1] = Math.round(30 + 200 * v); img.data[o + 2] = Math.round(90 + 120 * (1 - v)); img.data[o + 3] = 255;
      }
    });
    g.putImageData(img, 0, 0);
    svg.append(sv("image", { href: c.toDataURL(), x: "0", y: String(PH), width: String(W), height: String(WH), preserveAspectRatio: "none" }));
  }
  const cx = x(S.cursor);
  svg.append(sv("line", { class: "iq-cur", x1: cx, x2: cx, y1: "0", y2: String(PH + WH) }));
  box.replaceChildren(svg);
}

async function setCursor(i) {
  if (!S.offsets.length) return;
  S.cursor = Math.max(0, Math.min(S.offsets.length - 1, i));
  const at = S.offsets[S.cursor] / S.fs;
  $("iq-over").setAttribute("aria-valuenow", String(S.cursor));
  $("iq-over").setAttribute("aria-valuetext", clock(at));
  $("iq-time").textContent = `${clock(at)} / ${clock(S.total / S.fs)}`;
  drawOverview();
  const gen = S.gen;
  const n = Math.min(SPEC_NFFT * SPEC_SEGS, S.total - S.offsets[S.cursor]);
  const iq = await readSamples(S.offsets[S.cursor], n);
  if (gen !== S.gen) return;
  drawSpectrum(welch(iq, SPEC_NFFT));
}

function drawSpectrum({ bins, segments }) {
  const box = $("iq-spec");
  if (!segments) { box.replaceChildren(); return; }
  const W = 960, H = 220, f = binFrequencies(SPEC_NFFT, S.fs, S.centre);
  const d = Array.from(bins, (v) => db(v));
  const lo = Math.min(...d), hi = Math.max(...d) + 3;
  const x = (k) => (k / (SPEC_NFFT - 1)) * W, y = (v) => H - 18 - ((v - lo) / Math.max(1e-9, hi - lo)) * (H - 30);
  const svg = sv("svg", { viewBox: `0 0 ${W} ${H}`, class: "iq-svg", role: "img", "aria-label": t("js-iq-spec-aria", "Spectrum at { $time }, { $lo } to { $hi } dB full scale per bin", { time: clock(S.offsets[S.cursor] / S.fs), lo: fmtNum(lo, 0), hi: fmtNum(hi, 0) }), preserveAspectRatio: "none" });
  svg.append(sv("polyline", { class: "iq-psd", points: d.map((v, k) => `${x(k).toFixed(1)},${y(v).toFixed(1)}`).join(" ") }));
  for (const [k, anchor] of [[0, "start"], [SPEC_NFFT / 2, "middle"], [SPEC_NFFT - 1, "end"]]) {
    const tx = sv("text", { x: String(x(k)), y: String(H - 4), "text-anchor": anchor, class: "iq-axis" });
    tx.textContent = fmtHz(f[k]);
    svg.append(tx);
  }
  const top = sv("text", { x: "4", y: "12", class: "iq-axis" });
  top.textContent = `${fmtNum(hi, 0)} dBFS/bin`;
  svg.append(top);
  box.replaceChildren(svg);
  $("iq-spec-note").textContent = t("js-iq-spec-note", "{ $segs } Hann-windowed segments of { $nfft } samples ({ $res } per bin), averaged. Bins sum to the power of the samples read.", { segs: segments, nfft: SPEC_NFFT, res: fmtHz(S.fs / SPEC_NFFT) });
}

function play() {
  if (!S.offsets.length) return;
  S.playing = true;
  $("iq-play").textContent = t("js-iq-pause", "Pause");
  if (S.cursor >= S.offsets.length - 1) S.cursor = -1;
  const step = async () => {
    if (!S.playing) return;
    await setCursor(S.cursor + 1);
    if (S.cursor >= S.offsets.length - 1) { stop(); return; }
    S.timer = setTimeout(step, 250);
  };
  step();
}

function stop() {
  S.playing = false;
  clearTimeout(S.timer);
  const b = $("iq-play");
  if (b) b.textContent = t("js-iq-play", "Play through");
}
