# The FLL→PLL hand-over floor of the default design: results

Item DS-LOOP-05, run 2026-10-14 against the bars of [`PREREGISTRATION.md`](PREREGISTRATION.md)
(58789af0, before the code). No bar was changed. Per-run statistics are in
`tests/fixtures/fll_handover_floor/results.csv`. `tests/iq_fll_handover_floor.rs` grades them
and asserts this verdict, and its release-mode `the_committed_results_reproduce` re-runs them.

| bar | verdict | numbers |
|---|---|---|
| D0 the limit is there (control) | **MET** | the default design's FLL is still on at the last epoch in 9 of 10 seeds at 33 dB-Hz |
| D1 additivity | **MET** | default hash unchanged; the key is in the canonical form only when set; `tests/iq_track_engine.rs` unchanged and passing, release `carrier_lock_bars` included. There are no design files under `scenarios/`. |
| D2 hand-over and hold | **NOT MET** at 31 and at 33 dB-Hz | runs passing all three conditions: 8 of 20 at 31 dB-Hz, 16 of 20 at 33 dB-Hz (bar: all) |
| D3 as good as the PLL alone | **NOT MET** at 31 and at 33 dB-Hz | mean σφ capped / PLL-only: 24.55° / 8.42° at 31 dB-Hz, 10.76° / 6.06° at 33 dB-Hz (bar within 25 %) |
| D4 pull-in kept | **MET** | 100 Hz-off hand-off at 45 dB-Hz: LOCKED, no false lock or timeout, within 5 Hz |

## What the runs show

- **F1 (the floor is real).** With the default design at 33 dB-Hz, the FLL never handed over in 9
  of 10 seeds (σφ about 47°, phase lock near 0, never LOCKED). In the tenth seed it handed over
  and tracked like the PLL alone. This reproduces the documented limit.
- **F2 (the cap helps but is not reliable).** With `fll_pull_in_max_s = 1.0`, every run hands
  over at 1 s. At 33 dB-Hz, 16 of 20 runs then hold lock with σφ within a few percent of the PLL
  alone (5.4° to 6.5°). In the other four, the PLL does not reach `fll_off_pli` after the forced
  hand-over, the PLI holds below `fll_on_pli` for 1 s, and the FLL comes back.
  - The `fll_on_frac` values of 1/6, 1/3 and 1/2 of the 6 s window are one, two and three such
    1 s returns.
  - Some runs lock after one return (phase lock about 0.8). Others cycle to the end.
  - At 31 dB-Hz, 8 of 20 hold. At 29 dB-Hz (reported, not a bar), none of 20 does.
- **F3 (why, a hypothesis).** The PLL-only design from the truth hand-off holds at 31 and
  33 dB-Hz in every seed. So the failures are not the PLL's own noise floor. They fit a frequency
  error at the forced hand-over larger than the 15 Hz PLL pulls in: the FLL's instantaneous
  error at these C/N0, not its mean. This was not measured here. A hand-over that waits for a
  smoothed FLL frequency estimate, or one that resets the PLL's frequency state to it, would
  test it. Either would need its own pre-registration.

The cap stays opt-in, and the default is unchanged. `docs/design/LOOP-DESIGN-TOML.md` documents
the key with these numbers. The ~35 dB-Hz floor remains the default's documented limit.

## How to reproduce

```
cargo test --release --test iq_fll_handover_floor -- --ignored   # re-runs the survey and compares
cargo test --test iq_fll_handover_floor                          # grades the committed numbers
```
