// SPDX-License-Identifier: AGPL-3.0-only
// The receiver-self-report lane of the Maritime trust view (0.38; engine feat/referee-0.38, B4). Reads what the engine writes when
// a log carries the receiver's own spoofing and jamming flags (u-blox UBX-NAV-STATUS spoofDetState, UBX-SEC-SIG): per epoch
// `self_report` {spoofing_state, jamming_state, receiver_flag, kshana_alarm, agreement} and, at the top of a batch result,
// `receiver_self_report` (the counts and the first times). The codes are the receiver's own (0 unknown or not enabled, 1 none
// indicated, 2 indicated, 3 multiple or critical); a receiver's detector is not validated here and agreement is not validation.
// A result without them (a log without those messages, or an older engine) has none, and the view says so rather than drawing
// a lane of "neither". Pure; tested in trust-selfreport.test.mjs.

export const AGREEMENTS = Object.freeze(["both", "receiver-only", "kshana-only", "neither", "calibrating"]);
export const AGREEMENT_TEXT = Object.freeze({
  both: "both flag: the receiver's own flag and a Kshana monitor",
  "receiver-only": "only the receiver flags: no Kshana monitor alarms",
  "kshana-only": "only Kshana alarms: the receiver does not flag",
  neither: "neither flags",
  calibrating: "inside the calibration window: not compared",
});
export const STATE_TEXT = Object.freeze({ 0: "unknown or not enabled", 1: "none indicated", 2: "indicated", 3: "multiple indications or affirmed" });

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const code = (x) => (isNum(x) && x >= 0 && x <= 3 && Number.isInteger(x) ? x : null);
const count = (x) => (isNum(x) && x >= 0 ? Math.round(x) : null);

// One epoch's `self_report`, normalised; null when the epoch has none. An agreement this page does not know is read as
// "unknown" (never as "neither") and kept so the page can count it.
export function readSelfReport(r) {
  if (!r || typeof r !== "object" || Array.isArray(r)) return null;
  const known = AGREEMENTS.includes(r.agreement);
  return { spoofing: code(r.spoofing_state), jamming: code(r.jamming_state), receiverFlag: r.receiver_flag === true, kshanaAlarm: r.kshana_alarm === true, agreement: known ? r.agreement : "unknown", odd: known ? null : String(r.agreement).slice(0, 40) };
}

// The batch result's `receiver_self_report`, or null.
export function readSelfSummary(s) {
  if (!s || typeof s !== "object" || Array.isArray(s)) return null;
  return {
    note: typeof s.note === "string" ? s.note.slice(0, 400) : "", epochsReported: count(s.epochs_reported), receiverFlagEpochs: count(s.receiver_flag_epochs),
    both: count(s.both), receiverOnly: count(s.receiver_only), kshanaOnly: count(s.kshana_only), neither: count(s.neither),
    spoofingFlagEpochs: count(s.spoofing_flag_epochs), jammingFlagEpochs: count(s.jamming_flag_epochs),
    firstReceiverFlagS: isNum(s.first_receiver_flag_s) ? s.first_receiver_flag_s : null, firstKshanaAlarmS: isNum(s.first_kshana_alarm_s) ? s.first_kshana_alarm_s : null,
  };
}

// The words for the cursor's epoch: a heading and rows of [label, value].
export function selfReportAt(e) {
  const r = e && e.selfReport;
  if (!r) return { heading: "The log carries no receiver flag at this time.", rows: [] };
  const st = (v) => (v == null ? "not in the log" : `${v}: ${STATE_TEXT[v]}`);
  return {
    heading: AGREEMENT_TEXT[r.agreement] || `an agreement this page does not know (${r.odd})`,
    rows: [["Receiver spoofing state", st(r.spoofing)], ["Receiver jamming state", st(r.jamming)], ["Receiver flags", r.receiverFlag ? "yes (state 2 or more)" : "no"], ["A Kshana monitor alarms", r.kshanaAlarm ? "yes" : "no"]],
  };
}

// Plain lines for the summary card.
export function summaryLines(s) {
  if (!s) return [];
  const n = (v) => (v == null ? "n/a" : String(v)), t = (v) => (v == null ? "never" : `T+${Math.round(v)} s`);
  return [
    ["Epochs compared (after calibration)", n(s.epochsReported)], ["Receiver flags", n(s.receiverFlagEpochs)], ["Both flag", n(s.both)], ["Only the receiver flags", n(s.receiverOnly)],
    ["Only Kshana alarms", n(s.kshanaOnly)], ["Neither", n(s.neither)], ["Receiver spoofing flag (state 2+)", n(s.spoofingFlagEpochs)], ["Receiver jamming flag (state 2+)", n(s.jammingFlagEpochs)],
    ["First receiver flag", t(s.firstReceiverFlagS)], ["First Kshana alarm among those epochs", t(s.firstKshanaAlarmS)],
  ];
}
