// SPDX-License-Identifier: AGPL-3.0-only
// A minimal ZIP writer (stored, no compression) so a page can hand several generated files over as one
// download without a library or a server. Pure; tested in zip.test.mjs against an independent reader.

const enc = new TextEncoder();
let table = null;
function crcTable() {
  if (table) return table;
  table = new Uint32Array(256);
  for (let n = 0; n < 256; n++) { let c = n; for (let k = 0; k < 8; k++) c = c & 1 ? 0xEDB88320 ^ (c >>> 1) : c >>> 1; table[n] = c >>> 0; }
  return table;
}
export function crc32(bytes) {
  const t = crcTable();
  let c = 0xFFFFFFFF;
  for (let i = 0; i < bytes.length; i++) c = t[(c ^ bytes[i]) & 0xFF] ^ (c >>> 8);
  return (c ^ 0xFFFFFFFF) >>> 0;
}

const u16 = (n) => [n & 0xFF, (n >>> 8) & 0xFF];
const u32 = (n) => [n & 0xFF, (n >>> 8) & 0xFF, (n >>> 16) & 0xFF, (n >>> 24) & 0xFF];

// DOS date and time of 2026-01-01 00:00:00 for every entry: a fixed stamp, so the same files always give the
// same bytes. (Year 2026 is 46 years after 1980.)
const DOS_TIME = 0, DOS_DATE = ((2026 - 1980) << 9) | (1 << 5) | 1;

// files: [{ name, data: string | Uint8Array }] -> Uint8Array. Names are used as given (UTF-8, flag bit 11);
// a name with a path separator or a leading slash or ".." is refused so an archive cannot write outside its folder.
export function zip(files) {
  const parts = [], central = [];
  let offset = 0;
  const seen = new Set();
  for (const f of files) {
    const name = String(f.name);
    if (!name || name.startsWith("/") || name.includes("\\") || name.split("/").includes("..")) throw new Error(`refused file name: ${name}`);
    if (seen.has(name)) throw new Error(`duplicate file name: ${name}`);
    seen.add(name);
    const nameB = enc.encode(name);
    const data = typeof f.data === "string" ? enc.encode(f.data) : f.data;
    const crc = crc32(data);
    const local = [0x50, 0x4B, 0x03, 0x04, ...u16(20), ...u16(0x0800), ...u16(0), ...u16(DOS_TIME), ...u16(DOS_DATE), ...u32(crc), ...u32(data.length), ...u32(data.length), ...u16(nameB.length), ...u16(0)];
    parts.push(Uint8Array.from(local), nameB, data);
    central.push({ nameB, crc, size: data.length, offset });
    offset += local.length + nameB.length + data.length;
  }
  const cdStart = offset;
  for (const c of central) {
    const h = [0x50, 0x4B, 0x01, 0x02, ...u16(20), ...u16(20), ...u16(0x0800), ...u16(0), ...u16(DOS_TIME), ...u16(DOS_DATE), ...u32(c.crc), ...u32(c.size), ...u32(c.size), ...u16(c.nameB.length), ...u16(0), ...u16(0), ...u16(0), ...u16(0), ...u32(0), ...u32(c.offset)];
    parts.push(Uint8Array.from(h), c.nameB);
    offset += h.length + c.nameB.length;
  }
  const cdSize = offset - cdStart;
  parts.push(Uint8Array.from([0x50, 0x4B, 0x05, 0x06, ...u16(0), ...u16(0), ...u16(central.length), ...u16(central.length), ...u32(cdSize), ...u32(cdStart), ...u16(0)]));
  const out = new Uint8Array(parts.reduce((n, p) => n + p.length, 0));
  let o = 0;
  for (const p of parts) { out.set(p, o); o += p.length; }
  return out;
}
