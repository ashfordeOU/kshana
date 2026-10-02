# Package D8: proposed verification rows and their records

Branch `feat/dom-d8`, cut from `main` at 4646c224. Package D8 routes the Earth-orbit kinds through
one validated propagation, frame and time path:
- SGP4/SDP4 (Simplified General Perturbations 4 / Simplified Deep-space Perturbations 4), checked
  against the 666 AIAA (American Institute of Aeronautics and Astronautics) verification vectors;
- the IAU (International Astronomical Union) 2006/2000A chain for the Earth-fixed frame;
- two-part Julian dates (`kshana::jd2`) for time.

Every comparison below was pre-registered in commit **e947e69d** (pushed 2026-10-02T15:45:41Z,
before any fixture was generated or any oracle was run), and each was run once.

| Row | Outcome | Pre-registration | Oracle and tolerance | Measured |
|---|---|---|---|---|
| New: Two-part Julian dates and leap seconds on the Earth-orbit time path | **PROMOTE** (new row, VALIDATED) | e947e69d | pyerfa 2.0.1.5 (ERFA): `dtf2d("UTC")`, `utctai`, `taiutc`, 1e-6 s | worst 1.9e-11 s over 224 instants |
| M131 (row 218): LEO coverage and DOP for polar and Arctic users | **FINDING** (stays MODELLED) | e947e69d | Orekit 13.1.8 TLE propagation, ITRF (International Terrestrial Reference Frame), visibility, DOPComputer; NumPy for multi-clock groups. T1 2 m, T2 in-view ties 1e-5 rad, T3 the round-2 aggregate bars | T1 fails (67 m); T2 and T3 hold |
| New: Apparent ground-station pass prediction with refraction and light time | **FINDING** (new row, MODELLED) | e947e69d | Orekit 13.1.8 detectors and `AngularAzEl`, ITU-R P.834 refraction; crossings 5 ms, max elevation 1e-3 deg, Q4 direction 1e-4 deg | Q1 to Q3 hold; Q4 fails on 327 of 8979 samples (3.2e-4 deg) |
| Ground-station pass prediction (ground segment) | unchanged result; text narrowing proposed (founder decision) | (existing) | Orekit 12.2, unchanged | re-run green at its bars |

Disclosures that apply to all three comparisons:
- Each was run exactly once. No bar was changed after a result was seen, and no engine
  parameter was tuned to an oracle.
- The diagnostics in the two findings were done after the failures. They are labelled as such
  in the tests and are not counted as oracles.
- Before pre-registering, I read Orekit's sources to choose the oracle calls. That is how the
  ITU-R P.834 coefficient difference was known in advance; the pre-registration discloses it.

---

## 1. New row: two-part Julian dates and leap seconds (PROMOTE)

### Proposed `verification_matrix()` row

```rust
        VerificationItem {
            requirement: "Two-part Julian dates and leap seconds on the Earth-orbit time path",
            capability: "A UTC calendar date and time to a two-part UTC Julian date with the SOFA dtf2d convention for days that end in a leap second (86 401 s long, 23:59:60.x valid), and UTC to TAI and back on two-part dates, from 1972-01-01: the time path SGP4 (Sgp4::propagate_at, measured from a two-part epoch) and the IAU 2006/2000A Earth-fixed rotation (sgp4::teme_to_itrs_matrix with the two-part Earth rotation angle) take",
            module: "jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)",
            tests: "tests/jd2_sofa_time_oracle.rs (224 UTC instants: six around each of the 27 leap seconds 1972-2016, two fixed, 60 seeded across 1972-2026; dtf2d, utctai and taiutc each within 1e-6 s, worst 1.9e-11 s); jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; the_two_part_earth_rotation_angle_matches_the_single_f64_one); sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch",
            oracle: "pyerfa 2.0.1.5 (liberfa 2.0.1, BSD-3-Clause; the SOFA algorithms as released by the ERFA project) — an independent library — erfa.dtf2d(\"UTC\"), erfa.utctai and erfa.taiutc on the committed instants, the gap formed part by part on the two-part dates, bar 1e-6 s fixed before the run (pre-registered e947e69d). Worst gap 9.6e-12 s (dtf2d) and 1.9e-11 s (utctai, taiutc). Every UTC day taken as 86 400 s, or the leap-day fraction left unscaled, turns the test red. Scope: UTC from 1972-01-01; the earlier drifting-rate UTC is not modelled",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

Placement: beside "Reference frames & timescales".

### Proposed `validated_oracle_basis()` entry

```rust
        OracleBasisEntry {
            requirement: "Two-part Julian dates and leap seconds on the Earth-orbit time path",
            basis: Library,
            oracle_test: "tests/jd2_sofa_time_oracle.rs",
            source: "pyerfa 2.0.1.5",
            flag: "",
        },
