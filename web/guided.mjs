// SPDX-License-Identifier: Apache-2.0
// Guided-mode knobs for the playground: a small set of labelled sliders that map
// onto real TOML scalars so a user can tune a scenario without touching the
// document. The top-level helpers (readScalar/patchScalar) live in share.mjs and
// only see keys before the first [section]; the universal knobs (step_s,
// duration_s, mask_deg, y0) live inside sections, so this module adds the
// sectioned read/patch and resolves which ≤6 knobs apply to a given scenario.
// Pure logic, unit-tested in guided.test.mjs; the slider DOM lives in app.js.
import { readScalar } from "./share.mjs";

// Match a `[section]` header line, capturing the section name.
const headerRe = /^\s*\[([^\]]+)\]\s*(?:#.*)?$/;

/// Read the raw value of `key = value` inside `[section]`, scanning from that
/// section's header until the next `[…]` header. Returns the value trimmed of an
/// inline comment and whitespace, or null if the section or key is absent. This
/// is the sectioned analogue of share.mjs's top-level `readScalar`.
export function readSectionScalar(toml, section, key) {
  const lines = toml.split("\n");
  let inSection = false;
  const re = new RegExp(`^\\s*${key}\\s*=\\s*(.+)$`);
  for (const line of lines) {
    const h = line.match(headerRe);
    if (h) {
      inSection = h[1].trim() === section;
      continue;
    }
    if (!inSection) continue;
    const m = line.match(re);
    if (m) return m[1].replace(/\s*#.*$/, "").trim();
  }
  return null;
}

/// Replace `key = value` inside `[section]` in place, preserving the header and
/// every sibling key. Only the first occurrence inside the named section is
/// touched. If the section or key is absent the TOML is returned unchanged, so a
/// caller can safely disable a control when readSectionScalar is null.
export function patchSectionScalar(toml, section, key, value) {
  const lines = toml.split("\n");
  let inSection = false;
  const re = new RegExp(`^(\\s*${key}\\s*=\\s*).+$`);
  for (let i = 0; i < lines.length; i++) {
    const h = lines[i].match(headerRe);
    if (h) {
      inSection = h[1].trim() === section;
      continue;
    }
    if (inSection && re.test(lines[i])) {
      lines[i] = lines[i].replace(re, `$1${value}`);
      return lines.join("\n");
    }
  }
  return toml;
}

const int = (v) => parseInt(v, 10);
const flt = (v) => parseFloat(v);

/// The full catalogue of candidate guided knobs. Each entry:
///   { key, section, label, hint, min, max, step, parse, fmt }
/// where `section` is "" for a top-level key (seed, threshold_ns) or a `[section]`
/// name for a sectioned key (time, user, clock_quantum). `knobsForToml` selects
/// the subset present in a scenario, capped at 6, so the panel adapts: clock
/// scenarios show seed/threshold/duration/step/y0; orbit scenarios show
/// seed/mask_deg/duration/step/inclination.
export const GUIDED_KNOBS = [
  { key: "seed", section: "", label: "Random seed", hint: "a different noise draw of the same physics", min: 1, max: 100, step: 1, parse: int, fmt: String },
  { key: "threshold_ns", section: "", label: "Spec threshold (ns)", hint: 'in-spec budget; "available" while error stays under it', min: 1, max: 100, step: 1, parse: flt, fmt: String },
  { key: "step_s", section: "time", label: "Time step (s)", hint: "integration / sampling cadence", min: 1, max: 300, step: 1, parse: flt, fmt: String },
  { key: "duration_s", section: "time", label: "Duration (s)", hint: "total run length", min: 60, max: 86400, step: 60, parse: flt, fmt: String },
  { key: "mask_deg", section: "", label: "Elevation mask (°)", hint: "a satellite must be this high to count as visible", min: 0, max: 30, step: 1, parse: flt, fmt: String },
  { key: "altitude_km", section: "user", label: "User altitude (km)", hint: "the user spacecraft's orbital altitude", min: 200, max: 36000, step: 50, parse: flt, fmt: String },
  { key: "inclination_deg", section: "user", label: "User inclination (°)", hint: "the user orbit's inclination", min: 0, max: 100, step: 1, parse: flt, fmt: String },
  { key: "sigma_uere_m", section: "", label: "Range error σ (m)", hint: "1-σ user-equivalent range error for the position summary", min: 0.1, max: 10, step: 0.1, parse: flt, fmt: String },
];

// Read a knob's raw value from the TOML, choosing the top-level or sectioned
// reader by the knob's `section`. Exposed for app.js's slider sync.
export function readKnob(toml, knob) {
  return knob.section ? readSectionScalar(toml, knob.section, knob.key) : readScalar(toml, knob.key);
}

/// The subset of GUIDED_KNOBS whose key is present in `toml` (so the panel
/// auto-adapts to the scenario), capped at 6 in catalogue order. A knob is
/// "present" when its raw value reads back as a finite number, so a hand-pasted
/// scenario that omits a key simply drops that slider.
export function knobsForToml(toml) {
  const present = [];
  for (const k of GUIDED_KNOBS) {
    const raw = readKnob(toml, k);
    if (raw !== null && Number.isFinite(k.parse(raw))) {
      present.push(k);
      if (present.length === 6) break;
    }
  }
  return present;
}
