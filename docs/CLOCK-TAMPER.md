<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Independent clock-tamper detector: `kshana clock-tamper`

A computer's audit trail stamps each event with the time of that computer's own clock. Whoever
can set the clock can make an event look earlier or later, and the audit trail records the
falsified time faithfully. `kshana clock-tamper` checks the OS clock of one computer against
readings that do not come from it: time offsets measured against two or more independent
references, and RFC 3161 timestamp tokens from a time-stamping authority. It reports steps,
logged clock changes, offset and drift, per UTC day.

```
kshana clock-tamper check <samples.json> [--json] [--out <report.json>]
kshana clock-tamper template            # a sample file to start from
```

Exit codes: 0 no finding; 1 at least one finding; 2 a usage or input error. The command reads
files only; it makes no network request and does not query any time server itself.

**Evidence: MODELLED.** The verdicts are only as independent as the readings. Offsets measured on
the same computer, by software an administrator of that computer controls, can be falsified with
it; readings collected by a separate device or service are stronger. A finding is a pointer for a
person to examine, not proof of intent or of a falsified record, and "no findings" is not proof
that the clock was never changed. The report is **not signed**: it records the SHA-256 of every
input, and it can be placed in a signed [`kshana evidence`](EVIDENCE-PACKS.md) pack.

## The sample file (`kshana.clock-samples/1`)

A collector (a scheduled task, a script around `chronyc`, `ntpq`, `w32tm /stripchart` or an NTS
client) writes one sample per interval: the OS time, the monotonic clock, and the offset of each
reference at that moment.

```json
{
  "format": "kshana.clock-samples/1",
  "host": "lab-pc-01",
  "thresholds": { "step_s": 0.5, "max_offset_s": 1.0, "max_drift_ppm": 50.0,
                  "reference_agreement_s": 0.1, "min_agreeing_references": 2,
                  "tsa_tolerance_s": 1.0, "event_window_s": 300.0, "min_drift_span_s": 3600.0 },
  "samples": [
    { "os_utc": "2026-11-20T08:00:00.000Z", "monotonic_s": 1000.0, "boot_id": "boot-1",
      "references": [
        { "id": "nts-a", "kind": "nts", "offset_s": 0.004, "authenticated": true },
        { "id": "gnss-lab", "kind": "ntp-gnss", "offset_s": 0.003 } ] }
  ],
  "events": [
    { "os_utc": "2026-11-20T12:58:00Z", "kind": "clock-set", "detail": "Security 4616 by LAB\\analyst2" }
  ],
  "timestamp_tokens": [
    { "token": "day2.tsr", "os_utc_at_request": "2026-11-20T13:59:59.998Z" }
  ]
}
```

| Field | Meaning |
|---|---|
| `samples[].os_utc` | the OS wall-clock time, RFC 3339 UTC |
| `samples[].monotonic_s` | a clock that only counts elapsed time and that setting the wall clock does not move (Linux `CLOCK_MONOTONIC`, Windows `QueryPerformanceCounter`); optional |
| `samples[].boot_id` | changes at each restart, when the monotonic clock starts again |
| `references[].offset_s` | **reference time minus OS time**, s, as measured by the collector |
| `references[].authenticated` | the exchange was authenticated (NTS, RFC 8915; or a symmetric key), as the collector states it |
| `events[]` | clock changes copied from the OS log (for example Windows Security event 4616, a systemd-timesyncd or `timedatectl` journal entry), with the time as logged |
| `timestamp_tokens[]` | a DER RFC 3161 token file (path relative to the sample file) and the OS time when it was requested |

Every threshold has the default shown and is an input: the method states none as correct.

## What is checked

- **Steps.** Between two samples of one boot, the OS clock's change minus the monotonic clock's
  change. More than `step_s` back is a `step-back`; forward, a `step-forward`. Without a
  monotonic clock, the change of the median reference offset is used instead. Each step says
  whether the references saw the same jump and whether a clock change was logged within
  `event_window_s`.
