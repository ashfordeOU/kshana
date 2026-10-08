# Loop-design TOML (`kshana.loop-design/1`) and the tracking epoch record

Status: **normative reference**, implemented for 0.34.0 "Lab replay" (items B3.1, B3.2, B3.3
and B6.1). The parser is `kshana::iq::track::design`, the epoch record and its writers and
readers are in `iq::track::sink`, and the lock state machine and the streaming session are
in `iq::track::lock`. The campaign runner (B5.1) consumes the same parser.

## 1. Loop-design file

One TOML file holds one or more named tracking-loop designs. Every field is optional, and an
omitted field takes the documented default, which equals `iq::track::LoopConfig::default()`
plus today's acquisition hand-off. Unknown keys are an error, so a misspelt key never silently
reverts to a default.

```toml
schema = "kshana.loop-design/1"          # required; the major version gates parsing

[[design]]
name = "baseline"                        # required, unique in the file; the label in every output
# extends = "other-design"               # optional: start from another design in this file
#                                        #   (not a cycle; "default" = the built-in default)
# description = "free text"              # optional, carried into outputs, not hashed

[design.integration]
coherent_periods = 1                     # code periods per loop update once bit-synchronised
                                         #   (must divide the bit length on a data signal)
spacing_chips = 0.5                      # early-late spacing d (E and L sit d/2 either side)

[design.carrier]
kind = "fll-assisted-pll"                # "pll" | "fll" | "fll-assisted-pll"
pll_order = 2                            # 1..3   (pll, fll-assisted-pll)
pll_bw_hz = 15.0                         # noise bandwidth
fll_order = 1                            # 1..2   (fll, fll-assisted-pll)
fll_bw_hz = 10.0
pll_discriminator = "costas-atan"        # "atan2" | "costas-atan" | "costas-decision-directed"
fll_discriminator = "atan2"              # "cross-product" | "atan2" | "atan2-pilot"
fll_assist = "pull-in"                   # "pull-in" | "always"   (fll-assisted-pll only)
fll_off_pli = 0.8                        # pull-in: FLL hands over once the smoothed PLI
fll_on_pli = 0.6                         #   held >= off for the dwell; back once < on
fll_gate_dwell_s = 0.1                   #   for the dwell (on < off: hysteresis)
bn_t_max = 0.1                           # Bn·T limit when T > 4 ms (0 = off); omitted from the
                                         #   hash at this default (see Rules)

[design.code]
order = 1                                # DLL order 1..2
bw_hz = 2.0
discriminator = "eml-power"              # "eml-power" | "dot-product" | "eml-envelope"
carrier_aiding = true

[design.lock]                            # indicators and the lock state machine (§3)
pli_threshold = 0.8                      # smoothed PLI for phase lock
code_lock_cn0_dbhz = 26.0                # NWPR C/N0 for code lock
cn0_windows = 50                         # M windows per C/N0 estimate (sliding)
cn0_window_periods = 20                  # prompts per window, data-free signal
pull_in_max_s = 2.0                      # time allowed in PULL_IN before it counts as a failure
loss_dwell_s = 0.2                       # dwell: either lock lost this long -> LOST;
                                         #   both held this long -> LOCKED
false_lock_check = true                  # FLL/PLL ±k/(2T) ambiguity test (§3)
false_lock_margin_db = 3.0               # alias-bin power must not exceed the prompt by this
reacquire = false                        # re-acquire a LOST channel around its last Doppler
                                         #   (off by default: the state machine only observes)
reacq_doppler_window_hz = 500.0          # ± window of the re-acquisition search
reacq_window_s = 30.0                    # a lost channel not locked again by then is RETIRED
reacq_interval_s = 0.1                   # wait after a failed search (evenly spaced)
reacq_max_interval_s = 0.1               # optional back-off: above reacq_interval_s, the
                                         #   wait doubles after each failure up to this
max_reacq_attempts = 0                   # optional cap on failed searches per loss (0 = none)

[design.bit_sync]
min_votes = 12
ratio = 3.0

[design.acquisition]                     # the hand-off (and re-acquisition) search
coherent_periods = "auto"                # "auto" = ceil(4 ms / full code period), or an integer
noncoherent = 1
doppler_max_hz = 5000.0
doppler_step_hz = "auto"                 # "auto" = min(2 / (3 · N · T_code), 0.2 / T_track), or Hz
pfa = 1e-3
```

### Rules
* **Validation** happens at load time and errors name the design and key. That covers ranges
  (orders, bandwidths > 0, spacing in (0, 2], thresholds), the kind-dependent keys (`pll_*` with
  `kind = "fll"` is an error), and `coherent_periods` dividing the bit length (checked per signal
  at run time).
