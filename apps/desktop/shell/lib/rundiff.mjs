// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: run diff (0.42 U22). Two runs side by side: what differs in their
// recipes (the scenario settings, and the scenario text line by line), what differs in their
// results (every number the engine wrote, with the change and the unit the engine states), and
// both runs on one time axis (A's series and B's, A's track and B's on the map). Only the two
// runs' own files are compared; nothing is interpolated except to read B at A's instants for
// the values at the cursor. Pure, no DOM; tested in rundiff.test.mjs.

const num = (x) => typeof x === "number" && Number.isFinite(x);

const headerRe = /^\s*\[([^\]]+)\]\s*(?:#.*)?$/;
const aotRe = /^\s*\[\[([^\]]+)\]\]\s*(?:#.*)?$/;
const kvRe = /^\s*([A-Za-z0-9_."-]+)\s*=\s*(.*?)\s*(?:#[^"']*)?$/;

/** The single-line settings of a scenario text: Map of "section::key" to the raw value text. */
export function settings(toml) {
  const out = new Map();
  let section = "";
  const aot = new Map();
  let inStr = false;
  for (const line of String(toml).replace(/\r\n/g, "\n").split("\n")) {
    const q = (line.match(/"""|'''/g) || []).length;
    if (inStr) { if (q % 2) inStr = false; continue; }
    if (/^\s*(#|$)/.test(line)) continue;
    const a = aotRe.exec(line);
    if (a) { const nm = a[1].trim(); const n = aot.get(nm) || 0; aot.set(nm, n + 1); section = `${nm}[${n}]`; continue; }
    const h = headerRe.exec(line);
    if (h) {
      const nm = h[1].trim();
      // [jammers.waveform] after [[jammers]] belongs to the last element
      const owner = [...aot.keys()].find((k) => nm.startsWith(`${k}.`));
      section = owner ? `${owner}[${aot.get(owner) - 1}]${nm.slice(owner.length)}` : nm;
      continue;
    }
    const m = kvRe.exec(line);
    if (!m) continue;
    if (q % 2) { inStr = true; out.set(`${section}::${m[1]}`, `${m[2]} …`); continue; }
    out.set(`${section}::${m[1]}`, m[2].replace(/\s+$/, ""));
  }
  return out;
}

/**
 * The settings that differ: [{ id, section, key, a, b, change }] with change "changed", "added"
 * (only in B) or "removed" (only in A); a numeric change has delta and pct.
 */
export function inputsDiff(tomlA, tomlB) {
  const A = settings(tomlA), B = settings(tomlB);
  const out = [];
  const ids = [...new Set([...A.keys(), ...B.keys()])];
  for (const id of ids) {
    const a = A.get(id), b = B.get(id);
    if (a === b) continue;
    const [section, key] = id.split("::");
    const row = { id, section, key, a: a ?? null, b: b ?? null, change: a === undefined ? "added" : b === undefined ? "removed" : "changed", delta: null, pct: null };
    const na = Number(a), nb = Number(b);
    if (row.change === "changed" && a !== "" && b !== "" && num(na) && num(nb)) { row.delta = nb - na; row.pct = na !== 0 ? ((nb - na) / Math.abs(na)) * 100 : null; }
    out.push(row);
  }
  return out;
}

/**
 * A line diff of two texts (longest common subsequence; texts up to `max` lines each, else the
 * first max): [{ op: " " | "-" | "+", text, a (line in A), b (line in B) }].
 */
export function lineDiff(textA, textB, max = 1500) {
  const a = String(textA).replace(/\r\n/g, "\n").split("\n").slice(0, max), b = String(textB).replace(/\r\n/g, "\n").split("\n").slice(0, max);
  const n = a.length, m = b.length;
  const L = Array.from({ length: n + 1 }, () => new Uint16Array(m + 1));
  for (let i = n - 1; i >= 0; i--) for (let j = m - 1; j >= 0; j--) L[i][j] = a[i] === b[j] ? L[i + 1][j + 1] + 1 : Math.max(L[i + 1][j], L[i][j + 1]);
  const out = [];
  let i = 0, j = 0;
  while (i < n && j < m) {
    if (a[i] === b[j]) { out.push({ op: " ", text: a[i], a: i + 1, b: j + 1 }); i++; j++; }
    else if (L[i + 1][j] >= L[i][j + 1]) { out.push({ op: "-", text: a[i], a: i + 1, b: null }); i++; }
    else { out.push({ op: "+", text: b[j], a: null, b: j + 1 }); j++; }
  }
  while (i < n) { out.push({ op: "-", text: a[i], a: i + 1, b: null }); i++; }
  while (j < m) { out.push({ op: "+", text: b[j], a: null, b: j + 1 }); j++; }
  return out;
}

/** The changed lines of a line diff with `context` lines around each change; gaps as { op: "…", skipped }. */
export function hunks(diff, context = 2) {
  const keep = new Array(diff.length).fill(false);
  diff.forEach((d, k) => { if (d.op !== " ") for (let x = Math.max(0, k - context); x <= Math.min(diff.length - 1, k + context); x++) keep[x] = true; });
  const out = [];
  let skipped = 0;
  diff.forEach((d, k) => {
    if (keep[k]) { if (skipped) { out.push({ op: "…", skipped }); skipped = 0; } out.push(d); }
    else skipped++;
  });
  if (skipped && out.length) out.push({ op: "…", skipped });
  return out;
}

/** Every numeric leaf of a result to depth `depth`, with arrays of up to `maxArray` items indexed: Map of path to number. */
export function numericLeaves(result, { depth = 4, maxArray = 8 } = {}) {
  const out = new Map();
  const walk = (node, path, d) => {
    if (d > depth || node === null || typeof node !== "object") return;
    if (Array.isArray(node)) {
      if (node.length > maxArray) { out.set(`${path}.length`, node.length); return; }
      node.forEach((v, i) => { const p = `${path}[${i}]`; if (num(v)) out.set(p, v); else walk(v, p, d + 1); });
      return;
    }
    for (const [k, v] of Object.entries(node)) {
      if (k === "units" || k === "figure_tiers" || k === "evidence" || k === "engine_version" || k === "schema_version") continue;
      const p = path ? `${path}.${k}` : k;
      if (num(v)) out.set(p, v); else walk(v, p, d + 1);
    }
  };
  walk(result, "", 0);
  return out;
}

/**
 * The numbers that differ between two results: [{ path, a, b, delta, pct, unit }], the largest
 * relative change first; numbers only one result has come last with a or b null. `units` is
 * the engine's units block of A (or B).
 */
export function resultDiff(ra, rb, { tol = 0, max = 400 } = {}) {
  const A = numericLeaves(ra), B = numericLeaves(rb);
  const units = (ra && ra.units) || (rb && rb.units) || {};
  const unitOf = (p) => { const g = p.replace(/\[\d+\]/g, "[]"); const u = units[p] || units[g] || units[g.replace(/\[\]$/, "")]; return u && u.unit && u.unit !== "1" ? u.unit : ""; };
  const rows = [];
  for (const p of new Set([...A.keys(), ...B.keys()])) {
    const a = A.has(p) ? A.get(p) : null, b = B.has(p) ? B.get(p) : null;
    if (a !== null && b !== null && Math.abs(b - a) <= tol * Math.max(Math.abs(a), Math.abs(b))) continue;
    const delta = a !== null && b !== null ? b - a : null;
    rows.push({ path: p, a, b, delta, pct: delta !== null && a !== 0 ? (delta / Math.abs(a)) * 100 : null, unit: unitOf(p) });
  }
  const mag = (r) => (r.delta === null ? -1 : r.pct === null ? Infinity : Math.abs(r.pct));
  rows.sort((x, y) => mag(y) - mag(x) || (x.path < y.path ? -1 : 1));
  return { rows: rows.slice(0, max), same: [...A.keys()].filter((p) => B.has(p) && A.get(p) === B.get(p)).length, total: new Set([...A.keys(), ...B.keys()]).size, cut: Math.max(0, rows.length - max) };
}

/** B's plot series relabelled for an overlay on A's ("B · label"), dashed, with ids that cannot clash with A's. */
export function overlaySeries(seriesB, tag = "B") {
  return (seriesB || []).map((s, i) => ({ ...s, id: `${tag.toLowerCase()}-${s.id || i}`, label: `${tag} · ${s.label}`, dash: true }));
}
/** A's series relabelled ("A · label"). */
export function labelSeries(seriesA, tag = "A") {
  return (seriesA || []).map((s) => ({ ...s, label: `${tag} · ${s.label}` }));
}

/** B's track as a ghost on A's map: { label, t, lat, lon } or null. */
export function ghostOf(model, label = "B") {
  const tr = model && model.track;
  if (!tr || !tr.t || tr.t.length < 2) return null;
  return { label, t: tr.t, lat: tr.lat, lon: tr.lon };
}

/** The diff's Python lines (the two runs are result_<a> and result_<b> in the console). */
export function diffLines(na, nb) {
  if (!na || !nb) return { py: [], cli: [] };
  return {
    py: [
      "def leaves(o, p=\"\"):",
      "    if isinstance(o, dict): return {k2: v2 for k, v in o.items() if k not in (\"units\", \"figure_tiers\", \"evidence\") for k2, v2 in leaves(v, f\"{p}.{k}\" if p else k).items()}",
      "    if isinstance(o, list) and len(o) <= 8: return {k2: v2 for i, v in enumerate(o) for k2, v2 in leaves(v, f\"{p}[{i}]\").items()}",
      "    return {p: o} if isinstance(o, (int, float)) and not isinstance(o, bool) else {}",
      `a, b = leaves(result_${na}), leaves(result_${nb})`,
      "for k in sorted(set(a) | set(b)):",
      "    if a.get(k) != b.get(k): print(k, a.get(k), b.get(k))",
    ],
    cli: [`diff -u run-${na}.toml run-${nb}.toml`],
  };
}
