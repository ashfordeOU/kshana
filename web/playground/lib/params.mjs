// SPDX-License-Identifier: AGPL-3.0-only
// Inline parameter controls: every numeric scalar in a scenario TOML, so the editor and the
// steppers stay in sync both ways. A field under a plain [section] is offered when the shared
// patch helpers would hit that exact line (a (section, key) that appears once). A field under an
// array-of-tables header ([[jammers]], [[constellation.shell]]) is offered too, under a section
// name that carries the table's position, such as `jammers[1]` or `constellation.shell[0]`, and
// is always rewritten by its line (the shared helpers do not see [[...]] as a boundary).
// Pure; tested in params.test.mjs.
import { patchScalar } from "./share.mjs";
import { patchSectionScalar } from "./guided.mjs";

const headerRe = /^\s*\[([^\]]+)\]\s*(?:#.*)?$/; // same as guided.mjs
const aotRe = /^\s*\[\[/;
const kvRe = /^\s*([A-Za-z0-9_-]+)\s*=\s*([^#]*?)\s*(?:#(.*))?$/;
const numRe = /^[+-]?(?:\d+\.?\d*|\.\d+)(?:[eE][+-]?\d+)?$/;

const aotHeadRe = /^\s*\[\[([^\]]+)\]\]\s*(?:#.*)?$/;

export function numericFields(toml) {
  const lines = String(toml).split("\n");
  let section = "";
  let aot = false;
  let owner = null; // the array-of-tables element the following [owner.sub] headers belong to
  const aotCount = new Map();
  const seen = new Map();
  const fields = [];
  lines.forEach((line, i) => {
    const a = line.match(aotHeadRe);
    if (a) {
      const name = a[1].trim();
      const n = aotCount.get(name) || 0;
      aotCount.set(name, n + 1);
      section = `${name}[${n}]`;
      owner = { name, section };
      aot = true;
      return;
    }
    if (aotRe.test(line)) { aot = true; section = ""; owner = null; return; }
    const h = line.match(headerRe);
    if (h) {
      const name = h[1].trim();
      // [jammers.waveform] after [[jammers]] is a sub-table of that element.
      if (owner && name.startsWith(owner.name + ".")) { section = owner.section + name.slice(owner.name.length); aot = true; }
      else { section = name; aot = false; owner = null; }
      return;
    }
    const m = line.match(kvRe);
    if (!m) return;
    const id = `${section}::${m[1]}`;
    seen.set(id, (seen.get(id) || 0) + 1);
    if ((aot && !section) || !numRe.test(m[2])) return;
    const raw = m[2];
    const value = parseFloat(raw);
    fields.push({ id, section, key: m[1], raw, value, integer: /^[+-]?\d+$/.test(raw), line: i, comment: (m[3] || "").trim(), aot });
  });
  return fields.filter((f) => seen.get(f.id) === 1);
}

// Log-scale stepping for very small or very large magnitudes (clock noise PSDs,
// Allan coefficients), linear otherwise.
export function isLogScale(f) {
  const a = Math.abs(f.value);
  return !f.integer && a !== 0 && (a < 1e-3 || a >= 1e6);
}

// One step up (dir=+1) or down (dir=-1).
export function stepValue(f, dir) {
  if (isLogScale(f)) return f.value * (dir > 0 ? 10 : 0.1);
  if (f.integer) return Math.round(f.value + dir);
  const a = Math.abs(f.value);
  const inc = a === 0 ? 0.1 : 10 ** (Math.floor(Math.log10(a)) - 1);
  return Number((f.value + dir * inc).toPrecision(12));
}

// Text form written back into the TOML: integers stay integers, and a float keeps a
// decimal point or exponent so the value is still read as a TOML float.
export function formatValue(f, v) {
  if (f.integer) return String(Math.round(v));
  if (v !== 0 && (Math.abs(v) < 1e-3 || Math.abs(v) >= 1e6)) return Number(v.toPrecision(12)).toExponential().replace("e+", "e");
  const s = String(Number(v.toPrecision(12)));
  return /[.eE]/.test(s) ? s : s + ".0";
}

// Rewrite the field's value on its own line, keeping any inline comment. Falls back to
// the shared patch helpers if the line no longer holds the field (the text changed).
export function patchField(toml, f, v) {
  const text = formatValue(f, v);
  const lines = String(toml).split("\n");
  const line = lines[f.line];
  const m = line !== undefined && line.match(kvRe);
  if (m && m[1] === f.key && numRe.test(m[2])) {
    const at = line.indexOf("=") + 1;
    const rest = line.slice(at);
    const lead = rest.match(/^\s*/)[0];
    lines[f.line] = line.slice(0, at) + lead + text + rest.slice(lead.length + m[2].length);
    return lines.join("\n");
  }
  // An array-of-tables field has no line-free address the shared helpers understand: find it again.
  if (f.aot) {
    const again = numericFields(toml).find((x) => x.id === f.id);
    return again && again.line !== f.line ? patchField(toml, again, v) : String(toml);
  }
  return f.section ? patchSectionScalar(toml, f.section, f.key, text) : patchScalar(toml, f.key, text);
}
