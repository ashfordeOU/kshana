# Pre-registration: kshana-bench task (h), Tokyo edition (UrbanNav-TK-20181219)

Written on 21 November 2026, after the Tokyo reader and fetch script were written and before any Tokyo score was
computed. Bars may be tightened later, never loosened; a miss is recorded as NOT MET. The Hong Kong edition
(`PREREGISTRATION.md`, `RESULTS.md`) is unchanged and is never pooled with this one.

## Data

UrbanNav Tokyo dataset, `Tokyo_Data.zip` (4,452,177,524 bytes, SHA-256
`d32de5fc0b5842080b00ce567e6011a0f8c454573892a827ab9054320d4b1a1f`), two runs of 19 December 2018: Odaiba and
Shinjuku. The README's License section states that the MIT licence covers the dataset files provided through its
download links, the GNSS RINEX and ground-truth files included. Kept per run: the Applanix POS LV620 reference
(`reference.csv`, 10 Hz), the u-blox F9P (5 Hz) and Trimble NetR9 (10 Hz) rover RINEX observations, and the merged
broadcast navigation file in the publisher's data (`base.nav`). `scripts/fetch_urbannav_tokyo.sh` checks the archive
and every kept file against pinned SHA-256; nothing is committed.

## What was seen before this was written (disclosed)

- The archive's file list, the header and first and last rows of the Odaiba `reference.csv`, the first three lines
  of `base.nav`, and the RINEX version, approximate position and time of first observation of the Odaiba rover files.
- NOT seen: any position error, any score, any solver output on these files.

## Task (as the Hong Kong edition, with these differences)

- **Truth:** the whole-second epochs of `reference.csv` (1 Hz, as in Hong Kong), GPS time converted to UTC with
  18 s.
- **Traces:** `tokyo-odaiba/{ublox-f9p,trimble-netr9}`, `tokyo-shinjuku/{ublox-f9p,trimble-netr9}`.
- **Splits:** the same rule over this edition's own sequences: test = `tokyo-shinjuku`, dev = `tokyo-odaiba`.
- **Baselines:** `kshana-spp` only (two passes, no truth used, single frequency, Klobuchar), with `base.nav`. The
  publisher provides no receiver NMEA for Tokyo, so `provided-nmea` is skipped.

## Bars

- **T1 (alignment sanity):** `kshana-spp` has a pooled P50 under 50 m on each split. A miss means the time or
  coordinate alignment is wrong, not that a receiver is poor.
- No accuracy bar: the first run is descriptive.
