# Oscillator models

`kshana oscillator` turns an oscillator's datasheet figures into the numbers a receiver or timing
designer needs: carrier jitter under vibration, holdover through temperature changes and shocks, the
cold-start frequency search, the clock's value to RAIM, and the time deviation (TDEV) a datasheet's
Allan deviation implies. Source: `src/oscillator/`. Tests: `tests/oscillator.rs`. Example inputs:
`examples/oscillator/`.

```
kshana oscillator vibration  examples/oscillator/vibration.json
kshana oscillator holdover   examples/oscillator/holdover-temperature-step.json
kshana oscillator holdover   examples/oscillator/holdover-ramp-and-shock.json
kshana oscillator select     examples/oscillator/select.json
kshana oscillator raim-aid   examples/oscillator/raim-aid.json
kshana oscillator datasheet  examples/oscillator/datasheet.json
kshana oscillator refs
```

Each prints one JSON report to standard output and writes no file.

## Evidence

Every report is **MODELLED**, with one exception: the vibration sideband levels (`sideband_label:
"VALIDATED"`) reproduce seven of the eight rows of Filler (1988), Tables I and II, to within 0.5 dB
(`tests/oscillator.rs`, `sidebands_reproduce_filler_1988_tables_i_and_ii`). The eighth row (1575 MHz,
5 Hz, modulation index 3.15) is printed as +2.3 dBc; the Bessel ratio gives −0.75 dBc. The test records
this difference and does not fit it.

No output is a measurement of a unit, and none states that a part meets a standard.

## Clocks

A clock is a preset id or a full specification:

| field | meaning |
|---|---|
| `id` | short name |
| `source` | the document the figures come from, with revision and table |
| `adev_points` | `[tau_s, sigma_y]` Allan deviation points (datasheet maxima) |
| `aging_per_day` | linear fractional-frequency ageing per day |
| `temp_coeff_per_k` | fractional frequency per kelvin |
| `g_sensitivity_per_g` | acceleration sensitivity, fractional frequency per g |
| `initial_accuracy` | frequency accuracy at switch-on (± bound) |
| `power_w` | steady-state power |

The presets are the four datasheet presets of the telecom-timing kind (`ocxo`, `rubidium`, `caesium`,
`csac`; documents in [TELECOM-TIMING.md](TELECOM-TIMING.md)). Their noise model is the same envelope
fit, `σ_y²(τ) = w/τ + f + r·τ`, scaled to sit at or above every datasheet point, with the flicker
floor never below the last listed point. None of those four datasheets states an acceleration
sensitivity, so the presets leave it unknown. The CSAC preset also carries the power (< 120 mW) and
the frequency accuracy at shipment (±5e-11) from its datasheet. A figure a datasheet does not state
is left out. Checks that need it report `unknown`; nothing is filled in.

## `vibration`: g-sensitivity and tracking threshold

Input: `carrier_hz`, `g_sensitivity_per_g`, a random-vibration profile `random` (breakpoints
`[f_hz, g2_per_hz]`, log-log interpolated), sinusoidal lines `sine` (`freq_hz`, `accel_g_peak`), the
loop (`order` 2 or 3, `bandwidth_hz`, `coherent_s`, `los_dynamics` in m/s² or m/s³), and optionally
`clock` or `adev_at_loop` for the Allan-deviation jitter and `cn0_dbhz` for a table.

- **Sinusoidal vibration.** The modulation index is `β = Γ·A·f0/fv`. The first sideband is
  `20·log10|J1(β)/J0(β)|` dBc (Filler 1988).
- **Random vibration.** The phase spectral density is `S_φ(f) = (Γ·f0)²·G(f)/f²`. The phase variance
  `∫ S_φ df` is the vibration-induced oscillator phase noise term of the PLL error budget in Kaplan and
  Hegarty (2006), chapter 5. It is reported over the whole band (`vibration_deg_whole_band`, the
  textbook budget) and weighted by the loop's error response `|1−H|²`
  (`vibration_deg_loop_filtered`).
- **Threshold.** The PLL rule of thumb is `3σ_j + θ_e ≤ 45°`, with thermal jitter, vibration jitter,
  Allan-deviation jitter (taken at `τ = 1/B_n`) and dynamic stress error. `thresholds` gives the C/N0
  at which the rule is just met, with no vibration, with the whole-band jitter and with the
  loop-filtered jitter. `null` means the rule is not met at any C/N0.

In the example (GPS L1, `Γ = 2e-9/g` (the Filler 1988 worked example), a flat 0.04 g²/Hz from 20 to
2000 Hz chosen for illustration, a 1 g line at 100 Hz, a third-order 15 Hz loop, the OCXO preset's
Allan deviation), the vibration adds about 8° of jitter. The threshold rises from 26.6 to 27.6 dB-Hz,
and the 100 Hz line's sideband is −36 dBc.

## `holdover`: temperature transients and shocks

Input: `clock`, `duration_s`, `threshold_s`, optional `step_s`, `k_sigma` (default 1),
`initial_freq_offset`, `temperature` (`points` `[t_s, temperature_c]` and a first-order `lag_s`) and
`shocks` (`t_s`, `freq_step`, `phase_step_s`, `outage_s`, `outage_freq_offset`).

The time error is the initial offset plus ageing (`D·t²/2`), the integral of `k_T·ΔT_eff`, and the
shocks' frequency and phase steps. The bound adds `k·t·σ_y(t)`. The report gives the first time the
bound reaches the threshold (`holdover_s`), the same for the deterministic part alone, the parts'
largest values, and a series of up to 200 points.

