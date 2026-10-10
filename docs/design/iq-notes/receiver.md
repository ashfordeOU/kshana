# Stream 3: acquisition and tracking (`iq::acq`, `iq::track`)

Branch: `claude/gnss-iq-receiver`. Files: `src/iq/acq.rs`, `src/iq/track/{mod,filter,discrim,cn0,channel,bank}.rs`,
`tests/iq_receiver.rs`, two `pub mod` lines in `src/iq/mod.rs`.

## What was built

- **`iq::acq`** — FFT parallel code-phase search for any `SpreadingCode`: per Doppler bin,
  carrier wipe-off, coherent folding of `N` code periods onto one, circular correlation by
  FFT against one sampled code period, non-coherent sum of `M` blocks. Symmetric Doppler
  grid at a chosen step. Reuses the crate's mixed-radix FFT (`portable_math::FftPlan`, the
  plan behind `acquisition::fft_forward`) and the square-law / Marcum-Q detector of
  `src/acquisition.rs` (`threshold_for_pfa`, `pd_square_law`); nothing duplicated. Reports
  code phase (chips) and lag, Doppler, normalised peak, peak-to-second-peak ratio,
  per-cell Pfa and threshold, and the whole grid. `acquire_source` reads from an
  `IqSource`; `predicted_pd` gives the analytic Pd of an aligned cell.
- **`iq::track`** — a tracking bank of N channels on one `IqSource`:
  - correlators E/P/L with configurable early-late spacing; replica from
    `SpreadingCode::value_at` at the exact (fractional) code phase every sample; carrier NCO
    phase carried in cycles and re-anchored every period;
  - carrier loop: PLL order 1/2/3, FLL order 1/2, FLL-assisted PLL (Ward); loop filters from
    `Bn` and the integration time `T` (Kaplan & Hegarty Table 5.6, bilinear integrators);
  - discriminators: PLL `atan2` (pilot), Costas `atan` and decision-directed (data); FLL
    decision-directed cross product, two-quadrant ATAN2, four-quadrant ATAN2 (pilot); DLL
    normalised early-minus-late power, dot product, early-minus-late envelope;
  - carrier aiding of the code loop (DLL order 1/2);
  - lock detectors: smoothed phase lock indicator (NBD/NBP) and code lock (NWPR C/N0
    threshold); C/N0 by NWPR and Beaulieu; bit synchronisation by histogram, after which
    integrations align to bit edges and may span several code periods;
  - per-update output `EpochOutput`: E/P/L, discriminators, Doppler, carrier phase, code
    rate, code phase, code-epoch receive time (fractional-sample), PLI, lock flags, both
    C/N0 estimates, bit edge and bit signs;
  - `LoopCore` (filters + discriminators without correlators) for studying loop designs on
    synthetic correlator outputs;
  - `replay(src, inits, configs, max_samples)`: one pass over a source through every loop
    design, results per design (identical to running each design alone, tested).

## CHANGELOG entry (for integration to merge)

```
### Added
- `iq::acq`: FFT parallel code-phase acquisition for any `SpreadingCode` with coherent
  (N periods) and non-coherent (M blocks) integration, a symmetric Doppler grid,
  peak-to-second-peak ratio, and the Marcum-Q threshold and Pd of `acquisition`.
- `iq::track`: multi-channel tracking bank on any `IqSource` — configurable DLL (EMLP,
  dot product, envelope), PLL (orders 1–3), FLL (orders 1–2), FLL-assisted PLL, Costas
  discriminators, carrier-aided code loop, fractional code NCO, Ward/Kaplan-Hegarty loop
  filters from Bn and T, phase/code lock detectors, NWPR and Beaulieu C/N0, histogram bit
  synchronisation, and `replay` of one recording through many loop designs.
```

## VALIDATION / verification-matrix entries (for integration to merge)

All MODELLED: checked against closed forms and the injected truth of seeded synthetic IQ,
not against an external receiver's output. Tests in `tests/iq_receiver.rs` unless noted;
measured values are from the committed seeds.

