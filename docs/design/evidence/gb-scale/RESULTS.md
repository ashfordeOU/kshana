# GB-scale streaming run of `iq track`: results

Bars G1-G4 were fixed in `tests/iq_track_gbscale.rs` (commit 7e2aed72) before the first
multi-gigabyte run and are unchanged. Synthetic data only: one GPS L1 C/A PRN 7, 1500 Hz Doppler,
46 dB-Hz, 2.046 MHz `cf32_le`, generated as a stream.

Run: `KSHANA_GB_SCALE_GB=8 cargo test --release --test iq_track_gbscale -- --ignored --nocapture`
(4-core Linux container, 2026-10-08), on #45 at 010b30b9.

| Quantity | Result | Bar |
|---|---|---|
| Recording | 8.00 GB, 1 000 000 000 samples, 489 s of signal | n/a |
| G1 heap peak above baseline | 1.6 MiB | ≤ 64 MiB: PASS |
| G2 end-to-end throughput | 10.85 MS/s (5.3× real time), 92.2 s | ≥ 1.0 MS/s: PASS |
| G3 final state / epochs | LOCKED; 488 758 of 488 759 | LOCKED, ≥ 99%: PASS |
| G4 epoch file | read back end to end, increasing epochs, one record per epoch | PASS |

A 0.05 GB smoke run (heap peak 1.6 MiB, 11.05 MS/s) gave the same heap peak, so the heap does not
grow with the recording's length. The workflow `.github/workflows/gb-scale.yml` (manual) runs the
same test on a GitHub runner with a chosen size.
