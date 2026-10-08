# Lab replay: test conditions, campaign runner and scoring

Status: **implemented** (0.34.0 "Lab replay", items B5.1, B5.2, B8.1, B8.2, B8.3 and the analytic reference curve). This file is
the normative reference for `kshana::iq::campaign`, `kshana iq campaign`, `kshana iq conditions`, the
Python functions `iq_test_conditions` / `iq_campaign` / `iq_campaign_report` and the MCP tools
`iq_campaign` / `iq_campaign_status`. §6 lists where the implementation refines the original
proposal.

Scope line (binding): everything here reads recordings and scores them. The test-condition file
*describes* interference that a lab applied; Kshana never synthesises, transmits or models a
waveform from it. The only use of the stated J/S is (a) to align measured results with the lab's
stated conditions and (b) to draw an analytic C/N0-vs-J/S reference curve that is labelled
**MODELLED** everywhere it appears.

## 1. Test-condition file (`kshana.test-conditions/1`)

One file per recording, in TOML or JSON. Both forms have the same structure and parse to the same
value. Unknown keys are an error. Times are seconds from the first sample of the recording.

```toml
schema = "kshana.test-conditions/1"

[recording]
id = "run-017"                      # required, unique within a campaign; the label in every output
path = "run017.sigmf-meta"          # required; relative to this file. Anything `open_recording` opens
sha256 = "9f2c..."                  # optional; if given, the campaign refuses a mismatching file
# Raw recordings without a SigMF/JSON sidecar give the sample description here
# (same keys as the raw sidecar):
# format = "ci16_le"  sample_rate_hz = 5e6  center_hz = 1575.42e6  if_hz = 0.0  header_bytes = 0
start_utc = "2026-09-30T10:00:00Z"  # optional, carried into outputs only
settle_s = 5.0                      # optional (default 5): ignore this initial pull-in in baselines

[receiver]                          # free text, carried into outputs, not used in scoring
dut = "receiver under test, firmware x.y"
front_end = "active patch, 26 dB LNA, 2-bit ADC"
notes = ""

[[expected]]                        # the satellites the lab expects in the recording
signal = "gps-l1ca"                 # any name `kshana iq` accepts
ids = [3, 7, 11, 19]                # PRNs (or GLONASS channels)
nominal_cn0_dbhz = 45.0             # optional, stated by the lab; otherwise measured pre-event
# Optional hand-off hints (both lists, one value per id). Without them the runner
# acquires with each design's acquisition settings.
# doppler_hz = [1200.0, -800.0, 2300.0, 150.0]
# code_phase_chips = [...]
# periods_per_bit = 20             # optional: data bit length in code periods (omitted = data-free)
truth = "run017.truth.csv"          # optional: a Kshana truth sidecar (synthetic scenes only);
                                    # enables the Doppler-truth false-lock check

[[event]]                           # zero or more; must not overlap per affected satellite
id = "jam-1"                        # required, unique in the file
kind = "interference"               # "interference" | "spoofing" | "outage" | "other"
type = "cw"                         # label as stated by the lab:
                                    # "cw" | "narrowband" | "broadband" | "swept" | "pulsed" |
                                    # "chirp" | "matched" | "meaconing" | "spoofer" | "unknown"
onset_s = 60.0
offset_s = 180.0
affects = "all"                     # "all" or a list of ids
# Optional stated spectrum, carried into outputs (and used for the reference curve only via Q):
# center_offset_hz = 0.0  bandwidth_hz = 2.0e6
# q = 1.0                           # optional override of the spectral-separation factor Q

[event.power]                       # the lab's stated power profile. Metadata only.
quantity = "js_db"                  # "js_db" (J/S at the antenna) or "jammer_dbm"
interpolation = "linear"            # "linear" | "step"
points = [[60.0, 20.0], [180.0, 50.0]]  # [t_s, value]; constant = one point
# reference_signal_dbm = -128.5     # needed for quantity = "jammer_dbm": J/S = jammer - signal
```

**Rules.** Validation at load time names the file, event and key. `offset_s > onset_s`; points
are time-ordered and finite, and the profile is held flat before the first point and after the last
(a point outside `[onset_s, offset_s]` is allowed; it only shapes the profile);
`affects` ids must be in `[[expected]]`. Spoofing/outage events get every metric except the
C/N0-vs-J/S comparison (no J/S → no reference curve). **Condition hash** = SHA-256 of the
canonical JSON of the resolved file, with sorted keys and `[receiver]` text excluded.

