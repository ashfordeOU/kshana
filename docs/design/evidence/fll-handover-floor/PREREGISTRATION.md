# The FLL→PLL hand-over floor of the default design: pre-registration

Item DS-LOOP-05. Written and committed **before** any of the code below exists and before any
run. The bars may be tightened after a run, never loosened. A miss is recorded in `RESULTS.md`
with its numbers, and its test asserts the recorded miss.

## The limit

`docs/design/LOOP-DESIGN-TOML.md` ("Known limits of the default design") records it. Under
`fll_assist = "pull-in"` the FLL hands over to the PLL only once the smoothed PLI has held at
or above `fll_off_pli` (0.8) for `fll_gate_dwell_s` (0.1 s). Below about 35 dB-Hz the FLL's own
frequency noise keeps the phase error large, so the PLI never reaches 0.8 and pull-in never
completes. This is the mechanism `docs/design/evidence/carrier-lock/` measured (H1 there).

## The change (additive, opt-in)

A new optional key, `[design.carrier] fll_pull_in_max_s` (s), on an FLL-assisted PLL under
`fll_assist = "pull-in"`:
- **Forced hand-over.** Once the FLL path has been on for `fll_pull_in_max_s` without
  handing over, the gate switches it off, whatever the PLI.
- **Return after a forced hand-over.** Until the smoothed PLI next reaches `fll_off_pli`, the
  FLL comes back only once the PLI has held below `fll_on_pli` for `fll_pull_in_max_s` instead
  of `fll_gate_dwell_s`. This gives the PLL as long to settle as the FLL had to pull in. Once
  the PLI has reached `fll_off_pli`, the normal dwell applies again.

Absent (the default), behaviour is unchanged. The key is omitted from the canonical JSON when
unset, so every existing design keeps its hash.

## The runs

The source is the synthetic data-free GPS L1 C/A source of `carrier_lock_survey`
(`tests/iq_track_engine.rs`): PRN 13, 1500 Hz Doppler, 4.1 MHz (incommensurate), 8 s. Steady
state is 2 s ≤ t < 8 s. Ten noise seeds per configuration: the generator's seed XOR k, for
k = 1 to 10. Each run is at C/N0 of 31 or 33 dB-Hz, with one of two hand-offs:
- the truth (1500 Hz);
- 25 Hz off (1475 Hz).

The designs:
- **default**: `LoopConfig::default()`;
- **capped**: the default with `fll_pull_in_max_s = 1.0`;
- **pll-only**: a second-order 15 Hz PLL alone.

## Bars

- **D0 (the limit is there: control).** The default design, truth hand-off, 33 dB-Hz: the FLL is
  still on at the last epoch in at least 5 of the 10 seeds. If not, the 33 dB-Hz half of D2 and
  D3 cannot show an improvement, and those halves are recorded as NOT MET (uninformative).
- **D1 (additivity).**
  - The default design's hash is unchanged.
  - Every design file under `scenarios/` and `docs/` that does not set the key keeps its hash.
  - `tests/iq_track_engine.rs` passes unchanged, the release `carrier_lock_bars` included.
- **D2 (hand-over and hold).** For the capped design, at 31 and 33 dB-Hz, both hand-offs and all
  ten seeds (40 runs), every run must have:
  - the FLL off at every steady-state epoch;
  - phase lock in at least 95 % of steady-state epochs;
  - zero half-cycle slips in the steady state.
- **D3 (as good as the PLL alone).** At 31 and 33 dB-Hz, from the truth hand-off, the capped
  design's steady-state true carrier phase error σ, averaged over the ten seeds, is within
  **25 %** of the pll-only design's on the same seeds.
- **D4 (pull-in kept).** The capped design passes the existing pull-in guard: a hand-off 100 Hz
  off at 45 dB-Hz must reach LOCKED with no `false-lock` or `pull-in-timeout` event, and end
  within 5 Hz of the truth.

The capped design at 29 dB-Hz (both hand-offs, ten seeds) is reported as a finding, not a bar.

## Out of scope

Data bits, other signals and sample rates, changing the default (that would be a separate
revision decision), and any other hand-over criterion.
