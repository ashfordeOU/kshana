<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R1.4: ocean tide loading (BLQ) and the solid Earth tide in PPP

**Status: proposed, committed before any engine code and before any data below is read.** The bars
become binding when the owner signs them. They may be tightened after a run, never loosened. A miss is
recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the miss. Data is fetched by
script with its SHA-256 recorded in `RESULTS.md`, never vendored, unless stated. Advisory software, not
type-approved navigation equipment.

## Why this row

Kshana's PPP applies a solid Earth tide displacement (`ppp_real::solid_tide_ecef`) and leaves out
ocean tide loading. R1.4 adds site displacement from ocean tide loading coefficients in the BLQ
format, computed as the IERS Conventions (2010) chapter 7 describes, and checks both displacements
against the IERS reference software's published test cases.

## Sources and licences (checked before this pre-registration)

- **IERS Conventions software** (HARDISP, DEHANTTIDEINEL; iers-conventions.obspm.fr, chapter 7). Its
  licence lets anyone use it for any purpose free of charge; a modified routine must be renamed and
  not presented as IERS software, and the notice kept. **Kshana implements from the Conventions text
  and does not port the routines.** The test cases printed in the routines' headers are used as
  oracle values. While checking the licence, the expected output of the DEHANTTIDEINEL test case was
  seen; it is used as printed, with the bar below.
- **Ocean loading coefficients:** the Onsala ocean loading provider asks for a citation and gives no
  licence: **not assessable as a source of committed coefficients.** Kshana reads a BLQ file the user
  supplies. The tests use the BLQ coefficients printed in HARDISP's own test case.
- **PPP data:** IGS observations, orbits and clocks and IGS weekly coordinates (IGS terms of use, open
  with attribution).

## Bars (proposed)

- **B1 Solid Earth tide.** The DEHANTTIDEINEL test case (station, Sun and Moon positions and epoch as
  printed) is reproduced within 1e-9 m per component.
- **B2 Ocean loading.** The HARDISP test case (its BLQ coefficients, start epoch and step, as printed in
  the current version, changed 19 June 2015) is reproduced within 1e-6 m per component and epoch (the
  printed precision).
- **B3 PPP.** On five coastal IGS stations chosen by the R3.3 hold-out rule among stations within
  50 km of the coast, with BLQ coefficients the operator supplies, 24 h static PPP for 1–7 May 2025 with
  ocean loading applied gives a median up error no larger than without it. Reported, and a bar only if
  coefficients with a clear licence exist for those stations; otherwise not assessable.

VALIDATED (for the displacement models) only if B1 and B2 are met. B3 is reported. A miss is published.