**Import.** `kshana iq conditions <file>` validates a file and prints the resolved form. With
`events_from_sigmf = true` in `[recording]`, a SigMF recording's annotations become events when the
file is loaded. Each annotation that carries a `kshana:test_event` object becomes one event:

* onset and offset come from `core:sample_start`, `core:sample_count` and `core:sample_rate`;
* the id comes from the object's `id`, else `core:label`;
* the bandwidth and centre offset come from `core:freq_lower_edge` and `core:freq_upper_edge`,
  relative to the capture's `core:frequency`;
* the object holds the remaining event fields under their names here (`kind`, `type`, `affects`,
  `q`, `power`).

The resolved conditions carry the imported events, so the condition hash covers them. Importers
for the lab's own simulator logs wait for their sample files (R9).

## 2. Campaign file (`kshana.campaign/1`)

```toml
schema = "kshana.campaign/1"
name = "overnight-01"
data_class = "client-confidential"   # required: "synthetic" | "client-confidential"

[inputs]
conditions = ["lab/conds/*.toml"]   # globs of test-condition files; each names its recording
designs = "designs.toml"            # a `kshana.loop-design/1` file (LOOP-DESIGN-TOML.md);
                                    # omitted = the built-in default design
design_names = []                   # optional subset; empty = every design in the file

[[frontend]]                        # front-end chains; one axis of the product
name = "raw"                        # an empty chain

[[frontend]]
name = "notch+2bit"
notch = true                        # the same keys as `iq frontend` / FrontendParams
bits = 2

[run]
max_seconds = 0                     # 0 = whole recording
workers = 0                         # 0 = all cores; outputs never depend on it
epochs = "none"                     # "none" | "csv" | "jsonl" | "binary": keep each cell's
                                    # kshana.track-epoch/1 stream in epochs/<key>.<ext>, its lock
                                    # events in epochs/<key>.events.jsonl. Size: binary is 184 B
                                    # per record, i.e. about 0.66 GB per channel-hour at 1 ms
                                    # updates; CSV and JSONL are about 3x that.

[scoring]
baseline_window_s = 10.0            # pre-event window for baseline C/N0 and jitter
js_bin_db = 1.0                     # J/S bin width for the degradation curve
# false_lock_doppler_hz = 250.0     # truth check threshold; omitted = 1/(4 T_coh)
false_lock_min_epochs = 50          # consecutive off-truth locked updates per episode
reacq_grace_s = 30.0                # how long after offset re-acquisition is looked for
reference_curve = true              # draw the MODELLED SSC reference curve
cn0_estimator = "m2m4"              # "m2m4" (default) | "nwpr": the C/N0 behind the reported C/N0
                                    # and the degradation curve. Both are always scored and
                                    # reported. Part of the scoring hash.

[scoring.bars]                      # optional pass/fail bars; omitted -> no verdict
min_time_to_loss_s = 30.0           # lock must hold this long after onset (holding passes)
max_reacq_s = 5.0                   # relock within this time of offset
min_availability = 0.95             # whole run
# min_event_availability, max_false_lock_per_hour, max_pll_jitter_deg, max_dll_jitter_chips
```

**Cells.** A cell is one (recording, front-end chain, design). Each cell's key is the SHA-256 of the
compact, sorted-key JSON of `{conditions_hash, data_class, design, design_hash, engine_version,
frontend, frontend_hash, recording_id, recording_sha256, run_hash,
schema: "kshana.campaign-cell/1", scoring_hash}`. Changing the design, the conditions or the
scoring settings therefore re-runs the affected cells (`tests/iq_campaign.rs`,
`changing_the_design_the_conditions_or_the_scoring_reruns_the_affected_cells`). The condition hash
covers the resolved file as written, including its `recording.path` and `truth` strings, so a file
that is moved or re-pointed re-runs its cells. For execution, the runner groups pending cells that share
(recording, chain). Each group reads the recording once, runs the chain once, and replays all
of its designs through one bank, exactly as `iq sweep` does today. When there are fewer groups
than workers, a group's designs are split into chunks, so the work still fills all cores.
Channels in a bank are independent, so this grouping never changes any result.

**Paths.** `campaign.json` and `hashes.json` hold the conditions and recording paths as resolved on
the machine that ran the campaign (absolute when the campaign was started from an absolute path).
Do not ship them to someone who should not see that folder layout; `cells/` and `DIGEST` hold no
recording or conditions paths (epoch files are named relative to the output folder).

