# GLONASS, BeiDou and Galileo E6 bands in the spectrum model: results

Pre-registration: `PREREGISTRATION.md` (committed at `5806f28b`, before the code existed). The
bars were not changed.

Reproduce with `cargo test --release --test spectrum_more_bands -- --nocapture`.

The S3 sample rate and length (16 MS/s, 30 ms) were fixed before the first run, within the
registered limits, and are stated in the test header.

## Summary

| Bar | Result |
|---|---|
| S1 transcription: carriers, chip rates and received powers of every new name, all 28 GLONASS channels | **MET** |
| S2 closed-form PSD: BPSK first nulls at the chip rate, B1C = Galileo E1 | **MET** |
| S2 closed-form PSD: unit area within 1e-3 over ±50 chip rates | **NOT MET** (finding F1: the bar is unattainable as written) |
| S3 the IQ layer's waveforms against the model, mean per-bin \|Δ\| ≤ 0.5 dB | **NOT MET** for B1I and B1C; met for GLONASS L1OF (finding F2) |
| S4 C/N0 by the SSC equals `jamming::effective_cn0_dbhz` with Q = 1/(R_c κ) | **MET** (worst difference 0 dB) |
| S5 additivity | **MET** |

S5 details:
- the six `spectrum`-kind scenarios give byte-identical `result.json` before and after;
- the spectrum lib tests, `leo_signal`, `registry_golden`, `cross_platform_golden` and `golden`
  pass unchanged;
- the default band set `BAND_NAMES` is unchanged.

## Finding F1: the S2 area bar cannot be met as written

A unit-area density puts some power outside ±50 chip rates: a BPSK sinc² keeps about
1/(50π²) ≈ 2.03e-3 of it there. So the area over that span is 0.997974 for every new BPSK band
and 0.990083 for B1C (MBOC, whose BOC(6,1) share decays more slowly), against a 1e-3 bar. The
registration's bar was wrong, not the densities.

Post hoc, the measured BPSK areas equal the closed-form in-band fraction
`navsignal::bpsk_power_in_band_closed_form` to 1e-6
(`finding_s2_areas_are_the_closed_form_in_band_fraction`). `s2_closed_form_densities_verdict_is_the_recorded_one` keeps the bar
as registered and asserts the recorded verdict (exactly the area part misses, for each band).

## Finding F2: per-bin errors follow the codes' line spectra

| signal | mean per-bin \|Δ\| | bar | per-bin sd (0.1–0.9 R_c) |
|---|---|---|---|
| GLONASS L1OF (K = 0) | 0.074 dB | 0.5 dB | 0.09 dB |
| BeiDou B1I | **1.260 dB** | 0.5 dB | 1.49 dB |
| BeiDou B1C data (against BOC(1,1)) | **1.560 dB** | 0.5 dB | 0.52 dB |

The model draws the smooth envelope of each modulation. A real code's spectrum is a set of lines
whose powers scatter about that envelope.
- **GLONASS** uses an m-sequence, whose lines all have the same power, so its Welch estimate
  follows the envelope bin by bin.
- **B1I and B1C** use a Gold code and Weil codes, whose line powers scatter by about 1.5 dB and
  0.5 dB per Welch bin.
- **B1C** also has bins next to the BOC(1,1) null at 2 R_c, where a small absolute difference
  is a large ratio. The 2 % guard was too narrow.

POST HOC, NOT GATING (`posthoc_s3_band_averaged_shape`): averaged over quarter-chip-rate bands,
measured over model is

| band (R_c) | 0–0.25 | 0.25–0.5 | 0.5–0.75 | 0.75–1 | 1–1.25 | 1.25–1.5 | 1.5–1.75 | 1.75–2 |
|---|---|---|---|---|---|---|---|---|
| B1I | −0.24 | +0.18 | +0.17 | +0.25 | +0.95 | +0.44 | +0.52 | +1.28 dB |
| B1C data | +0.07 | −0.03 | −0.10 | +0.06 | +0.06 | −0.08 | +0.40 | +5.78 dB |
| GLONASS L1OF | −0.02 | +0.01 | +0.02 | +0.06 | +0.06 | +0.01 | +0.04 | +0.17 dB |

So:
- the main-lobe envelopes agree within ±0.25 dB (B1I) and ±0.1 dB (B1C up to 1.75 R_c);
- B1I's first sidelobe reads up to 1.3 dB above the envelope;
- the B1C excess is confined to the null region.

`s3_iq_layer_verdict_is_the_recorded_one` keeps the bar as registered and asserts the recorded
verdict; `finding_s3_per_bin_errors_follow_the_code_line_spectrum`
pins the numbers.

## Observation outside this item

The Galileo OS SIS ICD Issue 2.1 (2023), Table 12, gives the minimum received power as
−157.25 dBW for E1 and −155.25 dBW for E5a. The existing `galileo-e1` and `galileo-e5a` bands use
−157.0 and −155.0 dBW (an earlier issue). They are not changed here, because the change is
additive; it is reported for a separate decision.

## Not covered

- the recorded-IQ (SigMF) comparison of the audit item;
- the GLONASS CDMA signals and BeiDou B2b;
- Galileo E5b and E5 AltBOC as spectrum-kind bands;
- intra-system interference and satellite band-limiting.
