# Grid-free acquisition (D12): results

Bars A1-A3 were pre-registered at dc0dfb0e (`PREREGISTRATION.md`) before any implementation
or measurement, and are unchanged.

| Bar | Result |
|---|---|
| A1 `AcqResult` bit-identical to the grid path on GPS L1 C/A, Galileo E1-B, Galileo E5a-I | PASS (`tests/iq_acq_gridfree.rs`, two signals each plus noise only, `PartialEq` on every field) |
| A2 peak RSS `VmHWM` ≤ 256 000 KiB (about 250 MiB) for the default acquisition of Galileo E5a-Q at 25 MS/s | PASS: **213 MiB** (`VmHWM`), 1501 Doppler bins × 2 500 000 lags, 2169 s, acquired at 1233.3 Hz (truth 1234 Hz). The grid path would need 30.0 GB |
| A3 existing acquisition and tracking tests unchanged | PASS (no test edited) |

## The first design failed A2
The first grid-free design (2c1c7ab7) held the peak's row for the whole search and inverted
the FFT through a conjugate copy. Its `VmHWM` was 277 MB after 22 minutes, over the bar, so
the run was stopped. The fix, with the bar unchanged and the result bit-identical, is an
in-place inverse (`FftPlan::inverse_owned`) and recomputing the peak row once at the end
(4266f842). The 213 MiB above is from that design (the first design's 277 MB was `VmHWM` 276 996 KiB, about 270 MiB, also over the bar).

## Where the memory goes (E5a-Q, 2.5M lags)
Input samples 40 MB, FFT twiddles 40 MB, the conjugated code spectrum 40 MB, one fold buffer and
one transform output (40 MB each, transient), one row (20 MB).
