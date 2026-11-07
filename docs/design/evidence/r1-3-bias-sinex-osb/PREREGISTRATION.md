<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R1.3: observable-specific biases (Bias-SINEX) in PPP

**Status: proposed, committed before any engine code and before any data below is read.** The bars
become binding when the owner signs them. They may be tightened after a run, never loosened. A miss is
recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the miss. Data is fetched by
script with its SHA-256 recorded in `RESULTS.md`, never vendored, unless stated. Advisory software, not
type-approved navigation equipment.

## Why this row

Kshana's PPP uses ionosphere-free code and phase and lets the clocks absorb code biases. R1.3 reads
observable-specific biases (OSB) from Bias-SINEX files and applies them per signal, so that signals
other than those the clocks were made with (for example GPS C1C, Galileo E5a) can be used, and scores
PPP with them.

## Sources and licences (checked before this pre-registration)

- **OSB products:** the GFZ final product series (DataCite: CC BY 4.0), and the IGS MGEX and CAS bias
  files distributed by IGS data centres (BKG, anonymous; IGS terms of use, open with attribution). CODE
  and CAS files fetched from their own servers (acknowledgement requested, no licence found) are not
  used.
- **Truth coordinates:** IGS weekly combined SINEX station coordinates (IGS terms).
- **Orbits and clocks:** the GFZ final product series (CC BY 4.0), consistent with the GFZ OSBs.

## Design (fixed now)

- **Reader:** every `OSB` line of the files used is read; satellite and station biases, time spans and
  units as the format states. Lines of other bias types are counted and skipped.
- **PPP:** GPS and Galileo, static, 24 h, ionosphere-free from C1C/C2W (GPS) and C1C/C5Q (Galileo), with
  and without the OSBs.
- **Stations and days:** held out by the R3.3 rule among IGS stations that track GPS and Galileo; days
  1–7 May 2025.
- **Convergence:** the first epoch after which the 3D error stays below 10 cm.

## Bars (proposed), with OSBs, over held-out station-days

- **B1** Every OSB value read equals the file's printed value (exact decimal), on every file used.
- **B2** Median 24 h 3D error ≤ 3 cm against the IGS weekly coordinates.
- **B3** Median convergence time ≤ 30 min.
- **B4** Without OSBs, the same run is reported beside it (no bar).

VALIDATED only if B1 to B3 are met. Otherwise MODELLED, and the miss is published.
