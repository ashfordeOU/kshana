# Pre-registration: GPS LNAV encoding on an unseen broadcast file (MR-03) with an R2 bar on the oracle's own constants (MR-04)

Committed and pushed on its own, on 2026-10-12, before the input file below exists. The input is
an International GNSS Service (IGS) daily broadcast file for a day that has not happened yet, so
neither the file nor any result on it can have been seen when the criteria were written. The git
commit and push times of this file, and the publication time of the input file, are the evidence
of ordering; they are recorded in the result section when the run is made. The criteria below are
not changed after the run; they may only be tightened before it.

## Why a fresh registration

- MR-03 (docs/MODELLED-RATIONALE.md, "GPS LNAV navigation-message encoding"): the integer-level
  comparison `tests/gps_lnav_rtklib_integer_oracle.rs` agreed, but its pre-registration landed
  two seconds after the result commit, so the ordering cannot be shown. The row says a fresh
  registration pushed before an unseen broadcast file is fetched would settle it. This is that
  registration.
- MR-04 ("GPS LNAV encoding decoded by an independent receiver library"): R1 and R3 of
  `tests/gps_lnav_rtklib_decode_oracle.rs` passed; R2 failed on 41 values only because RTKLIB's
  decimal `P2_43` constant differs from 2^-43 by 2.6e-16 relative, so a bar of 2^-52 relative to
  the exact IS-GPS-200 scale was tighter than the oracle's own constant. That earlier result was
  seen; the new R2' bar below is therefore applied only to the NEW, unseen input, never to the
  old data, and the old finding stays as recorded.

## Input (fixed now)

The IGS daily merged broadcast navigation file for **2026-10-20 (day of year 293)**:
`BRDC00IGS_R_20262930000_01D_MN.rnx.gz` from the BKG mirror of the IGS archive,
`https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2026/293/`. If, and only if, that file is not
published by 2026-10-27, the file of day 294 under the same name pattern is used instead and the
substitution is recorded. Its SHA-256 as downloaded goes into the fixture NOTICE. For each GPS
PRN 1 to 32 present, the ephemeris with the earliest t_oe is used (as in the integer test).

## Method (fixed now; the same harness as the integer test)

1. `RTKLIB=<clone at v2.4.2-p13, commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807> bash generate.sh parse`
   with the day changed to 2026/293: RTKLIB `readrnx` parses the file and prints each GPS
   ephemeris with 17 significant digits.
2. Kshana `gps_lnav::encode_subframes` encodes those values, with the week and t_oe of each
   ephemeris as transmission time (hand-over-word count t_oe/6 + 1), `LnavConventions::default()`,
   previous word zero (`write_kshana_words`).
3. `generate.sh decode`: RTKLIB `decode_word` and `decode_frame` decode Kshana's words.
4. A new test `tests/gps_lnav_rtklib_fresh_oracle.rs` reads the committed outputs and checks the
   criteria. No code in `src/gps_lnav.rs` is changed between this registration and the run.

## Criteria (fixed now)

- **I1** every one of the 30 words of every satellite passes RTKLIB's parity, and subframes 1, 2
  and 3 decode for every satellite.
- **I2** for every computed field, RTKLIB's decoded value divided by RTKLIB's own scale constant
  and rounded EQUALS Kshana's integer (`field_values`); week, t_oc, t_oe, IODE, IODC, health and
  codes-on-L2 equal the input. Exact.
- **R2'** (the MR-04 bar, defined on the oracle's own constants): for every computed field,
  RTKLIB's decoded value equals Kshana's integer times RTKLIB's own scale constant, i.e. the
  decimal `P2_xx` values of `rtklib.h` / `rtkcmn.c` at v2.4.2-p13, times RTKLIB's `SC2RAD`
  (3.1415926535898) for semicircle fields, evaluated in IEEE double with the same operation order
  as RTKLIB (`integer * P2_xx`, then `* SC2RAD`), to a relative difference of at most 2^-52
  (zero for a zero value).
- **R3** every scaled input value lies within half a quantum (times 1 + 1e-9 for the decimal
  input) of Kshana's integer times the exact IS-GPS-200 scale; week, t_oc and t_oe exact.
- **Non-vacuity**: at least 25 satellites.

Outcome rule: if I1, I2, R2' and R3 all hold, MR-03 and MR-04 are promotable on this run. Any
failure is recorded with its numbers as a finding; the bars are not loosened.

## Status at registration

The run needs RTKLIB built from source as a separate program. In the session that wrote this
registration, building third-party source was not permitted, so the run is pending; it will be
made by whoever can run `generate.sh`, against exactly these criteria.
