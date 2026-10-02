<!-- Proposed CHANGELOG lines for package D8 (branch feat/dom-d8): place under "### Validation
packages" in [Unreleased], after D12. Also set the [Unreleased] table to 231 rows, 116
VALIDATED, 111 MODELLED, 4 PARTNER, its intro line to "take it to 231", and reword D12's
heading to "validated 110 -> 112" (see .fold/feat-dom-d8-rows.md, section 7). -->

**D8, one validated propagation, frame and time path (three new VALIDATED rows and M131 promoted: 228 -> 231 rows, validated 112 -> 116).**

The Earth-orbit kinds that carried their own two-body, secular-J2 or sidereal-time-only models
now share one path: SGP4/SDP4 element sets with two-part Julian dates, carried to the GCRS and the
ITRS (International Terrestrial Reference System) through the IAU (International Astronomical
Union) 2006/2000A chain, with optional Earth orientation parameters.

- New `sgp4::MeanElementSet`, `sgp4::SgpOrbit`, `sgp4::Eop`, `sgp4::teme_to_itrs_matrix[_eop]`
  and `sgp4::gcrs_to_itrs_matrix[_eop]`; `Sgp4::new_at` and `Sgp4::propagate_at` take two-part
  epochs. New `jd2::Jd2::from_utc_calendar` (SOFA `dtf2d` convention for leap-second days),
  `jd2::utc_to_tai`, `tai_to_utc`, `utc_to_ut1` (through TAI, as SOFA `utcut1`), `tai_to_tt`
  and a two-part `jd2::earth_rotation_angle`.
- The `leo-pvt` polar mode propagates by SGP4 at 2026-01-01T00:00:00 UTC on the IAU chain
  (`leo_fusion::polar::latitude_sweep_at` takes any epoch); the SGP4 Walker generator rotates to
  the Earth-fixed frame through the IAU chain.
- The `passes` kind runs a new apparent pass predictor (`passes::predict_passes_apparent`,
  `apparent_look_angles`): SGP4 on the IAU chain, ITU-R P.834-9 refraction and the downlink light
  time (new `refraction` and `light_time` switches, on by default), Earth orientation parameters
  (`ut1_minus_utc_s`, `xp_arcsec`, `yp_arcsec`, default 0), crossings solved to 1e-7 s and the
  culmination by golden-section search. The geometric `passes::predict_passes` is unchanged.
- `tests/no_private_models.rs` keeps the package's geometry, time and propagation kernels from
  carrying a private Keplerian propagation, secular J2 rates or a sidereal-time-only rotation;
  named fast tiers and physics that is a row's subject are reasoned allowances.
- New VALIDATED row "Two-part Julian dates and leap seconds on the Earth-orbit time path":
  pyerfa 2.0.1.5 `dtf2d`/`utctai`/`taiutc` on 224 instants around all 27 leap seconds within
  1e-6 s (pre-registered e947e69d); worst 1.9e-11 s.
- New VALIDATED row "One Earth-orbit path": TEME positions of 232 element sets against
  python-sgp4 2.24 (Vallado's reference SGP4) within 6.1e-8 m (bar 1 cm), and the GCRS -> ITRS
  and TEME -> ITRS rotations against ERFA `c2t06a`, `pnm06a` and `ee06a` within 2.9e-6 mas and
  0.41 mas (bars 0.1 and 2 mas), with Earth orientation parameters (pre-registered 72ea9eb0).
  Disclosed: the first run failed at 2016-12-31T23:59:59.5 by one second of rotation; UT1 was
  taken from the UTC quasi Julian date on a leap-second day, the engine now goes through TAI,
  and the second run agrees at the unchanged bars.
- M131 "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS"
  becomes VALIDATED: Orekit 13.1.8 takes the engine's GCRS states, rotates them and computes
  visibility and DOP (NumPy for multi-clock groups); positions within 6.8e-5 m (bar 0.2 m),
  in-view counts identical on 4040/4040 samples, median DOP within 2.3e-11 relative.
- New VALIDATED row "Apparent ground-station pass prediction with refraction and light time":
  Orekit 13.1.8 propagating the same element sets in a TEME it builds to the stated definition,
  with ITU-R P.834 refraction and its light-time measurement model, over 60 cases at sea-level
  stations: 1210 passes, crossings within 3.4e-6 s (bar 5 ms), maximum elevation within
  5.5e-7 deg, apparent direction within 8.8e-7 deg (bar 1e-4 deg).
- Findings, kept pinned: the first full-claim comparisons against Orekit end to end missed their
  position and direction bars, not because of the engine but because Orekit 13.1.8's SDP4
  departs from the reference SGP4 for circular (e = 0) deep-space orbits (up to 67 m) and its
  default TEME is built on the IERS 1996 (IAU 1980) nutation, about 72 milliarcseconds from the
  IAU 2006/2000A chain (2.7 m at LEO). Orekit's ITU-R P.834 coefficient of h*theta0^2 is
  0.011380 where the Recommendation prints 0.01380; the comparison is at sea level, where the
  term vanishes, and the difference above it is pinned.
- "Ground-station pass prediction (ground segment)" stays VALIDATED with its claim narrowed to
  the geometric `passes::predict_passes`; the `passes` kind belongs to the new row.
- Oracle environment: Orekit 13.1.8 with Hipparchus 4.0.3, pyerfa 2.0.1.5, python-sgp4 2.24
  (`xval/d8-orekit13/setup.sh`).
- Revisions: bundled `scenarios/passes.toml` total access 1675 s -> 1659 s (five passes as
  before), and every `passes` output moves with the new path; bundled
  `polar-arctic-leo-coverage` GNSS VDOP at the equator 1.19669 -> 1.19710, at 89.9 deg
  1.50645 -> 1.50590, fused VDOP at 89.9 deg 1.14388 -> 1.14250 (the published two-decimal
  figures 1.20, 1.51 and 1.14 are unchanged). No golden file changes.
- Not routed yet: `leo_pass`, the doppler, joint and timing `leo-pvt` modes and the
  `leo_navmsg` truth orbit (their models live in `leo_link::geometry` and `leo_fusion::geom`),
  and Earth designs in `constellation-design` (a named two-body fast tier).
