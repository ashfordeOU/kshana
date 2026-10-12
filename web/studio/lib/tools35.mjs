// SPDX-License-Identifier: AGPL-3.0-only
// Helpers for the tools hub (tools/): turning chosen files into the arguments the engine's 0.35 functions take, and
// engine replies into what the page shows. Pure; tested in tools35.test.mjs. Nothing here reads a file or opens a
// connection: the page hands over bytes and gets text back.

const dec = new TextDecoder("utf-8", { fatal: true });
const enc = new TextEncoder();

// ---------- base64 ----------
const B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
export function toBase64(bytes) {
  let out = "";
  for (let i = 0; i < bytes.length; i += 3) {
    const a = bytes[i], b = bytes[i + 1], c = bytes[i + 2];
    out += B64[a >> 2] + B64[((a & 3) << 4) | ((b ?? 0) >> 4)] + (b === undefined ? "=" : B64[((b & 15) << 2) | ((c ?? 0) >> 6)]) + (c === undefined ? "=" : B64[c & 63]);
  }
  return out;
}
export function fromBase64(s) {
  const clean = String(s).replace(/\s+/g, "");
  if (!/^[A-Za-z0-9+/]*={0,2}$/.test(clean) || clean.length % 4) throw new Error("not base64");
  const out = [];
  for (let i = 0; i < clean.length; i += 4) {
    const n = [0, 1, 2, 3].map((k) => (clean[i + k] === "=" ? 0 : B64.indexOf(clean[i + k])));
    out.push((n[0] << 2) | (n[1] >> 4));
    if (clean[i + 2] !== "=") out.push(((n[1] & 15) << 4) | (n[2] >> 2));
    if (clean[i + 3] !== "=") out.push(((n[2] & 3) << 6) | n[3]);
  }
  return Uint8Array.from(out);
}

// ---------- evidence packs ----------

// A pack's files as the engine takes them: an object of name to content, text as a string and anything that is not
// valid UTF-8 (the log slice, a timestamp token) as {base64}. Names are the path inside the pack: a folder chosen
// with webkitdirectory carries the folder's own name first, which is dropped.
export function packFilesJson(files) {
  const out = {};
  const seen = new Set();
  const names = files.map((f) => String(f.path || f.name));
  for (const n of names) if (!n || n.startsWith("/") || n.includes("\\") || n.split("/").includes("..")) throw new Error(`refused file name: ${n}`);
  // The common first folder, when every path has one.
  const top = names.every((n) => n.includes("/")) && new Set(names.map((n) => n.split("/")[0])).size === 1 ? names[0].split("/")[0] + "/" : "";
  files.forEach((f, i) => {
    const name = names[i].slice(top.length);
    if (!name || name.includes("..") || name.startsWith("/")) throw new Error(`refused file name: ${names[i]}`);
    if (seen.has(name)) throw new Error(`two files are named ${name}`);
    seen.add(name);
    let text = null;
    try { text = dec.decode(f.bytes); } catch { /* not UTF-8: send as base64 */ }
    // Text that does not survive a round trip (a lone surrogate, a BOM the decoder dropped) is sent as bytes.
    out[name] = text !== null && enc.encode(text).length === f.bytes.length ? text : { base64: toBase64(f.bytes) };
  });
  return out;
}

export const EXPECTED_PACK_FILES = ["manifest.json", "manifest.sig"];
// What is missing before verification can mean anything (the page says so instead of sending an obvious failure).
export function packProblems(json) {
  const names = Object.keys(json);
  const p = [];
  for (const f of EXPECTED_PACK_FILES) if (!names.includes(f)) p.push(`${f} is not among the chosen files`);
  return p;
}

// A signer's public key: 64 hex digits, or a .pub file's text. Anything else is refused with a reason.
export function parsePublicKey(text) {
  const t = String(text || "").trim();
  if (!t) return { key: "" };
  const hex = t.replace(/\s+/g, "").toLowerCase();
  if (!/^[0-9a-f]{64}$/.test(hex)) return { error: "A public key is 64 hex digits (32 bytes). Nothing else is accepted." };
  return { key: hex };
}

