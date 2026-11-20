# A GNSS receiver in space: clock, timestamps, dynamics, upper-SSV benchmark

`kshana space-receiver` looks at a GNSS receiver flying above, around and beyond the GNSS orbits
(the Space Service Volume, SSV) from the receiver's side: how its onboard clock behaves on its
orbit, how its time tags fail, how hard the signal dynamics are, and how one receiver design fares
on a fixed set of upper-SSV cases. It reuses the `gnss-ssv` sweep ([SSV.md](SSV.md)) for the
constellations, link budget and availability, and the power-law clock model of
`src/powerlaw.rs`.

Everything here is **MODELLED**: two-body orbits, the ICG booklet's constellation tables (UN
ST/SPACE/75), first post-Newtonian relativity with the Earth's monopole only, and representative
oscillator classes. One number is checked against a published value: the relativistic constant
`F` and the GPS satellite-clock design offset (IS-GPS-200, 20.3.3.3.3.1 and 3.3.1.1).

Source: `src/space_receiver/`. Output: JSON to standard output, or to `--out <file.json>`.

## `clock`: the onboard clock on its orbit

```
kshana space-receiver clock --orbit heo --oscillator ocxo --temp-swing 10 --outage-min 90
```

* **Relativity.** The secular rate of the orbiting clock against TT is `−3μ/(2ac²) + L_G`
  (positive: it runs fast), split into its gravitational and velocity parts; the periodic
  eccentricity term has amplitude `2·√(μa)·e/c²`. For a GPS orbit this is +38.6 µs/day and the
  amplitude is `F·e·√a` with `F = −4.442807633e−10 s/√m`; both are tested against IS-GPS-200.
  J2, the Sun and the Moon are neglected.
* **Free-run time error** over an outage `T`, as three parts: noise `T·σ_y(T)` from the
  oscillator's power-law coefficients, ageing `D·T²/2`, and the peak-to-peak wander of a
  sinusoidal temperature swing over the orbit, `k·ΔT·P/(2π)` (bounded by `k·ΔT·T/2` for a short
  outage). The relativistic rate is reported apart, as the error it would add if left uncorrected.
  Listed at 1 min, 10 min, 1 h, 6 h and 1 day, plus any `--outage-min`.
* **Oscillator classes**: `tcxo`, `ocxo`, `csac`, `uso` are representative orders of magnitude
  for the class, **not a datasheet**; `minirafs` and `rafs` reuse the noise coefficients of
  `src/clock_specs.rs` (calibrated to cited one-day time errors), with representative ageing and
  temperature coefficients. Every report says which.

Orbits (`--orbit`): `leo`, `meo`, `geo`, `gto`, `heo`, `heo-perigee`, `lunar-transfer`, or
`a_km,e,i_deg`.

## `timestamps`: timestamp faults

```
kshana space-receiver timestamps tags.csv --oscillator ocxo
```

