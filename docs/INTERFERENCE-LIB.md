# Interference model library and classifier benchmark

`kshana interference-lib` generates calibrated synthetic interference in complex baseband, writes
a labelled dataset to files, and scores interference classifiers on it with a pre-registered
metric. Source: `src/interference_lib.rs`. MODELLED.

**Nothing radiates.** Every waveform is written to a file. The library has no transmit path, no SDR
output and no connection to a radio; the dataset exists to train and test detectors and
classifiers.

```
kshana interference-lib classes
kshana interference-lib generate --out ds/ --seed 1 --per-class 40 --samples 4096 --fs 4e6 --jn-min 0 --jn-max 20
kshana interference-lib baseline --dataset ds/ --out baseline.csv
kshana interference-lib score --dataset ds/ --predictions my-classifier.csv
```

## Library and calibration

Classes: `none` (noise only), `cw`, `chirp` (linear sawtooth sweep of 20 to 80 % of the band, 8 to
32 µs period), `pulsed` (pulsed CW, duty 5 to 30 %, repetition 64 to 512 samples),
`narrowband-noise` (a moving average of 8 to 32 samples, offset in frequency), `wideband-noise`
(white over the band), `multitone` (3 to 5 tones) and `fm-tone` (sinusoidal FM, deviation 5 to 25 %
of the band, rate 2 to 50 kHz). Each example is unit-power complex white Gaussian noise (the noise
floor `N = 1`) plus the interferer scaled so that its power while on equals `10^(J/N/10)`; for
`pulsed` that is the power within a pulse. The tests measure every class's interferer power and
find it within 0.05 dB of the stated J/N, and the noise within 2 % of unit power.

## Dataset

`generate` draws `--per-class` examples of every class with a seeded generator: J/N uniform in
`[--jn-min, --jn-max]` dB and the waveform parameters in the ranges above. Each example goes to the
`train` or `test` split by a hash of its id (`--test-share`, 0.5). Written to the output directory:

* `samples.cf32`: all examples back to back, interleaved little-endian f32 I/Q;
* `labels.jsonl`: per example `id`, `offset`, `len`, `class`, `jn_db`, `params`, `split`;
* `dataset.json`: schema `kshana.interference-dataset/1`, the settings, the classes and the
  SHA-256 of `samples.cf32` (checked on reading).

The same settings give the same bytes.

## Benchmark and its pre-registered metric

Predictions are a CSV `id,label`. `score` evaluates the **test split** only.

**Pre-registered primary metric: the macro-averaged F1 over the eight classes on the test split.**
It was fixed in the code and this page before any classifier was scored. A test example with no
prediction counts as wrong. The report also gives the confusion matrix (rows truth, columns
prediction), per-class precision, recall and F1, balanced accuracy, and accuracy per J/N bin
(0-5, 5-10, 10-15 and 15-20 dB).

## Baseline

A transparent rule-based classifier on six features: excess power over the noise floor, spectral
flatness and peak-to-median ratio of a 256-bin averaged spectrum, the share of occupied bins, the
envelope duty cycle, and the number of spectral peaks. The rules are in `baseline_classify`. It is a
floor that shows the harness works, not a product.

Recorded after one run on the default dataset (seed 1, 40 per class, 4096 samples, 4 MHz,
0-20 dB, 171 test examples): **macro-F1 0.528**, balanced accuracy 0.583. Per class F1: none 0.96,
cw 0.95, wideband-noise 0.69, multitone 0.65, fm-tone 0.45, narrowband-noise 0.36, chirp 0.16,
pulsed 0.00. Accuracy rises with J/N, from 0.41 (0-5 dB) to 0.64 (15-20 dB). The baseline was not
tuned after this run.