// The engine's verify report (docs/EVIDENCE-PACKS.md): verdict "verified", "intact-signer-not-pinned" or "failed".
export function verdictView(report) {
  const v = report && report.verdict;
  if (v === "verified") return { tone: "ok", title: "Verified", text: report.message || "The pack is unchanged and signed by the key you pinned." };
  if (v === "intact-signer-not-pinned") return { tone: "warn", title: "Intact, but the signer is not pinned", text: report.message || "The pack is intact against the key it names itself, which anyone can generate. Get the signer's public key from the signer by another route and pin it." };
  return { tone: "bad", title: "Failed", text: report && report.message ? report.message : "Verification failed." };
}

// ---------- test bench ----------
// The engine takes the epoch as YYYY-MM-DDTHH:MM:SS with an optional Z, year 2000 to 2099, every field in range; the
// page checks first so a typing slip is said at the field.
export function checkEpoch(text) {
  const t = String(text || "").trim();
  if (!t) return { epoch: "" };
  const m = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})Z?$/.exec(t);
  if (!m) return { error: "Use YYYY-MM-DDTHH:MM:SS, with an optional Z (UTC)." };
  const [y, mo, d, h, mi, s] = m.slice(1).map(Number);
  const dim = [31, y % 4 === 0 && (y % 100 !== 0 || y % 400 === 0) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  if (y < 2000 || y > 2099 || mo < 1 || mo > 12 || d < 1 || d > dim[mo - 1] || h > 23 || mi > 59 || s > 59) return { error: "That is not a real UTC instant between the years 2000 and 2099." };
  return { epoch: t };
}

// The engine's bench reply {files: {suffix: text}, notes, notice} as download entries named <stem>.<suffix>.
export function benchEntries(reply, stem) {
  const files = reply && typeof reply.files === "object" && reply.files ? reply.files : {};
  return Object.keys(files).sort().map((suffix) => ({ name: stem + (suffix.startsWith(".") ? "" : ".") + suffix, data: String(files[suffix]), suffix }));
}

// The kinds a bench export applies to (docs/TEST-BENCH.md): a vehicle trajectory exists for these.
export const BENCH_KINDS = Object.freeze(["gnss-ins", "jamming", "gnss-sim"]);
export const scenarioKind = (toml) => { const m = /^\s*kind\s*=\s*["']([^"']+)["']/m.exec(String(toml)); return m ? m[1] : null; };

// ---------- compliance ----------
// Result files and the scenario files beside them, matched by name: run.result.json with run.toml. A result with no
// scenario still goes in (the engine then reads the kind from the result).
export function complianceRuns(files) {
  const toml = new Map(), results = [];
  for (const f of files) {
    const n = f.name;
    if (/\.toml$/i.test(n)) toml.set(n.replace(/\.toml$/i, ""), f.text);
    else if (/\.json$/i.test(n)) results.push(f);
  }
  const runs = results.map((f) => {
    const stem = f.name.replace(/\.result\.json$/i, "").replace(/\.json$/i, "");
    const r = { label: stem, result: f.text };
    if (toml.has(stem)) r.scenario = toml.get(stem);
    return r;
  });
  return { runs, unusedScenarios: [...toml.keys()].filter((k) => !results.some((f) => f.name.replace(/\.result\.json$/i, "").replace(/\.json$/i, "") === k)) };
}
export const MAX_COMPLIANCE_RUNS = 64;

