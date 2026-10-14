# Pre-registration: the IQ tracking engine `iq::track` against GNSS-SDR 0.0.19

Written 2026-10-12 and committed on its own, before any recording below has been generated,
before GNSS-SDR or `kshana iq track` has been run on one, and before any comparison. The bars
below are not loosened after a run; a miss is recorded as a finding with its numbers.

## What is compared

The full IQ-layer tracking engine (`kshana::iq::track`: acquisition hand-off, correlators,
NCOs, loop filters, discriminators, lock indicator and C/N0 estimators, run through
`kshana iq track`), not the closed-form `tracking-loop` model kind (that one has its own
GNSS-SDR row, `tests/tracking_loop_gnss_sdr_oracle.rs`).

Oracle (Library): GNSS-SDR 0.0.19 (Centre Tecnològic de Telecomunicacions de Catalunya,
GPL-3.0-or-later; the Debian/Ubuntu package), run as a separate program. Its
`GPS_L1_CA_DLL_PLL_Tracking` block tracks the same recordings. Only numbers derived from its
tracking dumps are committed; none of its code is in the crate.

## Recordings (independent of the engine)

Generated in numpy by `tests/fixtures/tracking_loop_gnss_sdr_oracle/ifgen.py`, reused
unchanged (it contains no engine code and does not call the engine's scene generator): complex
baseband at 4 Msample/s (3.91 samples per chip, incommensurate), interleaved signed 8-bit I/Q,
GPS L1 C/A PRN 1 (IS-GPS-200 generators), random 50 bit/s data, Doppler 1500 Hz with the
consistent code Doppler, complex white Gaussian noise; `C/N0 = A²·f_s/σ²`; 45 dB-Hz for the
first 4 s (acquisition and convergence), then the test C/N0. The true carrier phase and code
phase are known analytically at every sample. Seeds 201 onwards, in run order. The recordings
are not committed; they are regenerated bit for bit from the seeds.

* calibration: 60 dB-Hz, 12 s (seed 201);
* test: 30, 35, 40 and 45 dB-Hz, 66 s each (seeds 202 to 205).

Statistics use the epochs whose integration ends at or after t = 6 s, for both receivers.

## Loop configuration (both receivers)

The engine's built-in loops with the FLL path removed: carrier loop a second-order PLL,
`B_PLL = 15 Hz`, Costas two-quadrant arctangent discriminator; code loop first order,
`B_DLL = 2 Hz`, normalised early-minus-late envelope discriminator, early-to-late spacing
`d = 0.5` chip, carrier-aided; predetection integration `T = 1 ms`; FLL off.

* `kshana iq track <rec> --signal gps-l1ca --prn 1 --design design.toml --epochs <csv>` with a
  design file setting `carrier.kind = "pll"`, `pll_order = 2`, `pll_bw_hz = 15.0`,
  `pll_discriminator = "costas-atan"`, `code.order = 1`, `code.bw_hz = 2.0`,
  `code.discriminator = "eml-envelope"`, `code.carrier_aiding = true`,
  `integration.coherent_periods = 1`, `integration.spacing_chips = 0.5`; everything else at the
  built-in default (re-acquisition off, so the lock state machine only observes). The engine's
  own acquisition makes the hand-off.
* GNSS-SDR: `pll_bw_hz = pll_bw_narrow_hz = 15`, `pll_filter_order = 2`,
  `dll_bw_hz = dll_bw_narrow_hz = 2`, `dll_filter_order = 1`,
  `early_late_space_chips = early_late_space_narrow_chips = 0.25` (the early-to-prompt half
  spacing), `extend_correlation_symbols = 1`, `enable_fll_pull_in = enable_fll_steady_state =
  false`, `carrier_aiding = true`; its lock detectors disabled (`cn0_min = -100`,
  `carrier_lock_th = -10`, `max_lock_fail` and `max_carrier_lock_fail` 10^8) so that they never
  act; its C/N0 and lock-test estimators at their 0.0.19 defaults. Its own PCPS acquisition
  makes the hand-off. The configuration is committed as `gnss_sdr_template.conf`.

The engine's `eml-envelope` discriminator, `0.5·(2 − d)·(|E| − |L|)/(|E| + |L|)`, is the same
expression as GNSS-SDR's `(1 − s)(|E| − |L|)/(|E| + |L|)` with `s = d/2`.

## Measured quantities (per recording, per receiver, over the window from 6 s)

1. **Carrier jitter `σ_PLL` (deg).** The block carrier error `ε = arg(P·X*)`, where `P` is the
   receiver's own prompt correlation over the integration and `X` is the correlation of the
   recording, over the same samples, with the receiver's own code replica and the TRUE
   carrier; data sign and thermal noise are common to `P` and `X` and cancel. (This is the
   measure of `tests/tracking_loop_gnss_sdr_oracle.rs`, amendments 2 and 3.) GNSS-SDR: the
   4000 samples ending at `PRN_start_sample_count`, replica code epoch
   `PRN_start_sample_count + aux1`, rate `code_freq_chips`. Engine: the `t_coh_s·f_s`
   samples ending at `sample_index`, replica code phase `code_phase_chips` at `sample_index`
   going back at the code rate of the previous record (the rate in force during the
   integration). `σ_PLL` is the standard deviation of `ε` wrapped to ±90° about its circular
   mean (the Costas ambiguity).
2. **Code jitter `σ_DLL` (chips).** Code error = receiver code phase − true code phase, at
   the receiver's code epoch (GNSS-SDR: `PRN_start_sample_count + aux1`; engine:
   `code_phase_chips` at `sample_index`), wrapped to ±511.5 chips; its standard deviation.
