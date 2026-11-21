<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Sweep 1: frames and time scales where two inputs are combined

A read-only sweep of the engine at `open/integration-2026-11-20d` @ 3f493675d, made on 2026-11-21.
It looks for places where two values are combined, compared or used as one epoch or one frame
when they may be on different time scales (UTC, GPS, TAI, TT, TDB, BDT, GST, GLONASS, UT1) or in
different frames (RTN, ECI/GCRS/ICRF/EME2000, TEME, ECEF/ITRS, ENU/NED, lunar PA/ME). Each
finding was checked against the definitions:

- **Time scales:** TAI − UTC = 37 s since 2017; GPS = TAI − 19 s; BDT = GPS − 14 s; GST = GPS;
  TT = TAI + 32.184 s; TDB − TT under 1.7 ms; GLONASS = UTC(SU) + 3 h.
- **RTN axes:** R along r, N along r × v, T = N × R.
- **Covariance:** C′ = R C Rᵀ.

The real bugs are fixed on their own branches, each with a test and a CHANGELOG line naming
the affected outputs. The other rows are documentation or assertion gaps: their doc comments
are corrected on `open/audit-1`, or they are left as stated, documented approximations.

## Findings

| # | Location | What | Assumed | Enforced? | Risk | Disposition |
|---|---|---|---|---|---|---|
| 1 | `src/receiver_trust/machines/rtcm3.rs` (`msm`) | BeiDou MSM epochs (BDT time of week) filed under GPS time of week unchanged | BDT = GPS | no | a receiver epoch's BeiDou C/N0 lands 14 s early in the `receiver-trust` RTCM timeline | **bug**, fixed on `open/fix-rtcm-bdt-epoch` |
| 2 | `src/lunar_phase.rs` `epoch_jd`, used by `lunar_rendezvous.rs`, `mission_thread/earth/ground_network.rs` (moon-direction), `mission_thread/earth/tli_cruise.rs` | a UTC Julian date passed where TDB/TT is required (lunar orientation, Moon ephemeris, third bodies); the doc stated the error as 70 m | UTC = TDB | no | the Moon is about 70 km off along its track; lunar orientation is off by 1.8e-4 rad (320 m at the surface) | **bug**, fixed on `open/fix-lunar-epoch-tdb` |
| 3 | `src/mission_thread/earth/ground_network.rs` (`coverage`) | GCRF vehicle compared with stations rotated by GMST alone | GMST rotation = GCRS↔ITRS | no | about 0.4° of precession (2028); elevations off by a few tenths of a degree near the mask | **bug**, fixed on `open/fix-ground-network-gcrf` |
| 4 | `src/orbit.rs` `to_sp3_string`/`to_oem_string`, `src/sp3.rs`/`src/oem.rs` `from_propagators` | a self-dated satellite (TLE, RINEX, SP3) evaluated at its own epoch + t but labelled scenario epoch + t; OEM labelled `GPS` while the epoch is UTC | own epoch = scenario epoch; UTC = GPS | no | exported states at the wrong instant (hours to decades with the J2000 default); 18 s label error | **bug**, fixed on `open/fix-orbit-export-epochs` |
| 5 | `src/space_receiver/od_vs_tle.rs` | OEM `TIME_SYSTEM` ignored, epochs read as UTC | every OEM is UTC | no | 18 s (about 135 km in LEO) for a GPS-time OEM | **bug**, fixed on `open/fix-od-vs-tle-time-system` |
| 6 | `src/lunar_oem.rs`, `src/lunar_interop*` | OEM `TIME_SYSTEM` label against the epochs | n/a | n/a | n/a | owned by Builder B, cross-reference only |
| 7 | `src/sp3.rs` `interpolator`, `src/orbit.rs` `own_jd_utc` (Sp3Precise arm) | SP3 calendar (GPS time) used as UT1 and returned as a "UTC" date | GPS = UTC = UT1 | no | cancels for SP3-only scenarios; 18 s (about 35 km at GNSS radius) against UTC-dated satellites in one scenario | doc corrected (`open/audit-1`); a code fix needs the SP3 `%c` time system (row 8) |
| 8 | `src/sp3.rs` (`%c` lines skipped), `src/rinex_obs.rs` (`TIME OF FIRST OBS` columns 49–51 not read), `src/pvt.rs` | file time-system fields not read; GPS time assumed | every SP3/OBS file is GPS time | no | a BDT-scaled BeiDou-only OBS file or a UTC/TAI SP3 is 14–37 s off | gap: read and enforce the fields (follow-up) |
| 9 | `src/orbit.rs` (orbiting-user snapshot, `ref_tow`) | broadcast ephemerides of several systems evaluated at their own Toe as one epoch; BeiDou Toe in BDT | all Toe are one instant | no | satellites up to the ephemeris age (2 h) and 14 s apart in one snapshot for an orbiting user | gap (follow-up) |
| 10 | `src/precise_products.rs` `sun_ecef`, `src/ppp_real.rs` `moon_ecef`, `src/ephem.rs` `sun_position` | J2000-referenced Sun and Moon rotated to ECEF by GMST (no precession); the docs said "of date" and "about 0.01°" | J2000 = of date | no | about 0.36° (2026): yaw attitude, phase wind-up and the solid tide (millimetres) | doc corrected (`open/audit-1`) |
| 11 | `src/tides.rs` `solid_earth_tide_step1` (also `doodson_args`, `forces.rs`, `propagator.rs` `EarthFixedFrame::Era`) | Earth rotation angle at TT for UT1, no GCRS→CIRS on J2000 bodies | TT = UT1; J2000 = CIRS | partly documented | 0.29° + 0.36° in the bodies' Earth-fixed longitudes | doc corrected on step 1 (`open/audit-1`) |
| 12 | `src/lunar_perturbed.rs` `EphemerisForceModel` | C22 with S22 = 0 (a principal-axis value) evaluated in the mean-Earth frame | PA = ME | no | bulge turned about 68″ (an S22 of about 0.07 % of C22) | doc corrected (`open/audit-1`) |
| 13 | `src/rinex.rs`, `src/sp3.rs`, `src/glonass.rs` ECEF→TEME (GMST, UT1 = UTC, no polar motion) vs `src/orbit.rs` `position_in_frame(Itrs, ...)` (CIO, real UT1, polar motion) | two reductions in one round trip | the two agree | no | up to 1.7 km at GNSS radius with a real DUT1; no production caller found | gap (latent) |
| 14 | `src/receiver_trust/machines/rtklib.rs` | a `BDT`/`GST` header accepted but week/TOW keyed from the GPS 1980 epoch | every week is a GPS week | no | BDT weeks off by 1356 | gap (follow-up) |
| 15 | `src/rtcm_ssr.rs`, `src/receiver_trust/machines/rtcm3.rs` (GLONASS), `src/jammertest/dataset.rs` | GPS − UTC hard-coded as 18 s | data after 2017-01-01 | documented | 1–4 s off for older logs | documented approximation |
| 16 | `src/orbit_data/cdm.rs` `relative_state` | Earth-fixed `REF_FRAME` not checked (RTN from Earth-fixed velocity, no ω × r) | inertial REF_FRAME | frame mismatch between objects checked; ITRF not | usually under the 1 m/s consistency tolerance | gap |
| 17 | `src/propagator.rs` `Geopotential` (`ut1_minus_tt_s = 0` default, `with_ut1_minus_tt` has no caller), `src/precise_od.rs` (UT1 = TT without EOP) | Earth rotation at TT | UT1 = TT | documented | 0.29° in the field's longitude | documented approximation |