**Resume.** On completion, a cell writes `cells/<key>.json` atomically (a temp file, then a
rename), and a line is appended to `runs.jsonl` (key, wall time, worker; the only
non-deterministic file). On restart, the runner skips any cell whose file exists, parses, and
carries its own key. A crash can lose only cells that were still in flight. `--no-resume`
recomputes everything. Recording SHA-256s are cached in `hashes.json`, keyed by
(path, size, mtime). A cache hit avoids re-reading a multi-GB file, and the cell always stores
the hash it used.

**Determinism.** Cells contain no timestamps, host names or worker ids. Floats are written with
the shortest round-trip form. The order is fixed (recording id, chain order, design order). The
same inputs give byte-identical cell files and the same digest for any worker count, and when a
run is interrupted and resumed.

## 3. Results

Output directory:

```
out/
  campaign.json        resolved campaign (all inputs, hashes, engine version)
  cells/<key>.json     one per cell (schema kshana.campaign-cell/1)
  epochs/<key>.<ext>   only when run.epochs != "none" (kshana.track-epoch/1), with
  epochs/<key>.events.jsonl  the lock events; both named, hashed and sized in the cell
  runs.jsonl           execution log (wall times; excluded from the digest)
  scorecard.csv        one row per (cell, satellite, event) plus one "whole-run" row per (cell, satellite)
  scorecard.json       the same rows plus the per-J/S-bin curves
  report.html          self-contained (inline CSS/SVG, no network)
  DIGEST               SHA-256 over the sorted (key, sha256(cell file)) list  (B8.3)
```

`kshana.campaign-cell/1` (a real cell from `tests/iq_campaign.rs`, one satellite shown, numbers
rounded and hashes shortened):

```json
{
  "cn0_estimator": "m2m4",
  "data_class": "synthetic",
  "design": {
    "hash": "db9708c2…",
    "name": "pll-only"
  },
  "engine_version": "0.32.0",
  "frontend": {
    "hash": "e015d238…",
    "name": "raw"
  },
  "key": "fd6fdee7…",
  "lock_source": "track-session",
  "recording": {
    "conditions_hash": "9b094d27…",
    "id": "ramp",
    "sha256": "0014e8ac…"
  },
  "run_hash": "c2f008aa…",
  "sample_rate_hz": 2500000.0,
  "samples_processed": 25000000,
  "satellites": [
    {
      "events": [
        {
          "availability": 1.0,
          "baseline_cn0_dbhz": 44.83,
          "baseline_cn0_m2m4_dbhz": 44.83,
          "baseline_cn0_nwpr_dbhz": 44.68,
          "baseline_dll_jitter_chips": 0.06376,
          "baseline_pll_jitter_deg": 7.628,
          "baseline_source": "measured",
          "cn0_curve": [
            {
              "js_db": 20.0,
              "measured_cn0_dbhz": 38.53,
              "measured_cn0_m2m4_dbhz": 38.53,
              "measured_cn0_nwpr_dbhz": 38.68,
              "measured_degradation_db": 6.3,
              "modelled_cn0_dbhz": 38.84,
              "modelled_degradation_db": 5.987,
              "n": 3000
            },
            {
              "js_db": 30.0,
              "measured_cn0_dbhz": 29.73,
              "measured_cn0_m2m4_dbhz": 29.73,
              "measured_cn0_nwpr_dbhz": 29.98,
              "measured_degradation_db": 15.1,
              "modelled_cn0_dbhz": 29.95,
              "modelled_degradation_db": 14.87,
              "n": 2760
            }
          ],
          "dll_jitter_chips": 0.1597,
          "event_id": "bb-1",
          "false_lock_episodes": 0,
          "js_at_loss_db": null,
          "kind": "interference",
          "locked_at_onset": true,
          "lost": false,
          "modelled": {
            "chip_rate_hz": 1023000.0,
            "formula": "(C/N0)eff = [1/(C/N0) + (J/S)/(Q*Rc)]^-1",
            "label": "MODELLED",
            "q": 1.0,
            "q_source": "type-table"
          },
          "offset_s": 9.0,
          "onset_s": 3.0,
          "outage_s": null,
          "pll_jitter_deg": 30.4,
          "reacq_time_s": null,
          "reacquired": false,
          "time_to_loss_s": null,
          "type": "broadband"
        }
      ],
      "handoff": {
        "code_phase_chips": 293.8,
        "doppler_hz": 1200.0,
        "source": "hint",
        "statistic": null,
        "threshold": null
      },
      "id": 3,
      "signal": "gps-l1ca",
      "whole_run": {
        "availability": 0.9776,
        "code_lock_frac": 1.0,
        "dll_jitter_chips": 0.06329,
        "false_lock_episodes": 0,
        "false_lock_per_hour": 0.0,
        "locked_s": 8.799,
        "loss_count": 0,
        "median_cn0_dbhz": 44.78,
        "median_cn0_m2m4_dbhz": 44.78,
        "median_cn0_nwpr_dbhz": 44.58,
        "phase_lock_frac": 0.9911,
        "pll_jitter_deg": 7.674,
        "reacq_count": 0,
        "scored_s": 9.0
      }
    }
  ],
  "schema": "kshana.campaign-cell/1",
  "scoring_hash": "81c8c23d…"
}
```

