<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B8 (0.41): environmental baseline per site and time

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are for the owner to fix at sign-off. After sign-off the bars may
be tightened after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that
asserts the miss. Public sources only. Advisory software, not certified navigation equipment.

## Why this row

A monitoring network that alarms on every ionospheric disturbance loses its operator's trust. Before an alarm is
attributed to interference, the operator needs to know how much natural degradation to expect at that site and hour.
Kshana has space-weather indices (`src/space_weather.rs`: Kp/ap conversion, F10.7 handling), the geomagnetic field
(`src/igrf.rs`) and an IQ scintillation channel (`src/iq/channel/scint.rs`, checked against one measured night in
`xval/scint-malindi/`, a finding), but no per-site baseline. B8 adds one: for a site and a UTC hour, an expected level
of natural ionospheric disturbance. The roadmap's done-test is a comparison with **documented event days**; this file
fixes which days, which stations, what is measured and the bars, before the baseline is written.

## 1. The baseline (what it outputs; its constants are fixed before scoring data is fetched)

Inputs: site latitude, longitude and height; UTC hour; the 3-hourly Kp and the daily F10.7 (observed) for that time.
Derived: the site's geomagnetic (dipole) latitude `Φ` from IGRF at the epoch, magnetic local time and solar local time.

Output per site-hour: a score `b ∈ [0, 1]` and a level `quiet` (`b < 0.33`), `elevated` (`0.33 ≤ b < 0.67`) or
`disturbed` (`b ≥ 0.67`). The score combines three published climatological regimes, each a fixed function written
into `EnvBaselineParams::v1` with its source cited in the code:

- **high latitude** (`|Φ| ≥ 55°`): rises with Kp, with the auroral oval moving equatorward as Kp rises;
- **low latitude** (`|Φ| ≤ 20°`): post-sunset (19:00 to 02:00 solar local time) irregularities, larger near the
  equinoxes and with higher F10.7, suppressed or enhanced at high Kp as the literature describes;
- **mid latitude**: quiet except at high Kp (storm-time enhancement), threshold Kp ≥ 7 (*proposed*).

**Rule:** every constant comes from published climatology or physics and from **synthetic data only**. None is set from
or checked against the scoring data below. The baseline code and its constants are committed **before** the scoring data
is fetched (section 5).

## 2. Data (public, fetched by script with SHA-256, never vendored)

- **Indices:** GFZ Kp, ap and F10.7, https://kp.gfz.de/app/files/Kp_ap_Ap_SN_F107_since_1932.txt (CC BY 4.0), and the
  international quiet and disturbed days, https://kp.gfz.de/app/files/Q_D_days_since_1932.txt. The file is fetched once,
  its SHA-256 written to `xval/env-baseline/MANIFEST.tsv`, and the run refuses a different file.
- **Station observations:** IGS RINEX 3 daily 30 s observation files with dual-frequency GPS carrier phase (L1 and L2)
  and `S1C`, from the BKG IGS data centre, https://igs.bkg.bund.de/root_ftp/IGS/ (open with attribution to the IGS), and
  broadcast navigation files for elevation. Fetched by `xval/env-baseline/fetch.sh`, SHA-256 per file in the manifest.

**Documented event days (chosen by rule, from the index file only):**

- **Storm days:** every UTC day from 2015-01-01 to 2025-12-31 whose maximum 3-hourly Kp is at least 8− (Kp ≥ 7.67).
  If there are more than 10, the 10 with the highest daily Ap.
- **Quiet days:** from the same months as the storm days, the international quiet days (the five Q-days per month),
  at most 20, chosen by lowest daily Ap.
- **Equinox low-latitude days:** the international quiet days of March and of September-October 2024 (solar maximum,
  high F10.7), at most 10 by lowest daily Ap, where the low-latitude regime predicts post-sunset activity without any
  storm. This tests that the baseline is not just a Kp detector.

**Stations (chosen by rule):** IGS stations with RINEX 3 30 s files carrying L1, L2 and `S1C` on at least 90% of the
event days, grouped into three bands of `|Φ|`: ≥ 60°, 35° to 55°, ≤ 15°. In each band the 4 stations with the lowest
SHA-256 of their 9-character name (*proposed*). The station list is committed after it is drawn and before any
observation file is opened beyond its header.

