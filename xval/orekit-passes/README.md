# Orekit ground-station pass-prediction oracle

External-oracle driver for `kshana::passes::predict_passes`
(`tests/ground_station_pass_prediction_reference.rs`).

`OrekitPasses.java` reads a JSON pass-prediction request on stdin, reproduces only
kshana's circular two-body Kepler orbit and IAU-1982 GMST TEME->ECEF rotation to
obtain the satellite's Earth-fixed (ITRF) position samples, then hands those to
Orekit as an ITRF-frame `Ephemeris`. The ground station is an Orekit
`TopocentricFrame` on a WGS-84 `OneAxisEllipsoid`, and Orekit's own
`ElevationDetector` + `EventsLogger` find the rise/set (AOS/LOS) crossings of the
elevation mask; max elevation is taken from `TopocentricFrame.getElevation`. This
isolates the **pass geometry** (the thing kshana implements) while matching the
propagator/frame (which it does NOT validate).

This directory is workspace-excluded (see the root `Cargo.toml` `exclude = [ "/xval" ]`),
so it never enters the published crate's build graph; Orekit/Hipparchus are
Apache-2.0 and stay out of the AGPL crate. The committed reference vectors in
`tests/fixtures/ground_station_pass_prediction/` are the pinned Orekit output, so
the Rust test needs no runtime Java.

## Build & run

```sh
source /tmp/kshana-oracles/orekit/cp.sh   # exports OREKIT_CP and OREKIT_DATA
javac -cp "$OREKIT_CP" OrekitPasses.java
echo '{"altitude_km":550,"inclination_deg":90,"station_lat_deg":52,"mask_deg":10,
       "duration_hours":24,"year":2024,"month":1,"day":1}' \
  | java -cp ".:$OREKIT_CP" OrekitPasses
```

## Regenerate the fixture

```sh
source /tmp/kshana-oracles/orekit/cp.sh
javac -cp "$OREKIT_CP" OrekitPasses.java        # from this directory
cd <repo-root>
/tmp/kshana-oracles/.venv/bin/python \
  tests/fixtures/ground_station_pass_prediction/generate_ground_station_pass_prediction_reference.py \
  > tests/fixtures/ground_station_pass_prediction/ground_station_pass_prediction_reference.txt
```

## Oracle provenance

- Orekit 12.2 — CS GROUP, Apache-2.0.
- Hipparchus 3.1 — Apache-2.0.
- Java 21 (Temurin).
