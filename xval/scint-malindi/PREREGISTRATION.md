# Pre-registration: the IQ Cornell scintillation model against measured 50 Hz GPS L1 data

Committed alone, before the comparison is run. It fixes the data, the processing, the
statistics, the bars and what counts as a finding. Bars may be tightened later, never
loosened; a miss is recorded with its numbers and the ledger row stays MODELLED.

## Unit under test

`kshana::iq::channel::scint` (the Cornell scintillation model: `z = ẑ + ξ`, Rice intensity,
second-order Butterworth spectrum, phase `arg z`, no extra phase term), as committed at
release/0.36.0-rc @ c9e37402. The model takes two inputs, S4 and τ0. The check compares
statistics the model **generates beyond those inputs** with the same statistics measured.

## Data (the oracle, Measured kind)

- Zenodo **record 16941224**, doi 10.5281/zenodo.16941224, "Dataset of raw
  samples from the GNSS PolaRx5S receiver in Malindi referring to the ionospheric
  scintillation event recorded by satellite G26 on 18 March 2023" (INGV, NORISK project,
  Broglio Space Centre, Malindi, Kenya, lat −3°, lon 40.2°). Equatorial plasma bubble
  scintillation, 50 Hz samples of carrier phase and prompt I and Q, GPS PRN 26.
- Licence: Creative Commons Attribution 4.0 International (cc-by-4.0), stated on the
  record's landing page https://zenodo.org/records/16941224 and in its API metadata
  https://zenodo.org/api/records/16941224 (checked 2026-10-12).
- File used: `data_f1.txt` (GPS L1 only), 66 434 603 bytes, 1 415 293 lines,
  md5 c3e1268be3a5437c35ecbb525c8122fe (as published by Zenodo),
  SHA-256 4934ab9ab9d37a14fae0f3dc15aa0e00f848a5f3738d9f46da1445db5fadc7ef.
  `data_f2.txt` (L2) is not used.
- Columns: `tow svid carrier_phase I Q time` (space separated, one header line); carrier phase
  in cycles.
- What has been looked at before this commit: the record's metadata, and the first 5 and the
  last 2 lines of `data_f1.txt` to learn the format. No statistic of the data has been
  computed.

## Processing (identical for measured data and model output)

1. **Segments.** Consecutive samples whose `tow` differs by 0.02 s ± 0.001 s form a segment; any
   other step starts a new one. Lines that do not parse are counted and skipped. Segments
   shorter than 300 s are dropped.
2. **Signal intensity** `SI = I² + Q²`. **Detrended intensity** `Id = SI / LP(SI)`, where `LP` is
   a causal 6th-order Butterworth low-pass at 0.1 Hz (bilinear transform with pre-warping at
   50 Hz, three cascaded biquads), started from the first sample's value as steady state.
3. **Phase** `φ = 2π·(carrier_phase − carrier_phase[0])` (rad). **Detrended phase**
   `φd = HP(φ)`, a causal 6th-order Butterworth high-pass at 0.1 Hz (same construction),
   started from rest.
4. The first 120 s of every segment are discarded (filter transient). The rest is cut into
   non-overlapping 60 s windows of 3000 samples from that point; a partial last window is
   dropped.
5. **Per window:** `S4 = sqrt(<Id²> − <Id>²)/<Id>`; `σφ` = standard deviation of `φd`;
   `τI` = the 1/e lag of the normalised autocovariance of `Id` (mean removed, biased
   estimator over the window), linearly interpolated between the lags that bracket it,
   searched up to 500 lags (10 s).
6. **Qualifying windows:** `0.3 ≤ S4 ≤ 1.0`, `τI` found, and no cycle slip, meaning
   `max |φd[k+1] − φd[k]| < π` in the window.

## Model runs

For each qualifying window `w` (indexed in time order from 0):

- `S4_model = S4_w` (measured), and `τ0` chosen so that the model's **intensity** 1/e lag equals
  the measured `τI`. With `P = 1 − sqrt(1 − S4²)`, `ẑ² = 1 − P` and `ρ` the normalised
  autocorrelation of each quadrature of `ξ`, the Rice intensity autocovariance is
  `(2ẑ²Pρ + P²ρ²)/(2ẑ²P + P²)`. Set it to `1/e`, solve the quadratic for `ρ*`, solve
  `e^{−x}(cos x + sin x) = ρ*` for `x`, and `τ0 = τI · 1.2396464368/x`.
- 10 realisations, `Scintillation::new(ScintParams::new(S4_w, τ0), seed = 1000·w + r)`,
  `r = 0..9`, satellite 1, sampled at 50 Hz for 180 s from t = 0. Intensity `amplitude²`,
  phase `phase_rad`, run through steps 2 to 5 as one 180 s segment (so the window is the last
  3000 samples after the 120 s guard). No receiver noise is added to the model.

## Statistics and bars

- **N1 (non-vacuity):** at least 20 qualifying windows, at least 200 measured samples with
  `Id < 0.1`, and at least 50 measured fades (B4).
- **B1, deep-fade probability:** pooled fraction of samples with `Id < 0.1` (−10 dB). Bar:
  `F_model / F_meas ∈ [0.5, 2.0]`.
- **B2, intensity distribution:** two-sample Kolmogorov–Smirnov distance between the pooled
  measured `Id` of all qualifying windows and the pooled model `Id` of all their
  realisations. Bar: `D ≤ 0.05`.
- **B3, phase scintillation tied to S4:** per window, `σφ_meas / σφ_model` with `σφ_model` the
  mean over the 10 realisations. Bar: the median over windows `∈ [2/3, 3/2]`.
- **B4, fade duration:** a fade is a maximal run of consecutive samples with `Id < 0.1` inside a
  window; its duration is its length × 0.02 s. Bar: mean model fade duration / mean measured
  fade duration `∈ [2/3, 3/2]`.

**Verdict.** The row is VALIDATED only if N1 and B1 to B4 all pass. Any miss is a FINDING with
its numbers; the row stays MODELLED. If N1 fails the comparison is vacuous and is reported as
such.

## Disclosed limitations (fixed now, not tuned afterwards)

- One satellite, one night, one equatorial station, one receiver: not a general validation of
  the model at high latitude or for other receivers.
- The measured I and Q are post-PLL 20 ms correlator outputs: they carry thermal noise and any
  tracking stress or data-bit edge the receiver did not remove; the model output is noise-free.
- The phase comparison uses the receiver's carrier-phase observable, which contains
  refractive (large-scale) phase fluctuations above 0.1 Hz that the Cornell model's `arg z`
  does not represent (the model's optional extra phase term is off).
- The data is not vendored in full; a test-time fetch checks the SHA-256 above.