`k_T` for a preset is the datasheet's bound over half its operating span: a linear, worst-case reading
of a bound, not a measured slope.

Examples:

- `holdover-temperature-step.json`: OCXO preset, a 10 K step one hour after the loss through a 600 s
  lag, 1.5 µs threshold (the ITU-T G.8271 class 4 figure also used in [TELECOM-TIMING.md](TELECOM-TIMING.md)).
  The bound reaches 1.5 µs after about 2.1 h. The deterministic part alone reaches it after about 4.3 h.
- `holdover-ramp-and-shock.json`: CSAC preset, a 0.5 °C per minute ramp from 20 to 60 °C (the rate at
  which the SA.45s datasheet states its temperature figure), then a shock at 6 h. The shock figures are
  **assumptions**, not datasheet values. The datasheet states no frequency change after a shock, so the
  example uses its maximum retrace (±5e-10) as the lasting step and its warm-up time (< 180 s) as an
  outage at that offset. Replace them with measured values when you have them.

## `select`: selection aid and readiness tests

Input: `candidates` (default: the four presets) and `requirements`. Each requirement is optional:
`holdover` (duration, largest time error, temperature profile), `cold_start` (carrier, Doppler,
coherent time, days since calibration, temperature change, optional largest search factor),
`vibration` (profile, loop, weakest C/N0 that must stay tracked), `adev_max` (`[tau_s, limit]`) and
`power_max_w`.

Each candidate gets one check per requirement: `pass`, `fail`, `unknown` (its datasheet does not state
the figure the check needs) or `info` (a figure with no limit). Candidates are listed in input order.
They are not ranked or scored against each other.

The cold-start check is a proxy for the frequency part of the time to first fix: the switch-on
frequency uncertainty widens the Doppler search, and the factor is how many more `2/(3T)` Hz bins
must be searched.

A clock that exists only as a target specification, such as a chip-scale optical clock on a roadmap,
is entered with its target figures as a candidate. The same checks then act as readiness tests: which
requirement points the targets meet, and which figures are still unstated.

## `raim-aid`: clock-assisted RAIM

Input: `clock`, `satellites` (`[azimuth_deg, elevation_deg]`), `sigma_m`, `p_fa`, `p_md`,
`calibration_sigma_s` and `coast_s` (times since the clock was calibrated).

The clock enters as an extra measurement of the clock state, with standard deviation
`c·sqrt(σ_cal² + (t·σ_y(t))² + (D·t²/2)²)`. The method is weighted slope RAIM, the same construction
as `kshana::raim::snapshot_raim`. A test checks that with no clock row the levels equal that
function's.

- `aided` counts the clock row as a measurement that can itself fail.
- `aided_clock_fault_free` assumes the clock is monitored by other means.
- `unaided` is `null` with fewer than five satellites. The clock row then gives RAIM with four.

In the example (five satellites, 3 m, rubidium preset) the unaided VPL is 86 m. Aided, it is 49 m at
calibration and 39 m after an hour. After a day the clock's σ has grown to about 80 m and the aided
level is no better than the unaided one. A clock row much more precise than the ranges has little
redundancy of its own. So when the clock can fail, its own slope can set the level, and the best
level falls where the clock's σ is near the ranges' σ.

## `datasheet`: TDEV from a datasheet

Input: `clock`, optional `tdev_points` (if the datasheet states any) and `taus`.

The report gives the fit levels, the model/datasheet ratio at each stated Allan deviation point (at
least 1 by construction), and the model curve of ADEV, MDEV and TDEV. TDEV is
`τ/√3 · MDEV(τ)`. For each power law, MDEV² is a fixed fraction of the Allan variance: 1/2 for white
FM, 27/40 for flicker FM and 33/40 for random-walk FM (Riley, NIST SP 1065, 2008). A test checks the
white-FM case against the engine's TDEV estimator on a synthetic series. The TDEV is derived from the
datasheet's Allan deviation, not stated in it.

For the CSAC preset the envelope sits at 1.05, 1.00, 1.11 and 1.44 times the four datasheet points.
The three power laws do not follow the sheet's 1000 s point closely.

## `refs`: cited acceleration sensitivities

| key | figure | document |
|---|---|---|
| `filler-1988-table1` | 2e-9 /g | R. L. Filler, *The acceleration sensitivity of quartz crystal oscillators: a review*, IEEE Trans. UFFC 35(3), 1988, pp. 297–305, Tables I and II (worked example) |
| `filler-1988-10mhz` | 1e-9 /g | same paper, the 10 MHz oscillator example in the text |
| `sitime-super-tcxo-brief` | 9e-12 /g (0.009 ppb/g) | SiTime, *Precision Timing Solutions: Military UAVs and Drones* (application brief), Endura table and SiT5348 panel |

Each figure is as its document states it, for that document's part or example. None is a class value.
They are not compared here. For a part being chosen, use its own datasheet.

## References

- R. L. Filler, "The acceleration sensitivity of quartz crystal oscillators: a review", IEEE Trans.
  Ultrason. Ferroelectr. Freq. Control 35(3), 1988, pp. 297–305.
- E. D. Kaplan and C. J. Hegarty (eds.), *Understanding GPS: Principles and Applications*, 2nd ed.,
  Artech House, 2006, chapter 5 (carrier tracking-loop measurement errors and loop filters).
- W. J. Riley, *Handbook of Frequency Stability Analysis*, NIST Special Publication 1065, 2008.
- M. A. Sturza, "Navigation system integrity monitoring using redundant measurements", NAVIGATION
  35(4), 1988.
