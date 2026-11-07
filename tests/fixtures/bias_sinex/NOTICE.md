# Bias-SINEX reader check: provenance

`tests/bias_sinex.rs` reads two public files when `KSHANA_BIAS_SINEX_DIR` names a directory that
`fetch.sh` filled. Nothing is vendored.

## Files

- `CAS0OPSRAP_20240350000_01D_01D_DCB.BIA`: daily differential code biases (DSB) of 4 February 2024
  (2024 day 035), rapid, from the Chinese Academy of Sciences, as distributed by the IGS global data
  centre at BKG (`IGS/products/2300/`). Compressed SHA-256
  7b30f113a12f476304414e6f49dfaacf82a36d92150b7ac547dd3276a836105e.
- `com22370.bia`: observable-specific biases (OSB) of 20 November 2022 (2022 day 324), from the CODE
  MGEX solution, as distributed by the IGS global data centre at BKG (`IGS/products/mgex/2237/`).
  Compressed SHA-256 306de772513d7b84962a724bbfb74798999e257d7f2c4dc05959c37d38d923d4.

Terms: the IGS Data and Product Disclaimer and Terms of Use (5 August 2020): IGS products are
provided openly for use, on condition that users cite and attribute them to the providers, the IGS
and its contributing organisations. Files fetched from the producers' own servers carry no licence
found and are not used. Neither file lies in the period pre-registered for item R1.3 (May 2025).

## What the check is

The files' own content: every data line of `BIAS/SOLUTION` must be read, with values equal to the
numbers printed (compared with an independent whitespace split of the same lines). This checks the
reader against the format as producers write it; it says nothing about the biases' accuracy.

## Recorded about the files

- Each header states a count of estimates that differs from its number of data lines (CAS: 5 611
  stated, 5 665 lines; CODE MGEX: 6 712 stated, 6 668 lines). The reader reports both.
- The CAS header writes its file time with a two-digit year (`24:037:49688`).
