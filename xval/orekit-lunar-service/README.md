# Orekit lunar service-volume oracle

External-oracle driver for row M076, `tests/lunar_service_volume_orekit_oracle.rs`.

`LunarServiceVolumeOracle.java` builds the pre-registered scenario from Orekit's own
components (DE440 `lnxp1990.440`, the IAU Moon body frame, `KeplerianOrbit`, a
`NumericalPropagator` with Dormand-Prince 8(5,3), a Holmes-Featherstone degree-2 lunar field,
Earth and Sun `ThirdBodyAttraction`) and computes the visibility, dilution of precision
(Hipparchus LU inverse) and service-volume statistics on the 346-point south-polar grid. It
reads only the committed LNCSS element files; it calls no Kshana code. Orekit and Hipparchus
are Apache-2.0 and run as a separate program; this directory is outside the crate's build.

## Run

```sh
source ~/Code/kshana-oracles/env.sh          # OREKIT_CP, OREKIT_DATA
cd xval/orekit-lunar-service
javac -d /tmp/orekit-lunar-service -cp "$OREKIT_CP" LunarServiceVolumeOracle.java
java -Xmx4g -cp "/tmp/orekit-lunar-service:$OREKIT_CP" LunarServiceVolumeOracle \
  ../../tests/fixtures/lunar_ephemeris \
  > ../../tests/fixtures/lunar_service_volume_orekit_oracle/orekit_lncss.csv
```
