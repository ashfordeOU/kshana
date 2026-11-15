// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the globe (0.42 U24), pure parts. Positions on the WGS-84 ellipsoid in
// Earth-fixed kilometres (z to the north pole, x through 0° longitude), the Natural Earth
// coastlines and the graticule as line segments on the sphere, the coverage circle of a
// satellite or a station (the ground within which it is seen above an elevation mask), the
// camera that follows an object, offline region packs, and the optional imagery sources with
// their licence terms. Tested in globe.test.mjs; the view is lib/globeview.mjs.

export const WGS84_A_KM = 6378.137;
export const WGS84_F = 1 / 298.257223563;
const E2 = WGS84_F * (2 - WGS84_F);
/** The mean Earth radius (km) used for coverage circles (a sphere is accurate to about 0.3 % there). */
export const R_MEAN_KM = 6371.0088;
const D2R = Math.PI / 180;

/** Earth-fixed position (km) of a geodetic latitude, longitude (degrees) and height (m) on WGS-84. */
export function ecefKm(latDeg, lonDeg, hM = 0) {
  const la = latDeg * D2R, lo = lonDeg * D2R, s = Math.sin(la), c = Math.cos(la);
  const n = WGS84_A_KM / Math.sqrt(1 - E2 * s * s), h = hM / 1000;
  return [(n + h) * c * Math.cos(lo), (n + h) * c * Math.sin(lo), (n * (1 - E2) + h) * s];
}

/** The rings of a packed Natural Earth layer (kshana-land/1) as [lon, lat] degree pairs (Float64Array each). */
export function landRings(packed) {
  if (!packed || packed.format !== "kshana-land/1" || !Array.isArray(packed.rings)) throw new Error("not a kshana-land/1 layer");
  const q = Number(packed.quantum);
  return packed.rings.map((r) => {
    const n = r.length >> 1, out = new Float64Array(2 * n);
    let x = 0, y = 0;
    for (let i = 0; i < n; i++) { x += r[2 * i]; y += r[2 * i + 1]; out[2 * i] = x * q; out[2 * i + 1] = y * q; }
    return out;
  });
}

/**
 * Line segments (flat xyz pairs, km) of lon/lat polylines on the ellipsoid at height `hM`, each
 * edge split so no piece spans more than `maxDeg`. `closed` joins each ring's last vertex to its first.
 */
export function segmentsOf(lines, { hM = 0, maxDeg = 2, closed = true, box = null } = {}) {
  const out = [];
  // an edge along a region pack's box is where the pack was cut, not a coastline
  const onBox = (a, b) => box && ((a[0] === b[0] && (Math.abs(a[0] - box[0]) < 1e-6 || Math.abs(a[0] - box[2]) < 1e-6)) || (a[1] === b[1] && (Math.abs(a[1] - box[1]) < 1e-6 || Math.abs(a[1] - box[3]) < 1e-6)));
  for (const r of lines) {
    const n = r.length >> 1;
    for (let i = 0; i < (closed ? n : n - 1); i++) {
      const j = (i + 1) % n;
      let [lo0, la0, lo1, la1] = [r[2 * i], r[2 * i + 1], r[2 * j], r[2 * j + 1]];
      if (Math.abs(lo1 - lo0) > 180) continue; // the antimeridian cut of a ring is not a coastline
      if (onBox([lo0, la0], [lo1, la1])) continue;
      const k = Math.max(1, Math.ceil(Math.max(Math.abs(lo1 - lo0), Math.abs(la1 - la0)) / maxDeg));
      let p = ecefKm(la0, lo0, hM);
      for (let s = 1; s <= k; s++) {
        const q = ecefKm(la0 + ((la1 - la0) * s) / k, lo0 + ((lo1 - lo0) * s) / k, hM);
        out.push(p[0], p[1], p[2], q[0], q[1], q[2]);
        p = q;
      }
    }
  }
  return out;
}

/** Graticule lines every `step` degrees, as lon/lat polylines (open). */
export function graticuleLines(step = 30) {
  const lines = [];
  for (let la = -90 + step; la < 90; la += step) { const r = []; for (let lo = -180; lo <= 180; lo += 2) r.push(lo, la); lines.push(r); }
  for (let lo = -180; lo < 180; lo += step) { const r = []; for (let la = -88; la <= 88; la += 2) r.push(lo, la); lines.push(r); }
  return lines;
}

/**
 * The Earth central angle (degrees) of the coverage circle of an object at height `hKm` above a
 * sphere of radius R_MEAN_KM, seen above an elevation mask of `maskDeg`: λ = acos(R cos ε / (R + h)) − ε.
 * The same angle bounds where a station sees a satellite at that height.
 */
export function coverageAngleDeg(hKm, maskDeg = 0) {
  if (!(hKm > 0)) return 0;
  const e = maskDeg * D2R;
  return (Math.acos((R_MEAN_KM * Math.cos(e)) / (R_MEAN_KM + hKm)) - e) / D2R;
}

