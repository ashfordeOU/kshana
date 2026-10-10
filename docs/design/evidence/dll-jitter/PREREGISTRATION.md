# DLL discriminator jitter: pre-registration

Written and committed **before** any measurement below was run. Trigger: W7's finding against
the 0.34 tracker (feat/034-campaign @ d89e07ed). At fs = 2.046 MHz (2 samples per chip), with an
EMLP discriminator and d = 0.5, the per-update DLL discriminator σ is about 0.20 chip and flat
across 30, 38 and 43 dB-Hz, while theory gives about 0.06 chip at 45 dB-Hz. The PLL σ scales
correctly.

## Quantities

* **σ_D**: sample standard deviation of `dll_disc_chips` (the per-update EMLP discriminator
  output, in chips) over the steady-state updates `1.5 s ≤ code_epoch_s < 3.5 s` of one GPS L1
  C/A channel. Default loops: first-order 2 Hz DLL, carrier-aided, d = 0.5, T = 1 ms.
* **σ_ε**: sample standard deviation of the true code tracking error over the same updates. The
  error is the receiver's `code_phase_chips` at `sample_index` minus the synthetic truth's code
  phase at that sample, wrapped to ±L/2.
* **Theory**: Kaplan & Hegarty's thermal-noise closed form for EMLP with an infinite-bandwidth
  front end, `σ_ε² = (Bn·d/(2C/N0))·(1 + 2/((2 − d)·T·C/N0))`. The per-update discriminator noise
  of the same model is `σ_D² = σ_ε² / (2·Bn·T) = (d/(4·T·C/N0))·(1 + 2/((2 − d)·T·C/N0))`.
  This gives σ_D = 0.0642 chip at 45 dB-Hz and 0.155 chip at 38 dB-Hz, and σ_ε = 0.00406
  chip at 45 dB-Hz.

## Source

The deterministic synthetic source of `tests/iq_track_engine.rs`: one PRN, Doppler 1500 Hz,
unit-variance complex white noise and an ideal rectangular-chip BPSK signal (infinite
bandwidth), handed off from the truth. Sample rates:
* 2.046 MHz: exactly 2 samples per chip, commensurate.
* 2.5 MHz: 2.4438 samples per chip, incommensurate.
* 4.1 MHz: 4.0078 samples per chip, incommensurate.

## Hypothesis

H1: the flat 0.20 chip is a **sampling artefact of commensurate sampling**. When fs is an exact
integer multiple of the chip rate, the samples hit the same two chip phases in every chip. The
correlation function the taps see is then a staircase, not a triangle, and the DLL has a dead
zone about ±0.25 chip wide, inside which noise and code Doppler move the code freely. That
inflates σ_D and σ_ε independently of C/N0. Neither a discriminator normalisation error nor a
unit error is expected: the discriminator's unit slope is tested on the ideal triangle
(`discrim::tests`), and the loop's jitter matches the closed form on ideal correlators
(`tests/iq_receiver.rs::dll_jitter_matches_the_thermal_noise_closed_form`).

## Pre-registered bars (decided now, not to be relaxed)

1. **P1 (artefact present at 2 spc)**: at fs = 2.046 MHz, σ_D at 45 dB-Hz ≥ 2 × theory
   (≥ 0.128 chip), and σ_D(38)/σ_D(45) < 1.5 (theory: 2.41).
2. **P2 (no artefact when incommensurate)**: at fs = 2.5 MHz and 4.1 MHz, σ_D is within ±20 %
   of theory at 45 and at 38 dB-Hz.
3. **P3 (tracking error)**: at fs = 4.1 MHz and 45 dB-Hz, σ_ε is within ±30 % of the closed form
   (0.00406 chip). At fs = 2.046 MHz, σ_ε is reported, not barred.
4. 30 dB-Hz: σ_D is **reported only** (T·C/N0 = 1, outside the linear regime of the closed
   form).

If P2 or P3 fails, H1 is not the whole story and the discriminator, the normalisation and the
measurement are re-examined; the result is reported as found.
