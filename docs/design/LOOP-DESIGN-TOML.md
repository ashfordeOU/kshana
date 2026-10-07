# Loop-design TOML (`kshana.loop-design/1`) and the tracking epoch record — PROPOSAL

Status: **proposal for review** (0.34.0 "Lab replay", items B3.1/B3.2/B3.3/B6.1). Nothing here is
implemented yet. Once agreed, this file becomes the normative reference, and the campaign runner
(B5.1) consumes the same parser.

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
loss_dwell_s = 0.2                       # continuous time with both locks lost -> LOST
false_lock_check = true                  # FLL/PLL ±k/(2T) ambiguity test (§3)
false_lock_margin_db = 3.0               # alias-bin power must not exceed the prompt by this
reacquire = true                         # re-acquire a LOST channel around its last Doppler
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
* Python: `iq_track(..., design=<path or TOML text>, design_name=None)`, and
  `iq_loop_designs(toml_text) -> list[dict]` (resolved designs with their hashes).
* MCP: `iq_track`/`iq_sweep` gain `design` (a path in the work directory) and `design_name`.

## 2. Tracking epoch record (`kshana.track-epoch/1`) — streamed, B3.2 + B6.1

One record per loop update per channel, written as it happens, so memory is O(channels) and
independent of the recording length. The formats are CSV (header row), JSON Lines and a binary
form: a little-endian fixed record after a JSON header line that holds the schema, field list,
design hash, recording SHA-256 (optional) and engine version. All three carry the same fields:

| field | unit | note |
|---|---|---|
| `channel` | — | channel index |
| `code` | — | e.g. `GPS L1 C/A PRN 17` (header-only in binary) |
| `design` | — | design name (header-only in binary) |
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

`PULL_IN` → `LOCKED` once both locks have held for `cn0_windows` updates.
`LOCKED` → `LOST` after both locks are lost for `loss_dwell_s`.
`PULL_IN` → `LOST` after `pull_in_max_s` without lock.
`LOST` → `REACQ`: an acquisition over the next samples, ±`reacq_doppler_window_hz` around the
last Doppler, all code phases.
`REACQ` → `PULL_IN` on detection (the channel restarts from the new hand-off), or → `LOST`
again; after `max_reacq_attempts` the channel goes to `RETIRED`.

**False-lock check** (when `false_lock_check`), run while LOCKED once per `cn0_windows` updates:
correlate the last window's prompt-period samples at Doppler ±1/(2T) (the FLL/PLL ambiguity,
±500 Hz for T = 1 ms) and compare the power with the prompt. If an alias bin exceeds the
prompt by `false_lock_margin_db`, the result is a `FALSE_LOCK` event, and the channel goes to
`REACQ` centred on the stronger alias.
