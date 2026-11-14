#!/usr/bin/env node
// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop wording (0.42 U4): the Studio's pages are staged unchanged into the Desktop
// frontend (apps/desktop/build-frontend.sh), and on the website they rightly say that the
// engine runs in the reader's browser. Inside the Desktop that is false: the app is
// installed, the scenario runs go to the engine linked natively into the app, and the tool
// pages run the WebAssembly engine inside the app's own window. This module rewrites the
// staged copy (never web/) with an explicit list of replacements and then scans it for the
// phrases the Desktop must not say. The build fails when a phrase is left or when a
// sentence-level rule no longer finds its sentence (the Studio's text changed: update the
// table here). Tested in wording.test.mjs.
//
//   node apps/desktop/wording.mjs <staged-dir>      rewrite in place, then scan
//   node apps/desktop/wording.mjs --scan <dir>      scan only
import { readFileSync, writeFileSync, readdirSync, statSync } from "node:fs";
import { join, relative } from "node:path";
import { fileURLToPath } from "node:url";

/** The files that carry words: pages, scripts, data. */
export const TEXT_FILE = /\.(html|m?js|json|css|svg|txt)$/i;

// What the Desktop must not say about itself (case-insensitive).
export const BANNED = [
  { re: /\bruns? in your browser\b/i, why: "the Desktop is not a browser tab" },
  { re: /\bin (?:your|this|the) browser\b/i, why: "the Desktop is not a browser tab" },
  { re: /\byour browser['’]s\b/i, why: "the Desktop is not a browser tab" },
  { re: /\bbrowser-native\b/i, why: "the Desktop is a native app" },
  { re: /\bno server\b/i, why: "a server claim the Desktop does not make" },
  { re: /\bnothing is installed\b/i, why: "the Desktop is installed" },
  { re: /\bTry in the browser\b/i, why: "the Desktop is not a browser tab" },
];

// Sentence-level rules first: exact sentences of the Studio, each rewritten for the Desktop.
// A rule with `file` applies only to the files whose path (relative to the staged dir) it matches.
// `must` rules have to match somewhere in the staged tree (a guard against the Studio's text
// drifting away from this table). The Studio question view (app.js, index.html) runs its
// scenarios on the native engine inside the app, so it says "natively"; the tool pages and
// the advanced page run the WebAssembly engine in the app's window, so they say "on this
// computer" and keep "WebAssembly" where they name it.
const NATIVE = "natively on this computer";
export const RULES = [
  // the Studio question view (web/studio/index.html, app.js): runs go to the native engine
  { must: true, from: "A positioning, navigation and timing simulator that runs in your browser. Nothing is uploaded.", to: `A positioning, navigation and timing simulator. The engine runs ${NATIVE}. Nothing is uploaded.` },
  { must: true, from: "resilience simulator, in your browser: the engine runs locally as WebAssembly, so nothing is installed and nothing is uploaded.", to: `resilience simulator: the engine runs ${NATIVE}, and nothing is uploaded.` },
  { must: true, from: "scenarios in your browser. The open-source engine runs locally as WebAssembly; nothing is uploaded.", to: `scenarios on this computer. The open-source engine runs ${NATIVE}; nothing is uploaded.` },
  { must: true, from: "run GNSS and PNT scenarios in your browser", to: "run GNSS and PNT scenarios on this computer" },
  { must: true, from: "Runs in your browser. Nothing is uploaded.", to: `The engine runs ${NATIVE}. Nothing is uploaded.` },
  { must: true, from: "The last run took { $ms } ms in your browser. Nothing is uploaded.", to: "The last run took { $ms } ms on this computer. Nothing is uploaded." },
  { must: true, from: "The engine runs in your browser; nothing is uploaded.", to: `The engine runs ${NATIVE}; nothing is uploaded.` },
  { must: true, file: /(^|\/)app\.js$/, from: "The Kshana engine is running in this browser as WebAssembly", to: `The Kshana engine is running ${NATIVE}` },
  { must: true, from: "a live run in your browser, or a run recorded with the same engine", to: "a live run on this computer, or a run recorded with the same engine" },
  // the Studio's list of channels names the website's channel; in the app it is the website
  { must: true, from: "\"name\": \"Try in the browser\"", to: "\"name\": \"Kshana Studio on the website\"" },
  { must: true, from: "This scenario does not run in the browser.", to: "This scenario does not run in this window." },
  { must: true, from: "This one runs on the command line, not in the browser.", to: "This one runs on the command line, not in this window." },
  // the advanced page and the tour: the WebAssembly engine in the app's window
  { must: true, from: "resilience simulator, in your browser. The Rust engine runs locally as WebAssembly:", to: "resilience simulator, on this computer. The Rust engine runs in this window as WebAssembly:" },
  { must: true, from: "The Rust engine runs in your browser as WebAssembly.", to: "The Rust engine runs on this computer as WebAssembly." },
  { must: true, from: "Run it in your browser", to: "Run it on this computer" },
  // generic phrases, after the sentences above (need not match)
  { from: /\bruns in your browser\b/g, to: "runs on this computer" },
  { from: /\brun in your browser\b/g, to: "run on this computer" },
  { from: /\bin (?:your|this) browser\b/g, to: "on this computer" },
  { from: /\bIn this browser\b/g, to: "On this computer" },
  { from: /\bin the browser\b/g, to: "in this window" },
  { from: /\byour browser['’]s memory\b/g, to: "this app's memory" },
  { from: "no server state", to: "no state kept on a server" },
  { from: "no server dependency", to: "no dependency on a server" },
];

const count = (text, from) => (typeof from === "string" ? text.split(from).length - 1 : (text.match(from) || []).length);
const replace = (text, from, to) => (typeof from === "string" ? text.split(from).join(to) : text.replace(from, to));

/** Rewrite one text (of the file `name`, for rules limited to some files): { text, hits } where hits[i] is how often RULES[i] applied. */
export function rewrite(text, rules = RULES, name = "") {
  let out = String(text);
  const hits = rules.map((r) => {
    if (r.file && !r.file.test(name.replace(/\\/g, "/"))) return 0;
    const n = count(out, r.from);
    if (n) out = replace(out, r.from, r.to);
    return n;
  });
  return { text: out, hits };
}

/** The banned phrases in a text: [{ phrase, why, line }]. */
export function scan(text) {
  const found = [];
  const lines = String(text).split("\n");
  lines.forEach((l, i) => {
    for (const b of BANNED) {
      const m = l.match(b.re);
      if (m) found.push({ phrase: m[0], why: b.why, line: i + 1 });
    }
  });
  return found;
}

function walk(dir, out = []) {
  for (const e of readdirSync(dir)) {
    const p = join(dir, e);
    const st = statSync(p);
    if (st.isDirectory()) walk(p, out);
    else if (TEXT_FILE.test(e) && st.size < 32 * 1024 * 1024) out.push(p);
  }
  return out;
}

/** Rewrite every text file under `dir` in place. { files, changed, hits, missing } — missing are the `must` rules that found nothing. */
export function rewriteTree(dir, rules = RULES) {
  const files = walk(dir);
  const total = rules.map(() => 0);
  let changed = 0;
  for (const f of files) {
    const before = readFileSync(f, "utf8");
    const { text, hits } = rewrite(before, rules, relative(dir, f));
    hits.forEach((n, i) => { total[i] += n; });
    if (text !== before) { writeFileSync(f, text); changed++; }
  }
  const missing = rules.filter((r, i) => r.must && !total[i]).map((r) => String(r.from));
  return { files: files.length, changed, hits: total, missing };
}

/** The banned phrases left under `dir`: [{ file, phrase, why, line }]. */
export function scanTree(dir) {
  return walk(dir).flatMap((f) => scan(readFileSync(f, "utf8")).map((x) => ({ file: relative(dir, f), ...x })));
}

if (process.argv[1] && fileURLToPath(import.meta.url) === process.argv[1]) {
  const args = process.argv.slice(2);
  const scanOnly = args[0] === "--scan";
  const dir = scanOnly ? args[1] : args[0];
  if (!dir) { console.error("usage: wording.mjs [--scan] <staged-dir>"); process.exit(2); }
  let bad = false;
  if (!scanOnly) {
    const r = rewriteTree(dir);
    console.log(`desktop wording: ${r.changed} of ${r.files} files rewritten, ${r.hits.reduce((a, b) => a + b, 0)} replacements`);
    if (r.missing.length) { bad = true; for (const m of r.missing) console.error(`desktop wording: a sentence rule found nothing (the Studio's text changed; update apps/desktop/wording.mjs): ${m}`); }
  }
  const left = scanTree(dir);
  for (const x of left) console.error(`desktop wording: ${x.file}:${x.line}: "${x.phrase}" (${x.why})`);
  if (left.length) bad = true;
  if (bad) process.exit(1);
  console.log("desktop wording: no browser or server claim left in the staged frontend");
}
