// Builds the receiver-trust session the generic run sends to the engine: the settings' [log] gets the format the
// person picked and the file's bytes inline (text for text formats, base64 for binary ones), and an optional IMU
// file becomes [log.imu]. The browser has no file system, so nothing here names a path. Pure; no DOM.
import { toBase64 } from "./tools35.mjs";

// What the engine's `[log] format` accepts here (0.38). `binary` formats go in as base64.
export const LOG_FORMATS = Object.freeze([
  { id: "nmea", label: "NMEA 0183 (text)", binary: false, exts: ["nmea", "txt", "log"] },
  { id: "rtklib-pos", label: "RTKLIB .pos solution (text)", binary: false, exts: ["pos"] },
  { id: "novatel", label: "NovAtel OEM7 (ASCII or binary)", binary: true, exts: ["gps", "asc", "bin", "novatel"] },
  { id: "rtcm3", label: "RTCM 3 MSM4 / MSM7 (binary)", binary: true, exts: ["rtcm", "rtcm3"] },
  { id: "gnss-sdr", label: "GNSS-SDR relayed JSON lines (text)", binary: false, exts: ["jsonl", "ndjson"] },
  { id: "sbf", label: "Septentrio SBF (binary)", binary: true, exts: ["sbf"] },
  { id: "ubx", label: "u-blox UBX (binary)", binary: true, exts: ["ubx"] },
  { id: "rinex", label: "RINEX observation (text)", binary: false, exts: ["rnx", "obs"] },
  { id: "android", label: "Android GNSS Logger (text)", binary: false, exts: [] },
]);
export const IMU_FORMATS = Object.freeze([{ id: "csv", label: "CSV with a header row" }, { id: "euroc", label: "EuRoC MAV imu0 data.csv" }]);

export const formatInfo = (id) => LOG_FORMATS.find((f) => f.id === id) || null;

// The format a file name suggests, or "" (the person picks). RINEX 2 names end ".yyO".
export function formatFromName(name) {
  const n = String(name || "").toLowerCase().replace(/\s/g, "");
  const ext = (n.match(/\.([a-z0-9]+)$/) || [])[1] || "";
  if (/^\d\do$/.test(ext)) return "rinex";
  if (/^android|gnss_?log/.test(n.split("/").pop())) return "android";
  const hit = LOG_FORMATS.find((f) => f.exts.includes(ext));
  return hit ? hit.id : "";
}

// A guess from the first bytes, for names that say nothing (".log"): NovAtel ASCII "#BESTPOSA..." or binary AA 44 12,
// an RTCM 3 frame (D3), an SBF block ("$@"), a UBX frame (B5 62). "" when the bytes say nothing.
export function sniffFormat(bytes) {
  const b = bytes || [];
  if (b.length >= 3 && b[0] === 0xaa && b[1] === 0x44 && b[2] === 0x12) return "novatel";
  if (b.length >= 2 && b[0] === 0xb5 && b[1] === 0x62) return "ubx";
  if (b.length >= 2 && b[0] === 0x24 && b[1] === 0x40) return "sbf";
  if (b.length >= 3 && b[0] === 0xd3 && (b[1] & 0xfc) === 0) return "rtcm3";
  const head = String.fromCharCode(...Array.from(b).slice(0, 12));
  if (/^#[A-Z0-9]{3,24}A,/.test(head + ",")) return "novatel";
  return "";
}

const noTriple = (t, what) => { if (String(t).includes("'''")) throw new Error(`${what} contains three single quotes in a row, which cannot be embedded in the settings`); };
const source = (bytes, text, binary) => {
  if (binary) return `base64 = "${toBase64(bytes)}"`;
  noTriple(text, "the file");
  return `text = '''\n${text}'''`;
};

// settingsToml: the session settings as shown (they may carry a [log] with a path and a format, or none).
// log: {format, bytes: Uint8Array, text?: string}. imu: null, or {format, text, heading0Deg, yawAxisDown, timeOffsetS}.
// vessel: true adds `[platform] kind = "vessel"` (heading_sensor when an IMU is given) unless the settings already name a platform.
export function buildSession(settingsToml, log, imu, vessel = false) {
  const f = formatInfo(log.format);
  if (!f) throw new Error(`"${log.format}" is not a log format this page can send to the engine`);
  const lines = String(settingsToml).replace(/\r\n/g, "\n").split("\n");
  const logBody = () => [`format = "${f.id}"`, source(log.bytes, log.text ?? "", f.binary)].join("\n");
  const out = [];
  let inLog = false, sawLog = false;
  for (const ln of lines) {
    const head = ln.match(/^\s*\[([^\]]+)\]\s*(#.*)?$/);
    if (head) {
      inLog = head[1].trim() === "log";
      if (inLog) { sawLog = true; out.push(ln, logBody()); continue; }
    }
    if (inLog && /^\s*(format|path|text|base64)\s*=/.test(ln)) continue; // replaced by the body just after the header
    out.push(ln);
  }
  let toml = out.join("\n");
  if (!sawLog) toml += `\n[log]\n${logBody()}\n`;
  if (vessel && !/^\s*\[platform\]/m.test(toml)) toml += `\n[platform]\nkind = "vessel"\n${imu ? "heading_sensor = true\n" : ""}`;
  if (imu) {
    const i = IMU_FORMATS.find((x) => x.id === imu.format);
    if (!i) throw new Error(`"${imu.format}" is not an IMU format this page reads (csv or euroc)`);
    if (!Number.isFinite(imu.heading0Deg)) throw new Error("the IMU's heading at its first sample is not a number");
    const off = Number.isFinite(imu.timeOffsetS) ? imu.timeOffsetS : 0;
    noTriple(imu.text, "the IMU file");
    toml += `\n[log.imu]\nformat = "${i.id}"\ntext = '''\n${imu.text}'''\nheading0_deg = ${imu.heading0Deg}\nyaw_axis_down = ${imu.yawAxisDown === false ? "false" : "true"}\ntime_offset_s = ${off}\n`;
  }
  return toml;
}
