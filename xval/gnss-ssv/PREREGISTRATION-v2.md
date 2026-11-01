# Pre-registration v2 for the `gnss-ssv` bars not met (0.40 WS-D): signed off 24 October 2026

**Status: signed off by the owner on 24 October 2026, before any run.** The owner's answer, as relayed, verbatim: "Sign off, weak
parts exploratory (Recommended)". The option chosen reads: "Run them as drafted. Campaigns relying on illustrative priors, or on a
source not pinned before the run, are labelled EXPLORATORY and can't close the original bars. Any campaign whose source isn't pinned
simply doesn't run. The original misses stay NOT MET." Nothing had been run or computed when this was signed. No bar below changes after
this commit; a later change is a new pre-registration. A campaign that passes is reported as its own bar, never as an original one.

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
| GLONASS's reference off-boresight angle, from the satellite manufacturer | "GLONASS space service volume", a presentation to the ICG's Working Group B (ninth meeting, Prague, November 2014) by the manufacturer of the GLONASS satellites; `https://www.unoosa.org/pdf/icg/2014/wg/wgb04.pdf`, SHA-256 `85456b0604af5d399534104e512d1ba0523af07d9b56e280e48a8c1651454305` (2,535,997 bytes) | **pinned in the sign-off commit.** Its table of minimum received civilian signal power gives the reference off-boresight angle as **14 to 20 degrees for L1 and 14 to 28 degrees for L3** (L2: 14 to 28). See campaign A |
| Published high-altitude GNSS reception results | public mission papers on GNSS navigation above the GNSS constellations | **not located, not pinned.** Campaign D is therefore **not run: source not pinned** |

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

### A. The GLONASS reference angles, from an independent source (re-test of S1, S2, S3, S4, S5): EXPLORATORY

**Label: EXPLORATORY** (it cannot close an original bar): the pinned source gives ranges, not one angle, and the rule below for turning a
range into a value was fixed at sign-off after the source had been read.

- **Data.** The booklet tables as in the original run; the pinned manufacturer presentation above.
- **What the source says, recorded before any run.** L1: 14 to 20 degrees; L3 (the booklet's L5 row for GLONASS): 14 to 28 degrees. The
  booklet's tables B2 and B6 give 20 and 28 degrees, the upper end of each range; table 4.2 gives 26 and 34 degrees, which lie **outside**
  the source's ranges (26 > 20 and 34 > 28).
- **Method.** GLONASS's two reference angles are set to the **upper end of the source's range** for each band (20 degrees for L1, 28 for
  L5/L3), the value at which the table guarantees the minimum power, matching the booklet's own definition of the reference angle as the
  edge of the guaranteed main beam. This rule was chosen at sign-off, after the source had been read and after it was seen that the upper
  ends equal tables B2 and B6; **that is why the campaign is EXPLORATORY.** The configuration is therefore identical to run 1's, so the
  control run of rule 1 *is* this campaign's result and it is not run twice; the lower end of the range (14 degrees) is not used (a
  guaranteed-power table does not apply at a smaller angle than the edge).
- **Bars.** A1 to A5 are S1 to S5 over the same cells with the same tolerances, scored on the control run.
- **Reported, not a bar.** That the independent source supports the pre-registered reading (tables B2 and B6) and is inconsistent with
  table 4.2's 26 and 34 degrees, which the diagnostic variant of addendum 4 used.

### B. One interpretation choice at a time (diagnosis of the S3 and S5 cells left over): EXPLORATORY

**Label: EXPLORATORY.** It is a sensitivity table with no bar, so it cannot close any bar; every ablation is an alternative reading the
booklet leaves open, not a measurement. Each is declared now, run once, and reported with every cell. All are run on the run-1
configuration (campaign A leaves it unchanged).

