// SPDX-License-Identifier: AGPL-3.0-only
// Round-trip and robustness tests for the share-link codec. Run with `node
// web/share.test.mjs` (the test-wasm-bindings CI job already provides Node).
import { encodeFragment, decodeFragment, readScalar, patchScalar } from "./share.mjs";
import assert from "node:assert/strict";

const SAMPLE = `seed = 42
threshold_ns = 20.0

[time]
step_s = 10.0
duration_s = 7200.0

[gnss]
windows = [ { t0 = 0.0, t1 = 600.0, state = "nominal" } ]

# unicode + symbols that must survive: क्षण σ_y(τ) ≤ 1e-15
`;

// Round-trip: encode then decode returns the original byte-for-byte.
{
  const frag = encodeFragment(SAMPLE);
  assert.ok(frag.startsWith("#s="), "fragment has the #s= prefix");
  assert.equal(decodeFragment(frag), SAMPLE, "round-trip preserved the TOML");
}

// Decoding tolerates the fragment with or without the leading '#'.
{
  const frag = encodeFragment(SAMPLE);
  assert.equal(decodeFragment(frag.slice(1)), SAMPLE, "decodes without leading #");
}

// URL-safe alphabet only: no '+', '/', or '=' in the payload.
{
  const payload = encodeFragment(SAMPLE).slice(3);
  assert.ok(!/[+/=]/.test(payload), `payload is URL-safe, got: ${payload.slice(0, 40)}…`);
}

// Malformed / empty / foreign fragments decode to null (never throw).
for (const bad of ["", "#", "#x=abc", "#s=", "nonsense", "#s=!!!not base64!!!"]) {
  assert.equal(decodeFragment(bad), null, `malformed fragment -> null: ${JSON.stringify(bad)}`);
}

// readScalar reads top-level scalars and ignores inline comments + section keys.
{
  assert.equal(readScalar(SAMPLE, "seed"), "42");
  assert.equal(readScalar(SAMPLE, "threshold_ns"), "20.0");
  // step_s lives under [time], so it is NOT a top-level scalar.
  assert.equal(readScalar(SAMPLE, "step_s"), null);
  assert.equal(readScalar(SAMPLE, "missing"), null);
  // inline comment is stripped.
  assert.equal(readScalar("seed = 7  # the seed\n", "seed"), "7");
}

// patchScalar replaces only the top-level occurrence, preserving everything else.
{
  const out = patchScalar(SAMPLE, "seed", 99);
  assert.equal(readScalar(out, "seed"), "99", "seed updated");
  assert.equal(readScalar(out, "threshold_ns"), "20.0", "other keys untouched");
  assert.ok(out.includes('state = "nominal"'), "section body preserved");
  // A key that only exists inside a section is left untouched.
  assert.equal(patchScalar(SAMPLE, "step_s", 1), SAMPLE, "section key not patched");
  // Patching is idempotent in shape: re-reading gives the set value.
  assert.equal(readScalar(patchScalar(SAMPLE, "threshold_ns", 5.5), "threshold_ns"), "5.5");
}

console.log("share.mjs OK — round-trip, url-safety, malformed-input, readScalar, patchScalar");