// ---------- compliance report view ----------
// The five frameworks and standards of docs/compliance/, by the id the engine writes in each row.
export const FRAMEWORKS = Object.freeze({
  "dhs-rpcf": "US DHS Resilient PNT Conformance Framework, v2.0",
  "imo-ships": "IMO guidance on GNSS interference for ships",
  "easa-aviation": "EASA guidance on GNSS interference for aviation",
  "nis2-art21": "EU NIS2 Directive, Article 21",
  "en-16803": "EN 16803 (by part and clause number only)",
});
// What a row's status means, in words that never say a framework is met. The engine's own statement is shown too.
export const COMPLIANCE_STATUS = Object.freeze({
  evidenced: { label: "Runs support evidence for this row", short: "Evidenced", rank: 0 },
  "partly-evidenced": { label: "Runs support evidence for part of this row", short: "Partly", rank: 1 },
  "not-evidenced": { label: "These runs show nothing for this row", short: "Not evidenced", rank: 2 },
  "out-of-scope": { label: "Outside what Kshana can show", short: "Out of scope", rank: 3 },
});
const known = (o, k) => typeof k === "string" && Object.hasOwn(o, k);
export function complianceView(report) {
  const rows = Array.isArray(report && report.rows) ? report.rows.filter((r) => r && typeof r === "object") : [];
  const byFw = new Map();
  for (const r of rows) {
    const id = typeof r.framework === "string" ? r.framework : "other";
    if (!byFw.has(id)) byFw.set(id, []);
    byFw.get(id).push(r);
  }
  const order = [...Object.keys(FRAMEWORKS), ...[...byFw.keys()].filter((k) => !known(FRAMEWORKS, k))];
  const frameworks = order.filter((id) => byFw.has(id)).map((id) => {
    const rs = byFw.get(id), counts = { evidenced: 0, "partly-evidenced": 0, "not-evidenced": 0, "out-of-scope": 0, other: 0 };
    for (const r of rs) counts[known(COMPLIANCE_STATUS, r.status) ? r.status : "other"]++;
    return { id, name: known(FRAMEWORKS, id) ? FRAMEWORKS[id] : id, rows: rs, counts };
  });
  return {
    statement: typeof (report && report.statement) === "string" ? report.statement : "",
    engineVersion: typeof (report && report.engine_version) === "string" ? report.engine_version : "",
    runs: Array.isArray(report && report.runs) ? report.runs : [],
    unrecognised: Array.isArray(report && report.unrecognised) ? report.unrecognised : [],
    capabilities: Array.isArray(report && report.capabilities) ? report.capabilities : [],
    frameworks,
    rowCount: rows.length,
  };
}
export const statusInfo = (s) => (known(COMPLIANCE_STATUS, s) ? COMPLIANCE_STATUS[s] : { label: String(s), short: String(s), rank: 9 });

