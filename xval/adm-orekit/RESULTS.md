# Results: CCSDS ADM (AEM, APM) against Orekit 13.1.8

Pre-registration: `PREREGISTRATION.md` (7a6a05fe), committed alone. The engine code, the cases,
the Kshana-written messages, the test and the driver were committed in cf033c31 before Orekit
read any Kshana-written message. Judged by `tests/adm_orekit_oracle.rs`.

## Reproduce

```sh
bash xval/d8-orekit13/setup.sh                       # Orekit 13.1.8, Hipparchus 4.0.3, tai-utc.dat
F=tests/fixtures/adm_orekit_oracle
KSHANA_XVAL_WRITE=1 cargo test --test adm_orekit_oracle reproducible   # inputs.txt, kshana/
bash xval/adm-orekit/run.sh write $F/inputs.txt $F/orekit             # L2 messages
rm -f $F/outputs/orekit_reads_kshana.txt
bash xval/adm-orekit/run.sh read $F/kshana $F/outputs/orekit_reads_kshana.txt   # L1/L3 dump
cargo test --test adm_orekit_oracle -- --nocapture
bash xval/ndm-xsd/validate.sh $F/kshana/*.xml        # L4, data-gated
```

## Outcome (first run, 2026-10-14)

| Leg | Result |
|---|---|
| L1 Orekit parses every Kshana message (14 AEM KVN, 11 AEM XML, 4 APM KVN, 4 APM XML) | 33/33 parse; every value inside its bar (worst 0.054 of a bar), every header/metadata string identical |
| L2 Kshana parses every Orekit message | 31/31 parse, inside every bar; P02 (KVN, XML) not written by Orekit (finding below) |
| L3 record rotation vs `AemSegment.getAngularCoordinates()` | 135 records (quaternion, Euler, spin, versions 1.0 and 2.0), worst 0.0071 of the 1e-12 bar |
| L4 `xmllint --schema` NDM/XML 4.0.0 (data-gated, outside the verdict) | 15/15 Kshana XML messages validate |

**Verdict:** VALIDATED (Library oracle) for AEM 2.0 KVN/XML, AEM 1.0 KVN and APM 2.0 KVN/XML
interchange with Orekit, with one narrowing: APM maneuver blocks are covered in the Kshana-writes
direction only (L1), because Orekit's writer refuses a standard-conformant maneuver without
`MAN_DELTA_MASS`. Outside the case set and MODELLED: AEM 1.0 `*/RATE` types, AEM 1.0 XML,
repeated APM blocks.

## Findings

1. Orekit 13.1.8's APM writer refuses P02: "missing mandatory key MAN_DELTA_MASS". 504.0-B-2
   makes `MAN_DELTA_MASS` optional; Orekit's parser accepts a maneuver without it (checked by
   the driver author on an edited Orekit-written file). Pinned in the test.
2. Orekit's AEM parser stores `ANGVEL_FRAME` but does not set the rate-frame flag, so rates
   given in frame A (A04, EME2000) are treated internally as body rates. Raw values and
   rotations are unaffected; recorded as a convention gap.
3. Version gaps 504.0-B-1 to B-2 (QUATERNION_TYPE, ATTITUDE_DIR, RATE_FRAME, numeric rotation
   sequences, `*/RATE`): handled by version; recorded in the test documentation.

Harness: the driver registers a stub Earth (GCRF axes, no ephemeris) so Orekit resolves
`CENTER_NAME = EARTH` without JPL ephemerides; attitude data never uses it. A10 nutation
values come back through Orekit's precession finder with about 1.7e-11 relative residuals and
one phase shifted by -360 deg, inside the pre-registered SPIN/NUTATION bars.
