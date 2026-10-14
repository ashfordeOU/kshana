# Results: CCSDS ODM (OPM, OMM, OCM) against Orekit 13.1.8

Pre-registration: `PREREGISTRATION.md` (cc6841da), committed alone. The engine code, the cases,
the Kshana-written messages, the test and the driver were committed in 2e4f9b30 before Orekit
read any Kshana-written message. Judged by `tests/odm_orekit_oracle.rs`.

## Reproduce

```sh
bash xval/d8-orekit13/setup.sh                       # Orekit 13.1.8, Hipparchus 4.0.3, tai-utc.dat
F=tests/fixtures/odm_orekit_oracle
KSHANA_XVAL_WRITE=1 cargo test --test odm_orekit_oracle reproducible   # kshana/, legacy/
bash xval/odm-orekit/run.sh $F/kshana $F/outputs/orekit_reads_kshana.txt $F/orekit   # L1 dump, L2 files
bash xval/odm-orekit/run.sh $F/legacy $F/outputs/orekit_reads_legacy.txt "$(mktemp -d)"
cargo test --test odm_orekit_oracle -- --nocapture
bash xval/ndm-xsd/validate.sh $F/kshana/*.xml        # L3, data-gated
```

## Outcome (first run, 2026-10-14)

| Leg | Result |
|---|---|
| L1 Orekit parses Kshana's messages (11 OPM, 9 OMM, 10 OCM files) | 27/30 parse; every value inside its bar (904 values, worst 0.021 of a bar) except the C05 TDB relative epochs; M04.kvn, M05.xml, O06.xml refused (findings 1, 2) |
| L2 Kshana parses Orekit's rewrite of every message Orekit parsed | 25/25 parse, inside every bar (858 values, worst 0.020) except the same C05 TDB epochs; M02 not written by Orekit (finding 3) |
| L3 `xmllint --schema` NDM/XML 4.0.0 (data-gated, outside the verdict) | 14/14 Kshana XML messages validate, M05.xml and O06.xml included |
| Legacy `OmmFile::to_omm_kvn` (recorded, outside the verdict) | refused by Orekit at `META_START` (finding 5) |

Findings (pinned in the test, each asserted to recur):

1. Orekit 13.1.8 requires `ELEMENT_SET_NO` in the OMM TLE block; 502.0-B-3 and the schema make
   it optional. M04 (the TLE-derived version-2.0 message, which has no element set number) has
   no Orekit coverage.
2. Orekit's XML parser refuses `COMMENT` inside `<userDefinedParameters>`, which the schema
   allows (M05.xml, O06.xml validate). The KVN forms of both cases pass both legs.
3. Orekit's OMM writer requires `BSTAR` even when the TLE block carries `BTERM` (SGP4-XP); its
   parser reads M02 (L1 passes), so L2 does not cover `BTERM`/`AGOM`.
4. OCM relative epochs under `TIME_SYSTEM = TDB`: Orekit adds the offset as elapsed SI seconds,
   so its TDB calendar epoch drifts from `EPOCH_TZERO` + offset by about 1.9e-10 s/s (up to
   1e-7 s in C05), outside the 1e-9 s bar, in both legs. UTC, TAI and TT relative epochs agree.
   A convention gap between readings of the standard; Kshana keeps epoch tokens unresolved.
5. The legacy `OmmFile::to_omm_kvn` wraps OMM metadata in `META_START`/`META_STOP`, which the
   OMM KVN does not define. Its output is kept byte-identical; `OmmMessage::from_omm_file`
   gives the conformant full-precision message.

**Verdict:** VALIDATED (Library oracle, Orekit 13.1.8) for the interchange of OPM 3.0/2.0 and
OMM 3.0 (KVN and XML) and OCM 3.0 (KVN and XML; TRAJ of types CARTP/CARTPV/CARTPVA, PHYS, COV
CARTP/CARTPV in LTM order, MAN with the case-set compositions, USER), with the narrowings of the
findings: user-defined blocks with comments in XML, `BTERM`/`AGOM` in the Kshana-reads leg,
OMM TLE blocks without `ELEMENT_SET_NO`, and OCM relative epochs in TDB are not covered.
PERT and OD blocks, non-Cartesian element sets and other covariance orderings are out of scope
(not read or written).
