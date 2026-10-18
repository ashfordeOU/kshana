<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: ICAO Doc 9849 Appendix F pack

Committed before any scored run of `kshana standards-pack run icao-doc9849-appf`. The bars
are in `pack.toml`; they may not change after the first scored run, and a miss is recorded
as NOT MET and pinned by a test.

Source limit: Doc 9849 is a paid ICAO publication and was not read. The pack follows the
three-step plan (monitor threats, assess risks, deploy mitigation) as ICAO's own GNSS RFI
Mitigation Plan presentation describes it, cites no Appendix F clause number, and makes no
claim about the checklists.

| Test | Scenario | Bar |
|---|---|---|
| MON-1, REPORT-1 | none | need a receiver log or aggregated reports (not scored) |
| ASSESS-1 | `assess-jammer-1km` | availability under jamming <= 0.05 |
| ASSESS-2 | `assess-jammer-10km` | <= 0.05 |
| ASSESS-3 | `assess-jammer-100km` | >= 0.95 |
| MIT-1 | `mitigate-spoof-detect` | fused detector alerts |
| MIT-2 | `mitigate-combined-altpnt` | combined error <= free inertial |
| MIT-3 | `mitigate-clock-holdover` | quantum clock timing p95 <= threshold_ns |

Every result is MODELLED.
