// SPDX-License-Identifier: AGPL-3.0-only
// Spell out an abbreviation at its first use on a screen: "RAIM" becomes "RAIM (receiver
// autonomous integrity monitoring)" the first time, and stays "RAIM" after. Only whole words
// are touched, and an abbreviation already followed by its bracketed expansion is left alone.
// Pure; tested in abbr.test.mjs.
export const GLOSSARY = {
  GNSS: "global navigation satellite system",
  GPS: "Global Positioning System",
  RAIM: "receiver autonomous integrity monitoring",
  ARAIM: "advanced receiver autonomous integrity monitoring",
  SBAS: "satellite-based augmentation system",
  HPL: "horizontal protection level",
  VPL: "vertical protection level",
  HAL: "horizontal alert limit",
  VAL: "vertical alert limit",
  PDOP: "position dilution of precision",
  DOP: "dilution of precision",
  PNT: "positioning, navigation and timing",
  LEO: "low Earth orbit",
  MEO: "medium Earth orbit",
  INS: "inertial navigation system",
  IMU: "inertial measurement unit",
  TRN: "terrain-referenced navigation",
  CSAC: "chip-scale atomic clock",
  OCXO: "oven-controlled crystal oscillator",
  SGP4: "Simplified General Perturbations 4, an orbit propagator",
  TLE: "two-line element set",
  RINEX: "Receiver Independent Exchange Format",
  SPP: "single-point positioning",
  PPP: "precise point positioning",
  SISRE: "signal-in-space range error",
  MTIE: "maximum time interval error",
  TDEV: "time deviation",
  UKF: "unscented Kalman filter",
  SLAM: "simultaneous localisation and mapping",
  ROC: "receiver operating characteristic",
  AUC: "area under the curve",
  NTN: "non-terrestrial network",
  UHF: "ultra-high frequency",
  VLBI: "very-long-baseline interferometry",
  LLR: "lunar laser ranging",
  OEM: "Orbit Ephemeris Message",
  OMM: "Orbit Mean-elements Message",
  CCSDS: "Consultative Committee for Space Data Systems",
  TOML: "the scenario file format",
  CLI: "command-line interface",
  DOI: "digital object identifier",
  "C/N0": "carrier-to-noise density",
  "J/S": "jammer-to-signal ratio",
  "ITU-T": "International Telecommunication Union, Telecommunication Standardization Sector",
  RF: "radio frequency",
  EO: "Earth observation",
  IoT: "Internet of Things",
  UTC: "Coordinated Universal Time",
  CW: "continuous wave",
  WG: "Working Group",
  APV: "approach with vertical guidance",
};

const esc = (s) => s.replace(/[.*+?^${}()|[\]\\/]/g, "\\$&");
const TERMS = Object.keys(GLOSSARY).sort((a, b) => b.length - a.length);
const RE = new RegExp(`(^|[^A-Za-z0-9_/-])(${TERMS.map(esc).join("|")})(?![A-Za-z0-9_])`, "g");

// Expand the first use of each term not yet in `seen` (a Set, updated in place).
export function spellOut(text, seen = new Set()) {
  return String(text).replace(RE, (m, pre, term, at, all) => {
    if (seen.has(term)) return m;
    seen.add(term);
    const after = all.slice(at + m.length);
    // Already expanded right after ("RAIM (receiver ..."), or written out just before: leave it.
    if (/^\s*\(/.test(after)) return m;
    // Inside brackets already, "(RAIM)" or "(HPL / VPL)": "(RAIM, receiver autonomous integrity
    // monitoring)", never a bracket inside a bracket.
    const before = all.slice(0, at + pre.length);
    if ((before.match(/\(/g) || []).length > (before.match(/\)/g) || []).length) return `${pre}${term}, ${GLOSSARY[term]}`;
    return `${pre}${term} (${GLOSSARY[term]})`;
  });
}