```

### Record

- **Pre-registration:** e947e69d (`tests/jd2_sofa_time_oracle.rs` header). The instants were
  written from the fixed rules first; the oracle ran after.
- **Oracle:** pyerfa 2.0.1.5 (liberfa 2.0.1), BSD-3-Clause, run as a separate program by
  `tests/fixtures/jd2_sofa_time_oracle/generate_jd2_sofa_time_oracle.py`.
- **Tolerance:** 1e-6 s, taken from the package statement "SOFA iauDtf2d and iauTaiutc round
  trips at 1 microsecond".
- **Result** (first and only run, commit eed4f618): AGREES. Worst gap 9.6e-12 s (dtf2d) and
  1.9e-11 s (utctai and taiutc); internal round trip 1.9e-11 s.
- **Mutation evidence:**
  - `utc_day_length_s` forced to 86 400 s: red, because the leap-second instants are rejected
    as invalid times.
  - The leap-day fraction left unscaled in `utc_to_tai`: red, 243 failures of up to 1 s.
  - Both edits were reverted afterwards.
- **Disclosures:** none beyond the common ones.
- **Why Library:** ERFA computes the same uniquely defined conversion (the SOFA convention) on
  the same inputs. The engine's code was written from the convention, not from ERFA's source.

---

## 2. M131 (row 218): full claim against Orekit (FINDING; stays MODELLED)

The scoping choice stays with D1. This branch re-ran the full claim against a fresh,
pre-registered oracle, so the founder has a measured result to decide on.

### Proposed amended row (status unchanged, MODELLED)

```rust
        VerificationItem {
            requirement: "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS",
            capability: "Satellites in view and median PDOP, HDOP and VDOP with availability against latitude, over sampled longitudes and epochs, for the MEO GNSS systems alone, the LEO systems alone and all of them, each system with its own mask and clock model, run as the `leo-pvt` polar mode; the orbits are SGP4/SDP4 element sets at the sweep epoch (2026-01-01T00:00:00 UTC in the polar mode) carried to the Earth-fixed frame by the IAU 2006/2000A chain with no Earth orientation parameters",
            module: "leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)",
            tests: "leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (the_polar_sweep_agrees_with_orekit_and_numpy_on_the_given_states; the_polar_mode_reports_the_sweep_on_its_own_states_over_the_committed_grid); tests/leo_polar_coverage_full_claim_orekit_oracle.rs (the_committed_element_sets_and_grid_are_the_ones_the_polar_mode_runs; the_full_claim_finding_is_pinned)",
            oracle: "Internal consistency with the known geometry: MEO orbits at 55 to 56 deg leave the polar sky equatorward and low, so GNSS VDOP rises toward the pole (1.20 at the equator to 1.51 at 89.9 deg for GPS and Galileo in the bundled scenario), while a near-polar LEO shell converges there. Geometry only; no scintillation, terrain or signal power. 0.30 round 2 (pre-registered 3254d456): on the same tabulated Earth-fixed states, Orekit 12.2 visibility and DOPComputer, with a NumPy inverse for multi-clock groups, agree on in-view counts for 4040/4040 samples and on median DOP within 4.6e-14. Package D8 (pre-registered e947e69d), full claim from the element sets, a finding (stays MODELLED): Orekit 13.1.8 propagating the same SGP4 element sets agrees on in-view counts for 4040/4040 samples and on every reported figure (median DOP within 1.6e-6 relative), but the Earth-fixed positions miss the 2 m bar by up to 67 m. The engine matches the reference SGP4 (python-sgp4 2.24, D. Vallado's code) to 5e-8 m. The gap is Orekit's SDP4 on these circular deep-space orbits (it agrees with the reference at e = 1e-3) plus a TEME convention difference of about 72 milliarcseconds between Orekit's TEME and the IAU 2006/2000A chain (2.7 m at LEO); the scoping awaits an owner decision",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
```

### Record

- **Pre-registration:** e947e69d (`tests/leo_polar_coverage_full_claim_orekit_oracle.rs`
  header).
- **Oracle:** Orekit 13.1.8 with Hipparchus 4.0.3, Apache-2.0, run as a separate program.
  - `TLE` objects built from the committed element sets; `TLEPropagator`; ITRF (IERS 2010)
    with no Earth orientation parameters loaded.
  - `TopocentricFrame` for visibility and `DOPComputer` for single-clock groups.
  - NumPy 2.4.6 `inv`/`matrix_rank` for groups with several clock unknowns (P2).
- **Tolerance:**
  - T1: every ITRF position within 2 m.
  - T2: in-view counts identical on at least 99.5 % of samples, and every differing sample a
    tie within 1e-5 rad of the mask.
  - T3: mean in view within 0.01, median DOP within 1e-3 relative, availability within 0.005.
- **Result** (first and only run, commit 633e244a):
  - T1 FAILS: worst gap 66.98 m (configuration A) and 66.80 m (configuration B).
  - T2 holds: identical on 1040/1040 and 3000/3000 samples.
  - T3 holds: worst median DOP 9.3e-7 and 1.6e-6 relative; every mean-in-view and availability
    figure identical.
  - Oracle self-check: Orekit DOPComputer and the NumPy inverse agree to 2.1e-11 relative.
- **Diagnosis** (after the failure; in `the_full_claim_finding_is_pinned`):
  - The engine's TEME positions equal python-sgp4 2.24 (Vallado's reference SGP4) to 5e-8 m on
    every element set.
  - Orekit's SDP4 differs from both for these circular (e = 0) deep-space orbits, by up to 67 m.
    With e = 1e-3 all three agree to the millimetre (checked by hand on one GPS element set).
  - For the near-Earth orbits, Orekit's TEME positions match the engine's to 6e-6 m. The
    remaining 0.5 to 2.7 m ITRF gap is a TEME-to-ITRF convention difference of about 72
    milliarcseconds. Orekit builds TEME on the IAU 1980 nutation; the engine uses the IAU
    2006/2000A chain.
  - The pre-registration bounded the convention gap at 10 milliarcseconds. That bound was wrong.
- **Mutation evidence:** the node's right ascension without the epoch's sidereal time gives
  6102 failures; in view is identical on only 172/1040 and 2151/3000 samples, and median DOP is
  off by up to 7.0e-2 relative. Reverted, and the fixture element files re-written and checked
  against their recorded SHA-256.
- **Pinned finding:** `the_full_claim_finding_is_pinned` asserts each part:
  - engine vs reference SGP4 within 1e-3 m;
  - near-Earth gap in [0.5, 3) m;
  - deep-space gap in [20, 70) m;
  - every failure of the strict test is a position failure.
- **Revision to the round-2 test** (`tests/leo_polar_coverage_orekit_oracle.rs`):
  - `the_committed_states_and_grid_are_the_ones_the_polar_mode_runs` is renamed
    `the_polar_mode_reports_the_sweep_on_its_own_states_over_the_committed_grid`.
  - The committed round-2 states (two-body plus secular J2) are no longer what the polar mode
    runs, so the test now checks that the polar mode reports the sweep on its own states.
  - The geometry comparison on the committed states runs unchanged at its bars, and is green.

### Founder decision (D1): proposed fresh pre-registration for the full claim

Neither option below is acted on. Both would be new pre-registrations, with their bars derived
before any run.
- **(a) Propagation oracle: python-sgp4 2.24** (Vallado's reference SGP4, MIT licence), at a bar
  of 1 cm derived from the AIAA floor.
  - **Frame oracle:** an independent IAU 2006/2000A TEME-to-ITRS realisation. Candidates are
    pyerfa (`pnm06a`, `ee06a`, `c2t06a`, composed as TEME = R3(EqE)·NPB) or astropy's TEME
    frame (which uses the GMST-1982 convention; a bar would then have to cover that
    convention's documented difference).
  - **Bar:** derived from the published spread of TEME realisations, not from the 72
    milliarcseconds measured here.
- **(b) Keep Orekit as the oracle,** with element sets of non-zero eccentricity.
  - This is not what the scenario runs, so it would change the claim's scope. It needs the same
    convention-derived bar as (a).

---

## 3. New row: apparent ground-station pass prediction (FINDING; new row, MODELLED)

### Proposed `verification_matrix()` row

```rust
        VerificationItem {
            requirement: "Apparent ground-station pass prediction with refraction and light time",
            capability: "Visibility passes (AOS, TCA, LOS, maximum apparent elevation, duration) of an SGP4 element set over a WGS-84 station, on the IAU 2006/2000A Earth-fixed frame, with ITU-R P.834-9 tropospheric refraction (equations 9 to 14, the Recommendation's printed coefficients) and the downlink light time, each switchable; crossings solved by bisection to 1e-7 s and the culmination by golden-section search. Runnable from the CLI/bindings as the `passes` scenario kind (scenarios/passes.toml), both corrections on by default",
            module: "passes (predict_passes_apparent, apparent_look_angles, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)",
            tests: "passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them; scenario_runs_reproducibly_and_is_modelled); tests/pass_predictor_apparent_orekit_oracle.rs (the_committed_cases_are_the_pre_registered_ones; the_apparent_pass_finding_is_pinned; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)",
            oracle: "Package D8 (pre-registered e947e69d), a finding (stays MODELLED): Orekit 13.1.8 (TLEPropagator on the same element sets; ElevationDetector and ElevationExtremumDetector with and without ITURP834AtmosphericRefraction; AngularAzEl with AngularRadioRefractionModifier for the light-time case, its crossings and maximum solved by Hipparchus 4.0.3) over 60 cases (four orbits, five sea-level stations, masks 0, 5 and 10 deg, 24 hours each) agrees on every pass: 1210 passes matched with no tie, AOS and LOS within 1.4e-3 s (bar 5 ms), maximum elevation within 1.9e-4 deg (bar 1e-3 deg), TCA within 1.4e-3 s. The sampled apparent direction misses its 1e-4 deg bar on 327 of 8979 samples (worst 3.2e-4 deg): the TEME convention difference of about 72 milliarcseconds found under M131 (2.7 m at LEO), seen from short slant ranges. Disclosed: Orekit's P.834 h·θ0² coefficient is 0.011380 where the Recommendation prints 0.01380; the comparison is at sea level, where the term vanishes, and the coefficient accounts for the whole difference above it (pinned)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
```

### Record

- **Pre-registration:** e947e69d (`tests/pass_predictor_apparent_orekit_oracle.rs` header). The
  60 cases were fixed by rule there.
- **Oracle:** Orekit 13.1.8 with Hipparchus 4.0.3, Apache-2.0, run as a separate program
  (`PassesApparentDriver.java`). No Earth orientation parameters were loaded.
- **Tolerance:**
  - Pass counts identical, except ties within 1e-3 deg of the mask.
  - AOS and LOS within 5 ms (0.5 s for grazing passes, whose maximum is under 0.5 deg above the
    mask).
  - Maximum elevation within 1e-3 deg; TCA within 0.5 s.
  - Q4 apparent elevation and direction within 1e-4 deg.
- **Result** (first and only run, commit edfde54c):
  - Q1 to Q3 hold: 1210 matched passes, no ties, no unmatched pass. Worst crossing 1.4e-3 s
    (grazing 2.6e-3 s); maximum elevation 1.9e-4 deg; TCA 1.4e-3 s.
  - Q4 FAILS on 327 of 8979 samples, worst 3.2e-4 deg. The implied transverse offset never
    exceeds 2.71 m, the same as M131's near-Earth gap.
- **Mutation evidence:**
  - Light time ignored: 9773 failures; crossings off by up to 2.0e-2 s.
  - The 1.728 of equation (14) changed to 1.828: 8330 failures; crossings off by up to 5.3 s.
  - Both edits were reverted.
- **Disclosure:** Orekit's P.834 coefficient was read in Orekit's source before the
  pre-registration. That is why every station is at sea level, and the pre-registration says
  so. `orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level` pins the
  difference:
  - at sea level the two models are identical (5.6e-17 deg);
  - above sea level the coefficient explains the gap to 4.8e-16 relative, up to 2.6e-3 deg at
    3 km.
- **Not counted:** the Q1 to Q3 pass bars held, but the strict test is one pre-registered claim,
  and partial promotion would rescope it after the result. A fresh pre-registration is needed,
  with a frame bar derived from the documented TEME convention spread (see M131 above).

---

## 4. Existing VALIDATED row "Ground-station pass prediction (ground segment)" (founder decision)

Its oracle test (`tests/ground_station_pass_prediction_reference.rs`, Orekit 12.2) re-runs green
at unchanged bars. `passes::predict_passes` is untouched.

The capability text ends "Runnable from the CLI/bindings as the `passes` scenario kind
(scenarios/passes.toml)". Since this branch, the `passes` kind runs `predict_passes_apparent`,
the new method of section 3. A new method gets a new row, so I propose narrowing the old row to
the method it validates:

```rust
            capability: "Time-domain visibility passes (AOS/TCA/LOS, max elevation, duration) of an engine propagator over a station above an elevation mask, with interpolated rise/set crossings and total access: passes::predict_passes, the geometric scheduler (no refraction or light time). The `passes` scenario kind runs the apparent predictor of the row 'Apparent ground-station pass prediction with refraction and light time'",
```

Everything else in that row is unchanged.

---

## 5. Inventory of the scenario kinds named by the package

| Kind / file | Private model found | Done on this branch | Remaining |
|---|---|---|---|
| `leo-pvt` polar (`src/leo_fusion/polar.rs`) | two-body plus secular J2, Earth turned at the WGS 84 rate | routed: SGP4 element sets at the sweep epoch, IAU 2006/2000A ITRS, `Jd2` time | the other `leo-pvt` modes (doppler, joint, timing) still use `leo_fusion::geom::EarthOrbit` (outside D8) |
| `passes` (`src/passes.rs`) | Keplerian orbit, sidereal time only, no refraction or light time | routed: SGP4, IAU chain, ITU-R P.834 refraction, light time, refined crossings; the scenario's `propagator()` is the same SGP4 set | `predict_passes` keeps sidereal time: it is the VALIDATED row's subject (allowed, section 4) |
| `walker` (`src/walker.rs`) | SGP4 already; Earth rotation by sidereal time only | routed: `teme_to_itrs_matrix` at the absolute instant (`walker_epoch()` as `Jd2`) | none |
| `constellation` (`src/constellation.rs`) | two-body plus optional secular J2, any body, body spin | not changed: a named fast tier (its label and the coverage row name it); it also serves the Moon, Mars and other bodies, where SGP4 does not apply | founder decision 6.2 |
| `leo_pass` (`src/leo_pass.rs`) | uses `leo_link::geometry::SatMotion::kepler` (two-body plus secular J2) and the SGP4 variant rotated by sidereal time only | not changed: the model lives in `src/leo_link/geometry.rs`, outside D8 | founder decision 6.3 |
| `leo_pnt_chain` (`src/leo_pnt_chain.rs`) | none of its own; inherits `leo_pass`, `leo-pvt` and `leo_navmsg` | nothing to change in the file | follows 6.3 |
| `handoff` (`src/handoff.rs`) | none (a fusion handoff filter; no orbit) | nothing to change | none |
| `launch` (`src/launch.rs`) | Earth rotation rate in the launch-site velocity and azimuth closed forms | not changed: physics that is the launch rows' subject | none |
| `eo_payload` (`src/eo_payload.rs`) | first-order J2 nodal regression, nodal period, ground-track spacing | not changed: closed forms the Earth-observation rows state | none |
| `sgp4`, `jd2`, `propagator` | — | `Sgp4::new_at`/`propagate_at`/`epoch_jd2`; `MeanElementSet`, `SgpOrbit`, `teme_to_itrs_matrix`, `gcrs_to_itrs_matrix`; `Jd2::from_utc_calendar`, `utc_to_tai`, `tai_to_utc`, `tai_to_tt`, `earth_rotation_angle` | `propagator.rs` unchanged: the Cowell propagator needed no change for the kinds routed here |

`tests/no_private_models.rs` encodes this table. It lists each allowed use by category: the
validated path itself, a row's subject, a named fast tier, or not yet routed. The test fails on
any new private model in a D8 kernel, and also on an allowance that no longer matches anything.

---

## 6. Founder decisions requested (proposals only; nothing acted on)

1. **M131 scoping (D1):** see section 2. Proposed: a fresh pre-registration with the reference
   SGP4 (python-sgp4) and an independent IAU 2006/2000A frame oracle, with the bar derived from
   the published TEME convention spread.
2. **`constellation-design` on the Earth:** route Earth designs through SGP4 and keep the named
   two-body tier for other bodies, or keep the named tier everywhere.
   - Routing moves the inputs of the VALIDATED row "Global dilution of precision of the GPS
     baseline constellation" (SPS PS Appendix B). That row would then need its test re-run at
     its unchanged 0.03 bars in the same fold.
3. **`leo_pass`, the other `leo-pvt` modes and `leo_navmsg` truth orbits:** the private models
   live in `src/leo_link/geometry.rs` (`SatMotion`) and `src/leo_fusion/geom.rs` (`EarthOrbit`),
   outside D8's ownership. Proposed: extend D8's ownership to those two files in a follow-up, so
   both build `sgp4::SgpOrbit` from the same `MeanElementSet::from_earth_fixed`.
4. **The VALIDATED pass-prediction row's text:** section 4.
5. **Labels in files outside D8 that still name the replaced model:**
   - `src/leo_fusion/pvt_kind.rs` (polar mode label), now:
     `"MODELLED geometry against latitude: two-body orbits with J2 drift, each system's elevation mask, no terrain, signal power or scintillation"`.
     Proposed:
     `"MODELLED geometry against latitude: SGP4/SDP4 orbits from each system's element sets at 2026-01-01T00:00:00 UTC on the IAU 2006/2000A Earth-fixed frame (UT1 = UTC, no polar motion), each system's elevation mask, no terrain, signal power or scintillation"`.
   - `src/interop/scene.rs` (passes mover description), now:
     `"circular orbit, {} km altitude, {} deg inclination (Keplerian, as the passes kind propagates it)"`.
     Proposed:
     `"circular orbit, {} km altitude, {} deg inclination (SGP4 mean elements at the window start, as the passes kind propagates it)"`.

---

## 7. Revisions to published numbers (old -> new)

- **`passes` kind, bundled `scenarios/passes.toml`:**
  - total access 1675 s -> 1659 s; pass count 5 -> 5.
  - Every `passes` output moves: SGP4 and the IAU chain replace the Keplerian orbit and sidereal
    time, refraction and light time are on, and crossings are refined.
  - The label changes to name the new path.
  - Six field definitions change: `altitude_km`, `step_s`, `passes[].aos_s`, `passes[].tca_s`,
    `passes[].los_s`, `passes[].max_elevation_deg`. Regenerate `docs/field-units-schema.json`.
- **`leo-pvt` polar mode, bundled `scenarios/polar-arctic-leo-coverage.toml`:**
  - GNSS VDOP at the equator 1.19669 -> 1.19710.
  - GNSS VDOP at 89.9 deg 1.50645 -> 1.50590.
  - Fused VDOP at 89.9 deg 1.14388 -> 1.14250.
  - LEO mean in view at 89.9 deg 6.769 -> 6.692.
  - The figures printed to two decimals in M131's oracle text and in `docs/LEO-PNT-FUSION.md`
    (1.20, 1.51, 1.14) are unchanged.
- **`walker` figures:** the frame change is milliarcseconds. `walker::tests` and `frugal::tests`
  pass unchanged; no committed walker figure was found to move.
- **Golden files:** none of `tests/golden/` covers these kinds; none changed.