/** The ring (lon/lat pairs) at central angle `angDeg` about (latDeg, lonDeg), `n` points. */
export function circleLonLat(latDeg, lonDeg, angDeg, n = 96) {
  const la = latDeg * D2R, lo = lonDeg * D2R, d = angDeg * D2R, out = [];
  for (let k = 0; k < n; k++) {
    const b = (2 * Math.PI * k) / n;
    const la2 = Math.asin(Math.sin(la) * Math.cos(d) + Math.cos(la) * Math.sin(d) * Math.cos(b));
    const lo2 = lo + Math.atan2(Math.sin(b) * Math.sin(d) * Math.cos(la), Math.cos(d) - Math.sin(la) * Math.sin(la2));
    out.push((((lo2 / D2R) + 540) % 360) - 180, la2 / D2R);
  }
  return out;
}

/** The camera angles (lib/chart/mat3d.mjs orbit camera, z up) that look at (latDeg, lonDeg) from above. */
export function followCamera(latDeg, lonDeg) {
  return { yaw: lonDeg * D2R, pitch: Math.max(-1.45, Math.min(1.45, latDeg * D2R)) };
}

/** The sub-point (geocentric latitude, longitude in degrees) and height (km above WGS-84 at the equator radius) of an Earth-fixed position. */
export function subPoint([x, y, z]) {
  const r = Math.hypot(x, y, z);
  return { lat: Math.asin(z / r) / D2R, lon: Math.atan2(y, x) / D2R, hKm: r - WGS84_A_KM };
}

// ---------------------------------------------------------------- offline region packs
/** The format of a region pack. */
export const PACK_FORMAT = "kshana-mappack/1";

/**
 * Check a region pack ({ format, name, bbox: [west, south, east, north], source, licence, land:
 * kshana-land/1 }): { ok, pack, reason }. A pack holds Natural Earth (public domain) or another
 * source whose licence it states.
 */
export function checkPack(doc) {
  if (!doc || doc.format !== PACK_FORMAT) return { ok: false, reason: "format" };
  const b = doc.bbox;
  if (!Array.isArray(b) || b.length !== 4 || !b.every(Number.isFinite) || b[0] >= b[2] || b[1] >= b[3] || b[1] < -90 || b[3] > 90 || b[0] < -180 || b[2] > 180) return { ok: false, reason: "bbox" };
  if (!doc.name || typeof doc.name !== "string") return { ok: false, reason: "name" };
  if (!doc.licence || !doc.source) return { ok: false, reason: "licence" };
  if (!doc.land || doc.land.format !== "kshana-land/1" || !Array.isArray(doc.land.rings)) return { ok: false, reason: "land" };
  return { ok: true, pack: doc };
}

/** Whether the pack's box holds the whole lon/lat box `view` ([west, south, east, north]). */
export function packCovers(pack, view) {
  const b = pack.bbox;
  return view[0] >= b[0] && view[2] <= b[2] && view[1] >= b[1] && view[3] <= b[3];
}

// ---------------------------------------------------------------- optional imagery
/**
 * Imagery the globe can drape, off unless the person turns it on. Only sources whose terms allow
 * keeping tiles for offline use are listed; each states its terms. Tiles are fetched once, by
 * the person's choice, and kept on this computer.
 */
export const IMAGERY_SOURCES = [
  {
    id: "nasa-gibs-bluemarble",
    name: "NASA Blue Marble: Next Generation (via NASA GIBS)",
    // GIBS EPSG:4326 "500m" tile matrix set (WMTSCapabilities): 512-pixel tiles from (-180, 90), level 0
    // two tiles of 288° (the world and padding), each level halving the tile: 2×1, 3×2, 5×3, 10×5.
    template: "https://gibs.earthdata.nasa.gov/wmts/epsg4326/best/BlueMarble_NextGeneration/default/500m/{level}/{row}/{col}.jpeg",
    tile: 512, maxLevel: 3, crs: "EPSG:4326",
    licence: "NASA has a free and open policy for data and information generated under NASA sponsorship (Earthdata, Data Use and Citation Guidance); NASA imagery is not protected by copyright in the United States, and NASA asks to be credited. Keeping the tiles on this computer for offline use is within those terms.",
    terms: "https://www.earthdata.nasa.gov/engage/open-data-services-software-policies/data-use-guidance",
    credit: "Imagery: NASA Earth Observatory / NASA GIBS (Blue Marble: Next Generation)",
  },
];

/** The tiles of an EPSG:4326 source at `level`: [{ level, row, col, url, west, north, deg }]. */
export function tilesOf(source, level) {
  const L = Math.max(0, Math.min(source.maxLevel, Math.floor(level)));
  const deg = 288 / 2 ** L, cols = Math.ceil(360 / deg - 1e-9), rows = Math.ceil(180 / deg - 1e-9);
  const out = [];
  for (let row = 0; row < rows; row++) for (let col = 0; col < cols; col++) {
    out.push({ level: L, row, col, url: source.template.replace("{level}", String(L)).replace("{row}", String(row)).replace("{col}", String(col)), west: -180 + col * deg, north: 90 - row * deg, deg });
  }
  return out;
}

/** The file name a tile is kept under on this computer. */
export const tileKey = (source, t) => `${source.id}/${t.level}/${t.row}/${t.col}.jpeg`;