// ---------- OSNMA view ----------
// kshana osnma verify --json: advisory, input{pages}, overall, nma_status, alert, satellites[{sat, status, tags{...},
// last_authenticated_tag_gst}], events[{kind, count, ...}], tags[{prna, prnd, adkd, ctr, tag_gst, data_gst, nmas,
// status:{state, reason?}}], pksos, ubx{...}. Galileo System Time is plain seconds: week * 604800 + time of week.
export const OSNMA_STATUS = Object.freeze({
  authenticated: { label: "Authenticated", tone: "ok" },
  failed: { label: "Failed", tone: "bad" },
  unavailable: { label: "Unavailable", tone: "none" },
  pending: { label: "Pending", tone: "none" },
  discarded: { label: "Discarded", tone: "none" },
});
export const gstParts = (secs) => (Number.isFinite(secs) ? { week: Math.floor(secs / 604800), tow: secs % 604800 } : null);
export const gstText = (secs) => { const g = gstParts(secs); return g ? `week ${g.week}, ${g.tow} s` : "none"; };
const tagState = (t) => { const s = t && t.status; return typeof s === "string" ? { state: s, reason: null } : s && typeof s === "object" ? { state: String(s.state || ""), reason: s.reason ? String(s.reason) : null } : { state: "", reason: null }; };
export function osnmaView(doc) {
  if (!doc || typeof doc !== "object" || !Array.isArray(doc.satellites) || typeof doc.overall !== "string") return { error: "This is not the JSON of kshana osnma verify --json (it needs overall and satellites)." };
  const tags = Array.isArray(doc.tags) ? doc.tags.filter((t) => t && typeof t === "object") : [];
  const perSat = new Map();
  for (const t of tags) {
    const { state, reason } = tagState(t);
    const key = `E${String(t.prnd).padStart(2, "0")}`;
    if (!perSat.has(key)) perSat.set(key, { authenticated: 0, failed: 0, pending: 0, discarded: 0, reasons: new Map() });
    const c = perSat.get(key);
    if (known(c, state) && state !== "reasons") c[state]++;
    if (reason) c.reasons.set(`${state}: ${reason}`, (c.reasons.get(`${state}: ${reason}`) || 0) + 1);
  }
  const sats = doc.satellites.filter((s) => s && typeof s === "object").map((s) => {
    const c = perSat.get(s.sat) || null;
    return { sat: String(s.sat), status: String(s.status), tags: s.tags && typeof s.tags === "object" ? s.tags : null, lastAuthGst: Number.isFinite(s.last_authenticated_tag_gst) ? s.last_authenticated_tag_gst : null, reasons: c ? [...c.reasons.entries()].map(([k, n]) => `${k} (${n})`) : [] };
  });
  const events = (Array.isArray(doc.events) ? doc.events : []).filter((e) => e && typeof e === "object" && typeof e.kind === "string").map((e) => ({ kind: e.kind, count: Number.isFinite(e.count) ? e.count : 1, detail: Object.entries(e).filter(([k]) => !["kind", "count"].includes(k)).map(([k, v]) => `${k} ${v}`).join(", ") }));
  const totals = { authenticated: 0, failed: 0, pending: 0, discarded: 0 };
  for (const t of tags) { const { state } = tagState(t); if (known(totals, state)) totals[state]++; }
  return {
    advisory: typeof doc.advisory === "string" ? doc.advisory : "", overall: doc.overall, nmaStatus: doc.nma_status, alert: doc.alert === true,
    pages: doc.input && Number.isFinite(doc.input.pages) ? doc.input.pages : null, sats, events, totals, tagCount: tags.length, pksos: typeof doc.pksos === "string" ? doc.pksos : "", ubx: doc.ubx && typeof doc.ubx === "object" ? doc.ubx : null,
  };
}
// The reasons a UBX file lost pages, for the line under the table.
export function ubxLines(u) {
  if (!u) return [];
  const out = [`${u.frames} UBX frames; ${u.inav_pages} I/NAV pages decoded.`];
  const lost = [["bad_crc", "failed their CRC"], ["unstamped", "could not be placed in time"], ["time_conflicts", "had a time that conflicted with its neighbours"], ["ignored_sfrbx", "SFRBX messages were ignored (other systems, E5b, alerts, bad checksums)"], ["skipped_bytes", "bytes were skipped between frames"]];
  for (const [k, w] of lost) if (u[k]) out.push(`${u[k]} ${k === "ignored_sfrbx" || k === "skipped_bytes" ? w : "pages " + w}.`);
  return out;
}


// The address of an example file the Tools page fetches. The folder is one of three fixed ones and the file
// name comes from that folder's index.json (data read from a file), so it is checked first: a plain name
// (optionally under expected/), never a path out of the folder, another origin or a scheme.
export const EXAMPLE_DIRS = Object.freeze({ evidence: "tools/examples/evidence/", compliance: "tools/examples/compliance/", osnma: "tools/examples/osnma/" });
export function exampleFileUrl(dir, name) {
  const base = Object.hasOwn(EXAMPLE_DIRS, dir) ? EXAMPLE_DIRS[dir] : null;
  if (!base || typeof name !== "string" || !/^(?:expected\/)?[A-Za-z0-9][A-Za-z0-9._-]{0,100}$/.test(name) || name.includes("..")) throw new Error(`not an example file name: ${JSON.stringify(String(name).slice(0, 60))}`);
  return base + name;
}