| Claim | Reference | Tolerance | Measured |
|---|---|---|---|
| FFT equals the defining DFT sum (N = 1…2048, radix-2, mixed, prime) | direct DFT | 1e-9 abs | pass |
| Acquisition finds injected code phase and Doppler (42 dB-Hz, on/off bin) | injected truth | ½ sample, ½ bin | pass |
| Noise-only cells average 2M; noise not acquired | χ²(2M) mean | 0.1 | pass |
| Empirical per-cell Pfa = 0.05 (4800 cells, M = 2) | `acquisition::threshold_for_pfa` | 4σ binomial | 0.0471 |
| Empirical Pd of aligned cell, 36 dB-Hz, M = 2 (300 trials) | `acquisition::pd_square_law` (Marcum Q) 0.523 | 4σ binomial | 0.527 |
| Loop Bn from coefficients (impulse response of the discrete loop, orders 1–3) | K&H Table 5.6 design Bn | 6 % at Bn·T ≤ 0.015 | 0.5–3.5 % |
| 2nd-order closed form Bn = ω0(1+4ζ²)/(8ζ) from the gains | Gardner closed form | 1e-3 | pass |
| Costas PLL thermal jitter, Bn 10 Hz, T 1 ms, 35/40 dB-Hz | K&H σ² = Bn/(C/N0)·(1+1/(2T·C/N0)) | 12 % in σ | +8 % / +2 % |
| DLL thermal jitter, Bn 1 Hz, d 0.5, 45 dB-Hz (EMLP, dot) | K&H closed forms | 15 % in σ | −3.5 % / −0.4 % |
| 2nd-order PLL steady-state error to a frequency ramp | θe = 2πR/ω0² | 1 % | < 1e-12 rel |
| 3rd-order PLL tracks the ramp with no steady-state error | type-3 loop | 1e-4 rad | pass |
| Costas tolerates 180° data flips; `atan2` PLL does not (45 dB-Hz) | phase error mod π < 0.2 rad | > 99.5 % / < 90 % | 100 % / 12.6 % |
| FLL-assisted PLL pulls in 60 Hz; FLL-only settles on frequency | injected truth | 0.05 Hz | pass |
| NWPR and Beaulieu unbiased at 35/45 dB-Hz (30 × 1 s) | injected C/N0 | 0.3 dB | 34.88/34.83, 45.02/44.89 |
| Full IQ tracking, 45 dB-Hz with data: Doppler, code epoch, bit edge, bits, C/N0 | injected truth | 1 Hz, 0.05 chip RMS, exact, exact, 1.5/3 dB | 0.02 Hz, 0.008 chip, ✓, ✓, 44.7/44.3 |
| Determinism (same seed, any chunking) and replay = individual runs | bit identity | exact | pass |

In-module unit tests (`cargo test --lib iq::`): Ward natural frequencies, DLL discriminator
slopes on the ideal triangle, Costas/atan2 bit-flip behaviour, FLL on a known rotation,
NWPR/PLI limits, histogram bit sync on clean data.

## C/N0 estimator limits (stated)

- **NWPR is unbiased on ideal prompts at any per-prompt SNR** `ρ = C/N0 · T` (Monte Carlo,
  K = 20: bias +0.02 dB, standard deviation 0.32 dB at 10 windows and 0.14 dB at the default 50).
  It reads low when the K-prompt coherent sum loses coherence, and its sensitivity grows with
  `ρ`: a 1° RMS phase wobble costs 0.06 dB at `ρ` = 32 (GPS L1 C/A) and 0.40 dB at `ρ` = 316
  (GPS L2C at 20 ms, BeiDou B1C at 10 ms). The tracking loop's own PLL jitter is such a wobble,
  so NWPR reads low by about **8 dB × Bn·T (fitted on one scene, four points)** (the ideal-loop value is 4.6 dB × Bn·T; the digital
  loop peaks more at Bn·T ≈ 0.1). Measured on the GPS L2C CM scene at 45 dB-Hz, T = 20 ms, with a
  pure second-order PLL (nominal 41.99 dB-Hz):

  | PLL Bn (Hz) | Bn·T | NWPR error (dB) |
  |---|---|---|
  | 1 | 0.02 | −0.24 |
  | 2.5 | 0.05 | −0.44 |
  | 5 | 0.1 | −0.77 |
  | 10 | 0.2 | −1.58 |

  The DLL bandwidth does not matter (0.5 and 2 Hz: 41.27 and 41.22 dB-Hz at 5 Hz PLL), and the
  M2M4 estimate does not move (42.71 to 42.72 dB-Hz in every row). A single 10-window estimate
  also scatters by about 0.3 dB. At the default `bn_t_max = 0.1` the NWPR therefore reads about
  1 dB low on a 10 to 20 ms code at 45 dB-Hz. The code-lock decision uses the NWPR C/N0 at
  26 dB-Hz, where the effect is negligible; a reader who wants an unbiased high-C/N0 figure
  should use M2M4, or the NWPR with a narrower PLL.