* **Design hash**: SHA-256 (lower-case hex) of the canonical JSON of the fully resolved
  design. `name` and `description` are excluded, and `schema` is included. It goes into every
  track, sweep and campaign output, so two runs prove they used the same loops. The canonical
  form has no whitespace, sorts object keys by their UTF-8 bytes at every level, keeps arrays
  in order, writes `"auto"` for an automatic value, unused kind-dependent keys as `null`,
  integers in decimal and floats in the shortest form that round-trips, always with a `.` or
  an exponent (`15.0`, `0.001`). So it does not depend on field order in the file or in the
  code. The built-in default hashes to
  `33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80`, which is pinned by a test.
* **`doppler_step_hz = "auto"`** is `min(2 / (3 · N · T_code), 0.2 / T_track)`, where `N` is
  the acquisition's coherent periods, `T_code` the full code period and `T_track` the loop
  update time (`integration.coherent_periods × T_code`), in `kshana::iq::acq::default_step_hz`.
  The second term keeps the hand-off residual inside the default two-quadrant FLL's pull-in of
  `1 / (4 T_track)`: the step is at most 0.8 of it, so even when the neighbouring bin wins
  (a short coherent time makes the main lobe wider than a bin, so noise can pick the
  neighbour, leaving up to a whole step) the loop still pulls in. With the textbook step alone,
  every code of 4 ms or longer (`N = 1`) left `1 / (3 T_code)`, so Galileo E1-B/E1-C
  false-locked 125 Hz away. The cap binds for those codes (E1-B: 50 Hz instead of 166.7 Hz,
  201 bins over ±5 kHz instead of 61) and not for the 1 ms codes (`N = 4`: 166.7 Hz, below the
  200 Hz cap). An explicit `doppler_step_hz` is used as written. `"auto"` is hashed as the
  literal, so the default hash is unchanged; the resolved step is a function of the design, the
  signal and the engine version, and each run records it (next rule).
* **Primary-only acquisition.** A caller that acquires with a primary-only replica at one
  coherent period (the matrix harness did, for the tiered signals) searches a main lobe
  `1 / (N · T_code)` wide with bins of at most `0.2 / T_track`, so noise can make the
  neighbouring bin win and the acquired Doppler can sit one bin off the truth. That is a
  property of the search, not a defect: the neighbour's residual is one step, at most 0.8 of
  the FLL's pull-in, so tracking still locks on the true Doppler. A caller that needs the
  nearest bin should integrate longer (`coherent_periods`) or refine the Doppler after the
  search.
* **`carrier.bn_t_max`** (default `0.1`) limits the PLL and FLL noise bandwidths to
  `bn_t_max / T` when the loop update time `T` is longer than 4 ms, so `Bn · T ≤ 0.1`
  (`Design::loop_config_for(code_period_s)`). A 15 Hz PLL and 10 Hz FLL at the 20 ms of GPS L2C
  CM have `Bn · T` of 0.3 and 0.2, which does not hold lock; the clamp gives 5 Hz and 5 Hz.
  The 1 ms and 4 ms codes keep 15 / 10 Hz, BeiDou B1C (10 ms) gets 10 / 10 Hz. The clamp
  applies to explicit bandwidths too; `bn_t_max = 0` turns it off. The key is omitted from the
  canonical JSON at its default, so a design that does not set it keeps its hash (the default
  stays `33261cd1…8e80`); any other value, 0 included, is part of the hash. `loop_config()` is
  the design as written, unclamped.
  The clamp has a reporting side effect: the NWPR C/N0 reads low by about 8 dB × Bn·T under the
  loop's own PLL jitter (−0.24/−0.44/−0.77/−1.58 dB at 1/2.5/5/10 Hz and T = 20 ms), so at
  `Bn·T = 0.1` it reads about 1 dB low; M2M4 is insensitive to it
  (`docs/design/iq-notes/receiver.md`, C/N0 estimator limits).
* **Resolved values are recorded.** The epoch header (`resolved`, one entry per channel, absent
  in older files) and the `--summary` channel entries (`resolved`) carry what the design resolved
  to for that signal: `acq_coherent_periods`, `acq_doppler_step_hz`, `t_track_s`, `pll_bn_hz`
  and `fll_bn_hz` (null when the carrier loop has no such loop).
* **Precedence on the CLI**: an explicit flag (`--pll-bw`, ...) overrides the selected design.
  The hash is taken after overrides, and the output records which keys were overridden.
