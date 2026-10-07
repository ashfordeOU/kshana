# Stream 4: front end and mitigation DSP (`iq::frontend`)

Entries for integration to merge into `CHANGELOG.md`, `docs/VALIDATION.md` and
`docs/VERIFICATION-MATRIX.md`. Tests: `tests/iq_frontend.rs` (19 tests).

## CHANGELOG (Added)

- `iq::frontend`: receiver front end and interference-mitigation DSP as streaming stages
  (`Stage::process(&mut self, &mut [Cf64])`, state kept across blocks, chunked output
  bit-identical to one-shot): Kaiser-window FIR design (low-pass, complex band-pass) and a
  streaming FIR; bilinear biquads (low-pass, high-pass, band-pass, notch) and cascades; a
  1/2/3/8/14-bit uniform mid-rise quantiser with its closed-form correlation loss; a
  log-domain AGC with a stated time constant; an LMS-adapted complex notch; magnitude-
  threshold pulse blanking with hold; overlapped-FFT per-bin excision (reuses
  `spectrum::fft_in_place`). `Chain` composes stages.

## VALIDATION / verification matrix

| Claim | Reference | Test | Label |
|---|---|---|---|
| Kaiser FIR meets stated attenuation; passband ripple ≤ 1.5δ, δ = 10^(−A/20), at A = 40, 60, 80 dB | Kaiser 1974; Oppenheim & Schafer §7.6 (empirical formulas; measured ripple 0.92–1.10 δ) | `fir_lowpass_meets_its_kaiser_specification`, `fir_complex_bandpass_passes_only_its_band` | checked against the design spec |
| I0 and β | Abramowitz & Stegun table 9.8; Kaiser's β formula | `kaiser_beta_and_bessel_i0_match_published_values` | closed form / table |
| Streaming FIR and biquad realise the coefficient response | `H(f)` from the coefficients | `fir_streaming_output_matches_the_coefficient_response`, `biquad_cascade_streaming_matches_response_and_is_chunk_invariant` | closed form |
| Q = 1/√2 biquad low-pass is the bilinear Butterworth | `1/√(1 + (tan(ω/2)/tan(ω₀/2))⁴)` to 1e-12 | `biquad_lowpass_is_the_bilinear_butterworth` | closed form |
| Quantiser loss: 1 bit 1.96 dB (= 10·log10 π/2), 2 bits 0.55 dB at ≈1.0σ, 3 bits 0.17 dB | Van Vleck & Middleton 1966; Chang 1982; Hegarty 2011 | `quantiser_loss_matches_published_values` | published value |
| Implementation matches the closed form within 0.05 dB (seeded Monte Carlo, measured ≈ 0.015 dB) | closed form above | `quantiser_measured_snr_loss_matches_the_closed_form` | closed form |
| AGC settles in τ·ln 10 to 1 dB after a 10 dB step (±15 %; measured 0.97×), level within 0.1 dB | first-order loop closed form | `agc_settles_with_its_time_constant_to_the_target_level` | closed form |
| AGC + 2-bit quantiser at an arbitrary input level sits at the 0.55 dB optimum (±0.12 dB; measured 0.56) | published value | `agc_driven_two_bit_quantiser_sits_at_the_optimum_loss` | published value |
| Adaptive notch converges to an injected tone (error < 1e-3·fs, measured ≈ 1e-6·fs), tone suppressed > 17 dB to the noise floor | injected truth | `adaptive_notch_converges_on_a_tone_in_noise` | MODELLED (behaviour test) |
| Pulse blanker zeroes exactly the exceedances plus hold | hand-built test vector | `pulse_blanker_zeroes_exceedances_and_their_hold` | exact |
| FFT excision: exact reconstruction (delay N − 1) when nothing excised; noise-only excision rate = p_fa within 10 % (measured 1.03 p_fa); strong tone cut > 30 dB | `sin² + cos² = 1`; exponential tail `P(|X|² > −ln(p_fa)·mean) = p_fa` | `freq_excision_*` | closed form |

## Limitations

- Generic filter stages on generic inputs (tones, Gaussian noise, threshold vectors); no
  model of any receiver or device, and no interference waveform synthesis in this layer
  (the separate `spectrum` kind writes analytic jammer IQ snapshots; see docs/SPECTRUM.md).
- The quantiser loss formulas are the weak-signal, Gaussian-noise, white-spectrum results;
  pre-correlation band-limiting and sampling-rate effects on the loss are not modelled.
- The AGC's γ bias correction assumes a noise-dominated (circular Gaussian) input; a
  strong constant-envelope interferer biases the settled level.
- The adaptive notch tracks one narrowband component; multiple tones need a cascade.
- FFT excision uses a per-frame median noise floor; frames are a power of two (radix-2 FFT).
- Kaiser's order formula is empirical: designs reach up to ≈1.1δ ripple, which the tests
  bound at 1.5δ rather than claiming δ exactly.
