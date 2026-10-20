# GNSS beyond the constellation: the `gnss-ssv` kind

> Advisory only. Modelled results from stated inputs and a simulated truth; not a certification, a flight-qualified
> figure or a service-volume claim for any system. Kshana transmits nothing.

The `gnss-ssv` kind answers: for a spacecraft above, around or far past the GNSS orbits, how many GNSS signals can it
use, how strong are they, how good is the geometry, and what can an onboard filter do with them? It has three modes, chosen
by which table the scenario has: `[shell]`, `[trajectory]` or `[navigation]` (with an optional `[formation]`).

Status: **MODELLED**. The availability sweeps are compared with the ICG Space Service Volume booklet under a
pre-registration; see [what the comparison shows](#what-the-comparison-with-the-booklet-shows) before relying on any number.

## Public sources

- *The Interoperable Global Navigation Satellite Systems Space Service Volume*, United Nations Office for Outer Space
  Affairs, ST/SPACE/75 (1 November 2018), prepared by the International Committee on GNSS (ICG), Working Group B: the
  method (annex B), the orbital elements of every constellation (annex C), the transmit beamwidths and powers (tables B2,
  B6, B8, 4.2), the user antennas (table B10), and the published availability tables. It is itself a simulation. Fetched by
  `xval/gnss-ssv/fetch.sh` (pinned SHA-256), never vendored.
- U.S. Coast Guard Navigation Center, GPS Block IIR and IIR-M antenna panel patterns (Marquis, 2014): the measured L1 panel
  patterns used only to judge the parametric stand-in (bar S7). Fetched, never vendored, no pattern data committed.
- The constants of the model (gravity, Earth rotation, free-space loss, noise density) are standard; the Gallagher plasmasphere
  density law, the Chapman layer and the radio refractivity profile are published forms, used with stated simple
  parameters (see `src/ssv/limb.rs`).

## Shell mode: the booklet's global metric

`[shell]` places a user on a sphere (default 36,000 km altitude with a nadir-pointing hemispherical antenna, the upper
SSV; or 8,000 km with an omnidirectional antenna, the lower SSV) on a 2,562-point icosphere grid and counts, over
14 days at 1-minute steps, the share of (user, epoch) pairs with at least one and at least four signals, per constellation
and combined, and the longest outage at the worst user. The sweep uses the closed-form visibility interval in central angle
(a beam cone, Earth blockage by the 6378 km sphere plus 50 km, the user hemisphere and the RF range limit) and runs in
seconds in a release build; a property test checks it against the general geometric predicate.

## Trajectory mode: along an orbit

`[trajectory]` flies the user on a Keplerian orbit (a preset: `leo`, `meo`, `geo`, `heo` (the booklet's table 5.10) or
`lunar-transfer`, or elements) and reports, per band and constellation, availability of one and four signals, outage
durations, signals in view, best C/N0, dilution of precision (median, 95th percentile, worst), links received through the
main lobe and through sidelobes, and an optional time series and CSV.

- **Transmit pattern** (`[transmit] pattern`): `booklet` (constant power inside the reference off-boresight angle),
  `parametric` (a labelled stand-in: 3 dB per degree beyond the reference angle to a floor 25 dB below the main lobe; **not**
  any system's measured pattern) or `table` (a measured pattern you supply: `pattern_csv` or inline `pattern_text`; the
  Block IIR/IIR-M panel patterns can be extracted with `xval/gnss-ssv/extract_patterns.py`).
- **Receive antennas**: omni, hemisphere, or the booklet's table-B10 high-gain and patch antennas, nadir or zenith; each
  link uses the antenna with the higher gain.
- **Limb-ray medium** (`[atmosphere]`): a Chapman ionosphere, a plasmasphere (Gallagher 1988 form, plasmapause at L = 4.5,
  tapered below 1,500 km) and a neutral atmosphere (bending about 1.33 degrees at the surface, oxygen absorption, defocusing)
  integrated along the straight ray. Reports slant TEC, the plasmaspheric part, excess delay, tangent altitude and the
  links lost to grazing. Straight-ray integration: bending is reported, not iterated.
- **Weak-signal receiver** (`[receiver] weak_signal`): coherent and non-coherent integration, data-bit limit, aiding and
  pilot channels, Doppler search; the acquisition threshold at the stated detection and false-alarm probabilities and the
  carrier and code tracking thresholds replace the fixed C/N0 threshold (10 to 25 dB-Hz range). Reuses the engine's
  acquisition and tracking-loop models.

## Navigation mode: an onboard filter

`[navigation]` flies a high-orbit or lunar-transfer craft and runs a nine-state extended Kalman filter (position, velocity,
receiver clock bias and drift, a solar-radiation-pressure scale) on pseudoranges. Truth is integrated with point-mass
gravity, J2, Sun and Moon third-body and radiation pressure with a cylindrical Earth shadow; the filter models gravity, J2
and the third bodies and estimates the radiation pressure. Pseudoranges come from the same link geometry and C/N0
threshold as the sweeps; their noise grows as the C/N0 falls; the medium's excess delay (with `[atmosphere]`) is added and
not modelled by the filter. The report separates the part of the run inside the GNSS orbits (below 20,000 km altitude)
from the part above, gives the longest gap with no measurement and the mean normalised estimation error squared (about 3
for a consistent position block). The Sun and Moon are low-precision circular stand-ins.

## Formation mode: relative navigation

`[formation]` (needs `[navigation]` for the chief) adds deputies offset in true anomaly. Each craft runs the absolute filter;
the deputy's position relative to the chief is estimated by subtracting the independent absolute estimates and by a
relative filter on single-differenced pseudoranges of the signals both craft track. The report gives both, the baseline,
and the number of signals tracked in common.

## What the comparison with the booklet shows

Bars were pre-registered (`xval/gnss-ssv/PREREGISTRATION.md`, addenda 1 to 5) before the full-size run; results in
`xval/gnss-ssv/RESULTS.md`, cells in `results-*.json`, pinned by `tests/ssv_booklet_results.rs`, misses included.

| bar | what | run 1 (pre-registered reading) | GLONASS-angle variant (diagnostic) |
|---|---|---|---|
| S0 | minimum radiated power, 13 signals, within 0.1 dB | **MET** | MET |
| S1 | upper SSV geometry (table B4) | NOT MET (43 of 52 cells) | all 52 cells in tolerance |
| S2 | lower SSV (table 5.2) | NOT MET (48 of 52) | all 52 |
| S3 | upper SSV with 15/20/25 dB-Hz (table B9) | NOT MET (122 of 155) | 153 of 155 |
| S4 | six GEO missions | NOT MET (132 of 156) | all 156 |
| S5 | HEO mission | NOT MET (18 of 26) | 21 of 26 |
| S6 | lunar mission | **MET** | NOT MET (23 of 26) |
| S7 | parametric pattern against measured GPS L1 panel patterns | NOT MET (RMS 6.3 to 8.8 dB against 3 dB) | n/a |

The booklet is internally inconsistent about GLONASS's reference off-boresight angle: tables B2 and B6 print 20 and 28
degrees, table 4.2 prints 26 and 34. Run 1 used the first (what the pre-registration named); almost every miss in S1 to S5 is
GLONASS. The variant, committed to as a diagnostic before it was run, uses the second, and then the upper SSV, lower SSV and
GEO missions agree cell for cell, outages included. The variant does not replace run 1. **No row is VALIDATED**: the
booklet is a simulation, the verdict rule requires S0 to S3 under the pre-registered reading, and the remaining misses
(GPS L1 at 20 dB-Hz, HEO Galileo, QZSS and NavIC, the lunar GLONASS rows) are not explained.

## Running it

```
kshana scenarios/gnss-ssv-shell.toml            # the upper SSV, reduced size
kshana scenarios/gnss-ssv-heo.toml              # a HEO, parametric sidelobes, limb medium
kshana scenarios/gnss-ssv-lunar-weak.toml       # lunar transfer, weak-signal receiver design
kshana scenarios/gnss-ssv-nav-lunar.toml        # onboard EKF on the way to the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation relative navigation
cargo run --release --example ssv_booklet_check # the full pre-registered comparison (about 12 minutes)
```

Every bundled scenario is cut down to run in seconds; the full-size comparison is the example above. The same kind runs
from Python (`kshana.run`), the browser (WebAssembly), the MCP server (`run_scenario`, inline text only: `pattern_csv` is a
file source and is refused, use `pattern_text`) and the plugins.

## Limits

- MODELLED: nothing here was compared with measured on-orbit GNSS reception. The booklet is a simulation.
- Keplerian two-body orbits for the GNSS constellations and for the user in the sweeps; the lunar transfer is a two-body
  ellipse, not a propagated trajectory.
- The medium is a stated simple model with straight-ray integration; it is not a space-weather forecast.
- The navigation filter is a design study: no manoeuvres, no attitude, no multipath, and the truth shares its Sun and Moon
  ephemerides with the filter.
