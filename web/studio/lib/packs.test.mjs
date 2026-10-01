// SPDX-License-Identifier: AGPL-3.0-only
import { test } from "node:test";
import assert from "node:assert/strict";
import { gzipSync } from "node:zlib";
import { isGzip, bytesToText, createPackReader, planPacks } from "./packs.mjs";

const bytes = (s) => new TextEncoder().encode(s);
const gz = (s) => new Uint8Array(gzipSync(Buffer.from(s, "utf8")));
// A host: a map of address to bytes; anything else is "not found". Counts requests.
function host(files) {
  const seen = [];
  const fetchFn = async (url) => {
    seen.push(url);
    const b = files[url];
    return b ? { ok: true, arrayBuffer: async () => b.buffer.slice(b.byteOffset, b.byteOffset + b.byteLength) } : { ok: false };
  };
  return { fetchFn, seen };
}

test("gzip bytes are recognised and unpacked; plain bytes pass through", async () => {
  assert.equal(isGzip(gz("x")), true);
  assert.equal(isGzip(bytes("{}")), false);
  assert.equal(isGzip(null), false);
  assert.equal(await bytesToText(gz('{"a":1}')), '{"a":1}');
  assert.equal(await bytesToText(bytes('{"a":1}')), '{"a":1}');
});

test("a loose entry reads its own file, plain or gzip", async () => {
  const h = host({ "recorded/a.json": bytes('{"summary":"A"}'), "native/a.json.gz": gz('{"summary":"N"}') });
  const r = createPackReader(h.fetchFn);
  assert.deepEqual(await r.load("recorded/", { file: "a.json" }), { summary: "A" });
  assert.deepEqual(await r.load("native/", { file: "a.json.gz" }), { summary: "N" });
  assert.deepEqual(h.seen, ["recorded/a.json", "native/a.json.gz"]);
});

test("a packed entry reads the pack once, however many entries it holds", async () => {
  const pack = gz(JSON.stringify({ "a.json": { summary: "A" }, "b.json": { summary: "B" } }));
  const h = host({ "recorded/pack-00.json.gz": pack });
  const r = createPackReader(h.fetchFn);
  assert.deepEqual(await r.load("recorded/", { file: "a.json", pack: "pack-00.json.gz" }), { summary: "A" });
  assert.deepEqual(await r.load("recorded/", { file: "b.json", pack: "pack-00.json.gz" }), { summary: "B" });
  assert.deepEqual(h.seen, ["recorded/pack-00.json.gz"]);
  // An entry the pack does not hold is "not there", never another scenario's record.
  assert.equal(await r.load("recorded/", { file: "c.json", pack: "pack-00.json.gz" }), null);
});

test("a loose folder is never asked for a pack, and a missing file is null", async () => {
  const h = host({});
  const r = createPackReader(h.fetchFn);
  assert.equal(await r.load("recorded/", { file: "a.json" }), null);
  assert.equal(await r.load("recorded/", { error: "not runnable" }), null);
  assert.equal(await r.load("recorded/", undefined), null);
  assert.deepEqual(h.seen, ["recorded/a.json"]);
});

test("run() goes through the folder's index, fetched once", async () => {
  const index = { runs: { "a.toml": { file: "a.json", pack: "pack-00.json.gz" }, "b.toml": { error: "no" } } };
  const h = host({ "s/recorded/index.json": bytes(JSON.stringify(index)), "s/recorded/pack-00.json.gz": gz(JSON.stringify({ "a.json": { toml: "x" } })) });
  const r = createPackReader(h.fetchFn);
  assert.deepEqual(await r.run("s/recorded/", "a"), { toml: "x" });
  assert.deepEqual(await r.run("s/recorded/", "a.toml"), { toml: "x" });
  assert.equal(await r.run("s/recorded/", "b"), null);
  assert.equal(await r.run("s/recorded/", "zzz"), null);
  assert.equal(h.seen.filter((u) => u.endsWith("index.json")).length, 1);
  assert.equal(await createPackReader(host({}).fetchFn).run("s/recorded/", "a"), null);
});

test("planPacks keeps the order, holds every item once and respects the limit", () => {
  const items = Array.from({ length: 40 }, (_, i) => ({ name: `f${String(i).padStart(2, "0")}`, bytes: 1 + ((i * 37) % 11) * 100 }));
  for (const max of [1, 3, 7, 40, 100]) {
    const groups = planPacks(items, max);
    assert.ok(groups.length <= max && groups.length >= 1);
    assert.deepEqual(groups.flat(), items.map((x) => x.name));
  }
  assert.deepEqual(planPacks([], 5), []);
  // One very large item does not strand the rest or loop for ever.
  const lop = planPacks([{ name: "big", bytes: 1e9 }, { name: "a", bytes: 1 }, { name: "b", bytes: 1 }], 2);
  assert.deepEqual(lop.flat(), ["big", "a", "b"]);
  assert.ok(lop.length <= 2);
  assert.deepEqual(planPacks(items, 7), planPacks(items, 7));
});
