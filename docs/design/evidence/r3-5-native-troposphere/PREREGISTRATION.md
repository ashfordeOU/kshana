<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R3.5: a native troposphere model, scored on held-out IGS zenith delays

**Status: proposed, committed before any engine code and before any data below is read.** The bars
become binding when the owner signs them. They may be tightened after a run, never loosened. A miss is
recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the miss. Data is fetched by
script with its SHA-256 recorded in `RESULTS.md`, never vendored, unless stated. Advisory software, not
type-approved navigation equipment.

## Why this row

R3.4 scores GPT3 and VMF3. R3.5 scores a native troposphere model the same way, on stations and months
R3.4 does not use. This pre-registration fixes only how the model is scored; it does not describe the
model's method.

## Truth and licences (checked before this pre-registration)

- **IGS final troposphere zenith path delay** (combined, SINEX_TRO, 5-minute), from an IGS data centre
  without a login. IGS terms of use (2020): open use with citation and attribution. Assessable.
- **EUREF Permanent Network troposphere** (hourly, SINEX_TRO): a secondary truth only if its licence
  (reported as CC BY 4.0) is confirmed from the network's own page at fetch time; otherwise not used.
- **Baseline scored the same way:** GPT3 (5°) with Saastamoinen and Askne–Nordius, as in R3.4.

## Held-out design (fixed now)

- **Periods:** 1–31 January 2025 and 1–31 July 2025 (not the R3.4 months).
- **Stations:** held out by the R3.3 rule (first byte of the SHA-256 of the uppercase four-character
  identifier below 0x4D). The model may use any data except the held-out stations' delays and anything
  published after the epoch it predicts.
- **Epochs:** 00, 06, 12 and 18 UTC each day.

## Bars (proposed), in each month, over held-out stations

- **B1** Median per-station ZTD RMS ≤ 3.5 cm.
- **B2** Median per-station ZTD RMS ≤ 0.80 × GPT3's in the same run.
- **B3** |Median per-station mean| ≤ 1.0 cm.

VALIDATED only if B1 to B3 are met in both months. Otherwise MODELLED, and the miss is published. For
scale: GPT3 has been reported at a bias of −1.0 cm and an RMS of 4.4 cm against about 16 000 stations
(Sensors 20:3631, 2020).
