# Carrier lock under the default FLL-assisted PLL: results

Pre-registration: `PREREGISTRATION.md` (committed at `a4119ba7`, before these runs).
Reproduce with `cargo test --release --test iq_track_engine carrier_lock_survey -- --ignored
--nocapture` (set `KSHANA_SURVEY_DATA=1` for the runs with data bits). The source is a
synthetic GPS L1 C/A signal: PRN 13, 1500 Hz Doppler, 4.1 MHz (incommensurate), started
from the truth hand-off, 8 s long. Steady state is t ≥ 2 s. σφ is the true carrier phase
error (Costas, mod ½ cycle) against the injected carrier.

## Root cause: H1 (real loop behaviour)

Before the fix, the default design ran a second-order 15 Hz Costas PLL with a first-order
10 Hz FLL path on at every update:

| C/N0 (dB-Hz) | FLL always: phase lock | LOCKED | σφ | σf | PLL only: phase lock | LOCKED | σφ |
|---|---|---|---|---|---|---|---|
| 45 | 1.000 | 1.000 | 1.6° | 1.32 Hz | 1.000 | 1.000 | 1.3° |
| 42 | 1.000 | 1.000 | 2.3° | 1.89 Hz | 1.000 | 1.000 | 1.9° |
| 39 | 1.000 | 1.000 | 3.3° | 2.73 Hz | 1.000 | 1.000 | 2.7° |
| 37 | 0.843 | 0.953 | 16.3° | 4.55 Hz | 1.000 | 1.000 | 3.5° |
| 35 | 0.100 | 0.000 | 40.9° | 11.00 Hz | 1.000 | 1.000 | 4.4° |

(These are the runs without data bits. With data bits: 37 dB-Hz 0.757 / 1.000 / 19.7°, and
35 dB-Hz 0.160 / 0.057 / 38.1°. PLL only is unchanged.)

The true phase error is large exactly where the phase-lock indicator is low. So the
indicator (H2) and its threshold (H3) are reading correctly. The always-on FLL path injects
frequency noise into the PLL's velocity integrator. A 1 ms FLL discriminator is noisy at
these C/N0, and its frequency noise reaches the carrier NCO: σf rises from 2.9 Hz with the
PLL alone to 11 Hz at 35 dB-Hz. **H1 holds.**

The ~39 dB-Hz loss seen in the campaign runs was at 2.046 MS/s, where commensurate sampling
already costs about 2.4 dB of C/N0 (`../dll-jitter/RESULTS.md`). At 2.5 MS/s the campaign
saw the gap between the two designs only near 30 dB-Hz. These numbers are consistent with
the cliff above once the C/N0 loss is counted.

## Fix

`[design.carrier] fll_assist = "pull-in"` (the default) uses the FLL path only while the
channel is not phase-locked, with hysteresis. The FLL hands over to the PLL once the
smoothed PLI has held at or above `fll_off_pli` (0.8) for `fll_gate_dwell_s` (0.1 s), and
comes back once it has held below `fll_on_pli` (0.6) for the dwell. `"always"` keeps the
earlier behaviour, and reproduces the table above exactly.

## Against the pre-registered bars (default design, after the fix)

| C/N0 | data | phase lock | LOCKED | σφ | σf | slips | FLL on (steady) | gate toggles |
|---|---|---|---|---|---|---|---|---|
| 45 | no | 1.000 | 1.000 | 1.3° | 0.82 Hz | 0 | 0 | 0 |
| 42 | no | 1.000 | 1.000 | 1.9° | 1.18 Hz | 0 | 0 | 0 |
| 39 | no | 1.000 | 1.000 | 2.7° | 1.71 Hz | 0 | 0 | 0 |
| 37 | no | 1.000 | 1.000 | 3.5° | 2.22 Hz | 0 | 0 | 0 |
| 35 | no | 0.997 | 0.963 | 4.4° | 2.87 Hz | 0 | 0 | 0 |
| 45 | yes | 1.000 | 1.000 | 1.3° | 0.82 Hz | 0 | 0 | 0 |
| 42 | yes | 1.000 | 1.000 | 1.9° | 1.17 Hz | 0 | 0 | 0 |
| 39 | yes | 1.000 | 1.000 | 2.7° | 1.68 Hz | 0 | 0 | 0 |
| 37 | yes | 1.000 | 1.000 | 3.4° | 2.18 Hz | 0 | 0 | 0 |
| 35 | yes | 1.000 | 1.000 | 4.5° | 2.80 Hz | 0 | 0 | 0 |

* **B1 PASS**: phase lock ≥ 0.997 at every C/N0 ≥ 35 dB-Hz (bar ≥ 0.95).
* **B2 PASS**: no half-cycle slips.
* **B3 PASS**: LOCKED ≥ 0.963 (bar ≥ 0.95). The 35 dB-Hz run without data reaches LOCKED
  slightly after the 2 s steady-state start, because the pull-in runs with the FLL on.
* **B4 PASS**: from a hand-off 100 Hz off the true Doppler at 45 dB-Hz, the default reaches
  LOCKED within `pull_in_max_s` with no false-lock event, and ends within 5 Hz of the truth
  (`the_default_design_pulls_in_a_100_hz_handoff_error`, debug suite). `"always"` passes
  B4 as well.
* **Hysteresis**: zero gate toggles in the steady state at every C/N0 from 35 to 45 dB-Hz
  (`carrier_lock_bars`, release).

For the "always" mode the same bars fail at 35 and 37 dB-Hz (first table). That mode is kept
for comparison and for replaying earlier results.
