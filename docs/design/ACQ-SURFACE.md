# Acquisition-surface export (`kshana.acq-surface/1`)

The whole Doppler × code-phase correlation-power surface of one `iq acquire` search, with the
peak and two fine-Doppler refinements. It is the surface the search itself computes: its cells
are the ones `acquire` compares with its threshold, bit for bit. (It is not an export of a sweep's
design grid.)

## Cells
`rows[j][t]` is the normalised power `2·G/(L·σ²)` at Doppler bin `j` (`doppler_bins_hz[j]`, Hz
relative to the intermediate frequency) and lag `t` samples (`0 … samples_per_period − 1`).
Lag `t` is code phase `(−t · chips_per_sample) mod code_len_chips` at the first sample searched.
Under noise a cell is chi-square with `2M` degrees of freedom (`M` non-coherent blocks).

## Header
`schema`, `code`, `sample_rate_hz`, `center_hz`, `if_hz`, `coherent_periods`, `noncoherent`,
`doppler_max_hz`, `doppler_step_hz`, `pfa`, `doppler_bins_hz`, `samples_per_period`,
`chips_per_sample`, `code_len_chips`, `sample_power`, `engine_version`, and:
* `peak`: `doppler_hz`, `doppler_index`, `delay_samples`, `code_phase_chips`, `statistic`,
  `threshold`, `acquired`, `second_peak`, `peak_ratio`.
* `parabolic` (or `null`): a parabola through the *amplitudes* (√power) of the peak lag in the
  peak bin and its two neighbours. Closed form, needs no extra correlation. Absent at the edge of
  the grid or when the three amplitudes are not concave. Biased for a sinc response.
* `fine_search`: the same correlation re-run at Doppler offsets of −1 … +1 bin in steps of 1/16
  bin, the largest power at the peak lag. Its quantisation is `bin/32` (5.2 Hz at 4 ms).

Each refinement has `doppler_hz`, `correction_hz` (against the peak bin) and `power`. Neither
replaces the coarse result, and neither is a detection: `peak.acquired` is the search's verdict.

## Files
* **CSV**: `#` comment lines (schema, code, sampling, peak, refinements), then
  `doppler_hz,delay_samples,code_phase_chips,power`, one row per cell.
* **JSON**: `{"header": …, "rows": [[…]]}`.
* **Binary**: the header as one JSON line, then `len(doppler_bins_hz) × samples_per_period`
  little-endian `f64`, row-major. `iq::acq_surface::Surface::read_binary` reads it.

At most 20 000 000 cells (a wider Doppler step or range is refused).

## Surfaces
* CLI: `kshana iq acquire <rec> --signal <s> --prn <one> … --surface <path>
  [--surface-format csv|json|bin]` (format from the suffix by default).
* Rust: `kshana::iq::acq_surface::Surface::{compute, write, read_binary}`.
* Python: `iq_acq_surface(i, q, fs_hz, signal, prn, **options) -> {"header", "rows"}`.
* MCP: `iq_acquire` `surface_out` (one PRN; `.csv`, `.json` or `.bin` in the work directory).

Evidence (pre-registered bars S1–S4, `tests/iq_acq_surface.rs`): on a noise-free signal half a
bin off the grid the coarse Doppler is 79.6 Hz off, the parabolic estimate 2.0 Hz and the fine
search 3.7 Hz.