3. **Doppler.** The receiver's carrier Doppler (GNSS-SDR `carrier_doppler_hz`, engine
   `doppler_hz`) minus the true 1500 Hz: its mean and its standard deviation.
4. **C/N0.** The mean over the window of GNSS-SDR's `CN0_SNV_dB_Hz` and of the engine's
   `cn0_nwpr_dbhz` (the estimator the engine's code lock and summary use). The engine's M2M4
   and Beaulieu estimates and the true C/N0 are reported, not graded.
5. **Phase lock indicator.** The mean over the window of GNSS-SDR's `carrier_lock_test` and of
   the engine's `pli` (both the narrow-band `(ΣI)² − (ΣQ)²` over `(ΣI)² + (ΣQ)²` over 20 ms,
   each smoothed as that receiver smooths it).
6. **Lock held.** True when, over the window: no half-cycle slip (a change of
   `round(ē/180°)`, `ē` the 100 ms moving average of the unwrapped `ε`), every code error
   below 0.5 chip in magnitude, and the mean Doppler error over the last second below 5 Hz in
   magnitude. The engine's own LOCKED fraction and the slip counts are reported, not graded.

## Convention calibration (part of the method)

On the 60 dB-Hz calibration recording, for each receiver separately: the constant carrier
offset (circular mean of `ε`) and code offset (mean code error) are measured and then frozen
for that receiver on every test recording; nothing is scaled. The calibration must show, for
each receiver, carrier error below 1° and code error below 0.005 chip root mean square, and
`|P|/|X|` within 0.01 of 1 on average (the replica reconstruction is right). If it does not,
the comparison is reported as not run, and any change to the measurement is an amendment,
written down with the values seen before any test recording is run.

## Bars (all must hold for the ledger row to be VALIDATED)

At each of 30, 35, 40 and 45 dB-Hz:

* **B1** `σ_PLL`: `|σ_engine/σ_GNSS-SDR − 1| ≤ 0.10`;
* **B2** `σ_DLL`: `|σ_engine/σ_GNSS-SDR − 1| ≤ 0.10`;
* **B3** Doppler: `|mean_engine − mean_GNSS-SDR| ≤ 0.5 Hz` and
  `|std_engine/std_GNSS-SDR − 1| ≤ 0.15`;
* **B4** C/N0: `|mean NWPR_engine − mean SNV_GNSS-SDR| ≤ 1.0 dB`;
* **B5** PLI: `|mean_engine − mean_GNSS-SDR| ≤ 0.05`;
* **B6** lock held: the two receivers agree, on every test recording.

A miss on any bar leaves the row MODELLED with the measured numbers recorded as a finding.

## What is committed

`gnss_sdr_template.conf`, the driver `make_fixture.py`, the derived numbers per recording and
receiver (`results.csv`, a few KB), the SHA-256 of each engine epoch file (so the engine side
can be checked by an ignored test that re-runs it on regenerated recordings), and `NOTICE.md`.
