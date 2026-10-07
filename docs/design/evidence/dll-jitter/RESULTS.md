# DLL discriminator jitter: results

Pre-registration: `PREREGISTRATION.md` (committed at `a60ad599`, before these runs).
Reproduce with `cargo test --release --test iq_track_engine dll_jitter_survey -- --ignored --nocapture`.
The source is a synthetic GPS L1 C/A signal (PRN 13, 1500 Hz Doppler, infinite bandwidth),
tracked with the default loops: first-order 2 Hz carrier-aided EMLP DLL, d = 0.5, T = 1 ms.
The steady-state window is 1.5 s ≤ t < 3.5 s.

| fs (Hz) | samples/chip | C/N0 (dB-Hz) | σ_D measured | σ_D theory | σ_ε measured | σ_ε theory |
|---|---|---|---|---|---|---|
| 2 046 000 | 2.000 | 45 | 0.20748 | 0.06418 | 0.09111 | 0.00406 |
| 2 046 000 | 2.000 | 38 | 0.20668 | 0.15491 | 0.08631 | 0.00980 |
| 2 046 000 | 2.000 | 30 | 0.19793 | 0.54006 | 0.04528 | 0.03416 |
| 2 500 000 | 2.444 | 45 | 0.06147 | 0.06418 | 0.00469 | 0.00406 |
| 2 500 000 | 2.444 | 38 | 0.12851 | 0.15491 | 0.00932 | 0.00980 |
| 2 500 000 | 2.444 | 30 | 0.18399 | 0.54006 | 0.01155 | 0.03416 |
| 4 100 000 | 4.008 | 45 | 0.06168 | 0.06418 | 0.00322 | 0.00406 |
| 4 100 000 | 4.008 | 38 | 0.12860 | 0.15491 | 0.00727 | 0.00980 |
| 4 100 000 | 4.008 | 30 | 0.18687 | 0.54006 | 0.01601 | 0.03416 |

(All values in chips.)

## Against the pre-registered bars

* **P1 PASS**: at 2.046 MHz, σ_D(45) = 0.207 ≥ 0.128, and σ_D(38)/σ_D(45) = 0.996 < 1.5.
* **P2 PASS**: at 2.5 MHz, σ_D is −4.2 % (45 dB-Hz) and −17.0 % (38 dB-Hz) from theory. At
  4.1 MHz it is −3.9 % and −17.0 %. All are within ±20 %.
* **P3 PASS**: at 4.1 MHz, 45 dB-Hz, σ_ε = 0.00322 vs 0.00406 (−20.7 %, within ±30 %).
* 30 dB-Hz, reported only: σ_D saturates near 0.19 because the normalised EMLP discriminator
  is bounded by ±(2 − d)/4 = ±0.375 chip, far from the linear closed form.

## Root cause

**H1 holds.** The flat ~0.20 chip is an artefact of **commensurate sampling**, not of the
discriminator, its normalisation or the unit.

At exactly 2.000 samples per chip the samples fall on the same two chip phases in every chip.
The taps then see a staircase instead of the correlation triangle. With d = 0.5 the S-curve has
no linear part at all: on a noise-free signal the first discriminator output is −0.2252 chip for
every code offset from 0 to 0.24 chip. At 2.5 MHz the same outputs run −0.007, −0.038, …,
−0.220, close to unit slope. So at 2 spc the DLL dithers bang-bang between ±0.225 chip. That
sets σ_D ≈ 0.21 at any C/N0 and a code tracking error of about 0.09 chip RMS (≈ 26 m) at
45 dB-Hz.

The mechanism is pinned by
`tests/iq_track_engine.rs::commensurate_sampling_turns_the_dll_s_curve_into_a_step`, which runs
in the debug suite. `dll_jitter_bars` asserts P1 (both parts), P2 (2.5 and 4.1 MHz, at 45
and 38 dB-Hz) and P3 in release builds.