- **BOC(1,1) at 5 MS/s loses about 1 dB of prompt power to band-limiting.** For BeiDou B1C data
  the acquisition statistic is 413, 451, 508 and 523 at 5, 7.3, 10 and 20 MS/s, and M2M4 reads
  43.66, 44.25, 44.65 and 44.18 dB-Hz against 45 nominal. Both estimators see it. It is
  physical, not an estimator defect: use a higher rate (10 MS/s or more) to judge BOC C/N0.

## Limitations (stated)

- Point-sampled replica, no front-end filter or quantisation (stream 4); DLL scalings
  assume the ideal BPSK triangle, so on BOC or band-limited signals the code discriminator
  slope differs (still a monotonic error near zero).
- Acquisition: whole number of samples per code period required; no code-Doppler
  compensation across non-coherent blocks, no bit-edge handling inside a coherent block,
  no CFAR beyond sample-power normalisation.
- Tracking: scalar loops only (no vector tracking), no multipath-mitigating correlators, no
  navigation-message decoding beyond bit signs; C/N0 and PLI for a data signal become
  reliable only after bit sync; the Beaulieu estimator is biased high by about +0.5 in
  linear SNR, so it is fed bit-length prompts; FLL across the first (shorter) integration
  after bit sync uses unequal prompt lengths.
- `TrackingBank::run` and `replay` keep every `EpochOutput` in memory; use
  `TrackingBank::process` on chunks to stream hours-long recordings.
- No CLI/Python/WASM/MCP surface yet (integration's job per the plan).

### Known limitation: commensurate sampling

When the sample rate is an integer or half-integer multiple of the chip rate (2.046,
3.069 or 4.092 MHz for GPS L1 C/A), the samples fall on the same few chip phases in every
chip. The early and late correlators then see a staircase instead of the correlation
triangle, and the code discriminator's S-curve has flat steps. How much this hurts depends
on the early-late spacing `d`. Measured on a synthetic GPS L1 C/A signal at 45 dB-Hz
(1500 Hz Doppler, first-order 2 Hz DLL, 1 ms updates), against an incommensurate rate with
the same `d`:

- 2 samples/chip, d = 0.5: the S-curve is a single step and the DLL dithers bang-bang.
  Code tracking error is ≈ 0.09 chip RMS (≈ 26 m) with a −0.09 chip bias, against
  ≈ 0.003 chip at an incommensurate rate (about 30×). The correlation loss also makes the
  NWPR C/N0 read ≈ 2.4 dB low (42.6 for an injected 45 dB-Hz).
- 4 samples/chip depends on the code Doppler, which slides the sampling pattern along the
  chips. With d = 0.5 it matches the control at 1500 and 4000 Hz Doppler (0.88×, 1.0×). At
  0 Hz it is 2.0× with a +0.011 chip bias. With d = 0.25 or 0.1 the code error is
  8–10× the control at 1500 Hz, and at 0 Hz d = 0.25 holds a +0.125 chip bias.
- 8 and 16 samples/chip with d = 0.5 or 0.25 match the control at 1500 Hz. 6
  samples/chip is about 4×, and d = 0.1 is still 4–7× at 6 and 8 samples/chip.
- 2.5, 3 and 5 samples/chip are 4–8× the control at d = 0.5. At d = 0.1, every integer and
  half-integer rate from 2 to 5 is 6–12× the control.

The carrier loop is not affected. Recordings at such rates still acquire and track, but
their code-loop jitter, code bias and C/N0 should not be used to judge a design. Use a rate
that is not a multiple of half the chip rate for that, as real front ends usually do.
