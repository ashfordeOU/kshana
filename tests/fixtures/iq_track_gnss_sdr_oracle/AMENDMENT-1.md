# Amendment 1 to the iq::track vs GNSS-SDR 0.0.19 pre-registration (2026-10-14)

Written and committed **before any test recording (30, 35, 40 or 45 dB-Hz) has been generated
or run**. The registered calibration has been run, and it failed. Approved by the coordinator as
option (a). `PREREGISTRATION.md` is not edited: this file amends it. The measured quantities,
the convention calibration and the bars B1 to B6 are unchanged.

## Why (finding F3, seen on the calibration recording only)

The registered run (2026-10-13, b63d8275, `RESULTS.md`) stopped at the convention calibration:

| receiver | carrier RMS | mean \|P\|/\|X\| | result |
|---|---|---|---|
| GNSS-SDR | 43.1° | 0.900 | fails |
| engine | 0.218° | 1.0000 | passes |

GNSS-SDR's PCPS acquisition handed over one 250 Hz Doppler bin off (tracking at 1750 Hz against
the true 1500 Hz). With the FLL off, as registered, its 15 Hz PLL never pulls that in. GNSS-SDR's
hand-off varies from run to run. On the same 60 dB-Hz calibration recording the wrong lock
occurred in:

| configuration | wrong locks |
|---|---|
| as registered | 1 of 31 runs (at 1750 Hz) |
| with `bit_transition_flag` | 2 of 20 |
| with a 25 Hz Doppler step | 1 of 30 (at 1437.5 Hz) |

In runs with a correct hand-off, the registered measurement passed calibration (4 of 4).

## The change: an FLL during pull-in only, in both receivers

Both receivers add a first-order frequency-locked loop of noise bandwidth **10 Hz**, active only
during pull-in, so that a hand-off error is pulled in. Over the statistics window (t ≥ 6 s) both
run the registered PLL-only loops: second-order 15 Hz Costas PLL, first-order 2 Hz carrier-aided
EML-envelope DLL, `d = 0.5` chip, `T = 1 ms`.

- **GNSS-SDR** (`gnss_sdr_template.conf`):
  - `enable_fll_pull_in = true`, `enable_fll_steady_state = false`, `fll_bw_hz = 10`,
    `pull_in_time_s = 2`.
  - Its FLL order follows its PLL order (first order for the second-order PLL).
  - During the 2 s pull-in, v0.0.19 runs the FLL alone with the PLL disabled
    (`dll_pll_veml_tracking.cc`); after it, the PLL alone.
- **Engine** (`make_fixture.py` design):
  - `carrier.kind = "fll-assisted-pll"` with the registered PLL, `fll_order = 1`,
    `fll_bw_hz = 10.0`, `fll_assist = "pull-in"`.
  - Gate: off at a smoothed PLI ≥ 0.8 held 0.1 s (the default), and `fll_on_pli = -0.99`, so
    the FLL does not come back in steady state.
  - During pull-in the engine runs the FLL and the PLL together.

The two pull-in mechanisms differ: a fixed time against a phase-lock gate, and a pure FLL against
an FLL-assisted PLL. Neither acts in the statistics window, and the comparison is of the steady
state only. The engine's FLL could come back only if its smoothed PLI stayed below −0.99 for
0.1 s. The driver reports, for every recording, whether that condition held anywhere in the window
(`engine_fll_reengage_condition`). If it held on a recording, that recording's engine statistics
are reported with this flag and are not graded silently.

## Method changes, all fixed now

- The driver runs exactly as registered otherwise: one GNSS-SDR run and one engine run per
  recording, with the same seeds, the same calibration rule and the same bars.
- The driver records each receiver's starting Doppler, so a wrong hand-off is visible in the
  results.
- Before the test recordings, the calibration recording is run as registered (one GNSS-SDR run)
  and must pass the registered calibration criteria.
- As a disclosed robustness check that does not gate, GNSS-SDR is also run 30 times on the
  calibration recording with this configuration, and the number of wrong locks (|mean Doppler
  error from 6 s| > 5 Hz) is reported beside F3.

## Unchanged

Recordings and seeds; the measured quantities 1 to 6; the calibration criteria; the bars B1 to B6;
what is committed.
