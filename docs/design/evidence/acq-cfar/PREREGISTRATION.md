# Cell-averaging CFAR option in IQ acquisition: pre-registration

Item PRO-37 ("a CA-CFAR detector option and a test on noise-free 2-bit input; oracle: closed-form
CA-CFAR Pfa"). Written and committed **before** any of the code below exists and before any run.
The bars may be tightened after a run, never loosened. A miss is recorded in `RESULTS.md` with
its numbers and kept as a test marked `#[ignore = "FINDING …"]`.

## The change (additive)

A new detector in `iq::acq` that works on the normalised grid an existing search already
returns (`AcqGrid`). Nothing existing changes:
- `AcqConfig`, `AcqResult`, `acquire` and every existing output stay byte-identical;
- the sample-power (`σ²`) detector stays the default.

**Cell under test.** A cell `X` at Doppler bin `j` and lag `ℓ` is compared with the mean `Z/N`
of `N` reference cells in the same Doppler row:
- `N/2` on each side, starting `g` guard lags away from the cell;
- spaced `s` lags apart, so that under noise alone the reference cells and the cell are close
  to independent: `s` = ceil(samples per chip) + 1, the code's autocorrelation main lobe plus
  one sample;
- lags wrap around the period (circular correlation).

**Decision.** `X > α·Z/N`. The factor `α` is set from the requested per-cell false-alarm
probability by the closed form below. The search decision tests the grid's peak cell against
its own threshold.

**Closed form.** Under noise alone each cell, after the non-coherent sum of `M` blocks, is
`Gamma(M, θ)` with unknown scale `θ`. The scale cancels in `X/Z`. With `t = α/N`:

```
Pfa(α; N, M) = Σ_{k=0}^{M−1} C(NM + k − 1, k) · t^k / (1 + t)^{NM + k}
```

For `M = 1` this is the textbook `(1 + α/N)^(−N)`. The factor `α` is found by bisection.

## Bars

- **C1 (the closed form).** Monte Carlo of the exact model: independent `Gamma(M)` cell and
  `Gamma(NM)` reference sum. For `M ∈ {1, 2, 4}`, `N ∈ {8, 16, 32}` and design `Pfa ∈ {1e-2,
  1e-3}`, with 2·10⁶ seeded trials each, the measured rate is within 3 binomial standard
  deviations of `Pfa`, `|p̂ − Pfa| ≤ 3·sqrt(Pfa(1 − Pfa)/n)`, in every case.
- **C2 (on the IQ chain, Gaussian noise).**
  - Input: complex white Gaussian noise only, at 2.5 MS/s.
  - Search: GPS L1 C/A PRN 1, `N = 1` coherent period, `M ∈ {1, 4}`, ±5 kHz at 500 Hz.
  - Detector: `N_ref = 16`, `g = 2` guard lags, design per-cell `Pfa = 1e-2`.
  - Every cell of the grid is tested, over enough seeded searches for at least 2·10⁵ cell tests
    per `M`.
  - Bar: the per-cell false-alarm rate is within **±20 %** of `1e-2`. The margin covers the
    residual dependence of neighbouring tests that share reference cells.
- **C3 (2-bit quantised noise).** As C2, with each I and Q sample quantised to 2 bits (levels
  ±1, ±3, decision threshold at the noise standard deviation) before the search. Same bar,
  ±20 % of `1e-2`, for both `M`.
- **C4 (noise-free 2-bit signal).**
  - Input: one GPS L1 C/A signal (PRN 1, Doppler +1250 Hz, code phase 300.25 chips) with no
    noise, quantised to 2 bits as in C3, 2.5 MS/s, `M = 1`; the search as in C2 at design
    `Pfa = 1e-3`.
  - The CA-CFAR search detects; its peak is in the bin nearest +1250 Hz and within one sample of
    the true code phase.
  - Over the cells of the peak's row, excluding the peak's own code-phase neighbourhood (±2
    samples), the fraction above the CFAR threshold is at most 1e-2. The σ²-normalised
    detector's statistic and its count of cells above its own threshold are reported, not
    graded.
- **C5 (scale invariance).** Multiplying the input of C2 (`M = 1`, one seed) by 7.0 leaves every
  CA-CFAR decision of the grid unchanged.

## Out of scope

Ordered-statistic and greatest-of CFAR variants, two-dimensional (Doppler × lag) reference
windows, and any change to the tracking hand-off's detector.
