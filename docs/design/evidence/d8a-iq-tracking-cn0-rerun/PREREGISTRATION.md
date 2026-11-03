<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D8a (0.41): IQ-layer tracking and C/N0 rows, re-campaign

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.** Every bar named here is an existing bar and is not changed. Nothing here adds a bar except
where marked *proposed*.

## Why this row

Six IQ-layer ledger rows carry a NOT MET bar on tracking or C/N0. Each stays MODELLED and pinned. Roadmap item D8a
re-runs them after a stated change, under their original bars. Item D8b
([`../d8b-iq-timing-campaign-rerun/PREREGISTRATION.md`](../d8b-iq-timing-campaign-rerun/PREREGISTRATION.md)) does the same
for the timing and campaign rows.

## Rules for every row below

1. **Original bars stand.** The bar text, the thresholds and the verdict rule are those of the original registration.
2. **One named change per row**, written in the implementing commit before any re-run, with its reason. A row with no
   change in 0.41 is not re-run (re-running unchanged deterministic code repeats the recorded miss).
3. **Control first.** The original configuration on the original inputs, with the change switched off, must reproduce
   the recorded numbers. A mismatch stops that row.
4. **Original and fresh inputs.** The changed code is scored on the original inputs (seen) **and** on fresh inputs fixed
   in this file. For seeded synthetic data the fresh seeds are the original seeds plus **100 000**; no fresh seed has
   been run by anyone. A row is recorded as met on re-run only if its bars hold on both.
5. **No regressions.** Every other bar of the same registration is re-run and must still hold.
6. A miss is published with its numbers and pinned. No bar is loosened.

## The rows

### 1. `VM-77d4bf93`: IQ tracking engine against GNSS-SDR 0.0.19

- Registration: `tests/fixtures/iq_track_gnss_sdr_oracle/PREREGISTRATION.md` (amended before any test recording).
- Missed: **B4** C/N0, `abs(mean NWPR_engine - mean SNV_GNSS-SDR) <= 1.0 dB` (2.3 to 7.1 dB below); **B5** PLI within 0.05
  (the two indicators are defined differently); **B6** lock agreement on every recording (GNSS-SDR slipped twice at
  30 dB-Hz, the engine did not).
