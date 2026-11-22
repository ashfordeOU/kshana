# Amateur-RF orbit determination and object characterisation

Module: `src/amateur_od.rs` (library API). Status: **MODELLED**. Every number below describes the given
data under the stated models; nothing here describes a product or certifies an orbit.

## What it does

| Piece | Function | Reuses |
|---|---|---|
| Doppler records in the STRF layout | `parse_strf_doppler`, `parse_strf_sites` | — |
| SatNOGS Network observation record (site + downlink) | `site_from_satnogs_observation` | `serde_json` |
| On-board GPS fixes (`X,Y,Z,TOW`) | `parse_ecef_tow_csv`, `fixes_to_observations` | `cio::itrs_to_gcrs`, `eop::EopSeries` |
| One-way Doppler orbit determination (state + one carrier per site) | `fit_doppler`, `doppler_model` | `precise_od` force model and state-transition matrix, `batch_ls::gauss_newton_analytic` |
| Precise OD from GPS fixes | `precise_od::fit` on `fixes_to_observations` | `precise_od` |
| Unknown-object identification against candidate TLEs | `rank_tles` | `tle`, `sgp4`, `sgp4::teme_to_itrs_matrix_eop` |
| Ballistic term from SGP4 `B*` | `cd_area_over_mass_from_bstar` | — |

## Input formats

**Doppler records (STRF layout).** Plain text, one record per line, whitespace separated, `#` comments and
blank lines skipped:

```
# MJD(UTC)          frequency(Hz)     flux   site-id
58686.6012345678    435525123.40      12.3   4171
```

This is the layout written by the STRF radio-frequency satellite tracking toolkit of C. Bassa
(`github.com/cbassa/strf`, GPL-3.0). Kshana reads the documented layout only; no STRF code is used.

**Sites (STRF `sites.txt`).** `id code lat(deg) lon(deg) alt(m) name…` per line, WGS-84 geodetic.

**SatNOGS.** One observation record of the SatNOGS Network API (`network.satnogs.org/api/observations/<id>/`) gives
the site (`ground_station`, `station_lat`, `station_lng`, `station_alt`) and the nominal downlink
(`transmitter_downlink_low`, Hz). SatNOGS states its network data are CC BY-SA 4.0; a user who fetches
records carries that licence on them. Kshana neither bundles nor fetches SatNOGS data.

**GPS fixes.** `X,Y,Z,TOW` per line, comma separated: Earth-fixed metres and GPS seconds of week. Rows of all-zero
position (no fix) are dropped. This is the layout of the public Lucky-7 file below.

## Measurement model (Doppler)

`f = f_site · (1 − ρ̇ / c)`, where `ρ̇` is the range rate between the satellite and the station in GCRS.
The station moves with the Earth (`ω × r` in ITRS, rotated with the IAU 2006/2000A CIO chain and the IERS
EOP). One carrier `f_site` is estimated per receiving site, which absorbs the transmitter offset and each
receiver's frequency error. Not modelled: light time and aberration (below 0.1 Hz at 437 MHz in LEO), the
second-order Doppler term, troposphere and ionosphere. The Jacobian is analytic: the range-rate partials
chained through the state-transition matrix of `precise_od`.

## The published case: Lucky-7

Lucky-7 is a 1U CubeSat (NORAD 44406, launch 2019-038) with an on-board GPS receiver. Its GPS track of
2019-07-22 and the analysis are public:

* D. Estévez, *Precise orbit determination for Lucky-7*, destevez.net, 15 August 2019, and the notebook
  `Lucky-7 orbit.ipynb` in `github.com/daniestevez/jupyter_notebooks` (commit `8c62279`). The repository
  states its data are CC BY 4.0 where possible and that data from other sources keep their original terms.
* P. Kovář, P. Puričer, K. Kovářová, *Study of the Two-Line Element Accuracy by 1U CubeSat with a GPS
  Receiver*, Sensors 22(8) 2902 (2022), doi 10.3390/s22082902 (CC BY): the satellite, its receiver
  (position error better than 10 m) and orbit (about 520 km, 97.6°).

