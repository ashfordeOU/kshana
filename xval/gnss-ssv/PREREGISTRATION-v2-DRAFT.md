# Pre-registration v2 for the `gnss-ssv` bars not met (0.40 WS-D): DRAFT, awaiting owner sign-off

**Status: DRAFT. Nothing in this document has been run, and nothing may be run until the owner signs it off in
writing in the commit that promotes it.** It is committed alone, before any code for it exists and before any number
it would produce has been computed. A change after sign-off is a new pre-registration.

**What stays as it is.** `PREREGISTRATION.md` (with its addenda 1 to 5), `RESULTS.md`, `results-run1.json`,
`results-variant-glonass-table-4-2.json` and `results-s7.json` are the record and are not edited. Run 1 is the run of
record; its verdicts (S0 and S6 MET; S1 to S5 and S7 NOT MET) and the ledger status (MODELLED) stand, and
`tests/ssv_booklet_results.rs` keeps asserting them. Nothing here loosens a bar. A bar below that is met does not turn
the old bar met; it is a new, separately named result.

## Why a second campaign

Six of the eight original bars were not met (S1 to S5, S7). What the record shows:

- The misses in S1 to S5 are dominated by GLONASS. The booklet prints two different reference off-boresight angles for
  it (20 and 28 degrees in tables B2 and B6; 26 and 34 degrees in table 4.2). A diagnostic run with the second pair
  brought S1, S2 and S4 to every cell, S3 to 153 of 155 cells and S5 to 21 of 26, but it was chosen after seeing run 1, so
  it is an explanation, not a result.
- Left over in that variant: S3 two cells (GPS L1, at least one signal at 20 dB-Hz: 88.05 against 90.5; BDS L5, at
  least four signals at 20 dB-Hz: 27.82 against 32.4), S5 five cells (HEO: Galileo L1, QZSS L1 and L5, NavIC L5 at least one
  signal; GLONASS L5 at least four: 63.8 against 55.5) and S6 three cells (lunar GLONASS L1, L5 and the L5 combined row).
- S7: the parametric sidelobe stand-in differs from the measured GPS panel patterns by 6.3 to 8.8 dB RMS against a bar of
  3 dB, because its flat main lobe is not what the panels do.

This campaign asks what the data can support when the choices that were open are fixed from independent evidence, in
advance, one at a time, and every result is published whether or not it helps.

## Public data (all of it public; nothing is vendored)

| Item | Source | Status |
|---|---|---|
| The ICG Space Service Volume booklet, first edition | UN OOSA ST/SPACE/75, 1 November 2018; `xval/gnss-ssv/fetch.sh`, SHA-256 `3bdeb9edd5cfdb98323a3a6df83c2e7f0669785f428a8fe5bb2302aa6a62b4d6` | already read in full for the original pre-registration; the published values are `booklet-tables.json` |
| GPS Block IIR and IIR-M antenna panel patterns | U.S. Coast Guard Navigation Center, GPS technical library; `fetch.sh`, SHA-256 `045329747a8b4b1cb44f2c430e5feaa6d5e9a3c2dda867b7dbb764c2f65b1c4e` | already fetched and extracted for S7 (20 L1 right-hand-circular panel patterns); nothing committed |
| A public statement of GLONASS's transmit main-beam half-angle | a public GLONASS interface or space-segment document, **not yet identified or read** | **owner or reviewer to identify and pin (title, edition, URL, SHA-256) before sign-off.** Without it, campaign A below is not run |
| Published high-altitude GNSS reception results | public mission papers on GNSS navigation above the GNSS constellations (high-orbit and geostationary missions) | **not yet located or read.** If located before sign-off, the values transcribed (with page numbers) become held-out cells for campaign D; if not, campaign D has no held-out cells and says so |

No source named "not yet identified" is assumed to say anything. If a source cannot be fetched or its value cannot be
transcribed exactly, the dependent campaign is dropped and the drop is recorded; it is never replaced by a fitted value.

## Rules for every campaign below

1. **One change per campaign, declared here.** Each campaign changes exactly the one thing it names and nothing else; the
   original configuration is the control and is re-run alongside it (it must reproduce `results-run1.json` cell for cell,
   which is itself checked first; a mismatch stops the campaign).
2. **No fitting to the booklet.** A parameter is set from the independent source named, or from the rule stated, before the
   campaign is run. A parameter chosen because it closes a miss is not allowed.
3. **Every cell is published**, passing or not, in a new `results-v2-*.json`, and pinned by a test that asserts the verdict
   including a miss. No `#[ignore]`.
4. **Tolerances are the original ones**: 2.0 percentage points for S1 to S3 (MOD within max(10 min, 25 %) where given),
   3.0 for S4, 5.0 for S5, 10.0 for S6, 3 dB RMS for S7. They may be tightened by the owner before sign-off, never
   loosened.
5. **A campaign that is met says what it shows and what it does not**: this implementation reproduces the stated method of
   the booklet under that reading. The booklet is a simulation; no row becomes VALIDATED from it (see the verdict rule).

## Campaigns

### A. The GLONASS reference angles, from an independent source (re-test of S1, S2, S3, S4, S5)

- **Data.** The booklet tables as in the original run; the independent public statement of GLONASS's main-beam half-angle
  named above.
