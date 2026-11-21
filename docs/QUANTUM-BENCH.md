<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Quantum inertial-sensor benchmark

`kshana quantum-bench` is a vendor-neutral way to test a quantum (cold-atom) accelerometer the same way as
the classical one it is compared with: a pre-registered test protocol, a simulator-ready model of the
output a cold-atom accelerometer gives, and a scorer for recorded output. **Evaluation only: nothing here
navigates or feeds a navigation solution.**

```
kshana quantum-bench protocol [--out <protocol.json>]
kshana quantum-bench simulate <spec.toml> --out <series.csv>
kshana quantum-bench score <series.csv> [--fringe-m-s2 <a>] [--out <score.json>]
```

**Labels.** The simulator is MODELLED: the cold-atom physics of `src/inertial/quantum_imu.rs` with the
stated inputs. The scorer computes statistics of the data it is given; applied to simulator output it is
a self-consistency check, and no real quantum sensor's data has been scored here. The protocol is a
document; it certifies nothing and sets no pass mark.

## The protocol (`quantum-bench/v1`)

`protocol` prints it as JSON. Rules: thresholds are stated before the test; raw output is recorded at
its native rate with timestamps from a stated clock; the reference is stated with its own uncertainty;
every run is reported, including failed ones; the quantum sensor and the classical baseline get the same
protocol and thresholds. Tests:

| Test | Conditions | Data | Metrics (`score`) |
|---|---|---|---|
| T1 static noise and bias stability | static, levelled, temperature-stable, at least 10× the longest averaging time | `t_s, measured_m_s2` | sample interval, availability, Allan deviation, velocity random walk, bias instability, rate random walk |
| T2 scale factor and linearity | steps or tilts over the stated range | `+ reference_m_s2` | scale factor (ppm), linearity residual, bias |
| T3 dynamic range and fringe ambiguity | accelerations up to and beyond the range | `+ reference_m_s2` | fringe jumps, largest error |
| T4 dead time and aliasing | sinusoidal vibration, including near the cycle rate and its multiples | `+ reference_m_s2` | error RMS, Allan deviation |
| T5 temperature sensitivity | stated temperature steps or ramp | `t_s, measured_m_s2` (temperature log alongside) | bias, Allan deviation |
| T6 start-up and availability | cold start, warm start, long run | `t_s, measured_m_s2` | availability, gaps, time to first sample |
| T7 rotation and contrast | stated rotation rates | `+ reference_m_s2` | availability, error RMS, fringe jumps |

## The cold-atom output model (`simulate`)

One sample per measurement cycle `T_c`. Each sample is the Mach–Zehnder phase for the true acceleration
`a(t)` along the axis, `Φ = k_eff·∫ g_a(τ)·a(t₀+τ) dτ` with the triangular sensitivity function `g_a`
(rising to `T` at `τ = T`, back to zero at `2T`, area `T²`), so the sensor responds to a weighted mean over
the `2T` interrogation and is blind for the rest of the cycle: vibration aliases, with the
interferometer's own response `sinc²(f·T)` (checked in the tests: a 2.01 Hz sine at `T` = 0.1 s,
`T_c` = 0.5 s, appears as a 0.01 Hz alias of exactly that amplitude). Added:

- projection noise `1/(C·√N)` with the contrast decaying as `exp(−2T/τ_c)` over the interrogation;
- white platform vibration, phase variance `k_eff²·S_a·T³/3`;
- a constant bias, a bias random walk and a scale-factor error;
- the fringe readout wrapped into `[−π, π)`: beyond `π/(k_eff·T²)` the output aliases by whole fringes
  and the sample is flagged `wrapped`.

The spec (`examples/quantum-bench/static.toml`) has `[sensor]` (wavelength, default the Rb-87 D2 line;
`pulse_sep_t_s`; `atom_number`; `contrast`; `cycle_time_s`; `contrast_decay_s`), `[errors]`
(`vibration_psd`, `bias_m_s2`, `bias_rw_m_s2_per_sqrt_s`, `scale_factor_ppm`), `[profile]`
(`constant_m_s2`, `sine_amplitude_m_s2`, `sine_hz`, `steps`) and `[run]` (`duration_s`, `seed`). The CSV
starts with a `#` line carrying the MODELLED label and the predictions (per-shot noise, white-noise
ASD, velocity random walk, fringe limit, dead-time fraction), then `t_s, measured_m_s2,
reference_m_s2, instantaneous_m_s2, wrapped`. The values in the example are illustrative, not a product's.

## The scorer (`score`)

Reads a CSV with `t_s` and `measured_m_s2` (and optionally `reference_m_s2`; other columns and `#`
lines are ignored). The error is measured minus reference, or measured minus its mean for a static test.
It states the median sample interval, availability (samples over those expected across the span) and
gaps; the overlapping Allan deviation of the error at octave averaging times; the white-noise amplitude
spectral density from the shortest averaging time and the velocity random walk (`× 60`, m/s/√h); the
bias instability (Allan minimum over 0.664, the IEEE Std 952 convention) in µg and its averaging time; a
rate random walk when the Allan curve rises (log-log slope over 0.25) after its minimum; the bias,
scale factor (ppm) and linearity residual against the reference; and, with `--fringe-m-s2` (the fringe
period `2π/(k_eff·T²)`), the number of errors within a quarter fringe of a non-zero whole number of
fringes. On the example's 7 200 simulated samples the scored white-noise density is within 1 % of the
model's prediction.

## Tests

`tests/quantum_bench.rs`: scored white noise within 10 % of the prediction; a bias random walk and a
constant bias found; a 2000 ppm scale factor recovered within 200 ppm; every sample beyond the fringe
limit flagged and counted as a fringe jump; dead-time aliasing through `sinc²(f·T)`; CSV and spec errors;
the command line. Unit test: the sensitivity-weighted mean passes a constant and nulls a sine at `f = 1/T`.
