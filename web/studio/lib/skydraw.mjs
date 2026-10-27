// SPDX-License-Identifier: AGPL-3.0-only
// The live skyplot of the Trust, Training and Replay views, as SVG markup (a string) so the same drawing is the
// page's and the exported frame's. The satellites are the log's own GSV (lib/gsv.mjs); the sectors shaded are
// the azimuths where the log lists satellites and hears none of them. Nothing is computed here but screen
// positions, by the Geometry view's polar projection (lib/skyplot.mjs). Pure; tested in skydraw.test.mjs.
import { t } from "./t.mjs";
import { project, markerPath } from "./skyplot.mjs";
import { SYS_LABEL, unheardSectors, skyCounts } from "./gsv.mjs";

// One marker shape and one colour class per constellation, so no reading depends on colour alone.
const SHAPE = Object.freeze({ gps: "circle", galileo: "square", beidou: "triangle", glonass: "diamond", qzss: "cross", navic: "cross", gnss: "circle" });
const shapeOf = (sys) => (Object.hasOwn(SHAPE, sys) ? SHAPE[sys] : "circle");
const clsOf = (sys) => (Object.hasOwn(SHAPE, sys) ? sys : "gnss");

// CSS for the markup. Colours are variables so the page's theme and the exported file's own theme both work.
export const SKY_CSS = `
.sk-h{fill:var(--rp-sky,none);stroke:var(--rp-line2);stroke-width:1.2}
.sk-ring{fill:none;stroke:var(--rp-line);stroke-width:1}
.sk-lbl{font:600 10px var(--rp-mono);fill:var(--rp-ink3);text-anchor:middle}
.sk-un{fill:var(--rp-un);fill-opacity:.22;stroke:var(--rp-un);stroke-width:1;stroke-dasharray:3 3}
.sk-heard{fill:var(--c);stroke:var(--rp-bg);stroke-width:.8}
.sk-quiet{fill:var(--rp-bg);fill-opacity:.4;stroke:var(--c);stroke-width:1.5;stroke-dasharray:2 2}
.sk-prn{font:500 8.5px var(--rp-mono);fill:var(--rp-ink2);text-anchor:start}
.sk-gps{--c:var(--rp-tim)}.sk-galileo{--c:var(--rp-nav)}.sk-beidou{--c:var(--rp-spf)}.sk-glonass{--c:var(--rp-orb)}.sk-qzss,.sk-navic{--c:var(--rp-ink2)}.sk-gnss{--c:var(--rp-ink3)}
`;

const f = (v) => v.toFixed(2);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);

// A pie slice of the horizon disc from azimuth a0 to a1 (degrees, clockwise from north).
function wedge(a0, a1, cx, cy, R) {
  const p0 = project(a0, 0, cx, cy, R), p1 = project(a1, 0, cx, cy, R);
  return `M${f(cx)} ${f(cy)}L${f(p0.x)} ${f(p0.y)}A${f(R)} ${f(R)} 0 ${a1 - a0 > 180 ? 1 : 0} 1 ${f(p1.x)} ${f(p1.y)}Z`;
}

// The markup of one sky: `sats` as [[sys, prn, el, az, snr|null], ...] in a `size` x `size` box.
// `labels` adds the PRN beside each marker (off for the small plots).
export function skyMarkup(sats, { size = 240, labels = true } = {}) {
  const cx = size / 2, cy = size / 2, R = size / 2 - 16;
  const parts = [`<circle class="sk-h" cx="${f(cx)}" cy="${f(cy)}" r="${f(R)}"/>`];
  for (const el of [30, 60]) parts.push(`<circle class="sk-ring" cx="${f(cx)}" cy="${f(cy)}" r="${f(((90 - el) / 90) * R)}"/>`);
  parts.push(`<path class="sk-ring" d="M${f(cx)} ${f(cy - R)}V${f(cy + R)}M${f(cx - R)} ${f(cy)}H${f(cx + R)}"/>`);
  for (const s of unheardSectors(sats)) parts.push(`<path class="sk-un" d="${wedge(s.from, s.to, cx, cy, R)}"><title>${esc(t("js-lib-skydraw-unheard-sector", "Satellites listed between azimuth { $from } and { $to } degrees, none with a signal", { from: s.from, to: s.to }))}</title></path>`);
  const ordered = sats.slice().sort((a, b) => (a[4] == null) - (b[4] == null));
  for (const [sys, prn, el, az, snr] of ordered) {
    const p = project(az, el, cx, cy, R), heard = snr != null;
    parts.push(`<path class="sk-s ${heard ? "sk-heard" : "sk-quiet"} sk-${clsOf(sys)}" d="${markerPath(shapeOf(sys), p.x, p.y, heard ? 5 : 5.5)}"><title>${esc(heard ? t("js-lib-skydraw-sat-heard", "{ $sys } { $prn }: elevation { $el }, azimuth { $az }, signal { $snr } dB-Hz", { sys: SYS_LABEL[sys] || sys, prn, el, az, snr }) : t("js-lib-skydraw-sat-quiet", "{ $sys } { $prn }: elevation { $el }, azimuth { $az }, listed, no signal", { sys: SYS_LABEL[sys] || sys, prn, el, az }))}</title></path>`);
    if (labels) parts.push(`<text class="sk-prn" x="${f(p.x + 7)}" y="${f(p.y + 3)}">${esc(prn)}</text>`);
  }
  for (const [name, a] of [[t("js-lib-skydraw-north", "N"), 0], [t("js-lib-skydraw-east", "E"), 90], [t("js-lib-skydraw-south", "S"), 180], [t("js-lib-skydraw-west", "W"), 270]]) { const p = project(a, 0, cx, cy, R + 9); parts.push(`<text class="sk-lbl" x="${f(p.x)}" y="${f(p.y + 3.5)}">${esc(name)}</text>`); }
  return parts.join("");
}

// One sentence for a screen reader, from the log's own satellites.
export function skyDescribe(sats) {
  if (!sats || !sats.length) return t("js-lib-skydraw-none-listed", "No satellites listed in the log at this time.");
  const c = skyCounts(sats), un = unheardSectors(sats);
  const bits = [c.meanSnr == null ? t("js-lib-skydraw-describe", "{ $listed } satellites listed, { $heard } with a signal", { listed: c.listed, heard: c.heard }) : t("js-lib-skydraw-describe-mean", "{ $listed } satellites listed, { $heard } with a signal, mean { $snr } dB-Hz", { listed: c.listed, heard: c.heard, snr: c.meanSnr.toFixed(1) })];
  if (un.length) bits.push(t("js-lib-skydraw-no-signal-from", "no signal from { $sectors }", { sectors: un.map((s) => t("js-lib-skydraw-azimuth-range", "azimuth { $from } to { $to } degrees", { from: s.from, to: s.to })).join(" and ") }));
  return bits.join("; ") + ".";
}
