<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Interference model library, reference fit and classifier benchmark

`kshana interference-lib` holds a parametric library of synthetic GNSS-band interference, a transparent
reference estimator that fits a library model to a recording and states how well the re-synthesised
spectrum matches it, a classifier-generalisation benchmark with in-distribution (ID) and
out-of-distribution (OOD) parts, and a cross-stage detection reference (the pre-correlation power rise
next to the post-correlation C/N0 loss of the same case).

**MODELLED.** Every number this page quotes comes from the synthetic library. A classifier's accuracy on
the corpus is not its accuracy on real captures, and no real capture is bundled (TEXBAT and JammerTest
recordings are not redistributed). `fit` is the tool for stating the residual on a real capture; until
such a comparison is published the library is MODELLED. Nothing here transmits: the generator writes
files for receiver and detector testing. It complements the closed-form jammer spectra of
`kshana spectrum` ([Spectrum](SPECTRUM.md)) and the measurement-domain impairment corpus of
`src/impairment_eval.rs`.

```
kshana interference-lib models
kshana interference-lib generate --class <none|cw|narrowband|wideband|chirp|pulsed> [--centre-hz <f>]
    [--bandwidth-hz <b>] [--period-s <t>] [--pulse-width-s <w>] [--jnr-db <j>] [--drift-hz-per-s <r>]
    [--triangle] [--fs <hz>] [--samples <n>] [--seed <s>] --out <base>
kshana interference-lib fit <recording.sigmf-meta> [--out <fit.json>]
kshana interference-lib bench [--per-class <n>] [--seed <s>] [--predictions <ids.csv>] [--out <bench.json>]
kshana interference-lib cases [--per-class <n>] [--seed <s>] [--out <cases.csv>]
```

Recordings are SigMF `cf32_le` pairs (`<base>.sigmf-meta`, `<base>.sigmf-data`). A generated
recording states its model and the MODELLED label in `core:description`.

## The library

Complex baseband at sample rate `fs`, unit-power complex Gaussian thermal noise plus one interferer
whose **average** power over the record is `JNR` (dB) above the noise power of the whole sampled band.

| Class | Model | Parameters |
|---|---|---|
| `none` | noise only | |
| `cw` | a tone, optionally drifting linearly | centre, drift (Hz/s) |
| `narrowband` | band-limited Gaussian noise (ideal brick-wall in the transform domain), occupied band under 1 MHz | centre, bandwidth |
| `wideband` | the same, 1 MHz or wider | centre, bandwidth |
| `chirp` | linear frequency sweep, phase-continuous, sawtooth or triangle | centre, swept bandwidth, period |
| `pulsed` | DME-like Gaussian pulse pairs, 12 µs pair spacing, optional spacing jitter | carrier offset, pulse width (amplitude FWHM), repetition period |

## The reference fit (`interference-lib/v1`)

From the recording alone:

1. a Welch spectrum (512-point Hann, 50 % overlap) and its noise floor: the 20th percentile, then the
   median of the bins under twice the floor, iterated four times;
2. the **power rise** (total power over the floor, dB), the largest excess, the occupied band (bins 3 dB
   over the floor), the power-equivalent bandwidth (excess power over the median excess level, which is
   insensitive to window leakage at the band edges), the excess centroid and the fraction of the excess in
   the three bins around the peak;
3. a short-time peak track (64-point transforms on consecutive blocks): the fraction of steps whose
   peak move is within one bin of the median move (a chirp's peak moves by a steady step, band noise's
   jumps), and the mean steady move as a sweep rate;
4. a block-power envelope (16-sample blocks): the fraction of blocks over ten times the median block
   power, the peak-to-average ratio, and the run lengths and pair repetition period.

Classification thresholds, fixed for `v1`: `none` under 0.4 dB of power rise and 4 dB of largest excess;
`pulsed` when some, but under 30 %, of the blocks are ten times the median and the peak block is 12 dB
over the mean; `cw` when the three bins around the peak hold 85 % of the excess; `chirp` when the peak
track is steady (over 0.6) across an occupied band of at least 1.5 MHz; otherwise `narrowband` under
1 MHz of occupied band and `wideband` above.

The fitted parameters: JNR from the power rise; the tone frequency from the peak bin; the noise bandwidth
from the power-equivalent bandwidth; the chirp period as that bandwidth over the sweep rate; the pulse
period from the envelope and the pulse width from the second moment of the excess spectrum (a Gaussian
pulse of amplitude FWHM `w` has a Gaussian power spectrum of standard deviation `1/(2·√2·π·σ)`,
`w = 2·√(2 ln 2)·σ`). The fitted model is re-synthesised at the same rate and length and the **fit
residual** is the RMS of the dB difference of the two Welch spectra over all bins. On library recordings
of 65,536 samples at 12 dB JNR the residual is 0.4 to 0.5 dB for every class (`tests/interference_lib.rs`).

The **post-correlation C/N0 loss** is for GPS L1 C/A at the band centre: the spectral separation of the
estimated interference spectrum (excess over the floor) with the unit-area `sinc²` spectrum of the
1.023 Mchip/s code, `ΔC/N0 = 10·log10(1 + ∫S_J·G_s df / N0)` (Betz, ION NTM 2001). A unit test checks a
centred tone against the closed form `10·log10(1 + J/(N0·R_c))`.

## The benchmark

`bench` draws `per-class` ID and `per-class` OOD cases of every class (16,384 samples at 10 MHz, seeded)
and fits each one. Parameter ranges (`kshana interference-lib models` prints them):

| | ID | OOD |
|---|---|---|
| JNR | 5 to 20 dB | 0 to 5 dB |
| `cw` | centre within ±3 MHz | and drifting up to ±200 kHz/ms |
| `narrowband` / `wideband` | 0.1 to 0.8 MHz / 1.5 to 4 MHz | same, lower JNR |
| `chirp` | sawtooth, 2 to 4 MHz over 20 to 100 µs | triangle sweep |
| `pulsed` | 2.5 to 4.5 µs pulses every 200 to 500 µs | pair spacing jittered up to 30 % |

The document `kshana.interference-bench/1` (label MODELLED) gives, for the reference classifier and for
external predictions when `--predictions` names a CSV with `id` and `class` columns, the accuracy,
per-class recall and confusion counts of each part, the **generalisation gap** (ID minus OOD accuracy),
and one cross-stage row per case: JNR, pre-correlation power rise, post-correlation C/A C/N0 loss and fit
residual. `cases` writes the corpus (ids, labels, parameters and seeds) as CSV so an external classifier
can draw the same recordings with `generate`.

With `--per-class 20 --seed 1` the reference classifier scores 0.99 ID and 0.78 OOD (gap 0.21): the
drifting tones and a share of the triangle sweeps leave its fixed thresholds. That gap is the point of
the benchmark, measured on the library; it says nothing yet about real captures.

## Not built here

The privacy-preserving collaborative-sensing study named in the backlog item is a study, not a tool, and
is not part of this command.

## Tests

`tests/interference_lib.rs`: the fit recovers each class and its parameters and re-synthesises the spectrum
within 1.5 dB; the benchmark scores ID, OOD and an external classifier, deterministically; malformed
predictions are rejected; the command line writes SigMF, fits it and lists the corpus. Unit tests in
`src/interference_lib.rs`: noise-only has unit power and no rise, the JNR sets the interference power, and
the C/A loss of a centred tone matches the closed form.
