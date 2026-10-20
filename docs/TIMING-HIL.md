<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Timing hardware-in-the-loop: pull the antenna, score the holdover

Telecom and power operators test a timing system by taking its GNSS away and watching what the
clock does. Kshana does not do that for them, and does not touch their equipment. It reads the
time-error record the operator's own instruments produced, splits it at the two times the operator
states, and **measures each step against public ITU-T masks**. The scenario kind is
[`holdover-test`](SCENARIOS.md); the example scenarios are
`scenarios/holdover-test-example.toml` and `scenarios/holdover-test-ptp4l.toml`.

This is hardware-safety **stage 1**: passive, receive-only, no RF from Kshana
([`HARDWARE-SAFETY.md`](HARDWARE-SAFETY.md)). Advisory software, not type-approved equipment. Nobody
has rated, approved or reviewed this procedure, and it says nothing about whether a system meets a
Recommendation.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="figures/0.38/timing-light.svg">
  <img src="figures/0.38/timing-light.svg" alt="A holdover test scored from a time-error record, from a real run of engine v0.38.0 on scenarios/holdover-test-example.toml (601 samples every 5 s). GNSS is removed by the operator at 600 s and restored at 2400 s; the time error drifts to 299 ns at the end of holdover, past the 100 ns budget after 675 s, and returns inside the 100 ns band 70 s after restoration. Verdicts: baseline masks PASS, holdover masks FAIL, holdover envelope FAIL, recovery RECOVERED. Measured against the mask, not an approval. The times are the operator's statement, not verified by Kshana. Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.">
</picture>

## The procedure

The operator runs four steps. Kshana performs none of them.

| Step | What the operator does | What the record shows |
|---|---|---|
| **1. Baseline** | Lets the system run locked to GNSS for as long as the test needs (and notes how many days it had been locked before). | The time error while disciplined. |
| **2. GNSS removed** | Removes GNSS from the system under test, for example the antenna cable at the receiver, or the output of the lab's own simulator, and **writes down the time**. Check the receiver maker's manual first: some receivers power the antenna, and some need a terminator on the open port. | The moment the time error starts to wander. |
| **3. Holdover** | Leaves the system on its own oscillator for the planned time. | The system's holdover. |
| **4. Recovery** | Restores GNSS and **writes down the time**. | The time error returning (or not). |

Two things the operator must do, because Kshana cannot:

- **State the two times.** `gnss_removed_s` and `gnss_restored_s` are the operator's statement. Kshana
  does not detect the removal from the record and does not verify the times. A wrong time moves
  the step boundaries and so the result.
- **Use the same clock for the record and the times.** For a clock log the time axis starts at the
  first reading, so the two times are seconds from the first line of the log.

## What to record

Any of these, through the existing `clock_log` readers ([`CLOCK-LOG-FORMATS.md`](CLOCK-LOG-FORMATS.md)):