- **Method.** Run the original configuration with GLONASS's two reference angles set to the values the independent source
  gives for the L1 and L5 signals, translated to the booklet's definition (angle off the nadir boresight to the edge of
  the main beam). If the source states one angle for both bands, both use it. If the source's values equal neither pair in
  the booklet, they are used as given: the campaign tests the source, not either table. The choice is made by reading the
  source, before the run.
- **Bars.** A1 to A5 are S1 to S5 over the same cells with the same tolerances. A bar passes only if every cell is within
  tolerance.
- **Reported, not a bar.** Which of the booklet's two pairs, if either, the source agrees with.

### B. One interpretation choice at a time (diagnosis of the S3 and S5 cells left over)

Each ablation below changes one of the choices the booklet leaves open, is run once, and is reported with every cell. They are
declared now so that the set cannot grow after the numbers are seen. All are run on top of campaign A's angles if A
runs, otherwise on the run-1 configuration.

| Ablation | The one change | Cells it is read on |
|---|---|---|
| B1 grid | a different equal-area user grid with 2,562 points (a spiral point set), instead of the subdivided icosahedron | the worst-case MOD cells and the leftover S3 cells |
| B2 epoch step | 30-second instead of 1-minute epochs | the same |
| B3 antenna pick | the booklet's rule for mission antennas (the antenna with the most tracked satellites) instead of the higher gain per satellite | S4 and S5 |
| B4 trajectory | HEO and lunar users on a propagated trajectory (the engine's force-model propagator with Earth gravity to degree and order 8 and the Sun and Moon as third bodies) instead of two-body ellipses | S5 and S6 |
| B5 user antenna gain | the booklet's hemispherical user antenna as a cosine-law gain falloff to the horizon instead of a flat 0 dBi hemisphere | S3 and S1 |

- **Bars.** None. These are a sensitivity table: for each ablation, how many of the previously missed cells fall within
  tolerance. A summary line states, for each leftover cell, which ablations (if any) bring it within tolerance. The table is an
  explanation. It does not change any verdict, and a combination of ablations is not run.

### C. The transmit pattern, tested on data it was not fitted to (new bar S7b; S7 stays NOT MET)

- **Data.** The 20 L1 right-hand-circular panel patterns of the Block IIR and IIR-M workbooks, split by block, fixed now:
  the Block IIR patterns are the **training set**, the Block IIR-M patterns the **test set** (the assignment is the workbook's own
  block label; if a workbook does not state it, campaign C is not run).
- **Method.** A two-parameter parametric shape: the power falls from the boresight at a constant **roll-off in dB per degree**
  and stops at a **floor in dB** below the peak. The two numbers are fitted by least squares to the training curves
  (each normalised to its own peak) over theta = 0 to 30 degrees, and written down before the test set is evaluated.
- **Bar S7b.** For every test pattern, the RMS difference between the fitted parametric curve and the test pattern
  (each normalised to its own peak), evaluated at theta = 0, 2, ..., 30 degrees, is at most **3 dB**. Reported as well: the
  training RMS, the fitted numbers, the median and range over the test set.
- **Not claimed.** That the fitted shape holds for any other satellite generation or constellation, or for the panels' phase.

### D. Held-out published reception cells (new, only if data exists at sign-off)

- **Data.** Published availability or tracking results from real high-altitude missions that are not in the booklet, if and
  only if the sources named above are located and their values transcribed exactly before sign-off. Each transcribed cell
  states the source, the page, the user orbit, the signal and the threshold the source uses.
- **Method.** Run the engine for that user orbit with the campaign A configuration.
- **Bar.** Within **10.0 percentage points** of the published value (the loosest of the original tolerances: real
  receivers, real attitude and real trajectories are outside the model), for every transcribed cell. If the source reports
  a quantity the engine does not compute, the cell is not scored and the reason is listed.
- **Not claimed.** A real receiver's sensitivity, tracking loop or hardware is not modelled; a MET here says the model is
  not contradicted by those published figures, not that it predicts them.

## Implementation, after sign-off and before the first run

The scored runs need these additions to `examples/ssv_booklet_check.rs` and the `gnss-ssv` code; none exists now, and each
is written with a test first: switches for the GLONASS angles by value (A), the five ablations (B), the table-pattern route
fed with the training-set fit (C), and a reader for the transcribed held-out cells (D). The control run (rule 1) is a
test, run in the release-profile CI job like the original comparison.

## Verdict rule

- Each campaign reports on its own. A met bar means "agrees with the cited public value under the stated configuration".
- **No row becomes VALIDATED from this campaign** on its own: the booklet is a simulation, so even agreement in every cell
  is agreement with another model's computation of the same method. Only an independent public measurement can support
  VALIDATED, and then only for the sub-claim it covers; whether any held-out cell from campaign D does is the owner's
  decision, recorded in the commit that changes a ledger row, with the oracle text stating exactly what was compared.
- The ledger row stays MODELLED unless the owner decides otherwise in writing.

## Sign-off

| | |
|---|---|
| Owner sign-off | **not given** |
| Sources identified and pinned (campaign A, D) | **not done** |
| Date of sign-off | |

Nothing is run, and no code for these campaigns is written, until this table is filled in by the owner.