| Ablation | The one change, as fixed at sign-off | Cells it is read on |
|---|---|---|
| B1 grid | a Fibonacci spiral set of 2,562 points on the sphere (golden-angle spacing) instead of the subdivided icosahedron | the worst-case MOD cells and the leftover S3 cells |
| B2 epoch step | 30-second instead of 1-minute epochs (40,321 epochs) | the same |
| B3 antenna pick | for the mission cases, at each epoch the antenna that tracks the most satellites (ties: the nadir antenna) instead of the higher gain per satellite | S4 and S5 |
| B4 trajectory | the HEO and lunar users on a propagated trajectory: two-body plus the Earth's J2 and the Sun and Moon as point masses, by the integrator the `ssv` navigation mode already uses for its truth, instead of the two-body ellipse. (The draft named Earth gravity to degree and order 8; the available integrator carries J2 only, so J2 it is; stated before any run) | S5 and S6 |
| B5 user antenna gain | the hemispherical user antenna's gain as 10 log10(cos theta) dBi from the boresight, floored at -20 dBi, instead of 0 dBi over the hemisphere | S3 and S1 |

- **Bars.** None. For each ablation: how many of the previously missed cells fall within tolerance; a summary line for each leftover cell
  naming which ablations, if any, bring it within tolerance. It does not change any verdict, and a combination of ablations is not run.

### C. The transmit pattern, tested on data it was not fitted to (new bar S7b; S7 stays NOT MET)

- **Data.** The 20 L1 right-hand-circular panel patterns of the Block IIR and IIR-M workbooks, split by block, fixed now:
  the Block IIR patterns are the **training set**, the Block IIR-M patterns the **test set** (the assignment is the NAVCEN document's own table of satellite types: "Classic IIR SV" against "IIR-M SV").
  By that table, the training set is the twelve Classic IIR satellites SVN 41, 43, 44, 45, 46, 47, 51, 54, 56, 59, 60 and 61, and the
  test set the eight IIR-M satellites SVN 48, 49, 50, 52, 53, 55, 57 and 58 (the document also marks four of the Classic IIR panels as
  "improved"; the split is by satellite type as registered, and the panel type is reported, not scored).
- **Method.** A two-parameter parametric shape: the power falls from the boresight at a constant **roll-off in dB per degree**
  and stops at a **floor in dB** below the peak. The two numbers are fitted by least squares to the training curves
  (each normalised to its own peak) over theta = 0 to 30 degrees, and written down before the test set is evaluated.
- **Bar S7b.** For every test pattern, the RMS difference between the fitted parametric curve and the test pattern
  (each normalised to its own peak), evaluated at theta = 0, 2, ..., 30 degrees, is at most **3 dB**. Reported as well: the
  training RMS, the fitted numbers, the median and range over the test set.
- **Not claimed.** That the fitted shape holds for any other satellite generation or constellation, or for the panels' phase.

### D. Held-out published reception cells: not run: source not pinned

No published high-altitude reception source was located and pinned before sign-off, so by the owner's rule this campaign **does not run**.
It is recorded as "not run: source not pinned". It may be re-proposed in a new pre-registration with a pinned source.

## Implementation, after sign-off and before the first run

The scored runs need these additions to `examples/ssv_booklet_check.rs` and the `gnss-ssv` code; none exists now, and each
is written with a test first: the five ablations (B) and the S7b fit and evaluation (C). Campaign A needs no new code (its configuration is
the control's), and D is not run. The control run (rule 1) is a test, run in the release-profile CI job like the original comparison.

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
| Owner sign-off | **given, 24 October 2026**, quote and option above |
| Sources pinned | campaign A: the manufacturer presentation (URL and SHA-256 in the data table); campaign C: the NAVCEN zip already pinned by `fetch.sh`, with the block of each panel taken from the document in that zip that lists each satellite's type |
| Campaign D | **not run: source not pinned** |
| EXPLORATORY | A (range read at sign-off), B (sensitivity, no bar, alternative readings) |
| Not exploratory | C (public data, pinned; the split is the document's own labelling of satellites as Classic IIR or IIR-M) |
| Date of sign-off | 24 October 2026 |

The scored runs are made on the commit that follows this one. Results go to `RESULTS-v2.md`; the recorded results and their tests are untouched.
