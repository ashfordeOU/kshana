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

### Validated (pre-registered, proposed for promotion)

- GPS LNAV navigation-message encoding: on the IGS broadcast file of 2 March 2025, parsed and
  decoded by RTKLIB v2.4.2-p13, all 960 words pass parity, all 96 subframes decode and all 608
  broadcast integers equal Kshana's (`tests/gps_lnav_rtklib_integer_oracle.rs`).

### Changed

- `realdata::ion_sdr` fills words from the most significant bit (I in the high nibble of a LuGRE
  byte; the earlier reading produced the conjugate signal), keeps the old reading as
  `SdrLayout::fill_lsb_first`, and reads samples wider than a word.
- `acquisition::refine_doppler_coherent`: phase-coherent Doppler refinement (0.2 Hz RMS at
  30 dB-Hz over 200 ms in simulation).

### Findings (each pre-registered)

- GPS L1 C/A against gps-sdr-sim: chips and parity bit-exact; 230 of 1152 LNAV fields differ by
  one unit because gps-sdr-sim truncates where the broadcast integer needs rounding.
- LNAV decoded by RTKLIB: all parity and subframes pass and every parameter is within half a
  quantum; 41 scaled values differ by a few units in the last place through RTKLIB's decimal
  2^-43 constant, above the registered bar.
- LuGRE acquisition against GNSS-SDR 0.0.19: 266 of 266 decisions agree, 250 located on the same
  cell; most positives are artefacts of a −0.5 mean in the bare 4-bit levels; the C/N0 leg had no
  contemporaneous flight data. Two batches (OP5, OP12) were excluded in error: their metadata
  agrees with their headers, but the reader could not then read a sample wider than a word.
- LuGRE acquisition against orbit-predicted Doppler: with the sample-power decision every search
  crosses on band-limited noise; with the cell-averaging decision the strongest pairs agree in magnitude with
  the sign reversed, showing the registered I/Q order to be the conjugate of the data.
- Relative C/N0 at lunar distance (M039 restated): 15 Block IIR/IIR-M records and one pair, too
  few for the registered bar.

### Revisions

- None: no published number, golden file or docs figure changed.
