<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Sweep 3: time edges

A read-only sweep of the engine at `open/integration-2026-11-20d` @ 3f493675d, made on 2026-11-21.
It covers:

- **Leap seconds:** 23:59:60, the end of the table, the instant at which TAI − UTC is looked up.
- **The GNSS week:** week rollover, the time-of-week wrap, the half-week rule.
- **Julian dates:** MJD/JD and its half day.
- **Calendar edges:** day and year boundaries, leap years, formatting at the end of a minute or
  a day.

Each finding was checked against the definitions:

- **Leap seconds:** TAI − UTC is a function of the UTC day; UTC can read 23:59:60.
- **Julian dates:** JD = MJD + 2400000.5.
- **The week:** a time of week restarts every 604 800 s, and two times of week compare under
  the half-week rule (IS-GPS-200 20.3.3.4.3.1).
- **Leap years:** the Gregorian rule.

Real bugs are fixed on their own branches, each with a test and a CHANGELOG line naming the
affected outputs. The remaining rows are gaps, or documented approximations.

## Findings

| # | Location | What | Edge | Enforced? | Risk | Disposition |
|---|---|---|---|---|---|---|
| 1 | `src/eop.rs` `interp_utc_mjd` | UT1 − UTC interpolated straight across a leap second | the day before a leap | no | about 0.5 s of UT1 (230 m at the equator) | **bug**, fixed on `open/fix-eop-leap-interp` |
| 2 | `src/receiver_trust/machines/rtcm3.rs`, `gnss_sdr.rs`, `greis.rs` | epochs keyed by time of week (or of day) alone; GREIS advanced the day on any step back | Saturday → Sunday GPS; midnight; one out-of-order epoch | no | the new week first and a week-long gap; a whole log shifted a day | **bug**, fixed on `open/fix-log-week-rollover` (stacked on `open/fix-rtcm-bdt-epoch`) |
| 3 | `src/rinex.rs` `RinexEphemeris::jd_ut1` | GPS − UTC looked up at the GPS-time date | the 17–18 s after each leap second's GPS-time midnight | no | the UT1 date a second early | **bug**, fixed on `open/fix-rinex-leap-lookup` |
| 4 | `src/tle.rs` (identity epoch), `src/oem.rs` `iso8601`, `src/sil_obs.rs` `epoch_add` | split before rounding | a whole minute in binary (day 100.00625); 59.9999996 s; a hair before midnight | no | `00:08:60.000000`; `60.000000`; 24:00 clamped to 23:00 of the same day | **bug**, fixed on `open/fix-epoch-format-carry` |
| 5 | `src/sp3.rs` `from_propagators`, `src/sil_obsgen.rs` | epoch labels through a single-f64 Julian Date | any clean grid | no | `0 14 59.99998659` | **bug**, fixed on `open/fix-sp3-epoch-grid` (stacked on `open/fix-orbit-export-epochs`) |
| 6 | `src/rtk_qa/liveness.rs` | completeness span from raw time of week | a session across Sunday 00:00 GPS | no | completeness 1.0 whatever was missing | **bug**, fixed on `open/fix-rtk-qa-week-span` |
| 7 | `src/rtcm_ssr.rs` `to_obs` | the first GLONASS epoch taken as day 0 of the week | a stream that opens with GLONASS | no | later corrections days away | **bug**, fixed on `open/fix-rtcm-ssr-glonass-first` |
| 8 | `src/iq/cli/scene.rs` | nearest ephemeris by `\|toe − tow\|` without the half-week rule | a start near the week boundary | no | a record hours away chosen | **bug**, fixed on `open/fix-iq-scene-eph-wrap` |
| 9 | `src/orbit.rs` (navigation-file snapshot) | reference epoch = the smallest Toe; BeiDou BDT mixed in | a file crossing Saturday → Sunday | no | satellites left out of the snapshot | **bug**, fixed on `open/fix-nav-snapshot-reference` |
| 10 | `src/jammertest/dataset.rs` | GPS time of day − 18 s added to the UTC date without a carry | a start in the last 18 s of the UTC day | no | the start a day early | **bug**, fixed on `open/fix-jammertest-start-day` |
| 11 | `src/ccsds_tdm.rs` `parse_epoch_to_tdb`, `src/leo_pass.rs` `parse_epoch_jd`, `src/solar_system.rs`, `src/naif_kernel.rs` (sod ≥ 86 400) | a UTC 23:59:60 label maps to the next day's 00:00:00 and takes the new TAI − UTC; weak range checks (month 13, Feb 31, negative seconds) | 23:59:60.x; malformed dates | no | 1 s, colliding with the next second; malformed input accepted | gap: accept 23:59:60 only on a leap day, as `gnss_time` and `jd2` do, and range-check (follow-up) |
| 12 | `src/oem.rs` parser, `src/telemetry/time.rs`, `src/norad.rs`, `src/interference_map/time.rs`, `src/receiver_trust/ingest.rs` (NMEA), `src/space_weather_pnt/mod.rs` (hour 24), `src/sp3.rs` and `src/rinex_obs.rs` (no range checks) | second 60 accepted in any minute and rolled over | malformed or leap input | no | aliases to the next minute | gap (follow-up) |
| 13 | `src/corrections/has.rs` `message_time` | saturates at the week start | Sunday 00:30 with a Saturday 23:50 message | no | up to 3 600 s and the week wrong (only tests call it) | gap |
| 14 | `src/gnss_navmsg/galileo.rs` `gst_from_gps` | TOW ≥ 604 800 folded without a week carry | end-of-week input | no | the week one short (only tests call it) | gap |
| 15 | `src/rinex.rs` with `src/orbit.rs` (ground-site re-epoch) | a broadcast ephemeris extrapolated past half a week: tk folds back a week, the date does not | a scenario epoch ≥ 3.5 days after Toe | no fit-interval guard | orbit and Earth rotation disagree | gap: refuse beyond the fit interval (follow-up) |
| 16 | `src/pvt.rs` `select_ephemeris` | time of week only; records of the same Toe in consecutive weeks tie | a multi-week navigation file | no | a week-stale record can win | gap |
| 17 | `src/receiver_trust/machines/sbp.rs` | back-fill with the first week seen | messages before the first week-bearing message, from the previous week | no | a week too late | gap |
| 18 | `src/connect.rs` `gps-week-tow` | no guard against a 10-bit week | a receiver CSV with a truncated week | documented requirement, not checked | 19.6 years early | gap: refuse weeks under 1024 (follow-up) |
| 19 | `src/leo_navmsg/mod.rs` | a negative transmit TOW clamped to 0 | transmit before the week boundary | documented clamp | up to the Toe lead late | documented |
| 20 | `src/rtcm_ssr.rs`, `src/receiver_trust/machines/rtcm3.rs` (GLONASS), `src/jammertest/dataset.rs` | GPS − UTC hard-coded at 18 s; GLONASS `tod ≥ 86 400 000` refused | logs before 2017; the leap-second epoch | documented | 1–4 s for older logs; one epoch dropped at a leap | documented |
| 21 | `src/sp3.rs` (interpolator date) | the GPS-time calendar used as UT1 | any | documented (`open/audit-1`) | 18 s against UTC-dated satellites | see sweep 1 |

