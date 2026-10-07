# Lab replay: test conditions, campaign runner and scoring (PROPOSAL)

Status: **proposal for review** (0.34.0 "Lab replay", items B5.1, B5.2, B8.1, B8.2, B8.3 and F1).
Nothing here is implemented yet. Once agreed, this file becomes the normative reference.

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
# Optional hand-off hints. Without them the runner acquires (W1's acquisition design).
# doppler_hz = [1200.0, -800.0, 2300.0, 150.0]
# code_phase_chips = [...]
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
are time-ordered and inside `[onset_s, offset_s]` (held flat outside them up to the edges);
`affects` ids must be in `[[expected]]`. Spoofing/outage events get every metric except the
C/N0-vs-J/S comparison (no J/S → no reference curve). **Condition hash** = SHA-256 of the
canonical JSON of the resolved file, with sorted keys and `[receiver]` text excluded.

**Import.** `kshana iq conditions <file>` validates a file and prints the resolved form. SigMF
annotations with `core:label` and a `kshana:test_event` object import the same event fields
(B8.1's SigMF route). Importers for the lab's own simulator logs wait for their sample files (R9).

## 2. Campaign file (`kshana.campaign/1`)

```toml
schema = "kshana.campaign/1"
name = "overnight-01"

[inputs]
conditions = ["lab/conds/*.toml"]   # globs of test-condition files; each names its recording
designs = "designs.toml"            # a `kshana.loop-design/1` file (W1, LOOP-DESIGN-TOML.md)
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
epochs = "none"                     # "none" | "jsonl" | "binary": also keep W1's per-epoch stream

[scoring]
baseline_window_s = 10.0            # pre-event window for baseline C/N0 and jitter
js_bin_db = 1.0                     # J/S bin width for the degradation curve
false_lock_doppler_hz = "auto"      # truth check threshold; auto = 1/(4 T_coh)
reacq_grace_s = 30.0                # how long after offset re-acquisition is looked for
reference_curve = true              # F1: draw the MODELLED SSC curve

[scoring.bars]                      # optional pass/fail bars; omitted -> no pass/fail column
max_time_to_loss_s = ...            # (only where the lab sets bars)
max_reacq_s = 5.0
min_availability = 0.95
```

**Cells.** A cell is one (recording, front-end chain, design). Each cell's key is SHA-256 over
canonical JSON of `{recording_sha256, conditions_hash, frontend_hash, design_hash, run_hash,
scoring_hash, engine_version}`. For execution, the runner groups pending cells that share
(recording, chain). Each group reads the recording once, runs the chain once, and replays all
of its designs through one bank, exactly as `iq sweep` does today. When there are fewer groups
than workers, a group's designs are split into chunks, so the work still fills all cores.
Channels in a bank are independent, so this grouping never changes any result.

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
  epochs/<key>.*       only when run.epochs != "none" (W1's kshana.track-epoch/1)
  runs.jsonl           execution log (wall times; excluded from the digest)
  scorecard.csv        one row per (cell, satellite, event) plus one "whole-run" row per (cell, satellite)
  scorecard.json       the same rows plus the per-J/S-bin curves
  report.html          self-contained (inline CSS/SVG, no network)
  DIGEST               SHA-256 over the sorted (key, sha256(cell file)) list  (B8.3)
```

`kshana.campaign-cell/1`:

```json
{
  "schema": "kshana.campaign-cell/1",
  "key": "…", "engine_version": "0.34.0",
  "recording": {"id": "run-017", "sha256": "…", "conditions_hash": "…"},
  "frontend": {"name": "raw", "hash": "…"},
  "design": {"name": "baseline", "hash": "…"},
  "run_hash": "…", "scoring_hash": "…",
  "samples_processed": 900000000,
  "satellites": [{
    "signal": "gps-l1ca", "id": 7,
    "whole_run": {
      "availability": 0.93, "locked_s": 279.0, "phase_lock_frac": 0.91, "code_lock_frac": 0.95,
      "baseline_cn0_dbhz": 44.8, "pll_jitter_deg": 4.1, "dll_jitter_chips": 0.012,
      "false_lock_episodes": 0, "false_lock_per_hour": 0.0, "loss_count": 1, "reacq_count": 1
    },
    "events": [{
      "event_id": "jam-1", "type": "cw",
      "lost": true, "time_to_loss_s": 74.2, "js_at_loss_db": 38.5,
      "reacquired": true, "reacq_time_s": 3.1,
      "availability": 0.61, "pll_jitter_deg": 9.8, "dll_jitter_chips": 0.031,
      "false_lock_episodes": 0,
      "cn0_curve": [{"js_db": 20.0, "n": 1000, "measured_cn0_dbhz": 44.1,
                     "measured_degradation_db": 0.7,
                     "modelled_cn0_dbhz": 44.6, "modelled_degradation_db": 0.2}],
      "modelled": {"label": "MODELLED", "q": 1.0, "chip_rate_hz": 1.023e6,
                   "formula": "(C/N0)eff = [1/(C/N0) + (J/S)/(Q*Rc)]^-1"},
      "pass": {"max_reacq_s": true}
    }]
  }]
}
```

### Metric definitions (per satellite, per design, per chain)

Lock is W1's state machine (`LOCKED` vs everything else) with its `LOST`/`FALSE_LOCK`/re-acq
events. A design file's `loss_dwell_s` therefore sets what counts as "loss".

| metric | definition |
|---|---|
| availability | time in `LOCKED` / time scored (after `settle_s`); whole run and within each event window |
| time to loss of lock | first `LOCKED → LOST` transition in `[onset, offset + reacq_grace]` minus `onset`; `null` = held lock |
| J/S at loss | stated J/S (from `[event.power]`) at the moment of loss |
| re-acquisition time | first return to `LOCKED` at or after `max(offset, t_loss)` minus `offset`; `null` = not within grace |
| baseline C/N0 | median NWPR C/N0 over locked epochs in `[onset − baseline_window_s, onset)` (else the stated `nominal_cn0_dbhz`) |
| C/N0 degradation vs J/S | per `js_bin_db` bin of stated J/S during the event: `n`, median measured C/N0 over locked epochs, degradation = baseline − measured |
| MODELLED reference | per bin: `effective_cn0_dbhz(baseline, js, Q(type), Rc)` from `jamming`, with Q from the corrected table (W5/D5: CW and narrowband 1.0, broadband 2.0) or the event's `q` |
| false-lock rate | episodes per hour of locked time. An episode is W1's `FALSE_LOCK` alias detection or, with a truth sidecar, ≥ `cn0_windows` consecutive locked epochs with \|Doppler − truth\| > threshold |
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
* **Rust**: `kshana::iq::campaign::{TestConditions, CampaignSpec, Campaign, CellResult, Scorer}`
  and `kshana::iq::campaign::score::Scorer`, an online scorer fed `EpochOutput`s, usable without
  the runner.
* **Python**: `iq_test_conditions(text_or_path) -> dict`,
  `iq_campaign(spec, out_dir, workers=0, resume=True, max_cells=None) -> dict` (summary + digest),
  and `iq_campaign_report(out_dir) -> dict`. `kshana.pyi` is updated to match.
* **MCP**: `iq_campaign` takes paths in the work directory, with a sample budget per call that
  covers all cells it runs. `max_cells` makes long campaigns incremental: call it repeatedly, and
  each call resumes. `iq_campaign_status` reports done and pending cells and the digest.

## 5. Tests

A synthetic campaign stands in for recordings. Kshana scenes use a C/N0 profile per satellite,
applied as a `SceneChannel` amplitude scaling over time (a signal-power profile, not an
interference waveform, per F2's wording). Profile segments ramp C/N0 down, drop it below
tracking threshold (a signal gap) and restore it. The matching test-condition file states the
J/S that maps to each C/N0 under the analytic model, so the measured and MODELLED curves are
expected to agree. The tests cover:

* every metric against injected truth;
* condition and campaign schema round-trips and their error cases;
* resume after a killed run, which must equal an uninterrupted run byte for byte;
* the same DIGEST for 1 worker and N workers;
* a Doppler-truth false-lock case from a hand-off seeded at a ±1/(2T) alias;
* a performance check: cells/s and samples/s logged, with a loose budget, and the GB-scale case
  `#[ignore]`d.
