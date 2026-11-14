// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: drop anything in (0.42 U9). What the app's native format detective
// (apps/desktop/src-tauri/src/detective.rs, the engine's own readers) says about a dropped file
// or folder, as rows for the page, and the scenario that opens it: a receiver log (the twelve
// formats and RINEX observation) as a receiver-trust run, a clock log as a clock run with the
// log beside the simulated holdover. Navigation, orbit, IQ and track files are kept as data
// links of the project. Pure, no DOM; tested in detective.test.mjs.
import { fmtDuration, fmtCount } from "./format.mjs";

/** The English text with its { $name } arguments filled in (the shell passes its own t()). */
const fill = (id, en, a = {}) => String(en).replace(/\{ \$(\w+) \}/g, (m, k) => (a[k] ?? m));

const FAMILY = {
  "receiver-log": "receiver log", "gnss-obs": "GNSS observations", navigation: "broadcast navigation", orbit: "precise orbits",
  "clock-log": "clock log", iq: "IQ recording", tracks: "ship, aircraft or drone tracks", folder: "folder",
};
export const familyLabel = (f) => FAMILY[f] || "";

/** A TOML basic string (JSON's escapes are TOML's). */
export const tomlStr = (s) => JSON.stringify(String(s));

/** The page's rows for one answer: [{ k, v, warn }]. `t(id, en, args)` translates. */
export function detectiveRows(a, t = fill) {
  if (!a) return [];
  if (!a.ok) return [{ k: t("js-desk-det-unknown", "not read"), v: a.reason || t("js-desk-det-no-reason", "the engine does not read this file"), warn: true }];
  const rows = [{ k: t("js-desk-det-format", "format"), v: a.label || a.format }];
  const sp = a.span || {};
  if (sp.start || sp.end) rows.push({ k: t("js-desk-det-span", "span"), v: `${sp.start || "?"} → ${sp.end || "?"}${Number.isFinite(sp.seconds) ? ` (${fmtDuration(sp.seconds)})` : ""}` });
  else if (Number.isFinite(sp.seconds)) rows.push({ k: t("js-desk-det-span", "span"), v: fmtDuration(sp.seconds) });
  if (Number.isFinite(a.epochs)) rows.push({ k: a.family === "tracks" ? t("js-desk-det-fixes", "fixes") : t("js-desk-det-epochs", "epochs"), v: fmtCount(a.epochs) });
  if (Number.isFinite(a.interval_s)) rows.push({ k: t("js-desk-det-interval", "interval"), v: a.interval_s >= 1 ? fmtDuration(a.interval_s) : `${+a.interval_s.toPrecision(4)} s` });
  if (a.constellations && a.constellations.length) rows.push({ k: t("js-desk-det-constellations", "constellations"), v: `${a.constellations.join(", ")}${a.satellites ? ` · ${t("js-desk-det-sats", "{ $n } satellites", { n: a.satellites })}` : ""}` });
  if (a.family !== "iq") {
    const g = a.n_gaps || 0;
    const first = (a.gaps || []).slice(0, 3).map((x) => `${fmtDuration(x.from_s)} (+${fmtDuration(x.seconds)})`).join(", ");
    rows.push({ k: t("js-desk-det-gaps", "gaps"), v: g ? `${fmtCount(g)}${first ? `: ${first}${g > 3 ? ", …" : ""}` : ""}` : t("js-desk-det-no-gaps", "none"), warn: g > 0 });
  }
  const x = a.extra || {};
  if (a.family === "iq") {
    rows.push({ k: t("js-desk-det-samples", "samples"), v: fmtCount(x.samples) });
    rows.push({ k: t("js-desk-det-rate", "sample rate"), v: Number.isFinite(x.sample_rate_hz) ? `${+(x.sample_rate_hz / 1e6).toPrecision(6)} MHz` : t("js-desk-det-rate-unknown", "not stated (raw file: the rate is set when it is opened)") });
    if (Number.isFinite(x.centre_hz)) rows.push({ k: t("js-desk-det-centre", "centre frequency"), v: `${+(x.centre_hz / 1e6).toPrecision(9)} MHz` });
  }
  if (a.family === "tracks" && Number.isFinite(x.objects)) rows.push({ k: t("js-desk-det-objects", "objects"), v: fmtCount(x.objects) });
  if (a.family === "clock-log" && x.clock) rows.push({ k: t("js-desk-det-clock", "clock"), v: `${x.clock}${x.clocks_in_file > 1 ? ` (${t("js-desk-det-first-of", "the first of { $n }", { n: x.clocks_in_file })})` : ""}` });
  if (a.family === "navigation" && Number.isFinite(x.records_unhealthy) && x.records_unhealthy) rows.push({ k: t("js-desk-det-unhealthy", "records flagged unhealthy"), v: fmtCount(x.records_unhealthy), warn: true });
  if (a.whole === false) rows.push({ k: t("js-desk-det-read", "read"), v: t("js-desk-det-head", "the first { $mb } MiB of { $all } MiB: the span and gaps are of that part", { mb: Math.round((a.read_bytes || 0) / 1048576), all: Math.round((a.bytes || 0) / 1048576) }), warn: true });
  return rows;
}

/**
 * The scenario that opens a dropped file as a run: { title, toml } or null (the file is kept
 * as a data link). `clockTemplate` is the bundled clock-measured-log scenario's text: its
 * simulation is kept and its [clock_log] replaced by the dropped log.
 */
export function scenarioFor(a, { clockTemplate = "" } = {}) {
  if (!a || !a.ok || !a.opens_as || !a.path) return null;
  const name = String(a.name || "log");
  if (a.opens_as.kind === "receiver-trust") {
    const toml = [
      `# Opened by dropping ${name} on Kshana Desktop: the engine's receiver-trust run of the log as it is.`,
      'kind = "receiver-trust"', `name = ${tomlStr(name)}`, "", "[log]", `format = ${tomlStr(a.opens_as.format)}`, `path = ${tomlStr(a.path)}`, "", "[monitors]", "calibration_s = 60.0", "",
    ].join("\n");
    return { title: name, toml, file: `${name.replace(/[^A-Za-z0-9._-]+/g, "-")}.toml` };
  }
  if (a.opens_as.kind === "clock-log" && clockTemplate.includes("[clock_log]")) {
    const head = clockTemplate.slice(0, clockTemplate.indexOf("[clock_log]"));
    const lines = ["[clock_log]", `format = ${tomlStr(a.opens_as.format)}`, `path = ${tomlStr(a.path)}`, 'gaps = "longest"'];
    if (a.opens_as.format === "rinex-clk" && a.extra && a.extra.clock) lines.push(`clock = ${tomlStr(a.extra.clock)}`);
    return { title: name, toml: `${head}${lines.join("\n")}\n`, file: `${name.replace(/[^A-Za-z0-9._-]+/g, "-")}.toml` };
  }
  return null;
}

/** The answers of a drop (one per path, a folder's entries flattened), readable ones first. */
export function flattenAnswers(answers) {
  const out = [];
  for (const a of answers || []) {
    if (a && a.family === "folder" && Array.isArray(a.entries)) out.push(...a.entries.map((e) => ({ ...e, folder: a.name })));
    else if (a) out.push(a);
  }
  return out.sort((x, y) => (!!y.ok - !!x.ok));
}

/** A data link of the project for a readable answer. */
export const linkOf = (a, now = new Date()) => ({ path: a.path || a.name, name: a.name, format: a.format, family: a.family, bytes: a.bytes, added: now.toISOString() });
