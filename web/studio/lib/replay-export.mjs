// SPDX-License-Identifier: AGPL-3.0-only
// Saving a replay: an animated SVG (every frame in one file, played by the browser) or the frames as separate SVG
// files in a ZIP with a manifest of the rows each frame was drawn from. Both are drawn by lib/replay-draw.mjs
// from the same rows as the page, so a frame is exactly what the page showed at that time. The engine's own
// --animate writes scenario animations (orbits, coverage); it has no output for a receiver-trust log, so a replay
// is drawn here from the logs and the engine's scores instead. Pure; tested in replay-export.test.mjs.
import { frameStatic, frameDynamic, frameSvg, svgDoc, FRAME_W, FRAME_H } from "./replay-draw.mjs";
import { stateAt } from "./replay.mjs";
import { zip } from "./zip.mjs";

export const MAX_FRAMES = 300;

// Mission times of the frames: every `stepS` seconds from 0 to the end (the end is always the last frame). The
// step is at least the finest sample interval of the panels and is raised so there are at most MAX_FRAMES.
export function frameTimes(panels, tMax, wantStepS = 0) {
  const fine = Math.min(...panels.map((p) => p.sampleS));
  const step = Math.max(fine, wantStepS || 0, Math.ceil(tMax / MAX_FRAMES));
  const ts = [];
  for (let t = 0; t < tMax; t += step) ts.push(t);
  ts.push(tMax);
  return { step, times: ts };
}

const pad = (n, w) => String(n).padStart(w, "0");

// The animated SVG: the static layers once, each frame's changing layer shown in turn (SMIL, discrete), looping.
// `speed` is mission seconds per real second.
export function animatedSvg(panels, views, tMax, { speed = 30, stepS = 0, ...opts } = {}) {
  const { step, times } = frameTimes(panels, tMax, stepS);
  const n = times.length, dur = (times.length * step) / speed;
  const frames = times.map((t, k) => {
    const a = k / n, b = (k + 1) / n;
    const kt = k === 0 ? `0;${b};1` : k === n - 1 ? `0;${a};1` : `0;${a};${b};1`;
    const vals = k === 0 ? "visible;hidden;hidden" : k === n - 1 ? "hidden;visible;visible" : "hidden;visible;hidden;hidden";
    return `<g class="rp-frame" data-t="${t}" visibility="${k === 0 ? "visible" : "hidden"}"><animate attributeName="visibility" dur="${dur.toFixed(3)}s" repeatCount="indefinite" calcMode="discrete" keyTimes="${kt}" values="${vals}"/>${frameDynamic(panels, views, tMax, t, opts)}</g>`;
  });
  return svgDoc(panels, frameStatic(panels, views, tMax, opts) + frames.join(""));
}

// The rows a frame was drawn from, for the manifest.
export function frameRecord(panels, t, k) {
  return { frame: k, t, panels: panels.map((p) => { const st = stateAt(p, t); const r = st.row; return { id: p.id, row_t: r.t, score: r.score, band: r.band, error_m: r.errM, fix: r.fixValid, heading_deg: r.hdg, course_deg: r.cog, run_ended: st.ended }; }) };
}

// The frames as files: frame-0000.svg ... plus manifest.json and README.txt, as one ZIP (Uint8Array).
export function framesZip(panels, views, tMax, { stepS = 0, ...opts } = {}) {
  const { step, times } = frameTimes(panels, tMax, stepS);
  const files = times.map((t, k) => ({ name: `frame-${pad(k, 4)}.svg`, data: frameSvg(panels, views, tMax, t, opts) }));
  const manifest = {
    note: "Each frame-NNNN.svg is the Bridge replay at mission time t (seconds after each run's start), drawn from the rows below: the instructor log, the engine's receiver-trust score and the NMEA log's sky and heading. Synthetic data.",
    size: [FRAME_W, FRAME_H], step_s: step, runs: panels.map((p) => ({ id: p.id, title: p.title, source: p.source })), frames: times.map((t, k) => frameRecord(panels, t, k)),
  };
  files.push({ name: "manifest.json", data: JSON.stringify(manifest, null, 1) + "\n" });
  files.push({ name: "README.txt", data: `Kshana Studio, Bridge replay: ${panels.map((p) => p.title).join(" + ")}\n${files.length - 2} frames, one every ${step} s of mission time, as SVG. Make a video with any tool that reads image sequences, for example:\n  ffmpeg -framerate 24 -i frame-%04d.svg out.mp4   (needs an SVG-capable ffmpeg build; otherwise convert the frames to PNG first)\nSynthetic data for training and testing only. Advisory: not type-approved navigation equipment (IEC 61108, IEC 61162). The coast is illustration, not a chart.\n` });
  return zip(files);
}
