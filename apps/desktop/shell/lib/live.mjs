// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: live ships and aircraft (0.42 U26). The app's native side
// (src-tauri/src/live.rs) reads AIS NMEA over TCP or UDP, or Mode S / ADS-B as Beast or AVR over
// TCP from a local dump1090 or readsb, stamps each message with its arrival time and decodes the
// kept messages with the engine's own readers; the shell shows them in the traffic view (U17) and
// refreshes it. This module holds the pure parts: the source check (the same rules as the native
// side) and the usual sources. Tested in live.test.mjs.

/** The usual live sources: [id, format, source, what it is]. */
export const LIVE_PRESETS = [
  ["readsb-beast", "beast", "tcp:127.0.0.1:30005", "dump1090 or readsb on this computer, Beast output (port 30005)"],
  ["readsb-avr", "avr", "tcp:127.0.0.1:30002", "dump1090 or readsb on this computer, raw AVR output (port 30002)"],
  ["ais-udp", "ais", "udp:127.0.0.1:10110", "AIS sentences sent to this computer's UDP port 10110 (AIS-catcher, rtl-ais, a receiver's network output)"],
  ["ais-tcp", "ais", "tcp:192.168.1.20:10110", "AIS sentences from a receiver or multiplexer's TCP port (write its address)"],
];

/** The formats of a live source. */
export const LIVE_FORMATS = ["ais", "beast", "avr"];

/**
 * Check a live source before it is sent to the native side: { ok, transport, host, port } or
 * { ok: false, reason }. `tcp:<host>:<port>`, or `udp:<address>:<port>` for AIS.
 */
export function checkSource(source, format) {
  const s = String(source || "").trim();
  if (!LIVE_FORMATS.includes(format)) return { ok: false, reason: "format" };
  const m = /^(tcp|udp):(?:\/\/)?(.+):(\d{1,5})$/.exec(s);
  if (!m || !m[2]) return { ok: false, reason: "syntax" };
  const port = Number(m[3]);
  if (!(port > 0 && port < 65536)) return { ok: false, reason: "port" };
  if (m[1] === "udp" && format !== "ais") return { ok: false, reason: "udp-ais-only" };
  return { ok: true, transport: m[1], host: m[2], port };
}

/** Whether a UDP source listens beyond this computer (bound to every address or a network one). */
export function listensOnNetwork(source) {
  const c = /^udp:(?:\/\/)?(.+):\d+$/.exec(String(source || "").trim());
  return !!c && !/^(127\.|localhost$|\[?::1\]?$)/.test(c[1]);
}

/** The cursor to show after a refresh: the newest time when following, else the same time within the new span. */
export function cursorAfter(span, prev, follow) {
  if (!span || !Number.isFinite(span[1])) return undefined;
  if (follow || !Number.isFinite(prev)) return span[1];
  return Math.min(span[1], Math.max(span[0], prev));
}
