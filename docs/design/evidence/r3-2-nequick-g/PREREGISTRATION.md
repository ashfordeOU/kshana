<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R3.2: NeQuick-G, the Galileo single-frequency ionospheric correction, complete

**Status: proposed, committed before any engine code and before the oracle is run.** The bars below
become binding when the owner signs them; no NeQuick-G engine code is written and the reference
implementation is not run on the inputs below before that. Bars may be tightened after a run, never
loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the
miss. Advisory software, not type-approved navigation equipment.

## Why this row

Kshana reads the three NeQuick-G coefficients a Galileo navigation message broadcasts and computes the
effective ionisation level `Az` from them (checked against GNSSTk). It does not compute the
ionospheric delay: the electron-density profile, its modified-dip (MODIP) and monthly-map inputs, and
the slant total electron content (STEC) integrated along the ray. R3.2 adds the complete model, as the
European GNSS Open Service ionospheric correction algorithm description (version 1.2) specifies it,
and scores it against the reference implementation of that algorithm.

## Sources and licences (checked before this pre-registration)

- **Algorithm.** Implemented from the published algorithm description. No reference-implementation
  code is copied or ported line by line.
- **Oracle: the reference C implementation (the JRC "NeQuick G" library and test driver).** Released
  as free and open source software under the European Union Public Licence 1.2 (EUPL-1.2), as the
  European GNSS agency states. The official download needs a registered account on the GNSS service
  centre site. A public re-host on GitHub (repository `NeQuickJRC`, EUPL-1.2 header, branch `master`
  at commit `02701f280fcfd1c7909a1d1bbc348bc55c625832`) carries the same library with small changes so
  that it builds as ANSI C. The oracle is built from that commit and run as a separate program by a
  script in `xval/nequick-g/`; none of its code is vendored. If the owner obtains the official release,
  the script runs both, and any difference between them is reported.
- **Model data: the CCIR monthly F2 and M(3000)F2 coefficient maps and the MODIP grid.** They ship
  with the reference code, without a licence header of their own, and come from the original NeQuick
  distribution. **Their licence is treated as unclear.** They are not vendored. The engine reads them
  from a directory the user names; the tests fetch them from the commit above and check each file's
  SHA-256 (recorded in `RESULTS.md` at first fetch), and skip with a stated reason when they are absent.
  Vendoring them is a separate decision for the owner.
- **Oracle outputs.** The numbers the oracle prints for the inputs below are committed as the expected
  values (`tests/fixtures/nequick_g/`), with the script that made them.

## The inputs (fixed now)

- **Coefficient sets** `(ai0, ai1, ai2)`: S1 `(80, 0, 0)`, S2 `(150, 0, 0)`, S3 `(230, 0, 0)`,
  S4 `(120, 0.5, 0.002)`, S5 `(0, 0, 0)` (the all-zero rule).
- **Times:** months 1, 4, 7 and 10; universal time 0, 6, 12 and 18 h (16 cases).
- **Receivers** (latitude °, longitude °, ellipsoidal height m): (0, 0, 0), (40.4, −3.7, 650),
  (60.2, 24.9, 30), (78.2, 15.6, 50), (−33.9, 18.4, 10), (−77.8, 166.7, 50), (19.8, −155.5, 4 200),
  (35.7, 139.7, 40), (−12.0, −77.0, 100), (28.6, 77.2, 220).
- **Rays:** from each receiver, elevations 5, 10, 20, 30, 45, 60 and 75° at azimuths 0, 45, …, 315°,
  and the zenith (57 rays). The satellite is the point at 20 200 km ellipsoidal height along the ray.
  All sets, times, receivers and rays: 5 × 16 × 10 × 57 = 45 600 rays.
- **MODIP points:** latitudes −87.63 to 87.37 every 7° and longitudes −179.63 to 175.37 every 5°
  (26 × 72 = 1 872 points, none on a grid node).
- **Electron-density points:** latitudes −80 to 80 every 20°, longitudes 0 to 330 every 30°, heights
  100, 150, 200, 300, 500, 1 000 and 2 000 km (756 points), for S2 and S4, month 4, 12 h UT.

## Bars (proposed)

- **B1 MODIP.** At every MODIP point, `|MODIP − oracle| ≤ 1e-6°`.
- **B2 Az.** For every set and MODIP point, `|Az − oracle| ≤ 1e-9` solar flux units, including the
  all-zero and [0, 400] rules.
- **B3 Electron density.** At every density point, `|N − oracle| ≤ 1e-6 · |oracle|` or, where the
  oracle is below 1e6 electrons/m³, `|N − oracle| ≤ 1` electron/m³.
- **B4 STEC.** (a) On every ray, `|STEC − oracle| ≤ 0.01 TECU` and `≤ 1e-4` of the oracle value;
  (b) on at least 99 % of rays, `|STEC − oracle| ≤ 1e-3 TECU`.
- **B5 The reference test suite.** Where the reference distribution's own benchmark files (inputs and
  expected STEC) are present at the commit above, every case meets B4(a). If they are absent, B5 is
  reported as not assessable and does not block.

The row becomes VALIDATED only if B1 to B4 are met (and B5 where assessable). Otherwise it stays
MODELLED, and the miss is published. The oracle is a reference implementation of the same algorithm
description: this checks the implementation, not the model's accuracy against measured ionospheric
delay, which is not claimed here.