| Instrument | Format | How the record is made |
|---|---|---|
| linuxptp `ptp4l` (the slave or boundary clock's servo) | `ptp4l` | run with `-m` and keep the lines `ptp4l[time]: master offset N sK freq ...` |
| linuxptp `phc2sys` | `phc2sys` | the lines `phc2sys[time]: CLOCK_REALTIME phc offset N sK ...` |
| linuxptp `ts2phc` | `ts2phc` | the lines `ts2phc[time]: /dev/ptpN offset N sK ...` |
| chrony `tracking.log` | `chrony-tracking` | `log tracking` in `chrony.conf` |
| chrony `statistics.log` | `chrony-statistics` | `log statistics` in `chrony.conf` |
| a TAPR TICC counter | `ticc` | timestamp mode against the reference |
| a TimeLab ASCII export | `timelab` | phase in a stated unit |
| a RINEX clock file | `rinex-clk` | one clock |
| anything else | `samples` or `csv_path` | `time_s,time_error_ns` pairs, uniformly sampled |

**What the record measures matters.** A servo log (linuxptp, chrony) records the offset the daemon
measured and is correcting: it is the time error left under servo control, not an independent
measurement of the clock against UTC. During the holdover step of a test that really removes the
reference, a servo log still shows what the daemon believed, which can differ from the true error. A
TICC or other counter against an independent reference is the stronger record; say which one you used
when you report the result.

## The scenario

```toml
kind = "holdover-test"
masks = ["prtc-a", "eprtc-a-holdover"]      # see docs/TELECOM-TIMING.md for the ids

[test]
gnss_removed_s = 600.0                      # the operator's statement
gnss_restored_s = 2400.0                    # omit if GNSS was not restored within the record
locked_duration_days = 5.0                  # how long it was locked before step 2 (sets the ePRTC-A period)
recovery_band_ns = 100.0                    # |TE| inside this counts as recovered
recovery_dwell_s = 60.0                     # ... and must stay inside this long

[series.clock_log]                          # or [series] samples = [[t, ns], ...] or csv_path = "..."
format = "ptp4l"
path = "holdover-2026-11-02.log"            # or text = "..." inline
```

```sh
kshana holdover-test.toml
```

Optional keys: `budgets` (name, `max_abs_te_ns`, source; the telecom-timing defaults when absent) and
`clock = "..."` inside `[series.clock_log]` to pick one source out of a log that holds several.

## What the report holds

- **`steps`**: for the baseline, the holdover and the recovery, the start and end, the sample count and
  the mean, rms, largest and end values of the time error.
- **`masks`**: each mask you named, measured on the step its condition names. A mask written for a
  locked clock is measured on the baseline; one written for holdover or an autonomous clock on the
  holdover. Each check has its limit, the measured value, the margin and the table it is transcribed
  from. A mask that needs a longer record than the step gave is **INCOMPLETE**, never extrapolated; one
  the engine cannot evaluate for the record's sample interval is **NOT-EVALUATED** with the reason.
- **`holdover`**: the fractional frequency offset the system held (the slope of a least-squares line
  through the holdover time error, in ns/s, which is parts per billion), the residual about that line,
  the largest absolute time error and when it occurred, and the step at the moment of removal.
- **`holdover_envelope`**: the ePRTC-A holdover envelope of ITU-T G.8272.1 Table 3, from
  `locked_duration_days`, with the time at which it is first exceeded.
- **`budgets`**: the time after removal at which each time-error budget is first exceeded.
- **`recovery`**: whether `|TE|` came inside the band and stayed for the dwell time, how long after
  GNSS returned that started, the peak after restoration and the largest step between consecutive
  samples while recovering.
- **`curves`**: MTIE and TDEV of the baseline and holdover steps.
- **`verdicts`**: a one-word summary per step.

Every number carries its unit and where it came from in the report's `units` block.

## The words, and the limits

- The result is **measured against the mask**. The masks are transcribed from freely downloadable
  ITU-T Recommendations (the same tables as the `telecom-timing` kind, listed in
  [`TELECOM-TIMING.md`](TELECOM-TIMING.md)), and every entry the Recommendations leave "for further
  study" is absent, not filled in. Kshana does not say that a clock or a system meets or is approved
  against a Recommendation, and the report does not either.
- **MODELLED.** The step logic, the line fit and the recovery rule are checked on records built from
  formulas whose answers are known before the run; no laboratory holdover has been scored against an
  external oracle, and no partner or laboratory has agreed to anything. A timing laboratory would be
  needed before any per-clock-class figure could be promoted.
- **What is not covered**, stated in every report: whether GNSS really was removed and restored at the
  stated times; any step the operator did not record; masks defined through a 0.1 Hz filter for a record
  sampled slower than once a second; the instrument's own measurement uncertainty; and any
  Recommendation procedure beyond a time-error record (temperature profiles, packet-network load).
- **The recovery band is the test's own choice.** The default of 100 ns is the maximum absolute time
  error of a PRTC-A (ITU-T G.8272); it is a convenient line, not a requirement of any Recommendation for
  recovery.
- **No transmit path.** Kshana reads files. It does not generate a signal, and removing GNSS in a lab
  is done with the lab's own equipment and under its own authorisation.

## Surfaces

`holdover-test` is a scenario kind, so it runs everywhere kinds run: `kshana <scenario.toml>`, the
Rust API (`kshana::api::run_toml`), the Python binding (`kshana.run`), the WebAssembly and npm build
(inline `samples` or `clock_log.text`; the file keys are not available there), the MCP server
(`run_scenario`, inline content only) and Kshana Studio's scenario runner. The two scenario files are
bundled (`kshana example holdover-test-example`).
