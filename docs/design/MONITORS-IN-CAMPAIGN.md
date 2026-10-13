# Monitors in the lab-replay campaign (PRO-31)

Status: design and pre-registered bars, 2026-10-13. Committed on its own before any code for it
exists and before any bar below is evaluated. Open core (`src/iq/monitor`, `src/iq/campaign`).

## 1. What this adds

The IQ monitors (`iq::monitor`) and the campaign runner (`iq::campaign`) exist, but they do not
meet. The runner never calls a monitor, and no metric scores a detection. This item:

1. runs the configured monitors on every cell of a campaign, in the runner's single pass over
   each recording:
   - the pre-correlation power and spectral monitors on the samples after the front-end
     chain, once per (recording, chain);
   - the post-correlation C/N0, SQM and lock monitors on each tracked channel's loop updates;
2. scores each monitor's alarms against the stated events of the test-condition file:
   - per stated event: detected or missed, and the time to detect (first alarm at or after
     the onset);
   - per monitor: false alarms outside the stated events, their count over the exposure time,
     and the rate per hour;
3. states the closed-form false-alarm probability of each monitor's single test at its
   configured threshold:
   - **power**: the block-power test, `P_fa = Q(N, N·10^{t/10}) + P(N, N·10^{−t/10})`
     (exact for circular Gaussian noise);
   - **spectral excess**: the Welch max-excess test, `1 − (1 − Q(K_eff, K_eff·10^{t/10}))^B`
     (an approximation, measured at 1.3 times the formula in `tests/iq_monitor.rs`);
   - **SQM**: per averaged update, the two-sided Gaussian tail
     `P(|z| > k) = 2Q(k) = Q(½, k²/2)` (new);
   - **C/N0**: the CUSUM's mean time to a false alarm, Siegmund's `ARL0(k, h)` in detector
     samples (existing).

Nothing synthesises an interference waveform (`GNSS-IQ-PLAN.md`, out of scope). In this
repository the positive events of a synthetic campaign are signal-side only, imposed on Kshana's
own scenes through the channel hook: an attenuation of the satellite's own signal (a C/N0 step),
or an outage. Recorded lab IQ is the path for interference.

## 2. Configuration and additivity

The campaign file gains an optional `[monitors]` table: `power`, `spectral` and `epoch` as in a
`kshana iq monitor` settings file, plus `detect_grace_s` (default 1 s), the time after an
event's end in which an alarm still counts as its detection.

* **Absent table.** Nothing changes: cells, keys, digests and reports stay byte-identical. The
  campaign tests' pins prove it.
* **Present table.** It enters the run hash, so the cell keys move, and each cell gains a
  `monitors` block:
  - the alarms;
  - the closed-form `P_fa` of each monitor's test;
  - per stated event and alarm kind, detected and time to detect;
  - per alarm kind, false alarms, exposure and rate.

## 3. Pre-registered bars (synthetic, 2026-10-13)

The campaigns are Kshana scenes carrying GPS L1 C/A signals only, 2.5 MHz complex, with a raw
front end and the default loop design. They are stated in `tests/iq_campaign_monitors.rs`
before any bar is run. A miss is recorded as NOT MET, never loosened.

| # | quantity | bar |
|---|---|---|
| M1 | Power test, noise-and-signals only, no events: the fraction of blocks after the baseline whose power departs from the baseline by more than `t`. `t` is set so the closed form gives `P_fa = 0.01`, with 10 ms blocks over 60 s (5900 blocks). | The count lies inside the two-sided 99 % binomial interval of the closed form. |
| M2 | SQM, same campaign: the fraction of averaged updates (delta and ratio tests) with `|z| > k`, `k = 2.5758` (`2Q(k) = 0.01`). The running average is correlated and its baseline spread is estimated, so the bar is a factor. | Each test's fraction within a factor of 2 of 0.01. |
| M3 | C/N0 monitor, 6 recordings × 3 satellites. Each recording states one event of kind `other`, during which every satellite is attenuated by 6 dB for 6 s (a step of its own signal power). Default CUSUM (tuned to 3 dB, `h = 5`). | Every satellite-event detected (`P_md = 0` over 18). The median time to detect is no more than 2 × `ARL1(k, h, 6 dB/σ0)` detector samples × the stride time. |
| M4 | The same campaign, outside the events (after each channel's baseline). | `cn0_drop` and `cn0_rise` false alarms together no more than the Poisson 99 % upper bound of `exposure / ARL0` (detector samples converted to time). |

All four are MODELLED internal consistency: the monitors against their own closed forms on
Kshana's own noise and signals. No real receiver is checked.