## 3. The measured disturbance (the comparison, independent of the baseline)

Per station-hour, from the RINEX files only:

- **ROTI** (rate-of-TEC index): for each GPS satellite above 30° elevation, the geometry-free carrier-phase combination
  gives slant TEC; `ROT` = its 30 s difference in TECU/min, cycle slips (a jump > 1 TECU in 30 s, *proposed*) reset the
  arc; `ROTI` = the standard deviation of `ROT` over 5 min. The station-hour value `ROTI_h` is the 90th percentile over
  satellites and 5-min windows in the hour.
- **Measured label** `y = 1` (disturbed) if `ROTI_h ≥ 0.5 TECU/min` (*proposed*; a threshold used widely in the
  literature for irregularities), else `y = 0`. Station-hours with fewer than 4 satellites above 30° for 30 min are
  excluded and counted.
- **C/N0 depression** (reported, no bar): the station's hourly median `S1C` departure from its quiet-day elevation
  template.

The ROTI computation is written in a numpy script that shares no code with the engine (`xval/env-baseline/roti.py`), so
the label does not come from Kshana.

## 4. Metrics and bars (*proposed*)

| Id | Metric | Bar |
|---|---|---|
| N1 non-vacuity | station-hours with `y = 1` over all event days | at least **200**, from at least 2 bands; otherwise NOT ASSESSABLE |
| V1 discrimination | AUC of `b` for `y` over all scored station-hours (ties half) | **≥ 0.75** |
| V2 quiet mid-latitude | on quiet days, band 35° to 55°: share of station-hours the baseline calls `quiet` | **≥ 0.95** |
| V3 storm high-latitude | on storm days, band ≥ 60°: share of `y = 1` station-hours the baseline calls `elevated` or `disturbed` | **≥ 0.80** |
| V4 low latitude, no storm | on the equinox days, band ≤ 15°: AUC of `b` for `y` within the band | **≥ 0.70** |
| V5 determinism | baseline outputs byte-identical across platforms and surfaces | exact |

MET only if N1 and V1 to V5 are all met.

## 5. Process and blinding

1. Owner signs off this file; committed alone.
2. The baseline, its constants and tests on synthetic data are committed. The ROTI script is committed and tested on a
   synthetic TEC series with known ROTI.
3. The index file is fetched; the event days are drawn by rule and committed.
4. The station list is drawn from file headers and availability only, and committed.
5. The observation files are fetched; ROTI labels are computed and committed **before** the baseline is run on them.
6. The baseline is run once; `RESULTS.md` records every bar, a miss included.

**Disclosed:** one measured scintillation night (Zenodo record 16941224, 2023-03-18, a low-latitude site) has been
analysed in this repository for the IQ scintillation channel (`xval/scint-malindi/`). It is not an event day here and
no constant of the baseline is taken from it.

## What a MET and a NOT MET mean

- **MET** means the baseline ranks station-hours by natural ionospheric disturbance, measured independently by ROTI at
  public reference stations on days chosen in advance, to the stated degree in each latitude regime.
- **MET does not mean** the baseline predicts a particular disturbance in advance (it uses observed, not forecast,
  indices), that it explains every C/N0 drop, that it covers solar radio bursts, multipath or obstruction, or that
  using it to suppress alarms would not hide interference. Those are B4b's questions.
- **NOT MET** is published per bar and per band; the baseline stays MODELLED and is shipped labelled as such or not at
  all (owner's choice).

## Out of scope

Forecasting; solar radio bursts (no public burst list is pinned here; candidate source the e-Callisto network,
https://www.e-callisto.org, left to B4b); tropospheric effects; amplitude scintillation index S4 (30 s RINEX cannot give
it); multipath and obstruction; any site-specific RF environment.

## Open questions for sign-off

1. The ROTI threshold (0.5 TECU/min) and the 90th-percentile aggregation per station-hour.
2. The storm-day rule (Kp ≥ 8−, 2015 to 2025, at most 10 days) and the equinox low-latitude set.
3. Whether the equinox set should use a different year if 2024 RINEX coverage at low latitude is thin (decided from
   availability only, before any observation is opened).
