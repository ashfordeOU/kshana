<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: IMO MSC.1/Circ.1575 integrity pack

Committed before any scored run of `kshana standards-pack run imo-circ-1575`. The bars are
in `pack.toml`. They may not change after the first scored run; a miss is recorded as NOT
MET and pinned by a test.

Source values: Table C-1 of the circular gives the operational horizontal accuracy levels A
(100 m), B (10 m), C (1 m), D (0.1 m) and the vertical levels A 10 m, B 5 m, each at 95 %
confidence. Levels C and D are not tested here: they are far outside what a code-based GNSS
protection level can meet and the pack makes no claim about them.

| Test | Scenario | Bar |
|---|---|---|
| ACC-A | `accuracy-a-open-water` (HAL 100 m, VAL 10 m) | epochs available / total >= 0.95 |
| ACC-B | `accuracy-b-open-water` (HAL 10 m, VAL 5 m) | >= 0.95 |
| ACC-B-MULTI | `accuracy-b-multi-system` (GPS + Galileo ARAIM) | >= 0.95 |
| ACC-B-HARBOUR | `accuracy-b-harbour` (skyline) | >= 0.95 |
| INT-CONSIST | `integrity-consistency-spoof` | RAIM parity layer alerts |
| STATUS-1, INPUT-1 | none | need a receiver log or interface evidence (not scored) |

Every result is MODELLED. A MET bar says a modelled sky and ranging error met a stated limit,
not that any receiver meets a level.
