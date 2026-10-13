# Pre-registration: the oblate-Earth SRP shadow against Orekit 12.2 (FUT-09, RM-11)

Committed alone, before kshana's shadow functions are compared with any Orekit output. Bars are not
loosened after the run; a miss is recorded in `RESULTS.md` with its numbers.

## What is compared

`srp_shadow::oblate_conical_shadow(r, s, None)`: the SRP lit fraction ν ∈ [0, 1] with the WGS-84
ellipsoid (a = 6378137 m, f = 1/298.257223563, axis = inertial z) as the occulting body, the
apparent Earth radius taken from the ellipsoid limb towards the Sun, and the dual-disk lens
formula of `forces::conical_shadow`. Also, as a baseline, the existing `forces::conical_shadow`
(sphere of radius 6378137 m).

## Oracle

Orekit 12.2 + Hipparchus 3.1 (Apache-2.0), run as a separate program
(`tests/fixtures/srp_oblate_shadow_orekit_oracle/java/ShadowDriver.java`):
`SolarRadiationPressure.getLightingRatio` with a `OneAxisEllipsoid` WGS-84 occulting body (and a
spherical one, f = 0, for the baseline), the Sun fixed at the given inertial position through an
`ExtendedPVCoordinatesProvider`, Sun radius `Constants.SUN_RADIUS` = 6.957e8 m (kshana's
`SOLAR_RADIUS` is the same). 2400 geometries: satellite radius 6778.137, 7378.137, 26 560 and
42 164 km; Sun declination 0, +23.44 and −23.44°; 8 azimuths about the anti-Sun axis (so the
grazing point ranges from the equator to high latitude); 25 angles across ±0.012 rad of the
spherical shadow edge (884 of them in penumbra, the rest in full sun or umbra). Generated before
this file was committed; not yet compared.

## Bars (fixed now)

1. Oblate: |ν_kshana − ν_Orekit(WGS-84)| ≤ **1e-6** at all 2400 geometries.
2. Baseline: |conical_shadow − ν_Orekit(sphere)| ≤ **1e-6** at all 2400 geometries.
3. Sensitivity (must hold, else the oblate comparison does not discriminate): the largest
   |ν_Orekit(WGS-84) − ν_Orekit(sphere)| over the set exceeds **1e-2**. Reported either way.

## Not covered

Solar limb darkening (`limb_darkened_shadow`): Orekit 12.2 has no limb-darkened lighting ratio, so
that variant has no external oracle and stays MODELLED (checked against its own closed forms).
The ellipsoid axis orientation (precession–nutation) is not modelled on either side.
