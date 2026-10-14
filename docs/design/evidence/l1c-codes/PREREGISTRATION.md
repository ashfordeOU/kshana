# GPS L1C ranging and overlay codes against the IS-GPS-800J check columns: pre-registration

Item PRO-39. Written and committed **before** the crate's L1C codes are compared with the
check columns for the first time in this item. The bars below may be tightened after a run,
never loosened. A miss is recorded in `RESULTS.md` with its numbers as a finding; the code is
not changed to match within this item, and the bar is not changed.

## What is compared

- **Under test:** `kshana::iq::signals::gps::{l1c_p_bits, l1c_d_bits, l1c_o_bits}` for PRN
  1..63: the 10 230-chip L1CP and L1CD ranging codes, built from the Legendre sequence the
  crate computes (`legendre(10223)`), the Weil index `w`, the insertion index `p` and the
  expansion sequence `0110100`; and the 1800-bit L1CO overlay codes from the S1 generator.
- **Oracle:** the check columns IS-GPS-800J (01-AUG-2022, distribution statement A) prints next
  to the generator parameters: Table 3.2-2, "Initial 24 Chips (Octal)" and "Final 24 Chips
  (Octal)" for L1CP and L1CD; Table 3.2-3, "Initial 11 bits" and "Final 11 bits" for L1CO; and
  Table 6.2-1, the length-10223 Legendre sequence. The columns are in `src/iq/signals/tables.rs`,
  written by `scripts/extract_is_gps_800_tables.py` from the PDF (URL and SHA-256 in the
  script), and are not edited by hand.

The generator parameters (`w`, `p`, the S1 polynomial and initial state) come from the same
tables, so the check is that the crate's construction turns the ICD's parameters into the
ICD's printed chips; it is not a check of the parameters themselves.

## Conventions (fixed now)

- A printed 24-chip octal column is read as 24 bits, the first (earliest) chip in the most
  significant bit; the 8 octal digits carry exactly 24 bits. Initial = chips 0..23, final =
  chips 10206..10229.
- A printed 11-bit L1CO column is read as 11 bits, the earliest bit most significant (the
  leading octal digit carries 2 bits). Initial = bits 0..10, final = bits 1789..1799.
- Table 6.2-1 is read as 10 224 bits, most significant bit of each octal digit first; the first
  bit is the padding the ICD says to ignore, so bits 1..10223 are `L(0)..L(10222)`.
- Chips are logic bits. A code that matches only after an inversion, a chip shift or a PRN
  relabelling is a **miss**.

## Bars

- **C1 (ranging codes).** For each of the 126 codes (L1CP and L1CD, PRN 1..63), the initial
  24 chips and the final 24 chips equal the printed columns. No tolerance: one differing chip
  in one code fails the bar.
- **C2 (overlay codes).** For each PRN 1..63, the initial 11 and final 11 bits of the 1800-bit
  L1CO code equal the printed columns. No tolerance.
- **C3 (Legendre sequence).** The crate's computed `legendre(10223)` equals Table 6.2-1 bit for
  bit (10 223 bits). No tolerance.
- **C4 (transcription).** Where the PDF is available, `extract_is_gps_800_tables.py --check`
  passes on the committed `tables.rs` (the block is what the script extracts). Recorded as run
  or not run; not run is not a pass.

## Outcomes

- All of C1 to C3 met: a ledger row for the L1C codes may cite IS-GPS-800J's printed columns as
  a published oracle. Rows for other signals do not change.
- A miss: recorded with the PRN, component and first differing chip index.

## Out of scope

L1CO S2 codes (PRN 64 and above), the TMBOC chip pattern of L1CP (covered by unit tests already
in `src/iq/signals/gps.rs`), the CNAV-2 message, and any receiver's use of the codes.
