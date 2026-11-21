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
kshana interference-lib generate --class <none|cw|narrowband|wideband|chirp|pulsed|multitone|fm_tone>
    [--centre-hz <f>] [--bandwidth-hz <b>] [--period-s <t>] [--pulse-width-s <w>] [--jnr-db <j>]
    [--drift-hz-per-s <r>] [--triangle] [--tones-hz <f1,f2,...>] [--deviation-hz <d>] [--mod-freq-hz <m>]
    [--fs <hz>] [--samples <n>] [--seed <s>] --out <base>
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
| `multitone` | equal-power tones with random phases (one tone at the centre when no list is given) | tone frequencies (`--tones-hz`) |
| `fm_tone` | a tone frequency-modulated by a sinusoid: phase `2π·fc·t + (Δf/fm)·sin(2π·fm·t + φ)`, constant envelope | centre, peak deviation `Δf`, modulating frequency `fm` |

## The reference fit (`interference-lib/v2`)

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
   power, the peak-to-average ratio, and the run lengths and pair repetition period;
5. isolated spectral peaks (Welch bins over ten times the floor and ten times the mean of the bins three
   and four away on each side, at least three bins apart, at most eight) and the fraction of the excess
   in the three bins around them;
6. the coefficient of variation of the sample power `|x|²` (1 for Gaussian noise of any band; a
   constant-envelope interferer of power `J` over unit noise gives `√(2J+1)/(J+1)`, 0.65 at 5 dB);
7. the track symmetry (the smaller over the larger of the median upward and downward peak-track moves:
   near 1 for a sinusoidal swing or a triangle sweep, small for a sawtooth) and the oscillation
   frequency of the track about its mean.

Classification thresholds, fixed for `v2` (the `v1` rules, in the same order, with two added): `none`
under 0.4 dB of power rise and 4 dB of largest excess; `pulsed` when some, but under 30 %, of the blocks
are ten times the median and the peak block is 12 dB over the mean; `cw` when the three bins around the
peak hold 85 % of the excess; **`multitone`** when there are at least two isolated peaks and the bins
around them hold 80 % of the excess; **`fm_tone`** when the power's coefficient of variation is under
0.75 and the track symmetry over 0.5; `chirp` when the peak track is steady (over 0.6) across an occupied
band of at least 1.5 MHz; otherwise `narrowband` under 1 MHz of occupied band and `wideband` above.

The fitted parameters: JNR from the power rise; the tone frequency from the peak bin; the noise bandwidth
from the power-equivalent bandwidth; the chirp period as that bandwidth over the sweep rate; the pulse
period from the envelope and the pulse width from the second moment of the excess spectrum (a Gaussian
pulse of amplitude FWHM `w` has a Gaussian power spectrum of standard deviation `1/(2·√2·π·σ)`,
`w = 2·√(2 ln 2)·σ`); the multitone frequencies from the isolated peaks; the FM deviation as half the
distance between the strongest occupied bin on each side of the centroid (a wide FM tone's spectrum
peaks just inside `±Δf`) and the modulating frequency from the track oscillation. The fitted model is re-synthesised at the same rate and length and the **fit
residual** is the RMS of the dB difference of the two Welch spectra over all bins. On library recordings
of 65,536 samples at 12 dB JNR the residual is under 1.5 dB for every class, the test's bound
(`tests/interference_lib.rs`).

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
| `multitone` | 3 to 5 tones within ±3 MHz, at least 100 kHz apart | 6 to 8 tones |
| `fm_tone` | 0.2 to 1 MHz deviation at 2 to 50 kHz (wide FM, a continuous band) | 0.1 to 0.3 MHz at 50 to 200 kHz (discrete sidebands) |

The document `kshana.interference-bench/1` (label MODELLED) gives, for the reference classifier and for
external predictions when `--predictions` names a CSV with `id` and `class` columns, per part:

* the **pre-registered primary metric**: the macro-averaged F1 over the eight classes (`macro_f1`; a
  missing prediction counts as wrong). It was fixed before any scores were looked at, and it is the
  number to compare classifiers by;
* accuracy, balanced accuracy, and per-class precision, recall and F1;
* the confusion counts;
* accuracy and macro-F1 per JNR bin (0–5, 5–10, 10–15 and 15–20 dB; `none` cases are outside the bins).

Across the parts it gives the **generalisation gap** (ID minus OOD accuracy, and `macro_f1_gap` for the
macro-F1),
and one cross-stage row per case: JNR, pre-correlation power rise, post-correlation C/A C/N0 loss and fit
residual. `cases` writes the corpus (ids, labels, parameters and seeds) as CSV so an external classifier
can draw the same recordings with `generate`.

With `--per-class 20 --seed 1` (eight classes, recorded on 21 November 2026 after adding `multitone`
and `fm_tone`) the `v2` reference classifier scores:

| Part | Accuracy | Macro-F1 |
|---|---|---|
| ID | 0.99 | 0.99 |
| OOD | 0.69 | 0.64 |

The gaps are 0.30 in accuracy and 0.36 in macro-F1. Both new classes are recognised in every ID case.
Out of distribution:

* No drifting tone is called `cw` (15 are read as `narrowband`, 5 as `fm_tone`).
* 11 of the 20 triangle sweeps are read as `fm_tone`: a symmetric swing of the peak track is all the
  FM rule sees, and it cannot tell a triangle sweep from a sinusoidal modulation.
* The low-index FM tones split between `fm_tone` (6), `multitone` (6: their sidebands are discrete
  lines) and `narrowband` (8).

(The `v1` classifier on the six-class corpus scored 0.99 ID and 0.78 OOD. The corpora differ, so the
two figures are not comparable.) The gap is the point of the benchmark, measured on the library; it
says nothing yet about real captures.

## Not built here

The privacy-preserving collaborative-sensing study named in the backlog item is a study, not a tool, and
is not part of this command.

## Tests

`tests/interference_lib.rs`: the fit recovers each class and its parameters (the multitone frequencies
within 20 kHz, the FM deviation within 150 kHz) and re-synthesises the spectrum within 1.5 dB; the
benchmark scores ID, OOD and an external classifier, deterministically, with the macro-F1 of an
always-`wideband` classifier equal to the hand-computed 1/36 and the JNR bins holding the right cases; malformed
predictions are rejected; the command line writes SigMF, fits it and lists the corpus. Unit tests in
`src/interference_lib.rs`: noise-only has unit power and no rise, the JNR sets the interference power, and
the C/A loss of a centred tone matches the closed form.
