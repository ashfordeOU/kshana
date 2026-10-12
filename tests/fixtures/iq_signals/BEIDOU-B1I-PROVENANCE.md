# BeiDou B1I primary codes from GNSS-SDR (test fixture): provenance

| File | Content | SHA-256 |
|---|---|---|
| `beidou_b1i_gnss_sdr.txt` | per PRN 1..63: first 64 chips (hex) and SHA-256 of all 2046 chips | `af3a7153f6297f22edf651f62a44d09f3b26e500ed7dd6b8151862d817f5418d` |
| `beidou_b1i_dump.cc` | the harness (this repository's code) that calls the generator and prints each code | (this repository) |
| `beidou_b1i_format.py` | turns the harness output into the fixture (prefix + hash) | (this repository) |

**Generator.** GNSS-SDR (https://github.com/gnss-sdr/gnss-sdr), tag `v0.0.19`, commit
`1ddd4562723040fd66cb334b578a5b69455625f4`, function `beidou_b1i_code_gen_int(dest, prn,
chip_shift = 0)` in `src/algorithms/libs/beidou_b1i_signal_replica.cc` (file SHA-256
`d43319885acbd1b0da0ad6123c0d087ad94b813b95b3ea44b0e9c4fdfd4334a3`). Licence of the generator:
GPL-3.0-or-later. Generated 2026-10-12 with g++ 13.3.0 (`-std=c++20 -DHAS_STD_SPAN=1`).

**Only program output is committed.** No GNSS-SDR source, header or binary is in this
repository; the harness `#include`s the GNSS-SDR header from a separate checkout at build time.
The committed numbers are the chip sequences that BDS-SIS-ICD-B1I-3.0 defines, as printed by that
program, reduced to a 64-chip prefix and a hash. Our reading is that the GPL does not reach
this output (it reproduces no expression of the program, only the ICD's code sequences); that
is a reading, not a legal opinion, and the audit flagged it for confirmation.

**Transform.** GNSS-SDR's integer `+1` (where `G1 XOR G2 = 1`) is written as logic bit 1 and
`-1` as 0. The prefix packs chips 0..63 MSB first into 16 hex digits; the hash is the SHA-256
of the 2046-character ASCII string of `'0'`/`'1'`.

**Regenerate** (needs a GNSS-SDR v0.0.19 checkout at `$G`):

```
L=$G/src/algorithms/libs
g++ -std=c++20 -O1 -DHAS_STD_SPAN=1 -I$L beidou_b1i_dump.cc $L/beidou_b1i_signal_replica.cc -o b1i_dump
./b1i_dump > codes.txt && python3 -I beidou_b1i_format.py codes.txt > beidou_b1i_gnss_sdr.txt
```

Used by `tests/iq_signals.rs::beidou_b1i_matches_gnss_sdr_generator_for_all_63_prns`; bar
pre-registered in `xval/beidou-b1i-gnss-sdr/PREREGISTRATION.md`.
