// SPDX-License-Identifier: AGPL-3.0-only
// Tests of lib/live.mjs (0.42 U26): live sources are checked by the native side's rules.
// Run: node --test apps/desktop/shell/lib/live.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { checkSource, listensOnNetwork, cursorAfter, LIVE_PRESETS, LIVE_FORMATS } from "./live.mjs";

test("sources are tcp:<host>:<port>, or udp:<address>:<port> for AIS only", () => {
  assert.deepEqual(checkSource("tcp:127.0.0.1:30005", "beast"), { ok: true, transport: "tcp", host: "127.0.0.1", port: 30005 });
  assert.equal(checkSource("udp://0.0.0.0:10110", "ais").ok, true);
  assert.equal(checkSource("udp:127.0.0.1:30005", "beast").reason, "udp-ais-only");
  assert.equal(checkSource("tcp:host", "ais").reason, "syntax");
  assert.equal(checkSource("tcp:h:0", "ais").reason, "port");
  assert.equal(checkSource("tcp:h:70000", "ais").reason, "port");
  assert.equal(checkSource("tcp:h:1", "nmea").reason, "format");
  for (const [, f, src] of LIVE_PRESETS) assert.equal(checkSource(src, f).ok, true, src);
  assert.deepEqual(LIVE_FORMATS, ["ais", "beast", "avr"]);
});

test("a UDP source bound beyond the loopback address is said to listen on the network", () => {
  assert.equal(listensOnNetwork("udp:0.0.0.0:10110"), true);
  assert.equal(listensOnNetwork("udp:127.0.0.1:10110"), false);
  assert.equal(listensOnNetwork("udp:localhost:10110"), false);
  assert.equal(listensOnNetwork("tcp:0.0.0.0:1"), false);
});

test("after a refresh the cursor follows the newest time, or stays where it was", () => {
  assert.equal(cursorAfter([0, 100], 40, true), 100);
  assert.equal(cursorAfter([10, 100], 40, false), 40);
  assert.equal(cursorAfter([50, 100], 40, false), 50);
  assert.equal(cursorAfter([0, 100], undefined, false), 100);
  assert.equal(cursorAfter(null, 1, true), undefined);
});
