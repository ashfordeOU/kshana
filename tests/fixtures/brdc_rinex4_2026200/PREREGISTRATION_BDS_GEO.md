# Pre-registration: BeiDou GEO broadcast positions vs a precise orbit

Committed alone, before any comparison is run. Bars may be tightened later,
never loosened. A miss is recorded as a finding with its numbers.

## Claim

`RinexEphemeris::sv_position_ecef_bds_geo(t, true)` (reached through
`parse_nav_with(.., NavParseOptions { include_beidou_geo: true })`) implements the
BeiDou GEO user algorithm of BDS-SIS-ICD-B1I v3.0 §5.2.4.12 (node longitude
without Earth rotation since Toe, then `R_Z(Ω̇e·tk)·R_X(−5°)`).

## Oracle (published data)

An IGS MGEX precise orbit that contains the BeiDou GEOs (WUM0MGXFIN,
GFZ0MGXRAP or COD0MGXFIN SP3) for 2026-07-19, compared with the GEO records of
the broadcast file `BRDM00DLR_S_20262000000_01D_MN.rnx` (same day; slice committed
here, full day via `KSHANA_BRDM_FULL`). The SP3 path is read from
`KSHANA_BDS_GEO_SP3`; the test (`tests/bds_geo_broadcast_oracle.rs`) skips with a
message when it is absent.

## Procedure

For every GEO PRN present in both (C01–C05, C59–C63), every SP3 epoch t (GPST,
converted to BDT by −14 s) with a broadcast record of that PRN whose |t − Toe| ≤
3600 s (the nearest such record), compute the 3-D distance between the broadcast
position and the SP3 position. No antenna-offset correction is applied: the
broadcast orbit refers to the antenna phase centre, the SP3 to the centre of
mass; the offset is ~1 m for the BDS GEOs and is inside the bars.

## Bars (from the broadcast-orbit accuracy literature, chosen before any result)

Published BDS GEO broadcast-orbit errors are metre-level radially with
along-track errors of several metres ("Broadcast versus precise ephemerides: a
multi-GNSS perspective", GPS Solutions 19 (2015) 321–333; BDS Open Service
Performance Standard, CSNO, 2021).

- G1: median 3-D error over all compared (PRN, epoch) pairs < 5 m.
- G2: maximum 3-D error < 20 m.
- G3 (discrimination): with the R_X(−5°) step omitted
  (`sv_position_ecef_bds_geo(t, false)`), the median 3-D error > 1 km.
- G4 (non-vacuity): ≥ 3 GEO PRNs and ≥ 50 compared epochs in total.

## Status at registration

The precise-orbit products with BeiDou GEOs are not reachable from the session
that wrote this (the BKG mirror carries no MGEX orbits after GPS week 2237 and its
CODE MGEX orbits omit the GEOs; the IGN, Wuhan and CDDIS archives were not
reachable). Until the test is run with an SP3 file the claim is MODELLED only.