* **Known limits of the default design.**
  * *FLL→PLL hand-over floor.* The default (`fll_assist = "pull-in"`) does not hand over from
    the FLL to the PLL below about 35 dB-Hz: at 35 dB-Hz the hand-over comes 1.9–2.6 s into
    the track, and at 33 dB-Hz the FLL keeps the phase lock indicator below `fll_off_pli`, so
    pull-in never completes. Treat about 35 dB-Hz as the pull-in floor. Evidence:
    `docs/design/evidence/carrier-lock/`.
  * *Commensurate sampling.* At a sample rate that is a multiple of half the chip rate the
    code discriminator is a staircase, and at exactly 0 Hz code Doppler and 4 samples/chip the
    code never crosses the ±0.21-chip dead zone, so a code-phase bias of up to about 0.2 chip
    can persist without showing in the jitter (measured: d = 0.5 gives 2.0× the control's code
    error with a +0.011 chip mean; d = 0.25 gives +0.125 chip). The `commensurate_sampling`
    warning covers the rate. Evidence: `docs/design/evidence/dll-jitter/`.
* **Front end is not part of a loop design.** The campaign runner treats front-end chains as a
  separate axis (B4.1).

### Surfaces
* Rust: `kshana::iq::track::design::{DesignFile, Design}` with
  `DesignFile::parse(&str) -> Result<DesignFile, String>`,
  `Design::{loop_config(), loop_config_for(code_period_s), acq_config(code_period_s), resolved_run(code_period_s), lock_config(), hash(), name()}` and
  `DesignFile::designs()`. The campaign runner uses exactly this.
* CLI: `kshana iq track <rec> --design <file.toml> [--design-name <n>]`, with the first design
  as the default. `kshana iq sweep <rec> --design <file.toml>` runs every design in the file,
  and the old bandwidth-product flags remain.
* Python: `iq_track(..., design=<path or TOML text>, design_name=None, reacquire=None)`
  (the keyword arguments override the design), `iq_loop_designs(toml_text_or_path) ->
  list[dict]` (resolved designs with their hashes), and `iq_read_epochs(path)` (the binary
  epoch reader).
* MCP: `iq_track` gains `design` (a path in the work directory), `design_name`,
  `reacquire`, `epochs_out` and `events_out`. Its reply is built from the bounded-memory
  `--summary`.
* `kshana iq track --summary <path>` writes `kshana.track-summary/1`: the resolved
  design(s) with their hashes, the flags that overrode them, and per channel the epochs,
  the final Doppler, code phase and C/N0, the mean C/N0, the phase-lock, code-lock and
  locked fractions, `locked_at_end`, `final_state`, the transition, false-lock and
  re-acquisition counts, and the phase and code jitter over the second half of the run.

## 2. Tracking epoch record (`kshana.track-epoch/1`) — streamed, B3.2 + B6.1

One record per loop update per channel, written as it happens, so memory is O(channels) and
independent of the recording length. All three formats carry the same fields:
* **CSV**: a header row of the field names.
* **JSON Lines**: a first line `{"header": <header>}`, then one object per record.
* **Binary**: the header as one JSON line, then fixed 184-byte little-endian records. The
  header holds `schema`, `fields`, `record_bytes`, `channels` (each with `code`, `design`
  and `design_hash`), `sample_rate_hz`, `engine_version` and an optional
  `recording_sha256`. The record layout is: `channel` u32, `state` u8 (0 PULL_IN … 4
  RETIRED), a flags u8 (bit 0 phase_lock, 1 code_lock, 2 NWPR present, 3 Beaulieu
  present, 4 bit_edge present, 5 bit present), `bit` i8, one reserved byte, `epoch` u64,
  `sample_index` u64, `periods` u32, `bit_edge` u32, then 19 f64 (`code_epoch_s`,
  `t_coh_s`, E/P/L I+Q, the three discriminators, `doppler_hz`, `carrier_phase_cycles`,
  `code_rate_hz`, `code_phase_chips`, `pli`, the two C/N0 estimates, one reserved).
  `iq::track::sink::BinaryEpochReader` (Rust) and `kshana.iq_read_epochs` (Python) read
  it back.

The fields:

| field | unit | note |
|---|---|---|
| `channel` | — | channel index |
| (`code`, `design`, `design_hash`) | — | per channel, in the header (JSONL, binary) or `--summary` (CSV) |
| `epoch` | — | loop update index |
| `sample_index` | samples | first sample after the integration |
| `code_epoch_s` | s | receive time of the code epoch |
| `t_coh_s`, `periods` | s, — | integration time, code periods |
| `e_i, e_q, p_i, p_q, l_i, l_q` | — | early/prompt/late correlators |
| `pll_disc_rad, fll_disc_hz, dll_disc_chips` | | discriminator outputs |
| `doppler_hz` | Hz | carrier NCO after the update (FLL/PLL state) |
| `carrier_phase_cycles` | cycles | accumulated carrier NCO phase |
| `code_rate_hz` | chips/s | code NCO (DLL state) |
| `code_phase_chips` | chips | replica phase at `sample_index` |
| `pli` | — | smoothed phase lock indicator |
| `phase_lock, code_lock` | bool | indicators |
| `cn0_nwpr_dbhz, cn0_beaulieu_dbhz` | dB-Hz | empty until the window fills |
| `bit_edge, bit` | — | empty until sync / when no bit completed |
| `state` | — | `PULL_IN` / `LOCKED` / `LOST` / `REACQ` / `RETIRED` (§3) |

