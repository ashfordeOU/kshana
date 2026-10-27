import test from "node:test";
import assert from "node:assert/strict";
import { t, english } from "./t.mjs";

test("t falls back to the English at the call site, with variables", () => {
  delete globalThis.kshanaL10n;
  assert.equal(t("x", "The engine could not load ({ $reason }).", { reason: "no wasm" }), "The engine could not load (no wasm).");
  assert.equal(t("x", "Plain"), "Plain");
  assert.equal(t("x", "{ $a } and { $b }", { a: 1, b: "two" }), "1 and two");
  assert.equal(t("x", "missing { $v }", {}), "missing ");
});

test("English plurals", () => {
  const en = { one: "{ $n } ledger row", other: "{ $n } ledger rows" };
  assert.equal(english(en, { n: 1 }), "1 ledger row");
  assert.equal(english(en, { n: 0 }), "0 ledger rows");
  assert.equal(english(en, { n: 2 }), "2 ledger rows");
});

test("a loaded catalogue wins for ids it has, English fills the rest", () => {
  globalThis.kshanaL10n = { has: (id) => id === "a", t: (id, v) => `[${id}:${v && v.n}]` };
  assert.equal(t("a", "English", { n: 3 }), "[a:3]");
  assert.equal(t("b", "English b"), "English b");
  delete globalThis.kshanaL10n;
});
