<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Space weather for PNT and drag

`kshana space-weather` gathers five tools that share one set of space-weather inputs (Kp, ap and
F10.7). Every output is a JSON document with a `label` that says what is modelled and what is
compared with measurements. Code: `src/space_weather_pnt/`. Tests: the module's unit tests and
`tests/space_weather_pnt.rs`.

| Command | What it gives | Evidence |
|---|---|---|
| `kshana space-weather storms` | the storm library: id, dates, peak Kp, NOAA G level, context and source | data (GFZ, CC BY 4.0) |
| `kshana space-weather storm <id> [--altitudes 210,400]` | a storm as three-hour rows: Kp, ap, NOAA level, auroral-oval edge, J71 exospheric temperature, density at each altitude from two models and its ratio to the first interval | indices recorded; densities MODELLED |
| `kshana space-weather dgnss <request.json> [--forecast <3-day-forecast.txt>]` | DGNSS/RTK outage forecast per three hours at a site and the work windows free of outages | MODELLED |
| `kshana space-weather iono <request.json> [--ionex <file>]` | one 4D electron-density field: GNSS slant TEC integrated along rays and the thin-shell value, LF reflection height and one-hop skywave delay, vertical profiles | MODELLED |
| `kshana space-weather density-scorecard <windows.csv>` | four density models against accelerometer-derived densities, per campaign | measured comparison |
| `kshana space-weather lifetime <request.json>` | circular-orbit lifetime with the density uncertainty from the model error and the index forecast error | MODELLED |

Examples are in `examples/space-weather/`.

## Storm library

`data/space-weather/storms.json` (10 KB, embedded) holds the three-hourly Kp and ap, the daily Ap,
the observed F10.7 and its centred 81-day mean for these windows, copied from the GFZ file
`Kp_ap_Ap_SN_F107_since_1932.txt` (https://kp.gfz.de/, CC BY 4.0; Matzka et al. 2021,
doi:10.1029/2020SW002641) by `data/space-weather/make_storms.py`:

| id | days | peak Kp | why it is here |
|---|---|---|---|
| `2003-10-halloween` | 28 Oct to 1 Nov 2003 | 9 (G5) | extreme storms; WAAS vertical guidance was unavailable for hours (FAA) |
| `2008-06-quiet` | 10 to 12 Jun 2008 | below 2 | quiet reference at the deep 2008 solar minimum |
| `2015-03-st-patricks` | 16 to 19 Mar 2015 | 8- (G4) | the strongest storm of solar cycle 24 by Dst |
| `2017-09-08` | 6 to 9 Sep 2017 | 8+ (G4) | after the X9.3 flare |
| `2022-02-starlink` | 1 to 6 Feb 2022 | 5+ (G1) | the minor storms that ended up to 40 of 49 newly launched Starlink satellites (SpaceX) |
| `2024-05-gannon` | 9 to 13 May 2024 | 9 (G5) | first G5 since 2003; GNSS-guided farm machinery disrupted |
| `2024-10-10` | 9 to 12 Oct 2024 | 9- (G4) | after the X1.8 flare of 9 Oct |
| `2025-11-12` | 10 to 14 Nov 2025 | 9- (G4) | the November 2025 superstorm; GPS errors of about 30 ft reported in farming (RNTF) |
| `synthetic-extreme` | 3 days | 9 for 24 h | SYNTHETIC stress case, not an observation; Kp saturates at 9 |

The densities of a storm timeline are the Jacchia 1971 diurnal-mean profile and NRLMSISE-00
averaged over latitude (60 S to 60 N, cosine weighted) and local time, NRLMSISE-00 with its
three-hourly ap history (switch 9 = -1). The ratio to the first interval is the storm's drag
increase as each model sees it. The test `the_february_2022_minor_storm_raises_the_density_at_210_km`
checks only that both models raise the 210 km density by more than 10 % in that storm; the size of
the rise is MODELLED and not compared with the published reconstructions of that event.

## DGNSS/RTK outage forecaster

Per three-hour interval at a site:

1. the environmental baseline score `b` of `kshana env-baseline` (src/env_baseline.rs; its
   constants are pre-registered and cited there) at the interval's middle;
2. the vertical ionospheric gradient `g = 4 * (425 / 4)^b` mm/km: 4 mm/km is the nominal one-sigma
   gradient bound of the GBAS error model for the conterminous US (Lee, Pullen, Datta-Barua and
   Enge 2007, J. Aircraft 44(5)); 425 mm/km is the upper bound of the CONUS ionospheric anomaly
   threat model (Datta-Barua et al. 2010, J. Aircraft 47(4)). **The log-linear interpolation by
   `b` is this tool's assumption.** It is not calibrated against outage records;
3. the differential error `g * baseline * M(el)`, with the thin-shell obliquity factor at the
   request's reference elevation (30 degrees unless given), one sigma, metres of L1 delay;
4. scintillation risk when the baseline is `disturbed` in the high- or low-latitude regime;
5. an outage when the error passes the limit (1 m for DGNSS, 0.25 m for RTK, about a quarter of the
   0.86 m wide-lane wavelength, unless `limit_m` is given), or for RTK on scintillation risk. An
   outage is `storm_driven` when the same baseline is within the limit at `b = 0`.