Lock-state **events** (transitions, false-lock detections, re-acquisition results) go to a
separate small event stream (`<out>.events.jsonl`) with `channel`, `epoch`, `code_epoch_s`, `from`,
`to`, `reason` and, for re-acquisition, `doppler_hz`/`code_phase_chips`/`statistic`/`threshold`.

Online accumulators (lock fractions, mean C/N0, jitter over a trailing window) feed the summary
without holding epochs, so `iq track`/`iq sweep`/MCP summaries keep working in bounded memory.

## 3. Lock state machine (B3.3)

Transitions:
* `PULL_IN` → `LOCKED` once phase and code lock have both held for `loss_dwell_s`.
  (The NWPR code lock needs `cn0_windows` windows first, about 1 s with the defaults.)
* `LOCKED` → `LOST` once phase *or* code lock has been lost for `loss_dwell_s`.
* `PULL_IN` → `LOST` after `pull_in_max_s` without lock.
* `LOST` → `REACQ`, when `reacquire` is set: an acquisition over the next samples (the
  design's acquisition, with the Doppler window ±`reacq_doppler_window_hz` around the
  last Doppler, or the alias a false-lock check found), all code phases. The previous
  loops keep running meanwhile.
* `REACQ` → `PULL_IN` on detection: the channel restarts from the new hand-off at the
  next chunk boundary, and its epoch numbering continues. Otherwise `REACQ` → `LOST`
  (`reacq-failed`), and the next search starts `reacq_interval_s` (0.1 s) later. The
  searches are evenly spaced by default, so the retry schedule adds at most 0.1 s to a
  measured re-acquisition time. Setting `reacq_max_interval_s` above `reacq_interval_s`
  turns on a back-off, where the wait doubles after each failure up to that value.
* The budget is **time**. A channel that has not locked again within `reacq_window_s` of
  being lost (counted from the first loss, through any re-acquisitions that did not reach
  `LOCKED`) is `RETIRED` and stops. `max_reacq_attempts > 0` additionally caps the failed
  searches per loss. Both reset when the channel locks. (Until this revision the budget
  was 3 back-to-back searches, which retired every channel within about 0.2 s of any
  outage.)

**FLL assistance** (`fll_assist`, FLL-assisted PLL only). With `"pull-in"` (the default)
the FLL path feeds the loop until the smoothed PLI has held at or above `fll_off_pli` for
`fll_gate_dwell_s`. From then on the PLL tracks alone, and the FLL comes back once the PLI
has held below `fll_on_pli` for the dwell. With `"always"` the FLL path feeds every update.
Left on, a 10 Hz FLL path injects enough frequency noise to break phase lock below about
38 dB-Hz. The evidence is in `docs/design/evidence/carrier-lock/`. The epoch output's
`fll_active` (Rust `EpochOutput`) says which applied.

With `reacquire` off (the built-in default) the state machine only observes. The loops run
bit for bit as without it (tested), and a `LOST` channel returns to `LOCKED`
(`recovered`) when its locks hold for `loss_dwell_s` and no false lock is suspected.

**False-lock check** (when `false_lock_check`). It runs every `cn0_windows` updates on every
tracking channel (pull-in, locked or lost), because a false lock rarely shows lock
indicators:
* The next samples are searched at the tracked Doppler and at ±1/(2T), where T is the
  loop's integration time (±500 Hz for T = 1 ms). The search uses a coherent block of at
  least 2T and bins at 0, ±1/(4T) and ±1/(2T).
* If an alias bin's peak exceeds the tracked bin's by `false_lock_margin_db`, the result
  is a `false-lock` event (with the alias Doppler and the ratio in dB). A pull-in or
  locked channel goes to `LOST`, its re-acquisition is centred on the alias, and the
  channel is marked suspect until a clean check.

Events (`<out>.events.jsonl`, `LockEvent`) carry `channel`, `epoch`, `sample_index`,
`code_epoch_s`, `from`, `to` and `reason`, where `reason` is one of `locked`,
`recovered`, `loss-of-lock`, `pull-in-timeout`, `false-lock`, `reacq-start`,
`reacquired`, `reacq-failed` or `retired`. Where it applies, an event also carries
`doppler_hz`, `code_phase_chips`, `statistic` and `threshold`.
