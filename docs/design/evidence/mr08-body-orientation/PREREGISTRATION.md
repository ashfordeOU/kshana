# Pre-registration: IAU body orientation and GM of the fourteen added solar-system bodies

Written 2026-10-12 and committed alone, before the comparison below is run on this branch and
before the fresh-epoch SPICE fixture it names exists.

## Why a new pre-registration

The ledger row "Physical constants of every solar-system body and the whole-system report"
cites a pre-registration commit `c2434204` for the orientation comparison of
`tests/body_orientation_spice_oracle.rs`. That commit is not in this repository's history (the
history starts at the root commit `f745ee6`, which already contains the test, its fixture and
its result). The bars are written in the test header, but no commit shows them preceding the
first comparison. This file supplies that commit for the split-out orientation and GM row, and
adds a comparison on epochs never used before so the record does not rest only on a result that
was already known when this file was written.

Known before writing (disclosed): the existing test's result on its 41 epochs (all 574 matrices
within 1e-9 rad, worst Phobos 1.43e-10 rad) and the existing constants test's result (0 of 84
constants of the fourteen added bodies differ from NAIF).

## Claim to be split out of the row

(i) **IAU body orientation and GM of the fourteen added bodies** (Mercury, Venus, Jupiter,
Saturn, Uranus, Neptune, Pluto, Phobos, Deimos, Io, Europa, Ganymede, Callisto, Titan):
`Body::iau_rotation_et` (J2000 to the body's IAU body-fixed frame, with every century rate,
quadratic term and periodic term the body carries) and `Body::mu`. Oracle kind: Library check
of the orientation computation against the NAIF SPICE Toolkit, and External dataset for GM
(NAIF `gm_de440.tpc`).

(ii) Everything else in the row (J2 with its reference radius, the mean radius, the report's
other fields, and the Sun, Earth, Moon and Mars, which carry conventional constants owned by
other rows) stays MODELLED and is not part of this pre-registration.

## Comparisons and bars (fixed now)

1. **Orientation, existing epochs (re-run, unchanged):**
   `tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies`,
   41 epochs `et_k = (k - 20) x 70 000 000.5 s` past J2000 TDB, k = 0..40, against the committed
   `pxform('J2000', 'IAU_<BODY>', et)` fixture from `pck00011.tpc`. Bar: the rotation angle
   `2 asin(|R_K - R_S|_F / (2 sqrt 2))` at most **1e-9 rad** for every one of the 574 matrices.
2. **Orientation, fresh epochs (new, never compared):** the same generator logic (SPICE
   `pxform` on `pck00011.tpc`, SHA-256
   `3dff7b1dbeceaa01f25467767d3fa25816051c85d162d1edf04acb310ee28bb1`), run after this commit
   at 41 new epochs `et_k = (k - 20) x 61 000 003.25 s + 1 000 000.125 s` past J2000 TDB,
   k = 0..40 (about 1961-05 to 2038-09; the largest |d| is 14 133 days, inside the 16 204 days
   on which the 1e-9 rad rounding argument of the original header rests). Same fourteen bodies,
   same metric, same bar: **1e-9 rad for every one of the 574 matrices**.
3. **GM (re-run, unchanged):**
   `tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440`: `Body::mu`
   of each of the fourteen bodies equal to `BODYnnn_GM x 1e9` of `gm_de440.tpc` (SHA-256
   `924ddf4fb9ead9fe8a1aa55780bcabde40b09d00065d58226e24b68d8092f140`) at the significant
   digits Kshana prints, and the same for the radius, pole and prime-meridian constants that
   test already covers. Bar: **0 disagreements among the fourteen added bodies**.
   `only_the_conventional_constants_of_other_rows_differ` must also pass unchanged.

## Outcome rule

All three hold: the split-out row (i) is VALIDATED (Library check for the orientation, External
dataset for GM; the GM claim is that the shipped values are DE440's, a transcription verified
against the published file, not an independent determination of GM). Any one fails: row (i)
stays MODELLED, the failure is recorded with its numbers, and the bar is not moved.

## Not changed

No numeric output of the engine changes. The report field `prime_meridian_deg` of the Earth,
the Moon and Mars stays on the conventional constants (6.6e-3, 2.8e-2 and 9.6e-4 rad from
`IAU_<BODY>` of pck00011); it is documented, not moved, because moving it would change
published outputs owned by other rows.
