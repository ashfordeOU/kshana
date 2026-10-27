// Words for the IMU-fit report (engine imu_fit): the fitted parameters with units, the log's rate and span, the early
// Allan slopes (about -0.5 where white noise dominates) and the engine's own notes. Pure; no DOM.
import { t } from "./t.mjs";
const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const g = (x) => (isNum(x) ? (x === 0 ? "0" : x.toExponential(2).replace(/e\+?(-?)0*(\d)/, "e$1$2")) : "n/a");

const params = () => [
  ["q_va", t("js-lib-imufit-card-q-va", "Accelerometer velocity random walk, q_va (m²/s³)")],
  ["bias", t("js-lib-imufit-card-bias", "Accelerometer bias, mean (m/s²)")],
  ["bias_instability", t("js-lib-imufit-card-bias-instability", "Accelerometer bias instability (m/s²), 0 when the curve has no floor")],
  ["q_arw", t("js-lib-imufit-card-q-arw", "Gyro angle random walk, q_arw (rad²/s)")],
  ["gyro_bias", t("js-lib-imufit-card-gyro-bias", "Gyro bias, mean (rad/s)")],
];

// fit: the report's `fit` object. Returns [label, value] rows; unknown or missing fields are skipped, never invented.
export function imuRows(fit) {
  if (!fit || typeof fit !== "object" || Array.isArray(fit)) return [];
  const rows = [];
  if (isNum(fit.samples)) rows.push([t("js-lib-imufit-card-samples", "Samples"), String(Math.round(fit.samples))]);
  if (isNum(fit.dt_s) && fit.dt_s > 0) rows.push([t("js-lib-imufit-card-sample-rate", "Sample rate"), `${(1 / fit.dt_s).toFixed(1)} Hz`]);
  if (isNum(fit.span_s)) rows.push([t("js-lib-imufit-card-span", "Span"), `${fit.span_s.toFixed(1)} s`]);
  for (const [k, label] of params()) if (isNum(fit[k])) rows.push([label, g(fit[k])]);
  if (isNum(fit.accel_white_slope)) rows.push([t("js-lib-imufit-card-accel-slope", "Accelerometer Allan slope, early (about -0.5 for white noise)"), fit.accel_white_slope.toFixed(2)]);
  if (isNum(fit.gyro_white_slope)) rows.push([t("js-lib-imufit-card-gyro-slope", "Gyro Allan slope, early (about -0.5 for white noise)"), fit.gyro_white_slope.toFixed(2)]);
  if (Array.isArray(fit.notes)) fit.notes.slice(0, 6).forEach((n, i) => rows.push([t("js-lib-imufit-card-note-n", "Note { $n }", { n: i + 1 }), String(n).slice(0, 300)]));
  return rows;
}