## Checked and correct (selection)

- **Time.**
  - The leap table, TAI/TT/GPS conversions and constants: `src/timescales.rs`, `src/gnss_time.rs`.
  - BDT↔GPS weeks and seconds: `src/rinex.rs`, `src/pvt.rs`.
  - GLONASS UTC: `src/glonass.rs`.
  - BDT and GLONASS SSR: `src/rtcm_ssr.rs`.
  - `src/rtk_qa/liveness.rs`, `src/connect.rs`, `src/eop.rs`, `src/ephemeris.rs`, `src/passes.rs`,
    `src/propagator.rs` (TT→TDB for kernels), `src/mission_thread/conversions.rs`, `src/mars_od.rs`,
    `src/spk_writer.rs`, `src/ccsds_tdm.rs`, `src/realdata/clk.rs` (enforces `TIME SYSTEM ID`),
    and `src/orbit_data/ephem.rs` (TIME_SYSTEM consistent across segments).
- **Frames.**
  - RTN covariance `B P Bᵀ` and its transpose: `src/orbit_data/covariance.rs`.
  - CDM RTN axes: `src/orbit_data/cdm.rs`.
  - TEME↔PEF and polar motion: `src/frames.rs`.
  - TEME→GCRS: `src/nutation.rs`.
  - The CIO chain: `src/cio.rs`.
  - ECEF↔ECI velocity with ω × r: `src/sgp4.rs`, `src/leo_link/geometry.rs`, `src/interop/scene.rs`.
  - Sagnac terms: `src/pvt.rs`, `src/sil_obs.rs`, `src/fusion/carrier_tc.rs`.
  - ENU/NED bases and azimuth atan2(E, N) throughout.
  - INS mechanisation.
  - Lunar ME/PA/DE440 matrices and their transposes.
  - `src/space_receiver/od_vs_tle.rs` REF_FRAME handling.
  - `src/maneuver.rs` and `src/lunar_rendezvous.rs` LVLH.
