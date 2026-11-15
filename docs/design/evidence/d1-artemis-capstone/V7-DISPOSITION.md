<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# V7 (0.42): what happens to the C2 and C3 rows

Written 15 November 2026. Roadmap row V7 asks that the two follow-up rows of D1, C2 (the Artemis I cruise with the
impulsive steps modelled) and C3 (the CAPSTONE NRHO with a corrected force model), be re-scoped or closed, each with a
written reason, so neither is dropped silently. This file is that record. It changes no verdict, no bar and no number;
every result below is already committed and stays published. Advisory software, not navigation equipment. Public
sources only.

## C2, the Artemis I cruise: CLOSED (not met)

What is recorded:

- **v1** (`docs/mission-thread/PREREGISTRATION-C2.md`; `xval/mission-thread-c2/RESULTS.md`): **NOT MET** on W1, 17.3 km
  end position against 2 km and 0.0177 m/s against 0.01 m/s. W2 was not run: the published burn times leave 42.8 h,
  not 72 h.
- **v2** (`docs/mission-thread/PREREGISTRATION-C2-v2.md`; `xval/mission-thread-c2-v2/README.md`): **NOT RUN**. By its
  registered rule a fresh 72 h window after W1 needs 120 h between published burns; the longest gap in NASA's published
  Artemis I timeline after W1 is 105.9 h. No v2 code was written and no Horizons state of a v2 period was fetched.

Why it is closed rather than re-scoped:

1. **The reference cannot score an impulse model.** Four of the five steps in the JPL Horizons reconstruction of
   Artemis I (-1023) carry position jumps that no velocity step within one hour can produce (D1 results). The
   reconstruction is a set of arcs joined at the manoeuvres, so a propagator with impulses at the published burn times
   is scored partly against the joins. A pass or a miss would then say more about the reconstruction than about the
   engine.
2. **No public window is left.** The only scoring windows the rule allows are between published burns with 24 h clear on
   each side. W1 has been used, W2 is too short, and v2 showed no fresh 72 h window exists. Choosing a shorter window
   now, after the data has been seen, would loosen a bar after the fact, which the pre-registration rule forbids.
3. **The capability does not depend on it.** The impulse support in the cislunar coast stays as it is, checked on
   synthetic data only (`tests/mission_thread_c2_impulses.rs`), and it stays MODELLED in the verification matrix.

What would reopen it: a new pre-registration naming a public reference that is continuous across the burns (for
example an orbit-determination product published with its manoeuvre records), with bars fixed before any of it is
fetched. Until then the row is closed, and v1's NOT MET is its result.

## C3, the CAPSTONE NRHO: RE-SCOPED to what it showed; the A2 question is CLOSED (not met)

What is recorded (`docs/design/evidence/c3-capstone-nrho-force-model/RESULTS.md`):

- **v1**: C3-R **MET** on A2's own window W0 (21.66 km end position, 4.24 km periapsis radius, bars 25 km and 10 km).
  C3-H **NOT MET** on the three fresh windows E, H1 and H2 (37.25, 36.23 and 49.65 km end position). C3-S **NOT MET**
  (H2 57.13 km; H1 met at 12.92 km).
- **v2** (`PREREGISTRATION-v2.md`, a radiation-pressure coefficient estimated per window): C3-S v2 **MET** on all three
  windows of the fresh span G (0.21, 0.60 and 0.73 km). G is a span on which the model without that coefficient also
  meets both bars, so it is a less demanding test than span F; and H2 is still missed with its own coefficient
  (57.8 km).
- Row A2 (`xval/mission-thread-lunar/RESULTS.md`) is met on re-run only if C3-R and C3-H both hold. C3-H does not, so
  **A2 stays NOT MET**.

The re-scoped row says only this, and nothing wider:

- With DE440 Sun and Earth positions, the CAPSTONE propagation meets A2's bars on A2's own window (C3-R).
- With one cannonball radiation-pressure coefficient estimated from the first half of each window, it meets the C3-S
  bars on the three windows of span G (C3-S v2), a span where the simpler model also meets them.
- It does not meet A2's bars on fresh windows in general (C3-H), and the cause of the H2 miss is not identified.

Why the A2 question is closed rather than run again:

1. **What is left cannot be separated with public data.** The candidates for H2 are attitude, a manoeuvre below the
   100 m per hour detection test, and the reconstruction itself. Telling them apart needs the spacecraft's attitude
   and manoeuvre records, which are not public. Another force-model variant scored on Horizons alone could not say
   which one it fixed.
2. **The start-state sensitivity is of the same order as the misses.** A 10 m or 1 cm/s change in the start state moves
   the +156 h end position by 6.7 to 49.8 km on these windows (v2 sensitivity analysis). A bar of 25 km at +156 h on a
   start taken from the reconstruction is therefore close to what the input can support on some windows.
3. **Results stay MODELLED.** Nothing here identifies CAPSTONE's real area-to-mass ratio or says anything about orbit
   determination, and nothing in the open edition depends on A2 being met.

What would reopen it: a new pre-registration with public attitude or manoeuvre information for the H2 period, or a
reference that carries its own uncertainty, with bars fixed before any data is fetched.

## Where this is linked

- `docs/design/evidence/d1-artemis-capstone/RESULTS.md` points here.
- `ROADMAP.md` (0.42 section) names both outcomes and links here.
- The verification matrix rows for the impulse support and the CAPSTONE force model are unchanged (MODELLED).
