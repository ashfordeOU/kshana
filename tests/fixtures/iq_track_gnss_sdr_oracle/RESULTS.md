# iq::track against GNSS-SDR 0.0.19: comparison NOT RUN (calibration failed)

Pre-registration: `PREREGISTRATION.md` (48edd4a5). Run on 2026-10-13 with:
- `make_fixture.py`, unchanged;
- GNSS-SDR 0.0.19 (Ubuntu 24.04 package `0.0.19-1build3`);
- the release `kshana` of branch `feat/iq-ext-0.36` at 10e49e26.

## What happened

The registered run stopped at the convention calibration. That is the rule: "If it does not
[pass], the comparison is reported as not run". `calibration.csv` holds what the driver wrote.

| receiver | carrier RMS | code RMS | mean \|P\|/\|X\| | bar | result |
|---|---|---|---|---|---|
| GNSS-SDR | 43.13° | 0.00083 chip | 0.9002 | < 1°, < 0.005 chip, 1 ± 0.01 | **fails** |
| engine | 0.218° | 0.00070 chip | 1.0000 | same | passes |

The engine row comes from a diagnostic run of the driver's own functions on the same 60 dB-Hz
calibration recording. The driver stops at the first failing receiver and so did not write
it. **No test recording (30, 35, 40 or 45 dB-Hz) has been generated or run.**

## Diagnosis (on the calibration recording only)

- **Decoding the failed run.** The run's raw tracking dump (`cal_trk_ch0.dat`, 96-byte records
  as written by `dll_pll_veml_tracking.cc` of v0.0.19) shows GNSS-SDR tracking at
  **1750.0 Hz**, against the true 1500 Hz. The dump starts at 1759.9 Hz, the lock test averages
  −0.06, and the code error is still small because of carrier aiding. Its acquisition handed
  over one 250 Hz Doppler bin off. With the FLL off, as registered, the 15 Hz PLL never pulls
  that in.
- **The measurement is not the cause.** Re-running GNSS-SDR on the same recording gives a
  correct hand-off in most runs. In those runs the registered measurement passes calibration
  (4 of 4: carrier RMS 0.22°, mean |P|/|X| 1.0000). GNSS-SDR's hand-off sample varies from run
  to run (multi-threaded acquisition), so its result is not deterministic.
- **Frequency of wrong locks, on the calibration recording:**

  | configuration | wrong locks |
  |---|---|
  | as registered (250 Hz step) | 1 of 31 runs (at 1750 Hz) |
  | with `bit_transition_flag = true` | 2 of 20 (at 1250 Hz), so not a data-bit-edge effect |
  | with a 25 Hz step | 1 of 30 (at 1437.5 Hz) |

  The acquisition runs during the 45 dB-Hz lead, where with 1 ms coherent integration the
  neighbouring bin is only about 1 dB weaker. A PLL-only loop with the FLL off does not recover
  from a wrong hand-off.

## Status

The bars B1 to B6 have not been evaluated. Any change to make the comparison runnable is a
change to the method. Under the pre-registration it needs a written amendment, stated with the
values above and committed before any test recording is run. Candidates:
- the FLL during pull-in only, for both receivers;
- a deterministic hand-off;
- a rule for repeated GNSS-SDR runs.

None is adopted here; the choice is left to the coordinator. The ledger row is not added or
changed.