- **Logged clock changes** with no step near them: `unexplained-clock-change` (no sample nearby,
  or a change smaller than `step_s`).
- **Offset.** The median reference offset beyond `max_offset_s`: `offset`.
- **References.** Fewer than `min_agreeing_references` within `reference_agreement_s` of their
  median: `references-disagree` (one reference may be wrong, or only one was reachable).
- **Drift.** The least-squares slope of the median offset against the monotonic clock, over each
  stretch of a day between steps of at least `min_drift_span_s`; a rate beyond `max_drift_ppm`
  is `drift` (positive: the OS clock runs fast).
- **Timestamp tokens.** The token's `genTime` minus the OS time at the request, beyond
  `max_offset_s + tsa_tolerance_s`: `token-offset`. The `genTime` and imprint are read
  (`src/evidence/tsr.rs`); the authority's signature is **not** verified by this command:
  verify it with `openssl ts -verify` against the authority's certificate.

## The report (`kshana.clock-tamper-report/1`)

`label: MODELLED`, `signature: unsigned`, the disclaimer, the host, every input with its SHA-256,
the thresholds used, and for each UTC day (by OS time): the samples, the references seen and
which were authenticated, the largest offset and drift, the logged clock changes, the tokens, the
findings in time order, and a verdict (`no-findings` or `findings`).

## Example

`tests/fixtures/clock-tamper/samples.json` is a fictional three-day record: a clean day; a day on
which the clock is set back one hour at 14:00 with the change logged, then forward again at 16:00
without a log entry, and a timestamp token requested while it was back; and a day on which the
clock runs 60 ppm slow and the two references disagree once.

```sh
kshana clock-tamper check tests/fixtures/clock-tamper/samples.json
```

Abridged output (the 12 `offset` lines of the hour the clock was back are cut to one):

```
2026-11-19  no-findings  samples=61 references=2 authenticated=1 max|offset|=0.001750 s max|drift|=0.000 ppm clock-changes=0 tokens=1

2026-11-20  findings  samples=61 references=2 authenticated=1 max|offset|=3600.001750 s max|drift|=0.000 ppm clock-changes=1 tokens=1
  2026-11-20T12:59:59.998Z offset: median reference offset 3600.001750 s (reference minus OS time)
  2026-11-20T12:59:59.998Z step-back: OS clock moved -3600.000 s against the monotonic clock between 2026-11-20T13:49:59.998Z and 2026-11-20T12:59:59.998Z; the references saw the same jump; logged: 2026-11-20T12:58:00Z clock-set Security 4616 by LAB\analyst2 (fictional)
  2026-11-20T13:59:59.998Z token-offset: day2.tsr: genTime 2026-11-20T15:00:00.2Z minus OS time at request 2026-11-20T13:59:59.998Z = +3600.202 s (token signature not verified here)
  2026-11-20T15:59:59.998Z step-forward: OS clock moved +3600.000 s against the monotonic clock between 2026-11-20T14:49:59.998Z and 2026-11-20T15:59:59.998Z; the references saw the same jump; no clock change logged within the window

2026-11-21  findings  samples=25 references=2 authenticated=1 max|offset|=0.865750 s max|drift|=60.004 ppm clock-changes=0 tokens=0
  2026-11-21T09:59:59.566Z references-disagree: 0 of 2 references within 0.1 s of the median offset 0.682000 s
  2026-11-21T11:59:59.134Z drift: OS clock rate -60.004 ppm against the references over 14399 s (positive: runs fast)
```

## Limits

- The references' independence is the collector's: this command cannot tell how an offset was
  measured. Record readings from a source the computer's administrators cannot change (a separate
  GNSS-disciplined server, an authenticated NTS server, a time-stamping authority).
- A clock changed and restored between two samples, by less than `step_s`, or while no sample
  was taken, is not seen; sample often and keep the monotonic clock.
- Days are UTC days of the OS time.

Code: `src/clock_tamper.rs`. Tests: `tests/clock_tamper.rs`.
