<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R3.4: GPT3 and VMF3 troposphere, against the reference code and IGS zenith delays

**Status: proposed, committed before any engine code, before the reference code is run and before
any zenith-delay data is read.** The bars below become binding when the owner signs them. They may be
tightened after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by
a test that asserts the miss. Advisory software, not type-approved navigation equipment.

## Why this row

Kshana's positioning and PPP paths take the hydrostatic zenith delay from a standard atmosphere at the
station height (Saastamoinen) and map it, and the wet delay, with the Niell functions. R3.4 adds the
empirical model GPT3 (pressure, temperature, water vapour, mean temperature, lapse rate, mapping
coefficients and gradients on a 1° or 5° grid) and the Vienna mapping functions VMF3, with either GPT3's
coefficients or the operational VMF3 grids, and scores them twice: against the reference code
(implementation) and against IGS final zenith path delays (accuracy).

## Sources and licences (checked before this pre-registration)

- **Model description.** Landskron and Böhm (2018), *VMF3/GPT3: refined discrete and empirical
  troposphere mapping functions*, J. Geod. 92, doi:10.1007/s00190-017-1066-2. Implemented from the
  paper and the grid-file layout; no reference code is copied or ported line by line.
- **Oracle A: the reference code** (`gpt3_1.m`, `gpt3_5.m`, `vmf3.m`, `vmf3_grid.m` and their Fortran
  versions) from the VMF Data Server of TU Wien (`vmf.geo.tuwien.ac.at/codes/`). The codes carry no
  licence, so **they are not vendored**: a script in `xval/troposphere/` downloads them, records their
  SHA-256 in `RESULTS.md`, and runs them (GNU Octave or gfortran) as a separate program.
- **GPT3 grid files** `gpt3_1.grd` and `gpt3_5.grd` (same server). The server's terms of use say its
  products are free of charge and that non-forecast products derived from ECMWF data are under
  CC BY 4.0, with ECMWF to be acknowledged; the grid files are not named there. **Read as CC BY 4.0, but
  not vendored on that reading alone.** The engine reads a grid file the user names; the tests fetch it
  and check its SHA-256, and skip with a stated reason when it is absent. Vendoring is a separate
  decision for the owner. Attribution (TU Wien, ECMWF) goes wherever the model is used.
- **Operational VMF3 grids** (1° × 1°, 6-hourly, `VMF3_OP`, coefficients and zenith delays), same
  server: non-forecast products, CC BY 4.0, ECMWF acknowledged. Fetched by script, not vendored.
- **Truth B: IGS final troposphere zenith path delay** (the combined product, daily files per
  station, 5-minute sampling), fetched from an IGS global data centre that serves it without a login
  (IGN or BKG). The IGS terms of use (2020) make the data openly available on condition of citation and
  attribution and name no licence, so **the files are fetched by script and not vendored**; the file list
  and SHA-256 hashes are recorded in `RESULTS.md` at download time.

## A. Implementation against the reference code

- **Inputs (fixed now).** The ten receivers of R3.2 (`../r3-2-nequick-g/PREREGISTRATION.md`) plus each
  of them at 3 000 m above its height; epochs: 06:00 UTC on the 1st and the 15th of every month of 2023
  (24 epochs); elevations 3, 5, 7, 10, 15, 20, 30, 45, 60 and 90°; both grid resolutions; GPT3 with
  time variation on (`it = 0`).
- **A1 GPT3.** Every output (pressure, temperature, temperature lapse rate, mean temperature, water
  vapour pressure, `ah`, `aw`, water vapour decrease factor, geoid undulation and the four gradients) is
  within `1e-9` of the reference value relative, or `1e-9` absolute in the reference's units where the
  value is below 1.
- **A2 VMF3.** The hydrostatic and wet mapping functions, from GPT3's `ah` and `aw` and from the
  operational grid coefficients of 1 January and 1 July 2023 interpolated as `vmf3_grid` does, are
  within `1e-9` absolute of the reference at every input.

## B. Accuracy against IGS final zenith path delays

- **Period (held out, fixed now).** 1–31 January 2024 and 1–31 July 2024.
- **Stations.** Every station in the IGS final troposphere files of those days, with the station
  coordinates the files carry. No station is dropped after the data is read; a station without
  coordinates is listed as not scored.
- **Epochs.** 00, 06, 12 and 18 UTC each day; the IGS value is the 5-minute estimate at that time.
- **Models.**
  M1: GPT3 (5°) pressure through the Saastamoinen hydrostatic delay, plus the Askne and Nordius wet
  delay from GPT3's water vapour pressure, mean temperature and decrease factor.
  M2: the operational VMF3 zenith hydrostatic and wet delays, interpolated to the station and corrected
  to its height as the server's interpolation code describes.
  M0, for comparison only (no bar): the current standard-atmosphere Saastamoinen hydrostatic delay
  without a wet delay.
- **Metrics.** Per station, the mean and root mean square of `model ZTD − IGS ZTD` over its scored
  epochs; then the median over stations of each.
- **B1 GPT3.** Median per-station RMS ≤ 4.5 cm, and |median per-station mean| ≤ 1.5 cm, in each month.
- **B2 VMF3.** Median per-station RMS ≤ 1.5 cm, and |median per-station mean| ≤ 0.8 cm, in each month.

The row becomes VALIDATED only if A1, A2, B1 and B2 are all met. If A1 and A2 are met and a B bar is
missed, the implementation is reported as matching the reference and the accuracy miss is published
with its numbers; the row stays MODELLED. The IGS delays are estimates with their own errors (a few
millimetres); the bars are set well above that.