### Metric definitions (per satellite, per design, per chain)

Lock is the tracking session's lock state machine (`LOCKED` against everything else), with its
`LOST`, `false-lock` and re-acquisition events. A design file's `loss_dwell_s` therefore sets what counts as "loss".

| metric | definition |
|---|---|
| availability | time in `LOCKED` / time scored (after `settle_s`); whole run and within each event window |
| time to loss of lock | first `LOCKED → LOST` transition in `[onset, offset + reacq_grace]` minus `onset`; `null` = held lock |
| J/S at loss | stated J/S (from `[event.power]`) at the moment of loss |
| re-acquisition time | first return to `LOCKED` at or after `max(offset, t_loss)` minus `offset`; `null` = not within grace |
| baseline C/N0 | median C/N0 (by `cn0_estimator`) over locked epochs in `[onset − baseline_window_s, onset)` (else the stated `nominal_cn0_dbhz`) |
| C/N0 degradation vs J/S | per `js_bin_db` bin of stated J/S during the event: `n`, median measured C/N0 (by `cn0_estimator`) over locked epochs, degradation = baseline − measured. Both estimators' medians are reported per bin and as baselines |
| MODELLED reference | per bin: `effective_cn0_dbhz(baseline, js, Q(type), Rc)` from `jamming`, with Q from `jamming::q_factor` for the stated type or the event's `q` |
| false-lock rate | episodes per hour of locked time. An episode is a `false-lock` event of the tracking session or, with a truth sidecar, ≥ `false_lock_min_epochs` consecutive locked epochs with \|Doppler − truth\| > threshold |
| PLL / DLL jitter | sample std of `pll_disc_rad` (deg) and `dll_disc_chips` over locked epochs: baseline window and per event |

All metrics are computed online from the epoch stream. Memory is bounded by the baseline window
and the J/S bins, not by the recording length (B6.1).

## 4. Surfaces

* **CLI**
  * `kshana iq conditions <file>` validates a condition file and prints its resolved form.
  * `kshana iq campaign <campaign.toml> [--out DIR] [--workers N] [--no-resume] [--max-cells N] [--dry-run] [--json]`
    runs the campaign. `--dry-run` lists the cells and their keys and states which are already
    done. `--max-cells` runs at most N pending cells, then stops cleanly.
  * `kshana iq campaign report <out-dir>` rebuilds the scorecards, report and DIGEST from `cells/`.
* **Rust**: `kshana::iq::campaign::{TestConditions, CampaignSpec, LoadedCampaign, CellResult, run, plan}`
  and `kshana::iq::campaign::score::SatScorer`, an online per-satellite scorer fed `ScoreEpoch`s,
  usable without the runner. `LoadedCampaign::load_checked` calls a caller's check on every file
  it names before reading it (the MCP tool uses it to hold every path inside the work directory).
* **Python**: `iq_test_conditions(text_or_path) -> dict`,
  `iq_campaign(spec, out_dir, workers=0, resume=True, max_cells=None, dry_run=False) -> dict` (summary + digest),
  and `iq_campaign_report(out_dir) -> dict`. `kshana.pyi` is updated to match.
* **MCP**: `iq_campaign` takes paths in the work directory, with a sample budget per call that
  covers all cells it runs. `max_cells` makes long campaigns incremental: call it repeatedly, and
  each call resumes. `iq_campaign_status` reports done and pending cells and the digest.

## 5. Tests

A synthetic campaign stands in for recordings. Kshana scenes use a C/N0 profile per satellite,
applied as a `SceneChannel` amplitude scaling over time (a signal-power profile, not an
interference waveform). Profile segments ramp C/N0 down, drop it below
tracking threshold (a signal gap) and restore it. The matching test-condition file states the
J/S that maps to each C/N0 under the analytic model, so the measured and MODELLED curves are
expected to agree. The tests cover:

