# Pre-registration: RINEX 4 navigation reading vs the same day's RINEX 3 file

Committed alone, before the comparison test (`tests/rinex4_nav_brd400_oracle.rs`)
is first run. Bars may be tightened later, never loosened. A miss is recorded as a
finding with its numbers.

## Claim

`kshana::rinex::parse_nav` / `parse_nav_with` decodes the legacy Keplerian
broadcast records of a RINEX 4.02 navigation file (`> EPH` records of GPS `LNAV`,
Galileo `INAV`/`FNAV`, BeiDou `D1`/`D2`; QZSS `LNAV` is also read) into the same
`RinexEphemeris` values that the existing RINEX 3 reader produces from the RINEX
3.04 file of the same day and producer.

## Oracle (published data)

- RINEX 4.02: `BRD400DLR_S_20262000000_01D_MN.rnx.gz`
- RINEX 3.04: `BRDM00DLR_S_20262000000_01D_MN.rnx.gz`

Both from https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2026/200/ (IGS merged
multi-GNSS broadcast ephemeris, DLR, 2026-07-19). The two files are written
independently in two formats; agreement of the decoded values is the check.
SHA-256 values as downloaded are in NOTICE.md.

## Data used

The committed slices (`BRD400DLR_S_20262000000_slice.rnx`,
`BRDM00DLR_S_20262000000_slice.rnx`, produced by `make_fixture.py`): full
header, then every record of systems G, E, C whose epoch is in
[2026-07-19 00:00:00, 02:00:00) of the record's own time scale. The test also
runs on the two full-day files when `KSHANA_BRD400_FULL` and `KSHANA_BRDM_FULL`
name their uncompressed paths (skipped, with a message, when absent).

## Procedure

1. Parse both files with `parse_nav_with(.., NavParseOptions { include_beidou_geo: true })`.
2. Key each record by (system, PRN, Toc calendar epoch, Toe, IODE/IODnav/AODE,
   data-sources field). The data-sources field separates Galileo I/NAV from
   F/NAV records with the same IODnav. Take the first record per key in each file.
3. For every key present in both files, compare: af0, af1, af2, IODE, Crs, Δn,
   M0, Cuc, e, Cus, √A, Toe, Cic, Ω0, Cis, i0, Crc, ω, Ω̇, IDOT, data sources,
   week, SV accuracy, SV health, TGD (BGD E1/E5a), IODC (BGD E1/E5b / TGD2).
   Transmission time is excluded (a merged file may keep a different copy of the
   same message; it is not a Keplerian or clock parameter).
4. Evaluate `sv_position_ecef(toe)` from each and difference.

## Bars

- B1 (values): every compared field agrees within the last printed digit:
  |a − b| ≤ 10^(E − 12) · (1 + 1e-9), E = floor(log10(max(|a|, |b|))), both
  files printing a 12-digit mantissa (D19.12); two zeros are equal.
- B2 (positions): |Δ sv_position_ecef(toe)| < 1 mm for every matched record.
- B3 (non-vacuity, slice): matched records ≥ 20 GPS, ≥ 100 Galileo,
  ≥ 30 BeiDou. Full day (when run): ≥ 200 GPS, ≥ 1000 Galileo, ≥ 300 BeiDou.
- B4 (completeness): the number of RINEX 4 records decoded with default options
  equals the number of `> EPH` header lines of the decoded message types in the
  file, minus the BeiDou GEO ones (C01–C05, C59–C63).

Reported, not barred: the fraction of RINEX 4 keys found in the RINEX 3 file and
vice versa, per system.
