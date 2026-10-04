<!--
DRAFT — one-page validation summary for the Kenn Gold follow-up.
NOT for sending yet. Every [[PENDING ...]] marker is filled from the real test
output only after the seven IQ streams merge into claude/gnss-iq and the full
suite runs green. Do not replace a marker with a number that a test does not
print. If a claim cannot be backed by an independent-oracle test at send time,
delete the claim rather than soften it. House rule (docs/VALIDATION.md): a line
reads "validated" only when an oracle INDEPENDENT of Kshana agrees within a
tolerance fixed before the comparison runs; everything else is MODELLED and
labelled so.
-->

# Kshana — how the GNSS signal layer is checked

One page, for a receiver engineer deciding whether the numbers can be trusted.

## The rule we hold ourselves to

Every quantity below is in one of two states, and we always say which:

- **Validated** — an independent reference (a published standard, an interface
  control document table, a third-party tool, or measured data) agrees with
  Kshana within a tolerance we fixed *before* running the comparison.
- **Modelled** — a physics model we implement and test for self-consistency,
  but have not yet checked against an outside reference. Useful, clearly labelled,
  never dressed up as validated.

Across the whole engine today that ledger is **249 rows, 123 validated, 122
modelled, 4 partner** — each row linked to its test, its module and its
committed reference data at kshana.dev.

## The signal layer, mapped to what you asked about

| What you drill into | What Kshana does | How it is checked | State |
|---|---|---|---|
| **Raw IQ, multi-satellite, long runs** | Generates authentic GNSS IQ for every visible satellite, with a truth file per epoch | A software receiver re-acquires and tracks the output and recovers the injected code phase and Doppler; Doppler equals −range-rate/λ to float precision | [[PENDING: recovered code-phase err, Doppler err, C/N0 err]] |
| **Acquisition & tracking loops** | FFT acquisition; configurable DLL/PLL/FLL tracking; replay one recording through many loop designs | Acquisition detection/false-alarm rates match the engine's analytic Marcum-Q statistics; steady-state tracking jitter matches the Kaplan & Hegarty thermal-noise closed form | [[PENDING: Pd/Pfa agreement, jitter vs closed form at 35/45 dB-Hz]] |
| **Ionospheric scintillation** | Amplitude (S4) and phase (σφ) time series on the IQ (Cornell model) | Sample S4 and phase σ of long runs match the target parameters; decorrelation time matches τ0 | [[PENDING: S4 recovery, σφ recovery, τ0 match]] |
| **Troposphere** | Saastamoinen delay with Niell mapping, applied at signal level | Reuses the engine's tropospheric model, already checked (zenith hydrostatic ≈ 2.3 m; Niell = 1 at zenith) | Validated (existing) |
| **Multipath & NLOS** | Geometric specular reflections (Fresnel) + a statistical land-mobile channel | Excess delay and Fresnel coefficients match closed form; land-mobile state occupancy converges to the Markov stationary distribution | [[PENDING: Fresnel vs closed form, occupancy convergence]] |
| **Signals beyond L1 C/A** | GPS L5/L2C, Galileo E1 (CBOC)/E5a, BeiDou B1C/B1I, GLONASS L1OF | Each code's first chips checked against its published interface-control-document table | [[PENDING: list of ICD tables verified, per signal]] |
| **Against your own lab data** | Fits the open receiver's loss-of-lock model to your runs; predicts untested cases | Synthetic runs from known parameters are recovered within tolerance; leave-one-run-out hold-out error reported; extrapolation labelled as prediction | [[PENDING: parameter recovery, hold-out error]] |

## What this layer does not do, stated plainly

- It does not generate jammer or spoofer RF, and has no over-the-air transmit.
  Your simulator supplies the stimulus; Kshana is the receiving and analysis side.
- Results on *your* receiver are a fitted model of its observed behaviour, with
  the fit error stated — not a copy of its proprietary loops.
- Every new signal-layer number is modelled until the test in its row cites an
  independent oracle. At send time, only rows marked validated carry that weight.

## If you want to go deeper

- The full machine-checked ledger (per-row tests, modules, reference data):
  kshana.dev validation ledger / docs/VERIFICATION-MATRIX.md.
- We can run this against one of your recordings and hand you the report plus the
  exact commands, so you reproduce every number yourself.

<!-- Fill procedure: after merge, run the IQ streams' tests and the full suite;
for each [[PENDING]] copy the measured agreement and the named oracle from the
test that proves it (grep the test names in docs/design/iq-notes/*.md). Then move
each filled row's State to "Validated" only if its test uses an independent
oracle; otherwise write "Modelled" and keep the self-consistency figure. -->
