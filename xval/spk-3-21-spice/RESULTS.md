# Results: SPK types 3 and 21 against the NAIF SPICE Toolkit

Pre-registration: `PREREGISTRATION.md` (e1cf80d8), committed alone; its SHA-1 seeds the draws.
The writer and reader, the drawn records, Kshana's kernels, the generator and the test were
committed in 46ca504e before SPICE read any Kshana kernel or wrote its own. Judged by
`tests/spk_3_21_spice_oracle.rs`.

Oracle: CSPICE N0067 through spiceypy 8.3.0 (`spkw03`, `spkw13`, `spkpvn`, `spkgeo`, DAF
inventory). `spkw21` has no spiceypy wrapper and was called from the same `libcspice.so` by its
f2c symbol (`spkw21_`), with SPICE's error state checked after the call. Run on 2026-10-14.

## Reproduce

```sh
python3 -m venv /tmp/spk && /tmp/spk/bin/pip install spiceypy==8.3.0 numpy
D=tests/fixtures/spk_3_21_spice_oracle
/tmp/spk/bin/python -I $D/generate.py inputs $D                    # records (already committed)
KSHANA_XVAL_WRITE=1 cargo test --test spk_3_21_spice_oracle reproducible
/tmp/spk/bin/python -I $D/generate.py oracle $D
cargo test --test spk_3_21_spice_oracle -- --nocapture
```

## Outcome (first run): every bar MET

| Leg | Result |
|---|---|
| W1 inventory of G1-G3 (`spkobj`, `spkcov`, descriptors, names) | exact; Kshana's reader returns the same |
| W2 SPICE `spkpvn`/`spkgeo` (and the -2103 to 399 chain) on Kshana's files vs Kshana's reader | 48 876 components, bit-identical (worst 0 of the bar) |
| B1/B2 Kshana's files vs SPICE's from the same records | identical: 0 differing bytes in G1, G2 and G3 |
| R1 Kshana's reader on SPICE's files vs SPICE | 48 876 components, bit-identical |

Covered: type 3 degrees 0, 12 and 27 (3 to 150 records, descriptor at and inside the record
span); type 21 MAXDIM 15, 20 and 25 (1 to 250 lines, zero, one and two directory entries, a
centre chain); type 3, 21 and 13 segments in one file with a comment area.

Not covered: fitting Chebyshev coefficients or producing difference lines (Kshana writes and
reads given records); real JPL-produced type 21 kernels; synthetic records say nothing about
physical accuracy.
