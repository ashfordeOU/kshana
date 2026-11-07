<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R3.3: a native ionosphere model, scored on held-out station TEC

**Status: proposed, committed before any engine code and before any data below is read.** The bars
become binding when the owner signs them. They may be tightened after a run, never loosened. A miss is
recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the miss. Data is fetched by
script with its SHA-256 recorded in `RESULTS.md`, never vendored, unless stated. Advisory software, not
type-approved navigation equipment.

## Why this row

Kshana reads IGS global ionosphere maps (`src/ionex.rs`) and computes the broadcast Klobuchar delay.
R3.3 scores a native ionosphere model against held-out station data, beside those two. This
pre-registration fixes only how the model is scored. It does not describe the model's method, and
nothing here depends on it: any model that predicts slant TEC for a station, satellite and epoch can be
scored.

## Truth and licences (checked before this pre-registration)

- **Station observations:** IGS RINEX 3 observation files, 30 s, fetched from an IGS global data
  centre without a login (BKG or IGN). IGS terms of use (2020): open for scientific, educational and
  commercial use, with citation and attribution. Assessable.
- **Truth quantity:** dSTEC, the change of slant TEC along each continuous carrier-phase arc relative to
  its highest-elevation epoch, from the geometry-free combination of dual-frequency GPS phase (L1/L2).
  It needs no ambiguity and no code bias (the method of Roma-Dollase et al. 2018, J. Geod. 92).
- **Baselines scored the same way:** the IGS final GIM (IONEX, from the same data centres, IGS terms),
  and the broadcast Klobuchar model.
- **Not assessable:** Madrigal TEC (acknowledgement requirement only, no licence found); CODE maps
  fetched directly from AIUB (acknowledgement only); they are not used.

## Held-out design (fixed now)

- **Periods:** 1–7 March 2025 and 1–7 September 2025.
- **Stations:** every IGS station with dual-frequency GPS 30 s RINEX 3 files for all seven days of a
  period; a station is **held out** when the first byte of the SHA-256 of its uppercase four-character
  identifier is below 0x4D (about 30 %). The model may use any data except the held-out stations'
  observations and anything published after the epoch it predicts.
- **Arcs:** at least 30 minutes long and above 10° elevation; cycle slips split arcs (geometry-free and
  Melbourne–Wübbena jumps above stated thresholds, fixed in the script before the run).

## Bars (proposed), in each period, over held-out stations

- **B1** Median per-station dSTEC RMS of the model ≤ 1.10 × that of the IGS final GIM.
- **B2** Median per-station dSTEC RMS of the model ≤ 0.60 × that of Klobuchar.
- **B3** No held-out station is dropped after its data is read; a station whose files fail to read is
  listed as not scored with the reason.

VALIDATED only if B1 to B3 are met in both periods. Otherwise MODELLED, and the miss is published with
the per-station numbers.
