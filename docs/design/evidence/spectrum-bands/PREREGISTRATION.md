# GLONASS, BeiDou and Galileo E6 bands in the spectrum model: pre-registration

Item CAP-12 (signals part). Written and committed **before** any of the code below exists and
before any run. The bars may be tightened after a run, never loosened. A miss is recorded in
`RESULTS.md` with its numbers and kept as a test marked `#[ignore = "FINDING …"]`. The
recorded-IQ (SigMF) comparison of the audit item is not part of this registration.

## The change (additive)

New band names that `spectrum::default_band` resolves:
- they are used only when a scenario names them;
- `BAND_NAMES`, the default band set of a scenario that names none, is unchanged;
- every existing band, output and golden stays byte-identical.

| name | carrier (MHz) | modulation | min. received power (dBW) | front-end band (MHz) | source |
|---|---|---|---|---|---|
| `glonass-l1of` | 1602 + K·0.5625 | BPSK, 0.511 Mchip/s | −161 | 1.022 | GLONASS ICD Ed. 5.1 (2008) §3.3.1.1, Table 3.1, §3.3.1.6 |
| `glonass-l2of` | 1246 + K·0.4375 | BPSK, 0.511 Mchip/s | −167 | 1.022 | same, §3.3.1.6 (GLONASS-M, L2) |
| `beidou-b1i` | 1561.098 | BPSK(2) | −163 | 4.092 | BDS-SIS-ICD-B1I-3.0 (2019) §4.2.5 |
| `beidou-b1c` | 1575.42 | MBOC(6,1,1/11) | −159 (MEO, data + pilot) | 14.322 | BDS-SIS-ICD-B1C-1.0 (2017) Tables 4-1 and 4-4 |
| `beidou-b2a` | 1176.45 | BPSK(10) | −156 (MEO, data + pilot) | 20.46 | BDS-SIS-ICD-B2a-1.0 (2017) Table 4-4 |
| `beidou-b3i` | 1268.52 | BPSK(10) | −163 | 20.46 | BDS-SIS-ICD-B3I-1.0 (2018) §4.2.5 |
| `galileo-e6` | 1278.75 | BPSK(5) | −155.25 (E6-B + E6-C) | 10.23 | Galileo OS SIS ICD Issue 2.1 (2023) §2.3.2 and Table 12 |

Notes:
- **GLONASS.** `glonass-l1of` and `glonass-l2of` are frequency channel K = 0. Channel K in −7 ..=
  +6 (the post-2005 plan of §3.3.1.1) is named `glonass-l1of-k<K>` and `glonass-l2of-k<K>`,
  for example `glonass-l1of-k-7` and `glonass-l1of-k+6`.
- **B1C.** The composite spectrum is MBOC(6,1,1/11). Table 4-1 of the B1C ICD gives sine
  BOC(1,1) 1/4 (data) + 29/44 (pilot) and sine BOC(6,1) 1/11 (pilot), in phase quadrature, so
  the densities add.
- **Front-end bands** are modelling choices, as for the existing bands: the null-to-null main
  lobe for BPSK, and ±7.161 MHz for MBOC, as `galileo-e1` uses.

## Bars

- **S1 (transcription).** Each new band's carrier, chip rate and received power equal the values
  in the table above, each quoted with its clause in the test, for every name, including all
  14 GLONASS channels of each sub-band (carrier `f0 + K·Δf` exact to 1 Hz).
- **S2 (closed-form PSD).** For each new modulation:
  - the unit-area density integrates to 1 within 1e-3 over ±50 chip rates;
  - for the BPSK bands, the first positive null located numerically by `psd_nulls_hz` lies at
    the chip rate within 1e-3 relative;
  - the B1C density equals `galileo-e1`'s at 200 frequencies across ±15 MHz to 1e-15 relative.
- **S3 (IQ layer agrees with the spectrum model).**
  - For `glonass-l1of` (K = 0), `beidou-b1i` and `beidou-b1c`: a noise-free `iq::scene`
    waveform of the IQ layer's own code for that signal (GLONASS L1OF, BeiDou B1I, BeiDou B1C
    data), at a sample rate of at least 4 chip rates, data off.
  - Its Welch PSD (`spectrum::welch_psd`, Hann, 4096-point segments, 50 % overlap, ≥ 200
    segments), normalised to unit area over the main lobe, is compared with the spectrum
    model's unit-area density over the same lobe.
  - Bar: the mean absolute difference over the main lobe, in dB, is at most 0.5 dB, excluding
    bins within 2 % of the lobe's width of a null.
  - The B1C comparison uses the data component (sine BOC(1,1)) against the BOC(1,1) density;
    it checks the subcarrier, not the composite.
- **S4 (C/N0 path).** For each new band and a CW and a matched-spectrum jammer at J/S = 30 dB,
  `effective_cn0` from the spectral separation coefficient equals
  `jamming::effective_cn0_dbhz` with `Q = 1/(R_c κ)` to 1e-9 dB, as the existing bands do.
- **S5 (additivity).**
  - Every scenario under `scenarios/` of the `spectrum` kind gives a byte-identical
    `result.json` before and after the change.
  - The existing spectrum tests, the registry golden and the cross-platform golden pass
    unchanged.

## Out of scope

Recorded-IQ (SigMF) comparison; the GLONASS CDMA signals; BeiDou B2b; Galileo E5b and E5
AltBOC as spectrum-kind bands (the LEO victim list has them); intra-system interference;
band-limiting by the satellite.
