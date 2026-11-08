<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D1: the Artemis I and CAPSTONE gaps: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). D1 has no bar of its own. It is done when both
registered re-runs have been made once and recorded, whatever their verdicts.

**D1 is done** (8 November 2026). Both runs were made once and recorded:

| Gap | Re-run | Verdict | Record |
|---|---|---|---|
| Artemis I cruise (C1) | C2, impulses modelled, on W1 (W2 "not run": the published burn times leave 42.8 h, not 72 h) | **NOT MET**: 17.3 km against 2 km; 0.0177 m/s against 0.01 m/s | `xval/mission-thread-c2/RESULTS.md` |
| CAPSTONE NRHO (A2) | C3, DE440 third bodies (M1), plus one estimated radiation-pressure parameter (M2) | C3-R **MET** (21.66 km, 4.24 km); C3-H **NOT MET** on E, H1, H2; C3-S **NOT MET** | `docs/design/evidence/c3-capstone-nrho-force-model/RESULTS.md` |

- **Neither original row is met.** C1 cannot be: C2 is a different question. A2 counts as met on re-run only if C3-R and
  C3-H both hold, and C3-H does not.
- **What the two re-runs found:**
  - CAPSTONE: replacing the analytic Sun and Earth with DE440 cut the 156 h end-position error 3.3 to 4.7 times on unseen
    windows, but not to 25 km.
  - Artemis I: four of the five steps in the Horizons reconstruction carry position jumps no velocity step within one
    hour can produce. An impulse model cannot follow them. This was visible in C1's diagnostic, and C2's bar derivation
    overlooked it.
- Further attempts on either gap are new pre-registrations.