The Kp intervals come from one of: `"storm": "<id>"`, `"intervals": [{"start_utc", "kp", "f107"}]`,
or a NOAA SWPC 3-day forecast (`--forecast <file>` or `"swpc_forecast": "<text>"`; the forecast
carries no F10.7, so `"f107"` sets it, 150 sfu by default). The current forecast is at
https://services.swpc.noaa.gov/text/3-day-forecast.txt (NOAA, public domain).

Acceptance (backlog B3601, "Nov 2025 superstorm reproduced qualitatively"): for a central-Iowa
farm on 20 km single-base RTK, the forecaster flags storm-driven outages from 00 to 06 UT on
12 November 2025 (the evening of the 11th locally) with modelled differential errors of metres,
the order of the ~30 ft reported, and no outage on the quiet 11 November (unit test
`the_november_2025_superstorm_is_reproduced_qualitatively_for_us_farm_rtk`). This is a qualitative
reproduction of a news report, not a validation.

## 4D ionosphere (GNSS and LF in one field)

`Ne(lat, lon, h, t)` is an alpha-Chapman F layer plus, at and below 100 km, the Wait exponential D
region (Wait and Spies 1964, NBS Technical Note 300):

- The F layer's peak `NmF2 = VTEC / (H sqrt(2 pi e))` makes its height integral equal the vertical
  TEC of the source at the same place and time: Klobuchar coefficients (the IS-GPS-200 example set
  by default), a constant, or an IONEX map given with `--ionex` (rotated-map interpolation, no
  extrapolation outside the maps). `hmf2_km` (350) and `scale_height_km` (60) are request fields.
  Slant TEC is integrated along each ray in 1 km steps up to 2000 km, so the plasmasphere above is
  left out; the thin-shell value at 350 km is reported beside it.
- The D region uses `h' = 74 km, beta = 0.30 /km` by day and `87 km, 0.50 /km` by night (the LWPC
  defaults), linear in the solar zenith angle at the path midpoint between 90 and 99 degrees, or
  the request's `d_region`. LF reflects where `2.5e5 exp(beta (h - h'))` equals `2 pi f`: at
  100 kHz about 77 km by day and 89 km by night. The one-hop path over a spherical Earth gives the
  skywave delay after the groundwave (groundwave at the vacuum speed of light; the secondary-factor
  delay is not added) and the elevation of arrival.

Storm effects reach the F layer only through the TEC source (an IONEX map of the storm day carries
them; Klobuchar coefficients do not). The D region has no storm response unless `d_region` gives
one. Global ionosphere maps are not shipped: the licence of the CODE maps could not be confirmed
(see `tests/fixtures/ionex_code_gim/NOTICE.md`); fetch one with that fixture's `fetch.sh` pattern
and pass it with `--ionex`.

## Density-model scorecard

Input: the window file of the TOLEOS accelerometer oracle
(`tests/fixtures/space_weather_density_accelerometer_oracle/windows_j71.csv`; TOLEOS DNSxACC_2
densities of CHAMP, GRACE-A and GRACE-FO 1 from the ESA Swarm DISC server, free and open under the
ESA data policy; GFZ indices; sources and hashes in that folder's NOTICE.md). Models: the static
piecewise-exponential profile, Jacchia 1971 at the diurnal-mean temperature, Jacchia 1971 at each
point, and NRLMSISE-00 (given the Ap of the window's Kp as its daily Ap). All four are empirical;
the engine has no physics-based model, so physics-based versus empirical cannot be scored here.

First run (2026-11-20, pre-registered in `tests/space_weather_pnt.rs`), ratio model/measured:

| model | CHAMP 2001 median | GRACE-A 2002 | GRACE-FO 1 2024 | GRACE-A 2008 (minimum) | all: rms log10 | all: within factor 2 |
|---|---|---|---|---|---|---|
| static | 0.82 | 0.68 | 0.65 | 12.8 | 0.638 | 55 % |
| Jacchia 1971 mean | 1.42 | 1.15 | 1.46 | 1.83 | 0.219 | 83 % |
| Jacchia 1971 | 1.34 | 1.27 | 1.46 | 1.74 | 0.199 | 91 % |
| NRLMSISE-00 | 1.26 | 1.08 | 1.30 | 1.73 | 0.176 | 93 % |

The 2008 overestimate by the models reproduces the sign of the finding of Emmert, Lean and Picone
(2010, Geophys. Res. Lett. 37, L12102) that the 2008 minimum was less dense than the models
predict. All three activity-driven models are also denser than these measurements at solar
maximum; part of that may be the accelerometer products' own scale (drag-coefficient modelling),
which this comparison cannot separate. An rms log10 ratio of 0.176 is a one-sigma ln-density error
of about 0.41 for NRLMSISE-00 on these campaigns.

## Lifetime with density uncertainty

The lifetime request gives the altitude, mass, area, drag coefficient (2.2 by default), F10.7 and
Ap held constant (no solar cycle), the model (`nrlmsise00` or `j71`) and three one-sigma errors:
`density_sigma_ln` (for example 0.41 from the scorecard), `f107_sigma` and `ap_sigma`. The index
errors pass through the density's derivatives at the starting altitude (central differences) and
add in quadrature to the model error; the lifetime percentiles follow because a density factor `k`
divides the lifetime by `k`. The decay is the circular-orbit `da/dt = -rho B sqrt(mu a)` with
`B = Cd A / m` down to 120 km.
