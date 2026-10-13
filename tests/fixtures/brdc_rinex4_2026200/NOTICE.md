# IGS merged broadcast ephemeris, 2026-07-19 (day 200): RINEX 4.02 and RINEX 3.04 slices

## Source

| file | URL | SHA-256 as downloaded (.gz) |
|---|---|---|
| `BRD400DLR_S_20262000000_01D_MN.rnx.gz` (RINEX 4.02) | https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2026/200/BRD400DLR_S_20262000000_01D_MN.rnx.gz | `1bca00e827e2ed812c9fb1ad27a622b045e29f2c53374c5dfa1a0e4d5ca50f26` |
| `BRDM00DLR_S_20262000000_01D_MN.rnx.gz` (RINEX 3.04) | https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2026/200/BRDM00DLR_S_20262000000_01D_MN.rnx.gz | `492c0fce56ab00213c2704a2eaa51d70621c97771f2568b5483a9b3adadd13fa` |

Downloaded 2026-10-13 from the BKG mirror of the IGS archive. Both are the IGS
multi-GNSS merged broadcast navigation files produced by DLR/GSOC (the RINEX 4
file's DOI record: https://doi.org/10.57677/BRD400DLR).

## Terms

IGS data and products are openly available for use without restriction, free of
cost or obligation, with an attribution requirement (IGS Data and Product
Disclaimer and Terms of Use,
https://igs.org/wp-content/uploads/2020/09/IGS-Data-and-Product-Disclaimer-and-Terms-of-Use-200805.pdf,
SHA-256 `7b4e253c24073af930c38ac65b30ae5208850c4a5681a0e2c6bbf388e72f8226`).
Attribution: International GNSS Service (IGS); DLR German Space Operations
Center (merged broadcast files); BKG (archive mirror).

## Crop (`make_fixture.py`)

```
python3 -I make_fixture.py BRD400DLR_S_20262000000_01D_MN.rnx.gz \
    BRDM00DLR_S_20262000000_01D_MN.rnx.gz .
```

Full header, then every record of systems G, E, C with epoch in
[2026-07-19 00:00, 02:00) of the record's own time scale, text copied byte for
byte. One redaction: the header COMMENT line listing individual contacts after
the agency is cut to the agency name (not read by any parser).

| committed file | lines | SHA-256 |
|---|---|---|
| `BRD400DLR_S_20262000000_slice.rnx` | 9304 | `af0e33a29f05fe0836b91b69a2930189f1e658f260a2424acfa50129479b45e1` |
| `BRDM00DLR_S_20262000000_slice.rnx` | 4851 | `abd2c81fefd2e31e3ee73b3141d1ca2537c4275eb6a54c65f810664096d55ee7` |

The RINEX 4 slice keeps all record types of those systems (`EPH` LNAV, CNAV,
INAV, FNAV, D1, D2, CNV1, CNV2, CNV3, and `STO`, `ION`, `EOP`), so the reader's
skipping is exercised on real records. The RINEX 3 slice also carries the
BeiDou GEO (C01–C05, C59–C63) records used by `tests/bds_geo_broadcast_oracle.rs`.

Pre-registrations: `PREREGISTRATION.md` (RINEX 4 vs RINEX 3) and
`PREREGISTRATION_BDS_GEO.md` (BeiDou GEO vs a precise orbit), each committed
before its first comparison run.
