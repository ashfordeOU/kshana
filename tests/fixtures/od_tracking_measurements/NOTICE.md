# od_tracking_measurements fixture

`od_tracking_measurements_reference.txt` is generated output of the oracle driver in `java/`
(this repository's own code, AGPL-3.0-only), run against:

- Orekit 12.2 (CS GROUP, Apache-2.0), `orekit-12.2.jar` from Maven Central
- Hipparchus 3.1 (Apache-2.0), core/geometry/ode/optim/filtering/fitting/stat jars from Maven Central
- orekit-data (the `orekit-data-main` set; only the UTC-TAI history is used, for the epoch)
- OpenJDK 21.0.12

No third-party data is vendored: every number is simulated by the driver (seeded noise) or computed
by Orekit's estimator. Jars and orekit-data are not committed.

| file | SHA-256 |
|---|---|
| `od_tracking_measurements_reference.txt` | `8696b3a3f2d65d8c90662312d9aefedd00e985af99db41c82a33ee11ef1f3ada` |

Reproduce (Orekit/Hipparchus jars on `OREKIT_CP`, orekit-data at `OREKIT_DATA`):

```sh
cd java
javac -cp "$OREKIT_CP" -d /tmp/odtrk GeometricRange.java GeometricRangeRate.java GeometricAzEl.java OrekitTrackingOd.java
java  -cp "/tmp/odtrk:$OREKIT_CP" OrekitTrackingOd > ../od_tracking_measurements_reference.txt
```

The output is deterministic (seeded noise, fixed-step integration). Consumer:
`tests/od_tracking_measurements_reference.rs`; pre-registered bars:
`xval/od-measurements-orekit/PREREGISTRATION.md`.
