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
max_reacq_attempts = 3                   # then the channel is RETIRED

[design.bit_sync]
min_votes = 12
ratio = 3.0

[design.acquisition]                     # the hand-off (and re-acquisition) search
coherent_periods = "auto"                # "auto" = ceil(4 ms / full code period), or an integer
noncoherent = 1
doppler_max_hz = 5000.0
doppler_step_hz = "auto"                 # "auto" = 2 / (3 · N · T_code), or Hz
pfa = 1e-3
```

### Rules
* **Validation** happens at load time and errors name the design and key. That covers ranges
  (orders, bandwidths > 0, spacing in (0, 2], thresholds), the kind-dependent keys (`pll_*` with
  `kind = "fll"` is an error), and `coherent_periods` dividing the bit length (checked per signal
  at run time).
* **Design hash**: SHA-256 of the canonical JSON of the fully resolved design. Keys are sorted,
  `name` and `description` are excluded, and `schema` is included. It goes into every track,
  sweep and campaign output, so two runs prove they used the same loops.
* **Precedence on the CLI**: an explicit flag (`--pll-bw`, ...) overrides the selected design.
  The hash is taken after overrides, and the output records which keys were overridden.
* **Front end is not part of a loop design.** The campaign runner treats front-end chains as a
  separate axis (B4.1).

### Surfaces
* Rust: `kshana::iq::track::design::{DesignFile, Design}` with
  `DesignFile::parse(&str) -> Result<DesignFile, String>`,
  `Design::{loop_config(), acq_config(code_period_s), lock_config(), hash(), name()}` and
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
  (`reacq-failed`) and the search is tried again. After `max_reacq_attempts` failures
  in a row the channel is `RETIRED` and stops. The count resets when a channel locks.

With `reacquire` off (the built-in default) the state machine only observes. The loops run
bit for bit as without it (tested), and a `LOST` channel returns to `LOCKED`
(`relocked`) when its locks hold for `loss_dwell_s` and no false lock is suspected.

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
`relocked`, `loss-of-lock`, `pull-in-timeout`, `false-lock`, `reacq-start`,
`reacquired`, `reacq-failed` or `retired`. Where it applies, an event also carries
`doppler_hz`, `code_phase_chips`, `statistic` and `threshold`.