- Change (*proposed*): the engine's code lock and summary use the M2M4 estimator (recorded within 0.06 dB of truth) in
  place of NWPR. B4 compares "the estimator the engine's code lock and summary use", as written, so the comparison
  follows the change. B5: no change proposed (the definitions differ; adopting GNSS-SDR's definition only to pass would
  test nothing). B6: no change (the slips are the oracle's).
- Inputs: the original numpy recordings and fresh recordings with seeds plus 100 000; GNSS-SDR 0.0.19 unchanged.
- Expected, stated now: B5 and B6 stay NOT MET; the row stays MODELLED unless all of B1 to B6 hold.

### 2. `VM-56e6f4f4`: Cornell scintillation channel against measured 50 Hz GPS L1 data

- Registration: `xval/scint-malindi/PREREGISTRATION.md`.
- Missed: **B1** deep-fade probability ratio (model / measured) in [0.5, 2]: 2.38; **B4** mean fade duration ratio in
  [2/3, 3/2]: 3.51. Finding F2 (wrapped phase in the registered processing) is a harness fix.
- Change: one change to the fade-generating part of the model (named in the commit) and the F2 phase-unwrapping fix in
  the processing.
- Inputs: the original Zenodo record 16941224 (seen) **and a held-out public 50 Hz record of a different night or
  satellite**, pinned at sign-off by DOI, URL and checksum. Because the model change is made after seeing the original
  record, the row is recorded as met on re-run only if N1 and B1 to B4 hold on the held-out record too. If no held-out
  record is pinned at sign-off, the row is not re-run.

### 3. `VM-f5e2ce4e`: cell-averaging CFAR in IQ acquisition

- Registration: `docs/design/evidence/acq-cfar/PREREGISTRATION.md`.
- Missed: **C4** on a noise-free 2-bit signal, the fraction of off-peak cells in the peak's row above the threshold
  (outside +/- 2 samples) is at most 1e-2: 1.28e-2, at the code's deterministic correlation sidelobes.
- Change: one change to the reference-cell set or guard cells (named in the commit). C1 to C3 and C5 are re-run, since a
  change to the detector touches them.
- Inputs: the registered C4 signal (PRN 1, +1250 Hz, 300.25 chips) and four fresh C4 signals fixed now: PRN 7 at
  -2500 Hz and 17.5 chips; PRN 13 at -750 Hz and 511.0 chips; PRN 22 at +500 Hz and 800.75 chips; PRN 31 at +3000 Hz
  and 1000.25 chips; all noise-free, 2-bit, 2.5 MS/s, M = 1, design Pfa 1e-3. C2 and C3 use the registered seeds plus
  100 000 as fresh noise.

### 4. `VM-bdfec2e4`: capped FLL pull-in below the hand-over floor

- Registration: `docs/design/evidence/fll-handover-floor/PREREGISTRATION.md`.
- Missed: **D2** hand-over and hold in every one of 40 runs (16 of 20 at 33 dB-Hz, 8 of 20 at 31 dB-Hz); **D3** phase
  jitter within 25 % of the PLL alone (10.8 against 6.1 degrees at 33 dB-Hz).
- Change: one change to the hand-over logic (named in the commit). D0, D1 and D4 are re-run.
- Inputs: the registered ten noise seeds and ten fresh seeds (plus 100 000), both hand-offs, 31 and 33 dB-Hz.

### 5. `VM-35b27a4f`: BOC(1,1) DLL scaling and bump-jump

- Registration: `docs/design/evidence/boc-bump-jump/PREREGISTRATION.md`.
- Missed: **B4**, all three scaled discriminators within 10 % of the offset on the registered grid; the grid includes
  offsets outside the discriminators' linear range (finding F1), where linear scaling cannot meet 10 %.
- Re-run only if 0.41 replaces the linear scaling with the exact inverse of each discriminator's ideal-peak response.
  Then B4 is re-run on the **registered grid unchanged** (it is a closed-form, noise-free test; there is no fresh input),
  and B1 to B3 and B5 are re-run as regressions on their registered seeds and on fresh seeds.
- If no such change is made, the row is not re-run and stays NOT MET with F1 as its explanation.

### 6. `VM-c9318c63`: lab-fit calibration of the receiver's C/N0 and lock models

- Registration: `docs/design/LABFIT-FROM-IQ.md` (section 5.1, amended in section 13) and the follow-up in
  `docs/design/evidence/labfit-followup/`.
- Missed: **(a')** effective-loss error within 0.5 dB (-1.097 dB); **(b')** interval coverage of the truth (0 of 50);
  **(d)** closed form against the direct J/S at loss (2.20 dB); the Q clauses of (a) and (b) (Q not identifiable);
  follow-up **S2** ((d) as written, empirical model 6.42 dB).
- Change (*proposed*): correct the C/N0 estimator lag that the follow-up's S1 identified on the stepped campaign, in the
  fit (not in the scorer). The Q clauses are **not** re-run: Q is not identifiable from these campaigns by construction,
  and they stay NOT MET.
- Inputs: the registered 18-event campaign and the 50 campaigns of (b'), and fresh campaigns with seeds plus 100 000 (the
  same counts).

## What a result would and would not mean

A row recorded as met on re-run says the named change makes the engine meet its original internal or external oracle on
seen and unseen inputs. Every row here except row 1 (GNSS-SDR) and row 2 (measured scintillation) is internal
consistency on synthetic signals, and stays MODELLED whatever happens. No result here speaks for field recordings.

## Owner decisions at sign-off

1. Which rows get a change in 0.41 (a row without one is not re-run).
2. Row 1: accept the M2M4 switch as the change (it alters the engine's reported C/N0 and lock behaviour).
3. Row 2: pin a held-out scintillation record, or leave row 2 out of 0.41.
4. The D8a / D8b split as drawn here (D8a: rows 1 to 6; D8b: the acquisition hysteresis, monitor timing and ROC rows).

## Sign-off (3 November 2026)

Signed as proposed, with the M2M4 C/N0 estimator as the named change where the file proposes it.