The PLL is not affected, because carrier phase does not depend on the chip-phase sampling
pattern. That is why its σ scaled correctly in W7's run.

## Consequences

* Scenes and recordings sampled at an exact integer multiple of the chip rate (2.046, 4.092 …
  MHz for GPS L1 C/A) should not be used to judge code-loop performance. Real front ends avoid
  such rates, and band-limiting softens the staircase, but the effect on an ideal synthetic
  scene is extreme.
* Several Kshana tests and examples use 2.046 MHz. Their acquisition and carrier assertions
  are unaffected; their code-tracking jitter would not be representative.

## C/N0 at 45 dB-Hz (W7: "NWPR reads ~2 dB low")

`cn0_survey` (release, ignored in the debug suite) gives the steady-state mean of the
estimators against the injected 45 dB-Hz:

| fs (Hz) | NWPR (dB-Hz) | Beaulieu (dB-Hz) |
|---|---|---|
| 2 046 000 | 42.65 | 33.19 |
| 2 500 000 | 44.77 | 46.71 |
| 4 100 000 | 44.87 | 45.31 |

The NWPR estimator's own bias at M = 50 windows is small: −0.1 to −0.2 dB here, and within
0.3 dB on ideal prompts in `tests/iq_receiver.rs::cn0_estimators_are_unbiased_at_35_and_45_dbhz`.
The ~2 dB shortfall W7 saw is the **same commensurate-sampling root cause**. The bang-bang DLL's
code error costs correlation power (the mean |P| falls 0.75 dB below the ideal amplitude) and
adds amplitude jitter. Beaulieu, which is sensitive to amplitude fluctuation, reads 12 dB low
there. At an incommensurate rate both estimators read within 2 dB of truth, and NWPR within
0.25 dB.

## Integer and half-integer rates (deciding the warning)

`commensurate_ratio_survey` (release, ignored in the debug suite): noise-free S-curve
(first-update discriminator, code offsets 0 to 0.21 chip) and the 45 dB-Hz jitter and mean code
error, by samples per chip:

| samples/chip | S-curve (0, 0.03 … 0.21 chip) | σ_D | σ_ε | mean ε |
|---|---|---|---|---|
| 2 | −0.2252 at every offset (one step) | 0.2075 | 0.09111 | −0.0923 |
| 2.5 | 0.103, −0.003 ×3, −0.107 ×3, −0.176 (steps) | 0.0983 | 0.01492 | −0.0102 |
| 3 | −0.144 ×6, −0.300 ×2 (steps) | 0.1168 | 0.03005 | −0.0129 |
| 3.5 | −0.069 ×3, −0.147 ×2, −0.192 ×3 (steps) | 0.0786 | 0.00711 | −0.0041 |
| 4 | 0.000 at every offset (dead zone ≥ ±0.21 chip) | 0.0672 | 0.00402 | −0.0004 |
| 5 | 0.000 ×4, −0.105 ×3, −0.177 (steps) | 0.0954 | 0.01415 | −0.0105 |
| 2.4438 (control) | −0.007 … −0.197, linear | 0.0639 | 0.00336 | +0.0010 |

Every integer and half-integer ratio gives a staircase S-curve. The damage ranges from
severe (2 samples/chip: 27× the control's code error, −0.09 chip bias) to mild (4 samples/chip,
where noise dithers the dead zone). The warning therefore covers any fs/chip_rate within 1e-6
(relative) of a multiple of 1/2 (`iq::track::commensurate_samples_per_chip`). It appears as
`commensurate_sampling` in the `iq track`/`iq sweep` output and summary, the MCP `iq_track`
reply and the Python `iq_track` result.

Found on the way: at 2.5 samples/chip a GPS L1 C/A period is not a whole number of samples
(2557.5), so no acquisition search can run there. The false-lock check's search used to abort
the whole tracking session. Now it switches the check off for that channel; re-acquisition
counts the attempt as failed, or retires the channel if no search can run at all
(`an_unsearchable_rate_tracks_without_the_check`).