* every metric against injected truth;
* condition and campaign schema round-trips and their error cases;
* resume after a killed run, which must equal an uninterrupted run byte for byte;
* the same DIGEST for 1 worker and N workers;
* a Doppler-truth false-lock case, scored by tracking correctly against a truth sidecar shifted by
  300 Hz, beyond the 1/(4T) = 250 Hz threshold (§6 explains why a hand-off seeded at a ±1/(2T)
  alias is not used);
* a performance check: cells/s and samples/s logged, with a loose budget, and the GB-scale case
  `#[ignore]`d.

## 6. As built: refinements of the proposal

* **Lock state.** Each work item runs its channels through the tracking session
  (`iq::track::TrackSession`) with each design's `LockConfig`, and its `EpochSink` feeds the scorer.
  An update counts as locked when the session's state is `LOCKED`. A `false-lock` event marks
  that channel's next update as a tracker-flagged false lock. Each cell records
  `lock_source = "track-session"`. The session's own rules (`LOOP-DESIGN-TOML.md` §3 and
  `iq::track::lock`) therefore decide what counts as a loss, including `loss_dwell_s`, the
  false-lock check, `recovered` relocks, and re-acquisition and retirement when a design enables
  them. Time after a channel's last update (retired, or never started because it was not
  acquired) counts as unlocked, in the whole run and in every event window.
* **Data class.** A campaign must state `data_class = "synthetic" | "client-confidential"`. It is
  copied into the plan and every cell and is part of every cell key, so downstream tools can
  refuse to mix the two. An unknown value is refused.
* **Public verification.** `hash::canonical_json` and `hash::canonical_hash`,
  `runner::cell_key(&CellKeyInputs)` and `report::digest(out_dir)` are public. A consumer can
  re-derive every key and the `DIGEST` from `campaign.json` and the cell files. The DIGEST is the
  SHA-256 hex of the lines `"<key> <sha256 of the cell file>\n"`, sorted, over every planned cell.
  The cell files are pretty JSON with sorted keys and a trailing newline.
* **Bars** live in `[scoring.bars]`. A recording's test-condition file may override them field by
  field in its own `[bars]` table. Bars sit outside every hash and are applied when the report is
  built, so changing a bar re-judges the results without re-running any cell.
* **Cell key** also covers the recording id and the front-end and design names, so a renamed
  design re-runs instead of reusing a result under another name. A recording made of several
  data files hashes as the SHA-256 of its files' hex digests joined in order.
* **Hand-off.** Each satellite of a cell records `handoff.source`: `hint`, `acquired` or
  `not-acquired`, with the acquisition statistic and threshold. A satellite that is not acquired
  is still scored, with zero availability, so it is never silently dropped. Acquisition runs on
  the front-end-processed samples, once per distinct acquisition setting in a work item.
* **GB scale.** `gb_scale_recording_streams_in_bounded_memory` (ignored; release) runs a 4.0 GB
  recording (200 s of `cf32_le` at 2.5 MHz, one satellite). On one machine it processed 500 M
  samples in 36.7 s, 5.45× real time including the recording hash, with peak memory 2 MB above the
  starting RSS. These are single-machine measurements, not bars: the test asserts only that peak memory grows by
  less than 64 MB and that availability stays above 0.95.
* **Medians** come from a 0.05 dB histogram over 0–80 dB-Hz. They are exact to that bin width
  and keep memory fixed however long an event runs. Measured on a 60 s, 4-satellite × 4-design
  campaign in release (`throughput_and_bounded_memory_on_a_long_recording`, ignored), peak memory
  rose by 8 MB and throughput was 2.2× real time on one machine. Neither is a bar: the test asserts only that peak memory grows by less than 200 MB.
* **Re-acquisition time** is reported both from the event offset (`reacq_time_s`, primary) and
  from the loss of lock (`outage_s`).
* **MCP.** `iq_campaign` refuses a campaign that names any file outside the work directory:
  conditions, recordings, data files, truth sidecars or the design file. When `max_cells` is
  omitted, it runs the pending cells, in plan order, whose recording spans fit the per-call
  sample budget. `iq_campaign_status` only reads files.

### Observations from the synthetic campaign (`tests/iq_campaign.rs`)

