# Acquisition-versus-tracking hysteresis and the front-end quantiser in the jamming kind: pre-registration

Item CAP-06 (c). Written and committed **before** any of the code below exists and before any
run. The bars may be tightened after a run, never loosened. A miss is recorded in `RESULTS.md`
with its numbers, and its test asserts the recorded miss.

## The change (additive): two optional sections

### `[acquisition]`: acquisition-versus-tracking hysteresis

Fields:
- `acquisition_threshold_dbhz` (dB-Hz): at or above the scenario's `tracking_threshold_dbhz`;
- `reacquisition_delay_s` (s, default 0).

Each satellite carries a state, acquired or not, from epoch to epoch:
- **Acquisition.** A visible satellite that is not acquired becomes acquired at an epoch when
  both of these hold:
  - its effective C/N0 is at or above `acquisition_threshold_dbhz`;
  - it has been not acquired for at least `reacquisition_delay_s`, counted from the first epoch
    at which it was not acquired. A satellite never acquired in the run counts as not acquired
    since the start: the delay applies from t = 0, so with a positive delay nothing is acquired
    at t = 0.
- **Tracking.** An acquired satellite stays acquired while it is visible and its effective C/N0
  is at or above `tracking_threshold_dbhz`. Otherwise it becomes not acquired at that epoch.
- **Visibility.** A satellite that is not visible is not acquired.

The existing `status` and `tracking` outputs are unchanged. With the section:
- each link gains `acquired` (true/false);
- each epoch gains `acquired` (count);
- the figures of merit gain `availability_acquired` (1): the fraction of epochs with at least
  four acquired satellites.

### `[front_end]`: AGC and the ADC

Fields:
- `adc_bits` (1 to 16);
- `bandwidth_mhz` (MHz, default twice the chip rate).

The AGC holds the ADC input at the level that minimises the quantiser's correlation loss for a
Gaussian input: the existing `iq::frontend::quant::optimum_step_sigma`. The run reports two
values:
- `front_end.agc_gain_reduction_db` (dB) = `10·log10(1 + J/N)`: how far the AGC turns its gain
  down because of the jammer. `J/N` is the jammer's received power, after any `[terrain]` loss,
  over the thermal noise power `kT·B` in `bandwidth_mhz`. It is 0 with no jammer.
- `front_end.quantiser_loss_db` (dB): the minimum loss for `adc_bits`.

Every link's effective C/N0 is lowered by `quantiser_loss_db`.

**Stated limit.** The loss is that of a Gaussian input. It is exact when the input is noise plus
a noise-like (`broadband`) jammer, because the AGC then normalises a Gaussian sum. For CW,
narrowband and swept jammers it is not the right loss, and the run says so: `front_end.loss_model`
is `"gaussian-input"` for `broadband` or no jammer, and `"gaussian-input-not-valid-for-this-jammer"`
otherwise. Finding G4 below measures how far off it is for a CW jammer.

Without either section every output is byte-identical (bar H1/G1). With both, the quantiser
loss applies before the acquisition state is evaluated.

## Bars

- **H1/G1 (additivity).**
  - Every scenario under `scenarios/` gives a byte-identical `result.json` with this build as
    before it.
  - The new units appear only with their section.
  - The jamming tests, the registry golden and the cross-platform golden pass unchanged.
- **H2 (no hysteresis is no hysteresis).** With `acquisition_threshold_dbhz` equal to the
  tracking threshold and delay 0, on `scenarios/jamming-demo.toml` at jammer powers 10, 20, 25
  and 30 dBW: on every link, `acquired` equals `status != "lost"`.
- **H3 (independent recomputation).** On `jamming-demo` at jammer powers 10, 20, 25 and 30 dBW,
  with `acquisition_threshold_dbhz = 32` and `reacquisition_delay_s = 60`:
  - a Python script recomputes every link's `acquired` flag;
  - it shares no code with the engine and is given only each run's per-epoch list of visible
    links with their effective C/N0, plus the two thresholds, the delay and the time step.

  Bar: every flag equal, at every link of the four runs.
  **Informativeness:** if in all four runs no link has `acquired` different from
  `status != "lost"`, H3 cannot distinguish the hysteresis from its absence. It is then
  recorded as NOT MET (uninformative), whatever the agreement.
- **H4 (monotone in the acquisition threshold).** On the same four runs, raising
  `acquisition_threshold_dbhz` over 25, 28, 32, 36 and 40 dB-Hz (delay 60 s) never increases
  the per-epoch `acquired` count at any epoch.
- **G2 (quantiser loss against an independent Monte Carlo).** A numpy script shares no code with
  the engine. For `adc_bits` 1, 2, 3 and 4, it finds by its own search the uniform mid-rise step
  that minimises the loss of a Gaussian input. At that step it estimates the loss by Monte Carlo
  as `−10·log10( E[x·q(x)]² / (σ²·E[q(x)²]) )`, with 2²² samples (seed 20261014). The input `x` is
  one real component, so a complex front end has the same loss on each component. It does this
  for noise alone and for noise plus a Gaussian jammer at J/N = 20 and 40 dB.
  Bar: the engine's `quantiser_loss_db` within **0.02 dB** of every one of the twelve estimates.
- **G3 (the AGC reading against the IQ-layer AGC loop).** On the demo geometry, set the
  broadband jammer's power so that the engine's J/N is 0, 10, 20, 30 and 40 dB. For each, the IQ
  layer's `Agc` loop
  (`iq::frontend::agc`) is run on Gaussian noise plus a Gaussian jammer of that J/N:
  - 2²⁰ complex samples at 4 MHz with a 1 ms time constant;
  - the gain averaged over the last half of the samples;
  - its gain reduction from the noise-only run.

  Bar: the engine's `agc_gain_reduction_db` within **0.05 dB** of each.

## Disclosed finding, not a bar

- **G4 (CW).** The numpy script repeats G2 with a CW jammer at J/N = 0, 10, 20, 30 and 40 dB. In
  G2's real per-component model the CW jammer is the term `A·cos θ`, with `θ` uniform on
  `[0, 2π)` and drawn independently per sample. It reports the measured weak-signal
  loss of a `adc_bits`-bit ADC at the AGC's level for the total power. The weak-signal gain is
  measured as `E[q(x + ε·s)·s]/ε` with `s = ±1` and `ε = 0.05σ`. These are reported beside the
  engine's Gaussian-input value, which the engine applies anyway and flags as not valid.

## Out of scope

AGC dynamics in time (the jammer is static, so the settled gain is the one reported), pulsed
jammers, ADC clipping beyond the uniform quantiser's outer level, the acquisition search itself
(dwell, Doppler bins and false alarms; the threshold is the whole model), and any receiver
hardware.
