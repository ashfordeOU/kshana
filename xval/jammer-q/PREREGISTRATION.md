# Pre-registration: the jammer-type Q table, broadband and swept from 1 to 2

Committed before the changed engine is run on any scenario. It fixes what the change is, what
it must do to every output, how the outputs are compared, and what counts as a finding. The
expectations below are not changed after the comparison has been run.

## The change

`jamming::q_factor`, the spread-spectrum adjustment coefficient `Q` of the anti-jam equation
`(C/N0)_eff = [1/(C/N0) + (J/S)/(Q R_c)]^-1`, by jammer type:

| type | before (release/0.36.0-rc @ 617d4f51) | after | basis |
|---|---|---|---|
| `cw`, `narrowband` | 1 | 1 (unchanged) | a tone on the carrier: `κ = G_s(0) = T_c`, `Q = 1/(R_c κ) = 1` |
| `broadband` | 1 ("kept as a conservative value ... pending review") | **2** | white noise over the main lobe `±R_c`, in-band signal power normalised to one: `κ = 1/(2 R_c)`, `Q = 2` (Kaplan and Hegarty, *Understanding GPS/GNSS*, 3rd ed., §9.4; Betz, NAVIGATION 48(4), 2001); without the normalisation `Q = 2/0.9028 = 2.215` |
| `swept` | 1 | **2** | a tone swept over the main lobe has, over whole sweeps, the flat spectrum of broadband noise |
| any other type | 1 | 1 (unchanged) | an unrecognised type keeps the most damaging value, so a misspelt type is never optimistic. (The parked WIP branch `fix/iq-d5-jammer-q` @ 03522276 mapped it to 2; that is not taken.) |
| `q_override` given | the override | the override (unchanged) | |

Both table values are pinned in the tests to the closed forms computed by
`navsignal::q_from_ssc` from the C/A power spectrum (the spectral-separation code the ledger
already holds VALIDATED).

## Expected effect on outputs (fixed now)

Where a broadband or swept jammer acts, with no `q_override`, the interference term halves:

1. **Effective C/N0** rises by
   `Δ = 10·log10[(1/c + j/R_c) / (1/c + j/(2R_c))]`, with `c` the nominal C/N0 and `j` the J/S
   (linear). `0 < Δ ≤ 10·log10 2 = 3.0103 dB`. It tends to 3.0103 dB where the jammer dominates
   and to 0 where it is negligible. It never falls.
2. **Any J/S threshold** derived from a C/N0 threshold through the equation (denial J/S,
   loss-of-lock J/S) rises by exactly 3.0103 dB.
3. **Any radius or range** found by inverting free-space path loss at such a threshold shrinks
   by the factor `10^(-3.0103/20) = 0.70711` (20 dB per decade). Radii that the code also
   clamps, grids or bisects may move by less than that or by one grid step; that is not a finding.
4. **Lock and denial states** can only move towards tracking: an epoch or satellite that was
   tracking stays tracking. Counts of satellites tracked or available can only rise, and counts
   of satellites denied or lost can only fall.
5. **Everything else is byte-identical:**
   - scenarios with no jammer, or with only `cw` or `narrowband` jammers, or with `q_override`
     on every jammer;
   - the `spectrum` kind's own spectra and SSC-derived C/N0;
   - every scenario of a kind that does not call `q_factor`.
6. **The `spectrum` kind's cross-check** prints the table Q beside the spectral Q. For a
   broadband or swept jammer the printed table value changes from 1 to 2, and with it any
   difference it reports. Its own figures do not change.
7. **The IQ campaign scorer** (`iq/campaign/score.rs`) changes only its MODELLED analytic
   reference curve, which shifts by item 1. The labfit default `Q` for an unnamed jammer type
   (`iq/labfit/schema.rs`, "broadband") becomes 2. No measured or scored quantity changes.

## Method

1. Build release binaries of `release/0.36.0-rc` @ 617d4f51 ("before") and of the change ("after").
2. Run every scenario file under `scenarios/` with each binary.
3. Compare the `*.result.json` files value by value (numbers to the last digit, strings exactly).
4. List every file that differs, every field that differs, and the before and after values.
5. Run the full test suite on the change. Any committed golden or pin it moves is regenerated
   only after its move has been classified against items 1 to 7 above, and the regeneration is
   listed in the commit.

## Decision rule

- **Expected:** every difference is one of items 1 to 7. Items 1 to 3 are judged within
  1e-9 dB (or 1e-9 relative) of the predicted value, or within the stated grid or bisection
  tolerance where item 3's clamping applies. The change is then a stated result change,
  flagged in the CHANGELOG with the table of what moved.
- **Finding:** any difference outside items 1 to 7 (a value that moves the wrong way, a
  scenario without a broadband or swept jammer that changes, a C/N0 rise above 3.0103 dB). It
  is reported as found, with the file, field and values, and the cause is traced before
  anything is regenerated. The expectations here are not edited to fit it.

The ledger rows that state the Q table, the jamming kind's row and the spectrum row are
updated to the new table, and stay MODELLED. No row changes tier: the closed forms behind `Q`
were already validated through `navsignal`, and the anti-jam equation's use is a model choice.
