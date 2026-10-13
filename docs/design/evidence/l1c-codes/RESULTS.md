# GPS L1C ranging and overlay codes against the IS-GPS-800J check columns: results

Pre-registration: `PREREGISTRATION.md` (committed at `fe372e26`, before this run). The bars were
not changed. Reproduce with

```
cargo test --test iq_signals_gps_l1c
pdftotext -layout IS-GPS-800J.pdf IS-GPS-800J.txt
python3 -I scripts/extract_is_gps_800_tables.py IS-GPS-800J.txt --check src/iq/signals/tables.rs
```

| Bar | Result |
|---|---|
| C1: initial and final 24 chips of all 126 L1CP and L1CD codes (PRN 1..63) | **MET**: 252 of 252 columns identical |
| C2: initial and final 11 bits of all 63 L1CO codes | **MET**: 63 of 63 identical |
| C3: computed Legendre sequence against Table 6.2-1 | **MET**: 10 223 of 10 223 bits identical |
| C4: `extract_is_gps_800_tables.py --check` on the committed tables | **MET**, run on 2026-10-13 |

C4 details:
- PDF retrieved 2026-10-13 from the URL in the script; SHA-256
  `c4aad71058a0eba1ba90672e9511566d2d124b49801cfaa42a51c21241815d0a`, the hash the script
  records.
- Text from `pdftotext -layout`, version 24.02.0.
- The script applied its one stated repair (the Table 3.2-2 row printed as PRN 3 after PRN 37
  is read as PRN 38) and reported that the block in `tables.rs` matches the extraction.

A negative control (`the_column_check_rejects_relabelled_inverted_and_shifted_codes`) shows the
check failing every column for a relabelled PRN and an inverted code, and at least 120 of 126
columns for a one-chip shift.

## What this shows and what it does not

The crate's construction (Weil code from the computed Legendre sequence, the 7-chip
expansion inserted before chip `p`, the S1 overlay register) reproduces the chips the ICD
prints. The parameters `w`, `p`, the S1 polynomial and initial state come from the same
tables, transcribed mechanically. A wrong parameter that the ICD printed consistently with
its own check columns would not be caught.

Not covered:
- the L1CO S2 codes (PRN 64 and above);
- the full code beyond the first and last chips (the ICD prints only those);
- any receiver's use of the codes.
