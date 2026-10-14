# iq::track against GNSS-SDR 0.0.19: results

## Run 1 (2026-10-13, as registered): NOT RUN, calibration failed

Pre-registration: `PREREGISTRATION.md` (48edd4a5). Run on 2026-10-13 with:
- `make_fixture.py`, unchanged;
- GNSS-SDR 0.0.19 (Ubuntu 24.04 package `0.0.19-1build3`);
- the release `kshana` of branch `feat/iq-ext-0.36` at 10e49e26.

### What happened

The registered run stopped at the convention calibration. That is the rule: "If it does not
[pass], the comparison is reported as not run". `calibration.csv` holds what the driver wrote.

| receiver | carrier RMS | code RMS | mean \|P\|/\|X\| | bar | result |
|---|---|---|---|---|---|
| GNSS-SDR | 43.13° | 0.00083 chip | 0.9002 | < 1°, < 0.005 chip, 1 ± 0.01 | **fails** |
| engine | 0.218° | 0.00070 chip | 1.0000 | same | passes |

The engine row comes from a diagnostic run of the driver's own functions on the same 60 dB-Hz
calibration recording. The driver stops at the first failing receiver and so did not write
it. **No test recording (30, 35, 40 or 45 dB-Hz) has been generated or run.**

### Diagnosis (on the calibration recording only)

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

### Status at the time

The bars B1 to B6 have not been evaluated. Any change to make the comparison runnable is a
change to the method. Under the pre-registration it needs a written amendment, stated with the
values above and committed before any test recording is run. Candidates:
- the FLL during pull-in only, for both receivers;
- a deterministic hand-off;
- a rule for repeated GNSS-SDR runs.

None is adopted here; the choice is left to the coordinator. The ledger row is not added or
changed.

## Run 2 (2026-10-14, with Amendment 1): verdict B1–B3 MET; B4, B5 and B6 NOT MET

Amendment 1 (`AMENDMENT-1.md`, committed at 1e4288c4 before any test recording) adds a first-order
10 Hz FLL during pull-in only to both receivers. The bars are unchanged.

Run with:
- `make_fixture.py` as amended;
- GNSS-SDR 0.0.19 (Ubuntu 24.04 package `0.0.19-1build3`);
- the release `kshana` of `feat/iq-ext-0.36` at 1e4288c4.

The committed derived numbers are `results.csv`, `calibration.csv` and `engine_epochs.sha256`.
`tests/iq_track_gnss_sdr_oracle.rs` grades them and asserts the verdict below.

**Calibration** (60 dB-Hz) passes for both receivers:

| receiver | carrier RMS | code RMS | mean \|P\|/\|X\| |
|---|---|---|---|
| GNSS-SDR | 0.220° | 0.00070 chip | 0.99999 |
| engine | 0.218° | 0.00070 chip | 1.00000 |

**Robustness** (Amendment 1, disclosed, not gating): with the amendment, GNSS-SDR on the
calibration recording still locked to a wrong frequency in **3 of 30** runs (runs 16, 24, 25),
against 1 of 31 as registered. An FLL pull-in did not make its hand-off reliable. In this run's
single registered GNSS-SDR run per recording, every hand-off was right (start Doppler 1500 Hz).
The engine's FLL never met its re-engage condition in a statistics window.

**Bars**, graded on the engine and GNSS-SDR from t = 6 s:

| C/N0 | B1 σ_PLL | B2 σ_DLL | B3 Doppler | B4 C/N0 | B5 PLI | B6 lock held |
|---|---|---|---|---|---|---|
| 30 dB-Hz | 10.16° / 10.56° (−3.8 %) MET | 0.02295 / 0.02317 chip MET | Δmean 0.001 Hz, std +0.05 % MET | 28.76 / 31.36 dB-Hz (−2.60) **NOT MET** | 0.907 / 0.336 **NOT MET** | engine held, GNSS-SDR 2 slips **NOT MET** |
| 35 dB-Hz | 4.570° / 4.751° (−3.8 %) MET | 0.01388 / 0.01388 MET | 0.055 Hz, +0.2 % MET | 33.10 / 35.40 (−2.31) **NOT MET** | 0.980 / 0.682 **NOT MET** | both held MET |
| 40 dB-Hz | 2.337° / 2.440° (−4.2 %) MET | 0.00733 / 0.00729 MET | 0.025 Hz, −1.2 % MET | 36.49 / 40.44 (−3.95) **NOT MET** | 0.995 / 0.900 **NOT MET** | both held MET |
| 45 dB-Hz | 1.269° / 1.273° (−0.4 %) MET | 0.00408 / 0.00427 (−4.5 %) MET | 0.006 Hz, +0.5 % MET | 38.34 / 45.43 (−7.09) **NOT MET** | 0.998 / 0.966 MET | both held MET |

### Findings

- **F4 (B4): the engine's NWPR C/N0 reads low.** It reads 2.3 to 7.1 dB below GNSS-SDR's SNV
  estimate, more at high C/N0. The engine's own M2M4 estimate, reported and not graded, is
  29.95, 34.88, 39.95 and 44.99 dB-Hz against the true 30, 35, 40 and 45, and GNSS-SDR's SNV
  is 0.4 dB above truth. This is the NWPR limit already recorded as D10 (the narrow-band/wide-band
  power ratio saturates at high per-update C/N0·T). The engine's code-lock decision uses NWPR.
- **F5 (B5): the lock indicators are not the same quantity.** Each receiver's PLI is
  `(ΣI)² − (ΣQ)²` over `(ΣI)² + (ΣQ)²` as registered, but smoothed its own way. GNSS-SDR's
  `carrier_lock_test` averages far less and reads much lower at low C/N0 (0.34 against 0.91 at
  30 dB-Hz). The bar compared definitions as much as tracking.
- **F6 (B6 at 30 dB-Hz): GNSS-SDR slipped twice, the engine never.** Their carrier jitter agrees
  within 4 % (B1), so the slips are rare events of comparable loops, not a different jitter
  level. One run per receiver cannot say which slips more often.
- **Decimated GNSS-SDR dump at 35–45 dB-Hz.** After bit synchronisation GNSS-SDR's tracking
  ("narrow tracking", state 4 of `dll_pll_veml_tracking.cc`) still updates its loops every
  1 ms, but writes its dump only once per 20 ms data symbol. Its statistics at 35, 40 and
  45 dB-Hz rest on 2996, 3110 and 3795 epochs instead of about 60 000. The X alignment check
  (mean |P|/|X| ≈ 1.000) shows each dumped record is the 1 ms integration it should be. At
  30 dB-Hz there is no bit synchronisation, and the dump keeps every update.

Verdict: the row stays MODELLED (all of B1 to B6 had to hold for VALIDATED). Tracking-loop
behaviour, the quantities B1 to B3 measure, agrees with GNSS-SDR within 5 % at every C/N0.
