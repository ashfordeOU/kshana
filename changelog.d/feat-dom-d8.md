<!-- Proposed CHANGELOG lines for package D8 (branch feat/dom-d8), for the [Unreleased] section. -->

### Added

- One propagation, frame and time path for Earth orbits (package D8).
  - `sgp4::MeanElementSet` carries the complete SGP4 (Simplified General Perturbations 4) input
    with a two-part UTC epoch. `MeanElementSet::from_earth_fixed` reads constellation-design
    elements, whose node is an Earth-fixed longitude at the epoch, as SGP4 mean elements.
  - `sgp4::SgpOrbit` propagates them and carries them TEME (true equator, mean equinox) -> GCRS
    -> ITRS through the IAU (International Astronomical Union) 2006/2000A chain, via
    `sgp4::teme_to_itrs_matrix` (UT1 taken as UTC, no polar motion).
  - `Sgp4::new_at` and `Sgp4::propagate_at` measure time from a two-part epoch.
- Two-part Julian dates with leap seconds: `jd2::Jd2::from_utc_calendar` (the SOFA, Standards of
  Fundamental Astronomy, `dtf2d` convention for leap-second days), `jd2::utc_to_tai`,
  `jd2::tai_to_utc`, `jd2::tai_to_tt` and `jd2::earth_rotation_angle`.
  - VALIDATED against pyerfa 2.0.1.5 within 1e-6 s, pre-registered; worst gap 1.9e-11 s over 224
    instants around all 27 leap seconds.
- `passes::predict_passes_apparent` and `passes::apparent_look_angles`: pass prediction on an SGP4
  element set with ITU-R P.834-9 tropospheric refraction and the downlink light time, rise and set
  solved to 1e-7 s and the culmination by golden-section search.
  - The `passes` kind runs it, with new `refraction` and `light_time` switches, both on by default.
- `tests/no_private_models.rs`: the geometry, time and propagation kernels of package D8 may not
  carry a Keplerian propagation, secular J2 rates or a sidereal-time-only Earth rotation of their
  own. Named fast tiers and physics that is a row's subject are reasoned allowances.

### Changed

- The `leo-pvt` polar mode propagates every satellite by SGP4/SDP4 from its element set at
  2026-01-01T00:00:00 UTC and rotates to ITRS through the IAU 2006/2000A chain, instead of
  two-body orbits with secular J2 turned at the WGS 84 rate. `leo_fusion::polar::latitude_sweep_at`
  takes any epoch.
  - Revision, bundled `polar-arctic-leo-coverage`: GNSS VDOP at the equator 1.19669 -> 1.19710,
    at 89.9 deg 1.50645 -> 1.50590; fused VDOP at 89.9 deg 1.14388 -> 1.14250. The published
    two-decimal figures (1.20, 1.51, 1.14) are unchanged.
- The `passes` kind propagates by SGP4 on the IAU 2006/2000A frame with refraction and light time,
  instead of a Keplerian orbit rotated by sidereal time alone.
  - Revision, bundled `scenarios/passes.toml`: total access 1675 s -> 1659 s, five passes as
    before. Its label and six field definitions now describe the apparent, refined figures.
  - `passes::predict_passes`, the geometric scheduler that carries the VALIDATED pass-prediction
    row, is unchanged.
- The SGP4 Walker generator rotates TEME to the Earth-fixed frame through the IAU 2006/2000A chain
  instead of by Greenwich mean sidereal time alone.

### Validation

- New row "Two-part Julian dates and leap seconds on the Earth-orbit time path": VALIDATED.
  - Library oracle: pyerfa 2.0.1.5. Bar 1e-6 s, pre-registered e947e69d.
- M131, LEO coverage and DOP for polar users, full claim from the element sets against Orekit
  13.1.8: a finding; the row stays MODELLED.
  - In-view counts agree on 4040/4040 samples and every reported figure within 1.6e-6 relative.
  - The Earth-fixed positions miss the 2 m bar by up to 67 m, for two reasons:
    - Orekit's SDP4 departs from the reference SGP4 for these circular deep-space orbits; the
      engine matches python-sgp4, Vallado's code, to 5e-8 m.
    - Orekit's TEME sits about 72 milliarcseconds from the IAU 2006/2000A chain.
- New row "Apparent ground-station pass prediction with refraction and light time": a finding;
  MODELLED.
  - Every pass agrees with Orekit 13.1.8 (1210 passes; crossings within 1.4 ms).
  - The sampled apparent direction misses its 1e-4 deg bar on 327 of 8979 samples, from the same
    TEME convention gap.
  - Disclosed: Orekit's ITU-R P.834 h·θ0² coefficient is 0.011380 against the printed 0.01380.
