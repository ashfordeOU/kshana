# Streaming M2M4 C/N0 in the tracking channel: pre-registration

Written and pushed before any implementation or measurement.

## Problem (defect D10)
The channel's NWPR C/N0 reads low by about 8 dB × Bn_PLL·T under the loop's own phase jitter,
so a campaign that scores C/N0 degradation with NWPR alone is biased per loop design. The
second-and-fourth-moment (M2M4) estimator uses only prompt power and is insensitive to carrier
phase error.

## Change under test
`EpochOutput.cn0_m2m4_dbhz` (and the track-epoch column `cn0_m2m4_dbhz`): the M2M4 estimate
(`acquisition::cn0_m2m4`'s arithmetic, shared) over the same sliding windows NWPR uses: the
last `cn0_windows` windows of `cn0_window_periods` prompts (the bit length on a data signal),
each prompt of integration one code period. The epoch format `kshana.track-epoch/1` is
extended (unreleased): a column after `cn0_beaulieu_dbhz`; in the binary record the reserved
float and flag bit 6, so the record size stays 184 bytes and composes with the extra-tap tail.
NWPR and every other output value are unchanged.

## Bars
* **M1** on the GPS L2C 20 ms code, nominal 40 dB-Hz, noise-free-of-bias synthetic signal,
  PLL noise bandwidth 1, 2.5, 5 and 10 Hz: `|M2M4 − nominal| ≤ 0.5 dB` at every bandwidth
  (the C/N0 read at the end of a 25 s run).
* **M2** on GPS L1 C/A at 2.5 MS/s (an incommensurate rate), nominal 45 dB-Hz:
  `|M2M4 − nominal| ≤ 0.5 dB`.
* **M3** NWPR is unchanged bit for bit: the NWPR estimate of every epoch of the M2 run equals
  the values the unmodified channel produced (captured from the base commit 010b30b9 before
  any change and pinned as a checksum over `f64::to_bits`).
* **M4** the three epoch formats carry the column and the binary round trip is exact; the
  record size stays 184 bytes.

A bar is not relaxed after a result. If M1 or M2 fails, the number is reported and the design
changed.