The CSV pairs the receiver's time tag (`t_rx_s`, or `week` and `tow_s`) with an onboard reference
count `t_ref_s` (for example the spacecraft's on-board time, monotonic and free of GNSS faults),
optionally with the receiver's reported `clock_bias_s`. The detector follows the offset
`t_rx − t_ref` on a trailing line fit and reports, per row:

| kind | what |
|---|---|
| `time_reversal`, `duplicate_time_tag`, `duplicate_reference` | the tag went backwards or repeated; the reference repeated |
| `gap` | a reference interval over `--gap-factor` (1.5) times the median |
| `millisecond_jump` | a step of a whole number of milliseconds under 20 ms (clock steering) |
| `leap_second` | ±1 s |
| `gps_bdt_offset`, `gps_utc_offset`, `gps_tai_offset`, `tai_utc_offset` | ±14 s, ±18 s, ±19 s, ±37 s (a time-scale confusion) |
| `moscow_offset` | ±3 h |
| `week_skip`, `week_rollover_1024`, `week_rollover_4096`, `week_rollover_8192` | ±1 week, and the 10, 12 and 13-bit week counters |
| `time_step` | any other step |
| `outlier` | one row off the line that the next row returns to |
| `frequency_step` | the slope over the second half of the window differs from the first half by more than 8 standard errors and 1e−11 |
| `clock_bias_jump` | the reported clock bias moved by more than 0.5 ms |
| `set_change_jump` | where the satellite set (optional `sats` column, `G05;E11;...`) changed, the clock bias moved by more than 12 times the jump the set change explains (1 m ranging error per satellite: the clock absorbs the set's mean error, so the expected jump has variance `σ²(1/n₁ + 1/n₂ − 2k/(n₁n₂))`) |
| `isb_unhandled` | with two systems in the sets, the clock bias follows the second system's share across set changes (slope beyond five standard errors and 1 ns): the inter-system bias is absorbed by one clock |

With a `clock_bias_s` column the report adds **disciplining evidence**: the steering steps (whole
milliseconds), the free-running drift between them, and the overlapping Allan deviation of the
bias with the steps removed at 1, 10 and 100 nominal intervals. With a `sats` column naming two
systems it adds the **dual-system** block (the absorbed bias, its standard error, and whether it
looks unhandled).

The step threshold is the larger of `--step-floor` (1 µs) and six times the oscillator's free-run
error over the row interval combined with the recent residual scatter. Detection is shown on
synthetic series with injected faults in the unit tests (no event on five clean 600-row series;
each injected leap second, millisecond jump, outlier, week rollover, GPS–UTC confusion, gap,
duplicate, bias jump and 1e−8 frequency step found and named); it has not been run on flight data.

## `dynamics`: Doppler, Doppler rate and its derivative

```
kshana space-receiver dynamics --orbit gto --step-s 30 --max-doppler 50000 --max-doppler-rate 100
```

For every satellite of the six booklet constellations whose line of sight is not blocked by the
Earth and a 50 km atmosphere and lies within `--max-off-boresight` (90 degrees: sidelobes
included) of its nadir boresight, the range is differentiated by central differences (±2 s, ±4 s)
into Doppler `−ρ̇f/c`, Doppler rate `−ρ̈f/c` and its derivative. The report gives the envelope
(signed extremes, 95th percentile and largest magnitude), the user's largest speed and
gravitational acceleration, and how many links lie beyond the stated limits. Light time and the
receiver's own clock drift are not included. Presets add `gto` (250 × 35,786 km, 27 degrees) and
`heo-perigee` (the booklet HEO started 30 minutes before perigee) to the `gnss-ssv` ones.

Presets also include `mms-1` and `mms-2b`, the Magnetospheric Multiscale orbits (1.2 × 12 and
1.2 × 25 Earth radii), started at apogee.

## `mms`: the MMS Phase 2B flight results

```
kshana space-receiver mms [--cn0 20] [--orbits 3] [--step-min 5]
```

The published Phase 2B figures (Winternitz, Bamford and Price, NASA GSFC, NTRS 20170009487,
days 142-149 of 2017): at least one GPS satellite tracked 99 % of the time, four or more 70 % of
the time, about three signals near apogee on average, the apogee signals mostly sidelobes at 20 to
30 dB-Hz. The model: GPS only on L1, the booklet's annex C orbits, the parametric sidelobe
pattern, an omnidirectional 0 dBi antenna for MMS's four body-mounted antennas, a 20 dB-Hz
threshold, the 1.2 × 25 RE orbit at 28 degrees (inclination and phase to confirm). The tolerance,
fixed before the run, is ±15 points on each availability and ±1.5 signals near apogee.

**Result: not reproduced.** With the booklet's minimum transmit powers the model tracks at least
one signal about 8 % of the time and four about 4 %, far below the flight figures; this is the
same shortfall the mission's own pre-flight analysis showed (it predicted zero to two main-lobe
signals at apogee). The report carries a sensitivity grid (extra link margin 0, 5, 10 dB; sidelobe
floor 25 or 15 dB down): 10 dB lifts one-signal availability to about 84 %, but four-signal
availability stays under 10 % in every setting, so the representative pattern and constellation,
not the margin alone, keep the model from the flight result. A measured GPS transmit pattern
(`[transmit] pattern = "table"` in `gnss-ssv`) is the next step; it is not part of this release.

## `od-vs-tle`: onboard orbit determination against an element set

```
kshana space-receiver od-vs-tle onboard.oem --tle object.tle
```

The onboard solution as a CCSDS OEM (`REF_FRAME` EME2000, GCRF, ICRF or TEME; epochs read as
UTC) against the element set propagated with SGP4 (WGS-72) and rotated TEME to GCRS: largest and
RMS distance, RTN at the largest, the mean RTN difference and the element set's age. A
disagreement between two sources, not the accuracy of either.

## `bench`: the upper-SSV benchmark

```
kshana space-receiver bench --list
kshana space-receiver bench --cn0 20 --oscillator ocxo --max-doppler 50000 --max-doppler-rate 100 --time-budget 1e-6
```

`upper-ssv-bench/1` is six cases: `meo-8000` (the lower edge of the SSV, one day), `geo` (one
day), `gto` (one orbit), `heo` (the booklet's table 5.10 orbit, one orbit), `mms-2b` (one 67-hour
MMS Phase 2B orbit) and `lunar-transfer` (four days of the outbound ellipse). `--sidelobes`
counts side-lobe signals (the parametric pattern, sidelobe floor 25 dB down) in place of the
booklet's main lobe. Each is run with the booklet link budget and main-lobe
transmit pattern on L1, all six constellations, a booklet high-gain nadir and patch zenith antenna
and the receiver's C/N0 threshold, and reports availability of one and four signals, the longest
outages, the Doppler and Doppler-rate envelope, the relativistic rate and the free-run time error
of the oscillator over the longest four-signal outage. Three checks per case (Doppler, Doppler
rate, time error) pass, fail or are `not_checked` when no limit is given. The case list is
versioned: a change is a new version, never an edit.

The benchmark compares designs on the same synthetic ground; it does not predict flight
performance.

## Not built here

Nothing in this command transmits, steers an antenna or estimates where an emitter is. Flight
data for the timestamp detector and a validation of the oscillator classes against datasheets are
not part of this release.
