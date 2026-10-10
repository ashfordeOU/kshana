# Carrier lock under the default FLL-assisted PLL: pre-registration

Written before any of the runs below.

## Observation

The campaign runner, using the lock state machine with "phase *or* code lock lost for
`loss_dwell_s` → LOST", reports that the default design (second-order 15 Hz Costas PLL assisted
by a first-order 10 Hz FLL, PLI threshold 0.8) declares LOST at about 39 dB-Hz on clean scenes.
Its phase-lock fraction is only about 55 % even at baseline. A PLL-only design mostly holds. In
a separate monitor test (data-free C/A, 2.048 MHz, C/N0 stepped 45 → 39 dB-Hz) the Costas loop
slipped half a cycle about 2 s after the step, with the FLL discriminator swinging ±100 Hz per
1 ms update.

## Hypotheses

* **H1 (real loop behaviour, FLL noise):** the always-on 10 Hz FLL path injects frequency
  noise into the PLL's velocity integrator. A 1 ms atan2 FLL discriminator has σ ≈ 57 Hz at
  39 dB-Hz, and the FLL's closed-loop frequency jitter is about 12 Hz. The true carrier phase
  error is then much larger than the PLL's thermal 2–3°, so the PLI genuinely drops and the
  loop slips.
* **H2 (indicator):** the true phase error is small, but the smoothed narrow-band PLI reads
  low, e.g. from residual frequency error rotating the prompt inside the 20 ms window.
* **H3 (threshold):** the PLI distribution is fine, but 0.8 sits in its tail at these C/N0.

## Measurement

`tests/iq_track_engine.rs::carrier_lock_survey` (release, ignored in the debug suite) uses the
synthetic data-free GPS L1 C/A source (PRN 13, 1500 Hz Doppler, 4.1 MHz, incommensurate). It
starts from the truth hand-off and runs 8 s, with the steady state at t ≥ 2 s. For each C/N0 in
{45, 42, 39, 37, 35} dB-Hz and each of the default design and PLL-only (same 15 Hz PLL) it
reports:
* the phase-lock fraction, the LOCKED fraction and the mean PLI;
* the σ of the **true** carrier phase error (NCO phase against the injected phase, Costas,
  mod ½ cycle);
* the σ of the Doppler error;
* the number of half-cycle slips.

H1 is supported if the default design's true σ_phase is at least 2× PLL-only's at 39 dB-Hz
and its slips or low PLI go with that large σ. H2 is supported if σ_phase is small (< 10°)
while the phase-lock fraction is low. H3 is supported if σ_phase is small and the mean PLI is
above 0.8 but the fraction is low.

## Bar for the fix

On the same source (clean, data-free, incommensurate rate), the **default design** must:
* **B1:** hold phase lock in ≥ 95 % of steady-state epochs at every C/N0 ≥ 35 dB-Hz;
* **B2:** have zero half-cycle slips at C/N0 ≥ 35 dB-Hz over the 6 s window;
* **B3:** stay LOCKED (state machine) in ≥ 95 % of steady-state epochs at C/N0 ≥ 35 dB-Hz;
* **B4:** keep pull-in. From a hand-off 100 Hz off the true Doppler (well within a one-bin
  acquisition error) at 45 dB-Hz it must reach LOCKED within `pull_in_max_s`, with no
  `false-lock` event.

B4 guards against a "fix" that removes the FLL's pull-in benefit.
