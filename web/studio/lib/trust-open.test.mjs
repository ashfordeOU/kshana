import test from "node:test";
import assert from "node:assert/strict";
import { LOG_FORMATS, sniffFormat, formatFromName, buildSession, formatInfo } from "./trust-open.mjs";

const SETTINGS = `kind = "receiver-trust"\n\n[log]\nformat = "nmea"\npath = "x.nmea"\n\n[monitors]\ncalibration_s = 60.0\n\n[[events]]\nlabel = "a"\n`;

test("file names suggest a format, and the picker keeps the rest", () => {
  assert.equal(formatFromName("run.pos"), "rtklib-pos");
  assert.equal(formatFromName("cap.SBF"), "sbf");
  assert.equal(formatFromName("a.ubx"), "ubx");
  assert.equal(formatFromName("site.24o"), "rinex");
  assert.equal(formatFromName("base.rtcm3"), "rtcm3");
  assert.equal(formatFromName("log.gps"), "novatel");
  assert.equal(formatFromName("mystery.dat"), "");
  assert.equal(formatFromName("dir/gnss_log_2026.txt"), "android"); assert.equal(formatFromName("android-fixes.txt"), "android"); assert.equal(formatFromName("my-android-notes.dat"), "");
});

test("the log replaces the path and format in [log] and nothing else moves", () => {
  const t = buildSession(SETTINGS, { format: "rtklib-pos", bytes: new TextEncoder().encode("p"), text: "pos text\n" });
  assert.match(t, /\[log\]\nformat = "rtklib-pos"\ntext = '''\npos text\n'''/);
  assert.ok(!/path\s*=/.test(t) && !/format = "nmea"/.test(t));
  assert.match(t, /\[monitors\]\ncalibration_s = 60.0/);
  assert.match(t, /\[\[events\]\]/);
});

test("binary formats go in as base64", () => {
  const t = buildSession(SETTINGS, { format: "novatel", bytes: Uint8Array.from([0xaa, 0x44, 0x12]) });
  assert.match(t, /format = "novatel"\nbase64 = "qkQS"/);
});

test("settings without a [log] get one; an IMU file becomes [log.imu]", () => {
  const t = buildSession(`kind = "receiver-trust"\n`, { format: "nmea", bytes: new Uint8Array(0), text: "$GP\n" }, { format: "csv", text: "t_s,gz\n0,0\n", heading0Deg: 90, yawAxisDown: false, timeOffsetS: 1.5 });
  assert.match(t, /\n\[log\]\nformat = "nmea"/);
  assert.match(t, /\[log\.imu\]\nformat = "csv"\ntext = '''\nt_s,gz\n0,0\n'''\nheading0_deg = 90\nyaw_axis_down = false\ntime_offset_s = 1.5/);
});

test("refusals are said", () => {
  assert.throws(() => buildSession(SETTINGS, { format: "nmea", bytes: new Uint8Array(0), text: "a'''b" }), /three single quotes/);
  assert.throws(() => buildSession(SETTINGS, { format: "pcap", bytes: new Uint8Array(0) }), /not a log format/);
  assert.throws(() => buildSession(SETTINGS, { format: "nmea", bytes: new Uint8Array(0), text: "" }, { format: "csv", text: "x", heading0Deg: NaN }), /heading/);
  assert.throws(() => buildSession(SETTINGS, { format: "nmea", bytes: new Uint8Array(0), text: "" }, { format: "bin", text: "x", heading0Deg: 0 }), /csv or euroc/);
});

test("every listed format is known and binary ones have no text path", () => {
  assert.equal(LOG_FORMATS.length, 9);
  assert.ok(formatInfo("sbf").binary && !formatInfo("nmea").binary);
});

test("the first bytes name a binary or NovAtel log when the file name does not", () => {
  const e = (t) => new TextEncoder().encode(t);
  assert.equal(sniffFormat(e("#BESTPOSA,COM1,0,50.0,FINESTEERING,2300,100.000")), "novatel");
  assert.equal(sniffFormat(Uint8Array.from([0xaa, 0x44, 0x12, 0x1c])), "novatel");
  assert.equal(sniffFormat(Uint8Array.from([0xb5, 0x62, 0x01, 0x07])), "ubx");
  assert.equal(sniffFormat(Uint8Array.from([0x24, 0x40, 0, 0])), "sbf");
  assert.equal(sniffFormat(Uint8Array.from([0xd3, 0x00, 0x13])), "rtcm3");
  assert.equal(sniffFormat(e("$GPGGA,123519,4807.038,N")), "");
  assert.equal(sniffFormat(e("")), "");
});

test("a vessel run adds the platform, with the heading sensor when an IMU is given, and keeps one the settings name", () => {
  const log = { format: "nmea", bytes: new Uint8Array(0), text: "x\n" };
  assert.match(buildSession(`kind = "receiver-trust"\n`, log, null, true), /\[platform\]\nkind = "vessel"\n$/);
  assert.match(buildSession(`kind = "receiver-trust"\n`, log, { format: "csv", text: "t", heading0Deg: 0 }, true), /\[platform\]\nkind = "vessel"\nheading_sensor = true\n/);
  assert.equal((buildSession(`[platform]\nkind = "vessel"\n`, log, null, true).match(/\[platform\]/g) || []).length, 1);
  assert.ok(!/\[platform\]/.test(buildSession(`kind = "receiver-trust"\n`, log, null, false)));
});
