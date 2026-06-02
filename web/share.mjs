// SPDX-License-Identifier: Apache-2.0
//
// Pure, isomorphic (browser + Node) helpers for sharing a playground run via a
// URL. The full scenario TOML is encoded into the URL fragment (after `#`), so a
// shared link reproduces the exact run with no server state — and the fragment
// is never sent to a server. No dependencies; unit-tested in web/share.test.mjs.

const PREFIX = "s="; // fragment looks like  #s=<urlsafe-base64>

// UTF-8 string -> URL-safe base64 (no padding). Uses btoa, which is available
// in browsers and in modern Node (>=16) on globalThis.
function toUrlSafeBase64(text) {
  const b64 = btoa(unescape(encodeURIComponent(text)));
  return b64.replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

function fromUrlSafeBase64(b64url) {
  const b64 = b64url.replace(/-/g, "+").replace(/_/g, "/");
  return decodeURIComponent(escape(atob(b64)));
}

/// Encode scenario TOML into a URL fragment (including the leading `#`).
export function encodeFragment(toml) {
  return "#" + PREFIX + toUrlSafeBase64(toml);
}

/// Decode scenario TOML from a URL fragment. Accepts the fragment with or
/// without the leading `#`. Returns the TOML string, or null if the fragment is
/// empty, malformed, or not a scenario fragment.
export function decodeFragment(fragment) {
  if (!fragment) return null;
  let f = fragment.startsWith("#") ? fragment.slice(1) : fragment;
  if (!f.startsWith(PREFIX)) return null;
  const payload = f.slice(PREFIX.length);
  if (!payload) return null;
  try {
    const toml = fromUrlSafeBase64(payload);
    return toml.length ? toml : null;
  } catch {
    return null;
  }
}

/// Read the value of a top-level scalar key (a `key = value` line that appears
/// before the first `[section]` header). Returns the raw value text trimmed of
/// inline comments and whitespace, or null if the key is not a top-level scalar.
/// Powers the guided sliders, which expose universal knobs (seed, threshold)
/// without requiring the user to touch the TOML at all.
export function readScalar(toml, key) {
  const re = new RegExp(`^\\s*${key}\\s*=\\s*(.+)$`);
  for (const line of toml.split("\n")) {
    if (/^\s*\[/.test(line)) break; // reached the first section: no longer top-level
    const m = line.match(re);
    if (m) return m[1].replace(/\s*#.*$/, "").trim();
  }
  return null;
}

/// Replace the value of a top-level scalar key in place, preserving the rest of
/// the document. Only the first top-level occurrence (before any `[section]`) is
/// touched. If the key is not present at top level the TOML is returned
/// unchanged, so callers can safely disable a control when readScalar is null.
export function patchScalar(toml, key, value) {
  const re = new RegExp(`^(\\s*${key}\\s*=\\s*).+$`);
  const lines = toml.split("\n");
  for (let i = 0; i < lines.length; i++) {
    if (/^\s*\[/.test(lines[i])) break;
    if (re.test(lines[i])) {
      lines[i] = lines[i].replace(re, `$1${value}`);
      return lines.join("\n");
    }
  }
  return toml;
}
