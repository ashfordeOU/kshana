<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D14 (0.41), part 2: spectrum bands, re-run plan

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.** Numbers marked *proposed* are new; every other number is a bar of
[`PREREGISTRATION.md`](PREREGISTRATION.md) in this directory and is not changed.

## Why this row

Ledger row `VM-23e52907` (spectrum model: GLONASS, BeiDou and Galileo E6 bands). Two bars are **NOT MET**
([`RESULTS.md`](RESULTS.md)):

- **S2:** the unit-area density integrates to 1 within 1e-3 over +/- 50 chip rates. Finding F1: the bar is unattainable
  as written, since a unit-area BPSK density keeps about 1 / (50 pi^2) = 2.03e-3 of its power outside that span (0.990 for
  B1C's MBOC).
- **S3:** the IQ layer's waveforms against the model envelope, mean per-bin |difference| at most 0.5 dB over the main
  lobe: B1I 1.260 dB and B1C 1.560 dB (GLONASS L1OF 0.074 dB, met). Finding F2: Gold and Weil codes have uneven line
  spectra, which a smooth envelope does not have.

## S2 and S3: re-run as regressions only

Neither miss is caused by something a change could fix without changing the question:

- S2 as written is false for any correct unit-area density. Re-running it repeats the miss.
- S3 compares a periodic code's line spectrum with a smooth envelope; a longer record or other seeds do not remove the
  lines.

Both are re-run on the 0.41 code with the registered settings (16 MS/s, 30 ms) as regressions, expected to reproduce
the recorded numbers to 1e-6 dB, and stay NOT MET.

## New bar S3L: the waveform against its own code's line spectrum (*proposed*)

The question S3 could not ask: does the IQ layer generate the spectrum that its code actually has?

- **Reference:** for each signal, the expected power spectral density of the generated baseband signal computed from
  the code itself: the DFT of the code's periodic autocorrelation (one code period, including tiered or secondary codes
  where the signal has them), convolved with the chip pulse shape, and with data-bit modulation as the IQ layer applies it.
  It is computed by an independent numpy script from the ICD code definitions (the same ICDs as the original file), not
  from engine output.
- **Comparison:** the IQ layer's waveform, the registered sample rate and length, the registered Welch settings, over
  the main lobe, excluding bins within 2 % of the lobe's width of a null (as S3).
- **Bar (*proposed*):** mean per-bin |difference| at most **0.5 dB** (S3's own level) for GLONASS L1OF, BeiDou B1I and
  B1C (data).
- **Meaning:** met would say the IQ layer generates its codes' true spectra and that S3's miss is entirely the envelope's
  smoothness. It would not change S3 or S2, and it says nothing about recorded IQ or intra-system interference.

## Owner decisions at sign-off

1. Accept that S2 and S3 stay NOT MET permanently (re-run as regressions only).
2. The S3L bar.

## Sign-off (3 November 2026)

Signed as proposed: S2 and S3 are re-run as regressions and stay NOT MET; S3L ≤ 0.5 dB is the new bar.
