# Re-registration: the DE421 ME->PA offset with SPICE's documented Euler composition

Written 2026-10-13 and committed alone, after run 1 of `PREREGISTRATION.md` (recorded in
`RESULTS.md`, NOT MET) and before the engine is changed again.

## Disclosed

Everything in `RESULTS.md` is known: the SPICE matrix itself, the shipped error (207.70"), and
the transpose-only change's residual (1.254e-7 rad). This is therefore not a blind test of
which candidate matches. It fixes, from SPICE's own documentation (`frames.req`, quoted in
`RESULTS.md`), the one matrix the kernel definition means. It then checks that transcription
against SPICE at a bar that only an exact transcription meets. The bar is the same as in run 1
and is not loosened.

## Change (fixed now)

`lunar_frame.rs`: the PA<-ME offset becomes `pa_from_me() = Rz(67.92") Ry(78.56") Rx(0.30")`
(the frame rotations of the file, equal to SPICE's `[A]_i`), applied directly:
`icrf_to_moon_pa = pa_from_me() * icrf_to_iau_moon`. `me_from_pa` is removed and its doc comment
corrected. No other engine change.

## Bars (unchanged from the pre-registration)

1. The PA<-ME factor within **1e-12 rad** of SPICE `pxform('MOON_ME', 'MOON_PA')` at the three
   fixture epochs.
2. `icrf_to_moon_pa` within **30"** of the embedded DE440 PA series at the four epochs.

## Outcome rule

Both hold: the change is committed, the strict test un-ignored, and every moved output is
regenerated and recorded as the pre-registration says (`tests/agency_lro.rs` RMS with its bars
unmoved, the LRO row, `docs/AGENCY-ORBIT-VALIDATION.md`). 1 fails: the engine stays as shipped,
both runs are recorded, and the finding is reported, with no third attempt in this release.
