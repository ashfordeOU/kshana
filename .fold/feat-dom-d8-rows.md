# Package D8: proposed verification rows and their records

Branch `feat/dom-d8`. Package D8 routes the Earth-orbit kinds through one validated path:
- SGP4/SDP4 (Simplified General Perturbations 4 / Simplified Deep-space Perturbations 4)
  element sets with two-part Julian dates;
- the GCRS and the ITRS (International Terrestrial Reference System) through the IAU
  (International Astronomical Union) 2006/2000A chain;
- optional Earth orientation parameters (EOP).

This branch carries no edits to `src/verification.rs`, `CHANGELOG.md`, the READMEs, the
generated docs or `web/`. A complete fold was built and checked on the branch (commits 961b1b6a
and 3a07b184), then reverted at the integrator's request (f9768b91). Those two commits show the
folded state:
- the matrix: 231 rows, 116 VALIDATED, 111 MODELLED, 4 PARTNER;
- every doc-sync, row and field-unit test green on that state;
- `cargo clippy --all-targets -D warnings` clean.

The integrator can reuse them or redo the fold; see "Fold notes" below.

## Outcome summary

| Row | Outcome | Pre-registration | Oracle | Measured (bar) |
|---|---|---|---|---|
| NEW Two-part Julian dates and leap seconds on the Earth-orbit time path | **PROMOTE** (new, VALIDATED) | e947e69d | pyerfa 2.0.1.5 (ERFA): `dtf2d("UTC")`, `utctai`, `taiutc` | 1.9e-11 s (1e-6 s) |
| NEW One Earth-orbit path: SGP4 element sets to the GCRS and ITRS on the IAU 2006/2000A chain with Earth orientation parameters | **PROMOTE** (new, VALIDATED) | 72ea9eb0 | python-sgp4 2.24 (Vallado's reference SGP4); ERFA `c2t06a`, `pnm06a`, `ee06a` | TEME 6.1e-8 m (1 cm); GCRS->ITRS 2.9e-6 mas (0.1 mas); TEME->ITRS 0.41 mas (2 mas) |
| M131 (row 218) LEO coverage and DOP for polar and Arctic users against MEO GNSS | **PROMOTE** (MODELLED -> VALIDATED) | 72ea9eb0 (leg 3) | Orekit 13.1.8 GCRF->ITRF, visibility, DOPComputer; NumPy for multi-clock groups | positions 6.8e-5 m (0.2 m); in view 4040/4040; median DOP 2.3e-11 rel (1e-3) |
| NEW Apparent ground-station pass prediction with refraction and light time | **PROMOTE** (new, VALIDATED) | e947e69d bars; 72ea9eb0 (leg 3) | Orekit 13.1.8 TLEPropagator in an Orekit-built TEME of the stated definition, detectors, AngularAzEl, ITU-R P.834 | AOS/LOS 3.4e-6 s (5 ms); max elevation 5.5e-7 deg (1e-3); direction 8.8e-7 deg (1e-4) |
| Ground-station pass prediction (ground segment) | stays VALIDATED; text narrowed | (existing) | Orekit 12.2, unchanged | re-run green |

Matrix after the fold: 228 -> 231 rows, 112 -> 116 VALIDATED, 112 -> 111 MODELLED.

---

## 1. New row: two-part Julian dates and leap seconds (PROMOTE)

Place after "Reference frames & timescales".

```rust
        VerificationItem {
            requirement: "Two-part Julian dates and leap seconds on the Earth-orbit time path",
            capability: "A UTC calendar date and time to a two-part UTC Julian date with the SOFA dtf2d convention for days that end in a leap second (86 401 s long, 23:59:60.x valid), UTC to TAI and back, and UT1 from UTC through TAI, on two-part dates from 1972-01-01: the time path SGP4 (Sgp4::propagate_at, measured from a two-part epoch) and the IAU 2006/2000A Earth-fixed rotation (sgp4::teme_to_itrs_matrix_eop with the two-part Earth rotation angle) take",
            module: "jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)",
            tests: "tests/jd2_sofa_time_oracle.rs (224 UTC instants: six around each of the 27 leap seconds 1972-2016, two fixed, 60 seeded across 1972-2026; dtf2d, utctai and taiutc each within 1e-6 s, worst 1.9e-11 s); jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one); sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch",
            oracle: "pyerfa 2.0.1.5 (liberfa 2.0.1, BSD-3-Clause; the SOFA algorithms as released by the ERFA project), an independent library: erfa.dtf2d(\"UTC\"), erfa.utctai and erfa.taiutc on the committed instants, the gap formed part by part on the two-part dates, bar 1e-6 s fixed before the run (pre-registered e947e69d). Worst gap 9.6e-12 s (dtf2d) and 1.9e-11 s (utctai, taiutc). Every UTC day taken as 86 400 s, or the leap-day fraction left unscaled, turns the test red. UT1 through TAI (iauUtcut1) is checked by the Earth-orbit path row's ERFA leg. Scope: UTC from 1972-01-01; the earlier drifting-rate UTC is not modelled",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

Oracle basis (after the "Reference frames & timescales" entry):

```rust
        OracleBasisEntry {
            requirement: "Two-part Julian dates and leap seconds on the Earth-orbit time path",
            basis: Library,
            oracle_test: "tests/jd2_sofa_time_oracle.rs",
            source: "pyerfa 2.0.1.5",
            flag: "",
        },
```

**Record**
- **Pre-registration:** e947e69d, pushed 2026-10-02T15:45:41Z before any fixture or oracle run.
- **Oracle:** pyerfa 2.0.1.5 (liberfa 2.0.1, BSD-3-Clause).
- **Tolerance:** 1e-6 s.
- **Result** (first and only run, eed4f618): worst gap 9.6e-12 s (dtf2d) and 1.9e-11 s (utctai
  and taiutc), over 224 instants.
- **Mutation evidence:**
  - every UTC day forced to 86 400 s: red (leap-second instants rejected);
  - the leap-day fraction left unscaled: 243 failures.
- `jd2::utc_to_ut1` was added later, after the leg-2 finding below. It is checked by the path
  row's ERFA leg, not by this row's test.

## 2. New row: the Earth-orbit path (PROMOTE)

Place after the previous row.

```rust
        VerificationItem {
            requirement: "One Earth-orbit path: SGP4 element sets to the GCRS and ITRS on the IAU 2006/2000A chain with Earth orientation parameters",
            capability: "The propagation and frame path every routed Earth-orbit kind shares: an SGP4 mean element set with a two-part UTC epoch (sgp4::MeanElementSet, read from constellation-design elements by MeanElementSet::from_earth_fixed) propagated by SGP4/SDP4 to TEME (sgp4::SgpOrbit), and the TEME -> ITRS and GCRS -> ITRS rotations of the IAU 2006/2000A chain with UT1 - UTC and polar motion (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, the zero-parameter forms teme_to_itrs_matrix and gcrs_to_itrs_matrix). TEME is the true equator of date with the mean equinox, reached from the GCRS through the IAU 2006 bias-precession, the IAU 2000B nutation and the equation of the equinoxes",
            module: "sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)",
            tests: "tests/earth_orbit_path_sgp4_erfa_oracle.rs (leg 1: 4432 TEME positions of the 232 committed element sets against python-sgp4 2.24, worst 6.1e-8 m, bar 1 cm; leg 2: 108 instants, 23 of them with Earth orientation parameters and one in the last second of a leap-second day, against ERFA: GCRS -> ITRS worst 2.9e-6 mas, bar 0.1 mas; TEME -> ITRS worst 0.41 mas, bar 2 mas); sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch); tests/no_private_models.rs",
            oracle: "Leg 1: python-sgp4 2.24 (MIT licence; D. Vallado's reference C++ SGP4, the code that produced the AIAA 2006-6753 verification vectors), WGS-72, improved mode. Leg 2: pyerfa 2.0.1.5 (ERFA, BSD-3-Clause, the SOFA routines): c2t06a with TT from utctai/taitt and UT1 from utcut1, and for TEME c2t06a . pnm06a^T . rz(-ee06a). Bars fixed before the run (pre-registered 72ea9eb0). Disclosed: the first run failed leg 2 at 2016-12-31T23:59:59.5 by one second of rotation (UT1 taken from the UTC quasi Julian date on a leap-second day); the engine was corrected (jd2::utc_to_ut1) and the second run agrees at the unchanged bars. Polar motion dropped (46 failures) or WGS-84 constants in place of WGS-72 (4432 failures) turn the test red. This three-leg design replaced an end-to-end Orekit comparison that failed on Orekit's SDP4 at e = 0 and on its IERS 1996 TEME (the finding stays pinned in tests/leo_polar_coverage_full_claim_orekit_oracle.rs)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

Oracle basis:

```rust
        OracleBasisEntry {
            requirement: "One Earth-orbit path: SGP4 element sets to the GCRS and ITRS on the IAU 2006/2000A chain with Earth orientation parameters",
            basis: Reference,
            oracle_test: "tests/earth_orbit_path_sgp4_erfa_oracle.rs",
            source: "python-sgp4 2.24",
            flag: "",
        },
```

**Record**
- **Pre-registration:** 72ea9eb0, pushed 2026-10-02T17:20:26Z before any fixture or oracle run.
- **Oracles:** python-sgp4 2.24 (MIT licence) and pyerfa 2.0.1.5.
- **Tolerances:**
  - TEME positions: 1 cm, from the 4.12 mm AIAA floor.
  - GCRS->ITRS: 0.1 mas, from the same IAU 2006/2000A CIO-based (Celestial Intermediate
    Origin) algorithms.
  - TEME->ITRS: 2 mas, from the IAU 2000B/2000A nutation difference of under 1 mas (McCarthy
    and Luzum 2003), doubled.
- **Re-design disclosure:** the three-leg design was made after the round-1 findings (section
  5). It is disclosed in the test header, and no bar was taken from the measured 72 mas.
- **Re-run disclosure:**
  - First run: leg 1 agreed. Leg 2 failed at 2016-12-31T23:59:59.5 by 1.504e4 mas (one second
    of rotation), on both rotations.
  - Cause: an engine bug. UT1 was taken from the UTC quasi Julian date, whose fraction counts
    86 401 s on a leap-second day.
  - Fix (9cb8d42f): `jd2::utc_to_ut1` follows SOFA `iauUtcut1` through TAI. No bar and no input
    changed.
  - Second run: agrees (the figures in the summary table).
- **Count discrepancy:** the pre-registration says "24 instants" for the EOP cases, but its own
  rule gives 23. The rule is what is implemented, and the header says so.
- **Mutation evidence:**
  - polar motion dropped: 46 failures (497 mas);
  - WGS-84 constants in place of WGS-72 in `SgpOrbit::new`: 4432 failures (64.6 m).

## 3. M131 promoted (PROMOTE)

Replace the existing row in place.

```rust
        VerificationItem {
            requirement: "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS",
            capability: "Satellites in view and median PDOP, HDOP and VDOP with availability against latitude, over sampled longitudes and epochs, for the MEO GNSS systems alone, the LEO systems alone and all of them, each system with its own mask and clock model, run as the `leo-pvt` polar mode; the orbits are SGP4/SDP4 element sets at the sweep epoch (2026-01-01T00:00:00 UTC in the polar mode) carried to the Earth-fixed frame on the validated Earth-orbit path (IAU 2006/2000A, UT1 = UTC, no polar motion)",
            module: "leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)",
            tests: "tests/leo_polar_coverage_on_path_orekit_oracle.rs (configurations A and B, 4040 samples: Earth-fixed positions within 6.8e-5 m, bar 0.2 m; in-view counts identical on 4040/4040; median DOP within 2.3e-11 relative, bar 1e-3; availability and mean in view identical); tests/earth_orbit_path_sgp4_erfa_oracle.rs (the path); leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (round 2, geometry on given states); tests/leo_polar_coverage_full_claim_orekit_oracle.rs (round-1 full-claim finding, pinned)",
            oracle: "Orekit 13.1.8 (Apache-2.0) with Hipparchus 4.0.3: the engine's GCRS states rotated to ITRF by Orekit (IERS 2010), WGS-84 TopocentricFrame visibility against each system's mask, org.orekit.gnss.DOPComputer for one clock unknown and NumPy 2.4.6 numpy.linalg.inv (P2) for several; with the path checked against python-sgp4 and ERFA (row 'One Earth-orbit path'). Bars fixed before the run (pre-registered 72ea9eb0; T2 and T3 are the 0.30 round-2 bars). The TEME -> GCRS step frozen at J2000 turns the test red (4739 failures). Geometry only; no scintillation, terrain or signal power. GNSS VDOP rises toward the pole (1.20 at the equator to 1.51 at 89.9 deg for GPS and Galileo in the bundled scenario) while a near-polar LEO shell converges there. History: round 2 (3254d456) agreed on tabulated two-body states; the D8 round-1 full claim against Orekit's own TLE propagation (e947e69d) was a finding, Orekit's SDP4 at e = 0 and its IERS 1996 TEME, pinned",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

Oracle basis (new entry; M131 had none):

```rust
        OracleBasisEntry {
            requirement: "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS",
            basis: Library,
            oracle_test: "tests/leo_polar_coverage_on_path_orekit_oracle.rs",
            source: "Orekit 13.1.8",
            flag: "",
        },
```

**Record**
- **Pre-registration:** 72ea9eb0, leg 3. T2 and T3 are the round-2 bars, unchanged.
- **Oracle:** Orekit 13.1.8 with Hipparchus 4.0.3 (Apache-2.0). It takes the engine's GCRS
  states, transforms them GCRF->ITRF, and computes visibility and `DOPComputer`; NumPy 2.4.6 runs
  the multi-clock groups.
- **Result** (first and only run, 45415540):
  - positions within 6.8e-5 m against 0.2 m;
  - in view identical on 1040/1040 and 3000/3000 samples;
  - median DOP within 2.3e-11 relative.
- **Mutation evidence:** the TEME->GCRS step frozen at J2000 gives 4739 failures (positions off
  by up to 188 km).
- **History, kept pinned:** the round-1 full claim (e947e69d) compared against Orekit's own TLE
  propagation and was a finding (section 5).

## 4. New row: apparent pass prediction (PROMOTE)

Place after "Ground-station pass prediction (ground segment)".

```rust
        VerificationItem {
            requirement: "Apparent ground-station pass prediction with refraction and light time",
            capability: "Visibility passes (AOS, TCA, LOS, maximum apparent elevation, duration) of an SGP4 element set over a WGS-84 station on the validated Earth-orbit path (IAU 2006/2000A, optional Earth orientation parameters), with ITU-R P.834-9 tropospheric refraction (equations 9 to 14, the Recommendation's printed coefficients) and the downlink light time, each switchable; crossings solved by bisection to 1e-7 s and the culmination by golden-section search. Runnable from the CLI/bindings as the `passes` scenario kind (scenarios/passes.toml), both corrections on by default",
            module: "passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)",
            tests: "tests/pass_predictor_on_path_orekit_oracle.rs (60 cases, 1210 passes: AOS/LOS within 3.4e-6 s, bar 5 ms; maximum elevation within 5.5e-7 deg, bar 1e-3 deg; 8979 apparent directions within 8.8e-7 deg, bar 1e-4 deg); tests/earth_orbit_path_sgp4_erfa_oracle.rs (the path); passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them); tests/pass_predictor_apparent_orekit_oracle.rs (round-1 finding, pinned; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)",
            oracle: "Orekit 13.1.8 (CS GROUP, Apache-2.0) with Hipparchus 4.0.3: TLEPropagator on the same element sets in a TEME Orekit builds to the stated definition (its IERS 2010 TOD rotated by GAST - GMST), ElevationDetector and ElevationExtremumDetector with and without ITURP834AtmosphericRefraction, and AngularAzEl with AngularRadioRefractionModifier for the light-time case, crossings and maximum solved by Hipparchus; 60 cases (four orbits, five sea-level stations, masks 0, 5 and 10 deg, 24 hours). Bars fixed before the run (pre-registered e947e69d, leg 3 of 72ea9eb0). Light time ignored (9777 failures) or the P.834 constant 1.728 changed to 1.828 (7883 failures) turns the test red. Scope: stations at sea level; Orekit's P.834 h*theta0^2 coefficient is 0.011380 where the Recommendation prints 0.01380 (pinned), so heights above sea level are not compared. Round 1, against Orekit's default IERS 1996 TEME, held every pass bar but missed the direction bar by the 72 mas TEME convention gap (pinned)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

Oracle basis (after the "Ground-station pass prediction (ground segment)" entry):

```rust
        OracleBasisEntry {
            requirement: "Apparent ground-station pass prediction with refraction and light time",
            basis: Library,
            oracle_test: "tests/pass_predictor_on_path_orekit_oracle.rs",
            source: "Orekit 13.1.8",
            flag: "",
        },
```

In the existing row "Ground-station pass prediction (ground segment)", replace the capability
line with:

```rust
            capability: "Time-domain visibility passes (AOS/TCA/LOS, max elevation, duration) of an engine propagator over a station above an elevation mask, with interpolated rise/set crossings and total access: passes::predict_passes, the geometric scheduler (no refraction or light time). The `passes` scenario kind runs the apparent predictor of the row 'Apparent ground-station pass prediction with refraction and light time'",
```

That row's test and its Orekit 12.2 oracle are unchanged; `passes::predict_passes` is untouched.

**Record**
- **Pre-registration:** the bars were fixed in e947e69d; leg 3 design in 72ea9eb0.
- **Oracle:** Orekit 13.1.8 with Hipparchus 4.0.3.
  - `TLEPropagator` runs in a TEME frame Orekit builds itself: IERS 2010 TOD rotated by
    GAST - GMST.
  - Detectors with and without `ITURP834AtmosphericRefraction(0)`; `AngularAzEl` with
    `AngularRadioRefractionModifier` for the light-time case.
- **Result** (first and only run, 285244f8):
  - 1210 passes matched, no ties;
  - AOS/LOS within 3.4e-6 s; maximum elevation within 5.5e-7 deg;
  - 8979 apparent directions within 8.8e-7 deg.
- **Mutation evidence:**
  - light time ignored: 9777 failures;
  - the P.834 constant 1.728 changed to 1.828: 7883 failures.
- **Scope:** sea-level stations only. Orekit's P.834 coefficient of h*theta0^2 is 0.011380
  where the Recommendation prints 0.01380. This was disclosed in the pre-registration and is
  pinned by `orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level`.

## 5. Round-1 findings (kept, pinned; no row of their own)

These were pre-registered in e947e69d and run once:
- **M131 against Orekit's own TLE propagation end to end:** in-view counts and DOP held, but
  positions missed the 2 m bar by up to 67 m.
  - Orekit's SDP4 departs from the reference SGP4 for circular (e = 0) deep-space orbits; the
    engine matches python-sgp4 to 5e-8 m.
  - Orekit's default TEME is built on IERS 1996 (IAU 1980 nutation), about 72 mas from the IAU
    2006/2000A chain.
  - Pinned in `tests/leo_polar_coverage_full_claim_orekit_oracle.rs::the_full_claim_finding_is_pinned`.
- **Apparent passes against Orekit's default TEME:** the pass bars held, but 327 of 8979
  directions missed by up to 3.2e-4 deg, the same frame gap.
  - Pinned in `tests/pass_predictor_apparent_orekit_oracle.rs::the_apparent_pass_finding_is_pinned`.

## 6. Code changes that need generated pages regenerated

- `src/api.rs`: the `passes` ScenarioMeta description, and the new optional fields
  `refraction`, `light_time`, `ut1_minus_utc_s`, `xp_arcsec`, `yp_arcsec`.
- `src/leo_fusion/pvt_kind.rs`: the polar-mode label.
- `src/interop/scene.rs`: the passes mover description.
- `src/passes.rs`:
  - the label;
  - six field definitions (`altitude_km`, `step_s`, `passes[].aos_s`, `passes[].tca_s`,
    `passes[].los_s`, `passes[].max_elevation_deg`);
  - three new numeric fields (`ut1_minus_utc_s`, `xp_arcsec`, `yp_arcsec`).

Red on this branch until regenerated:
- `tests/field_units_global.rs::the_committed_field_units_schema_is_current`;
- `tests/scenarios_reference_doc_sync.rs` (docs/SCENARIOS.md);
- the generated matrix pages once the rows are folded.

## 7. Fold notes (what 961b1b6a and 3a07b184 did, all checked green)

- **Rows and basis entries:** as above.
- **CHANGELOG:**
  - add `changelog.d/feat-dom-d8.md` under "### Validation packages";
  - set the `[Unreleased]` table to 231/116/111/4 and the intro line "take it to 231".
  - `tests/matrix_total_no_stale_count_doc_sync.rs` rejects any "N VALIDATED" in
    `[Unreleased]` that is not the live count. The D12 heading's "110 -> 112 VALIDATED" must
    become "validated 110 -> 112"; D8's heading uses that form.
- **READMEs:** counts 116 of 231, 111 Modelled, badge `116%2F231`, "116%20external".
- **Generated pages and assets:**
  - `cargo run --bin gen_validation_artifacts`;
  - `cargo test --test field_units_global zzz_emit_field_units_schema -- --ignored`;
  - `python3 tools/gen_validation_figures.py`;
  - `python3 tools/gen_readme_assets.py --kshana <absolute path to a release kshana>`;
  - `python3 tools/gen_og_card.py`.
- **Provenance diagram:**
  - change `docs/diagrams/validation-provenance.mmd` and the SVG text to 116 / 111 / 231;
  - the PNG needs a browser render (`tools/render-diagram-browser.sh` is macOS-only). On Linux
    I rendered it with Playwright's Chromium at the viewBox scale, with Liberation Sans and the
    `foreignObject` overflow visible, then resized to 5974x1202 and updated `rendered-from.json`.
- **web/:**
  - counts on every page;
  - `web/studio/data/verification-matrix.json` copied from `web/data/`;
  - the `editions.html` kpage summary;
  - the evidence ledger, kpage and cell grid regenerated in the site's format. My generator
    reproduced the previous ledger byte for byte; the rules are in 3a07b184.
  - The pages converted from docs/*.md keep stale per-row tables until a port from the site
    build.
