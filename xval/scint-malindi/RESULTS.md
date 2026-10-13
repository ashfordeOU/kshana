# The IQ Cornell scintillation model against measured 50 Hz GPS L1 data: results

Pre-registration: `PREREGISTRATION.md` (committed at `b6ccb499`, before any statistic of the
data was computed). The bars were not changed. **Verdict: FINDING.** N1, B2 and B3 are met; B1
and B4 are missed. The row stays MODELLED.

Reproduce:

```
scripts/fetch_scint_malindi.sh            # Zenodo 16941224 data_f1.txt, SHA-256 checked
cargo test --release --test iq_scint_malindi_measured -- --include-ignored --nocapture
```

Data: Zenodo record 16941224 (INGV, NORISK project, Malindi, Kenya, 18 March 2023, GPS PRN 26),
`data_f1.txt`, CC BY 4.0. The SHA-256 matches the registration (`4934ab9a…`). The file has
1 415 292 samples (0 unparsed lines) in 2 segments, which give 467 windows of 60 s.

## Registered results (run 2026-10-13)

| Check | Measured | Model | Statistic | Bar | Result |
|---|---|---|---|---|---|
| N1 non-vacuity | 22 qualifying windows, 669 samples below −10 dB, 76 fades | | | ≥ 20, ≥ 200, ≥ 50 | **MET** |
| B1 deep-fade fraction | 0.0101 | 0.0241 | ratio 2.379 | [0.5, 2.0] | **NOT MET** |
| B2 intensity distribution | | | KS D 0.0415 | ≤ 0.05 | **MET** |
| B3 phase tied to S4 | | | median σφ ratio 0.779 | [2/3, 3/2] | **MET** |
| B4 fade duration | 0.176 s | 0.618 s | ratio 3.511 | [2/3, 3/2] | **NOT MET** |

Context, not gated:
- Of the 467 windows, 2 met the S4 and τI conditions but were rejected for a cycle slip.
- Median measured S4 0.51, median intensity 1/e lag 1.29 s.

**Finding F1.** At the measured S4 and decorrelation time, the model fades more often (2.4 times
the measured fraction below −10 dB) and much longer (3.5 times the mean duration) than this
night's data. The registered disclosures name causes that act this way, but none is tested here:
- The measured I and Q are post-PLL 20 ms correlator outputs with thermal noise. Noise fills
  the deepest fades and splits long fades into short ones, and the model output is noise-free.
- One satellite on one night: an equatorial plasma bubble need not follow the Cornell model's
  Rice statistics and second-order Butterworth spectrum.

Nothing was tuned. The registered test is kept as written and ignored with this finding;
`finding_model_fades_are_deeper_and_longer_than_measured` pins the numbers.

## Harness self-check and finding F2 (the model phase is wrapped)

The harness came with a self-check: model output, treated as measured data, should pass every
bar against the model. It does not, for a reason found in this run. The model's `phase_rad` is
the wrapped `atan2` in (−π, π]. The registered processing feeds it to the phase high-pass as it
is, while the measured carrier phase is continuous. Every wrap is then a 2π step: 5 of the 32
self-check windows read as cycle slips, and σφ_model is inflated.

- The self-check is kept as written and ignored (finding F2).
- A variant with the model phase unwrapped passes N1 and every bar, with no window read as a
  slip (`model_data_with_unwrapped_phase_passes_its_own_bars`). So the rest of the harness is
  consistent with the model.
- **POST HOC, NOT GATING:** B3 repeated with the model phase unwrapped gives a median ratio of
  0.804, against 0.779 as registered. B3's verdict does not depend on the wrap.
  (`posthoc_b3_with_the_model_phase_unwrapped`)
- B1, B2 and B4 use intensity only and are unaffected.

**Context for B1.** In the self-check, model data against the model gives a B1 ratio of 1.55
(unwrapped phase) and 1.92 (wrapped), not 1. Windows are selected and the model is driven by
each window's noisy S4 estimate, and the fade fraction is steep in S4, so the harness biases
B1 upward. Part of the measured 2.38 may be this bias. The B4 ratio in the self-check is 1.08 to
1.22, so the measured 3.51 is not explained by it. The bar is not changed.

## Not covered

Other nights, stations, latitudes, satellites or signals; L2 (`data_f2.txt` is not used);
receiver noise in the model.
