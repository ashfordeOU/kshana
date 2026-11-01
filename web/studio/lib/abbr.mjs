// SPDX-License-Identifier: AGPL-3.0-only
// Spell out an abbreviation at its first use on a screen: "RAIM" becomes "RAIM (receiver
// autonomous integrity monitoring)" the first time, and stays "RAIM" after. Only whole words
// are touched, and an abbreviation already followed by its bracketed expansion is left alone.
// Pure; tested in abbr.test.mjs.
import { t } from "./t.mjs";
export const GLOSSARY = {
  get GNSS() { return t("js-lib-abbr-gnss", "global navigation satellite system"); },
  get GPS() { return t("js-lib-abbr-gps", "Global Positioning System"); },
  get RAIM() { return t("js-lib-abbr-raim", "receiver autonomous integrity monitoring"); },
  get ARAIM() { return t("js-lib-abbr-araim", "advanced receiver autonomous integrity monitoring"); },
  get SBAS() { return t("js-lib-abbr-sbas", "satellite-based augmentation system"); },
  get HPL() { return t("js-lib-abbr-hpl", "horizontal protection level"); },
  get VPL() { return t("js-lib-abbr-vpl", "vertical protection level"); },
  get HAL() { return t("js-lib-abbr-hal", "horizontal alert limit"); },
  get VAL() { return t("js-lib-abbr-val", "vertical alert limit"); },
  get PDOP() { return t("js-lib-abbr-pdop", "position dilution of precision"); },
  get DOP() { return t("js-lib-abbr-dop", "dilution of precision"); },
  get PNT() { return t("js-lib-abbr-pnt", "positioning, navigation and timing"); },
  get LEO() { return t("js-lib-abbr-leo", "low Earth orbit"); },
  get MEO() { return t("js-lib-abbr-meo", "medium Earth orbit"); },
  get INS() { return t("js-lib-abbr-ins", "inertial navigation system"); },
  get IMU() { return t("js-lib-abbr-imu", "inertial measurement unit"); },
  get TRN() { return t("js-lib-abbr-trn", "terrain-referenced navigation"); },
  get CSAC() { return t("js-lib-abbr-csac", "chip-scale atomic clock"); },
  get OCXO() { return t("js-lib-abbr-ocxo", "oven-controlled crystal oscillator"); },
  get SGP4() { return t("js-lib-abbr-sgp4", "Simplified General Perturbations 4, an orbit propagator"); },
  get TLE() { return t("js-lib-abbr-tle", "two-line element set"); },
  get RINEX() { return t("js-lib-abbr-rinex", "Receiver Independent Exchange Format"); },
  get SPP() { return t("js-lib-abbr-spp", "single-point positioning"); },
  get PPP() { return t("js-lib-abbr-ppp", "precise point positioning"); },
  get SISRE() { return t("js-lib-abbr-sisre", "signal-in-space range error"); },
  get MTIE() { return t("js-lib-abbr-mtie", "maximum time interval error"); },
  get TDEV() { return t("js-lib-abbr-tdev", "time deviation"); },
  get UKF() { return t("js-lib-abbr-ukf", "unscented Kalman filter"); },
  get SLAM() { return t("js-lib-abbr-slam", "simultaneous localisation and mapping"); },
  get ROC() { return t("js-lib-abbr-roc", "receiver operating characteristic"); },
  get AUC() { return t("js-lib-abbr-auc", "area under the curve"); },
  get NTN() { return t("js-lib-abbr-ntn", "non-terrestrial network"); },
  get UHF() { return t("js-lib-abbr-uhf", "ultra-high frequency"); },
  get VLBI() { return t("js-lib-abbr-vlbi", "very-long-baseline interferometry"); },
  get LLR() { return t("js-lib-abbr-llr", "lunar laser ranging"); },
  get OEM() { return t("js-lib-abbr-oem", "Orbit Ephemeris Message"); },
  get OMM() { return t("js-lib-abbr-omm", "Orbit Mean-elements Message"); },
  get CCSDS() { return t("js-lib-abbr-ccsds", "Consultative Committee for Space Data Systems"); },
  get TOML() { return t("js-lib-abbr-toml", "the scenario file format"); },
  get CLI() { return t("js-lib-abbr-cli", "command-line interface"); },
  get DOI() { return t("js-lib-abbr-doi", "digital object identifier"); },
  get "C/N0"() { return t("js-lib-abbr-c-n0", "carrier-to-noise density"); },
  get "J/S"() { return t("js-lib-abbr-j-s", "jammer-to-signal ratio"); },
  get "ITU-T"() { return t("js-lib-abbr-itu-t", "International Telecommunication Union, Telecommunication Standardization Sector"); },
  get RF() { return t("js-lib-abbr-rf", "radio frequency"); },
  get EO() { return t("js-lib-abbr-eo", "Earth observation"); },
  get IoT() { return t("js-lib-abbr-iot", "Internet of Things"); },
  get UTC() { return t("js-lib-abbr-utc", "Coordinated Universal Time"); },
  get CW() { return t("js-lib-abbr-cw", "continuous wave"); },
  get WG() { return t("js-lib-abbr-wg", "Working Group"); },
  get APV() { return t("js-lib-abbr-apv", "approach with vertical guidance"); },
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