`scripts/fetch_lucky7.sh <dir>` fetches the two files with SHA-256 pins; they are never committed (the
GPS telemetry belongs to the Lucky-7 team and the element sets come from Space-Track, whose user
agreement limits redistribution). The IERS EOP rows for 2019-07-20..24 are vendored
(`tests/fixtures/agency/eop/finals2000A_2019203.txt`, IERS open data).

### Pre-registered bars

Fixed in `tests/amateur_od_lucky7.rs` before the first run on the data:

1. **Identification.** Ranking the notebook's 2019-038 element sets against all valid fixes gives the
   same best object as the published table (NORAD 44406) and the top three RMS values within 0.1 km of
   the published 8.67616, 51.3546 and 82.1203 km.
2. **Precise OD.** Fitting the first 330 fixes (the article's arc, before a timestamp step), the
   transverse and normal residual RMS are each ≤ 5 m: the article states the V and N residuals are
   "usually smaller than 5 m".

### Results

First run, 21 November 2026 (debug build, `cargo test --test amateur_od_lucky7`). Every number is MODELLED.

| Check | Published | Kshana | Bar |
|---|---|---|---|
| Best match among the 2019-038 element sets | NORAD 44406, 8.67616 km | NORAD 44406, 8.6869 km | **MET** |
| Second | 44404, 51.3546 km | 44404, 51.3628 km | **MET** |
| Third | 44414, 82.1203 km | 44414, 82.1282 km | **MET** |
| GPS-fix OD, first 330 fixes: transverse RMS | V "usually smaller than 5 m" | 5.17 m | **NOT MET** (≤ 5 m) |
| GPS-fix OD, first 330 fixes: normal RMS | N "usually smaller than 5 m" | 5.57 m | **NOT MET** (≤ 5 m) |
| GPS-fix OD: radial RMS | B "centred on −10 m" (no RMS stated) | 17.16 m | not a bar |

The fit uses EGM2008 to degree 40, Sun and Moon, cannonball SRP, drag with `C_D·A/m` = 0.00028 m²/kg from the
identified object's `B*` (2.2120e-5 /ER), and the once-per-revolution empirical accelerations; fixes weighted at
10 m (the receiver figure of Kovář et al. 2022), 5-sigma editing (326 kept, 4 edited), converged in 6
iterations. The 3-D RMS is 18.77 m, mostly radial, as in the article. The OD bar misses by 0.2 and 0.6 m and is
recorded as NOT MET; the test pins both numbers, and the bar is not moved. Not tried after the run: the article
uses 360×360 EGM96, MSISE90 density with space weather and estimates against GMAT's measurement model; any later
change will be a new, disclosed run.

The synthetic Doppler check recovers the epoch position to below 1 mm and both carriers to below 0.01 Hz from a
2 km / 2 m/s / 2 kHz perturbed start (139 samples above 10° at two sites over six hours, 5 iterations).

Run it: `scripts/fetch_lucky7.sh ~/data/lucky7 && KSHANA_LUCKY7_DIR=~/data/lucky7 cargo test --release --test amateur_od_lucky7 -- --nocapture`.
Without the variable the two data tests print that they were skipped and pass; CI runs only the
synthetic Doppler test.

## Characterisation from public tracking data

`cd_area_over_mass_from_bstar` inverts `B* = ρ0·C_D·A/(2m)` with the SGP4 reference density
ρ0 = 0.15696615 kg/(m²·Earth radius) (Hoots & Roehrich, *Spacetrack Report No. 3*, 1980). `B*` is a fitted
SGP4 parameter that also absorbs other mismodelling, so the result characterises an element set, not the
object's true shape. The Lucky-7 OD above takes its drag term from the identified object's own `B*`.

## Left out

* **Real amateur Doppler data.** No public Doppler record set of a small satellite with an independent
  truth orbit and a stated OD accuracy was found that could be fetched with clear terms; the Doppler path
  is checked by a synthetic self-recovery only (`doppler_od_recovers_a_synthetic_truth`). A SatNOGS
  waterfall-to-Doppler extractor is not built.
* **Size and mass catalogues.** ESA DISCOS needs an account and CelesTrak SATCAT states no licence; neither
  is used. Characterisation is limited to the `B*` ballistic term.
* **Manoeuvre detection** from tracking data is outside this repository.
