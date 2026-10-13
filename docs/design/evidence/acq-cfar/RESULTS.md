# Cell-averaging CFAR option in IQ acquisition: results

Pre-registration: `PREREGISTRATION.md` (committed at `3724aefa`, before the code existed). The
bars were not changed.

Reproduce with `cargo test --release --test iq_acq_cfar -- --include-ignored --nocapture`.

Two choices the pre-registration left open were fixed before the first run and are stated in
the test header:
- the C4 signal amplitude is 2.0 per component against the quantiser threshold 1.0, so both
  levels occur;
- +1250 Hz lies exactly half-way between the 1000 and 1500 Hz bins, so either counts as nearest.

## Summary

| Bar | Result |
|---|---|
| C1 closed form vs Monte Carlo of the exact model | **MET**, 18 of 18 cases within 3σ |
| C2 Gaussian noise on the IQ chain | **MET**: 0.977 % (M = 1), 0.969 % (M = 4), bar 1 % ± 20 % |
| C3 2-bit quantised noise | **MET**: 1.006 % (M = 1), 0.999 % (M = 4) |
| C4 noise-free 2-bit signal | **NOT MET** (finding F1) |
| C5 scale invariance | **MET**: 0 of 52 500 decisions change with the input × 7 |

## C1

2·10⁶ seeded trials per case; `α` from the closed form.

| M | N | α at 1e-2 | measured | α at 1e-3 | measured |
|---|---|---|---|---|---|
| 1 | 8 | 6.2262 | 1.0031e-2 | 10.9710 | 9.825e-4 |
| 1 | 16 | 5.3363 | 9.9995e-3 | 8.6388 | 9.855e-4 |
| 1 | 32 | 4.9530 | 1.0019e-2 | 7.7100 | 9.590e-4 |
| 2 | 8 | 3.9695 | 9.944e-3 | 6.0145 | 1.0135e-3 |
| 2 | 16 | 3.6273 | 9.9515e-3 | 5.2601 | 9.600e-4 |
| 2 | 32 | 3.4692 | 1.0098e-2 | 4.9257 | 1.0085e-3 |
| 4 | 8 | 2.8027 | 1.0086e-2 | 3.8242 | 1.005e-3 |
| 4 | 16 | 2.6532 | 9.8095e-3 | 3.5332 | 1.0315e-3 |
| 4 | 32 | 2.5813 | 9.9675e-3 | 3.3966 | 9.930e-4 |

The 3σ bound is 2.1e-4 at 1e-2 and 6.7e-5 at 1e-3.

## C2 and C3

The search: GPS L1 C/A PRN 1, 2.5 MS/s, ±5 kHz at 500 Hz (21 bins × 2500 lags). The detector:
16 reference cells, 2 guard lags, stride 4 lags, design 1e-2.

| input | M | cells tested | false alarms | rate |
|---|---|---|---|---|
| Gaussian | 1 | 210 000 | 2052 | 0.977 % |
| Gaussian | 4 | 210 000 | 2034 | 0.969 % |
| 2-bit | 1 | 210 000 | 2112 | 1.006 % |
| 2-bit | 4 | 210 000 | 2097 | 0.999 % |

The rate holds on 2-bit quantised noise, where the sample-power normalisation mis-states the
cell noise. That is the case the option exists for.

## C4 and finding F1

On a noise-free 2-bit signal (Doppler +1250 Hz, code phase 300.25 chips):
- **Met:** the CA-CFAR search detects (peak 1042.5 times its reference mean, against α = 8.64);
  its peak is in the +1000 Hz bin and 0.103 chip from the true code phase (bar: one sample,
  0.409 chip).
- **Not met:** 32 of the 2495 off-peak cells of the peak's row (1.28 %, bar 1 %) exceed the CFAR
  threshold.

The exceedances sit in short runs at fixed lags from the peak (±357, ±408, ±914, ±1099 samples
and a few others). These are the C/A code's deterministic correlation sidelobes at a 250 Hz
Doppler offset. Without noise they stand above a floor made of other sidelobes, which is not the
exponential cell distribution the closed form assumes. The CFAR false-alarm guarantee holds for
noise-dominated cells (C2, C3), not for a noise-free signal's sidelobe structure.

For context, reported and not graded: the σ²-normalised detector's statistic is 3102.4 against
its threshold of 35.6, with 4 cells of that row above it.

Nothing was tuned. The registered C4 test is kept and ignored with this finding;
`finding_noise_free_sidelobes_exceed_the_cfar_rate` pins the numbers.

## Not covered

Ordered-statistic and greatest-of CFAR variants, two-dimensional reference windows, band-limited
front ends, and the tracking hand-off's detector (unchanged).
