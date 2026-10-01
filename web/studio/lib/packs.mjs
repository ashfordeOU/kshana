// SPDX-License-Identifier: AGPL-3.0-only
// Reads a recorded run, or the native engine's recording of one, from either layout the
// Studio is served in:
//   loose   one file per scenario beside its index.json (recorded/<name>.json,
//           native/<name>.json.gz); the index entry names it as `file`;
//   packed  several scenarios in one gzip-compressed JSON object keyed by that same file
//           name (recorded/pack-00.json.gz, ...), for a host that limits the number of
//           files; the index entry then also names its `pack`. tools_bundle.mjs writes it.
// The index entry decides, so a folder needs no second listing and a loose folder is never
// asked for a pack. Pure logic apart from the fetch function it is given.

/// True when the bytes start with the gzip magic number.
export function isGzip(bytes) {
  return !!bytes && bytes.length > 2 && bytes[0] === 0x1f && bytes[1] === 0x8b;
}

/// The text of a gzip-compressed (or plain) byte array.
export async function bytesToText(bytes) {
  if (!isGzip(bytes)) return new TextDecoder().decode(bytes);
  if (typeof DecompressionStream !== "function") throw new Error("this browser cannot unpack the recorded file");
  return new Response(new Blob([bytes]).stream().pipeThrough(new DecompressionStream("gzip"))).text();
}

/// A reader over one fetch function. `load(base, entry)` resolves to the record an index
/// entry names (or null when the host does not have it); a pack is fetched once and shared
/// by every entry in it. `index(base)` resolves to the folder's index.json (or null).
export function createPackReader(fetchFn = (...a) => fetch(...a)) {
  const packs = new Map();
  const indexes = new Map();
  async function json(url) {
    const res = await fetchFn(url);
    if (!res || !res.ok) return null;
    return JSON.parse(await bytesToText(new Uint8Array(await res.arrayBuffer())));
  }
  function pack(url) {
    if (!packs.has(url)) packs.set(url, json(url));
    return packs.get(url);
  }
  return {
    index(base) {
      if (!indexes.has(base)) indexes.set(base, json(`${base}index.json`).catch(() => null));
      return indexes.get(base);
    },
    async load(base, entry) {
      if (!entry || entry.error || !entry.file) return null;
      if (entry.pack) {
        const all = await pack(`${base}${entry.pack}`);
        return all && Object.prototype.hasOwnProperty.call(all, entry.file) ? all[entry.file] : null;
      }
      return json(`${base}${entry.file}`);
    },
    /// The recorded run of a bundled scenario, by scenario file name (with or without
    /// ".toml"), from the folder `base` (for example "recorded/").
    async run(base, scenario) {
      const idx = await this.index(base);
      const key = scenario.endsWith(".toml") ? scenario : `${scenario}.toml`;
      return idx && idx.runs ? this.load(base, idx.runs[key]) : null;
    },
  };
}

/// Splits `items` ([{ name, bytes }], in the order given) into at most `max` consecutive
/// groups of similar total size. Deterministic: the same items give the same groups.
export function planPacks(items, max) {
  if (!items.length) return [];
  const total = items.reduce((s, x) => s + x.bytes, 0);
  let target = Math.max(1, Math.ceil(total / Math.max(1, max)));
  for (;;) {
    const groups = [];
    let cur = [], size = 0;
    for (const it of items) {
      if (cur.length && size + it.bytes > target) { groups.push(cur); cur = []; size = 0; }
      cur.push(it.name);
      size += it.bytes;
    }
    if (cur.length) groups.push(cur);
    if (groups.length <= max) return groups;
    target = Math.ceil(target * 1.05) + 1;
  }
}
