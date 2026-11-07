<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R5.1: spoofing detection on every usable public dataset, scored by ROC

**Status: proposed, committed before any new dataset is opened and before any detector is tuned for
this item.** The bars below become binding when the owner signs them. They may be tightened after a
run, never loosened. A miss is recorded in `RESULTS.md` with its numbers, per dataset, and pinned by a
test that asserts the miss. Advisory software, not type-approved navigation equipment. Receive and
analysis only: no spoofing or jamming waveform is generated or written (`docs/HARDWARE-SAFETY.md`).

## Why this row

The spoofing-detection row (`VM-ab66f655`) is MODELLED. Its external comparisons on JammerTest 2024
are recorded misses: the observable-level monitors alarmed late or raised pre-onset false alarms. R5.1
scores Kshana's detectors on every public dataset that is usable by the rule below, with receiver
operating characteristic (ROC) bars, and publishes the result for each dataset, met or missed.

## Which datasets (rule fixed now)

A dataset is **usable** when all of these hold:

1. Its licence is stated by its publisher and allows use for evaluation (redistribution is not needed:
   data is fetched by script with SHA-256 hashes recorded, never vendored).
2. It holds receiver observables (RINEX, receiver binary or NMEA) or IQ samples that Kshana reads.
3. It labels when spoofing is present: onset and end times at a resolution of 10 s or better, or a
   per-recording clean or spoofed label.
4. It has never been opened by Kshana before this pre-registration (for VALIDATED). Sessions opened
   before are scored and reported but count only as **seen**, not held out.

Candidates found while writing this, with the licence state found (data not opened):

| Dataset | Licence found | State |
|---|---|---|
| JammerTest 2024 (Zenodo 15911589) | GPL-3.0-or-later | usable; the sessions used in earlier rounds count as seen, any others as held out |
| TEXBAT (University of Texas at Austin) | none found | **not assessable** until the publisher's terms are found |
| Raw IQ GNSS data with and without spoofing (Tampere University, Zenodo, 2024) | CC BY 4.0 | candidate; checked against rules 2 and 3 at fetch (only 1 000-sample subsets are public) |
| Tampere University GNSS spoofing recordings (Zenodo, 2025) | not yet confirmed | candidate; rule 1 checked at fetch |

The list is completed at sign-off by a search of Zenodo, institutional repositories and the
literature for "GNSS spoofing dataset"; every dataset found is listed with its state, and none is
dropped after its data is read.

## What is scored (fixed now)

- **Detectors:** the shipped monitors as they are at sign-off (clock-aided χ², RAIM, AGC and C/N0,
  SQM where IQ is available, the fused security FoM), with their shipped thresholds. No monitor is
  retuned on a held-out session.
- **Unit:** 1 s windows. A window is positive when the label says spoofing is present in all of it,
  negative when it says clean for all of it, and excluded otherwise (the transition windows).
- **ROC:** per dataset and detector, the maximum of the detector's own statistic in each window,
  swept over thresholds; area under the curve (AUC) with a 95 % bootstrap interval over recordings.
- **Time to alarm:** from each labelled onset to the first alarm at the shipped threshold.

## Bars (proposed), per usable dataset, on held-out data

- **B1** Fused FoM AUC ≥ 0.90, with the lower end of its 95 % interval ≥ 0.80.
- **B2** At the shipped threshold, detection probability ≥ 0.80 at a false-alarm probability ≤ 0.01
  per window.
- **B3** Where onsets are labelled to 1 s or better: median time to alarm ≤ 10 s, and no onset missed
  for more than 60 s.

The row becomes VALIDATED only if B1 to B3 are met on at least two usable datasets with held-out data,
and every other usable dataset's result is published. A dataset that misses is published with its
numbers, and the row stays MODELLED for it. Datasets that are not assessable are listed with the
reason.
