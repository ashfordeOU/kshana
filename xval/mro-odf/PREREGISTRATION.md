# Pre-registration: the TRK-2-18 Orbit Data File reader on a real MRO ODF (CAP-30, stage 1)

Committed on its own on 2026-10-14, before Kshana has an ODF reader. The bars are not loosened
after a run. A miss is recorded with its numbers as a FINDING.

This registers stage 1 only: the reader. The orbit determination on these data (stage 2)
will be registered separately, before its first run.

## Data

From the PDS Geosciences Node (Mars Reconnaissance Orbiter radio science, data set
MRO-M-RSS-1-MAGR-V1.0, volume `mrors_0xxx`): `odf/mromagr2007_304_1424xmmmv1.odf` and its
label `.lbl`. NASA PDS archive data are public.

| File | Bytes | SHA-256 |
|---|---|---|
| mromagr2007_304_1424xmmmv1.odf | 1 911 168 | b3b781b9731a7ce33c1787601a9afb19cbc8b3c6e75822327bbb86b861d332dc |
| mromagr2007_304_1424xmmmv1.lbl | 57 636 | ef59628847f09c0cfe8f72dc8f31e3b88307be100a78a2592ac1e4371b685abf |

Both are vendored under `tests/fixtures/mro_odf/`.

## Oracle

The PDS label, which the DSN navigation data-conditioning process produced with the file. It
gives:

- the record size and count;
- the record at which each group starts;
- each table's row count;
- the stations;
- the start and stop times.

The reader is written from the format document in the same archive (`NAV023-ODF-2-18_Rev3.htm`,
TRK-2-18). The label is never read by the reader.

## Bars

| Id | Quantity | Bar |
|---|---|---|
| R1 | total records = file size / 36 | equals the label's FILE_RECORDS (53 088) |
| R2 | the record number at which the reader finds each group header (file label, identifier, orbit data, each ramp group, end of file) | equals the label's pointer for that table |
| R3 | rows per group: orbit data, ramp groups for stations 43, 63 and 14, end-of-file data | equal the label's ROWS (51 985; 321, 408, 244; 120) |
| R4 | the set of receiving stations in the orbit data group | equals the label's DSN_STATION_NUMBER {43, 63, 14} |
| R5 | first and last orbit-data time tags (seconds since 1950-01-01T00:00:00, UTC as the format defines it) | within 1 s of the label's START_TIME 2007-304T14:24:12 and STOP_TIME 2007-305T14:45:19 |
| R6 | every orbit-data record's data type | in the TRK-2-18 table of data types, and every Doppler record (types 11-13) has a positive reference frequency |

## Outcome rule

If R1-R6 hold, the ledger row "TRK-2-18 Orbit Data File reader" is VALIDATED against the PDS
label (ExternalDataset), stated narrowly as structure, time tags and stations. The decoded
observable values are not checked by these bars. They are checked by the stage 2 orbit
determination. If a bar misses, it is recorded as a FINDING and the row is MODELLED.
