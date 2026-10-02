### Added (D7: real lunar IQ and Earth GNSS at lunar distance)

- `portable_math::FftPlan`: a mixed-radix fast Fourier transform (FFT) whose output is the same
  bits on every platform; a SHA-256 pin of the 8000- and 24000-point transforms passes on
  x86_64 and on wasm32-wasip1 (runner in `xval/portable-fft-wasm/`).
- `acquisition`: parallel code-phase search on sampled IQ (`pcps_acquire`, `pcps_grid`) with
  coherent folding, non-coherent accumulation, a chi-square threshold for a search-wide
  false-alarm probability and a cell-averaging statistic for band-limited noise; `refine`,
  `prompt_series` with code Doppler, and the M2M4 and grid-peak carrier-to-noise density (C/N0)
  estimators.
- `gps_lnav`: an IS-GPS-200 legacy navigation message (LNAV) encoder for subframes 1 to 3, with
  the Table 20-XIV parity and a field decoder.
- `realdata::ion_sdr`: a reader for the ION GNSS SDR Metadata Standard (`.sdrx`) and its sample
  files, with `to_mid_rise` for two's-complement levels.
- `realdata::lugre`: the LuGRE (Lunar GNSS Receiver Experiment) IQS batch header, RAW, ACQ and
  NAV telemetry and CLK files, and a check that lists where `.sdrx` metadata contradicts the
  binary header.
- `antenna::GainPattern2D` and, in `earth_gnss_lunar`, the yaw-steering body frame, transmit
  azimuth and off-nadir angles, and `transmit_side_db` for relative C/N0 with measured patterns.

### Findings (each pre-registered; no row promoted)

- GPS L1 C/A against gps-sdr-sim: chips and parity bit-exact; 230 of 1152 LNAV fields differ by
  one unit because gps-sdr-sim truncates where the broadcast integer needs rounding.
- LNAV decoded by RTKLIB: all parity and subframes pass and every parameter is within half a
  quantum; 41 scaled values differ by a few units in the last place through RTKLIB's decimal
  2^-43 constant, above the registered bar.
- LuGRE acquisition against GNSS-SDR 0.0.19: 266 of 266 decisions agree, 250 located on the same
  cell; most positives are artefacts of a −0.5 mean in the bare 4-bit levels; the C/N0 leg had no
  contemporaneous flight data. Two batches carry `.sdrx` metadata that contradicts their headers.
- LuGRE acquisition against orbit-predicted Doppler: the strongest pairs agree in magnitude with
  the sign reversed, showing the registered I/Q order to be the conjugate of the data.
- Relative C/N0 at lunar distance (M039 restated): 15 Block IIR/IIR-M records and one pair, too
  few for the registered bar.

### Revisions

- None: no published number, golden file or docs figure changed.
