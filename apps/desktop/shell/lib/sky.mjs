// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the sky plot of a run (0.42 U16). The satellites a site sees over the
// run, as trails of azimuth and elevation that follow the time cursor, with the elevation mask
// and a colour per satellite state. Every position is the engine's: the engine's sky geometry
// (`sky_geometry`, the same function the Studio's sky geometry page and the Python package
// call) is asked at sampled epochs of the run, and its azimuths and elevations are drawn as
// given, never interpolated into new values (the trail joins the sampled points).
//
// The constellations are the engine's presets (GPS and Galileo by default), propagated to
// the run's seconds; the engine labels them representative: they are not the broadcast
// constellation of the run's date. Pure, no DOM; tested in sky.test.mjs. The request builder
// and the reply reader are the Studio's (web/studio/lib/geometry-adapter.mjs), injected.

/** The satellite states and their colour roles (lib/chart/colour.mjs). */
export const SKY_STATES = Object.freeze({
  used: { role: "good", en: "in view, used" },
  masked: { role: "mid", en: "above the horizon, under the mask or skyline" },
  below: { role: "ink3", en: "below the horizon" },
  unhealthy: { role: "bad", en: "flagged unhealthy by its source" },
});
export const SKY_SYSTEMS = ["gps", "galileo"];
const SYSTEM_COLOUR = { gps: "gps", galileo: "gal", beidou: "bds", leo: "leo", tle: "glo" };
const SYSTEM_LABEL = { gps: "GPS", galileo: "Galileo", beidou: "BeiDou", leo: "LEO", tle: "elements" };

/** `n` epochs evenly over [t0, t1], both ends included (one epoch when the span is empty). */
export function skyEpochs(t0, t1, n = 72) {
  if (!(t1 > t0) || n < 2) return [t0];
  const out = [];
  for (let i = 0; i < n; i++) out.push(t0 + ((t1 - t0) * i) / (n - 1));
  return out;
}

/** The elevation mask a scenario states (`mask_deg` or `elevation_mask_deg`), or null. */
export function scenarioMask(toml) {
  const m = /^\s*(?:elevation_)?mask_deg\s*=\s*([0-9]+(?:\.[0-9]+)?)\s*(?:#.*)?$/m.exec(String(toml || ""));
  const v = m ? Number(m[1]) : NaN;
  return Number.isFinite(v) && v >= 0 && v < 90 ? v : null;
}

/** The site of a run: the scene's receiver, else its first station, else its first site; null without one. */
export function skySite(model) {
  const sites = (model && model.sites) || [];
  const s = sites.find((x) => x.role === "receiver") || sites.find((x) => /station/.test(x.role)) || sites[0];
  return s && Number.isFinite(s.lat) && Number.isFinite(s.lon) ? { lat: s.lat, lon: s.lon, h: 0, name: s.id } : null;
}

/**
 * The sky over the epochs: { tracks, requests, epochs, mask, source, statement, label }.
 * call(name, text) is the engine's call; buildRequest(state) and parseGeometry(doc) the
 * Studio's adapter functions. tracks: [{ id, sys, label, short, group, groupLabel, color,
 * az, el, t, state, raw }] with one entry per epoch (NaN where the engine gave no position);
 * `raw` keeps the engine's az_deg/el_deg as it sent them.
 */
export async function skyTracks({ call, buildRequest, parseGeometry, site, epochs, systems = SKY_SYSTEMS, mask = 5, health = null }) {
  const byId = new Map();
  const requests = [];
  let source = "", statement = "", label = "";
  const n = epochs.length;
  for (let k = 0; k < n; k++) {
    const req = buildRequest({ sys: systems, lat: site.lat, lon: site.lon, h: site.h || 0, t: epochs[k], mask, uere: 1, sky: null, leo: null });
    requests.push(req);
    const doc = JSON.parse(await call("sky_geometry", JSON.stringify(req)));
    const g = parseGeometry(doc);
    source ||= g.skySource || "";
    statement ||= g.skyStatement || "";
    label ||= (g.provenance && g.provenance.label) || "";
    const raws = Array.isArray(doc.satellites) ? doc.satellites : [];
    const norm = (a) => ((a % 360) + 360) % 360;
    for (const s of g.sats) {
      const key = `${s.sys}:${s.id}`;
      let tr = byId.get(key);
      if (!tr) {
        tr = { id: key, sys: s.sys, label: `${SYSTEM_LABEL[s.sys] || s.sys} ${s.id}`, short: `${(SYSTEM_LABEL[s.sys] || s.sys).slice(0, 3)}${s.id}`, group: s.sys, groupLabel: SYSTEM_LABEL[s.sys] || s.sys,
          color: SYSTEM_COLOUR[s.sys] || "ink2", az: new Array(n).fill(NaN), el: new Array(n).fill(NaN), t: epochs.slice(), state: new Array(n).fill("below"), raw: new Array(n).fill(null) };
        byId.set(key, tr);
      }
      tr.az[k] = s.az;
      tr.el[k] = s.el;
      const flagged = health ? health(key, epochs[k]) === "unhealthy" : false;
      tr.state[k] = flagged ? "unhealthy" : s.el < 0 ? "below" : s.used ? "used" : "masked";
      // the engine's own record of this satellite: the drawn values are its values
      const r = raws.find((x) => x && (String(x.id) === s.id || String(x.id) === `${x.system}-${s.id}`) && norm(x.az_deg) === s.az && x.el_deg === s.el);
      tr.raw[k] = r ? { az_deg: r.az_deg, el_deg: r.el_deg, visible: r.visible, masked: r.masked } : null;
    }
  }
  const tracks = [...byId.values()].sort((a, b) => (a.sys === b.sys ? a.id.localeCompare(b.id, "en", { numeric: true }) : a.sys.localeCompare(b.sys)));
  return { tracks, requests, epochs: epochs.slice(), mask, source, statement, label };
}

/** The states a satellite takes at an epoch index, counted: { used, masked, below, unhealthy }. */
export function stateCounts(tracks, k) {
  const out = { used: 0, masked: 0, below: 0, unhealthy: 0 };
  for (const tr of tracks) if (tr.el[k] === tr.el[k]) out[tr.state[k]]++;
  return out;
}

/** The chart spec (lib/chart presets sky) of a sky: polar tracks with their per-epoch states. */
export function skySpec(sky, title) {
  return {
    type: "polar", title, subtitle: sky.mask !== null && sky.mask !== undefined ? `mask ${sky.mask}°` : "", mask: sky.mask,
    stateColors: Object.fromEntries(Object.entries(SKY_STATES).map(([k, v]) => [k, v.role])),
    tracks: sky.tracks.map((tr) => ({ id: tr.id, label: tr.label, short: tr.short, group: tr.group, groupLabel: tr.groupLabel, color: tr.color, az: tr.az, el: tr.el, t: tr.t, state: tr.state,
      visible: tr.state.map((s) => (s === "used" ? 1 : 0)), extra: (i) => [["state", SKY_STATES[tr.state[i]] ? SKY_STATES[tr.state[i]].en : tr.state[i]]] })),
  };
}
