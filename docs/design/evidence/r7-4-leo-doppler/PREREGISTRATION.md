<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R7.4: positioning from LEO satellite Doppler

**Status: proposed, committed before any engine code and before any data below is read.** The bars
become binding when the owner signs them. They may be tightened after a run, never loosened. A miss is
recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the miss. Data is fetched by
script with its SHA-256 recorded in `RESULTS.md`, never vendored, unless stated. Advisory software, not
type-approved navigation equipment.

## Why this row

Kshana computes Doppler from LEO satellites (`leo_fusion`, `leo_link`) in simulation. R7.4 is
Doppler positioning from LEO signals of opportunity (for example Starlink, Iridium, Orbcomm).

## Data and licences (checked before this pre-registration)

- **No public dataset of LEO Doppler measurements with ground truth and a stated licence was found.**
  Published results (for example about 10 m horizontal from six Starlink satellites) come with no
  released data. **Real-data bars are therefore not assessable**, and this row cannot become VALIDATED
  until such a dataset exists; it is then pre-registered on its own.
- **Orbits:** Space-Track general perturbations data (registration; the user agreement gives blanket
  approval to redistribute basic space-situational-awareness data). CelesTrak's terms were not found:
  not used as an oracle.

## What is fixed now (simulation, internal checks only; MODELLED)

- **Scenario:** a static receiver at (60.2°, 24.9°, 30 m); 600 s; Doppler from every satellite of a
  stated Walker shell (550 km, 53°, 22 planes of 22) above 15°; measurement noise 1 Hz (1σ) at 11.325
  GHz; orbit error 0 (B1) and 50 m (1σ, along-track) (B2).
- **B1** Over 1 000 seeded runs, the RMS of each position component is within 10 % of the square root
  of the Cramér–Rao bound computed from the same geometry and noise.
- **B2** With orbit error, the estimate's mean error is reported against the bound (no bar).
- **B3** Doppler predicted from the orbit equals the closed-form range rate times frequency over
  wavelength within 1e-9 relative.

These are internal checks: the row stays MODELLED whatever their outcome.
