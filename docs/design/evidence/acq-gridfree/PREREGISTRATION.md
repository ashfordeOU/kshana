# Grid-free acquisition (defect D12): pre-registration

Written and pushed before any implementation or measurement.

## Problem
`acq::acquire` always returns the full `AcqGrid` (`doppler bins × samples per period` f64
cells). The default hand-off acquisition on the long tiered codes needs `601 bins × 2.5M lags ×
8 B` for Galileo E5a-Q at 25 MS/s (about 12 GB) and about 2.4 GB for E1-C, which kills a 16 GB
machine. Only the peak, the second peak and the statistic are used by every hand-off.

## Change under test
A grid-free path, `acq::acquire_peak`, that keeps a running best (and the peak's row) instead
of the grid: memory O(samples + samples per period), not O(bins × samples). It is used by
default wherever only the result is needed (`iq acquire` without `--surface`, `iq track`,
`iq sweep`, Python/MCP acquisition, the campaign hand-off). The full grid is kept only for
`--surface` (capped) and for the false-lock check, which needs three rows.

## Bars
* **A1** `AcqResult` from `acquire_peak` equals the one from `acquire(...).result` bit for bit
  (every field, `PartialEq`) on GPS L1 C/A, Galileo E1-B and Galileo E5a-I.
* **A2** the peak resident set size (`VmHWM`) of a process that runs the default hand-off
  acquisition of Galileo E5a-Q at 25 MS/s (the default design's acquisition config) is at
  most **256 000 KiB (about 250 MiB)**, including its 2.5M-sample input. (The test
  asserts `VmHWM ≤ 256 * 1000` with `VmHWM` in KiB, written before any run; this note states the
  unit and does not change the assertion.)
* **A3** existing acquisition and tracking tests pass unchanged (no test edited to fit).

A bar is not relaxed after a result. If A2 fails, the result is reported with the number and
the design is changed, not the bar.