## The `m5_hybrid` ground-report average (from sweep 2)

`src/m5_hybrid.rs` averages the ground power reports of a site in dBW (the mean of the
logarithms). The pre-registration, `docs/design/evidence/m5-jammers-from-orbit-hybrid/PREREGISTRATION-v2.md`
(signed 9 November 2026), specifies two things:

- "30 reports per site per draw … with shadowing fixed over the 30";
- "independent measurement noise of 1 dB".

That makes the noise additive in dB. It does not state a linear average. With additive Gaussian
noise in dB, the dB mean is the unbiased estimator of the dB-domain level, so the dB average is
consistent with the pre-registered model. It is **not a bug**, and is documented here.

## Checked and correct (selection)

- **`src/timescales.rs`.**
  - The leap table runs from 1972 to 2017-01-01 at 37 s; the lookup uses the UTC day.
  - It clamps before 1972 as documented and holds the last value after the table.
  - The SOFA `iauDat` drift before 1972.
  - `MJD_OFFSET = 2400000.5`, `JD_J2000 = 2451545.0`, and Meeus JD/civil with noon-based days.
- **`src/gnss_time.rs`.**
  - Second 60 only on a real leap day.
  - TAI − UTC from the UTC day.
  - GST week 0 = GPS week 1024; BDT week 0 = 2006-01-01.
  - The two-digit year conventions.
- **`src/jd2.rs`.** SOFA `dtf2d`, `utctai` and `taiutc` with 86 401-s days.
- **`src/eop.rs`.** The TT→UTC inversion.
- **UTC lookups.** `src/connect.rs` and `src/interference_map/almanac_hdop.rs` (GPS ↔ UTC);
  `src/spk_writer.rs` (the label day's noon).
- **The half-week wrap.** In `src/rinex.rs` (tk, toc, relativistic term) and
  `src/pvt.rs` `select_ephemeris`.
- **Week and TOW unwrap and carry in readers.** UBX iTOW, SBF WNc, NMEA day, Novatel, Unicore
  and RTKLIB full weeks, `src/leo_navmsg/elements.rs` (week carry and borrow),
  `src/corrections/cma.rs`, `src/osnma`, and `src/qznma_nav.rs`.
- **Leap-year rules.** The Gregorian rule everywhere it is hand-rolled; no `2400000.0`,
  `2400001` or `2451545.5` mistakes.
