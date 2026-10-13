# IGS MGEX RINEX 4.00 observation file, station MAO0, 2023-07-17 (day 198): first 4 epochs

## Source

| file | URL | SHA-256 as downloaded |
|---|---|---|
| `MAO000USA_R_20231980000_01D_30S_MO.crx.gz` (Compact RINEX 3.0 of RINEX 4.00 observations) | https://igs.bkg.bund.de/root_ftp/MGEX/obs_v4/2023/198/MAO000USA_R_20231980000_01D_30S_MO.crx.gz | `69c02b61f22aa90e057dd7b56336747324572c8d89571ea97da6a4130d7fdf1b` |

Downloaded 2026-10-13 from the BKG mirror (`MGEX/obs_v4`, the IGS MGEX RINEX 4
observation pilot). The day's file is named 2023 day 198 but its first epoch is
2023-07-17 00:00:00 GPST as the header states.

## Terms

IGS data and products are openly available for use without restriction, free of
cost or obligation, with an attribution requirement (IGS Data and Product
Disclaimer and Terms of Use,
https://igs.org/wp-content/uploads/2020/09/IGS-Data-and-Product-Disclaimer-and-Terms-of-Use-200805.pdf,
SHA-256 `7b4e253c24073af930c38ac65b30ae5208850c4a5681a0e2c6bbf388e72f8226`).
Attribution: International GNSS Service (IGS) Multi-GNSS Experiment; DLR German
Space Operations Center (station operator, per the file header); BKG (archive
mirror).

## Transform (`make_fixture.py`)

```
python3 -I make_fixture.py MAO000USA_R_20231980000_01D_30S_MO.crx.gz 4 \
    MAO000USA_R_20231980000_4EP_30S_MO.rnx
```

A stdlib-only Compact RINEX 3.0 decoder written for this fixture (no third-party
code was built or run) expands the first 4 epochs (58 satellites each, 7
systems) into RINEX 4.00 text: header verbatim except the observer name blanked
in `OBSERVER / AGENCY`; values written F14.3 with their LLI/SSI characters.
Decoder sanity check on the output (not a test): over the 3 epoch pairs, the
code-minus-carrier change on GPS/Galileo/QZSS/BeiDou L1/E1/B1C stays below
2.7 m and Doppler agrees with the carrier-phase rate to 0.84 Hz; a decoding error
would show as kilometres and kilohertz.

| committed file | lines | SHA-256 |
|---|---|---|
| `MAO000USA_R_20231980000_4EP_30S_MO.rnx` | 269 | `b7dafc4ce80aeaf9304e46cfe758cdafad8d8935a8eae585a8953848fe219185` |
