<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B3a v2 (0.41.x): power-difference locator with session-level shadowing

**Status: PROPOSED, 8 November 2026. Waiting for the owner's sign-off. No code or data for v2 before it.**

## Why a v2

B3a v1 failed its own synthetic gate (`RESULTS.md`, `f6b4a3336`). The 95% region coverage was 0.976 (met). The
median region was 52.5% of the domain (bar ≤ 25%), and the median centroid error was 2.55 × the station spacing
(bar ≤ 0.5×).

The cause is the per-epoch independence of a shadowing that is fixed over a session.
- The likelihood counts the same 6 dB shadowing 30 times.
- Only τ = 1/60 restored coverage, and the regions then covered half the domain.

v1 stands as recorded, and the row stopped as its section 2 requires.

## What changes

1. **Shadowing modelled once per session.**
   - Each station's interference power is averaged over the session's reporting epochs, with σ = 2 dB measurement
     noise per epoch, so the mean has σ/√n.
   - The likelihood uses one shadowing term per station: `σ_tot² = σ_sh² + σ²/n`.
   - No tempering (τ = 1).
2. **Domain.** The convex hull buffered by 10 km, not 20 km. Sources outside are reported as outside the network,
   not located.
3. **Gate.** As in v1 (S1 to S4, with the same bars), on new seeds: development 3001 to 3200, gate 4001 to 5000.
   The generator is v1's, with sources drawn in the 10 km domain.

## Process

1. Sign-off.
2. Readings, then the code, then the gate run once.
3. Only a gate MET reopens the real run on Jammertest 2027.
