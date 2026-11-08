<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C2: the Artemis I cruise with impulsive steps modelled: results

Pre-registration: `docs/mission-thread/PREREGISTRATION-C2.md` (signed off 3 November 2026). Readings and corrections:
`README.md` in this folder. MODELLED. The JPL Horizons reconstruction is the reference, not truth. Advisory software,
not certified navigation equipment.

| Step | Commit |
|---|---|
| W2 named from NASA's published burn times: the rule leaves 42.8 h, so W2 is not run | `ca788abaa` |
| Impulse support, detector and propagation, synthetic tests only | `4d9c3ac62` |
| T fetched; five event hours and their impulses committed before H | `06d7a8c39`, `d8504e0de` (request form) |
| H count correction (72 states, not 71), after the fetch and before any comparison | `0c1baaead` |
| The comparison, once | `db68d1793` (`result.json`) |

The bars were not changed.

## Result (W1, 2022-11-16 18:00 to 2022-11-19 18:00 TDB; 72 held-out half-hour states)

| Bar | Result |
|---|---|
| C2a: largest 3-D position difference over H, at most 2 km | **NOT MET**: 17.3 km, at 58.5 h |
| C2b: velocity difference at the last H state, at most 0.01 m/s | **NOT MET**: 0.0177 m/s |

**C2 is NOT MET.** W2 is not run (see the README). C1 stays NOT MET whatever C2 gives, as C2 itself says.

## Diagnostic after the verdict (not part of it; `diagnostic.json`)

The propagation with the five impulses, against the hourly T states (already seen in step 3), beside the same propagation
without impulses:

- **The impulses fix the velocity.** With them the velocity difference stays at or below 0.018 m/s over the 72 h;
  without them it reaches 0.29 m/s.
- **They cannot fix the position.** The position difference jumps by 0.5 km, 3.3 km, 3.6 km and 9.3 km across the event
  hours 1, 23, 34 and 57, and stays flat between them.
- **Why.** In C1's stored diagnostic (`xval/mission-thread/results_diagnostic.json`), the one-hour position residual at
  those hours is 598 m, 3.6 km, 6.9 km and 13.1 km. The most any velocity step inside one hour can move the spacecraft
  is |Δv| × 3600 s: 327, 575, 340 and 541 m. So four of the five steps in the reference are not velocity steps of any
  timing. They look like position discontinuities in the reconstruction (for example joins between reconstructed
  segments). Hour 17 (347 m against 797 m) is consistent with an impulse.
- **This was in C1's diagnostic before C2 was registered.** The bar derivation in §6 considered only the velocity steps
  and their timing, and overlooked the position residuals already recorded there. This is stated here, not corrected.

## What this does and does not show

- It does not show that the force model is wrong. Between the event hours, C1's diagnostic reproduces the hours to a
  median of 0.38 m.
- It does show that a burn-free propagation plus impulses cannot follow this reconstruction to 2 km over 72 h, because
  the reconstruction itself has position steps.
- A further attempt would need a new pre-registration: for example, restarting at each step from the tabulated state,
  or scoring only the arcs between steps. Choosing either now, after this result, would be fitting the method to it.
- Results stay MODELLED.
