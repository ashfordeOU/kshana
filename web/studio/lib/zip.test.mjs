// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the ZIP writer (zip.mjs), read back by an independent minimal reader and, where Python is
// present, by its zipfile module. Run with `node lib/zip.test.mjs`.
import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { writeFileSync, mkdtempSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { zip, crc32 } from "./zip.mjs";

// CRC-32 known answers (IEEE): "123456789" -> CBF43926, empty -> 0.
assert.equal(crc32(new TextEncoder().encode("123456789")).toString(16).toUpperCase(), "CBF43926");
assert.equal(crc32(new Uint8Array(0)), 0);

const files = [{ name: "run1.motion.csv", data: "time_s,x_m\n0,1\n" }, { name: "run1.nmea", data: new Uint8Array([36, 71, 80, 13, 10, 0, 255]) }, { name: "ünï.txt", data: "ok" }, { name: "empty.txt", data: "" }];
const z = zip(files);

// read back: end of central directory, then each entry by its central record
function read(z) {
  const dv = new DataView(z.buffer, z.byteOffset, z.byteLength);
  const eocd = z.length - 22;
  assert.equal(dv.getUint32(eocd, true), 0x06054b50);
  const n = dv.getUint16(eocd + 10, true), cdOff = dv.getUint32(eocd + 16, true);
  const out = [];
  let p = cdOff;
  for (let i = 0; i < n; i++) {
    assert.equal(dv.getUint32(p, true), 0x02014b50);
    const crc = dv.getUint32(p + 16, true), size = dv.getUint32(p + 24, true), nl = dv.getUint16(p + 28, true), lo = dv.getUint32(p + 42, true);
    const name = new TextDecoder().decode(z.subarray(p + 46, p + 46 + nl));
    assert.equal(dv.getUint32(lo, true), 0x04034b50);
    const lnl = dv.getUint16(lo + 26, true), lel = dv.getUint16(lo + 28, true);
    const data = z.subarray(lo + 30 + lnl + lel, lo + 30 + lnl + lel + size);
    assert.equal(crc32(data), crc);
    out.push({ name, data });
    p += 46 + nl;
  }
  return out;
}
const back = read(z);
assert.deepEqual(back.map((f) => f.name), files.map((f) => f.name));
assert.equal(new TextDecoder().decode(back[0].data), "time_s,x_m\n0,1\n");
assert.deepEqual([...back[1].data], [36, 71, 80, 13, 10, 0, 255]);
assert.equal(back[3].data.length, 0);
// deterministic
assert.deepEqual(zip(files), z);
// refused names
for (const bad of ["../x", "/abs", "a\\b", "a/../b", ""]) assert.throws(() => zip([{ name: bad, data: "x" }]), /refused file name/);
assert.throws(() => zip([{ name: "a", data: "x" }, { name: "a", data: "y" }]), /duplicate/);
// an independent reader, if Python is here
try {
  const d = mkdtempSync(join(tmpdir(), "zip-test-"));
  writeFileSync(join(d, "t.zip"), z);
  const out = execFileSync("python3", ["-I", "-c", "import zipfile,sys;z=zipfile.ZipFile(sys.argv[1]);print(z.testzip());print(sorted(z.namelist()))", join(d, "t.zip")], { encoding: "utf8" });
  assert.match(out, /^None\n/);
  assert.match(out, /run1\.motion\.csv/);
} catch (e) { if (e.code !== "ENOENT") throw e; }
console.log("zip.test.mjs: ok");