* **C/N0 estimator.** Two estimates are scored and reported: NWPR and M2M4 (`cn0_estimator` picks
  the primary one, default `"m2m4"`). Under the loop's own jitter NWPR reads low by about
  `8 dB × Bn_PLL × T` (about −1 dB at `Bn·T = 0.1`), so its readings, and the baseline it
  subtracts, depend on the loop design; M2M4 does not carry that bias
  (`docs/design/evidence/cn0-m2m4/PREREGISTRATION.md`, #64). M2M4 has a limit of its own: a
  window whose moments give no estimate (`2·m2² − m4 ≤ 0`) returns nothing and is left out of
  the median. On the reference ramp at J/S 30 dB that is 8 % and 9 % of the windows (`n` = 2760
  and 2720 of 3000 for PRN 3 and PRN 11, against NWPR's 3000); at J/S 20 dB none. The degradation
  is baseline minus measured, so a constant bias cancels, but the part that grows with the stress
  does not: the NWPR curve over-reads the degradation. On the reference ramp (stated J/S 20 and
  30 dB, raw front end, stated nominal 45 dB-Hz), each estimator's measured degradation against
  the MODELLED value drawn from its own baseline, at J/S 20 / 30 dB:

  | | baseline (dB-Hz) | measured (dB) | MODELLED (dB) |
  |---|---|---|---|
  | PRN 3, NWPR | 44.68 | 6.0 / 14.7 | 5.88 / 14.73 |
  | PRN 3, M2M4 | 44.83 | 6.3 / 15.1 | 5.99 / 14.87 |
  | PRN 11, NWPR | 44.62 | 5.75 / 14.8 | 5.84 / 14.68 |
  | PRN 11, M2M4 | 44.62 | 5.8 / 14.9 | 5.84 / 14.68 |

  With `cn0_estimator = "nwpr"` every other scored result is identical to a run with `"m2m4"`
  (`tests/iq_campaign.rs`, `m2m4_changes_only_the_cn0_derived_fields`), and an NWPR run reproduces
  the results from before M2M4 existed (`nwpr_reproduces_the_pre_m2m4_results_exactly`).
* A hand-off at the ±1/(2T) Costas alias never declares code lock: the coherent sum of the NWPR
  estimator cancels there. The false-lock test therefore scores a correct track against a
  shifted truth sidecar. That checks the scoring path, not the tracker's false-lock behaviour.
* At exactly 2 samples per chip (2.046 MHz for GPS L1 C/A), the code discriminator's standard
  deviation sits near 0.2 chip at every C/N0. Commensurate sampling turns the S-curve into a step
  (`docs/design/evidence/dll-jitter/RESULTS.md`). The synthetic campaign therefore samples at
  2.5 MHz, where DLL jitter grows with falling C/N0 as theory expects.
* The default design's FLL assist runs only during pull-in (`fll_assist = "pull-in"`, the
  default from #45 `f3a8ca8b`; `"always"` restores the old behaviour). On the synthetic ramp
  (J/S 20 then 30 dB, about 30 dB-Hz at the end) the default design and the PLL-only design now
  score the same: no loss, availability 0.978 for PRN 3 and 0.978 for PRN 11. Before that change
  the always-on 10 Hz FLL injected frequency noise, and under the session's rule (phase *or*
  code lock down for `loss_dwell_s`) the default design lost lock at about 39 dB-Hz on these
  scenes while the PLL-only design held. The scorer reports what the state machine decides. It
  does not second-guess it.
* Re-acquisition is time-based. With `reacquire = true`, the session searches every
  `reacq_interval_s` (0.1 s, fixed by default; an optional back-off doubles it up to
  `reacq_max_interval_s`) and retires a channel only when the loss has lasted `reacq_window_s`
  (30 s by default) or, if set, `max_reacq_attempts` searches have failed (0 means no cap). The
  earlier fixed count of 3 back-to-back searches retired a channel about 0.2 s into a gap, so the
  `gap20` design in `tests/iq_campaign.rs` now sets `reacq_window_s = 5.0` in place of
  `max_reacq_attempts = 60`. Every channel is LOCKED again about 1.24 s after the gap in both
  front ends: one search, then the C/N0 estimator refilling (50 × 20 ms), then the 0.2 s dwell.
  With `reacquire = false`, PRNs 3 and 11 relock after the gap on both front ends
  (relock is `recovered`). PRN 22, whose loops drift during the gap, relocks on the raw chain and
  still does not on the 3-bit AGC chain. That outcome is pinned per front end
  (`PINNED_OBSERVE_RAW`, `PINNED_OBSERVE_Q3`); before #45 `f3a8ca8b` PRN 22 did not relock on
  either.
